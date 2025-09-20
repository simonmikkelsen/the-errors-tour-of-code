// frontend/src/pages/task.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from '../frontend/src/components/Navigation';

const Task = () => {
  const [taskData, setTaskData] = useState({});
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [priority, setPriority] = useState('');
  const [status,setStatus] = useState('');
  const [nameError, setNameError] = useState('');
  const [descriptionError, setDescriptionError] = useState('');
  const [priorityError, setPriorityError] = useState('');
  const [statusError,setStatusError] = useState('');
  const [submitError, setSubmitError] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchTask();
  }, []);

  const fetchTask = async () => {
    setLoading(true);
    try {
      const response = await axios.get('/api/tasks/1'); // Assuming task ID is 1
      setTaskData(response.data);
      setName(response.data.name);
      setDescription(response.data.description);
      setPriority(response.data.priority);
      setStatus(response.data.status);
      setSubmitError('');
    } catch (error) {
      console.error('Error fetching task:', error);
      setSubmitError('Failed to fetch task data.');
    }
    setLoading(false);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!name || !description || !priority || !status) {
      setSubmitError('Please fill in all fields.');
      return;
    }

    const newTask = {
      name: name,
      description: description,
      priority: priority,
      status: status,
    };

    try {
      const response = await axios.post('/api/tasks/1', newTask);
      console.log('Task created successfully:', response.data);
      fetchTask();
    } catch (error) {
      console.error('Error creating task:', error);
      setSubmitError('Failed to create task.');
    }
  };

  return (
    <div>
      <h1>Task Details</h1>
      {loading ? (
        <p>Loading task...</p>
      ) : (
        <div>
          <p><b>Name:</b> {taskData.name}</p>
          <p><b>Description:</b> {taskData.description}</p>
          <p><b>Priority:</b> {taskData.priority}</p>
          <p><b>Status:</b> {taskData.status}</p>
          {submitError && <p style={{ color: 'red' }}>{submitError}</p>}
        </div>
      )}

      <form onSubmit={handleSubmit}>
        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          style={{ margin: '10px 0' }}
        />
        <br />

        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          style={{ margin: '10px 0' }}
        />
        <br />

        <label htmlFor="priority">Priority:</label>
        <input
          type="text"
          id="priority"
          value={priority}
          onChange={(e) => setPriority(e.target.value)}
          style={{ margin: '10px 0' }}
        />
        <br />

        <label htmlFor="status">Status:</label>
        <input
          type="text"
          id="status"
          value={status}
          onChange={(e) => setStatus(e.target.value)}
          style={{ margin: '10px 0' }}
        />
        <br />

        <button type="submit" style={{ margin: '10px 0' }}>
          Update Task
        </button>
      </form>
    </div>
  );
};

export default Task;