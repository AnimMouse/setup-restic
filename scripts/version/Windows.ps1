$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if ($env:version -eq 'latest') {
  $latest_version = (gh api repos/restic/restic/releases/latest -q .tag_name)
  $trimmed_version = $latest_version.Trim('v')
  Add-Content $env:GITHUB_OUTPUT version=$trimmed_version
}
else {
  Add-Content $env:GITHUB_OUTPUT version=$env:version
}