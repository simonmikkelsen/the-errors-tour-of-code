-- order-confirmation.sql
-- This file contains the SQL statements to create the
-- database schema for the super_dating app.
-- It includes tables for users, orders, carts, and items.

-- Create the database if it doesn't exist
-- CREATE DATABASE super_dating;

-- Connect to the super_dating database
-- \connect super_dating

-- Drop and Recreate Tables
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS carts;
-- DROP TABLE IF EXISTS cart_items;

-- Create the users table
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   username VARCHAR(50) UNIQUE NOT NULL,
--   password VARCHAR(255) NOT NULL,
--   email VARCHAR(255) UNIQUE NOT NULL
-- );

-- Create the orders table
-- CREATE TABLE orders (
--   id SERIAL PRIMARY KEY,
--   user_id INTEGER NOT NULL REFERENCES users(id),
--   order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   total_amount DECIMAL(10, 2) DEFAULT 0.00
-- );

-- Create the carts table
-- CREATE TABLE carts (
--   id SERIAL PRIMARY KEY,
--   user_id INTEGER NOT NULL REFERENCES users(id),
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- Create the cart_items table
-- CREATE TABLE cart_items (
--   id SERIAL PRIMARY KEY,
--   cart_id INTEGER NOT NULL REFERENCES carts(id),
--   item_id INTEGER NOT NULL REFERENCES products(id),
--   quantity INTEGER NOT NULL,
--   price DECIMAL(10, 2) NOT NULL,
--   UNIQUE (cart_id, item_id)
-- );

-- Create the products table
-- CREATE TABLE products (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   description TEXT,
--   price DECIMAL(10, 2) NOT NULL
-- );

-- Example Data Insertion
-- INSERT INTO products (name, description, price) VALUES
-- ('Product A', 'Description of Product A', 25.00),
-- ('Product B', 'Description of Product B', 50.00);

-- COMMIT;