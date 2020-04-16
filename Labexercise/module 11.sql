use HumanResoursesDb;
Insert into products(ProductName,ProductNo,SellStartDate,SellEndDate,Color) values('shampoo1',3,8,9,'pink');
Update  products set ProductName='sunsilk' where ProductId=4;
---after insert //demo 1
create trigger productInsert on dbo.products
after insert
as 
begin
set nocount on

Select * from Inserted;
select * from deleted;
end;


--after update
create trigger productupdate on dbo.products
after update
as 
begin
set nocount on

Select * from Inserted;
select * from deleted;
end;

--insert into another table uing after insert and multiple triggers on product table
create table auditb(id int,
name varchar(40));

Create trigger AddDataInAudit on dbo.products
after Insert
as begin
set nocount on
Insert into dbo.auditb(id,name)
select i.ProductId,i.ProductName from Inserted as i
end

Insert into products(ProductName,ProductNo,SellStartDate,SellEndDate,Color) values('sunsilk2',3,8,9,'black');
select * from dbo.auditb;

---delete on after delete trigger
create trigger productdelete on dbo.Persons
after delete
as 
begin
set nocount on
delete from   Dbo.PersonDetails where PersonDetailId=(select  d.PersonDetailId from deleted as d )
end;

delete from dbo.Persons where PersonId=1


---update  on  after delete trigger
create trigger productdeleteonUpdate on dbo.Persons
after delete
as 
begin
set nocount on

update P set Address='abcd' from PersonDetails as P
where Exists(select 1 from deleted as d where P.PersonDetailId=d.PersonDetailId);
end;

alter trigger productdeleteonUpdate on dbo.Persons
after delete
as 
begin
set nocount on
Select * from Deleted;
update P set Address='abcdefg' from PersonDetails as P
where Exists(select 1 from deleted as d where P.PersonDetailId=d.PersonDetailId);
end; 

delete from dbo.Persons where PersonId=5

--after update trigger
create   trigger PersonDetailUpdate on dbo.PersonDetails
after update
as
begin
set nocount on
update p set Address='abcd' from dbo.PersonDetails as p
inner join Inserted as I on I.PersonDetailId=p.PersonDetailId
end;

update  dbo.PersonDetails set Address='123' where PersonDetailId=2;

--Instead of trigger
create  trigger InsteadOfDelete on dbo.PersonDetails
Instead of delete
as
begin
set nocount on
update P set Address='abcd' from PersonDetails as P inner join deleted as d on  d.PersonDetailId=p.PersonDetailId 
end

delete from PersonDetails where PersonDetailId=4


--order
Exec sp_settriggerorder
@triggername='dbo.productdeleteonUpdate',
@order='first',
@stmttype='delete';


