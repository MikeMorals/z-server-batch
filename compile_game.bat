@echo off
setlocal enableDelayedExpansion

set compiler_flags=-DQ3_VM -O3-S -Wf-target=bytecode -Wf-g -Isrc\cgame -Isrc\game -Isrc\ui 
set compiler="..\..\tools\q3asm.exe"

:cgame
cd build\release-batch-mingw\base\game

!compiler! -o "..\..\game.qvm" ^
g_main ^
..\..\..\..\src\game\g_syscalls ^
bg_misc ^
bg_pmove ^
bg_slidemove ^
bg_lib ^
g_mem ^
g_active ^
g_client ^
g_cmds ^
g_combat ^
g_physics ^
g_buildable ^
g_item ^
g_misc ^
g_missile ^
g_mover ^
g_session ^
g_spawn ^
g_svcmds ^
g_target ^
g_team ^
g_trigger ^
g_utils ^
g_maprotation ^
g_ptr ^
g_weapon ^
g_admin ^
g_global ^
g_bot ^
acebot_ai ^
acebot_cmds ^
acebot_items ^
acebot_movement ^
acebot_nodes ^
acebot_spawn ^
..\qcommon\q_math ^
..\qcommon\q_shared


echo.
echo Q3ASM game.qvm

cd ..\..\..\..\
