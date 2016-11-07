DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS comments;

CREATE TABLE links (
    id SERIAL primary key,
    user_id INT references users(id),
    link VARCHAR(255) not null,
    title VARCHAR(255),
    CreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id SERIAL primary key,
    user_name VARCHAR(255) not null,
    email VARCHAR(255) not null unique,
    password VARCHAR(255) not null
);

CREATE TABLE comments (
    id SERIAL primary key,
    user_name VARCHAR(255) not null,
    comment VARCHAR(255),
    CreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
