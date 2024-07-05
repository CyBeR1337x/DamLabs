CREATE TRIGGER ACCOUNTS_INSERTION ON Accounts INSTEAD OF INSERT
AS
BEGIN
	WITH BONUS_CAL AS (
		SELECT I.eid, I.Year, I.Month, I.Basic_Salary, SUM(p.pBonusAmount) AS Project_Bonus
		FROM inserted I 
		INNER JOIN Project_Allocation pa 
		ON pa.eid = I.eid  
		INNER JOIN Project p ON pa.pid = p.pid WHERE pa.eid = I.eid
		GROUP BY I.eid, I.Year, I.Month, I.Basic_Salary
	)

	SELECT * INTO #temp FROM BONUS_CAL 
	INSERT INTO ACCOUNTS SELECT * FROM #temp
	INSERT INTO ACCOUNTS_BACKUP SELECT * FROM #temp
END
