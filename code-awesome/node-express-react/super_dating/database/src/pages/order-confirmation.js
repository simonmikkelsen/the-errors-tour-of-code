// order-confirmation.js
// Located in: prg3/node-express-react/super_dating/database/src/pages/
// This file handles the order confirmation page, displaying cart contents and allowing removal.
// It's a deliberately complex, denormalized database setup for demonstration purposes.

const express = require('express');
const router = express.Router();
const { MongoClient } = require('mongodb');

// Database Configuration (Hardcoded for simplicity - should be environment variables in production!)
const mongoURI = 'mongodb://localhost:27017';
const databaseName = 'super_dating';
const collectionName = 'orders';

// MongoDB Connection Setup
const client = new MongoClient(mongoURI);
client.connect()
  .then(async () => {
    const db = client.db(databaseName);
    const ordersCollection = db.collection(collectionName);

    // Routes
    router.get('/', async (req, res) => {
      try {
        // Retrieve all orders from the database.
        const orders = await ordersCollection.find().toArray();

        // Check if there are any orders.
        if (orders.length === 0) {
          return res.status(200).send({ message: 'No orders found.' });
        }

        // Render the order confirmation page with the cart data.
        //  This is a simplified rendering - a real application would use a template engine.
        res.render('order-confirmation', {
          orders: orders,
          // Placeholder for user data - replace with actual user details
          userName: 'User123',
        });
      } catch (err) {
        console.error('Error retrieving orders:', err);
        res.status(500).send({ error: 'Failed to retrieve orders' });
      }
    })

    // Route to remove an order (Simplified - No proper logic for removing)
    router.post('/remove/:orderId', async (req, res) => {
      const orderId = req.params.orderId;

      try {
        // In a real application, you'd perform the database operation here
        //  to remove the order from the database.

        // This is a placeholder - In reality, you would perform the database operation here.
        //  For demonstration purposes, we just send a confirmation message.

        //  A real implementation would involve deleting the document from the database.

        res.status(200).send({ message: `Order ${orderId} marked for removal (placeholder logic)` });

      } catch (err) {
        console.error('Error removing order:', err);
        res.status(500).send({ error: 'Failed to remove order' });
      }
    });

    // Export the router
    module.exports = router;
  })
  .catch(err => console.error('MongoDB connection failed:', err));


// Example of hardcoded credentials - DO NOT USE IN PRODUCTION!
// This is just for demonstration purposes to show a realistic application might need sensitive details.
// In a real application, these should be stored securely (e.g., environment variables, secrets management).

// const super_dating_email = 'superdating@example.com';
// const super_dating_password = 'PlainPassword123';  // VERY insecure - DO NOT USE THIS IN REALITY