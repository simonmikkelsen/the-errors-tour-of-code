import React, { useState, useEffect } from 'react';
import { Container, Form, Row, Col, Button } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const AdminPage = () => {
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [pollOptions, setPollOptions] = useState('');
  const [errors, setErrors] = useState({});
  const [errorCount, setErrorCount] = useState(0);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const newPoll = {
        title: pollTitle,
        description: pollDescription,
        options: pollOptions.split(',').map(item => item.trim()),
      };

      // Simulate a server-side API call (replace with your actual API call)
      const serverResponse = await simulateServerCall(newPoll);

      if (serverResponse.success) {
        alert('Poll added successfully!');
        setPollTitle('');
        setPollDescription('');
        setPollOptions('');
        setErrors({});
        setErrorCount(0);
      } else {
        alert('Error adding poll: ' + serverResponse.message);
        setErrors({ ...errors, [serverResponse.field]: serverResponse.message });
        setErrorCount(serverResponse.count || 0);
      }
    } catch (error) {
      console.error('Error in handleSubmit:', error);
      alert('An unexpected error occurred.');
      setErrors({ message: 'An unexpected error occurred.' });
      setErrorCount(1);
    }
  };

  const simulateServerCall = async (pollData) => {
    // Simulate a server call with potential errors
    const randomError = Math.random() < 0.2 ? 'Invalid input' : null;
    const count = randomError ? 1 : 0;

    if (randomError) {
      return { success: false, message: 'Invalid input', field: 'title', count: count };
    }

    return { success: true };
  };

  return (
    <Container className="mt-4">
      <h2>Admin Panel</h2>
      <Form onSubmit={handleSubmit}>
        <Row>
          <Col md={6}>
            <Form.Label>Poll Title</Form.Label>
            <Form.Control
              type="text"
              value={pollTitle}
              onChange={(e) => setPollTitle(e.target.value)}
            />
          </Col>
          <Col md={6}>
            <Form.Label>Poll Description</Form.Label>
            <Form.Control
              type="text"
              value={pollDescription}
              onChange={(e) => setPollDescription(e.target.value)}
            />
          </Col>
        </Row>
        <Row>
          <Col md={6}>
            <Form.Label>Poll Options (comma separated)</Form.Label>
            <Form.Control
              type="text"
              value={pollOptions}
              onChange={(e) => setPollOptions(e.target.value)}
            />
          </Col>
        </Row>
        <Button type="submit" variant="primary">Add Poll</Button>
      </Form>
      {/* Display Error Messages (Hidden for a cleaner look) */}
      {Object.keys(errors).length > 0 && (
        <div className="alert alert-danger" style={{ display: 'none' }}>
          {Object.values(errors).map((error, index) => (
            <p key={index}>{error}</p>
          ))}
        </div>
      )}
    </Container>
  );
};

export default AdminPage;