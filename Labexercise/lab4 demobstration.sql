use tempdb;

Create table opportunity(
OpportunityId int not null Identity(1,1),
LikelyClosingDate  date null,
);

Create table table1(Id1 int not null Identity(1,1),name1 varchar(5));
Create table table2(Id2 int not null Identity(1,1),name2 varchar(5));
Create table table3(Id3 int not null Identity(1,1),name3 varchar(5));

select Id1,Id2,Id3 from table1,table2,table3;

drop table table1,table2,table3;



---create sequence
create sequence dbo.Seq_id as Int
start with 1
Increment by 1;

Create table Person(Id1 int not null  ,name1 varchar(5));
Create table Persondetail(Id2 int not null ,name2 varchar(5));
Create table Pers0nInfo(Id3 int not null ,name3 varchar(5));

Insert into Person (Id1,name1)values(Next value for Seq_id,'ishi');

