use HumanResoursesDb

CREATE TABLE Author
(
    id INT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    
 )
 
CREATE TABLE Book
(
    id INT PRIMARY KEY,
    book_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    author_id INT NOT NULL
   
 )

 INSERT INTO Author 
 
VALUES
(1, 'Author1'),
(2, 'Author2'),
(3, 'Author3'),
(4, 'Author4'),
(5, 'Author5'),
(6, 'Author6'),
(7, 'Author7')
 
 
INSERT INTO Book 
 
VALUES
(1, 'Book1',500, 1),
(2, 'Book2', 300 ,2),
(3, 'Book3',700, 1),
(4, 'Book4',400, 3),
(5, 'Book5',650, 5),
(6, 'Book6',400, 3)

--Scalar function //demo1
create function getLastDate(@date date)
returns date
as
begin
return (select EOMONTH (@date))
end

SELECT EOMONTH('2020-04-09') ;
SELECT OBJECTPROPERTY(OBJECT_ID('dbo.ufnGetProductDealerPrice'), 'IsDeterministic');  

--
create function dbo.getLastDatebyUf(@date date)
returns date
as 
begin
return
(DateAdd(Month,-1,@date))
end

select dbo.getLastDatebyUf('2020-3-24');

 
----create inline Table valued function//demo 2
CREATE FUNCTION getBooks(@AuthorId int)
RETURNS TABLE
AS

RETURN
( 
SELECT * FROM Book
WHERE author_id = @AuthorId
)

------Cross Apply

SELECT A.author_name, B.id, B.book_name, B.price
FROM Author as A
CROSS APPLY getBooks(A.Id) as B 
order by B.id,A.author_name


--------labex1
create function dbo.getFormatNo(@mobileno varchar(20))
returns varchar(20)
as
begin
declare @statement varchar(20)
if (Len(@mobileno) <>10)
set  @statement='invalid mobile no'

else 
set @statement =Left(@mobileno,3)+'-'+SUBSTRING(@mobileno,4,3)+'-'+SUBSTRING(@mobileno,7,3)
return @statement 
end
go

drop function dbo.getFormatNo

select dbo.getFormatNo('1234557892');

---lab ex2
create function dbo.ListToTable()
returns varchar(100)
as
begin
return
(
SELECT STRING_AGG(A.author_name,',') 
FROM dbo.Author as A 
)
end


select dbo.ListToTable();