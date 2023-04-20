const express = require('express');
var app = express();
const fs = require('fs');

const user = require('./user');
const product = require('./product');
const store = require('./store');
app.get('/api/image/:imageName', async (req, res) => {

    const filePath = 'C:/Users/ngocp/OneDrive/Desktop/Flutter Project/th_flutter/server/images/' + req.params.imageName;

    fs.access(filePath, fs.F_OK, (err) => {
        if (err) {
            res.send("File note found");
            return;
        }
        res.sendFile(filePath);
    });


})


app.use('/api/user', user);
app.use('/api/product', product);
app.use('/api/store', store);


module.exports = app;