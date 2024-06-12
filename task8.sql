--1 
SELECT * FROM Enrollment
BEGIN TRAN
	INSERT INTO Student VALUES('21-ARID-4400', 'Test', 'ISB', '3.8', '32')

	IF (SELECT COUNT(*) FROM Student WHERE regno = '21-ARID-4400') > 1
		ROLLBACK
	ELSE 
		COMMIT
		

--2:
CREATE PROCEDURE InsertEnrollmentRecords
AS
BEGIN
        BEGIN TRANSACTION;
		DECLARE @E INT

        INSERT INTO Enrollment
        VALUES ('21-ARID-4591', 'CSC-314', '6', 'B'),
               ('21-ARID-4591', 'CSC-314', '6', 'B'),
               ('21-ARID-4591', 'CSC-314', '6', 'B'),
               ('21-ARID-4591', 'CSC-314', '6', 'B'),
               ('21-ARID-4591', 'CSC-314', '6', 'B'),
               ('21-ARID-4591', 'CSC-314', '6', 'B');

        SET @E = @@ERROR
		IF @E != 0
			ROLLBACK
		ELSE
			COMMIT
END;

