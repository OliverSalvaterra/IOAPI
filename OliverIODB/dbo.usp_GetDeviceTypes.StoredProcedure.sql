USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDeviceTypes]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetDeviceTypes]
	@IsActive bit
AS
BEGIN

	SELECT *
	FROM DeviceTypes
	WHERE DeviceTypes.IsActive = @IsActive

END
GO
