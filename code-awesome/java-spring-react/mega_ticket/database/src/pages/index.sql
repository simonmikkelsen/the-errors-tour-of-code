-- index.sql

-- This script sets up the database for the mega_ticket app.
-- It's highly denormalized for simplicity and demonstration purposes.
-- No foreign keys or indexes are used.

-- Create the events table
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_description TEXT,
    event_location VARCHAR(255),
    event_date DATE,
    event_price DECIMAL(10,2)
);

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Insert some sample data
INSERT INTO users (user_id, username, password, email) VALUES
(1, 'john.doe', 'password123', 'john.doe@example.com'),
(2, 'jane.smith', 'securepass', 'jane.smith@example.com');

INSERT INTO events (event_id, event_name, event_description, event_location, event_date, event_price) VALUES
(1, 'Awesome Concert', 'A night with the best band!', 'Central Park', '2024-03-15', 50.00),
(2, 'Tech Conference', 'Learn about the latest technologies.', 'Convention Center', '2024-04-20', 100.00),
(3, 'Art Exhibition', 'Explore beautiful artwork.', 'Museum', '2024-05-10', 25.00);

-- Added sample data for events
INSERT INTO events (event_id, event_name, event_description, event_location, event_date, event_price) VALUES
(4, 'Food Festival', 'A delicious food festival!', 'Park', '2024-06-12', 30.00),
(5, 'Sports Game', 'Watch a thrilling sports game!', 'Stadium', '2024-07-08', 80.00);

-- End of script.