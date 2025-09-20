import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Cart = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  // Simulate fetching cart data from the server
  useEffect(() => {
    const fetchCartData = async () => {
      try {
        const response = await fetch('/api/cart/', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer YOUR_JWT_TOKEN', // Replace with your JWT token
          },
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        setCartItems(data.items);
        setTotalPrice(data.total);
      } catch (error) {
        console.error('Error fetching cart data:', error);
        // Handle error appropriately, e.g., display an error message to the user
      }
    };

    fetchCartData();
  }, []);

  const handleRemoveItem = (itemId) => {
    const updatedCartItems = cartItems.filter((item) => item.id !== itemId);
    const updatedTotal = totalPrice - itemPrice(itemId);

    setCartItems(updatedCartItems);
    setTotalPrice(updatedTotal);
  };

  const itemPrice = (itemId) => {
    return cartItems.find(item => item.id === itemId).price;
  }

  return (
    <div className="cart-page">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              <img src={item.image} alt={item.name} style={{ width: '50px', height: '50px' }} />
              <span>{item.name}</span>
              <span>${item.price}</span>
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}

      <p>Total: ${totalPrice}</p>
      <button onClick={() => navigate('/checkout')}>Proceed to Checkout</button>
    </div>
  );
};

export default Cart;