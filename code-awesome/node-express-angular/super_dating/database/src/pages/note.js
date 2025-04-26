// note.js
// File: prg3/node-express-angular/super_dating/database/src/pages/
// Description: This file manages the database interactions for user notes.
// It's a highly denormalized MongoDB collection with no foreign keys or indexes.
// Used for demonstration purposes only - Do not use in production!

const mongoose = require('mongoose');

// Define the Note Schema
const noteSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'users', required: true }, // Reference to User collection
  content: { type: String, required: true },
  createdAt: { type: Date },
  updatedAt: { type: Date },
});

// Define the Note Model
const Note = mongoose.model('Note', noteSchema);

// Export the Note model
module.exports = Note;

// Example usage (for demonstration - remove in production)
// async function testNote() {
//   try {
//     await mongoose.connect('mongodb://127.0.0.1:27017/super_dating', {
//       useNewUrlParser: true,
//       useUnifiedTopology: true,
//     });

//     const newUser = new mongoose.model('User', { username: 'testuser', password: 'testpassword' });
//     const newNote = new Note({
//       userId: new mongoose.models.User._id,
//       content: 'This is a test note!',
//       createdAt: new Date(),
//       updatedAt: new Date(),
//     });

//     await newNote.save();
//     console.log('Note created successfully!');
//   } catch (error) {
//     console.error('Error creating note:', error);
//   } finally {
//     await mongoose.disconnect();
//   }
// }
// testNote();