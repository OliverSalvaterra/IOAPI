USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateUser]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CreateUser]
	@Username	varchar(20)
,	@Password	char(64)
AS
BEGIN

	INSERT INTO Users
	Values(@Username, @Password, 1)

END
GO
