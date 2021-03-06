USE [Library]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Pais]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Generos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Editorial]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Autor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
ALTER TABLE [dbo].[Editorial] DROP CONSTRAINT IF EXISTS [FK_Editorial_Pais]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
ALTER TABLE [dbo].[Autor] DROP CONSTRAINT IF EXISTS [FK_Autor_Pais]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP TABLE IF EXISTS [dbo].[Pais]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP TABLE IF EXISTS [dbo].[Libro]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP TABLE IF EXISTS [dbo].[Generos]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP TABLE IF EXISTS [dbo].[Editorial]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP TABLE IF EXISTS [dbo].[Autor]
GO
USE [master]
GO
/****** Object:  Database [Library]    Script Date: 10/23/2018 3:26:54 PM ******/
DROP DATABASE IF EXISTS [Library]
GO
/****** Object:  Database [Library]    Script Date: 10/23/2018 3:26:54 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 10/23/2018 3:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[ApPaterno] [varchar](20) NULL,
	[ApMaterno] [varchar](20) NULL,
	[IdPais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 10/23/2018 3:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[IdPais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 10/23/2018 3:26:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 10/23/2018 3:26:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[IdGenero] [int] NULL,
	[IdAutor] [int] NULL,
	[IdEditorial] [int] NULL,
	[Fecha_lanzamiento] [smalldatetime] NULL,
	[IdPais] [int] NULL,
	[Costo] [money] NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/23/2018 3:26:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Codigo_Pais] [varchar](4) NULL,
	[Nacionalidad] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1719804, N'Fernando', N'Reyes', N'Lopez', 1)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953437, N'Mauricio', N'Gonzalez', N'Suarez', 2)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953438, N'Cesar', N'Gomez', N'Lopez', 3)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953439, N'Ramiro', N'Valenzuela', N'Castro', 4)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953440, N'Fernando', N'Reyes', N'Lopez', 5)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953441, N'Eduardo', N'Gonzalez', N'Calleja', 6)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953442, N'Arodi', N'Fuentes', N'Montelongo', 7)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953443, N'Berta', N'Alvarez', N'Miranda', 8)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953444, N'Julian', N'Sanchez', N'Gutierrez', 9)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953445, N'Mauro', N'Ochoa', N'Ochoa', 10)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953446, N'Roberto', N'Perea', N'Ibarra', 11)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953447, N'Jose', N'Ramirez', N'Gonzalez', 12)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953448, N'Belen', N'Martinez', N'Diaz', 13)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953449, N'Juana', N'Vazquez', N'Marin', 14)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953450, N'Carlos', N'Cuahutemoc', N'Sanchez', 15)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [ApPaterno], [ApMaterno], [IdPais]) VALUES (1953451, N'Alfredo', N'Juarez', N'Perez', 15)
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (1, N'Santillana', 1)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (2, N'Lumen', 11)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (3, N'Acantilado', 13)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (4, N'Alba', 9)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (5, N'Akal', 5)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (6, N'Critica', 4)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (7, N'Galaxia', 3)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (8, N'Gredos', 11)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (9, N'Herder', 13)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (10, N'Nevski', 9)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (11, N'Satori', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (12, N'Taschen', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (13, N'Valdemar', 5)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (14, N'Gredos', 11)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (15, N'Herder', 13)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (16, N'Nevski', 9)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (17, N'Satori', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (18, N'Taschen', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (19, N'Valdemar', 5)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (20, N'Gredos', 11)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (21, N'Herder', 13)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (22, N'Nevski', 9)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (23, N'Satori', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (24, N'Taschen', 14)
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre], [IdPais]) VALUES (25, N'Valdemar', 5)
SET IDENTITY_INSERT [dbo].[Editorial] OFF
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (1, N'Drama')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (2, N'Biografias')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (3, N'Ciencia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (4, N'Filosofia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (5, N'Gastronomia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (6, N'Historia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (7, N'Musica')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (8, N'Moda')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (9, N'Poesia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (10, N'Psicologia')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (11, N'Religion')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (12, N'Romance')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (13, N'Ficcion')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (14, N'Accion')
INSERT [dbo].[Generos] ([IdGenero], [Descripcion]) VALUES (15, N'Novela')
SET IDENTITY_INSERT [dbo].[Generos] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (3, N'The little Prince', 1, 1719804, 3, CAST(N'2010-10-20T00:00:00' AS SmallDateTime), 10, 600.0000, 200)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (4, N'Historias de Nuevo Orleans', 1, 1953437, 6, CAST(N'1985-05-02T00:00:00' AS SmallDateTime), 11, 675.0000, 20)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (5, N'El libro tachado', 3, 1953444, 3, CAST(N'2012-11-25T00:00:00' AS SmallDateTime), 6, 375.0000, 261)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (6, N'Histologia Basica: Texto y atlas', 6, 1953439, 20, CAST(N'2005-06-03T00:00:00' AS SmallDateTime), 1, 1011.0000, 200)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (7, N'If I Stay', 15, 1953441, 22, CAST(N'1989-03-16T00:00:00' AS SmallDateTime), 2, 172.0000, 155)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (8, N'Musica Nocturna', 7, 1953446, 13, CAST(N'2001-01-20T00:00:00' AS SmallDateTime), 9, 370.0000, 35)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (9, N'Divertimento', 15, 1953450, 9, CAST(N'1949-07-18T00:00:00' AS SmallDateTime), 7, 152.0000, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (10, N'Esto no es musica', 15, 1953451, 7, CAST(N'2016-10-26T00:00:00' AS SmallDateTime), 1, 555.0000, 260)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (11, N'Cuestiones de teoría del conocimiento', 4, 1953448, 9, CAST(N'2013-09-06T00:00:00' AS SmallDateTime), 12, 856.0000, 360)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (12, N'Migajas filosóficas', 4, 1953440, 23, CAST(N'2012-02-26T00:00:00' AS SmallDateTime), 4, 415.0000, 200)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (13, N'Psicologia cognitiva y de la construccion', 10, 1953449, 14, CAST(N'2016-07-16T00:00:00' AS SmallDateTime), 1, 520.0000, 290)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (14, N'Transtornos Psicologicos', 10, 1953449, 15, CAST(N'1997-10-20T00:00:00' AS SmallDateTime), 5, 553.0000, 36)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (15, N'Intervencion de la psicologia en la empresa', 10, 1953449, 15, CAST(N'2009-12-03T00:00:00' AS SmallDateTime), 5, 448.0000, 96)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (16, N'Teorias de la personalidad', 10, 1953448, 15, CAST(N'2013-04-03T00:00:00' AS SmallDateTime), 1, 448.0000, 200)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (17, N'El gran libro botanero', 5, 1719804, 1, CAST(N'2012-06-20T00:00:00' AS SmallDateTime), 1, 228.0000, 210)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (18, N'Manual de gastronomia ', 5, 1953439, 1, CAST(N'2015-03-15T00:00:00' AS SmallDateTime), 1, 140.0000, 10)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (19, N'El atomo', 3, 1953448, 9, CAST(N'2010-06-29T00:00:00' AS SmallDateTime), 12, 595.0000, 600)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (21, N'El poder de la ropa', 8, 1953451, 6, CAST(N'2008-08-11T00:00:00' AS SmallDateTime), 2, 305.0000, 15)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (22, N'El libro del estilo', 8, 1953445, 6, CAST(N'2010-03-20T00:00:00' AS SmallDateTime), 8, 325.0000, 66)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (23, N'Diseño de accesorios', 8, 1953446, 6, CAST(N'2005-06-23T00:00:00' AS SmallDateTime), 9, 600.0000, 14)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (24, N'El Zelote', 2, 1953440, 2, CAST(N'2008-07-08T00:00:00' AS SmallDateTime), 10, 340.0000, 500)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (25, N'Pablo Escobar Infraganti', 2, 1719804, 9, CAST(N'2010-09-19T00:00:00' AS SmallDateTime), 12, 220.0000, 105)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdGenero], [IdAutor], [IdEditorial], [Fecha_lanzamiento], [IdPais], [Costo], [Stock]) VALUES (30, N'Secretos del Pasado', 13, 1953441, 10, CAST(N'2007-10-20T00:00:00' AS SmallDateTime), 13, 209.0000, 200)
SET IDENTITY_INSERT [dbo].[Libro] OFF
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (1, N'Mexico', N'Mx', N'Mexicano')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (2, N'Estados Unidos', N'EU', N'Estadounidense')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (3, N'Puerto Rico', N'PR', N'Puertoricense')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (4, N'Peru', N'PE', N'Peruano')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (5, N'Portugal', N'PT', N'Portugues')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (6, N'Japon', N'JP', N'Japones')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (7, N'Italia', N'IT', N'Italiano')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (8, N'Croacia', N'HR', N'Croata')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (9, N'Alemania', N'GER', N'Aleman')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (10, N'Francia', N'FRA', N'Frances')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (11, N'Dinamarca', N'DEN', N'Danes')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (12, N'Argentina', N'ARG', N'Argentino')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (13, N'Brasil', N'BRA', N'Brasileño')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (14, N'China', N'RPC', N'Chino')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Codigo_Pais], [Nacionalidad]) VALUES (15, N'Australia', N'AUS', N'Australiano')
SET IDENTITY_INSERT [dbo].[Pais] OFF
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Autor] CHECK CONSTRAINT [FK_Autor_Pais]
GO
ALTER TABLE [dbo].[Editorial]  WITH CHECK ADD  CONSTRAINT [FK_Editorial_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Editorial] CHECK CONSTRAINT [FK_Editorial_Pais]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Autor]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([IdGenero])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Generos]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Pais]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
