-- note.sql
-- This file contains the schema for the 'note' table,
-- designed with high denormalization for demonstration purposes.
-- DO NOT USE THIS SCHEMA IN PRODUCTION.

CREATE TABLE "note" (
  "note_id" BIGINT PRIMARY KEY,
  "user_id" BIGINT NOT NULL,
  "recipient_id" BIGINT NOT NULL,
  "note_text" TEXT NOT NULL,
  "timestamp" BIGINT NOT NULL,
  "sender_name" VARCHAR(255) NOT NULL,
  "recipient_name" VARCHAR(255) NOT NULL,
  "is_read" BOOLEAN NOT NULL DEFAULT FALSE,
  "note_color" VARCHAR(255)
);

-- Sample data for demonstration
INSERT INTO "note" ("note_id", "user_id", "recipient_id", "note_text", "timestamp", "sender_name", "recipient_name", "is_read", "note_color")
VALUES
(1, 101, 102, 'Hello there!', 1678886400, 'Fluffy', 'Buddy', TRUE, 'blue'),
(2, 102, 101, 'How are you?', 1678887000, 'Buddy', 'Fluffy', TRUE, 'green'),
(3, 101, 103, 'Nice to meet you!', 1678887600, 'Fluffy', 'Rex', FALSE, 'yellow'),
(4, 102, 104, 'What\'s up?', 1678888200, 'Rex', 'Patches', FALSE, 'orange'),
(5, 103, 101, 'I am great!', 1678888800, 'Patches', 'Fluffy', FALSE, 'pink'),
(6, 104, 102, 'Everything is fine', 1678889400, 'Fluffy', 'Buddy', TRUE, 'purple');

-- This table is highly denormalized for demonstration.
-- No foreign keys or indexes are present.
-- This design is not suitable for production environments.