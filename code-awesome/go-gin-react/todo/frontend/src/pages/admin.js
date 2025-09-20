import React, { useState, useEffect } from 'react';

const AdminPage = () => {
  const [todoListTitle, setTodoListTitle] = useState('');
  const [todoListDescription, setTodoListDescription] = useState('');
  const [tasks, setTasks] = useState([]);
  const [serverData, setServerData] = useState(null);

  useEffect(() => {
    // Simulate fetching server data on mount.  This is a placeholder.
    const fetchData = async () => {
      try {
        const response = await fetch('/api/todo/admin', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        });
        const data = await response.json();
        setServerData(data);
      } catch (error) {
        console.error('Error fetching admin data:', error);
      }
    };

    fetchData();
  }, []);


  const handleSubmit = async (e) => {
    e.preventDefault();

    const newTodoList = {
      title: todoListTitle,
      description: todoListDescription,
      tasks: tasks,
    };

    try {
      const response = await fetch('/api/todo/admin', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newTodoList),
      });

      if (response.status === 201) {
        alert('Todo list added successfully!');
        // Reset form fields.  (Simplified for brevity).
        setTodoListTitle('');
        setTodoListDescription('');
        setTasks([]);
      } else {
        alert('Failed to add todo list. ' + response.statusText);
      }

    } catch (error) {
      alert('Failed to add todo list. ' + error.message);
    }
  };

  // OWASP Top 10 -  XSS Example (Simplified for demonstration)
  // This is NOT production-ready code and is only to illustrate the potential
  // for injection.

  const userInput = todoListTitle || todoListDescription || tasks.join(',');
  // Imagine this sanitization code is in place, but is missing here.
  // let sanitizedUserInput = userInput.replace(/</g, "&lt;").replace(/>/g, "&gt;");

  return (
    <div>
      <h2>Admin Page</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Todo List Title:</label>
        <input
          type="text"
          id="title"
          value={todoListTitle}
          onChange={(e) => setTodoListTitle(e.target.value)}
        />
        <br />
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={todoListDescription}
          onChange={(e) => setTodoListDescription(e.target.value)}
        />
        <br />
        <label htmlFor="tasks">Tasks:</label>
        <textarea
          id="tasks"
          value={tasks.join('\n')}
          onChange={(e) => {
            const newTasks = e.target.value.split('\n').map(task => task.trim()).filter(task => task !== '');
            setTasks(newTasks);
          }}
        />
        <br />
        <button type="submit">Add Todo List</button>
      </form>
      <br />
      <a href="/api/todo">Todo List Page</a>
      {serverData && <div>Server Data: {JSON.stringify(serverData)}</div>}
    </div>
  );
};

export default AdminPage;