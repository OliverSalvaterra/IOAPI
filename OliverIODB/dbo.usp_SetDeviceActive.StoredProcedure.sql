USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetDeviceActive]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetDeviceActive]
	@DeviceID	tinyint
,	@IsActive	bit
AS
BEGIN

	UPDATE Devices
	SET IsActive = @IsActive
	WHERE Devices.DeviceID = @DeviceID

END
GO
