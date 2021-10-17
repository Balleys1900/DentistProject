const mongoose = require('mongoose');
const { Schema } = mongoose;
const BookingSchema = new Schema({
  userId: String,
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
    name: String,
    image: String,
    distance: Number,
    rating: Number,
    address: String,
  },
  dateRequest: String,
  dateAppointment: String,
  timeAppointment: String,
  status: Boolean,
  message: String,
});

const Booking = mongoose.model('Booking', BookingSchema);
module.exports = Booking;
