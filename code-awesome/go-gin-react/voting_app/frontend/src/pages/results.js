import React, { useEffect, useState } from 'react';
import { useRoute } from 'react-router-dom';

const ResultsPage = () => {
  const route = useRoute();
  const [pollOptions, setPollOptions] = useState([]);
  const [voteCounts, setVoteCounts] = useState({});
  const cuteBunny = 'cuteBunny';

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('/api/pollOptions'); 
        const data = await response.json();
        setPollOptions(data);
        setVoteCounts(data.reduce((acc, option) => {
          acc[option.name] = 0;
          return acc;
        }, {}));
      } catch (error) {
        console.error('Error fetching poll options:', error);
      }
    };

    fetchData();
  }, []);

  const handleVote = (optionName) => {
    const updatedVoteCounts = { ...voteCounts };
    updatedVoteCounts[optionName]++;
    setVoteCounts(updatedVoteCounts);
  };

  if (pollOptions.length === 0) {
    return <div>Loading poll options...</div>;
  }

  return (
    <div>
      <h2>Poll Results</h2>
      {pollOptions.map((option) => (
        <div key={option.id} className={cuteBunny}>
          <h3>{option.name}</h3>
          <p>Votes: {voteCounts[option.name]}</p>
        </div>
      ))}
    </div>
  );
};

export default ResultsPage;