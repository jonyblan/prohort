USE [master]
GO
/****** Object:  Database [ProhOrt-Mvp]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  User [alumno]    Script Date: 26/8/2022 11:55:40 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Anio]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  Table [dbo].[Aula]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  Table [dbo].[Bloque]    Script Date: 26/8/2022 11:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloque](
	[IdBloque] [int] IDENTITY(1,1) NOT NULL,
	[IdDia] [int] NOT NULL,
	[NumBloque] [int] NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdProfesor] [int] NOT NULL,
	[IdAula] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
 CONSTRAINT [PK_Bloque] PRIMARY KEY CLUSTERED 
(
	[IdBloque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 26/8/2022 11:55:40 ******/
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
	[BloquesDia] [int] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dia]    Script Date: 26/8/2022 11:55:40 ******/
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
	[MaxBloques] [int] NULL,
	[MinBloques] [int] NULL,
	[DiaSemana] [int] NULL,
	[IdCurso] [int] NULL,
 CONSTRAINT [PK_Dia] PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  Table [dbo].[Orientacion]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  Table [dbo].[Profesor]    Script Date: 26/8/2022 11:55:40 ******/
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
/****** Object:  Table [dbo].[ProfesorxMateria]    Script Date: 26/8/2022 11:55:40 ******/
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

INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (1, NULL, N'1111111111111111111111111')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (2, NULL, N'1111111111111111111111111')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (3, NULL, N'1111111111111111111111111')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (4, NULL, N'1111111111111111111111111')
INSERT [dbo].[Aula] ([IdAula], [Nombre], [Disponibilidad]) VALUES (5, NULL, N'1111111111111111111111111')
SET IDENTITY_INSERT [dbo].[Aula] OFF
GO
SET IDENTITY_INSERT [dbo].[Bloque] ON 

INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1484, 0, 0, 1, 1, 1, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1485, 1, 0, 1, 1, 1, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1486, 2, 0, 1, 1, 1, 3)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1487, 3, 0, 1, 1, 1, 4)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1488, 4, 0, 1, 1, 1, 5)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1489, 0, 1, 1, 1, 1, 6)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1490, 1, 1, 1, 1, 1, 7)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1491, 2, 1, 1, 1, 1, 8)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1492, 3, 1, 1, 1, 1, 9)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1493, 4, 1, 1, 1, 1, 10)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1494, 0, 2, 1, 1, 1, 11)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1495, 1, 2, 1, 1, 1, 12)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1496, 2, 2, 1, 1, 1, 13)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1497, 3, 2, 1, 1, 1, 14)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1498, 4, 2, 1, 1, 1, 15)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1499, 0, 3, 1, 1, 1, 16)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1500, 1, 3, 1, 1, 1, 17)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1501, 2, 3, 1, 1, 1, 18)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1502, 3, 3, 1, 1, 1, 19)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1503, 4, 3, 1, 1, 1, 20)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1504, 0, 0, 2, 2, 2, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1505, 1, 0, 2, 2, 2, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1506, 2, 0, 2, 2, 2, 3)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1507, 3, 0, 2, 2, 2, 4)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1508, 4, 0, 2, 2, 2, 5)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1509, 0, 1, 2, 2, 2, 6)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1510, 1, 1, 2, 2, 2, 7)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1511, 2, 1, 2, 2, 2, 8)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1512, 3, 1, 2, 2, 2, 9)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1513, 4, 1, 2, 2, 2, 10)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1514, 0, 2, 2, 2, 2, 11)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1515, 1, 2, 2, 2, 2, 12)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1516, 2, 2, 2, 2, 2, 13)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1517, 3, 2, 2, 2, 2, 14)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1518, 4, 2, 2, 2, 2, 15)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1519, 0, 3, 2, 2, 2, 16)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1520, 1, 3, 2, 2, 2, 17)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1521, 2, 3, 2, 2, 2, 18)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1522, 3, 3, 2, 2, 2, 19)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1523, 4, 3, 2, 2, 2, 20)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1524, 0, 0, 3, 3, 3, 1)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1525, 1, 0, 3, 3, 3, 2)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1526, 2, 0, 3, 3, 3, 3)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1527, 3, 0, 3, 3, 3, 4)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1528, 4, 0, 3, 3, 3, 5)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1529, 0, 1, 3, 3, 3, 6)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1530, 1, 1, 3, 3, 3, 7)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1531, 2, 1, 3, 3, 3, 8)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1532, 3, 1, 3, 3, 3, 9)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1533, 4, 1, 3, 3, 3, 10)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1534, 0, 2, 3, 3, 3, 11)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1535, 1, 2, 3, 3, 3, 12)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1536, 2, 2, 3, 3, 3, 13)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1537, 3, 2, 3, 3, 3, 14)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1538, 4, 2, 3, 3, 3, 15)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1539, 0, 3, 3, 3, 3, 16)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1540, 1, 3, 3, 3, 3, 17)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1541, 2, 3, 3, 3, 3, 18)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1542, 3, 3, 3, 3, 3, 19)
INSERT [dbo].[Bloque] ([IdBloque], [IdDia], [NumBloque], [IdCurso], [IdProfesor], [IdAula], [IdMateria]) VALUES (1543, 4, 3, 3, 3, 3, 20)
SET IDENTITY_INSERT [dbo].[Bloque] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio], [BloquesDia]) VALUES (1, N'5IA', 0, N'1111111111111111111111111', NULL, 12, 20)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio], [BloquesDia]) VALUES (2, N'5IB', 0, N'1111111111111111111111111', NULL, 12, 20)
INSERT [dbo].[Curso] ([IdCurso], [Nombre], [BloquesOcupados], [Disponibilidad], [IdOrientacion], [IdAnio], [BloquesDia]) VALUES (3, N'5IC', 0, N'1111111111111111111111111', NULL, 12, 20)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Dia] ON 

INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (2, 0, 0, 0, 0, 0, 5, 3, 1, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (3, 0, 0, 0, 0, 0, 5, 3, 1, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (4, 0, 0, 0, 0, 0, 5, 3, 1, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (6, 0, 0, 0, 0, 0, 5, 3, 2, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (7, 0, 0, 0, 0, 0, 5, 3, 2, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (8, 0, 0, 0, 0, 0, 5, 3, 2, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (9, 0, 0, 0, 0, 0, 5, 3, 3, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (10, 0, 0, 0, 0, 0, 5, 3, 3, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (11, 0, 0, 0, 0, 0, 5, 3, 3, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (12, 0, 0, 0, 0, 0, 5, 3, 4, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (13, 0, 0, 0, 0, 0, 5, 3, 4, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (14, 0, 0, 0, 0, 0, 5, 3, 4, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (15, 0, 0, 0, 0, 0, 5, 3, 5, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (16, 0, 0, 0, 0, 0, 5, 3, 5, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (17, 0, 0, 0, 0, 0, 5, 3, 5, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (18, 0, 0, 0, 0, 0, -1, -1, 6, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (19, 0, 0, 0, 0, 0, -1, -1, 6, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (20, 0, 0, 0, 0, 0, -1, -1, 6, 3)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (21, 0, 0, 0, 0, 0, -1, -1, 7, 1)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (22, 0, 0, 0, 0, 0, -1, -1, 7, 2)
INSERT [dbo].[Dia] ([IdDia], [BloquesMedios], [EntradaMax], [EntradaMin], [SalidaMax], [SalidaMin], [MaxBloques], [MinBloques], [DiaSemana], [IdCurso]) VALUES (23, 0, 0, 0, 0, 0, -1, -1, 7, 3)
SET IDENTITY_INSERT [dbo].[Dia] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (1, N'Matematica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (2, N'Lengua', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (3, N'Quimica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (4, N'Judaica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (5, N'Fuentes', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (6, N'Filosofia', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (7, N'Ingles', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (8, N'EFSI', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (9, N'DAI', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (10, N'TEI', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (11, N'Seminario', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (12, N'HistoriaDLC', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (13, N'Historia', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (14, N'Proyecto', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (15, N'Biologia', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (16, N'Fisica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (17, N'Hebreo', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (18, N'BDD', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (19, N'TallerDP', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (20, N'Etica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (21, N'Arte', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (22, N'EdFisica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (23, N'Geografia', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (24, N'Economia', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (25, N'FisicoQuimica', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (26, N'SSI', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (27, N'TI', NULL, N'111')
INSERT [dbo].[Materia] ([IdMateria], [Nombre], [Prioridad], [NumBloques]) VALUES (28, N'Imagen', NULL, N'111')
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

INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (1, N'a', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (2, N'b', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (3, N'c', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (4, N'd', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (5, N'e', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (6, N'a', NULL, N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (7, N'a', N'b', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (8, N'Gabriel', N'Stancanelli', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (9, N'a', N'Snieg', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (10, N'a', N'Turek', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (11, N'a', N'Galanterni', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (12, N'a', N'Guivisdalsky', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (13, N'Leonardo', N'Kristal', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (14, N'Maria', N'Brizuela', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (15, N'Ludmila', N'Bochatay', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (16, N'', N'Glinsky', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (17, N'', N'Faerverger', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (18, N'', N'Charnis', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (19, N'', N'Steiner', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (20, N'Patricia', N'Alegre', N'1111111111111111111111111')
INSERT [dbo].[Profesor] ([IdProfesor], [Nombre], [Apellido], [Disponibilidad]) VALUES (21, N'', N'Luna', N'1111111111111111111111111')
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
ALTER TABLE [dbo].[Dia]  WITH CHECK ADD  CONSTRAINT [FK_Dia_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Dia] CHECK CONSTRAINT [FK_Dia_Curso]
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
/****** Object:  StoredProcedure [dbo].[ConseguirBloques]    Script Date: 26/8/2022 11:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConseguirBloques]
AS
BEGIN
	SELECT Bloque.IdDia, Bloque.NumBloque, Curso.Nombre as "Curso", Profesor.Nombre as "Profesor", Aula.Nombre as "Aula", Materia.Nombre as "Materia"
	FROM Bloque
	INNER JOIN Curso ON Bloque.IdCurso = Curso.IdCurso
	INNER JOIN Profesor ON Bloque.IdProfesor = Profesor.IdProfesor
	INNER JOIN Aula ON Bloque.IdAula = Aula.IdAula
	INNER JOIN Materia ON Bloque.IdMateria = Materia.IdMateria
END
GO
USE [master]
GO
ALTER DATABASE [ProhOrt-Mvp] SET  READ_WRITE 
GO
