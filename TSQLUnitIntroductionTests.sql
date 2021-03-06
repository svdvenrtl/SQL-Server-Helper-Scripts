SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ut_Introduction_ThisTestShouldPass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 05/11/03	Jane		Initial Creation
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ut_Introduction_ThisTestShouldPass]
AS
BEGIN

	DECLARE @strResultText		AS VARCHAR(2048)
	DECLARE @intActualCount		AS INTEGER
	DECLARE @intExpectedCount		AS INTEGER

	SET @intExpectedCount = 1
	
	EXEC tsu_CheckValues_Int 1, @intExpectedCount, ''This test deliberately coded to pass. ''

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ut_Introduction_ThisTestShouldFail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 05/11/03	Jane		Initial Creation
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ut_Introduction_ThisTestShouldFail]
AS
BEGIN

	DECLARE @strResultText		AS VARCHAR(2048)
	DECLARE @intActualCount		AS INTEGER
	DECLARE @intExpectedCount		AS INTEGER

	SET @intExpectedCount = 1

	EXEC tsu_CheckValues_Int 0, @intExpectedCount, ''This test deliberately coded to fail. ''
	
END

' 
END
