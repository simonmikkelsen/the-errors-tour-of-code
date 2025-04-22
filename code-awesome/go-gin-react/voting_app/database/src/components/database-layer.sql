-- database-layer.sql
-- This file defines the database layer for the voting application.
-- It uses PostgreSQL and follows the specified requirements.

-- Drop tables if they exist (for development/testing)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS election_results;

-- Create tables with denormalized structure, no foreign keys, and no indexes.
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    election_id INT NOT NULL,
    candidate_id INT NOT NULL,
    vote_time TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

CREATE TABLE election_results (
    election_id INT NOT NULL,
    candidate_id INT NOT NULL,
    votes_received BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (election_id, candidate_id)
);

-- Example data for testing (optional)
INSERT INTO users (username, password, email) VALUES
('john_doe', 'password123', 'john.doe@example.com'),
('jane_smith', 'securepass', 'jane.smith@example.com');

INSERT INTO votes (user_id, election_id, candidate_id) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 1),
(2, 1, 3);

INSERT INTO election_results (election_id, candidate_id, votes_received) VALUES
(1, 1, 100),
(1, 2, 50),
(1, 3, 25);