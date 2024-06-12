--1
CREATE TRIGGER DISP_STU ON student 
AFTER INSERT
AS
BEGIN 
	SELECT * FROM Student
END

--2
CREATE TRIGGER DEL_CRS ON COURSE 
AFTER INSERT
AS
BEGIN 
	IF (SELECT COUNT(*) FROM Course) > 10
		DELETE FROM Course
END

--3
CREATE TRIGGER SHOW_ENROLLMENT ON COURSE 
AFTER DELETE
AS
BEGIN 
	SELECT * FROM Enrollment
END


--4
CREATE TRIGGER DISP_10TH ON STUDENT 
AFTER INSERT
AS
BEGIN 
	IF (SELECT COUNT(*) FROM Student) % 10 = 0
		SELECT * FROM Student
END


--5
CREATE TRIGGER DEL_25_LESS ON STUDENT 
AFTER INSERT
AS
BEGIN 
	DELETE FROM Student WHERE AGE > 25
END