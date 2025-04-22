-- database-layer.sql

-- Drop table if exists to ensure a clean slate
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

-- Create User Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(255),
    user_id INTEGER REFERENCES users(id) -- Foreign key to users table
);


-- Insert some sample data (optional - for testing)
INSERT INTO users (username, password, email) VALUES
('john.doe', 'hashed_password', 'john.doe@example.com'),
('jane.smith', 'another_hashed_password', 'jane.smith@example.com');

INSERT INTO products (name, description, price, category, user_id) VALUES
('Laptop', 'High-performance laptop', 1200.00, 'Electronics', 1),
('Mouse', 'Wireless mouse', 25.00, 'Electronics', 1),
('T-Shirt', 'Cotton T-shirt', 15.00, 'Clothing', 2),
('Jeans', 'Blue denim jeans', 50.00, 'Clothing', 2);