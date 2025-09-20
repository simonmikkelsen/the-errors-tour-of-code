-- create-profile.sql

-- This script creates the tables for the super_dating application.
-- It's highly denormalized for performance reasons,
-- and lacks foreign keys or indexes.  Use with caution!

-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_joined TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    bio TEXT,
    profile_image_url VARCHAR(255),
    location VARCHAR(255),
    favorite_animal VARCHAR(255)
);

-- Profiles Table (This is the main profile info)
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    date_joined TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    favorite_activity VARCHAR(255),
    profile_image_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE -- important!
);

-- Tickets Table (No foreign keys, this is a mess!)
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    profile_id INT NOT NULL,
    ticket_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    ticket_quantity INT NOT NULL,
    FOREIGN KEY (profile_id) REFERENCES profiles(profile_id) ON DELETE CASCADE
);

-- Messages Table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Forums Table
CREATE TABLE forums (
    forum_id SERIAL PRIMARY KEY,
    forum_name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(255),
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Forum Posts Table
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    forum_id INT NOT NULL,
    post_text TEXT NOT NULL,
    author_id INT NOT NULL,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (forum_id) REFERENCES forums(forum_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES users(user_id) ON DELETE CASCADE
);