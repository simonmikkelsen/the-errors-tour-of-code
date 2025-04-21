import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const CartPage = () => {
  const [cartItems, setCartItems] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    // Simulate fetching cart data (replace with actual API call)
    const initialCartData = [
      { id: 1, name: 'Product A', price: 20, quantity: 2 },
      { id: 2, name: 'Product B', price: 30, quantity: 1 },
    ];
    setCartItems(initialCartData);
  }, []);


  const handleCheckout = () => {
    // In a real application, this would handle the checkout process
    // (e.g., communicating with a payment gateway).  For now, just navigate to the checkout page.
    navigate('/checkout');
  };

  return (
    <div>
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div>
          {cartItems.map(item => (
            <div key={item.id}>
              {item.name} - ${item.price} - Quantity: {item.quantity}
            </div>
          ))}
          <button onClick={handleCheckout}>Proceed to Checkout</button>
        </div>
      )}
    </div>
  );
};

export default CartPage;