-- WHILE
-- CONTINUE
-- BREAK

 


---------------------------------------------

DECLARE @i int = 1, @count int = 20

WHILE @i < @count
BEGIN
	SET @i += 1

	IF @i = 14
		BREAK -- CONTINUE

	IF @i % 2 = 0
		PRINT @i
END






---------------------------------------------
-- TASK: Select all teachers who did not take books in the library (2 methods - EXISTS or ANY, JOIN)

SELECT * FROM Teachers
WHERE NOT EXISTS(SELECT * FROM T_Cards WHERE Id_Teacher = Teachers.Id)


SELECT * FROM Teachers
WHERE Id != ALL(SELECT Id_Teacher FROM T_Cards WHERE Id_Teacher = Teachers.Id)
