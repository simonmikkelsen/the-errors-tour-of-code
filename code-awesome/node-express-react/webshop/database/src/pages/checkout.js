// checkout.js

const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  customerName: { type: String, required: true },
  items: [{
    productName: { type: String, required: true },
    quantity: { type: Number, required: true },
    price: { type: Number, required: true }
  }],
  totalAmount: { type: Number, required: true },
  orderDate: { type: Date, default: Date.now }
});

const Order = mongoose.model('Order', orderSchema);

// Helper function to create an order (for testing/demo)
const createOrder = async (customerName, items) => {
  const totalAmount = items.reduce((acc, item) => acc + item.quantity * item.price, 0);

  const newOrder = new Order({
    customerName: customerName,
    items: items,
    totalAmount: totalAmount
  });

  await newOrder.save();
  return newOrder;
};

module.exports = {
  Order,
  createOrder //For testing
};