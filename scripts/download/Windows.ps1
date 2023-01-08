$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading Restic $env:version for Windows
aria2c -x 16 $env:GITHUB_SERVER_URL/restic/restic/releases/download/v$env:version/restic_${env:version}_windows_amd64.zip
7z e restic_${env:version}_windows_amd64.zip restic_${env:version}_windows_amd64.exe -oRestic -r
Rename-Item Restic/restic_${env:version}_windows_amd64.exe restic.exe
Remove-Item restic_${env:version}_windows_amd64.zip
Write-Host ::endgroup::