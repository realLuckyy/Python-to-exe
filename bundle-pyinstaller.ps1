# PowerShell script to bundle PyInstaller and dependencies for offline installation
# This script downloads PyInstaller and all its dependencies as wheel files

param(
    [string]$OutputDir = "bundled",
    [string]$PythonVersion = "3.9"
)

Write-Host "🚀 PyInstaller Bundling Script" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan

# Create directory structure
$BundledDir = Join-Path $PSScriptRoot $OutputDir
$WheelsDir = Join-Path $BundledDir "wheels"
$PyInstallerDir = Join-Path $BundledDir "pyinstaller"

Write-Host "📁 Creating directory structure..." -ForegroundColor Yellow
if (Test-Path $BundledDir) {
    Write-Host "   Removing existing bundled directory..."
    Remove-Item $BundledDir -Recurse -Force
}

New-Item -ItemType Directory -Path $BundledDir -Force | Out-Null
New-Item -ItemType Directory -Path $WheelsDir -Force | Out-Null
New-Item -ItemType Directory -Path $PyInstallerDir -Force | Out-Null

Write-Host "✅ Directory structure created:" -ForegroundColor Green
Write-Host "   📂 $BundledDir"
Write-Host "   📂 $WheelsDir"
Write-Host "   📂 $PyInstallerDir"

# Check if Python is available
Write-Host "`n🐍 Checking Python availability..." -ForegroundColor Yellow
$PythonCommands = @("python", "py", "py -3")
$WorkingPython = $null

foreach ($cmd in $PythonCommands) {
    try {
        $version = & $cmd --version 2>$null
        if ($LASTEXITCODE -eq 0) {
            $WorkingPython = $cmd
            Write-Host "✅ Found Python: $cmd -> $version" -ForegroundColor Green
            break
        }
    }
    catch {
        # Continue to next command
    }
}

if (-not $WorkingPython) {
    Write-Host "❌ Python not found! Please install Python first." -ForegroundColor Red
    exit 1
}

# Upgrade pip and install wheel
Write-Host "`n📦 Preparing pip and wheel..." -ForegroundColor Yellow
try {
    & $WorkingPython -m pip install --upgrade pip wheel
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to upgrade pip and wheel"
    }
    Write-Host "✅ pip and wheel updated successfully" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to upgrade pip and wheel: $_" -ForegroundColor Red
    exit 1
}

# Download PyInstaller and all dependencies as wheels
Write-Host "`n⬇️ Downloading PyInstaller and dependencies..." -ForegroundColor Yellow
try {
    # Download PyInstaller and all its dependencies
    & $WorkingPython -m pip download pyinstaller --dest $WheelsDir --prefer-binary
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to download PyInstaller wheels"
    }
    
    # Also download some common dependencies that might be needed
    $CommonDeps = @("setuptools", "wheel", "pip")
    foreach ($dep in $CommonDeps) {
        & $WorkingPython -m pip download $dep --dest $WheelsDir --prefer-binary
    }
    
    Write-Host "✅ Downloaded PyInstaller and dependencies" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to download PyInstaller: $_" -ForegroundColor Red
    exit 1
}

# Create a virtual environment and install PyInstaller there for bundled executable
Write-Host "`n🔧 Creating bundled PyInstaller environment..." -ForegroundColor Yellow
try {
    # Create virtual environment
    & $WorkingPython -m venv $PyInstallerDir
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to create virtual environment"
    }
    
    # Determine the correct paths for the virtual environment
    $VenvPython = if ($IsWindows -or $env:OS -eq "Windows_NT") {
        Join-Path $PyInstallerDir "Scripts\python.exe"
    } else {
        Join-Path $PyInstallerDir "bin/python"
    }
    
    $VenvPip = if ($IsWindows -or $env:OS -eq "Windows_NT") {
        Join-Path $PyInstallerDir "Scripts\pip.exe"
    } else {
        Join-Path $PyInstallerDir "bin/pip"
    }
    
    # Install PyInstaller in the virtual environment from downloaded wheels
    & $VenvPip install --find-links $WheelsDir --no-index pyinstaller
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to install PyInstaller in virtual environment"
    }
    
    Write-Host "✅ Created bundled PyInstaller environment" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to create bundled environment: $_" -ForegroundColor Red
    exit 1
}

# Verify the installation
Write-Host "`n✅ Verifying bundled PyInstaller..." -ForegroundColor Yellow
$PyInstallerExe = if ($IsWindows -or $env:OS -eq "Windows_NT") {
    Join-Path $PyInstallerDir "Scripts\pyinstaller.exe"
} else {
    Join-Path $PyInstallerDir "bin/pyinstaller"
}

try {
    if (Test-Path $PyInstallerExe) {
        $version = & $PyInstallerExe --version
        Write-Host "✅ PyInstaller bundled successfully! Version: $version" -ForegroundColor Green
    } else {
        Write-Host "⚠️ PyInstaller executable not found at expected location" -ForegroundColor Yellow
    }
}
catch {
    Write-Host "⚠️ Could not verify PyInstaller version: $_" -ForegroundColor Yellow
}

# List downloaded files
Write-Host "`n📋 Summary:" -ForegroundColor Cyan
$WheelFiles = Get-ChildItem $WheelsDir -Filter "*.whl" | Measure-Object
Write-Host "   📦 Downloaded wheel files: $($WheelFiles.Count)" -ForegroundColor White
Write-Host "   📂 Wheels location: $WheelsDir" -ForegroundColor White
Write-Host "   🔧 PyInstaller environment: $PyInstallerDir" -ForegroundColor White

# Calculate total size
$TotalSize = (Get-ChildItem $BundledDir -Recurse | Measure-Object -Property Length -Sum).Sum
$SizeInMB = [math]::Round($TotalSize / 1MB, 2)
Write-Host "   📏 Total bundle size: $SizeInMB MB" -ForegroundColor White

Write-Host "`n🎉 PyInstaller bundling completed successfully!" -ForegroundColor Green
Write-Host "   The bundled files are ready to be included in your application distribution." -ForegroundColor White
Write-Host "   Users will no longer need internet access to use PyInstaller!" -ForegroundColor White

# Create a info file about the bundle
$PythonVersionOutput = & $WorkingPython --version 2>$null
$InfoContent = @"
PyInstaller Bundle Information
Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
PyInstaller Version: $version
Python Version Used: $PythonVersionOutput
Wheel Files: $($WheelFiles.Count)
Total Size: $SizeInMB MB

This bundle contains PyInstaller and all its dependencies for offline installation.
The PyConverter application will automatically use these bundled files when available.
"@

$InfoContent | Out-File -FilePath (Join-Path $BundledDir "bundle-info.txt") -Encoding UTF8
Write-Host "`nBundle information saved to bundle-info.txt" -ForegroundColor Cyan