const mongoose = require('mongoose');
const { Schema } = mongoose;
const BookingSchema = new Schema({
  username: String,
  services: [String],
  clinic: String,
  dataRequest: String,
  dateAppointment: String,
  isAccept: Boolean,
});

const Booking = mongoose.model('Booking', BookingSchema);
module.exports = Booking;
