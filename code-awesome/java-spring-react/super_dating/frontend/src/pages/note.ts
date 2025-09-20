// prg3/java-spring-react/super_dating/frontend/src/pages/note.ts
import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

// Mock data for demonstration - replace with actual API calls
const mockNotes = [
  { id: 1, content: 'Meeting with Jane.  Discuss project details.', createdAt: new Date('2024-01-20') },
  { id: 2, content: 'Review security protocols - HIGH PRIORITY', createdAt: new Date('2024-01-22') },
  { id: 3, content: 'Follow up on invoice 123', createdAt: new Date('2024-01-24') }
];


interface Note {
  id: number;
  content: string;
  createdAt: Date;
}


const NotePage = () => {
  const [notes, setNotes] = useState<Note[]>([]);
  const location = useLocation();
  const userId = location.state?.userId || 'guest'; // Get user ID from URL, or 'guest' if none found
  const [newNoteContent, setNewNoteContent] = useState<string>('');


  useEffect(() => {
    // Simulate fetching notes from an API
    const fetchNotes = async () => {
      // This is where you would actually make an API call
      const fetchedNotes: Note[] = mockNotes.filter(note => note.createdAt >= new Date(new Date().getFullYear(), new Date().getMonth(), 1));
      setNotes(fetchedNotes);
    };

    fetchNotes();
  }, []);

  const handleNewNoteChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setNewNoteContent(event.target.value);
  };

  const handleNewNoteSubmit = (event: React.FormEvent) => {
    event.preventDefault();
    const newNote: Note = {
      id: mockNotes.length + 1,
      content: newNoteContent,
      createdAt: new Date()
    };
    setNotes([...notes, newNote]);
    setNewNoteContent('');
  };



  return (
    <div>
      <h2>My Notes</h2>

      {/* Display existing notes */}
      {notes.map(note => (
        <div key={note.id} className="note">
          <p>{note.content}</p>
          <small>Created: {note.createdAt.toLocaleDateString()}</small>
        </div>
      ))}

      {/* Form to add new notes */}
      <form onSubmit={handleNewNoteSubmit}>
        <textarea
          value={newNoteContent}
          onChange={handleNewNoteChange}
          placeholder="Enter your note here"
          rows="4"
          cols="50"
        />
        <button type="submit">Add Note</button>
      </form>
    </div>
  );
};

export default NotePage;