const express = require('express');
const app = express();
const port = 3000;
const cors = require('cors');
app.use(cors());

// Dummy product data (replace with database interaction)
const products = [
  { id: 1, name: 'Cute Puppy Toy', price: 19.99 },
  { id: 2, name: 'Fluffy Kitten Plush', price: 24.99 },
  { id: 3, name: 'Sleepy Bear Stuffed Animal', price: 14.99 },
  { id: 4, name: 'Happy Dog Bed', price: 39.99 },
  { id: 5, name: 'Cozy Kitten Bed', price: 29.99 },
  { id: 6, name: 'Sleepy Bear Blanket', price: 19.99 },
  { id: 7, name: 'Cute Puppy Bowl', price: 12.99 },
  { id: 8, name: 'Fluffy Kitten Carrier', price: 34.99 },
  { id: 9, name: 'Sleepy Bear Harness', price: 21.99 },
  { id: 10, name: 'Cute Puppy Collar', price: 9.99 }
];

app.get('/', (req, res) => {
  const firstTenProducts = products.slice(0, 10);
  res.render('index', { products: firstTenProducts });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});