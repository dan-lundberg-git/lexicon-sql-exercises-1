-- Using PostgreSQL and pgAdmin, so flavor of SQL is set to that environment.

-- Exercise 3.1: Basic Select
SELECT *
  FROM courses;

-- Result:
-- 1    "Java Programming"	30
-- 2    "SQL Basics"	        7
-- 3    "Web Development"	15
-- 4    "React Development"	7
-- 5    "Vue.js Development"    7
-- 6    "PostgreSQL"	        15

-- Exercise 3.2: Filtering
SELECT *
  FROM courses
 WHERE credits = 15;

-- Result:
-- 3    "Web Development"	15
-- 6    "PostgreSQL"	        15

-- Exercise 3.3: Pattern Matching
SELECT *
  FROM courses
 WHERE course_name LIKE '%Development%';

-- Result:
-- 3    "Web Development"	15
-- 4    "React Development"	7
-- 5    "Vue.js Development"	7

