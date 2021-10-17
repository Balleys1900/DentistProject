const express = require('express');
const Booking = require('../controllers/bookingController');

const route = express.Router();

route.get('/time/:date', Booking.getTimeAvailable);
route.get('/:username', Booking.getHistoryBooking);

route.route('/').post(Booking.createNewBooking).get(Booking.getAllBooking);

module.exports = route;
