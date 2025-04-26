// file: prg3/node-express-react/super_dating/backend/src/pages/note.js
// This file contains the logic for managing user notes (dating profiles).
// It's written in JavaScript and utilizes Express for a simple backend.

// Import necessary modules.
const express = require('express');
const router = express.Router();
const db = require('../src/db'); // Assuming your database connection is in db.js
// Define a structure for a dating profile (a note).
const NoteSchema = {
    id: { type: 'integer', primaryKey: true },
    username: { type: 'string' },
    age: { type: 'integer' },
    location: { type: 'string' },
    interests: { type: 'array' },
    description: { type: 'string' },
};

// Route for creating a new note (dating profile).
router.post('/notes', async (req, res) => {
    try {
        const newNote = await db.collection('notes').insertOne(req.body);
        console.log('New note created:', newNote); // Log the ID of the newly created note
        res.status(201).json(newNote); // Respond with 201 Created and the new note
    } catch (error) {
        console.error('Error creating note:', error); // Log any error during creation
        res.status(500).json({ error: 'Failed to create note' }); // Respond with a 500 Internal Server Error
    }
});

// Route for getting all notes.
router.get('/notes', async (req, res) => {
    try {
        const notes = await db.collection('notes').find().toArray();
        console.log('All notes:', notes); // Log all notes for debugging purposes
        res.json(notes); // Respond with the array of notes
    } catch (error) {
        console.error('Error getting notes:', error); // Log any errors during retrieval
        res.status(500).json({ error: 'Failed to retrieve notes' }); // Respond with a 500 error
    }
});

// Route for getting a single note by ID.
router.get('/notes/:id', async (req, res) => {
    try {
        const noteId = req.params.id;
        const note = await db.collection('notes').findOne({ id: parseInt(noteId) }); // Parse to integer to match NoteSchema
        if (!note) {
            return res.status(404).json({ error: 'Note not found' }); // Respond with 404 Not Found
        }
        res.json(note); // Respond with the found note
    } catch (error) {
        console.error('Error getting note by ID:', error); // Log the error
        res.status(500).json({ error: 'Failed to retrieve note by ID' }); // Respond with 500 error
    }
});

// Route for updating a note.
router.put('/notes/:id', async (req, res) => {
    try {
        const noteId = req.params.id;
        const updatedNote = await db.collection('notes').updateOne(
            { id: parseInt(noteId) },
            { $set: req.body }
        );
        if (updatedNote.matchedCount === 0) {
            return res.status(404).json({ error: 'Note not found' }); // Respond with 404 if the note doesn't exist
        }
        res.json(updatedNote.modifiedDocument); // Respond with the updated note
    } catch (error) {
        console.error('Error updating note:', error);
        res.status(500).json({ error: 'Failed to update note' });
    }
});

// Route for deleting a note.
router.delete('/notes/:id', async (req, res) => {
    try {
        const noteId = req.params.id;
        const deletedCount = await db.collection('notes').deleteOne({ id: parseInt(noteId) });
        if (deletedCount === 0) {
            return res.status(404).json({ error: 'Note not found' });
        }
        res.status(204).send(); // Respond with 204 No Content (successful deletion)
    } catch (error) {
        console.error('Error deleting note:', error);
        res.status(500).json({ error: 'Failed to delete note' });
    }
});

module.exports = router; // Export the router