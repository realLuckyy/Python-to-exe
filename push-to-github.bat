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

REM Add the remote if it doesn't exist
git remote get-url origin >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Adding remote origin...
    git remote add origin https://github.com/realLuckyy/Python-to-exe.git
    echo.
)

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
    echo Make sure you're logged into GitHub and have push access.
    echo.
)

echo.
pause