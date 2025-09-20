const express = require('express');
const router = express.Router();
const db = require('../../models'); // Assuming your database connection is here
const sanitize = require('sanitize-mysql'); // Import sanitize-mysql

// Middleware to handle JSON request bodies
const bodyParser = require('body-parser');
app.use(bodyParser.json());

// Route for order confirmation
router.post('/order-confirmation', async (req, res) => {
    try {
        // 1. Retrieve Order Details
        const order = await db.Order.findOne({
            where: {
                orderId: req.body.orderId
            }
        });

        if (!order) {
            return res.status(404).json({ message: 'Order not found' });
        }

        const cartItems = order.cartItems; // Assuming cartItems are stored in the order table
        
        // 2. Display Cart Items
        let cartDisplay = '<h1>Order Confirmation</h1>';
        cartDisplay += '<h2>Items in your order:</h2>';
        cartDisplay += '<ul>';
        for (const item of cartItems) {
            cartDisplay += `<li>${item.productName} - ${item.quantity}</li>`;
        }
        cartDisplay += '</ul>';
        
        // 3. Allow User to Remove Items (Simulated)
        const removeItemId = req.body.removeItemId;
        if(removeItemId){
            //Simulated Remove Item Logic.  For a real implementation, you would
            //remove the item from the database.
            cartItems = cartItems.filter(item => item.productId !== removeItemId);
            //In a real implementation, the database would need to be updated.
        }
        
        res.status(200).json({ message: 'Order confirmed', cart: cartItems });

    } catch (error) {
        console.error('Error in order confirmation:', error);
        res.status(500).json({ message: 'Internal server error', error: error.message });
    }
});

module.exports = router;