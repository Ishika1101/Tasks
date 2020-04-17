--demo 1
Create database MemoryTb 
alter database MemoryTb add filegroup MemFG contains Memory_optimized_data
ALTER DATABASE MemoryTb
ADD FILE (NAME = 'MemData', FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MemData.ndf')
TO FILEGROUP MemFG;

use MemoryTb
create table MemoryOptimizedExample(
id int primary key Nonclustered,
name varchar(30) not null,
OrderId INTEGER NOT NULL,
LineItem INTEGER NOT NULL,
OrderDate DATETIME NOT NULL,
)
with (Memory_Optimized=on)

create table DiskBasedExample(
id int not null primary key,
name varchar(50) not null,
);

use MemoryTb
set Statistics time On
declare @i int
declare @pk int
set @pk=101
set @i=1
while (@i<=1000)
begin
Insert into MemoryOptimizedExample (id,name,OrderId,LineItem,OrderDate) values(@pk,'ishika',2,3,'6-4-2020')
set @i=@i+1
set @pk=@pk+1
end
set statistics time off


SET STATISTICS IO ON  
declare @j int
declare @id int
set @id=2000
set @j=1
while (@j<=100)
begin
insert into DiskBasedExample(id,name) values(@id,'ishika')
set @j=@j+1
set @id=@id+1
end
SET STATISTICS IO off 

--demo2
create procedure dbo.nativesp1 @initial int
with Native_Compilation,SchemaBinding ,Execute as owner
as
begin atomic with
(Transaction Isolation level = snapshot,
Language ='us_English')
declare @i int
declare @pk int
set @pk=@initial
set @i=1
while (@i<=100)
begin
Insert into dbo.MemoryOptimizedExample (id,name,OrderId,LineItem,OrderDate) values(@pk,'ishika',2,3,'6-4-2020')
set @i=@i+1
set @pk=@pk+1
end
end

exec nativesp1 1

--Lab1
Create database InternetSalesDb 
alter database InternetSalesDb add filegroup SalesFG contains Memory_optimized_data
ALTER DATABASE InternetSalesDb
ADD FILE (NAME = 'SalesData', FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SalesData.ndf')
TO FILEGROUP SalesFG;

Create table ShoppingCart(
Sessionid int not null,
TimeAdded datetime not null,
CustomerKey Integer not null,
ProductKey Integer not null,
Quantity Integer not null,
Primary key NonClustered(SessionId,ProductKey)
)
with (Memory_Optimized = on,Durability=schema_and_data);

Insert Into ShoppingCart(SessionId,TimeAdded,CustomerKey,ProductKey,Quantity) values (1,SYSDATETIME(),2,3,1);
Insert Into ShoppingCart(SessionId,TimeAdded,CustomerKey,ProductKey,Quantity) values (1,SYSDATETIME(),2,3,1);

select * from ShoppingCart

--lab 2
use InternetSalesDb
create procedure dbo.AddItemToCart @SessionId int,@TimeAdded datetime,@CustomerKey Integer,@ProductKey Integer,@Quantity Integer
with Native_Compilation,SchemaBinding ,Execute as owner
as
begin atomic with
(Transaction Isolation level = snapshot,
Language ='us_English')
Insert into dbo.ShoppingCart (SessionId,TimeAdded,CustomerKey,ProductKey,Quantity) values(@SessionId,@TimeAdded,@CustomerKey,@ProductKey,@Quantity)
end;

create procedure dbo.DeleteItemFromCart @SessionId int,@ProductKey Integer
with Native_Compilation,SchemaBinding ,Execute as owner
as
begin atomic with
(Transaction Isolation level = snapshot,
Language ='us_English')
Delete from dbo.ShoppingCart where SessionId=@SessionId and ProductKey=@ProductKey
end;

create procedure dbo.EmptyCart @SessionId int
with Native_Compilation,SchemaBinding ,Execute as owner
as
begin atomic with
(Transaction Isolation level = snapshot,
Language ='us_English')
Delete from dbo.ShoppingCart where SessionId=@SessionId 
end;

exec dbo.AddItemToCart 3,'2-6-2020',2,4,1;
exec dbo.DeleteItemFromCart 3,4
select * from ShoppingCart
exec dbo.EmptyCart 3 


