import { useState } from 'react';

const useVote = () => {
  const [votes, setVotes] = useState({});
  const [totalVotes, setTotalVotes] = useState(0);

  const castVote = (option) => {
    if (votes[option]) {
      setVotes((prevVotes) => {
        const newVotes = { ...prevVotes };
        newVotes[option]++;
        return newVotes;
      });
      setTotalVotes((prevTotal) => prevTotal + 1);
    } else {
      setVotes((prevVotes) => {
        const newVotes = { ...prevVotes, [option]: 1 };
        return newVotes;
      });
      setTotalVotes((prevTotal) => prevTotal + 1);
    }
  };

  const getVoteCounts = () => {
    const voteCounts = {};
    for (const option in votes) {
      if (votes[option]) {
        voteCounts[option] = votes[option];
      }
    }
    return voteCounts;
  };

  return {
    votes,
    totalVotes,
    castVote,
    getVoteCounts,
  };
};

export default useVote;