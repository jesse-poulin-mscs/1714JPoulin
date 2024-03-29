USE [master]
GO
/****** Object:  Database [EZAuto]    Script Date: 10/5/2019 12:51:26 AM ******/
CREATE DATABASE [EZAuto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EZAuto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EZAuto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EZAuto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EZAuto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EZAuto] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EZAuto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EZAuto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EZAuto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EZAuto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EZAuto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EZAuto] SET ARITHABORT OFF 
GO
ALTER DATABASE [EZAuto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EZAuto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EZAuto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EZAuto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EZAuto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EZAuto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EZAuto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EZAuto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EZAuto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EZAuto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EZAuto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EZAuto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EZAuto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EZAuto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EZAuto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EZAuto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EZAuto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EZAuto] SET RECOVERY FULL 
GO
ALTER DATABASE [EZAuto] SET  MULTI_USER 
GO
ALTER DATABASE [EZAuto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EZAuto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EZAuto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EZAuto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EZAuto] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EZAuto', N'ON'
GO
ALTER DATABASE [EZAuto] SET QUERY_STORE = OFF
GO
USE [EZAuto]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFName] [nchar](20) NOT NULL,
	[CustomerLName] [nchar](20) NOT NULL,
	[CustomerAddress] [nvarchar](50) NOT NULL,
	[CustomerCity] [nchar](20) NOT NULL,
	[CustomerState] [nchar](20) NOT NULL,
	[CustomerZip] [int] NOT NULL,
	[CustomerPhone] [nvarchar](10) NOT NULL,
	[SubscriberId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartStore]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartStore](
	[PartStoreId] [int] IDENTITY(1,1) NOT NULL,
	[PartStoreName] [nvarchar](20) NOT NULL,
	[PartStoreAddress] [nvarchar](50) NOT NULL,
	[PartStoreCity] [nchar](20) NOT NULL,
	[PartStoreState] [nchar](20) NOT NULL,
	[PartStoreZip] [int] NOT NULL,
	[PartStorePhone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[PartStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quote]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quote](
	[QuoteId] [int] IDENTITY(1,1) NOT NULL,
	[QuotePrice] [smallmoney] NOT NULL,
	[RepairShopId] [int] NOT NULL,
	[RequestId] [int] NOT NULL,
 CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED 
(
	[QuoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairShop]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairShop](
	[RepairShopId] [int] IDENTITY(1,1) NOT NULL,
	[RepairShopName] [nvarchar](20) NOT NULL,
	[RepairShopAddress] [nvarchar](50) NOT NULL,
	[RepairShopCity] [nchar](20) NOT NULL,
	[RepairShopState] [nchar](20) NOT NULL,
	[RepairShopZip] [int] NOT NULL,
	[RepairShopPhone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Repair_1] PRIMARY KEY CLUSTERED 
(
	[RepairShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestDescription] [nvarchar](500) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[QuoteId] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewScore] [int] NOT NULL,
	[ReviewDescription] [nvarchar](500) NOT NULL,
	[RepairShopId] [int] NULL,
	[PartStoreId] [int] NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriber]    Script Date: 10/5/2019 12:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriber](
	[SubscriberId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Subscriber] PRIMARY KEY CLUSTERED 
(
	[SubscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerFName], [CustomerLName], [CustomerAddress], [CustomerCity], [CustomerState], [CustomerZip], [CustomerPhone], [SubscriberId]) VALUES (1, N'Jesse               ', N'James               ', N'A1346 Grate Rd', N'Viroqua             ', N'Wisconsin           ', 54624, N'1111111111', 1)
INSERT [dbo].[Customer] ([CustomerId], [CustomerFName], [CustomerLName], [CustomerAddress], [CustomerCity], [CustomerState], [CustomerZip], [CustomerPhone], [SubscriberId]) VALUES (2, N'Sue                 ', N'Ghallager           ', N'E1467 Jade Rd', N'Madison             ', N'Wisconsin           ', 54679, N'1111111111', 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[PartStore] ON 

INSERT [dbo].[PartStore] ([PartStoreId], [PartStoreName], [PartStoreAddress], [PartStoreCity], [PartStoreState], [PartStoreZip], [PartStorePhone]) VALUES (1, N'Good Auto  ', N'A1379 Market St', N'La Crosse           ', N'Wisconsin           ', 54601, N'1111111111')
INSERT [dbo].[PartStore] ([PartStoreId], [PartStoreName], [PartStoreAddress], [PartStoreCity], [PartStoreState], [PartStoreZip], [PartStorePhone]) VALUES (2, N'O''Reilly Auto Parts', N'E1456', N'Viroqua             ', N'Wisconsin           ', 54689, N'1111111111')
SET IDENTITY_INSERT [dbo].[PartStore] OFF
SET IDENTITY_INSERT [dbo].[Quote] ON 

INSERT [dbo].[Quote] ([QuoteId], [QuotePrice], [RepairShopId], [RequestId]) VALUES (1, 550.0000, 1, 1)
INSERT [dbo].[Quote] ([QuoteId], [QuotePrice], [RepairShopId], [RequestId]) VALUES (2, 700.0000, 2, 3)
INSERT [dbo].[Quote] ([QuoteId], [QuotePrice], [RepairShopId], [RequestId]) VALUES (3, 650.0000, 1, 3)
SET IDENTITY_INSERT [dbo].[Quote] OFF
SET IDENTITY_INSERT [dbo].[RepairShop] ON 

INSERT [dbo].[RepairShop] ([RepairShopId], [RepairShopName], [RepairShopAddress], [RepairShopCity], [RepairShopState], [RepairShopZip], [RepairShopPhone]) VALUES (1, N'Charles'' Shop', N'E1688 Lane St', N'De Soto             ', N'Wisconsin           ', 54624, N'1111111111')
INSERT [dbo].[RepairShop] ([RepairShopId], [RepairShopName], [RepairShopAddress], [RepairShopCity], [RepairShopState], [RepairShopZip], [RepairShopPhone]) VALUES (2, N'Joe''s Repair', N'E1452', N'Stoddard            ', N'Wisconsin           ', 54632, N'1111111111')
SET IDENTITY_INSERT [dbo].[RepairShop] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([RequestId], [RequestDescription], [CustomerId], [QuoteId]) VALUES (1, N'All four brakes on my Toyota Avalon 2012 need to be replaced.', 1, NULL)
INSERT [dbo].[Request] ([RequestId], [RequestDescription], [CustomerId], [QuoteId]) VALUES (2, N'Need a tire alignment on my Ford Ranger 2008.', 1, 1)
INSERT [dbo].[Request] ([RequestId], [RequestDescription], [CustomerId], [QuoteId]) VALUES (3, N'Backleft light is out.', 2, 3)
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [ReviewScore], [ReviewDescription], [RepairShopId], [PartStoreId], [CustomerId]) VALUES (1, 7, N'Fast, decent service.', 1, NULL, 1)
INSERT [dbo].[Review] ([ReviewId], [ReviewScore], [ReviewDescription], [RepairShopId], [PartStoreId], [CustomerId]) VALUES (2, 10, N'Very competitive pricing!', NULL, 1, 1)
INSERT [dbo].[Review] ([ReviewId], [ReviewScore], [ReviewDescription], [RepairShopId], [PartStoreId], [CustomerId]) VALUES (3, 5, N'Shameful price gouging!!', 2, NULL, 2)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Subscriber] ON 

INSERT [dbo].[Subscriber] ([SubscriberId], [Price], [CustomerId]) VALUES (1, 5.0000, 1)
INSERT [dbo].[Subscriber] ([SubscriberId], [Price], [CustomerId]) VALUES (2, 5.0000, 2)
SET IDENTITY_INSERT [dbo].[Subscriber] OFF
USE [master]
GO
ALTER DATABASE [EZAuto] SET  READ_WRITE 
GO
