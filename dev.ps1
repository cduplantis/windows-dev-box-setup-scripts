# Description: Boxstarter Script
# Author: Microsoft
# Common settings for web dev

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

# Set Chocolatey Tools Location
if (-not (Test-Path env:ChocolateyToolsLocation)) { $env:ChocolateyToolsLocation = "$env:ProgramData\chocolatey-tools" }

#--- Setting up Windows ---
executeScript "RemoveDefaultApps.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "HyperV.ps1";
executeScript "CommonDevTools.ps1";
executeScript "Docker.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";
executeScript "CommonTools.ps1";

Enable-UAC
Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula