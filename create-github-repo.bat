@echo off
echo ===============================================
echo  PyConverter - GitHub Repository Setup
echo ===============================================
echo.
echo This script will help you create your PyConverter repository on GitHub.
echo Make sure you're logged into GitHub and have Git installed.
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ? Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo ? Git is installed
echo.

REM Check if GitHub CLI is available
gh --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ? GitHub CLI detected - we can create the repo automatically!
    echo.
    
    set /p CREATE_REPO="Do you want to create the GitHub repository now? (y/n): "
    if /i "%CREATE_REPO%"=="y" (
        echo.
        echo Creating GitHub repository...
        gh repo create PyConverter --public --source=. --remote=origin --push --description="A powerful Windows GUI application for converting Python scripts to standalone executables using PyInstaller"
        
        if %ERRORLEVEL% EQU 0 (
            echo.
            echo ===============================================
            echo  ?? SUCCESS! Repository created on GitHub!
            echo ===============================================
            echo.
            echo ?? Your repository: https://github.com/%USERNAME%/PyConverter
            echo.
            echo ? All files have been pushed to GitHub
            echo ? Repository is ready for use
            echo.
        ) else (
            echo ? Failed to create repository with GitHub CLI
            echo Please try the manual method below
        )
    )
) else (
    echo ?? GitHub CLI not detected
    echo.
    echo MANUAL SETUP INSTRUCTIONS:
    echo ===============================================
    echo.
    echo 1. Go to https://github.com/new
    echo 2. Repository name: PyConverter  
    echo 3. Description: A powerful Windows GUI application for converting Python scripts to standalone executables using PyInstaller
    echo 4. Choose Public or Private
    echo 5. DO NOT initialize with README (we have existing files)
    echo 6. Click "Create repository"
    echo.
    echo 7. Then run these commands in this directory:
    echo.
    echo    git init
    echo    git add .
    echo    git commit -m "Initial commit: PyConverter v1.0 - Python to EXE Converter"
    echo    git branch -M main  
    echo    git remote add origin https://github.com/YOUR_USERNAME/PyConverter.git
    echo    git push -u origin main
    echo.
    echo Replace YOUR_USERNAME with your actual GitHub username
    echo.
)

echo.
echo ?? Files ready for repository:
echo    - Source code (PyConverter application)
echo    - README.md with full documentation  
echo    - Build scripts (standalone executable creation)
echo    - GitHub Actions workflow for CI/CD
echo    - Issue templates and contributing guidelines
echo    - Security policy and documentation
echo.

set /p OPEN_GITHUB="Open GitHub in browser? (y/n): "
if /i "%OPEN_GITHUB%"=="y" (
    start https://github.com/new
)

echo.
echo Repository setup complete!
pause