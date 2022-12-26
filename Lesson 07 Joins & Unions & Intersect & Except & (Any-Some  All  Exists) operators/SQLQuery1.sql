-- Mundericat -- JOINs



---------------------------------------------
-- NOTE: {Optional} 



---------------------------------------------
-- Implicit join (SQL-89)(with WHERE)
-- Explicit join (SQL-92)(JOINs)




---------------------------------------------
-- Horizontal join
-- Vertiacal  join



---------------------------------------------
---- Horizontal joins




-- JOINs
-- 1) CROSS JOIN
-- 2) {INNER} JOIN
-- 3) OUTER JOIN 
		-- 3.1) LEFT {OUTER} JOIN
		-- 3.2) RIGHT {OUTER} JOIN
		-- 3.3) FULL {OUTER} JOIN




---- Vertiacal joins

-- UNION {ALL}
-- INTERSECT
-- EXCEPT




---- Operators
-- 1) ANY|SOME 
-- 2) ALL
-- 3) EXISTS




---------------------------------------------
---- Horizontal joins



-- CROSS JOIN

SELECT * FROM Books, Authors
SELECT * FROM Books CROSS JOIN Authors





---------------------------------------------
-- INNER JOIN

SELECT *
FROM Books INNER JOIN Authors
ON Books.Id_Author = Authors.Id


SELECT Books.[Name] AS [Name of Book], Categories.[Name] AS [Name of Category], Quantity, FirstName, LastName
FROM Books 
JOIN Authors ON Id_Author = Authors.Id
JOIN Categories ON Id_Category = Categories.Id



---------------------------------------------
-- OUTER JOINs (LEFT, RIGHT, FULL)


-- LEFT JOIN
SELECT * FROM Students LEFT OUTER JOIN S_Cards
ON Students.Id = Id_Student
WHERE S_Cards.Id IS NULL



SELECT FirstName, LastName, Id_Book 
FROM Students LEFT JOIN S_Cards
ON Students.Id = Id_Student
WHERE S_Cards.Id IS NOT NULL
ORDER BY Id_Book




-- RIGHT JOIN
SELECT * FROM Students RIGHT OUTER JOIN Groups
ON Groups.Id = Students.Id_Group
WHERE Students.Id IS NULL


SELECT * FROM Students RIGHT JOIN Groups
ON Groups.Id = Students.Id_Group





-- FULL JOIN
SELECT * FROM Students FULL JOIN Groups
ON Groups.Id = Students.Id_Group






---------------------------------------------
---- Vertical joins

-- 1) Same data type
-- 2) Same column count
-- 3) ORDERY BY one time
-- 4) Uses first column names




-- UNION {ALL}


SELECT Id, FirstName FROM Authors
UNION
SELECT Id, FirstName FROM Libs


SELECT Id_Book FROM T_Cards
UNION
SELECT Id_Book FROM S_Cards



SELECT Id_Book FROM T_Cards
UNION ALL
SELECT Id_Book FROM S_Cards
ORDER BY Id_Book



-- INTERSECT
SELECT Id_Book FROM T_Cards
INTERSECT
SELECT Id_Book FROM S_Cards








-- EXCEPT
SELECT Id_Book FROM T_Cards
EXCEPT
SELECT Id_Book FROM S_Cards






---------------------------------------------
---- Operators
-- 1) ANY|SOME 
-- 2) ALL
-- 3) EXISTS


SELECT * FROM Books
WHERE Id = ANY(SELECT Id_Book FROM S_Cards)


SELECT * FROM Northwind.dbo.Products
WHERE UnitPrice < ALL(SELECT TOP 5 UnitPrice FROM Northwind.dbo.[Order Details] ORDER BY Quantity DESC)
ORDER BY UnitPrice



SELECT * FROM Northwind.dbo.Products
WHERE ProductID = ALL(SELECT [Order Details].ProductID FROM Northwind.dbo.[Order Details] WHERE Quantity > 280)




SELECT * FROM Northwind.dbo.Products
WHERE UnitPrice < ALL(SELECT AVG(UnitPrice) FROM Northwind.dbo.[Order Details])
ORDER BY UnitPrice





-- EXISTS
SELECT * FROM Students
WHERE EXISTS(SELECT * FROM S_Cards WHERE Students.Id = Id_Student)






-- 1. Display books with the minimum number of pages issued by a particular publishing house.
-- 1. Hər Publisherin ən az səhifəli kitabını ekrana çıxarın

SELECT * FROM Books
WHERE Id_Press = ANY(
	SELECT Id_Press FROM Books AS B
	GROUP BY Id_Press
	HAVING MIN(B.Pages) = Books.Pages)


-- 2. Display the names of publishers who have issued books with an average number of pages larger than 100.	
-- 2. Publisherin ümumi çap etdiyi kitabların orta səhifəsi 300dən yuxarıdırsa, o Publisherləri ekrana çıxarın.


SELECT * FROM Press
WHERE Id = ANY(
	SELECT Id_Press FROM Books
	GROUP BY Id_Press
	HAVING AVG(Pages) > 300
)




-- 3. Output the total amount of pages of all the books in the library issued by the publishing houses BHV and BINOM.
-- 3. BHV və BİNOM Publisherlərinin kitabların bütün cəmi səhifəsini ekrana çıxarın

SELECT SUM(Pages) AS [Total amount of pages (BHV & BİNOM)] FROM Books
WHERE Id_Press = ANY(SELECT Id FROM Press WHERE [Name] IN ('BHV', 'BİNOM'))





-- 4. Select the names of all students who took books between January 1, 2001 and the current date.
-- 4. Yanvarın 1-i 2001ci il və bu gün arasında kitabxanadan kitab götürən bütün tələbələrin adlarını ekrana çıxarın


SELECT * FROM Students
WHERE Id = SOME(SELECT Id_Student FROM S_Cards WHERE DateOut BETWEEN '2001-01-01' AND SYSDATETIME())









-- 6. Display information about authors whose average volume of books (in pages) is more than 600 pages.
-- 6. Yazdığı bütün kitabları nəzərə aldıqda, orta səhifə sayı 600dən çox olan Yazıçılar haqqında məlumat çıxarın.


SELECT * FROM Authors
WHERE Id = ANY(
	SELECT Id_Author FROM Books
	GROUP BY Id_Author
	HAVING AVG(Pages) > 600
)
