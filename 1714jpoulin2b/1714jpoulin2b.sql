-- Jesse Poulin
-- Exercise 2B: Summary queries, min, max, sum, avg, count
-- PropertyManager db

-- 2B.1) Building table, Count all buildings
SELECT COUNT(*) AS [Count All Buildings]
FROM  Building

-- 2B.2) Building table, Count all buildings in Winona
SELECT COUNT(*) AS [Count Buildings in Winona]
FROM  Building
WHERE (City = N'Winona')

-- 2B.3) Apartment table, Average rent of apts
SELECT AVG(Rent) AS [Avg rent of all apartments]
FROM  Apartment

-- 2B.4) Apartment table, Sum of all rent in Building 1
SELECT SUM(Rent) AS [Bldg1 Total Rent]
FROM  Apartment
WHERE (BuildingId = 1)
-- 2B.5) Apartment table, Cheapest rent from Building 2
SELECT MIN(Rent) AS [Bldg2 Cheapest Rent]
FROM  Apartment
WHERE (BuildingId = 2)

-- 2B.6) Apartment table, Get the smallest, avg, and biggest Apartment sizes
SELECT MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Avg Size], MAX(SquareFeet) AS [Largest Size]
FROM  Apartment
WHERE (BuildingId = 1)

-- 2B.7) LineItem table, Get the cheapest Garage
SELECT MIN(Amount) AS [Cheapest Garage]
FROM  LineItem
WHERE (Description = N'Garage')

-- 2B.8) LineItem table, Get the total amount used for Gas
SELECT SUM(Amount) AS [Total Billed for Gas]
FROM  LineItem
WHERE (Description = N'Gas')

-- 2B.9) LineItem table, Get the total Rent for the month of October
SELECT SUM(Amount) AS [Total October Rent]
FROM  LineItem
WHERE (Description LIKE N'Rent, October%')
