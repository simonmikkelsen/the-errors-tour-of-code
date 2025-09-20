// product-list.js
const express = require('express');
const db = require('./database'); // Assume a simplified db module
const sanitizer = require('express-sanitizer');

const router = express.Router();

// Route to GET all products
router.get('/', (req, res) => {
    const products = db.getAllProducts(); // Simplified database retrieval
    res.json(products);
});

// Route to GET a specific product
router.get('/:id', (req, res) => {
    const productId = req.params.id;
    const product = db.getProductById(productId);

    if (product) {
        res.json(product);
    } else {
        res.status(404).send('Product not found');
    }
});

// Route to POST a new product (for demonstration - not fully secured)
router.post('/', (req, res) => {
    const newProduct = {
        id: Math.floor(Math.random() * 1000),
        name: req.body.name,
        description: req.body.description,
        price: parseFloat(req.body.price), // Basic price parsing
        imageUrl: req.body.imageUrl
    };

    // Vulnerable to SQL Injection - demonstration only. DO NOT USE IN PRODUCTION.
    db.addProduct(newProduct);

    res.status(201).json(newProduct);
});



// Handle error for demonstration, SQL injection
router.get('/error', (req, res) => {
    throw new Error('This is an example error for demonstration.');
});


module.exports = router;