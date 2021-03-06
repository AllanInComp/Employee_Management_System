USE [master]
GO
/****** Object:  Database [Employee_Management_System]    Script Date: 2020/6/10/周三 17:08:18 ******/
CREATE DATABASE [Employee_Management_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee_Management_System', FILENAME = N'D:\Program\Microsoft SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Employee_Management_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee_Management_System_log', FILENAME = N'D:\Program\Microsoft SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Employee_Management_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Employee_Management_System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee_Management_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee_Management_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee_Management_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee_Management_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee_Management_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee_Management_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee_Management_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee_Management_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee_Management_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee_Management_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee_Management_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee_Management_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee_Management_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee_Management_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee_Management_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee_Management_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee_Management_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee_Management_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee_Management_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee_Management_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee_Management_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee_Management_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee_Management_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee_Management_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Employee_Management_System] SET  MULTI_USER 
GO
ALTER DATABASE [Employee_Management_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee_Management_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee_Management_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee_Management_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee_Management_System] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employee_Management_System', N'ON'
GO
ALTER DATABASE [Employee_Management_System] SET QUERY_STORE = OFF
GO
USE [Employee_Management_System]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[username] [varchar](60) NOT NULL,
	[authority] [varchar](120) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](120) NOT NULL,
	[lastname] [varchar](120) NOT NULL,
	[email] [varchar](120) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[username] [varchar](60) NOT NULL,
	[ismanager] [tinyint] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager_employee_relation]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager_employee_relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[managerid] [int] NOT NULL,
	[employeeid] [int] NOT NULL,
 CONSTRAINT [PK_manager_employee_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resource]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](255) NOT NULL,
	[roles] [varchar](120) NOT NULL,
 CONSTRAINT [PK_resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[job_des] [varchar](120) NULL,
	[loc] [varchar](120) NOT NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serial_number]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serial_number](
	[id] [int] NOT NULL,
	[code] [varchar](20) NOT NULL,
	[type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_serial_number] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2020/6/10/周三 17:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](60) NOT NULL,
	[password] [varchar](120) NOT NULL,
	[enabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK_authorities_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK_authorities_users]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_employee] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_employee]
GO
ALTER TABLE [dbo].[manager_employee_relation]  WITH CHECK ADD  CONSTRAINT [FK_manager_employee_relation_employee] FOREIGN KEY([managerid])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[manager_employee_relation] CHECK CONSTRAINT [FK_manager_employee_relation_employee]
GO
ALTER TABLE [dbo].[manager_employee_relation]  WITH CHECK ADD  CONSTRAINT [FK_manager_employee_relation_employee1] FOREIGN KEY([employeeid])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[manager_employee_relation] CHECK CONSTRAINT [FK_manager_employee_relation_employee1]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_employee]
GO
USE [master]
GO
ALTER DATABASE [Employee_Management_System] SET  READ_WRITE 
GO
