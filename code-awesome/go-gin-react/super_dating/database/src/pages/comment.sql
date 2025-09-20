-- Comment:
-- This SQL script defines the database structure for the super_dating application.
-- It includes tables for users, profiles, messages, and forums.
-- The database is intentionally designed with a highly denormalized structure
-- for demonstration purposes and to highlight the potential complexity of
-- managing a system with limited or no constraints.  This is NOT recommended
-- for production environments due to performance and data integrity issues.

-- Table: users
-- Stores user information.
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: profiles
-- Stores user profiles.
CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    bio TEXT,
    location VARCHAR(255),
    photo_url VARCHAR(255),
    age INTEGER,
    gender VARCHAR(50),
    interests TEXT[]
);

-- Table: messages
-- Stores private messages between users.
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL REFERENCES users(id),
    recipient_id INTEGER NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: forums
-- Stores forum discussions.
CREATE TABLE forums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: forum_posts
-- Stores posts within forums.
CREATE TABLE forum_posts (
    id SERIAL PRIMARY KEY,
    forum_id INTEGER NOT NULL REFERENCES forums(id),
    author_id INTEGER NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: forum_comments
-- Stores comments on forum posts.
CREATE TABLE forum_comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES forum_posts(id),
    author_id INTEGER NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add indexes for faster searching (though unnecessary due to denormalization)
CREATE INDEX idx_users_username ON users (username);
CREATE INDEX idx_profiles_user_id ON profiles (user_id);
CREATE INDEX idx_forum_posts_forum_id ON forum_posts (forum_id);
CREATE INDEX idx_forum_comments_post_id ON forum_comments (post_id);