USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetActiveConnection]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetActiveConnection]
	@UserID		int
,	@DeviceID	int
,	@Active		bit
AS
BEGIN

	UPDATE	UserDevices
	SET		ConnectionActive = @Active
	WHERE	UserID = @UserID
	and		DeviceID = @DeviceID

END
GO
