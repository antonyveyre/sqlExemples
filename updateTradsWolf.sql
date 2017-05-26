
begin tran
insert into [DocumatTranslation].[dbo].Translation 
SELECT 1 ,t.KeyId,t.LngId,t.Translation,t.StatusId,GETDATE(),6
  FROM [DocumatTranslation].[dbo].[Key] as k 
  join [DocumatTranslation].[dbo].Translation as t on t.KeyId = k.KeyId 
  where MetadataId = 31 and LngId = 2070 and t.ProjectId in (12) and k.KeyId not in ( SELECT k.KeyId 
  FROM [DocumatTranslation].[dbo].[Key] as k 
  join [DocumatTranslation].[dbo].Translation as t on t.KeyId = k.KeyId 
  where MetadataId = 31 and LngId = 2070 and t.ProjectId in (1))



SELECT *
  FROM [DocumatTranslation].[dbo].[Key] as k 
  join [DocumatTranslation].[dbo].Translation as t on t.KeyId = k.KeyId 
  where MetadataId = 31 and LngId = 2070 and t.ProjectId in (12) and k.KeyId not in ( SELECT k.KeyId 
  FROM [DocumatTranslation].[dbo].[Key] as k 
  join [DocumatTranslation].[dbo].Translation as t on t.KeyId = k.KeyId 
  where MetadataId = 31 and LngId = 2070 and t.ProjectId in (1))


rollback 