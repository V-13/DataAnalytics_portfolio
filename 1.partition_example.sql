SELECT Firstname,Lastname,Salary,Jobtitle,Gender,
AVG(Salary) OVER(PARTITION BY Jobtitle,Gender) AS Average_salary 

FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
