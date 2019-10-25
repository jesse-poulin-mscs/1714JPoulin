-- Jesse Poulin
-- Exercise 2E: Functions, calculated fields
-- PropertyManager db

-- 2E.1) Building, Apartment, Person tables, Get Admins for Buildings
SELECT BuildingName, Address, City + ', ' +State + ' ' + Zip AS Location
FROM  Building
WHERE City='Winona' AND State='MN'

-- 2E.2) Building, Apartment tables, Get Estimated Rent for Apartments in Red Wing, MN
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM  Apartment INNER JOIN
         Building ON Apartment.BuildingId = Building.BuildingId
WHERE City = 'Red Wing' AND State = 'MN'

-- 2E.3) Building, Apartment tables, Get Difference of Rent and Estimated Rent for Apartments in Red Wing, MN
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms) AS [Difference]
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE (Building.City = 'Red Wing') AND (Building.State = 'MN')

-- 2E.4) Building, Apartment, Person, Invoice tables, Get SUM of line items for Invoices
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal
FROM  Building INNER JOIN
         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

-- 2E.5) Building, Apartment, Person, Invoice, Receipt tables, Get SUM of line items for Invoices and Receipt amount
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount
FROM  Apartment INNER JOIN
         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

-- 2E.6) Building, Apartment, Person, Invoice, Receipt tables, Get a list of Invoices where there is unpaid balances
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount AS Received, SUM(LineItem.Amount) - Receipt.Amount AS Difference
FROM  Apartment INNER JOIN
         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING (Receipt.Amount < SUM(LineItem.Amount))

-- 2E.7) Building, Apartment, Person, Invoice, Receipt tables, Get list of late payments
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM  Apartment INNER JOIN
         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId AND Invoice.DueDate < Receipt.ReceiptDate

-- 2E.8) Building, Apartment, Person, Invoice tables, Get most recent Invoice and the next one
SELECT Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(month, 1, MAX(Invoice.InvoiceDate)) AS [Next Invoice]
FROM  Person INNER JOIN
         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName













