@echo off
setlocal enableDelayedExpansion

set compiler_flags=-DQ3_VM -S -Wf-target=bytecode -Wf-g
set compiler="..\..\tools\q3lcc.exe"

set build_gameqvm=1
set build_cgameqvm=1
set build_uiqvm=1

set build_cgame_dir=build/release-batch-mingw/base/cgame
set build_game_dir=build/release-batch-mingw/base/game
set build_ui_dir=build/release-batch-mingw/base/ui
set build_qcommon_dir=build/release-batch-mingw/base/qcommon
set src_dir=..\..\..\..\src\


::###########\ QVM /######################
:clean
call clean.bat
timeout -t 1 /nobreak

:buildqcommon
cd !build_qcommon_dir!
!compiler! !compiler_flags! "../../../../src/qcommon/q_math.c"
!compiler! !compiler_flags! "../../../../src/qcommon/q_shared.c"


:buildgame
cd ..\..\..\..\
cd !build_game_dir!
if !build_gameqvm!==0 goto buildcgame
for /f %%G in ('dir /b ..\..\..\..\src\game\*.c*') do (
    set items=..\..\..\..\src/game/%%~G
	echo Q3LCC %%G
!compiler! !compiler_flags! !items!
)

:buildcgame
cd ..\..\..\..\
cd !build_cgame_dir!
if !build_cgameqvm!==0 goto buildui
for /f %%G in ('dir /b ..\..\..\..\src\cgame\*.c*') do (
    set items=..\..\..\..\src/cgame/%%~G
	echo Q3LCC %%G
!compiler! !compiler_flags! !items!
)

:buildui
cd ..\..\..\..\
cd !build_ui_dir!
if !build_uiqvm!==0 goto end
for /f %%G in ('dir /b ..\..\..\..\src\ui\*.c*') do (
    set items=..\..\..\..\src/ui/%%~G
	echo Q3LCC %%G
	!compiler! !compiler_flags! !items!
)

:end

cd ..\..\..\..\
call compile_game.bat
