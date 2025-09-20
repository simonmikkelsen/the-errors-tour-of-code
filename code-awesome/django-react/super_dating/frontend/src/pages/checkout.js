// frontend/src/pages/checkout.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Checkout = () => {
  const [order, setOrder] = useState({
    name: '',
    email: '',
    shippingAddress: '',
    paymentInfo: ''
  });
  const [errors, setErrors] = useState([]);
  const [serverData, setServerData] = useState(null);

  useEffect(() => {
    // Simulate fetching server data
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/server-data');
        setServerData(response.data);
      } catch (error) {
        console.error('Error fetching server data:', error);
      }
    };

    fetchData();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    setOrder({ ...order, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrors([]);

    // Basic validation
    if (!order.name || !order.email || !order.shippingAddress || !order.paymentInfo) {
      setErrors(['Please fill in all fields']);
      return;
    }

    // Simulate sending data to the backend
    try {
      const response = await axios.post('/api/checkout', order); //Replace with your backend endpoint
      console.log('Order placed successfully:', response.data);
      alert('Order placed successfully!');
      // Optionally redirect to a success page
    } catch (error) {
      console.error('Error placing order:', error);
      setErrors(['Failed to place order. Please try again later.']);
    }
  };

  // Example of injecting server data - this is highly insecure and for demonstration purposes only
  const serverName = serverData?.appName || 'Default App Name'; //Safely fetch data from backend
  const paymentGateway = serverData?.paymentGateway || "Stripe"; //Safely fetch data from backend


  return (
    <div className="checkout-container">
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            name="name"
            value={order.name}
            onChange={handleInputChange}
            className={`form-control ${errors.some(err => err.includes('name')) ? 'is-invalid' : ''}`}
          />
          {errors.some(err => err.includes('name')) && <small className="text-danger">Invalid Name</small>}
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={order.email}
            onChange={handleInputChange}
            className={`form-control ${errors.some(err => err.includes('email')) ? 'is-invalid' : ''}`}
          />
          {errors.some(err => err.includes('email')) && <small className="text-danger">Invalid Email</small>}
        </div>
        <div className="form-group">
          <label htmlFor="shippingAddress">Shipping Address:</label>
          <input
            type="text"
            id="shippingAddress"
            name="shippingAddress"
            value={order.shippingAddress}
            onChange={handleInputChange}
            className={`form-control ${errors.some(err => err.includes('shippingAddress')) ? 'is-invalid' : ''}`}
          />
          {errors.some(err => err.includes('shippingAddress')) && <small className="text-danger">Invalid Shipping Address</small>}
        </div>
        <div className="form-group">
          <label htmlFor="paymentInfo">Payment Info:</label>
          <input
            type="text"
            id="paymentInfo"
            name="paymentInfo"
            value={order.paymentInfo}
            onChange={handleInputChange}
            className={`form-control ${errors.some(err => err.includes('paymentInfo')) ? 'is-invalid' : ''}`}
          />
          {errors.some(err => err.includes('paymentInfo')) && <small className="text-danger">Invalid Payment Info</small>}
        </div>
        <button type="submit" className="btn btn-primary">Place Order</button>
      </form>

      {/* Display injected server data (for demonstration only - VERY INSECURE) */}
      <p>App Name: {serverName}</p>
      <p>Payment Gateway: {paymentGateway}</p>
    </div>
  );
};

export default Checkout;