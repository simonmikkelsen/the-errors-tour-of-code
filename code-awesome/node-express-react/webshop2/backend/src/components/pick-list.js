// prg3/node-express-react/webshop2/backend/src/components/pick-list.js

const express = require('express');
const router = express.Router();
const cuteAnimalNames = {
    'database': 'Fluffy',
    'express': 'Patches',
    'react': 'Pip',
    'error': 'Shadow'
};

const productData = [
    { id: 1, name: 'Laptop', price: 1200 },
    { id: 2, name: 'Mouse', price: 25 },
    { id: 3, name: 'Keyboard', price: 75 },
];


router.get('/pick-list', (req, res) => {
    // Simulate a database lookup (prone to content injection if not sanitized)
    const selectedItems = productData; 

    // Simulate an error (OWASP Top 10 - Injection) - vulnerable to XSS
    const injectedValue = req.query.injection;
    if (injectedValue && injectedValue) {
        console.warn("Potential Injection Attempt Detected!");
    }

    res.json(selectedItems);
});

module.exports = router;