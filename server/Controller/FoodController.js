const Food = require("../models/food.model");
const express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    Food.find()
        .then(data => {
            res.send({ 'food': data });
        }).catch(r => {
            res.status(500).send({
                message: r.message
            });
        });
});