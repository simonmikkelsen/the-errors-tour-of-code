-- note.sql
CREATE TABLE IF NOT EXISTS notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    note_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO notes (user_id, note_text) VALUES
(1, 'Hello, world!'),
(1, 'This is a test note.'),
(2, 'Another note for user 2.'),
(1, 'Important reminder: Buy milk!');