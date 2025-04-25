// frontend/src/pages/cart.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);
  const [shippingCost, setShippingCost] = useState(0);
  const [discount, setDiscount] = useState(0);
  const [finalPrice, setFinalPrice] = useState(0);

  useEffect(() => {
    // Fetch cart items from backend
    const fetchCartItems = async () => {
      try {
        const response = await axios.get('/api/cart/');
        setCartItems(response.data);
        calculateTotal();
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };

    fetchCartItems();
  }, []);

  const calculateTotal = () => {
    let total = 0;
    for (const item of cartItems) {
      total += item.price * item.quantity;
    }
    setTotalPrice(total);
    setFinalPrice(total - (total * discount/100));
  };

  const handleQuantityChange = (itemId, quantity) => {
    const updatedCart = cartItems.map((item) => {
      if (item.id === itemId) {
        return { ...item, quantity: parseInt(quantity) };
      }
      return item;
    });
    setCartItems(updatedCart);
    calculateTotal();
  };

  const removeItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCart);
    calculateTotal();
  };
  
  const totalWithShipping = finalPrice + shippingCost;
  
  return (
    <div className="cart-page">
      <h2>My Shopping Cart</h2>
      
      {finalPrice > 0 ? (
        <>
          {cartItems.length === 0 ? (
            <p>Your cart is empty</p>
          ) : (
            <ul>
              {cartItems.map((item) => (
                <li key={item.id}>
                  <img src={item.image} alt={item.name} width="100" />
                  <h3>{item.name}</h3>
                  <p>Price: ${item.price}</p>
                  <label htmlFor={`quantity-${item.id}`}>Quantity:</label>
                  <input
                    type="number"
                    id={`quantity-${item.id}`}
                    min="1"
                    value={item.quantity}
                    onChange={(e) => handleQuantityChange(item.id, e.target.value)}
                  />
                  <p>Subtotal: ${item.price * item.quantity}</p>
                </li>
              ))}
            </ul>
            <button>Proceed to Checkout</button>
          )}
        </>
      ) : (
        <p>Fetching cart data...</p>
      )}
    </div>
  );
};

export default Cart;