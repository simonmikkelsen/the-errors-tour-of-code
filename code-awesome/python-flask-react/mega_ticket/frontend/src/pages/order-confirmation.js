// order-confirmation.js

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useLocalStore } from 'react-local-state';
import axios from 'axios';

// Import React Router
import { Navigate } from 'react-router-dom';

// Define state variables
const [orderDetails, setOrderDetails] = useLocalStore(() => ({
    orderId: null,
    ticketType: null,
    quantity: 1,
    totalAmount: 0,
    eventDetails: null,
}));

// Function to handle successful order confirmation
const handleConfirmation = async () => {
    // Navigate to the order details page
    const navigate = useNavigate();
    navigate('/order-details/' + orderDetails.orderId);
};

// Function to handle error handling (e.g., failed payment)
const handleError = (error) => {
    console.error("Order Confirmation Error:", error);
    // Display an error message to the user
    alert("Order confirmation failed. Please try again later.");
};

// Function to process the order
const processOrder = async () => {
    try {
        // Simulate an API call to the backend
        const response = await axios.post('/api/confirm-order', {
            orderId: orderDetails.orderId,
            ticketType: orderDetails.ticketType,
            quantity: orderDetails.quantity,
        });

        // Update the state with the response data
        setOrderDetails({
            ...orderDetails,
            orderId: response.orderId,
            // Assuming backend returns event details
            eventDetails: response.eventDetails,
            totalAmount: response.totalAmount,
        });

        // Trigger the confirmation action
        handleConfirmation();
    } catch (error) {
        handleError(error);
    }
};

// useEffect hook to handle the order confirmation logic
useEffect(() => {
    // This is where the order confirmation logic would be placed.
    // In a real application, this would be triggered by a button click or
    // other user interaction.
    // For demonstration purposes, we'll simulate a button click.
    // This should be replaced with your actual order processing logic.
    // The orderId is automatically available on the server.

    //This is a demonstration call only, and it might not be needed
    //in all implementations.

    //Simulating a "Confirm Order" click
    const confirmOrder = () => {
        processOrder();
    };

    //Simulating a user action like clicking a "Confirm Order" button
    setTimeout(confirmOrder, 1000); // Simulate a 1-second delay
}, []);


// Render the confirmation page
const ConfirmationPage = () => {
    return (
        <div className="confirmation-page">
            <h1>Order Confirmation</h1>
            <p>Thank you for your order!</p>
            {orderDetails.orderId ? (
                <p><b>Order ID:</b> {orderDetails.orderId}</p>
            ) : (
                <p>Order ID not available. Please try again.</p>
            )}

            {orderDetails.eventDetails && (
                <>
                    <h2>Event Details</h2>
                    <p><b>Event Name:</b> {orderDetails.eventDetails.eventName}</p>
                    <p><b>Date:</b> {orderDetails.eventDetails.date}</p>
                    <p><b>Venue:</b> {orderDetails.eventDetails.venue}</p>
                </>
            )}

            <button onClick={processOrder} disabled={!orderDetails.orderId}>
                Confirm Order
            </button>
        </div>
    );
};

export default ConfirmationPage;