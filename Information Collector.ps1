$PC = hostname
$Username = $env:USERNAME

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsPath = [Environment]::GetFolderPath("mydocuments")

Get-ChildItem -Path $DesktopPath -Recurse | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
$desktopCount = (Get-ChildItem -Path $desktopPath -File -Recurse | Measure-Object).Count
$desktopSize = (Get-ChildItem -Path $desktopPath -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB

Get-ChildItem -Path $DocumentsPath -Recurse | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
$documentscount = (Get-ChildItem -Path $DocumentsPath -File -Recurse | Measure-Object).Count
$documentsSize =  (Get-ChildItem -Path $DocumentsPath -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB

$CsvFilePath = "C:\temp\Info.csv"

$UserInfo = [PSCustomObject]@{
    PC = $PC
    Username = $Username
    DesktopFilesCount = $DesktopCount
    DesktopSize_MB = "{0:n3}" -f $DesktopSize
    DocumentsfilesCount = $DocumentsCount
    DocumentsSize_MB = "{0:n3}" -f $DocumentsSize
}

$UserInfo | Export-Csv -Path $CsvFilePath -Append -NoTypeInformation

