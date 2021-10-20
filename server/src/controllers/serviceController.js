const Service = require('../models/Service');

exports.getAllService = async (req, res) => {
  try {
    const services = await Service.find();
    res.status(200).json({ status: 'success', data: services });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};
