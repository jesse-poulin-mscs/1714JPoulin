
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/18/2019 18:49:04
-- Generated from EDMX file: C:\Users\vynlo\Documents\SQL Server Management Studio\1714JPoulin\1714jpoulin2h\EZAutoModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EZAuto];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PersonRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_PersonRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestQuote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quotes] DROP CONSTRAINT [FK_RequestQuote];
GO
IF OBJECT_ID(N'[dbo].[FK_RepairShopQuote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quotes] DROP CONSTRAINT [FK_RepairShopQuote];
GO
IF OBJECT_ID(N'[dbo].[FK_RepairShopPerson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_RepairShopPerson];
GO
IF OBJECT_ID(N'[dbo].[FK_RepairShopReview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_RepairShopReview];
GO
IF OBJECT_ID(N'[dbo].[FK_PartStoreReview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_PartStoreReview];
GO
IF OBJECT_ID(N'[dbo].[FK_PartStorePerson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_PartStorePerson];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonSubscription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_PersonSubscription];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Subscriptions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subscriptions];
GO
IF OBJECT_ID(N'[dbo].[RepairShops]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RepairShops];
GO
IF OBJECT_ID(N'[dbo].[PartStores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartStores];
GO
IF OBJECT_ID(N'[dbo].[Reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews];
GO
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Quotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Quotes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Address] nvarchar(50)  NOT NULL,
    [City] nvarchar(50)  NOT NULL,
    [State] nvarchar(15)  NOT NULL,
    [Zip] nvarchar(10)  NOT NULL,
    [Phone] nvarchar(15)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [RepairShop_Id] int  NULL,
    [PartStore_Id] int  NULL,
    [Subscription_Id] int  NULL
);
GO

-- Creating table 'Subscriptions'
CREATE TABLE [dbo].[Subscriptions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Price] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'RepairShops'
CREATE TABLE [dbo].[RepairShops] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RepairShopName] nvarchar(50)  NOT NULL,
    [RepairShopAddress] nvarchar(50)  NOT NULL,
    [RepairShopCity] nvarchar(15)  NOT NULL,
    [RepairShopState] nvarchar(max)  NOT NULL,
    [RepairShopZip] nvarchar(10)  NOT NULL,
    [RepairShopPhone] nvarchar(15)  NOT NULL,
    [RepairShopEmail] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'PartStores'
CREATE TABLE [dbo].[PartStores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PartStoreName] nvarchar(50)  NOT NULL,
    [PartStoreAddress] nvarchar(50)  NOT NULL,
    [PartStoreCity] nvarchar(15)  NOT NULL,
    [PartStoreState] nvarchar(max)  NOT NULL,
    [PartStoreZip] nvarchar(10)  NOT NULL,
    [PartStorePhone] nvarchar(15)  NOT NULL,
    [PartStoreEmail] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReviewScore] int  NOT NULL,
    [ReviewDescription] nvarchar(256)  NOT NULL,
    [RepairShop_Id] int  NULL,
    [PartStore_Id] int  NULL
);
GO

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RequestDescription] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Quotes'
CREATE TABLE [dbo].[Quotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuotePrice] decimal(18,0)  NOT NULL,
    [Request_Id] int  NOT NULL,
    [RepairShop_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subscriptions'
ALTER TABLE [dbo].[Subscriptions]
ADD CONSTRAINT [PK_Subscriptions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RepairShops'
ALTER TABLE [dbo].[RepairShops]
ADD CONSTRAINT [PK_RepairShops]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PartStores'
ALTER TABLE [dbo].[PartStores]
ADD CONSTRAINT [PK_PartStores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [PK_Quotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Person_Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_PersonRequest]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonRequest'
CREATE INDEX [IX_FK_PersonRequest]
ON [dbo].[Requests]
    ([Person_Id]);
GO

-- Creating foreign key on [Request_Id] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [FK_RequestQuote]
    FOREIGN KEY ([Request_Id])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestQuote'
CREATE INDEX [IX_FK_RequestQuote]
ON [dbo].[Quotes]
    ([Request_Id]);
GO

-- Creating foreign key on [RepairShop_Id] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [FK_RepairShopQuote]
    FOREIGN KEY ([RepairShop_Id])
    REFERENCES [dbo].[RepairShops]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RepairShopQuote'
CREATE INDEX [IX_FK_RepairShopQuote]
ON [dbo].[Quotes]
    ([RepairShop_Id]);
GO

-- Creating foreign key on [RepairShop_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_RepairShopPerson]
    FOREIGN KEY ([RepairShop_Id])
    REFERENCES [dbo].[RepairShops]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RepairShopPerson'
CREATE INDEX [IX_FK_RepairShopPerson]
ON [dbo].[People]
    ([RepairShop_Id]);
GO

-- Creating foreign key on [RepairShop_Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_RepairShopReview]
    FOREIGN KEY ([RepairShop_Id])
    REFERENCES [dbo].[RepairShops]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RepairShopReview'
CREATE INDEX [IX_FK_RepairShopReview]
ON [dbo].[Reviews]
    ([RepairShop_Id]);
GO

-- Creating foreign key on [PartStore_Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_PartStoreReview]
    FOREIGN KEY ([PartStore_Id])
    REFERENCES [dbo].[PartStores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartStoreReview'
CREATE INDEX [IX_FK_PartStoreReview]
ON [dbo].[Reviews]
    ([PartStore_Id]);
GO

-- Creating foreign key on [PartStore_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_PartStorePerson]
    FOREIGN KEY ([PartStore_Id])
    REFERENCES [dbo].[PartStores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartStorePerson'
CREATE INDEX [IX_FK_PartStorePerson]
ON [dbo].[People]
    ([PartStore_Id]);
GO

-- Creating foreign key on [Subscription_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_PersonSubscription]
    FOREIGN KEY ([Subscription_Id])
    REFERENCES [dbo].[Subscriptions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonSubscription'
CREATE INDEX [IX_FK_PersonSubscription]
ON [dbo].[People]
    ([Subscription_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------