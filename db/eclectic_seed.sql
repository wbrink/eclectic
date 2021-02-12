USE eclectic;

-- insert golfers
INSERT INTO golfers (first_name, last_name) 
VALUES
	('Happy', 'Gilmore'),
    ('Tiger', 'Woods'),
    ('Phil', 'Mickelson');

SELECT * FROM golfers;
    
    
INSERT INTO courses (course_name) VALUES ('Manteca Park Golf Course');
SELECT course_id INTO @course_id FROM courses WHERE course_name = "Manteca Park Golf Course"; -- get course_id into variable

DELETE FROM holes;
ALTER TABLE holes AUTO_INCREMENT = 1;
SELECT * FROM holes;


INSERT INTO holes (hole_number, par, handicap, course_id)
VALUES 
	(1, 5, 11, @course_id),
    (2, 4, 1, @course_id),
    (3, 4, 9, @course_id),
    (4, 5, 13, @course_id),
    (5, 3, 17, @course_id),
    (6, 4, 3, @course_id),
    (7, 4, 7, @course_id),
    (8, 3, 15, @course_id),
    (9, 4, 5, @course_id),
    (10, 4, 4, @course_id),
    (11, 4, 18, @course_id),
    (12, 4, 2, @course_id),
    (13, 5, 14, @course_id),
    (14, 3, 16, @course_id),
    (15, 4, 8, @course_id),
    (16, 4, 10, @course_id),
    (17, 3, 12, @course_id),
    (18, 5, 6, @course_id);


INSERT INTO eclectic_comp (eclectic_start) VALUES (cast('2021-02-09' AS DATE));
SELECT * FROM eclectic_comp;
