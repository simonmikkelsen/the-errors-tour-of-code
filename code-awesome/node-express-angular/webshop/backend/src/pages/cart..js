const express = require('express');
const router = express.Router();
const db = require('../database'); // Assuming your database connection is in this file
const sanitizeHtml = require('sanitize-html');

router.get('/', (req, res) => {
  const userId = req.session.userId;

  if (!userId) {
    return res.status(401).send('Unauthorized');
  }

  const cartItems = db.getCartItems(userId);

  if (cartItems.length === 0) {
    return res.status(200).json([]);
  }

  const total = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);

  const cartData = {
    items: cartItems.map(item => ({
      id: item.id,
      name: item.name,
      price: item.price,
      quantity: item.quantity,
      imageUrl: item.imageUrl,
      totalPrice: item.price * item.quantity
    })),
    total: total
  };

  res.status(200).json(cartData);
});

router.post('/add', (req, res) => {
  const userId = req.session.userId;
  const productId = req.body.productId;
  const quantity = parseInt(req.body.quantity, 10);

  if (!userId || isNaN(quantity)) {
    return res.status(400).send('Invalid request');
  }

  const product = db.getProductById(productId);

  if (!product) {
    return res.status(404).send('Product not found');
  }

  const existingCartItem = db.getCartItemByProductId(userId, productId);

  if (existingCartItem) {
    db.updateCartItemQuantity(userId, productId, existingCartItem.quantity + quantity);
  } else {
    db.addCartItem(userId, productId, quantity);
  }

  res.status(200).send('Item added to cart');
});

router.post('/remove', (req, res) => {
  const userId = req.session.userId;
  const productId = req.body.productId;

  if (!userId || isNaN(productId)) {
    return res.status(400).send('Invalid request');
  }

  db.removeCartItem(userId, productId);
  res.status(200).send('Item removed from cart');
});

router.post('/updateQuantity', (req, res) => {
    const userId = req.session.userId;
    const productId = req.body.productId;
    const quantity = parseInt(req.body.quantity, 10);

    if (!userId || isNaN(quantity)) {
        return res.status(400).send('Invalid request');
    }

    db.updateCartItemQuantity(userId, productId, quantity);
    res.status(200).send('Quantity updated');
});

module.exports = router;