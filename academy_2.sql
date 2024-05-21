-- TABLES


-- CREATE TABLE CURATORS(
-- 	ID INT PRIMARY KEY NOT NULL,
-- 	CURATOR_NAME VARCHAR(255) NOT NULL,
-- 	CURATOR_SURNAME VARCHAR(255) NOT NULL

-- );


-- INSERT INTO CURATORS (ID, CURATOR_NAME, CURATOR_SURNAME) 
-- VALUES 
-- (1, 'ALEXANDER', 'SMITH'),
-- (2, 'EMMA', 'WILLIAMS'),
-- (3, 'LUCAS', 'MILLER'),
-- (4, 'OLIVIA', 'BROWN'),
-- (5, 'MASON', 'TAYLOR'),
-- (6, 'AVA', 'MARTINEZ'),
-- (7, 'ETHAN', 'THOMAS'),
-- (8, 'CHLOE', 'GARCIA'),
-- (9, 'WILLIAM', 'JONES'),
-- (10, 'SOPHIA', 'ANDERSON');


----------------------------------------------------------------------------

-- ALTER TABLE DEPARTMENTS
-- ADD COLUMN FACULTIES_ID INT REFERENCES FACULTIES(ID);

-- UPDATE DEPARTMENTS
-- SET FACULTIES_ID = (ID + 1) / 2;

----------------------------------------------------------------------------

-- CREATE TABLE FACULTIES (
--     ID SERIAL PRIMARY KEY,
--     FACULT_FINANCING DECIMAL(10, 2) NOT NULL CHECK (FACULT_FINANCING >= 0) DEFAULT 0,
--     FACULT_NAME VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO FACULTIES (FACULT_FINANCING, FACULT_NAME) VALUES
-- (100000.00, 'FACULTY OF INFORMATION TECHNOLOGY'),
-- (200000.00, 'FACULTY OF NATURAL SCIENCES'),
-- (300000.00, 'FACULTY OF HUMANITIES'),
-- (400000.00, 'FACULTY OF MEDICINE'),
-- (500000.00, 'FACULTY OF ECONOMICS'),
-- (600000.00, 'FACULTY OF LAW'),
-- (700000.00, 'FACULTY OF ARTS'),
-- (800000.00, 'FACULTY OF SOCIAL SCIENCES'),
-- (900000.00, 'FACULTY OF MANAGEMENT'),
-- (1000000.00, 'FACULTY OF ENGINEERING');


----------------------------------------------------------------------------

-- CREATE TABLE GROUPS (
--     ID SERIAL PRIMARY KEY,
--     NAME_GROUP VARCHAR(10) NOT NULL UNIQUE,
--     YEAR INT NOT NULL CHECK (YEAR >= 1 AND YEAR <= 5),
--     DEPARTMENT_ID INT NOT NULL REFERENCES DEPARTMENTS(ID)
-- );


-- INSERT INTO GROUPS (NAME_GROUP, YEAR, DEPARTMENT_ID) VALUES
-- ('GROUP 1A', 1, 1),
-- ('GROUP 1B', 1, 2),
-- ('GROUP 2A', 2, 3),
-- ('GROUP 2B', 2, 4),
-- ('GROUP 3A', 3, 5),
-- ('GROUP 3B', 3, 6),
-- ('GROUP 4A', 4, 7),
-- ('GROUP 4B', 4, 8),
-- ('GROUP 5A', 5, 9),
-- ('GROUP 5B', 5, 10);


----------------------------------------------------------------------------

-- CREATE TABLE GROUP_CURATORS(
-- 	ID SERIAL PRIMARY KEY NOT NULL,
-- 	CURATOR_ID INT NOT NULL REFERENCES CURATORS(ID),
-- 	GROUP_ID INT NOT NULL REFERENCES GROUPS(ID)
	
-- );

-- INSERT INTO GROUP_CURATORS (CURATOR_ID, GROUP_ID) VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3),
-- (4, 4),
-- (5, 5),
-- (6, 6),
-- (7, 7),
-- (8, 8),
-- (9, 9),
-- (10, 10);

------------------------------------------------------------------------------
-- CREATE TABLE GROUPS_LECTURES(
-- 	ID SERIAL PRIMARY KEY NOT NULL, 
-- 	ID_GROUP INT NOT NULL REFERENCES GROUPS(ID),
-- 	ID_LECTURE INT NOT NULL REFERENCES LECTURES(ID)

-- );

-- INSERT INTO GROUPS_LECTURES (ID_GROUP, ID_LECTURE) VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3),
-- (4, 4),
-- (5, 5),
-- (6, 6),
-- (7, 7),
-- (8, 8),
-- (9, 9),
-- (10, 10);


----------------------------------------------------------------------------

-- CREATE TABLE LECTURES(
-- 	ID INT PRIMARY KEY NOT NULL, 
-- 	LECTURE_ROOM VARCHAR(255) NOT NULL,
-- 	SUBJECT_ID INT NOT NULL REFERENCES SUBJECTS(ID),
-- 	TEACHER_ID INT NOT NULL REFERENCES TEACHERS(ID)
-- );

