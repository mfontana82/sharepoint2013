{\rtf1\ansi\ansicpg1252\cocoartf1265
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 Add-PSSnapin Microsoft.SharePoint.PowerShell\
$FarmCredential = Get-Credential -credential cloudbasesolutions\\spFarm\
$Passphrase = Read-Host -assecurestring "Sharepoitn Pass Phrase"\
$DbName = "SP_Extranet_Config"\
$DbServer = \'93<sql_server_name>\'94\
$AdminContentDb = "SP_Extranet_AdminContent"\
New-SPConfigurationDatabase -DatabaseName $DbName -DatabaseServer $DbServer -AdministrationContentDatabaseName $AdminContentDb -FarmCredentials $FarmCredential -Passphrase $Passphrase\
Install-SPHelpCollection -All\
Initialize-SPResourceSecurity\
Install-SPService\
Install-SPFeature -AllExistingFeatures\
New-SPCentralAdministration -Port 10000 -WindowsAuthProvider "NTLM"\
Install-SPApplicationContent\
Get-Credential -credential cloudbasesolutions\\spAppPool | New-SPManagedAccount}