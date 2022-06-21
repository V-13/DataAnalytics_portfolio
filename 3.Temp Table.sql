CREATE TABLE #Temp_Table
(Emp_id INT,
 Jobtitle VARCHAR(50),
 Salary INT)

 SELECT * FROM #Temp_Table

 INSERT INTO #Temp_Table
 VALUES(1000,'Manager',35000)

 INSERT INTO #Temp_Table
 SELECT * FROM EmployeeSalary

 --temp table use case

 DROP TABLE IF EXISTS #Temp_table2

 CREATE TABLE #Temp_table2(
 Jobtitle VARCHAR(50),
 EmployeePerJob int,
 Avg_age int,
 Avg_salary int)

 

 INSERT INTO #Temp_table2
 SELECT Jobtitle,COUNT(Jobtitle),AVG(Age),AVG(Salary) FROM EmployeeDemographics
 JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
 GROUP BY Jobtitle

 SELECT * FROM #Temp_table2