USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_PostDevice]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PostDevice]
	@UserID			int
,	@DeviceTypeID	int
,	@DeviceName		varchar(100)
AS
BEGIN

	INSERT Devices
	VALUES (@DeviceTypeID, NEWID(), @DeviceName, 1)

	DECLARE @NewDeviceID	int
	SELECT	@NewDeviceID = SCOPE_IDENTITY()

	INSERT UserDevices
	Values (@UserID, @NewDeviceID, 1)

END
GO
