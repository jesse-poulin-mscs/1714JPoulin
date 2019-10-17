-- Jesse Poulin
-- Exercise 2C: Summary queries, groups, joins
-- PropertyManager db

-- 2C.1) Building table, Count all buildings by State and City
SELECT State, City, COUNT(BuildingId) AS [Building Count]
FROM  Building
GROUP BY State, City

-- 2C.2) Building table, Count all buildings by Cities in MN
SELECT City, COUNT(BuildingId) AS [Building Count]
FROM  Building
WHERE (State = N'MN')
GROUP BY City

-- 2C.3) Building/Apartment table, Get average rent of each building
SELECT Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Avg Rent]
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

-- 2C.4) Building/Apartment table, Get SUM of all rent money from the buildings
SELECT Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName

-- 2C.5) Building/Apartment table, get smallest rent amount in each city
SELECT Building.City, MIN(Apartment.Rent) AS [Min Rent]
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

-- 2C.6) Building/Apartment table, Get Min, AVG and MAX Squarefootage of apts in Winona
SELECT Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE (Building.City = N'Winona') AND (Apartment.TenantId IS NULL)
GROUP BY Building.BuildingName

-- 2C.7) Invoice/LineItem table, Get cheapest Garage on September of 2018
SELECT MIN(LineItem.Amount) AS [Cheapest Garage Sep2018]
FROM  Invoice INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))


-- 2C.8) Invoice/LineItem table, Get SUM of LineItems for September 2018
SELECT Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amount]
FROM  Invoice INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))
GROUP BY Invoice.InvoiceId



-- PS: I learned that FAQs are friends.