const mongoose = require('mongoose');
const { Schema } = mongoose;
const VoucherSchema = new Schema({
  code: String,
  description: String,
  expiredDay: String,
  expiredMonth: String,
  discount: Number,
  isActive: Boolean,
});

const Voucher = mongoose.model('Voucher', VoucherSchema);
module.exports = Voucher;
