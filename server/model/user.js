const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    id: { type: Number, required: true, default: 0 },
    name: { type: String, required: false, default: "" },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
}, { collection: 'user' });


module.exports = mongoose.model('User', userSchema);
