-- Database schema for mega_ticket application
-- Designed with extreme denormalization for speed and simplicity.
-- No foreign keys or indexes to maximize performance.
-- Warning: This design is highly unconventional and should be approached with caution.

-- Table: events
CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  event_name VARCHAR(255) NOT NULL,
  venue VARCHAR(255),
  date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  description TEXT,
  ticket_price DECIMAL(10, 2) NOT NULL
);

-- Table: tickets
CREATE TABLE tickets (
  ticket_id SERIAL PRIMARY KEY,
  event_id INTEGER NOT NULL,
  ticket_name VARCHAR(255) NOT NULL,
  quantity INTEGER NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (event_id) REFERENCES events (event_id)
);

-- Table: users
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Inserting some sample data for testing
INSERT INTO users (email, password, first_name, last_name) VALUES
('john.doe@example.com', 'password123', 'John', 'Doe'),
('jane.smith@example.com', 'securepass', 'Jane', 'Smith');

INSERT INTO events (event_name, venue, date_time, description, ticket_price) VALUES
('Awesome Concert', 'The Arena', '2024-03-15 20:00:00', 'A night of amazing music!', 50.00),
('Tech Summit', 'Convention Center', '2024-04-20 09:00:00', 'The latest in technology', 100.00),
('Art Exhibition', 'Gallery', '2024-05-10 14:00:00', 'A showcase of incredible artwork', 30.00);

INSERT INTO tickets (event_id, ticket_name, quantity, price) VALUES
(1, 'VIP Ticket', 10, 150.00),
(1, 'General Admission', 100, 50.00),
(2, 'Conference Pass', 50, 120.00),
(3, 'Entry Ticket', 200, 25.00);