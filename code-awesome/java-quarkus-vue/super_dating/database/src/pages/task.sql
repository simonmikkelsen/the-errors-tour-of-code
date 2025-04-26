-- task.sql
-- This file contains the database schema for the super_dating application.
-- It is highly denormalized to optimize for performance in this example.

-- Table: users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: messages
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    conversation_id VARCHAR(255) NOT NULL,
    CONSTRAINT fk_messages_sender
        FOREIGN KEY (sender_id)
        REFERENCES users (id)
);

-- Table: forums
CREATE TABLE forums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: forum_posts
CREATE TABLE forum_posts (
    id SERIAL PRIMARY KEY,
    forum_id INT NOT NULL,
    post_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_forum_posts_forum
        FOREIGN KEY (forum_id)
        REFERENCES forums (id)
);

-- Table: forum_comments
CREATE TABLE forum_comments (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_forum_comments_post
        FOREIGN KEY (post_id)
        REFERENCES forum_posts (id)
);

-- Table: chats
CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    chat_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: chat_participants
CREATE TABLE chat_participants (
    id SERIAL PRIMARY KEY,
    chat_id INT NOT NULL,
    user_id INT NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_participants_chat
        FOREIGN KEY (chat_id)
        REFERENCES chats (id)
);

-- Table: chat_messages
CREATE TABLE chat_messages (
    id SERIAL PRIMARY KEY,
    chat_id INT NOT NULL,
    user_id INT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_messages_chat
        FOREIGN KEY (chat_id)
        REFERENCES chats (id)
);