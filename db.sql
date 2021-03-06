USE [master]
GO
/****** Object:  Database [ArmClothes]    Script Date: 10.08.2021 12:30:45 ******/
CREATE DATABASE [ArmClothes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArmClothes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArmClothes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ArmClothes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArmClothes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ArmClothes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArmClothes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArmClothes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArmClothes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArmClothes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArmClothes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArmClothes] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArmClothes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArmClothes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArmClothes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArmClothes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArmClothes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArmClothes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArmClothes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArmClothes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArmClothes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArmClothes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArmClothes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArmClothes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArmClothes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArmClothes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArmClothes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArmClothes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArmClothes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArmClothes] SET RECOVERY FULL 
GO
ALTER DATABASE [ArmClothes] SET  MULTI_USER 
GO
ALTER DATABASE [ArmClothes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArmClothes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArmClothes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArmClothes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArmClothes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArmClothes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ArmClothes', N'ON'
GO
ALTER DATABASE [ArmClothes] SET QUERY_STORE = OFF
GO
USE [ArmClothes]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Data] [varbinary](max) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TypeId] [int] NULL,
	[ImageId] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[CurrentCount] [int] NULL,
	[MinimalCount] [int] NULL,
	[PocketCount] [int] NULL,
	[UnitId] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NULL,
	[MaterialId] [int] NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierType]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SuplierType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TypeId] [int] NULL,
	[INN] [nvarchar](50) NULL,
	[Raiting] [int] NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 10.08.2021 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (101, N'Резина 1x3', 1, NULL, CAST(8334.00 AS Decimal(18, 2)), 77, 44, 3, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (102, N'Краска 2x3', 2, NULL, CAST(24447.00 AS Decimal(18, 2)), 414, 33, 8, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (103, N'Резина 3x3', 1, NULL, CAST(14751.00 AS Decimal(18, 2)), 727, 46, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (104, N'Краска 1x4', 2, NULL, CAST(52716.00 AS Decimal(18, 2)), 576, 7, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (105, N'Резина 1x37', 1, NULL, CAST(1053.00 AS Decimal(18, 2)), 110, 47, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (106, N'Резина 2x0', 1, NULL, CAST(46084.00 AS Decimal(18, 2)), 129, 11, 3, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (107, N'Резина 1x14', 1, NULL, CAST(14063.00 AS Decimal(18, 2)), 7, 9, 5, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (108, N'Силикон 3x33', 3, NULL, CAST(34740.00 AS Decimal(18, 2)), 687, 45, 7, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (109, N'Резина 3x22', 1, NULL, CAST(27626.00 AS Decimal(18, 2)), 672, 14, 6, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (110, N'Резина 2x1', 1, NULL, CAST(14226.00 AS Decimal(18, 2)), 886, 7, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (111, N'Краска 1x2', 2, NULL, CAST(48813.00 AS Decimal(18, 2)), 801, 28, 9, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (112, N'Резина 2x3', 1, NULL, CAST(52328.00 AS Decimal(18, 2)), 50, 11, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (113, N'Силикон 1x27', 3, NULL, CAST(3486.00 AS Decimal(18, 2)), 950, 14, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (114, N'Краска 3x14', 2, NULL, CAST(38060.00 AS Decimal(18, 2)), 34, 13, 5, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (115, N'Краска 2x5', 2, NULL, CAST(24855.00 AS Decimal(18, 2)), 542, 32, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (116, N'Силикон 3x15', 3, NULL, CAST(40057.00 AS Decimal(18, 2)), 856, 17, 7, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (117, N'Силикон 3x39', 3, NULL, CAST(34438.00 AS Decimal(18, 2)), 858, 8, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (118, N'Силикон 1x2', 3, NULL, CAST(34120.00 AS Decimal(18, 2)), 469, 50, 7, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (119, N'Силикон 3x28', 3, NULL, CAST(37171.00 AS Decimal(18, 2)), 92, 47, 7, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (120, N'Силикон 0x18', 3, NULL, CAST(15243.00 AS Decimal(18, 2)), 631, 8, 2, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (121, N'Силикон 0x0', 3, NULL, CAST(34974.00 AS Decimal(18, 2)), 929, 37, 5, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (122, N'Краска 3x31', 2, NULL, CAST(30698.00 AS Decimal(18, 2)), 365, 32, 3, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (123, N'Резина 1x5', 1, NULL, CAST(42602.00 AS Decimal(18, 2)), 481, 11, 2, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (124, N'Силикон 0x12', 3, NULL, CAST(5588.00 AS Decimal(18, 2)), 610, 12, 6, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (125, N'Силикон 3x2', 3, NULL, CAST(34673.00 AS Decimal(18, 2)), 863, 32, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (126, N'Резина 1x9', 1, NULL, CAST(10774.00 AS Decimal(18, 2)), 587, 48, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (127, N'Краска 3x35', 2, NULL, CAST(6825.00 AS Decimal(18, 2)), 479, 31, 4, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (128, N'Краска 2x31', 2, NULL, CAST(24610.00 AS Decimal(18, 2)), 771, 14, 1, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (129, N'Резина 3x25', 1, NULL, CAST(1452.00 AS Decimal(18, 2)), 199, 5, 6, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (130, N'Краска 4x0', 2, NULL, CAST(55038.00 AS Decimal(18, 2)), 713, 22, 9, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (131, N'Краска 2x4', 2, NULL, CAST(24636.00 AS Decimal(18, 2)), 761, 49, 10, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (132, N'Резина 1x0', 1, NULL, NULL, 459, 22, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (133, N'Краска 3x2', 2, NULL, CAST(24456.00 AS Decimal(18, 2)), 922, 35, 10, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (134, N'Краска 3x0', 2, NULL, CAST(41707.00 AS Decimal(18, 2)), 921, 20, 7, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (135, N'Краска 2x29', 2, NULL, CAST(37812.00 AS Decimal(18, 2)), 465, 30, 7, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (136, N'Силикон 3x14', 3, NULL, CAST(38935.00 AS Decimal(18, 2)), 324, 19, 7, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (137, N'Силикон 3x3', 3, NULL, CAST(2870.00 AS Decimal(18, 2)), 870, 6, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (138, N'Силикон 3x18', 3, NULL, CAST(40196.00 AS Decimal(18, 2)), 978, 24, 5, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (139, N'Резина 3x37', 1, NULL, CAST(18158.00 AS Decimal(18, 2)), 870, 43, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (140, N'Краска 0x4', 2, NULL, CAST(31475.00 AS Decimal(18, 2)), 3, 45, 10, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (141, N'Краска 2x1', 2, NULL, CAST(24799.00 AS Decimal(18, 2)), 2, 5, 4, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (142, N'Резина 0x0', 1, NULL, CAST(18283.00 AS Decimal(18, 2)), 897, 20, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (143, N'Краска 4x3', 2, NULL, CAST(42215.00 AS Decimal(18, 2)), 218, 27, 2, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (144, N'Резина 11x0', 1, NULL, CAST(39297.00 AS Decimal(18, 2)), 402, 17, 5, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (145, N'Резина 0x2', 1, NULL, CAST(46929.00 AS Decimal(18, 2)), 577, 38, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (146, N'Краска 0x5', 2, NULL, CAST(36762.00 AS Decimal(18, 2)), 559, 50, 7, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (147, N'Резина 3x2', 1, NULL, CAST(12723.00 AS Decimal(18, 2)), 131, 31, 4, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (148, N'Силикон 1x22', 3, NULL, CAST(31182.00 AS Decimal(18, 2)), 649, 48, 7, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (149, N'Краска 2x0', 2, NULL, CAST(24464.00 AS Decimal(18, 2)), 595, 27, 3, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (150, N'Краска 0x2', 2, NULL, CAST(24629.00 AS Decimal(18, 2)), 235, 15, 9, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (151, N'Силикон 2x2', 3, NULL, CAST(42856.00 AS Decimal(18, 2)), 46, 42, 8, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (152, N'Резина 0x13', 1, NULL, CAST(54301.00 AS Decimal(18, 2)), 376, 48, 6, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (153, N'Резина 0x78', 1, NULL, CAST(38768.00 AS Decimal(18, 2)), 593, 48, 3, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (154, N'Краска 2x2', 2, NULL, CAST(45084.00 AS Decimal(18, 2)), 787, 16, 2, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (155, N'Силикон 0x2', 3, NULL, CAST(9098.00 AS Decimal(18, 2)), 669, 43, 2, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (156, N'Резина 0x10', 1, NULL, CAST(14481.00 AS Decimal(18, 2)), 354, 22, 3, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (157, N'Резина 3x23', 1, NULL, CAST(23578.00 AS Decimal(18, 2)), 167, 45, 7, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (158, N'Резина 2x35', 1, NULL, CAST(14798.00 AS Decimal(18, 2)), 271, 13, 7, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (159, N'Силикон 0x3', 3, NULL, CAST(3489.00 AS Decimal(18, 2)), 117, 21, 1, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (160, N'Резина 2x2', 1, NULL, CAST(44820.00 AS Decimal(18, 2)), 851, 7, 3, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (161, N'Краска 0x3', 2, NULL, CAST(8487.00 AS Decimal(18, 2)), 646, 5, 2, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (162, N'Резина 0x12', 1, NULL, CAST(14110.00 AS Decimal(18, 2)), 380, 13, 1, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (163, N'Краска 3x27', 2, NULL, CAST(24606.00 AS Decimal(18, 2)), 568, 37, 3, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (164, N'Резина 2x27', 1, NULL, CAST(14429.00 AS Decimal(18, 2)), 434, 32, 6, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (165, N'Силикон 0x28', 3, NULL, CAST(43526.00 AS Decimal(18, 2)), 144, 34, 8, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (166, N'Резина 1x1', 1, NULL, CAST(8906.00 AS Decimal(18, 2)), 244, 43, 2, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (167, N'Резина 0x30', 1, NULL, CAST(21180.00 AS Decimal(18, 2)), 143, 48, 1, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (168, N'Силикон 0x23', 3, NULL, CAST(9412.00 AS Decimal(18, 2)), 753, 10, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (169, N'Силикон 2x13', 3, NULL, CAST(19429.00 AS Decimal(18, 2)), 423, 5, 3, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (170, N'Резина 0x3', 1, NULL, CAST(11310.00 AS Decimal(18, 2)), 340, 16, 6, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (171, N'Краска 4x04', 2, NULL, CAST(24177.00 AS Decimal(18, 2)), 657, 25, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (172, N'Резина 1x32', 1, NULL, CAST(36799.00 AS Decimal(18, 2)), 709, 45, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (173, N'Силикон 1x1', 3, NULL, CAST(10649.00 AS Decimal(18, 2)), 110, 10, 1, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (174, N'Резина 3x1', 1, NULL, CAST(14002.00 AS Decimal(18, 2)), 713, 27, 6, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (175, N'Резина 0x65', 1, NULL, CAST(9263.00 AS Decimal(18, 2)), 133, 34, 1, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (176, N'Силикон 0x11', 3, NULL, CAST(34946.00 AS Decimal(18, 2)), 465, 11, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (177, N'Краска 0x0', 2, NULL, CAST(24754.00 AS Decimal(18, 2)), 318, 28, 8, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (178, N'Краска 2x24', 2, NULL, CAST(24008.00 AS Decimal(18, 2)), 797, 23, 2, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (179, N'Краска 0x1', 2, NULL, CAST(24666.00 AS Decimal(18, 2)), 228, 14, 7, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (180, N'Резина 3x38', 1, NULL, CAST(11039.00 AS Decimal(18, 2)), 892, 9, 10, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (181, N'Резина 3x28', 1, NULL, CAST(54007.00 AS Decimal(18, 2)), 395, 43, 8, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (182, N'Краска 3x18', 2, NULL, CAST(20504.00 AS Decimal(18, 2)), 128, 5, 10, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (183, N'Силикон 0x1', 3, NULL, CAST(34767.00 AS Decimal(18, 2)), 401, 9, 3, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (184, N'Краска 1x0', 2, NULL, CAST(24511.00 AS Decimal(18, 2)), 12, 49, 5, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (185, N'Краска 3x1', 2, NULL, CAST(10299.00 AS Decimal(18, 2)), 729, 21, 3, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (186, N'Силикон 3x0', 3, NULL, CAST(23681.00 AS Decimal(18, 2)), 901, 48, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (187, N'Силикон 3x35', 3, NULL, CAST(3426.00 AS Decimal(18, 2)), 610, 32, 2, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (188, N'Краска 1x1', 2, NULL, CAST(19485.00 AS Decimal(18, 2)), 281, 20, 2, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (189, N'Силикон 2x17', 3, NULL, CAST(12158.00 AS Decimal(18, 2)), 409, 16, 1, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (190, N'Резина 0x1', 1, NULL, CAST(24135.00 AS Decimal(18, 2)), 986, 18, 3, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (191, N'Силикон 3x1', 3, NULL, CAST(33602.00 AS Decimal(18, 2)), 16, 17, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (192, N'Силикон 2x1', 3, NULL, CAST(34352.00 AS Decimal(18, 2)), 461, 13, 6, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (193, N'Резина 0x37', 1, NULL, CAST(14541.00 AS Decimal(18, 2)), 764, 26, 9, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (194, N'Силикон 3x37', 3, NULL, CAST(349.00 AS Decimal(18, 2)), 680, 41, 9, 3)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (195, N'Краска 5x0', 2, NULL, CAST(43028.00 AS Decimal(18, 2)), 844, 24, 10, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (196, N'Резина 3x34', 1, NULL, CAST(14162.00 AS Decimal(18, 2)), 218, 47, 4, 1)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (197, N'Краска 3x13', 2, NULL, CAST(41211.00 AS Decimal(18, 2)), 851, 6, 3, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (198, N'Краска 3x4', 2, NULL, CAST(21211.00 AS Decimal(18, 2)), 83, 41, 5, 2)
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (199, N'Краска 1x3', 2, NULL, CAST(46354.00 AS Decimal(18, 2)), 91, 50, 6, 2)
GO
INSERT [dbo].[Material] ([Id], [Name], [TypeId], [ImageId], [Price], [CurrentCount], [MinimalCount], [PocketCount], [UnitId]) VALUES (200, N'Краска 2x28', 2, NULL, CAST(9273.00 AS Decimal(18, 2)), 916, 42, 4, 2)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialSupplier] ON 

INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (1, 33, 173)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (2, 49, 128)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (3, 18, 173)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (4, 31, 173)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (5, 32, 188)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (6, 40, 155)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (7, 28, 166)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (8, 46, 154)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (9, 43, 154)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (10, 47, 178)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (11, 33, 166)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (12, 25, 166)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (13, 52, 178)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (14, 3, 190)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (15, 13, 101)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (16, 40, 183)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (17, 41, 149)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (18, 33, 149)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (19, 45, 141)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (20, 44, 147)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (21, 51, 200)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (22, 35, 141)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (23, 16, 200)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (24, 27, 141)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (25, 7, 147)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (26, 23, 141)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (27, 28, 184)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (28, 4, 144)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (29, 7, 184)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (30, 29, 184)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (31, 49, 114)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (32, 42, 184)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (33, 10, 184)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (34, 18, 107)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (35, 49, 144)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (36, 29, 138)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (37, 50, 144)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (38, 19, 144)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (39, 38, 114)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (40, 22, 114)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (41, 22, 107)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (42, 8, 144)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (43, 52, 107)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (44, 3, 174)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (45, 37, 192)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (46, 47, 124)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (47, 6, 170)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (48, 50, 192)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (49, 18, 192)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (50, 28, 192)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (51, 49, 192)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (52, 4, 118)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (53, 39, 136)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (54, 18, 118)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (55, 18, 116)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (56, 16, 136)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (57, 21, 118)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (58, 49, 157)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (59, 34, 136)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (60, 9, 118)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (61, 35, 157)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (62, 28, 102)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (63, 21, 125)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (64, 35, 105)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (65, 41, 125)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (66, 31, 103)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (67, 14, 125)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (68, 24, 102)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (69, 9, 102)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (70, 51, 105)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (71, 6, 191)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (72, 7, 111)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (73, 33, 191)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (74, 27, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (75, 52, 171)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (76, 39, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (77, 39, 130)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (78, 13, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (79, 42, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (80, 12, 111)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (81, 16, 111)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (82, 50, 130)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (83, 29, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (84, 51, 130)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (85, 52, 172)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (86, 8, 186)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (87, 44, 182)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (88, 36, 133)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (89, 37, 132)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (90, 21, 110)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (91, 47, 182)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (92, 13, 132)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (93, 30, 110)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (94, 3, 110)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (95, 9, 182)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (96, 48, 137)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (97, 8, 110)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (98, 19, 131)
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (99, 34, 131)
GO
INSERT [dbo].[MaterialSupplier] ([Id], [SupplierId], [MaterialId]) VALUES (100, 51, 180)
SET IDENTITY_INSERT [dbo].[MaterialSupplier] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [Name]) VALUES (1, N'резина')
INSERT [dbo].[MaterialType] ([Id], [Name]) VALUES (2, N'краска')
INSERT [dbo].[MaterialType] ([Id], [Name]) VALUES (3, N'силикон')
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[SuplierType] ON 

INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (1, N'МКК')
INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (2, N'ОАО')
INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (3, N'ООО')
INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (4, N'ЗАО')
INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (5, N'МФО')
INSERT [dbo].[SuplierType] ([Id], [Name]) VALUES (6, N'ПАО')
SET IDENTITY_INSERT [dbo].[SuplierType] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (3, N'ГаражТелекомГор', 1, N'1718185951', 18, CAST(N'2018-11-26' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (4, N'Компания Омск', 2, N'1878504395', 49, CAST(N'2012-05-10' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (5, N'ГорМонтаж', 3, N'1564667734', 39, CAST(N'2013-07-10' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (6, N'Микро', 1, N'2293562756', 25, CAST(N'2014-07-15' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (7, N'Электро', 4, N'1755853973', 43, CAST(N'2012-05-14' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (8, N'Компания Мотор', 3, N'1429908355', 85, CAST(N'2010-09-16' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (9, N'Асбоцем', 5, N'1944834477', 23, CAST(N'2012-09-07' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (10, N'ВостокМети', 3, N'1488487851', 51, CAST(N'2019-04-08' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (11, N'МясКрепТеле', 6, N'2152486844', 78, CAST(N'2013-03-17' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (12, N'Софт', 1, N'1036521658', 84, CAST(N'2017-10-13' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (13, N'Компания СервисМикроО', 3, N'1178826599', 27, CAST(N'2013-04-14' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (14, N'ИнфоГазМотор', 2, N'1954050214', 92, CAST(N'2011-02-10' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (15, N'Монтаж', 2, N'1163880101', 66, CAST(N'2019-06-01' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (16, N'ЭлектроХром', 2, N'1654184411', 13, CAST(N'2014-08-17' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (17, N'Компания НефтьITИнф', 3, N'1685247455', 56, CAST(N'2014-09-26' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (18, N'ТомскНефть', 3, N'1002996016', 44, CAST(N'2010-01-13' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (19, N'ТомскТяжРеч', 5, N'1102143492', 59, CAST(N'2010-09-11' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (20, N'УралХме', 3, N'2291253256', 40, CAST(N'2010-06-15' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (21, N'ВодРыб', 4, N'1113468466', 38, CAST(N'2016-09-20' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (22, N'УралСервисМон', 1, N'1892306757', 77, CAST(N'2015-04-22' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (23, N'Казань', 2, N'1965011544', 77, CAST(N'2017-04-21' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (24, N'Cиб', 2, N'1949139718', 89, CAST(N'2010-10-26' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (25, N'ГаражГазМ', 2, N'1740623312', 99, CAST(N'2017-10-07' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (26, N'МобайлДизайнОмск', 3, N'1014490629', 99, CAST(N'2011-05-10' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (27, N'ЖелДорГаз', 5, N'1255275062', 25, CAST(N'2017-09-07' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (28, N'ТверьБухГаз', 2, N'2167673760', 54, CAST(N'2014-03-26' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (29, N'ТелекомТранс', 2, N'2200735978', 87, CAST(N'2019-02-17' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (30, N'ГаражГлав', 1, N'1404774111', 1, CAST(N'2014-11-20' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (31, N'Компания К', 6, N'1468114280', 54, CAST(N'2014-08-09' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (32, N'ТяжЛифтВостокС', 2, N'1032089879', 70, CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (33, N'Компания Во', 6, N'2027005945', 23, CAST(N'2014-04-08' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (34, N'МоторКаз', 2, N'1076279398', 37, CAST(N'2015-08-27' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (35, N'Сервис', 2, N'2031832854', 5, CAST(N'2014-03-11' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (36, N'ЮпитерТомс', 6, N'1551173338', 11, CAST(N'2010-06-05' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (37, N'Мор', 1, N'1906157177', 38, CAST(N'2010-10-14' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (38, N'СеверТехВостокЛизинг', 3, N'1846812080', 34, CAST(N'2010-12-26' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (39, N'ЦементОбл', 3, N'2021607106', 46, CAST(N'2012-11-14' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (40, N'Компания КазаньАвтоCиб', 1, N'1371692583', 72, CAST(N'2010-04-16' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (41, N'ГаражХозФлот', 2, N'2164720385', 19, CAST(N'2019-01-03' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (42, N'Компания МорМетал', 3, N'1947163072', 93, CAST(N'2010-02-25' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (43, N'ГлавРыб', 5, N'1426268088', 59, CAST(N'2013-12-07' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (44, N'CибCибОрио', 3, N'1988313615', 1, CAST(N'2019-02-22' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (45, N'ТелеРыбХм', 3, N'2299034130', 51, CAST(N'2019-02-21' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (46, N'ГлавАвтоГазТрест', 5, N'2059691335', 28, CAST(N'2013-07-17' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (47, N'ТяжКазаньБашкир', 6, N'1794419510', 55, CAST(N'2016-06-01' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (48, N'Асбоцемент', 5, N'1650212184', 32, CAST(N'2018-12-08' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (49, N'Мотор', 6, N'1019917089', 59, CAST(N'2017-09-09' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (50, N'МорФинансФинансМаш', 3, N'1549496316', 50, CAST(N'2016-04-15' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (51, N'РыбВектор', 2, N'2275526397', 72, CAST(N'2010-11-25' AS Date))
INSERT [dbo].[Supplier] ([Id], [Name], [TypeId], [INN], [Raiting], [StartDate]) VALUES (52, N'Теле', 6, N'2170198203', 96, CAST(N'2010-04-13' AS Date))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name]) VALUES (1, N'м')
INSERT [dbo].[Unit] ([Id], [Name]) VALUES (2, N'л')
INSERT [dbo].[Unit] ([Id], [Name]) VALUES (3, N'кг')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Image]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[MaterialType] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Unit]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_SuplierType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[SuplierType] ([Id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_SuplierType]
GO
USE [master]
GO
ALTER DATABASE [ArmClothes] SET  READ_WRITE 
GO
