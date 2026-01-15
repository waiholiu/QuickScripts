param(
    [Parameter(Mandatory=$true)]
    [string]$SearchTerm,
    
    [Parameter(Mandatory=$false)]
    [string]$Directory = "."
)

# Resolve to absolute path
$Directory = Resolve-Path $Directory -ErrorAction Stop

Write-Host "Searching for git remotes containing '$SearchTerm' in: $Directory" -ForegroundColor Cyan
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
        
        if ($remotes) {
            # Check if any remote matches the search term (case-insensitive contains)
            $matchingRemotes = $remotes | Where-Object { $_ -match [regex]::Escape($SearchTerm) }
            
            if ($matchingRemotes) {
                $foundCount++
                Write-Host "[$foundCount] $repoPath" -ForegroundColor Green
                $matchingRemotes | ForEach-Object {
                    Write-Host "    $_" -ForegroundColor Gray
                }
                Write-Host ""
            }
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
    Write-Host "No repositories found with remotes matching '$SearchTerm'" -ForegroundColor Yellow
} else {
    Write-Host "Found $foundCount repositor$(if($foundCount -eq 1){'y'}else{'ies'}) with matching remotes." -ForegroundColor Cyan
}
