@echo on
setlocal enableDelayedExpansion

set build_cgame_dir=base/cgame/
set build_game_dir=base/game/
set targetfile=cgame.a

set ofiles= ^
!build_cgame_dir!cg_main.o ^
!build_game_dir!bg_misc.o ^
!build_game_dir!bg_pmove.o ^
!build_game_dir!bg_slidemove.o ^
!build_game_dir!bg_lib.o ^
!build_cgame_dir!cg_animation.o ^
!build_cgame_dir!cg_animmapobj.o ^
!build_cgame_dir!cg_attachment.o ^
!build_cgame_dir!cg_buildable.o ^
!build_cgame_dir!cg_consolecmds.o ^
!build_cgame_dir!cg_draw.o ^
!build_cgame_dir!cg_drawtools.o ^
!build_cgame_dir!cg_ents.o ^
!build_cgame_dir!cg_event.o ^
!build_cgame_dir!cg_marks.o ^
!build_cgame_dir!cg_mem.o ^
!build_cgame_dir!cg_particles.o ^
!build_cgame_dir!cg_players.o ^
!build_cgame_dir!cg_playerstate.o ^
!build_cgame_dir!cg_predict.o ^
!build_cgame_dir!cg_ptr.o ^
!build_cgame_dir!cg_scanner.o ^
!build_cgame_dir!cg_servercmds.o ^
!build_cgame_dir!cg_snapshot.o ^
!build_cgame_dir!cg_syscalls.o ^
!build_cgame_dir!cg_trails.o ^
!build_cgame_dir!cg_tutorial.o ^
!build_cgame_dir!cg_view.o ^
!build_cgame_dir!cg_weapons.o

ar rcs !targetfile! !build_cgame_dir!cg_main.o
if exist !targetfile! move !targetfile! base
pause
