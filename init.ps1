# Clear contents of CHANGELOG.md
Set-Content -Path "CHANGELOG.md" -Value ""

# Set contents of version.txt to "0.0.0"
Set-Content -Path "version.txt" -Value "0.0.0"

# Set contents of .release-please-manifest.json
$jsonContent = @"
{
  ".": "0.0.0"
}
"@
Set-Content -Path ".release-please-manifest.json" -Value $jsonContent

# Clear or create readme.md
if (Test-Path -Path "readme.md") {
    # Clear contents if file exists
    Set-Content -Path "readme.md" -Value ""
} else {
    # Create an empty file if it does not exist
    New-Item -Path "readme.md" -ItemType "file"
}

# Schedule the deletion of this script (init.ps1) after a short delay
Start-Sleep -Seconds 1
Remove-Item -Path "init.ps1" -Force
