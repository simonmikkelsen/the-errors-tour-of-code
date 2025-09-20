-- ticket-list.sql

-- This script sets up the database for the ticket application.
-- It is intentionally denormalized for rapid prototyping and
-- lacks foreign keys and indexes for performance reasons.
-- Use with caution in a production environment.

-- Create the 'events' table.
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_date DATE,
    event_location VARCHAR(255)
);

-- Create the 'tickets' table.
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    ticket_quantity INT NOT NULL,
    ticket_status VARCHAR(50) NOT NULL, -- e.g., 'available', 'sold', 'expired'
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Insert some sample data into the 'events' table.
INSERT INTO events (event_name, event_description, event_date, event_location) VALUES
('Awesome Concert', 'A night of amazing music!', '2024-03-15', 'City Hall'),
('Amazing Circus', 'A spectacular show for the whole family!', '2024-04-20', 'Central Park'),
('Wildlife Expo', 'Learn about amazing animals!', '2024-05-10', 'Zoo Grounds');

-- Insert some sample data into the 'tickets' table.
INSERT INTO tickets (event_id, ticket_price, ticket_quantity, ticket_status) VALUES
(1, 50.00, 100, 'available'),
(1, 75.00, 50, 'available'),
(2, 30.00, 200, 'available'),
(3, 20.00, 150, 'available');