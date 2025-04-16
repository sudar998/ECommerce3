USE [ECommerceYT]
GO

/****** Object:  StoredProcedure [dbo].[CategoryCrud]    Script Date: 17/4/2025 2:12:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CategoryCrud] 
	-- Add the parameters for the stored procedure here
	@Action varchar(15),
	@CategoryId int = NULL, 
	@CategoryName varchar(100) = null,
	@CategoryImageUrl varchar(max) = null, 
	@IsActive bit = false


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Get all category
	IF (@Action =  'GETALL')
	BEGIN
	 SELECT * FROM Category ; 
	END 

	  -- Insert category
	IF (@Action =  'INSERT')
	BEGIN
	 INSERT INTO Category(CategoryName , CategoryImageUrl , IsActive , CreatedDate ) VALUES(@CategoryName , @CategoryImageUrl, 
	 @IsActive , GETDATE())
	END 

	--Update category
	IF (@Action =  'UPDATE')
	BEGIN
	DECLARE @UpdateImage varchar(20) 
	SELECT @UpdateImage = (CASE WHEN @CategoryImageUrl IS NULL THEN 'No' ELSE 'Yes' END)
	IF(@UpdateImage = 'No')
	 BEGIN
		 UPDATE Category 
		 SET CategoryName = @CategoryName , IsActive = @IsActive
		 WHERE CategoryId = @CategoryId
     END 
	ELSE 
	  BEGIN
       UPDATE Category 
		 SET CategoryName = @CategoryName , CategoryImageUrl = @CategoryImageUrl,  IsActive = @IsActive
		 WHERE CategoryId = @CategoryId
	  END 
	END 

	--Delete Category
	IF(@Action = 'DELETE')
	BEGIN
	DELETE FROM Category WHERE CategoryId = @CategoryId
	END

	--Get Active Category by Category Id
	IF(@Action = 'ACTIVECATEGORY')
	BEGIN
	SELECT * FROM Category ct
	WHERE IsActive = 1 ORDER BY CT.CategoryName

	END


END
GO

