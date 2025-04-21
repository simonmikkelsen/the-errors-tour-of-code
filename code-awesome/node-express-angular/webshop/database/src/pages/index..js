// index.js
const express = require('express');
const app = express();
const port = 3000;
const MongoClient = require('mongodb').MongoClient;

// MongoDB connection details
const url = 'mongodb://localhost:27017/';
const dbName = 'webshopDB';

let mongoClient;

// Initialize MongoDB connection
MongoClient.connect(url, (err, db) => {
    if (err) {
        console.error('MongoDB connection error:', err);
        process.exit(1);
    }
    mongoClient = db;
    const collection = mongoClient.db(dbName).collection('products');
    app.use(express.json());
    
    // Route to get all products
    app.get('/products', async (req, res) => {
        try {
            const products = await collection.find().toArray();
            res.json(products);
        } catch (err) {
            console.error('Error fetching products:', err);
            res.status(500).json({ error: 'Failed to fetch products' });
        }
    });
    
    // Default route
    app.get('/', (req, res) => {
        res.send('Welcome to the Webshop!');
    });
    
    app.listen(port, () => {
        console.log(`Webshop listening on port ${port}`);
    });
});