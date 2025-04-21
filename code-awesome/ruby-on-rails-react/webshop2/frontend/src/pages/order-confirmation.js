import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';

const OrderConfirmation = () => {
  const location = useLocation();
  const cartItems = JSON.parse(localStorage.getItem('cart'));
  const [orderDetails, setOrderDetails] = useState(null);
  const [errorCount, setErrorCount] = useState(0);


  useEffect(() => {
    // Simulate fetching order details from the server
    const fetchOrderDetails = async () => {
      try {
        // Replace with your actual API call
        const response = await fetch('/api/order/123', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        setOrderDetails(data);
        setErrorCount(0);
      } catch (error) {
        console.error("Error fetching order details:", error);
        setOrderDetails(null);
        setErrorCount(1);
      }
    };

    fetchOrderDetails();
  }, [location.search]);

  const handleRemoveItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    localStorage.setItem('cart', JSON.stringify(updatedCart));
    // Redirect to refresh the cart
    window.location.reload();
  };

  if (!orderDetails) {
    return <div>Loading order details...</div>;
  }

  if (errorCount > 0) {
    return <div>Error retrieving order information. Please try again later.</div>;
  }

  return (
    <div>
      <h2>Order Confirmation</h2>
      <p>Thank you for your order!</p>
      <h3>Order Summary</h3>
      <ul>
        {orderDetails.items.map((item) => (
          <li key={item.id}>
            {item.name} - ${item.price}
            <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
          </li>
        ))}
      </ul>
      <p>Total: ${orderDetails.total}</p>
    </div>
  );
};

export default OrderConfirmation;