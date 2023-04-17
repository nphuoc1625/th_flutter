const express = require('express');
const mongoose = require('mongoose');


//Middleware
const bodyParser = require('body-parser');
const app = express();


app.use(bodyParser.json());
app.use(bodyParser.raw());
app.use(bodyParser.text());
app.use(bodyParser.urlencoded({ extended: false }));


mongoose.connect('mongodb://127.0.0.1:27017/th_flutter').then(() => {
    console.log("Mongodb Connected");
});

app.listen(3000, function () {
    console.log(`Server listening on port 3000`);
});

app.use(require('./route/addroute'));
