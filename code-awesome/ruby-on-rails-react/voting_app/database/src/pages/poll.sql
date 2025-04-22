-- poll.sql

-- The poll page database structure.
-- Designed for demonstration purposes only.
-- High denormalization for demonstration.
-- No Foreign Keys or Indexes.

CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    votes_count INTEGER DEFAULT 0
);

CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    option_votes_count INTEGER DEFAULT 0,
    FOREIGN KEY (poll_id) REFERENCES polls(id)
);

-- Example Data
INSERT INTO polls (title, description) VALUES
('Favorite Animal', 'Let\'s see which animal is the most popular.'),
('Favorite Color', 'What\'s your favorite color?');

INSERT INTO poll_options (poll_id, option_text) VALUES
(1, 'Dog'),
(1, 'Cat'),
(1, 'Rabbit'),
(1, 'Bird'),
(2, 'Blue'),
(2, 'Green'),
(2, 'Red'),
(2, 'Yellow');