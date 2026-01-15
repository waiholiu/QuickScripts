# Ensure the bin directory exists
if (-not (Test-Path -Path "./bin")) {
    New-Item -ItemType Directory -Path "./bin"
}

# Copy all .bat files to the bin directory
Copy-Item -Path "*.bat" -Destination "./bin"

# Copy all .ps1 files except deploy.ps1 to the bin directory
Get-ChildItem -Path "*.ps1" | Where-Object { $_.Name -ne "deploy.ps1" } | Copy-Item -Destination "./bin"

Write-Output "All .bat and .ps1 files (except deploy.ps1) have been copied to the bin directory."
Read-Host "Press Enter to exit"