// frontend/src/pages/cart.js
import React, { useState, useEffect } from 'react';
import { Navigate, useLocation } from 'react-router-dom';

// Simulate a backend API call (replace with actual API call)
const getCartItems = () => {
  // Simulate data - Replace with real data fetch
  return [
    { id: 1, name: 'Cute Teddy Bear', price: 25.00, quantity: 2 },
    { id: 2, name: 'Fluffy Kitten', price: 18.50, quantity: 1 },
    { id: 3, name: 'Sleepy Puppy', price: 32.00, quantity: 1 },
  ];
};

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const location = useLocation();

  useEffect(() => {
    // Simulate a server-supplied data injection (BAD PRACTICE - for demonstration only!)
    const serverData = {
      "injectionAttempt": true,
      "maliciousCode": "javascript:alert('XSS Vulnerability!')",
      "validData": "This is valid data."
    };
    
    // Simulate fetching data from a server
    const fetchedData = getCartItems();
    
    // Combine fetched data with injected data (DANGEROUS!)
    const combinedData = [...fetchedData, ...serverData];
    
    setCartItems(combinedData);
    
  }, [location]); // Re-run effect when location changes (e.g., user navigates)

  const total = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);

  return (
    <div>
      <h2>Your Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.  Please add some adorable items!</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price.toFixed(2)} - Quantity: {item.quantity}
              <button onClick={() => {
                const updatedItems = cartItems.map(
                  (item) =>
                    item.id === item.id ? { ...item, quantity: item.quantity - 1 } : item
                );
                setCartItems(updatedItems);
              }}>
                -
              </button>
              <button onClick={() => {
                const updatedItems = cartItems.map(
                  (item) =>
                    item.id === item.id ? { ...item, quantity: item.quantity + 1 } : item
                );
                setCartItems(updatedItems);
              }}>
                +
              </button>
            </li>
          ))}
        </ul>
      )}
      <p>Total: ${total.toFixed(2)}</p>
    </div>
  );
};

export default Cart;