DROP DATABASE IF EXISTS eclectic;
CREATE DATABASE eclectic;

USE eclectic;

CREATE TABLE golfers 
(
	golfer_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NUll,
    last_name VARCHAR(255) NOT NULL
);


-- this table stores the competition that is underway
CREATE TABLE eclectic_comp
(
	eclectic_comp_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    eclectic_Start DATE NOT NULL
);

CREATE TABLE eclectic_rounds 
(
	eclectic_round_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    finished BOOL DEFAULT FALSE,
    golfer_id INT,
    score INT DEFAULT 0,
    eclectic_comp_id INT
);

CREATE TABLE rounds 
(
	round_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    golfer_id INT NOT NULL,
    round_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    eclectic_round_id INT NOT NULL
);

CREATE TABLE scores 
(
	score_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    score INT NOT NULL,
    adj_score INT NOT NULL,
    handicap INT NOT NULL,
    hole INT NOT NULL,
    round_id INT NOT NULL
);


CREATE TABLE courses 
(
	course_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(255)
);

CREATE TABLE holes 
(
	hole_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hole_number INT NOT NULL,
    par INT NOT NULL,
    handicap INT NOT NULL,
    course_id INT NOT NULL
);


-- add foreign keys

ALTER TABLE holes
ADD FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE;

ALTER TABLE scores
ADD FOREIGN KEY (round_id) REFERENCES rounds(round_id) ON DELETE CASCADE;

ALTER TABLE rounds
ADD FOREIGN KEY (golfer_id) REFERENCES golfers(golfer_id) ON DELETE CASCADE;

ALTER TABLE rounds
ADD FOREIGN KEY (eclectic_round_id) REFERENCES eclectic_rounds(eclectic_round_id) ON DELETE CASCADE;

ALTER TABLE eclectic_rounds
ADD FOREIGN KEY (golfer_id) REFERENCES golfers(golfer_id) ON DELETE CASCADE;

ALTER TABLE eclectic_rounds
ADD FOREIGN KEY (eclectic_comp_id) REFERENCES eclectic_comp(eclectic_comp_id) ON DELETE CASCADE;

