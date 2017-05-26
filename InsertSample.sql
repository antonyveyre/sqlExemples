/** Insert from select sample **/


BEGIN TRAN 
select * from job.Job

insert into job.job  
SELECT [name],1 FROM msdb.dbo.sysjobs where [name] like 'haulotte%'

select * from job.Job
ROLLBACK



/** Inser from select plus complexe **/ 

begin tran
INSERT INTO DBO.PermRole (role_name,Perm_Name)  
select distinct role_name , 'user_AllowMultiCnx' from dbo.PermRole 
where Role_Name not in (
select role_name from dbo.PermRole where Perm_Name like 'user_AllowMultiCnx'
)

rollback