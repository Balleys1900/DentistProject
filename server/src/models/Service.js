const mongoose = require('mongoose');
const { Schema } = mongoose;

const serviceSchema = new Schema({
  name: String,
  image: String,
});
const Service = mongoose.model('Service', serviceSchema);
module.exports = Service;
