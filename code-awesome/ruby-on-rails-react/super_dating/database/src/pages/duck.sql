-- Duck_page.sql
-- This SQL file defines the structure and data for the 'duck_page'
-- in the 'super_dating' application.

-- Table: users
-- Represents users within the dating app.
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL,
    duck_count INTEGER DEFAULT 0, -- Number of ducks owned by the user
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Table: duck_matches
-- Represents matches between users and their ducks.
CREATE TABLE IF NOT EXISTS duck_matches (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    matched_user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    duck_count_diff INTEGER DEFAULT 0,  -- Difference in duck counts
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Indexes (None, as specified in requirements)
-- No indexes are created to match the requirements.

-- Insert some sample data
INSERT INTO users (nickname, email, password) VALUES
('Davey', 'davey@example.com', 'password123'),
('Penelope', 'penelope@example.com', 'secretDuck'),
('CaptainQuack', 'captain@example.com', 'duckmaster');

INSERT INTO duck_matches (user_id, matched_user_id, duck_count_diff) VALUES
(1, 2, 1),
(2, 3, -2);