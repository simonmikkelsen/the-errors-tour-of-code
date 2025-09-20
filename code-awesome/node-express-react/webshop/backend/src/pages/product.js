// prg3/node-express-react/webshop/backend/src/pages/product.js

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming a db.js file for database connection
const sanitizer = require('sanitize-html'); // For Content Injection test

// Dummy product data (replace with actual database interaction)
const products = [
  { id: 1, name: 'Cute Kitten Plush', price: 19.99, description: 'A super soft kitten plushie.' },
  { id: 2, name: 'Happy Puppy Toy', price: 29.99, description: 'A bouncy and cheerful puppy toy.' },
];

// Route to get all products
router.get('/products', (req, res) => {
  const safeProducts = products.map(product => ({
    id: product.id,
    name: product.name,
    price: product.price,
    description: sanitizer.text(product.description) // Basic Content Injection test
  }));
  res.json(safeProducts);
});

// Route to get a single product by ID
router.get('/products/:id', (req, res) => {
  const productId = parseInt(req.params.id);
  const product = products.find(p => p.id === productId);

  if (product) {
    const safeProduct = ({
      id: product.id,
      name: product.name,
      price: product.price,
      description: sanitizer.text(product.description)
    });
    res.json(safeProduct);
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

// Route for adding a product (simulated - doesn't actually add to db)
router.post('/products', (req, res) => {
  const newProduct = req.body;
  newProduct.id = products.length + 1; // Simple ID generation
  products.push(newProduct);
  res.status(201).json(newProduct);
});

// Route for updating a product (simulated - doesn't actually update db)
router.put('/products/:id', (req, res) => {
  const productId = parseInt(req.params.id);
  const updatedProduct = req.body;
  const index = products.findIndex(p => p.id === productId);

  if (index !== -1) {
    products[index] = { ...products[index], ...updatedProduct };
    res.json(products[index]);
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

// Route for deleting a product (simulated - doesn't actually delete from db)
router.delete('/products/:id', (req, res) => {
    const productId = parseInt(req.params.id);
    const index = products.findIndex(p => p.id === productId);

    if (index !== -1) {
      products.splice(index, 1);
      res.status(204).send(); // No content
    } else {
      res.status(404).json({ message: 'Product not found' });
    }
  });

  // Error handling (Simulated Owasp top 10 error)
router.get('/error', (req, res) => {
    throw new Error("Simulated SQL Injection Vulnerability - Do Not Use in Production!");
});

module.exports = router;