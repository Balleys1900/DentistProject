const express = require('express');
const router = express.Router();
const User = require('../controllers/userController');

router.post('/login', User.checkLoginAdmin);
router.post('/loginClinic', User.checkLoginClinic);
router.post('/register', User.createNewAccount);

router.route('/').get(User.getAllCustomerUser).post(User.checkLoginUser);

module.exports = router;
