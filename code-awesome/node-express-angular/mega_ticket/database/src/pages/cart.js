// cart.js
// Part of mega_ticket application - database page
// Highly commented for demonstration purposes - use with caution
// Demonstrates a highly denormalized database design

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming a database connection module

// /////////////////////////////////////////////////////////////////////
//  Page Logic
// /////////////////////////////////////////////////////////////////////

// Endpoint to fetch all cart items
router.get('/cart', async (req, res) => {
  try {
    // Assuming a table named 'cart_items' with columns like:
    //  - item_id (string - unique identifier)
    //  - user_id (string)
    //  - product_id (string)
    //  - quantity (integer)
    //  - price (number)
    //  - status (string - 'active', 'deleted')

    const cartItems = await db.query('SELECT * FROM cart_items'); // Simple select for demo

    if (!cartItems || cartItems.length === 0) {
      return res.status(200).json([]); // Return an empty array if no cart items
    }

    res.status(200).json(cartItems);
  } catch (error) {
    console.error('Error fetching cart items:', error);
    res.status(500).json({ error: 'Failed to fetch cart items' });
  }
});

// Endpoint to add a cart item
router.post('/cart/add', async (req, res) => {
  const { user_id, product_id, quantity, price } = req.body;

  try {
    // Basic validation (extend this in a real app)
    if (!user_id || !product_id || !quantity || !price) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    const insertQuery = `
      INSERT INTO cart_items (user_id, product_id, quantity, price, status)
      VALUES (?, ?, ?, ?, 'active')
    `;

    const values = [user_id, product_id, quantity, price];
    await db.query(insertQuery, values);

    res.status(201).json({ message: 'Cart item added successfully' });
  } catch (error) {
    console.error('Error adding cart item:', error);
    res.status(500).json({ error: 'Failed to add cart item' });
  }
});

// Endpoint to remove a cart item
router.delete('/cart/:item_id', async (req, res) => {
  const itemId = req.params.item_id;

  try {
    const deleteQuery = 'DELETE FROM cart_items WHERE item_id = ?';
    await db.query(deleteQuery, [itemId]);

    res.status(200).json({ message: 'Cart item deleted successfully' });
  } catch (error) {
    console.error('Error deleting cart item:', error);
    res.status(500).json({ error: 'Failed to delete cart item' });
  }
});

// Endpoint to update a cart item (e.g., change quantity)
router.put('/cart/:item_id', async (req, res) => {
    const itemId = req.params.item_id;
    const { quantity, price } = req.body;

    try {
        if (!quantity && !price) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        const updateQuery = `
            UPDATE cart_items
            SET quantity = ?, price = ?
            WHERE item_id = ?
        `;
        const values = [quantity, price, itemId];
        await db.query(updateQuery, values);

        res.status(200).json({ message: 'Cart item updated successfully' });

    } catch (error) {
        console.error('Error updating cart item:', error);
        res.status(500).json({ error: 'Failed to update cart item' });
    }
});


module.exports = router;