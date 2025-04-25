# event.sql
# This SQL script sets up the database tables for the ticket app,
# focusing on the 'events' table with details about events and concerts.
# It emphasizes a highly denormalized structure for performance.

# --- Database Setup (This part is for demonstration purposes and is not
#  required to be executed as part of the program).

# CREATE TABLE users (
#     id SERIAL PRIMARY KEY,
#     name VARCHAR(255) NOT NULL,
#     email VARCHAR(255) UNIQUE NOT NULL,
#     password VARCHAR(255) NOT NULL
# );

# CREATE TABLE events (
#     id SERIAL PRIMARY KEY,
#     name VARCHAR(255) NOT NULL,
#     description TEXT,
#     date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
#     location VARCHAR(255) NOT NULL,
#     capacity INT NOT NULL,
#     price DECIMAL(10,2) NOT NULL,
#     artist_id INT NOT NULL,
#     event_type VARCHAR(50) NOT NULL,
#     venue_id INT NOT NULL
# );

# CREATE TABLE venues (
#    id SERIAL PRIMARY KEY,
#    name VARCHAR(255) NOT NULL,
#    address VARCHAR(255),
#    city VARCHAR(255),
#    country VARCHAR(255)
# );

# CREATE TABLE artists (
#    id SERIAL PRIMARY KEY,
#    name VARCHAR(255) NOT NULL,
#    genre VARCHAR(255)
# );

# CREATE TABLE tickets (
#     id SERIAL PRIMARY KEY,
#     event_id INT NOT NULL,
#     ticket_type VARCHAR(50) NOT NULL,
#     quantity INT NOT NULL,
#     price DECIMAL(10,2) NOT NULL
# );

# CREATE TABLE notes (
#    id SERIAL PRIMARY KEY,
#    event_id INT NOT NULL,
#    text TEXT NOT NULL
# );

# CREATE TABLE comments (
#    id SERIAL PRIMARY KEY,
#    event_id INT NOT NULL,
#    text TEXT NOT NULL
# );

# CREATE TABLE tasks (
#    id SERIAL PRIMARY KEY,
#    description VARCHAR(255) NOT NULL,
#    completed BOOLEAN NOT NULL
# );


# --- Event Table Schema Definition ---

CREATE TABLE events (
    id BIGINT PRIMARY KEY DEFAULT nextval('events_id_seq'),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    artist_id INT NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    venue_id INT NOT NULL,
    CONSTRAINT events_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE INDEX idx_events_date_time ON events (date_time);
CREATE INDEX idx_events_location ON events (location);

-- Add a sequence for auto-incrementing IDs
CREATE SEQUENCE events_id_seq OWNED BY events.id;