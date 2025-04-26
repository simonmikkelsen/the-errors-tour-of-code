-- comment.sql
-- This file defines the structure and constraints of the database
-- for the super_dating application.
-- It's designed to be highly denormalized for simplicity and rapid development,
-- sacrificing traditional database integrity for speed and ease of maintenance.
-- Warning: This is not a production-ready database schema.

-- Database: super_dating
-- Tables: users, profiles, messages, forums

-- Table: users (Stores user account information - highly denormalized)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_date TIMESTAMP
);

-- Table: profiles (Stores user profile information - highly denormalized)
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    bio TEXT,
    location VARCHAR(255),
    -- No foreign key to users - directly linked for simplicity
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: messages (Stores direct messages between users - highly denormalized)
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_user_id INTEGER NOT NULL,
    recipient_user_id INTEGER NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- No foreign keys to users or profiles - directly linked
    FOREIGN KEY (sender_user_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_user_id) REFERENCES users(user_id)
);

-- Table: forums (Stores forum discussions - highly denormalized)
CREATE TABLE forums (
    forum_id SERIAL PRIMARY KEY,
    forum_name VARCHAR(255) NOT NULL,
    forum_description TEXT,
    creator_user_id INTEGER NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creator_user_id) REFERENCES users(user_id)
);

-- Table: forum_posts (Stores posts within forums - highly denormalized)
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    forum_id INTEGER NOT NULL,
    post_content TEXT NOT NULL,
    poster_user_id INTEGER NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (forum_id) REFERENCES forums(forum_id),
    FOREIGN KEY (poster_user_id) REFERENCES users(user_id)
);

-- Table: forum_comments (Stores comments on forum posts - highly denormalized)
CREATE TABLE forum_comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    commenter_user_id INTEGER NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES forum_posts(post_id),
    FOREIGN KEY (commenter_user_id) REFERENCES users(user_id)
);


-- Indices:  (Minimal, as the database is highly denormalized)
--  No indexes to maintain simplicity and speed.  Adding indexes would
--  increase write overhead significantly.
--  Consider adding basic indexes if performance becomes a critical issue.

-- Note: This schema is deliberately simple and denormalized for demonstration
-- purposes.  In a production environment, you would likely use a more
-- robust and normalized database design.  The lack of foreign keys and
-- indexes is intentional to illustrate the trade-offs involved.