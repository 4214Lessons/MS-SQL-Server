SELECT * FROM Students


DECLARE @num1 AS int = 5
DECLARE @num2  int = 3

SELECT @num1 + @num2 AS [Sum]

PRINT @num1 + @num2



SELECT GETDATE() AS [DateTime]

SELECT MONTH(GETDATE()) AS [Month]
SELECT YEAR(GETDATE()) AS [Year]
SELECT DAY(GETDATE()) AS [Day]


--SELECT * FROM Students
--WHERE MONTH(DateOfBirth) = 11


-- Single line comment

/*
	Multi-line
	comment
*/