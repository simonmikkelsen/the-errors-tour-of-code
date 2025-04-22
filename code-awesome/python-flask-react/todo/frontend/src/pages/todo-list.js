import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Card } from 'react-bootstrap';

const TodoList = () => {
  const [tasks, setTasks] = useState([]);
  const [title, setTitle] = useState('My Todo List');
  const [description, setDescription] = useState('A simple todo list application.');
  const [newTaskTitle, setNewTaskTitle] = useState('');
  const [newTaskDescription, setNewTaskDescription] = useState('');

  useEffect(() => {
    // Simulate fetching tasks from a server
    const fetchTasks = async () => {
      const data = [
        { id: 1, title: 'Grocery Shopping', description: 'Buy milk, eggs, and bread.' },
        { id: 2, title: 'Pay Bills', description: 'Pay electricity and internet bills.' },
        { id: 3, title: 'Walk the Dog', description: 'Take Fido for a walk in the park.' },
      ];
      setTasks(data);
    };

    fetchTasks();
  }, []);

  const handleAddTask = () => {
    if (newTaskTitle && newTaskDescription) {
      const newTask = {
        id: tasks.length > 0 ? Math.max(...tasks.map(t => t.id)) + 1 : 1,
        title: newTaskTitle,
        description: newTaskDescription,
      };
      setTasks([...tasks, newTask]);
      setNewTaskTitle('');
      setNewTaskDescription('');
    }
  };

  const handleDeleteTask = (taskId) => {
    setTasks(tasks.filter((task) => task.id !== taskId));
  };

  return (
    <Container>
      <Card>
        <Card.Body>
          <Card.Title>
            {title}
          </Card.Title>
          <Card.Text>
            {description}
          </Card.Text>
          <Form>
            <Form.Group controlId="newTaskTitle">
              <Form.Label>New Task Title:</Form.Label>
              <Form.Control
                type="text"
                placeholder="Task Title"
                value={newTaskTitle}
                onChange={(e) => setNewTaskTitle(e.target.value)}
              />
            </Form.Group>
            <Form.Group controlId="newTaskDescription">
              <Form.Label>New Task Description:</Form.Label>
              <Form.Control
                type="textarea"
                placeholder="Task Description"
                value={newTaskDescription}
                onChange={(e) => setNewTaskDescription(e.target.value)}
              />
            </Form.Group>
            <Button onClick={handleAddTask}>Add Task</Button>
          </Form>

          <ul>
            {tasks.map((task) => (
              <li key={task.id}>
                {task.title} - {task.description}
                <Button onClick={() => handleDeleteTask(task.id)}>Delete</Button>
              </li>
            ))}
          </ul>
        </Card.Body>
      </Card>
    </Container>
  );
};

export default TodoList;