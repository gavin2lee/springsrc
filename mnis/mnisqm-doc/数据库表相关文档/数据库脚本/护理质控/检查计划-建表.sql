USE [MNIS_QM]
GO
/****** Object:  Table [dbo].[QUALITY_PLAN]    Script Date: 08/25/2016 09:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUALITY_PLAN](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TEAM_NAME] [varchar](100) NOT NULL,
	[START_DATE] [varchar](10) NOT NULL,
	[END_DATE] [varchar](10) NOT NULL,
	[MODEL_NAME] [varchar](100) NOT NULL,
	[TASK_NUM] [varchar](10) NULL,
	[STATUS] [varchar](2) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[UPDATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](100) NOT NULL,
	[UPDATE_PERSON] [varchar](100) NOT NULL,
 CONSTRAINT [PK_QUALITY_PLAN] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
