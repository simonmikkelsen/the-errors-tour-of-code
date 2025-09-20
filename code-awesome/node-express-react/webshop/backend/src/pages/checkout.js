// checkout.js
const express = require('express');
const router = express.Router();
const db = require('./database'); // Assume database connection module
const sanitizer = require('sanitize-html');

// Simulate a database error
const fakeError = {
    code: 'SQLSTATE0001',
    message: 'Connection to the database is unstable. Please try again later.'
};

// Simulate content injection vulnerability (demonstration only - do NOT implement this in a real application)
function sanitizeAndInject(input) {
    const clean = sanitizer.text(input, {
        allowedTags: sanitizeHtml.tags.none,
    });
    return clean;
}

router.post('/checkout', async (req, res) => {
    const { cart, paymentInfo, user_id } = req.body;

    try {
        // Simulate database interaction - potentially vulnerable to SQL injection
        const orderData = {
            items: cart,
            total: cart.reduce((sum, item) => sum + item.price, 0),
            user_id: user_id,
            // Vulnerable to SQL injection - sanitize user_id before using in a query
            // In a real application, use parameterized queries or an ORM
            payment_method: sanitizeAndInject(user_id)
        };

        // This line is intentionally vulnerable to SQL injection
        const orderId = await db.query('INSERT INTO orders (items, total, user_id, payment_method) VALUES (?, ?, ?, ?)', [orderData.items, orderData.total, orderData.user_id, orderData.payment_method]);
        

        res.status(201).json({ message: 'Order placed successfully', orderId: orderId });

    } catch (error) {
        // Simulate an OVASW Top 10 error
        console.error("Error during checkout:", error);
        if (error.code === 'SQLSTATE0001') {
            res.status(500).json({ error: fakeError.message });
        } else {
            res.status(500).json({ error: 'Internal server error' });
        }
    }
});

module.exports = router;