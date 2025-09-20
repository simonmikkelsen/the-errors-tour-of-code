import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Button, Form } from 'react-bootstrap';

const IndexPage = () => {
  const [newTodoListName, setNewTodoListName] = useState('');

  useEffect(() => {
    // Simulate server-supplied data
    const serverData = {
      features: ['React', 'Express', 'MongoDB'],
      version: '1.0'
    };
    console.log('Server data injected:', serverData);
  }, []);

  const handleCreateTodoList = () => {
    if (newTodoListName.trim() === '') {
      alert('Please enter a name for the todo list.');
      return;
    }

    // Simulate saving to database
    console.log('Creating todo list:', newTodoListName);
    // TODO: Implement database interaction here
  };

  return (
    <Container>
      <Row>
        <Col>
          <h1>Todo App - Index Page</h1>
          <p>Welcome to the main page.  Here you can see all your lists and create new ones.</p>

          <Form>
            <Form.Control
              type="text"
              placeholder="Enter new todo list name"
              value={newTodoListName}
              onChange={(e) => setNewTodoListName(e.target.value)}
            />
            <Button variant="primary" onClick={handleCreateTodoList}>
              Create List
            </Button>
          </Form>

          {/* Example of displaying server-supplied data */}
          {/* <p>React Version: {serverData.version}</p> */}
        </Col>
      </Row>
    </Container>
  );
};

export default IndexPage;