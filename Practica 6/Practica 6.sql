USE Library


SELECT Titulo FROM  Libro WHERE Titulo = (SELECT IdEditorial FROM Editorial WHERE Nombre = 'Santillan')

SELECT Costo FROM Libro WHERE Costo = (SELECT Stock FROM Libro WHERE Stock = 600 )

SELECT IdLibro, Titulo
FROM Libro
WHERE IdLibro = (SELECT Codigo_Pais FROM Pais WHERE IdPais = (SELECT IdAutor FROM Autor WHERE Nombre = 'Carlos'))

SELECT Titulo 
FROM Libro
WHERE Stock = (SELECT Stock FROM Libro WHERE Titulo = 'If I Stay')

CREATE VIEW Vista1
	AS SELECT G.Descripcion, L.Fecha_Lanzamiento 
		FROM Generos G JOIN Libro L  ON G.IdGenero = L.IdGenero 
			WHERE  DATEDIFF(DD, L.Fecha_lanzamiento, '2010-10-10') > 0;  


CREATE VIEW Vista2 
	AS SELECT L.Titulo, A.Nombre, G.Descripcion, L.Costo 
		FROM Autor A JOIN Libro L 
			ON L.IdAutor = A.IdAutor JOIN Generos G 
				ON G.IdGenero = L.IdGenero 
					WHERE L.Costo < 500 


CREATE VIEW Vista3 
	AS SELECT MAX (Costo) 
		AS LibroMasCaro 
			FROM Libro;


CREATE VIEW Vista4
AS SELECT CONCAT( A.Nombre, ' ' ,A.ApPaterno, ' ', A.ApMaterno) 
	AS 'Nombre Completo' 
		FROM Autor A JOIN Pais P 
			ON A.IdPais = P.IdPais 
				WHERE P.Nombre = 'China';


CREATE VIEW Vista5 
	AS SELECT L.Titulo 
		AS LibroBaratos, L.Costo
			FROM Libro L INNER JOIN Pais P 
				ON L.IdPais = P.IdPais
					WHERE P.Nombre = 'Mexico';


DECLARE @ConsultaSQL NVARCHAR(500)
DECLARE @Tabla NVARCHAR(25)
DECLARE @Costo INT
DECLARE @Costo2 INT

SET @Costo = 150
SET @Costo2 = 400

SET @Tabla = 'Libro'
SET @ConsultaSQL = 'SELECT * FROM ' + @Tabla + ' WHERE Edad BETWEEN @Costo AND @Costo2'


