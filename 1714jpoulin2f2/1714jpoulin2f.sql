-- Jesse Poulin
-- Exercise 2F: Animal Shelter test queries
-- AnimalShelter db

-- 2F.1) All animals
SELECT Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM  Animals INNER JOIN
         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
         People ON Animals.Person_Id = People.Id

-- 2F.2) Cash donations
SELECT People.LastName + N', ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value
FROM  Donations INNER JOIN
         DonationTypes ON Donations.DonationType_Id = DonationTypes.Id INNER JOIN
         People ON Donations.Person_Id = People.Id
WHERE (DonationTypes.Description = N'Cash')

-- 2F.3) Total donations for each donor
SELECT People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM  Donations INNER JOIN
         People ON Donations.Person_Id = People.Id INNER JOIN
         DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
GROUP BY People.FirstName + N' ' + People.LastName, People.Id

-- 2F.4) Number of dogs for each owner
SELECT People.Id, People.LastName + N', ' + People.FirstName AS Owner, COUNT(AnimalTypes.Id) AS [Number of Dogs]
FROM  People INNER JOIN
         Animals ON People.Id = Animals.Person_Id INNER JOIN
         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
GROUP BY People.Id, People.LastName + N', ' + People.FirstName, AnimalTypes.Type
HAVING (AnimalTypes.Type = N'Dog')
