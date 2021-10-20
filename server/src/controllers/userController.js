const User = require('../models/User');

exports.checkLoginAdmin = async (req, res) => {
  const { user } = req.body;
  const result = await User.findOne({
    username: user.name,
    role: 'admin',
    password: user.password,
  }).exec();
  if (result) return res.status(200).json({ status: 'success', data: result });
  else res.status(403).json({ status: 'failed', message: 'unauthenticated' });
};
exports.checkLoginClinic = async (req, res) => {
  const user = req.body;
  const result = await User.findOne({
    username: user.username,
    role: 'clinic',
    password: user.password,
  }).exec();
  if (result) return res.status(200).json({ status: 'success', data: result });
  else res.status(403).json({ status: 'failed', message: 'unauthenticated' });
};
exports.checkLoginUser = async (req, res) => {
  const user = req.body;
  const result = await User.findOne({
    username: user.name,
    role: 'customer',
    password: user.password,
  }).exec();
  if (result) return res.status(200).json({ status: 'success', data: result });
  else res.status(403).json({ status: 'failed', message: 'unauthenticated' });
};

exports.createNewAccount = async (req, res) => {
  const userCreate = req.body;
  const result = await User.findOne({
    username: userCreate.username,
  }).exec();
  if (!result) {
    const newUser = await User.create({
      ...userCreate,
    });
    return res.status(201).json({ status: 'success', data: newUser });
  } else res.status(403).json({ status: 'failed', message: 'Already Exists' });
};

exports.getAllCustomerUser = async (req, res) => {
  const result = await User.find({ role: 'customer' }).exec();
  if (result.length > 0) return res.status(200).json({ status: 'success', data: result });
  else res.status(404).json({ status: 'failed', message: 'Not found' });
};
