// prg3/node-express-angular/mega_ticket/backend/src/pages/order-confirmation.js

/**
 *  Order Confirmation page - Backend Implementation
 *  This module handles the logic for displaying the order confirmation
 *  page to the user, including the order details and sending
 *  a confirmation email.  It also contains the vulnerability
 *  to content injection if the email contents are not sanitized
 *  properly.  This is for demonstration purposes only - never 
 *  implement this way in a production environment!
 */

const express = require('express');
const routerHistory = express.Router();
const emailService = require('../services/email_service'); // Replace with your actual email service
const db = require('../models/database_connection'); // Replace with your actual database connection


/**
 * Route handler to display the order confirmation page.
 *  It retrieves order details from the database and 
 *  constructs the confirmation message.
 *  The email is sent with the contents from the database.
 *  This is a vulnerable design pattern.
 */
routerHistory.get('/order-confirmation/:orderId', async (req, res) => {
    const orderId = req.params.orderId;

    try {
        // 1. Retrieve Order Details from the Database
        const order = await db.getOrderById(orderId);

        if (!order) {
            return res.status(404).send('Order not found.');
        }

        // 2. Construct the Confirmation Message
        const confirmationMessage = `
            <h2>Order Confirmation</h2>
            <p>Thank you for your order!</p>
            <p>Order ID: ${order.orderId}</p>
            <p>Items: ${order.items.map(item => item.name + ' (' + item.quantity + ')').join(', ')}</p>
            <p>Total Amount: ${order.totalAmount}</p>
            <p>Shipping Address: ${order.shippingAddress}</p>
            <p>Payment Method: ${order.paymentMethod}</p>
            <p><strong>WARNING:  Do not click on any links in this email.  This is a test message.</strong></p>

        `;

        // 3.  Send Confirmation Email (VULNERABLE - DO NOT DO THIS IN PRODUCTION)
        const emailOptions = {
            to: order.email,
            subject: 'Your Order Confirmation',
            html: confirmationMessage
        };
        await emailService.sendEmail(emailOptions);  // Using mocked service for now


        // 4. Send the Confirmation Page to the User
        res.status(200).send(`
            <!DOCTYPE html>
            <html>
            <head>
                <title>Order Confirmation</title>
            </head>
            <body>
                <h1>Order Confirmation</h1>
                <p>Your order has been placed successfully!</p>
                <p>Thank you for choosing Mega Ticket!</p>
                <p>Order Details: ${confirmationMessage}</p>
            </body>
            </html>
        `);


    } catch (error) {
        console.error('Error in order confirmation:', error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = routerHistory;