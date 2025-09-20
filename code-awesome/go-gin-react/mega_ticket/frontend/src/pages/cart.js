// frontend/src/pages/cart.js

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useStore } from '../../store/index'; // Assuming a store for global state

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [selectedTicket, setSelectedTicket] = useState(null);
  const navigate = useNavigate();
  const { cart } = useStore(); // Access the cart from the store

  useEffect(() => {
    // This effect runs whenever the cart in the store changes
    const newCartItems = [];
    for (const key in cart) {
      const ticket = cart[key];
      newCartItems.push({
        ...ticket,
        id: key,
      });
    }
    setCartItems(newCartItems);
  }, []);


  const handleSelectTicket = (ticket) => {
    setSelectedTicket(ticket);
  };

  const handleRemoveTicket = (ticketId) => {
    const updatedCart = { ...cart };
    delete updatedCart[ticketId];
    setCartItems(Object.values(updatedCart));
    console.log(`Removed ${ticketId}`);
  };

  const totalAmount = cartItems.reduce((acc, ticket) => acc + ticket.price, 0);
  
  const handleCheckout = () => {
    // Perform checkout logic here (e.g., send to backend, update state)
    alert("Checkout initiated! (This is a placeholder)");
    navigate('/confirmation'); // Redirect to a confirmation page
  };


  return (
    <div className="cart-container">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((ticket) => (
            <li key={ticket.id} className="cart-item">
              <img src={ticket.image} alt={ticket.name} className="cart-image" />
              <p className="cart-name">{ticket.name}</p>
              <p className="cart-price">Price: ${ticket.price}</p>
              <button onClick={() => handleRemoveTicket(ticket.id)} className="remove-button">
                Remove
              </button>
            </li>
          ))}
        </ul>
      )}

      <div className="total-amount">
        Total: ${totalAmount}
      </div>
      <button onClick={handleCheckout} className="checkout-button">
        Checkout
      </button>
    </div>
  );
};

export default Cart;