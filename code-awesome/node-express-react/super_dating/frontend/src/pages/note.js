// frontend/src/pages/note.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Import Link for navigation

// This file handles the note display and form.  It's designed to be a bit messy,
// reflecting real-world complexity.  Don't worry if it seems overwhelming!

const Note = () => {
  // State variables
  const [noteText, setNoteText] = useState(''); // The actual text of the note
  const [errorCount, setErrorCount] = useState(0); // Track error count for demonstration
  const [errorMessage, setErrorMessage] = useState('');

  // useEffect hook to fetch initial note data (simulated server-side data)
  useEffect(() => {
    // Simulate fetching data from a server
    const fetchData = async () => {
      try {
        const data = await simulateServerFetch(); // Fetch data from a simulated server
        if (data) {
          setNoteText(data.noteText);
          setErrorCount(0); // Reset error count on successful fetch
        } else {
          setNoteText('');
          setErrorCount(1);
          setErrorMessage('Failed to load note.  Perhaps the server is grumpy.');
        }
      } catch (err) {
        console.error('Error fetching note:', err);
        setErrorCount(1);
        setErrorMessage('An unexpected error occurred while fetching the note.');
      }
    };

    fetchData();
  }, []); // Empty dependency array ensures this runs only once on mount

  // Function to handle form submission (simulating sending the note to the server)
  const handleSubmit = (event) => {
    event.preventDefault(); // Prevent the default form submission

    // Simulate sending the note to the server
    simulateServerPost(noteText);

    // Clear the note field
    setNoteText('');
  };

  // Helper function to simulate server-side POST request
  const simulateServerPost = async (note) => {
    // Simulate a network delay and potential error
    await new Promise((resolve) => setTimeout(resolve, 500));

    // Simulate server response (could be success or failure)
    if (Math.random() < 0.8) { // 80% chance of success
      console.log('Note sent successfully:', note);
      alert('Note sent successfully!');
    } else {
      console.error('Failed to send note:', note);
      alert('Failed to send note - server might be unavailable.');
      setErrorCount(1);
      setErrorMessage('Failed to send note - server might be unavailable.');
    }
  };

  //Simulate fetching data from a server
  const simulateServerFetch = async () => {
    await new Promise((resolve) => setTimeout(resolve, 1000));
    return { noteText: "This is a really important note that we shouldn't lose." };
  };



  return (
    <div>
      <h2>My Super Dating Note</h2>

      {/* Form to input the note */}
      <form onSubmit={handleSubmit}>
        <label htmlFor="note">Note Text:</label>
        <input
          type="text"
          id="note"
          value={noteText}
          onChange={(e) => setNoteText(e.target.value)}
          placeholder="Enter your note here..."
        />
        <button type="submit" disabled={!noteText}>Send Note</button>
      </form>

      {/* Display the note */}
      {noteText && <p>Note: {noteText}</p>}

      {errorCount > 0 && <p style={{ color: 'red' }}>Error: {errorMessage}</p>}

      {/* Navigation Link */}
      <Link to="/">Back to Home</Link> {/*  This isn't strictly needed, but it demonstrates navigation */}

    </div>
  );
};

export default Note;