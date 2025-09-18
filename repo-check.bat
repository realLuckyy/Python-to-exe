@echo off
echo ===============================================
echo  PyConverter - Repository Readiness Check
echo ===============================================
echo.

echo Checking repository files...
echo.

REM Check essential files
if exist "README.md" (
    echo ? README.md - Found
) else (
    echo ? README.md - Missing
)

if exist ".gitignore" (
    echo ? .gitignore - Found
) else (
    echo ? .gitignore - Missing  
)

if exist "PyConverter\PyConverter.csproj" (
    echo ? Main project file - Found
) else (
    echo ? Main project file - Missing
)

if exist "PyConverter\Form1.cs" (
    echo ? Main source code - Found
) else (
    echo ? Main source code - Missing
)

if exist "build-standalone.bat" (
    echo ? Build scripts - Found
) else (
    echo ? Build scripts - Missing
)

if exist ".github\workflows\build.yml" (
    echo ? GitHub Actions - Found
) else (
    echo ? GitHub Actions - Missing
)

echo.
echo Checking build output...

if exist "dist-standalone\PyConverter.exe" (
    echo ? Standalone executable - Found
    for %%I in ("dist-standalone\PyConverter.exe") do echo    Size: %%~zI bytes
) else (
    echo ?? Standalone executable - Not built yet
    echo    Run 'build-standalone.bat' to create it
)

echo.
echo Repository Statistics:
echo ===============================================

REM Count files
for /f %%i in ('dir /s /b *.cs ^| find /c /v ""') do echo C# Source Files: %%i
for /f %%i in ('dir /s /b *.md ^| find /c /v ""') do echo Documentation Files: %%i
for /f %%i in ('dir /s /b *.bat ^| find /c /v ""') do echo Build Scripts: %%i

echo.
echo Your repository is ready for GitHub! ??
echo.
echo Next steps:
echo 1. Run 'create-github-repo.bat' to setup GitHub repository
echo 2. Or manually create repository at https://github.com/new
echo 3. Push your code and share with the world!
echo.

pause