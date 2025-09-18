@echo off
echo ===============================================
echo  Git Configuration Setup
echo ===============================================
echo.

REM Check current Git configuration
echo Current Git configuration:
echo.
git config --global user.name 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ? Git user name not set
) else (
    for /f "delims=" %%i in ('git config --global user.name') do echo ? Name: %%i
)

git config --global user.email 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ? Git user email not set
) else (
    for /f "delims=" %%i in ('git config --global user.email') do echo ? Email: %%i
)

echo.
echo Repository remote:
git remote -v 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ? No Git repository or remote configured
) else (
    echo ? Remote configured
)

echo.
set /p SETUP_GIT="Do you want to configure Git credentials? (y/n): "
if /i "%SETUP_GIT%"=="y" (
    echo.
    set /p GIT_NAME="Enter your GitHub username (realLuckyy): "
    if "%GIT_NAME%"=="" set GIT_NAME=realLuckyy
    
    set /p GIT_EMAIL="Enter your GitHub email: "
    if "%GIT_EMAIL%"=="" set GIT_EMAIL=your-email@example.com
    
    echo.
    echo Setting Git configuration...
    git config --global user.name "%GIT_NAME%"
    git config --global user.email "%GIT_EMAIL%"
    
    echo ? Git configured with:
    echo    Name: %GIT_NAME%
    echo    Email: %GIT_EMAIL%
    echo.
)

echo Authentication options:
echo ===============================================
echo.
echo Option 1: Use GitHub CLI (Recommended)
echo   1. Install GitHub CLI: https://cli.github.com/
echo   2. Run: gh auth login
echo   3. Follow the prompts to authenticate
echo.
echo Option 2: Use Personal Access Token
echo   1. Go to: https://github.com/settings/tokens
echo   2. Generate new token with 'repo' permissions
echo   3. Use token as password when prompted
echo.
echo Option 3: Use Git Credential Manager
echo   git config --global credential.helper manager-core
echo.

set /p AUTH_CHOICE="Which authentication method would you like to use? (1/2/3): "

if "%AUTH_CHOICE%"=="1" (
    echo.
    echo Opening GitHub CLI download page...
    start https://cli.github.com/
    echo.
    echo After installing GitHub CLI, run: gh auth login
)

if "%AUTH_CHOICE%"=="2" (
    echo.
    echo Opening GitHub Personal Access Tokens page...
    start https://github.com/settings/tokens
    echo.
    echo Create a token with 'repo' permissions and use it as your password
)

if "%AUTH_CHOICE%"=="3" (
    echo.
    echo Setting up Git Credential Manager...
    git config --global credential.helper manager-core
    echo ? Credential manager configured
)

echo.
echo Once authentication is set up, try running push-to-github.bat again!
pause