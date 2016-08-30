USE [MNIS_QM]
GO
/****** Object:  Table [dbo].[COM_DEPT_USER]    Script Date: 03/18/2016 16:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COM_DEPT_USER](
	[ID] [bigint] NOT NULL,
	[DEPT_CODE] [varchar](50) NOT NULL,
	[USER_CODE] [varchar](50) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[UPDATE_TIME] [datetime] NOT NULL,
	[CREATE_BY] [varchar](50) NOT NULL,
	[UPDATE_BY] [varchar](50) NOT NULL,
 CONSTRAINT [PK_COM_DEPT_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_COM_DEPT_USER] UNIQUE NONCLUSTERED 
(
	[DEPT_CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COM_DEPT]    Script Date: 03/18/2016 16:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COM_DEPT](
	[CODE] [varchar](50) NOT NULL,
	[NAME] [varchar](max) NOT NULL,
	[STATUS] [varchar](50) NOT NULL,
	[FATHER_DEPT] [varchar](50) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[UPDATE_TIME] [datetime] NOT NULL,
	[UPDATE_BY] [varchar](max) NOT NULL,
	[CREATE_BY] [varchar](max) NOT NULL,
 CONSTRAINT [PK_COM_DEPOT] PRIMARY KEY CLUSTERED 
(
	[CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[COM_DEPT] ([CODE], [NAME], [STATUS], [FATHER_DEPT], [CREATE_TIME], [UPDATE_TIME], [UPDATE_BY], [CREATE_BY]) VALUES (N'0001', N'测试科室01', N'1', NULL, CAST(0x0000A5CC00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), N'tester', N'tester')
INSERT [dbo].[COM_DEPT] ([CODE], [NAME], [STATUS], [FATHER_DEPT], [CREATE_TIME], [UPDATE_TIME], [UPDATE_BY], [CREATE_BY]) VALUES (N'0002', N'测试科室02', N'1', N'0001', CAST(0x0000A5CC00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), N'tester', N'tester')
INSERT [dbo].[COM_DEPT] ([CODE], [NAME], [STATUS], [FATHER_DEPT], [CREATE_TIME], [UPDATE_TIME], [UPDATE_BY], [CREATE_BY]) VALUES (N'0003', N'测试科室03', N'1', N'0001', CAST(0x0000A5CC00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), N'tester', N'tester')
