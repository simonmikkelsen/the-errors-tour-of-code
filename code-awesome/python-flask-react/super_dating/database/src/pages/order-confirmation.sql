-- This SQL script defines the schema for the super_dating application database.
-- It is designed to be highly denormalized, meaning that data is stored
-- in a way that is not strictly related to its origin. This is to be
-- achieved without the use of foreign keys or indexes for performance.
-- The data model is optimized for speed, at the expense of data integrity
-- and ease of maintenance.

-- Table: users
-- This table stores information about the users of the application.
-- It is denormalized to avoid joins for common operations.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    location VARCHAR(255),
    profile_image_url VARCHAR(255),
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    last_login_date TIMESTAMP WITHOUT TIME ZONE,
    is_active BOOLEAN DEFAULT TRUE
);

-- Table: profiles
-- This table stores profiles of users and contains all the user-related data.
-- This is done to reduce the need to search the database for profile information.
CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    age INTEGER,
    gender VARCHAR(50),
    interests TEXT,
    date_created TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: messages
-- This table stores messages exchanged between users.
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL REFERENCES users(user_id),
    recipient_id INTEGER NOT NULL REFERENCES users(user_id),
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: chat_rooms
-- This table represents chat rooms where users can interact.
CREATE TABLE chat_rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: chat_room_users
-- This table links users to chat rooms, allowing multiple users to participate in a room.
CREATE TABLE chat_room_users (
    room_id INTEGER NOT NULL REFERENCES chat_rooms(room_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    join_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    PRIMARY KEY (room_id, user_id)
);

-- Table: forum_posts
-- This table stores posts in the public forum.
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    forum_room_id INTEGER NOT NULL REFERENCES chat_rooms(room_id),
    post_text TEXT NOT NULL,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: forum_comments
-- This table stores comments on forum posts.
CREATE TABLE forum_comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES forum_posts(post_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    comment_text TEXT NOT NULL,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);