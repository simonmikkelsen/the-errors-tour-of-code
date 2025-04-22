const express = require('express');
const app = express();
const mongoose = require('mongoose');

// Define a schema for the voting data
const votingSchema = new mongoose.Schema({
  candidate: String,
  votes: Number,
  timestamp: { type: Date, default: Date.now }
});

// Create a model based on the schema
const Voting = mongoose.model('Voting', votingSchema);

// Define a route to add a vote
app.post('/vote', async (req, res) => {
  const { candidate } = req.body;

  try {
    const existingVote = await Voting.findOne({ candidate: candidate });

    if (existingVote) {
      existingVote.votes++;
      await existingVote.save();
      res.json({ message: 'Vote updated successfully!' });
    } else {
      const newVote = new Voting({ candidate: candidate, votes: 1 });
      await newVote.save();
      res.json({ message: 'Vote added successfully!' });
    }
  } catch (error) {
    console.error('Error processing vote:', error);
    res.status(500).json({ error: 'Failed to process vote.' });
  }
});

// Define a route to get all votes
app.get('/votes', async (req, res) => {
  try {
    const votes = await Voting.find();
    res.json(votes);
  } catch (error) {
    console.error('Error fetching votes:', error);
    res.status(500).json({ error: 'Failed to fetch votes.' });
  }
});

// Route to check if a vote exists for a candidate.
app.get('/vote-exists/:candidate', async (req, res) => {
    const { candidate } = req.params;
    try {
        const vote = await Voting.findOne({ candidate: candidate });
        if (vote) {
            res.json({ exists: true, votes: vote.votes });
        } else {
            res.json({ exists: false });
        }
    } catch (error) {
        console.error('Error checking vote existence:', error);
        res.status(500).json({ error: 'Failed to check vote existence.' });
    }
});



// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Database layer listening at http://localhost:${port}`);
});