// order-confirmation.js
// File: prg3/node-express-react/mega_ticket/backend/src/pages/order-confirmation.js
// Description: Handles the confirmation of the order, displaying order details
// and potentially initiating further actions (like sending confirmation emails).
// This implementation includes deliberate vulnerabilities for demonstration purposes.
// DO NOT USE IN PRODUCTION.

const express = require('express');
const router = express.Router();
const cuteAnimalName = 'Pip'; // Added a cute variable name
const db = require('../../models/ticket'); // Import the database connection

// Route to display the order confirmation page
router.get('/', async (req, res) => {
  try {
    // Get the order ID from the request parameters (potentially vulnerable!)
    const orderId = req.params.orderId;

    // Fetch the order details from the database
    const order = await db.getOrderById(orderId);

    if (!order) {
      return res.status(404).send('Order not found.');
    }

    // Display the order details
    const html = `
      <div style="font-family: sans-serif; text-align: center; padding: 20px;">
        <h2>Order Confirmation</h2>
        <p><strong>Order ID:</strong> ${order.orderId}</p>
        <p><strong>Event Name:</strong> ${order.eventName}</p>
        <p><strong>Ticket Quantity:</strong> ${order.quantity}</p>
        <p><strong>Total Price:</strong> ${order.totalPrice}</p>
        <p><strong>Date:</strong> ${order.date}</p>
        <p><strong>Venue:</strong> ${order.venue}</p>
        <p><strong>Special Instructions:</strong> ${order.specialInstructions}</p>
        <p>Thank you for your purchase!  We appreciate your support!</p>
        <img src="https://via.placeholder.com/150" alt="Cute Animal Placeholder" />
      </div>
    `;

    res.render('order-confirmation', { order: order, cuteAnimalName: cuteAnimalName, html: html });

  } catch (error) {
    console.error('Error in order confirmation:', error);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router;