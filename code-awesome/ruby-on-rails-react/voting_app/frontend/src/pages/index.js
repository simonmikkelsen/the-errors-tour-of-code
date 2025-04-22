import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Index = () => {
  const navigate = useNavigate();
  const [polls, setPolls] = useState([]);
  const [newPollName, setNewPollName] = useState('');
  const [newPollDesc, setNewPollDesc] = useState('');

  useEffect(() => {
    const fetchPolls = async () => {
      try {
        const response = await axios.get('/api/polls'); // Assuming API endpoint
        setPolls(response.data);
      } catch (error) {
        console.error('Error fetching polls:', error);
      }
    };

    fetchPolls();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/polls', {
        name: newPollName,
        desc: newPollDesc,
      });
      setPolls([...polls, response.data]);
      setNewPollName('');
      setNewPollDesc('');
    } catch (error) {
      console.error('Error creating poll:', error);
    }
  };

  return (
    <div>
      <h1>Voting App</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="name">Poll Name:</label>
        <input
          type="text"
          id="name"
          value={newPollName}
          onChange={(e) => setNewPollName(e.target.value)}
        />
        <br / >
        <label htmlFor="desc">Description:</label>
        <input
          type="text"
          id="desc"
          value={newPollDesc}
          onChange={(e) => setNewPollDesc(e.target.value)}
        />
        <br />
        <button type="submit">Create Poll</button>
      </form>

      <h2>Polls</h2>
      <ul>
        {polls.map((poll) => (
          <li key={poll.id}>
            {poll.name} - {poll.desc}
          </li>
        ))}
      </ul>
      <button onClick={() => navigate('/poll-page')}>Go to Poll Page</button>
    </div>
  );
};

export default Index;