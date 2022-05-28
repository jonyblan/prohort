USE [master]
GO
/****** Object:  Database [ProhOrt-Mvp]    Script Date: 27/5/2022 03:58:56 ******/
CREATE DATABASE [ProhOrt-Mvp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProhOrt-Mvp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProhOrt-Mvp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProhOrt-Mvp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProhOrt-Mvp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProhOrt-Mvp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProhOrt-Mvp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProhOrt-Mvp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProhOrt-Mvp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProhOrt-Mvp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProhOrt-Mvp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProhOrt-Mvp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProhOrt-Mvp] SET  MULTI_USER 
GO
ALTER DATABASE [ProhOrt-Mvp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProhOrt-Mvp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProhOrt-Mvp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProhOrt-Mvp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProhOrt-Mvp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProhOrt-Mvp] SET QUERY_STORE = OFF
GO
USE [ProhOrt-Mvp]
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 27/5/2022 03:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aula](
	[IdAula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Disponibilidad] [int] NOT NULL,
 CONSTRAINT [PK_Aula] PRIMARY KEY CLUSTERED 
(
	[IdAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 27/5/2022 03:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloque](
	[IdBloque] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesor] [int] NULL,
	[IdAula] [int] NULL,
	[IdCurso] [int] NULL,
 CONSTRAINT [PK_Bloque] PRIMARY KEY CLUSTERED 
(
	[IdBloque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 27/5/2022 03:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[BloquesOcupados] [int] NOT NULL,
	[Disponibilidad] [int] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 27/5/2022 03:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Disponibilidad] [int] NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aula] ON 

INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (1, NULL, 0)
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (2, NULL, 0)
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (3, NULL, 0)
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (4, NULL, 111)
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (5, NULL, 111)
SET IDENTITY_INSERT [dbo].[Aula] OFF
GO
SET IDENTITY_INSERT [dbo].[Bloque] ON 

INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (114, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (115, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (116, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (117, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (118, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (119, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (120, 1, 2, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (121, 1, 3, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (122, 1, 4, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (123, 1, 5, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (124, 2, 4, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (125, 2, 5, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (126, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (127, 1, 2, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (128, 1, 3, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (129, 1, 4, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (130, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (131, 1, 2, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (132, 1, 3, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (133, 1, 4, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (134, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (135, 2, 2, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (136, 3, 3, 3)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (137, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (138, 2, 2, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (139, 3, 3, 3)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (140, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (141, 2, 2, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso]) VALUES (142, 3, 3, 3)
SET IDENTITY_INSERT [dbo].[Bloque] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad]) VALUES (1, N'5IA', 0, 0)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad]) VALUES (2, N'5IB', 0, 0)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad]) VALUES (3, N'5IC', 0, 0)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Disponibilidad]) VALUES (1, N'a', 0)
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Disponibilidad]) VALUES (2, N'b', 0)
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Disponibilidad]) VALUES (3, N'c', 0)
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Disponibilidad]) VALUES (4, N'd', 111)
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Disponibilidad]) VALUES (5, N'e', 111)
SET IDENTITY_INSERT [dbo].[Profesor] OFF
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Aula] FOREIGN KEY([IdAula])
REFERENCES [dbo].[Aula] ([IdAula])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Aula]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Curso]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Profesor]
GO
USE [master]
GO
ALTER DATABASE [ProhOrt-Mvp] SET  READ_WRITE 
GO
