Add-PSSnapin  "Microsoft.SharePoint.PowerShell"

#specify your account name and password below
$UserName = "cloudbasesolutions\spFarm"
$UserNamePassword = "AccountPassword"
$SecureUserPassword = ConvertTo-SecureString $UserNamePassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential $UserName, $SecureUserPassword
New-SPManagedAccount -Credential $Credential
$UserName = "cloudbasesolutions\spAppPool"
$UserNamePassword = "AccountPassword"
$SecureUserPassword = ConvertTo-SecureString $UserNamePassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential $UserName, $SecureUserPassword
New-SPManagedAccount -Credential $Credential
