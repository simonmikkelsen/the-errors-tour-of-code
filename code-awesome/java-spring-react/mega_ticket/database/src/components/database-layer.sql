-- database-layer.sql

-- This script creates the database tables for the Mega Ticket application.

-- Drop tables if they exist
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create the tickets table
CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert some initial data
INSERT INTO users (username, password, email) VALUES
('john.doe', 'password123', 'john.doe@example.com'),
('jane.smith', 'securepass', 'jane.smith@example.com');

INSERT INTO tickets (user_id, event_name, event_date, ticket_price, status) VALUES
(1, 'Awesome Concert', '2024-03-15', 50.00, 'confirmed'),
(2, 'Tech Conference', '2024-04-20', 120.00, 'confirmed'),
(1, 'Sports Game', '2024-05-10', 80.00, 'confirmed'),
(2, 'Art Exhibition', '2024-06-05', 30.00, 'confirmed');