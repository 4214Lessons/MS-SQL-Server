--CREATE PROCEDURE usp_GetErrorInfo  
--AS  
--SELECT  
--    ERROR_NUMBER() AS ErrorNumber  
--    ,ERROR_SEVERITY() AS ErrorSeverity  
--    ,ERROR_STATE() AS ErrorState  
--    ,ERROR_PROCEDURE() AS ErrorProcedure  
--    ,ERROR_LINE() AS ErrorLine  
--    ,ERROR_MESSAGE() AS ErrorMessage 
--GO  
  
--BEGIN TRY  
--    -- Generate divide-by-zero error.  
--    SELECT 1/0 
--END TRY  
--BEGIN CATCH  
--    -- Execute error retrieval routine.  
--    EXECUTE usp_GetErrorInfo 
--END CATCH



SET STATISTICS IO OFF
SET STATISTICS TIME OFF


CREATE DATABASE Test


USE Test






CREATE TABLE dbo.TableInHeap ( 
	Id INT NOT NULL,
	Filler1 CHAR(36) NOT NULL,
	Filler2 CHAR(216) NOT NULL 
)


DROP TABLE dbo.TableInHeap

GO





CREATE PROCEDURE ShowInfo_TableInHeap
AS
BEGIN
	SELECT OBJECT_NAME(object_id) AS table_name, [name] AS index_name, [type], [type_desc]
	FROM sys.indexes
	WHERE object_id = OBJECT_ID(N'dbo.TableInHeap'); 
	
	SELECT index_type_desc, page_count, record_count, avg_page_space_used_in_percent
	FROM sys.dm_db_index_physical_stats (DB_ID(N'Test'), OBJECT_ID(N'TableInHeap'), NULL, NULL , 'DETAILED');
	
	EXEC dbo.sp_spaceused N'TableInHeap'; 
END
GO

EXEC ShowInfo_TableInHeap







INSERT TableInHeap VALUES (1, 'a', 'b') 

EXEC ShowInfo_TableInHeap







DECLARE @i AS int = 1
WHILE @i < 30
BEGIN
	SET @i = @i + 1
	INSERT TableInHeap VALUES (@i, 'a', 'b')
END


EXEC ShowInfo_TableInHeap
 








INSERT TableInHeap VALUES (31, 'a', 'b')


EXEC ShowInfo_TableInHeap
GO








DECLARE @i AS int = 1000000
WHILE @i < 1100000
BEGIN
	SET @i = @i + 1
	INSERT TableInHeap VALUES (@i, 'a', 'b')
END




-- 352
SELECT * FROM TableInHeap
WHERE Id = 900000








CREATE CLUSTERED INDEX Index1 
ON TableInHeap (Id)



CREATE NONCLUSTERED INDEX Index2
ON TableInHeap (Filler2)



-- 27
SELECT * FROM TableInHeap
WHERE Id = 900000