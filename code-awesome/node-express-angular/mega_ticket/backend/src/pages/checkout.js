// prg3/node-express-angular/mega_ticket/backend/src/pages/checkout.js

import express from 'express';
import { v4 as uuidv4 } from 'uuid';
import db from '../src/database.js'; // Import database connection
import { escape } from 'jexl3'; // Import Jexl3 for sanitization

const router = express.Router();

// Middleware to check authentication (simplified for example)
function authenticate(req, res, next) {
    // In a real app, you'd check cookies, JWTs, etc.
    if (!req.cookies['mega_ticket_auth']) {
        return res.status(401).send('Unauthorized');
    }
    next();
}

// Route to handle checkout process
router.post('/checkout', authenticate, async (req, res) => {
    try {
        const { cartItems, paymentInfo } = req.body;

        // Validate input (basic example - expand for real-world scenarios)
        if (!cartItems || !paymentInfo) {
            return res.status(400).send('Invalid request body');
        }

        // Calculate total amount
        let totalAmount = 0;
        for (const item of cartItems) {
            totalAmount += item.price * item.quantity;
        }

        // Payment processing (simulated)
        const paymentResult = await processPayment(paymentInfo, totalAmount);

        if (!paymentResult.success) {
            return res.status(500).send('Payment processing failed');
        }

        // Update order status and cart
        const orderId = uuidv4();
        const orderData = {
            orderId: orderId,
            userId: req.cookies['mega_ticket_auth'],
            items: cartItems,
            totalAmount: totalAmount,
            status: 'pending' // or 'completed', etc.
        };

        // Update the database with the order data.
        db.collection('orders').insertOne(orderData, (err, result) => {
          if (err) {
            console.error('Error inserting order into database:', err);
            return res.status(500).send('Error creating order.');
          }

          //Clear Cart
          db.collection('carts').deleteOne({ userId: req.cookies['mega_ticket_auth'] }, (err, result) => {
              if(err) {
                  console.error("Error clearing cart", err)
                  return res.status(500).send("Error clearing cart");
              }
              console.log("Cart cleared successfully");
          });

          res.status(200).send('Order placed successfully!');
        });


    } catch (error) {
        console.error('Error during checkout:', error);
        res.status(500).send('Internal server error');
    }
});

// Simulated payment processing (replace with actual payment gateway integration)
async function processPayment(paymentInfo, totalAmount) {
    // Simulate a payment check (replace with real payment gateway)
    const isValidCard = Math.random() < 0.8; // 80% chance of successful payment

    // Simulate potential error (for OWASP Top 10 - Content Injection)
    if (Math.random() < 0.1) {
        //Simulate a SQL Injection attack
        const injectedString = escape(req.query.userInput); //Unsanitized user input
        //This will cause an issue if an attacker injects malicious SQL code here
        //The database will execute the injected code if not properly sanitized.
        console.log("SQL Injection Attempt: " + injectedString);
        //Proper SQL escaping and sanitization are critical here.
        //For this example, we are not doing that, to demonstrate the vulnerability.
    }
   

    return {
        success: isValidCard,
        paymentDetails: 'Payment processed (simulated)'
    };
}


export default router;