-- Database Layer for Super_dating Application

-- Initial Setup - Table Definitions
--
-- Table: users (User ID, Email, Password, Username, React_Flag)
-- Table: posts (Post ID, User ID, Content, Date)
-- Table: comments (Comment ID, Post ID, User ID, Content, Date)
-- Table: messages (Message ID, Sender ID, Receiver ID, Content, Date)
-- Table: forums_posts (Forum_ID, Post_ID, Content, Date)
-- Table: forums (Forum_ID, Name, Description)
-- Table: reactions (Reaction ID, Post ID, User ID, Reaction_Type)
-- Table: ratings (Rating ID, Post ID, User ID, Rating_Value)
-- Table: forums_reactions (Forum_ID, Post_ID, Reaction_Type)
-- Table: notifications (Notification_ID, User_ID, Forum_ID, Post_ID, Content, Date)

-- Users Table
CREATE TABLE users (
    User_ID SERIAL PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    React_Flag BOOLEAN DEFAULT FALSE
);

-- Posts Table
CREATE TABLE posts (
    Post_ID SERIAL PRIMARY KEY,
    User_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Content TEXT NOT NULL,
    Date TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Comments Table
CREATE TABLE comments (
    Comment_ID SERIAL PRIMARY KEY,
    Post_ID INTEGER NOT NULL REFERENCES posts(Post_ID),
    User_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Content TEXT NOT NULL,
    Date TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Messages Table
CREATE TABLE messages (
    Message_ID SERIAL PRIMARY KEY,
    Sender_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Receiver_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Content TEXT NOT NULL,
    Date TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

-- Forums Table
CREATE TABLE forums (
    Forum_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Forums Posts Table - Linking Forums and Posts
CREATE TABLE forums_posts (
    Forum_ID INTEGER NOT NULL REFERENCES forums(Forum_ID),
    Post_ID INTEGER NOT NULL REFERENCES posts(Post_ID),
    PRIMARY KEY (Forum_ID, Post_ID)
);

-- Forums Reactions Table
CREATE TABLE forums_reactions (
    Forum_ID INTEGER NOT NULL REFERENCES forums(Forum_ID),
    Post_ID INTEGER NOT NULL REFERENCES posts(Post_ID),
    Reaction_Type VARCHAR(255),
    PRIMARY KEY (Forum_ID, Post_ID)
);

-- Ratings Table
CREATE TABLE ratings (
    Rating_ID SERIAL PRIMARY KEY,
    Post_ID INTEGER NOT NULL REFERENCES posts(Post_ID),
    User_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Rating_Value INTEGER NOT NULL
);

-- Notifications Table
CREATE TABLE notifications (
    Notification_ID SERIAL PRIMARY KEY,
    User_ID INTEGER NOT NULL REFERENCES users(User_ID),
    Forum_ID INTEGER,
    Post_ID INTEGER,
    Content TEXT NOT NULL,
    Date TIMESTAMP WITHOUT TIME ZONE DEFAULT (CURRENT_TIMESTAMP)
);

--Indexes for faster queries.
CREATE INDEX idx_users_email ON users (Email);
CREATE INDEX idx_posts_user_id ON posts (User_ID);
CREATE INDEX idx_comments_post_id ON comments (Post_ID);
CREATE INDEX idx_messages_sender_id ON messages (Sender_ID);
CREATE INDEX idx_notifications_user_id ON notifications (User_ID);