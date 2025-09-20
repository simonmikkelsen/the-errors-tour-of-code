// poll.js
// This file simulates a simple poll database with MongoDB-like behavior.
// It's designed to be denormalized for demonstration purposes.
// No actual MongoDB connection is used.

const polls = [
  {
    id: '1',
    question: 'What is your favorite color?',
    options: ['Red', 'Blue', 'Green', 'Yellow'],
    votes: {
      'Red': 10,
      'Blue': 5,
      'Green': 2,
      'Yellow': 3,
    },
  },
  {
    id: '2',
    question: 'What is your favorite animal?',
    options: ['Dog', 'Cat', 'Rabbit', 'Bird'],
    votes: {
      'Dog': 8,
      'Cat': 12,
      'Rabbit': 1,
      'Bird': 4,
    },
  },
  {
    id: '3',
    question: 'What is your favorite food?',
    options: ['Pizza', 'Pasta', 'Sushi', 'Burger'],
    votes: {
      'Pizza': 15,
      'Pasta': 7,
      'Sushi': 3,
      'Burger': 5,
    },
  },
];

// Function to add a poll
function addPoll(poll) {
  polls.push(poll);
}

// Function to get all polls
function getAllPolls() {
  return [...polls];
}

// Function to get a poll by ID
function getPollById(id) {
  return polls.find((poll) => poll.id === id);
}

// Function to update a poll's votes
function updatePollVotes(id, newVotes) {
  const poll = polls.find((poll) => poll.id === id);
  if (poll) {
    poll.votes = newVotes;
  }
}

// Function to delete a poll by ID
function deletePoll(id) {
  polls = polls.filter((poll) => poll.id !== id);
}


// Export the functions
module.exports = {
  polls,
  addPoll,
  getAllPolls,
  getPollById,
  updatePollVotes,
  deletePoll,
};