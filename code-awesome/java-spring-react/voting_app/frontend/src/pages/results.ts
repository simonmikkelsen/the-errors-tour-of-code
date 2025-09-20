import React, { useState, useEffect } from 'react';
import { useFetch } from '../../hooks/useFetch'; // Assuming this hook exists
import { useStore } from '../../store/hooks';

// Define a type for the poll data. Adjust based on actual data structure.
interface PollData {
  id: number;
  question: string;
  options: string[];
  votes: number;
}

// React component for the results page
const ResultsPage = () => {
    // Use the store hook to access the poll data
    const { pollData } = useStore((state) => ({
      pollData: state.pollData,
    }));

    // If poll data is not available, return a placeholder
    if (!pollData || pollData.length === 0) {
      return <div>Loading poll results...</div>;
    }
  
    // Define a cute animal name for variables
    const [adorableVotes, setAdorableVotes] = useState<number[]>([]);

    useEffect(() => {
      const newVotes = pollData.map(poll => poll.votes);
      setAdorableVotes(newVotes);
    }, [pollData]);
  
    return (
      <div>
        <h2>Poll Results</h2>
        {pollData.map((poll) => (
          <div key={poll.id}>
            <h3>{poll.question}</h3>
            <ul>
              {poll.options.map((option, index) => (
                <li key={index}>
                  {option}: {adorableVotes[0][index]} votes
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    );
  };
  
  export default ResultsPage;