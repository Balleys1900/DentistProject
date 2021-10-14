const mongoose = require('mongoose');
const ServiceModel = require('./ServiceModel');
const { Schema } = mongoose;

const clinicSchema = new Schema({
  name: String,
  image: String,
  timeOpen: String,
  timeClose: String,
  description: String,
  distance: Number,
  rating: Number,
  address: String,
  isActive: Boolean,
  services: [ServiceModel],
});

const Clinic = mongoose.model('Clinic', clinicSchema);
module.exports = Clinic;
