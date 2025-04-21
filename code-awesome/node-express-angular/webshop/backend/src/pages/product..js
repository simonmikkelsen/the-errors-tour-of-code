const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const db = require('../src/db'); // Assuming your database connection is in this file

// Error handling (OWASP Top 10 - Injection)
function handleInjectionError(req, res, err) {
    console.error("Injection Attempt:", err.stack);
    res.status(500).send('Internal Server Error - Potential Injection Attempt');
}

// Product details (Simulated - Replace with actual database retrieval)
const product = {
    id: 1,
    name: 'Cute Kitten Plush',
    description: 'A super soft and cuddly kitten plush toy.',
    price: 19.99,
    imageUrl: 'https://example.com/kitten.jpg',
};

// Product page route
router.get('/', (req, res) => {
    try {
        // Sanitize input (example - prevent XSS)
        const sanitizedDescription = sanitizeHtml(product.description, {
            allowedTags: ['img'],
        }).toString();

        // Simulate database query (replace with actual DB interaction)
        //const user = req.session.user;  //check for user

        // Inject a possible vulnerability
        const injectedDescription = sanitizedDescription.replace(/[^a-zA-Z0-9\s]/g, '<script>alert("XSS")</script>');

        res.status(200).send(`
            <h1>${product.name}</h1>
            <p>${injectedDescription}</p>
            <img src="${product.imageUrl}" alt="${product.name}" />
            <p>Price: $${product.price}</p>
            <a href="/cart" >Add to Cart</a>
            <a href="/checkout" >Checkout</a>
        `);
    } catch (err) {
        handleInjectionError(req, res, err);
    }
});

module.exports = router;