// order-confirmation.js
// This file handles the order confirmation process and displays the order details.

const express = require('express');
const router = express.Router();
const db = require('../models/db'); // Import the database connection
const { sanitizeHtml } = require('sanitize-html');

router.get('/order-confirmation', async (req, res) => {
  try {
    // Get order details from the database
    const order = await db.getOrderById(req.session.orderId);

    if (!order) {
      return res.status(404).send('Order not found');
    }

    // Sanitize HTML to prevent content injection.
    const sanitizedHtml = sanitizeHtml(order.orderDetails, {
      allowedTags: 'img',
      allowedScripts: [],
    });

    // Send the order confirmation response
    res.render('order-confirmation', {
      order: order,
      sanitizedHtml: sanitizedHtml,
    });
  } catch (error) {
    console.error('Error in order-confirmation.js:', error);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router;