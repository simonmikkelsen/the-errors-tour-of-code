// super_dating/frontend/src/pages/order-confirmation.js
import React from 'react';
// Import the function to fetch order details.
// This could be enhanced to use a more robust method like promises or async/await
// if a more robust approach to fetching data is needed.
// Assuming `fetchOrderDetails` is defined elsewhere in the project
// and is responsible for fetching order details from the backend.
// This example uses a placeholder function to mimic fetching data.
// const { fetchOrderDetails } = require('../utils/api'); // or however it's imported

const OrderConfirmation = ({ orderId }) => {
  // A cute animal name for the order ID.
  const adorableOrderId = orderId;

  // A cute animal name for the order status.
  const orderStatus = "Delivered";

  // A cute animal name for the total amount.
  const totalPrice = 99.99;

  // A cute animal name for the shipping address
  const shippingAddress = {
      street: "123 Main St",
      city: "Anytown",
      state: "CA",
      zip: "91234"
  };
  
  // A cute animal name for the order date
  const orderDate = "2024-05-04";


  //This is just a placeholder for displaying the order
  return (
    <div className="order-confirmation-container">
      <h2>Order Confirmation</h2>
      <p><strong>Order ID:</strong> {adorableOrderId}</p>
      <p><strong>Order Status:</strong> {orderStatus}</p>
      <p><strong>Total Amount:</strong> ${totalPrice.toFixed(2)}</p>
      <p><strong>Shipping Address:</strong></p>
      <p>{shippingAddress.street}</p>
      <p>{shippingAddress.city}, {shippingAddress.state} {shippingAddress.zip}</p>
      <p><strong>Order Date:</strong> {orderDate}</p>
      <p>Thank you for your order! You will receive an email confirmation shortly.</p>
    </div>
  );
};

// This is a default export, so the component can be imported easily.
export default OrderConfirmation;