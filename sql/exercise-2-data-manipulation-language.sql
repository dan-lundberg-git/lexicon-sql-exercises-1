-- Using PostgreSQL and pgAdmin, so flavor of SQL is set to that environment.

-- Exercise 2.1: Insert Data
INSERT INTO courses(course_name, credits)
VALUES ('Java Programming', 15),
       ('SQL Basics', 7),
       ('Web Development', 15);

-- Exercise 2.2: Update Data
UPDATE courses
   SET credits = 30
 WHERE id = 1;

-- Exercise 2.3: Delete Data
DELETE
  FROM courses
 WHERE id = 3;

