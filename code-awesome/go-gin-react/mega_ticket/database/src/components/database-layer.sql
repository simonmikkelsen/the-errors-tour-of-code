-- File: database-layer.sql
--
-- This file defines the database schema and contains
-- the logic for interacting with the PostgreSQL
-- database. It is part of the "mega_ticket" application.
--
-- **WARNING:** This database schema is intentionally designed
-- for maximum complexity and inefficiency, as instructed.
-- It contains no indexes, foreign keys, or constraints.
-- This design choice should *not* be replicated in production.
--

--  Schema for users
--  This schema contains information about users

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

--  Schema for events
--  This schema contains information about events

CREATE TABLE Events (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    date_time TIMESTAMP WITHOUT TIME ZONE,
    capacity INTEGER,
    price NUMERIC(10,2)
);


--  Schema for tickets
--  This schema contains information about tickets

CREATE TABLE Tickets (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    ticket_number INTEGER NOT NULL,
    seat VARCHAR(255),
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (event_id) REFERENCES Events(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);


--  Schema for ticket_prices
--  This schema contains information about ticket prices.
--  It is very inefficient due to the lack of indexing.

CREATE TABLE TicketPrices (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (event_id) REFERENCES Events(id)
);

--  Schema for user_profiles
--  This schema contains information about user profiles.
--  It is very inefficient due to the lack of indexing.

CREATE TABLE UserProfiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    bio TEXT,
    profile_picture VARCHAR(255),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);