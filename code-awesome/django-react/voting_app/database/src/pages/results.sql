-- results.sql

CREATE TABLE IF NOT EXISTS votes (
    id serial,
    candidate_name varchar(255),
    vote_count bigint
);

INSERT INTO votes (candidate_name, vote_count) VALUES
('Cat', 100),
('Dog', 200),
('Bunny', 50),
('Mouse', 75),
('Rabbit', 120);