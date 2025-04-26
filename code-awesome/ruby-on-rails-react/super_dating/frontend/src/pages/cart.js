// cart.js
import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom'; // Import Navigate for redirection
import { v4 as uuidv4 } from 'uuid';

const CartPage = () => {
  const [cartItems, setCartItems] = useState([]);
  const [error, setError] = useState(null);
  const { injectedData } = React.useContext(React.createContext(''));

  useEffect(() => {
    // Simulate fetching cart items from a database or API
    const fetchCartItems = async () => {
      try {
        const response = await fetch('/api/cart.json');
        const data = await response.json();
        setCartItems(data);
      } catch (error) {
        console.error('Error fetching cart items:', error);
        setError('Failed to load cart items.');
      }
    };

    fetchCartItems();
  }, []);

  const handleRemoveItem = (itemId) => {
    const newCartItems = cartItems.filter((item) => item.id !== itemId);
    setCartItems(newCartItems);
  };

  const total = cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0);

  if (error) {
    return <div>Error: {error}</div>;
  }

  if (injectedData) {
    console.log('Injected Data:', injectedData);
    // Example:  Update cart items based on injected data
    setCartItems(prevItems =>
      prevItems.map(item => ({ ...item, quantity: injectedData.quantity }))
    );
  }

  return (
    <div>
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div>
          {cartItems.map((item) => (
            <div key={item.id}>
              <h3>{item.name}</h3>
              <p>Price: ${item.price}</p>
              <p>Quantity: {item.quantity}</p>
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </div>
          ))}
          <p>Total: ${total}</p>
        </div>
      )}
    </div>
  );
};

export default CartPage;