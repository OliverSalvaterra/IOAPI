USE [OliverIODB]
GO
/****** Object:  UserDefinedFunction [dbo].[DataIsValid]    Script Date: 8/15/2022 5:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DataIsValid] ()
RETURNS bit AS
BEGIN
	
	DECLARE @valid			AS	bit;

	SELECT	@valid	= CASE COUNT(Value)
						WHEN 0 THEN 1
						ELSE 0
					END
	FROM	Datapoints		dp
	,		Devices			ds
	WHERE	dp.DeviceID = ds.DeviceID
	AND		ds.IsActive = 0

	RETURN @valid
	
END
GO
