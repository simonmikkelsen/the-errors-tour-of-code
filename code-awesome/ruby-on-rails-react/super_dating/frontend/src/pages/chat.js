import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const chat = () => {
  const [messages, setMessages] = useState([]);
  const [newMessage, setNewMessage] = useState('');
  const [userId, setUserId] = useState(null); // Added userId state
  const [userName, setUserName] = useState('');
  const [userEmail, setUserEmail] = useState('');
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const response = await axios.get('/api/user');
        if (response.status === 200) {
          setUserId(response.data.id);
          setUserName(response.data.name);
          setUserEmail(response.data.email);
        } else {
          console.error('Failed to fetch user data');
        }
      } catch (error) {
        console.error('Error fetching user data:', error);
      }
    };

    fetchUser();
    setIsLoading(false);
  }, []);


  useEffect(() => {
    if (userId) {
      const fetchMessages = async () => {
        try {
          const response = await axios.get(`/api/chat/${userId}`);
          if (response.status === 200) {
            setMessages(response.data);
          } else {
            console.error('Failed to fetch chat messages');
          }
        } catch (error) {
          console.error('Error fetching chat messages:', error);
        }
      }
      fetchMessages();
    }
  };
  [userId];

  const sendMessage = async () => {
    if (newMessage.trim() === '') return;

    try {
      const response = await axios.post('/api/chat', {
        userId: userId,
        message: newMessage,
      });

      if (response.status === 201) {
        setMessages([...messages, response.data]);
        setNewMessage('');
      } else {
        console.error('Failed to send message');
      }
    } catch (error) {
      console.error('Error sending message:', error);
    }
  };

  return (
    <div>
      <h2>Chat Room</h2>
      {isLoading ? (
        <p>Loading chat messages...</p>
      ) : (
        <div>
          {messages.map((msg) => (
            <div key={msg._id} className="chat-message">
              <p>{msg.message}</p>
              <p>User: {msg.userName}</p>
            </div>
          ))}
          <div className="input-group">
            <input
              type="text"
              placeholder="Type your message..."
              value={newMessage}
              onChange={(e) => setNewMessage(e.target.value)}
            />
            <button onClick={sendMessage}>Send</button>
          </div>
        </div>
      )}
    </div>
  );
};

export default chat;