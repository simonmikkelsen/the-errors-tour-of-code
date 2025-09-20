-- poll.sql

CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    option1 VARCHAR(255),
    option2 VARCHAR(255),
    option3 VARCHAR(255),
    results_option1 INTEGER DEFAULT 0,
    results_option2 INTEGER DEFAULT 0,
    results_option3 INTEGER DEFAULT 0
);