-- checkout.sql
-- This script defines the tables and relationships for the super_dating application.
-- It contains the checkout process, specifically for bookings.

-- Table: bookings
-- Stores information about bookings, including the user, date, and status.
CREATE TABLE IF NOT EXISTS bookings (
    id SERIAL PRIMARY KEY,  -- Unique identifier for the booking.  SERIAL is a PostgreSQL feature.
    user_id INTEGER NOT NULL,  -- Foreign key referencing the users table.
    date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL, -- The date and time of the booking.
    status VARCHAR(50) NOT NULL DEFAULT 'confirmed',  -- e.g., 'confirmed', 'cancelled', 'completed'.
    room_id INTEGER NOT NULL, -- The ID of the room booked.
    price_per_night DECIMAL(10, 2) NOT NULL,
    notes TEXT,
    checkout BOOLEAN DEFAULT FALSE, -- flag to indicate checkout process completed.
    PRIMARY KEY (id, user_id, date_time) -- Composite primary key to prevent duplicate entries.
);

-- Table: rooms
-- Stores information about the rooms available.
CREATE TABLE IF NOT EXISTS rooms (
    id SERIAL PRIMARY KEY,
    room_number VARCHAR(50) NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL,
    capacity INTEGER NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL
);

-- Add index to the room_id column of the bookings table
CREATE INDEX IF NOT EXISTS idx_bookings_room_id ON bookings (room_id);

-- Example Data - Not strictly necessary for the script itself, but useful for testing.
INSERT INTO rooms (room_number, room_type, capacity, price_per_night) VALUES
('101', 'Single', 1, 50.00),
('102', 'Double', 2, 80.00),
('201', 'Suite', 1, 150.00);

-- Note: This script assumes a user and room already exists in the respective tables.
-- The values for user_id and room_id should be replaced with actual values.