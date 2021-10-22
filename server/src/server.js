const mongoose = require('mongoose');
const app = require('./app');
const PORT = 3000;
const password = 'bNuK37SbjxMSXLJD';

(async () => {
  await mongoose.connect(
    `mongodb+srv://sa:${password}@cluster0.5wbds.mongodb.net/dentist?retryWrites=true&w=majority`
  );

  console.log('connect successfully');
  app.listen(PORT, () => {
    console.log(`App start at http://localhost:${PORT}`);
  });
})().catch(err => console.log(err));
