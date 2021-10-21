const Booking = require('../models/Booking');

exports.createNewBooking = async (req, res) => {
  const booking = req.body;
  const result = await Booking.findOne({
    timeAppointment: booking.timeAppointment,
    dateAppointment: booking.dateAppointment,
    status: true,
  }).exec();
  if (!result) {
    const reception = await Booking.create({
      ...booking,
    });
    return res.status(201).json({ status: 'success', data: reception });
  } else res.status(400).json({ status: 'failed', message: 'Time Invalid' });
};

exports.getHistoryBooking = async (req, res) => {
  const { username } = req.params;
  const result = await Booking.find({
    'user.username': username,
  });
  res.status(200).json({ status: 'success', data: result });
};

exports.getBookingByClinicID = async (req, res) => {
  const { id } = req.params;
  const result = await Booking.find({
    'clinic.id': id,
  });
  res.status(200).json({ status: 'success', data: result });
};

exports.getAllBooking = async (req, res) => {
  const result = await Booking.find();
  return res.status(201).json({ status: 'success', data: result });
};

exports.getTimeAvailable = async (req, res) => {
  const { date } = req.params;
  const result = await Booking.find({
    dateAppointment: date,
    status: true,
  });
  const dates = result.map(booking => booking.timeAppointment);

  if (result.length > 0) {
    return res.status(200).json({ status: 'success', data: dates });
  }
  res.status(400).json({ status: 'failed', message: 'Time Invalid' });
};

exports.updateStatusBookingByID = async (req, res) => {
  const booking = req.body;
  const result = await Booking.findByIdAndUpdate(booking.id, {
    $set: { status: false, message: booking.message },
  });

  return res.status(200).json({ status: 'success', data: result });
};
