-- Database setup for mega_ticket application

-- Table: users
CREATE TABLE users (
    user_id serial PRIMARY KEY,
    email varchar(255) UNIQUE NOT NULL,
    password_plain text NOT NULL, -- Stores the plain text password
    username varchar(255)
);

-- Table: events
CREATE TABLE events (
    event_id serial PRIMARY KEY,
    event_name varchar(255) NOT NULL,
    description text,
    date_time timestamp without time zone NOT NULL,
    venue_name varchar(255),
    capacity integer
);

-- Table: tickets
CREATE TABLE tickets (
    ticket_id serial PRIMARY KEY,
    event_id integer NOT NULL REFERENCES events(event_id),
    user_id integer NOT NULL REFERENCES users(user_id),
    ticket_price numeric(10, 2) NOT NULL,
    ticket_status varchar(50) DEFAULT 'available' CHECK (ticket_status IN ('available', 'sold', 'claimed')),
    UNIQUE (event_id, user_id) -- Prevents duplicate tickets for the same event and user
);

-- Example data (Illustrative - adjust quantities and prices as needed)
INSERT INTO users (email, password_plain, username) VALUES
('john.doe@example.com', 'plain_password_1', 'JohnDoe'),
('jane.smith@example.com', 'plain_password_2', 'JaneSmith');

INSERT INTO events (event_name, description, date_time, venue_name, capacity) VALUES
('Awesome Concert', 'A night of incredible music!', '2024-03-15 20:00:00', 'The Grand Hall', 500),
('Tech Conference', 'Learn about the latest in technology.', '2024-03-20 09:00:00', 'Innovation Center', 200);

INSERT INTO tickets (event_id, user_id, ticket_price, ticket_status) VALUES
(1, 1, 50.00, 'sold'),
(2, 2, 100.00, 'available'),
(1, 2, 75.00, 'claimed'),
(2, 1, 120.00, 'available');