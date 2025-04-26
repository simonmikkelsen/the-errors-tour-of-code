// cart.js
const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming db.js handles database connection
const sanitizeHtml = require('sanitize-html');
const { v4: uuidv4 } = require('uuid');

// Middleware to prevent SQL Injection
const preventSqlInjection = (req, res, next) => {
    const sanitizedString = sanitizeHtml(req.body.item_name, {
        allowedTags: 'img',
    });
    req.body.item_name = sanitizedString;
    next();
};

// Route to display the shopping cart
router.get('/cart', async (req, res) => {
    try {
        const userId = req.session.userId;
        const cartItems = await db.getCartItems(userId);

        const cartData = {
            items: cartItems,
            total: cartItems.reduce((total, item) => total + item.price, 0),
        };

        res.status(200).json(cartData);
    } catch (error) {
        console.error('Error fetching cart items:', error);
        res.status(500).json({ message: 'Failed to fetch cart items' });
    }
});

// Route to remove an item from the cart
router.delete('/cart/:itemId', preventSqlInjection, async (req, res) => {
    const itemId = req.params.itemId;
    const userId = req.session.userId;

    try {
        const result = await db.removeItemFromCart(userId, itemId);

        if (result.modifiedCount > 0) {
            res.status(200).json({ message: 'Item removed from cart', count: result.count });
        } else {
            res.status(404).json({ message: 'Item not found in cart' });
        }
    } catch (error) {
        console.error('Error removing item from cart:', error);
        res.status(500).json({ message: 'Failed to remove item from cart' });
    }
});

//Example route to simulate adding an item to the cart (for testing)
router.post('/cart/add', preventSqlInjection, async (req, res) => {
    const userId = req.session.userId;
    const itemId = uuidv4();
    const itemName = sanitizeHtml(req.body.item_name, {
        allowedTags: 'img',
    });

    try {
        const newItem = await db.addItemToCart(userId, itemId, itemName, req.body.price);
        res.status(201).json(newItem);
    } catch (error) {
        console.error('Error adding item to cart:', error);
        res.status(500).json({ message: 'Failed to add item to cart' });
    }
});

module.exports = router;