@echo off
echo ===============================================
echo  Cleaning Up Repository - Removing Unnecessary Files
echo ===============================================
echo.

echo The following files will be removed:
echo ===============================================
echo Setup and utility scripts (no longer needed):
echo   - setup-github-repo.bat
echo   - create-github-repo.bat  
echo   - repo-check.bat
echo   - setup-git-auth.bat
echo   - final-setup.bat
echo.
echo Development/internal files:
echo   - DEVELOPER-BUNDLED-PYINSTALLER.md
echo   - RELEASE_STATUS.md
echo   - REPOSITORY_STRUCTURE.md
echo   - bundle-pyinstaller.bat
echo   - bundle-pyinstaller.ps1
echo   - create_pyinstaller_bundle.py
echo.
echo Bundled directory (if empty or unnecessary):
echo   - bundled\ (folder)
echo.

set /p CONFIRM="Do you want to proceed with cleanup? (y/n): "
if /i not "%CONFIRM%"=="y" (
    echo Cleanup cancelled.
    pause
    exit /b 0
)

echo.
echo Removing unnecessary files...

REM Remove setup scripts
if exist "setup-github-repo.bat" (
    del "setup-github-repo.bat"
    echo ? Removed setup-github-repo.bat
)

if exist "create-github-repo.bat" (
    del "create-github-repo.bat"
    echo ? Removed create-github-repo.bat
)

if exist "repo-check.bat" (
    del "repo-check.bat"
    echo ? Removed repo-check.bat
)

if exist "setup-git-auth.bat" (
    del "setup-git-auth.bat"
    echo ? Removed setup-git-auth.bat
)

if exist "final-setup.bat" (
    del "final-setup.bat"
    echo ? Removed final-setup.bat
)

REM Remove developer documentation
if exist "DEVELOPER-BUNDLED-PYINSTALLER.md" (
    del "DEVELOPER-BUNDLED-PYINSTALLER.md"
    echo ? Removed DEVELOPER-BUNDLED-PYINSTALLER.md
)

if exist "RELEASE_STATUS.md" (
    del "RELEASE_STATUS.md"
    echo ? Removed RELEASE_STATUS.md
)

if exist "REPOSITORY_STRUCTURE.md" (
    del "REPOSITORY_STRUCTURE.md"
    echo ? Removed REPOSITORY_STRUCTURE.md
)

REM Remove bundling scripts
if exist "bundle-pyinstaller.bat" (
    del "bundle-pyinstaller.bat"
    echo ? Removed bundle-pyinstaller.bat
)

if exist "bundle-pyinstaller.ps1" (
    del "bundle-pyinstaller.ps1"
    echo ? Removed bundle-pyinstaller.ps1
)

if exist "create_pyinstaller_bundle.py" (
    del "create_pyinstaller_bundle.py"
    echo ? Removed create_pyinstaller_bundle.py
)

REM Check if bundled directory exists and is empty
if exist "bundled" (
    dir /b "bundled" | findstr "." >nul
    if %ERRORLEVEL% NEQ 0 (
        rmdir "bundled"
        echo ? Removed empty bundled directory
    ) else (
        echo ?? Bundled directory contains files - kept for now
    )
)

echo.
echo ===============================================
echo  ?? Cleanup Complete!
echo ===============================================
echo.
echo Files remaining (clean repository):
echo ? Source code (PyConverter folder)
echo ? Build scripts (build-*.bat)
echo ? Documentation (README.md, CONTRIBUTING.md, etc.)
echo ? GitHub configuration (.github folder)
echo ? Release scripts (create-release.bat, push-to-github.bat)
echo ? Standalone executable (dist-standalone folder)
echo ? Screenshots folder
echo.

echo Next steps:
echo 1. Review the changes
echo 2. Run: git add .
echo 3. Run: git commit -m "Clean up repository - remove unnecessary files"
echo 4. Run: git push
echo.

set /p COMMIT_CHANGES="Commit and push these changes now? (y/n): "
if /i "%COMMIT_CHANGES%"=="y" (
    echo.
    echo Committing changes...
    git add .
    git commit -m "Clean up repository - remove unnecessary setup and development files"
    
    echo Pushing to GitHub...
    git push
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ? Repository cleaned and updated on GitHub!
        echo ?? View: https://github.com/realLuckyy/Python-to-exe
    ) else (
        echo ? Push failed - please check and push manually
    )
)

echo.
pause