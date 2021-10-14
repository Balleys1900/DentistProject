const Clinic = require('../models/Clinic');

exports.getAllClinic = async (req, res) => {
  try {
    const clinics = await Clinic.find();
    res.status(200).json({ status: 'success', data: clinics });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};
exports.getAllClinicActive = async (req, res) => {
  try {
    const clinics = await Clinic.find({ isActive: true });
    res.status(200).json({ status: 'success', data: clinics });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};

exports.createNewClinic = async (req, res) => {
  const { clinic } = req.body;
  const result = await Clinic.create(clinic);
  res.status(201).json({
    status: 'success',
    data: result,
  });
};

exports.deleteClinic = async (req, res) => {
  const { id } = req.body;

  await Clinic.deleteOne({ _id: id });
  res.status(204).json({
    status: 'success',
    message: 'Delete Successful',
  });
};

exports.updateClinic = async (req, res) => {
  const { clinic } = req.body;
  const result = await Clinic.findOneAndUpdate({ _id: clinic._id }, clinic);
  res.status(200).json({
    status: 'success',
    data: result,
  });
};

exports.getRecentClinic = async (req, res) => {
  try {
    const numberOfDocument = +req.query.limit || 2;
    const clinics = await Clinic.find().sort('distance').limit(numberOfDocument);
    res.status(200).json({ status: 'success', data: clinics });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};

exports.getClinicByService = async (req, res) => {
  try {
    const { name } = req.params;
    const clinics = await Clinic.find({
      'services.name': name,
    }).sort('distance');
    res.status(200).json({ status: 'success', data: clinics });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};

exports.getClinicByID = async (req, res) => {
  try {
    const { id } = req.params;
    const clinic = await Clinic.findById(id);
    res.status(200).json({ status: 'success', data: clinic });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};
