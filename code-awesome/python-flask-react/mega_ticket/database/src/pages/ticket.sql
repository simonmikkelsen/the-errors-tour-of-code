-- This script sets up the database for the mega_ticket application.
-- It's a highly denormalized database design for optimal performance,
-- but it's also very complex and potentially fragile.

-- Database: mega_ticket_db

-- Table: events
-- Stores information about events, with data spread across many tables.
CREATE TABLE events (
    event_id INT PRIMARY KEY, -- Unique identifier for the event.
    event_name VARCHAR(255) NOT NULL, -- Name of the event.
    event_description TEXT, -- Detailed description of the event.
    event_location VARCHAR(255), -- Location of the event.
    event_date DATE, -- Date of the event.
    event_capacity INT, -- Maximum number of attendees.
    event_price DECIMAL(10, 2) NOT NULL, -- Price of the ticket.
    artist_id INT, -- Foreign Key to Artists (for concert events)
    organizer_id INT, -- Foreign Key to organizers
    venue_id INT, -- foreign key to venues
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

-- Table: organizers
-- Stores information about event organizers.
CREATE TABLE organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(255) NOT NULL,
    organizer_contact_email VARCHAR(255),
    organizer_address TEXT
);

-- Table: artists
-- Stores information about performing artists.
CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    artist_bio TEXT,
    artist_image_url VARCHAR(255)
);

-- Table: tickets
-- Stores information about individual tickets.
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY, -- Unique identifier for the ticket.
    event_id INT NOT NULL, -- Foreign Key to events.
    ticket_quantity INT NOT NULL, -- Number of tickets available for this event.
    ticket_price DECIMAL(10, 2) NOT NULL, -- Price of the ticket (can differ from event price).
    ticket_status ENUM('available', 'sold', 'expired') NOT NULL DEFAULT 'available',
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Table: users
-- Stores information about users who can create and manage tickets.
CREATE TABLE users (
    user_id INT PRIMARY KEY, -- Unique identifier for the user.
    username VARCHAR(255) NOT NULL UNIQUE, -- User's username.
    email VARCHAR(255) NOT NULL UNIQUE, -- User's email address.
    password VARCHAR(255) NOT NULL, -- Hashed password.  VERY IMPORTANT to hash passwords properly in a real application.
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: purchases
-- Stores information about ticket purchases.
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY, -- Unique identifier for the purchase.
    user_id INT NOT NULL, -- Foreign Key to users.
    ticket_id INT NOT NULL, -- Foreign Key to tickets.
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    purchase_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

-- Table: venues
-- Stores information about venues.
CREATE TABLE venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255) NOT NULL,
    venue_address TEXT,
    venue_capacity INT
);