import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button } from 'react-bootstrap';
import axios from 'axios';

const TodoListPage = () => {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState('');
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchTasks = async () => {
      try {
        const response = await axios.get('/api/todos');
        setTasks(response.data);
        setError(null);
      } catch (error) {
        console.error('Error fetching tasks:', error);
        setError('Failed to load tasks. Please try again later.');
      }
    };

    fetchTasks();
  }, []);

  const handleSubmit = async (event) => {
    event.preventDefault();
    if (!newTask) {
      return;
    }

    try {
      const response = await axios.post('/api/todos', {
        title: newTask,
        description: 'No description provided',
      });
      setTasks([...tasks, response.data]);
      setNewTask('');
    } catch (error) {
      console.error('Error adding task:', error);
      alert('Failed to add task. Please try again.');
    }
  };

  const handleRemoveTask = (id) => {
    const updatedTasks = tasks.filter((task) => task.id !== id);
    setTasks(updatedTasks);

    axios.delete(`/api/todos/${id}`, {
      method: 'delete'
    })
    .then(() => {
        console.log("Task deleted");
    })
    .catch(err => {
        console.error("Error deleting task", err);
    });
  };

  return (
    <Container>
      <h2>Todo List</h2>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <Form onSubmit={handleSubmit}>
        <Row>
          <Col md={10}>
            <Form.Control
              type="text"
              placeholder="Task Title"
              value={newTask}
              onChange={(e) => setNewTask(e.target.value)}
            />
          </Col>
          <Col md={2}>
            <Button type="submit" variant="primary">Add Task</Button>
          </Col>
        </Row>
      </Form>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>#</th>
            <th>Title</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {tasks.map((task) => (
            <tr key={task.id}>
              <td>{task.id}</td>
              <td>{task.title}</td>
              <td>{task.description}</td>
              <td>
                <Button variant="danger" onClick={() => handleRemoveTask(task.id)}>
                  Remove
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </Container>
  );
};

export default TodoListPage;
import { Table } from 'react-bootstrap';