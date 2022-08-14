USE [master]
GO
/****** Object:  Database [KeoCompany]    Script Date: 13/08/2022 20:16:02 ******/
CREATE DATABASE [KeoCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KeoCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KeoCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KeoCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KeoCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [KeoCompany] SET  ENABLE_BROKER 
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
ALTER DATABASE [KeoCompany] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'KeoCompany', N'ON'
GO
ALTER DATABASE [KeoCompany] SET QUERY_STORE = OFF
GO
USE [KeoCompany]
GO
/****** Object:  Table [dbo].[Destinos]    Script Date: 13/08/2022 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinos](
	[DestinoId] [int] NOT NULL,
	[NumAeropuerto] [varchar](25) NOT NULL,
	[Ciudad] [varchar](25) NOT NULL,
	[CodCiudad] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[DestinoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origenes]    Script Date: 13/08/2022 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origenes](
	[OrigenId] [int] NOT NULL,
	[NumAeropuerto] [varchar](20) NOT NULL,
	[Ciudad] [varchar](25) NOT NULL,
	[CodCiudad] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Origen] PRIMARY KEY CLUSTERED 
(
	[OrigenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 13/08/2022 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[PasajeroId] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](25) NOT NULL,
	[NumPsaporte] [varchar](12) NOT NULL,
	[Edad] [int] NULL,
	[Telefono] [varchar](15) NOT NULL,
	[DestinoId] [int] NOT NULL,
	[VueloId] [int] NOT NULL,
 CONSTRAINT [PK_Pasajeros] PRIMARY KEY CLUSTERED 
(
	[PasajeroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajes]    Script Date: 13/08/2022 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajes](
	[PasajeId] [int] NOT NULL,
	[Clase] [varchar](25) NOT NULL,
	[Asiento] [varchar](10) NOT NULL,
	[Costo] [float] NOT NULL,
	[PasajeroId] [int] NOT NULL,
	[VueloId] [int] NOT NULL,
 CONSTRAINT [PK_Pasaje] PRIMARY KEY CLUSTERED 
(
	[PasajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 13/08/2022 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[VueloId] [int] NOT NULL,
	[Capacidad] [int] NULL,
	[modeloAvion] [varchar](25) NULL,
	[OrigenId] [int] NULL,
	[DestinoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VueloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (1, N'234586', N'Puerto Plata', N'CDG')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (2, N'768943', N'Elias Piña', N'CGN')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (3, N'987453', N'Barahona', N'CLO')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (4, N'235896', N'Punta Cana', N'CLX')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (5, N'346729', N'Santo Domingo', N'EAP')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (6, N'986535', N'San Juan', N'EDI')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (7, N'875495', N'San Cristobal', N'EPA')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (8, N'975336', N'Azua', N'ESR')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (9, N'975544', N'Pedernales', N'KGD')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (10, N'357467', N'Dajabon', N'KEF')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (11, N'683939', N'Moca', N'MCS')
INSERT [dbo].[Destinos] ([DestinoId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (12, N'778645', N'Santiago', N'RAK')
GO
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (1, N'786549', N'Moca', N'KLB')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (2, N'086547', N'Santiago', N'POJ')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (3, N'978787', N'Dajabon', N'UNF')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (4, N'977689', N'Pedernales', N'QWE')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (5, N'987940', N'Azua', N'TRY')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (6, N'245368', N'San Cristobal', N'HKG')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (7, N'978432', N'San Juan', N'PNR')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (8, N'757984', N'Santo Domingo', N'SLQ')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (9, N'907659', N'Punta Cana', N'LQS')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (10, N'135798', N'Barahona', N'TNH')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (11, N'368292', N'Elias Piña', N'GTY')
INSERT [dbo].[Origenes] ([OrigenId], [NumAeropuerto], [Ciudad], [CodCiudad]) VALUES (12, N'868392', N'Puerto Plata', N'NIA')
GO
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (1, N'Elibel', N'Beltre Luna', N'KLC456289', 20, N'8295431628', 2, 1)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (2, N'Kelvin', N'Martinez', N'LBT986580', 25, N'8097681245', 12, 3)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (3, N'Enrique', N'Ramirez', N'ERK987530', 30, N'8490982376', 10, 4)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (4, N'Andiu', N'Montero', N'JLU983456', 18, N'8097682398', 9, 5)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (5, N'Elena', N'Encarnacion', N'AMV568712', 22, N'8494597632', 5, 2)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (6, N'Lya', N'Santana', N'HJK986056', 19, N'8298764530', 7, 6)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (7, N'Katy', N'Ogando', N'UAL875018', 25, N'8095642910', 1, 10)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (8, N'Agustina', N'Pineda', N'K097867', 56, N'8290981547', 8, 9)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (9, N'Yunior', N'Casanovas', N'RD89769', 30, N'8498761209', 11, 8)
INSERT [dbo].[Pasajero] ([PasajeroId], [Nombre], [Apellido], [NumPsaporte], [Edad], [Telefono], [DestinoId], [VueloId]) VALUES (10, N'Karolay', N'De Oleo', N'RD896538', 28, N'8095436890', 4, 7)
GO
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (1, N'Turistica', N'2B', 5000, 1, 2)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (2, N'Ejecutiva', N'5A', 9000, 3, 1)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (3, N'Premium', N'4F', 7000, 2, 3)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (4, N'Ejecutiva', N'3C', 9000, 5, 4)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (5, N'Premium', N'12K', 7000, 4, 5)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (6, N'Turistica', N'8H', 5000, 6, 7)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (7, N'Turistica', N'9M', 5000, 7, 6)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (8, N'Ejecutiva', N'6S', 9000, 6, 7)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (9, N'Premium', N'4K', 7000, 8, 9)
INSERT [dbo].[Pasajes] ([PasajeId], [Clase], [Asiento], [Costo], [PasajeroId], [VueloId]) VALUES (10, N'Turistica', N'8L', 5000, 9, 8)
GO
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (1, 250, N'Airbus 319', 1, 1)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (2, 100, N'Airbus 330', 2, 2)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (3, 95, N'Boeing 737', 3, 3)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (4, 200, N'Max 737', 4, 4)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (5, 150, N'Airbus', 5, 5)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (6, 120, N'Boeing', 6, 6)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (7, 180, N'Airbus 330', 7, 7)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (8, 175, N'Airbus 600', 8, 8)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (9, 130, N'Max 737', 9, 9)
INSERT [dbo].[Vuelos] ([VueloId], [Capacidad], [modeloAvion], [OrigenId], [DestinoId]) VALUES (10, 180, N' Airbus 330', 10, 10)
GO
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Destinos] FOREIGN KEY([DestinoId])
REFERENCES [dbo].[Destinos] ([DestinoId])
GO
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Destinos]
GO
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Vuelos] FOREIGN KEY([VueloId])
REFERENCES [dbo].[Vuelos] ([VueloId])
GO
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Vuelos]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Pasajero] FOREIGN KEY([PasajeroId])
REFERENCES [dbo].[Pasajero] ([PasajeroId])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Pasajero]
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
