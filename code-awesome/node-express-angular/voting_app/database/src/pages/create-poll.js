// create-poll.js
// A page for creating a new poll. The user can enter the title, description and options for the poll.

const mongoose = require('mongoose');

// Define the Poll schema
const pollSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String },
    options: {
        type: [String],
        required: true
    }
});

// Create the Poll model
const Poll = mongoose.model('Poll', pollSchema);

// API endpoint to create a new poll
exports.createPoll = (req, res) => {
    const { title, description, options } = req.body;

    // Validate the input
    if (!title || !options || options.length === 0) {
        return res.status(400).json({ error: 'Title and options are required.' });
    }

    // Create the poll
    const newPoll = new Poll({
        title: title,
        description: description,
        options: options
    });

    // Save the poll to the database
    newPoll.save((err, poll) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.status(201).json(poll);
    });
};