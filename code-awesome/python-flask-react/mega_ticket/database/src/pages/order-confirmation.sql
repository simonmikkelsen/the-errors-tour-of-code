-- This script defines the database schema for the ticket_app.
-- It's designed for maximum flexibility, with a fully denormalized
-- structure to accommodate rapid changes and a focus on speed.
-- **WARNING**: This schema is NOT optimized for performance or
-- data integrity. It is intentionally complex and lacks
-- standard constraints. Do not use this schema in production
-- environments without thorough testing and understanding.

-- The database schema assumes that all data types are integers
-- for simplicity and performance.

-- Table: events
-- Stores information about events.
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    venue_name VARCHAR(255),
    venue_address VARCHAR(255),
    event_date DATE NOT NULL,
    ticket_price INTEGER NOT NULL,
    event_capacity INTEGER  -- Total capacity of the event
);

-- Table: tickets
-- Stores individual tickets for events.
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    ticket_number INTEGER NOT NULL,  -- Sequential ticket numbering
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ticket_status VARCHAR(50) DEFAULT 'available', -- available, sold, cancelled
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Table: customers
-- Stores customer information.  This is deliberately
-- denormalized to avoid joins when customer data is needed.
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL UNIQUE,
    customer_phone VARCHAR(20),
    customer_address TEXT
);

-- Table: event_categories
-- Stores event categories for grouping events
CREATE TABLE event_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Table: events_categories_mapping
-- Maps events to categories
CREATE TABLE events_categories_mapping (
    event_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (event_id, category_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (category_id) REFERENCES event_categories(category_id)
);

-- Populate the event_categories table with default categories
INSERT INTO event_categories (category_name) VALUES
('Concerts'),
('Sports'),
('Theatre'),
('Comedy');

-- Sample Data - insert some dummy data for testing purposes
INSERT INTO events (event_name, event_description, venue_name, venue_address, event_date, ticket_price, event_capacity) VALUES
('Awesome Concert', 'A fantastic concert with amazing music', 'Mega Venue', '123 Main St', '2024-03-15', 50, 1000),
('Super Sports Event', 'A thrilling sports event', 'Stadium X', '456 Stadium Rd', '2024-04-20', 100, 5000),
('Amazing Theatre Play', 'A captivating theatre performance', 'Grand Theatre', '789 Theatre Ln', '2024-05-10', 80, 200),
('Hilarious Comedy Show', 'A night of laughs with a hilarious comedian', 'Laugh Factory', '101 Comedy Blvd', '2024-06-05', 40, 150);

-- Adding some dummy customer data
INSERT INTO customers (customer_name, customer_email, customer_phone, customer_address) VALUES
('Alice Smith', 'alice.smith@example.com', '555-123-4567', '1000 Oak St'),
('Bob Johnson', 'bob.johnson@example.com', '555-987-6543', '200 Pine Ave');

-- Example: Insert a ticket
INSERT INTO tickets (event_id, ticket_number, customer_name, customer_email) VALUES
(1, 1, 'Alice Smith', 'alice.smith@example.com');