@echo off
echo ===============================================
echo  FINAL CLEANUP - PyConverter Production Ready
echo ===============================================
echo.

echo Removing all setup and development files...

REM Delete setup scripts
if exist "setup-github-repo.bat" del "setup-github-repo.bat"
if exist "create-github-repo.bat" del "create-github-repo.bat"
if exist "repo-check.bat" del "repo-check.bat"
if exist "setup-git-auth.bat" del "setup-git-auth.bat"
if exist "final-setup.bat" del "final-setup.bat"
if exist "cleanup-repo.bat" del "cleanup-repo.bat"
if exist "repository-status.bat" del "repository-status.bat"
if exist "final-cleanup.bat" del "final-cleanup.bat"
if exist "quick-cleanup-push.bat" del "quick-cleanup-push.bat"
if exist "git-cleanup.sh" del "git-cleanup.sh"
if exist "fix-emojis.bat" del "fix-emojis.bat"
if exist "fix-readme-emojis.bat" del "fix-readme-emojis.bat"
if exist "add-screenshots.bat" del "add-screenshots.bat"
if exist "final-clean.bat" del "final-clean.bat"

REM Delete development docs
if exist "CLEANUP_GUIDE.md" del "CLEANUP_GUIDE.md"
if exist "README_CLEAN.md" del "README_CLEAN.md"
if exist "RELEASE_STATUS.md" del "RELEASE_STATUS.md"
if exist "REPOSITORY_STRUCTURE.md" del "REPOSITORY_STRUCTURE.md"

echo ? Cleanup complete!

echo.
echo Production files remaining:
echo ? PyConverter/ (source code)
echo ? README.md (documentation)
echo ? .github/ (workflows & templates)
echo ? build-*.bat (build scripts)
echo ? dist-standalone/ (executable)
echo ? LICENSE, CONTRIBUTING.md, etc.

echo.
echo Staging all changes...
git add .

echo.
echo Committing final clean repository...
git commit -m "Final production release: Clean PyConverter repository ready for users"

echo.
echo Pushing to GitHub...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===============================================
    echo  ?? SUCCESS! PyConverter is Production Ready!
    echo ===============================================
    echo.
    echo ? Repository cleaned and optimized
    echo ? All unnecessary files removed
    echo ? Professional README without broken links
    echo ? Ready for users and contributors
    echo.
    echo ?? Repository: https://github.com/realLuckyy/Python-to-exe
    echo ?? Next step: Create your first release!
    echo.
    
    set /p OPEN="Open GitHub repository? (y/n): "
    if /i "%OPEN%"=="y" (
        start https://github.com/realLuckyy/Python-to-exe
    )
    
    set /p RELEASE="Create first release now? (y/n): "
    if /i "%RELEASE%"=="y" (
        if exist "create-release.bat" (
            call create-release.bat
        ) else (
            echo Please run: create-release.bat to create your first release
        )
    )
) else (
    echo.
    echo ? Push failed - check errors above
)

echo.
echo PyConverter is ready for the world! ??
pause

REM Self-destruct - remove this cleanup script
del "%~f0"