-- INSERT INTO LECTURES (ID, LECTURE_ROOM, SUBJECT_ID, TEACHER_ID) VALUES
-- (1, 'ROOM 101', 1, 1),
-- (2, 'ROOM 102', 2, 2),
-- (3, 'ROOM 103', 3, 3),
-- (4, 'ROOM 104', 4, 4),
-- (5, 'ROOM 105', 5, 5),
-- (6, 'ROOM 106', 6, 6),
-- (7, 'ROOM 107', 7, 7),
-- (8, 'ROOM 108', 8, 8),
-- (9, 'ROOM 109', 9, 9),
-- (10, 'ROOM 110', 10, 10);

----------------------------------------------------------------------------

-- CREATE TABLE SUBJECTS(
-- 	ID SERIAL PRIMARY KEY NOT NULL,
-- 	SUBJECT_NAME VARCHAR(255) NOT NULL UNIQUE
-- );

-- INSERT INTO SUBJECTS (SUBJECT_NAME) VALUES
-- ('MATHEMATICS'),
-- ('PHYSICS'),
-- ('CHEMISTRY'),
-- ('BIOLOGY'),
-- ('HISTORY'),
-- ('GEOGRAPHY'),
-- ('LITERATURE'),
-- ('COMPUTER SCIENCE'),
-- ('PHILOSOPHY'),
-- ('ECONOMICS');

----------------------------------------------------------------------------

-- QUERIES

-- 1


-- -- 2
-- SELECT NAME 
-- FROM FACULTIES 
-- JOIN DEPARTMENTS ON FACULTIES.ID = DEPARTMENTS.FACULTIES_ID
-- WHERE FINANCING < 500000::MONEY


-- -- 3
-- SELECT CURATOR_NAME, CURATOR_SURNAME, NAME_GROUP FROM CURATORS
-- JOIN GROUP_CURATORS ON CURATORS.ID = GROUP_CURATORS.CURATOR_ID
-- JOIN GROUPS ON GROUP_CURATORS.GROUP_ID = GROUPS.ID


-- -- 4
-- SELECT NAME, SURNAME FROM TEACHERS
-- JOIN LECTURES ON TEACHERS.ID = LECTURES.TEACHER_ID
-- WHERE LECTURE_ROOM = 'ROOM 101'


-- -- 5
-- SELECT SURNAME, FACULT_NAME
-- FROM TEACHERS
-- JOIN LECTURES ON TEACHERS.ID = LECTURES.TEACHER_ID
-- JOIN SUBJECTS ON LECTURES.SUBJECT_ID = SUBJECTS.ID
-- JOIN FACULTIES ON SUBJECTS.ID = FACULTIES.ID;

-- -- 6
--  SELECT NAME, NAME_GROUP 
--  FROM DEPARTMENTS 
--  JOIN GROUPS ON DEPARTMENTS.ID = GROUPS.DEPARTMENT_ID


-- -- 7
-- SELECT SUBJECT_NAME FROM SUBJECTS
-- JOIN LECTURES ON SUBJECTS.ID = LECTURES.SUBJECT_ID
-- JOIN TEACHERS ON LECTURES.TEACHER_ID = TEACHERS.ID
-- WHERE NAME = 'JOHN' AND SURNAME = 'DOE'


-- -- 8
-- SELECT NAME FROM DEPARTMENTS
-- JOIN GROUPS ON DEPARTMENTS.ID = GROUPS.DEPARTMENT_ID
-- JOIN GROUPS_LECTURES ON GROUPS.ID = GROUPS_LECTURES.ID_GROUP
-- JOIN LECTURES ON GROUPS_LECTURES.ID_LECTURE = LECTURES.ID
-- JOIN SUBJECTS ON LECTURES.SUBJECT_ID = SUBJECTS.ID
-- WHERE SUBJECTS.SUBJECT_NAME = 'HISTORY';


-- -- 9
-- SELECT NAME_GROUP FROM GROUPS
-- JOIN DEPARTMENTS ON GROUPS.DEPARTMENT_ID = DEPARTMENTS.ID
-- JOIN FACULTIES ON DEPARTMENTS.FACULTIES_ID = FACULTIES.ID
-- WHERE FACULT_NAME = 'FACULTY OF INFORMATION TECHNOLOGY'


-- -- 10
-- SELECT NAME_GROUP, FACULT_NAME FROM GROUPS
-- JOIN DEPARTMENTS ON GROUPS.DEPARTMENT_ID = DEPARTMENTS.ID
-- JOIN FACULTIES ON DEPARTMENTS.FACULTIES_ID = FACULTIES.ID
-- WHERE YEAR = 5


-- -- 11
-- SELECT NAME, SURNAME, SUBJECT_NAME 
-- FROM TEACHERS
-- JOIN LECTURES ON TEACHERS.ID = LECTURES.TEACHER_ID
-- JOIN SUBJECTS ON LECTURES.SUBJECT_ID = SUBJECTS.ID
-- WHERE LECTURE_ROOM = 'ROOM 103'







