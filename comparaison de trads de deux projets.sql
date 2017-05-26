


select * from dbo.Translation as t
--right outer join  dbo.Translation as t2 on t.KeyId is null -- and t.LngId = t2.LngId 
join dbo.[Language] as l  on t.LngId = l.LngId
where 
t.ProjectId in (1,2) and
 --t.Translation like 'Attestation de mise en service' order by ProjectId
 KeyId in (8887,8864)