const express = require('express');
const Service = require('../controllers/serviceController');

const route = express.Router();

route.get('/', Service.getAllService);

module.exports = route;
