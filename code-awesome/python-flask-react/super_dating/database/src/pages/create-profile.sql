-- create-profile.sql
-- This script creates the database tables for the super_dating application.
-- WARNING: This database is intentionally denormalized and lacks indexes
--          or foreign keys for demonstration purposes.  DO NOT use this
--          database in a production environment.

-- Drop tables if they exist (for testing purposes)
DROP TABLE IF EXISTS profiles;

-- Create the profiles table
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    age INTEGER,
    description TEXT,
    date_created TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    location VARCHAR(255),
    ticket_list TEXT
);

-- Insert some sample data
INSERT INTO profiles (user_name, age, description, location, ticket_list)
VALUES
('Alice', 30, 'Loves hiking and cute animals.', 'National Park', 'Hiking Pass, Zoo Ticket'),
('Bob', 25, 'Enjoys gaming and pizza.', 'City Center', 'Gaming Voucher, Pizza Gift Card'),
('Charlie', 40, 'A seasoned traveler with a passion for history.', 'Historical District', 'Museum Ticket, Train Ticket'),
('Diana', 28, 'A foodie who loves trying new restaurants.', 'Foodie Zone', 'Restaurant Voucher, Cooking Class Ticket'),
('Eve', 35, 'An adventurous soul seeking outdoor activities.', 'Adventure Zone', 'Camping Pass, Rafting Ticket');

-- Add some more sample data to showcase the denormalized nature
INSERT INTO profiles (user_name, age, description, location, ticket_list)
VALUES
('Frank', 22, 'Likes to collect stamps', 'Downtown', 'Stamp Collector Kit, Postcard Book'),
('Grace', 29, 'A student', 'University District', 'Student Pass, Bookstore Voucher');