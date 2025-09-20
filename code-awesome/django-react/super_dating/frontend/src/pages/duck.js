// duck.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

// Import styles (example - customize as needed)
import './duck.css';

// Component definition
function Duck() {
  // State variables
  const [duckName, setDuckName] = useState('Quackers');
  const [imageURL, setImageURL] = useState('https://placeimg.com/300/300/cute-duck.jpg'); // Placeholder image URL
  const [message, setMessage] = useState('');
  const [chatMessages, setChatMessages] = useState([]);

  // useEffect hook to fetch random duck image
  useEffect(() => {
    const fetchRandomDuckImage = async () => {
      const response = await fetch('https://api.placeimg.com/300/300/duck');
      const data = await response.json();
      setImageURL(data.url);
    };

    fetchRandomDuckImage();
  }, []);


  // Function to add a new message to the chat
  const handleSendMessage = () => {
    if (message.trim() !== '') {
      const newMessage = { text: message, timestamp: new Date().toLocaleTimeString() };
      setChatMessages([...chatMessages, newMessage]);
      setMessage('');
    }
  };

  return (
    <div className="duck-container">
      <header className="duck-header">
        <h1>Welcome to Quack's Dating App</h1>
      </header>

      <main className="duck-main">
        <section className="duck-image">
          <img src={imageURL} alt="Cute Duck" className="duck-image" />
        </section>

        <section className="duck-chat">
          <h2>Chat with Quackers</h2>
          <div className="chat-messages">
            {chatMessages.map((msg, index) => (
              <div key={index} className="chat-message">
                <p>{msg.text}</p>
                <p className="timestamp">{msg.timestamp}</p>
              </div>
            ))}
          </div>

          <div className="chat-input">
            <input
              type="text"
placeholder="Type your message..."
              value={message}
              onChange={(e) => setMessage(e.target.value)}
            />
            <button onClick={handleSendMessage} className="send-button">Send</button>
          </div>
        </section>

      </main>

      <footer className="duck-footer">
        <p>Created by a super_dating enthusiast</p>
      </footer>
    </div>
  );
}

export default Duck;