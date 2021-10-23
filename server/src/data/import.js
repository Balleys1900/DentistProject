const mongoose = require('mongoose');
const Clinic = require('../models/Clinic');
const Service = require('../models/Service');
const User = require('../models/User');
const Voucher = require('../models/Voucher');
const Booking = require('../models/Booking');
const fs = require('fs');

const password = 'bNuK37SbjxMSXLJD';

(async () => {
  await mongoose.connect(
    `mongodb+srv://sa:${password}@cluster0.5wbds.mongodb.net/dentist?retryWrites=true&w=majority`
  );
  console.log('connect successfully');
})().catch(err => console.log(err));

const importDataClinic = async () => {
  const clinics = JSON.parse(fs.readFileSync(`${__dirname}/clinics.json`, 'utf-8'));
  try {
    await Clinic.insertMany(clinics);
    console.log('Import Data Success');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};
const importDataVoucher = async () => {
  const vouchers = JSON.parse(fs.readFileSync(`${__dirname}/voucher.json`, 'utf-8'));
  try {
    await Voucher.insertMany(vouchers);
    console.log('Import Data Voucher Success');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};

const importDataService = async () => {
  const services = JSON.parse(fs.readFileSync(`${__dirname}/service.json`, 'utf-8'));
  try {
    await Service.insertMany(services);
    console.log('Import Data Service Success');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};
const importDataUser = async () => {
  const services = JSON.parse(fs.readFileSync(`${__dirname}/user.json`, 'utf-8'));
  try {
    await User.insertMany(services);
    console.log('Import Data User Success');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};

const deleteDataClinic = async () => {
  try {
    await Clinic.deleteMany();
    console.log('Delete Data successful');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};

const deleteDataUser = async () => {
  try {
    await User.deleteMany();
    console.log('Delete Data successful');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};
const deleteDataService = async () => {
  try {
    await Service.deleteMany();
    console.log('Delete Data successful');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};
const deleteDataBooking = async () => {
  try {
    await Booking.deleteMany();
    console.log('Delete Data Booking successful');
  } catch (error) {
    console.log(error);
  }
  process.exit();
};
// importDataUser();
importDataClinic();
// importDataService();
// importDataVoucher();
// importDataService();
// importDataPeople();
// deleteDataClinic();
// deleteDataUser();
// deleteDataBooking();
