@echo off
setlocal

rem Get current directory
set "CURRENT_DIR=%CD%"

echo Adding %CURRENT_DIR% to PATH...

rem Add to PATH for current session
set "PATH=%PATH%;%CURRENT_DIR%"

rem Add to PATH permanently (User environment variable)
for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH 2^>nul') do set "USER_PATH=%%a %%b"

rem Check if current directory is already in PATH
echo %USER_PATH% | findstr /C:"%CURRENT_DIR%" >nul
if %errorlevel% equ 0 (
    echo Directory already in PATH.
) else (
    setx PATH "%USER_PATH%;%CURRENT_DIR%"
    echo Directory added to PATH permanently.
    echo Please restart your terminal for changes to take effect.
)

endlocal
