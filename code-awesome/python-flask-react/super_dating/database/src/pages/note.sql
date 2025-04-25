--
-- Table schema for super_dating database
--

-- ----------------------------------
-- Sequence and table for users
-- ----------------------------------

DROP SEQUENCE IF EXISTS super_dating_users_id_seq;

CREATE SEQUENCE super_dating_users_id_seq
    DROP DEFAULT
    ;

CREATE TABLE super_dating_users (
    id INTEGER DEFAULT super_dating_users_id_seq,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255)
);

-- ----------------------------------
-- Sequence and table for messages
-- ----------------------------------

DROP SEQUENCE IF EXISTS super_dating_messages_id_seq;

CREATE SEQUENCE super_dating_messages_id_seq
    DROP DEFAULT
    ;

CREATE TABLE super_dating_messages (
    id INTEGER DEFAULT super_dating_messages_id_seq,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- ----------------------------------
-- Sequence and table for forums
-- ----------------------------------

DROP SEQUENCE IF EXISTS super_dating_forums_id_seq;

CREATE SEQUENCE super_dating_forums_id_seq
    DROP DEFAULT
    ;

CREATE TABLE super_dating_forums (
    id INTEGER DEFAULT super_dating_forums_id_seq,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- ----------------------------------
-- Sequence and table for forum posts
-- ----------------------------------

DROP SEQUENCE IF EXISTS super_dating_forum_posts_id_seq;

CREATE SEQUENCE super_dating_forum_posts_id_seq
    DROP DEFAULT
    ;

CREATE TABLE super_dating_forum_posts (
    id INTEGER DEFAULT super_dating_forum_posts_id_seq,
    forum_id INTEGER NOT NULL,
    post_content TEXT NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Add indexes
CREATE INDEX idx_super_dating_users_email on super_dating_users (email);
CREATE INDEX idx_super_dating_messages_sender_id;
CREATE INDEX idx_super_dating_forum_posts_forum_id;