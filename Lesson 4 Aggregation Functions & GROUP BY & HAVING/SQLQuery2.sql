-- Aggregation Functions

SELECT * FROM Books


SELECT SUM(Price) AS [TotalPrice] FROM Books


SELECT SUM(Price) AS [TotalPrice] 
FROM Books
WHERE Category = 'Windows 98'



SELECT COUNT(*) FROM Books
SELECT COUNT([Date]) FROM Books



SELECT * FROM Books
WHERE Category = 'Windows 98'



SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice 
FROM Books
WHERE Category = 'Windows 98'



SELECT AVG(Price) AS Average
FROM Books
WHERE Category = 'Windows 98'





SELECT COUNT(DISTINCT Category) AS TotalUniqueCount 
FROM Books



SELECT * FROM Books



DECLARE @average AS int = 0
SELECT @average = COUNT(Price) FROM Books
PRINT @average
