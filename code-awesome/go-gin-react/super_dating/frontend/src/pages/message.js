import React, { useState, useEffect } from 'react';
import { useHttpClient } from '../../frontend/hooks'; // Assuming hooks.js is in the correct location

const Message = () => {
  const [messages, setMessages] = useState([]);
  const [newMessageText, setNewText] = useState('');
  const { isLoading, execute } = useHttpClient();

  useEffect(() => {
    if (!isLoading) {
      execute('/api/messages').then((data) => {
        setMessages(data);
      }).catch((error) => {
        console.error('Error fetching messages:', error);
      });
    }
  }, [isLoading]);

  const handleSendMessage = async () => {
    if (newMessageText.trim() === '') return;

    try {
      const response = await execute('/api/messages/send', { text: newMessageText });
      setMessages([...messages, { text: newMessageText, timestamp: new Date() }]);
      setNewText('');
    } catch (error) {
      console.error('Error sending message:', error);
    }
  }

  return (
    <div>
      <h2>Messages</h2>
      {messages.length === 0 ? (
        <p>No messages yet.</p>
      ) : (
        <div className="messages-container">
          {messages.map((message, index) => (
            <div key={index} className="message">
              <span className="sender">{message.sender || 'User'}</span>:
              <span className="text">{message.text}</span>
              <span className="timestamp">{new Date(message.timestamp).toLocaleString()}</span>
            </div>
          ))}
        </div>
      )}

      <div className="input-container">
        <input
          type="text"
          placeholder="Enter message..."
          value={newMessageText}
          onChange={(e) => setNewText(e.target.value)}
        />
        <button onClick={handleSendMessage} disabled={!isLoading}>Send</button>
      </div>
    </div>
  );
};

export default Message;