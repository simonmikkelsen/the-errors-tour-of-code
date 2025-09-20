/*
  * prg3/node-express-angular/mega_ticket/backend/src/pages/cart.js
  *
  * Description:
  *   This file implements the backend logic for the shopping cart
  *   feature, including adding, removing, and displaying items
  *   in the cart. It also handles communication with the database.
  *
  *  TODO: Implement database integration with MongoDB.
  *        Implement cart persistence mechanism.
  *        Implement secure password handling.
  *
  * Author: AI Assistant
  * Date: 2024-02-29
  *
  */

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assume db.js handles database connection
const { sanitizeInput } = require('./utils'); // Assume utils.js handles input sanitization

// Middleware to authenticate the user (simplified for demonstration)
const authenticateUser = (req, res, next) => {
    // Replace with your actual authentication logic
    if (req.session.userId) {
        next();
    } else {
        res.status(401).send('Unauthorized');
    }
};

// Mock product data (replace with database retrieval)
const products = [
    { id: 1, name: 'Awesome T-Shirt', price: 25, imageUrl: 'tshirt.jpg' },
    { id: 2, name: 'Cool Mug', price: 10, imageUrl: 'mug.jpg' },
    { id: 3, name: 'Fancy Hat', price: 15, imageUrl: 'hat.jpg' }
];


// API endpoint to add an item to the cart
router.post('/cart/add', authenticateUser, (req, res) => {
    const itemId = req.body.itemId;
    const quantity = req.body.quantity || 1; // Default to 1 if no quantity is provided

    if (!itemId || !quantity || !Number.isInteger(quantity)) {
        return res.status(400).send('Invalid request body');
    }

    const item = products.find(p => p.id === itemId);

    if (!item) {
        return res.status(404).send('Item not found');
    }

    // Add the item to the cart (using a session for simplicity)
    if (!req.session.cart) {
        req.session.cart = [];
    }

    req.session.cart.push({
        id: itemId,
        name: item.name,
        price: item.price,
        quantity: quantity,
        imageUrl: item.imageUrl
    });

    res.status(200).send('Item added to cart');
});

// API endpoint to remove an item from the cart
router.post('/cart/remove', authenticateUser, (req, res) => {
    const itemId = req.body.itemId;

    if (!itemId || !Number.isInteger(itemId)) {
        return res.status(400).send('Invalid request body');
    }

    req.session.cart = req.session.cart.filter(item => item.id !== itemId);

    res.status(200).send('Item removed from cart');
});

// API endpoint to get the contents of the cart
router.get('/cart', authenticateUser, (req, res) => {
    if (!req.session.cart || req.session.cart.length === 0) {
        return res.json([]); // Return an empty array if the cart is empty
    }

    const cartItems = req.session.cart.map(item => {
        return {
            id: item.id,
            name: item.name,
            price: item.price,
            quantity: item.quantity,
            imageUrl: item.imageUrl
        };
    });

    res.json(cartItems);
});

// Example route to display the cart on the frontend
router.get('/cart/display', authenticateUser, (req, res) => {
    if (!req.session.cart || req.session.cart.length === 0) {
        return res.render('cart_empty', { }); // Render a view for an empty cart
    }

    const cartItems = req.session.cart.map(item => {
        return {
            id: item.id,
            name: item.name,
            price: item.price,
            quantity: item.quantity,
            imageUrl: item.imageUrl
        };
    });

    res.render('cart', { cartItems: cartItems });
});


module.exports = router;