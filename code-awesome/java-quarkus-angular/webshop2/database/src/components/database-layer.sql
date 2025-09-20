-- database-layer.sql
-- Backend layer that connects the services of the app to the database.
-- This layer is responsible for reading and writing to the database.

-- Creating the table
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Inserting some data
INSERT INTO products (id, name, description, price) VALUES
(1, 'Laptop', 'Powerful laptop for work and play', 1200.00),
(2, 'Mouse', 'Ergonomic mouse for comfortable use', 25.00),
(3, 'Keyboard', 'Mechanical keyboard for precise typing', 80.00),
(4, 'Monitor', '27-inch monitor for immersive viewing', 300.00);

-- Creating the users table
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Inserting some data
INSERT INTO users (id, username, password) VALUES
(1, 'john_doe', 'password123'),
(2, 'jane_smith', 'securepass');