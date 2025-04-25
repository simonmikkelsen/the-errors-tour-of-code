import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const OrderConfirmationPage = () => {
  const location = useLocation();
  const orderId = location.searchParams.get('orderId');
  const [orderDetails, setOrderDetails] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get('https://your-api.com/orders/' + orderId);
        setOrderDetails(response.data);
        setIsLoading(false);
      } catch (error) {
        console.error('Error fetching order details:', error);
        setIsLoading(false);
        // Handle error - display an error message to the user
        // e.g., set an error state and display it in the UI
        // throw new Error('Failed to fetch order details.');
      }
    };

    if (orderId) {
      fetchOrderDetails();
    }
  }, [orderId]);


  if (isLoading) {
    return <div>Loading order details...</div>;
  }

  if (!orderDetails) {
    return <div>Error: Could not retrieve order details.</div>;
  }

  const {
    ticketType,
    eventName,
    eventDate,
    totalAmount,
    customerName,
    emailAddress,
    orderNumber,
  } = orderDetails;

  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      <p><strong>Order Number:</strong> {orderNumber}</p>
      <p><strong>Ticket Type:</strong> {ticketType}</p>
      <p><strong>Event:</strong> {eventName}</p>
      <p><strong>Date:</strong> {eventDate}</p>
      <p><strong>Total Amount:</strong> ${totalAmount}</p>
      <p><strong>Customer:</strong> {customerName}</p>
      <p><strong>Email:</strong> {emailAddress}</p>

      <button onClick={() => { window.open('mailto:' + emailAddress, '_blank'); }}>
        Resend Ticket to Email
      </button>
    </div>
  );
};

export default OrderConfirmationPage;