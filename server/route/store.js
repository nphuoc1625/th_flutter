var router = require('express').Router();


const Store = require('../model/store');

router.get('/', (req, res) => {
    Store.find().then(
        (result) => {
            res.status(200).json(result);
        }, () => {
            res.status(500);
        }
    )
});


module.exports = router;