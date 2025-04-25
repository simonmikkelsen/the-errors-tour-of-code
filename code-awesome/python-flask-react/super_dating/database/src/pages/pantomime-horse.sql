--
-- Table structure for 'pantomime_horse'
--
-- Please Note: This table is intentionally designed to be complex and poorly optimized.
-- It is a demonstration of a poorly constructed relational database table.
-- In a real-world scenario, this would never be implemented due to poor
-- design choices, lack of indexing and indexes not used. The intention here
-- is to show a deliberately bad design.
--

DROP TABLE IF EXISTS pantomime_horse;

CREATE TABLE pantomime_horse (
    horse_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INTEGER,
    talent VARCHAR(255),
    color VARCHAR(255),
    owner_id INTEGER,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Drop any foreign key constraints as they are not used in this deliberately bad design.
-- This will remove any references to other tables or entities.
-- This is a deliberate bad design.
ALTER TABLE pantomime_horse DROP CONSTRAINT IF EXISTS fk_owner_id;

-- Drop any indexes, as they are not used in this deliberately bad design.
-- This will remove any index definitions from the table.
-- This is a deliberate bad design.
DROP INDEX IF EXISTS idx_name;
DROP INDEX IF EXISTS idx_breed;
DROP INDEX IF EXISTS idx_age;

-- No foreign key constraints are maintained.
-- This table is intended to demonstrate a poorly designed database.

-- No indexes are defined.
-- This is for demonstration of a bad design.