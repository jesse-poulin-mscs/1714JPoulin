-- Jesse Poulin
-- Exercise 2H: EZAuto test queries
-- EZAuto db

--Get details for requests/quotes
SELECT People.FirstName AS Requestee, Requests.RequestDescription AS Description, Quotes.QuotePrice AS Price, RepairShops.RepairShopName AS [Repair Shop]
FROM  People INNER JOIN
         Requests ON People.Id = Requests.Person_Id INNER JOIN
         Quotes ON Requests.Id = Quotes.Request_Id INNER JOIN
         RepairShops ON Quotes.RepairShop_Id = RepairShops.Id
--Get reviews for Repair Shops
SELECT RepairShops.RepairShopName AS [Repair Shop Name], Reviews.ReviewScore AS Score, Reviews.ReviewDescription AS Description
FROM  RepairShops INNER JOIN
         Reviews ON RepairShops.Id = Reviews.RepairShop_Id
--Get reviews for Parts Stores
SELECT PartStores.PartStoreName AS [Parts Store Name], Reviews.ReviewScore AS Score, Reviews.ReviewDescription AS Description
FROM  PartStores INNER JOIN
         Reviews ON PartStores.Id = Reviews.PartStore_Id
--Get Employees for Repair Shops
SELECT People.FirstName AS Employee, RepairShops.RepairShopName AS [Repair Shop]
FROM  People INNER JOIN
         RepairShops ON People.RepairShop_Id = RepairShops.Id
--Get Employees for Parts Store
SELECT People.FirstName AS Employee, PartStores.PartStoreName AS [Parts Store]
FROM  People INNER JOIN
         PartStores ON People.PartStore_Id = PartStores.Id
--Get subscribers
SELECT People.FirstName AS [First Name], Subscriptions.Id AS [Sub Id]
FROM  People INNER JOIN
         Subscriptions ON People.Subscription_Id = Subscriptions.Id