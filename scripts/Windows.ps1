$ErrorActionPreference = 'Stop'
$version = (Invoke-RestMethod $env:GITHUB_API_URL/repos/restic/restic/releases/latest).tag_name
Write-Host ::group::Downloading Restic $version for Windows
$trimmed_version = $version.Trim('v')
aria2c -x 16 $env:GITHUB_SERVER_URL/restic/restic/releases/download/$version/restic_${trimmed_version}_windows_amd64.zip
7z e restic_${trimmed_version}_windows_amd64.zip restic_${trimmed_version}_windows_amd64.exe -oRestic -r
Rename-Item Restic/restic_${trimmed_version}_windows_amd64.exe restic.exe
Remove-Item restic_${trimmed_version}_windows_amd64.zip
Write-Host ::endgroup::