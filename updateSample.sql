/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [RefTarif]
      ,[RefPiece]
      ,[PTTC]
      ,[PGHT]
      ,[PDHT]
      ,[Devise]
  FROM [PEUGEOTWEB].[dbo].[tb_Tarifs]
  WHERE -- PGHT = 0  AND
   REFTARIF = '04GF'

   use peugeotweb
   begin transaction
   update [tb_Tarifs]
   set pght = 0 where reftarif = '04GF' and refpiece = '064800'
   rollback


/*** UPDATE WITH REPLACE ****/


begin tran 
select * 
from imp.PackageParam


update imp.PackageParam

set [Path] = replace([Path],'PROD2','PREPROD_NEO')
select * 
from imp.PackageParam


rollback