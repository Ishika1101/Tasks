--demo
use AssemblyDb

sp_configure  'Show advanced options' ,1;
reconfigure

exec sp_configure 'clr enabled' ,1;
reconfigure

EXEC sp_configure 'show advanced option', '1';

EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;

SELECT dbo.HelloWorld() as name;

--labexercise

CREATE ASSEMBLY ClrPractice
FROM 'C:\Users\91708\source\repos\ClrPractice\bin\Debug\ClrPractice.dll'
WITH PERMISSION_SET = SAFE

Create Function dbo.clrIsMatch(
    @strInput As nvarchar(4000),
    @strPattern As nvarchar(255)
)
Returns Bit
As External Name [ClrPractice].[ClrPractice.RegexFunctions].[clrIsMatch]
GO

select 
    txt, dbo.clrIsMatch(txt,'[0-9]+') 
from (
    select 'some 123 text' as txt union all 
    select 'no numbers here' union all 
    select 'numbers 456 again'
) x