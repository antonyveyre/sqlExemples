





begin tran
BULK INSERT zip.UnzipConfiguration
    FROM '\\vs-tsql2K14D4\EAI\Haulotte\unzipConfiguration.csv'
    WITH
    (
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    --ERRORFILE = 'C:\CSVDATA\SchoolsErrorRows.csv',
    TABLOCK
    )
	select * from zip.UnzipConfiguration
rollback

	select * from zip.UnzipConfiguration
order by InputZipFilenamePattern






