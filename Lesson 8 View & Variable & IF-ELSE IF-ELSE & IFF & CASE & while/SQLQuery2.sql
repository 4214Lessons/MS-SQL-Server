-- Variable

DECLARE @num1 int = 42
SELECT @num1

DECLARE @num2 AS int = 41
PRINT  @num2






DECLARE @num3 int = 10
PRINT @num3

SET @num3 = 15
PRINT @num3





DECLARE @num4 int = 10, @num5 int = 7
PRINT @num4 + @num5




DECLARE @num6 int = 10
PRINT 'Result: ' + CONVERT(nvarchar(2), @num6)



DECLARE @authors int
SELECT @authors = COUNT(*) FROM Authors
PRINT @authors



-- TASK: PRINT
-- Menim adim "name", yashim "CurrentDate - DateOfBirth" budur
-- ve boyum "height" bu qederdi.



DECLARE @name nvarchar(20) = 'Tural'
DECLARE @birthdate date = '1992-12-08'
DECLARE @height float = '185'

DECLARE @age tinyint = DATEDIFF(YEAR, '1992-12-08', SYSDATETIME())


PRINT 'Menim adim ' + @name + ' yashim '+ LTRIM(STR(@age)) +' budur
ve boyum ' + CONVERT(char(3), @height) + ' bu qederdi.'