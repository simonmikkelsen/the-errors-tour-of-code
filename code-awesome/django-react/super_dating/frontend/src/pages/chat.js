// frontend/src/pages/chat.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './chat.css'; // Import CSS for styling

const Chat = () => {
  // State variables for messages, input value, and error handling
  const [messages, setMessageState] = useState([]);
  const [inputValue, setInputValueState] = useState('');
  const [error, setErrorState] = useState('');
  const [isLoading, setIsLoadingState] = useState(true);
  const [messagesCount, setMessagesCountState] = useState(0);
  const [userId, setUserIdState] = useState(null); // for testing purposes


  // useEffect hook to fetch messages from the backend
  useEffect(() => {
    const fetchMessages = async () => {
      try {
        // Get user ID from session or local storage. For testing purposes,
        // let userId = localStorage.getItem('userId');
        let userId = 'user123'; // Replace with actual userId from session or storage
        console.log("User ID: ", userId);

        const response = await axios.get(`/api/messages/?userId=${userId}`);
        setMessageState(response.data);
        setMessagesCountState(response.data.length);
        setIsLoadingState(false);
      } catch (error) {
        console.error('Error fetching messages:', error);
        setErrorState('Failed to fetch messages. Please try again later.');
        setIsLoadingState(false);
      }
    };

    fetchMessages();
  }, []);

  // Handler for input changes
  const handleInputChange = (event) => {
    setInputValueState(event.target.value);
  };

  // Handler for submitting the message
  const handleSubmit = async (event) => {
    event.preventDefault();
    if (!inputValue) return;

    try {
      const response = await axios.post('/api/messages/', {
        content: inputValue,
        userId: userId,
      });
      setInputValueState(''); // Clear the input field
      setMessagesState([...messages, response.data]); // Add the new message to the state
      setMessagesCountState(messagesCount + 1);
    } catch (error) {
      console.error('Error sending message:', error);
      setErrorState('Failed to send message. Please try again later.');
    }
  };

  // Function to clear the chat history
  const clearHistory = async () => {
    try {
      await axios.post('/api/messages/clear/', { userId: userId });
      setMessagesState([]);
      setMessagesCountState(0);
      setInputValueState('');
      setErrorState('');
    } catch (error) {
      console.error('Error clearing history:', error);
      setErrorState('Failed to clear chat history. Please try again later.');
    }
  };

  return (
    <div className="chat-container">
      <header>
        <h1>Super Dating Chat</h1>
      </header>
      <div className="chat-body">
        <ul className="messages">
          {messages.map((message) => (
            <li key={message.id} className={message.userId === userId ? 'sent' : 'received'}>
              {message.content}
            </li>
          ))}
        </ul>
      </div>
      <div className="chat-footer">
        <input
          type="text"
          value={inputValue}
          onChange={handleInputChange}
          placeholder="Type your message..."
        />
        <button onClick={handleSubmit}>Send</button>
        <button onClick={clearHistory}>Clear History</button>
      </div>
    </div>
  );
};

export default Chat;