USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUser]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUser]
	@Username	varchar(20)
,	@Password	char(64)
AS
BEGIN

	SELECT	UserID
	FROM	Users
	WHERE	Users.UserName = @Username
	and		Users.Password = @Password

END
GO
