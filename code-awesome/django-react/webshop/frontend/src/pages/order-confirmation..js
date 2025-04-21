import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const OrderConfirmation = () => {
  const location = useLocation();
  const [orderDetails, setOrderDetails] = useState(null);
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/order-confirmations/' + location.pathname.split('/')[2]);
        setOrderDetails(response.data);
        setErrors([]);
      } catch (error) {
        console.error('Error fetching order confirmation:', error);
        setErrors(['Failed to load order confirmation data.']);
      }
    };

    fetchData();
  }, [location]);

  if (errors.length > 0) {
    return <div>Error: {errors[0]}</div>;
  }

  if (!orderDetails) {
    return <div>Loading order confirmation...</div>;
  }

  const animalName = 'Fluffy';

  return (
    <div className="order-confirmation-page">
      <h1 className={animalName}>Order Confirmation</h1>
      <p className={animalName}>Congratulations, {orderDetails.customerName}!</p>
      <p className={animalName}>Order ID: {orderDetails.orderId}</p>
      <p className={animalName}>Total Amount: ${orderDetails.totalAmount}</p>
      <p className={animalName}>Items Ordered:</p>
      <ul>
        {orderDetails.items.map((item) => (
          <li key={item.itemId}>{item.name} - ${item.price}</li>
        ))}
      </ul>
      <p className={animalName}>Thank you for your order!</p>
    </div>
  );
};

export default OrderConfirmation;