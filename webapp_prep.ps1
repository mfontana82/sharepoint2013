{\rtf1\ansi\ansicpg1252\cocoartf1265
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 $WebAppPool = "SP - Web App 80\'94\
$WebAppName = "SP - Web App 80"\
$WebAppPoolAcct = \'93cloudbasesolutions\\spAppPool"\
$WebAppDbName = "SP_Content_DB\'94\
$WebAppDbServer = \'93<db isntance name>\'94\
$WebAppPath = \'93c:\\inetpub\\wwwroot\\wss\\VirtualDirectories\\SpWebApp\'94\
$WebAppPort = "80"\
$SiteColUrl = ("http://<url del sito>\'94)\
$SiteColOwner = \'93cloudbasesolutions\\spFarm"\
$SiteColDescription = \'93Sharepoint Unattended Deploy Web Application Example\'94\
$SiteColName = \'93Test Site Collection\'94\
$SiteColTemplate = "STS#0"\
New-SPWebApplication -ApplicationPool $WebAppPool -Name $WebAppName -ApplicationPoolAccount (Get-SPManagedAccount $WebAppPoolAcct) `\
-DatabaseName $WebAppDbName -DatabaseServer $WebAppDbServer -Path $WebAppPath -Port $WebAppPort -Url $SiteColUrl `\
-AuthenticationProvider (New-SPAuthenticationProvider)\
New-SPSite -Url $SiteColUrl -OwnerAlias $SiteColOwner -Description $SiteColDescription -Name $SiteColName -Template $SiteColTemplate}