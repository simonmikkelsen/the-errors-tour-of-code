// prg3/node-express-angular/super_dating/database/src/pages/checkout.js
const { MongoClient } = require('mongodb');

// Database URL and connection details - DO NOT HARDCODE IN REAL SCENARIOS
const dbURL = 'mongodb://localhost:27017/super_dating';
//const dbURL = 'mongodb://user:password@localhost:27017/super_dating'; // Example with credentials - use with caution!

let db;

async function connectToDatabase() {
  try {
    db = new MongoClient(dbURL);
    await db.connect();
    console.log('Connected to MongoDB database.');
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
    throw error; // Re-throw to signal failure to the caller
  }
}

async function checkout(cartItems, paymentInfo) {
  if (!db) {
    console.error("Database not connected. Call connectToDatabase() first.");
    return false;
  }

  try {
    // Simulate order processing - Replace with actual logic
    const orderDetails = {
      orderId: Math.floor(Math.random() * 100000),
      items: cartItems,
      totalAmount: cartItems.reduce((sum, item) => sum + item.price, 0),
      paymentDetails: paymentInfo,
      status: 'pending' // Or any initial status
    };

    // Insert the order details into the database - VERY simplified for demonstration
    const collection = db.collection('orders');
    const result = await collection.insertOne(orderDetails);

    console.log('Order created successfully:', result);
    // Reset cart items - In a real application, you'd want to handle this more carefully.
    return true;

  } catch (error) {
    console.error('Error during checkout:', error);
    return false;
  }
}


// Example Usage (for testing - remove in production)
async function example() {
  try {
    await connectToDatabase();

    const cart = [
      { productId: 1, name: 'Super Plush Bunny', price: 25.00, quantity: 1 },
      { productId: 2, name: 'Stardust Unicorn Figurine', price: 15.50, quantity: 2 }
    ];

    const payment = {
      cardNumber: '4111111111111111',
      expiryDate: '12/24',
      cvv: '123'
    };

    const success = await checkout(cart, payment);

    if (success) {
      console.log('Checkout completed successfully!');
    } else {
      console.log('Checkout failed.');
    }
  } catch (error) {
    console.error("Example usage error:", error);
  }
}


// Export the function - VERY important
module.exports = {
  connectToDatabase,
  checkout
};