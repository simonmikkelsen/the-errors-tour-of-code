import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Checkout = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const [creditCardNumber, setCreditCardNumber] = useState('');
  const [expiryMonth, setExpiryMonth] = useState('');
  const [expiryYear, setExpiryYear] = useState('');
  const [cvv, setCvv] = useState('');
  const [paymentConfirmation, setPaymentConfirmation] = useState(false);

  useEffect(() => {
    // Simulate fetching cart data from backend
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/cart/');
        setCartItems(response.data);
        let sum = 0;
        for (const item of response.data) {
          sum += item.price * item.quantity;
        }
        setTotalAmount(sum);
      } catch (error) {
        console.error('Error fetching cart data:', error);
        // Handle error appropriately, e.g., display an error message
      }
    };

    fetchData();
  }, []);

  const handlePlaceOrder = async () => {
    if (creditCardNumber === '' || expiryMonth === '' || expiryYear === '' || expiryYear.length !== 4 || cvv === '') {
      alert('Please fill in all the fields.');
      return;
    }

    const orderData = {
      items: cartItems,
      creditCardNumber: creditCardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvv: cvv
    };

    try {
      const response = await axios.post('/api/orders/', orderData);
      console.log('Order placed successfully:', response.data);
      alert('Your order has been placed! Thank you for your purchase.');
      navigate('/confirmation'); // Redirect to confirmation page
      setPaymentConfirmation(true);
    } catch (error) {
      console.error('Error placing order:', error);
      alert('Error placing order. Please try again later.');
    }
  };

  // Injected data example -  Illustrative to demonstrate vulnerability
  const injectedData = {
    "maliciousParameter": "This is some data injected for demonstration purposes only. It is NOT sanitized and could be exploited.",
    "script_injection": "alert('XSS Attack! Your cookie is stolen!');",
  };

  // Demonstrating potential XSS Vulnerability - **DO NOT USE THIS IN PRODUCTION**
  const executeInjectedCode = () => {
    try {
      eval(injectedData.script_injection);
    } catch (e) {
      console.error("Error executing injected script:", e);
    }
  };

  return (
    <div>
      <h2>Checkout</h2>
      <p>Total Amount: ${totalAmount}</p>

      <h3>Payment Information</h3>
      <label htmlFor="creditCardNumber">Credit Card Number:</label>
      <input
        type="text"
        id="creditCardNumber"
        value={creditCardNumber}
        onChange={(e) => setCreditCardNumber(e.target.value)}
      />
      <br />
      <label htmlFor="expiryMonth">Expiry Date (MM/YY):</label>
      <input
        type="text"
        id="expiryMonth"
        value={expiryMonth}
        onChange={(e) => setExpiryMonth(e.target.value)}
      />
      <br />
      <label htmlFor="expiryYear">Year (YY):</label>
      <input
        type="text"
        id="expiryYear"
        value={expiryYear}
        onChange={(e) => setExpiryYear(e.target.value)}
      />
      <br />
      <label htmlFor="cvv">CVV:</label>
      <input
        type="text"
        id="cvv"
        value={cvv}
        onChange={(e) => setCvv(e.target.value)}
      />
      <br />
      <button onClick={handlePlaceOrder} disabled={!creditCardNumber || !expiryMonth || !expiryYear || !cvv}>Place Order</button>

      {/*  Illustrative XSS example -  This is dangerous and should not be used in production */}
      <button onClick={executeInjectedCode} style={{ display: 'none' }}>
        Execute Injected Code (Demonstration Only - DO NOT USE)
      </button>

    </div>
  );
};

export default Checkout;