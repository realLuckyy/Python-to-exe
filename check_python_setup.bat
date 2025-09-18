@echo off
echo Python/PyInstaller Environment Checker
echo =====================================
echo.

echo Checking Python installations...
echo.

echo Testing 'python' command:
python --version 2>nul
if %errorlevel% equ 0 (
    echo   ? python command works
    echo   Testing PyInstaller with python:
    python -m pip show pyinstaller >nul 2>&1
    if %errorlevel% equ 0 (
        echo   ? PyInstaller is installed for python
        python -m pyinstaller --version
    ) else (
        echo   ? PyInstaller NOT installed for python
        echo   Installing PyInstaller...
        python -m pip install pyinstaller
    )
) else (
    echo   ? python command not found
)
echo.

echo Testing 'py' command:
py --version 2>nul
if %errorlevel% equ 0 (
    echo   ? py command works
    echo   Testing PyInstaller with py:
    py -m pip show pyinstaller >nul 2>&1
    if %errorlevel% equ 0 (
        echo   ? PyInstaller is installed for py
        py -m pyinstaller --version
    ) else (
        echo   ? PyInstaller NOT installed for py
        echo   Installing PyInstaller...
        py -m pip install pyinstaller
    )
) else (
    echo   ? py command not found
)
echo.

echo Testing 'py -3' command:
py -3 --version 2>nul
if %errorlevel% equ 0 (
    echo   ? py -3 command works
    echo   Testing PyInstaller with py -3:
    py -3 -m pip show pyinstaller >nul 2>&1
    if %errorlevel% equ 0 (
        echo   ? PyInstaller is installed for py -3
        py -3 -m pyinstaller --version
    ) else (
        echo   ? PyInstaller NOT installed for py -3
        echo   Installing PyInstaller...
        py -3 -m pip install pyinstaller
    )
) else (
    echo   ? py -3 command not found
)
echo.

echo Testing direct 'pyinstaller' command:
pyinstaller --version 2>nul
if %errorlevel% equ 0 (
    echo   ? Direct pyinstaller command works
) else (
    echo   ? Direct pyinstaller command not found
)
echo.

echo =====================================
echo Test completed!
echo.
echo If no Python commands worked, you need to:
echo 1. Install Python from https://python.org
echo 2. Make sure to check "Add Python to PATH" during installation
echo 3. Restart your computer after installation
echo.
echo If Python works but PyInstaller doesn't install:
echo 1. Try running this script as Administrator
echo 2. Check your internet connection
echo 3. Try: py -m pip install --upgrade pip
echo.
pause