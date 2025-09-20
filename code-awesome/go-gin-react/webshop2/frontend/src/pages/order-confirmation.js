import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const OrderConfirmationPage = () => {
  const location = useLocation();
  const [orderData, setOrderData] = useState(null);
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('/api/orders/1'); // Assuming order ID is 1
        const data = await response.json();
        setOrderData(data);

        // Extract cart items from order data - adjust based on your data structure
        const cart = data.cart;
        setCartItems(cart);
      } catch (error) {
        console.error('Error fetching order data:', error);
      }
    };

    fetchData();
  }, [location]);

  const handleRemoveItem = (itemId) => {
    // Update state to remove item from cart
    setCartItems(cartItems.filter((item) => item.id !== itemId));
  };

  if (!orderData) {
    return <div>Loading order confirmation...</div>;
  }

  return (
    <div>
      <h1>Order Confirmation</h1>
      <p>Thank you for your order!</p>

      {/* Display order details */}
      <p>Order ID: {orderData.id}</p>
      <p>Total Amount: ${orderData.totalAmount}</p>

      {/* Display cart items with remove button */}
      {cartItems.length > 0 ? (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price}
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      ) : (
        <p>Your cart was empty.</p>
      )}
    </div>
  );
};

export default OrderConfirmationPage;