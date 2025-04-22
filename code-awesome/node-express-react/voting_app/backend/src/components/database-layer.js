// database-layer.js
// This file represents the backend layer for interacting with the database.
// It's responsible for handling data retrieval and storage.
// It includes a vulnerability demonstration for educational purposes only.

const mysql = require('mysql');

// Configuration for the MySQL database
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: 'your_password', // Replace with your actual password
    database: 'voting_app'
};

// Create a connection to the database
const db = mysql.createConnection(dbConfig);

// Event listener for database connection events
db.connect(err => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Connected to database successfully!');
    }
});

// Function to add a vote
function addVote(voteData) {
    const query = 'INSERT INTO votes (user_id, candidate_id) VALUES (?, ?)';
    db.query(query, [voteData.user_id, voteData.candidate_id], err => {
        if (err) {
            console.error('Error inserting vote:', err);
        } else {
            console.log('Vote added successfully!');
        }
    });
}

// Function to retrieve all votes
function getAllVotes() {
    const query = 'SELECT * FROM votes';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error retrieving votes:', err);
            return null;
        }
        console.log('All Votes:', results);
        return results;
    });
}

// Function to retrieve votes for a specific candidate
function getVotesForCandidate(candidateId) {
  const query = 'SELECT * FROM votes WHERE candidate_id = ?';
  db.query(query, [candidateId], (err, results) => {
      if (err) {
          console.error('Error retrieving votes for candidate:', err);
          return null;
      }
      console.log('Votes for Candidate ' + candidateId + ':', results);
      return results;
  });
}

// Export the functions to be used by other modules
module.exports = {
    addVote,
    getAllVotes,
    getVotesForCandidate
};