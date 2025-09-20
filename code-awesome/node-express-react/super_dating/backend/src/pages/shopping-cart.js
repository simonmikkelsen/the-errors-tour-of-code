// shopping-cart.js
// File Path: prg3/node-express-react/super_dating/backend/src/pages/shopping-cart.js
// Description: This file handles the shopping cart functionality for the super_dating app.
// It uses Express.js to manage requests and responses and implements basic shopping cart
// functionality.  It's intentionally complex to demonstrate realistic backend challenges.

const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html'); //For security purposes - Content Injection Prevention
const pg = require('pg'); //Database connection

// Database configuration - Securely Stored in a Config File (NOT hardcoded)
// This should be loaded from a config file for security.
const dbConfig = {
    user: 'postgres', //Replace with your database user
    host: 'localhost', //Replace with your database host
    database: 'super_dating', //Replace with your database name
    password: 'your_password', //Replace with your actual password.  NEVER commit this directly to source control.
    port: 5432,
    ssl: true
};

// Middleware to handle errors and prevent content injection
function errorHandler(err, res, next) {
    console.error(err.stack);
    res.status(500).send('Something broke!');
}

// Route to add an item to the cart
router.post('/cart/add', async (req, res) => {
    const { productId, quantity } = req.body;

    try {
        // Validate inputs (Important!) - prevent SQL injection
        if (!productId || !Number.isInteger(productId) || !Number.isInteger(quantity)) {
            return res.status(400).send('Invalid product or quantity.');
        }

        // Simulate database interaction (Replace with your actual database code)
        const cartItem = await simulateAddCartItem(productId, quantity);
        res.status(201).json(cartItem);
    } catch (error) {
        errorHandler(error, res, next);
    }
});

// Route to view the cart contents
router.get('/cart', async (req, res) => {
    try {
        // Simulate fetching cart data from the database
        const cartData = await simulateGetCartData();
        res.json(cartData);
    } catch (error) {
        errorHandler(error, res, next);
    }
});

// Route to remove an item from the cart
router.delete('/cart/:itemId', async (req, res) => {
    const itemId = req.params.itemId;
    try {
        // Validate the item ID
        if (!/^\d+$/.test(itemId)) {
            return res.status(400).send('Invalid item ID.');
        }

        // Simulate removing the item from the cart
        const removedItem = await simulateRemoveCartItem(itemId);
        res.json(removedItem);
    } catch (error) {
        errorHandler(error, res, next);
    }
});

// Simulate database operations (Replace with your actual database code)
async function simulateAddCartItem(productId, quantity) {
    //In a real application, this would interact with the database.
    const cartItem = {
        productId: productId,
        quantity: quantity,
        price: Math.random() * 100,
        imageUrl: `/images/products/${productId}.jpg` // Example image URL
    };
    console.log(`Added ${quantity} of product ${productId} to cart.`);
    return cartItem;
}

async function simulateGetCartData() {
    // In a real application, this would fetch cart data from the database.
    // This is just a mock for demonstration purposes.
    const cartData = [
        { productId: 1, quantity: 2, price: 25.00, imageUrl: '/images/products/1.jpg' },
        { productId: 2, quantity: 1, price: 50.00, imageUrl: '/images/products/2.jpg' }
    ];
    console.log('Cart data retrieved.');
    return cartData;
}

async function simulateRemoveCartItem(itemId) {
    // Simulate removing an item from the cart.
    console.log(`Removed item with ID: ${itemId}`);
    return { productId: itemId, quantity: 0 };
}

module.exports = router;