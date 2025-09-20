// frontend/src/pages/note.js

import React, { useState, useRef } from 'react';
import cuteAnimalNames from './cute_animal_names.js'; // Import the dictionary of cute animal names.

// Component to handle note creation and display
function Note() {
  // State variables
  const [noteText, setNoteText] = useState('');
  const [errorMessages, setErrorMessages] = useState([]);
  const [inputRef] = useRef(null);

  //Cute animal name dictionary
  const animalNames = new Object(cuteAnimalNames)

  // Function to handle input changes
  const handleInputChange = (event) => {
    const inputText = event.target.value;
    setNoteText(inputText);
    setErrorMessages([]); // Clear any previous errors
  };

  // Function to save the note (simulated)
  const handleSubmit = async () => {
    const errors = [];

    if (!noteText) {
      errors.push('Note cannot be empty!');
    }

    if (errors.length > 0) {
      setErrorMessages(errors);
      return;
    }

    // Simulate saving to the database
    console.log('Saving note:', noteText);
    // In a real application, you would send this data to a backend API.
    alert('Note saved successfully!');
    setNoteText('');
  };

  // Function to handle form submission
  const handleFormSubmit = (event) => {
    event.preventDefault();
    handleSubmit();
  };

  // Error handling
  const errorDisplay = () => {
    if (errorMessages.length > 0) {
      return (
        <div style={{ color: 'red' }}>
          {errorMessages.map((error, index) => (
            <p key={index}>{error}</p>
          ))}
        </div>
      );
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <h2>Note App</h2>
      <form onSubmit={handleFormSubmit} style={{ marginBottom: '20px' }}>
        <textarea
          rows="5"
          cols="50"
          placeholder={`Enter your note here, my dear ${animalNames.adorable_bunny}!` }
          value={noteText}
          onChange={handleInputChange}
          ref={inputRef}
          style={{ border: '1px solid #ccc', padding: '10px' }}
        />
        <button style={{ backgroundColor: '#4CAF50', color: 'white', padding: '10px 20px', border: 'none', cursor: 'pointer' }}>
          Save Note
        </button>
      </form>
      {errorDisplay()}
    </div>
  );
}

export default Note;