@echo off
setlocal enableDelayedExpansion

for /f %%G in ('dir *.c /b') do (
    set items=!items! %%~G
)

echo !items!
gcc !items!
pause