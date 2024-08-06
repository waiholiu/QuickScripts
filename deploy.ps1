# Ensure the bin directory exists
if (-not (Test-Path -Path "./bin")) {
    New-Item -ItemType Directory -Path "./bin"
}

# Copy all .bat files to the bin directory
Copy-Item -Path "*.bat" -Destination "./bin"

Write-Output "All .bat files have been copied to the bin directory."
Read-Host "Press Enter to exit"