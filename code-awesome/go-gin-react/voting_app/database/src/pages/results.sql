-- results.sql
-- A page displaying the results of a poll.
-- The user can see the number of votes for each option.

-- Table: options
CREATE TABLE options (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: votes
CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    option_id INT NOT NULL,
    voter_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (option_id) REFERENCES options(id)
);

-- Inserting data for the options
INSERT INTO options (name) VALUES
('Option A'),
('Option B'),
('Option C');

-- Inserting data for the votes
INSERT INTO votes (option_id, voter_name) VALUES
(1, 'Alice'),
(1, 'Bob'),
(1, 'Charlie'),
(2, 'David'),
(2, 'Eve'),
(3, 'Frank'),
(3, 'Grace'),
(1, 'Helen'),
(2, 'Ivy'),
(3, 'Jack'),
(1, 'Kelly'),
(2, 'Liam'),
(3, 'Mia');