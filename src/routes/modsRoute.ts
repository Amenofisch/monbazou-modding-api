import { Request, Response } from "express";
import ModFromNexusType from "../types/ModFromNexusType";
import ModType from "../types/ModType";
import TagType from "../types/TagType";
import NexusModsUser from "../types/NexusModsUser";

const express = require('express');
const router = express.Router();
const slowDown = require("express-slow-down");
const db = require('../config/db');
const nexusmods = require('../controllers/nexusmods');

var modsFromDb : ModType[] = [];
var trendingModsFromNexus : ModFromNexusType[] = [];
var tagsFromDb : TagType[] = [];
var validatedUser : NexusModsUser;

(async function () {
    try {
        validatedUser = await nexusmods.validateApiKey();
        if(!validatedUser.name && !validatedUser.user_id) {
            throw new Error('Invalid API key. Please check your .env file. (NEXUSMODS_API_KEY)');
        } else {
            console.log('NexusMods API key validated.');
        }

        modsFromDb = await db.execQuery('SELECT * FROM mods');
        trendingModsFromNexus = await nexusmods.getTrending();
        tagsFromDb = await db.execQuery('SELECT * from tags');
        console.log('Mods loaded. (' + modsFromDb.length + ' mods)');
        console.log('Trending loaded. (' + trendingModsFromNexus.length + ' trends)');
        console.log('Tags loaded. (' + tagsFromDb.length + ' tags)');

        // merge tags from db into mods
        modsFromDb.forEach(mod => {
            if(!mod.tags) return;
            var dbtags : TagType[] = [];

            mod.tags.forEach(tag => {
                var dbtag = tagsFromDb.find(dbtag => dbtag.id == tag);
                if (dbtag) {
                    dbtags.push(dbtag);
                }
            });

            mod.tags = dbtags;
        });
    
        // merge trending from nexus into mods
        modsFromDb.forEach(mod => {
            trendingModsFromNexus.forEach(trend => {
                if (mod.nexusmods_id == trend.mod_id) {
                    mod.trending = true;
                    return;
                } else {
                    mod.trending = false;
                    return;
                }
            });
        });

        // merge dependencies from db into mods
        modsFromDb.forEach(mod => {
            if(!mod.depends_on) return;

            var dependencies : ModType[] = [];
            mod.depends_on.forEach(dependencyId => {
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

// Rate limits
const modsDbRateLimit = slowDown({
    windowMs: 60 * 1000,
    delayAfter: 30,
    delayMs: 250,
    maxDelayMs: 5 * 1000
});

const modsDbSpecificRateLimit = slowDown({
    windowMs: 60 * 1000,
    delayAfter: 30,
    delayMs: 500,
    maxDelayMs: 5 * 1000
});

// Routes
router.get('/', modsDbRateLimit, async (req : Request, res : Response) => {
    // Enforce cache control for production
    if (process.env.NODE_ENV == 'production') res.setHeader('Cache-Control', 'max-age=900, must-revalidate');

    if (!modsFromDb) return res.status(500).send({
        'status': 500,
        'message': 'No mods found/loaded.'
    });

    res.send(modsFromDb);
});

router.get('/:id', modsDbSpecificRateLimit, async (req : Request, res : Response) => {
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

    let mod = modsFromDb.find(mod => mod.nexusmods_id.toString() == id);
    if(!mod) return res.status(404).send({
        'status': 404,
        'message': 'Mod not found.'
    });
    res.send(mod);
});

module.exports = router;