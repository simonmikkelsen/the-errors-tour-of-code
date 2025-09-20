-- create-poll.sql

CREATE TABLE animal_types (
    animal_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);

CREATE TABLE animals (
    animal_id SERIAL PRIMARY KEY,
    animal_type_id INT REFERENCES animal_types(animal_type_id),
    animal_name VARCHAR(255) NOT NULL
);

CREATE TABLE poll_questions (
    question_id SERIAL PRIMARY KEY,
    question_text VARCHAR(255) NOT NULL
);

CREATE TABLE poll_answers (
    answer_id SERIAL PRIMARY KEY,
    question_id INT REFERENCES poll_questions(question_id),
    answer_text VARCHAR(255) NOT NULL
);

CREATE TABLE polls (
    poll_id SERIAL PRIMARY KEY,
    question_id INT REFERENCES poll_questions(question_id),
    answer_id INT REFERENCES poll_answers(answer_id),
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_types (
    user_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_type_id INT REFERENCES user_types(user_type_id),
    username VARCHAR(255) NOT NULL
);