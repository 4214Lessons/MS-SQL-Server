-- Stored Procedures












---------------------------------------------
-- Types of Stored Procedures
--	1) User-defined Stored Procedures
--	2) System Stored Procedures








---------------------------------------------
-- Parsing   (Tehlil)
-- Compiling (Kompilyasiya)
-- Execution (Icra)












---------------------------------------------
-- PROCEDURE = PROC
-- EXECUTE   = EXEC
-- OUTPUT    = OUT












---------------------------------------------
-- PROCEDURE
-- ENCRYPTION, SCHEMABINDING, RECOMPILE



USE [Library]













CREATE PROCEDURE usp_takenBooks
AS
BEGIN
	SELECT S.FirstName, S.LastName, B.[Name]
	FROM Students AS S INNER JOIN S_Cards AS SC
	ON S.Id = SC.Id_Student 
	INNER JOIN Books AS B
	ON B.Id = SC.Id_Book 
	WHERE SC.DateIn IS NULL
END




DROP PROCEDURE usp_takenBooks


EXEC usp_takenBooks
-- EXECUTE usp_takenBooks
--usp_takenBooks



EXEC sp_helptext usp_takenBooks












---------------------------------------------
-- INPUT and OUTPUT parameters



ALTER PROCEDURE usp_TakenBooks 
@group AS nvarchar(50)
AS
BEGIN
	SELECT S.FirstName, S.LastName, G.[Name] AS GroupName, B.[Name] AS BookName
	FROM Students AS S INNER JOIN S_Cards AS SC
	ON S.Id = SC.Id_Student 
	INNER JOIN Books AS B
	ON B.Id = SC.Id_Book 
	INNER JOIN Groups AS G
	ON G.Id = S.Id_Group
	WHERE SC.DateIn IS NULL AND G.[Name] = @group
END


SELECT * FROM Students
SELECT * FROM Groups
SELECT * FROM S_Cards



EXEC usp_TakenBooks '18P2'












---------------------------------------------
-- SET NOCOUNT ON
-- Default parameter
-- DEFAULT keyword
-- @@ROWCOUNT, @@ERROR
-- RETURN (only int values, error status codes)


ALTER PROCEDURE usp_TakenBooks
	@count_studs  int OUTPUT,
	@group_name  nvarchar(50) = '19D'
AS
BEGIN
	SET NOCOUNT ON

	SELECT S.FirstName, S.LastName, G.[Name] AS GroupName, B.[Name] AS BookName
	FROM Students AS S INNER JOIN S_Cards AS SC
	ON S.Id = SC.Id_Student 
	INNER JOIN Books AS B
	ON B.Id = SC.Id_Book 
	INNER JOIN Groups AS G
	ON G.Id = S.Id_Group
	WHERE SC.DateIn IS NULL AND G.[Name] = @group_name

	SET @count_studs = @@ROWCOUNT
	-- RETURN @@ERROR
END




DECLARE @groupName AS nvarchar(50) = '18P2'
DECLARE @stcount AS int
DECLARE @errorCode AS int


-- EXEC @errorCode = usp_TakenBooks @group_name = @groupName, @count_studs = @stcount OUTPUT 
EXEC @errorCode = usp_TakenBooks @stcount OUTPUT, @groupName
PRINT @stcount
PRINT @errorCode












---------------------------------------------
-- All stored procedures

SELECT * FROM sys.procedures