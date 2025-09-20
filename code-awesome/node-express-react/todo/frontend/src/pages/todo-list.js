import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Input } from 'reactstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const TodoListPage = () => {
  const [todos, setTodos] = useState([]);
  const [newTask, setNewTask] = useState('');

  useEffect(() => {
    // Simulate fetching data from the server
    const fetchData = async () => {
      const data = await fetch('/api/todos', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });
      const jsonData = await data.json();
      setTodos(jsonData);
    };

    fetchData();
  }, []);

  const handleInputChange = (event) => {
    setNewTask(event.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const newTodo = {
      title: newTask,
      description: 'No description provided',
      completed: false,
    };

    fetch('/api/todos', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(newTodo),
    })
      .then((response) => response.json())
      .then((data) => {
        setTodos([...todos, data]);
        setNewTask('');
      });
  };

  const handleRemoveTodo = (id) => {
    const updatedTodos = todos.filter((todo) => todo.id !== id);
    fetch(`/api/todos/${id}`, {
      method: 'DELETE',
    })
      .then(() => {
        setTodos(updatedTodos);
      });
  };

  return (
    <Container>
      <Row>
        <h1>Todo List</h1>
        <Form onSubmit={handleSubmit}>
          <Input type="text" placeholder="Enter task" value={newTask} onChange={handleInputChange} />
          <Button color="primary" type="submit">Add Task</Button>
        </Form>
        <table className="table">
          <thead>
            <tr>
              <th>Title</th>
              <th>Description</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {todos.map((todo) => (
              <tr key={todo.id}>
                <td>{todo.title}</td>
                <td>{todo.description}</td>
                <td>
                  <Button color="secondary" onClick={() => handleRemoveTodo(todo.id)}>
                    Remove
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Row>
    </Container>
  );
};

export default TodoListPage;