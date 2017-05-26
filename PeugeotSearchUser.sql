DECLARE @REF [VARCHAR] (8)
SET @REF = '80911403'

SELECT 'tb_Clients' , * 
from peugeotweb.[dbo].[tb_Clients]
where [RefClient] = @REF


SELECT 'PGT_Users' , * 
from peugeotweb.[dbo].[PGT_Users]
where[RefUser] = @REF

SELECT 'tb_Importateurs' , * 
from peugeotweb.[dbo].[tb_Importateurs]
where	[RefImportateur] = @REF

SELECT 'tb_ClientsImportateurs' , * 
from [dbo].[tb_ClientsImportateurs]
where [RefClientImportateur] = @REF