USE Academy




-- One to Many

CREATE TABLE Groups(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(20) UNIQUE NOT NULL,
	CreatedDate datetime2
)


CREATE TABLE Students(
	Id int PRIMARY KEY IDENTITY(1, 1),
	FirstName nvarchar(20) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	DateOfBirth smalldatetime NULL,
	Score float NULL,
	GroupId int FOREIGN KEY REFERENCES Groups(Id)
)



INSERT Groups VALUES
('FBMS_4213', '2021-11-14'),
('FBAS_4214', '2021-11-15')


INSERT Students VALUES
('Leyla', 'Shefiyeva', NULL, NULL, 1),
('Miri', 'Huseynzade', '2003-09-01', 9, 1),
('Tural', 'Haci-nebili', '2007-06-24', 11, 2),
('Murad', 'Meherremli', NULL, 12, 2),
('Elshad', 'Hesenov', '2005-03-25', NULL, 2),
('Ali', 'Shamilzade', NULL, 11.5, 2)





SELECT * FROM Students, Groups
WHERE Students.GroupId = Groups.Id



SELECT FirstName, LastName, DateOfBirth, Score, [Name], CreatedDate
FROM Students, Groups
WHERE Students.GroupId = Groups.Id










-- One to One

CREATE TABLE Countries(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(20) NOT NULL
)

CREATE TABLE Capitals(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(20) NOT NULL,
	CountryId int UNIQUE FOREIGN KEY REFERENCES Countries(Id)
)


ALTER TABLE Capitals
DROP CONSTRAINT FK__Capitals__Country


ALTER TABLE Capitals
ADD CONSTRAINT FK__Capitals__Country 
FOREIGN KEY(CountryId) REFERENCES Countries(Id)




INSERT Countries VALUES
('Azerbaijan'),
('Russia'),
('Turkey')

INSERT Capitals VALUES
('Baku', 1),
('Moscov', 2),
('Ankara', 3)



SELECT * FROM Countries
SELECT * FROM Capitals


SELECT Countries.Id, Countries.[Name], Capitals.[Name] 
FROM Capitals, Countries
WHERE CountryId = Countries.Id


TRUNCATE TABLE Countries
TRUNCATE TABLE Capitals











-- Many to Many

CREATE TABLE Authors(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[FirstName] nvarchar(20) NOT NULL,
	[LastName] nvarchar(20) NOT NULL,
	DateOfBirth date
)


CREATE TABLE Books(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(20) NOT NULL,
	Genre nvarchar(20) NOT NULL,
	Pages smallint NOT NULL,
	Price money NOT NULL
)




CREATE TABLE AuthorsBooks(
	AuthorId int NOT NULL REFERENCES Authors(Id),
	BooksId int NOT NULL REFERENCES Books(Id)
)



INSERT Authors VALUES
('Leyla', 'Shefiyeva', '2003-12-27'),
('Kenan', 'Muradov', NULL),
('Huseyn', 'Ibrahimov', '2003-05-09')


INSERT Books VALUES
('CLR via C#', 'Programming', 987, 27.50),
('DA VINCI CODE', 'Triller', 514, 12.00),
('Brilyant Məsələsi', 'Detective', 98, 9.30),
('Düşün və varlan', 'Şəxsi inkişaf', 237, 49.99)


INSERT AuthorsBooks VALUES
(1, 2),
(2, 4),
(2, 3),
(3, 4)


--Leyla	DA VINCI CODE
--Kenan	Düşün və varlan
--Kenan	Brilyant Məsələsi
--Huseyn	Düşün və varlan



SELECT FirstName, [Name], Genre, Pages, Price 
FROM Authors, Books, AuthorsBooks
WHERE AuthorsBooks.AuthorId = Authors.Id 
AND AuthorsBooks.BooksId = Books.Id







-- ON UPDATE, ON DELETE
-- 1) NO ACTION
-- 2) CASCADE
-- 3) SET NULL
-- 4) SET DEFAULT





ALTER TABLE Students
DROP CONSTRAINT FK__Students__GroupsId


ALTER TABLE Students
ADD CONSTRAINT FK__Students__GroupsId 
FOREIGN KEY(GroupId) REFERENCES Groups(Id)
ON DELETE SET DEFAULT
ON UPDATE NO ACTION




INSERT Groups VALUES
('FBMS_4213', '2021-11-14')


INSERT Students VALUES
('Leyla', 'Shefiyeva', NULL, NULL, 5),
('Miri', 'Huseynzade', '2003-09-01', 9, 5)




SELECT * FROM Groups
SELECT * FROM Students


DELETE Groups
WHERE [Name] = 'FBMS_4213'


DELETE Students
WHERE FirstName IN('Leyla', 'Miri')