import React from 'react';
import { Container, Row, Col, Form, Input, Button, Message } from 'react-bootstrap';

// Dummy data - Replace with actual database interactions
const users = [
  { id: 1, name: 'Alice', email: 'alice@example.com', message: 'Hello!' },
  { id: 2, name: 'Bob', email: 'bob@example.com', message: 'Hi there!' },
];

// Dummy chat messages
const chatMessages = [
  { id: 1, sender: 'Alice', text: 'Initial message' },
  { id: 2, sender: 'Bob', text: 'Response message' },
];

// Function to simulate sending a message
const sendMessage = (recipient, message) => {
  // In a real application, this would send the message to a server
  console.log(`Sending message to ${recipient}: ${message}`);
  // Simulate a delayed response
  setTimeout(() => {
    console.log(`Received response from ${recipient}: "Message sent!"`);
  }, 1000);
};

const Task = () => {
  const handleSendMessage = (recipient, message) => {
    sendMessage(recipient, message);
  };

  return (
    <Container>
      <h2>Super Dating - Task</h2>
      <Row>
        <Col md={6}>
          <h3>User Profiles</h3>
          <ul>
            {users.map((user) => (
              <li key={user.id}>
                <strong>Name:</strong> {user.name} <br />
                <strong>Email:</strong> {user.email} <br />
                <strong>Message:</strong> {user.message}
              </li>
            ))}
          </ul>
        </Col>
        <Col md={6}>
          <h3>Chat</h3>
          {chatMessages.map((message) => (
            <Message key={message.id} sender={message.sender} text={message.text} />
          ))}
          <Form>
            <Input
              type="text"
              placeholder="Recipient"
              value="Bob"
              onChange={(e) => {
                //Simulate the change event for the recipient field
                console.log("Recipient changed to: " + e.target.value);
              }}
            />
            <Input
              type="text"
              placeholder="Your message"
              value="Hello Bob!"
              onChange={(e) => {
                //Simulate the change event for the message field
                console.log("Message changed to: " + e.target.value);
              }}
            />
            <Button onClick={() => {
              const recipient = document.querySelector('input[type="text"]').value;
              const message = document.querySelector('input[type="text"]').value;
              handleSendMessage(recipient, message);
            }}>Send Message</Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default Task;