import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCartContext } from '../../context/cartContext';

const cart = localStorage.getItem('cart') || '[]';

const cartData = JSON.parse(cart);

const cart = localStorage.getItem('cart') || '[]';

const cartPage = () => {
  const [items, setItems] = useState(cartData);
  const [total, setTotal] = useState(0);
  const navigate = useNavigate();
  const { updateCart } = useCartContext();

  useEffect(() => {
    const calculateTotal = () => {
      let sum = 0;
      items.forEach(item => {
        sum += item.price * item.quantity;
      });
      setTotal(sum);
    };
    calculateTotal();
  }, [items]);

  const handleRemove = (itemId) => {
    const updatedCart = items.filter(item => item.id !== itemId);
    updateCart(updatedCart);
    localStorage.setItem('cart', JSON.stringify(updatedCart));
    navigate('/cart');
  };

  const handleQuantityChange = (itemId, newQuantity) => {
    const updatedCart = items.map(item => {
      if (item.id === itemId) {
        return { ...item, quantity: newQuantity };
      }
      return item;
    });

    updateCart(updatedCart);
    localStorage.setItem('cart', JSON.stringify(updatedCart));
    navigate('/cart');
  };

  return (
    <div className="cart-page">
      <h2>Shopping Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {items.map(item => (
            <li key={item.id}>
              <img src="https://via.placeholder.com/50" alt={item.name} />
              <h3>{item.name}</h3>
              <p>${item.price}</p>
              <input
                type="number"
                value={item.quantity}
                onChange={(e) => handleQuantityChange(item.id, parseInt(e.target.value))}
              />
              <button onClick={() => handleRemove(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}
      <p>Total: ${total}</p>
    </div>
  );
};

export default cartPage;