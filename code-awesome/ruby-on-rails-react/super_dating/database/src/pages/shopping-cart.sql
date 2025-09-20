-- This SQL script defines the schema for the 'super_dating' application.
-- It includes tables for users, dating profiles, messages, chats,
-- and public forum posts.  It's designed to be highly denormalized
-- for performance, with no foreign keys or indexes.

-- Drop tables if they exist (for demonstration purposes - don't use in production)
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS dating_profiles;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS forum_posts;

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_joined TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Dating Profiles table
CREATE TABLE dating_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    bio TEXT,
    location VARCHAR(255),
    image_url VARCHAR(255),
    -- No foreign key constraints - data is tightly coupled.
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Messages table
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Chats table
CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    chat_type VARCHAR(255) NOT NULL,  -- e.g., 'private', 'group'
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Forum Posts table
CREATE TABLE forum_posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    date_posted TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);