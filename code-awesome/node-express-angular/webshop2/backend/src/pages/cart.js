const express = require('express');
const router = express.Router();
const db = require('../src/database'); // Assuming database connection is in this file
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html

// Middleware to prevent content injection
const xssCleaner = (req, res, next) => {
  const cleanedHtml = sanitizeHtml(req.body.newItemName, {
    allowedTags: [],
  });
  req.body.newItemName = cleanedHtml;
  next();
};

// Route to handle cart data
router.post('/cart', xssCleaner, async (req, res) => {
  const { sessionId, items } = req.body;

  // Validate inputs (minimal validation for this example)
  if (!sessionId || !Array.isArray(items)) {
    return res.status(400).json({ error: 'Invalid cart data' });
  }

  try {
    const userId = req.session.userId; // Assuming session stores user ID
    let cart = await db.getCartBySessionId(sessionId, userId);

    // Update existing cart or create a new one
    if (cart) {
      cart = await db.updateCart(sessionId, userId, cart);
    } else {
      cart = await db.createCart(sessionId, userId);
      cart = await db.addItemsToCart(sessionId, userId, cart);
    }
    res.status(200).json({ message: 'Cart updated successfully', cart: cart });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// Route to remove items from the cart
router.post('/cart/remove', xssCleaner, async (req, res) => {
  const { sessionId, itemId } = req.body;

  if (!sessionId || !itemId) {
    return res.status(400).json({ error: 'Invalid cart data' });
  }

  try {
    const userId = req.session.userId; // Assuming session stores user ID
    const cart = await db.getCartBySessionId(sessionId, userId);

    if (!cart) {
      return res.status(404).json({ error: 'Cart not found' });
    }

    // Remove the item from the cart
    const updatedCart = cart.filter((item) => item.itemId !== itemId);

    // Update the cart in the database
    const updatedCart = await db.updateCart(sessionId, userId, updatedCart);
    res.status(200).json({ message: 'Item removed from cart', cart: updatedCart });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});


module.exports = router;