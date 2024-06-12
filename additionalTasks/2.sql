CREATE PROC INSERT_IN_STUDENT2 (
	@id INT,
    @name VARCHAR(50),
    @fathername VARCHAR(50),
    @contact VARCHAR(20),
	@age INT
) AS
BEGIN	
	IF (SELECT 1 FROM Student2 WHERE name = @name AND fathername = @fathername) = 1
		PRINT 'Name & Father Name Must Not Repeat'
	ELSE IF (LEN(@contact) != 12)
		PRINT 'Length Of contact must be 12'
	ELSE 
		INSERT INTO Student2 VALUES(@id, @name, @fathername, @contact, @age)
END
EXEC INSERT_IN_STUDENT2 4, 'Abdullah', 'Azam', '123456789101', 12


--2:
CREATE PROC InsertAge (@d DATE, @id INT) AS
BEGIN 
	DECLARE @age INT = YEAR(GETDATE()) - YEAR(@d)
	UPDATE Student2 SET age = @age WHERE id = @id
END

EXEC InsertAge '12-13-2002', 3

SELECT * FROM Student2


		