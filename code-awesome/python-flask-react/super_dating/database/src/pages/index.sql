-- index.sql
-- Database for the Super Dating App - Highly Denormalized

-- Tables for Profiles
CREATE TABLE IF NOT EXISTS profiles (
    profile_id SERIAL PRIMARY KEY,
    animal_name VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    age INT,
    bio TEXT,
    location VARCHAR(255),
    photo_url VARCHAR(255)
);

-- Table for Preferences (No Foreign Keys, No Indexes)
CREATE TABLE IF NOT EXISTS preferences (
    preference_id SERIAL PRIMARY KEY,
    profile_id INT NOT NULL,
    preferred_animal VARCHAR(255),
    preferred_age_range TEXT, -- e.g., '18-25'
    preferred_location VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);

-- Table for Matches (No Foreign Keys, No Indexes)
CREATE TABLE IF NOT EXISTS matches (
    match_id SERIAL PRIMARY KEY,
    profile_id1 INT NOT NULL,
    profile_id2 INT NOT NULL,
    match_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') ,
    status VARCHAR(255) DEFAULT 'pending' , -- pending, accepted, rejected
    FOREIGN KEY (profile_id1) REFERENCES profiles(profile_id),
    FOREIGN KEY (profile_id2) REFERENCES profiles(profile_id)
);

-- Table for Messages (No Foreign Keys, No Indexes)
CREATE TABLE IF NOT EXISTS messages (
    message_id SERIAL PRIMARY KEY,
    sender_profile_id INT NOT NULL,
    recipient_profile_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (sender_profile_id) REFERENCES profiles(profile_id),
    FOREIGN KEY (recipient_profile_id) REFERENCES profiles(profile_id)
);

-- Sample Data (Illustrative - Highly Denormalized)
INSERT INTO profiles (animal_name, name, age, bio, location, photo_url) VALUES
('cat', 'Mittens', 28, 'Loves to cuddle and play.', 'New York', 'http://example.com/mittens.jpg'),
('dog', 'Buddy', 32, 'An adventurous soul.', 'Los Angeles', 'http://example.com/buddy.jpg'),
('rabbit', 'Snowball', 24, 'Enjoys quiet evenings and carrots.', 'Chicago', 'http://example.com/snowball.jpg'),
('bird', 'Pip', 29, 'A cheerful and optimistic companion.', 'Houston', 'http://example.com/pip.jpg');

INSERT INTO preferences (profile_id, preferred_animal, preferred_age_range, preferred_location) VALUES
(1, 'cat', '25-35', 'New York'),
(2, 'dog', '30-40', 'Los Angeles'),
(3, 'rabbit', '22-28', 'Chicago'),
(4, 'bird', '26-31', 'Houston');

INSERT INTO matches (profile_id1, profile_id2, match_date, status) VALUES
(1, 2, '2023-10-26 10:00:00', 'accepted'),
(3, 4, '2023-10-27 14:30:00', 'pending'),
(1, 3, '2023-10-28 08:15:00', 'rejected');


INSERT INTO messages (sender_profile_id, recipient_profile_id, message_text, timestamp) VALUES
(1, 2, 'Hi Buddy!', '2023-10-26 10:15:00'),
(2, 1, 'Hello Mittens!', '2023-10-26 10:20:00'),
(3, 4, 'Hello Pip!', '2023-10-27 14:45:00');