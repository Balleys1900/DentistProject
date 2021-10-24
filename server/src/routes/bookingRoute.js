const express = require('express');
const Booking = require('../controllers/bookingController');

const route = express.Router();

route.post('/time', Booking.getTimeAvailable);
route.get('/:username', Booking.getHistoryBooking);
route.get('/clinic/:id', Booking.getBookingByClinicID);

route
  .route('/')
  .post(Booking.createNewBooking)
  .get(Booking.getAllBooking)
  .put(Booking.updateStatusBookingByID);

module.exports = route;
