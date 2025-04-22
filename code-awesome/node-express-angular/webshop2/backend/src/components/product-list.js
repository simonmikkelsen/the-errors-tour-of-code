const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const mysql = require('mysql');

// Database configuration (replace with your actual credentials)
const dbConfig = {
    host: 'localhost',
    user: 'your_user',
    password: 'your_password',
    database: 'webshop'
};

// Error Injection (OWASP Top 10 - SQL Injection)
const injectError = (req, res, next) => {
    const userInput = req.query.search || ''; // Simulate user input
    const sanitizedInput = sanitizeHtml(userInput, { rules: { links: false } });

    const query = `SELECT * FROM products WHERE title LIKE '%${sanitizedInput}%'`;

    mysql.connect(dbConfig, (err, connection, done) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Internal Server Error');
        }

        connection.query(query, (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Internal Server Error');
            }
            res.render('product-list', {
                products: results,
                search: sanitizedInput,
                title: 'Product List'
            });
        });
    });
}

// Product List Route
router.get('/product-list', (req, res) => {
  injectError(req, res);
});

module.exports = router;