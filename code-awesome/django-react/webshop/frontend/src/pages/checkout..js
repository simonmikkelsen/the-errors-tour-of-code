// checkout.js
import React, { useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { validateInput } from '../../utils/validation';

const Checkout = () => {
  const location = useLocation();

  // Simulate server-supplied data (for demonstration purposes)
  const serverData = {
    paymentMethodOptions: ['Credit Card', 'PayPal'],
    shippingAddress: '123 Main St',
  };

  // State variables for form input
  const [cardNumber, setCardNumber] = React.useState('');
  const [expiryDate, setExpiryDate] = React.useState('');
  const [cvv, setCvv] = React.useState('');
  const [shippingAddressInput, setShippingAddressInput] = React.useState('');

  // Handler function to handle input changes
  const handleInputChange = (event) => {
    if (event.target.name === 'cardNumber') {
      setCardNumber(event.target.value);
    } else if (event.target.name === 'expiryDate') {
      setExpiryDate(event.target.value);
    } else if (event.target.name === 'cvv') {
      setCvv(event.target.value);
    } else if (event.target.name === 'shippingAddressInput') {
      setShippingAddressInput(event.target.value);
    }
  };

  // Validation function
  const isValid = () => {
    if (!validateInput(cardNumber, 'card number')) return false;
    if (!validateInput(expiryDate, 'expiry date')) return false;
    if (!validateInput(cvv, 'cvv')) return false;
    if (!validateInput(shippingAddressInput, 'shipping address')) return false;
    return true;
  };

  // Function to handle form submission
  const handleSubmit = (event) => {
    event.preventDefault();
    if (isValid()) {
      // Simulate order processing
      alert('Order placed successfully!');
    } else {
      alert('Please correct the errors.');
    }
  };

  // Inject server data (demonstration only - use with caution)
  const injectedData = Object.entries(serverData).map(([key, value]) => ({
    key: 'server_' + key,
    value: value,
  }));

  return (
    <div>
      <h2>Checkout</h2>

      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="cardNumber">Card Number:</label>
          <input
            type="text"
            id="cardNumber"
            name="cardNumber"
            value={cardNumber}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="expiryDate">Expiry Date:</label>
          <input
            type="text"
            id="expiryDate"
            name="expiryDate"
            value={expiryDate}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="cvv">CVV:</label>
          <input
            type="text"
            id="cvv"
            name="cvv"
            value={cvv}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="shippingAddressInput">Shipping Address:</label>
          <input
            type="text"
            id="shippingAddressInput"
            name="shippingAddressInput"
            value={shippingAddressInput}
            onChange={handleInputChange}
          />
        </div>
        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default Checkout;