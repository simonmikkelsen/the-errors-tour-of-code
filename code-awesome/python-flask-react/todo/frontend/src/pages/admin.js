import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AdminPage = () => {
  const [todoLists, setTodoLists] = useState([]);
  const [selectedTodoListId, setSelectedTodoListId] = useState('');
  const [newTodoListTitle, setNewTodoListTitle] = useState('');
  const [newTodoListDescription, setNewTodoListDescription] = useState('');

  useEffect(() => {
    const fetchTodoLists = async () => {
      try {
        const response = await axios.get('/api/todo-lists');
        setTodoLists(response.data);
      } catch (error) {
        console.error('Error fetching todo lists:', error);
      }
    };

    fetchTodoLists();
  }, []);

  const handleSelectTodoList = (id) => {
    setSelectedTodoListId(id);
  };

  const handleCreateNewTodoList = async (e) => {
    e.preventDefault();
    if (!newTodoListTitle || !newTodoListDescription) {
      alert('Please enter a title and description.');
      return;
    }

    try {
      const response = await axios.post('/api/todo-lists', {
        title: newTodoListTitle,
        description: newTodoListDescription,
      });
      setTodoLists([...todoLists, response.data]);
      setNewTodoListTitle('');
      setNewTodoListDescription('');
    } catch (error) {
      console.error('Error creating todo list:', error);
      alert('Failed to create todo list.');
    }
  };

  const handleDeleteTodoList = async (id) => {
    try {
      await axios.delete(`/api/todo-lists/${id}`);
      setTodoLists(todoLists.filter((list) => list.id !== id));
    } catch (error) {
      console.error('Error deleting todo list:', error);
      alert('Failed to delete todo list.');
    }
  };

  return (
    <div>
      <h1>Admin Panel</h1>

      <div>
        <h2>Manage Todo Lists</h2>
        <table>
          <thead>
            <tr>
              <th>Title</th>
              <th>Description</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {todoLists.map((list) => (
              <tr key={list.id}>
                <td>{list.title}</td>
                <td>{list.description}</td>
                <td>
                  <button onClick={() => handleSelectTodoList(list.id)}>View</button>
                  <button onClick={() => handleDeleteTodoList(list.id)}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div>
        <h2>Create New Todo List</h2>
        <form onSubmit={handleCreateNewTodoList}>
          <label htmlFor="title">Title:</label>
          <input type="text" id="title" value={newTodoListTitle} onChange={(e) => setNewTodoListTitle(e.target.value)} />
          <br />
          <label htmlFor="description">Description:</label>
          <input type="text" id="description" value={newTodoListDescription} onChange={(e) => setNewTodoListDescription(e.target.value)} />
          <br />
          <button type="submit">Create</button>
        </form>
      </div>
    </div>
  );
};

export default AdminPage;