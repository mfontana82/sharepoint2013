Import-PSSession -Session (New-PSSession -ComputerName <nome dc> -Credential (Get-Credential)) -CommandName New-ADUser
$Password = <password per utente spFarm>
$Name = "spFarm"
$UPN = "spExtranetFarm@cloudbasesolutions.com”
$Description = "SharePoint Farm Administrator Account"
$Path = "ou=service,ou=accounts,ou=sharepoint2013,dc=testdomain,dc=com"
New-ADUser -Name $Name -AccountPassword $Password -Description $Description ` -Enabled $true -PasswordNeverExpires $true -Path $Path -SamAccountName $Name ` -UserPrincipalName $UPN
$Password = <password per utente installatore>
$Name = "spInstall"
$UPN = "spInstall@cloudbasesolutions.com"
$Description = "SharePoint Installation Account"
$Path = "ou=service,ou=accounts,ou=sharepoint2013,dc=cloudbasesolutions,dc=com"
New-ADUser -Name $Name -AccountPassword $Password -Description $Description ` -Enabled $true -PasswordNeverExpires $true -Path $Path -SamAccountName $Name ` -UserPrincipalName $UPN
$Password = <password per utenza appPool>
$Name = "spAppPool"
$UPN = "spAppPool@cloudbasesolutions.com"
$Description = "SharePoint Application Pool Account"
$Path = "ou=service,ou=accounts,ou=sharepoint2013,dc=cloudbasesolutions,dc=com"
New-ADUser -Name $Name -AccountPassword $Password -Description $Description ` -Enabled $true -PasswordNeverExpires $true -Path $Path -SamAccountName $Name ` -UserPrincipalName $UPN
//aggiunta user-groups locali e domain groups
Invoke-Command -ComputerName <nome locale macchina> {
 $User = [ADSI]("WinNT://cloudbasesolutions/spFarm")
 $Group = [ADSI]("WinNT://<nome locale macchina> /Administrators")
 $Group.PSBase.Invoke("Add",$User.PSBase.Path)
 $User = [ADSI]("WinNT://cloudbasesolutions/spInstall")
 $Group = [ADSI]("WinNT://<nome locale macchina> /Administrators")
 $Group.PSBase.Invoke("Add",$User.PSBase.Path)
} -Credential (Get-Credential)