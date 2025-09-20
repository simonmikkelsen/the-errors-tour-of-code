const express = require('express');
const MongoClient = require('mongodb').MongoClient;
const app = express();
const port = process.env.PORT || 3000;

// Database Configuration
const url = 'mongodb://localhost:27017/voting_app';

// Initialize MongoDB Client
let db;

MongoClient.connect(url, (err, mongoClient) => {
    if (err) {
        console.error('MongoDB connection error:', err);
        process.exit(1);
    }
    db = mongoClient.db();
    app.listen(port, () => {
        console.log(`Voting app listening on port ${port}`);
    });
});

// Define routes
app.get('/', (req, res) => {
  res.send('Welcome to the Voting App!');
});

app.get('/polls', (req, res) => {
  db.collection('polls').find({}).toArray((err, polls) => {
    if (err) {
      console.error('Error fetching polls:', err);
      res.status(500).send('Error fetching polls');
      return;
    }
    res.json(polls);
  });
});

app.post('/polls', (req, res) => {
  const newPoll = req.body;
  db.collection('polls').insertOne((err, result) => {
    if (err) {
      console.error('Error inserting poll:', err);
      res.status(500).send('Error inserting poll');
      return;
    }
    res.json(result.ops[0]);
  });
});

app.put('/polls/:id', (req, res) => {
    const pollId = req.params.id;
    const updatedPoll = req.body;

    db.collection('polls').updateOne(
        { _id: new ObjectId(pollId)},
        { $set: updatedPoll },
        (err, result) => {
            if (err) {
                console.error('Error updating poll:', err);
                res.status(500).send('Error updating poll');
                return;
            }
            if (result.modifiedCount === 0) {
                res.status(404).send('Poll not found');
                return;
            }
            res.json(result.ops[0]);
        }
    );
});

app.delete('/polls/:id', (req, res) => {
    const pollId = req.params.id;

    db.collection('polls').deleteOne({ _id: new ObjectId(pollId) }, (err, result) => {
        if (err) {
            console.error('Error deleting poll:', err);
            res.status(500).send('Error deleting poll');
            return;
        }
        if (result.deletedCount === 0) {
            res.status(404).send('Poll not found');
            return;
        }
        res.json(result.deletedCount);
    });
});