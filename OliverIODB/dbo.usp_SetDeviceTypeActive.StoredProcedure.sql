USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetDeviceTypeActive]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetDeviceTypeActive]
	@DeviceTypeID	tinyint
,	@IsActive	bit
AS
BEGIN

	UPDATE DeviceTypes
	SET IsActive = @IsActive
	WHERE DeviceTypes.DeviceTypeID = @DeviceTypeID

END
GO
