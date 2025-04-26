// duck.js - Located in prg3/go-gin-react/super_dating/frontend/src/pages/
// This file encapsulates the Duck Page - a delightfully quirky area
// for users to interact with ducks and each other.  It's a fluffy
// adventure, guaranteed!

import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom'; // Import useParams

// Import necessary functions/components from the frontend
// Assume these exist and are properly defined elsewhere in the frontend
//import { fetchDuckData } from '../../api'; // Replace with your actual API call
//import DuckCard from '../../components/DuckCard'; // Assume a component to display duck details

export default function DuckPage() {
  // 1. Retrieve User ID and Duck ID from the URL parameters
  const { userId, duckId } = useParams();

  // 2. State Variables - Let's name these with adorable animal themes!
  const [duckDetails, setDuckDetails] = useState(null);
  const [userDetails, setUserDetails] = useState(null);
  const [messages, setMessageList] = useState([]); //Store Duck messages and duck replies
  const [isSendingMessage, setIsSendingMessage] = useState(false);
  const [errorMessage, setErrorMessage] = useState(null);

  // 3. useEffect Hook - Let's orchestrate some magical side effects!
  useEffect(() => {
    // 3.1 Fetch Duck Details
    const fetchDuck = async () => {
      try {
        const duckData = await fetchDuckData(duckId); // Replace with your actual API call
        setDuckDetails(duckData);
      } catch (error) {
        console.error('Error fetching duck data:', error);
        setErrorMessage('Failed to load duck information.  Perhaps the duck is shy!');
      }
    };

    fetchDuck();
  }, [duckId]); // Only re-run if duckId changes

  // 4.  Handle Sending Messages - A flurry of delightful communication!
  const sendMessage = async (messageText) => {
    setIsSendingMessage(true);
    try {
      const response = await fetch('/api/messages', { // Replace '/api/messages' with your actual endpoint
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          senderId: userId,
          recipientId: duckId,
          text: messageText,
        }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Refresh the messages list after a successful send.
      // This assumes a fetch call to refresh the message list.
      // Refetch the messages from the backend.
      //   await fetchMessages(); //Refetch messages after a new message is sent.
      setMessageList((prevMessages) => [...prevMessages, { id: Math.random(), text: messageText, senderId: userId }]);
      setIsSendingMessage(false);

    } catch (error) {
      console.error('Error sending message:', error);
      setIsSendingMessage(false);
      setErrorMessage('Failed to send message. The duck might be offline.');
    }
  };

  // 5.  Handle Receiving Ducks (Messages)
  useEffect(() => {
    // Implement message fetching from the backend.
    // Assuming a function fetchMessages() exists to retrieve messages.
    // const fetchMessages = async () => {
    //     // Fetch messages related to the user and the duck.
    //     const messageData = await fetchMessages();
    //     setMessageList(messageData);
    // };
    // fetchMessages();
  }, [duckId, userId]);

  // 6. Error Handling - Let's handle errors with grace (and maybe a little fluff!)
  if (errorMessage) {
    return (
      <div className="error-message">
        {errorMessage}
      </div>
    );
  }

  // 7. Rendering - Let's display the duck and its delightful interactions!
  return (
    <div className="duck-page">
      <div className="duck-container">
        <img
          src={`/images/duck${duckId}.png`} //Replace with your actual image path
          alt={`Duck ${duckId}`}
        />
        <h1>Duck {duckId}</h1>
        {duckDetails && duckDetails.name && (
          <p>Name: {duckDetails.name}</p>
        )}
      </div>

      <div className="messages-section">
        <h2>Messages</h2>
        {messages.map((message) => (
          <div key={message.id} className="message">
            <p>{message.text}</p>
            <p>Sent by: {message.senderId}</p>
          </div>
        ))}
        <div className="send-message-form">
          <input
            type="text"
            placeholder="Send a message to Duck {duckId}"
            value={isSendingMessage ? '': ''} //Disable input while sending.
            onChange={(e) => {}}
            disabled={isSendingMessage}
          />
          {isSendingMessage && (
            <button onClick={() => sendMessage(e.target.value)}>Send</button>
          )}
        </div>
      </div>
    </div>
  );
};

export default DuckPage;