-- create-poll.sql
-- Create table for polls
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create table for poll options
CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER REFERENCES polls(id),
    option VARCHAR(255) NOT NULL
);

-- Insert data into the polls table
INSERT INTO polls (title, description) VALUES
('Cute Cats', 'This is a poll about cute cats.'),
('Sleepy Puppies', 'Do you love sleepy puppies?'),
('Funny Videos', 'Rate these funny videos.');

-- Insert data into the poll_options table
INSERT INTO poll_options (poll_id, option) VALUES
(1, 'Fluffy'),
(1, 'Sleepy'),
(1, 'Playful'),
(2, 'Dreamy'),
(2, 'Lazy'),
(2, 'Happy'),
(3, 'Hilarious'),
(3, 'Amusing'),
(3, 'Ridiculous');