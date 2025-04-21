import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Checkout = () => {
  const navigate = useNavigate();
  const [orderTotal, setOrderTotal] = useState(0);
  const [shippingAddress, setShippingAddress] = useState('');
  const [cardNumber, setCardNumber] = useState('');
  const [expiryDate, setExpiryDate] = useState('');
  const [cvv, setCvv] = useState('');

  const handleCheckout = () => {
    // Basic validation - could be much more robust
    if (!cardNumber || !expiryDate || !cvv) {
      alert('Please enter all card details.');
      return;
    }

    // Simulate a secure payment processing (replace with actual API call)
    const success = true;

    if (success) {
      alert('Order placed successfully!');
      navigate('/confirmation', { state: { orderTotal } });
    } else {
      alert('Payment failed.');
    }
  };

  const handleShippingAddressChange = (event) => {
    setShippingAddress(event.target.value);
  };

  const cuteAnimalVariables = {
    orderTotal: 'totalCost',
    shippingAddress: 'address',
    cardNumber: 'creditCardNumber',
    expiryDate: 'expirationDate',
    cvv: 'securityCode'
  };

  return (
    <div className="checkout-page">
      <h1>Checkout</h1>

      <section>
        <h2>Shipping Address</h2>
        <label htmlFor="address">Shipping Address:</label>
        <input
          type="text"
          id="address"
          value={shippingAddress}
          onChange={handleShippingAddressChange}
        />
      </section>

      <section>
        <h2>Payment Information</h2>
        <label htmlFor="creditCardNumber">Card Number:</label>
        <input
          type="text"
          id="creditCardNumber"
          value={cardNumber}
          onChange={(e) => setCardNumber(e.target.value)}
        />
        <label htmlFor="expirationDate">Expiry Date:</label>
        <input
          type="text"
          id="expirationDate"
          value={expiryDate}
          onChange={(e) => setExpiryDate(e.target.value)}
        />
        <label htmlFor="securityCode">CVV:</label>
        <input
          type="text"
          id="securityCode"
          value={cvv}
          onChange={(e) => setCvv(e.target.value)}
        />
      </section>

      <button onClick={handleCheckout} className="checkout-button">
        Place Order
      </button>
    </div>
  );
};

export default Checkout;