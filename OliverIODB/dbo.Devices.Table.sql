USE [OliverIODB]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceTypeID] [tinyint] NOT NULL,
	[AccessKey] [uniqueidentifier] NOT NULL,
	[DeviceName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Devices_UniqueName]    Script Date: 8/15/2022 5:32:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Devices_UniqueName] ON [dbo].[Devices]
(
	[DeviceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK_Devices_DeviceTypes] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceTypes] ([DeviceTypeID])
GO
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK_Devices_DeviceTypes]
GO
