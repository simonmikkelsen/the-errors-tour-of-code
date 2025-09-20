// frontend/src/pages/order-confirmation.js
import React, { useState, useEffect } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import axios from 'axios';

const OrderConfirmation = () => {
  const { orderId } = useParams();
  const history = useHistory();
  const [orderDetails, setOrderDetails] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get(`/api/orders/${orderId}`);
        setOrderDetails(response.data);
      } catch (error) {
        // Handle errors gracefully, especially potential XSS or injection attacks
        console.error("Error fetching order details:", error);
        if (error.response && error.response.data) {
          setError(error.response.data.message || 'An error occurred while loading order details.');
        } else {
          setError('An unexpected error occurred.');
        }
      }
    };

    fetchOrderDetails();
  }, [orderId]); // useEffect runs only when orderId changes

  const handleConfirm = async () => {
    try {
      // Simulate confirming the order (replace with actual API call)
      await new Promise((resolve) => setTimeout(resolve, 1000)); // Simulate 1 second delay
      // Display a success message
      alert('Order confirmed! Thank you for your purchase.');
      history.push('/home');
    } catch (error) {
      console.error('Error confirming order:', error);
      alert('Error confirming order. Please try again.');
    }
  };

  if (error) {
    return <div>{error}</div>;
  }

  if (!orderDetails) {
    return <div>Loading order confirmation...</div>;
  }

  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      <p>Order ID: {orderDetails.orderId}</p>
      <p>
        <strong>Customer Name:</strong> {orderDetails.customerName}
      </p>
      <p>
        <strong>Items:</strong>
        <ul>
          {orderDetails.items.map((item) => (
            <li key={item.id}>{item.name} - {item.quantity}</li>
          ))}
        </ul>
      </p>
      <p>
        <strong>Total Amount:</strong> ${orderDetails.totalAmount}
      </p>
      <button onClick={handleConfirm} disabled={orderDetails.status !== 'pending'}>
        Confirm Order
      </button>
    </div>
  );
};

export default OrderConfirmation;