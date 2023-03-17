const express = require("express");
const mongoose = require("mongoose");
var bodyParser = require('body-parser');

const food = require('./models/food.model');
const user = require('./models/user.model');

const app = express();

app.use(bodyParser.json);
app.use(express.application)
mongoose.connect()

module.exports = app;