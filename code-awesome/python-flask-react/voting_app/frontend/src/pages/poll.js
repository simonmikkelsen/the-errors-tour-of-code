import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const poll = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [options, setOptions] = useState([]);
  const [votes, setVotes] = useState({});
  const [results, setResults] = useState({});

  useEffect(() => {
    // Simulate fetching poll data from the server
    const fetchData = async () => {
      const data = await fetch('/api/poll').then(res => {
        if (!res.ok) {
          throw new Error('No response from server');
        }
        return res.json();
      });

      setTitle(data.title);
      setDescription(data.description);
      setOptions(data.options);
      setVotes(data.votes);
    };

    fetchData();
  }, []);

  const handleVote = (option) => {
    setVotes((prevVotes) => {
      const newVotes = { ...prevVotes };
      const optionName = option;
      if (!newVotes[optionName]) {
        newVotes[optionName] = 0;
      }
      newVotes[optionName]++;
      return newVotes;
    });
  };

  useEffect(() => {
    // Calculate results after each vote
    const calculateResults = () => {
      const newResults = {};
      const allOptions = Object.keys(votes);
      allOptions.forEach(option => {
        newResults[option] = votes[option];
      });
      setResults(newResults);
    };

    calculateResults();
  });

  return (
    <div>
      <h2>{title}</h2>
      <p>{description}</p>

      {options.map((option) => (
        <div key={option} onClick={() => handleVote(option)}>
          {option} - Votes: {votes[option] || 0}
        </div>
      ))}

      <div>
        <h2>Results</h2>
        {Object.keys(results).length > 0 ? (
          <ul>
            {Object.keys(results).map(option => (
              <li key={option}>{option}: {results[option]}</li>
            ))}
          </ul>
        ) : (
          <p>No votes yet.</p>
        )}
      </div>
    </div>
  );
};

export default poll;