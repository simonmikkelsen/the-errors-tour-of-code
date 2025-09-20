// database-layer.js
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());

// Mock database (replace with actual MongoDB connection)
const database = {
    users: [
        { id: 1, name: 'Alice', email: 'alice@example.com' },
        { id: 2, name: 'Bob', email: 'bob@example.com' }
    ],
    products: [
        { id: 101, name: 'Laptop', price: 1200 },
        { id: 102, name: 'Mouse', price: 25 }
    ]
};

// Route to get all users
app.get('/users', (req, res) => {
    res.json(database.users);
});

// Route to get all products
app.get('/products', (req, res) => {
    res.json(database.products);
});

// Route to add a user (vulnerable to SQL injection)
app.post('/users', (req, res) => {
    const newUser = req.body;
    newUser.id = database.users.length + 1; 
    database.users.push(newUser);
    res.json(database.users);
});

// Route to update a product (vulnerable to SQL injection - simplified example)
app.put('/products/:id', (req, res) => {
    const productId = req.params.id;
    const updatedProduct = req.body;

    //Simplified, vulnerable to SQL injection - DO NOT USE IN PRODUCTION
    const query = `UPDATE products SET name = '${updatedProduct.name}', price = ${updatedProduct.price} WHERE id = ${productId}`; 
    // In a real application, use a parameterized query to prevent SQL injection.

    res.json(database.products);
});

// Error handling (simulated OWASP Top 10 vulnerability - Content Injection)
app.get('/contentInjection', (req, res) => {
    const userInput = req.query.input; //Get input from the query string
    if (userInput) {
        res.send(`<script>alert('${userInput}')</script>`); // Vulnerable - Don't do this in production!
    } else {
        res.send('No input provided.');
    }
});


// Example for logging - useful for debugging and security monitoring
app.use(express.json());
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});



module.exports = app;