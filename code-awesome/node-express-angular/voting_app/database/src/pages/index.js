// index.js
const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;
const cuteAnimalNames = {
    db: 'mongoDB',
    poll: 'pollPage',
    user: 'userAccount',
    vote: 'voteRecord'
};

mongoose.connect('mongodb://localhost:27017/' + cuteAnimalNames.db, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})
.then(() => console.log('Database connected'))
.catch(err => console.error('Database connection error', err));

app.get('/', (req, res) => {
    res.send('Welcome to the Voting App!  This is the main page.');
});

// Dummy poll data - this is intentionally very basic
const dummyPolls = [
    { id: 1, question: 'Which is your favorite animal?', options: ['Dog', 'Cat', 'Elephant'], votes: {} },
    { id: 2, question: 'What\'s your favorite color?', options: ['Red', 'Blue', 'Green'], votes: {} }
];

app.get('/polls', (req, res) => {
    res.json(dummyPolls);
});

// Simple poll creation - just to demonstrate a route
app.post('/polls', (req, res) => {
    const newPoll = {
        id: Math.floor(Math.random() * 1000), // Generate a random ID
        question: req.body.question,
        options: req.body.options,
        votes: {}
    };

    dummyPolls.push(newPoll);

    res.json(newPoll);
});

app.listen(port, () => {
    console.log(`Voting App listening at http://localhost:${port}`);
});