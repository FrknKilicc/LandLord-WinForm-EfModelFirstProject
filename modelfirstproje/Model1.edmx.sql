
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/19/2023 12:19:18
-- Generated from EDMX file: C:\Users\BRIGHT\Desktop\console örnekleri\modelfirstproje\modelfirstproje\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Restate];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_LandLordForRental]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ForRentals] DROP CONSTRAINT [FK_LandLordForRental];
GO
IF OBJECT_ID(N'[dbo].[FK_LandLordForSale]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ForSales] DROP CONSTRAINT [FK_LandLordForSale];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerLandLord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerLandLord];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[LandLords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LandLords];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[ForSales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ForSales];
GO
IF OBJECT_ID(N'[dbo].[ForRentals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ForRentals];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LandLords'
CREATE TABLE [dbo].[LandLords] (
    [LandLordID] int IDENTITY(1,1) NOT NULL,
    [NameSurname] nvarchar(max)  NOT NULL,
    [Age] int  NOT NULL,
    [Wage] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [NameSurname] nvarchar(max)  NOT NULL,
    [Age] int  NOT NULL,
    [Job] nvarchar(max)  NOT NULL,
    [Wage] decimal(18,0)  NOT NULL,
    [CustomerLandLord_Customer_LandLordID] int  NOT NULL
);
GO

-- Creating table 'ForSales'
CREATE TABLE [dbo].[ForSales] (
    [ForSaleID] int IDENTITY(1,1) NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [Case] nvarchar(max)  NOT NULL,
    [LandLordLandLordID] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ForRentals'
CREATE TABLE [dbo].[ForRentals] (
    [ForRentalID] int IDENTITY(1,1) NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [Case] nvarchar(max)  NOT NULL,
    [LandLordLandLordID] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [LandLordID] in table 'LandLords'
ALTER TABLE [dbo].[LandLords]
ADD CONSTRAINT [PK_LandLords]
    PRIMARY KEY CLUSTERED ([LandLordID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [ForSaleID] in table 'ForSales'
ALTER TABLE [dbo].[ForSales]
ADD CONSTRAINT [PK_ForSales]
    PRIMARY KEY CLUSTERED ([ForSaleID] ASC);
GO

-- Creating primary key on [ForRentalID] in table 'ForRentals'
ALTER TABLE [dbo].[ForRentals]
ADD CONSTRAINT [PK_ForRentals]
    PRIMARY KEY CLUSTERED ([ForRentalID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LandLordLandLordID] in table 'ForRentals'
ALTER TABLE [dbo].[ForRentals]
ADD CONSTRAINT [FK_LandLordForRental]
    FOREIGN KEY ([LandLordLandLordID])
    REFERENCES [dbo].[LandLords]
        ([LandLordID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LandLordForRental'
CREATE INDEX [IX_FK_LandLordForRental]
ON [dbo].[ForRentals]
    ([LandLordLandLordID]);
GO

-- Creating foreign key on [LandLordLandLordID] in table 'ForSales'
ALTER TABLE [dbo].[ForSales]
ADD CONSTRAINT [FK_LandLordForSale]
    FOREIGN KEY ([LandLordLandLordID])
    REFERENCES [dbo].[LandLords]
        ([LandLordID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LandLordForSale'
CREATE INDEX [IX_FK_LandLordForSale]
ON [dbo].[ForSales]
    ([LandLordLandLordID]);
GO

-- Creating foreign key on [CustomerLandLord_Customer_LandLordID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerLandLord]
    FOREIGN KEY ([CustomerLandLord_Customer_LandLordID])
    REFERENCES [dbo].[LandLords]
        ([LandLordID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerLandLord'
CREATE INDEX [IX_FK_CustomerLandLord]
ON [dbo].[Customers]
    ([CustomerLandLord_Customer_LandLordID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------