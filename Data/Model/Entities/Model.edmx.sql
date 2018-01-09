USE [SushiRes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_GroupTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[Table]'))
ALTER TABLE [dbo].[Table] DROP CONSTRAINT [FK_Table_GroupTable]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [FK_SubCategory_Category]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Order]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Dish]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Dish]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Table]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Table]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish] DROP CONSTRAINT [FK_Dish_SubCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_Promotion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish] DROP CONSTRAINT [FK_Dish_Promotion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UK_Employee]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'UK_Employee')
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [UK_Employee]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table]') AND type in (N'U'))
DROP TABLE [dbo].[Table]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND type in (N'U'))
DROP TABLE [dbo].[Promotion]
GO
/****** Object:  Table [dbo].[OrderDish]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDish]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDish]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[GroupTable]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupTable]') AND type in (N'U'))
DROP TABLE [dbo].[GroupTable]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dish]') AND type in (N'U'))
DROP TABLE [dbo].[Dish]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/8/2018 10:13:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ClaimType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProviderKey] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RoleId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecurityStamp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Sex] [int] NULL,
	[Birthday] [date] NULL,
	[Phone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dish]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dish](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDelete] [bit] NOT NULL CONSTRAINT [DF_Dish_IsDelete]  DEFAULT ((0)),
	[Image] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [bigint] NOT NULL,
	[OrderTimes] [int] NOT NULL CONSTRAINT [DF_Dish_OrderTimes]  DEFAULT ((0)),
	[PromotionID] [int] NULL,
	[SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Department] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Position] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sex] [int] NOT NULL,
	[Birthday] [date] NULL,
	[Phone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedAt] [date] NULL,
	[IsDelete] [bit] NULL,
	[Avatar] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GroupTable]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_GroupTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[SubTotal] [bigint] NOT NULL,
	[PromotionDiscount] [bigint] NULL,
	[ClassDiscount] [bigint] NULL,
	[Total] [bigint] NULL,
	[Status] [int] NULL,
	[CustomerID] [int] NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Note] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TableID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderDish]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDish]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDish](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [bigint] NOT NULL,
	[Discount] [bigint] NULL,
	[DishID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Promotion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscountPercent] [float] NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateAt] [date] NOT NULL,
	[ExpireAt] [date] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Table]    Script Date: 1/8/2018 10:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Table](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [int] NOT NULL,
	[GroupTableID] [int] NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5085b50d-0907-4e27-b5c8-ffb73444b04d', N'Staff')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'97151c3d-06e0-4db8-ac8c-4a3191c7ba4e', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0cd43f9c-0502-49ae-b194-f9b615729a1d', N'5085b50d-0907-4e27-b5c8-ffb73444b04d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'97151c3d-06e0-4db8-ac8c-4a3191c7ba4e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7b7b2c7d-843c-41ca-a203-fee7af9ae134', N'97151c3d-06e0-4db8-ac8c-4a3191c7ba4e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c68dcc10-0e6e-405b-81c4-e19d74d87f25', N'5085b50d-0907-4e27-b5c8-ffb73444b04d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0cd43f9c-0502-49ae-b194-f9b615729a1d', N'admin2@sushires.com', 0, N'AAx+PDBP8JPFCX5qrpzCaeza84uo9/ZvYhHZF6F2mK9YPDg0SKZprjy9oOjJf+OFOg==', N'f5c03361-02d6-48e6-8fc1-ab0642ac3016', NULL, 0, 0, NULL, 1, 0, N'admin2@sushires.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'admin@sushires.com', 0, N'AIh4eq8z276vCilZSrRi3p0zqEEnz0yLK1TR0lDlefEpd+6vBWiBo2qzMHT3+/8Lhg==', N'52a223c9-a233-4684-b827-4669902d8021', NULL, 0, 0, NULL, 1, 0, N'admin@sushires.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7b7b2c7d-843c-41ca-a203-fee7af9ae134', N'staff@staff.staff', 0, N'AP66pmK5T4sLt2Mk2ezeolHhnXNMvwyHKMmUHmRnQ31812nkXqZonqKa+mfuXn6z5A==', N'e03ec0aa-7791-47be-8655-f3faa7e2b9bc', NULL, 0, 0, NULL, 1, 0, N'staff@staff.staff')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c68dcc10-0e6e-405b-81c4-e19d74d87f25', N'annienguyen.it@gmail.com', 0, N'AOyPQXdeBWjbl2SvqpbVvSlA27KRuVbDRVo0v7voklUDudyP1Q0hFXJr/+OawxbA8w==', N'c8a1ebfd-cbdf-44a1-87f4-4684f0ba3191', NULL, 0, 0, NULL, 1, 0, N'annienguyen.it@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (1, N'Món khai vị', N'Món khai vị')
GO
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (2, N'Món chính', N'Món chính không chỉ đơn giản là món ăn dùng sau khi thưởng thức món khai vị')
GO
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (3, N'Món tráng miệng', N'Món tráng miệng')
GO
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (4, N'Thức uống', N'Thức uống')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (1, N'Nguyen Linh', 2, CAST(N'2017-12-01' AS Date), N'1654917067', N'58/40B, Street 5, Linh Trung Ward, Thu Duc District, Ho Chi Minh City', 2, NULL, 0)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (2, N'Hoang Dang Tan Phat', 0, CAST(N'2017-12-02' AS Date), N'0123456789', N'Thị xã Dĩ An', 1, CAST(N'2017-12-23 16:35:04.000' AS DateTime), 0)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (3, N'Vo Thanh Thien Toán', 1, CAST(N'2017-12-02' AS Date), N'0988779302', N'Kí túc xá khu B', 0, CAST(N'2017-12-23 16:35:50.757' AS DateTime), 0)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (4, N'Hoang Dang Tan Phat', 2, CAST(N'2017-12-06' AS Date), N'0123456789', N'Thị xã Dĩ An', 0, CAST(N'2017-12-31 00:31:14.200' AS DateTime), 1)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (5, N'Hoang Dang Tan Phat', 2, CAST(N'2017-12-02' AS Date), N'0123456789', N'Thị xã Dĩ An', 0, CAST(N'2017-12-31 00:32:21.120' AS DateTime), 0)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (6, N'Hoang Dang Tan Phat', 2, CAST(N'2017-12-02' AS Date), N'0123456789', N'Thị xã Dĩ An', 0, CAST(N'2017-12-31 00:34:14.603' AS DateTime), 1)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (7, N'Nguyen Linh', 2, CAST(N'2018-01-01' AS Date), N'1654917067', N'58/40B, Street 5, Linh Trung Ward, Thu Duc District, Ho Chi Minh City', 0, CAST(N'2018-01-04 13:19:57.397' AS DateTime), 0)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Sex], [Birthday], [Phone], [Address], [Class], [CreateAt], [IsDelete]) VALUES (8, N'Phạm Thi Vương', 1, CAST(N'1990-01-06' AS Date), N'0123569874', N'Thủ Đức', 0, CAST(N'2018-01-08 22:02:23.110' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 

GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (1, N'Salad cá ngừ', N'Salad cá ngừ', 0, N'd9875648-9a18-4e79-8234-102a50c442de.jpg', 50000, 7, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (2, N'Salad rong biển', N'Salad rong biển', 0, N'b1668af0-e3da-4467-9b87-efc18386684d.jpg', 100000, 8, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (3, N'Salad dầu giấm', N'Salad dầu giấm', 0, N'b0e968a6-d2ad-45ba-8355-35c3005dbb38.png', 80000, 8, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (4, N'Salad hải sản', N'Salad hải sản', 0, N'0a0b86ea-0e55-4e4c-971b-db0363075e2b.jpeg', 70000, 4, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (5, N'Salad trái cây', N'Salad trái cây', 0, N'c7d72a4b-5bfb-4cf1-99c4-37c3a84bae91.jpg', 90000, 6, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (6, N'Salad cá hồi sống', N'Salad cá hồi sống', 0, N'31881385-d672-43f4-bbfc-134eb4cc996a.jpg', 150000, 6, 1002, 1)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (7, N'Soup cua', N'Soup cua', 0, N'5cabd110-02c4-4295-9e9e-fee0a275ab98.jpg', 50000, 0, 1002, 2)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (8, N'Soup bào ngư', N'Soup bào ngư', 0, N'16127d59-8034-4890-ad0e-977e7799ddde.jpg', 70000, 0, 1002, 2)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (10, N'Soup hải sản', N'Soup hải sản', 0, N'f291bbe8-46fe-42dc-be0f-afb97e4f5aae.jpg', 60000, 0, 1002, 2)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (11, N'Soup rau củ', N'Soup rau củ', 0, N'fec577d2-51f2-4523-92e3-b74f629a2cd3.jpg', 20000, 0, 1002, 2)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (12, N'Soup vi cá', N'Soup vi cá', 0, N'df5f8ce7-02c5-44c6-9d81-90cdc0f43f9b.jpg', 150000, 0, 1002, 2)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (13, N'Canh rong biển', N'Canh rong biển', 0, N'ff881b20-4019-4387-bf3d-93f063e322aa.jpg', 20000, 0, 1002, 6)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (15, N'Canh kim chi', N'Canh kim chi', 0, N'd57d2bdf-7f68-42ca-a045-32ffacaee66e.jpg', 50000, 0, 1002, 6)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (16, N'Canh sườn bò', N'Canh sườn bò', 0, N'f11dd632-d4b0-469d-8b23-4f334dbb26e7.jpg', 60000, 0, 1002, 6)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (17, N'Canh sốt tương đỗ', N'Canh sốt tương đỗ', 0, N'c73ee5f1-0e26-42d9-b8d1-83c53cbd8a2e.png', 60000, 0, 1002, 6)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (18, N'Canh tần sâm', N'Canh tần sâm', 0, N'770faac5-d577-45f0-9c3e-a49f0da6c76f.jpg', 100000, 0, 1002, 6)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (19, N'Đậu hủ chiên giòn', N'Đậu hủ chiên giòn', 0, N'0a01563a-9da9-401f-83ac-9b8c146aa766.jpg', 10000, 0, 1002, 7)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (20, N'Khoai tây chiên', N'Khoai tây chiên', 0, N'28aa5a05-fbf0-4ff5-b06f-bbde7e3d99c5.jpg', 20000, 0, 1002, 7)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (21, N'Khoai lang chiên ', N'Khoai lang chiên ', 0, N'5b8ec548-b0bb-413a-9ecf-dd98e31fa460.jpg', 30000, 0, 1002, 7)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (22, N'Kim chi', N'Kim chi', 0, N'04cae32f-3bb3-4642-969e-d66293651a37.jpg', 20000, 0, 1002, 8)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (23, N'Gừng ngâm', N'Gừng ngâm', 0, N'37b72f1b-dc47-4548-8274-b3ab77a0c4c0.jpg', 10000, 0, 1002, 8)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (24, N'Sushi cá hồi', N'Sushi cá hồi', 0, N'f713047d-cb38-461a-8996-f1af0f2badeb.jpg', 20000, 0, 1002, 4)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (25, N'Sushi cá trích ', N'Sushi cá trích ', 0, N'3b883148-4883-4793-92a9-3cef4e9ff643.jpg', 20000, 0, 1002, 4)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (26, N'Sushi cá ngừ', N'Sushi cá ngừ', 0, N'4f3783c3-a990-4507-b55d-5dd36c4d20a2.jpg', 20000, 0, 1002, 4)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (27, N'Sushi nhím biển', N'Sushi nhím biển', 0, N'4ea29de2-c010-4909-ba3f-9bd4755bfd0e.jpg', 30000, 0, 1002, 4)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (28, N'Sake cá hồi', N'Sake cá hồi', 0, N'9687b7cd-ff86-4621-bb2e-bda1a2732cb5.jpg', 300000, 0, 1002, 5)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (29, N'Churoto cá ngừ đỏ thẩm', N'Churoto cá ngừ đỏ thẩm', 0, N'1cd36c84-d7a3-4eb9-a008-7d3b1a67cd20.jpg', 200000, 0, 1002, 5)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (30, N'Ikura trứng cá hồi', N'Ikura trứng cá hồi', 0, N'e3b06423-aceb-4c5a-8c2d-79f880ba5c5e.jpg', 50000, 0, 1002, 5)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (31, N'Bánh caramel Jill Dupleix''s ', N'Bánh caramel Jill Dupleix''s ', 0, N'09d00974-f369-4149-bf8f-a78e222e2df5.jpg', 30000, 0, NULL, 10)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (33, N'Bánh pudding Brigitte Hafne''s', N'Bánh pudding Brigitte Hafne''s', 0, N'3f4e0de7-d691-41b4-bd91-71ed3992bed6.jpg', 30000, 0, NULL, 10)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (34, N'Chuối', N'Chuối', 0, N'b3f59549-4db0-4fa7-bb4a-b9365328f4b1.jpg', 10000, 2, NULL, 9)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (35, N'Dưa hấu', N'Dưa hấu', 0, N'9f95fa60-700f-413a-a98d-f975182660fd.jpg', 20000, 2, NULL, 9)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (36, N'Kiwi', N'Kiwi', 0, N'69606b92-9139-4401-bded-3d448a0d0ce8.jpg', 30000, 1, NULL, 9)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (37, N'Trà đào cam sả', N'Trà đào cam sả', 0, N'fa092995-caf3-4748-8391-123ab2f58fdf.jpg', 50000, 0, NULL, 13)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (38, N'Trà hoa cúc', N'Trà hoa cúc', 0, N'effd7fd1-712c-474f-8f20-ea10800d22d5.jpg', 60000, 0, NULL, 13)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (39, N'Trà hoa hồng', N'Trà hoa hồng', 0, N'609cd917-d48a-4ef8-b01f-4b6a59be7445.jpg', 20000, 0, NULL, 13)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (40, N'Coca cola', N'Coca cola', 0, N'47e8a489-07d0-44e6-8f42-b3114c5ba0f3.jpg', 10000, 0, NULL, 12)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (41, N'Pepsi', N'Pepsi', 0, N'634bbc3e-dfc9-4f5c-96b1-d928a934048c.jpg', 15000, 0, NULL, 12)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (42, N'Mirinda', N'Mirinda', 0, N'cdd3d3d7-4325-4d9f-ad2a-842b836e3435.jpg', 20000, 0, NULL, 12)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (43, N'Rượu Sochu hàn quốc', N'Rượu Sochu hàn quốc', 0, N'97085d47-508c-49bb-a2bf-d97d998a6937.jpg', 50000, 0, NULL, 11)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (44, N'Rượu vang đỏ', N'Rượu vang đỏ', 0, N'a3129e11-02c5-4a4a-acfa-957c7c6f5d3b.jpg', 600000, 0, NULL, 11)
GO
INSERT [dbo].[Dish] ([ID], [Name], [Description], [IsDelete], [Image], [Price], [OrderTimes], [PromotionID], [SubCategoryID]) VALUES (45, N'Rượu voka cá sấu', N'Rượu voka cá sấu', 0, N'535e06bc-789a-4234-9624-179434789fcd.jpg', 90000, 0, NULL, 11)
GO
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([ID], [Name], [Department], [Position], [Sex], [Birthday], [Phone], [Address], [CreatedAt], [IsDelete], [Avatar], [UserId]) VALUES (1, N'Linh', N'Nhà bếp 1', N'Thu ngân', 1, CAST(N'1996-06-11' AS Date), N'01654917067', N'abc', CAST(N'2017-05-26' AS Date), 0, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7')
GO
INSERT [dbo].[Employee] ([ID], [Name], [Department], [Position], [Sex], [Birthday], [Phone], [Address], [CreatedAt], [IsDelete], [Avatar], [UserId]) VALUES (2, N'bbb', N'bbb', N'bbb', 2, CAST(N'2017-12-14' AS Date), N'111', N'111', CAST(N'2017-05-26' AS Date), 0, NULL, N'0cd43f9c-0502-49ae-b194-f9b615729a1d')
GO
INSERT [dbo].[Employee] ([ID], [Name], [Department], [Position], [Sex], [Birthday], [Phone], [Address], [CreatedAt], [IsDelete], [Avatar], [UserId]) VALUES (3, N'Nguyen Linh', N'Nhaf beps', N'dau bep', 1, CAST(N'2018-01-01' AS Date), N'1654917067', N'58/40B, Street 5, Linh Trung Ward, Thu Duc District, Ho Chi Minh City', CAST(N'2018-01-04' AS Date), 0, NULL, N'c68dcc10-0e6e-405b-81c4-e19d74d87f25')
GO
INSERT [dbo].[Employee] ([ID], [Name], [Department], [Position], [Sex], [Birthday], [Phone], [Address], [CreatedAt], [IsDelete], [Avatar], [UserId]) VALUES (4, N'Nguyen Linh', N'1231', N'123', 1, CAST(N'2018-01-18' AS Date), N'01654917067', N'58/40B, Street 5, Linh Trung Ward, Thu Duc District, Ho Chi Minh City', CAST(N'2018-01-04' AS Date), 0, NULL, N'7b7b2c7d-843c-41ca-a203-fee7af9ae134')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (1, CAST(N'2017-12-30 17:51:23.057' AS DateTime), 540000, 0, 15, 459000, 1, 1, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 4)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (2, CAST(N'2018-01-03 20:17:07.947' AS DateTime), 202400, 27600, 5, 192280, 1, 3, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 4)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (3, CAST(N'2018-01-03 20:42:19.290' AS DateTime), 440000, 60000, 0, 440000, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 4)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (4, CAST(N'2018-01-03 20:42:45.723' AS DateTime), 272800, 37200, 0, 272800, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 5)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (5, CAST(N'2018-01-06 12:13:17.347' AS DateTime), 282000, 188000, 5, 267900, 1, 3, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 4)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (6, CAST(N'2018-01-06 12:25:29.097' AS DateTime), 324000, 216000, 0, 324000, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 10)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (7, CAST(N'2018-01-06 13:19:10.970' AS DateTime), 324000, 216000, 0, 324000, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 11)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (8, CAST(N'2018-01-08 22:03:02.147' AS DateTime), 150000, 60000, 0, 150000, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 11)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (9, CAST(N'2018-01-08 22:04:36.777' AS DateTime), 145000, 115000, 0, 145000, 1, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 11)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (10, CAST(N'2018-01-08 22:06:38.207' AS DateTime), 230000, 230000, 5, 218500, 0, 8, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 11)
GO
INSERT [dbo].[Order] ([Id], [CreateAt], [SubTotal], [PromotionDiscount], [ClassDiscount], [Total], [Status], [CustomerID], [UserId], [Note], [TableID]) VALUES (11, CAST(N'2018-01-08 22:08:52.897' AS DateTime), 155000, 155000, 0, 155000, 0, NULL, N'78d5a7af-a05f-4b5a-a542-b062e789c4a7', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDish] ON 

GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (1, 1, 50000, 0, 1, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (2, 1, 100000, 0, 2, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (3, 1, 80000, 0, 3, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (4, 1, 150000, 0, 6, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (5, 1, 70000, 0, 4, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (6, 1, 90000, 0, 5, 1)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (7, 1, 50000, 6000, 1, 2)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (8, 1, 100000, 12000, 2, 2)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (9, 1, 80000, 9600, 3, 2)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (10, 1, 100000, 12000, 2, 3)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (11, 2, 80000, 9600, 3, 3)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (12, 1, 150000, 18000, 6, 3)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (13, 1, 90000, 10800, 5, 3)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (14, 1, 90000, 10800, 5, 4)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (15, 1, 150000, 18000, 6, 4)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (16, 1, 70000, 8400, 4, 4)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (17, 1, 50000, 20000, 1, 5)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (18, 1, 100000, 40000, 2, 5)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (19, 1, 80000, 32000, 3, 5)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (20, 1, 90000, 36000, 5, 5)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (21, 1, 150000, 60000, 6, 5)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (22, 1, 50000, 20000, 1, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (23, 1, 100000, 40000, 2, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (24, 1, 80000, 32000, 3, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (25, 1, 150000, 60000, 6, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (26, 1, 90000, 36000, 5, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (27, 1, 70000, 28000, 4, 6)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (28, 1, 50000, 20000, 1, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (29, 1, 100000, 40000, 2, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (30, 1, 80000, 32000, 3, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (31, 1, 150000, 60000, 6, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (32, 1, 90000, 36000, 5, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (33, 1, 70000, 28000, 4, 7)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (34, 1, 50000, 20000, 1, 8)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (35, 1, 100000, 40000, 2, 8)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (36, 1, 10000, 0, 34, 8)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (37, 1, 20000, 0, 35, 8)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (38, 1, 30000, 0, 36, 8)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (39, 1, 10000, 0, 34, 9)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (40, 1, 20000, 0, 35, 9)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (41, 1, 50000, 25000, 1, 9)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (42, 1, 100000, 50000, 2, 9)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (43, 1, 80000, 40000, 3, 9)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (44, 1, 50000, 25000, 1, 10)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (45, 1, 100000, 50000, 2, 10)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (46, 1, 150000, 75000, 6, 10)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (47, 1, 90000, 45000, 5, 10)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (48, 1, 70000, 35000, 4, 10)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (49, 1, 50000, 25000, 1, 11)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (50, 2, 80000, 40000, 3, 11)
GO
INSERT [dbo].[OrderDish] ([Id], [Quantity], [UnitPrice], [Discount], [DishID], [OrderID]) VALUES (51, 1, 100000, 50000, 2, 11)
GO
SET IDENTITY_INSERT [dbo].[OrderDish] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotion] ON 

GO
INSERT [dbo].[Promotion] ([Id], [DiscountPercent], [Name], [Description], [CreateAt], [ExpireAt]) VALUES (1, 12, N'12', N'12', CAST(N'2017-12-30' AS Date), CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[Promotion] ([Id], [DiscountPercent], [Name], [Description], [CreateAt], [ExpireAt]) VALUES (2, 40, N'Noel', N'Noel', CAST(N'2018-01-03' AS Date), CAST(N'2018-01-05' AS Date))
GO
INSERT [dbo].[Promotion] ([Id], [DiscountPercent], [Name], [Description], [CreateAt], [ExpireAt]) VALUES (1002, 50, N'Báo cáo đồ án nên khuyến mãi', N'Báo cáo đồ án nên khuyến mãi', CAST(N'2018-01-08' AS Date), CAST(N'2018-01-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (1, N'Salad', N'Salad', 1)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (2, N'Soup', N'Soup', 1)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (4, N'Sushi', N'Sushi', 2)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (5, N'Sashimi', N'Sashimi', 2)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (6, N'Canh', N'Canh', 2)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (7, N'Món chiên', N'Món chiên', 2)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (8, N'Món ăn kèm', N'Món ăn kèm', 2)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (9, N'Trái cây', N'Trái cây', 3)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (10, N'Bánh', N'Bánh', 3)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (11, N'Rượu', N'Rượu', 4)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (12, N'Nước ngọt', N'Nước ngọt', 4)
GO
INSERT [dbo].[SubCategory] ([ID], [Name], [Description], [CategoryID]) VALUES (13, N'Trà', N'Trà', 4)
GO
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Table] ON 

GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (1, N'1', N'Bàn 1', 2, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (2, N'2', N'Bàn 2', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (3, N'3', N'Bàn 3', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (4, N'Bàn 4', N'Bàn 4', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (5, N'Bàn 5', N'Bàn 5', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (6, N'Bàn 6', N'Bàn 6', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (7, N'Bàn 7', N'Bàn 7', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (8, N'Bàn 8', N'Bàn 8', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (9, N'1111', N'1111', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (10, N'bàn 10', N'bàn 10', 0, NULL)
GO
INSERT [dbo].[Table] ([Id], [Code], [Description], [Status], [GroupTableID]) VALUES (11, N'Bàn 11', N'Bàn 11', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Table] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Employee]    Script Date: 1/8/2018 10:13:35 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'UK_Employee')
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UK_Employee] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_Promotion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_Promotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotion] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_Promotion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_Promotion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dish_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dish]'))
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_SubCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Table]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Table] FOREIGN KEY([TableID])
REFERENCES [dbo].[Table] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Table]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Table]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Dish]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderDish_Dish] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dish] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Dish]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish] CHECK CONSTRAINT [FK_OrderDish_Dish]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderDish_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDish_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDish]'))
ALTER TABLE [dbo].[OrderDish] CHECK CONSTRAINT [FK_OrderDish_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_GroupTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[Table]'))
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_GroupTable] FOREIGN KEY([GroupTableID])
REFERENCES [dbo].[GroupTable] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_GroupTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[Table]'))
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_GroupTable]
GO
