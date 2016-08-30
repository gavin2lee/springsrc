USE [MNIS_QM]
GO
/****** Object:  Table [dbo].[QUALITY_INDEX_ITEM]    Script Date: 08/23/2016 20:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUALITY_INDEX_ITEM](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INDEX_ITEM_NAME] [varchar](100) NOT NULL,
	[INDEX_ITEM_TYPE] [varchar](2) NOT NULL,
	[STATUS] [varchar](2) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[UPDATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](100) NOT NULL,
	[UPDATE_PERSON] [varchar](100) NOT NULL,
 CONSTRAINT [PK_QUALITY_INDEX_ITEM] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
