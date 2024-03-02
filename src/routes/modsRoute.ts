const ModType = require('../types/ModType');
const TagType = require('../types/TagType');
const { defaultRateLimit } = require('../config/ratelimits').default;
import prisma from '../config/db';

import { Request, Response } from "express";
const express = require('express');
const router = express.Router();

var modsFromDb : typeof ModType[] = [];
var tagsFromDb : typeof TagType[] = [];

(async function () {
    try {

        modsFromDb = await prisma.mods.findMany();
        tagsFromDb = await prisma.tags.findMany();

        console.log('Mods loaded. (' + modsFromDb.length + ' mods)');
        console.log('Tags loaded. (' + tagsFromDb.length + ' tags)');

        // merge tags from db into mods
        modsFromDb.forEach(mod => {
            if(!mod.tags) return;
            var dbtags : typeof TagType[] = [];

            mod.tags = JSON.parse(mod.tags);

            mod.tags.forEach((tag : typeof TagType) => {
                var dbtag = tagsFromDb.find(dbtag => dbtag.id == tag);
                if (dbtag) {
                    dbtags.push(dbtag);
                }
            });

            mod.tags = dbtags;
        });

        // merge dependencies from db into mods
        modsFromDb.forEach((mod : typeof ModType) => {
            if(!mod.depends_on) return;

            mod.depends_on = JSON.parse(mod.depends_on);

            var dependencies : typeof ModType[] = [];
            mod.depends_on.forEach((dependencyId : number) => {
                var modDependency = modsFromDb.find(modDependency => modDependency.nexusmods_id == dependencyId);
                if (modDependency) {
                    dependencies.push(modDependency);
                }
            });

            mod.depends_on = dependencies;
        });

    } catch (error) {
        console.log(error);
    }
})();


// Routes
router.get('/', defaultRateLimit, async (req : Request, res : Response) => {
    // Enforce cache control for production
    if (process.env.NODE_ENV == 'production') res.setHeader('Cache-Control', 'max-age=900, must-revalidate');

    if (!modsFromDb) return res.status(500).send({
        'status': 500,
        'message': 'No mods found/loaded.'
    });

    res.send(modsFromDb);
});

router.get('/:id', defaultRateLimit, async (req : Request, res : Response) => {
    let id = req.params.id;
    if (!id) return res.status(400).send({
        'status': 400,
        'message': 'No mod ID provided.'
    });
    if (!modsFromDb) return res.status(500).send({
        'status': 500,
        'message': 'No mods found/loaded.'
    });

    // Enforce cache control for production
    if (process.env.NODE_ENV == 'production') res.setHeader('Cache-Control', 'max-age=900, must-revalidate');

    let mod = modsFromDb.find((mod : typeof ModType) => mod.nexusmods_id.toString() == id);
    if(!mod) return res.status(404).send({
        'status': 404,
        'message': 'Mod not found.'
    });
    res.send(mod);
});

module.exports = router;
