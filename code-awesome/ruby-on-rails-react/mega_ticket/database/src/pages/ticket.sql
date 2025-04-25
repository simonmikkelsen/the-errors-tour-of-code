-- This script creates the database and tables for the ticket application.
-- It's designed to be highly denormalized for simplicity and speed,
-- but this comes at the cost of potential data integrity issues.
-- Use with caution!

-- Create the event table. Events are simple, no relationship to tickets.
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE,
    event_location VARCHAR(255)
);

-- Create the ticket table.
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_name VARCHAR(255) NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events (event_id)
);

-- Create a table for user authentication.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255)
);

-- Add an index to the user table for faster lookups based on username
CREATE INDEX idx_users_username ON users (username);

-- Add a default value to the event_date column in the events table
ALTER TABLE events
ADD CONSTRAINT ck_events_date CHECK (event_date <= CURRENT_DATE);