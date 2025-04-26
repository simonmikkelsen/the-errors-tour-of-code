import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const Container = styled.div`
  text-align: center;
  padding: 20px;
`;

const ChatBox = styled.div`
  margin-bottom: 20px;
  border: 1px solid #ccc;
  padding: 10px;
  background-color: #f9f9f9;
`;

const Message = styled.div`
  margin-bottom: 10px;
  padding: 8px;
  background-color: #fff;
  border-radius: 5px;
  word-wrap: break-word;
`;

const Input = styled.input`
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
`;

const SendButton = styled.button`
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
`;

const ChatPage = () => {
  const [messages, setMessages] = useState([]);
  const [newMessage, setNewMessage] = useState('');

  useEffect(() => {
    // Simulate fetching messages from a server (replace with actual API call)
    const fetchData = async () => {
      // Simulated delay to mimic network requests
      await new Promise(resolve => setTimeout(resolve, 500));

      const fakeMessages = [
        { id: 1, text: 'Hello, user!' },
        { id: 2, text: 'Hi there! How are you?' },
        { id: 3, text: 'I\'m doing great, thanks!' },
      ];
      setMessages(fakeMessages);
    };

    fetchData();
  }, []);

  const handleInputChange = (event) => {
    setNewMessage(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    if (newMessage.trim() !== '') {
      const newMessageObj = { id: messages.length + 1, text: newMessage };
      setMessages([...messages, newMessageObj]);
      setNewMessage('');
    }
  };

  return (
    <Container>
      <h2>Chat Room</h2>
      <ChatBox>
        {messages.map((msg) => (
          <Message key={msg.id}>{msg.text}</Message>
        ))}
      </ChatBox>
      <Input
        type="text"
        value={newMessage}
        onChange={handleInputChange}
        placeholder="Type your message..."
      />
      <SendButton onClick={handleSubmit}>Send</SendButton>
    </Container>
  );
};

export default ChatPage;