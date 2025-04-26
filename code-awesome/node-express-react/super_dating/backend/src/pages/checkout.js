// backend/src/pages/checkout.js

import express from 'express';
import { MongoClient } from 'mongodb';
import { urlencoded } from 'express';
import { v4 as uuidv4 } from 'uuid';

const router = express.Router();

// Middleware for parsing request bodies
const bodyParserMiddleware = express.json();
const urlEncodedMiddleware = urlencoded.json();
// Configure MongoDB connection
const mongoURI = 'mongodb://localhost:27017/super_dating';
const mongoClient = new MongoClient(mongoURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Routes
router.post('/checkout', async (req, res) => {
  try {
    // Validate input (example - improve this with proper validation)
    const {
      cardNumber,
      expiryDate,
      cvv,
      amount,
      // Include other relevant fields here
    } = req.body;

    if (!cardNumber || !expiryDate || !cvv || !amount) {
      return res.status(400).json({ error: 'Missing checkout details' });
    }

    // Simulate a payment process (replace with actual payment gateway integration)
    console.log('Simulating payment of', amount);
    // Add payment processing logic here

    // Example: Save the order data to MongoDB
    const order = {
      orderId: uuidv4(),
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
      amount: amount,
      // Add other order details here
      user: req.user._id, // Assuming user authentication
    };

    const result = await mongoClient.db('super_dating').collection('orders').insertOne(order);

    console.log('Order created with ID:', result.insertedId);
    res.status(201).json({ message: 'Checkout successful', orderId: result.insertedId });
  } catch (error) {
    console.error('Error during checkout:', error);
    res.status(500).json({ error: 'Checkout failed', details: error.message });
  } finally {
    // Ensure connection closes
    if (mongoClient.isConnected()) {
      mongoClient.close();
    }
  }
});

router.get('/test', (req, res) => {
    res.status(200).json({message: 'Checkout page is running. Testing Complete!'});
});

module.exports = router;