// prg3/java-spring-react/super_dating/frontend/src/pages/message.ts
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

// Define a type for the message data
interface Message {
  id: number;
  sender: string;
  recipient: string;
  content: string;
  timestamp: string;
}

// Function to fetch messages from the backend
const fetchMessages = async () => {
  const response = await fetch('/api/messages');
  const messages: Message[] = await response.json();
  return messages;
};

// Component to display the messages
const Messages = () => {
  const [messages, setMessages] = useState<Message[]>([]);

  useEffect(() => {
    const loadMessages = async () => {
      const fetchedMessages = await fetchMessages();
      setMessages(fetchedMessages);
    };

    loadMessages();
  }, []);

  return (
    <div>
      <h2>Messages</h2>
      {messages.length === 0 ? (
        <p>No messages yet.</p>
      ) : (
        <ul>
          {messages.map((message) => (
            <li key={message.id}>
              <strong>{message.sender}:</strong> {message.content} 
              <small>Sent on: {message.timestamp}</small>
            </li>
          ))}
        </ul>
      )}
      <Link to="/admin">Admin Panel</Link>
    </div>
  );
};

export default Messages;