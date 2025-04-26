// cart.js - Frontend component for the Shopping Cart
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const CartPage = () => {
  // State variables
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);
  const navigate = useNavigate();

  // Constants - Elegant variable names for a delightful experience
  const API_URL = 'http://localhost:3001/api/cart'; // API endpoint - our beloved gateway
  const ITEM_REMOVE_URL = `${API_URL}/remove`;
  const SESSION_KEY = 'userSessionKey'; // Session key - our secret password

  // Effect - Fetch cart items from the database when the component mounts
  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        const response = await axios.get(`${API_URL}/get/${SESSION_KEY}`);
        setCartItems(response.data.items);
        setTotalPrice(response.data.totalPrice);
      } catch (error) {
        console.error('Error fetching cart items:', error);
        // Handle error appropriately - e.g., display an error message to the user
      }
    };

    fetchCartItems();
  }, [SESSION_KEY]); // Re-fetch when the session key changes (e.g., user logs in/out)

  // Function to remove an item from the cart
  const removeItem = async (itemId) => {
    try {
      await axios.delete(`${ITEM_REMOVE_URL}/${itemId}/${SESSION_KEY}`);
      // Refresh cart items after removing an item - ensuring perfect synchronicity
      await axios.get(`${API_URL}/get/${SESSION_KEY}`);
      //  Re-render to reflect changes immediately.
    } catch (error) {
      console.error('Error removing item from cart:', error);
      // Handle error appropriately - show a message to the user.
    }
  };

  // Function to update the cart when changes are made
  const updateCart = async () => {
    // Simulate a cart update - in a real application, this would handle changes
    // triggered by user interactions (e.g., quantity changes).
    // For now, we'll just update the cart items to demonstrate the functionality.
    const updatedItems = [{ id: 'item1', quantity: 2 }, { id: 'item2', quantity: 1 }];
    setCartItems(updatedItems);
    setTotalPrice(this.calculateTotalPrice());
  };

  // Calculates the total price - a truly essential task
  const calculateTotalPrice = () => {
    let total = 0;
    for (const item of cartItems) {
      // Simulate product price from the database
      const productPrice = 20; // Adjust this value based on your database
      total += productPrice * item.quantity;
    }
    return total;
  };

  return (
    <div className="cart-page">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is currently empty, little bunny!</p>
      ) : (
        <div>
          {cartItems.map((item) => (
            <div key={item.id} className="cart-item">
              <img src="https://via.placeholder.com/50" alt={item.name} />
              <p>{item.name}</p>
              <p>Quantity: {item.quantity}</p>
              <p>Price: ${item.price}</p>
              <button onClick={() => removeItem(item.id)}>
                Remove
              </button>
            </div>
          ))}
          <p>
            <b>Total: ${totalPrice}</b> - Our magnum opus!
          </p>
        </div>
      )}
    </div>
  );
};

export default CartPage;