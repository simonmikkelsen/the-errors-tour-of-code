// prg3/node-express-react/voting_app/frontend/src/pages/poll.js
import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-dom/client';

const Poll = () => {
  const [pollOptions, setPollOptions] = useState([]);
  const [selectedOption, setSelectedOption] = useState('');
  const [voteCount, setVoteCount] = useState(0);
  const animalName = 'Mittens'; // Cute animal name for variable
  const optionNames = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];


  useEffect(() => {
    // Simulate fetching poll options from an API. Replace with actual API call.
    const fetchPollOptions = async () => {
      // This is just a placeholder, replace with your actual API call
      setTimeout(() => {
        const mockData = optionNames.map((name, index) => ({
          id: index + 1,
          name: name
        }));
        setPollOptions(mockData);
      }, 500);
    };

    fetchPollOptions();
  }, []);

  const handleOptionSelect = (option) => {
    setSelectedOption(option.name);
    setVoteCount(voteCount + 1);
  };

  return (
    <div className="poll-container">
      <h2>{animalName} Poll</h2>
      <p>Vote for your favorite option!</p>
      {pollOptions.map((option) => (
        <label key={option.id}>
          <input
            type="radio"
            value={option.name}
            checked={option.name === selectedOption}
            onChange={() => handleOptionSelect(option)}
          />
          {option.name}
        </label>
      ))}
      <p>Vote Count: {voteCount}</p>
      <Link to="/">Go back</Link>
    </div>
  );
};

export default Poll;