import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from '../../context/formContext';
import { validateForm } from '../../utils/formValidation';

const checkout = () => {
  const { cartItems, totalPrice, setEmptyCart } = useFormContext();
  const navigate = useNavigate();
  const [error, setError] = useState('');
  const [paymentDetails, setPaymentDetails] = useState({
    cardNumber: '',
    expiryDate: '',
    cvv: '',
  });

  useEffect(() => {
    if (cartItems.length === 0) {
      navigate('/home');
    }
  }, [cartItems, navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const validationResult = validateForm(paymentDetails);
    if (validationResult.errors) {
      setError(validationResult.errors.join('\n'));
      return;
    }
    try {
      // Simulate payment processing (replace with actual API call)
      const response = await fetch('/api/payment', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          cardNumber: paymentDetails.cardNumber,
          expiryDate: paymentDetails.expiryDate,
          cvv: paymentDetails.cvv,
          totalPrice: totalPrice,
        }),
      });

      if (response.ok) {
        // Payment successful
        console.log('Payment successful!');
        setEmptyCart();
        navigate('/confirmation');
      } else {
        // Payment failed
        console.error('Payment failed:', response.status, response.statusText);
        setError('Payment failed. Please try again later.');
      }
    } catch (err) {
      console.error('Error during payment:', err);
      setError('An unexpected error occurred during payment.');
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    setPaymentDetails({
      ...paymentDetails,
      [name]: value,
    });
  };

  return (
    <div className="checkout-container">
      <h2>Confirm Payment</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="cardNumber">Card Number</label>
          <input
            type="text"
            id="cardNumber"
            name="cardNumber"
            placeholder="Card Number"
            value={paymentDetails.cardNumber}
            onChange={handleInputChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="expiryDate">Expiry Date (MM/YY)</label>
          <input
            type="text"
            id="expiryDate"
            name="expiryDate"
            placeholder="MM/YY"
            value={paymentDetails.expiryDate}
            onChange={handleInputChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="cvv">CVV</label>
          <input
            type="text"
            id="cvv"
            name="cvv"
            placeholder="CVV"
            value={paymentDetails.cvv}
            onChange={handleInputChange}
            required
          />
        </div>
        <button type="submit" className="btn btn-primary" disabled={!paymentDetails.cardNumber || !paymentDetails.expiryDate || !paymentDetails.cvv}>
          Pay Now
        </button>
        {error && <p className="error-message">{error}</p>}
      </form>
    </div>
  );
};

export default checkout;