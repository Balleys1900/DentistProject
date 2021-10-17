const Booking = require('../models/Booking');

exports.createNewBooking = async (req, res) => {
  const booking = req.body;
  console.log(booking);
  const result = await Booking.findOne({
    timeAppointment: booking.timeAppointment,
    dateAppointment: booking.dateAppointment,
  }).exec();
  console.log(result);
  if (!result) {
    const reception = await Booking.create({
      ...booking,
    });
    console.log(reception);
    return res.status(201).json({ status: 'success', data: reception });
  } else res.status(400).json({ status: 'failed', message: 'Time Invalid' });
};

exports.getHistoryBooking = async (req, res) => {
  const { userId } = req.params;
  console.log(userId);
  const result = await Booking.find({
    userId: userId,
  });
  console.log(result);
  if (!result) {
    return res.status(201).json({ status: 'success', data: result });
  } else res.status(400).json({ status: 'failed', message: 'Time Invalid' });
};

exports.getTimeAvailable = async (req, res) => {
  const { date } = req.params;
  const result = await Booking.find({
    dateAppointment: date,
  });
  const dates = result.map(booking => booking.timeAppointment);

  if (result.length > 0) {
    return res.status(200).json({ status: 'success', data: dates });
  }
  res.status(400).json({ status: 'failed', message: 'Time Invalid' });
};
