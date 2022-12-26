-- Məlumatların qorunmasını 2 rejimə ayırırlar:
--	1) Windows müdafiə rejimi (Windows authentication)
--		SQL Server-ə giriş Windows qeydiyyatı ilə mümkündür.
--	2) Qarışıq müdafiə rejimi (Mixed mode)
--		SQL Server-ə giriş həm, Windows qeydiyyatı ilə və SQL Server-lə mümkündür.



-- NOTE: Yuxardaki Mode-lar arasinda kecid edende gerek SQL SERVER-i restart edek.



-- SQL Server-də məlumatlara girişin məhdudlaşdırılmasının 2 səviyyəli modeli təşkil olunub.
--	1) Authentication - Autentifikasiya zamanı SQL Server yoxlayır ki,
--		belə login mövcuddur ya yox, şifrə düzgün göstərilib ya yox, loginin serverə giriş hüququ var ya yox.
--	2) Authorization - Servere daxil olan Login-in hansi huquqlari oldugnu yoxlayir.



--	LOGIN – Sadece SQL-Servere daxil ola bilir.
--	USER  – Hansisa DB-ya LOGIN-e girish haqqi veririk.
--	ROLE  – Hansisa DB-ya USER-e selahiyyetler veririk.





-- LOGIN syntax:
USE master
CREATE LOGIN login_name
WITH
PASSWORD = 'password'  ( or ' ' MUST_CHANGE ),
CHECK_EXPIRATION = ON,
DEFAULT_DATABASE = master





-- USER syntax:
USE DB_name
CREATE USER user_name
FOR LOGIN login_name






-- ROLE syntax:
USE DB_name
CREATE ROLE role_name


GO



GRANT SELECT ON [DB_NAME].dbo.Table TO role_name



GO


ALTER ROLE role_name
ADD MEMBER user_name




EXEC sp_helplogins -- LOGIN-leri gormek ucun komandadir.