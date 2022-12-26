INSERT INTO Students VALUES
('Miri', 'Huseynzade', 'FBMS_4214', 'miri@gmail.com', 1, NULL, 5.8),
('Leyla', 'Shefiyeva', 'FBMS_4214', 'leyla@gmail.com', 0, NULL, 6.2)



INSERT Students VALUES
('Miri', 'Huseynzade', 'FBMS_4214', 'miri@gmail.com', 1, NULL, 5.8),
('Leyla', 'Shefiyeva', 'FBMS_4214', 'leyla@gmail.com', 0, NULL, 6.2)



INSERT Students(FirstName, LastName, Gender, Email)
VALUES
('Miri', 'Huseynzade', 1, 'miri@gmail.com'),
('Leyla', 'Shefiyeva', 0, 'leyla@gmail.com')



SELECT * FROM Students



DELETE Students
WHERE Id = 7



UPDATE Students
SET [Group] = 'FBMS_4213', Score = 11
WHERE Id = 13