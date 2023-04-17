const mongoose = require('mongoose');
const Schema = mongoose.Schema;

var storeSchema = new Schema({
    _id: { type: Number, require: false, },
    title: { type: String, require: true },
    imageName: { type: String, require: true }
});

module.exports = mongoose.model('Store', storeSchema, 'store');