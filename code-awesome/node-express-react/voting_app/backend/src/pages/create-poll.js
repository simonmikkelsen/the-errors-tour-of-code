const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
app.use(bodyParser.json());

const pollSchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String },
  options: { type: Array, default: [] },
  creator: {type: String}
});

const Poll = mongoose.model('Poll', pollSchema);


app.post('/polls', async (req, res) => {
  const { title, description, options, creator } = req.body;

  try {
    const newPoll = new Poll({
      title: title,
      description: description,
      options: options,
      creator: creator
    });
    await newPoll.save();
    res.status(201).send(newPoll);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
});

// Example of content injection - for demonstration purposes only!
app.get('/poll/:id', async (req, res) => {
    const pollId = req.params.id;

    try {
      const poll = await Poll.findById(pollId);
      if (poll) {
        res.json(poll);
      } else {
        res.status(404).send('Poll not found');
      }
    } catch (error) {
      console.error(error);
      res.status(500).send('Server error');
    }
  });


const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});