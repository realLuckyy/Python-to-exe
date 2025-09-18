@echo off
echo ===============================================
echo  ?? PyConverter - Repository Setup Complete!
echo ===============================================
echo.
echo GitHub Repository: https://github.com/realLuckyy/Python-to-exe
echo.

echo ?? Repository Status:
echo ===============================================

REM Check if we have the standalone build
if exist "dist-standalone\PyConverter.exe" (
    echo ? Standalone executable ready for release
    for %%I in ("dist-standalone\PyConverter.exe") do echo    Size: %%~zI bytes
) else (
    echo ?? Standalone executable not built yet
    echo    Run: build-standalone.bat
)

REM Check Git status
git status --porcelain >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f %%i in ('git status --porcelain ^| find /c /v ""') do (
        if %%i GTR 0 (
            echo ?? Uncommitted changes: %%i files
            echo    Run: push-to-github.bat
        ) else (
            echo ? All changes committed and pushed
        )
    )
) else (
    echo ?? Not a Git repository or Git not available
)

echo.
echo ?? Available Actions:
echo ===============================================
echo 1. push-to-github.bat    - Push your code to GitHub
echo 2. build-standalone.bat  - Build standalone executable
echo 3. create-release.bat    - Create GitHub release with download
echo 4. repo-check.bat        - Verify repository readiness
echo.
echo ?? Repository Features:
echo ===============================================
echo ? Professional README with badges and documentation
echo ? GitHub Actions workflow for automatic builds
echo ? Issue templates for bugs and feature requests
echo ? Contributing guidelines and security policy
echo ? Build scripts for different platforms
echo ? Standalone executable creation (no .NET required)
echo ? Complete source code and project files
echo.

echo ?? Important Links:
echo ===============================================
echo Repository:  https://github.com/realLuckyy/Python-to-exe
echo Issues:      https://github.com/realLuckyy/Python-to-exe/issues
echo Releases:    https://github.com/realLuckyy/Python-to-exe/releases
echo Actions:     https://github.com/realLuckyy/Python-to-exe/actions
echo Support:     https://ko-fi.com/root
echo.

echo ?? Next Steps:
echo ===============================================
echo 1. Push your code: push-to-github.bat
echo 2. Create first release: create-release.bat  
echo 3. Share with the community!
echo 4. Monitor issues and contributions
echo.

set /p OPEN_REPO="Open your GitHub repository? (y/n): "
if /i "%OPEN_REPO%"=="y" (
    start https://github.com/realLuckyy/Python-to-exe
)

echo.
echo Your PyConverter project is ready for the world! ??
pause