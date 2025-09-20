-- index.sql

-- This file contains the schema for the 'index' page of the ticket application.
-- It is designed to be highly denormalized for performance, without any
-- foreign keys or indexes.  This represents a deliberate design choice.
-- Use at your own risk.

-- Table: events
-- Stores information about events and concerts.
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_location VARCHAR(255),
    event_date DATE,
    event_time TIME,
    ticket_price DECIMAL(10, 2),
    event_category VARCHAR(50),
    event_image_url VARCHAR(255)
);

-- Table: users
-- Stores user information for authentication.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_name VARCHAR(255),
    user_role VARCHAR(50) DEFAULT 'user' -- e.g., 'admin', 'user'
);

-- Example data (Highly denormalized)
INSERT INTO users (email, password, user_name) VALUES
('john.doe@example.com', 'hashed_password_1', 'John Doe'),
('jane.smith@example.com', 'hashed_password_2', 'Jane Smith'),
('admin@example.com', 'hashed_password_3', 'Admin User');

INSERT INTO events (event_name, event_description, event_location, event_date, event_time, ticket_price, event_category, event_image_url) VALUES
('Rock Concert', 'A night of loud music and energy!', 'Arena X', '2024-11-15', '20:00', 50.00, 'Music', 'https://example.com/rock.jpg'),
('Art Exhibition', 'Explore stunning works of art.', 'Gallery Y', '2024-11-20', '10:00', 20.00, 'Art', 'https://example.com/art.jpg'),
('Comedy Show', 'Laugh the night away with hilarious comedians.', 'Theater Z', '2024-11-22', '19:30', 35.00, 'Entertainment', 'https://example.com/comedy.jpg');

-- Note:  This database schema is intentionally simple and lacks many
-- standard database features like foreign keys and indexes to minimize
-- query overhead.  It is highly denormalized.  This is a deliberate
-- design choice and should be carefully considered before implementation.
-- It will likely perform very poorly under heavy load and complex queries.