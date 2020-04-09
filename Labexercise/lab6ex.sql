Create table person (
PersonId int not null,
PersonName varchar(20) not null,
);

Create table PersonDetails(
PersonDetailId int not null primary key,
Address varchar(30) not null,
);
--heap takes more time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select PersonId from person where PersonName='ishika';
Set STATISTICS IO Off;
SET STATISTICS TIME Off; 


--clustered index takes less time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select PersonDetailId from PersonDetails where Address='abc123';
Set STATISTICS IO Off;
SET STATISTICS TIME Off; 


Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select * from person Order By PersonId asc;
Set STATISTICS IO Off;
SET STATISTICS TIME Off; 

Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select * from PersonDetails Order By PersonDetailId asc;
Set STATISTICS IO Off;
SET STATISTICS TIME Off;


--heap takes more time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select PersonId from person where PersonName='ishika' Order By PersonId desc;
Set STATISTICS IO Off;
SET STATISTICS TIME Off; 


--clustered index takes less time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
select PersonDetailId from PersonDetails where Address='abc123' Order By PersonDetailId desc;
Set STATISTICS IO Off;
SET STATISTICS TIME Off;


--heap takes less time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
Insert into person (PersonId,PersonName)values(1,'divya');
Set STATISTICS IO Off;
SET STATISTICS TIME Off;


--clusterd take more time
Set STATISTICS IO ON;
SET STATISTICS TIME ON; 
Insert into PersonDetails(PersonDetailId,Address)values(4,'wer23');
Set STATISTICS IO Off;
SET STATISTICS TIME Off;
