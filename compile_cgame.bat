@echo off
setlocal enableDelayedExpansion

set compiler_flags=-DQ3_VM -O3 -S -Wf-target=bytecode -Wf-g -Isrc\cgame -Isrc\game -Isrc\ui 
set compiler="..\..\tools\q3asm.exe"

set build_cgame_dir=build/release-batch-mingw/base/cgame
set build_game_dir=build/release-batch-mingw/base/game
set build_ui_dir=build/release-batch-mingw/base/ui
set build_common_dir=build/release-batch-mingw/base/qcommon
set build_client_dir=build/release-batch-mingw/base/client
set build_output_dir=build/release-batch-mingw

:cgame
cd build\release-batch-mingw\base\cgame
!compiler! -o "..\..\cgame.qvm" ^
cg_main ^
..\..\..\..\src\cgame\cg_syscalls ^
..\game\bg_misc ^
..\game\bg_pmove ^
..\game\bg_slidemove ^
..\game\bg_lib ^
cg_consolecmds ^
cg_buildable ^
cg_animation ^
cg_animmapobj ^
cg_draw ^
cg_drawtools ^
cg_ents ^
cg_event ^
cg_marks ^
cg_players ^
cg_playerstate ^
cg_predict ^
cg_servercmds ^
cg_snapshot ^
cg_view ^
cg_weapons ^
cg_mem ^
cg_scanner ^
cg_attachment ^
cg_trails ^
cg_particles ^
cg_ptr ^
cg_tutorial ^
..\ui\ui_shared  ^
..\qcommon\q_math ^
..\qcommon\q_shared

echo Q3ASM cgame.qvm

cd ..\..\..\..\
