USE [master]
GO
/****** Object:  Database [LibraryManagementDb]    Script Date: 24-03-2020 17:18:09 ******/
CREATE DATABASE [LibraryManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagementDb', N'ON'
GO
ALTER DATABASE [LibraryManagementDb] SET QUERY_STORE = OFF
GO
USE [LibraryManagementDb]
GO
/****** Object:  Table [dbo].[BookEntry]    Script Date: 24-03-2020 17:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookEntry](
	[BookEnteryId] [int] IDENTITY(1,1) NOT NULL,
	[BookTitle] [varchar](30) NOT NULL,
	[BookName] [varchar](40) NOT NULL,
	[Copies] [int] NOT NULL,
	[AuthorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BookEntry] PRIMARY KEY CLUSTERED 
(
	[BookEnteryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 24-03-2020 17:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[MobileNo] [varchar](15) NOT NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Qualification] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookIssue]    Script Date: 24-03-2020 17:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIssue](
	[BookIssueId] [int] IDENTITY(1,1) NOT NULL,
	[BookEnteryId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[BookIssueDate] [date] NOT NULL,
	[BookReturnDate] [date] NOT NULL,
 CONSTRAINT [PK_BookIssue] PRIMARY KEY CLUSTERED 
(
	[BookIssueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vIssuebook]    Script Date: 24-03-2020 17:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vIssuebook]
AS
SELECT        dbo.BookEntry.BookName, dbo.BookEntry.AuthorName, dbo.Students.StudentName, dbo.BookIssue.BookIssueDate, dbo.BookIssue.BookReturnDate
FROM            dbo.BookIssue INNER JOIN
                         dbo.Students ON dbo.BookIssue.StudentId = dbo.Students.StudentId INNER JOIN
                         dbo.BookEntry ON dbo.BookIssue.BookEnteryId = dbo.BookEntry.BookEnteryId
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BookEntry]    Script Date: 24-03-2020 17:18:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BookEntry] ON [dbo].[BookEntry]
(
	[BookName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_BookEntry] FOREIGN KEY([BookEnteryId])
REFERENCES [dbo].[BookEntry] ([BookEnteryId])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_BookEntry]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_Students]
GO
/****** Object:  StoredProcedure [dbo].[spSearchBook]    Script Date: 24-03-2020 17:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSearchBook]
@BookTitle varchar(50)= null, @BookName varchar(50)=null,@BookAuthor varchar(50)=null
as
select BookTitle,BookName,AuthorName from BookEntry  where 
(  BookTitle LIKE  @BookTitle + '%') or (  BookName LIKE  @BookName + '%') or 
(  AuthorName LIKE  @BookAuthor + '%') 

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookIssue"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 0
               Left = 537
               Bottom = 130
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "BookEntry"
            Begin Extent = 
               Top = 82
               Left = 271
               Bottom = 212
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuebook'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuebook'
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementDb] SET  READ_WRITE 
GO
