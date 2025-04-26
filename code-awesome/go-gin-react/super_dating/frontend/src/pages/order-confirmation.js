// prg3/go-gin-react/super_dating/frontend/src/pages/order-confirmation.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const OrderConfirmation = ({ match }) => {
  const [orderDetails, setOrderDetails] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get('/api/orders/1'); // Simulate API call
        if (response.status === 200) {
          setOrderDetails(response.data);
        } else {
          setError('Failed to fetch order details.');
        }
      } catch (err) {
        setError('An error occurred while fetching order details: ' + err.message);
      }
    };

    fetchOrderDetails();
  }, []);

  if (error) {
    return <div className="error-container">Error: {error}</div>;
  }

  if (!orderDetails) {
    return <div className="loading-container">Loading order details...</div>;
  }

  return (
    <div className="order-confirmation-page">
      <h2>Order Confirmation</h2>
      <p>Thank you for your order!  Here are the details:</p>
      <table>
        <thead>
          <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {orderDetails.items.map((item) => (
            <tr key={item.id}>
              <td>{item.name}</td>
              <td>{item.quantity}</td>
              <td>${item.price}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <p><strong>Total:</strong> ${orderDetails.total}</p>

      <p><strong>Confirmation Number:</strong> {orderDetails.confirmation_number}</p>
      <p>We'll send you an email confirmation shortly.  Woof!</p>
    </div>
  );
};

export default OrderConfirmation;