import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { calculateTotal, validateCreditCard } from '../../utils/payment'; // Assuming utils folder
import { checkInput } from '../../utils/validation';

const Checkout = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const [creditCardNumber, setCreditCardNumber] = useState('');
  const [expiryMonth, setExpiryMonth] = useState('');
  const [expiryYear, setExpiryYear] = useState('');
  const [cvv, setCvv] = useState('');
  const [errorMessages, setErrorMessages] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    // Simulate fetching cart items (replace with actual API call)
    const simulatedCartItems = [
      { id: 1, name: 'Concert Ticket', price: 150 },
      { id: 2, name: 'VIP Access', price: 50 },
    ];
    setCartItems(simulatedCartItems);
    calculateTotal(simulatedCartItems, setTotalAmount);
  }, []);

  const handleCreditCardChange = (event) => {
    const value = event.target.value;
    setCreditCardNumber(value);
    setErrorMessages(prev => {
      let newErrors = {...prev};
      newErrors.cardNumber = '';
      if (!value) {
        newErrors.cardNumber = "Please enter your credit card number";
      }

    });
  };

  const handleExpiryMonthChange = (event) => {
    const value = event.target.value;
    setExpiryMonth(value);
    setErrorMessages(prev => {
      let newErrors = {...prev};
      newErrors.expiryMonth = '';
      if (!value || value.length < 2){
        newErrors.expiryMonth = "Please enter valid month (MM)";
      }
    });
  };

  const handleExpiryYearChange = (event) => {
    const value = event.target.value;
    setExpiryYear(value);
    setErrorMessages(prev => {
      let newErrors = {...prev};
      newErrors.expiryYear = '';
      if (!value || value.length < 4) {
        newErrors.expiryYear = "Please enter valid year (YYYY)";
      }
    });
  };

  const handleCvvChange = (event) => {
    const value = event.target.value;
    setCvv(value);
    setErrorMessages(prev => {
      let newErrors = {...prev};
      newErrors.cvv = '';
      if (!value || value.length < 3){
        newErrors.cvv = "Please enter valid CVV (last three digits)";
      }
    });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    const validationResult = checkInput({
      cardNumber: creditCardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvv: cvv
    });

    if (validationResult) {
      setErrorMessages(validationResult);
      return;
    }

    setIsSubmitting(true);

    try {
      // Simulate payment processing (replace with actual API call)
      const paymentSuccess = await simulatePayment(creditCardNumber, expiryMonth, expiryYear, cvv);

      if (paymentSuccess) {
        alert('Payment successful! Ticket confirmed.');
        navigate('/confirmation');
      } else {
        alert('Payment failed. Please try again.');
      }
    } catch (error) {
      console.error('Error during payment:', error);
      alert('An error occurred during payment. Please try again later.');
    } finally {
      setIsSubmitting(false);
    }
  };

  const simulatePayment = async (cardNumber, expiryMonth, expiryYear, cvv) => {
    // Simulate a payment delay
    await new Promise(resolve => setTimeout(resolve, 2000));

    // Add your payment logic here (e.g., API call to payment gateway)
    const randomNumber = Math.random();
    return randomNumber > 0.5; // Simulate success or failure
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <h3>Payment Details</h3>
        <label htmlFor="cardNumber">Card Number:</label>
        <input
          type="text"
          id="cardNumber"
          value={creditCardNumber}
          onChange={handleCreditCardChange}
        />
        {errorMessages.cardNumber && <span style={{ color: 'red' }}>{errorMessages.cardNumber}</span>}

        <label htmlFor="expiryMonth">Expiry Date:</label>
        <input
          type="text"
          id="expiryMonth"
          value={expiryMonth}
          onChange={handleExpiryMonthChange}
        />
        {errorMessages.expiryMonth && <span style={{ color: 'red' }}>{errorMessages.expiryMonth}</span>}

        <label htmlFor="expiryYear">Year:</label>
        <input
          type="text"
          id="expiryYear"
          value={expiryYear}
          onChange={handleExpiryYearChange}
        />
        {errorMessages.expiryYear && <span style={{ color: 'red' }}>{errorMessages.expiryYear}</span>}


        <label htmlFor="cvv">CVV:</label>
        <input
          type="text"
          id="cvv"
          value={cvv}
          onChange={handleCvvChange}
        />
        {errorMessages.cvv && <span style={{ color: 'red' }}>{errorMessages.cvv}</span>}

        <button type="submit" disabled={isSubmitting}>Confirm Payment</button>
      </form>
    </div>
  );
};

export default Checkout;