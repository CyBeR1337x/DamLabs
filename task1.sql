CREATE DATABASE DAMDB

USE DAMDB

CREATE TABLE Employee (
	Eid int PRIMARY KEY,
	EName varchar(60),
	ECity varchar(50),
	E_BasicSalary INT,
	E_City VARCHAR(50),
	E_Street VARCHAR(50),
	E_House# VARCHAR(50),
	E_Bonus INT,
	E_Rank varchar(50) CHECK(E_RANK IN('Manager', 'Developer', 'Admin')),
	E_Department varchar(50) CHECK(E_Department IN('HR', 'IT', 'CS', 'Labour')) DEFAULT 'CS',
	EAge int CHECK(EAge BETWEEN 18 AND 60)
);

CREATE TABLE Project(
	p_id INT,
	p_name VARCHAR(60),
	p_bonus int,
	duration_in_months int,
	e_id INT FOREIGN KEY REFERENCES Employee(Eid),
	PRIMARY KEY(p_id, e_id)
)

INSERT INTO Employee VALUES(
--1
SELECT Ename AS [Emp Name], E_City + ' ' + E_Street + ' ' + E_House# AS [Full Address] From Employee 

--2
SELECT TOP 30 PERCENT * FROM Employee

--3
SELECT EName FROM Employee WHERE E_City = 'RWP' AND E_Street = '25' AND E_House# = '44'

--4
SELECT * FROM Employee WHERE E_City IN('RWP', 'ISB', 'LHR', 'KHI')

--5
SELECT * FROM Employee WHERE EAge BETWEEN 19 AND 32

--6
SELECT * FROM EMployee WHERE EName LIKE 'S%' AND EName NOT LIKE '%I%'

--7
SELECT DISTINCT E_City FROM Employee

--8
SELECT * FROM Employee WHERE E_City = 'ISB' ORDER BY EAge

--9
SELECT EName, E_BasicSalary + E_Bonus AS [Total Salary] FROM Employee

--10
SELECT COUNT(*) FROM Employee

--11
SELECT E_Department, COUNT(*) FROM Employee GROUP BY E_Department


--12
SELECT e.E_BasicSalary + e.E_Bonus + p.p_bonus FROM Employee e INNER JOIN Project p ON e.Eid = p.e_id

--13
SELECT p_name FROM Project WHERE e_id IN (SELECT Eid FROM Employee WHERE EName = 'Ahmar')

--14
SELECT SUM(p_bonus) FROM Project WHERE e_id IN(SELECT Eid FROM Employee WHERE EName = 'Danish')

--15
SELECT SUM(E_BasicSalary) AS [Total Expenditure] FROM Employee GROUP BY E_Department HAVING SUM(E_BasicSalary) > 100000


