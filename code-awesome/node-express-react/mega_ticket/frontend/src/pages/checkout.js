import { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { validateInput } from '../../utils/validation';

const Checkout = () => {
  const location = useLocation();
  const [cartItems, setCartItems] = useState([]);
  const [shippingAddress, setShippingAddress] = useState({
    name: '',
    street: '',
    city: '',
    state: '',
    zip: '',
  });
  const [paymentInfo, setPaymentInfo] = useState({
    cardNumber: '',
    expiryDate: '',
    cvv: '',
  });
  const [errorMessages, setErrorMessages] = useState({});

  useEffect(() => {
    // This effect is triggered when the location changes.
    // It retrieves the cart items from the location query parameters.
    const cartItemsFromUrl = queryParamsToObject(location.search());

    setCartItems(Object.values(cartItemsFromUrl));
  }, [location]);


  const handleInputChange = (event) => {
    const { name, value } = event.target.value;
    setPaymentInfo({
      ...paymentInfo,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrorMessages({});

    const validationResult = validateOrderData(paymentInfo, shippingAddress);

    if(validationResult){
      setErrorMessages(validationResult);
      return;
    }

    // Simulate API call to process the order
    try {
      const orderConfirmation = await simulateOrderProcessing(paymentInfo, shippingAddress);
      alert('Order placed successfully! Confirmation sent to ' + shippingAddress.email);
    } catch (error) {
      console.error('Error placing order:', error);
      alert('Failed to place order. Please try again later.');
    }
  };

  const simulateOrderProcessing = async (paymentInfo, shippingAddress) => {
    //Simulate the database write/update operations
    await new Promise(resolve => setTimeout(resolve, 2000));

    return { success: true, orderId: Math.floor(Math.random() * 100000)};
  };

  const validateOrderData = (paymentInfo, shippingAddress) => {
    const errors = {};

    if (!validateInput(paymentInfo.cardNumber, 'cardNumber')) {
      errors.cardNumber = 'Please enter a valid card number.';
    }

    if (!validateInput(paymentInfo.expiryDate, 'expiryDate')) {
      errors.expiryDate = 'Please enter a valid expiry date.';
    }

    if (!validateInput(paymentInfo.cvv, 'cvv')) {
      errors.cvv = 'Please enter a valid CVV.';
    }
     if (!shippingAddress.name) {
      errors.name = 'Name is required.';
    }
    if (!validateInput(shippingAddress.street, 'street')) {
      errors.street = 'Please enter a valid street address.';
    }

    if (!validateInput(shippingAddress.city, 'city')) {
      errors.city = 'Please enter a valid city.';
    }

    return errors;
  };


  const queryParamsToObject = (query) => {
    const obj = {};
    const parts = query.substring(0, query.length - 1).split('&');
    parts.forEach(part => {
      if (part) {
        const [key, value] = part.split('=');
        if (key && value) {
          obj[key] = decodeURIComponent(value.replace(/\+/g, ' '));
        }
      }
    });
    return obj;
  };

  return (
    <div>
      <h2>Checkout</h2>
      {/* Form to collect shipping address */}
      <form onSubmit={handleSubmit}>
        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          name="name"
          value={shippingAddress.name}
          onChange={handleInputChange}
        />
        {errorMessages.name && <p style={{ color: 'red' }}>{errorMessages.name}</p>}

        <label htmlFor="street">Street:</label>
        <input
          type="text"
          id="street"
          name="street"
          value={shippingAddress.street}
          onChange={handleInputChange}
        />
        {errorMessages.street && <p style={{ color: 'red' }}>{errorMessages.street}</p>}

        <label htmlFor="city">City:</label>
        <input
          type="text"
          id="city"
          name="city"
          value={shippingAddress.city}
          onChange={handleInputChange}
        />
        {errorMessages.city && <p style={{ color: 'red' }}>{errorMessages.city}</p>}

        <label htmlFor="state">State:</label>
        <input
          type="text"
          id="state"
          name="state"
          value={shippingAddress.state}
          onChange={handleInputChange}
        />
        {errorMessages.state && <p style={{ color: 'red' }}>{errorMessages.state}</p>}
        <label htmlFor="zip">Zip:</label>
        <input
          type="text"
          id="zip"
          name="zip"
          value={shippingAddress.zip}
          onChange={handleInputChange}
        />
        {errorMessages.zip && <p style={{ color: 'red' }}>{errorMessages.zip}</p>}
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          name="email"
          value={shippingAddress.email}
          onChange={handleInputChange}
        />

        {/* Form to collect payment information */}
        <label htmlFor="cardNumber">Card Number:</label>
        <input
          type="text"
          id="cardNumber"
          name="cardNumber"
          value={paymentInfo.cardNumber}
          onChange={handleInputChange}
        />
        {errorMessages.cardNumber && <p style={{ color: 'red' }}>{errorMessages.cardNumber}</p>}

        <label htmlFor="expiryDate">Expiry Date:</label>
        <input
          type="text"
          id="expiryDate"
          name="expiryDate"
          value={paymentInfo.expiryDate}
          onChange={handleInputChange}
        />
        {errorMessages.expiryDate && <p style={{ color: 'red' }}>{errorMessages.expiryDate}</p>}

        <label htmlFor="cvv">CVV:</label>
        <input
          type="text"
          id="cvv"
          name="cvv"
          value={paymentInfo.cvv}
          onChange={handleInputChange}
        />
        {errorMessages.cvv && <p style={{ color: 'red' }}>{errorMessages.cvv}</p>}
        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default Checkout;