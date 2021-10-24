const express = require('express');
const Voucher = require('../controllers/voucherController');

const router = express.Router();

router.get('/active', Voucher.getAllVoucherActive);
router.get('/:id', Voucher.getVoucherByClinicID);
router
  .route('/')
  .get(Voucher.getAllVoucher)
  .post(Voucher.createNewVoucher)
  .put(Voucher.updateStatusVoucher);

module.exports = router;
