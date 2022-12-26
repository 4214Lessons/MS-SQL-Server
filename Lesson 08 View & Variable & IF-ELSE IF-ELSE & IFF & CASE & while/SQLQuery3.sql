-- IF-ELSE IF-ELSE
-- IIF
-- CASE WHEN THEN ELSE





---------------------------------------------
-- IF
-- ELSE IF
-- ELSE


DECLARE @num1 int = 10, @num2 int = 9


IF @num1 > @num2
	BEGIN
		PRINT '@num1 greater than @num2'
		PRINT 'multiline'
	END
ELSE IF @num1 = @num2
	PRINT '@num1 = @num2'
ELSE
	PRINT '@num1 less than @num2'




---------------------------------------------
-- IIF


DECLARE @num3 int = 19, @num4 int = 10
PRINT IIF(@num3 > @num4, 'Hakuna', 'Matata') 






-- TASK: ProductName, Category, UnitPrice, Discontinued (True, False)
-- NOTE: If Discontinued = 1, True, else False (ColumnName)
-- NOTE: With VIEW (ENCRYPTION, SCHEMABINDING)

SELECT * FROM Products



CREATE VIEW TaskProducts
WITH ENCRYPTION, SCHEMABINDING
AS
SELECT ProductName, CategoryName, UnitPrice, IIF(Discontinued = 1, 'True', 'False') AS Discontinued 
FROM dbo.Products
JOIN dbo.Categories ON Products.CategoryID = Categories.CategoryID



SELECT * FROM TaskProducts







---------------------------------------------
-- CASE-WHEN-THEN
-- ELSE


-- There are two types of CASE statement, SIMPLE and SEARCHED.





-- Example 1 (SIMPLE CASE)
SELECT FirstName, TitleOfCourtesy, Title FROM Employees


SELECT FirstName,
CASE TitleOfCourtesy
	WHEN 'Ms.' THEN 'Miss'
	WHEN 'Dr.' THEN 'Doctor'
	WHEN 'Mrs.' THEN 'Miss'
	WHEN 'Mr.' THEN 'Mister'
	ELSE 'Empty'
END AS Courtesy, Title
FROM Employees






-- Example 2 (SEARCHED CASE)

SELECT ProductName, 
CASE
	WHEN UnitPrice < 10 THEN 'Free'
	WHEN UnitPrice IN(10, 11, 12) THEN 'Cheap'
	WHEN UnitPrice BETWEEN 13 AND 51 THEN 'Normal'
	WHEN UnitPrice = 52 OR UnitPrice = 53 THEN 'Expensive'
	WHEN UnitPrice > 53 AND UnitPrice < 1000 THEN 'Very expensive'
	ELSE 'Unknown'
END
FROM Products





















SELECT FirstName, LastName, BirthDate, City FROM Employees


-- TASK: BirthDate of employee : Winter, Summer, Spring, Autumn  
-- FirstName, LastName, Season, City


SELECT FirstName, LastName, 
CASE
	WHEN MONTH(BirthDate) IN(12, 1, 2) THEN 'Winter'
	WHEN MONTH(BirthDate) IN(3, 4, 5) THEN 'Spring'
	WHEN MONTH(BirthDate) IN(6, 7, 8) THEN 'Summer'
	WHEN MONTH(BirthDate) IN(9, 10, 11) THEN 'Autumn'
END AS Season, BirthDate
City FROM Employees