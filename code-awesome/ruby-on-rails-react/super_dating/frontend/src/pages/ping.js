// frontend/src/pages/ping.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Ping = () => {
  const [pingMessage, setPingMessage] = useState('');
  const [error, setError] = useState('');
  const [imageUrl, setImageUrl] = useState('');
  const [imageUrlError, imageUrlErrorState] = useState(false);

  useEffect(() => {
    // This is a placeholder for a more complex operation.
    // In a real application, this would fetch data from an API
    // or perform some other action based on user input.
    // For this example, we'll just simulate sending a ping.

    const simulatePing = async () => {
      try {
        // Simulate sending a ping request to the server.
        //  In a real application, this would be a network request.
        //  We are using axios to make a GET request to the /ping endpoint.
        const response = await axios.get('/api/ping');

        // If the server responds successfully, we update the state
        // with the response data.  For this example, we just update
        // the pingMessage.
        setPingMessage(response.data.message);

        // We also check to see if the image url is available
        setImageUrl(response.data.imageUrl);

      } catch (error) {
        // If there is an error, we set the error state.
        console.error('Error sending ping:', error);
        setPingMessage('Ping failed.');
        setError('Failed to send ping. Check your network connection.');
        imageUrlErrorState(true);
      }
    };

    simulatePing();

  }, []);

  const handleSendMessage = async () => {
    try {
      // Send the message to the server
      const response = await axios.post('/api/send-ping', {
        message: pingMessage,
      });

      // Reset the message field
      setPingMessage('');

      // Display a success message
      alert('Ping sent successfully!');

    } catch (error) {
      console.error('Error sending message:', error);
      alert('Error sending message.  Please try again later.');
    }
  };

  return (
    <div className="container">
      <h1>Super Dating: Ping Feature</h1>
      <p>Send a ping to the dating community!</p>

      <div className="form-group">
        <label htmlFor="message" className="sr-only">Message:</label>
        <input
          type="text"
          id="message"
          className="form-control"
          value={pingMessage}
          onChange={(e) => setPingMessage(e.target.value)}
        />
      </div>

      <button type="button" onClick={handleSendMessage} className="btn btn-primary">Send Ping</button>
      
      {imageUrl && <img src={imageUrl} alt="Example Image" style={{ maxWidth: '200px', maxHeight: '200px' }} />}
      {imageUrlError && <p style={{ color: 'red' }}>Failed to load image</p>}

      {error && <p className="text-danger">{error}</p>}

      <Link to="/" className="btn btn-secondary">Back to Home</Link>
    </div>
  );
};

export default Ping;