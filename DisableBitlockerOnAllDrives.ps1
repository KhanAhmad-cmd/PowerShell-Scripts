$mp = (Get-BitLockerVolume).MountPoint
foreach($point in $mp)
{
Disable-BitLocker -MountPoint $point
}
