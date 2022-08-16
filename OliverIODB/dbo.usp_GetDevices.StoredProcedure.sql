USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDevices]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetDevices]
	@UserID		int
,	@IsActive	bit
AS
BEGIN

	SELECT *
	FROM	Devices
	JOIN	UserDevices
	ON		Devices.DeviceID = UserDevices.DeviceID
	WHERE	Devices.IsActive = @IsActive
	AND		UserDevices.UserID = @UserID

END
GO
