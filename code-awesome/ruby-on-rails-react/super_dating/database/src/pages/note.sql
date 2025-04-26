-- note.sql

-- Create the notes table.
CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add an index on the user_id column for faster lookups.
CREATE INDEX idx_notes_user_id ON notes (user_id);

-- Create a sample user for demonstration purposes.
INSERT INTO notes (user_id, content) VALUES
(1, 'Hello from the first user!'),
(2, 'This is a note from the second user.'),
(1, 'Another note from the first user.');