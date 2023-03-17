const mongoose = require("mongoose");
const { version } = require("os");

const FoodSchema = mongoose.Schema({
    title: String,
    description: String,
    image: String,
    price: String
}, {
    versionKey: false,
    collection: 'food'
});
module.exports = mongoose.model('Food', FoodSchema);