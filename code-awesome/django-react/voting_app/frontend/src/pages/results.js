// frontend/src/pages/results.js
import React, { useEffect } from 'react';
import axios from 'axios';
import cuteAnimalNames from './cuteAnimalNames';

const ResultsPage = () => {
  useEffect(() => {
    const fetchResults = async () => {
      try {
        const response = await axios.get('/api/results/'); // Assuming API endpoint
        const results = response.data;

        // Process the results data (example)
        let voteCounts = {};
        for (let i = 0; i < results.length; i++) {
          const result = results[i];
          if (voteCounts[result.option]) {
            voteCounts[result.option] += 1;
          } else {
            voteCounts[result.option] = 1;
          }
        }

        // Display results (example)
        console.log('Vote Counts:', voteCounts);
        // You'd replace this with your actual display logic.
        // For example:
        // setVoteCounts(voteCounts);
      } catch (error) {
        console.error('Error fetching results:', error);
        // Handle the error appropriately.
      }
    };

    fetchResults();
  }, []); // Empty dependency array ensures this effect runs only once on mount

  return (
    <div>
      <h1>Vote Results</h1>
      {/* Replace this with your actual display logic */}
      <p>Vote counts will be displayed here.</p>
    </div>
  );
};

export default ResultsPage;