Declare @Name varchar(256) = 'result Promo'


SELECT object_schema_name([object_id])+ '.' + object_name([object_id]),*
FROM sys.sql_modules
WHERE definition LIKE ('%'+ @Name +'%')
ORDER BY object_schema_name([object_id]),object_name([object_id])



Select C.name,S.step_name,S.command 
from msdb.dbo.sysjobsteps S
join msdb.dbo.sysjobs C on S.job_id = C.job_id
where command like ('%'+ @Name +'%')
