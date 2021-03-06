USE [master]
GO
/****** Object:  Database [StudentManagementDb]    Script Date: 01-04-2020 00:03:37 ******/
CREATE DATABASE [StudentManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagementDb] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentManagementDb', N'ON'
GO
ALTER DATABASE [StudentManagementDb] SET QUERY_STORE = OFF
GO
USE [StudentManagementDb]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 01-04-2020 00:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeesPaid]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeesPaid](
	[FeeId] [int] IDENTITY(1,1) NOT NULL,
	[FeeAmount] [float] NOT NULL,
	[FeeDate] [date] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_FeesPaid] PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_1_email]    Script Date: 01-04-2020 00:03:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_1_email] ON [dbo].[Students]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_1_mobile]    Script Date: 01-04-2020 00:03:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_1_mobile] ON [dbo].[Students]
(
	[MobileNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FeesPaid]  WITH CHECK ADD  CONSTRAINT [FK_FeesPaid_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[FeesPaid] CHECK CONSTRAINT [FK_FeesPaid_Students]
GO
/****** Object:  StoredProcedure [dbo].[sp_addFees]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_addFees] @feeamount float,@id int
as
begin
set nocount on;

Insert into FeesPaid (FeeAmount,FeeDate,StudentId)values (@feeamount,SYSDATETIME(),@id);
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addStudent]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_addStudent] @name varchar(50),@email varchar(50),@mobileno varchar(20),@courseid int,@password varchar(50)
as
begin
set nocount on;

Insert into Students (StudentName,Email,MobileNo,CourseId,Password)values(@name,@email,@mobileno,@courseid,@password);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteStudent]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_deleteStudent] @id int
as
begin
set nocount on;
Delete from FeesPaid where StudentId=@id;
Delete from Students where StudentId=@id;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_updateStudent]    Script Date: 01-04-2020 00:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_updateStudent] @name varchar(50),@email varchar(50),@mobileno varchar(15),@password varchar(50),@CourseId  int,@id int
as
begin
set nocount on;


update Students set StudentName=@name,Email=@email,MobileNo=@mobileno,Password=@password,CourseId=@CourseId where StudentId=@id;
End
GO
USE [master]
GO
ALTER DATABASE [StudentManagementDb] SET  READ_WRITE 
GO
