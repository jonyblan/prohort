USE [master]
GO
/****** Object:  Database [ProhOrt-Mvp]    Script Date: 24/8/2022 13:05:00 ******/
CREATE DATABASE [ProhOrt-Mvp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProhOrt-Mvp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProhOrt-Mvp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProhOrt-Mvp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProhOrt-Mvp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'ProhOrt-Mvp', N'ON'
GO
ALTER DATABASE [ProhOrt-Mvp] SET QUERY_STORE = OFF
GO
USE [ProhOrt-Mvp]
GO
/****** Object:  User [alumno]    Script Date: 24/8/2022 13:05:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Anio]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anio](
	[IdAnio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[CargaHoraria] [int] NULL,
 CONSTRAINT [PK_Anio] PRIMARY KEY CLUSTERED 
(
	[IdAnio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aula](
	[IdAula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Disponibilidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Aula] PRIMARY KEY CLUSTERED 
(
	[IdAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloque](
	[IdBloque] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesor] [int] NULL,
	[IdAula] [int] NULL,
	[IdCurso] [int] NULL,
	[IdMateria] [int] NULL,
 CONSTRAINT [PK_Bloque] PRIMARY KEY CLUSTERED 
(
	[IdBloque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[BloquesOcupados] [int] NULL,
	[Disponibilidad] [varchar](50) NULL,
	[IdOrientacion] [int] NULL,
	[IdAnio] [int] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoxSemana]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoxSemana](
	[IdCurso] [int] NULL,
	[IdSemana] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dia]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dia](
	[IdDia] [int] IDENTITY(1,1) NOT NULL,
	[BloquesMedios] [bit] NULL,
	[EntradaMax] [int] NULL,
	[EntradaMin] [int] NULL,
	[SalidaMax] [int] NULL,
	[SalidaMin] [int] NULL,
	[IdSemana] [int] NULL,
 CONSTRAINT [PK_Dia] PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Prioridad] [int] NULL,
	[NumBloques] [varchar](50) NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orientacion]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orientacion](
	[IdOrientacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
 CONSTRAINT [PK_Orientacion] PRIMARY KEY CLUSTERED 
(
	[IdOrientacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NULL,
	[Disponibilidad] [varchar](50) NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfesorxMateria]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesorxMateria](
	[IdProfesor] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
 CONSTRAINT [PK_ProfesorxMateria] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC,
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semana]    Script Date: 24/8/2022 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semana](
	[IdSemana] [int] IDENTITY(1,1) NOT NULL,
	[HorarioEntradaMax] [int] NULL,
	[HorarioEntradaMin] [int] NULL,
	[HorarioSalidaMax] [int] NULL,
	[HorarioSalidaMin] [int] NULL,
 CONSTRAINT [PK_Semana] PRIMARY KEY CLUSTERED 
(
	[IdSemana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anio] ON 

INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (1, N'1', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (2, N'2', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (3, N'3', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (4, N'4', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (5, N'5', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (6, N'6', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (7, N'7', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (8, N'8', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (9, N'9', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (10, N'10', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (11, N'11', 0)
INSERT [dbo].[Anio] ([IdAnio], [Nombre], [CargaHoraria]) VALUES (12, N'12', 0)
SET IDENTITY_INSERT [dbo].[Anio] OFF
GO
SET IDENTITY_INSERT [dbo].[Aula] ON 

INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (1, NULL, N'0')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (2, NULL, N'0')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (3, NULL, N'0')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (4, NULL, N'0')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (5, NULL, N'0')
SET IDENTITY_INSERT [dbo].[Aula] OFF
GO
SET IDENTITY_INSERT [dbo].[Bloque] ON 

INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (114, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (115, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (116, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (117, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (118, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (119, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (120, 1, 2, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (121, 1, 3, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (122, 1, 4, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (123, 1, 5, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (124, 2, 4, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (125, 2, 5, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (126, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (127, 1, 2, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (128, 1, 3, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (129, 1, 4, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (130, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (131, 1, 2, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (132, 1, 3, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (133, 1, 4, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (134, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (135, 2, 2, 2, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (136, 3, 3, 3, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (137, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (138, 2, 2, 2, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (139, 3, 3, 3, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (140, 1, 1, 1, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (141, 2, 2, 2, NULL)
INSERT [dbo].[Bloque] ([IdBloque], [IdProfesor], [IdAula], [IdCurso], [IdMateria]) VALUES (142, 3, 3, 3, NULL)
SET IDENTITY_INSERT [dbo].[Bloque] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio]) VALUES (1, N'5IA', 0, N'0', NULL, 12)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio]) VALUES (2, N'5IB', 0, N'0', NULL, 12)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio]) VALUES (3, N'5IC', 0, N'0', NULL, 12)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (1, N'Matematica', NULL, N'252')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (2, N'Lengua', NULL, N'3')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (3, N'Quimica', NULL, N'2')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (4, N'Judaica', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (5, N'Fuentes', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (6, N'Filosofia', NULL, N'3')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (7, N'Ingles', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (8, N'EFSI', NULL, N'4')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (9, N'DAI', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (10, N'TEI', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (11, N'Seminario', NULL, N'3')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (12, N'HistoriaDLC', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (13, N'Historia', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (14, N'Proyecto', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (15, N'Biologia', NULL, N'3')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (16, N'Fisica', NULL, N'25')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (17, N'Hebreo', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (18, N'BDD', NULL, N'85')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (19, N'TallerDP', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (20, N'Etica', NULL, N'2')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (21, N'Arte', NULL, N'14')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (22, N'EdFisica', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (23, N'Geografia', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (24, N'Economia', NULL, N'2')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (25, N'FisicoQuimica', NULL, N'3')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (26, N'SSI', NULL, N'5')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (27, N'TI', NULL, N'1')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (28, N'Imagen', NULL, N'2')
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[Orientacion] ON 

INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (1, N'Informatica')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (2, N'Gestion')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (3, N'Mecatronica')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (4, N'Construcciones')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (5, N'Produccion Musical')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (6, N'Medios')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (7, N'TIC')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (8, N'Diseño Industrial')
INSERT [dbo].[Orientacion] ([IdOrientacion], [Nombre]) VALUES (9, N'Quimica')
SET IDENTITY_INSERT [dbo].[Orientacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (1, N'a', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (2, N'b', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (3, N'c', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (4, N'd', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (5, N'e', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (6, N'a', NULL, N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (7, N'a', N'b', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (8, N'Gabriel', N'Stancanelli', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (9, N'a', N'Snieg', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (10, N'a', N'Turek', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (11, N'a', N'Galanterni', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (12, N'a', N'Guivisdalsky', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (13, N'Leonardo', N'Kristal', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (14, N'Maria', N'Brizuela', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (15, N'Ludmila', N'Bochatay', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (16, N'', N'Glinsky', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (17, N'', N'Faerverger', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (18, N'', N'Charnis', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (19, N'', N'Steiner', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (20, N'Patricia', N'Alegre', N'0')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (21, N'', N'Luna', N'0')
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
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Materia]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Profesor]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Anio] FOREIGN KEY([IdAnio])
REFERENCES [dbo].[Anio] ([IdAnio])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Anio]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Orientacion] FOREIGN KEY([IdOrientacion])
REFERENCES [dbo].[Orientacion] ([IdOrientacion])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Orientacion]
GO
ALTER TABLE [dbo].[CursoxSemana]  WITH CHECK ADD  CONSTRAINT [FK_CursoxSemana_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoxSemana] CHECK CONSTRAINT [FK_CursoxSemana_Curso]
GO
ALTER TABLE [dbo].[CursoxSemana]  WITH CHECK ADD  CONSTRAINT [FK_CursoxSemana_Semana] FOREIGN KEY([IdSemana])
REFERENCES [dbo].[Semana] ([IdSemana])
GO
ALTER TABLE [dbo].[CursoxSemana] CHECK CONSTRAINT [FK_CursoxSemana_Semana]
GO
ALTER TABLE [dbo].[Dia]  WITH CHECK ADD  CONSTRAINT [FK_Dia_Semana] FOREIGN KEY([IdSemana])
REFERENCES [dbo].[Semana] ([IdSemana])
GO
ALTER TABLE [dbo].[Dia] CHECK CONSTRAINT [FK_Dia_Semana]
GO
ALTER TABLE [dbo].[ProfesorxMateria]  WITH CHECK ADD  CONSTRAINT [FK_ProfesorxMateria_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[ProfesorxMateria] CHECK CONSTRAINT [FK_ProfesorxMateria_Materia]
GO
ALTER TABLE [dbo].[ProfesorxMateria]  WITH CHECK ADD  CONSTRAINT [FK_ProfesorxMateria_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[ProfesorxMateria] CHECK CONSTRAINT [FK_ProfesorxMateria_Profesor]
GO
USE [master]
GO
ALTER DATABASE [ProhOrt-Mvp] SET  READ_WRITE 
GO
