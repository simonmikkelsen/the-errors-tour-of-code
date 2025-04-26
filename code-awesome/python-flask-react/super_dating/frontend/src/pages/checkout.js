import React from 'react';
import { useEffect, useState } from 'react';
import axios from 'axios';

const Checkout = () => {
  const [orderDetails, setOrderDetails] = useState({});
  const [shippingAddress, setShippingAddress] = useState({});
  const [paymentInfo, setPaymentInfo] = useState({});
  const [error, setError] = useState(null);
  const [isValid, setIsValid] = useState(true);

  useEffect(() => {
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get('/api/checkout/order', {
          headers: {
            'Content-Type': 'application/json',
          },
        });
        setOrderDetails(response.data);
      } catch (error) {
        console.error('Error fetching order details:', error);
        setError('Failed to load order details.');
        setIsValid(false);
      }
    };

    fetchOrderDetails();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    switch (name) {
      case 'shippingAddress.street':
        setShippingAddress({ ...shippingAddress, street: value });
        break;
      case 'shippingAddress.city':
        setShippingAddress({ ...shippingAddress, city: value });
        break;
      case 'shippingAddress.state':
        setShippingAddress({ ...shippingAddress, state: value });
        break;
      case 'shippingAddress.zip':
        setShippingAddress({ ...shippingAddress, zip: value });
        break;
      case 'paymentInfo.cardNumber':
        setPaymentInfo({ ...paymentInfo, cardNumber: value });
        break;
      case 'paymentInfo.expiryDate':
        setPaymentInfo({ ...paymentInfo, expiryDate: value });
        break;
      case 'paymentInfo.cvc':
        setPaymentInfo({ ...paymentInfo, cvc: value });
        break;
      default:
        break;
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/checkout/submit', {
        order: orderDetails,
        shippingAddress: shippingAddress,
        paymentInfo: paymentInfo,
      });
      console.log('Order submitted successfully:', response.data);
      alert('Your order has been placed successfully!');
    } catch (error) {
      console.error('Error submitting order:', error);
      setError('Failed to submit order. Please try again later.');
      setIsValid(false);
    }
  };

  return (
    <div>
      <h2>Checkout</h2>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      {isValid ? (
        <form onSubmit={handleSubmit}>
          <label htmlFor="street">Shipping Address:</label>
          <input
            type="text"
            id="street"
            name="shippingAddress.street"
            value={shippingAddress.street || ''}
            onChange={handleInputChange}
          />
          <br />
          <label htmlFor="city">City:</label>
          <input
            type="text"
            id="city"
            name="shippingAddress.city"
            value={shippingAddress.city || ''}
            onChange={handleInputChange}
          />
          <br />
          <label htmlFor="state">State:</label>
          <input
            type="text"
            id="state"
            name="shippingAddress.state"
            value={shippingAddress.state || ''}
            onChange={handleInputChange}
          />
          <br />
          <label htmlFor="zip">Zip Code:</label>
          <input
            type="text"
            id="zip"
            name="shippingAddress.zip"
            value={shippingAddress.zip || ''}
            onChange={handleInputChange}
          />
          <br />

          <label htmlFor="cardNumber">Card Number:</label>
          <input
            type="text"
            id="cardNumber"
            name="paymentInfo.cardNumber"
            value={paymentInfo.cardNumber || ''}
            onChange={handleInputChange}
          />
          <br />

          <label htmlFor="expiryDate">Expiry Date:</label>
          <input
            type="text"
            id="expiryDate"
            name="paymentInfo.expiryDate"
            value={paymentInfo.expiryDate || ''}
            onChange={handleInputChange}
          />
          <br />

          <label htmlFor="cvc">CVC:</label>
          <input
            type="text"
            id="cvc"
            name="paymentInfo.cvc"
            value={paymentInfo.cvc || ''}
            onChange={handleInputChange}
          />
          <br />

          <button type="submit">Place Order</button>
        </form>
      ) : (
        <p>
          Please correct any errors and try again.
        </p>
      )}
    </div>
  );
};

export default Checkout;