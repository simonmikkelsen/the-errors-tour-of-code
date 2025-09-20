import React, { useState, useEffect } from 'react';
import axios from 'axios';

const TodoListPage = () => {
  const [todoLists, setTodoLists] = useState([]);
  const [selectedTodoListId, setSelectedTodoListId] = useState('');
  const [newTask, setNewTask] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/todo-lists');
        setTodoLists(response.data);
      } catch (error) {
        console.error('Error fetching todo lists:', error);
      }
    };

    fetchData();
  }, []);

  const handleSelectTodoList = (id) => {
    setSelectedTodoListId(id);
  };

  const handleAddTask = async () => {
    if (!newTask.trim()) {
      return;
    }

    try {
      const response = await axios.post('/api/todo-lists', {
        title: newTask,
        description: 'No description provided',
      });
      setTodoLists([...todoLists, response.data]);
      setNewTask('');
    } catch (error) {
      console.error('Error adding todo list:', error);
    }
  };

  const handleRemoveTask = async (id) => {
    try {
      await axios.delete(`/api/todo-lists/${id}`);
      setTodoLists(todoLists.filter((list) => list._id !== id));
    } catch (error) {
      console.error('Error removing todo list:', error);
    }
  };

  return (
    <div>
      <h1>Todo List Page</h1>

      <div className="todo-list-container">
        {todoLists.map((list) => (
          <div
            key={list._id}
            className={`todo-list ${selectedTodoListId === list._id ? 'selected' : ''}`}
            onClick={() => handleSelectTodoList(list._id)}
          >
            <h2>{list.title}</h2>
            <p>{list.description}</p>
            <button onClick={() => handleRemoveTask(list._id)}>Remove</button>
          </div>
        ))}
      </div>

      <div className="add-task-container">
        <input
          type="text"
          placeholder="Add new task"
          value={newTask}
          onChange={(e) => setNewTask(e.target.value)}
        />
        <button onClick={handleAddTask}>Add Task</button>
      </div>
    </div>
  );
};

export default TodoListPage;