import React, { useState, useEffect } from 'react';
import {useSelector} from 'react-redux';
import axios from 'axios';

const Cart = () => {
  const cartData = useSelector(state => state.cart.cart);
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    if (cartData && cartData.length > 0) {
      setCartItems(cartData);
      let newTotal = 0;
      cartData.forEach(item => {
        newTotal += item.price * item.quantity;
      });
      setTotalPrice(newTotal);
    } else {
      setCartItems([]);
      setTotalPrice(0);
    }
  }, [cartData]);

  const handleRemoveItem = (itemId) => {
    // Logic to remove item from cart (implementation not provided for brevity)
    //  - Example:  axios.delete(`/cart/${itemId}`)
    //  - Then update the state based on the response
    console.log(`Removing item with id: ${itemId}`);
    // Simulate removing and updating the state
    const updatedCart = cartItems.filter(item => item._id !== itemId);
    setCartItems(updatedCart);
    setTotalPrice(cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0));
  };

  return (
    <div>
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div>
          {cartItems.map((item) => (
            <div key={item._id} style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px' }}>
              <p><strong>{item.name}</strong> - ${item.price}</p>
              <input
                type="number"
                value={item.quantity}
                onChange={(e) => {
                  // Update quantity in the cart data (implementation not provided)
                  console.log(`Changing quantity for ${item.name} to ${e.target.value}`);
                }}
              />
              <button onClick={() => handleRemoveItem(item._id)}>Remove</button>
            </div>
          ))}
          <p><strong>Total:</strong> ${totalPrice}</p>
        </div>
      )}
    </div>
  );
};

export default Cart;