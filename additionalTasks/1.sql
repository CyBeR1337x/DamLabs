--1
-- Write a stored procedure that get a parameter regno/name and displays
-- You are not promoted (if cgpa <= 2 AND AGE > 21)
-- You are promoted (if cgpa is greater 2.5)
-- ELse Show All Data IF cgpa is between 2 and 2.5

CREATE PROC PROMOTION_DEMOTION_1 (@REGNO VARCHAR(20)) AS
BEGIN 
	DECLARE @CGPA FLOAT = (SELECT scgpa FROM Student WHERE regno = @REGNO)
	DECLARE @AGE INT = (SELECT	sAge  FROM Student WHERE regno = @REGNO)
	IF @CGPA <= 2 AND @AGE > 21
		PRINT 'YOU ARE NOT PROMOTED!'
	ELSE IF @CGPA > 2.5
		PRINT 'YOU ARE PROMOTED'
	ELSE IF @CGPA < 2 AND @CGPA > 2.5
		SELECT * FROM Student WHERE regno = @REGNO
END

EXEC PROMOTION_DEMOTION_1 '21-ARID-4591'
--2
-- Write a stored procedure that get a parameter regno/name and displays:
-- You are not promoted (if cgpa <= 2 AND AGE > 21)
-- You are promoted (if cgpa is greater 2.5)
-- Show All Data (IF cgpa is between 2 and 2.5)
-- ADD AN Output parameter of cgpa which returns the cgpa of student
CREATE PROC PROMOTION_DEMOTION (@REGNO VARCHAR(20), @CG FLOAT OUTPUT) AS
BEGIN 
	DECLARE @CGPA FLOAT = (SELECT scgpa FROM Student WHERE regno = @REGNO)
	DECLARE @AGE INT = (SELECT	sAge  FROM Student WHERE regno = @REGNO)
	SET @CG = @CGPA
	IF @CGPA <= 2 AND @AGE > 21
		PRINT 'YOU ARE NOT PROMOTED!'
	ELSE IF @CGPA > 2.5
		PRINT 'YOU ARE PROMOTED'
	ELSE IF @CGPA < 2 AND @CGPA > 2.5
		SELECT * FROM Student WHERE regno = @REGNO
END

DROP PROC PROMOTION_DEMOTION

DECLARE @CGP FLOAT 
EXEC PROMOTION_DEMOTION '21-ARID-4591', @CGP OUTPUT

PRINT @CGP

--3: 
--CREATE A STORED PROCEDURE THAT:
--TAKES REGNO AS A PARAMETER 
--IF THE Student has F grade display his name & cgpa and 'You are not promoted'
--ELSE show his name and cgpa with Message 'You are promoted'

CREATE PROC STUDENT_STATUS (@REGNO VARCHAR(20) AS