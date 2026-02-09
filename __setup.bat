@echo off
set "DIR=%~dp0"
if "%DIR:~-1%"=="\" set "DIR=%DIR:~0,-1%"
for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%B"
if defined USER_PATH (setx PATH "%USER_PATH%;%DIR%") else (setx PATH "%DIR%")

setx CHROME_PATH "c:\Program Files\Google\Chrome\Application\chrome.exe"

rem v
setx CHROME_PROFILE_2 "Default"

rem m
setx CHROME_PROFILE_1 "Profile 6"

rem e
setx CHROME_PROFILE_3 "Default"
echo Environment variables set successfully.