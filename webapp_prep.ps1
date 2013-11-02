$WebAppPool = "SP - Web App 80”
$WebAppName = "SP - Web App 80"
$WebAppPoolAcct = “cloudbasesolutions\spAppPool"
$WebAppDbName = "SP_Content_DB”
$WebAppDbServer = “<db isntance name>”
$WebAppPath = “c:\inetpub\wwwroot\wss\VirtualDirectories\SpWebApp”
$WebAppPort = "80"
$SiteColUrl = ("http://<url del sito>”)
$SiteColOwner = “cloudbasesolutions\spFarm"
$SiteColDescription = “Sharepoint Unattended Deploy Web Application Example”
$SiteColName = “Test Site Collection”
$SiteColTemplate = "STS#0"
New-SPWebApplication -ApplicationPool $WebAppPool -Name $WebAppName -ApplicationPoolAccount (Get-SPManagedAccount $WebAppPoolAcct) `
-DatabaseName $WebAppDbName -DatabaseServer $WebAppDbServer -Path $WebAppPath -Port $WebAppPort -Url $SiteColUrl `
-AuthenticationProvider (New-SPAuthenticationProvider)
New-SPSite -Url $SiteColUrl -OwnerAlias $SiteColOwner -Description $SiteColDescription -Name $SiteColName -Template $SiteColTemplate