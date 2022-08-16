USE [OliverIODB]
GO
/****** Object:  Table [dbo].[Datapoints]    Script Date: 8/15/2022 5:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datapoints](
	[DatapointID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Datapoints] PRIMARY KEY CLUSTERED 
(
	[DatapointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Datapoints]  WITH CHECK ADD  CONSTRAINT [FK_Datapoints_Devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([DeviceID])
GO
ALTER TABLE [dbo].[Datapoints] CHECK CONSTRAINT [FK_Datapoints_Devices]
GO
