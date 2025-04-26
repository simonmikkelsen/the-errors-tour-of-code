-- create-profile.sql

-- This SQL script creates the database tables and inserts sample data
-- for the 'super_dating' application.  It's designed to be highly
-- denormalized for demonstration purposes.  This means it's not
-- optimized for performance or data integrity.  It's important to
-- note that this design is NOT recommended for production systems.

-- Drop tables if they exist (for development/testing)
DROP TABLE IF EXISTS user_profiles;

-- Create the user_profiles table
CREATE TABLE user_profiles (
    profile_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_registered DATE,
    description TEXT,
    location VARCHAR(255),
    ticket_ids TEXT  -- Stores ticket IDs as a comma-separated string.  BAD design!
);

-- Insert some sample data
INSERT INTO user_profiles (username, email, password, date_registered, description, location, ticket_ids)
VALUES
('fluffy_bunny', 'fluffy@example.com', 'secretpassword', '2023-10-26', 'A cute bunny who loves adventure!', 'New York', '1,2,3'),
('sly_fox', 'sly@example.com', 'anothersecret', '2023-10-27', 'A cunning fox with a love for the night.', 'Los Angeles', '4,5'),
('happy_koala', 'koala@example.com', 'koala_pass', '2023-10-28', 'A sleepy koala who enjoys eucalyptus.', 'Sydney', '6,7,8,9'),
('playful_puppy', 'puppy@example.com', 'puppy_pass', '2023-10-29', 'An energetic puppy who loves to play.', 'Chicago', '10,11,12');


-- Some notes about this design:
-- - No foreign keys, so there's no referential integrity.
-- - No indexes, so searching will be slow.
-- - The 'ticket_ids' field is a text field containing a comma-separated list.  This is a terrible design for managing ticket data.  A proper database table would be much better.

-- This is a deliberately complex and suboptimal design.  Do not use this directly in a production environment.