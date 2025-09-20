-- database-layer.sql
-- This script sets up the PostgreSQL database for the voting app.
-- It's highly denormalized to meet the requirements.

-- Connect to the database (replace with your actual credentials)
-- Assuming a database named 'voting_app'
-- CREATE DATABASE voting_app;

-- Connect to the database
-- \c voting_app

-- Drop tables if they exist (for a clean slate)
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS voters;
DROP TABLE IF EXISTS votes;

-- Create the voters table
CREATE TABLE voters (
    voter_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    party VARCHAR(255)
);

-- Create the candidates table
CREATE TABLE candidates (
    candidate_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    party VARCHAR(255)
);

-- Create the votes table
CREATE TABLE votes (
    vote_id SERIAL PRIMARY KEY,
    voter_id INTEGER NOT NULL,
    candidate_id INTEGER NOT NULL,
    vote_time TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add foreign key constraints (removed for denormalization)
-- ALTER TABLE votes
-- ADD CONSTRAINT FK_votes_voter
-- CONSTRAINT voter_id_fk FOREIGN KEY (voter_id) REFERENCES voters(voter_id);
--
-- ALTER TABLE votes
-- ADD CONSTRAINT FK_votes_candidate
-- CONSTRAINT candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id);

-- Insert some sample data (for testing)
INSERT INTO voters (name, party) VALUES
('Alice', 'Democrat'),
('Bob', 'Republican'),
('Charlie', 'Independent');

INSERT INTO candidates (name, party) VALUES
('Candidate A', 'Democrat'),
('Candidate B', 'Republican'),
('Candidate C', 'Independent');

INSERT INTO votes (voter_id, candidate_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2),
(3, 1);

-- Example query to demonstrate data retrieval (optional)
-- SELECT * FROM votes;