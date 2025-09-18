@echo off
echo ===============================================
echo  Final Cleanup - Remove All Setup Files
echo ===============================================
echo.

echo Removing unnecessary setup and development files...

REM Remove all setup scripts
del "setup-github-repo.bat" 2>nul
del "create-github-repo.bat" 2>nul
del "repo-check.bat" 2>nul  
del "setup-git-auth.bat" 2>nul
del "final-setup.bat" 2>nul
del "cleanup-repo.bat" 2>nul
del "repository-status.bat" 2>nul
del "final-cleanup.bat" 2>nul
del "quick-cleanup-push.bat" 2>nul
del "git-cleanup.sh" 2>nul
del "fix-emojis.bat" 2>nul
del "fix-readme-emojis.bat" 2>nul
del "add-screenshots.bat" 2>nul

REM Remove development documentation
del "CLEANUP_GUIDE.md" 2>nul
del "README_CLEAN.md" 2>nul
del "RELEASE_STATUS.md" 2>nul
del "REPOSITORY_STRUCTURE.md" 2>nul

echo ? Removed setup and development files

echo.
echo Repository now contains only production files:
echo ? PyConverter/ (source code)
echo ? README.md (fixed, no broken images)
echo ? build-*.bat (build scripts)
echo ? .github/ (GitHub configuration)
echo ? dist-standalone/ (executable)
echo ? Documentation (CONTRIBUTING.md, LICENSE, etc.)

echo.
set /p PUSH="Push clean repository to GitHub? (y/n): "
if /i "%PUSH%"=="y" (
    echo.
    echo Adding changes...
    git add .
    
    echo Committing...
    git commit -m "Final cleanup: Production-ready PyConverter repository"
    
    echo Pushing to GitHub...
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ===============================================
        echo  ?? SUCCESS! Clean Repository on GitHub!
        echo ===============================================
        echo.
        echo ? Broken images removed
        echo ? Setup files cleaned up  
        echo ? Professional README
        echo ? Ready for users and contributors
        echo.
        echo ?? https://github.com/realLuckyy/Python-to-exe
        
        set /p OPEN="Open repository? (y/n): "
        if /i "%OPEN%"=="y" (
            start https://github.com/realLuckyy/Python-to-exe
        )
    ) else (
        echo ? Push failed
    )
)

echo.
echo Your PyConverter repository is now clean and professional! ??
pause