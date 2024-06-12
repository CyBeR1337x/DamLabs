--1:
SELECT s.* FROM Student s INNER JOIN Enrollment e ON s.regno = e.regno WHERE e.grade = 'A'

--2:
SELECT s.regno, e.cCode FROM Student s INNER JOIN Enrollment e ON s.regno = e.regno WHERE e.semester = 5 AND e.grade = 'F'

--3:
SELECT s.regno FROM Student s INNER JOIN Enrollment e ON e.regno = s.regno GROUP BY s.regno HAVING COUNT(e.cCode) > 10
--4:
SELECT e.grade FROM Enrollment e INNER JOIN Student s ON e.regno = s.regno WHERE e.cCode = 'CSC-101' AND s.sName = 'ALI'

--5:
SELECT * FROM Course c LEFT JOIN Enrollment e ON c.cCode = e.cCode LEFT JOIN Student s 
ON s.regno = e.regno WHERE (s.regno = '21-ARID-4421' OR s.sName IS NULL)

--6:
SELECT c.cName, COUNT(e.regno) FROM Course c LEFT JOIN Enrollment e ON e.cCode = c.cCode
GROUP BY c.cName 

--7:
SELECT DISTINCT(c.cName) FROM Course c INNER JOIN Enrollment e ON c.cCode = e.cCode WHERE e.semester = 6

--8:
SELECT s.sName, c.cName FROM Student s INNER JOIN Enrollment e ON e.regno = s.regno 
INNER JOIN Course c ON e.cCode = c.cCode

--9
SELECT s.sName, c.cName FROM Student s 
LEFT JOIN Enrollment e ON e.regno = s.regno 
LEFT JOIN Course c ON e.cCode = c.cCode

--10:
SELECT s.* FROM Student s LEFT JOIN Enrollment e ON s.regno = e.regno WHERE e.regno IS NULL