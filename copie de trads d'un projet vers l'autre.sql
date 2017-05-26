select top 1000 * from dbo.Translation t
join dbo.translation as k on t.KeyId = k.Keyid and t.LngId = k.LngId and t.Translation <> k.Translation
join dbo.[key] as m on k.KeyId= m.keyid
where t.ProjectId = 2 and k.projectid = 10 and t.LngId = 3082 and OriginalId like 'UserParameters%'


begin tran
update t
set t.Translation = t2.Translation
 
from dbo.Translation as t
join dbo.Translation as t2 on t.keyid = t2.keyid and t.LngId = t2.LngId
join dbo.[key] as k on t.KeyId= k.keyid
where t2.ProjectId = 2 and t.projectid = 10 and t.LngId = 3082 and OriginalId like 'UserParameters%'
and t.LngId = 3082

select * from dbo.Translation as t
join dbo.Translation as t2 on t.keyid = t2.keyid and t.LngId = t2.LngId
join dbo.[key] as k on t.KeyId= k.keyid
where t2.ProjectId = 2 and t.projectid = 10 and t.LngId = 3082 and OriginalId like 'UserParameters%'
and t.LngId = 3082


rollback 


