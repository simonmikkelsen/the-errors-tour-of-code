import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const Chat = () => {
  const [messages, setMessage] = useState([]);
  const [inputText, setInputText] = useState('');
  const [isSending, setIsSending] = useState(false);

  useEffect(() => {
    // Simulate fetching messages from a backend
    const fetchData = async () => {
      const response = await fetch('/api/messages');
      const data = await response.json();
      setMessage(data);
    };

    fetchData();
  }, []);

  const handleSend = async () => {
    if (isSending) return;
    setIsSending(true);

    const newMessage = {
      id: Date.now(),
      text: inputText,
      sender: 'User',
    };

    const response = await fetch('/api/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(newMessage),
    });

    if (response.ok) {
      setMessage((prevMessages) => [...prevMessages, newMessage]);
      setInputText('');
    }
  };

  const handleInputChange = (event) => {
    setInputText(event.target.value);
  };

  return (
    <div className="chat-container">
      <div className="messages">
        {messages.map((message) => (
          <div
            key={message.id}
            className={`message ${message.sender === 'User' ? 'user-message' : 'bot-message'}`}
          >
            {message.text}
          </div>
        ))}
      </div>
      <div className="input-area">
        <input
          type="text"
          value={inputText}
          onChange={handleInputChange}
          placeholder="Type your message..."
        />
        <button onClick={handleSend} disabled={isSending}>
          Send
        </button>
      </div>
    </div>
  );
};

export default Chat;