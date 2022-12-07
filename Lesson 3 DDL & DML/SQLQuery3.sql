--SELECT
--FROM
--WHERE
--ORDER BY




-- WHERE Clause

-- Operators
-- > Greater than
-- < Less than
-- >=
-- <=
-- =  Equal
-- !> NOT Greater than
-- !< NOT Less than
-- != NOT Equal
-- <> NOT Equal





SELECT * FROM Categories
WHERE CategoryID > 5




SELECT * FROM Categories
WHERE CategoryName <> 'Produce'



SELECT * FROM Categories
WHERE LEN(CategoryName) !< 10




SELECT * FROM [Northwind].[dbo].[Categories]



SELECT * FROM Employees
WHERE YEAR(BirthDate) > 1955


SELECT * FROM Employees
WHERE MONTH(BirthDate) >= 7


SELECT * FROM Employees
WHERE DAY(BirthDate) = 8



SELECT * FROM Employees
WHERE BirthDate >= '1958-12-08'




-- AND
-- OR


SELECT * FROM Employees
WHERE FirstName = 'Janet' OR City = 'London'



SELECT * FROM Employees
WHERE EmployeeID > 4 AND EmployeeID < 7






SELECT TitleOfCourtesy, City FROM Employees
ORDER BY TitleOfCourtesy ASC, CITY DESC






-- IN, BETWEEN, LIKE
-- IS NULL
-- NOT




SELECT * FROM Employees
WHERE Region IS NULL


SELECT * FROM Employees
WHERE Region IS NOT NULL




SELECT * FROM Categories
WHERE CategoryName IN('Beverages', 'Confections', 'Seafood')


SELECT * FROM Categories
WHERE CategoryName NOT IN('Beverages', 'Confections', 'Seafood')


SELECT * FROM Categories
WHERE CategoryID BETWEEN 3 AND 6


SELECT * FROM Categories
WHERE CategoryID NOT BETWEEN 3 AND 6


SELECT CategoryName FROM Categories
WHERE CategoryName LIKE '%c%'

SELECT CategoryName FROM Categories
WHERE CategoryName LIKE 'c%'

SELECT CategoryName FROM Categories
WHERE CategoryName NOT LIKE '_o%'