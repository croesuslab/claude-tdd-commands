#
# Claude TDD Commands Installer for Windows
# Usage: irm https://raw.githubusercontent.com/mxdumas/claude-tdd-commands/master/install.ps1 | iex
#

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/mxdumas/claude-tdd-commands"
$Branch = "master"
$TargetDir = ".claude\commands\tdd"

Write-Host "Installing Claude TDD Commands..." -ForegroundColor Cyan

# Check if we're in a project directory
$isProject = (Test-Path ".git") -or (Test-Path "package.json") -or (Test-Path "*.csproj") -or (Test-Path "pyproject.toml")
if (-not $isProject) {
    $response = Read-Host "Warning: This doesn't look like a project root. Continue anyway? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Aborted." -ForegroundColor Yellow
        exit 1
    }
}

# Create target directories
New-Item -ItemType Directory -Force -Path "$TargetDir\init" | Out-Null
New-Item -ItemType Directory -Force -Path "$TargetDir\flow" | Out-Null

$BaseUrl = "https://raw.githubusercontent.com/mxdumas/claude-tdd-commands/$Branch/commands/tdd"

# Download function
function Download-File {
    param($Url, $Output)
    try {
        Invoke-WebRequest -Uri $Url -OutFile $Output -UseBasicParsing
        Write-Host "  Downloaded: $Output" -ForegroundColor Gray
    } catch {
        Write-Host "  Failed: $Output" -ForegroundColor Red
        throw
    }
}

Write-Host "Downloading init commands..."
Download-File "$BaseUrl/init/1-project.md" "$TargetDir\init\1-project.md"
Download-File "$BaseUrl/init/2-architecture.md" "$TargetDir\init\2-architecture.md"
Download-File "$BaseUrl/init/3-standards.md" "$TargetDir\init\3-standards.md"
Download-File "$BaseUrl/init/4-readme.md" "$TargetDir\init\4-readme.md"

Write-Host "Downloading flow commands..."
Download-File "$BaseUrl/flow/status.md" "$TargetDir\flow\status.md"
Download-File "$BaseUrl/flow/next.md" "$TargetDir\flow\next.md"
Download-File "$BaseUrl/flow/1-analyze.md" "$TargetDir\flow\1-analyze.md"
Download-File "$BaseUrl/flow/2-test.md" "$TargetDir\flow\2-test.md"
Download-File "$BaseUrl/flow/3-dev.md" "$TargetDir\flow\3-dev.md"
Download-File "$BaseUrl/flow/4-review.md" "$TargetDir\flow\4-review.md"
Download-File "$BaseUrl/flow/5-docs.md" "$TargetDir\flow\5-docs.md"
Download-File "$BaseUrl/flow/6-done.md" "$TargetDir\flow\6-done.md"

Write-Host "Downloading README..."
Download-File "$BaseUrl/README.md" "$TargetDir\README.md"

Write-Host ""
Write-Host "Done! TDD commands installed to $TargetDir" -ForegroundColor Green
Write-Host ""
Write-Host "Available commands:" -ForegroundColor Cyan
Write-Host "  /tdd:init:1-project      - Initialize project with epics"
Write-Host "  /tdd:init:2-architecture - Define architecture"
Write-Host "  /tdd:init:3-standards    - Define code standards"
Write-Host "  /tdd:init:4-readme       - Generate README"
Write-Host ""
Write-Host "  /tdd:flow:status         - Show current status"
Write-Host "  /tdd:flow:next           - Run next step"
Write-Host "  /tdd:flow:1-analyze      - Analyze task"
Write-Host "  /tdd:flow:2-test         - Write tests (RED)"
Write-Host "  /tdd:flow:3-dev          - Implement (GREEN)"
Write-Host "  /tdd:flow:4-review       - Review"
Write-Host "  /tdd:flow:5-docs         - Document"
Write-Host "  /tdd:flow:6-done         - Commit"
Write-Host ""
Write-Host "Get started with: /tdd:init:1-project" -ForegroundColor Yellow
