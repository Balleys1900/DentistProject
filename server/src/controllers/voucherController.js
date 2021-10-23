const Voucher = require('../models/Voucher');

exports.getAllVoucher = async (req, res) => {
  try {
    const vouchers = await Voucher.find();
    res.status(200).json({ status: 'success', data: vouchers });
  } catch (error) {
    res.status(404).json({ status: 'fail', message: 'Not Found' });
  }
};
exports.getVoucherByClinicID = async (req, res) => {
  try {
    const { id } = req.params;
    const vouchers = await Voucher.find({ clinic: id });
    res.status(200).json({ status: 'success', data: vouchers });
  } catch (error) {
    res.status(404).json({ status: 'fail', message: 'Not Found' });
  }
};
exports.getAllVoucherActive = async (req, res) => {
  try {
    const data = await Voucher.find({ isActive: true });
    const vouchers = data.filter(voucher => {
      const expiredParse = voucher.expirationDate.split('-');
      const startParse = voucher.startDate.split('-');
      const expiredDate = new Date(+expiredParse[2], expiredParse[1] - 1, expiredParse[0]);
      const startDate = new Date(+startParse[2], startParse[1] - 1, startParse[0]);
      const today = new Date();
      return expiredDate.getTime() >= today.getTime() && startDate.getTime() <= today.getTime();
    });
    res.status(200).json({ status: 'success', data: vouchers });
  } catch (error) {
    res.status(404).json({ status: 'fail', message: 'Not Found' });
  }
};

exports.createNewVoucher = async (req, res) => {
  try {
    const voucher = req.body;
    const result = await Voucher.create(voucher);
    res.status(201).json({ status: 'success', data: result });
  } catch (error) {
    res.status(401).json({ status: 'fail', message: error });
  }
};

// exports.updateStatusVoucher = async (req, res) => {
//   try {
//     const { voucherID, isActive } = req.body;
//     const result = await Voucher.create(voucher);
//     res.status(201).json({ status: 'success', data: result });
//   } catch (error) {
//     res.status(401).json({ status: 'fail', message: error });
//   }
// };
