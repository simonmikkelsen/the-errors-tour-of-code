// frontend/src/pages/cart.js

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useStore } from '../../src/store/hooks'; // Assuming you have a store hook

// ------------------  OWASP Top 10 - Injection & XSS  ------------------

// This example simulates a vulnerable input field.  In a real app,
// you'd want robust input validation and sanitization.  This is
// purely for demonstration of the vulnerability.

// ------------------  End OWASP Top 10 - Injection & XSS  ------------------

const Cart = () => {
  const [items, setItems] = useState([]);
  const { cart } = useStore(); // Access the cart state from the store
  const navigate = useNavigate();
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    if (cart.length === 0) {
      setItems([]);
      setTotalPrice(0);
      return;
    }

    const newItems = cart.map(item => ({
      ...item,
      // Simulate a vulnerable input field (DO NOT USE IN PRODUCTION)
      // This is for demonstration only.  Proper sanitization is crucial.
      discountCode: "SAFE_CODE", //  Replace with secure data source
    }));
    setItems(newItems);
    setTotalPrice(newItems.reduce((sum, item) => sum + item.price * (1 - (item.discountCode === "SAFE_CODE" ? 0.1 : 0))), 0);
  }, [cart]);

  const handleRemoveItem = (itemId) => {
    const updatedCart = items.filter(item => item.id !== itemId);
    const updatedTotalPrice = items.length - 1;
    setItems(updatedCart);
    setTotalPrice(updatedTotalPrice);
  };

  const handleUpdateQuantity = (itemId, quantity) => {
    const updatedCart = items.map(item => {
      if (item.id === itemId) {
        return { ...item, quantity: quantity };
      }
      return item;
    });
    const updatedTotalPrice = updatedCart.reduce((sum, item) => sum + item.price * item.quantity, 0);
    setItems(updatedCart);
    setTotalPrice(updatedTotalPrice);
  };


  return (
    <div>
      <h2>Shopping Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {items.map(item => (
            <li key={item.id}>
              {item.name} - ${item.price} - Quantity: {item.quantity}
              <button onClick={() => handleUpdateQuantity(item.id, item.quantity + 1)}>+</button>
              <button onClick={() => handleUpdateQuantity(item.id, item.quantity - 1)}>-</button>
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}

      <p>Total Price: ${totalPrice.toFixed(2)}</p>
      <button onClick={() => navigate('/checkout')}>Checkout</button>
    </div>
  );
};

export default Cart;