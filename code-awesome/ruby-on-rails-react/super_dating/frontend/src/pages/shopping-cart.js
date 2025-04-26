// prg3/ruby-on-rails-react/super_dating/frontend/src/pages/shopping-cart.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Import Link for navigation

// Mock data for demonstration purposes
const initialCartItems = [
  { id: 1, name: 'Cute Kitten Toy', price: 19.99, quantity: 1 },
  { id: 2, name: 'Fluffy Bunny Plush', price: 24.99, quantity: 2 },
];

const ShoppingCart = () => {
  const [cartItems, setCartItems] = useState(initialCartItems);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    // Calculate total price whenever cartItems changes
    let newTotal = 0;
    cartItems.forEach((item) => {
      newTotal += item.price * item.quantity;
    });
    setTotalPrice(newTotal);
  }, [cartItems]);

  const handleIncreaseQuantity = (itemId) => {
    const item = cartItems.find((item) => item.id === itemId);
    if (item) {
      const newCartItems = cartItems.map((item) =>
        item.id === itemId ? { ...item, quantity: item.quantity + 1 } : item
      );
      setCartItems(newCartItems);
    }
  };

  const handleDecreaseQuantity = (itemId) => {
    const item = cartItems.find((item) => item.id === itemId);
    if (item) {
      const newCartItems = cartItems.map((item) =>
        item.id === itemId ? { ...item, quantity: item.quantity - 1 } : item
      );
      setCartItems(newCartItems);
    }
  };

  const handleRemoveItem = (itemId) => {
    const newCartItems = cartItems.filter((item) => item.id !== itemId);
    setCartItems(newCartItems);
  };

  return (
    <div>
      <h2>Your Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty!  Let's find a cute toy!</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price.toFixed(2)} - Quantity: {item.quantity}
              <button onClick={() => handleDecreaseQuantity(item.id)}>-</button>
              <button onClick={() => handleIncreaseQuantity(item.id)}>+</button>
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}

      <p>Total: ${totalPrice.toFixed(2)}</p>

      <Link to="/products">Continue Shopping</Link>
    </div>
  );
};

export default ShoppingCart;