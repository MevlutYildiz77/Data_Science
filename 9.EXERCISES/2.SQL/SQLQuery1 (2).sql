use ProjectCustomerRetention

USE ProjectCustomerRetention;
GO
SELECT * INTO ProjectCustomerRetention
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.16.0',
    'Data Source=C:\Users\TOSHIBA\Desktop\DataScience\3.SQL\5.Project\market_fact.xlsx=Excel 16.0')...[market_fact];



SELECT * FROM OPENROWSET('Microsoft.ACE.OLEDB.16.0',
'Excel 12.0; Database=C:\Users\TOSHIBA\Desktop\DataScience\3.SQL\5.Project\market_fact.xlsx; HDR=YES; IMEX=1',
'SELECT * FROM [Plan1$]') 
GO


sp_configure 'show advanced options', 1
GO
reconfigure
GO

sp_configure 'ad hoc distributed queries', 1
GO
reconfigure
GO






