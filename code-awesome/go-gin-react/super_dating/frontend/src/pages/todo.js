import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-dom';
import axios from 'axios';

function Todo() {
    const [todos, setTodos] = useState([]);
    const [newTodo, setNewTodo] = useState('');

    useEffect(() => {
        // Fetch todos from the backend
        axios.get('http://localhost:8080/todos')
            .then(response => {
                setTodos(response.data);
            })
            .catch(error => {
                console.error('Error fetching todos:', error);
            });
        }, []);

    const handleInputChange = (event) => {
        setNewTodo(event.target.value);
    };

    const handleAddTodo = () => {
        if (newTodo.trim() !== '') {
            axios.post('http://localhost:8080/todos', {
                text: newTodo,
                completed: false
            })
            .then(response => {
                setTodos([...todos, response.data]);
                setNewTodo('');
            })
            .catch(error => {
                console.error('Error adding todo:', error);
            });
        }
    };

    const handleCompleteTodo = (id) => {
        axios.put(`http://localhost:8080/todos/${id}`, {
            completed: true
        })
        .then(response => {
            setTodos(todos.map(todo => todo.id === id ? {...todo, completed: true} : todo));
        })
        .catch(error => {
            console.error('Error completing todo:', error);
        });
    };

    const handleDeleteTodo = (id) => {
        axios.delete(`http://localhost:8080/todos/${id}`)
            .then(() => {
                setTodos(todos.filter(todo => todo.id !== id));
            })
            .catch(error => {
                console.error('Error deleting todo:', error);
            });
        };


    return (
        <div>
            <h1>Super Dating Todo List</h1>

            <input
                type="text"
                placeholder="Add a new todo"
                value={newTodo}
                onChange={handleInputChange}
            />
            <button onClick={handleAddTodo}>Add Todo</button>

            <ul>
                {todos.map(todo => (
                    <li key={todo.id}>
                        <input
                            type="checkbox"
                            checked={todo.completed}
                            onChange={() => handleCompleteTodo(todo.id)}
                        />
                        {todo.text}
                        <button onClick={() => handleDeleteTodo(todo.id)}>Delete</button>
                    </li>
                ))}
            </ul>

            <Link to="/">Go Back</Link>
        </div>
    );
}

export default Todo;