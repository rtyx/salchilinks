
-- DROP TABLE IF EXISTS comments;
-- DROP TABLE IF EXISTS links;
-- DROP TABLE IF EXISTS users;

-- CREATE TABLE users (
--     id SERIAL primary key,
--     user_name VARCHAR(255) not null,
--     email VARCHAR(255) not null unique,
--     password VARCHAR(255) not null
-- );


-- CREATE TABLE links (
--     id SERIAL primary key,
--     user_id INT references users(id),
--     url TEXT not null,
--     title VARCHAR(255) not null,
--     comments INT,
--     creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE links (
--     id SERIAL primary key,
--     user_id INT references users(id),
--     url TEXT not null,
--     title VARCHAR(255) not null,
--     comments INT,
--     creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     ogtitle VARCHAR(255),
--     ogdescription TEXT,
--     ogimage TEXT DEFAULT "http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg"
-- );
--
-- CREATE TABLE users (
--     id SERIAL primary key,
--     user_name VARCHAR(255) not null,
--     email VARCHAR(255) not null unique,
--     password VARCHAR(255) not null
-- );

-- CREATE TABLE comments (
--     id SERIAL primary key,
--     user_id INT references users(id),
--     link_id INT references links(id),
--     comment VARCHAR(255),
--     creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );
