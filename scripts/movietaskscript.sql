USE [master]
GO
/****** Object:  Database [EntertainmentDb]    Script Date: 24-03-2020 17:20:33 ******/
CREATE DATABASE [EntertainmentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EntertainmentDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EntertainmentDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EntertainmentDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EntertainmentDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EntertainmentDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EntertainmentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EntertainmentDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EntertainmentDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EntertainmentDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EntertainmentDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EntertainmentDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EntertainmentDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EntertainmentDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EntertainmentDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EntertainmentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EntertainmentDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EntertainmentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EntertainmentDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EntertainmentDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EntertainmentDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EntertainmentDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EntertainmentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EntertainmentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EntertainmentDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EntertainmentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EntertainmentDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EntertainmentDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EntertainmentDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EntertainmentDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EntertainmentDb] SET  MULTI_USER 
GO
ALTER DATABASE [EntertainmentDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EntertainmentDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EntertainmentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EntertainmentDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EntertainmentDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EntertainmentDb', N'ON'
GO
ALTER DATABASE [EntertainmentDb] SET QUERY_STORE = OFF
GO
USE [EntertainmentDb]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 24-03-2020 17:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](50) NOT NULL,
	[MovieType] [varchar](40) NOT NULL,
	[MovieLanguage] [varchar](30) NOT NULL,
	[MovieRating] [tinyint] NOT NULL,
	[MovieReleaseYear] [date] NULL,
	[DirectorName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 24-03-2020 17:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[ActorName] [varchar](40) NOT NULL,
	[ActorLanguage] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Associative]    Script Date: 24-03-2020 17:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Associative](
	[AssociativeId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_Associative] PRIMARY KEY CLUSTERED 
(
	[AssociativeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vRelation]    Script Date: 24-03-2020 17:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vRelation]
AS
SELECT        dbo.Movies.MovieName, dbo.Actors.ActorName
FROM            dbo.Associative INNER JOIN
                         dbo.Actors ON dbo.Associative.ActorId = dbo.Actors.ActorId INNER JOIN
                         dbo.Movies ON dbo.Associative.MovieId = dbo.Movies.MovieId
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_name]    Script Date: 24-03-2020 17:20:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_name] ON [dbo].[Movies]
(
	[MovieName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associative]  WITH CHECK ADD  CONSTRAINT [FK_Associative_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([ActorId])
GO
ALTER TABLE [dbo].[Associative] CHECK CONSTRAINT [FK_Associative_Actors]
GO
ALTER TABLE [dbo].[Associative]  WITH CHECK ADD  CONSTRAINT [FK_Associative_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Associative] CHECK CONSTRAINT [FK_Associative_Movies]
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
         Begin Table = "Associative"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Actors"
            Begin Extent = 
               Top = 124
               Left = 257
               Bottom = 254
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 638
            End
            DisplayFlags = 280
            TopColumn = 0
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vRelation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vRelation'
GO
USE [master]
GO
ALTER DATABASE [EntertainmentDb] SET  READ_WRITE 
GO
