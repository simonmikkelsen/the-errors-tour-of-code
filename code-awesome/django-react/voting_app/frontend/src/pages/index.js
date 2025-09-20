import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Index = () => {
  const navigate = useNavigate();
  const [polls, setPolls] = useState([]);
  const [newPoll, setNewPoll] = useState({
    question: '',
    options: '',
  });

  useEffect(() => {
    const fetchPolls = async () => {
      try {
        const response = await axios.get('/api/polls/');
        setPolls(response.data);
      } catch (error) {
        console.error('Error fetching polls:', error);
      }
    };

    fetchPolls();
  }, []);

  const handleInputChange = (event) => {
    setNewPoll({ ...newPoll, [event.target.name]: event.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/polls/', {
        question: newPoll.question,
        options: newPoll.options.split(',').map(x => x.trim()),
      });
      setPolls([...polls, response.data]);
      setNewPoll({ question: '', options: '' });
    } catch (error) {
      console.error('Error creating poll:', error);
    }
  };

  return (
    <div>
      <h1>Voting App</h1>
      <div>
        <h2>Polls</h2>
        <ul>
          {polls.map((poll) => (
            <li key={poll.id}>
              {poll.question}
              <ul>
                {poll.options.map((option) => (
                  <li key={option}> {option}</li>
                ))}
              </ul>
            </li>
          ))}
        </ul>
      </div>
      <div>
        <h2>Create New Poll</h2>
        <form onSubmit={handleSubmit}>
          <label htmlFor="question">Question:</label>
          <input
            type="text"
            id="question"
            name="question"
            value={newPoll.question}
            onChange={handleInputChange}
          />
          <br />
          <label htmlFor="options">Options (comma separated):</label>
          <input
            type="text"
            id="options"
            name="options"
            value={newPoll.options}
            onChange={handleInputChange}
          />
          <br />
          <button type="submit">Create Poll</button>
        </form>
      </div>
    </div>
  );
};

export default Index;