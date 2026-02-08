
for /f %%t in ('powershell -NoProfile -Command "(Get-Date).ToString(\"ddMMyyyy_HHmm\")"') do set TS=%%t
echo %TS% | clip
echo Copied to the clip: %TS%
