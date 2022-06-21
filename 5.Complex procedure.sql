CREATE PROCEDURE Emp_pro
AS
CREATE TABLE #Temp_Emp_pro
(
Jobtitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSal INT)


INSERT INTO #Temp_Emp_pro
SELECT Jobtitle,COUNT(Jobtitle),AVG(Age),AVG(salary) FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY Jobtitle

SELECT * FROM #Temp_Emp_pro

EXEC Emp_pro @Jobtitle = 'Accountant'

