Write-Output "###Make sure you are running this script with administrative privileges###"
Write-Output "###Read this script from line number 32###"

function GetAutomaticServiceNotRunning ()
{
$AutomaticService = Get-Service | Where-Object {$_.StartType -eq "Automatic"}
Write-Output "The following Automatic Services have not started:"
foreach ($autoservice in $AutomaticService)
{
if ($autoservice.status -eq "Stopped" -or $autoservice.Status -eq "Starting")
{
Write-Host $autoservice.Name
}
}
}

function StartService ()
{
$getuserresponse = Read-Host "Do you want to start an automatic service which is not currently running? (y/n)"
if ($getuserresponse -eq "y")
{
$servicename = Read-Host "Type the name of the service given in the bracket to start the service"
Set-Service -Name $servicename -Status Running
}
else
{
break
}
}

#This function gets windows service whose startup type is Automatic but they are not running#
GetAutomaticServiceNotRunning

#This function starts those services#
StartService
