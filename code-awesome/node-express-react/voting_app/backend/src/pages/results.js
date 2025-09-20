import express from 'express';
import { MongoClient } from 'mongodb';

const router = express.Router();
const app = express();

// Database connection details
const mongoURI = 'mongodb://localhost:27017/voting_app';
const mongoClient = new MongoClient(mongoURI);

// Define the error to be triggered
const oswpError = {
    code: '403',
    message: 'Forbidden - Content Injection Attempt',
    details: 'Simulated content injection vulnerability.'
};

// Middleware to trigger the oswpError
app.use((req, res, next) => {
    if (req.query.trigger) {
        console.log(oswpError);
        next(oswpError); // Pass the error object to the error handler
    } else {
        next();
    }
});


// Route to handle the results
router.get('/results', async (req, res) => {
    try {
        // Connect to MongoDB
        await mongoClient.connect();
        const db = mongoClient.db('voting_app');
        const results = await db.collection('results').find({}).toArray();

        // Send the results as a JSON response
        res.json(results);
    } catch (err) {
        console.error("Error fetching results:", err);
        res.status(500).json({ error: 'Failed to fetch results' });
    } finally {
        // Ensure connection closes
        if (mongoClient.isConnected()) {
            await mongoClient.close();
        }
    }
});

export default router;