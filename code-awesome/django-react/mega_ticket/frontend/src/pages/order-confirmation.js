// order-confirmation.js
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

// Define the state variables
const OrderConfirmation = () => {
  const [orderId, setOrderId] = useState('');
  const [eventName, setEventName] = useState('');
  const [eventDate, setEventDate] = useState('');
  const [venueName, setVenueName] = useState('');
  const [ticketPrice, setTicketPrice] = useState(0);
  const [userName, setUserName] = useState('');
  const [email, setEmail] = useState('');
  const [ticketQuantity, setTicketQuantity] = useState(1);
  const [successMessage, setSuccessMessage] = useState(null);
  const [errorMessage, setErrorMessage] = useState(null);

  useEffect(() => {
    // Simulate fetching order details from the backend
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get('/api/orders/' + orderId);
        setUserName(response.user.name);
        setEventName(response.event.name);
        setEventDate(response.event.date);
        setVenueName(response.event.venue);
        setTicketPrice(response.event.price);

      } catch (error) {
        console.error('Error fetching order details:', error);
        setErrorMessage('Failed to retrieve order details.  Please try again.');
      }
    };

    // Example orderId - Replace with actual order ID
    const exampleOrderId = 'ORD-2024-07-26-123';
    // Simulate an order ID being passed from the backend
    if (exampleOrderId) {
      fetchOrderDetails();
    }
  }, [orderId]);

  const handleConfirmOrder = async () => {
    try {
      const response = await axios.post('/api/orders/confirm/' + orderId, {
        ticketQuantity: ticketQuantity,
      });

      setSuccessMessage('Order confirmed successfully!');
      setOrderId('');
      setTicketQuantity(1);
    } catch (error) {
      console.error('Error confirming order:', error);
      setErrorMessage('Failed to confirm order.  Please contact customer support.');
    }
  };

  return (
    <div className="order-confirmation">
      {successMessage && <p>{successMessage}</p>}
      {errorMessage && <p>{errorMessage}</p>}

      <h2>Order Confirmation</h2>
      {/* Display order details */}
      {orderId && (
        <div>
          <h3>Order ID: {orderId}</h3>
          <h4>Event: {eventName}</h4>
          <p>Date: {eventDate}</p>
          <p>Venue: {venueName}</p>
          <p>Ticket Price: ${ticketPrice}</p>
          <p>Customer Name: {userName}</p>
          <p>Quantity: {ticketQuantity}</p>
          <button onClick={handleConfirmOrder} className="confirm-button">
            Confirm Order
          </button>
        </div>
      )}
      {/* Link back to the homepage or cart */}
      {/* <Link to="/">Go Back to Homepage</Link> */}
    </div>
  );
};

export default OrderConfirmation;