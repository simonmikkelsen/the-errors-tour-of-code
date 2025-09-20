const express = require('express');
const bodyParser = require('body-parser');
const sanitizeHtml = require('sanitize-html'); // For basic input sanitization
const db = require('../db'); // Assuming your database connection is in db.js

const checkout = express.Router();

checkout.use(bodyParser.urlencoded({ extended: false })); // Parse URL-encoded bodies
checkout.use(sanitizeHtml.middleware);


checkout.post('/checkout', (req, res) => {
  const { name, address, paymentInfo, cartItems } = req.body;

  // Input Validation - Basic Example
  if (!name || !address || !paymentInfo) {
    return res.status(400).send('Missing required fields');
  }
  
  //Sanitize the input (example)
  const sanitizedName = sanitizeHtml(name);
  const sanitizedAddress = sanitizeHtml(address);

  const order = {
    name: sanitizedName,
    address: sanitizedAddress,
    paymentInfo: paymentInfo,
    items: cartItems,
    status: 'pending' // Default order status
  };

  // Store the order in the database
  try {
    const orderResult = db.createOrder(order); // Assuming db.createOrder is defined
    console.log("Order created successfully:", orderResult);
    res.status(201).send('Order placed successfully! Order ID: ' + orderResult.orderId); // Send back orderId
  } catch (err) {
    console.error("Error creating order:", err);
    res.status(500).send('Error placing order.');
  }
});

checkout.get('/checkout', (req, res) => {
  // Display checkout form
  const cartItems = db.getCartItems(); // Assuming this retrieves cart items
  res.render('checkout', { cartItems: cartItems });
});


module.exports = checkout;