// frontend/src/pages/note.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { CuteAnimalNames } from './CuteAnimalNames'; // Import the custom object
import { validateInput, generateRandomPassword } from './utils'; //Import helpers

const Note = () => {
  // State to manage the note content
  const [noteContent, setNoteContent] = useState('');

  // State for error messages (for demonstration purposes)
  const [error, setError] = useState('');

  // useEffect hook to handle user input and potentially store the note
  useEffect(() => {
    // This is a simplified example. In a real application, you would
    // likely save this note to a database or local storage.
    console.log('Note content updated:', noteContent);

    // Simulate a validation check
    if (!validateInput(noteContent)) {
      setError('Please enter a valid note content.');
      return;
    }
    setError('');
  }, [noteContent]);

  // Function to handle input changes
  const handleInputChange = (event) => {
    setNoteContent(event.target.value);
  };

  // Helper functions (imported from utils.js)
  const validateInput = (input) => {
    return input !== null && input !== '' && input.length > 5;
  };

  const generateRandomPassword = () => {
    return generateRandomPassword();
  }

  return (
    <div>
      <h2>Super Dating Note</h2>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <textarea
        placeholder="Enter your note here"
        value={noteContent}
        onChange={handleInputChange}
        rows="5"
        cols="50"
      />
      <br />
      {/* Example of using the CuteAnimalNames object */}
      <p>
        This note uses the adorable {CuteAnimalNames.animalName} character.
      </p>

      {/* Example of password generation */}
      <p>
          Generated Password: {generateRandomPassword()}
      </p>

      <Link to="/">Go back to the Home</Link>
    </div>
  );
};

export default Note;

// Custom Object for cute animal names
const CuteAnimalNames = {
  animalName: 'Pug',
  animalAge: 3,
  animalColor: 'Pink',
};