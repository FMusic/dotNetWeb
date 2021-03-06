USE [master]
GO
/****** Object:  Database [PraRwaProjekt]    Script Date: 8/15/2019 12:32:05 PM ******/
CREATE DATABASE [PraRwaProjekt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PraRwaProjekt', FILENAME = N'D:\Windows\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PraRwaProjekt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PraRwaProjekt_log', FILENAME = N'D:\Windows\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PraRwaProjekt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PraRwaProjekt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PraRwaProjekt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PraRwaProjekt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PraRwaProjekt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PraRwaProjekt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PraRwaProjekt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PraRwaProjekt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PraRwaProjekt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PraRwaProjekt] SET  MULTI_USER 
GO
ALTER DATABASE [PraRwaProjekt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PraRwaProjekt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PraRwaProjekt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PraRwaProjekt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PraRwaProjekt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PraRwaProjekt] SET QUERY_STORE = OFF
GO
USE [PraRwaProjekt]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 8/15/2019 12:32:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combinations]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combinations](
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
	[IDCombination] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfMeals] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCombination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groceries]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groceries](
	[IDGrocerie] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[GrocerieType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDGrocerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroceriesInUnits]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroceriesInUnits](
	[IDGiU] [int] IDENTITY(1,1) NOT NULL,
	[MeasureUnitID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[GrocerieID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDGiU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meals]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meals](
	[IDMeal] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[GrocerieProteinID] [int] NULL,
	[GrocerieFatID] [int] NULL,
	[GrocerieCarbID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMeal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuringUnits]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuringUnits](
	[IDMeasuringUnit] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMeasuringUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NutritionsByCombination]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NutritionsByCombination](
	[IDPercentages] [int] IDENTITY(1,1) NOT NULL,
	[CombinationID] [int] NULL,
	[FatPercentage] [int] NULL,
	[ProteinPercentage] [int] NULL,
	[CarboPercentage] [int] NULL,
	[CombinationPercentage] [int] NULL,
	[OrderNumber] [int] NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPercentages] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMealsTable]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMealsTable](
	[IDUMTable] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [date] NULL,
	[MealID] [int] NULL,
	[OrderNumber] [int] NOT NULL,
	[GrocPBool] [bit] NOT NULL,
	[GrocFBool] [bit] NOT NULL,
	[GrocCBool] [bit] NOT NULL,
	[GrocPMeasureUnitID] [int] NULL,
	[GrocFMeasureUnitID] [int] NULL,
	[GrocCMeasureUnitID] [int] NULL,
	[GrocPQuantity] [int] NULL,
	[GrocFQuantity] [int] NULL,
	[GrocCQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUMTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [nvarchar](30) NULL,
	[Username] [nvarchar](12) NULL,
	[Password] [nvarchar](20) NULL,
	[Weight] [int] NULL,
	[Height] [int] NULL,
	[PhysicalActivity] [int] NULL,
	[DiabetesType] [int] NULL,
	[Sex] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[GroceriesInUnits]  WITH CHECK ADD FOREIGN KEY([GrocerieID])
REFERENCES [dbo].[Groceries] ([IDGrocerie])
GO
ALTER TABLE [dbo].[GroceriesInUnits]  WITH CHECK ADD FOREIGN KEY([MeasureUnitID])
REFERENCES [dbo].[MeasuringUnits] ([IDMeasuringUnit])
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD FOREIGN KEY([GrocerieCarbID])
REFERENCES [dbo].[Groceries] ([IDGrocerie])
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD FOREIGN KEY([GrocerieFatID])
REFERENCES [dbo].[Groceries] ([IDGrocerie])
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD FOREIGN KEY([GrocerieProteinID])
REFERENCES [dbo].[Groceries] ([IDGrocerie])
GO
ALTER TABLE [dbo].[NutritionsByCombination]  WITH CHECK ADD FOREIGN KEY([CombinationID])
REFERENCES [dbo].[Combinations] ([IDCombination])
GO
ALTER TABLE [dbo].[UserMealsTable]  WITH CHECK ADD FOREIGN KEY([MealID])
REFERENCES [dbo].[Meals] ([IDMeal])
GO
ALTER TABLE [dbo].[UserMealsTable]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([IDUser])
GO
/****** Object:  StoredProcedure [dbo].[GetGroceries]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetGroceries]
as
	select g.[Name], g.GrocerieType from Groceries as g
GO
/****** Object:  StoredProcedure [dbo].[GetGroceries2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetGroceries2]
as
	select distinct g.[Name], g.GrocerieType from Groceries as g
GO
/****** Object:  StoredProcedure [dbo].[GetGroceriesAndUnits]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetGroceriesAndUnits]
as
	select distinct g.[Name] as N'GrocerieName', mu.[Name] as N'MeasuringUnitName', gui.Quantity as N'Quantity'
	from Groceries as g
	inner join GroceriesInUnits as gui
	on gui.GrocerieID = g.IDGrocerie
	inner join MeasuringUnits as mu
	on mu.IDMeasuringUnit = gui.MeasureUnitID
	
GO
/****** Object:  StoredProcedure [dbo].[GetMealFromName]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMealFromName]
	@name nvarchar(20)
as
	select m.[Name], g.[Name] as 'Carb', gr.[Name] as 'Fat', gro.[Name] as 'Protein'
	from Meals as m
	inner join Groceries as g
	on g.IDGrocerie = m.GrocerieCarbID
	inner join Groceries as gr
	on gr.IDGrocerie = m.GrocerieFatID
	inner join Groceries as gro
	on gro.IDGrocerie = m.GrocerieProteinID	
	where m.[Name] = @name
GO
/****** Object:  StoredProcedure [dbo].[GetMealFromName2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMealFromName2]
	@name nvarchar(20)
as
	select m.[Name], g.[Name] as 'Carb', gr.[Name] as 'Fat', gro.[Name] as 'Protein'
	from Meals as m
	inner join Groceries as g
	on g.IDGrocerie = m.GrocerieCarbID
	inner join Groceries as gr
	on gr.IDGrocerie = m.GrocerieFatID
	inner join Groceries as gro
	on gro.IDGrocerie = m.GrocerieProteinID	
	where m.[Name] = @name
GO
/****** Object:  StoredProcedure [dbo].[GetMeals]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetMeals]
as
	select m.[Name], g.[Name] as N'ProteinGrocerie', gr.[Name] as N'FatGrocerie', gro.[Name] as N'CarboGrocerie' 
	from Meals as m
	inner join Groceries as g
	on g.IDGrocerie = m.GrocerieProteinID
	inner join Groceries as gr
	on gr.IDGrocerie = m.GrocerieFatID
	inner join Groceries as gro
	on gro.IDGrocerie = m.GrocerieCarbID
GO
/****** Object:  StoredProcedure [dbo].[GetMeasuringUnits]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMeasuringUnits]
as
	select distinct mu.[Name] from MeasuringUnits as mu
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetNutritionsForADay]
	@dateWhen date
as
	declare @combId int
	set @combId = (
		select IDCombination from Combinations
		where Combinations.DateFrom>@dateWhen and Combinations.DateTo<@dateWhen
		)
	select top 1 nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetNutritionsForADay2]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select IDCombination from Combinations
		where Combinations.DateFrom>@dateWhen and Combinations.DateTo<@dateWhen and @mealsNum = NumberOfMeals
		)
	select top 1 nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay3]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[GetNutritionsForADay3]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select IDCombination from Combinations
		where Combinations.DateFrom>@dateWhen and Combinations.DateTo<@dateWhen and @mealsNum = NumberOfMeals
		)
	select nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay4]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[GetNutritionsForADay4]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select IDCombination from Combinations
		where Combinations.DateFrom>@dateWhen and Combinations.DateTo<@dateWhen and @mealsNum = NumberOfMeals
		)
	select nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay5]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetNutritionsForADay5]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select IDCombination
		from Combinations
		where Combinations.DateFrom<@dateWhen and Combinations.DateTo>@dateWhen and @mealsNum = NumberOfMeals
		)
	select nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay6]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetNutritionsForADay6]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select IDCombination
		from Combinations
		where Combinations.DateFrom<@dateWhen and Combinations.DateTo>@dateWhen and @mealsNum = NumberOfMeals
		)
	select top 1 nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay7]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetNutritionsForADay7]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select top 1 IDCombination
		from Combinations
		where Combinations.DateFrom<@dateWhen and Combinations.DateTo>@dateWhen and @mealsNum = NumberOfMeals
		)
	select top 1 nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetNutritionsForADay8]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetNutritionsForADay8]
	@dateWhen date,
	@mealsNum int
as
	declare @combId int
	set @combId = (
		select top 1 IDCombination
		from Combinations
		where Combinations.DateFrom<@dateWhen and Combinations.DateTo>@dateWhen and @mealsNum = NumberOfMeals
		)
	select nc.[Name], nc.OrderNumber, 
		nc.FatPercentage as 'FatPerc', 
		nc.ProteinPercentage as 'ProtPerc', 
		nc.CarboPercentage as 'CarbPerc',
		nc.CombinationPercentage as 'combPerc'
	from NutritionsByCombination as nc
	where nc.CombinationID = @combId
GO
/****** Object:  StoredProcedure [dbo].[GetUserMealsForADay]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserMealsForADay]
	@username nvarchar(20),
	@date date
as
	declare @userId int
	set @userId = (
		select IDUser from Users 
		where Username = @username
	)
	select umt.OrderNumber, m.[Name], g.[Name], gr.[Name], gro.[Name]
	from Meals as m
	inner join UserMealsTable as umt
	on m.IDMeal = umt.MealID
	inner join Groceries as g
	on m.GrocerieProteinID = g.IDGrocerie
	inner join Groceries as gr
	on m.GrocerieFatID = gr.IDGrocerie
	inner join Groceries as gro
	on m.GrocerieCarbID = gro.IDGrocerie
	where umt.[Date] = @date and umt.UserID = @userID
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetUsers]
as
select u.[Name], u.Surname, u.[Weight], u.[Height], u.DiabetesType,
		u.DateOfBirth, u.Email, u.PhysicalActivity, u.Sex, u.Username, u.Password
		from Users as u
GO
/****** Object:  StoredProcedure [dbo].[GetUsers2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUsers2]
as
select u.[Name], u.Surname, u.[Weight], u.[Height], u.DiabetesType,
		u.DateOfBirth, u.Email, u.PhysicalActivity, u.Sex, u.Username, u.Password
		from Users as u
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoginUser]
	@username nvarchar(12)
as
	select [Password] from Users
	where Username = @username
GO
/****** Object:  StoredProcedure [dbo].[NewCombination]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewCombination]
	@datef date,
	@datet date,
	@numOfMeals int,
	@CombinationID int output
as
	insert into Combinations(DateFrom, DateTo, NumberOfMeals) values (@datef, @datet, @numOfMeals)
	set @CombinationID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[NewCombination2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NewCombination2]
	@datef date,
	@datet date,
	@numOfMeals int,
	@CombinationID int output
as
	insert into Combinations(DateFrom, DateTo, NumberOfMeals) values (@datef, @datet, @numOfMeals)
	select @CombinationID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[NewCombination3]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NewCombination3]
	@datef date,
	@datet date,
	@numOfMeals int
as
	insert into Combinations(DateFrom, DateTo, NumberOfMeals) values (@datef, @datet, @numOfMeals)
	select SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[NewGrocerie]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NewGrocerie]
	@name nvarchar(20),
	@groctype nvarchar(20)
as
	insert into Groceries([Name], GrocerieType)
		VALUES (@name, @groctype)
GO
/****** Object:  StoredProcedure [dbo].[NewGrocerie2]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NewGrocerie2]
	@name nvarchar(20),
	@groctype nvarchar(20),
	@measuringUnit nvarchar(20),
	@kcalperMeasuringUnit int
as
	insert into Groceries([Name], GrocerieType)
		VALUES (@name, @groctype)
	declare @idGroc int
	set @idGroc= SCOPE_IDENTITY()
	declare @idUnit int
	set @idUnit = (
		select top 1 IDMeasuringUnit from MeasuringUnits
		where @measuringUnit = [Name]
	)
	insert into GroceriesInUnits(MeasureUnitID, Quantity, GrocerieID) values (@idUnit, @kcalperMeasuringUnit, @idGroc)
GO
/****** Object:  StoredProcedure [dbo].[NewMeal]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NewMeal]
	@name nvarchar(30),
	@grocFat nvarchar(20),
	@grocProtein nvarchar(20),
	@grocCarbs nvarchar(20)
as
	declare @grocFID int
	declare @grocPID int
	declare @grocCID int

	set @grocFID = (
			select top 1 IDGrocerie from Groceries
			where [Name] = @grocFat
		)

	set @grocPID = (
			select top 1 IDGrocerie from Groceries
			where [Name] = @grocProtein
		)

	set @grocCID = (
			select top 1 IDGrocerie from Groceries
			where [Name] = @grocCarbs
		)
	INSERT INTO Meals([Name], GrocerieProteinID, GrocerieFatID, GrocerieCarbID)
	values (@name, @grocPID, @grocFID,@grocCID)
GO
/****** Object:  StoredProcedure [dbo].[NewMeasuringUnit]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewMeasuringUnit]
	@name nvarchar(30)
as
	insert into MeasuringUnits([Name]) values (@name)
GO
/****** Object:  StoredProcedure [dbo].[NewNutritionsForCombination]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewNutritionsForCombination]
	@combinationID int,
	@fatPercentage int,
	@proteinPercentage int,
	@carboPercentage int,
	@combinationPercentage int,
	@orderNumber int,
	@name nvarchar(20)
as 
	insert into NutritionsByCombination(
		CombinationID, 
		FatPercentage, 
		ProteinPercentage,
		CarboPercentage, 
		CombinationPercentage, 
		OrderNumber, 
		[Name] 
		)
		values(
		@combinationID,
		@fatPercentage,
		@proteinPercentage,
		@carboPercentage,
		@combinationPercentage,
		@orderNumber,
		@name
		)
GO
/****** Object:  StoredProcedure [dbo].[RegisterNewUser]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[RegisterNewUser]
	@Name nvarchar(50),
	@Surname nvarchar(50),
	@dob date,
	@email nvarchar(30),
	@username nvarchar(12),
	@pass nvarchar(20),
	@weight int,
	@height int,
	@PhyAct int,
	@DType int,
	@sex char
as
	INSERT INTO Users
		(
			[Name],Surname,DateOfBirth, Email,Username,[Password],[Weight],
				Height, PhysicalActivity,DiabetesType,Sex
			) 
		VALUES
			(
				@Name, @Surname, @dob, @email, @username, @pass,@weight,
					@height, @PhyAct,@DType,@sex
			)
GO
/****** Object:  StoredProcedure [dbo].[SaveUserMealsForADay]    Script Date: 8/15/2019 12:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SaveUserMealsForADay]
	@username nvarchar(20),
	@date date,
	@meal nvarchar(20),
	@orderNumber int,
	@grocPbool bit,
	@grocPMeasureUnit nvarchar(20),
	@grocPQuantity int,
	@grocFbool bit,
	@grocFMeasureUnit nvarchar(20),
	@grocFQuantity int,
	@grocCbool bit,
	@grocCMeasureUnit nvarchar(20),
	@grocCQuantity int
as
	declare @muP int
	declare @muF int
	declare @muC int
	declare @mealID int
	declare @userID int
	set @userID = (
		select IDUser from Users
		where @username = Username
	)
	set @muP = (
		select IDMeasuringUnit from MeasuringUnits
		where @grocPMeasureUnit = [Name]
	)
	set @muF = (
		select IDMeasuringUnit from MeasuringUnits
		where @grocFMeasureUnit = [Name]
	)
	set @muC = (
		select IDMeasuringUnit from MeasuringUnits
		where @grocCMeasureUnit = [Name]
	)
	set @mealID = (
		select IDMeal from Meals
		where @meal = [Name]
	)
	insert into UserMealsTable(
		UserID,
		[Date],
		MealID,
		OrderNumber,
		GrocPBool,
		GrocPMeasureUnitID,
		GrocPQuantity,
		GrocFBool,
		GrocFMeasureUnitID,
		GrocFQuantity,
		GrocCBool,
		GrocCMeasureUnitID,
		GrocCQuantity
		) values (
		@userID,
		@date,
		@mealID,
		@orderNumber,
		@grocPbool,
		@muP,
		@grocPQuantity,
		@grocFbool,
		@muF,
		@grocFQuantity,
		@grocCbool,
		@muC,
		@grocCQuantity
		)
GO
USE [master]
GO
ALTER DATABASE [PraRwaProjekt] SET  READ_WRITE 
GO
