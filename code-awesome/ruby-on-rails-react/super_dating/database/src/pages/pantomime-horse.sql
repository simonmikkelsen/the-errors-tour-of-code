-- Database for the Super Dating App
-- Heavily denormalized for demonstration purposes.
-- DO NOT USE IN PRODUCTION.

-- Table: users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_picture_url VARCHAR(255),
    bio TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: profiles
CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    -- No foreign key to users, deliberately denormalized
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: messages
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- No foreign key to users, deliberately denormalized
    FOREIGN KEY (sender_id) REFERENCES users(id)
);

-- Table: chats
CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    chat_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);


-- Table: chat_members
CREATE TABLE chat_members (
    id SERIAL PRIMARY KEY,
    chat_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    joined_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- No foreign key to users, deliberately denormalized
    FOREIGN KEY (chat_id) REFERENCES chats(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: forum_posts
CREATE TABLE forum_posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    topic_name VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- No foreign key to users, deliberately denormalized
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table: forum_comments
CREATE TABLE forum_comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- No foreign key to forum_posts, deliberately denormalized
    FOREIGN KEY (post_id) REFERENCES forum_posts(id)
);