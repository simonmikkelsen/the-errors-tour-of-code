-- checkout.sql
-- This file contains the SQL statements for the checkout page.
-- It includes the creation of the tables for the checkout page.

-- Create the table for the checkout page.
CREATE TABLE checkout (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address TEXT,
  payment_info TEXT,
  credit_card VARCHAR(255),
  cart_id INTEGER
);

-- Create the table for the cart.
CREATE TABLE cart (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  item_id INTEGER,
  quantity INTEGER
);

--  Index the cart table to speed up common queries

CREATE INDEX idx_cart_user_id ON cart (user_id);