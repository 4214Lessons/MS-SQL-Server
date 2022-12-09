-- GROUP BY, HAVING clause



-- {Optional}

-- SELECT
-- {FROM}
-- {WHERE}
-- {GROUP BY}
-- {HAVING}
-- {ORDER BY}



-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY






SELECT COUNT(DISTINCT Category) AS TotalUniqueCount 
FROM Books



SELECT Category, COUNT(*)
FROM Books
GROUP BY Category



SELECT Category, SUM(Price), COUNT(*)
FROM Books
GROUP BY Category




SELECT TOP 1 WITH TIES Topic, COUNT(*) AS [Count of Topic] 
FROM Books
WHERE Topic IS NOT NULL
GROUP BY Topic
ORDER BY [Count of Topic]




SELECT [Format], COUNT(*) AS [Count of Format] 
FROM Books
WHERE [Format] IS NOT NULL
GROUP BY [Format]
HAVING COUNT(*) > 30
ORDER BY [Count of Format]