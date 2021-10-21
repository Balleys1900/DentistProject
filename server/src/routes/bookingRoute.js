const express = require('express');
const Booking = require('../controllers/bookingController');

const route = express.Router();

route.get('/time/:date', Booking.getTimeAvailable);
route.get('/:username', Booking.getHistoryBooking);
route.get('/clinic/:id', Booking.getBookingByClinicID);

route
  .route('/')
  .post(Booking.createNewBooking)
  .get(Booking.getAllBooking)
  .put(Booking.updateStatusBookingByID);

module.exports = route;
