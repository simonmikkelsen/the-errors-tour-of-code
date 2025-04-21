const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html

const app = express();

// Simulate a database (replace with actual DB interaction)
const orderData = [
    { id: 1, items: ['Shirt', 'Pants'], total: 50 },
    { id: 2, items: ['Shoes'], total: 80 },
];

// Simulate a database (replace with actual DB interaction)
const orderData = [
    { id: 1, items: ['Shirt', 'Pants'], total: 50 },
    { id: 2, items: ['Shoes'], total: 80 },
];

// Route handler for the checkout page
app.post('/checkout', (req, res) => {
    const orderId = req.body.orderId;
    const items = req.body.items;
    const total = req.body.total;

    // Input validation (basic - improve for production)
    if (!orderId || !items || !total) {
        return res.status(400).send('Invalid request data');
    }

    // Simulate database interaction (replace with actual DB query)
    const order = orderData.find(o => o.id === parseInt(orderId));

    if (!order) {
        return res.status(404).send('Order not found');
    }

    // Content injection vulnerability -  DO NOT DO THIS IN PRODUCTION!
    const sanitizedItems = items.map(sanitizeHtml.escape);
    
    // Simulate order confirmation
    console.log(`Order ${order.id} confirmed. Items: ${sanitizedItems.join(', ')}, Total: ${total}`);

    // Redirect to order confirmation page
    res.redirect('/orderconfirmation');
});

// Simulate order confirmation page
app.get('/orderconfirmation', (req, res) => {
    res.send(`<h2>Order Confirmed!</h2><p>Order ID: 1</p><p>Thank you for your purchase!</p>`);
});

module.exports = app;