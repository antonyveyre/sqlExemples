


begin tran

SELECT * INTO dbo.EtNew2 
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\Users\antony.veyre\Desktop\etNew.xlsx;Extended Properties=Excel 15.0')...[etNew$]

select * from dbo.EtNew2
rollback



begin tran

SELECT * INTO dbo.EtNew1

FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
'Excel 8.0;Database=C:\Users\antony.veyre\Desktop\etNew.xlsx', [etNew$])

select * from dbo.EtNew1
rollback



begin tran

SELECT * INTO dbo.EtNew1

FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
'Excel 15.0;Database=C:\Users\antony.veyre\Desktop\tryExport.xlsx', [oldEtesia$])

select * from dbo.EtNew1
rollback

