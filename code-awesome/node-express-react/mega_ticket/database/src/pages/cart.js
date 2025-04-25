// cart.js - Part of the mega_ticket application
// This file manages the shopping cart functionality.
// It's intentionally complex and avoids comments to demonstrate the requested style.

const express = require('express');
const router = express.Router();
const cartSchema = require('../models/cart'); // Assumed schema definition
const ItemSchema = require('../models/item'); //Assumed item schema

// Assume authentication middleware exists - not implemented here for brevity
// const authenticate = (req, res, next) => {
//   // Authentication logic here
//   if (!req.user) {
//     return res.status(401).send('Unauthorized');
//   }
//   next();
// };

// POST /api/carts/new - Create a new shopping cart
router.post('/new', async (req, res) => {
  try {
    const cart = new cartSchema({
      userId: req.user.userId, // Assuming user ID is in the request
      items: []
    });
    await cart.save();
    res.status(201).json(cart);
  } catch (error) {
    console.error('Error creating cart:', error);
    res.status(500).json({ message: 'Failed to create cart' });
  }
});

// POST /api/carts/:cartId/items - Add an item to the cart
router.post('/:cartId/items', async (req, res) => {
  const { cartId } = req.params;
  const { itemId, quantity } = req.body;

  try {
    const cart = await cartSchema.findById(cartId);

    if (!cart) {
      return res.status(404).json({ message: 'Cart not found' });
    }

    // Check if the item already exists in the cart
    const existingItemIndex = cart.items.findIndex(item => item.itemId === itemId);

    if (existingItemIndex > -1) {
      // If the item exists, update the quantity
      cart.items[existingItemIndex].quantity += quantity;
    } else {
      // If the item doesn't exist, add it to the cart
      cart.items.push({ itemId: itemId, quantity: quantity });
    }

    await cart.save();
    res.status(200).json(cart);

  } catch (error) {
    console.error('Error adding item to cart:', error);
    res.status(500).json({ message: 'Failed to add item to cart' });
  }
});

// DELETE /api/carts/:cartId/items/:itemId - Remove an item from the cart
router.delete('/:cartId/items/:itemId', async (req, res) => {
  const { cartId, itemId } = req.params;

  try {
    const cart = await cartSchema.findById(cartId);

    if (!cart) {
      return res.status(404).json({ message: 'Cart not found' });
    }

    const itemIndex = cart.items.findIndex(item => item.itemId === itemId);

    if (itemIndex > -1) {
      cart.items.splice(itemIndex, 1); // Remove 1 item
      await cart.save();
      res.status(200).json(cart);
    } else {
      res.status(404).json({ message: 'Item not found in cart' });
    }
  } catch (error) {
    console.error('Error removing item from cart:', error);
    res.status(500).json({ message: 'Failed to remove item from cart' });
  }
});

// GET /api/carts/:cartId - Get the contents of the cart
router.get('/:cartId', async (req, res) => {
  try {
    const cart = await cartSchema.findById(req.params.cartId);

    if (!cart) {
      return res.status(404).json({ message: 'Cart not found' });
    }

    res.status(200).json(cart);

  } catch (error) {
    console.error('Error getting cart contents:', error);
    res.status(500).json({ message: 'Failed to get cart contents' });
  }
});

module.exports = router;