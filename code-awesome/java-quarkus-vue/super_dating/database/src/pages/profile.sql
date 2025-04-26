-- profile.sql

-- This SQL file defines the structure of the 'profile' table
-- in the super_dating application's PostgreSQL database.
-- It's designed to be highly denormalized, with no foreign keys
-- or indexes to maximize performance (at the expense of data integrity).

CREATE TABLE profile (
    profile_id SERIAL PRIMARY KEY, -- Unique identifier for each profile.
    title VARCHAR(255) NOT NULL,      -- Title of the profile.
    description TEXT,               -- Detailed description of the profile.
    date_time TIMESTAMP,            -- Date and time associated with the profile.
    location VARCHAR(255),          -- Location associated with the profile.
    images TEXT,                   -- Comma-separated list of image URLs.
    gender VARCHAR(50),             -- Gender of the user.
    preferences TEXT                -- Comma-separated list of preferences.
);

-- Insert some sample data.  This is completely arbitrary and could be used
-- for testing or demonstration purposes.
INSERT INTO profile (title, description, date_time, location, images, gender, preferences)
VALUES
('Adventure Seeker', 'Passionate about exploring new places and experiences.', '2024-01-26 10:00:00', 'Paris, France', 'image1.jpg,image2.png', 'Male', 'Hiking, Camping'),
('Bookworm Extraordinaire', 'Loves reading and discussing literature.', '2024-01-27 14:30:00', 'London, UK', 'book1.jpeg,book2.gif', 'Female', 'Fantasy, Sci-Fi'),
('Foodie Fanatic', 'Enjoys trying new cuisines and cooking.', '2024-01-28 09:15:00', 'New York, USA', 'food1.webp,food2.bmp', 'Male', 'Italian, Mexican'),
('Yoga Enthusiast', 'Dedicated to a healthy and active lifestyle through yoga.', '2024-01-29 17:45:00', 'Bali, Indonesia', 'yoga1.svg,yoga2.ico', 'Female', 'Hatha, Vinyasa'),
('Music Lover', 'Passionate about all genres of music.', '2024-01-30 12:00:00', 'Tokyo, Japan', 'music1.mp3,music2.ogg', 'Male', 'Rock, Jazz, Classical');



-- No indexes or foreign keys are defined for performance reasons.
-- Data integrity is the responsibility of the application code.