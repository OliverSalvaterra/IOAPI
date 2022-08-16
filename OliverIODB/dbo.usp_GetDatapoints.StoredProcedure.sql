USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDatapoints]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE	[dbo].[usp_GetDatapoints]
	@UserId			int
,	@DeviceID		int
,	@MinValue		int
,	@MaxValue		int
,	@MinDate		datetime
,	@MaxDate		datetime
AS
BEGIN

	SELECT	DeviceName
	,		[Value]
	,		[CreatedOn]
	FROM	Datapoints				[data]
	JOIN	Devices					dev
	ON		[data].DeviceID		=	dev.DeviceID
	AND		[dev].DeviceID	=	@DeviceID 
	AND		[dev].IsActive		=	1
	JOIN	UserDevices				connections
	ON		connections.DeviceID			=	dev.DeviceID
	AND		connections.UserID				=	@UserId 
	AND		connections.ConnectionActive	=	1
	WHERE	[data].CreatedOn		BETWEEN @MinDate	AND @MaxDate
	AND		[Value]					BETWEEN @MinValue	AND	@MaxValue

END
GO
