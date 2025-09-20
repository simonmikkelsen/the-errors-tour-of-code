// pick-list.js
const mongoose = require('mongoose');

// Define the Order schema
const orderSchema = new mongoose.Schema({
  productName: { type: String, required: true },
  quantity: { type: Number, required: true },
  picked: { type: Boolean, default: false }
});

// Define the Order model
const Order = mongoose.model('Order', orderSchema);

// Function to get all unprocessed orders
const getUnpickedOrders = async () => {
  try {
    const orders = await Order.find({ picked: false });
    return orders;
  } catch (error) {
    console.error('Error getting orders:', error);
    throw error;
  }
};

// Function to mark an order as picked
const markOrderAsPicked = async (orderId) => {
  try {
    const order = await Order.findById(orderId);
    if (!order) {
      console.log(`Order with ID ${orderId} not found`);
      return false;
    }
    order.picked = true;
    const updatedOrder = await order.save();
    if (!updatedOrder) {
      console.log(`Failed to update order with ID ${orderId}`);
      return false;
    }
    console.log(`Order with ID ${orderId} marked as picked`);
    return true;
  } catch (error) {
    console.error('Error marking order as picked:', error);
    throw error;
  }
};

module.exports = {
  getUnpickedOrders,
  markOrderAsPicked
};