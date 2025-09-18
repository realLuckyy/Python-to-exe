@echo off
REM Batch script to bundle PyInstaller and dependencies for offline installation
echo.
echo =====================================
echo PyInstaller Bundling Script
echo =====================================
echo.

REM Create directory structure
set BUNDLED_DIR=%~dp0bundled
set WHEELS_DIR=%BUNDLED_DIR%\wheels
set PYINSTALLER_DIR=%BUNDLED_DIR%\pyinstaller

echo Creating directory structure...
if exist "%BUNDLED_DIR%" (
    echo   Removing existing bundled directory...
    rmdir /s /q "%BUNDLED_DIR%"
)

mkdir "%BUNDLED_DIR%" 2>nul
mkdir "%WHEELS_DIR%" 2>nul
mkdir "%PYINSTALLER_DIR%" 2>nul

echo   Directory structure created:
echo   - %BUNDLED_DIR%
echo   - %WHEELS_DIR%
echo   - %PYINSTALLER_DIR%
echo.

REM Check if Python is available
echo Checking Python availability...
set WORKING_PYTHON=
python --version >nul 2>&1
if %errorlevel%==0 (
    set WORKING_PYTHON=python
    echo   Found Python: python
    python --version
    goto :python_found
)

py --version >nul 2>&1
if %errorlevel%==0 (
    set WORKING_PYTHON=py
    echo   Found Python: py
    py --version
    goto :python_found
)

py -3 --version >nul 2>&1
if %errorlevel%==0 (
    set WORKING_PYTHON=py -3
    echo   Found Python: py -3
    py -3 --version
    goto :python_found
)

echo   ERROR: Python not found! Please install Python first.
pause
exit /b 1

:python_found
echo.

REM Upgrade pip and install wheel
echo Preparing pip and wheel...
%WORKING_PYTHON% -m pip install --upgrade pip wheel
if %errorlevel% neq 0 (
    echo   ERROR: Failed to upgrade pip and wheel
    pause
    exit /b 1
)
echo   pip and wheel updated successfully
echo.

REM Download PyInstaller and all dependencies as wheels
echo Downloading PyInstaller and dependencies...
%WORKING_PYTHON% -m pip download pyinstaller --dest "%WHEELS_DIR%" --prefer-binary
if %errorlevel% neq 0 (
    echo   ERROR: Failed to download PyInstaller wheels
    pause
    exit /b 1
)

REM Download common dependencies
%WORKING_PYTHON% -m pip download setuptools wheel pip --dest "%WHEELS_DIR%" --prefer-binary

echo   Downloaded PyInstaller and dependencies
echo.

REM Create a virtual environment and install PyInstaller there for bundled executable
echo Creating bundled PyInstaller environment...
%WORKING_PYTHON% -m venv "%PYINSTALLER_DIR%"
if %errorlevel% neq 0 (
    echo   ERROR: Failed to create virtual environment
    pause
    exit /b 1
)

REM Install PyInstaller in the virtual environment from downloaded wheels
"%PYINSTALLER_DIR%\Scripts\pip.exe" install --find-links "%WHEELS_DIR%" --no-index pyinstaller
if %errorlevel% neq 0 (
    echo   ERROR: Failed to install PyInstaller in virtual environment
    pause
    exit /b 1
)

echo   Created bundled PyInstaller environment
echo.

REM Verify the installation
echo Verifying bundled PyInstaller...
set PYINSTALLER_EXE=%PYINSTALLER_DIR%\Scripts\pyinstaller.exe
if exist "%PYINSTALLER_EXE%" (
    "%PYINSTALLER_EXE%" --version
    echo   PyInstaller bundled successfully!
) else (
    echo   WARNING: PyInstaller executable not found at expected location
)
echo.

REM Calculate and display summary
echo Summary:
for /f %%i in ('dir /b "%WHEELS_DIR%\*.whl" ^| find /c /v ""') do set WHEEL_COUNT=%%i
echo   Downloaded wheel files: %WHEEL_COUNT%
echo   Wheels location: %WHEELS_DIR%
echo   PyInstaller environment: %PYINSTALLER_DIR%

REM Create info file
echo Creating bundle information file...
(
    echo PyInstaller Bundle Information
    echo Generated: %date% %time%
    echo Wheel Files: %WHEEL_COUNT%
    echo.
    echo This bundle contains PyInstaller and all its dependencies for offline installation.
    echo The PyConverter application will automatically use these bundled files when available.
) > "%BUNDLED_DIR%\bundle-info.txt"

echo.
echo =====================================
echo PyInstaller bundling completed successfully!
echo The bundled files are ready to be included in your application distribution.
echo Users will no longer need internet access to use PyInstaller!
echo =====================================
echo.
pause