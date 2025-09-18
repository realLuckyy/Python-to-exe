@echo off
echo ===============================================
echo  Building Standalone PyConverter Executable
echo ===============================================
echo.

echo Cleaning previous builds...
if exist "bin\Release\net8.0-windows\win-x64\publish" (
    rmdir /s /q "bin\Release\net8.0-windows\win-x64\publish"
)

echo.
echo Building self-contained executable...
echo This will create an EXE that works on ANY Windows computer!
echo.

cd PyConverter

dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===============================================
    echo  ? BUILD SUCCESSFUL!
    echo ===============================================
    echo.
    echo Your standalone executable is ready:
    echo ?? Location: PyConverter\bin\Release\net8.0-windows\win-x64\publish\PyConverter.exe
    echo.
    echo ? This EXE file:
    echo    - Works on ANY Windows computer
    echo    - No .NET installation required
    echo    - No runtime dependencies
    echo    - Single file (~70MB)
    echo.
    
    if exist "bin\Release\net8.0-windows\win-x64\publish\PyConverter.exe" (
        echo Opening output folder...
        explorer "bin\Release\net8.0-windows\win-x64\publish"
    )
) else (
    echo.
    echo ===============================================
    echo  ? BUILD FAILED!
    echo ===============================================
    echo Check the error messages above.
)

cd ..
echo.
pause