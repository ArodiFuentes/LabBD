CREATE PROCEDURE LibrosA
	@autor varchar(50)
		AS SELECT Titulo, IdEditorial, Costo
			FROM Libro
				WHERE IdAutor = @autor;


EXEC LibrosA '1719804';

CREATE PROCEDURE LibrosAE
	@autor varchar(50),
	@editorial varchar (30)
		AS SELECT Titulo, Costo
			FROM Libro
				WHERE IdAutor = @autor and IdEditorial=@editorial;
EXEC LibrosAE '1719804', '3';

CREATE PROCEDURE LibrosAE2
	@autor varchar (15) = '1953449',
	@editorial varchar (10) = '15'
	AS SELECT Titulo, Autor, Editorial, Costo
		FROM Libros	
			WHERE Autor = @autor and Editorial = @editorial;


CREATE PROC LibroFecha1
	@titulo varchar (50)
	AS SELECT Titulo, Fecha_Lanzamiento
		FROM Libro
			WHERE Titulo like @titulo

EXEC LibroFecha1'If I Stay';

CREATE FUNCTION dbo.f1 (@V1 FLOAT,@V2 FLOAT)

	RETURNS FLOAT 
		AS BEGIN
			RETURN @V1 + @V2
END
GO
