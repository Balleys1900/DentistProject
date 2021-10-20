const mongoose = require('mongoose');
const { Schema } = mongoose;
const BookingSchema = new Schema({
  user: {
    username: String,
    name: String,
    address: String,
    avatar: String,
  },
  services: [
    {
      name: String,
      image: String,
      price: Number,
      discount: Number,
      steps: [Array],
    },
  ],
  clinic: {
    id: String,
    name: String,
    image: String,
    distance: Number,
    rating: Number,
    address: String,
  },
  dateRequest: String,
  dateAppointment: String,
  timeAppointment: String,
  hour: Number,
  status: Boolean,
  message: String,
});

const Booking = mongoose.model('Booking', BookingSchema);
module.exports = Booking;
