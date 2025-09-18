@echo off
echo ===============================================
echo  PyConverter - Create GitHub Release
echo ===============================================
echo.

REM Check if standalone build exists
if not exist "dist-standalone\PyConverter.exe" (
    echo ? Standalone executable not found!
    echo Please run 'build-standalone.bat' first to create the executable.
    echo.
    pause
    exit /b 1
)

echo ? Found standalone executable
for %%I in ("dist-standalone\PyConverter.exe") do echo Size: %%~zI bytes (~76MB)
echo.

REM Get version info
set /p VERSION="Enter version number (e.g., v1.0.0): "
if "%VERSION%"=="" set VERSION=v1.0.0

set /p RELEASE_NOTES="Enter release notes (or press Enter for default): "
if "%RELEASE_NOTES%"=="" set RELEASE_NOTES=?? PyConverter v1.0 - Initial release of the Python to EXE converter with GUI interface

echo.
echo Creating release package...

REM Create release directory
if exist "release" rmdir /s /q "release"
mkdir "release"

REM Copy standalone executable
copy "dist-standalone\PyConverter.exe" "release\PyConverter.exe"

REM Create README for release
echo # PyConverter %VERSION% > "release\README.txt"
echo. >> "release\README.txt"
echo Python to EXE Converter - Standalone Edition >> "release\README.txt"
echo. >> "release\README.txt"
echo This is a standalone executable that requires no installation. >> "release\README.txt"
echo Simply run PyConverter.exe to start converting Python files to EXE! >> "release\README.txt"
echo. >> "release\README.txt"
echo Features: >> "release\README.txt"
echo - One-click Python to EXE conversion >> "release\README.txt"
echo - Drag and drop support >> "release\README.txt"
echo - No Python installation required on target machines >> "release\README.txt"
echo - Professional GUI interface >> "release\README.txt"
echo. >> "release\README.txt"
echo Repository: https://github.com/realLuckyy/Python-to-exe >> "release\README.txt"
echo Support: https://ko-fi.com/root >> "release\README.txt"

REM Create ZIP archive
powershell -Command "Compress-Archive -Path 'release\*' -DestinationPath 'PyConverter-%VERSION%-Standalone.zip' -Force"

echo.
echo ? Release package created: PyConverter-%VERSION%-Standalone.zip
echo.

REM Check if GitHub CLI is available
gh --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo GitHub CLI detected. Creating release...
    
    gh release create "%VERSION%" "PyConverter-%VERSION%-Standalone.zip" ^
        --title "PyConverter %VERSION%" ^
        --notes "%RELEASE_NOTES%" ^
        --repo realLuckyy/Python-to-exe
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ?? GitHub release created successfully!
        echo ?? https://github.com/realLuckyy/Python-to-exe/releases/tag/%VERSION%
        
        set /p OPEN_RELEASE="Open release page? (y/n): "
        if /i "%OPEN_RELEASE%"=="y" (
            start https://github.com/realLuckyy/Python-to-exe/releases/tag/%VERSION%
        )
    ) else (
        echo ? Failed to create GitHub release
        echo Please create it manually at: https://github.com/realLuckyy/Python-to-exe/releases/new
    )
) else (
    echo.
    echo ?? GitHub CLI not found
    echo.
    echo Manual release instructions:
    echo 1. Go to: https://github.com/realLuckyy/Python-to-exe/releases/new
    echo 2. Tag: %VERSION%
    echo 3. Title: PyConverter %VERSION%
    echo 4. Upload: PyConverter-%VERSION%-Standalone.zip
    echo 5. Description: %RELEASE_NOTES%
    echo.
    
    set /p OPEN_RELEASES="Open releases page? (y/n): "
    if /i "%OPEN_RELEASES%"=="y" (
        start https://github.com/realLuckyy/Python-to-exe/releases/new
    )
)

echo.
echo Release package ready: PyConverter-%VERSION%-Standalone.zip
pause