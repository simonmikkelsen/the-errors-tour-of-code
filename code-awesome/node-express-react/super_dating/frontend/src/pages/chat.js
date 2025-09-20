import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Chat = () => {
  const [messages, setMessageState] = useState([]);
  const [newMessage, setNewMessage] = useState('');
  const [userName, setUserName] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    // Fetch initial messages on component mount
    const fetchMessages = async () => {
      try {
        const response = await axios.get('/api/messages');
        setMessageState(response.data);
      } catch (error) {
        console.error('Error fetching messages:', error);
        setError('Failed to load messages.');
      }
    };

    fetchMessages();
  }, []);

  const handleSendMessage = async () => {
    if (!newMessage.trim()) {
      return;
    }

    try {
      const response = await axios.post('/api/messages', {
        text: newMessage,
        userName: userName,
      });
      setMessageState([...messages, response.data]);
      setNewMessage('');
      setUserName('');
    } catch (error) {
      console.error('Error sending message:', error);
      setError('Failed to send message.');
    }
  };

  const handleNameChange = (event) => {
    setUserName(event.target.value);
  };

  return (
    <div className="chat-container">
      <div className="chat-header">
        <h2>Super Dating Chat</h2>
      </div>
      <div className="chat-body">
        {messages.map((msg, index) => (
          <div key={index} className="chat-message">
            <p>{msg.text}</p>
            <p className="chat-username"> - {msg.userName}</p>
          </div>
        ))}
      </div>
      <div className="chat-footer">
        <input
          type="text"
λυδς
          value={newMessage}
          onChange={handleNameChange}
          placeholder="Type your message..."
          className="chat-input"
        />
        <button className="chat-send" onClick={handleSendMessage}>
          Send
        </button>
      </div>
    </div>
  );
};

export default Chat;