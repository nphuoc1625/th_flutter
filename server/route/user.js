const express = require('express');
var router = express.Router();

const MongoClient = require('mongodb').MongoClient;
const uri = 'mongodb://127.0.0.1:27017';
const client = new MongoClient(uri, { useNewUrlParser: true });



const User = require('../model/user');
const { ObjectId } = require('mongodb');

router.get('/', (req, res) => {
    res.send("no Such Request");
});


router.post('/signup', async (req, res) => {
    var body = req.body;
    var doc = await User.find({ email: body.email });

    if (doc.length > 0)
        res.send("email already existed");
    else {
        const user = new User({
            email: body.email,
            password: body.password,
        });
        user.save()
            .then(data => {
                res.send(data);
            })
            .catch(err => {
                res.status(500).send({
                    message: err.message
                });
            });
    }
});

router.post('/signin', async (req, res) => {
    var body = req.body;

    var doc = await User.find({ email: body.email, password: body.password });
    if (doc.length > 0)
        res.status(200).json(doc[0]);
    else {
        res.status(500).send({ message: "Email or password invalid" });
    }
});

//add product to favorite
router.post('/favorite/add', (req, res) => {
    var body = req.body;
    var id = Number.parseInt(body['id']);
    var userId = body['userId'];
    console.log(userId + "  " + id);

    client.connect().then(() => {
        client.db('th_flutter').collection('user').updateOne({
            _id: { $eq: new ObjectId(userId) }
        },
            { $addToSet: { favorite: id } }, {})
            .then(
                (result) => {
                    res.status(200).send(result);
                },
                (reason) => {
                    res.status(500).send("add to db error:" + reason);
                }
            );
    }, (err) => {
        res.status(500).send("db connect error:" + err);
    });
});

//remove product from favorite
router.post('/favorite/remove', (req, res) => {
    var body = req.body;
    var id = Number.parseInt(body['id']);
    var userId = body['userId'];

    console.log(userId + "  " + id);
    client.connect().then(() => {
        const collection = client.db('th_flutter').collection('user');

        collection.updateOne({
            _id: { $eq: new ObjectId(userId) }
        },
            { $unset: { favorite: id } }, {})
            .then(
                (result) => {
                    res.status(200).send(result);
                },
                (reason) => {
                    res.status(500).send("add to db error:" + reason);
                }
            );
    }, (err) => {
        res.status(500).send("db connect error:" + err);
    });
});


//check if add favorite
router.get('/favorite/:userId/:id', async (req, res) => {
    var id = Number.parseInt(req.params.id);
    var userId = req.params.userId;

    client.connect().then(() => {
        client.db('th_flutter').collection('user').find(
            {
                _id: { $eq: new ObjectId(userId) },
                favorite: { $in: [id] }
            }).toArray()
            .then(
                (val) => {
                    if (val.length > 0) {
                        res.status(200).send('found');
                        client.close();
                    }
                }
            );
    }, (err) => {
        console.log(err);
        res.status(500).send(err);
    });
});



module.exports = router;
