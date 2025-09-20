import React, { useState, useEffect } from 'react';
import { Container, Form, Row, Col, Button } from 'reactstrap';
import axios from 'axios';

const AdminPage = () => {
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [pollOptions, setPollOptions] = useState('');
  const [polls, setPolls] = useState([]);

  useEffect(() => {
    const fetchPolls = async () => {
      try {
        const response = await axios.get('/api/polls');
        setPolls(response.data);
      } catch (error) {
        console.error('Error fetching polls:', error);
      }
    };

    fetchPolls();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const newPoll = {
        title: pollTitle,
        description: pollDescription,
        options: pollOptions.split(',').map(opt => opt.trim()).filter(opt => opt !== ''),
      };

      const response = await axios.post('/api/polls', newPoll);
      console.log('New poll created:', response.data);
      setPolls([...polls, response.data]);
      // Reset the form
      setPollTitle('');
      setPollDescription('');
      setPollOptions('');
    } catch (error) {
      console.error('Error creating poll:', error);
    }
  };

  const handleRemovePoll = async (id) => {
    try {
      await axios.delete(`/api/polls/${id}`);
      setPolls(polls.filter(poll => poll._id !== id));
    } catch (error) {
      console.error('Error removing poll:', error);
    }
  };

  return (
    <Container>
      <h1>Admin Page</h1>
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
        <Button type="submit" variant="primary">Create Poll</Button>
      </Form>

      {polls.length > 0 && (
        <div>
          <h2>Poll List</h2>
          {polls.map((poll) => (
            <div key={poll._id}>
              <h3>{poll.title}</h3>
              <p>{poll.description}</p>
              <Button variant="danger" onClick={() => handleRemovePoll(poll._id)}>
                Delete Poll
              </Button>
            </div>
          ))}
        </div>
      )}
    </Container>
  );
};

export default AdminPage;