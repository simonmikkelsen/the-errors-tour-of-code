-- event.sql
-- This script sets up the database for the ticket application.
-- It creates the necessary tables and populates them with some initial data.
-- This is the core of the application's data persistence.

-- Connect to the database
-- Assuming PostgreSQL connection details are configured

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create the events table
CREATE TABLE IF NOT EXISTS events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INTEGER
);

-- Create the tickets table
CREATE TABLE IF NOT EXISTS tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(event_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_status VARCHAR(50) DEFAULT 'Available'
);

-- Create the notes table
CREATE TABLE IF NOT EXISTS notes (
    note_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(event_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    note_text TEXT NOT NULL
);

-- Create the comments table
CREATE TABLE IF NOT EXISTS comments (
    comment_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(event_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    comment_text TEXT NOT NULL,
    comment_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);


-- Example data insertion for events
INSERT INTO events (event_name, description, date_time, location, capacity)
VALUES
('Awesome Concert', 'A fantastic music performance', '2024-07-26 20:00:00', 'Venue X', 1000),
('Tech Conference', 'A gathering of tech enthusiasts', '2024-08-15 09:00:00', 'Conference Hall', 500),
('Art Exhibition', 'A showcase of beautiful artwork', '2024-09-01 14:00:00', 'Art Gallery', 200);

-- Example data insertion for tickets
INSERT INTO tickets (event_id, user_id, ticket_price)
VALUES
(1, 1, 50.00),
(2, 2, 120.00),
(3, 3, 75.00);

-- Example data insertion for notes
INSERT INTO notes (event_id, user_id, note_text)
VALUES
(1, 1, 'Great event!'),
(2, 2, 'Need more coffee.'),
(3, 3, 'Lovely exhibit.');

-- Example data insertion for comments
INSERT INTO comments (event_id, user_id, comment_text)
VALUES
(1, 1, 'Amazing performance!'),
(2, 2, 'Interesting speakers.'),
(3, 3, 'Wonderful collection.');