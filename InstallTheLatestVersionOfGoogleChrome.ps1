# This is the download URL for the latest version of Google Chrome Enterprise
$chromeDownloadUrl = "https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise64.msi"

# The script will download Google Chrome in C:\Users\username\AppData\Local\Temp
$installerPath = "$env:TEMP\ChromeEnterpriseInstaller.msi"

# Download the installer
Invoke-WebRequest -Uri $chromeDownloadUrl -OutFile $installerPath

# Install Google Chrome Enterprise
Start-Process -FilePath msiexec -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

# Clean up: Remove the downloaded installer
Remove-Item $installerPath -Force
