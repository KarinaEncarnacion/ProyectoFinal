USE [master]
/* Karina Encarnacion Ogando
21-EIIT-1-041
0541*/

GO
/****** Object:  Database [KeoCompany]    Script Date: 18/08/2022 06:48:52 p.m. ******/
CREATE DATABASE [KeoCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KeoCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KeoCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KeoCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KeoCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KeoCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KeoCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KeoCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KeoCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KeoCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KeoCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KeoCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [KeoCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KeoCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KeoCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KeoCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KeoCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KeoCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KeoCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KeoCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KeoCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KeoCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KeoCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KeoCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KeoCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KeoCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KeoCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KeoCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KeoCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KeoCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KeoCompany] SET  MULTI_USER 
GO
ALTER DATABASE [KeoCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KeoCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KeoCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KeoCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KeoCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KeoCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KeoCompany] SET QUERY_STORE = OFF
GO
USE [KeoCompany]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[CiudadId] [int] NOT NULL,
	[NombreCiudad] [varchar](25) NOT NULL,
	[CodCiudad] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases](
	[ClaseId] [int] NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Clases] PRIMARY KEY CLUSTERED 
(
	[ClaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinos]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinos](
	[DestinoId] [int] NOT NULL,
	[NumAeropuerto] [varchar](10) NOT NULL,
	[CiudadId] [int] NOT NULL,
	[CodCiudad] [int] NOT NULL,
 CONSTRAINT [PK_Destinos] PRIMARY KEY CLUSTERED 
(
	[DestinoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origenes]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origenes](
	[OrigenId] [int] NOT NULL,
	[NumAeropuerto] [varchar](10) NOT NULL,
	[CiudadId] [int] NOT NULL,
	[CodCiudad] [int] NOT NULL,
 CONSTRAINT [PK_Origenes] PRIMARY KEY CLUSTERED 
(
	[OrigenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajeros]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajeros](
	[PasajeroId] [int] NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[NumPasaporte] [varchar](12) NOT NULL,
	[Edad] [int] NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[DestinoId] [int] NOT NULL,
	[VueloId] [int] NOT NULL,
 CONSTRAINT [PK_Pasajeros] PRIMARY KEY CLUSTERED 
(
	[PasajeroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajes]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajes](
	[PasajeId] [int] NOT NULL,
	[ClaseId] [int] NOT NULL,
	[Asiento] [varchar](10) NOT NULL,
	[Costo] [float] NOT NULL,
	[PasajeroId] [int] NOT NULL,
	[VueloId] [int] NOT NULL,
 CONSTRAINT [PK_Pasajes] PRIMARY KEY CLUSTERED 
(
	[PasajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 18/08/2022 06:48:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[VueloId] [int] NOT NULL,
	[Capacidad] [int] NOT NULL,
	[ModeloAvion] [varchar](10) NOT NULL,
	[OrigenId] [int] NOT NULL,
	[DestinoId] [int] NOT NULL,
 CONSTRAINT [PK_Vuelos] PRIMARY KEY CLUSTERED 
(
	[VueloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (1, N'Puerto Plata', N'PP809')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (2, N'Santiago', N'SG670')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (3, N'Barahona', N'BH783')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (4, N'Moca', N'MC269')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (5, N'San Juan', N'SJ109')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (6, N'Elias Piña', N'EP194')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (7, N'Azua', N'AZ723')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (8, N'Punta Cana', N'PC287')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (9, N'Samana', N'SM762')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (10, N'Dajabon', N'DJ237')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (11, N'Nagua', N'NG287')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (12, N'Santo Domingo', N'SD653')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (13, N'Pedernales', N'PD298')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (14, N'Valverde', N'VV275')
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [CodCiudad]) VALUES (15, N'La Romana', N'LR245')
GO
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (1, N'Primera Clase')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (2, N'Ejecutiva')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (3, N'Premium')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (4, N'Business')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (5, N'Economica')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (6, N'Turistica')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (7, N'Clase Q')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (8, N'Clase S')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (9, N'Clase B')
INSERT [dbo].[Clases] ([ClaseId], [Nombre]) VALUES (10, N'Regular')
GO
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (201, N'QLO', 1, 1)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (202, N'PQF', 15, 15)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (203, N'CFD', 15, 15)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (204, N'QDF', 2, 2)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (205, N'IJR', 7, 7)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (206, N'SDC', 10, 10)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (207, N'MRD', 8, 8)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (208, N'BHG', 13, 13)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (209, N'QKB', 10, 10)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (210, N'BZX', 12, 12)
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (211, N'WBG', 6, 6)
GO
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (201, N'CDF', 2, 2)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (202, N'WSD', 3, 3)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (203, N'WDR', 4, 4)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (204, N'IDR', 5, 5)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (205, N'OLD', 6, 6)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (206, N'TGF', 7, 7)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (207, N'LVF', 10, 10)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (208, N'KEO', 9, 9)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (209, N'ELO', 15, 15)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (210, N'MIT', 11, 11)
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [CiudadId], [CodCiudad]) VALUES (211, N'PLO', 1, 1)
GO
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (1, N'Juana', N'Perez', N'WED290', 30, N'8094567823', 201, 1)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (2, N'Adan ', N'Ramirez', N'QSD285', 26, N'8290541893', 202, 2)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (3, N'Walder', N'Cuevas', N'XWD239', 20, N'8498761098', 203, 3)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (4, N'Nueva', N'Luna', N'BYD246', 45, N'8094567128', 204, 4)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (5, N'Martina', N'Mendez', N'CGD459', 38, N'8290934587', 205, 5)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (6, N'Karina', N'Encarnacion', N'BHE209', 25, N'8096732476', 206, 6)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (7, N'Enriquez', N'Beltre', N'ENF204', 50, N'8094568230', 207, 7)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (8, N'Kelvin', N'Mendez', N'EWB278', 48, N'8094561239', 208, 8)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (9, N'Candida', N'Valenzuela', N'DFB298', 27, N'8093457621', 209, 9)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (10, N'Alan', N'Sanchez', N'VFS201', 22, N'8097456729', 210, 10)
INSERT [dbo].[Pasajeros] ([PasajeroId], [Nombre], [Apellido], [NumPasaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (11, N'Yoel', N'Angomas', N'YAV284', 21, N'8094567218', 211, 11)
GO
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (1, 1, N'FD23', 12500.98, 1, 1)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (2, 7, N'AS34', 2560, 2, 2)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (3, 2, N'DC21', 10456.87, 3, 3)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (4, 4, N'QS109', 8450.87, 4, 4)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (5, 2, N'CF25', 11550.78, 5, 5)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (6, 1, N'FD27', 12500.98, 6, 6)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (7, 5, N'VB', 4500.89, 7, 7)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (8, 3, N'HN278', 10350.89, 8, 8)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (9, 6, N'WD10', 3025.9, 9, 9)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (10, 10, N'VG239', 1500.56, 10, 10)
INSERT [dbo].[Pasajes] ([PasajeId], [ClaseId], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (11, 8, N'AS340', 2000.46, 11, 11)
GO
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (1, 250, N'Air Bus 31', 201, 201)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (2, 120, N'Air Bus 30', 202, 202)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (3, 190, N'Boeing 73', 203, 203)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (4, 100, N'Max 737', 204, 204)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (5, 90, N'Boeing 73', 205, 205)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (6, 110, N'Air Bus 31', 206, 206)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (7, 80, N'Air Bus 30', 207, 207)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (8, 150, N'Max 737', 208, 208)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (9, 200, N'Boeing', 209, 209)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (10, 170, N'Max 737', 210, 210)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [ModeloAvion], [OrigenId], [DestinoId]) VALUES (11, 160, N'Air Bus 30', 211, 211)
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [FK_Destinos_Ciudades] FOREIGN KEY([CiudadId])
REFERENCES [dbo].[Ciudades] ([CiudadId])
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [FK_Destinos_Ciudades]
GO
ALTER TABLE [dbo].[Origenes]  WITH CHECK ADD  CONSTRAINT [FK_Origenes_Ciudades] FOREIGN KEY([CiudadId])
REFERENCES [dbo].[Ciudades] ([CiudadId])
GO
ALTER TABLE [dbo].[Origenes] CHECK CONSTRAINT [FK_Origenes_Ciudades]
GO
ALTER TABLE [dbo].[Pasajeros]  WITH CHECK ADD  CONSTRAINT [FK_Pasajeros_Destinos] FOREIGN KEY([DestinoId])
REFERENCES [dbo].[Destinos] ([DestinoId])
GO
ALTER TABLE [dbo].[Pasajeros] CHECK CONSTRAINT [FK_Pasajeros_Destinos]
GO
ALTER TABLE [dbo].[Pasajeros]  WITH CHECK ADD  CONSTRAINT [FK_Pasajeros_Vuelos] FOREIGN KEY([VueloId])
REFERENCES [dbo].[Vuelos] ([VueloId])
GO
ALTER TABLE [dbo].[Pasajeros] CHECK CONSTRAINT [FK_Pasajeros_Vuelos]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Clases] FOREIGN KEY([ClaseId])
REFERENCES [dbo].[Clases] ([ClaseId])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Clases]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Pasajeros] FOREIGN KEY([PasajeroId])
REFERENCES [dbo].[Pasajeros] ([PasajeroId])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Pasajeros]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Vuelos] FOREIGN KEY([VueloId])
REFERENCES [dbo].[Vuelos] ([VueloId])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Vuelos]
GO
ALTER TABLE [dbo].[Vuelos]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Destinos] FOREIGN KEY([DestinoId])
REFERENCES [dbo].[Destinos] ([DestinoId])
GO
ALTER TABLE [dbo].[Vuelos] CHECK CONSTRAINT [FK_Vuelos_Destinos]
GO
ALTER TABLE [dbo].[Vuelos]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Origenes] FOREIGN KEY([OrigenId])
REFERENCES [dbo].[Origenes] ([OrigenId])
GO
ALTER TABLE [dbo].[Vuelos] CHECK CONSTRAINT [FK_Vuelos_Origenes]
GO
USE [master]
GO
ALTER DATABASE [KeoCompany] SET  READ_WRITE 
GO
