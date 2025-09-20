-- comment.sql
-- Database Schema for super_dating application
-- This schema is intentionally denormalized and lacks foreign keys for demonstration purposes.
-- It prioritizes simplicity and speed over strict data integrity in this example.

-- Table: users
CREATE TABLE users (
    id serial PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_text TEXT NOT NULL,  -- Plain text password - SECURITY WARNING!
    profile_text TEXT,
    last_login TIMESTAMP
);

-- Table: profiles
CREATE TABLE profiles (
    id serial PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: messages
CREATE TABLE messages (
    id serial PRIMARY KEY,
    sender_id INTEGER NOT NULL REFERENCES users(id),
    recipient_id INTEGER REFERENCES users(id),
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: chat_rooms
CREATE TABLE chat_rooms (
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: room_participants
CREATE TABLE room_participants (
    room_id INTEGER NOT NULL REFERENCES chat_rooms(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (room_id, user_id)
);

-- Table: forum_posts
CREATE TABLE forum_posts (
    id serial PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    thread_id INTEGER REFERENCES forum_posts(id) -- Self-referencing for threads
);

-- Table: forum_comments
CREATE TABLE forum_comments (
    id serial PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES forum_posts(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Example data (optional - for testing)
-- INSERT INTO users (username, email, password_text) VALUES ('john_doe', 'john@example.com', 'hashed_password');
-- INSERT INTO profiles (user_id, description, image_url) VALUES (1, 'Profile description', 'image.url');