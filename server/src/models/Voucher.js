const mongoose = require('mongoose');
const { Schema } = mongoose;
const VoucherSchema = new Schema({
  name: String,
  clinic: String,
  discount: Number,
  time: [String],
  description: String,
  startDate: String,
  expirationDate: String,
  isActive: Boolean,
});

const Voucher = mongoose.model('Voucher', VoucherSchema);
module.exports = Voucher;
