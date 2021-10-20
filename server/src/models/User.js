const mongoose = require('mongoose');
const { Schema } = mongoose;

const UserSchema = new Schema({
  username: String,
  password: String,
  role: String,
  name: String,
  address: String,
  isActive: Boolean,
});

const User = mongoose.model('User', UserSchema);
module.exports = User;
