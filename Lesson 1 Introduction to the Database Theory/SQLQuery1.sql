SELECT * FROM Students


SELECT [Name], Surname, Score 
FROM Students


SELECT [Name] AS FirstName, [Surname], [Score] 
FROM StepDB.dbo.Students


SELECT * FROM Students



SELECT MAX(Score) AS MaxScore
FROM Students
WHERE Id = 1 OR [Name] = 'leYla'



SELECT *
FROM Students
WHERE [Name] LIKE '%L%'