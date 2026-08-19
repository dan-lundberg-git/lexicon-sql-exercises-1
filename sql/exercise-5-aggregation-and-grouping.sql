-- Using PostgreSQL and pgAdmin, so flavor of SQL is set to that environment.

-- Creating the student and attendance tables from the lecture material, but for
-- PostgreSQL instead of MySQL.
-- https://github.com/SimonElbrink/G62-SQL/blob/main/Lecture_Scripts.sql

-- Exercise 5.1: Count
SELECT COUNT(*) AS "Number of Students"
  FROM school.student

-- Result:
-- 15

-- Exercise 5.2: Group By
SELECT status, COUNT(*)
  FROM school.attendance
 GROUP BY status

-- Result:
-- "Absent"     29
-- "Present"    65

-- Exercise 5.3: Group By with Join
SELECT student.name, COUNT(*) AS "Present Count"
  FROM school.student
           LEFT JOIN school.attendance
           ON school.student.id = school.attendance.student_id
 WHERE attendance.status = 'Present'
 GROUP BY student.name
 ORDER BY student.name

-- Result:
-- "Anders Svensson"	4
-- "Anna Johansson"	4
-- "Astrid Jonsson"	4
-- "Erik Andersson"	5
-- "Gustav Eriksson"	4
-- "Ingrid Larsson"	4
-- "Johan Lindberg"	4
-- "Karin Persson"	4
-- "Lars Karlsson"	5
-- "Linnea Bengtsson"	4
-- "Maja Gustafsson"	4
-- "Maria Nilsson"	5
-- "Nils Pettersson"	4
-- "Olof Olsson"	5
-- "Per Hansson"	5