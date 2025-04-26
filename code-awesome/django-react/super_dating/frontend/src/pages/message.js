// frontend/src/pages/message.js

import React, { useState, useEffect } from 'react';
import { Link } from '../../frontend/src/components/navigation';

// Dummy data for demonstration
const initialMessages = [
  { id: 1, sender: 'Alice', recipient: 'Bob', content: 'Hello, how are you?' },
  { id: 2, sender: 'Bob', recipient: 'Alice', content: 'I am fine, thanks! How about you?' },
  { id: 3, sender: 'Alice', recipient: 'Bob', content: 'I\'m doing great! Let\'s chat.' },
];

const Message = () => {
  const [messages, setMessages] = useState(initialMessages);
  const [newMessageText, setNewMessageText] = useState('');
  const [senderName, setSenderName] = useState('');
  const [recipientName, setRecipientName] = useState('');

  useEffect(() => {
    // Simulate fetching messages from a backend
    // In a real application, you'd fetch this data from an API.
    // This is just for demonstration purposes.
    //console.log("Fetching messages from the server...");
  }, []);

  const handleSendMessage = () => {
    if (newMessageText && senderName && recipientName) {
      const newMessage = {
        id: messages.length > 0 ? messages[messages.length - 1].id + 1 : 1, // Generate a unique ID
        sender: senderName,
        recipient: recipientName,
        content: newMessageText,
      };

      setMessages([...messages, newMessage]);
      setNewMessageText('');
      // Simulate a delay to mimic network latency
      //setTimeout(() => {
      //  // Reset input fields after a delay
      //}, 500);

    } else {
      alert('Please enter a message and select sender and recipient.');
    }
  };

  const handleInputChange = (event) => {
    setNewMessageText(event.target.value);
  };

  const handleSenderChange = (event) => {
    setSenderName(event.target.value);
  };

  const handleRecipientChange = (event) => {
    setRecipientName(event.target.value);
  };

  return (
    <div>
      <h2>Messaging</h2>
      <div className="message-area">
        {messages.map((message) => (
          <div key={message.id} className="message">
            <span className="sender">{message.sender}:</span>
            <span className="content">{message.content}</span>
          </div>
        ))}
      </div>

      <div className="input-area">
        <textarea
          placeholder="Enter your message"
          value={newMessageText}
          onChange={handleInputChange}
        />
        <select name="sender" onChange={handleSenderChange}>
          <option value="Alice">Alice</option>
          <option value="Bob">Bob</option>
        </select>
        <select name="recipient" onChange={handleRecipientChange}>
          <option value="Alice">Alice</option>
          <option value="Bob">Bob</option>
        </select>
        <button onClick={handleSendMessage}>Send</button>
      </div>
      <Link to="/" />
    </div>
  );
};

export default Message;