USE [master]
GO
/****** Object:  Database [Library]    Script Date: 5/3/2020 1:24:35 AM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 5/3/2020 1:24:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[bookNumber] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[authors] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 5/3/2020 1:24:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrower](
	[borrowerNumber] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[sex] [char](1) NULL,
	[address] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Borrower] PRIMARY KEY CLUSTERED 
(
	[borrowerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CirculatedCopy]    Script Date: 5/3/2020 1:24:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CirculatedCopy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[copyNumber] [int] NOT NULL,
	[borrowerNumber] [int] NOT NULL,
	[borrowedDate] [datetime] NOT NULL,
	[dueDate] [datetime] NULL,
	[returnedDate] [datetime] NULL,
	[fineAmount] [float] NULL,
 CONSTRAINT [PK_CirculatedCopy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copy]    Script Date: 5/3/2020 1:24:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy](
	[copyNumber] [int] IDENTITY(1,1) NOT NULL,
	[bookNumber] [int] NOT NULL,
	[sequenceNumber] [int] NOT NULL,
	[type] [char](1) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Copy] PRIMARY KEY CLUSTERED 
(
	[copyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 5/3/2020 1:24:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[borrowerNumber] [int] NOT NULL,
	[bookNumber] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (1, N't1', N'a11', N'p1')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (2, N't2', N'a2', N'p2')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (3, N't3', N'a3', N'p3')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (6, N't6', N'a6', N'p6')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (7, N't7', N'a7', N'p7')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (8, N't8', N'a8', N'p8')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (9, N't9', N'chau len ba', N'chau di mau giao')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (10, N'Test_1', N'Andrew_1', N'Pub_1')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (12, N't11', N'a11', N'p111')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (19, N't131', N'a11', N'p111')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (21, N't16', N'12', N'1')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (22, N't1', N'a11', N'p1')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (23, N't19', N'', N'')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (24, N't1311', N'a11', N'p111')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Borrower] ON 

INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (1, N'Quan Nguyen', N'F', N' 1', N'+84966848112', N' 1')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (2, N'Kien', N'M', N'a2', N't2', N'e2')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (3, N'Khang', N'F', N'', N'', N'')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (4, N'Ha', N'F', N' ', N' ', N' ')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (6, N'Hoa', N'F', N' 1', N' 1', N' 1')
SET IDENTITY_INSERT [dbo].[Borrower] OFF
SET IDENTITY_INSERT [dbo].[CirculatedCopy] ON 

INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (8, 1, 1, CAST(N'2013-10-02T00:00:00.000' AS DateTime), CAST(N'2013-10-16T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), 2359)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (10, 2, 1, CAST(N'2013-10-02T00:00:00.000' AS DateTime), CAST(N'2013-10-16T00:00:00.000' AS DateTime), CAST(N'2013-10-22T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (11, 2, 3, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (12, 4, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), 2358)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (13, 5, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (14, 4, 2, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2020-03-13T00:00:00.000' AS DateTime), 2339)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (15, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (16, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (17, 7, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (18, 9, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (19, 10, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (20, 12, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (21, 13, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (22, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (23, 3, 1, CAST(N'2013-10-04T00:00:00.000' AS DateTime), CAST(N'2013-10-18T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (24, 1, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-25T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (25, 3, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-25T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (26, 7, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (27, 8, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (28, 9, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-25T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (29, 9, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (30, 10, 1, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2013-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (31, 13, 1, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2013-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (32, 15, 2, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (33, 17, 2, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime), 2331)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (34, 19, 2, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime), 2331)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (35, 3, 3, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (36, 12, 3, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-24T21:23:17.637' AS DateTime), 2343)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (37, 13, 3, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-24T21:22:37.020' AS DateTime), 2343)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (38, 18, 3, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-13T00:00:00.000' AS DateTime), 2332)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (39, 20, 1, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-24T21:21:03.383' AS DateTime), 2343)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (40, 26, 1, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-11-03T00:00:00.000' AS DateTime), CAST(N'2013-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (41, 27, 1, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-11-03T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 2326)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (42, 26, 4, CAST(N'2013-10-10T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 2336)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (43, 9, 1, CAST(N'2013-10-20T00:00:00.000' AS DateTime), CAST(N'2013-11-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (44, 1, 2, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-03-26T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (45, 1, 2, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (46, 1, 2, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (47, 1, 4, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (48, 4, 2, CAST(N'2020-03-13T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), CAST(N'2020-03-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (49, 4, 1, CAST(N'2020-03-13T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), CAST(N'2020-03-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (50, 4, 2, CAST(N'2020-03-13T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (51, 7, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (52, 27, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (53, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (54, 27, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (55, 26, 2, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (56, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (60, 27, 2, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (61, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (62, 27, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (63, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (64, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (65, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (66, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (68, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (69, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (70, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (71, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (72, 26, 6, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (73, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (74, 26, 4, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (75, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (76, 26, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (77, 27, 1, CAST(N'2020-03-17T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), CAST(N'2020-03-28T15:22:39.543' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (78, 26, 1, CAST(N'2020-03-29T10:53:41.000' AS DateTime), CAST(N'2020-04-12T10:53:41.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (79, 26, 1, CAST(N'2020-03-29T11:02:02.000' AS DateTime), CAST(N'2020-04-12T11:02:02.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (80, 26, 1, CAST(N'2020-03-29T11:04:10.000' AS DateTime), CAST(N'2020-04-12T11:04:10.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (81, 26, 1, CAST(N'2020-03-29T11:04:47.000' AS DateTime), CAST(N'2020-04-12T11:04:47.000' AS DateTime), CAST(N'2020-03-29T11:04:53.940' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (82, 26, 1, CAST(N'2020-03-29T11:20:01.000' AS DateTime), CAST(N'2020-04-12T11:20:01.000' AS DateTime), CAST(N'2020-03-29T11:20:55.197' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (83, 27, 1, CAST(N'2020-03-29T11:20:10.000' AS DateTime), CAST(N'2020-04-12T11:20:10.000' AS DateTime), CAST(N'2020-03-29T11:20:57.577' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (84, 26, 1, CAST(N'2020-03-29T11:29:37.000' AS DateTime), CAST(N'2020-04-12T11:29:37.000' AS DateTime), CAST(N'2020-03-29T13:27:37.567' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (85, 27, 1, CAST(N'2020-03-29T11:29:45.000' AS DateTime), CAST(N'2020-04-12T11:29:45.000' AS DateTime), CAST(N'2020-03-29T11:30:41.697' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (86, 27, 6, CAST(N'2020-03-29T11:31:05.000' AS DateTime), CAST(N'2020-04-12T11:31:05.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (87, 27, 1, CAST(N'2020-03-29T11:44:46.000' AS DateTime), CAST(N'2020-04-12T00:00:00.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (88, 27, 4, CAST(N'2020-03-29T11:45:39.000' AS DateTime), CAST(N'2020-04-12T00:00:00.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (89, 27, 6, CAST(N'2020-03-29T11:51:24.000' AS DateTime), CAST(N'2020-04-12T11:51:24.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (90, 27, 1, CAST(N'2020-03-29T11:52:56.000' AS DateTime), CAST(N'2020-04-12T11:52:56.000' AS DateTime), CAST(N'2020-03-29T11:53:45.477' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (91, 27, 4, CAST(N'2020-03-29T11:54:02.000' AS DateTime), CAST(N'2020-04-12T11:54:02.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (92, 27, 6, CAST(N'2020-03-29T12:09:22.000' AS DateTime), CAST(N'2020-04-12T12:09:22.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (93, 27, 4, CAST(N'2020-03-29T12:11:45.000' AS DateTime), CAST(N'2020-04-12T00:00:00.000' AS DateTime), CAST(N'2020-03-29T12:17:14.663' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (94, 27, 4, CAST(N'2020-03-29T12:17:49.000' AS DateTime), CAST(N'2020-04-12T12:17:49.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (95, 27, 6, CAST(N'2020-03-29T12:18:15.080' AS DateTime), CAST(N'2020-04-12T12:18:15.080' AS DateTime), NULL, NULL)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (96, 26, 1, CAST(N'2020-03-29T13:27:54.000' AS DateTime), CAST(N'2020-04-12T13:27:54.000' AS DateTime), CAST(N'2020-03-29T13:28:11.247' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (97, 26, 1, CAST(N'2020-03-29T13:28:49.000' AS DateTime), CAST(N'2020-04-12T13:28:49.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (98, 26, 4, CAST(N'2020-03-29T13:29:58.000' AS DateTime), CAST(N'2020-04-12T13:29:58.000' AS DateTime), CAST(N'2020-03-29T13:30:56.150' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[CirculatedCopy] OFF
SET IDENTITY_INSERT [dbo].[Copy] ON 

INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (1, 2, 1, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (2, 2, 2, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (3, 2, 3, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (4, 1, 1, N'B', 100)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (5, 1, 2, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (7, 2, 5, N'A', 100)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (8, 2, 6, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (9, 2, 7, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (10, 2, 8, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (11, 1, 3, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (12, 6, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (13, 6, 2, N'A', 100)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (14, 3, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (15, 3, 2, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (17, 2, 9, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (18, 2, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (19, 2, 2, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (20, 2, 2, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (23, 3, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (24, 1, 4, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (25, 1, 5, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (26, 9, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (27, 9, 2, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (28, 7, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (31, 12, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (43, 12, 2, N'B', 100)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (44, 12, 3, N'A', 10)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (45, 19, 1, N'A', 100)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (46, 19, 0, N'A', 1000)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (48, 21, 1, N'A', 1001)
SET IDENTITY_INSERT [dbo].[Copy] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (10, 2, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (11, 3, 1, CAST(N'2013-10-04T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (12, 1, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (34, 4, 9, CAST(N'2020-03-16T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (39, 4, 9, CAST(N'2020-03-17T15:44:15.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (41, 4, 9, CAST(N'2020-03-17T15:46:52.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (42, 6, 9, CAST(N'2020-03-17T15:47:01.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (44, 6, 9, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (45, 4, 9, CAST(N'2020-03-29T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (46, 4, 9, CAST(N'2020-03-29T11:45:11.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (47, 6, 9, CAST(N'2020-03-29T11:45:17.987' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (48, 4, 9, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (49, 6, 9, CAST(N'2020-03-29T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (50, 4, 9, CAST(N'2020-03-29T12:11:35.230' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (51, 6, 9, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (52, 4, 9, CAST(N'2020-03-29T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (53, 6, 9, CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'R')
SET IDENTITY_INSERT [dbo].[Reservation] OFF
ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD  CONSTRAINT [FK_CirculatedCopy_Borrower] FOREIGN KEY([borrowerNumber])
REFERENCES [dbo].[Borrower] ([borrowerNumber])
GO
ALTER TABLE [dbo].[CirculatedCopy] CHECK CONSTRAINT [FK_CirculatedCopy_Borrower]
GO
ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD  CONSTRAINT [FK_CirculatedCopy_Copy] FOREIGN KEY([copyNumber])
REFERENCES [dbo].[Copy] ([copyNumber])
GO
ALTER TABLE [dbo].[CirculatedCopy] CHECK CONSTRAINT [FK_CirculatedCopy_Copy]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Book] FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK_Copy_Book]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Book] FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Book]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Borrower] FOREIGN KEY([borrowerNumber])
REFERENCES [dbo].[Borrower] ([borrowerNumber])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Borrower]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
