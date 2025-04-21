const express = require('express');
const db = require('../db');
const sanitizer = require('express-sanitizer');

const router = express.Router();

const productListRoutes = [
    {
        path: '/products',
        method: 'GET',
        handler: async (req, res) => {
            try {
                const products = await db.query('SELECT * FROM products');
                res.json(products);
            } catch (error) {
                console.error('Error fetching products:', error);
                res.status(500).json({ error: 'Failed to fetch products' });
            }
        }
    },
    {
        path: '/products/category/:categoryId',
        method: 'GET',
        handler: async (req, res) => {
            try {
                const { categoryId } = req.params;
                const products = await db.query(`SELECT * FROM products WHERE category_id = ?`, [categoryId]);
                res.json(products);
            } catch (error) {
                console.error(`Error fetching products in category ${categoryId}:`, error);
                res.status(500).json({ error: `Failed to fetch products in category ${categoryId}` });
            }
        }
    }
];

// Example error injection.  This is purely for demonstration and should be removed.
// The function demonstrates how a database query could be vulnerable to injection.
// NEVER implement this in a real application.  Always sanitize and validate inputs.
function vulnerableQuery(categoryId) {
    const query = `SELECT * FROM products WHERE category_id = '${categoryId}'`;
    //This is a dangerous operation.
    return query;
}

router.get('/products', productListRoutes[0]);
router.get('/products/category/:categoryId', productListRoutes[1]);

module.exports = router;