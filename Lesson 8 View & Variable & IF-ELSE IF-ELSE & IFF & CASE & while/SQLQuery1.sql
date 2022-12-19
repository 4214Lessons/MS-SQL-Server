-- Views


-- ALTER
CREATE VIEW ExpensiveProducts
AS
SELECT ProductID, ProductName, CategoryName, UnitPrice  
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE UnitPrice > 70



SELECT * FROM ExpensiveProducts
WHERE UnitPrice > 100
ORDER BY UnitPrice DESC





UPDATE ExpensiveProducts
SET UnitPrice = 35
WHERE ProductID = 20





DROP VIEW ExpensiveProducts






---------------------------------------------------
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
SELECT * FROM INFORMATION_SCHEMA.VIEWS
SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM sys.tables
SELECT * FROM sys.views
SELECT * FROM sys.foreign_keys
SELECT * FROM sys.check_constraints
SELECT * FROM sys.default_constraints



-- sp_helptext ExpensiveProducts
EXEC sp_helptext ExpensiveProducts





---------------------------------------------------
CREATE VIEW ExpensiveProducts
WITH ENCRYPTION
AS
SELECT ProductID, ProductName, CategoryName, UnitPrice  
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE UnitPrice > 70






---------------------------------------------------
CREATE VIEW ExpensiveProducts
WITH SCHEMABINDING
AS
SELECT ProductID, ProductName, CategoryName, UnitPrice  
FROM dbo.Products
JOIN dbo.Categories ON Products.CategoryID = Categories.CategoryID
WHERE UnitPrice > 70





EXECUTE sp_rename 'Products.ProductName', 'NewName', 'COLUMN'