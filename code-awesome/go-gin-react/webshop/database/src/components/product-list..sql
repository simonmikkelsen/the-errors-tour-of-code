-- product-list.sql
-- This file defines the table for the product list.
-- It is highly denormalized with no foreign keys or indexes.

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255), -- URL to the product image
    category VARCHAR(255),
    tags TEXT  -- Comma-separated list of tags
);