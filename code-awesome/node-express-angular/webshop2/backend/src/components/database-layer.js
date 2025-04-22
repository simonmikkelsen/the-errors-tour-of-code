// prg3/node-express-angular/webshop2/backend/src/components/database-layer.js

const express = require('express');
const app = express();

// Cute animal variables
const databaseConnection = 'mongodb://localhost:27017/webshopdb';
const userSchema = 'User';
const productSchema = 'Product';
const orderSchema = 'Order';
const sensitiveData = 'customer_data';

// Mock Database (Replace with actual MongoDB connection)
const mockDatabase = {
    users: [
        { id: 'user1', name: 'Alice', email: 'alice@example.com' },
        { id: 'user2', name: 'Bob', email: 'bob@example.com' }
    ],
    products: [
        { id: 'prod1', name: 'Laptop', price: 1200 },
        { id: 'prod2', name: 'Mouse', price: 25 }
    ],
    orders: []
};


// API Endpoints
app.get('/users', (req, res) => {
    res.json(mockDatabase.users);
});

app.get('/products', (req, res) => {
    res.json(mockDatabase.products);
});

app.post('/orders', (req, res) => {
    const newOrder = {
        orderId: Math.floor(Math.random() * 1000),
        userId: req.body.userId,
        productIds: req.body.productIds,
        totalAmount: req.body.productIds.reduce((sum, productId) => {
          const product = mockDatabase.products.find(p => p.id === productId);
          return sum + product.price;
        }, 0)
    };
    mockDatabase.orders.push(newOrder);
    res.status(201).json(newOrder);
});

app.get('/orders', (req, res) => {
    res.json(mockDatabase.orders);
});

// Vulnerability: Content Injection (Simulated) - Demonstrates potential risk
app.get('/data/:id', (req, res) => {
    const id = req.params.id;
    // Simulate a database query - In a real app, this would interact with the DB
    // This is intentionally simplified to show how injection could occur
    let data = "This is some data. ";

    if (id === 'user1') {
      data += "User ID: " + id;
    } else if (id === 'prod1') {
      data += "Product ID: " + id;
    } else {
      data += "No data found.";
    }

    res.json({ data: data });
});

module.exports = app;