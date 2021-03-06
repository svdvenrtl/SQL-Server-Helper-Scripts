IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDT_TSQLUnit_Result' AND ss.name = N'dbo')
CREATE TYPE [dbo].[UDT_TSQLUnit_Result] FROM [varchar](2048) NOT NULL
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_GenerateErrorMessage_Int]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- Add functions
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
--			Jane		Created
---------------------------------------------------------------------
CREATE FUNCTION [dbo].[tsu_GenerateErrorMessage_Int]
(
	@pstrMessage AS VARCHAR(100),
	@pintExpected AS INTEGER,
	@pintActual AS INTEGER
)
RETURNS VARCHAR(1000)
AS 
BEGIN
	DECLARE @strMessage AS VARCHAR(1000)
	SET @strMessage = ''''
	
	IF LEN(@pstrMessage) > 0
	BEGIN

		SET @strMessage = @pstrMessage + '' - ''

	END
	
	SET @strMessage = @strMessage + ''Unexpected Result.  Expected: ''


	IF @pintExpected IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@pintExpected AS VARCHAR(20))
	END

	SET @strMessage =  @strMessage + ''.  Actual: ''

	IF @pintActual IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@pintActual AS VARCHAR(20))
	END

	RETURN @strMessage
END

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_GenerateErrorMessage_Real]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
--			Jane		Created
---------------------------------------------------------------------
CREATE FUNCTION [dbo].[tsu_GenerateErrorMessage_Real]
(
	@pstrMessage AS VARCHAR(100),
	@prealExpected AS REAL,
	@prealActual AS REAL
)
RETURNS VARCHAR(1000)
AS 
BEGIN
	DECLARE @strMessage AS VARCHAR(1000)
	SET @strMessage = ''''
	
	IF LEN(@pstrMessage) > 0
	BEGIN

		SET @strMessage = @pstrMessage + '' - ''

	END
	
	SET @strMessage = @strMessage + ''Unexpected Result.  Expected: ''

	IF @prealExpected IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@prealExpected AS VARCHAR(20))
	END


	SET @strMessage =  @strMessage + ''.  Actual: ''

	IF @prealActual IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@prealActual AS VARCHAR(20))
	END

	RETURN @strMessage
END

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_GenerateErrorMessage_String]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
--			Jane		Created
---------------------------------------------------------------------
CREATE FUNCTION [dbo].[tsu_GenerateErrorMessage_String]
(
	@pstrMessage AS VARCHAR(100),
	@pstrExpected AS VARCHAR(1000),
	@pstrActual AS VARCHAR(1000)
)
RETURNS VARCHAR(1000)
AS 
BEGIN
	DECLARE @strMessage AS VARCHAR(1000)
	SET @strMessage = ''''
	
	IF LEN(@pstrMessage) > 0
	BEGIN

		SET @strMessage = @pstrMessage + '' - ''

	END
	
	SET @strMessage = @strMessage + ''Unexpected Result.  Expected: ''

	IF @pstrExpected IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + @pstrExpected
	END

	SET @strMessage =  @strMessage + ''.  Actual: ''



	IF @pstrActual IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + @pstrActual
	END

	RETURN @strMessage
END

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_GenerateErrorMessage_Date]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
--			Jane		Created
---------------------------------------------------------------------
CREATE FUNCTION [dbo].[tsu_GenerateErrorMessage_Date]
(
	@pstrMessage AS VARCHAR(100),
	@pdatExpected AS DATETIME,
	@pdatActual AS DATETIME
)
RETURNS VARCHAR(1000)
AS 
BEGIN
	DECLARE @strMessage AS VARCHAR(1000)
	SET @strMessage = ''''

	IF LEN(@pstrMessage) > 0
	BEGIN

		SET @strMessage = @pstrMessage + '' - ''

	END
	
	SET @strMessage = @strMessage + ''Unexpected Result.  Expected: ''

	IF @pdatExpected IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@pdatExpected AS VARCHAR(50))
	END

	SET @strMessage =  @strMessage + ''.  Actual: ''

	IF @pdatActual IS NULL
	BEGIN

		SET @strMessage = @strMessage + ''NULL''

	END
	ELSE
	BEGIN
		SET @strMessage = @strMessage + CAST(@pdatActual AS VARCHAR(50))
	END

	RETURN @strMessage
