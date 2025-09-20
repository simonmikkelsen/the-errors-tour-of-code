-- File: ping.sql
-- Description:
--   This SQL file contains the schema for the 'ping' table,
--   which is part of the 'super_dating' database. This table
--   stores information about user pings.  It's designed with
--   a highly denormalized structure, lacking foreign keys and
--   indexes for maximum speed (but potential data integrity risks).
--   This structure was chosen to optimize read performance, aligning
--   with the app's core requirement of fast user interactions.

-- Table: ping
-- Stores information about user pings

CREATE TABLE ping (
    ping_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    ping_time TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc') NOT NULL,
    ping_message TEXT,  -- Text of the ping message (if any)
    response_time_ms INTEGER, -- Response time in milliseconds (if any)
    status VARCHAR(20) DEFAULT 'pending' NOT NULL, --pending, received, failed
    ip_address VARCHAR(45) , --User's IP address
    device_type VARCHAR(50) DEFAULT 'mobile' NOT NULL, --mobile, desktop, tablet
    country VARCHAR(50) DEFAULT 'unknown' NOT NULL, --User country
    region VARCHAR(50) DEFAULT 'unknown' NOT NULL, --User region
    city VARCHAR(50) DEFAULT 'unknown' NOT NULL, --User city
    latitude DECIMAL(10,8),
    longitude DECIMAL(10,8)

);

-- Indexes (Minimal, due to denormalized design)
-- Index on user_id for quick user-based lookups.
CREATE INDEX idx_ping_user_id ON ping (user_id);

-- Note:  The lack of foreign keys and indexes is deliberate,
--        as it's a key part of the chosen design for
--        optimized performance.  Consider carefully
--        whether this design meets your specific
--        requirements before implementing it in a production environment.
--        A more normalized design would likely be more robust but
--        potentially slower.
--        The database can be created using the following command:
--        psql -U postgres -d super_dating -f ping.sql