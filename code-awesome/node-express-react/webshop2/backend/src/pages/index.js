const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());

// Dummy product data (replace with database query)
const products = [
  { id: 1, name: 'Cute Cat Toy', price: 10.99 },
  { id: 2, name: 'Fluffy Dog Bed', price: 25.50 },
  { id: 3, name: 'Squirrel Plush', price: 8.75 },
  { id: 4, name: 'Rabbit Stuffed Animal', price: 15.00 },
  { id: 5, name: 'Hamster Wheel', price: 7.20 },
  { id: 6, name: 'Parrot Figurine', price: 12.80 },
  { id: 7, name: 'Lion Plush', price: 18.99 },
  { id: 8, name: 'Elephant Figurine', price: 22.00 },
  { id: 9, name: 'Giraffe Stuffed Animal', price: 14.50 },
  { id: 10, name: 'Zebra Plush', price: 9.99 },
];

// Route for the main page
app.get('/', (req, res) => {
  const featuredProducts = products.slice(0, 10); // Show the first 10 products

  res.render('index', {
    title: 'Webshop - Cute Animals!',
    products: featuredProducts,
  });
});

// Simple error handling (OWASP Top 10 - XSS)
app.get('/error', (req, res) => {
  // Demonstrates a potential XSS vulnerability - WARNING: DO NOT DO THIS IN PRODUCTION
  const userInput = req.query.input;
  if (userInput) {
    res.status(400).send(`Error: You entered: ${userInput}`);
  } else {
    res.status(400).send('An error occurred.');
  }
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});