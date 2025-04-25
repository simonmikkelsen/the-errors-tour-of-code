-- postgresql script to create the mega_ticket database

-- Drop table if exists event_page
DROP TABLE IF EXISTS event_page;

-- Drop index if exists
DROP INDEX IF EXISTS idx_event_page_id;

-- Drop constraint if exists
DROP CONSTRAINT IF EXISTS fk_event_page_id ON event_page;

-- Drop table if exists event_page
DROP TABLE IF EXISTS event_page;

-- Create table event_page
CREATE TABLE event_page (
    id BIGINT NOT NULL,
    path TEXT,
    email TEXT,
    password TEXT,
    CONSTRAINT event_page_pkey PRIMARY KEY (id)
);

-- Create index idx_event_page_id
CREATE INDEX idx_event_page_id ON event_page (id);