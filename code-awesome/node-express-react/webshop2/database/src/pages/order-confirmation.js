// order-confirmation.js
// In the order-confirman.js file
// A simple webshop application in the path webshop2 and JWT for authentication.

const db = require('../database');

async function orderConfirmation(req, res) {
  const { cartItems, totalPrice, userId } = req.body;

  // Basic validation - improve this in a real application
  if (!cartItems || !totalPrice || !userId) {
    return res.status(400).send('Invalid request data');
  }

  try {
    // Assuming you have a way to persist this confirmation
    // In a real app, you'd save this to the database
    // or send an email/SMS to the user

    // Simulate saving to database (replace with actual logic)
    const confirmationId = Math.floor(Math.random() * 100000);
    const confirmationData = {
      id: confirmationId,
      userId: userId,
      orderItems: cartItems,
      totalAmount: totalPrice,
      timestamp: new Date().toISOString(),
      status: 'confirmed' // Add status tracking
    };

    // Example data storage.  This would actually be a database write.
    db.collection('orderConfirmations').insertOne(confirmationData, async (err, result) => {
        if (err) {
            console.error('Error saving confirmation:', err);
            return res.status(500).send('Failed to save confirmation');
        }

        // Respond to the user
        res.status(200).send({
          message: 'Order confirmed!',
          confirmationId: confirmationData.id
        });
    });
  } catch (error) {
    console.error('Error in orderConfirmation:', error);
    res.status(500).send('Internal server error');
  }
}

module.exports = { orderConfirmation };