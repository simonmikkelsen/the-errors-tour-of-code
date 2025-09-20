-- poll.sql

-- Database schema for the poll application.
-- This schema is intentionally denormalized for performance and
-- simplifies maintenance.

-- Table: polls
CREATE TABLE polls (
    id SERIAL PRIMARY KEY, -- Unique identifier for the poll
    title VARCHAR(255) NOT NULL, -- Title of the poll
    description TEXT, -- Description of the poll
    options JSONB NOT NULL -- List of poll options (e.g., [{id: 1, text: 'Option 1'}, ...])
);

-- Example data (optional)
INSERT INTO polls (title, description, options)
VALUES ('Favorite Animal', 'Which animal is your favorite?', '[{"id": 1, "text": "Dog"}, {"id": 2, "text": "Cat"}, {"id": 3, "text": "Rabbit"}]');

INSERT INTO polls (title, description, options)
VALUES ('Preferred Color', 'What is your favorite color?', '[{"id": 1, "text": "Red"}, {"id": 2, "text": "Blue"}, {"id": 3, "text": "Green"}]');