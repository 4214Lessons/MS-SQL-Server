-- SubQuery


---- TASK 11
--UPDATE Employees 
--SET EndDate = History.EndDate FROM History 
--WHERE Employees.BusinessEntityID = History.BusinessEntityID


--UPDATE Employees 
--SET EndDate = (SELECT TOP 1 History.EndDate FROM History 
--WHERE Employees.BusinessEntityID = History.BusinessEntityID)



--SELECT * FROM Employees
--WHERE EndDate IS NOT NULL


--SELECT * FROM History
--WHERE EndDate IS NOT NULL




SELECT * FROM Categories



SELECT * FROM Products
WHERE CategoryID = 
(SELECT CategoryID FROM Categories 
WHERE CategoryName = 'Seafood')


--List<Product> products = new();

--foreach (var p in Products){
--	var categoryId = Categories
--		.FirstOrDefault(c.CategoryName = 'Seafood');

--	if(p.CategoryId == categoryId){
--		products.Add(p);
--	}
--}






SELECT ProductName, UnitPrice,
	(SELECT CategoryName 
	FROM Categories 
	WHERE Categories.CategoryID = Products.CategoryID) AS CategoryName 
FROM Products









-- ALL, ANY, EXISTS






-- Normalization

-- First Normal Form		(1NF)
-- Second Normal Form		(2NF)
-- Third Normal Form		(3NF)
-- Boyce-codd Normal Form	(3.5NF)
-- Fourth Normal Form		(4NF)
-- Fifth Normal Form		(5NF)
-- Domain-key Normal Form	(5.5NF)
-- Sixth Normal Form		(6NF)
