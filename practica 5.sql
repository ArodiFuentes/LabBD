
SELECT	Titulo AS TituloLibro FROM Libro WHERE SQRT (costo) >20;
SELECT AVG (Stock)AS Mediadisponible FROM Libro 
SELECT COUNT(*)AS CantidadLibros FROM Libro;
SELECT SUM (Stock) AS ProductosTotales FROM Libro;
SELECT MAX (Costo) AS LibroMasCaro FROM Libro;

SELECT * FROM Autor A INNER JOIN Pais P ON A.IdPais = P.IdPais;
SELECT * FROM Autor A LEFT JOIN Pais P ON A.IdPais = P.IdPais;
SELECT * FROM Autor A RIGHT JOIN Pais P ON A.IdPais = P.IdPais;
SELECT * FROM Autor A CROSS JOIN Pais P ON A.IdPais = P.IdPais;

SELECT L.Titulo AS LibroBaratos, L.Costo FROM Libro L INNER JOIN Pais P ON L.IdPais = P.IdPais WHERE P.Nombre = 'Mexico' ORDER BY L.Costo;
SELECT L.Titulo, A.Nombre, G.Descripcion, L.Costo 
	FROM Autor A JOIN Libro L ON L.IdAutor = A.IdAutor JOIN Generos G ON G.IdGenero = L.IdGenero WHERE L.Costo < 500 
SELECT L.Titulo FROM Libro L INNER JOIN Autor A ON A.IdAutor = L.IdAutor WHERE A.Nombre = 'Fernando' ORDER BY L.Titulo;
SELECT CONCAT( A.Nombre, ' ' ,A.ApPaterno, ' ', A.ApMaterno) AS 'Nombre Completo' FROM Autor A JOIN Pais P ON A.IdPais = P.IdPais WHERE P.Nombre = 'China' ORDER BY P.Nombre;
SELECT G.Descripcion, L.Fecha_Lanzamiento AS   FROM Generos G JOIN Libro L  ON G.IdGenero = L.IdGenero WHERE  DATEDIFF(DD, L.Fecha_lanzamiento, '2010-10-10') > 0;  

SELECT * FROM Libro

