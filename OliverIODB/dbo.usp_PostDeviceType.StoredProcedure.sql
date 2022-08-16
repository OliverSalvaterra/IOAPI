USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_PostDeviceType]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PostDeviceType]
	@DeviceTypeName varchar(100)
,	@Description	varchar(1000)
,	@IsActive		bit
AS
BEGIN

	INSERT DeviceTypes
	VALUES (@DeviceTypeName, @Description, @IsActive)

	SELECT	SCOPE_IDENTITY()	AS NewlyInsertedDeviceTypeID

END

GO
