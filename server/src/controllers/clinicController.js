const Clinic = require('../models/Clinic');

exports.getAllClinic = async (req, res) => {
  try {
    const clinics = await Clinic.find({ status: 'approve' });
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
exports.getClinicByUsername = async (req, res) => {
  const { id } = req.params;
  const clinic = await Clinic.findOne({ username: id });

  if (clinic) {
    return res.status(200).json({ status: 'success', data: clinic });
  }
  res.status(200).json({ status: 'fail', data: {} });
};

// exports.addServiceIntoClinic = async (req, res) => {
//   const { idClinic, service } = req.body;

//   const result = await Clinic.findOneAndUpdate(
//     { _id: idClinic },
//     {
//       $push: { services: service },
//     }
//   );
//   if (result)
//     return res.status(200).json({
//       status: 'success',
//       data: result,
//     });

//   res.status(400).json({
//     status: 'failed',
//     message: 'Bad Request',
//   });
// };

// exports.updateServiceInClinic = async (req, res) => {
//   const { idClinic, service } = req.body;
//   const result = await Clinic.findOneAndUpdate(
//     { _id: idClinic, 'services._id': service._id },
//     {
//       $set: {
//         'services.$': service,
//       },
//     }
//   );
//   if (result) {
//     return res.status(200).json({
//       status: 'success',
//       data: result,
//     });
//   }
//   res.status(400).json({
//     status: 'failed',
//     message: 'Update Failed',
//   });
// };
// exports.deleteServiceInClinic = async (req, res) => {
//   const { idClinic, idService } = req.body;
//   const result = await Clinic.findOneAndUpdate(
//     { _id: idClinic },
//     {
//       $pull: {
//         services: { _id: idService },
//       },
//     }
//   );
//   if (result) {
//     return res.status(204).json({
//       status: 'success',
//     });
//   }
//   res.status(400).json({
//     status: 'failed',
//     message: 'Delete Failed',
//   });
// };
