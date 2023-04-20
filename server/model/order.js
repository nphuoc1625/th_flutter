const { ObjectId } = require('mongodb');
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

var orderSchema = new Schema({
    total_price: { type: Number, required: true },
    date_created: { type: String, required: true },
    items: { type: [], required: true },
});

module.exports = mongoose.model('Order', orderSchema);