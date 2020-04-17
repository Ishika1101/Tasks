

use HumanResoursesDb
update vProductList set LanguageId='fr',ProductName='Sunsik' where ProductId=2
select * from vProductList


create trigger dbo.updateviewstrigger on dbo.vProductList
instead of update
as
begin
set Nocount on
declare @id int
declare @name varchar(20)
declare @langid varchar(40)
select @id=i.ProductId from Inserted as i
select @langid=i.LanguageId from Inserted as i
select @name=ProductName from Inserted as i
update vProductList set LanguageId=@langid where LanguageId=@id
update vProductList set ProductName=@name where LanguageId=@id
end

alter trigger dbo.updateviewstrigger on dbo.vProductList
instead of update
as
begin
set Nocount on
declare @id int
declare @name varchar(20)
declare @langid varchar(40)
select @id=i.ProductId from Inserted as i
select @langid=i.LanguageId from Inserted as i
select @name=ProductName from Inserted as i
update vProductList set LanguageId=@langid where ProductId=@id
update vProductList set ProductName=@name where ProductId=@id
end

select * from vProductList