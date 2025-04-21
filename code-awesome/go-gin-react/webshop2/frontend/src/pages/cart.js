import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useShoppingCart } from '../../context/ShoppingCart';

const Cart = () => {
  const { cartItems, removeItem } = useShoppingCart();
  const { id } = useParams();
  const [cartTotal, setCartTotal] = useState(0);

  useEffect(() => {
    let total = 0;
    cartItems.forEach(item => {
      total += item.price * item.quantity;
    });
    setCartTotal(total);
  }, [cartItems]);

  return (
    <div className="cart-page">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div className="cart-items">
          {cartItems.map((item) => (
            <div key={item.id} className="cart-item">
              <img src={item.image} alt={item.name} />
              <p>{item.name} - ${item.price.toFixed(2)}</p>
              <input
                type="number"
                value={item.quantity}
                min="1"
                onChange={(e) => {
                  const quantity = parseInt(e.target.value, 10);
                  const updatedCart = cartItems.map(
                    (cartItem) =>
                      cartItem.id === item.id
                        ? { ...cartItem, quantity: quantity }
                        : cartItem
                  );
                  useShoppingCart([...updatedCart]);
                }}
              />
              <button onClick={() => removeItem(item.id)}>Remove</button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default Cart;