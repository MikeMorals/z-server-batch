
setlocal enableDelayedExpansion

for /f %%G in ('dir /b *.asm*') do (
    set items=!items! %%~G
)
echo !items! > items.txt
pause
