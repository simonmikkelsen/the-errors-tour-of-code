import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Card } from 'react-bootstrap';
import axios from 'axios';

const OrderConfirmationPage = () => {
  const [orderId, setOrderId] = useState('');
  const [cartItems, setCartItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const [shippingAddress, setShippingAddress] = useState('');
  const [paymentMethod, setPaymentMethod] = useState('');
  const [confirmationMessage, setConfirmationMessage] = useState('');

  useEffect(() => {
    // Simulate fetching order details and cart items from the backend
    const fetchOrderData = async () => {
      try {
        const response = await axios.get('http://localhost:5000/api/order/123'); // Replace with your backend endpoint
        setOrderId(response.data.orderId);
        setCartItems(response.data.cartItems);
        setTotalAmount(response.data.totalAmount);
        setConfirmationMessage("Order confirmed! Thank you for your purchase.");
      } catch (error) {
        console.error('Error fetching order data:', error);
        setConfirmationMessage("An error occurred while confirming your order.");
      }
    };

    fetchOrderData();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:5000/api/order/confirm', {
        orderId: orderId,
        shippingAddress: shippingAddress,
        paymentMethod: paymentMethod
      });
      console.log('Order confirmed successfully:', response.data);
      setConfirmationMessage("Order confirmed! Thank you for your purchase.");
    } catch (error) {
      console.error('Error confirming order:', error);
      setConfirmationMessage("An error occurred while confirming your order.");
    }
  };

  return (
    <Container>
      <h2>Order Confirmation</h2>
      <Card className="mx-auto p-4 rounded shadow-md">
        <p className="text-success">Order ID: {orderId}</p>
        <p><strong>Total Amount:</strong> ${totalAmount}</p>

        <h3>Shipping Address:</h3>
        <input
          type="text"
          value={shippingAddress}
          onChange={(e) => setShippingAddress(e.target.value)}
          placeholder="Enter Shipping Address"
        />

        <label className="form-label">Payment Method:</label>
        <select value={paymentMethod} onChange={(e) => setPaymentMethod(e.target.value)}>
          <option value="credit_card">Credit Card</option>
          <option value="paypal">PayPal</option>
        </select>

        <hr />
        <button type="button" onClick={handleSubmit} className="btn btn-primary mx-auto">
          Confirm Order
        </button>

        {confirmationMessage && <p className="text-success">{confirmationMessage}</p>}
      </Card>
    </Container>
  );
};

export default OrderConfirmationPage;