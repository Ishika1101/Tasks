USE [master]
GO
/****** Object:  Database [HospitalManagement]    Script Date: 26-03-2020 00:49:24 ******/
CREATE DATABASE [HospitalManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalManagement', N'ON'
GO
ALTER DATABASE [HospitalManagement] SET QUERY_STORE = OFF
GO
USE [HospitalManagement]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PatientName] [varchar](40) NOT NULL,
	[AppointmentTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AssignDoctors] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignAssistants]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignAssistants](
	[AssignAssistantId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[AssistantId] [int] NOT NULL,
 CONSTRAINT [PK_AssignAssistants] PRIMARY KEY CLUSTERED 
(
	[AssignAssistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignPrescription]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignPrescription](
	[AssignPrescription] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PrescriptionId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_AssignPrescription] PRIMARY KEY CLUSTERED 
(
	[AssignPrescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](40) NOT NULL,
	[DepartmentDetails] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[Specialization] [varchar](40) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthAssistants]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthAssistants](
	[AssistantId] [int] IDENTITY(1,1) NOT NULL,
	[AssistantName] [varchar](40) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_HealthAssistants] PRIMARY KEY CLUSTERED 
(
	[AssistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Age] [int] NOT NULL,
	[AppointmentId] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 26-03-2020 00:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionDisease] [varchar](30) NOT NULL,
	[Morning] [varchar](20) NOT NULL,
	[Afternoon] [varchar](20) NOT NULL,
	[Night] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_1_Contact]    Script Date: 26-03-2020 00:49:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_1_Contact] ON [dbo].[Doctors]
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_appointment]    Script Date: 26-03-2020 00:49:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Patients_appointment] ON [dbo].[Patients]
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[AssignAssistants]  WITH CHECK ADD  CONSTRAINT [FK_AssignAssistants_Appointments] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[AssignAssistants] CHECK CONSTRAINT [FK_AssignAssistants_Appointments]
GO
ALTER TABLE [dbo].[AssignAssistants]  WITH CHECK ADD  CONSTRAINT [FK_AssignAssistants_HealthAssistants] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[HealthAssistants] ([AssistantId])
GO
ALTER TABLE [dbo].[AssignAssistants] CHECK CONSTRAINT [FK_AssignAssistants_HealthAssistants]
GO
ALTER TABLE [dbo].[AssignPrescription]  WITH CHECK ADD  CONSTRAINT [FK_AssignPrescription_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[AssignPrescription] CHECK CONSTRAINT [FK_AssignPrescription_Doctors]
GO
ALTER TABLE [dbo].[AssignPrescription]  WITH CHECK ADD  CONSTRAINT [FK_AssignPrescription_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[AssignPrescription] CHECK CONSTRAINT [FK_AssignPrescription_Patients]
GO
ALTER TABLE [dbo].[AssignPrescription]  WITH CHECK ADD  CONSTRAINT [FK_AssignPrescription_Prescription] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription] ([PrescriptionId])
GO
ALTER TABLE [dbo].[AssignPrescription] CHECK CONSTRAINT [FK_AssignPrescription_Prescription]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[HealthAssistants]  WITH CHECK ADD  CONSTRAINT [FK_HealthAssistants_Departments1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[HealthAssistants] CHECK CONSTRAINT [FK_HealthAssistants_Departments1]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Appointments] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Appointments]
GO
USE [master]
GO
ALTER DATABASE [HospitalManagement] SET  READ_WRITE 
GO
