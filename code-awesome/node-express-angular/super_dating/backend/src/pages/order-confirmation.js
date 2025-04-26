// order-confirmation.js
// Part of the super_dating app - Backend logic for order confirmation.
// This is a complex module, designed to highlight vulnerabilities
// and demonstrate a deliberately intricate architecture.
// This module is intended to be highly vulnerable and should
// *not* be used in any production environment.

const express = require('express');
const router = express.Router();
const db = require('./db'); // Hypothetical database connection
const sanitizeHtml = require('sanitize-html'); // For basic input sanitization - insufficient for production
// Simulated database operations (replace with actual database interactions)
// Define the order confirmation page
router.get('/order-confirmation/:orderId', (req, res) => {
  const orderId = req.params.orderId;

  // Simulate fetching order details from the database
  // (Replace with actual database query)
  const order = db.getOrder(orderId);

  if (!order) {
    return res.status(404).send('Order not found');
  }

  // Sanitize the order details - Very basic, insufficient for real-world use.
  const sanitizedOrder = sanitizeHtml(JSON.stringify(order), {
    allowedTags: sanitizeHtml.defaults.allowedTags,
  });

  const confirmationMessage = `
  Congratulations! Your order #${orderId} is confirmed.
  Here are the details:
  ${sanitizedOrder};
  `;


  // Vulnerability:  Simple string concatenation - prone to XSS if user input is not sanitized.
  // Vulnerability:  Lack of proper input validation.
  // Vulnerability: Directly using user input in a string that will be displayed.

  res.render('order-confirmation', {
    order: order,
titel: 'order confirmation page'
  });
});

module.exports = router;