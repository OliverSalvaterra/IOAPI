USE [OliverIODB]
GO
/****** Object:  Table [dbo].[UserDevices]    Script Date: 8/15/2022 5:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDevices](
	[UserID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL,
	[ConnectionActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserDevices] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDevices]  WITH CHECK ADD  CONSTRAINT [FK_UserDevices_Devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([DeviceID])
GO
ALTER TABLE [dbo].[UserDevices] CHECK CONSTRAINT [FK_UserDevices_Devices]
GO
ALTER TABLE [dbo].[UserDevices]  WITH CHECK ADD  CONSTRAINT [FK_UserDevices_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserDevices] CHECK CONSTRAINT [FK_UserDevices_Users]
GO
