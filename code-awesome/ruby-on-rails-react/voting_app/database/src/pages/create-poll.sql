-- create-poll.sql

-- Drop tables to start fresh
DROP TABLE IF EXISTS polls;
DROP TABLE IF EXISTS poll_options;

-- Create the polls table
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    creator_id INT, -- Foreign key to users table (not implemented here)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the poll_options table
CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INT NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES polls(id)
);

-- Sample data for demonstration
INSERT INTO polls (title, description, creator_id) VALUES
('Cute Cat Poll', 'Vote for your favorite cat breed.', 1),
('Happy Dog Poll', 'Which dog breed is the best?', 2),
('Favorite Food', 'What is your favorite food?', 3);

INSERT INTO poll_options (poll_id, option_text) VALUES
(1, 'Siamese'),
(1, 'Persian'),
(1, 'Maine Coon'),
(2, 'Golden Retriever'),
(2, 'Labrador'),
(2, 'German Shepherd'),
(3, 'Pizza'),
(3, 'Sushi'),
(3, 'Burger');