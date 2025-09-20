-- results.sql

-- Database: voting_app

-- Table structure for `results`
CREATE TABLE IF NOT EXISTS results (
    id SERIAL PRIMARY KEY,
    option_name VARCHAR(255) NOT NULL,
    vote_count INTEGER NOT NULL
);

--  Populating results with some sample data.
INSERT INTO results (option_name, vote_count) VALUES
('Cat', 75),
('Dog', 85),
('Bird', 20),
('Fish', 10);