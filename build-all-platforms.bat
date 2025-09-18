@echo off
echo ===============================================
echo  Building PyConverter for Multiple Platforms
echo ===============================================
echo.

cd PyConverter

echo Building for 64-bit Windows...
dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -o "..\dist\win-x64"

echo.
echo Building for 32-bit Windows...
dotnet publish -c Release -r win-x86 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -o "..\dist\win-x86"

cd ..

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===============================================
    echo  ? ALL BUILDS SUCCESSFUL!
    echo ===============================================
    echo.
    echo Your standalone executables are ready:
    echo ?? 64-bit: dist\win-x64\PyConverter.exe
    echo ?? 32-bit: dist\win-x86\PyConverter.exe
    echo.
    echo ? These EXE files:
    echo    - Work on ANY Windows computer
    echo    - No .NET installation required
    echo    - No runtime dependencies
    echo    - Single file distribution
    echo.
    
    if exist "dist\win-x64\PyConverter.exe" (
        echo Opening output folder...
        explorer "dist"
    )
) else (
    echo.
    echo ? BUILD FAILED! Check error messages above.
)

echo.
pause