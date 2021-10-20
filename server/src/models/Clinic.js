const mongoose = require('mongoose');
const ServiceModel = require('./ServiceModel');
const { Schema } = mongoose;

const clinicSchema = new Schema({
  username: String,
  name: String,
  image: String,
  timeOpen: String,
  timeClose: String,
  description: String,
  distance: Number,
  rating: Number,
  address: String,
  isActive: Boolean,
  status: String,
  services: [ServiceModel],
});

const Clinic = mongoose.model('Clinic', clinicSchema);
module.exports = Clinic;
