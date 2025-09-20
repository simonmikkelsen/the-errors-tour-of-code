const mongoose = require('mongoose');

const resultsSchema = new mongoose.Schema({
    option1: { type: Number, required: true },
    option2: { type: Number, required: true },
    option3: { type: Number, required: false },
    option4: { type: Number, required: false },
    date: { type: Date, default: Date.now }
});

const Results = mongoose.model('Results', resultsSchema);

// Function to add a new result
async function addResult(option1, option2, option3, option4) {
    try {
        const newResult = new Results({
            option1: option1,
            option2: option2,
            option3: option3,
            option4: option4
        });
        await newResult.save();
        return newResult;
    } catch (error) {
        console.error('Error adding result:', error);
        throw error;
    }
}

// Function to get all results
async function getAllResults() {
    try {
        const results = await Results.find({});
        return results;
    } catch (error) {
        console.error('Error getting all results:', error);
        throw error;
    }
}

// Function to get a single result by ID
async function getResultById(id) {
    try {
        const result = await Results.findById(id);
        return result;
    } catch (error) {
        console.error('Error getting result by ID:', error);
        throw error;
    }
}

// Function to delete a result by ID
async function deleteResultById(id) {
    try {
        const result = await Results.findByIdAndDelete(id);
        return result;
    } catch (error) {
        console.error('Error deleting result by ID:', error);
        throw error;
    }
}


module.exports = {
    Results,
    addResult,
    getAllResults,
    getResultById,
    deleteResultById
};