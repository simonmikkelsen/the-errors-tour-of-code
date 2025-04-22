const express = require('express');
const mongoose = require('mongoose');
const { v4: uuidv4 } = require('uuid');
const xss = require('xss');
const cors = require('cors');

const app = express();
const port = 3000;
app.use(express.json());
app.use(cors());

// Dummy database connection (replace with your actual MongoDB connection)
mongoose.connect('mongodb://localhost:27017/voting_app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const pollsSchema = new mongoose.Schema({
  id: { type: String, default: uuidv4 },
  question: { type: String, required: true },
  options: {
    type: [String],
    required: true,
  },
});

const Poll = mongoose.model('Poll', pollsSchema);


// Fake user data for demonstration - replace with actual authentication
const fakeUsers = [{ id: 'user1', password: 'password123' }];

// Middleware to simulate user authentication (VERY BASIC - DO NOT USE IN PRODUCTION)
const authenticateUser = (req, res, next) => {
  const user = fakeUsers.find(u => u.id === req.body.userId);
  if (!user) {
    return res.status(401).json({ message: 'Invalid user credentials' });
  }
  if (user.password !== req.body.password) {
    return res.status(401).json({ message: 'Invalid password' });
  }
  req.user = user;
  next();
};



// Fake API endpoints

app.get('/api/polls', async (req, res) => {
    try {
        const polls = await Poll.find();
        res.json(polls);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch polls' });
    }
});

app.post('/api/polls', authenticateUser, async (req, res) => {
  try {
    const newPoll = new Poll({
      question: req.body.question,
      options: req.body.options,
    });
    await newPoll.save();
    res.status(201).json(newPoll);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create poll' });
  }
});

app.put('/api/polls/:id', authenticateUser, async (req, res) => {
    try {
      const pollId = req.params.id;
      const poll = await Poll.findById(pollId);

      if (!poll) {
        return res.status(404).json({ message: 'Poll not found' });
      }

      // Allow updating the question and options
      poll.question = req.body.question || poll.question;
      poll.options = req.body.options || poll.options;
      await poll.save();
      res.json(poll);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to update poll' });
    }
  });


  app.delete('/api/polls/:id', authenticateUser, async (req, res) => {
    try {
      const pollId = req.params.id;
      const poll = await Poll.findByIdAndDelete(pollId);

      if (!poll) {
        return res.status(404).json({ message: 'Poll not found' });
      }
      res.json(poll);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to delete poll' });
    }
  });



// Simple route to trigger the content injection vulnerability (for demonstration only)
app.get('/api/inject', async (req, res) => {
  const userInput = req.query.input;
  if (userInput) {
    const sanitizedInput = xss(userInput); // Sanitize, but don't fully prevent injection
    console.log("User input:", sanitizedInput);
    res.json({ message: `You entered: ${sanitizedInput}` });
  } else {
    res.status(400).json({ message: 'No input provided' });
  }
});


app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});