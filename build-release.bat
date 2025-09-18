@echo off
echo Building Python to EXE Converter for Release...
echo ===============================================

REM Clean previous builds
echo Cleaning previous builds...
if exist "bin\Release" rmdir /s /q "bin\Release"
if exist "obj\Release" rmdir /s /q "obj\Release"
if exist "Release" rmdir /s /q "Release"

REM Build the application
echo Building application...
dotnet build --configuration Release --no-restore

if %errorlevel% neq 0 (
    echo Build failed!
    pause
    exit /b 1
)

REM Publish self-contained application
echo Publishing self-contained application...
dotnet publish --configuration Release --self-contained true --runtime win-x64 --output "Release\win-x64"

if %errorlevel% neq 0 (
    echo Publish failed!
    pause
    exit /b 1
)

REM Create PyInstaller bundle (if Python is available)
echo Creating PyInstaller bundle...
python create_pyinstaller_bundle.py
if %errorlevel% equ 0 (
    echo Copying bundled PyInstaller components...
    if exist "bundled" (
        xcopy /E /I "bundled" "Release\win-x64\bundled\"
        echo ? Bundled PyInstaller components added
    )
) else (
    echo Warning: Could not create PyInstaller bundle (Python may not be available)
    echo Application will use network installation as fallback
)

REM Copy additional files
echo Copying additional files...
copy "README.md" "Release\win-x64\"
copy "LICENSE" "Release\win-x64\"
copy "TROUBLESHOOTING.md" "Release\win-x64\"
copy "CHANGELOG.md" "Release\win-x64\"
copy "check_python_setup.bat" "Release\win-x64\"

REM Create release package
echo Creating release package...
cd Release
powershell Compress-Archive -Path "win-x64\*" -DestinationPath "PyConverter-v1.0.0-win-x64.zip" -Force
cd ..

echo.
echo ===============================================
echo Release build completed successfully!
echo.
echo Files created:
echo - Release\win-x64\ (Application folder)
echo - Release\PyConverter-v1.0.0-win-x64.zip (Distribution package)
echo.
if exist "Release\win-x64\bundled" (
    echo ? PyInstaller bundled for offline installation
) else (
    echo ? PyInstaller bundle not included - will use network installation
)
echo.
echo The ZIP file is ready for distribution!
echo ===============================================
pause