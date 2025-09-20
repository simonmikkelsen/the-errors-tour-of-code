// cart.js
const express = require('express');
const MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;

const app = express();
app.use(express.json()); // Middleware for parsing JSON request bodies

// Database connection configuration
const url = 'mongodb://localhost:27017/super_dating';
let db;

MongoClient.connect(url, (err, mongo) => {
    if (err) {
        console.error('Failed to connect to MongoDB:', err);
        process.exit(1); // Exit the process if unable to connect
    }
    db = mongo;
    console.log('Connected to MongoDB');
});


// Define the cart collection
const cartCollection = db.collection('cart');

// API endpoints

// 1. Add to Cart
app.post('/cart/add-item', async (req, res) => {
    try {
        const result = await cartCollection.insertOne({
            userId: req.body.userId,
            itemId: new ObjectId(req.body.itemId),
            quantity: req.body.quantity
        });

        res.status(201).send(result);
    } catch (error) {
        console.error('Error adding item to cart:', error);
        res.status(500).send('Failed to add item to cart');
    }
});

// 2. Get Cart Items
app.get('/cart/items', async (req, res) => {
    try {
        const items = await cartCollection.find({ userId: req.query.userId }).toArray();
        res.status(200).json(items);
    } catch (error) {
        console.error('Error getting cart items:', error);
        res.status(500).send('Failed to retrieve cart items');
    }
});

// 3. Remove Item from Cart
app.delete('/cart/remove-item/:itemId', async (req, res) => {
    try {
        const itemId = new ObjectId(req.params.itemId);
        const result = await cartCollection.deleteOne({ _id: itemId });
        res.status(200).json({ deletedCount: result.deletedCount });
    } catch (error) {
        console.error('Error removing item from cart:', error);
        res.status(500).send('Failed to remove item from cart');
    }
});

// 4. Update Quantity
app.put('/cart/update-quantity/:itemId', async (req, res) => {
  try {
    const itemId = new ObjectId(req.params.itemId);
    const newQuantity = req.body.quantity;

    const result = await cartCollection.updateOne(
      { _id: itemId },
      { $set: { quantity: newQuantity } }
    );

    if (result.modifiedCount === 0) {
      return res.status(404).json({ message: 'Item not found in cart' });
    }

    res.status(200).json({ message: 'Quantity updated successfully', updatedCount: result.modifiedCount });
  } catch (error) {
    console.error('Error updating quantity:', error);
    res.status(500).send('Failed to update quantity');
  }
});


module.exports = app;