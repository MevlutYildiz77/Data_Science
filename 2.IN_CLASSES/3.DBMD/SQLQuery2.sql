use LibraryDatabase

INSERT INTO Person.Person (SSN, Person_FirstName, Person_LastName) VALUES (75056659595,'Zehra', 'Tekin')

INSERT Person.Person (SSN, Person_FirstName, Person_LastName) VALUES (75056659595,'Zehra', 'Tekin')


INSERT INTO Person.Person (SSN, Person_FirstName) VALUES (889623212466,'Kerem', 'ATLI')

INSERT INTO Person.Person (SSN, Person_FirstName) VALUES (889623212466,'Kerem')


INSERT INTO Person.Person VALUES (889623212886,'Kerem', NULL)


INSERT Person.Person VALUES (88232556264,'Metin','Sakin')
INSERT Person.Person VALUES (35532888963,'Ali','Tekin')


INSERT INTO Person.Person_Mail (Mail, SSN) 
VALUES ('zehtek@gmail.com', 75056659595),
	   ('meyet@gmail.com', 15078893526),
	   ('metsak@gmail.com', 35532558963)



SELECT * FROM Person.Person_Mail 



--SELECT INTO


SELECT * FROM Person.Person_2


select * into Person.Person_2 from Person.Person


---INSERT INTO SELECT

SELECT * FROM Person.Person_2


INSERT Person.Person_2 (SSN, Person_FirstName, Person_LastName)

SELECT * 
FROM Person.Person 
where Person_FirstName like 'A%'



SELECT * FROM Book.Publisher

--Insert default values

INSERT Book.Publisher
DEFAULT VALUES




--UPDATE
select * from Person.Person

SELECT * FROM Person.Person_2
SELECT * FROM Person.Person
UPDATE Person.Person_2 SET Person_LastName = 'DEFAULT'
UPDATE Person.Person_2 SET Person_LastName = 'Atýcý' WHERE SSN = 889623212886
UPDATE Person.Person
SET Person_LastName = B.Person_LastName
FROM Person.Person A, Person.Person_2 B
WHERE A.SSN = B.SSN
AND	A.SSN = 889623212886
UPDATE Person.Person SET Person_LastName = (SELECT Person_LastName FROM Person.Person_2 WHERE SSN = 889623212466) WHERE SSN = 889623212466
SELECT * FROM Person.Person


--DELETE

insert Book.Publisher values('Ýþ Bankasý Kültür Yayýncýlýk'


















