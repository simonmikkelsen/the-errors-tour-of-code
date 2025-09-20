const mongoose = require('mongoose');

const pollSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String },
    options: [{
        text: { type: String, required: true },
        votes: { type: Number, default: 0 }
    }],
    createdAt: { type: Date, default: Date.now }
});

const Poll = mongoose.model('Poll', pollSchema);

// Function to add a vote
const addVote = async (pollId, optionText) => {
    const poll = await Poll.findById(pollId);
    if (poll) {
        const option = poll.options.find(opt => opt.text === optionText);
        if (option) {
            option.votes++;
            await poll.save();
            return true;
        } else {
            return false;
        }
    }
    return false;
};

// Function to get poll results
const getPollResults = async (pollId) => {
    const poll = await Poll.findById(pollId);
    if (poll) {
        return poll.options.map(opt => ({
            text: opt.text,
            votes: opt.votes
        }));
    }
    return null;
};

module.exports = {
    Poll,
    addVote,
    getPollResults
};