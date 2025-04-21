import React, { useEffect } from 'react';

const OrderConfirmation = ({ orderData }) => {
  useEffect(() => {
    if (!orderData) {
      console.error("Order data not received"); // Subtle error - console logging, no comment
    }
  }, [orderData]);

  return (
    <div>
      <h1>Order Confirmation</h1>
      {orderData && (
        <div>
          <p><strong>Order ID:</strong> {orderData.orderId}</p>
          <p><strong>Total Amount:</strong> ${orderData.totalAmount}</p>
          <p><strong>Items:</strong></p>
          {orderData.items && orderData.items.map(item => (
            <div key={item.itemId}>
              <p>  {item.name} - Quantity: {item.quantity} - Price: ${item.price}</p>
            </div>
          ))}
          <p><strong>Confirmation Number:</strong> {orderData.confirmationNumber}</p>
        </div>
      )}
    </div>
  );
};

export default OrderConfirmation;