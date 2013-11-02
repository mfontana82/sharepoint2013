Add-PSSnapin Microsoft.SharePoint.PowerShell\
$FarmCredential = Get-Credential -credential cloudbasesolutions\\spFarm\
$Passphrase = Read-Host -assecurestring "Sharepoitn Pass Phrase"\
$DbName = "SP_Config"
$DbServer = <sql_server_name>
$AdminContentDb = "SP_Extranet_AdminContent"\
New-SPConfigurationDatabase -DatabaseName $DbName -DatabaseServer $DbServer -AdministrationContentDatabaseName $AdminContentDb -FarmCredentials $FarmCredential -Passphrase $Passphrase\
Install-SPHelpCollection -All\
Initialize-SPResourceSecurity\
Install-SPService\
Install-SPFeature -AllExistingFeatures\
New-SPCentralAdministration -Port 10000 -WindowsAuthProvider "NTLM"\
Install-SPApplicationContent\
Get-Credential -credential cloudbasesolutions\\spAppPool | New-SPManagedAccount}