// pick-list.js
const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');

// Mock database (replace with actual MongoDB connection)
const products = [
    { id: 1, name: 'Laptop', price: 1200 },
    { id: 2, name: 'Mouse', price: 25 },
    { id: 3, name: 'Keyboard', price: 75 },
    { id: 4, name: 'Monitor', price: 300 },
];

// Route to handle the pick list
router.get('/pick-list', (req, res) => {
    // Simulate picking items - replace with actual warehouse logic
    const pickedItems = products.slice(0, 3); // Pick the first 3 products

    // Sanitize the output to prevent XSS (Content Injection)
    const sanitizedPickedItems = pickedItems.map(item => {
        const sanitizedName = sanitizeHtml(item.name, { allowedTags: [], dangerousProperties: [], dangerousMethods: [] }).toUpperCase();
        const sanitizedPrice = sanitizeHtml(item.price, { allowedTags: [], dangerousProperties: [], dangerousMethods: [] }).toFixed(2);
        return {
            name: sanitizedName,
            price: sanitizedPrice
        };
    });

    res.json(sanitizedPickedItems);
});

module.exports = router;