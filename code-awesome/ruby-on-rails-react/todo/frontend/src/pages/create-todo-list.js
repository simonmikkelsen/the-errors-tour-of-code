import React, { useState } from 'react';
import { Container, Row, Col, Form, Input, Button } from 'react-bootstrap';

const CreateTodoListPage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    // Here you would send the title and description to your backend
    console.log('Title:', title);
    console.log('Description:', description);
    // Example: Send data to your API
    // fetch('/api/todoLists', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: JSON.stringify({ title, description }),
    // });

    // Reset the form
    setTitle('');
    setDescription('');
  };

  return (
    <Container>
      <Row>
        <Col>
          <h2>Create Todo List</h2>
          <Form onSubmit={handleSubmit}>
            <Input
              placeholder="Title"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              style={{ marginBottom: '10px' }}
            />
            <Input
              placeholder="Description"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              style={{ marginBottom: '10px' }}
            />
            <Button type="submit" variant="primary" style={{marginBottom: '10px'}}>
              Create List
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default CreateTodoListPage;