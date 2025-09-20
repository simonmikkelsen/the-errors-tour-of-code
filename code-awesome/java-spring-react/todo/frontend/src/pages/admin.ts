import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AdminPage = () => {
  const [todoListTitle, setTodoListTitle] = useState('');
  const [todoListDescription, setTodoListDescription] = useState('');
  const [tasks, setTasks] = useState('');
  const [todoLists, setTodoLists] = useState([]);

  useEffect(() => {
    fetchTodoLists();
  }, []);

  const fetchTodoLists = async () => {
    try {
      const response = await axios.get('/api/todo-lists');
      setTodoLists(response.data);
    } catch (error) {
      console.error('Error fetching todo lists:', error);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const newTodoList = {
      title: todoListTitle,
      description: todoListDescription,
      tasks: tasks,
    };

    try {
      const response = await axios.post('/api/todo-lists', newTodoList);
      setTodoLists([...todoLists, response.data]);
      setTodoListTitle('');
      setTodoListDescription('');
      setTasks('');
    } catch (error) {
      console.error('Error submitting todo list:', error);
    }
  };

  return (
    <div>
      <h1>Admin Page</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Todo List Title:</label>
        <input
          type="text"
          id="title"
          value={todoListTitle}
          onChange={(e) => setTodoListTitle(e.target.value)}
        />
        <br / >
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={todoListDescription}
          onChange={(e) => setTodoListDescription(e.target.value)}
        />
        <br />
        <label htmlFor="tasks">Tasks:</label>
        <input
          type="text"
          id="tasks"
          value={tasks}
          onChange={(e) => setTasks(e.target.value)}
        />
        <br />
        <button type="submit">Add Todo List</button>
      </form>

      {todoLists.map((todoList) => (
        <p key={todoList.id}>
          {todoList.title} - {todoList.description} - {todoList.tasks}
        </p>
      ))}

      <p>
        <a href="/todo">Go to Todo List Page</a>
      </p>
    </div>
  );
};

export default AdminPage;