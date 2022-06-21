SELECT EmployeeID,Salary,(SELECT AVG(Salary) FROM EmployeeSalary) AS Average_salary FROM EmployeeSalary

--how to do same with partition.

SELECT EmployeeID,Salary,AVG(Salary) OVER() AS Avg_salary FROM EmployeeSalary

--Why it wont work with group by

SELECT EmployeeID,Salary,AVG(Salary)FROM EmployeeSalary
GROUP BY EmployeeID,Salary
ORDER BY 1

--Subquery in FROM --> better choice will be a temptable or subquery

SELECT EmployeeID,Avg_salary FROM(SELECT EmployeeID,Salary,AVG(Salary) OVER() AS Avg_salary FROM EmployeeSalary) A

-- SUBQuery in WHERE

SELECT EmployeeID,Jobtitle,Salary FROM EmployeeSalary WHERE
Salary IN (SELECT Salary FROM EmployeeDemographics WHERE Salary > 50000)