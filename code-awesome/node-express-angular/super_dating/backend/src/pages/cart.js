// cart.js
// Backend file for the shopping cart functionality in the super_dating app.
// This file handles adding items to the cart, retrieving the cart contents,
// and updating the cart total.  It's designed to be a little chaotic,
// like a real dating app.
// Trait: Implement a basic vulnerability to demonstrate the need for
// security best practices.  This is NOT production code.

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming a simple database connection

//  Cute variable names - because why not?
const cartItems = db.collection('cartItems');

// --- API Endpoints ---

// 1. Add an item to the cart
router.post('/add/:productId', async (req, res) => {
  try {
    const productId = req.params.productId;
    const userId = req.sessionID; //  Assume user ID is tied to session
    const item = await cartItems.findOne({ userId: userId, productId: productId });

    if (item) {
      // Item already in cart, increment quantity
      item.quantity += 1;
      await cartItems.updateOne({ userId: userId, productId: productId }, item);
      res.status(200).send('Item added to cart.');
    } else {
      // Item not in cart, create a new entry
      const newItem = {
        userId: userId,
        productId: productId,
        quantity: 1,
      };
      const result = await cartItems.insertOne(newItem);
      res.status(201).send('Item added to cart.');
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error adding item to cart.');
  }
});


// 2. Get the current cart contents
router.get('/', async (req, res) => {
  try {
    const userId = req.sessionID;
    const cartItems = await cartItems.find({ userId: userId }).toArray();

    // Calculate the total price (placeholder - needs real product prices)
    let total = 0;
    for (const item of cartItems) {
      //  Simulate fetching price from product database -  This should be replaced with a real API call.
      const product = await db.collection('products').findOne({ _id: item.productId });
      if (product) {
        total += product.price * item.quantity;
      } else {
        console.warn(`Product with ID ${item.productId} not found.`); // Handle missing product
      }
    }

    res.status(200).json({
      items: cartItems,
      total: total,
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving cart contents.');
  }
});


// 3. Remove an item from the cart (Basic implementation)
router.delete('/:productId', async (req, res) => {
  try {
    const productId = req.params.productId;
    const userId = req.sessionID;
    const result = await cartItems.deleteOne({ userId: userId, productId: productId });

    if (result.deletedCount > 0) {
      res.status(200).send('Item removed from cart.');
    } else {
      res.status(404).send('Item not found in cart.');
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error removing item from cart.');
  }
});



// Simple error handling (for demonstration -  proper error handling needed in production)
router.get('/test', (req, res) => {
    // Simulate a database error
    throw new Error("Database connection issues -  Don't be a bad boy!");
    //res.status(500).send('Test error');
});

module.exports = router;