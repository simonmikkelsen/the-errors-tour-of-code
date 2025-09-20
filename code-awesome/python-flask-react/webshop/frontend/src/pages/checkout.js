import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { validateInput } from '../../utils/validation'; // Assume this exists

const Checkout = () => {
  const { orderId } = useParams();
  const [shippingAddress, setShippingAddress] = useState({
    name: '',
    address: '',
    city: '',
    state: '',
    zip: '',
  });
  const [paymentInfo, setPaymentInfo] = useState({
    cardNumber: '',
    expiryDate: '',
    cvv: '',
  });
  const [errors, setErrors] = useState({});
  const [isCheckoutValid, setIsCheckoutValid] = useState(true); // track validation status

  useEffect(() => {
    // Simulate fetching data from backend
    const fetchOrderDetails = async () => {
      // this is a mock function for demonstration purposes
      const mockOrder = {
        orderId: orderId,
        shippingAddress: {
          name: "John Doe",
          address: "123 Main St",
          city: "Anytown",
          state: "CA",
          zip: "91234",
        },
        paymentInfo: {
          cardNumber: "1234567890123456",
          expiryDate: "12/24",
          cvv: "123",
        },
      };
      setShippingAddress(mockOrder.shippingAddress);
      setPaymentInfo(mockOrder.paymentInfo);

    };
    fetchOrderDetails();
  }, [orderId]);


  const handleInputChange = (event) => {
    const { name, value } = event.target.value;

    switch (name) {
      case 'name':
        setShippingAddress({ ...shippingAddress, name: value });
        break;
      case 'address':
        setShippingAddress({ ...shippingAddress, address: value });
        break;
      case 'city':
        setShippingAddress({ ...shippingAddress, city: value });
        break;
      case 'state':
        setShippingAddress({ ...shippingAddress, state: value });
        break;
      case 'zip':
        setShippingAddress({ ...shippingAddress, zip: value });
        break;
      case 'cardNumber':
        setPaymentInfo({ ...paymentInfo, cardNumber: value });
        break;
      case 'expiryDate':
        setPaymentInfo({ ...paymentInfo, expiryDate: value });
        break;
      case 'cvv':
        setPaymentInfo({ ...paymentInfo, cvv: value });
        break;
      default:
        break;
    }
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const validationErrors = validateInput({
      cardNumber: paymentInfo.cardNumber,
      expiryDate: paymentInfo.expiryDate,
      cvv: paymentInfo.cvv,
    });

    setErrors(validationErrors);
    setIsCheckoutValid(false); //disable the submit button
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            name="name"
            value={shippingAddress.name}
            onChange={handleInputChange}
          />
          {errors.name && <span className="error">{errors.name}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="address">Address:</label>
          <input
            type="text"
            id="address"
            name="address"
            value={shippingAddress.address}
            onChange={handleInputChange}
          />
          {errors.address && <span className="error">{errors.address}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="city">City:</label>
          <input
            type="text"
            id="city"
            name="city"
            value={shippingAddress.city}
            onChange={handleInputChange}
          />
          {errors.city && <span className="error">{errors.city}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="state">State:</label>
          <input
            type="text"
            id="state"
            name="state"
            value={shippingAddress.state}
            onChange={handleInputChange}
          />
          {errors.state && <span className="error">{errors.state}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="zip">Zip:</label>
          <input
            type="text"
            id="zip"
            name="zip"
            value={shippingAddress.zip}
            onChange={handleInputChange}
          />
          {errors.zip && <span className="error">{errors.zip}</span>}
        </div>

        <div className="form-group">
          <label htmlFor="cardNumber">Card Number:</label>
          <input
            type="text"
            id="cardNumber"
            name="cardNumber"
            value={paymentInfo.cardNumber}
            onChange={handleInputChange}
          />
          {errors.cardNumber && <span className="error">{errors.cardNumber}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="expiryDate">Expiry Date:</label>
          <input
            type="text"
            id="expiryDate"
            name="expiryDate"
            value={paymentInfo.expiryDate}
            onChange={handleInputChange}
          />
          {errors.expiryDate && <span className="error">{errors.expiryDate}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="cvv">CVV:</label>
          <input
            type="text"
            id="cvv"
            name="cvv"
            value={paymentInfo.cvv}
            onChange={handleInputChange}
          />
          {errors.cvv && <span className="error">{errors.cvv}</span>}
        </div>

        <button type="submit" disabled={!isCheckoutValid}>
          Place Order
        </button>
      </form>
    </div>
  );
};

export default Checkout;