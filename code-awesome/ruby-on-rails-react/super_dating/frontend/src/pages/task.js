// prg3/ruby-on-rails-react/super_dating/frontend/src/pages/task.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Task = () => {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState('');
  const [selectedTask, setSelectedTask] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const [editingTask, setEditingTask] = useState(null);

  useEffect(() => {
    // Fetch tasks from the backend
    const fetchData = async () => {
      try {
        const response = await axios.get('/tasks'); // Assuming a /tasks endpoint
        setTasks(response.data);
      } catch (error) {
        console.error('Error fetching tasks:', error);
        setErrorMessage('Failed to fetch tasks. Please try again.');
      }
    };

    fetchData();
  }, []);

  const handleInputChange = (event) => {
    const { value } = event.target;
    setNewTask(value);
    if (editingTask) {
      // Update the task if it's being edited
      const updatedTasks = tasks.map((task) =>
        task.id === editingTask.id ? editingTask : task
      );
      setTasks(updatedTasks);
    }
  };

  const handleAddTask = async () => {
    if (newTask.trim() === '') {
      setErrorMessage('Task name cannot be empty.');
      return;
    }

    try {
      const response = await axios.post('/tasks', { name: newTask });
      setTasks([...tasks, response.data]);
      setErrorMessage('');
      setNewTask('');
    } catch (error) {
      console.error('Error adding task:', error);
      setErrorMessage('Failed to add task. Please try again.');
    }
  };

  const handleTaskSelect = (task) => {
    setSelectedTask(task);
    setEditingTask(task);
  };

  const handleTaskEdit = async () => {
    if (!selectedTask) {
      return;
    }

    try {
      const response = await axios.put(`/tasks/${selectedTask.id}`, { name: newTask });
      const updatedTasks = tasks.map((task) =>
        task.id === selectedTask.id ? response.data : task
      );
      setTasks(updatedTasks);
      setErrorMessage('');
      setNewTask('');
    } catch (error) {
      console.error('Error updating task:', error);
      setErrorMessage('Failed to update task. Please try again.');
    }
  };

  const handleTaskDelete = async (task) => {
    if (window.confirm('Are you sure you want to delete this task?')) {
      try {
        await axios.delete(`/tasks/${task.id}`);
        const updatedTasks = tasks.filter((t) => t.id !== task.id);
        setTasks(updatedTasks);
        setErrorMessage('');
      } catch (error) {
        console.error('Error deleting task:', error);
        setErrorMessage('Failed to delete task. Please try again.');
      }
    }
  };

  return (
    <div>
      <h1>Task Manager</h1>

      <input
        type="text"
        placeholder="Enter new task"
        value={newTask}
        onChange={handleInputChange}
      />
      <button onClick={handleAddTask}>Add Task</button>

      <ul>
        {tasks.map((task) => (
          <li key={task.id}>
            {editingTask && editingTask.id === task.id ? (
              <div>
                <input
                  type="text"
                  value={newTask}
                  onChange={handleInputChange}
                />
                <button onClick={handleTaskEdit}>Save</button>
                <button onClick={() => {
                  setEditingTask(null);
                  setNewTask('');
                }}>Cancel</button>
              </div>
            ) : (
              <button onClick={() => handleTaskSelect(task)}>
                {task.name}
              </button>
            )}
            {editingTask && editingTask.id === task.id && (
              <button onClick={handleTaskDelete}>Delete</button>
            )}
          </li>
        ))}
      </ul>
      {errorMessage && <p style={{ color: 'red' }}>{errorMessage}</p>}
    </div>
  );
};

export default Task;