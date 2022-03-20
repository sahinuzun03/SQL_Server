use AdventureWorks2019
SELECT *
FROM HumanResources.vEmployee

SELECT Person.FirstName , Person.LastName
	   ,(SELECT TOP 1 PhoneNumber FROM Person.PersonPhone
		 WHERE BusinessEntityID = Person.BusinessEntityID ) AS TelNo
	   ,(SELECT COUNT(*) FROM Person.PersonPhone WHERE BusinessEntityID = Person.BusinessEntityID) AS TelSay�s�
	   ,(SELECT COUNT(*) FROM Person.Address 
	   INNER JOIN Person.BusinessEntityAddress BEA ON Address.AddressID = BEA.AddressID
	   WHERE BEA.BusinessEntityID = Person.BusinessEntityID
	   ) AS AdressSay�s�
	   ,Employee.*
FROM HumanResources.Employee Employee
INNER JOIN Person.Person Person ON Employee.BusinessEntityID = Person.BusinessEntityID
WHERE Person.BusinessEntityID IN 
(SELECT BusinessEntityID FROM Person.BusinessEntityAddress
 WHERE AddressID IN(
SELECT AddressID FROM Person.Address
 WHERE StateProvinceID IN (
	SELECT StateProvinceID FROM Person.StateProvince State
    WHERE Name = 'Washington'))
)


--LEFT OUTER JOIN Person.PersonPhone Phone ON Person.BusinessEntityID = Phone.BusinessEntityID




SELECT TOP 1 *
FROM Person.PersonPhone
WHERE BusinessEntityID = 1 
--BusinessEntityID'si 1 olan ki�inin 10 tane telefonuda olsa TOP 1 dedi�imiz i�in art�k onun sadece ilk s�radaki numaras� gelecektir.

--SubQuery'de bu 2 sorgu birle�tirilir.



