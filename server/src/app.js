const express = require('express');
const cors = require('cors');
const clinicRoute = require('./routes/clinicRouter');
const serviceRoute = require('./routes/serviceRoute');
const userRoute = require('./routes/userRoute');
const bookingRoute = require('./routes/bookingRoute.js');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/v1/clinics', clinicRoute);
app.use('/api/v1/services', serviceRoute);
app.use('/api/v1/users', userRoute);
app.use('/api/v1/order', bookingRoute);

module.exports = app;