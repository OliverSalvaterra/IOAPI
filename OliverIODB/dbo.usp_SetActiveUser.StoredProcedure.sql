USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetActiveUser]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetActiveUser]
	@UserID		int
,	@Active		bit
AS
BEGIN

	UPDATE Users
	SET Active = @Active
	WHERE UserID = @UserID

END
GO
