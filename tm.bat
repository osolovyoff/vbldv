@echo off
for /f %%t in ('powershell -NoProfile -Command "(Get-Date).ToString(\"HHmm-dd_MM_yyyy\")"') do set TS=%%t
echo %TS%
echo %TS% | clip
