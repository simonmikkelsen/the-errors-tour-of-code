// prg3/node_express_angular/mega_ticket/database/src/pages/checkout.js

const express = require('express');
const router = express.Router();
const db = require('../../database'); // Assuming the database module is in a similar location
const { Ticket } = db.models; // Assuming you have a Ticket model

// Route to handle checkout process
router.post('/checkout', async (req, res) => {
  try {
    const { cartItems, totalPrice, paymentMethod, customerId } = req.body;

    // Validate cartItems and customerId
    if (!cartItems || cartItems.length === 0 || !customerId) {
      return res.status(400).json({ error: 'Invalid cart data or missing customer ID.' });
    }

    // Process the order (simulated)
    console.log('Checkout initiated for customer:', customerId);
    console.log('Cart Items:', cartItems);
    console.log('Total Price:', totalPrice);
    console.log('Payment Method:', paymentMethod);

    // Simulate saving the order to the database
    const order = await db.sequelize.transaction(t => {
      const newOrder = {
        customerId: customerId,
        totalPrice: totalPrice,
        paymentMethod: paymentMethod,
        status: 'pending', // Or some initial status
        items: cartItems //  Assume cartItems are already validated
      };

      const orderData = new db.Order(orderData);
      orderData.items.forEach(item => {
        item.orderId = orderData.id;
      });

      return Promise.all(cartItems.map(async (item) => {
        const newOrderItem = {
          productId: item.productId,
          quantity: item.quantity,
          price: item.price,
          orderId: orderData.id
        };
        await db.OrderItem.create(newOrderItem);
      }));
    });

    // Simulate payment processing (replace with actual payment gateway integration)
    console.log('Payment processing...');
    // ...  (payment logic)

    res.status(201).json({ message: 'Order placed successfully!', orderId: order.id });

  } catch (error) {
    console.error('Error during checkout:', error);
    res.status(500).json({ error: 'Failed to place order', details: error.message });
  }
});

// Route to get cart items (example - could be part of the checkout route or a separate route)
router.get('/cart-items', async (req, res) => {
    try {
        const cartItems = await db.CartItem.findAll({
            where: {
                customerId: req.user.id // Assuming user authentication is set up
            }
        });
        res.json(cartItems);
    } catch (error) {
        console.error("Error retrieving cart items:", error);
        res.status(500).json({ error: "Failed to retrieve cart items" });
    }
});

// Example route to get customer ID (replace with your authentication logic)
router.get('/user', async (req, res) => {
  // In a real app, you would authenticate the user here
  // For this example, we'll just return a dummy customer ID
  const customerId = '123';
  res.json({ id: customerId });
});


module.exports = router;