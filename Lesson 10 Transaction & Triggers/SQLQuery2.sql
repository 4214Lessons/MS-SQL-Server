﻿-- Triggers

-- Triggerlər – adlandırılmış T-SQL komandalar blokudur hansı ki, 
--		hər hansısa hadisənin baş verən zaman işə salınır. 









---------------------------------------------
-- Trigger types
-- DML (INSERT, UPDATE, DELETE)
-- DDL (CREATE, ALTER, DROP, GRANT, DENY, REVOKE)
-- LOG ON











---------------------------------------------
-- INSTEAD OF (evvel, evezine)
-- AFTER/FOR  (sonra, uchun)












---------------------------------------------
-- DDL triggerləri  təsir sahəsinə görə 2 kateqoriyaya bölünür
--		ALL SERVER
--		DATABASE









 

---------------------------------------------
 -- DELETED
 -- INSERTED

 










---------------------------------------------
-- Triggerlərin yaradılması zamanı qaydalar toplusu mövcuddur:
--		Triggerləri müvəqqəti cədvəllərdə yaratmaq olmaz.
--		Тriggerlər parametrləri qəbul edə bilməzlər.
--		Тriggeri açıq-aşkar işə salmaq olmaz.
--		Тriggerlər mənaları geri qaytara bilərlər.
--		Bir cədvəldə bir əməliyyat üçün birdən çox INSTEAD OF triggeri nəzərdə tutula bilməz.
--		Triggerlərdə belə operatorladan istifadə etmək olmaz: 
--			- DROP
--			- CREATE
--			- ALTER DATABASE
--			- ALTER TABLE
--			- GRANT
--			- REVOKE
--			- SELECT INTO
 










---------------------------------------------
-- SYNTAX

--			CREATE TRIGGER TriggerName ON TableName
--			{ INSTEAD OF | AFTER }
--			{ INSERT | UPDATE | DELETE }
--			AS
--			BEGIN
--				...
--			END
 









---------------------------------------------
-- Example: UPDATE


 CREATE TRIGGER BookUpdates ON Books
 AFTER UPDATE
 AS
 BEGIN
	PRINT @@ROWCOUNT
	PRINT 'Tutdum seni :D'

	SELECT * FROM DELETED
	SELECT * FROM inserted
 END



 UPDATE Books
 SET Pages += 1
 WHERE Pages > 350


 SELECT * FROM Books
 










---------------------------------------------
-- Example: INSERT

CREATE TRIGGER OldBook
ON Books
AFTER INSERT
AS
BEGIN
	DECLARE @year int
	SELECT  @year = YearPress FROM inserted

	IF @year < 1900
		ROLLBACK
END



INSERT INTO Books VALUES(115, 'Book5', 500, 1900, 1, 11, 11, 3,'comment5', 4)













---------------------------------------------
-- Example: DELETE

CREATE TRIGGER NotBHV 
ON Books
AFTER DELETE
AS
BEGIN
	DECLARE @id_bhv int

	SELECT @id_bhv = Id FROM Press
	WHERE [NAME] = 'BHV'

	SELECT * FROM deleted

	IF EXISTS(
		SELECT * FROM deleted
		WHERE Id_Press = @id_bhv
	)
	BEGIN
		ROLLBACK
	END
END



SELECT * FROM Books
DELETE Books
WHERE Id = 115
 










---------------------------------------------
-- INSTEAD OF

CREATE TRIGGER NoInsertLib
ON Libs
INSTEAD OF INSERT
AS
BEGIN
	PRINT 'No Insert Lib'

	-- CUSTOM INSERT 

	SELECT * FROM inserted
END


SELECT * FROM Libs

INSERT INTO Libs VALUES(3, 'Miri', 'Huseynzade')
 










---------------------------------------------
CREATE TABLE MyLogs(
	Id int PRIMARY KEY IDENTITY(1, 1),
	LoginName nvarchar(50) NOT NULL,
	PostDate datetime2 NOT NULL,
	EventType nvarchar(50) NOT NULL,
	ObjectName nvarchar(50) NULL,
	ObjectType nvarchar(50) NULL,
	CommandText nvarchar(max) NULL
)

GO


SELECT * FROM MyLogs


GO




CREATE TRIGGER DB_Actions
ON DATABASE
AFTER DDL_TABLE_VIEW_EVENTS, DDL_TRIGGER_EVENTS, DDL_PROCEDURE_EVENTS, DDL_FUNCTION_EVENTS
AS
BEGIN
	DECLARE @login AS nvarchar(50)
	SET @login = ORIGINAL_LOGIN()		-- Cari istifadəçi

	DECLARE @data AS xml
	SET @data = EVENTDATA()				-- Hadisə haqda məlumat

	DECLARE @event_type AS nvarchar(50), 
	@object_name AS nvarchar(50),
	@object_type AS nvarchar(50),
	@command_text AS nvarchar(max),
	@post_time AS datetime2


	--XML-dən məlumatların alınması:
	SET @event_type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(50)')
	SET @object_name = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(50)')
	SET @object_type = @data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'nvarchar(50)')
	SET @command_text = @data.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'nvarchar(50)')
	SET @post_time = @data.value('(/EVENT_INSTANCE/PostTime)[1]', 'nvarchar(50)')


	-- Sətir sayının çıxarılmasını qadağan edir:
	SET NOCOUNT ON


	-- Əgər loqların cədvəli  itmirsə, o zaman ora bu verilənləri  qeyd edirik:
	IF NOT(@event_type = N'DROP_TABLE' AND @object_name = N'MyLogs')
	BEGIN
		INSERT INTO MyLogs (LoginName, PostDate, EventType, ObjectName, ObjectType, CommandText)
		VALUES (@login, @post_time, @event_type, @object_name, @object_type, @command_text)
	END
END



GO


-- DDL komandasının test çağırışları Triggerin yoxlanması üçün:
CREATE VIEW Test1
AS
SELECT * FROM Books




GO



ALTER VIEW Test1
AS 
SELECT * FROM Students




GO




DROP VIEW Test1





GO





SELECT * FROM MyLogs






GO



--  DB master-ə qoşuluruq, o halda ki, onda  ALL SERVER triggirləri yaratmaq mümkün olsun
USE [master]



GO


-- Loq-ların həmin cədvəlinə qeydləri əlavə edən DB Library-də giriş Triggerinin yaradılması:
CREATE TRIGGER DB_LogOn
ON ALL SERVER
AFTER LOGON
AS
BEGIN	
	SET NOCOUNT ON
	INSERT INTO [Library].dbo.MyLogs (LoginName, PostDate, EventType)
	VALUES (ORIGINAL_LOGIN(), SYSDATETIME(), N'LOGON')
END



GO

--Giriş triggerinin işinin yoxlanılması üçün servərə qoşulmaq və ya qoşulmaqdan imtina vacibdir.

GO

-- Loqların öz cədvəlindən qeydlərin seçilməsi:
SELECT * FROM [Library].dbo.MyLogs