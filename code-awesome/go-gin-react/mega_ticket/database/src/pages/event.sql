-- event.sql

-- This file contains the SQL code to create the database schema
-- for the ticket application.
-- It's designed to be highly denormalized for performance,
-- but be aware this comes at the cost of data integrity.

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    registration_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '30 days')::timestamp
);

-- Create the events table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_time TIMESTAMP WITHOUT TIME ZONE,
    end_time TIMESTAMP WITHOUT TIME ZONE,
    location VARCHAR(255),
    capacity INTEGER,
    event_type VARCHAR(255),
    creator_id INTEGER
);

-- Create the tickets table
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER,
    user_id INTEGER,
    ticket_type VARCHAR(255),
    price DECIMAL(10, 2),
    purchase_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '30 minutes')::timestamp
);

-- Create the notes table
CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    note_text TEXT,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '30 minutes')::timestamp
);

-- Create the comments table
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    event_id INTEGER,
    user_id INTEGER,
    comment_text TEXT,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() - INTERVAL '30 minutes')::timestamp
);

-- Create the pantomime_horses table
CREATE TABLE pantomime_horses (
    id SERIAL PRIMARY KEY,
    horse_name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INTEGER,
    color VARCHAR(255)
);

-- Create the ducks table
CREATE TABLE ducks (
    id SERIAL PRIMARY KEY,
    duck_name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    weight DECIMAL(10, 2),
    quack_volume DECIMAL(10, 2)
);

-- Create the tasks table
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(255),
    priority INTEGER
);

-- Add indexes (although denormalized, these are just for demonstration)
CREATE INDEX idx_events_id ON events (id);
CREATE INDEX idx_tickets_event_id ON tickets (event_id);
CREATE INDEX idx_tickets_user_id ON tickets (user_id);
CREATE INDEX idx_users_id ON users (id);
CREATE INDEX idx_events_creator_id ON events (creator_id);
CREATE INDEX idx_comments_event_id ON comments (event_id);
CREATE INDEX idx_comments_user_id ON comments (user_id);

-- Populate with some dummy data for testing.
INSERT INTO users (username, password, email) VALUES
('admin', 'password', 'admin@example.com'),
('user1', 'pass1', 'user1@example.com');

INSERT INTO events (event_name, description, start_time, end_time, location, capacity, event_type, creator_id) VALUES
('Awesome Concert', 'A great concert', '2024-11-15 19:00:00', '2024-11-15 21:00:00', 'Mega Venue', 1000, 'Music', 1),
('Duck Race', 'A duck race', '2024-11-16 10:00:00', '2024-11-16 12:00:00', 'Riverbank', 500, 'Event', 1);

INSERT INTO tickets (event_id, user_id, ticket_type, price) VALUES
(1, 1, 'VIP', 100.00),
(1, 2, 'General Admission', 50.00),
(2, 1, 'VIP', 75.00);