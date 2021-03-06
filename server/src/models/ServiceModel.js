const mongoose = require('mongoose');
const { Schema } = mongoose;

const ServiceModel = new Schema({
  name: String,
  image: String,
  price: Number,
  steps: [String],
});

module.exports = ServiceModel;
