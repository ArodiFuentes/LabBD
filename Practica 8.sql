USE Library

CREATE TRIGGER TInsert
on Libro
INSTEAD OF INSERT
AS
	SELECT *FROM inserted

CREATE TRIGGER TDelete
ON Autor
 INSTEAD OF DELETE
	AS
			SELECT * FROM deleted
		

CREATE TRIGGER TUpdate
ON Pais
AFTER UPDATE
	AS 
		SELECT * FROM inserted
		SELECT * FROM deleted