END

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_CheckValues_Date]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 22/06/04	Jane		Created
-- 23/09/04	Jane		Updated to allow expected to be NULL
-- 16/03/05	Jane		Updated to allow actual to be NULL
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[tsu_CheckValues_Date]
(
	@pdatExpected	DATETIME,
	@pdatActual		DATETIME,
	@pstrMessage	UDT_TSQLUnit_Result = NULL
)
AS
BEGIN

	SET NOCOUNT ON 
	
	DECLARE @strResultText UDT_TSQLUnit_Result

	IF (@pdatExpected <> @pdatActual) OR (@pdatActual IS NULL AND @pdatExpected IS NOT NULL) OR (@pdatExpected IS NULL AND @pdatActual IS NOT NULL)
	BEGIN
	
		SET @strResultText = dbo.tsu_GenerateErrorMessage_Date(''Date value mismatch '' + ISNULL(@pstrMessage,''''),@pdatExpected, @pdatActual)
		EXEC tsu_failure @strResultText

	END

END





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_CheckValues_Decimal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 12/02/04	Jane		Created
-- 23/09/04	Jane		Updated to allow expected to be NULL
-- 16/03/05	Jane		Updated to allow actual to be NULL
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[tsu_CheckValues_Decimal]
(
	@pfltExpected	DECIMAL (5,2),
	@pfltActual		DECIMAL (5,2),
	@pstrMessage	UDT_TSQLUnit_Result = NULL
)
AS
BEGIN

	SET NOCOUNT ON 
	
	DECLARE @strResultText UDT_TSQLUnit_Result

	IF @pfltExpected <> @pfltActual OR (@pfltActual IS NULL AND @pfltExpected IS NOT NULL) OR (@pfltExpected IS NULL AND @pfltActual IS NOT NULL)
	BEGIN
	
		SET @strResultText = dbo.tsu_GenerateErrorMessage_Real(''Decimal value mismatch '' + ISNULL(@pstrMessage,''''),@pfltExpected, @pfltActual)
		EXEC tsu_failure @strResultText

	END

END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_CheckValues_Int]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 12/02/04	Jane		Created
-- 23/09/04	Jane		Updated to allow expected to be NULL
-- 16/03/05	Jane		Updated to allow actual to be NULL
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[tsu_CheckValues_Int]
(
	@pintExpected	INT,
	@pintActual		INT,
	@pstrMessage	UDT_TSQLUnit_Result = NULL
)
AS
BEGIN

	SET NOCOUNT ON 
	
	DECLARE @strResultText UDT_TSQLUnit_Result

	IF @pintExpected <> @pintActual OR (@pintActual IS NULL AND @pintExpected IS NOT NULL) OR (@pintExpected IS NULL AND @pintActual IS NOT NULL)
	BEGIN
	
		SET @strResultText = dbo.tsu_GenerateErrorMessage_Int(''Integer value mismatch '' + ISNULL(@pstrMessage,''''),@pintExpected, @pintActual)
		EXEC tsu_failure @strResultText

	END

END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_CheckValues_Money]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 24/09/04	Jane		Created
-- 23/09/04	Jane		Updated to allow expected to be NULL
-- 16/03/05	Jane		Updated to allow actual to be NULL
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[tsu_CheckValues_Money]
(
	@pmonExpected	MONEY,
	@pmonActual		MONEY,
	@pstrMessage	UDT_TSQLUnit_Result = NULL
)
AS
BEGIN

	SET NOCOUNT ON 
	
	DECLARE @strResultText UDT_TSQLUnit_Result

	IF @pmonExpected <> @pmonActual OR (@pmonActual IS NULL AND @pmonExpected IS NOT NULL) OR (@pmonExpected IS NULL AND @pmonActual IS NOT NULL)
	BEGIN
	
		SET @strResultText = dbo.tsu_GenerateErrorMessage_Real(''Money value mismatch '' + ISNULL(@pstrMessage,''''),@pmonExpected, @pmonActual)
		EXEC tsu_failure @strResultText

	END

END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tsu_CheckValues_String]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

---------------------------------------------------------------------
-- Modification History
--
-- Date		Author		Description
-- ~~~~		~~~~~~		~~~~~~~~~~~~
-- 12/02/04	Jane		Created
-- 23/09/04	Jane		Updated to allow expected to be NULL
-- 16/03/05	Jane		Updated to allow actual to be NULL
--
---------------------------------------------------------------------
CREATE PROCEDURE [dbo].[tsu_CheckValues_String]
(
	@pstrExpected	UDT_TSQLUnit_Result,
	@pstrActual		UDT_TSQLUnit_Result,
	@pstrMessage	UDT_TSQLUnit_Result = NULL
)
AS
BEGIN

	SET NOCOUNT ON 
	
	DECLARE @strResultText UDT_TSQLUnit_Result

	IF @pstrExpected <> @pstrActual OR (@pstrActual IS NULL AND @pstrExpected IS NOT NULL) OR (@pstrExpected IS NULL AND @pstrActual IS NOT NULL)
	BEGIN
	
		SET @strResultText = dbo.tsu_GenerateErrorMessage_String(''String value mismatch '' + ISNULL(@pstrMessage,''''),@pstrExpected, @pstrActual)
		EXEC tsu_failure @strResultText

	END

END



' 
END
