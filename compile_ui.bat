@echo off
setlocal enableDelayedExpansion

set compiler_flags=-DQ3_VM -O3 -S -Wf-target=bytecode -Wf-g -Isrc\cgame -Isrc\game -Isrc\ui 
set compiler="..\..\tools\q3asm.exe"

cd build\release-batch-mingw\base\ui

!compiler! -o "..\..\ui.qvm" ^
ui_main ^
..\..\..\..\src\ui\ui_syscalls ^
ui_atoms ^
ui_players ^
ui_shared ^
ui_gameinfo ^
..\game\bg_lib ^
..\game\bg_misc ^
..\qcommon\q_math ^
..\qcommon\q_shared

echo Q3ASM ui.qvm
echo.
