--1
CREATE PROC EMP_DATA 
AS 
BEGIN 
	DECLARE @MAX_AGE INT = (SELECT MAX(EAge) FROM Employee);
	DECLARE @MAX_SAL INT = (SELECT E_BasicSalary + E_Bonus FROM Employee WHERE EAge = @MAX_AGE)
	SELECT * FROM Employee WHERE EAge = @MAX_AGE
END

EXEC EMP_DATA
SELECT COUNT(*) FROM Enrollment WHERE regno = '21-ARID-4453'
SELECT * FROM Student
--2:
DROP PROC STU_DATA
CREATE PROC STU_DATA AS
BEGIN
	SELECT s.regno, s.sCGPA FROM Student s 
	INNER JOIN Enrollment e ON e.regno = s.regno 
	GROUP BY s.regno, s.sCGPA HAVING COUNT(e.cCode) = 7 OR s.sCGPA > 3
END

EXEC STU_DATA