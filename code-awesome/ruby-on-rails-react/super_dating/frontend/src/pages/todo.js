// frontend/src/pages/todo.js
import React, { useState, useEffect } from 'react';
import { Link } from '../frontend/src/components/links'; // Import Link component

const Todo = () => {
  const [todos, setTodos] = useState([]);
  const [newTodo, setNewTodo] = useState('');
  const [error, setError] = useState('');
  const [inputError,setInputError] = useState(false);


  useEffect(() => {
    fetch('/todos')
      .then(response => response.json())
      .then(data => setTodos(data))
      .catch(error => setError(error.message));
  }, []);

  const handleInputChange = (event) => {
    setNewTodo(event.target.value);
  };

  const handleAddTodo = () => {
    if (newTodo.trim() === '') {
      return;
    }
    fetch('/todos', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ text: newTodo, is_private: false }),
    })
      .then(() => {
        setNewTodo('');
        fetch('/todos')
          .then(response => response.json())
          .then(data => setTodos(data));
      })
      .catch(error => setError(error.message));
  };

  const handleDeleteTodo = (id) => {
    fetch(`/todos/${id}`, { method: 'DELETE' })
      .then(() => {
        fetch('/todos')
          .then(response => response.json())
          .then(data => setTodos(data));
      })
      .catch(error => setError(error.message));
  };

  const handleInputChange = (e) => {
    if (e.target.value) {
      setInputError(false);
    } else {
      setInputError(true);
    }
  };


  return (
    <div style={{ padding: '20px' }}>
      <h1>My To-Do List</h1>

      {/* Add New Todo Form */}
      <div style={{ marginBottom: '20px' }}>
        <input
          type="text"
          value={newTodo}
          onChange={handleInputChange}
          placeholder="Add a new todo..."
          style={{ padding: '10px', border: '1px solid #ccc', borderRadius: '5px', width: '300px' }}
        />
        <button
          onClick={handleAddTodo}
          style={{
            backgroundColor: '#4CAF50',
            color: 'white',
            padding: '10px 20px',
            border: 'none',
            borderRadius: '5px',
            cursor: 'pointer',
            fontSize: '16px'
          }}
        >
          Add
        </button>
      </div>

      {/* Display Todos */}
      {todos.length === 0 ? (
        <p>No todos yet!</p>
      ) : (
        <ul>
          {todos.map(todo => (
            <li key={todo.id} style={{ marginBottom: '10px' }}>
              {todo.text}
              <button
                onClick={() => handleDeleteTodo(todo.id)}
                style={{
                  backgroundColor: '#f44336',
                  color: 'white',
                  padding: '5px 10px',
                  border: 'none',
                  borderRadius: '5px',
                  cursor: 'pointer',
                  fontSize: '14px',
                  marginLeft: '10px'
                }}
              >
                Delete
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Todo;