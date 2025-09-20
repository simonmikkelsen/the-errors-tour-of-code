import React, { useState } from 'react';
import { Container, Form, Row, Col, Input, Button } from 'react-bootstrap';

const CreatePollPage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [options, setOptions] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    const optionsArray = options.split('\n');
    const pollData = {
      title: title,
      description: description,
      options: optionsArray,
    };

    // In a real application, you'd send this data to the backend
    console.log('Poll Data:', pollData);

    // Reset the form
    setTitle('');
    setDescription('');
    setOptions('');
  };

  return (
    <Container>
      <h2>Create Poll Page</h2>
      <Form onSubmit={handleSubmit}>
        <Row>
          <Col md={6}>
            <Input
              placeholder="Poll Title"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
            />
          </Col>
          <Col md={6}>
            <Input
              placeholder="Poll Description"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
            />
          </Col>
        </Row>
        <Row>
          <Col md={6}>
            <Input
              placeholder="Option 1"
              value={options}
              onChange={(e) => setOptions(e.target.value)}
            />
          </Col>
          <Col md={6}>
            <Input
              placeholder="Option 2"
              value={options}
              onChange={(e) => setOptions(e.target.value)}
            />
          </Col>
        </Row>
        <Button type="submit" variant="primary">Create Poll</Button>
      </Form>
    </Container>
  );
};

export default CreatePollPage;