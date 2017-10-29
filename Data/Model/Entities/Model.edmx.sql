
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/24/2017 03:51:52
-- Generated from EDMX file: C:\Users\Admin\Documents\sushi-restaurant\src\Data\Model\Entities\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE SushiRes;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Dish_SubCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dish] DROP CONSTRAINT [FK_Dish_SubCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Table]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Table];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDish_Dish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Dish];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDish_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDish_Promotion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Promotion];
GO
IF OBJECT_ID(N'[dbo].[FK_Promotion_Dish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [FK_Promotion_Dish];
GO
IF OBJECT_ID(N'[dbo].[FK_SubCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [FK_SubCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_Table_GroupTable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Table] DROP CONSTRAINT [FK_Table_GroupTable];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[Dish]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dish];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[GroupTable]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GroupTable];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderDish]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDish];
GO
IF OBJECT_ID(N'[dbo].[Promotion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Promotion];
GO
IF OBJECT_ID(N'[dbo].[SubCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubCategory];
GO
IF OBJECT_ID(N'[dbo].[Table]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Table];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Description] nvarchar(255)  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Sex] int  NULL,
    [Birthday] datetime  NULL,
    [Phone] nvarchar(255)  NOT NULL,
    [Address] nvarchar(255)  NULL,
    [Class] int  NOT NULL,
    [CreateAt] datetime  NULL,
    [IsDelete] bit  NULL
);
GO

-- Creating table 'Dishes'
CREATE TABLE [dbo].[Dishes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [IsDelete] bit  NOT NULL,
    [Image] nvarchar(255)  NULL,
    [Price] bigint  NOT NULL,
    [OrderTimes] int  NOT NULL,
    [SubCategoryID] int  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Department] nvarchar(255)  NULL,
    [Position] nvarchar(255)  NULL,
    [Sex] int  NOT NULL,
    [Birthday] datetime  NULL,
    [Phone] nvarchar(255)  NULL,
    [Address] nvarchar(255)  NULL,
    [CreatedAt] datetime  NULL,
    [IsDelete] bit  NULL,
    [Avatar] nvarchar(255)  NULL,
    [UserId] nvarchar(128)  NULL
);
GO

-- Creating table 'GroupTables'
CREATE TABLE [dbo].[GroupTables] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NULL,
    [Description] nvarchar(255)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreateAt] datetime  NOT NULL,
    [IsDelete] bit  NOT NULL,
    [SubTotal] bigint  NOT NULL,
    [PromotionDiscount] bigint  NULL,
    [ClassDiscount] bigint  NULL,
    [Total] bigint  NULL,
    [Status] int  NULL,
    [CustomerID] int  NULL,
    [EmployeeID] int  NOT NULL,
    [TableID] int  NOT NULL
);
GO

-- Creating table 'OrderDishes'
CREATE TABLE [dbo].[OrderDishes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(255)  NULL,
    [Number] int  NOT NULL,
    [UnitPrice] bigint  NOT NULL,
    [IsDelete] bit  NOT NULL,
    [Discount] bigint  NULL,
    [PromotionID] int  NULL,
    [DishID] int  NOT NULL,
    [OrderID] int  NOT NULL
);
GO

-- Creating table 'Promotions'
CREATE TABLE [dbo].[Promotions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DiscountPercent] float  NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [CreateAt] datetime  NOT NULL,
    [ExpireAt] datetime  NOT NULL,
    [DishID] int  NULL
);
GO

-- Creating table 'SubCategories'
CREATE TABLE [dbo].[SubCategories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [CategoryID] int  NOT NULL
);
GO

-- Creating table 'Tables'
CREATE TABLE [dbo].[Tables] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(50)  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [Status] int  NOT NULL,
    [GroupTableID] int  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [RoleId] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Dishes'
