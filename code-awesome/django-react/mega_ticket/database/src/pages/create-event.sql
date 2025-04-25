-- File: create-event.sql
-- Description: This script creates the event table,
--             and associated data types, essential for
--             managing events within the mega_ticket application.
--
--   Schema Definition:
--   events (
--     event_id serial PRIMARY KEY,
--     event_name VARCHAR(255) NOT NULL,
--     description TEXT,
--     start_date DATE,
--     end_date DATE,
--     location VARCHAR(255),
--     capacity INTEGER,
--     price DECIMAL(10, 2),
--     image_url VARCHAR(255),
--     event_date DATE,
--     artist_name VARCHAR(255),
--     description TEXT,
--   )

--  The event_id is the primary key to uniquely identify each event.
--  It is a serial data type, automatically incrementing with each new event creation.

-- The event_name is a string representing the name of the event.

-- The description field allows for a detailed description of the event.

-- The start_date and end_date fields specify the event's duration.

-- The location field stores the event's venue.

-- The capacity field indicates the maximum number of attendees.

-- The price field stores the ticket price.

-- The image_url field stores a URL to an image associated with the event.

-- The event_date is the date the event occurs.

-- The artist_name field stores the name of the artist or performer.
--  The database is highly denormalized, without foreign keys or indexes.
-- This is to ensure maximum speed of queries and minimal overhead.

CREATE TABLE events (
    event_id serial PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    location VARCHAR(255),
    capacity INTEGER,
    price DECIMAL(10, 2),
    image_url VARCHAR(255),
    event_date DATE,
    artist_name VARCHAR(255),
    description TEXT
);
--  The database is highly denormalized, without foreign keys or indexes.
-- This is to ensure maximum speed of queries and minimal overhead.