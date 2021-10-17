const express = require('express');
const Booking = require('../controllers/bookingController');

const route = express.Router();

route.get('/time/:date', Booking.getTimeAvailable);
route.get(':username', Booking.getHistoryBooking);

route.post('/', Booking.createNewBooking);

module.exports = route;
