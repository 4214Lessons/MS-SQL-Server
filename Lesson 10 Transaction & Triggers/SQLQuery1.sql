﻿-- TRANSACTION

-- Tranzaksiya hamısı müvəffəqiyyətlə yerinə yetirilən və ya 
-- heç biri yerinə yetirilməyən bir və ya bir neçə əməliyyat toplusudur.
-- Məntiqi olaraq bölünməyən iş vahididir(baxmayaraq ki, fiziki olaraq bir neçə komandadan ibarətdir)












---------------------------------------------
-- Transaction properties
-- (Sql Server butun xususiyyetleri temin edir)


-- ACID

-- Atomicity   (Atmor)
-- Consistency (Tutarliq)
-- Isolation   (Izolasiya)
-- Durability  (Davamliliq)










---------------------------------------------
-- System Transactions
-- User Transactions












---------------------------------------------
-- User Transactions novleri
-- Implicit            (SET IMPLICIT_TRANSACTIONS ON)
-- Explicit
-- AutoCommit












---------------------------------------------
-- Hər bir SQL Server məlumat bazası azı 2 fayla malikdir
--	İcinde bilavasite məlumatlarin saxlandigi məlumatlar faylı (.mdf)
--	İcinde DB-nin dəyişikliklər loqunun saxlandığı tranzaksiya jurnalinin faylı (.ldf)












---------------------------------------------
-- Keywords
--	BEGIN TRANSACTION və ya BEGIN TRAN
--	COMMIT - uğurla həyata keçirilibsə
--	ROLLBACK - səhvlər olduğu halda
--	SAVE TRANSACTION - saxlanma nöqtəsinin təyin edilməsi










---------------------------------------------
CREATE PROCEDURE AddCommentMark
	@comid AS int,
	@userid AS int,
	@mark AS int
AS
BEGIN
	BEGIN TRAN CommentMark

	INSERT INTO CommentRating(IdComment, IdUser, Mark)
	VALUES (@comid, @userid, @mark)

	IF(@@ERROR != 0)
	BEGIN
		PRINT 'Error in insert'
		ROLLBACK TRAN CommentMark
	END
	ELSE
	BEGIN

		PRINT 'Insert ok'
		UPDATE Comments
		SET Rating = (
			SELECT CAST(SUM(Mark) AS float) / COUNT(*)
			FROM Comments INNER JOIN CommentRating
			ON Comments.Id = CommentRating.IdComment
			WHERE  Comments.Id = @comid
		)
		WHERE  Comments.Id = @comid



		IF(@@ERROR != 0)
		BEGIN
			PRINT 'Error in update'
			ROLLBACK TRAN CommentMark
		END
		ELSE
		BEGIN
			PRINT 'update ok'
			COMMIT TRAN CommentMark
		END

	END

END



SELECT * FROM Users
SELECT * FROM Posts
SELECT * FROM PostRating


EXEC AddCommentMark 2, 1, 3
-- ComId, UserId, Mark


-- SAVE TRANSACTION