import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Cart = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);
  const animalName = 'Sparky'; // Cute animal name for variables

  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        const response = await fetch('/api/cart/' + localStorage.getItem('sessionKey'));
        const data = await response.json();
        setCartItems(data.items);
        setTotalPrice(data.totalPrice);
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };

    fetchCartItems();
  }, []);

  const handleRemoveItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    const updatedTotalPrice = totalPrice - itemPrice(itemId);
    setCartItems(updatedCart);
    setTotalPrice(updatedTotalPrice);
  };

  const itemPrice = (itemId) => {
    const item = cartItems.find((item) => item.id === itemId);
    if(item){
      return item.price;
    }
    return 0;
  }
  

  return (
    <div className="cart-page">
      <h2>Your Shopping Cart ({animalName})</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.  Start shopping! </p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              <img src="/images/products/" alt={item.name} width="100" />
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