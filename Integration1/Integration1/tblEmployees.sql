/****** Object:  Table [dbo].[Employees]    Script Date: 05/08/2018 08:55:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employees](
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL
)

GO


