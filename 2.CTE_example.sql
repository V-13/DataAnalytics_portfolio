

WITH CTE_emp AS
(
SELECT Firstname,Lastname,Gender,Jobtitle,Salary,
AVG(Salary) OVER (PARTITION BY Jobtitle) AS Median_Pay
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID
) 
SELECT firstname,Salary,Median_Pay FROM CTE_emp