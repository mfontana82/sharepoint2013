
# Import Required Modules
Import-Module BitsTransfer 


# Specify download url's for SharePoint 2013 prerequisites
$DownloadUrls = (
		    "http://download.microsoft.com/download/9/1/3/9138773A-505D-43E2-AC08-9A77E1E0490B/1033/x64/sqlncli.msi", # Microsoft SQL Server 2008 R2 SP1 Native Client
		    "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi", # Microsoft Sync Framework Runtime v1.0 SP1 (x64)
		    "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe", # Windows Server App Fabric
            "http://download.microsoft.com/download/7/B/5/7B51D8D1-20FD-4BF0-87C7-4714F5A1C313/AppFabric1.1-RTM-KB2671763-x64-ENU.exe", # Cumulative Update Package 1 for Microsoft AppFabric 1.1 for Windows Server (KB2671763)
            "http://download.microsoft.com/download/D/7/2/D72FD747-69B6-40B7-875B-C2B40A6B2BDD/Windows6.1-KB974405-x64.msu", #Windows Identity Foundation (KB974405)
		    "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi", # Microsoft Identity Extensions
		    "http://download.microsoft.com/download/9/1/D/91DA8796-BE1D-46AF-8489-663AB7811517/setup_msipc_x64.msi", # Microsoft Information Protection and Control Client
		    "http://download.microsoft.com/download/8/F/9/8F93DBBD-896B-4760-AC81-646F61363A6D/WcfDataServices.exe" # Microsoft WCF Data Services 5.0
                ) 


function DownLoadPreRequisites() 
{ 

    Write-Host ""
    Write-Host "====================================================================="
    Write-Host "      Downloading SharePoint 2013 Prerequisites Please wait..." 
    Write-Host "====================================================================="
     
    $ReturnCode = 0 
 
    foreach ($DownLoadUrl in $DownloadUrls) 
    { 
        ## Get the file name based on the portion of the URL after the last slash 
        $FileName = $DownLoadUrl.Split('/')[-1] 
        Try 
        { 
            ## Check if destination file already exists 
            If (!(Test-Path " C:\PrerequisiteInstallerFiles\$FileName")) 
            { 
                ## Begin download 
                Start-BitsTransfer -Source $DownLoadUrl -Destination C:\PrerequisiteInstallerFiles\$fileName -DisplayName "Downloading `'$FileName`' to C:\PrerequisiteInstallerFiles" -Priority High -Description "From $DownLoadUrl..." -ErrorVariable err 
                If ($err) {Throw ""} 
            } 
            Else 
            { 
                Write-Host " - File $FileName already exists, skipping..." 
            } 
        } 
        Catch 
        { 
            $ReturnCode = -1 
            Write-Warning " - An error occurred downloading `'$FileName`'" 
            Write-Error $_ 
            break 
        } 
    } 
    Write-Host " - Done downloading Prerequisites required for SharePoint 2013" 
     
    return $ReturnCode 
} 


 

function CheckProvidedDownloadPath()
{


    $ReturnCode = 0

    Try 
    { 
        # Check if destination path exists 
        If (Test-Path C:\PrerequisiteInstallerFiles) 
        { 
           # Remove trailing slash if it is present
           
	   $ReturnCode = 0
        }
        Else {

	   $ReturnCode = -1
           Write-Host ""
	   Write-Warning "Your specified download path does not exist. Please verify your download path then run this script again."
           Write-Host ""
        } 


    } 
    Catch 
    { 
         $ReturnCode = -1 
         Write-Warning "An error has occurred when checking your specified download path" 
         Write-Error $_ 
         break 
    }     
    
    return $ReturnCode 

}


 
function DownloadPreReqs() 
{ 

    $rc = 0 
    
    $rc = CheckProvidedDownloadPath  

    # Download Pre-Reqs  
    if($rc -ne -1) 
    { 
        $rc = DownLoadPreRequisites 
    } 
     

    if($rc -ne -1)
    {

        Write-Host ""
        Write-Host "Script execution is now complete!"
        Write-Host ""
    }


} 
Set-ExecutionPolicy Unrestricted –force
Import-Module ServerManager
Add-WindowsFeature NET-WCF-HTTP-Activation45,NET-WCF-TCP-Activation45,NET-WCF-Pipe-Activation45
Add-WindowsFeature Net-Framework-Features,Web-Server,Web-WebServer,Web-Common-Http,Web-Static-Content,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-App-Dev,Web-Asp-Net,Web-Net-Ext,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Health,Web-Http-Logging,Web-Log-Libraries,Web-Request-Monitor,Web-Http-Tracing,Web-Security,Web-Basic-Auth,Web-Windows-Auth,Web-Filtering,Web-Digest-Auth,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Mgmt-Tools,Web-Mgmt-Console,Web-Mgmt-Compat,Web-Metabase,Application-Server,AS-Web-Support,AS-TCP-Port-Sharing,AS-WAS-Support, AS-HTTP-Activation,AS-TCP-Activation,AS-Named-Pipes,AS-Net-Framework,WAS,WAS-Process-Model,WAS-NET-Environment,WAS-Config-APIs,Web-Lgcy-Scripting,Windows-Identity-Foundation,Server-Media-Foundation,Xps-Viewer
md c:\PrerequisiteInstallerFiles
DownloadPreReqs
WriteHost "Begin Installation Sharepoint 2013 Prerequisites"
cd C:\PrerequisiteInstallerFiles
.\sqlncli.msi /quiet IACCEPTSQLNCLILICENSETERMS=YES
.\Synchronization.msi /quiet
.\setup_msipc_x64.msi /quiet
.\MicrosoftIdentityExtensions-64.msi /quiet
.\WindowsServerAppFabricSetup_x64.exe /i
.\Windows6.1-KB974405-x64.msu /quiet
.\WcfDataServices.exe /quiet
.\AppFabric1.1-RTM-KB2671763-x64-ENU.exe /quiet