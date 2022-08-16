USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateUserDeviceConnection]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CreateUserDeviceConnection]
	@UserID		int
,	@DeviceID	int
AS
BEGIN

	INSERT INTO UserDevices
	Values(@UserID, @DeviceID, 1)

END
GO
