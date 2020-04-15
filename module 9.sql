---demo 1

exec sp_configure;
exec xp_dirtree;

--demo 2
create proc getBlueProducts @color varchar(30)
as
begin
select * from products where Color=@color;
end

exec getBlueProducts blue;
select * from  sys.procedures;










--exercise  1
USE MarketDev;
GO

CREATE PROCEDURE Reports.spGetProductColors
AS
SET NOCOUNT ON;
BEGIN
	SELECT DISTINCT p.Color	FROM Marketing.Product AS p	WHERE p.Color IS NOT NULL ;
END
GO

EXEC Reports.spGetProductColors;
GO

-----
/*CREATE PROCEDURE Reports.spGetProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID, p.ProductName, p.ProductNumber, p.SellStartDate, p.SellEndDate,	p.Color, pm.ProductModelID,
		   COALESCE(ed.Description,id.Description,p.ProductName) AS EnglishDescription,
		   COALESCE(fd.Description,id.Description,p.ProductName) AS FrenchDescription,
		   COALESCE(cd.Description,id.Description,p.ProductName) AS ChineseDescription
	FROM Marketing.Product AS p
	LEFT OUTER JOIN Marketing.ProductModel AS pm ON p.ProductModelID = pm.ProductModelID
	LEFT OUTER JOIN Marketing.ProductDescription AS ed ON pm.ProductModelID = ed.ProductModelID AND ed.LanguageID = 'en'
	LEFT OUTER JOIN Marketing.ProductDescription AS fd ON pm.ProductModelID = fd.ProductModelID AND fd.LanguageID = 'fr'
	LEFT OUTER JOIN Marketing.ProductDescription AS cd ON pm.ProductModelID = cd.ProductModelID AND cd.LanguageID = 'zh-cht'
	LEFT OUTER JOIN Marketing.ProductDescription AS id ON pm.ProductModelID = id.ProductModelID AND id.LanguageID = ''
	ORDER BY p.ProductID,pm.ProductModelID;
END
GO

EXEC Reports.spGetProductsAndModels;
GO*/

use HumanResoursesDb
create proc productandmodels 
as
begin
select ProductId ProductName,ProductNo,SellStartDate,SellEndDate,Color ,ProductModelId ,
if (LanguageId='en')

ProductDescription as EnglishDescription from products 
inner join ProductModel on products.ProductId =ProductModel.ProductId
innerjoin ProductDescription on products.ProductId =ProductDescription.ProductId and ProductDescription.LanguageId='en'
innerjoin ProductDescription on products.ProductId =ProductDescription.ProductId and ProductDescription.LanguageId='fr'
innerjoin ProductDescription on products.ProductId =ProductDescription.ProductId and ProductDescription.LanguageId='ch'
innerjoin ProductDescription on products.ProductId =ProductDescription.ProductId and ProductDescription.LanguageId=''



-- Step 1 Change to the MarketDev database
Use MarketDev;
GO

--exercise 2
CREATE PROCEDURE Marketing.spGetProductsByColor @Color nvarchar(16) AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID,
	p.ProductName,
	p.ListPrice AS Price,
	p.Color,
	p.Size,
	p.SizeUnitMeasureCode AS UnitOfMeasure
	FROM Marketing.Product AS p
	WHERE (p.Color = @Color) OR (p.Color IS NULL AND @Color IS NULL)
	ORDER BY ProductName;
END
GO

EXEC Marketing.spGetProductsByColor 'red';
GO

EXEC Marketing.spGetProductsByColor NULL;
GO





