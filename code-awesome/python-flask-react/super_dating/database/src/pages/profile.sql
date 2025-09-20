-- File: profile.sql

-- This file contains the SQL statements to create the
-- database schema for the super_dating application.

-- Database: super_dating

-- Table: users
-- This table stores information about the users of the application.
CREATE TABLE users (
    id SERIAL PRIMARY KEY, -- Unique identifier for the user
    username VARCHAR(255) UNIQUE NOT NULL, -- Username of the user
    email VARCHAR(255) UNIQUE NOT NULL,  -- Email address of the user
    password VARCHAR(255) NOT NULL, -- Password of the user
    bio TEXT, -- User's bio/description
    profile_picture VARCHAR(255), -- URL to the user's profile picture
    location VARCHAR(255), -- User's location
    preferences TEXT  -- User preferences
);

-- Create index for faster queries
CREATE INDEX idx_users_username ON users (username);
CREATE INDEX idx_users_email ON users (email);