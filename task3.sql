--1
SELECT s.sName
FROM Student s
CROSS JOIN Enrollment e
WHERE e.Grade = 'A';


--2
SELECT s.sName, e.cCode
FROM Student s
CROSS JOIN Enrollment e
WHERE e.Grade = 'F' AND e.semester = 5;

--3:
SELECT s.*
FROM Student s
CROSS JOIN (
 SELECT regNo
 FROM Enrollment
 GROUP BY regNo
 HAVING COUNT(*) >= 10
) AS enrolled_students;


--4:
SELECT e.Grade
FROM Student s
CROSS JOIN Enrollment e
WHERE s.sName = 'Ali' AND e.cCode = 'CS101';


--5:
SELECT e.Grade
FROM Student s
CROSS JOIN Enrollment e
WHERE s.sName = 'Irshad' AND e.semester = 7;

--6:
SELECT c.cName, e.Grade
FROM Student s
CROSS JOIN Enrollment e
CROSS JOIN Course c
WHERE s.sName = 'Amir' AND e.regNo = s.regNo AND e.cCode = c.cCode;

--7:
SELECT DISTINCT c.cName
FROM Course c
CROSS JOIN Enrollment e
WHERE e.semester = 7;
--8

SELECT s.sName, c.cName
FROM Student s
CROSS JOIN Enrollment e
CROSS JOIN Course c
WHERE e.regNo = s.regNo AND e.cCode = c.cCode;


--9
SELECT COUNT(*) AS total_F_grades
FROM Student s
CROSS JOIN Enrollment e
WHERE s.sName = 'Amir' AND e.Grade = 'F';


--10
SELECT DISTINCT(s.sName) FROM Student s, Course c
WHERE 1 NOT IN(SELECT 1 FROM Enrollment e
WHERE e.regno = s.regno)
