-- create-poll.sql

-- Database for the voting application
-- Highly denormalized structure for demonstration purposes only.
-- No foreign keys or indexes.

CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES polls(id)
);

-- Example Data -  You would populate this with actual data
INSERT INTO polls (title, description) VALUES
('Cute Cats', 'Poll about adorable cats'),
('Fluffy Dogs', 'Poll about adorable dogs'),
('Happy Hamsters', 'Poll about adorable hamsters');

INSERT INTO poll_options (poll_id, option_text) VALUES
(1, 'Siamese'),
(1, 'Maine Coon'),
(1, 'Bengal'),
(2, 'Golden Retriever'),
(2, 'Labrador'),
(2, 'Poodle'),
(3, 'Syrian'),
(3, 'Roborovski'),
(3, 'Chinese');