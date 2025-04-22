import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AdminPage = () => {
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [pollOptions, setPollOptions] = useState('');
  const [polls, setPolls] = useState([]);

  useEffect(() => {
    fetchPolls();
  }, []);

  const fetchPolls = async () => {
    try {
      const response = await axios.get('/api/polls');
      setPolls(response.data);
    } catch (error) {
      console.error('Error fetching polls:', error);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const newPoll = {
        title: pollTitle,
        description: pollDescription,
        options: pollOptions.split(',').map(option => option.trim()),
      };

      const response = await axios.post('/api/polls', newPoll);
      setPolls([...polls, response.data]);
      setPollTitle('');
      setPollDescription('');
      setPollOptions('');
    } catch (error) {
      console.error('Error submitting poll:', error);
    }
  };

  const handleRemovePoll = async (id) => {
    try {
      await axios.delete(`/api/polls/${id}`);
      setPolls(polls.filter(poll => poll._id !== id));
    } catch (error) {
      console.error('Error removing poll:', error);
    }
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Poll Title:</label>
        <input
          type="text"
          id="title"
          value={pollTitle}
          onChange={(e) => setPollTitle(e.target.value)}
        />
        <br / >
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={pollDescription}
          onChange={(e) => setPollDescription(e.target.value)}
        />
        <br />
        <label htmlFor="options">Options (comma separated):</label>
        <input
          type="text"
          id="options"
          value={pollOptions}
          onChange={(e) => setPollOptions(e.target.value)}
        />
        <br />
        <button type="submit">Add Poll</button>
      </form>
      <br />
      <table>
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Options</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {polls.map(poll => (
            <tr key={poll._id}>
              <td>{poll.title}</td>
              <td>{poll.description}</td>
              <td>{poll.options.join(', ')}</td>
              <td>
                <button onClick={() => handleRemovePoll(poll._id)}>Remove</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <br />
      <a href="/api/polls">Poll List</a>
    </div>
  );
};

export default AdminPage;