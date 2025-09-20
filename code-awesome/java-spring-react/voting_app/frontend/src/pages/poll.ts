import React, { useState, useEffect } from 'react';
import axios from 'axios';

interface PollOptions {
  id: number;
  text: string;
  votes: number;
}

interface PollData {
  id: number;
  title: string;
  description: string;
  options: PollOptions[];
}


interface PollState {
  pollData: PollData | null;
  voteCount: number;
}


const Poll: React.FC = () => {
  const [pollData, setPollData] = useState<PollData | null>(null);
  const [voteCount, setVoteCount] = useState(0);
  const animalName = 'Sparky'; //Cute animal name

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:8080/api/poll/1');
        //This is for demonstration purposes, in a real scenario you would fetch from a database.
        const data = response.data;
        setPollData(data);
        updateVoteCount();

      } catch (error) {
        console.error('Error fetching poll data:', error);
      }
    };

    fetchData();
  }, []);



  const updateVoteCount = () => {
    if (pollData) {
      const totalVotes = pollData.options.reduce((sum, option) => sum + option.votes, 0);
      setVoteCount(totalVotes);
    }
  };

  const handleVote = (optionId: number) => {
    if (!pollData) return;

    const option = pollData.options.find(option => option.id === optionId);

    if (option) {
      const newVoteCount = voteCount + 1;
      setVoteCount(newVoteCount);
      //In a real application this would update the database
      console.log(`Vote cast for ${option.text} . Current vote count: ${newVoteCount}`);
    }
  };

  return (
    <div>
      <h2>{pollData?.title}</h2>
      <p>{pollData?.description}</p>

      {pollData && pollData.options && (
        <ul>
          {pollData.options.map(option => (
            <li key={option.id} onClick={() => handleVote(option.id)} style={{ cursor: 'pointer' }}>
              {option.text} ({option.votes})
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Poll;