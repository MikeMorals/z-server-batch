@echo off
setlocal enableDelayedExpansion

if not exist build ( mkdir build ) else ( echo setting up directorys )


for /f %%G in ('dir *.c /b') do (
    set items=!items! %%~G
	echo %%G
)

echo !items!

q3lcc -o lol.exe !items!
::move *.o* build
::gcc -o q3lcc.exe build/bytecode.o build/lcc.o
::start cmd q3lcc.exe
pause