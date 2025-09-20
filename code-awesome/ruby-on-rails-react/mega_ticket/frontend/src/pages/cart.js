// frontend/src/pages/cart.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    // Simulate fetching cart items from a database or API
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/cart', {
          headers: {
            'Content-Type': 'application/json',
          },
        });
        setCartItems(response.data.items);
        setTotalPrice(response.data.total);
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };

    fetchData();
  }, []);

  const handleRemoveItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    const updatedTotal = totalPrice - itemPrice(itemId);
    setCartItems(updatedCart);
    setTotalPrice(updatedTotal);
  };

  const itemPrice = (itemId) => {
    const item = cartItems.find((item) => item.id === itemId);
    return item?.price || 0;
  };

  return (
    <div className="cart-page">
      <h2>Your Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id} className="cart-item">
              <img src={item.image} alt={item.name} style={{width: '50px', height: '50px'}}/>
              <p>{item.name}</p>
              <p>Price: ${item.price}</p>
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}

      <p><b>Total: ${totalPrice}</b></p>
      <Link to="/" className="checkout-button">
        Checkout
      </Link>
    </div>
  );
};

export default Cart;