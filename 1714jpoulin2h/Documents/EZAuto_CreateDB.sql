USE [master]
GO
/****** Object:  Database [EZAuto]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE DATABASE [EZAuto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EZAuto', FILENAME = N'C:\Users\vynlo\Documents\SQL Server Management Studio\1714JPoulin\1714jpoulin2h\App_Data\EZAuto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EZAuto_log', FILENAME = N'C:\Users\vynlo\Documents\SQL Server Management Studio\1714JPoulin\1714jpoulin2h\App_Data\EZAuto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EZAuto] SET COMPATIBILITY_LEVEL = 130
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
ALTER DATABASE [EZAuto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EZAuto] SET AUTO_SHRINK ON 
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
ALTER DATABASE [EZAuto] SET  ENABLE_BROKER 
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
ALTER DATABASE [EZAuto] SET RECOVERY SIMPLE 
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
ALTER DATABASE [EZAuto] SET QUERY_STORE = OFF
GO
USE [EZAuto]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EZAuto]
GO
/****** Object:  Table [dbo].[PartStores]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartStores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartStoreName] [nvarchar](50) NOT NULL,
	[PartStoreAddress] [nvarchar](50) NOT NULL,
	[PartStoreCity] [nvarchar](15) NOT NULL,
	[PartStoreState] [nvarchar](max) NOT NULL,
	[PartStoreZip] [nvarchar](10) NOT NULL,
	[PartStorePhone] [nvarchar](15) NOT NULL,
	[PartStoreEmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartStores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](15) NOT NULL,
	[Zip] [nvarchar](10) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[RepairShop_Id] [int] NULL,
	[PartStore_Id] [int] NULL,
	[Subscription_Id] [int] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotes]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotePrice] [decimal](18, 0) NOT NULL,
	[Request_Id] [int] NOT NULL,
	[RepairShop_Id] [int] NOT NULL,
 CONSTRAINT [PK_Quotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairShops]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairShops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RepairShopName] [nvarchar](50) NOT NULL,
	[RepairShopAddress] [nvarchar](50) NOT NULL,
	[RepairShopCity] [nvarchar](15) NOT NULL,
	[RepairShopState] [nvarchar](max) NOT NULL,
	[RepairShopZip] [nvarchar](10) NOT NULL,
	[RepairShopPhone] [nvarchar](15) NOT NULL,
	[RepairShopEmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RepairShops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestDescription] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewScore] [int] NOT NULL,
	[ReviewDescription] [nvarchar](256) NOT NULL,
	[RepairShop_Id] [int] NULL,
	[PartStore_Id] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 11/18/2019 8:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PartStores] ON 
GO
INSERT [dbo].[PartStores] ([Id], [PartStoreName], [PartStoreAddress], [PartStoreCity], [PartStoreState], [PartStoreZip], [PartStorePhone], [PartStoreEmail]) VALUES (1, N'Good Auto', N'A1379 Market St', N'La Crosse', N'Wisconsin', N'54601', N'1111111111', N'good@g.com')
GO
INSERT [dbo].[PartStores] ([Id], [PartStoreName], [PartStoreAddress], [PartStoreCity], [PartStoreState], [PartStoreZip], [PartStorePhone], [PartStoreEmail]) VALUES (2, N'O''Reilly Auto Parts', N'E1456 Elm St', N'Viroqua', N'Wisconsin', N'54689', N'1111111111', N'reilly@r.com')
GO
SET IDENTITY_INSERT [dbo].[PartStores] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (2, N'Jesse', N'James', N'A1346 Grate Rd', N'Viroqua', N'Wisconsin', N'54642', N'1111111111', N'jesse@j.com', NULL, NULL, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (3, N'Sue', N'Ghallager', N'E1467 Jade Rd', N'Madison', N'Wisconsin', N'54679', N'1111111111', N'sue@s.com', NULL, NULL, 2)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (6, N'Jake', N'Julie', N'A3465 Jacket Rd', N'Stoddard', N'Wisconsin', N'54842', N'1111111111', N'jake@j.com', 1, NULL, NULL)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (7, N'Helen', N'Keller', N'A8987 Eagle Rd', N'Viroqua', N'Wisconsin', N'54790', N'1111111111', N'hwlwn@h.com', NULL, 1, NULL)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (8, N'Mary', N'Joseph', N'A3256 Life Rd', N'La Crosse', N'Wisconsin', N'54657', N'1111111111', N'mary@m.com', 2, NULL, NULL)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [RepairShop_Id], [PartStore_Id], [Subscription_Id]) VALUES (11, N'Joel', N'Olstein', N'A1245 Rich Rd', N'Madison', N'Wisconsin', N'54654', N'1111111111', N'joel@j.com', NULL, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotes] ON 
GO
INSERT [dbo].[Quotes] ([Id], [QuotePrice], [Request_Id], [RepairShop_Id]) VALUES (1, CAST(550 AS Decimal(18, 0)), 1, 1)
GO
INSERT [dbo].[Quotes] ([Id], [QuotePrice], [Request_Id], [RepairShop_Id]) VALUES (2, CAST(700 AS Decimal(18, 0)), 2, 2)
GO
INSERT [dbo].[Quotes] ([Id], [QuotePrice], [Request_Id], [RepairShop_Id]) VALUES (3, CAST(650 AS Decimal(18, 0)), 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Quotes] OFF
GO
SET IDENTITY_INSERT [dbo].[RepairShops] ON 
GO
INSERT [dbo].[RepairShops] ([Id], [RepairShopName], [RepairShopAddress], [RepairShopCity], [RepairShopState], [RepairShopZip], [RepairShopPhone], [RepairShopEmail]) VALUES (1, N'Charles'' Shop', N'E1688 Lane St', N'De Soto', N'Wisconsin', N'54624', N'1111111111', N'charles@c.com')
GO
INSERT [dbo].[RepairShops] ([Id], [RepairShopName], [RepairShopAddress], [RepairShopCity], [RepairShopState], [RepairShopZip], [RepairShopPhone], [RepairShopEmail]) VALUES (2, N'Joe''s Repair', N'E1452 Mountain St', N'Stoddard', N'Wisconsin', N'54632', N'1111111111', N'joe@j.com')
GO
SET IDENTITY_INSERT [dbo].[RepairShops] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 
GO
INSERT [dbo].[Requests] ([Id], [RequestDescription], [Person_Id]) VALUES (1, N'All four brakes on my Toyota Avalon 2012 are squeaking so I need them replaced', 2)
GO
INSERT [dbo].[Requests] ([Id], [RequestDescription], [Person_Id]) VALUES (2, N'Front right light is out on my Tesla Model S', 3)
GO
INSERT [dbo].[Requests] ([Id], [RequestDescription], [Person_Id]) VALUES (3, N'Need tire alignment on my Ford Ranger 2008', 2)
GO
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 
GO
INSERT [dbo].[Reviews] ([Id], [ReviewScore], [ReviewDescription], [RepairShop_Id], [PartStore_Id]) VALUES (3, 8, N'Fast, decent service', 1, NULL)
GO
INSERT [dbo].[Reviews] ([Id], [ReviewScore], [ReviewDescription], [RepairShop_Id], [PartStore_Id]) VALUES (4, 10, N'Very competitive prices!', NULL, 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReviewScore], [ReviewDescription], [RepairShop_Id], [PartStore_Id]) VALUES (5, 5, N'Shameful price gouging!', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscriptions] ON 
GO
INSERT [dbo].[Subscriptions] ([Id], [Price]) VALUES (1, CAST(5 AS Decimal(18, 0)))
GO
INSERT [dbo].[Subscriptions] ([Id], [Price]) VALUES (2, CAST(5 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Subscriptions] OFF
GO
/****** Object:  Index [IX_FK_PartStorePerson]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PartStorePerson] ON [dbo].[People]
(
	[PartStore_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonSubscription]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonSubscription] ON [dbo].[People]
(
	[Subscription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RepairShopPerson]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RepairShopPerson] ON [dbo].[People]
(
	[RepairShop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RepairShopQuote]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RepairShopQuote] ON [dbo].[Quotes]
(
	[RepairShop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RequestQuote]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RequestQuote] ON [dbo].[Quotes]
(
	[Request_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonRequest]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonRequest] ON [dbo].[Requests]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PartStoreReview]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PartStoreReview] ON [dbo].[Reviews]
(
	[PartStore_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RepairShopReview]    Script Date: 11/18/2019 8:28:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RepairShopReview] ON [dbo].[Reviews]
(
	[RepairShop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_PartStorePerson] FOREIGN KEY([PartStore_Id])
REFERENCES [dbo].[PartStores] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_PartStorePerson]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_PersonSubscription] FOREIGN KEY([Subscription_Id])
REFERENCES [dbo].[Subscriptions] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_PersonSubscription]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_RepairShopPerson] FOREIGN KEY([RepairShop_Id])
REFERENCES [dbo].[RepairShops] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_RepairShopPerson]
GO
ALTER TABLE [dbo].[Quotes]  WITH CHECK ADD  CONSTRAINT [FK_RepairShopQuote] FOREIGN KEY([RepairShop_Id])
REFERENCES [dbo].[RepairShops] ([Id])
GO
ALTER TABLE [dbo].[Quotes] CHECK CONSTRAINT [FK_RepairShopQuote]
GO
ALTER TABLE [dbo].[Quotes]  WITH CHECK ADD  CONSTRAINT [FK_RequestQuote] FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Quotes] CHECK CONSTRAINT [FK_RequestQuote]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_PersonRequest] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_PersonRequest]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_PartStoreReview] FOREIGN KEY([PartStore_Id])
REFERENCES [dbo].[PartStores] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_PartStoreReview]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_RepairShopReview] FOREIGN KEY([RepairShop_Id])
REFERENCES [dbo].[RepairShops] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_RepairShopReview]
GO
USE [master]
GO
ALTER DATABASE [EZAuto] SET  READ_WRITE 
GO
