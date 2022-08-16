USE [OliverIODB]
GO
/****** Object:  StoredProcedure [dbo].[usp_PostDatapoint]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PostDatapoint]
	@DeviceID tinyint
,	@Value int
AS
BEGIN

	INSERT INTO Datapoints
	VALUES (@DeviceID, @Value, GETDATE())

	SELECT	SCOPE_IDENTITY()	AS NewlyInsertedDatapointID

END
GO
