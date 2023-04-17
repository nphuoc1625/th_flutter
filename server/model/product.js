const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const productSchema = new Schema({
    _id: { type: Number, required: true },
    title: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    storeId: { type: Number, required: true },
    imageName: { type: String, required: true },
}, { collection: 'product' });

module.exports = mongoose.model('Product', productSchema);
