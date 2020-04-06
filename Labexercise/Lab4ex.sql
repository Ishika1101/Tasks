

create table prospect(
ProspectId int not null primary key Identity(1,1),
ProspectName varchar(30) not null,  
); 

use HumanResoursesDb
create table Marketing
(
OpportunityId int not null Primary key Identity(1,1),

DateRaised datetime not null,
Likelihood bit not null,
Rating char(1) not null,
EstimatedClosingDate date not null,
EstimatedRevenue decimal(10,2) not null,
ProspectId int not null Constraint Fk_prospectId foreign key references prospect(ProspectId)

);

alter table Marketing Add Constraint defaultdate Default(GetDate()) for DateRaised;

alter table Marketing Add constraint checkdate Check (DateRaised=GetDate()) ;

Alter table Marketing Drop constraint fk_ProspectID;

Use HumanResoursesDb;
ALTER TABLE dbo.Marketing
ADD CONSTRAINT fk_ProspectID FOREIGN KEY (ProspectId) REFERENCES dbo.prospect(ProspectId) ON DELETE CASCADE;



select * from  sys.sysconstraints