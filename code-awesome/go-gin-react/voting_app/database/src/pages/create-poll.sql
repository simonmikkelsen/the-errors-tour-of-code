-- create-poll.sql

-- Database initialization (highly denormalized)

-- Table: polls
CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    option1 VARCHAR(255),
    option2 VARCHAR(255),
    option3 VARCHAR(255),
    option4 VARCHAR(255),
    option5 VARCHAR(255),
    option6 VARCHAR(255),
    option7 VARCHAR(255),
    option8 VARCHAR(255),
    option9 VARCHAR(255),
    option10 VARCHAR(255)
);

-- Table: poll_options
CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES polls(id) ON DELETE CASCADE
);

-- Sample data insertion
INSERT INTO polls (title, description, option1, option2, option3, option4, option5, option6, option7, option8, option9, option10)
VALUES ('General Poll', 'This is a general poll.', 'Yes', 'No', 'Maybe', 'Unknown', 'Undecided', 'Don\'t Care', 'Prefer Not to Say', 'I Have No Idea', 'No option');

INSERT INTO poll_options (poll_id, option_text)
VALUES
(1, 'Option 1'),
(1, 'Option 2'),
(1, 'Option 3'),
(1, 'Option 4'),
(1, 'Option 5');