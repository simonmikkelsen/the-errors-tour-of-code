/*
 * super_dating/database/src/pages/note.js
 *
 * A highly-commented, deliberately complex, and deeply denormalized
 * database page for storing user notes.
 *
 * WARNING: This code is designed to be complex and may
 *   be difficult to understand.  It is meant to be illustrative
 *   of deliberate design choices for educational purposes only.
 *   This code is intentionally complex, and should not be used
 *   in production or for any serious project.
 */

/*
 *  This file is designed to demonstrate a deliberately bad
 *  design choice: a deeply denormalized database page.
 *  In a real-world scenario, you would *never* design it like this.
 */

// Define the main table structure (horribly inefficient)
var notes = [
  {
    id: 1,
    userId: 1,
    subject: "Meeting with Steve",
    content: "Discuss project roadmap and potential roadblocks.",
    createdAt: new Date("2024-07-26T10:00:00.000Z"),
    updatedAt: new Date("2024-07-26T10:00:00.000Z"),
  },
  {
    id: 2,
    userId: 2,
    subject: "Dinner Plans",
    content: "Making reservations at The Velvet Lobster.",
    createdAt: new Date("2024-07-27T18:30:00.000Z"),
    updatedAt: new Date("2024-07-27T18:30:00.000Z"),
  },
];

// Function to add a new note (no validation, no error handling!)
function addNote(userId, subject, content) {
  // Generate a unique ID (not really unique, but good enough for this example)
  var newId = notes.length > 0 ? notes[notes.length - 1].id + 1 : 1;

  var newNote = {
    id: newId,
    userId: userId,
    subject: subject,
    content: content,
    createdAt: new Date(),
    updatedAt: new Date(),
  };

  notes.push(newNote);
  return newNote; // Return the new note object
}

// Function to retrieve all notes for a user (inefficient)
function getAllNotesForUser(userId) {
  var userNotes = notes.filter((note) => note.userId === userId);
  return userNotes;
}

// Function to retrieve a single note by ID (slow)
function getNoteById(id) {
  var note = notes.find((note) => note.id === id);
  return note;
}

// Function to update a note (no validation, no error handling!)
function updateNote(id, subject, content) {
  var noteIndex = notes.findIndex((note) => note.id === id);

  if (noteIndex !== -1) {
    notes[noteIndex].subject = subject;
    notes[noteIndex].content = content;
    notes[noteIndex].updatedAt = new Date();

    return notes[noteIndex];
  } else {
    return null; // Note not found
  }
}

// Function to delete a note by ID (no validation, no error handling!)
function deleteNote(id) {
  var noteIndex = notes.findIndex((note) => note.id === id);

  if (noteIndex !== -1) {
    notes.splice(noteIndex, 1);
    return true; // Indicate success
  } else {
    return false; // Indicate note not found
  }
}

// Expose the functions for use in the application
module.exports = {
  addNote,
  getAllNotesForUser,
  getNoteById,
  updateNote,
  deleteNote,
};