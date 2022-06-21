CREATE TABLE EmployeeErrors
(
EmployeeID varchar(50),
Firstname varchar(50),
Lastname varchar(50)
)

INSERT INTO EmployeeErrors VALUES 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT * FROM EmployeeErrors

--Trim

SELECT EmployeeID,TRIM(EmployeeID) AS Emp_changed FROM EmployeeErrors

SELECT EmployeeID,LTRIM(EmployeeID) AS Emp_changed FROM EmployeeErrors

SELECT EmployeeID,RTRIM(EmployeeID) AS Emp_changed FROM EmployeeErrors

--Replace

SELECT Lastname,REPLACE(Lastname,'- Fired','') AS Lastname_fixed FROM EmployeeErrors

--Substring

SELECT Firstname,SUBSTRING(Firstname,1,3) AS Firstname_fixed FROM EmployeeErrors

--fuzzy match 

SELECT Dem.Firstname,SUBSTRING(Dem.Firstname,1,3),Err.Firstname,SUBSTRING(Err.Firstname,1,3) FROM EmployeeDemographics AS Dem
JOIN EmployeeErrors AS Err
ON SUBSTRING(Dem.Firstname,1,3) = SUBSTRING(Err.Firstname,1,3)

SELECT Firstname,LOWER(Firstname) AS name_in_lowercase FROM EmployeeErrors

SELECT Firstname,UPPER(Firstname) AS name_in_uppercase FROM EmployeeErrors