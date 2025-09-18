@echo off
echo ===============================================
echo  Quick Repository Cleanup - Remove Setup Files
echo ===============================================
echo.

echo Removing unnecessary setup and cleanup files...

REM Remove all the setup and utility scripts that aren't needed in production
del "setup-github-repo.bat" 2>nul
del "create-github-repo.bat" 2>nul  
del "repo-check.bat" 2>nul
del "setup-git-auth.bat" 2>nul
del "final-setup.bat" 2>nul
del "cleanup-repo.bat" 2>nul
del "repository-status.bat" 2>nul
del "final-cleanup.bat" 2>nul
del "CLEANUP_GUIDE.md" 2>nul
del "RELEASE_STATUS.md" 2>nul
del "REPOSITORY_STRUCTURE.md" 2>nul

echo ? Removed setup files

REM Check git status
echo.
echo Current git status:
git status --short

echo.
echo Files that will be committed:
echo ? PyConverter/ (source code)
echo ? README.md (documentation)  
echo ? build-*.bat (build scripts)
echo ? .github/ (GitHub config)
echo ? CONTRIBUTING.md, LICENSE, etc.
echo ? dist-standalone/ (executable)

echo.
set /p PROCEED="Add all files and commit? (y/n): "
if /i "%PROCEED%"=="y" (
    echo.
    echo Adding all files...
    git add .
    
    echo Committing...
    git commit -m "Clean repository: PyConverter v1.0 production ready"
    
    echo Pushing to GitHub...
    git push origin main
    
    echo.
    echo ? Repository pushed to GitHub!
    echo ?? https://github.com/realLuckyy/Python-to-exe
)

pause