ALTER TABLE [dbo].[Dishes]
ADD CONSTRAINT [PK_Dishes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'GroupTables'
ALTER TABLE [dbo].[GroupTables]
ADD CONSTRAINT [PK_GroupTables]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderDishes'
ALTER TABLE [dbo].[OrderDishes]
ADD CONSTRAINT [PK_OrderDishes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Promotions'
ALTER TABLE [dbo].[Promotions]
ADD CONSTRAINT [PK_Promotions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'SubCategories'
ALTER TABLE [dbo].[SubCategories]
ADD CONSTRAINT [PK_SubCategories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Tables'
ALTER TABLE [dbo].[Tables]
ADD CONSTRAINT [PK_Tables]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RoleId], [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([RoleId], [UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_Employee_AspNetUsers]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_AspNetUsers'
CREATE INDEX [IX_FK_Employee_AspNetUsers]
ON [dbo].[Employees]
    ([UserId]);
GO

-- Creating foreign key on [CategoryID] in table 'SubCategories'
ALTER TABLE [dbo].[SubCategories]
ADD CONSTRAINT [FK_SubCategory_Category]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubCategory_Category'
CREATE INDEX [IX_FK_SubCategory_Category]
ON [dbo].[SubCategories]
    ([CategoryID]);
GO

-- Creating foreign key on [CustomerID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_Customer]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Customer'
CREATE INDEX [IX_FK_Order_Customer]
ON [dbo].[Orders]
    ([CustomerID]);
GO

-- Creating foreign key on [SubCategoryID] in table 'Dishes'
ALTER TABLE [dbo].[Dishes]
ADD CONSTRAINT [FK_Dish_SubCategory]
    FOREIGN KEY ([SubCategoryID])
    REFERENCES [dbo].[SubCategories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Dish_SubCategory'
CREATE INDEX [IX_FK_Dish_SubCategory]
ON [dbo].[Dishes]
    ([SubCategoryID]);
GO

-- Creating foreign key on [DishID] in table 'OrderDishes'
ALTER TABLE [dbo].[OrderDishes]
ADD CONSTRAINT [FK_OrderDish_Dish]
    FOREIGN KEY ([DishID])
    REFERENCES [dbo].[Dishes]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDish_Dish'
CREATE INDEX [IX_FK_OrderDish_Dish]
ON [dbo].[OrderDishes]
    ([DishID]);
GO

-- Creating foreign key on [DishID] in table 'Promotions'
ALTER TABLE [dbo].[Promotions]
ADD CONSTRAINT [FK_Promotion_Dish]
    FOREIGN KEY ([DishID])
    REFERENCES [dbo].[Dishes]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Promotion_Dish'
CREATE INDEX [IX_FK_Promotion_Dish]
ON [dbo].[Promotions]
    ([DishID]);
GO

-- Creating foreign key on [EmployeeID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_Employee]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Employee'
CREATE INDEX [IX_FK_Order_Employee]
ON [dbo].[Orders]
    ([EmployeeID]);
GO

-- Creating foreign key on [GroupTableID] in table 'Tables'
ALTER TABLE [dbo].[Tables]
ADD CONSTRAINT [FK_Table_GroupTable]
    FOREIGN KEY ([GroupTableID])
    REFERENCES [dbo].[GroupTables]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Table_GroupTable'
CREATE INDEX [IX_FK_Table_GroupTable]
ON [dbo].[Tables]
    ([GroupTableID]);
GO

-- Creating foreign key on [TableID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_Table]
    FOREIGN KEY ([TableID])
    REFERENCES [dbo].[Tables]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Table'
CREATE INDEX [IX_FK_Order_Table]
ON [dbo].[Orders]
    ([TableID]);
GO

-- Creating foreign key on [OrderID] in table 'OrderDishes'
ALTER TABLE [dbo].[OrderDishes]
ADD CONSTRAINT [FK_OrderDish_Order]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDish_Order'
CREATE INDEX [IX_FK_OrderDish_Order]
ON [dbo].[OrderDishes]
    ([OrderID]);
GO

-- Creating foreign key on [PromotionID] in table 'OrderDishes'
ALTER TABLE [dbo].[OrderDishes]
ADD CONSTRAINT [FK_OrderDish_Promotion]
    FOREIGN KEY ([PromotionID])
    REFERENCES [dbo].[Promotions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDish_Promotion'
CREATE INDEX [IX_FK_OrderDish_Promotion]
ON [dbo].[OrderDishes]
    ([PromotionID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------