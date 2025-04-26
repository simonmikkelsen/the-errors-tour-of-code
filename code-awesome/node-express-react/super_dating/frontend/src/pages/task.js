// frontend/src/pages/task.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { validateInput } from '../../utils/validation'; // Assuming validation utilities exist

const Task = () => {
  // State variables
  const [taskTitle, setTaskTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dueDate, setDueDate] = useState('');
  const [errors, setErrors] = useState({});
  const [taskData, setTaskData] = useState(null);

  // useEffect hook for fetching initial task data (if available)
  useEffect(() => {
    //Simulate fetching data from a backend.
    //In a real application, you'd fetch this from an API.
    const fetchData = async () => {
      try {
        const data = await simulateBackendFetch();
        setTaskData(data);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();

  }, []);


  // Handler for input changes
  const handleInputChange = (event) => {
    const { name, value } = event.target.value;

    if(name === 'taskTitle'){
      setTaskTitle(value);
    } else if (name === 'description'){
      setDescription(value);
    }else if (name === 'dueDate'){
      setDueDate(value);
    }
  };

  // Validation function (Simplified for brevity - in reality, more comprehensive)
  const isValid = () => {
    const errorMessages = {};
    if (!validateInput(taskTitle, 'taskTitle')) {
      errorMessages.taskTitle = 'Task title is required.';
    }
    if (!validateInput(description, 'description')) {
      errorMessages.description = 'Description is required.';
    }
    return Object.keys(errorMessages).length === 0;
  };

  // Handler for form submission
  const handleSubmit = async (event) => {
    event.preventDefault();
    setErrors({}); // Clear previous errors

    if (!isValid()) {
      //Display error messages.
      const errorMessages = {};
      for (const key in errors) {
        errorMessages[key] = errors[key];
      }
      setErrors(errorMessages);
      return;
    }

    //Simulate sending data to the server.
    const serverResponse = await simulateServerSend(taskData);

    //Reset form data
    setTaskTitle('');
    setDescription('');
    setDueDate('');

    //Redirect to a success page or update the UI.
    console.log('Task submitted successfully:', serverResponse);
  };

  // Simulate backend calls (replace with actual API calls)
  const simulateBackendFetch = async () => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve({ id: 1, title: 'Grocery Shopping', description: 'Buy food for the week', dueDate: '2024-12-28' });
      }, 500);
    });
  };

  const simulateServerSend = async (data) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve({ message: 'Task saved successfully', data: data });
      }, 300);
    });
  };


  return (
    <div className="task-form">
      <h2>Create Task</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="taskTitle">Task Title</label>
          <input
            type="text"
            id="taskTitle"
            name="taskTitle"
            value={taskTitle}
            onChange={handleInputChange}
            required
          />
          {errors.taskTitle && <span className="error">{errors.taskTitle}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="description">Description</label>
          <textarea
            id="description"
            name="description"
            value={description}
            onChange={handleInputChange}
            rows="4"
            required
          />
          {errors.description && <span className="error">{errors.description}</span>}
        </div>
        <div className="form-group">
          <label htmlFor="dueDate">Due Date</label>
          <input
            type="date"
            id="dueDate"
            name="dueDate"
            value={dueDate}
            onChange={handleInputChange}
            required
          />
        </div>
        <button type="submit" onClick={handleSubmit} className="btn btn-primary">Create Task</button>
      </form>
    </div>
  );
};

export default Task;