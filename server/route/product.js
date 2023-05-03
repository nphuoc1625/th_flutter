var route = require('express').Router();
const Product = require('../model/product');
const Store = require('../model/store')
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

route.get('/find/:q', async (req, res) => {
    var result = {};
    await Product.find(
        {
            $text: {
                $search: req.params.q,
                $caseSensitive: false,
            }
        }
    ).then((doc) => {
        result['products'] = doc;
    });
    await Store.find(
        {
            $text: {
                $search: req.params.q,
                $caseSensitive: false,
            }
        }
    ).then((doc) => {
        result['stores'] = doc;
    });
    res.json(result);
})


module.exports = route;