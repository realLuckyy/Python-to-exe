@echo off
echo ===============================================
echo  Final Repository Cleanup - Remove Setup Files
echo ===============================================
echo.

echo Removing unnecessary files for clean repository...
echo.

REM Remove cleanup and status files (no longer needed)
if exist "cleanup-repo.bat" (
    del "cleanup-repo.bat"
    echo ? Removed cleanup-repo.bat
)

if exist "repository-status.bat" (
    del "repository-status.bat" 
    echo ? Removed repository-status.bat
)

if exist "CLEANUP_GUIDE.md" (
    del "CLEANUP_GUIDE.md"
    echo ? Removed CLEANUP_GUIDE.md
)

echo.
echo ===============================================
echo  ?? Repository Cleaned for GitHub Push
echo ===============================================
echo.

echo Files remaining (production-ready):
echo ? Source code (PyConverter/)
echo ? Documentation (README.md, CONTRIBUTING.md, etc.)  
echo ? Build scripts (build-*.bat)
echo ? GitHub configuration (.github/)
echo ? Release tools (create-release.bat, push-to-github.bat)
echo ? Standalone executable (dist-standalone/)
echo.

echo Repository is now clean and ready for GitHub push!
echo.

set /p PUSH_NOW="Push to GitHub now? (y/n): "
if /i "%PUSH_NOW%"=="y" (
    echo.
    echo Staging all changes...
    git add .
    
    echo Committing changes...
    git commit -m "Final cleanup: Remove setup files, ready for production"
    
    echo Pushing to GitHub...
    git push
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ? Successfully pushed to GitHub!
        echo ?? https://github.com/realLuckyy/Python-to-exe
        
        set /p OPEN_REPO="Open repository? (y/n): "
        if /i "%OPEN_REPO%"=="y" (
            start https://github.com/realLuckyy/Python-to-exe
        )
    ) else (
        echo ? Push failed - check errors above
    )
)

echo.
pause