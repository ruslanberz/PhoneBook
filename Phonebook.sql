USE [master]
GO
/****** Object:  Database [Phonebook]    Script Date: 11/3/2018 11:20:27 PM ******/
CREATE DATABASE [Phonebook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Phonebook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Phonebook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Phonebook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Phonebook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Phonebook] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Phonebook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Phonebook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Phonebook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Phonebook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Phonebook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Phonebook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Phonebook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Phonebook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Phonebook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Phonebook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Phonebook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Phonebook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Phonebook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Phonebook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Phonebook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Phonebook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Phonebook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Phonebook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Phonebook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Phonebook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Phonebook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Phonebook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Phonebook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Phonebook] SET RECOVERY FULL 
GO
ALTER DATABASE [Phonebook] SET  MULTI_USER 
GO
ALTER DATABASE [Phonebook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Phonebook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Phonebook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Phonebook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Phonebook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Phonebook', N'ON'
GO
ALTER DATABASE [Phonebook] SET QUERY_STORE = OFF
GO
USE [Phonebook]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/3/2018 11:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/3/2018 11:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 11/3/2018 11:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (1, N'Baş ofis')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (2, N'Yasamal filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (3, N'Gənclik filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (4, N'Nərimanov filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (5, N'Abşeron filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (6, N'Zabrat filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (7, N'Buzovna filialı')
INSERT [dbo].[Departments] ([DepartmentId], [Name]) VALUES (8, N'Nəsimi filialı')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (1, 1, 1, N'Zaur', N'Abbasov', N'+994772102544', N'zaur@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (2, 1, 2, N'Oruc', N'Orucov', N'+994503814521', N'hesen@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (3, 1, 4, N'Abbas', N'Hacıyev', N'+994554214141', N'abbas@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (4, 1, 5, N'Hikmət', N'Kərimov', N'+994552101014', N'hikmet@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (5, 2, 2, N'Hacı', N'Bayramov', N'+994775201247', N'hacı@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (6, 2, 5, N'Oktay', N'Salehov', N'+994775201214', N'oktay@almali.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (7, 2, 1, N'Ruslan', N'Bərziqyar', N'+99477422055', N'ruslantb@code.edu.az', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (8, 2, 4, N'k', N'k', N'055525461', N'k@k.com', 1)
INSERT [dbo].[Employees] ([EmployeeId], [DepartmentID], [PositionID], [Name], [Surname], [Phone], [Email], [isActive]) VALUES (9, 1, 7, N'r', N'r', N'+99477858585', N'123@naa.az', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (1, 1, N'Direktor')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (2, 1, N'Direktor köməkçisi')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (4, 1, N'Mühasib')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (5, 1, N'Kassir')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (6, 1, N'Xadimə')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (7, 1, N'İT menecer')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (8, 1, N'Ambardar')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (9, 2, N'Direktor')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (10, 2, N'Mühasib')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (11, 2, N'Satıcı')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (12, 2, N'Ambardar')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (13, 2, N'Menecer')
INSERT [dbo].[Positions] ([PositionId], [DepartmentID], [Name]) VALUES (14, 2, N'Kassir')
SET IDENTITY_INSERT [dbo].[Positions] OFF
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO
ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_Departments]
GO
USE [master]
GO
ALTER DATABASE [Phonebook] SET  READ_WRITE 
GO
