const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Mock database (replace with actual MongoDB integration)
const polls = [
  { id: 1, question: 'What is your favorite color?', options: ['Red', 'Blue', 'Green'], votes: {} },
  { id: 2, question: 'Do you like pizza?', options: ['Yes', 'No'], votes: {} },
];

// Routes
app.get('/polls', (req, res) => {
  res.json(polls);
});

app.post('/polls', (req, res) => {
  const newPoll = req.body;
  newPoll.id = polls.length + 1;
  polls.push(newPoll);
  res.json(newPoll);
});

app.put('/polls/:id', (req, res) => {
  const { id } = req.params;
  const { question, options } = req.body;

  const pollIndex = polls.findIndex((poll) => poll.id === parseInt(id));

  if (pollIndex === -1) {
    return res.status(404).json({ message: 'Poll not found' });
  }

  polls[pollIndex].question = question;
  polls[pollIndex].options = options;

  res.json(polls[pollIndex]);
});

app.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});