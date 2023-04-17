var route = require('express').Router();
const Product = require('../model/product');
const fs = require('fs');

route.get('/', async (req, res) => {
    var doc = await Product.find();
    if (doc.length > 0) {
        res.status(200).json(doc);
    } else {
        res.status(500).send('error');
    }
});

route.get('/:id', async (req, res) => {

    var id = Number.parseInt(req.params.id);

    Product.find({ _id: id }).then(
        (doc) => {
            res.status(200).json(doc.at(0));
        },
        (err) => {
            res.status(500).send('error:' + err);
        }
    )

});



module.exports = route;