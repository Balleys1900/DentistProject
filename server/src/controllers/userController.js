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
<<<<<<< HEAD
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
=======
>>>>>>> c1ddf2c494ef02052f3fb30b44426b8cfa049d17
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

<<<<<<< HEAD
exports.createNewAccount = async (req, res) => {
=======
exports.createNewAccountCustomer = async (req, res) => {
>>>>>>> c1ddf2c494ef02052f3fb30b44426b8cfa049d17
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
