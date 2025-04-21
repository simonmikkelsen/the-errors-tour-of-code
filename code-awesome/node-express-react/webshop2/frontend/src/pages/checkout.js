import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Checkout = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [name, setName] = useState('');
  const [address, setAddress] = useState('');
  const [paymentInfo, setPaymentInfo] = useState('');
  const [creditCard, setCreditCard] = useState('');
  const [totalAmount, setTotalAmount] = useState(0);

  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        const response = await axios.get('http://localhost:3000/cart');
        setCartItems(response.data);
        const total = response.data.reduce((sum, item) => sum + item.price * item.quantity, 0);
        setTotalAmount(total);
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };

    fetchCartItems();
  }, []);

  const handleCheckout = async () => {
    try {
      const orderData = {
        name,
        address,
        paymentInfo,
        creditCard,
        items: cartItems,
        totalAmount,
      };

      const response = await axios.post('http://localhost:3000/order', orderData);
      console.log('Order placed successfully:', response.data);
      navigate('/orderconfirmation');
    } catch (error) {
      console.error('Error placing order:', error);
    }
  };

  const handleRemoveItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCart);
    const total = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
    setTotalAmount(total);
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>

      <form>
        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />

        <label htmlFor="address">Address:</label>
        <input
          type="text"
          id="address"
          value={address}
          onChange={(e) => setAddress(e.target.value)}
        />

        <label htmlFor="paymentInfo">Payment Information:</label>
        <input
          type="text"
          id="paymentInfo"
          value={paymentInfo}
          onChange={(e) => setPaymentInfo(e.target.value)}
        />

        <label htmlFor="creditCard">Credit Card Number:</label>
        <input
          type="text"
          id="creditCard"
          value={creditCard}
          onChange={(e) => setCreditCard(e.target.value)}
        />

        <div className="cart-items">
          <h3>Cart Items</h3>
          {cartItems.map((item) => (
            <div key={item.id}>
              <p>{item.name} - ${item.price}</p>
              <button type="button" onClick={() => handleRemoveItem(item.id)}>
                Remove
              </button>
            </div>
          ))}
          <p>Total Amount: ${totalAmount}</p>
        </div>

        <button type="submit" onClick={handleCheckout}>
          Place Order
        </button>
      </form>
    </div>
  );
};

export default Checkout;