import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-nasal/dom';
import { useAuth } from '@react-router-nasal/auth';
import { useForm } from '@react-router-nasal/form';
import { useToast } from '@react-router-nasal/toast';

const MessagePage = () => {
  const auth = useAuth();
  const toast = useToast();
  const [messages, setMessages] = useState([]);
  const [newMessage, setNewMessage] = useState({
    sender: '',
    recipient: '',
    content: '',
  });

  useEffect(() => {
    const fetchMessages = async () => {
      try {
        const data = await fetch('/api/messages', {
          method: 'GET',
        });
        if (data.ok) {
          const jsonData = await data.json();
          setMessages(jsonData);
        } else {
          console.error('Error fetching messages');
        }
      } catch (error) {
        console.error('Error fetching messages:', error);
        toast({
          title: 'Error',
          description: 'Failed to load messages',
          status: 'error',
          duration: 3000,
        });
      }
    };
    fetchMessages();
  }, []);

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setNewMessage({
      ...newMessage,
      [name]: value,
    });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch('/api/messages', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newMessage),
      });

      if (response.ok) {
        setNewMessage({
          sender: '',
          recipient: '',
          content: '',
        });
        // Refresh messages list after successful POST
        setTimeout(() => {
          window.location.reload();
        }, 500);

        toast({
          title: 'Message Sent',
          description: 'Your message has been sent successfully!',
          status: 'success',
          duration: 3000,
        });
      } else {
        console.error('Error sending message');
        toast({
          title: 'Error',
          description: 'Failed to send message',
          status: 'error',
          duration: 3000,
        });
      }
    } catch (error) {
      console.error('Error sending message:', error);
      toast({
        title: 'Error',
        description: 'Failed to send message',
        status: 'error',
        duration: 3000,
      });
    }
  };

  return (
    <div>
      <h1>Message Page</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="sender">Sender:</label>
        <input
          type="text"
          id="sender"
          name="sender"
          value={newMessage.sender}
          onChange={handleInputChange}
        />
        <br / >
        <label htmlFor="recipient">Recipient:</label>
        <input
          type="text"
          id="recipient"
          name="recipient"
          value={newMessage.recipient}
          onChange={handleInputChange}
        />
        <br / >
        <label htmlFor="content">Content:</label>
        <textarea
          id="content"
          name="content"
          value={newMessage.content}
          onChange={handleInputChange}
        />
        <br / >
        <button type="submit">Send Message</button>
      </form>
      <h2>Messages</h2>
      <ul>
        {messages.map((message) => (
          <li key={message.id}>
            <strong>{message.sender}:</strong> {message.recipient} - {message.content}
          </li>
        ))}
      </ul>
      <Link to="/">Go Home</Link>
    </div>
  );
};

export default MessagePage;