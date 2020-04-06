


--Create Filegroups for Partition
ALTER DATABASE HumanResoursesDb ADD FILEGROUP FG1;
ALTER DATABASE HumanResoursesDb ADD FILEGROUP FG2;
ALTER DATABASE HumanResoursesDb ADD FILEGROUP FG3;
ALTER DATABASE HumanResoursesDb ADD FILEGROUP FG4;
ALTER DATABASE HumanResoursesDb  ADD FILE (Name = F1, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\F1.ndf', SIZE = 16MB) TO FILEGROUP FG1;
ALTER DATABASE HumanResoursesDb  ADD FILE (Name = F2, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\F2.ndf', SIZE = 16MB) TO FILEGROUP FG2;
ALTER DATABASE HumanResoursesDb  ADD FILE (Name = F3, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\F3.ndf', SIZE = 16MB) TO FILEGROUP FG3;
ALTER DATABASE HumanResoursesDb  ADD FILE (Name = F4, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\F4.ndf', SIZE = 16MB) TO FILEGROUP FG4;

---Partition function
create partition Function  pfHumanResourcesDates(smalldatetime)
AS RANGE LEFT  
FOR VALUES ('2014-12-31 00:00', '2015-12-31 00:00', '2016-12-31 00:00');


--Partition scheme 
create partition scheme psHumanResources
as partition pfHumanResourcesDates
to (FG1,FG2,FG3,FG4);
GO

--Partition Table
create table TimeSheet (
TimeSheetId int  IDENTITY(1,1) ,

entryDate smalldatetime not null,
)
ON  psHumanResources(entryDate);
Go

create table Timesheetstaging (

RegisteredStartTime smalldatetime not null,
)
on FG1;

alter table Timesheetstaging add constraint datecheck check(RegisteredStartTime>='2014-12-31 00:00' and RegisteredStartTime<'2015-12-31 00:00');

DECLARE @p int = $PARTITION.pfHumanResourcesDates('2015-12-31 00:00'); 
ALTER TABLE TimeSheet 
SWITCH TO Timesheetstaging PARTITION 1
GO 
SELECT COUNT(*) FROM TimeSheet;
SET STATISTICS TIME ON;


--return row count of partition
SELECT
  pstats.partition_number AS PartitionNumber
  ,pstats.row_count AS PartitionRowCount
FROM sys.dm_db_partition_stats AS pstats
WHERE pstats.object_id = OBJECT_ID('TimeSheet') and pstats.row_count=2;
ORDER BY PartitionNumber; 

---compression technique

USE HumanResoursesDb;
GO
EXEC sp_estimate_data_compression_savings 'dbo', 'TimeSheet', NULL, NULL, "ROW";
GO
 
ALTER TABLE dbo.TimeSheet REBUILD PARTITION = all
WITH  
(DATA_COMPRESSION = ROW) 
GO