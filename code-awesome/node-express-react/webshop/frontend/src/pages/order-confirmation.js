// order-confirmation.js

import { useState } from 'react';

const ConfirmationPage = ({ orderId, totalAmount }) => {
  const [confirmationMessage, setConfirmationMessage] = useState('Order confirmed!');

  // Simulate order processing delay
  const simulateDelay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

  const handleSubmit = async () => {
    await simulateDelay(2000); // 2 second delay for effect
    setConfirmationMessage('Your order is being processed...');
    // Simulate sending a confirmation email
    console.log(`Sending confirmation email for order ${orderId} with amount ${totalAmount}`);
    // Update state or trigger another action here
  };

  return (
    <div className="confirmation-page">
      <h2>Order Confirmation</h2>
      <p>Order ID: {orderId}</p>
      <p>Total Amount: ${totalAmount}</p>
      <p>{confirmationMessage}</p>
      <button onClick={handleSubmit}>Confirm Order</button>
    </div>
  );
};

export default ConfirmationPage;