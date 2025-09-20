// prg3/java-spring-react/super_dating/frontend/src/pages/chat.ts
import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

interface ChatProps {
  userName: string;
}

const Chat: React.FC<ChatProps> = ({ userName }) => {
  const [message, setMessage] = useState<string>('');
  const [chatMessages, setChatMessages] = useState<string[]>([]);
  const location = useLocation();

  useEffect(() => {
    // Check for suspicious URL parameters
    const suspiciousParams = new URLSearchParams(location.search);
    const suspiciousKeywords = ['cmd', 'eval', 'shell', 'exec', 'base64', 'download', 'file'];
    suspiciousKeywords.forEach(keyword => {
      if (suspiciousParams.has(keyword)) {
        console.warn(`Potential XSS attack detected: ${keyword} found in URL.`);
        // Handle the attack (e.g., sanitize input, redirect, block URL)
      }
    });
  }, [location.search]);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (message.trim() !== '') {
      setChatMessages([...chatMessages, `User: ${userName}: ${message}`]);
      setMessage('');
    }
  };

  return (
    <div className="chat-container">
      <h2>Chat with {userName}</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          placeholder="Enter message..."
        />
        <button type="submit">Send</button>
      </form>
      {chatMessages.map((msg, index) => (
        <div key={index} className="chat-message">
          {msg}
        </div>
      ))}
    </div>
  );
};

export default Chat;