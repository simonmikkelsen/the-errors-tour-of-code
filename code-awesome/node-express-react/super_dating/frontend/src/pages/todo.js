// frontend/src/pages/todo.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Todo = () => {
  const [todos, setTodos] = useState([]);
  const [newTodo, setNewTodo] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    // Fetch all todos from the backend
    const fetchTodos = async () => {
      try {
        const response = await axios.get('/api/todos'); // Assuming /api/todos is the endpoint
        setTodos(response.data);
        setError('');
      } catch (err) {
        console.error("Error fetching todos:", err);
        setTodos([]);
        setError('Failed to load todos. Check the console.');
      }
    };

    fetchTodos();
  }, []);

  const handleInputChange = (event) => {
    setNewTodo(event.target.value);
  };

  const handleAddTodo = async () => {
    if (!newTodo.trim()) {
      setError('Todo name cannot be empty.');
      return;
    }

    try {
      const response = await axios.post('/api/todos', {
        text: newTodo,
      });
      setTodos([...todos, response.data]);
      setNewTodo('');
      setError('');
    } catch (error) {
      console.error("Error adding todo:", error);
      setError('Failed to add todo. Check the console.');
    }
  };

  const handleDeleteTodo = async (id) => {
    try {
      await axios.delete(`/api/todos/${id}`);
      setTodos(todos.filter((todo) => todo._id !== id));
      setError('');
    } catch (error) {
      console.error("Error deleting todo:", error);
      setError('Failed to delete todo. Check the console.');
    }
  };

  return (
    <div>
      <h1>My To-Do List</h1>
      <div style={{ display: 'flex', gap: '20px' }}>
        <div>
          <input
            type="text"
            value={newTodo}
            onChange={handleInputChange}
            placeholder="Add a todo"
            style={{ width: '300px', padding: '10px', borderRadius: '5px', border: '1px solid #ccc' }}
          />
          <button onClick={handleAddTodo} style={{ padding: '10px 20px', backgroundColor: '#4CAF50', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer' }}>
            Add
          </button>
        </div>
      </div>

      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map((todo) => (
          <li key={todo._id} style={{ padding: '10px', borderBottom: '1px solid #eee', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            {todo.text}
            <button onClick={() => handleDeleteTodo(todo._id)} style={{ backgroundColor: 'red', color: 'white', border: 'none', padding: '5px 10px', borderRadius: '5px', cursor: 'pointer' }}>
              Delete
            </button>
          </li>
        ))}
      </ul>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <Link to="/" style={{ textDecoration: 'none', color: 'blue'}}>Go Back</Link>
    </div>
  );
};

export default Todo;