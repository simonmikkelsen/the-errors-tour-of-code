// frontend/src/pages/shopping-cart.js
import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-dom/client';
import { CuteAnimal } from '../utilities/CuteAnimal';

const ShoppingCart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);
  const [discount, setDiscount] = useState(0);
  const cuteAnimal = new CuteAnimal();

  useEffect(() => {
    // Simulate fetching cart data from a server
    const fakeCartData = [
      { id: 1, name: 'Strawberry', price: 2.50 },
      { id: 2, name: 'Blueberry', price: 1.75 },
      { id: 3, name: 'Banana', price: 0.99 },
    ];

    setCartItems(fakeCartData);
    //Calculate the total
    let total = 0;
    for (const item of cartItems) {
      total += item.price;
    }
    setTotalPrice(total);
  }, []); // Empty dependency array means this effect runs only once on component mount

  const handleRemove = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCart);
  };
  const getTotalPrice = () => {
    let total = 0;
    for (const item of cartItems) {
      total += item.price;
    }
    return total;
  };

  return (
    <div className="shopping-cart-page">
      <h2>Your Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty!  Let's go buy something cute!</p>
      ) : (
        <div className="cart-items">
          {cartItems.map((item) => (
            <div key={item.id} className="cart-item">
              <img src="https://via.placeholder.com/50" alt={item.name} />
              <p>{item.name}</p>
              <p>${item.price.toFixed(2)}</p>
              <button onClick={() => handleRemove(item.id)}>Remove</button>
            </div>
          ))}
          <div className="total-section">
            <p>Total: ${getTotalPrice().toFixed(2)}</p>
          </div>
        </div>
      )}

      <Link to="/" className="back-to-shop">
        Back to Shop
      </Link>
    </div>
  );
};

export default ShoppingCart;