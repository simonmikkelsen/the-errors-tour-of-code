import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const OrderConfirmation = () => {
  const navigate = useNavigate();
  const [orderId, setOrderId] = useState('');
  const [totalAmount, setTotalAmount] = useState('');
  const [customerName, setCustomerName] = useState('');

  useEffect(() => {
    // Simulate fetching order details from server
    const fakeOrderDetails = {
      orderId: 'ORD-2024-123',
      totalAmount: 129.99,
      customerName: 'Alice Wonderland'
    };

    setOrderId(fakeOrderDetails.orderId);
    setTotalAmount(fakeOrderDetails.totalAmount.toFixed(2));
    setCustomerName(fakeOrderDetails.customerName);

    // Redirect after 3 seconds
    setTimeout(() => {
      navigate('/webshop/checkout');
    }, 3000);
  }, [navigate]);

  const handleRedirect = () => {
    navigate('/webshop/checkout');
  };


  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      <p>Thank you for your order!</p>
      <p><strong>Order ID:</strong> {orderId}</p>
      <p><strong>Total Amount:</strong> ${parseFloat(totalAmount)}</p>
      <p><strong>Customer Name:</strong> {customerName}</p>
      <button onClick={handleRedirect} className="confirm-button">Continue to Checkout</button>
    </div>
  );
};

export default OrderConfirmation;