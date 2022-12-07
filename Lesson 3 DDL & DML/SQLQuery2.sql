-- DML (SELECT, DELETE, UPDATE, INSERT)


SELECT * FROM Products

SELECT ProductName, UnitPrice FROM Products


SELECT FirstName, LastName FROM Employees


SELECT (FirstName + ' ' + LastName) AS Fullname FROM Employees

SELECT (CAST(EmployeeID AS nvarchar) + ' ' + FirstName) AS Result FROM Employees
SELECT (CAST(EmployeeID AS char(4)) + ' ' + FirstName) AS Result FROM Employees
SELECT (CONVERT(char(4), EmployeeID) + ' ' + FirstName) AS Result FROM Employees
SELECT (STR(EmployeeID) + ' ' + FirstName) AS Result FROM Employees
SELECT (LTRIM(STR(EmployeeID)) + ' ' + FirstName) AS Result FROM Employees


SELECT UnitPrice FROM Products
ORDER BY UnitPrice ASC


SELECT UnitPrice FROM Products
ORDER BY UnitPrice DESC



SELECT TOP 3 UnitPrice FROM Products
ORDER BY UnitPrice DESC


SELECT TOP 10 PERCENT UnitPrice FROM Products
ORDER BY UnitPrice DESC



SELECT TOP 1 WITH TIES ReorderLevel FROM Products
ORDER BY ReorderLevel DESC



SELECT DISTINCT CategoryID FROM Products