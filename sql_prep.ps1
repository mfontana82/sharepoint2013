Import-PSSession -Session (
 New-PSSession -ComputerName <sql db> -Credential (Get-Credential)
) -CommandName Invoke-Sqlcmd
Invoke-Sqlcmd -ServerInstance  <sql db> -Database master –Query `
"USE [master]
GO
CREATE LOGIN [cloudbasesolutions\spInstall] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [cloudbasesolutions\spInstall]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [cloudbasesolutions\spInstall]
GO"

//set del max_degree of parallelism a 1

Invoke-Sqlcmd -ServerInstance <sql db> -Database master –Query `
"EXEC sys.sp_configure N'max degree of parallelism',N'1'
GO
RECONFIGURE WITH OVERRIDE
GO"

//ritornerà errore se già settato