const express = require('express');
const Clinic = require('../controllers/clinicController');
const router = express.Router();

router.get('/service/:name', Clinic.getClinicByService);
// router
//   .route('/services')
//   .post(Clinic.addServiceIntoClinic)
//   .put(Clinic.updateServiceInClinic)
//   .delete(Clinic.deleteServiceInClinic);

// router.post('/service', Clinic.getServiceByNameAndClinicID);

router.get('/request', Clinic.updateStatus);
router.put('/status', Clinic.updateStatus);
router.get('/active', Clinic.getAllClinicActive);

router.get('/username/:id', Clinic.getClinicByUsername);
router.get('/:id', Clinic.getClinicByID);

router
  .route('/')
  .get(Clinic.getAllClinic)
  .post(Clinic.createNewClinic)
  .delete(Clinic.deleteClinic)
  .put(Clinic.updateClinic);

module.exports = router;
