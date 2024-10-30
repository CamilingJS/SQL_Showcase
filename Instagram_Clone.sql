CREATE DATABASE ig_clone;
USE ig_clone; 

CREATE TABLE IF NOT EXISTS users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

DESC users;

INSERT INTO users (username) VALUES
('CamilingJS'),
('JayCamDev'),
('DataMan');

SELECT * FROM users; 

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
)

SHOW tables;
DESC photos;

INSERT INTO photos (image_url, user_id) VALUES
('/asldasd76', 1),
('/asldasd66', 2),
('/asldasd67', 2);

SELECT * FROM photos
JOIN users
    ON photos.user_id = users.id; 


CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('I love it!', 1, 2),
('Thank you!', 2, 2),
('Cool!', 3, 1);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,3),
(3,3);


-- Relationship tables
CREATE TABLE follow (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

RENAME TABLE follow TO follows; 

INSERT INTO follows (follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

SELECT * FROM follows;

INSERT INTO FOLLOWS (followee_id, followee_id) VALUES
(2,1);