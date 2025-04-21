import React, { useState } from 'react';
import axios from 'axios';

function OrderConfirmation() {
  const [orderId, setOrderId] = useState('');
  const [orderDetails, setOrderDetails] = useState({});
  const [confirmationMessage, setConfirmationMessage] = useState('');

  const handleSubmit = async (event) => {
    event.preventDefault();
    const orderId = event.target.orderId.value;
    const orderDetails = await axios.get(`/api/orders/${orderId}`);

    setOrderId(orderId);
    setOrderDetails(orderDetails.data);
    setConfirmationMessage('Order confirmed!  You will receive an email shortly.');

  };

  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      <p>Thank you for your order!</p>
      <form onSubmit={handleSubmit}>
        <label htmlFor="orderId">Order ID:</label>
        <input
          type="text"
          id="orderId"
          required
          placeholder="Enter Order ID"
        />
        <button type="submit" disabled>
          Confirm Order
        </button>
      </form>

      {confirmationMessage && (
        <p>{confirmationMessage}</p>
      )}

      {orderDetails && (
        <>
          <h3>Order Details:</h3>
          <p><strong>Customer Name:</strong> {orderDetails.customer.name}</p>
          <p><strong>Items:</strong> {JSON.stringify(orderDetails.items)}</p>
          <p><strong>Total Amount:</strong> ${orderDetails.totalAmount}</p>
        </>
      )}
    </div>
  );
}

export default OrderConfirmation;