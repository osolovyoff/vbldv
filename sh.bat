@echo off
setlocal EnableExtensions

if "%~1"=="" (
  pwsh -NoLogo -NoProfile
  exit /b %ERRORLEVEL%
)

set "SCRIPT=%~1"
shift

if not exist "%SCRIPT%" (
  if exist ".\%SCRIPT%" (
    set "SCRIPT=.\%SCRIPT%"
  ) else if exist "%~dp0%SCRIPT%" (
    set "SCRIPT=%~dp0%SCRIPT%"
  )
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%" %*
exit /b %ERRORLEVEL%
