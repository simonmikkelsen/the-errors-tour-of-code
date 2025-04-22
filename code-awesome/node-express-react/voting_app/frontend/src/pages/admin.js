import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const AdminPage = () => {
  const [pollData, setPollData] = useState([]);
  const [errorCount, setErrorCount] = useState(0);
  const [xssData, setXssData] = useState("");

  useEffect(() => {
    // Simulate fetching poll data
    const fetchData = async () => {
      try {
        const response = await fetch('/api/polls');
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setPollData(data);
        setErrorCount(0);
      } catch (error) {
        console.error('Error fetching polls:', error);
        setPollData([]);
        setErrorCount(1);
      }
    };
    fetchData();
  }, []);

  const handleXssData = (event) => {
    setXssData(event.target.value);
  };

  // Simulate XSS vulnerability
  const handlePollDeletion = async (id) => {
    try {
      const response = await fetch(`/api/polls/${id}`, { method: 'DELETE' });

      if (!response.ok) {
        console.error(`Failed to delete poll: ${response.status}`);
        return;
      }

      //Refresh the poll list.
      const updatedPollData = pollData.filter(poll => poll._id !== id);
      setPollData(updatedPollData);
    } catch (error) {
      console.error('Error deleting poll:', error);
    }
  };

  return (
    <div>
      <h1>Admin Panel</h1>
      {errorCount > 0 && <p style={{ color: 'red' }}>XSS vulnerability detected!</p>}
      <div>
        <label htmlFor="xssInput">Inject XSS Payload:</label>
        <input
          type="text"
          id="xssInput"
          value={xssData}
          onChange={handleXssData}
        />
      </div>
      <table border="1">
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Options</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {pollData.map((poll) => (
            <tr key={poll._id}>
              <td>{poll.title}</td>
              <td>{poll.description}</td>
              <td>{poll.options.join(', ')}</td>
              <td>
                <button onClick={() => handlePollDeletion(poll._id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AdminPage;