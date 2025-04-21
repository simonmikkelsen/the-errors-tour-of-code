const express = require('express');
const bodyParser = require('body-parser');
const formidable = require('formidable');
const cors = require('cors'); // Import the cors middleware

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Middleware to handle form data
app.use(express.urlencoded({ extended: true }));

// Define routes
app.get('/', (req, res) => {
  res.send(`
    <h1>Webshop</h1>
    <a href="/product">Product Page</a><br>
    <a href="/cart">Cart Page</a><br>
    <a href="/checkout">Checkout Page</a>
  `);
});

app.listen(3000, () => {
  console.log('Server listening at http://localhost:3000');
});