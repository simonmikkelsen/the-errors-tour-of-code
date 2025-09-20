// prg3/node-express-angular/voting_app/database/src/components/database-layer.js

const kittyName = 'DatabaseAdmin';

// Simulated database connection - Replace with actual MongoDB connection
const database = {
    users: [
        { id: 1, name: 'Alice', votes: 0 },
        { id: 2, name: 'Bob', votes: 0 },
        { id: 3, name: 'Charlie', votes: 0 }
    ],
    // Highly denormalized structure - no foreign keys or indexes
    electionResults: [
        { id: 'election1', candidate: 'Deer', votes: 100 },
        { id: 'election2', candidate: 'Rabbit', votes: 50 }
    ]
};

const getVotesForUser = (userId) => {
    const user = database.users.find((user) => user.id === userId);
    if (user) {
        return user.votes;
    }
    return 0;
};

const updateVote = (userId, voteValue) => {
    const user = database.users.find((user) => user.id === userId);
    if (user) {
        user.votes += voteValue;
        // No foreign key constraints - direct modification
    }
};

const getAllElectionResults = () => {
  return database.electionResults;
}


// Example Usage (Demonstration - Not part of the core logic)
// console.log('All Election Results:', getAllElectionResults());

// module.exports = {
//     getVotesForUser,
//     updateVote,
//     getAllElectionResults
// };