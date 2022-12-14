USE [master]
GO
/****** Object:  Database [OliverIODB]    Script Date: 8/15/2022 5:32:14 PM ******/
CREATE DATABASE [OliverIODB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OliverIODB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OliverIODB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OliverIODB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OliverIODB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OliverIODB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OliverIODB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OliverIODB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OliverIODB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OliverIODB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OliverIODB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OliverIODB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OliverIODB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OliverIODB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OliverIODB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OliverIODB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OliverIODB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OliverIODB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OliverIODB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OliverIODB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OliverIODB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OliverIODB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OliverIODB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OliverIODB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OliverIODB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OliverIODB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OliverIODB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OliverIODB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OliverIODB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OliverIODB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OliverIODB] SET  MULTI_USER 
GO
ALTER DATABASE [OliverIODB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OliverIODB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OliverIODB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OliverIODB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OliverIODB] SET  READ_WRITE 
GO
