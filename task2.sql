CREATE TABLE BIIT_STudent (
	CNIC varchar(50),
	sName varchar(50),
	sAge int,
	sCity VARCHAR(50),
	Semester int
)

CREATE TABLE NUST_Student (
	CNIC varchar(50),
	sName varchar(50),
	sAge int,
	sCity VARCHAR(50),
	Semester int,
	phoneno VARCHAR(50)
)

CREATE TABLE UAAR_Student (
	CNIC varchar(50),
	sName varchar(50),
	sAge int,
	sCity VARCHAR(50),
	cgpa float,
	Semester int
)

--1:
SELECT CNIC FROM BIIT_STudent 
UNION
SELECT CNIC FROM NUST_Student

--2:
SELECT sName FROM BIIT_STudent
UNION
SELECT sName FROM NUST_Student
UNION
SELECT sName FROM UAAR_Student

--3:
SELECT sName, CNIC FROM BIIT_STudent
INTERSECT
SELECT sName, CNIC FROM UAAR_Student

--4:
SELECT sName FROM BIIT_STudent
EXCEPT 
SELECT sName FROM NUST_Student

--5:
SELECT sName, CNIC FROM BIIT_STudent
INTERSECT
SELECT sName, CNIC  FROM NUST_Student
INTERSECT
SELECT sName, CNIC  FROM UAAR_Student

--6:
SELECT sCity FROM BIIT_STudent
UNION
SELECT sCity FROM NUST_Student
UNION
SELECT sCity FROM UAAR_Student

--7
SELECT sCity FROM BIIT_STudent
INTERSECT
SELECT sCity FROM NUST_Student
INTERSECT
SELECT sCity FROM UAAR_Student

--8
SELECT COUNT(*) FROM (SELECT CNIC, sName FROM BIIT_STudent  
EXCEPT
SELECT CNIC, sName FROM NUST_Student
EXCEPT 
SELECT CNIC, sName FROM UAAR_Student) AS TEMP

--9
SELECT COUNT(*) FROM (
SELECT CNIC, sName FROM BIIT_STudent  
UNION
SELECT CNIC, sName FROM NUST_Student
UNION 
SELECT CNIC, sName FROM UAAR_Student) AS TEMP


--10:
SELECT CNIC, sName FROM NUST_Student
INTERSECT
SELECT CNIC, sName FROM BIIT_STudent
EXCEPT 
SELECT CNIC, sName FROM UAAR_Student




