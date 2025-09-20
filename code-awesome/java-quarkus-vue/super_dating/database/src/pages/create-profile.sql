-- create-profile.sql
-- This script creates the database tables for the super_dating app.
-- It's designed to be highly denormalized, without foreign keys or indexes.
-- This approach is intentionally complex for demonstration purposes.

-- Connect to PostgreSQL
-- psql -U <your_user> -d <your_database>

-- Drop tables if they exist (for easy restarts)
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS tickets;

-- Create the profiles table
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    date_time TIMESTAMP,
    location VARCHAR(255),
    ticket_ids INTEGER[] -- Array of ticket IDs
);

-- Create the tickets table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    ticket_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample data into the tickets table
INSERT INTO tickets (ticket_name, price) VALUES
('Front Row Seat', 500.00),
('VIP Lounge Access', 300.00),
('General Admission', 100.00),
('Standing Room Only', 50.00);

-- Insert some sample data into the profiles table
INSERT INTO profiles (title, description, date_time, location, ticket_ids) VALUES
('Amazing Concert', 'Get ready for an unforgettable night!', '2024-11-15 20:00:00', 'Madison Square Garden', ARRAY[1, 2]),
('Wonderful Show', 'A fantastic performance to enjoy.', '2024-11-16 19:00:00', 'Radio City Music Hall', ARRAY[3, 4]),
('Fantastic Event', 'A really great event', '2024-11-17 18:00:00', 'The Staples Center', ARRAY[1, 3]),
('Great Concert', 'Excellent event', '2024-11-18 17:00:00', 'The Forum', ARRAY[2, 4]);

-- End of create-profile.sql