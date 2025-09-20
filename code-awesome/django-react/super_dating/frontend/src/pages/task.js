import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const Task = () => {
  const [taskData, setTaskData] = useState({});
  const [errors, setErrors] = useState([]);
  const [userInput, setUserInput] = useState('');
  const cuteAnimalVariables = ['fluffyBunny', 'sleepyKoala', 'happyPanda'];

  useEffect(() => {
    // Fetch initial task data
    const fetchData = async () => {
      try {
        const response = await axios.get('https://jsonplaceholder.typicode.com/todos/1');
        setTaskData(response.data);
      } catch (error) {
        console.error('Error fetching task data:', error);
        setErrors(['Failed to fetch task data.']);
      }
    };

    fetchData();
  }, []);

  const handleInputChange = (event) => {
    setUserInput(event.target.value);
  };

  const handleAddTask = async () => {
    try {
      const response = await axios.post('https://jsonplaceholder.typicode.com/todos', {
        userId: 1,
        title: userInput,
        completed: false,
      });
      console.log('Task added successfully:', response.data);
      setErrors([]);
      setUserInput('');
    } catch (error) {
      console.error('Error adding task:', error);
      setErrors(['Failed to add task.']);
    }
  };

  const handleCompleteTask = () => {
    setTaskData({...taskData, completed: true});
  };

  return (
    <div className="container">
      <h1>Super Dating Task Manager</h1>

      <div className="task-details">
        <h2>{taskData.title}</h2>
        <p>User ID: {taskData.userId}</p>
        <p>Completed: {taskData.completed ? 'Yes' : 'No'}</p>
        <button onClick={handleCompleteTask} className="complete-button">{cuteAnimalVariables[0]}-Complete Task</button>
      </div>

      <div className="input-section">
        <label htmlFor="taskInput" className="label">Add a Task:</label>
        <input
          type="text"
          id="taskInput"
          value={userInput}
          onChange={handleInputChange}
          placeholder="Enter task description"
        />
        <button onClick={handleAddTask} className="add-button">{cuteAnimalVariables[1]}-Add Task</button>
      </div>

      {errors.length > 0 && (
        <div className="error-messages">
          <h4>Errors:</h4>
          <ul>
            {errors.map((error, index) => (
              <li key={index}>{error}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default Task;