USE [master]
GO
/****** Object:  Database [Academy]    Script Date: 05.12.2022 17:45:37 ******/
CREATE DATABASE [Academy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Acamdey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Acamdey.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Acamdey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Acamdey_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Academy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Academy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy] SET RECOVERY FULL 
GO
ALTER DATABASE [Academy] SET  MULTI_USER 
GO
ALTER DATABASE [Academy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Academy', N'ON'
GO
ALTER DATABASE [Academy] SET QUERY_STORE = OFF
GO
USE [Academy]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 05.12.2022 17:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(10,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Score] [float] NOT NULL,
	[Username] [nvarchar](30) NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (1, N'Miri', N'Huseynzade', 9, N'Test1')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (10, N'Leyla', N'Shefiyeva', 10, N'Test2')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (11, N'Tural', N'Hacinebili', 11, N'Test3')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (12, N'Ali', N'Shamilzade', 12, N'Test4')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (14, N'Elshad', N'Hesenov', 8.9, N'Test5')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (16, N'Nihat', N'Ekremli', 8.7, N'Test6')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (17, N'Kenan', N'Muradov', 9, N'Test7')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (18, N'Murad', N'Empty', 7, N'Test8')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (19, N'Huseyn', N'Empty', 11, NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Score], [Username]) VALUES (21, N'Emin', N'Empty', 10, N'4561')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Students_Username]    Script Date: 05.12.2022 17:45:37 ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [UK_Students_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_LastName]  DEFAULT (N'Empty') FOR [LastName]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK_Students_Score] CHECK  (([Score]>=(0) AND [Score]<=(12)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK_Students_Score]
GO
USE [master]
GO
ALTER DATABASE [Academy] SET  READ_WRITE 
GO
