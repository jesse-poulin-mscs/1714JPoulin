-- Jesse Poulin
-- Exercise 2D: Multi-table join queries
-- PropertyManager db

-- 2D.1) Building, Apartment, Person tables, Get Admins for Buildings
SELECT Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

-- 2D.2) Building, Apartment, Person tables, Get Tenants for Buildings
SELECT Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM  Person INNER JOIN
         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum

-- 2D.3) Apartment, Person, Invoice, LineItem tables, Get Tenant LineItem amounts
SELECT Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM  Apartment INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE (Apartment.BuildingId = 1)

-- 2D.4) Apartment, Person, Invoice, LineItem tables, Get Tenant Invoice totals
SELECT Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM  Apartment INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

-- 2D.5) Apartment, Person, Invoice, Receipt tables, Get Tenant Receipt totals
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM  Invoice INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

-- 2D.6) Apartment, Person, Invoice, Receipt tables, Get Tenant Receipt totals with received
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS Received
FROM  Invoice INNER JOIN
         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Receipt.Amount

-- 2D.7) Apartment, Person, Invoice, Receipt tables, Get Admin Receipt totals with received
SELECT Person.PersonId, Person.LastName AS Admin, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Billed], Receipt.Amount AS [Received]
FROM  Invoice INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
         Person ON Apartment.AdminId = Person.PersonId
GROUP BY Person.PersonId, Person.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Receipt.Amount

