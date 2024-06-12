--1
DECLARE @regno VARCHAR(50), @sName VARCHAR(50), @sCity VARCHAR(50), @sCGPA float, @sAge int 
DECLARE second_student CURSOR
STATIC FOR
SELECT regno, sName, sCity, sCGPA, sAge from Student
OPEN second_student
IF @@CURSOR_ROWS > 0
BEGIN
	DECLARE @ROWNUM INT = 1;
	FETCH NEXT FROM second_student INTO @regno, @sName, @sCity, @sCGPA, @sAge
	WHILE @@Fetch_status = 0
	BEGIN
		IF @ROWNUM = 2
			BEGIN
				SELECT * FROM Student WHERE regno = @regno
				BREAK
			END
		FETCH NEXT FROM second_student INTO @regno, @sName, @sCity, @sCGPA, @sAge
		SET @ROWNUM = @ROWNUM + 1
	END
END
CLOSE second_student
DEALLOCATE second_student

--2 EVEN ROWS
DECLARE @regno VARCHAR(50)
DECLARE second_student CURSOR
STATIC FOR
SELECT regno from Student
OPEN second_student
IF @@CURSOR_ROWS > 0
BEGIN
	DECLARE @ROWNUM INT = 1;
	FETCH NEXT FROM second_student INTO @regno
	WHILE @@Fetch_status = 0
	BEGIN
		IF @ROWNUM % 2 = 0
		BEGIN
			DECLARE @xmltmp XML = (SELECT * FROM Student WHERE regno = @regno FOR XML AUTO)
			PRINT CONVERT(NVARCHAR(MAX), @xmltmp)
		END
		FETCH NEXT FROM second_student INTO @regno
		SET @ROWNUM = @ROWNUM + 1
	END
END
CLOSE second_student
DEALLOCATE second_student


--3
declare @regno2 int,@rowcount int
set @rowcount = 0
DECLARE cur_stuu CURSOR
STATIC FOR
select @regno2 from Student where regNo > 101

OPEN cur_stuu
FETCH NEXT FROM cur_stuu INTO @regno2;
WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Student SET sCity = 'ISB' Where regNo = @regno2;
    SET @rowCount = @rowCount + 1;
    FETCH NEXT FROM cur_stuu INTO @regno2;
END

print 'Total rows: '+convert (varchar(20),@rowCount);
CLOSE cur_stuu
DEALLOCATE cur_stuu



--4
BEGIN TRAN; 

DECLARE @ID INT; 
DECLARE @RowCount INT; 

SET @RowCount = 0; 

DECLARE cur_delete CURSOR FOR
SELECT @ID
FROM Student
WHERE sCity='rwp' 

OPEN cur_delete;

FETCH NEXT FROM cur_delete INTO @ID;

WHILE @@FETCH_STATUS = 0 
BEGIN
    SET @RowCount = @RowCount + 1; 

    IF @RowCount > 1
    BEGIN
        ROLLBACK TRANSACTION;
        CLOSE cur_delete;
        DEALLOCATE cur_delete;
        PRINT 'Not allowed';
        RETURN; 
    END

    DELETE FROM Student WHERE regNo = @ID;

    FETCH NEXT FROM cur_delete INTO @ID;
END;

CLOSE cur_delete; 
DEALLOCATE cur_delete;

IF @RowCount = 1
BEGIN
    COMMIT TRANSACTION;
    PRINT 'One record deleted successfully.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'No records were deleted.';
END


