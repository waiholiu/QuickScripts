param(
    [Parameter(Mandatory=$false)]
    [string]$Directory = "."
)

# Resolve to absolute path
$Directory = Resolve-Path $Directory -ErrorAction Stop

Write-Host "Searching for git repositories with no remotes in: $Directory" -ForegroundColor Cyan
Write-Host ""

# Find all .git directories
$gitDirs = Get-ChildItem -Path $Directory -Directory -Recurse -Filter ".git" -Force -ErrorAction SilentlyContinue

if ($gitDirs.Count -eq 0) {
    Write-Host "No git repositories found." -ForegroundColor Yellow
    exit
}

$foundCount = 0

foreach ($gitDir in $gitDirs) {
    $repoPath = $gitDir.Parent.FullName
    
    # Get remotes for this repository
    Push-Location $repoPath
    try {
        $remotes = git remote -v 2>$null
        
        # Check if there are no remotes
        if (-not $remotes) {
            $foundCount++
            Write-Host "[$foundCount] $repoPath" -ForegroundColor Yellow
            Write-Host "    (no remotes configured)" -ForegroundColor Gray
            Write-Host ""
        }
    }
    catch {
        # Skip if there's an error reading the repository
    }
    finally {
        Pop-Location
    }
}

if ($foundCount -eq 0) {
    Write-Host "All repositories have remotes configured." -ForegroundColor Green
} else {
    Write-Host "Found $foundCount repositor$(if($foundCount -eq 1){'y'}else{'ies'}) with no remotes." -ForegroundColor Cyan
}
