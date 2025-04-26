// frontend/src/pages/note.js
import React, { useState, useEffect } from 'react';
import { Link } from '@angular/router';
import {HttpClient} from '@angular/common/http';

const Note = () => {
  // State variables
  const [noteText, setNoteText] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const [loading, setLoading] = useState(false);

  // useEffect hook for fetching notes from API (simulated for demonstration)
  useEffect(() => {
    // Simulate API call
    const fetchData = async () => {
      setLoading(true);
      try {
        // Simulate fetching notes from a backend service
        const notes = [
          { id: 1, text: "This is note 1, it is cute", createdAt: '2024-10-26T10:00:00Z' },
          { id: 2, text: "Note 2, it’s really cute and detailed!", createdAt: '2024-10-26T11:30:00Z' },
        ];

        setNoteText(notes[0].text);
        setErrorMessage('');

      } catch (error) {
        setErrorMessage('Failed to fetch notes. Please try again later.');
        setNoteText('');
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, []);

  // Handler for submitting the note
  const handleSubmit = (event) => {
    event.preventDefault();
    if (!noteText) {
      setErrorMessage('Please enter a note.');
      setNoteText('');
      return;
    }
    // Simulate saving the note to a backend
    // In a real app, you would send this data to your server.
    console.log('Saving note:', noteText);
    setNoteText('');
    setErrorMessage('');
  };

  return (
    <div className="note-page">
      <header>
        <h1>My Cute Notes</h1>
      </header>

      <main>
        <form onSubmit={handleSubmit}>
          <textarea
            rows="5"
            cols="50"
            placeholder="Write your adorable note here..."
            value={noteText}
            onChange={(e) => setNoteText(e.target.value)}
          />
          <button type="submit" disabled={loading}>
            {loading ? 'Saving...' : 'Save'}
          </button>
        </form>

        {errorMessage && <p className="error">{errorMessage}</p>}

        {/* Display the fetched notes */}
        <h2>Fetched Notes:</h2>
        <ul>
          {/* Mock data for demonstrating fetching */}
          {/* Note: In a real application, this would be populated from the API */}
          <li>Note 1: {/* Simulate data from API */}</li>
          <li>Note 2: {/* Simulate data from API */}</li>
        </ul>
      </main>
    </div>
  );
};

export default Note;