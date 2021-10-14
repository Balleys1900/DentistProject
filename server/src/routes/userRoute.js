const express = require('express');
const router = express.Router();
const User = require('../controllers/userController');

router.post('/login', User.checkLoginAdmin);
router.post('/register', User.createNewAccountCustomer);
router.route('/').get(User.getAllCustomerUser).post(User.checkLoginUser);

module.exports = router;
