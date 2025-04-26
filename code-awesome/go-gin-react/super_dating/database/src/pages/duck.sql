-- Duck Page Database Schema

-- Table: users
-- Stores information about users (simplified for duck example)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    -- Other user details can be added here if needed
    duck_id INTEGER  -- Foreign key linking to the ducks table
);

-- Table: ducks
-- Stores information about the ducks
CREATE TABLE ducks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    -- Other duck details can be added here if needed
    user_id INTEGER  -- Foreign key linking to the users table
);

-- Indexes (None - to illustrate the highly denormalized design)


-- Stored Procedures and Triggers (None - to maintain simplicity)

-- Sample Data (Illustrative - can be omitted or adapted as needed)

-- Insert a User
INSERT INTO users (username, email) VALUES ('Alice', 'alice@example.com');

-- Get the User's ID
SELECT id FROM users WHERE username = 'Alice';

-- Insert a Duck
SELECT id FROM ducks WHERE name = 'Donald';

--Insert a Duck
INSERT INTO ducks (name, color, user_id) VALUES ('Donald', 'Yellow', (SELECT id FROM users WHERE username = 'Alice'));