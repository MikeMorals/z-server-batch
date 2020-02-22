@echo off
setlocal enableDelayedExpansion

if not exist build ( mkdir build ) else ( echo setting up directorys )


for /f %%G in ('dir /b *.c*') do (
    set items=!items! %%~G
	echo %%G
)
echo !items!
gcc -c !items!
move *.o* build

for /f %%G in ('dir /b build/*.o*') do (
    set items=!items! build/%%~G
	echo %%G
)
gcc -o q3cpp.exe !items!
pause