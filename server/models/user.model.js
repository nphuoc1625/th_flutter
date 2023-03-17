const mongoose = require("mongoose");

const UserSchema = mongoose.Schema({
    email: String,
    password: String,
}, {
    versionKey: false,
    collection: 'user'
});
module.exports = mongoose.model('User', UserSchema);