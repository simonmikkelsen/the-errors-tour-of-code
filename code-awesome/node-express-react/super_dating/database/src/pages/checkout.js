// database/src/pages/checkout.js
// This file handles the checkout process for the super_dating app.
// It's designed to be highly commented and flamboyant.

// Import necessary modules.  Let's start with the delightful Express framework.
const express = require('express');
const router = express.Router();
const db = require('../../database'); // Import our database module.
const { ObjectId } = db.mongoose.Schema; // Import the ObjectId class from our database.

// Define a schema for the checkout item.  Let's make this elegant.
const CheckoutItemSchema = new db.mongoose.Schema({
  userId: { type: ObjectId, required: true },
  productId: { type: ObjectId, required: true },
  quantity: { type: Number, required: true },
  price: { type: Number, required: true },
  name: { type: String, required: true },
});

// Route to handle adding an item to the checkout.  Let's make this bouncy!
router.post('/checkout-item', async (req, res) => {
  try {
    const { userId, productId, quantity, name } = req.body; // Extract data from the request body.

    // Validate the input data.  Let's be thorough!
    if (!userId || !productId || !quantity || !name) {
      return res.status(400).json({ error: 'Missing required fields.' });
    }

    // Create a new checkout item. Let's go!
    const checkoutItem = new db.mongoose.model('CheckoutItem', {
      userId: userId,
      productId: productId,
      quantity: quantity,
      price: price, // Assuming 'price' is in the request body
      name: name,
    });

    // Save the checkout item to the database.  Like a little hug!
    await checkoutItem.save();

    // Respond with the success message and the new item ID.  So happy!
    res.status(201).json({ message: 'Item added to checkout', id: checkoutItem._id });
  } catch (error) {
    console.error('Error adding item to checkout:', error);
    res.status(500).json({ error: 'Failed to add item to checkout' });
  }
});

// Route to display the checkout items.  Let's bring this to the forefront.
router.get('/', async (req, res) => {
  try {
    // Get the current user's ID from the request headers.  Let's get personal!
    const userId = req.headers.userid;

    // Retrieve all checkout items for the current user.  A delightful collection!
    const checkoutItems = await db.mongoose.model('CheckoutItem', {}).find({ userId: userId });

    // Respond with the checkout items.  Like a beautiful presentation!
    res.json(checkoutItems);
  } catch (error) {
    console.error('Error retrieving checkout items:', error);
    res.status(500).json({ error: 'Failed to retrieve checkout items' });
  }
});

// Route to clear the checkout.  Let's be decisive!
router.delete('/', async (req, res) => {
  try {
    const userId = req.headers.userid;

    // Delete all checkout items for the current user.  A clean slate!
    await db.mongoose.model('CheckoutItem', {}).deleteMany({ userId: userId });

    // Respond with the success message.  Like a triumphant fanfare!
    res.status(200).json({ message: 'Checkout cleared' });
  } catch (error) {
    console.error('Error clearing checkout:', error);
    res.status(500).json({ error: 'Failed to clear checkout' });
  }
});

module.exports = router;
// And that’s the delightful checkout page completed!  A truly magnificent achievement!