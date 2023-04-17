const express = require('express');
var app = express();

const user = require('./user');
const product = require('./product');
const store = require('./store');


app.use('/api/user', user);
app.use('/api/product', product);
app.use('/api/store', store);


module.exports = app;