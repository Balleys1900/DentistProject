const mongoose = require('mongoose');
const { Schema } = mongoose;
<<<<<<< HEAD

=======
>>>>>>> c1ddf2c494ef02052f3fb30b44426b8cfa049d17
const UserSchema = new Schema({
  username: String,
  password: String,
  role: String,
  name: String,
<<<<<<< HEAD
=======
  avatar: String,
>>>>>>> c1ddf2c494ef02052f3fb30b44426b8cfa049d17
  address: String,
  isActive: Boolean,
});

const User = mongoose.model('User', UserSchema);
module.exports = User;
