USE [master]
GO
/****** Object:  Database [SportBookingDB]    Script Date: 6/20/2025 12:14:51 AM ******/
CREATE DATABASE [SportBookingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportBookingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SportBookingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportBookingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SportBookingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SportBookingDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportBookingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportBookingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportBookingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportBookingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportBookingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportBookingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportBookingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportBookingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportBookingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportBookingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportBookingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportBookingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportBookingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportBookingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportBookingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportBookingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportBookingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportBookingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportBookingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportBookingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportBookingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportBookingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportBookingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportBookingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SportBookingDB] SET  MULTI_USER 
GO
ALTER DATABASE [SportBookingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportBookingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportBookingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportBookingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportBookingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportBookingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportBookingDB', N'ON'
GO
ALTER DATABASE [SportBookingDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SportBookingDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SportBookingDB]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[BankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AccountNumber] [nvarchar](50) NOT NULL,
	[BankTypeId] [int] NOT NULL,
	[AccountHolder] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankType]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankType](
	[BankTypeId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BankTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[PostAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CourtId] [int] NULL,
	[TimeSlotId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Booking__73951AED0DCA61FE] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[PostAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[ParentCommentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Court]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[CourtId] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [int] NULL,
	[StatusId] [int] NULL,
	[CourtName] [nvarchar](100) NULL,
	[CategoryId] [int] NULL,
	[PricePerHour] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Court__C3A67C9A99E5D279] PRIMARY KEY CLUSTERED 
(
	[CourtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourtCategories]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facility]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[FacilityId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[VerifiedAt] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[Contact] [nvarchar](100) NULL,
 CONSTRAINT [PK__Facility__5FB08A74A68A9609] PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [int] NULL,
	[BlogId] [int] NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[Order] [int] NULL,
	[Caption] [nvarchar](255) NULL,
 CONSTRAINT [PK__Facility__60B51202994B66DB] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[Amount] [decimal](10, 2) NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK__Payment__9B556A380DC9AEB0] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[StatusDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[TimeSlotId] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
 CONSTRAINT [PK__TimeSlot__41CC1F32B26722EE] PRIMARY KEY CLUSTERED 
(
	[TimeSlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[IsMale] [bit] NULL,
	[AvatarUrl] [nvarchar](255) NULL,
	[RoleId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK__User__1788CC4CFCBB3028] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserToken]    Script Date: 6/20/2025 12:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserToken](
	[UserTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AccessToken] [nvarchar](255) NULL,
	[RefreshToken] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BankAccount] ON 

INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (6, 6, N'1234567890', 1, N'Nguyen Van A')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (7, 7, N'2345678901', 2, N'Tran Thi B')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (8, 8, N'3456789012', 3, N'Le Van C')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (9, 9, N'4567890123', 4, N'Pham Thi D')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (10, 10, N'5678901234', 5, N'Hoang Van E')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (11, 11, N'6789012345', 6, N'Vu Thi F')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (12, 12, N'7890123456', 7, N'Phan Van G')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (13, 13, N'8901234567', 8, N'Dang Thi H')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (14, 14, N'9012345678', 9, N'Bui Van I')
INSERT [dbo].[BankAccount] ([BankAccountId], [UserId], [AccountNumber], [BankTypeId], [AccountHolder]) VALUES (15, 15, N'0123456789', 10, N'Ngo Thi K')
SET IDENTITY_INSERT [dbo].[BankAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[BankType] ON 

INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (1, N'Vietcombank', N'Ngân hàng TMCP Ngoại thương Việt Nam')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (2, N'Vietinbank', N'Ngân hàng TMCP Công thương Việt Nam')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (3, N'BIDV', N'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (4, N'ACB', N'Ngân hàng Á Châu')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (5, N'Techcombank', N'Ngân hàng Kỹ thương Việt Nam')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (6, N'Sacombank', N'Ngân hàng Sài Gòn Thương Tín')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (7, N'MB Bank', N'Ngân hàng Quân đội')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (8, N'VPBank', N'Ngân hàng Việt Nam Thịnh Vượng')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (9, N'AgriBank', N'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam')
INSERT [dbo].[BankType] ([BankTypeId], [BankName], [Description]) VALUES (10, N'SHB', N'Ngân hàng Sài Gòn Hà Nội')
SET IDENTITY_INSERT [dbo].[BankType] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (17, 7, N'Bài viết 1', N'Nội dung blog 1', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (18, 8, N'Bài viết 2', N'Nội dung blog 2', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (19, 9, N'Bài viết 3', N'Nội dung blog 3', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (20, 10, N'Bài viết 4', N'Nội dung blog 4', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (21, 11, N'Bài viết 5', N'Nội dung blog 5', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (22, 12, N'Bài viết 6', N'Nội dung blog 6', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (23, 13, N'Bài viết 7', N'Nội dung blog 7', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (24, 14, N'Bài viết 8', N'Nội dung blog 8', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (25, 15, N'Bài viết 9', N'Nội dung blog 9', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
INSERT [dbo].[Blog] ([BlogId], [UserId], [Title], [Content], [PostAt], [UpdatedAt]) VALUES (26, 6, N'Bài viết 10', N'Nội dung blog 10', CAST(N'2025-06-19T23:59:52.050' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (10, 6, 8, 7, 1, CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (11, 7, 9, 8, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (12, 8, 10, 9, 2, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (13, 9, 11, 10, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (14, 10, 12, 11, 1, CAST(180000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (15, 11, 13, 12, 2, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (16, 12, 14, 13, 1, CAST(220000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (17, 13, 15, 14, 1, CAST(170000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (18, 14, 16, 15, 2, CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Booking] ([BookingId], [UserId], [CourtId], [TimeSlotId], [StatusId], [TotalPrice]) VALUES (19, 15, 17, 16, 1, CAST(160000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (8, 17, 6, N'Bình luận 1', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (9, 18, 7, N'Bình luận 2', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (10, 19, 8, N'Bình luận 3', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (11, 20, 9, N'Bình luận 4', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (12, 21, 10, N'Bình luận 5', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (13, 22, 11, N'Bình luận 6', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (14, 23, 12, N'Bình luận 7', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (15, 24, 13, N'Bình luận 8', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (16, 25, 15, N'Bình luận 9', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
INSERT [dbo].[Comment] ([CommentId], [BlogId], [UserId], [Content], [PostAt], [UpdatedAt], [ParentCommentId]) VALUES (17, 26, 14, N'Bình luận 10', CAST(N'2025-06-20T00:01:00.933' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Court] ON 

INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (8, 7, 1, N'Sân 1', 1, CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (9, 8, 1, N'Sân 2', 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (10, 9, 2, N'Sân 3', 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (11, 10, 1, N'Sân 4', 4, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (12, 11, 1, N'Sân 5', 5, CAST(180000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (13, 12, 2, N'Sân 6', 6, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (14, 13, 1, N'Sân 7', 7, CAST(220000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (15, 14, 1, N'Sân 8', 8, CAST(170000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (16, 15, 2, N'Sân 9', 9, CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Court] ([CourtId], [FacilityId], [StatusId], [CourtName], [CategoryId], [PricePerHour]) VALUES (17, 16, 1, N'Sân 10', 10, CAST(160000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Court] OFF
GO
SET IDENTITY_INSERT [dbo].[CourtCategories] ON 

INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (1, N'Sân bóng đá mini')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (2, N'Sân bóng rổ')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (3, N'Sân cầu lông')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (4, N'Sân tennis')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (5, N'Sân bóng chuyền')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (6, N'Sân futsal')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (7, N'Sân bóng bàn')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (8, N'Sân bóng ném')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (9, N'Sân đa năng')
INSERT [dbo].[CourtCategories] ([CategoryId], [CategoryName]) VALUES (10, N'Sân tập gym')
SET IDENTITY_INSERT [dbo].[CourtCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Facility] ON 

INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (7, 6, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'123 Lê Lợi, Q.1', N'0123456789')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (8, 7, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'234 Trần Hưng Đạo, Q.5', N'0123456790')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (9, 8, 2, NULL, N'345 Nguyễn Huệ, Q.1', N'0123456791')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (10, 9, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'456 Cách Mạng Tháng 8, Q.3', N'0123456792')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (11, 10, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'567 Pasteur, Q.3', N'0123456793')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (12, 11, 2, NULL, N'678 Hai Bà Trưng, Q.1', N'0123456794')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (13, 12, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'789 Lý Tự Trọng, Q.1', N'0123456795')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (14, 13, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'890 Nam Kỳ Khởi Nghĩa, Q.3', N'0123456796')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (15, 14, 2, NULL, N'901 Võ Văn Tần, Q.3', N'0123456797')
INSERT [dbo].[Facility] ([FacilityId], [UserId], [StatusId], [VerifiedAt], [Location], [Contact]) VALUES (16, 15, 1, CAST(N'2025-06-19T23:54:08.867' AS DateTime), N'1011 Điện Biên Phủ, Q.3', N'0123456798')
SET IDENTITY_INSERT [dbo].[Facility] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (7, 7, 17, N'/images/1.jpg', 1, N'Ảnh 1')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (8, 8, 18, N'/images/2.jpg', 2, N'Ảnh 2')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (9, 9, 19, N'/images/3.jpg', 3, N'Ảnh 3')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (10, 10, 20, N'/images/4.jpg', 4, N'Ảnh 4')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (11, 11, 21, N'/images/5.jpg', 5, N'Ảnh 5')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (12, 12, 22, N'/images/6.jpg', 6, N'Ảnh 6')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (13, 13, 23, N'/images/7.jpg', 7, N'Ảnh 7')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (14, 14, 24, N'/images/8.jpg', 8, N'Ảnh 8')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (15, 15, 25, N'/images/9.jpg', 9, N'Ảnh 9')
INSERT [dbo].[Image] ([ImageId], [FacilityId], [BlogId], [ImageUrl], [Order], [Caption]) VALUES (16, 16, 26, N'/images/10.jpg', 10, N'Ảnh 10')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (8, 10, 7, CAST(200000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (9, 11, 7, CAST(150000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (10, 12, 8, CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (11, 13, 7, CAST(250000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (12, 14, 7, CAST(180000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (13, 15, 8, CAST(120000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (14, 16, 7, CAST(220000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (15, 17, 7, CAST(170000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (16, 18, 8, CAST(110000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [BookingId], [StatusId], [Amount], [TimeStamp]) VALUES (17, 19, 7, CAST(160000.00 AS Decimal(10, 2)), CAST(N'2025-06-20T00:04:19.447' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (7, 10, 5, N'Xuất sắc', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (8, 11, 4, N'Tốt', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (9, 12, 3, N'Bình thường', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (10, 13, 5, N'Rất hài lòng', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (11, 14, 2, N'Cần cải thiện', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (12, 15, 1, N'Không hài lòng', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (13, 16, 4, N'Ổn', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (14, 17, 3, N'Được', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (15, 18, 5, N'Tuyệt vời', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [BookingId], [Rating], [Comment], [CreateAt]) VALUES (16, 19, 2, N'Chưa tốt', CAST(N'2025-06-20T00:05:16.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'CourtOwner')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Player')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (1, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (2, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (3, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (4, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (5, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (6, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (7, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (8, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (9, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (10, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (11, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (12, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (13, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (14, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (15, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (16, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (17, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (18, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (19, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (20, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (21, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (22, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (23, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (24, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (25, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (26, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (27, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (28, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (29, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (30, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (31, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (32, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (33, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (34, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (35, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (36, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (37, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (38, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (39, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (40, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (41, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (42, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (43, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (44, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (45, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (46, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (47, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (48, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (49, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (50, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (51, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (52, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (53, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (54, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (55, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (56, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (57, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (58, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (59, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (60, N'Completed', N'Đã hoàn thành')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (61, N'Active', N'Hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (62, N'Inactive', N'Không hoạt động')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (63, N'Pending', N'Chờ duyệt')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (64, N'Banned', N'Cấm')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (65, N'Verified', N'Đã xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (66, N'Unverified', N'Chưa xác thực')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (67, N'Paid', N'Đã thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (68, N'Unpaid', N'Chưa thanh toán')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (69, N'Cancelled', N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (70, N'Completed', N'Đã hoàn thành')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (7, 7, 1, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (8, 8, 1, CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (9, 9, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (10, 10, 1, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (11, 11, 1, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (12, 12, 1, CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (13, 13, 1, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (14, 14, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (15, 15, 1, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotId], [FacilityId], [StatusId], [StartTime], [EndTime]) VALUES (16, 16, 1, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (6, 1, N'user1', N'pass1', N'user1@email.com', N'0900000001', 1, N'/avatar1.jpg', 1, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (7, 1, N'user2', N'pass2', N'user2@email.com', N'0900000002', 0, N'/avatar2.jpg', 2, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (8, 1, N'user3', N'pass3', N'user3@email.com', N'0900000003', 1, N'/avatar3.jpg', 3, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (9, 1, N'user4', N'pass4', N'user4@email.com', N'0900000004', 0, N'/avatar4.jpg', 1, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (10, 1, N'user5', N'pass5', N'user5@email.com', N'0900000005', 1, N'/avatar5.jpg', 2, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (11, 1, N'user6', N'pass6', N'user6@email.com', N'0900000006', 0, N'/avatar6.jpg', 3, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (12, 1, N'user7', N'pass7', N'user7@email.com', N'0900000007', 1, N'/avatar7.jpg', 1, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (13, 1, N'user8', N'pass8', N'user8@email.com', N'0900000008', 0, N'/avatar8.jpg', 2, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (14, 1, N'user9', N'pass9', N'user9@email.com', N'0900000009', 1, N'/avatar9.jpg', 3, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
INSERT [dbo].[User] ([UserId], [StatusId], [Username], [Password], [Email], [Phone], [IsMale], [AvatarUrl], [RoleId], [CreateAt]) VALUES (15, 1, N'user10', N'pass10', N'user10@email.com', N'0900000010', 0, N'/avatar10.jpg', 3, CAST(N'2025-06-19T23:46:47.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserToken] ON 

INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (17, 7, N'access1', N'refresh1')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (18, 8, N'access2', N'refresh2')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (19, 9, N'access3', N'refresh3')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (20, 10, N'access4', N'refresh4')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (21, 11, N'access5', N'refresh5')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (22, 12, N'access6', N'refresh6')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (23, 13, N'access7', N'refresh7')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (24, 14, N'access8', N'refresh8')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (25, 15, N'access9', N'refresh9')
INSERT [dbo].[UserToken] ([UserTokenId], [UserId], [AccessToken], [RefreshToken]) VALUES (26, 6, N'access10', N'refresh10')
SET IDENTITY_INSERT [dbo].[UserToken] OFF
GO
/****** Object:  Index [UQ__BankAcco__1788CC4D5620CE97]    Script Date: 6/20/2025 12:14:51 AM ******/
ALTER TABLE [dbo].[BankAccount] ADD UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BankType__DA9ADFAA11A8C8EA]    Script Date: 6/20/2025 12:14:51 AM ******/
ALTER TABLE [dbo].[BankType] ADD UNIQUE NONCLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__8A2B61604983BD21]    Script Date: 6/20/2025 12:14:51 AM ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E4EC4F884F]    Script Date: 6/20/2025 12:14:51 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E4EC4F884F] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534D6ABFED3]    Script Date: 6/20/2025 12:14:51 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__A9D10534D6ABFED3] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [PostAt]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [PostAt]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF__FacilityI__Order__5CD6CB2B]  DEFAULT ((1)) FOR [Order]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__TimeSta__6EF57B66]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[TimeSlot] ADD  CONSTRAINT [DF__TimeSlot__IsAvai__66603565]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__IsEnable__3C69FB99]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__CreateAt__3E52440B]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD FOREIGN KEY([BankTypeId])
REFERENCES [dbo].[BankType] ([BankTypeId])
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK__BankAccou__UserI__44FF419A] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK__BankAccou__UserI__44FF419A]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__UserId__4BAC3F29] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__UserId__4BAC3F29]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__CourtId__6A30C649] FOREIGN KEY([CourtId])
REFERENCES [dbo].[Court] ([CourtId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__CourtId__6A30C649]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__TimeSlo__6B24EA82] FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlot] ([TimeSlotId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__TimeSlo__6B24EA82]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__UserId__693CA210] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__UserId__693CA210]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Status]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([BlogId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ParentCommentId])
REFERENCES [dbo].[Comment] ([CommentId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__UserId__5441852A] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__UserId__5441852A]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FK__Court__CategoryI__628FA481] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CourtCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FK__Court__CategoryI__628FA481]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FK__Court__FacilityI__619B8048] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facility] ([FacilityId])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FK__Court__FacilityI__619B8048]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FK_Court_Status] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FK_Court_Status]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK__Facility__UserId__59063A47] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK__Facility__UserId__59063A47]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_Status]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK__FacilityI__Facil__5BE2A6F2] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facility] ([FacilityId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK__FacilityI__Facil__5BE2A6F2]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([BlogId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Blog]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__Booking__6E01572D] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__Booking__6E01572D]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Status]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK__Rating__BookingI__71D1E811] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK__Rating__BookingI__71D1E811]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK__TimeSlot__Facili__656C112C] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facility] ([FacilityId])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK__TimeSlot__Facili__656C112C]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_Status]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__RoleId__3D5E1FD2] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__RoleId__3D5E1FD2]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Status]
GO
ALTER TABLE [dbo].[UserToken]  WITH CHECK ADD  CONSTRAINT [FK__UserToken__UserI__48CFD27E] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK__UserToken__UserI__48CFD27E]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [SportBookingDB] SET  READ_WRITE 
GO
