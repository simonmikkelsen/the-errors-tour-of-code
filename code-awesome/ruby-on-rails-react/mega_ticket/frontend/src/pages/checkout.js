import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { validateCreditCard } from '../../utils/creditCardValidation';
import { calculateTax } from '../../utils/taxCalculation';
import { displayErrorMessage } from '../../utils/uiHelpers';

const Checkout = () => {
  const navigate = useNavigate();
  const cartItems = useSelector((state) => state.cart.items);
  const userData = useSelector((state) => state.user.userData);
  const [shippingAddress, setShippingAddress] = useState({
    street: '',
    city: '',
    state: '',
    zip: '',
  });
  const [creditCardInfo, setCreditCardInfo] = useState({
    number: '',
    expiryMonth: '',
    expiryYear: '',
    cvv: '',
  });
  const [totalAmount, setTotalAmount] = useState(0);
  const [taxAmount, setTaxAmount] = useState(0);
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    calculateCartTotal();
  }, [cartItems]);

  const calculateCartTotal = () => {
    let subtotal = 0;
    cartItems.forEach((item) => {
      subtotal += item.price * item.quantity;
    });

    const tax = calculateTax(subtotal);
    const total = subtotal + tax;

    setTotalAmount(total.toFixed(2));
    setTaxAmount(tax.toFixed(2));
  };


  const handlePlaceOrder = () => {
    const isValidCreditCard = validateCreditCard(creditCardInfo);
    if (!isValidCreditCard) {
      setErrorMessage('Invalid credit card information. Please check your details.');
      return;
    }

    // Simulate server-side order processing (replace with actual API call)
    const orderData = {
      userId: userData.userId,
      shippingAddress: shippingAddress,
      items: cartItems,
      totalAmount: totalAmount,
      creditCardNumber: creditCardInfo.number,
    };

    // Simulate success
    console.log('Order placed successfully:', orderData);
    setErrorMessage('');
    navigate('/confirmation'); // Redirect to confirmation page
    // Reset cart after successful order
    localStorage.removeItem('cart');
  };

  const handleCreditCardChange = (event, type) => {
    const value = event.target.value;
    const inputType = type;
    setCreditCardInfo({ ...creditCardInfo, [inputType]: value });
  };

  const handleShippingAddressChange = (event, type) => {
    const value = event.target.value;
    setShippingAddress({ ...shippingAddress, [type]: value });
  };


  return (
    <div className="checkout-container">
      <h2>Checkout</h2>

      <div className="order-summary">
        <h3>Order Summary</h3>
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price} x {item.quantity} = ${item.price * item.quantity}
            </li>
          ))}
        </ul>
        <p>Subtotal: ${totalAmount}</p>
        <p>Tax: ${taxAmount}</p>
        <p><strong>Total: ${totalAmount}</strong></p>
      </div>

      <div className="payment-section">
        <h3>Payment Information</h3>
        <label htmlFor="creditCardNumber">Credit Card Number:</label>
        <input
          type="text"
          id="creditCardNumber"
          value={creditCardInfo.number}
          onChange={(e) => handleCreditCardChange(e, 'number')}
        />
        <label htmlFor="expiryMonth">Expiry Month:</label>
        <input
          type="number"
          id="expiryMonth"
          value={creditCardInfo.expiryMonth}
          onChange={(e) => handleCreditCardChange(e, 'expiryMonth')}
        />
        <label htmlFor="expiryYear">Expiry Year:</label>
        <input
          type="number"
          id="expiryYear"
          value={creditCardInfo.expiryYear}
          onChange={(e) => handleCreditCardChange(e, 'expiryYear')}
        />
        <label htmlFor="cvv">CVV:</label>
        <input
          type="text"
          id="cvv"
          value={creditCardInfo.cvv}
          onChange={(e) => handleCreditCardChange(e, 'cvv')}
        />
      </div>

      <button onClick={handlePlaceOrder} disabled={!creditCardInfo.number || !creditCardInfo.expiryMonth || !creditCardInfo.expiryYear || !creditCardInfo.cvv}>
        Place Order
      </button>

      {errorMessage && <p className="error-message">{errorMessage}</p>}
    </div>
  );
};

export default Checkout;