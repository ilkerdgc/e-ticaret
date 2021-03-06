USE [master]
GO
/****** Object:  Database [ECommerceDB]    Script Date: 11.10.2017 20:37:20 ******/
CREATE DATABASE [ECommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerceDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerceDB_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerceDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ECommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ECommerceDB]
GO
/****** Object:  Table [dbo].[Admin_Employees]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Age] [int] NULL,
	[BirthDate] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin_Logins]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Logins](
	[loginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[loginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Picture1] [nvarchar](255) NULL,
	[Picture2] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserName] [nchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Organization] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[AltEmail] [nvarchar](50) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[Mobile1] [nvarchar](50) NULL,
	[Mobile2] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Picture] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[LastLogin] [nvarchar](50) NULL,
	[Created] [date] NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK__Customer__A4AE64B862085004] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainSliders]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainSliders](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[AltText] [nvarchar](255) NULL,
	[OfferTag] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[BtnText] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK__OrderDet__9DD74D9D370F4601] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[IsCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [nvarchar](500) NULL,
	[CancelOrder] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](50) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[UnitWeight] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Discount] [decimal](18, 2) NULL,
	[UnitsInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[AltText] [nvarchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OjjerTitle] [nvarchar](50) NULL,
	[OjjerBadgeClass] [nvarchar](50) NULL,
	[ShortDescription] [nvarchar](300) NULL,
	[LongDescription] [nvarchar](2000) NULL,
	[Picture1] [nvarchar](500) NULL,
	[Picture2] [nvarchar](500) NULL,
	[Picture3] [nvarchar](500) NULL,
	[Picture4] [nvarchar](500) NULL,
	[Note] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PromoRights]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoRights](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[AltText] [nvarchar](500) NULL,
	[OfferTag] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Review] [nvarchar](500) NULL,
	[Rate] [int] NULL,
	[Datetime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Province] [nvarchar](20) NULL,
	[City] [nvarchar](20) NULL,
	[PostCode] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Picture1] [nvarchar](500) NULL,
	[Picture2] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SuppliersID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Mobile] [nvarchar](15) NULL,
	[Phone] [nvarchar](15) NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[City] [nvarchar](20) NULL,
	[Country] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SuppliersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wishlists]    Script Date: 11.10.2017 20:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlists](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin_Employees] ON 

INSERT [dbo].[Admin_Employees] ([EmpID], [FirstName], [LastName], [Age], [BirthDate], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (2, N'İlker', N'Dağcı', 22, CAST(N'1995-06-07' AS Date), N'Erkek', N'ilker.dagcii@gmail.com', N'Yeşilbayır', N'05413846414', N'05413846414', NULL)
SET IDENTITY_INSERT [dbo].[Admin_Employees] OFF
SET IDENTITY_INSERT [dbo].[Admin_Logins] ON 

INSERT [dbo].[Admin_Logins] ([loginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (1, 2, N'ilkerdgc', N'123', 2, NULL)
SET IDENTITY_INSERT [dbo].[Admin_Logins] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture1], [Picture2], [IsActive]) VALUES (1, N'Filmler', N'En Güzel Filmler Burada!', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [UserName], [Password], [Age], [Gender], [BirthDate], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [Status], [LastLogin], [Created], [Notes]) VALUES (1, N'İlker', N'Dağcı', N'ilkerdgc                                          ', N'1903', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [IsCompleted], [OrderDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (1, N'Ajan Salt', 1, 1, 1, N'1', CAST(24.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(10.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/aksiyon/ajan.salt.jpg', N'Ajan Salt', NULL, NULL, NULL, N'Aksiyon', N'CIA ajanı Evelyn Salt , başkana suikast yapan bir Rus casusu olmaktan dolayı suçlanıyor.Salt başka birinin suikast düzenlediğini ve kendi suçsuzluğunu kanıtlaması gerekmektedir.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (2, N'Asla Pes Etme', 6, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/aksiyon/asla.pes.etme.jpg', N'Asla Pes Etme', NULL, NULL, NULL, N'Aksiyon', N'Jake’in hayatındaki yeni dönüşümler, okulun en güzel kızı Baja ile tanışmasıyla başlar. Onun davetiyle bir partiye katılan Jake, 
orada Ryan adlı bir gençle istemeden kavga eder. Dövüşü kaybedince de çevresi tarafından küçümsenmeye başlar. 
Arkadaşı Max, Jake’e karışık savunma sanatları sporundan bahseder. Jake, bu sporun başlı başına bir sanat olduğunu fark eder.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (3, N'Blade', 3, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/aksiyon/blade.jpg', N'Blade', NULL, NULL, NULL, N'Aksiyon', N'Serinin 3. ve son filminde işler oldukça kararıyor. Vampirlerin yoğun çabaları ile uyandırılan Dracula uyandırılma sebebinin 
vampir soyunu yok etmeye yemin etmiş savaşçı olan Blade''i yok etmek olduğunu öğrenir. Dracula''nın neden uyandırıldığını 
öğrenen Blade kendini inanılmaz bir savaşın içerisinde bulacaktır. Blade''e destek sözü veren ekipler Draculayı durdurmak için 
iş başına koyulurlar ancak Dracula sıradan bir düşman olmadığını çok sürmeden anlayacaklar...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (4, N'Cehennem Melekleri', 2, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/aksiyon/cehennem.melekleri.jpg', N'Cehennem Melekleri', NULL, NULL, NULL, N'Aksiyon', N'The Expandables bir kiralık savaş timidir ve bu sefer ki görevleri Güney Amerika''da bir ülkeye sızarak, bu ülkenin acımasız dikatatörünü devirmektir.. Fakat görev başlar başlamaz The Expandables grubu herşeyin tam olarak göründüğü gibi olmadığını anlar ve kendilerini tehlikeli bir ihanet ağının içerisinde bulurlar. Görevlerinin tamamlanmasının engellenmesi ve masum bir insanın hayatının tehlikeye atılmasından başka The Expandables grubu daha zor bir durum olan grubun dağılma tehlikesiyle karşı karşıyadır..', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (5, N'Fury', 4, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/aksiyon/fury.jpg', N'Fury', NULL, NULL, NULL, N'Aksiyon', N'1945 yılının Nisan ayında ikinci Dünya Savaşı’nın son ayları. Avrupa Tiyatrosunda müttefikler son kozlarını oynarken, 
savaş ile yorulmuş ordu çavuşu Wardaddy (Brad Pitt), bir Sherman tankını yönetmektedir ve düşman hattı ardında ölümcül bir görev 
üstlenen beş kişilik bir ekibi vardır. Çok az sayıda ve yeterince silahı olmayan Wardaddy ve adamları, Nazi Almanya’sının kalbini 
vurmak için kahramanlıkları içerisinde tehlikeye atılmaktadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (6, N'Görevimiz Tehlike 5', 5, 1, 1, N'1', CAST(27.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 14, NULL, 1, N'~/images/aksiyon/Gorevimiz.tehlike.5.jpg', N'Görevimiz Tehlike 5', NULL, NULL, NULL, N'Aksiyon', N'31 Temmuz''da ülkemizde gösterime giren 2015 yapımı Görevimiz Tehlike serisinin son filmi 5, IMDB''den 7.5/10 gibi oldukça 
iyi bir puan alarak tüm kalitesini biz sinemaseverlere göstermiştir. Yönetmenlik koltuğunda dünyaca ünlü isim 
Christopher McQuarrie''nin bulunduğu aksiyon ve macera türündeki yapımda başrolleri ise dünyaca ünlü aktör ve aktristlerden Tom Cruise , 
Jeremy Renner ve Rebecca Ferguson paylaşıyor. Filmde, Ethan Hunt ve güçlü ekibi, şuana kadar girdikleri en zorlu göreve doğru adım atacaklar. 
Syndicate adındaki uluslarası bir dolandırıcılık çetesini yok etmek için zorlu bir göreve girecek olan Ethan Hunt ve ekibi, 
IMF organizasyonu çökertmeye çalıþan bu çeteye asla geçit vermeyeceklerdir. Bu çetenin amaçlarına ulaşmaması için büyük bir mücadele vermeye 
hazır olan Ethan Hunt, ekibiyle harikalar çıkarmak için var gücünü ortaya koyacaktır..', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (7, N'Hızlı ve Öfkeli', 6, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/aksiyon/hizli.ve.ofkeli.jpg', N'Hızlı ve Öfkeli', NULL, NULL, NULL, N'Aksiyon', N'Henüz daha şafak sökmeden Amerika''nın ıssız sokaklarında büyük paraların ortaya atıldığı bir araba yarışı dönmektedir.
Gerçek ismi Vin Diesel olan filmdeki ismiyle Dominic hayatını arabalara ve araba yarışlarına adamıştır. 
Onun için önemli olan çok sevdiği kız kardeşi Mia''yı kendine aşık eden Brian adındaki genç Dominic''in yanında yarıþa katılmak ister. Fakat kimse Brian''ın polis olduğunu bilmemektedir.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (8, N'Karayip Korsanları', 3, 1, 1, N'1', CAST(26.50 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 13, NULL, 1, N'~/images/aksiyon/karayip.korsanlari.jpg', N'Karayip Korsanları', NULL, NULL, NULL, N'Aksiyon', N'Hafif üçkağıtçı fakat bir o kadar da sevimli Kaptan Jack Sparrow’un (Johnny Depp) korsanlık yaşamı, düşmanı kurnaz Kaptan Barbossa’nın (Geoffrey Rush), 
gemisi Siyah İnci’yi çalmasıyla altüst olur. Bu da yetmezmiş gibi Kaptan Barbossa, Port Royal kasabasına saldırır ve belediye başkanının 
güzeller güzeli kızı Elizabeth’i (Keira Knightley) kaçırır. Kızı kurtarmak ve Siyah İnci’yi yeniden ele geçirmek amacıyla Elizabeth’in 
çocukluk arkadaşı Will (Orlando Bloom) ve Jack güçlerini birleştirirler. Will’in bilmediği ise lanetli bir hazinenin Barbossa’nın kaderini 
nasıl değiştirdiği ve onu ve mürettebatını nasıl sonsuza kadar ölümsüz olarak yaþamaya mahkum ettiğidir.
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (9, N'Koruyucu', 1, 1, 1, N'1', CAST(20.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 5, NULL, 1, N'~/images/aksiyon/koruyucu.jpeg', N'Koruyucu', NULL, NULL, NULL, N'Aksiyon', N'10 yaşındaki Mei ismindeki Çinli kız çok farklı ve değerli bir matematik zekasına sahiptir. Mei, hiçbir kağıt ve kalem kullanmadan Çin’in 
en büyük mafyalarından bir tanesinin haraç ve rüşvet bilgilerini aklında tutmaktadır. Mafya kanıtları ortadan kaldırmak için kızı Amerika’ya 
yollar. Luke Wright ise New Jersey’de yaşayan ve uzak doğu dövüş sporları yapan bir kişidir. Luke, bir müsabakada Rus mafyasının bir şikesini 
bozar ve bütün hayatı değişir. Rus mafyası Luke Wright’ýn tüm ailesini öldürür, tüm parasını alır ve yakınlaştığı herkesi öldürmekle tehdit 
eder. Metronun önüne atlayarak intihar etmeye karar veren Luke, Mei ile karşılaşır. Filmin baþrolünde ünlü oyuncu Jason Statham yer almaktadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (12, N'MÖ On Bin', 2, 1, 1, N'1', CAST(19.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 8, NULL, 1, N'~/images/aksiyon/m.o.10000.jpg', N'MÖ On Bin', NULL, NULL, NULL, N'Aksiyon', N'Uzak bir dağ kabilesinde, genç avcı D’Leh (Steven Strait) kalbinin kraliçesini bulmuştur: Güzel Evolet (Camilla Belle). Gizemli bir savaşçı grup, köyünü yağmalayıp, Evolet’i kaçırınca, D’Leh sevdiği kadını kurtarmak için savaşçıların peşinden dünyanın öbür ucuna kadar gitmek üzere küçük bir avcı grubuna önderlik etmek zorunda kalır. Kaderin rüzgarına kapılan bu zoraki savaşçı-avcı grup, kılıç dişli kaplanlar ve tarih öncesi yırtıcılarıyla mücadele eder; kahramanca yolculuklarının sonunda bir Kayıp Uygarlığı ortaya çıkarırlar. Nihai kaderlerinde dev piramitlerin gökyüzüne uzandığı, hayalgücünün ötesinde bir imparatorluk vardır. Burada D’Leh’inin halkını zorla köleleştiren güçlü bir tanrıyla karşı karşıya gelecektirler.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (13, N'Mekanik', 3, 1, 1, N'1', CAST(24.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 11, NULL, 1, N'~/images/aksiyon/mekanik.jpg', N'Mekanik', NULL, NULL, NULL, N'Aksiyon', N'1972 yılında Charles Bronson’un duygusuz, soğukkanlı ve ultra profesyonel bir kiralık katili canladırdığı klasik bir kiralık katil filmi olan The Mechanic, yönetmen Simon West tarafından remake''lenip tekrar piyasaya sunuluyor.Mekanik, uluslararası boyuttaki bir yeraltı ögütlenmesinin, muhbirler ve olası düşmanlarını yok eden suikastçılarına verilen isimdir. Arthur Bishop eli çabuk ve temiz ve profesyonelce iş çıkaran bir mekaniktir. Öyle ki örgütle arasında ki bir numaralı arabulucu olan "menejeri" Koca Harry''i dahi yoketmekten çekinmez.Baba yadigarı mesleğini sürdürürken, müebbet yalnız olmanın üzerine getirdiği psikolojik yükü ise olanca gücüyle sırtlamaya çalışmaktadır. İç çalkantıları ile boğuşurken Harry''nin doyumsuz ve soğukkanlı oğlu Steve (Ben Foster) ile aralarında ilginç bir ortaklık doğar', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (14, N'Ölüm Yarışı', 5, 1, 1, N'1', CAST(19.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/aksiyon/olum.yarisi.jpg', N'Ölüm Yarışı', NULL, NULL, NULL, N'Aksiyon', N'Azılı suçlularla tıkabasa dolu bir hapishanenin yöneticileri, cezaevindeki mahkumları birbirleriyle dövüşmeye zorlayarak, bol miktarda para kazanabilecekleri, tüyler ürpertici bir çeşit gladyatör oyunu düzenlemeye karar verirler. Adrenalin yüklü, şiddet arzusuyla yanıp tutuşan mahkumlarsa bir arenaya çıkıp birbirleriyle ölesiye mücadele etmeye dünden hazırdırlar. Üç şampiyonluk kazanmış otomobil yarışçısı Jensen Ames (Jason Statham), vahşi koşulların hüküm sürdüğü bu dünyada hayatta kalmayı başarma konusunda bir uzman olup çıkmıştır. Eski bir dolandırıcı olan Ames, tam hayatını düzene koyduğunu düşündüğü bir anda işlemediği bir cinayet yüzünden hapse atılmıştır. Öldürülmesi imkansız olarak kabul edilen mistik sürücü Frankenstein maskesini giymek zorunda bırakılan Ames’ın önüne, Cezaevi’nin despot yöneticisi (Joan Allen) tarafından iki seçenek konulur: Gladyatör oyununa katılırsa özgürlüğüne kavuşabilecek, katılmazsa hücreye kapatılıp orada çürümeye terk edilecektir. Yüzü metalik bir maskeyle kapatılan Ames üç gün boyunca devam edecek son derece zorlu bir ölüm yarışında hayatta kalmaya çalışır. Bu sürede özgürlüğüne kavuşabilmek için dünyanın en acımasız mahkumlarına karşı ölümüne mücadele etmek zorundadır. Makineli tüfekler, alev makineleri ve el bombası mancınıklarıyla donatılmış bir otomobil kullanan bu çaresiz adam, dünyanın en vahşi sporunu kazanabilmek için önüne çıkan her engeli ve her kişiyi yok etmek zorundadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (15, N'Orman Çocuğu', 6, 1, 1, N'1', CAST(25.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 20, NULL, 1, N'~/images/aksiyon/orman.cocugu.jpg', N'Orman Çocuğu', NULL, NULL, NULL, N'Aksiyon', N'Mowgli (Neel Sethi), bebekken geldiği ormanda kurtlar tarafından büyütülmüş, siyah panter Bagheera''nın (orijinal seslendirme Ben Kingsley) akıl hocalığıyla çok şey öğrenmiş bir çocuktur. Ancak insanlardan hoşlanmayan Bengal kaplanı Shere Khan (orijinal seslendirme Idris Elba) onu ormanda istemeyince evi bildiği tek yeri terk etmek zorunda kalır. Yolculuk boyunca birbirinden değişik yaratıklarla ve durumlarla karşılaşan Mowgli, kendini keşfetmek yolunda çok daha fazlasını öğrenecektir.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (16, N'Otel Transilvanya', 4, 1, 1, N'1', CAST(19.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 19, NULL, 1, N'~/images/aksiyon/otel.transilvanya.jpg', N'Otel Transilvanya', NULL, NULL, NULL, N'Aksiyon', N'Dracula, insanların dünyasından uzakta bir otel işletiyordur. Bir gün, bir çocuk kontun ergenlik çağındaki kızına aşık olunca aşırı korumacı davranır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (17, N'Sharlock Holmes', 3, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/aksiyon/sherlock.holmes.jpg', N'Sharlock Holmes', NULL, NULL, NULL, N'Aksiyon', N'Arthur Conan Doyle’un dünyaca ünlü karakteri Sherlock Holmes’ün dinamik yeni uyarlamasında Holmes ve cesur ortağı Watson en son maceralarına atılıyorlar.Dövüş tekniklerini, efsanevi zekası gibi silah olarak kullanan Holmes, bu macerasında ülkesini yok edebilecek ölümcül bir komployu aydınlatmak için yeni bir düşman ile savaşıyor.Robert Downey Jr., efsanevi dedektif Sherlock Holmes’ü daha önce hiç yapılmamış bir şekilde canlandırıyor. Jude Law doktor ve bir savaş gazisi olan, Holmes’ün güvenilir çalışma arkadaşı Watson rolünde yer alıyor., Holmes’ü alt eden ilk ve tek kadın olan ve dedektifle halen çalkantılı bir ilişki sürdüren Irene Adler rolünü Rachel McAdams üstleniyor. Mark Strong gizemli yeni düşman Blackwood rolünü oynuyor. Kelly Reilly ise Watson’ın ilgilendiği Mary rolünde yer alıyor.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (18, N'Thor', 1, 1, 1, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 22, NULL, 1, N'~/images/aksiyon/thor.jpg', N'Thor', NULL, NULL, NULL, N'Aksiyon', N'Kenneth Branagh’ın yönettiği ve Chris Hemsworth, Natalie Portman, Tom Hiddleston ile Stellan Skarsgard’ın oynadığı Thor serisinin 1. filmi, 29 Nisan 2011’de UIP Filmcilik dağıtımıyla UIP Filmcilik tarafından vizyona çıkarıldı. Hikâyenin merkezinde, düşüncesiz tavırlarıyla antik bir savaşı tekrar başlatan güçlü ama ve kibirli savaşçı Yüce Thor var. Thor, Dünya’ya sürgün ediliyor ve insanlar arasında yaşamaya mecbur bırakılıyor. Kendi dünyasının kötü adamı en karanlık güçlerini Dünya’yı istilâ etmek için yollayınca Thor, gerçek bir kahraman olmak için nelerin gerektiğini öğreniyor.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (19, N'Yüzüklerin Efendisi', 2, 1, 1, N'1', CAST(25.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 14, NULL, 1, N'~/images/aksiyon/yuzuklerin.efendisi.jpg', N'Yüzüklerin Efendisi', NULL, NULL, NULL, N'Aksiyon', N'Çok eski çağlarda Elf demircileri, güç yüzüklerini sihirli ustalıklarıyla yapmış ve Karanlıkların Efendisi Sauron, bu yüzükleri işleyip kendi gücüyle doldurmuştur. Daha sonra kendisinden çalınan, diğer tüm yüzüklere hükmeden, Tek Yüzüğü bütün gücüyle tüm Orta Dünya''da aramasına rağmen bulamamıştır.
Yüzük, Shire Bölgesi''nde yaşayan Frodo Baggins adlı bir hobbitte bulunmaktadır. Ancak çok büyük bir güce sahip bu yüzüğü yok etmek gerekmektedir. Frodo ve arkadaşları, diğer ırklardan gelen arkadaşlarıyla birlikte yüzük kardeşliğini oluşturur ve hepsi bu yolculukta büyücü Gri Gandalf''ı izler.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (20, N'Zamana Karşı', 5, 1, 1, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 11, NULL, 1, N'~/images/aksiyon/zamana.karsi.jpg', N'Zamana Karşı', NULL, NULL, NULL, N'Aksiyon', N'İnsanların yaşlanmayı durdurduğu yakın bir gelecekte geçecek olan filmde insanlar 25 yaşından sonra artık daha fazla yaşlanmayacağını ve ölümsüzlüğün sırrına erişildikten sonra yaşananları anlatan bir yapım " parası olanın sonsuza kadar yaşayabileceği bir dünyanın”. Filmde, zamanın altın değerinde olduğu bu yeni dünyada insanlar, ölümsüzlüğün peşinde koşarak hayatta kalma mücadelesine girerler. Bu nedenle, nüfus artışının son haddeye varmasıyla, yeni düzenlemelere girişen insanoğlunun hikâyesi filmde anlatılıyor.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (21, N'Zor Biraderler', 6, 1, 1, N'1', CAST(19.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/aksiyon/zor.biraderler.jpg', N'Zor Biraderler', NULL, NULL, NULL, N'Aksiyon', N'Bir lisede güvenlik görevlisi olarak çalışan bir video oyun bağımlısı Ben (Hart), hizmet madalyası sahibi disiplinli ve sert bir dedektif olan James’in (Cube) kız kardeşi Angela’ya (Tika Sumpter) aşıktır. Ancak James, geveze Ben''in kız kardeşini hak etmediğini düşünmektedir, bu nedenle birlikte olmalarına karşı çıkar. Ben ise kendini kanıtlayabilmek için her şeyi yapmaya, hatta polis olmaya bile razıdır.
Ben, sonunda akademiye kabul edilince tecrübeli polisin saygısını kazandığını düşünür ancak James, öğrencisini korkutmak üzere tasarlanan bir devriye görevine davet eder. Ama bu çılgın gece kendilerini Atlanta''nın en kötü suçlusuna götürdüğünde James, yeni ortağının hızlı konuşmasının en az üzerine gelen kurşunlar kadar tehlikeli olduğunu görecektir.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (22, N'Zor Ölüm', 4, 1, 1, N'1', CAST(20.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 13, NULL, 1, N'~/images/aksiyon/zor.olum.jpg', N'Zor Ölüm', NULL, NULL, NULL, N'Aksiyon', N'1988′deki ilk Zor Ölüm’den beri John McClane (Bruce Willis) kendini yanlış zamanda yanlış yerde buluyor, yetenekleri, cesareti ve yöntemleri sayesinde her zaman ayakta kalan son insan oluyor, bu  karakteri de onu teröristlerin gözünde bir numara yapıyor. Şimdi, McClane ömrünün en büyük mücadelesi ile karşı karşıya, bu sefer olay uluslararası boyutta, oğlu Jack hapishaneden kaçan acımasız Rus lideri tarafından kaçırılır, baba ve oğul McClane birbirlerini yaşatabilmek ve dünyanın güvenliğini korumak adına yeraltı güçlerine karşı beraber çalışmalıdır. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (23, N'İki Bin On İki', 2, 1, 2, N'1', CAST(19.50 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/bilimkurgu/2012.jpg', N'İki Bin On İki', NULL, NULL, NULL, N'Bilim Kurgu', N'Büyük bütçeli felaket filmlerinin değişmez yönetmeni Roland Emmerich yine benzer bir yapımla karşımızda. Bazı teorisyenlere göre 21 Aralık 2012 tarihinde dünyanın sonunun geleceğini öngören Maya medeniyetinin bu öngörüsünün doğru çıktığı bir geleceğin anlatıldığı 2012 adlı filmde insanların hayatta kalma mücadelelerine tanık oluyoruz. Filmin kadrosu oldukça sağlam: John Cusack , Thandie Newton , Woody Harrelson , Amanda Peet , Danny Glover , Oliver Platt ve Chiwetel Ejiofor ilk göze çarpan isimler.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (24, N'Açlık Oyunları', 6, 1, 2, N'1', CAST(26.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 18, NULL, 1, N'~/images/bilimkurgu/Açlık.Oyunları.jpg', N'Açlık Oyunları', NULL, NULL, NULL, N'Bilim Kurgu', N'Bir zamanlar Kuzey Amerika olarak bilinen bir yerin yıkıntıları içerisinde Panem ulusu yaşamaktadır. Başkentin etrafındaki 12 bölge bir hat boyunca sıralanmıştır. Bütün bölgeler, her yıl yapılan Açlık Oyunları’nın yarışmasına yaşları 12 ilâ 18 arasında değişen bir erkek ve bir kız çocuğu göndermek zorundadır. Açlık Oyunları TV’den yayınlanan ölümüne bir kavgadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (25, N'Ben Kimim', 5, 1, 2, N'1', CAST(27.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 25, NULL, 1, N'~/images/bilimkurgu/ben.kimim.jpg', N'Ben Kimim', NULL, NULL, NULL, N'Bilim Kurgu', N'Toplumla fazla bir ilişkisi bulunmayan genç bir hacker olan Benjamin (Tom Schilling), Max (Elyas M''Barek) adında bir başka hacker''la tanışır. Stephan ve Paul adlı yazılım ve donanım uzmanlarıyla birlikte CLAY adında bir hacker''lar grubu kurarlar. CLAY son derece yıkıcı faaliyetleriyle adını duyurmaktadır. Europol ve istihbarat teşkilatlarını peşine takan grup için işler yolunda gitse de onları hedefine alan karanlık bir hacker grubu, onlarla her yoldan rekabet etmeye çalışacaktır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (26, N'Başlangıç', 1, 1, 2, N'1', CAST(22.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 16, NULL, 1, N'~/images/bilimkurgu/inception.jpg', N'Başlangıç', NULL, NULL, NULL, N'Bilim Kurgu', N'Dom Cobb (Leonardo DiCaprio) çok yetenekli bir hırsızdır. Uzmanlık alanı, zihnin en savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır. Cobb’un bu ender mahareti, onu kurumsal casusluğun tehlikeli yeni dünyasında aranan bir oyuncu yapmıştır. Ancak, aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği herşeye malolmuştur. Cobb’a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkansız başlangıçı tamamlayabilirse... Mükemmel soygun yerine, Cobb ve takımındaki profesyoneller bu sefer tam tersini yapmak zorundadır; görevleri bir fikri çalmak değil onu yerleştirmektir. Eğer başarırlarsa, mükemmel suç bu olacaktır. Ama ne dikkatle yapılan planlamalar, ne de uzmanlıkları, onları, her hareketlerini önceden tahmin ettiği anlaşılan tehlikeli düşmanlarına karşı hazırlıklı kılabilir. Bu, gelişini sadece Cobb’un görebildiği bir düşmandır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (27, N'Kuralsız', 2, 1, 2, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/bilimkurgu/kuralsız.jpg', N'Kuralsız', NULL, NULL, NULL, N'Bilim Kurgu', N'Tris Prior (Shailene Woodley) sevdiği insanları ve kendini kurtarmak için amansız bir savaş vermektedir. Bir yandan da fedakarlık, kimlik, bağlılık, kurallar ve aşkla ilgili evrensel sorunlarla boğuşmaktadır. Üstelik savaş başlamak üzeredir ve herkes bir tarafı seçmek zorundadır, tarafsızlık söz konusu değildir. Telafisi mümkün olmayan hatalar söz konusudur ve Tris''in tek şansı "Uyumsuz"luğunu kabul edip öyle mücadeleye devam etmesidir.
Veronica Roth''un çok satan kitap serisinin Uyumsuz''dan (Divergent) sonraki ikinci kitabı Kuralsız''ın (Insurgent) film uyarlaması, 20 Mart 2015''te Türkiye''deki izleyicilerle buluştu.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (28, N'Labirent', 3, 1, 2, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/bilimkurgu/labirent.jpg', N'Labirent', NULL, NULL, NULL, N'Bilim Kurgu', N'Thomas(Dylan O''Brien) adlı bir genç, beraberinde 60 çocukla birlikte bir labirente hapsolur. Uyandığında kendisini labirentte bulan Thomas ismi haricinde hiçbirşey hatırlamamaktadır. Thomas, Glade adını verdikleri bir tür kapalı kasabamsı alanda olduklarını öğreniyor. Burada yetişkinler yok. Sadece onlu yaşlarında erkek çocuklar var. Ve hepsinin de ayrı bir görevi. Bir şekilde hayata tutunmaya, bir şeyler yapmaya çalışırken, diğer yandan da bulundukları yerden çıkmaya çalışmaktadırlar.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (29, N'Lucy', 6, 1, 2, N'1', CAST(21.50 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/bilimkurgu/lucy.jpg', N'Lucy', NULL, NULL, NULL, N'Bilim Kurgu', N'Lucy (Scarlett Johansson) Taipei''de okuyup çalışan genç bir Amerikalı kadındır. Erkek arkadaşının da etkisiyle kuryelik yapmaya başlar. Hakkında hiçbir şey bilmediği bir çantayı Koreli uyuşturucu baronu Jang''a götürmesi gerekmektedir. Ancak bir tuzağın ortasında kalan Lucy uyuşturucu baronu tarafından esir alınır ve karnına son derece tehlikeli sentetik bir uyuşturucu yerleştirilir, bu maddeyi bedeninde taşıyarak Avrupa''yı götürmesi gerekmektedir. Ancak rehin tutulduğu yerde haydutlardan biri tarafından karnına atılan tekme, uyuşturucunun bedenine sızmasıyla müthiş bir değişime uğrar. Artık mental ve fiziksel yeteneklerini tam kapasiteyle kullanabilen, çok özel güçlere sahip tam bir ölüm makinesine dönüşen Lucy, kendisine yapılan kötülüklerin intikamını almaya kararlıdır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (30, N'Mad Max', 5, 1, 2, N'1', CAST(21.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 9, NULL, 1, N'~/images/bilimkurgu/mad.max.jpg', N'Mad Max', NULL, NULL, NULL, N'Bilim Kurgu', N'Mad Max serisi, 3. filmden tam 30 yıl sonra tekrar sinemalara dönüyor. Tam bir görsel şölen sunan filmde Mel Gibson''la özdeşleşmiş Max Rockatansky karakterini Tom Hardy canlandırıyor.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (31, N'Marslı', 4, 1, 2, N'1', CAST(25.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 14, NULL, 1, N'~/images/bilimkurgu/marslı.jpg', N'Marslı', NULL, NULL, NULL, N'Bilim Kurgu', N'Mars’daki bir görev sırasında çıkan bir fırtınayla ekipten ayrı kalan ve o noktadan sonra da geride kalanlar tarafından bulunamayınca ölmüş olarak kabul edilen bir astronotu anlatıyor. Senaryo da bu astronotun hayatta kalma mücadelesini aktarıyor. Söz konusu olan karakter oldukça şahsına münhasır, kendisiyle dalga geçebilme yeteneğine sahip esprili bir adam. Yani bir yandan çok dramatik, öte yandan da eğlenebileceğiniz bir adam.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (32, N'Matrix', 3, 1, 2, N'1', CAST(16.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 7, NULL, 1, N'~/images/bilimkurgu/matrix.jpg', N'Matrix', NULL, NULL, NULL, N'Bilim Kurgu', N'Bir bilgisayar programcısı olan Thomas Anderson aynı zamanda Neo nickname''li çok usta bir "hacker" dır. Ancak siyah takım elbiseli ve gözlüklü adamların yakın takibindedir. Bu takibin nedenini ise karşılaşacağı Morpheus''dan öğrenecektir. Neo, birden kendini Morpheus''un anlattıklarına güvenmek zorunda kaldığı büyük bir komplonun içinde bulacaktır. İçinde yaşadığımızı sandığımız bu dünya tamamiyle aldatıcıdır. Tüm insanlık aslında uzaydan gelen yaratıkların köleleridir. Neo, Trinity ve Morpheus''un da yardımıyla kendilerini bu düzeni yıkmaya adayan bir grubun içine katılır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (33, N'Maymunlar Cehennemi', 2, 1, 2, N'1', CAST(25.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 9, NULL, 1, N'~/images/bilimkurgu/maymunlar.cehennemi.jpg', N'Maymunlar Cehennemi', NULL, NULL, NULL, N'Bilim Kurgu', N'Caesar ve arkadaşları San Francisco''da çok büyük bir panik yaratmışlardır. Ayrıca ALZ-113 virüsünü yavaş yavaş tüm dünyaya yayılmaktadır. Serinin ikinci filminde Maymunları Cehenneminin şafağına tanık  olacağız. Virüsten kurtulan insanlar ve Caesar öncülüğündeki maymunlar, kaos ve ölümün hakim olduğu dünyada hayatta kalmaya çalışacaklar.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (34, N'Oblivion', 1, 1, 2, N'1', CAST(27.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/bilimkurgu/Oblivion.jpg', N'Oblivion', NULL, NULL, NULL, N'Bilim Kurgu', N'Askeri bir yönetimin eseri olan bir grup, güvendikleri ve askeri konuda deneyimli olan Jack isimli bir askeri, bir zamanlar isanların yaşadığı “Dünya” isimli gezegene keşif için yollarlar. İnsanların yok olmasından önce bu “Dünya” gezegeninde nasıl yaşadıklarını tespit için gönderilen Jack’in karşına hiç beklemediği sürprizler çıkacaktır.
Tron filmiyle isminden söz ettirmiş yönetmen Joseph Kosinski’nin yönetmen koltuğunda yer aldığı ve kendi çizgi romanı olan romandan uyarladığı filmin kadrosunda Tom Cruise, Olga Kurylenko, Andrea Riseborough, Nicolaj Coster-Waldau, Melissa Leo ve Morgan Freeman gibi isimler yer alıyor...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (35, N'Pikseller', 2, 1, 2, N'1', CAST(24.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/bilimkurgu/pikseller.jpg', N'Pikseller', NULL, NULL, NULL, N'Bilim Kurgu', N'Klasik atari oyunlarının görüntülerini yanlış yorumlayıp bir savaş ilanı olarak algılayan uzaylılar, bu oyunlardaki karakterlerin benzerleriyle dünyaya saldırırlar. Başkan Will Cooper (Kevin James) son çare olarak 80''li yılların atari şampiyonu çocukluk arkadaşı Jules Brenner (Adam Sandler) ve onun oyun delisi arkadaşlarına başvurmak zorunda kalır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (36, N'Sonsuzluk Projesi', 3, 1, 2, N'1', CAST(24.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 13, NULL, 1, N'~/images/bilimkurgu/sonsuzluk.projesi.jpg', N'Sonsuzluk Projesi', NULL, NULL, NULL, N'Bilim Kurgu', N'Bir grup genç zaman makinasının planlarını keşfederler. Planlar üzerinden zaman makinasını yaratarak, yaptıkları hataları düzeltmeye başlarlar ancak bilmedikleri her değiştirdikleri bir olay başka bir olayı değiştiriyordu.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (37, N'Transformers', 4, 1, 2, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 18, NULL, 1, N'~/images/bilimkurgu/transformers.jpg', N'Transformers', NULL, NULL, NULL, N'Bilim Kurgu', N'Çok uzun zaman önce, çok uzaklardaki Cybertron gezegeninde bir savaş başlamak üzeredir. Burası başka yapılara bürünebilen robotların dünyasıdır. Her yerde olduğu üzere bu gezegende de robotlar da iyiler ve kötüler olarak ayrılmaktadırlar. Kendilerince başka amaçlar uğrunda mücadele eden bu transformerlar, gezegenin yakıtı biterken uzay ortamındaki diğer yakıt kaynaklarının arayışına girerler. Hal böyleyken bu arayış onları Dünya’ya kadar yönlendirecektir. İstedikleri anda arabaya, gemiye ya da uçağa dönüşebilen bu robotlar, bu kez Dünya’yı ele geçirmek için savaş açacaklardır. Elbete bu savaşı başlatanların tam karşısında iyi huylu robotlar baş rolde olacaklardır. Pearl Harbor, Ada gibi kült ve bütçesi büyük filmlerin üstesinden gelmiş olan Micheal Bay, bir başka unutulmazı izleyicisi ile buluşturmak üzere kolları sıvamış bir yönetmen konumunda.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (38, N'Uyumsuz', 5, 1, 2, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 16, NULL, 1, N'~/images/bilimkurgu/uyumsuz.jpg', N'Uyumsuz', NULL, NULL, NULL, N'Bilim Kurgu', N'Fütürist bir distopya hikayesi olan bu filmde toplum her biri farklı bir erdemi temsil eden beş bölgeye bölünmüştür. On altı yaşına gelenlere kendi bölgelerinde kalıp kalmayacakları sorulmaktadır. Çünkü hayatları boyunca verdikleri karar sonucu seçtikleri bölgede yaşamak zorundadırlar. Beatrice Prior herkesi şaşırtan bir seçim yapar. Bunun üzerine Tris ve bölgenin diğer üyeleri yaptıkları seçimden sonra hayatta kalmak için oldukça rekabetçi bir başlangıç sürecine girerler. Ağır fiziksel ve psikolojik testlerden geçmek zorunda kalırlar. Bu testler sonucunda değişeceklerdir. Ancak Tris bir sır saklamaktadır. Sırrı herhangi biri öğrenirse kesinlikle bu sonu olacaktır. Görünüşte mükemmel olan toplumunu tehdit eden bir çatışmanın hızla büyüdüğünü gördükçe, sırrının sevdiği insanların hayatını kurtarabileceğini fark eder.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (39, N'Uzay Yolcuları', 6, 1, 2, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 21, NULL, 1, N'~/images/bilimkurgu/uzay.yolcuları.jpg', N'Uzay Yolcuları', NULL, NULL, NULL, N'Bilim Kurgu', N'Avalon adlı uzay gemisi, Homestead II adında çok uzak bir koloniye 5000''den fazla kişiyi götürmek üzere, 120 yıl sürecek bir yolculuk yapmaktadır. Giden kişiler bu yolculuk sonunda sağlıklı bir şekilde hayatlarına devam edebilmek için özel tasarlanmış "uyku kapsüllerinde" uyutulmaktadırlar. Ancak yaşanan teknik bir sorun nedeniyle tamirci Jim Preston (Chris Pratt) ve yazar Aurora Dunn''ın (Jennifer Lawrence) kapsülleri olması gerekenden önce açılır. Gemide bir başlarına kalan ikilinin önünde, hala 90 yıllık bir yol bulunmaktadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (40, N'Uzay Yolu', 2, 1, 2, N'1', CAST(21.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 9, NULL, 1, N'~/images/bilimkurgu/uzay.yolu.jpg', N'Uzay Yolu', NULL, NULL, NULL, N'Bilim Kurgu', N'Geminin eski kaptanın, James T. Kirk artık Amiral olmuştur ve yeni bir görev için çağırılır. Amacı eski ekibi toplamak ve önüne gelen herşeyi yokeden devasa bir uzay gemisini dünyaya ulaşmadan durdurmaktır.Karşılarındaki inanılmaz güçlere sahip yaşam formları Mr. Spock''ın dahi zekasına durgunluk verecek güçtedir. Gerilim sadece uzayda değil, aynı zamanda geminin yeni komutakı Kirk''ü kabullenmekte güçlük çeken eski kaptan Williard Decker''in Atılgan''da bulunmasında da kendini belli eder. Sonunda gemi yenilmez düşman tarafından ele geçirilir ve dümenci Ilia rehin düşer. Geri döndüğünde Kaptan Kirk''e mesajı ulaştırır: Devasa gemi, yaratıcısıyla buluşmak istemektedir yoksa Dünya gezegeni yok edilecektir', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (41, N'Yerçekimi', 4, 1, 2, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 16, NULL, 1, N'~/images/bilimkurgu/yercekimi.jpg', N'Yerçekimi', NULL, NULL, NULL, N'Bilim Kurgu', N'Filmde Bullock ilk uzay görevindeki zeki tıp mühendisi rolunü, George Clooney ise son görevine çıkan tecrübeli astronot Matt Kowalski rolünü canlandırıyor. Önceleri son derece sıradan görünen görevde hiç beklenmeyen bir felaketin başgöstermesiyle uzay gemisi harap olur. Stone ve Kowalski uzay boşluğunda tamamen yanlız kalmışlardır. Birbirlerinden başka hiç bir dayanakları kalmayan ikili uzayın derinliklerinde kaybolur.
Derin sessizlik onlara Dünya ile bütün ilişkilerini kesildiğini ve kurtulma şanslarının kalmadığını söylerken, korkuları paniğe dönüşüp çok az kalan oksijenlerini de tüketir. Eve dönmenin tek yolu belki de uzayın derinliklerine inmek ve başka uzay istasyonlarına ulaşmaktır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (42, N'Yıldızlararası', 3, 1, 2, N'1', CAST(25.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/bilimkurgu/yildizlararasi.jpg', N'Yıldızlararası', NULL, NULL, NULL, N'Bilim Kurgu', N'Filmin geçtiği yakın gelecekte yeryüzünde yaşam, artan kuraklık ve iklim değişiklikleri nedeniyle tehlikeye girmiştir. İnsan ırkı yok olma tehlikesiyle yüzyüzedir. Derken yeni keşfedilmiş bir solucandeliği, tüm insanlık için umut olur. Buradan geçip boyut değiştirerek daha önce hiçbir insanoğlunun erişemediği yerlere ulaşmak ve insanoğlunun yeni yaşam alanlarını araştırmak ise bir grup astronot-kaşife kalır. Bu kaşifler, geçen 1 saatin dünyadaki 7 yıla bedel olduğu ortamda hem hızlı ve cesur olmak zorunda kalacaklardır.
İngiliz yönetmen Christopher Nolan''ın yönettiği film, 2014''ün Kasım ayında gösterime girdi.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (43, N'On İki Yıllık Esaret', 1, 1, 3, N'1', CAST(22.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/dram/12.yillik.esaret.jpg', N'On İki Yıllık Esaret', NULL, NULL, NULL, N'Dram', N'Solomon Northup’ın 1853 yılında yazdığı ve kendi hikayesini anlattığı romanından uyarlanan filmde Northup, ABD’nin kuzeyinde yaşayan özgür bir insan, tanınmış bir keman virtüözüyken kaçırılarak köle yapılması ve geçirdiği kölelik yılları anlatılmaktadır.
Film, En İyi Film dalında Oscar Ödülü kazanırken, Lupita Nyong''o da En İyi Yardımcı Kadın Oyuncu Oscarı''nı kazandı.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (44, N'Koloni', 2, 1, 3, N'1', CAST(21.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 14, NULL, 1, N'~/images/dram/colonia.jpg', N'Koloni', NULL, NULL, NULL, N'Dram', N'Buz çağının yaşanmasıyla birlikte yer altına inen insan kolonileri, insanlığı tehtit eden doğadan daha vahşi bir güce karşı kendilerini yani insanlığı korumak zorundadır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (45, N'Gizli Dünya', 6, 1, 3, N'1', CAST(22.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/dram/gizli.dunya.jpg', N'Gizli Dünya', NULL, NULL, NULL, N'Dram', N'24 yaşındaki Joy (Brie Larson), 7 yıl önce Old Nick (Sean Bridgers) dediği bir adam tarafından kaçırılmış ve o günden bu yana evinin arkasındaki küçücük bir kulübede Jack ile tutsak olarak yaşamaktadır. Old Nick''in devamlı tecavüzlerine maruz kalan Ma, bu 7 yılın son 5''ini, Nick tecavüzleri sonucu doğan oğlu Jack (Jacob Tremblay) ile geçirmiştir. Gerçek dünyayı hiç bilmeyen oğlunu bu idare etmeye çalışsa da bir gün gerçek dünyayı da tanıması gerektiğini anlar.
Bu hapis hayatından binbir güçlükle kaçarak ailesinin yanına sığınan Joy için şimdi bir başka zorlu sınav başlayacaktır. Gerçek hayatla hiç karşılaşmamış Jack''i yepyeni bir hayata adapte edebilmek, aynı zamanda kendi hayatına da kaldığı yerden devam edebilmek...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (46, N'Hacker', 5, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/dram/hacker.jpg', N'Hacker', NULL, NULL, NULL, N'Dram', N'İzinli olarak salıverilmiş bir suçlu olan Nicholas Hathaway (Chris Hemsworth) Amerikalı ve Çinli partnerleriyle birlikte büyük bir siber suç çetesini Amerika''da, Hong Kong''da ve dünyanın çok değişik yerlerinde kovalayacaktır.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (47, N'Hayat Güzeldir', 3, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 9, NULL, 1, N'~/images/dram/hayat.güzeldir.jpg', N'Hayat Güzeldir', NULL, NULL, NULL, N'Dram', N'1930''ların İtalya''sında Guido adındaki tasasız, kaygısız bir Yahudi kitapçı yakın bir şehirdeki güzel kadına kur yapıp onunla evlenerek bir peri masalı başlatır. Guido ve karısının bir oğulları olur ve İtalya''yı Alman güçleri istila edene kadar birlikte mutluluk içinde yaşarlar. Ailesini bir arada tutabilmek ve oğlunun Yahudi toplama kamplarının dehşetinden elinden geldiğince uzak tutmak çabası ile Guida bu yıkımı bir oyun gibi gösterir. Bu oyunun kazanma ödülü ise bir tanktır...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (48, N'Kayıp Kız', 2, 1, 3, N'1', CAST(22.90 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 13, NULL, 1, N'~/images/dram/kayıp.kiz.jpg', N'Kayıp Kız', NULL, NULL, NULL, N'Dram', N'Nick Dunne (Ben Affleck), 5. evlilik yýldönümlerine kýsa bir zaman kala eþi Amy''nin (Rosamund Pike) kaybolduðunu duyurur. 
Basýn olaya büyük ilgi gösterir, polis seferber olur ancak kayýp kadýn bulunamaz. Bu durum Nick''in üzerindeki baskýyý artýrýr, yalanlarý ve 
tutarsýzlýklarý göze batmaya baþlar. Herkesin aklýna tek bir ihtimal gelmektedir: Amy''i eþi Nick öldürmüþ olabilir midir?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (49, N'Kış Masalı', 4, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 11, NULL, 1, N'~/images/dram/kis.masali.jpg', N'Kış Masalı', NULL, NULL, NULL, N'Dram', N'Bir hýrsýz, soymak için girdiði evde güzel bir kadýna aþýk olur, ancak kadýn hastadýr ve kollarýnda yaþamýný yitirecektir. 
Ancak hayatýn bir mücizesi gerçekleþir ve yeniden doðuþla yeni mucizeler onlarý bekler...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (50, N'Kitap Hırsızı', 1, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/dram/kitap.hirsizi.jpg', N'Kitap Hırsızı', NULL, NULL, NULL, N'Dram', N'7 Þubat 2014 tarihinde ülkemizde gösterime giden dram ve savaþ türündeki baþarýlý yapým Kitap Hýrsýzý, IMDB üzerinden 7.6/10 gibi oldukça 
iyi bir puan alarak tüm kalitesini ortaya koyuyor. Yönetmenliðini Brian Percival''in paylaþtýðý 5 ödüllü Kitap Hýrsýzý filminin baþrollerini 
Sophie Nélisse, Geoffrey Rus ve Emily Watson paylaþýyor. Filmde, Liesel adlý küçük bir kýz henüz 9 yaþýndayken Almanya''da bir aile tarafýndan
kabul edilir. Bakýmýný üstlenen bu aile, onu eðitecek ve Max tarafýndan okuma yazma öðrenecektir. Kitaplarla sýký bir bað kuracak olan Liesel 
adlý bu küçük kýz, hayatýna neler girerse onu kelimelere dökecektir. Kitaplarla oluþturduðu hayal dünyasýna savaþýn derinliklerini de ekleyen 
Liesel adlý bu küçük kýz, heyecan ve trajedi dolu pek çok olayý kitaplarýnýn sayfalarýna sýðdýracaktýr..
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (51, N'Maggie', 2, 1, 3, N'1', CAST(23.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/dram/Maggie.jpg', N'Maggie', NULL, NULL, NULL, N'Dram', N'Maggie adýndaki kýza ortaklýkta kol gezen bir virüs bulaþýr. Bu virüsün etkileri yavaþça belirti gösterir ve virüs vücuda iyice yayýldýktan 
onra kýz bir zombiye dönüþecektir. Babasý Wade(Arnold Schwarzenegger) çiftçidir. Kýzýnýn hastalýðýný öðrenince elinden geleni yapmaya 
çalýþacaktýr. Acaba kýz kurtulabilecek mi? ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (52, N'Malefiz', 6, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 8, NULL, 1, N'~/images/dram/malefiz.jpg', N'Malefiz', NULL, NULL, NULL, N'Dram', N'Küçükken çok iyi ve temiz kalpli olan Malefiz, çok güvendiði Stephan''ýn ihanet etmesiyle taþ kalpli, acýmasýz ve çok kötü birisi haline 
dönüþür. Kralýn kýzý Aurora''yý lanetleyip 100 senelik bir ölüme mahkum eder. Fakat Aurora''yý tanýyýnca yaptýðýný tekrar gözden geçirecek.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (53, N'Müttefik', 5, 1, 3, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 11, NULL, 1, N'~/images/dram/müttefik.jpg', N'Müttefik', NULL, NULL, NULL, N'Dram', N'2. Dünya savaþý zamanýnda kendi ülkeleri için tetikçilik yapan Amerikalý Max Vatan ile Fransýz Marianne Beausejour''un 1942''de aldýklarý 
bir görevde yollarý kesiþir. Max ve Marianne''na verilen görev Casablanca bulunan Nazi Alma elçisini öldürmektir. Ancak bu görev esnasýnda 
birbirlerine deli gibi aþýk olurlar ve evlenirler. Evlenip yuva kurmalarýan raðmen birbirlerinden gizledikleri onlarca sýrlarý vardýr. 
Aralarýndaki bu tuaf iliþkisi gerilimin ortaya çýkmasýna neden olacaktýr.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (54, N'Piyanist', 4, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/dram/piyanist.jpg', N'Piyanist', NULL, NULL, NULL, N'Dram', N'Son yüzyýlýn kült filmlerinden olan Piyanist, Roman Polanski''nin yönetmenliðini yaptýðý, üç tane Oscar kazanmýþ bir II. Dünya Savaþý filmidir.
Polonya''dan çýkmýþ meþhur piyanistlerden olan Wladyslaw Szpilman''a ait anýlarla beslenen film, ayný addaki bir kitaptan sinemaya 
uyarlanmýþtýr. Ünlü piyanist, Varþova''daki gettolarda savaþ boyunca yaþam mücadelesi verecektir. Sefahat içerisinde yaþayan müzisyen, açlýk, 
aþaðýlanma ve insanlýk dýþý hareketlerle mücadele etmek zorunda kalacaktýr. Her ne olursa olsun yaþamak, mezellete dönen ülkesinden kaçmak 
için çabalamaktýr amacý. Giþe rekorlarý kýran film tarih ve dram kategorisinde yer alýrken, oyuncu kadrosu ise þu isimlerden oluþuyor: 
Emilia Fox, Thomas Krestschmann, Andrien Body...', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (55, N'Prestij', 2, 1, 3, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/dram/prestij.jpg', N'Prestij', NULL, NULL, NULL, N'Dram', N'Adýný Christopher Priest''in 1995 yapýmý ayný isimli romanýndan alan film adaþý Christopher Nolan tarafýndan filme alýndý. Prestij; 
sihirbazlarýn gösterilerinde artýk bütün numarayý tamamlayýp herkesi hayretler içinde býrakýp alkýþý aldýðý kýsýmdýr. 
Filmin baþrollerinde baþarýlý oyuncular Hugh Jackman (Robert Angier) ve Christian Bale (Alfred Borden) yer almýþ.Filmde 20.yüzyýlýn 
baþlarýna doðru olan dönem ele alýnmýþ,baþarýlý ama henüz tanýnmayan Robert,Alfred ve Robert''ýn eþi Julia McCullough ile yine bir gösteriye 
çýktýklarý sýrada beklenmedik bir olay gerçekleþir ve Julia bu olay sonrasý feci bir þekilde ölür. Çok iyi iki arkadaþ olan Robert ve Alfred 
bu olaydan sonra iki düþmana dönüþürler.Ayrý ayrý iþler yapmaya baþlarlar ve ikisi de baþarýlý bir sihirbaz olmak için çok çabalasalar da 
içlerinde besledikleri nefretleri den dolayý birbirlerinin gösterilerine katýlarak sabote etmeye çalýþýrlar. Gösterilerini her defasýnda 
daha ileriye taþýyýp daha büyük sihirbazlar oldukça artýk bu kýskançlýk çok ileri boyutlara ilerler ve birbirlerine zarar verme noktasýna 
kadar gelirler. Gizem üstüne çok iyi kurgulanan filmde bir sihirbazýn arka planda neler yaptýðýný ve farklý iki hayatýn bir trajediden sonra 
nasýl deðiþtiðini göreceðiz. Kara Þövalye, Baþlangýç, man of steel filmlerinden de hatýrladýðýmýz yönetmen nolan''ýn 2006 yapýmý bu filmi de 
son derece kendine baðlayan ve gizem türünde ilk 10 a girebilecek bir yapýt.79.Akademi Ödülleri en iyi görüntü ve en iyi sanat yönetmeni 
dallarýnda aday olmuþtur.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (56, N'Senden Önce Ben', 1, 1, 3, N'1', CAST(23.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 14, NULL, 1, N'~/images/dram/senden.once.ben.jpg', N'Senden Önce Ben', NULL, NULL, NULL, N'Dram', N'Senden Önce Ben 2016,Amerikan ve Ýngiliz bir ortak yapýmý olan drama ve romantik komedi bir sinema filmidir. Bu film Jojo Moyes''in 2012 yýlýnda ayný ad ile piyasaya sunmuþ olduðu kitaptan esinlenerek oluþturulmuþtur. Filmin yönetmeni ise Thea Sharrock''tur.
Filmin baþrollerinde ise Sam Claflin, Emilia Clarke, Jenna Coleman, Matthew Lewis ve Charles Dance''dir. Senden Önce Ben, Amerika Birleþik Devletleri''nde 3 Haziran 2016 yayýnlanmýþtýr. Film birçok eleþtirmen tarafýndan iyi ve kötü eleþtiriler almýþtýr. Filmin yaklaþýk hasýlatý ise 59 milyon dolardýr.
Filmin genel konusu ise bakýcý olarak küçük bir kasabada büyümüþ genç bir kadýn ve tekerli sandalyeye baðlanmýþ felçli bir adamýn bir araya geliþleri ve bundan sonra aralarýnda baþlayacak olan aþký anlatmaktadýr. Ýlk zamanlarda birbirleri ile çok iyi anlaþamasalar da zamanla yeþeren duygular ile birlikte zor kararlar vermeleri gerekecektir.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (57, N'Titanik', 4, 1, 3, N'1', CAST(25.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 18, NULL, 1, N'~/images/dram/Titanic.jpg', N'Titanik', NULL, NULL, NULL, N'Dram', N'Dilden dile dolaþan ve asla batmayacak ve sarsýlmayacak, son derece iyi bir gemi olduðu söylenen Titanic’te seyahat etmek, 20. yüzyýlda, 
herkesin rüyasý haline gelmiþti. Olaylar bir insanýn yapabileceði en büyük ve gösteriþli araçlardan biri olan Titanic’in yola koyulmasý ile 
baþlamaktadýr ancak ne yazýk ki bu büyüleyici rüya yalnýzca 4,5 gün sürecek ve Titanic bir sonraki yüzyýlda bile herkesin gözünde kabus 
olarak nitelendirilen bir aný olarak kalacaktýr. Günümüzde bile heyecan uyandýran bu felaket hikayesi, sinema tarihinin görmüþ olabileceði 
en büyük bütçelerle çekilmiþtir. Filmin yönetmenliðini yapan James Cameron, bu bilindik felaketi büyük bir aþk hikayesini de konu alarak 
farklý ve etkileyici bir tarzda izleyicilere sunmuþtur. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (58, N'Yargıç', 5, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 16, NULL, 1, N'~/images/dram/yargic.jpg', N'Yargıç', NULL, NULL, NULL, N'Dram', N'Çok baþarýlý ve parlak bir hayatý olan Hank Palmer bir avukattýr. Ciddi bir davasýndan bir gün önce annesini kaybettiðini öðrenir. 
Babasýyla çok uzun zamandýr konuþmayan ikili ailede baðlý olduðu tek kiþiyi de kaybetmiþtir. Babasý yargýç olan Palmer, babasýný katil 
suçundan savunmak üzere mahkemeye çýkacaklardýr', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (59, N'Yeniden Başla', 6, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 15, NULL, 1, N'~/images/dram/yeniden.basla.jpg', N'Yeniden Başla', NULL, NULL, NULL, N'Dram', N'Oldukça baþarýlý bir bankacý olan Davis Mitchell, karýsýný bir araba kazasýnda kaybeder. Bu olaydan sonra hayatýný kararýr ve hayatýný 
yeniden gözden geçirmeye baþlar. Kayýnpederi Phil’in yardým etmesine raðmen kendisini bir türlü iyi hissedemez ve git gide kontrolden 
çýkmaya baþlar. Bir gün hastanede parasýný kaptýrdýðý otomat þirketine bir þikayet mektubu yazar. Gayet düzenli þekilde yazýlmýþ olan 
bu mektubu, þirkette müþteri temsilcisi olarak çalýþan Karen Mareno ilgi gösterir ve aralarýnda mektup arkadaþlýðý oluþur. Yas tutmayý 
bilemeyen Davis ile kendi duygusal problemleri olan Karen, kendilerini birden ilginç bir iliþkinin ortasýnda bulurlar. Karen ve oðlu Chris, 
Davise yardým eder ve  Davis, önceki günleri yýkmaya çalýþarak hayatýna yeniden baþlayacaktýr.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (60, N'Yeşil Yol', 5, 1, 3, N'1', CAST(23.00 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 10, NULL, 1, N'~/images/dram/yesil.yol.jpg', N'Yeşil Yol', NULL, NULL, NULL, N'Dram', N'Oldukça iri yarý ve ürkütücü görünüme sahip olan John Coffey, aslýnda hiç de sandýklarý gibi birisi deðildir. Oldukça duygusal ve 
karmaþýk bir iç dünyasý olan Coffrey, ayrýca mucizevi bir güce sahiptir. Ýki küçük kýzý öldürmek suçuyla yargýlanýp idama mahkum olmuþ 
bu adamýn hikayesi anlatýlýyor. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (61, N'Yüce Adalet', 2, 1, 3, N'1', CAST(24.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 9, NULL, 1, N'~/images/dram/yuce.adalet.jpg', N'Yüce Adalet', NULL, NULL, NULL, N'Dram', N'Mike Lassiter adýndaki bir genç, oldukça zengin olan babasýný öldürme suçundan cezaevine girer. Onu mahkemede avukat Richard savunacaktýr. 
Tüm deliller babasýný Mike’ýn öldürdüðü gösterir ve o da bunu doðrular. Ama avukat Richard bazý durumlardan þüphelenir ve Mike’ýn suçsuz 
olduðuna inanmaktadýr. Annesi ve birçok tanýðýn tuhaf hareketlerinden sonra bu karara varan Richard, müvekkilinin temize çýkmasý için elinden 
geleni yapacaktýr. Oscar’a aday olmuþ bir isim olan Courtney Hunt’ýn yönettiði, Nichlas Kazan’ýn da senaryosunu yazdýðý filmin baþrollerinde 
Keanu Reeves, Renée Zellweger ve Gugu Mbatha-Raw gibi oyuncular yer alýyor. Keanu Reeves, Þeytanýn Avukatý filminden yýllar sonra ikinci kez 
avukat rolüyle kamera karþýsýna geçmiþ oldu.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitsInStock], [UnitOnOrder], [ProductAvailable], [ImageUrl], [AltText], [AddBadge], [OjjerTitle], [OjjerBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (62, N'Zor Saatler', 3, 1, 3, N'1', CAST(26.99 AS Decimal(18, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 12, NULL, 1, N'~/images/dram/zor.saatler.jpg', N'Zor Saatler', NULL, NULL, NULL, N'Dram', N'1952''de Amerika''nýn Doðu kýyýsýndaki inanýlmaz fýrtýna, Cape Cod açýklarýndaki bir petrol gemisini ortadan ikiye böler. 
Gemiden geriye kalanlar çok kýsa zaman içinde batacaktýr, fakat mürettebatýn son bir umutla yaptýðý yardým çaðrýsý Sahil Güvenlik ekibi 
tarafýndan dikkate alýnýr ve zorlu hava koþullarýna raðmen bir sahil güvenlik teknesi kurtarma operasyonu düzenlemek üzere denize açýlýr. 
Bu esnada mürettebat, hayatta kalabilmek için hem fýrtýnayla, hem de birbirleriyle mücadele etmektedir.', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'kullanıcı', N'Kullanıcı Girişi İçin')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'admin', N'Admin Girişi İçin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SubCategories] ON 

INSERT [dbo].[SubCategories] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [IsActive]) VALUES (1, 1, N'Aksiyon Filmleri', N'Aksiyon Film Çeşitleri', NULL, NULL, 1)
INSERT [dbo].[SubCategories] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [IsActive]) VALUES (2, 1, N'Bilim Kurgu Filmleri', N'Bilm Kurgu Film Çeşitleri', NULL, NULL, 1)
INSERT [dbo].[SubCategories] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [IsActive]) VALUES (3, 1, N'Dram Filmleri', N'Dram Film Çeşitleri', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (1, N'Paramount', N'Jay Turser', N'Manager', N'Texas', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (2, N'Universal', N'John Doe', N'Manager', N'New York', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (3, N'Sony/Columbia Pictures', N'Manuel Rodriguez', N'Manager', N'New York', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (4, N'Warner Bros', N'Cordoba', N'Manager', N'New York', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (5, N'Buena Vista', N'Parker', N'Manager', N'Texas', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (6, N'Fox', N'Ibanez', N'Manager', N'New York', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SuppliersID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (7, N'a', N'a', N'a', N'a', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
ALTER TABLE [dbo].[Admin_Logins]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Logins_Admin_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Admin_Employees] ([EmpID])
GO
ALTER TABLE [dbo].[Admin_Logins] CHECK CONSTRAINT [FK_Admin_Logins_Admin_Employees]
GO
ALTER TABLE [dbo].[Admin_Logins]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Logins_Roles] FOREIGN KEY([RoleType])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Admin_Logins] CHECK CONSTRAINT [FK_Admin_Logins_Roles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments] ([PaymentID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ShippingID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_ShippingDetails]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentTypes] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentTypes] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentTypes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategories] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategories] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SuppliersID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PromoRights]  WITH CHECK ADD  CONSTRAINT [FK_PromoRights_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PromoRights] CHECK CONSTRAINT [FK_PromoRights_Categories]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_Categories]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD  CONSTRAINT [FK_Wishlists_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlists] CHECK CONSTRAINT [FK_Wishlists_Customers]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD  CONSTRAINT [FK_Wishlists_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlists] CHECK CONSTRAINT [FK_Wishlists_Products]
GO
USE [master]
GO
ALTER DATABASE [ECommerceDB] SET  READ_WRITE 
GO
