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
      quantity: Number,
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
  vouchers: [
    {
      id: String,
      name: String,
      discount: Number,
      time: [Array],
      description: String,
      startDate: String,
      expirationDate: String,
    },
  ],
  status: Boolean,
  message: String,
});

const Booking = mongoose.model('Booking', BookingSchema);
module.exports = Booking;
