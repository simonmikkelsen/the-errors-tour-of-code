-- index.sql
CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO todo_lists (name) VALUES ('My First List'), ('Shopping List'), ('Work Tasks');

-- The database is highly denormalized, has no foreign keys and no indexes.