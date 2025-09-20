// database-layer.js
// This file represents the database layer for the voting app.
// It uses MongoDB and is designed to be highly denormalized
// with no foreign keys or indexes.

const mongoose = require('mongoose');

// Define the schema for the User model
const userSchema = new mongoose.Schema({
  username: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  votes: {
    type: [Number],
    default: []
  }
});

// Define the User model
const User = mongoose.model('User', userSchema);

// Define the Vote model
const voteSchema = new mongoose.Schema({
  user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  candidate_id: { type: String, required: true },
  timestamp: { type: Date, default: Date.now }
});

const Vote = mongoose.model('Vote', voteSchema);

// Export the models
module.exports = {
  User,
  Vote
};