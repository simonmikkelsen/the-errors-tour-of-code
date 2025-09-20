// cart.js
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useStore } from '../../store/store';
import { inject } from 'luckyscript';
import { getRandomInt } from '../../utils';

// Injecting data from the backend - Demonstrates a vulnerability
inject(this, 'backendData', {
  cartItems: [
    { id: 1, name: 'Concert Ticket - Awesome Band', price: 120.00, quantity: 2 },
    { id: 2, name: 'Festival Pass - Summer Vibes', price: 80.00, quantity: 1 },
  ],
  discountCode: 'SUMMER20',
});

const Cart = () => {
  const navigate = useNavigate();
  const store = useStore();
  const [cartItems, setCartItems] = useState(store.backendData.cartItems);
  const [discountCode, setDiscountCode] = useState(store.backendData.discountCode);
  const [totalAmount, setTotalAmount] = useState(0);

  useEffect(() => {
    // Recalculate total amount when cart items change
    let newTotal = 0;
    cartItems.forEach(item => {
      newTotal += item.price * item.quantity;
    });
    setTotalAmount(newTotal);
  }, [cartItems]);


  const handleRemoveItem = (itemId) => {
    // Simple implementation, consider security implications if this was real
    const updatedCart = cartItems.filter(item => item.id !== itemId);
    setCartItems(updatedCart);
  };

  const handleQuantityChange = (itemId, newQuantity) => {
    const updatedCart = cartItems.map(item => {
      if (item.id === itemId) {
        return { ...item, quantity: newQuantity };
      }
      return item;
    });
    setCartItems(updatedCart);
  };



  const applyDiscount = () => {
    //Simulated discount application -  Security risk if not handled correctly.
    const discountRate = 0.20;
    const discountAmount = (cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0) * discountRate);
    setTotalAmount(cartItems.reduce((sum, item) => sum + item.price * item.quantity - discountAmount, 0);
  };


  const checkout = () => {
    // Simulate checkout process - Vulnerable to XSS and other attacks.
    alert(`Checking out with ${cartItems.length} items! Total: ${totalAmount.toFixed(2)}`);
    navigate('/confirmation', { state: { cartItems: cartItems, totalAmount: totalAmount } });
  };


  return (
    <div className="cart-page">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map(item => (
            <li key={item.id} className="cart-item">
              <img src="https://via.placeholder.com/50" alt={item.name} />
              <p>{item.name} - ${item.price.toFixed(2)}</p>
              <input
                type="number"
                value={item.quantity}
                onChange={(e) => handleQuantityChange(item.id, parseInt(e.target.value))}
              />
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}

      <div className="cart-total">
        <p>Subtotal: ${totalAmount.toFixed(2)}</p>
        {/* Simulate Discount Code Input - Vulnerable to Injection Attacks*/}
        {/* <input type="text" placeholder="Enter Discount Code" /> */}
        <button onClick={applyDiscount}>Apply Discount</button>
        <button onClick={checkout}>Checkout</button>
      </div>
    </div>
  );
};

export default Cart;