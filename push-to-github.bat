@echo off
echo ===============================================
echo  Pushing PyConverter to GitHub Repository
echo ===============================================
echo.
echo Repository: https://github.com/realLuckyy/Python-to-exe
echo.

REM Check if we're in a git repository
if not exist ".git" (
    echo Initializing Git repository...
    git init
    echo.
)

REM Remove any existing origin (in case it has the wrong URL)
git remote remove origin >nul 2>&1

REM Add the correct remote
echo Setting remote origin...
git remote add origin https://github.com/realLuckyy/Python-to-exe.git
echo.

echo Staging all files...
git add .

echo.
echo Current status:
git status --short

echo.
set /p COMMIT_MSG="Enter commit message (or press Enter for default): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Initial commit: PyConverter v1.0 - Python to EXE Converter with GUI

echo.
echo Committing changes...
git commit -m "%COMMIT_MSG%"

echo.
echo Setting main branch...
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===============================================
    echo  ?? SUCCESS! Code pushed to GitHub!
    echo ===============================================
    echo.
    echo ?? Repository: https://github.com/realLuckyy/Python-to-exe
    echo ?? View files: https://github.com/realLuckyy/Python-to-exe/tree/main
    echo ?? Issues: https://github.com/realLuckyy/Python-to-exe/issues
    echo ?? Actions: https://github.com/realLuckyy/Python-to-exe/actions
    echo.
    
    set /p OPEN_REPO="Open repository in browser? (y/n): "
    if /i "%OPEN_REPO%"=="y" (
        start https://github.com/realLuckyy/Python-to-exe
    )
) else (
    echo.
    echo ? Push failed. Check the error messages above.
    echo.
    echo Common solutions:
    echo 1. Make sure you're logged into GitHub (git config --global user.name "YourName")
    echo 2. Check if you have push access to the repository
    echo 3. Try: git remote -v (to verify the remote URL)
    echo.
    echo If you need to authenticate:
    echo - For HTTPS: git config --global credential.helper store
    echo - Or use GitHub CLI: gh auth login
    echo.
)

echo.
pause