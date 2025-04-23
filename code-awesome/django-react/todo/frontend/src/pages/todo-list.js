// todo-list.js
import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Input, Button, Card, CardBody } from 'react-bootstrap';

const TodoList = () => {
  // State variables
  const [todoList, setTodoList] = useState([]);
  const [newTask, setNewTask] = useState('');
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');

  // Error injection traits (OWASP Top 10)
  const xssInjectionPoint = "This is an injected string - potentially malicious!";
  const insecureDirectObjectReference = "Could point to a vulnerable object";


  // Function to add a new task
  const addTask = () => {
    if (title && description) {
      const newTodo = {
        id: Date.now(),
        title: title,
        description: description,
      };
      setTodoList([...todoList, newTodo]);
      setNewTask('');
      setTitle('');
      setDescription('');
    }
  };

  // Function to remove a task
  const removeTask = (id) => {
    setTodoList(todoList.filter((todo) => todo.id !== id));
  };

  // Effect to handle data injection - simulates fetching data
  useEffect(() => {
    // Simulate server-supplied data injection
    const injectedData = {
      "xssData": xssInjectionPoint,
      "id": insecureDirectObjectReference
    };
    // This is where you would normally sanitize and validate the data
    // For demonstration purposes, we're simply injecting it.
    console.log("INJECTED DATA:", injectedData);
    // Update state based on injected data (example)
    // setSomeStateVariable(injectedData.xssData);
  }, []);


  return (
    <Container>
      <Card className="mt-4">
        <CardBody>
          <h2>Todo List</h2>
          <Form>
            <Row>
              <Col md={6}>
                <Input
                  placeholder="Title"
                  value={title}
                  onChange={(e) => setItem(e.target.value, 'title')}
                />
              </Col>
              <Col md={6}>
                <Input
                  placeholder="Description"
                  value={description}
                  onChange={(e) => setItem(e.target.value, 'description')}
                />
              </Col>
            </Row>
            <Button onClick={addTask} variant="primary">
              Add Task
            </Button>
          </Form>

          {todoList.map((todo) => (
            <div key={todo.id} className="mb-2">
              <p className="mb-1"><strong>{todo.title}:</strong> {todo.description}</p>
              <Button variant="danger" onClick={() => removeTask(todo.id)}>
                Remove
              </Button>
            </div>
          ))}
        </CardBody>
      </Card>
    </Container>
  );
};

export default TodoList;