const express = require('express');
const Clinic = require('../controllers/clinicController');
const router = express.Router();

router.get('/service/:name', Clinic.getClinicByService);

// router.post('/service', Clinic.getServiceByNameAndClinicID);
router.get('/active', Clinic.getAllClinicActive);

router.get('/:id', Clinic.getClinicByID);

router
  .route('/')
  .get(Clinic.getAllClinic)
  .post(Clinic.createNewClinic)
  .delete(Clinic.deleteClinic)
  .put(Clinic.updateClinic);

module.exports = router;
