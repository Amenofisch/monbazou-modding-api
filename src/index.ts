import { Request, Response } from "express";

const express = require('express');
const app = express();
const cors = require('cors');
require('dotenv').config()

app.use(cors());
app.enable('trust proxy');
app.use(express.urlencoded({ extended: true }));

const port = process.env.PORT || 3000;

app.get('/', (req : Request, res : Response) => {
    res.send('This is the root of the API for the modding website. DM me on discord if you have any questions. - Amenofisch#5368');
});

app.use('/api/mods', require('./routes/modsRoute'));

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
