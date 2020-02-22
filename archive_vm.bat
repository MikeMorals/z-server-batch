@echo off
setlocal enableDelayedExpansion

set TOOLS_DIR=tools\
set 7z=!TOOLS_DIR!7z.exe

cd build\release-batch-mingw\

mkdir vm
move game.qvm vm
move cgame.qvm vm
move ui.qvm vm

!7z! -tzip a vms.pk3 vm\game.qvm vm\cgame.qvm vm\ui.qvm

::del vm*.qvm* /s
::rmdir vm /S /Q

start cmd /c "move vms.pk3 ..\..\"

pause