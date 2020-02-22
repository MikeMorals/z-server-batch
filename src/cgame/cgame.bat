rem make sure we have a safe environement
::set LIBRARY=
::set INCLUDE=

cd ..\..\build\release-batch-mingw\base\cgame

::set PATH=..\..\tools\bin;%PATH%

set src=..\..\..\..\src
set cc="..\..\q3lcc.exe" -DQ3_VM -S -Wf-target=bytecode -Wf-g -I%src%\cgame -I%src%\game -I%src%\ui %1

%cc% %src%/game/bg_misc.c
%cc% %src%/game/bg_pmove.c
%cc% %src%/game/bg_slidemove.c
%cc% %src%/game/bg_lib.c
%cc% %src%/game/q_math.c
%cc% %src%/game/q_shared.c
%cc% %src%/cgame/cg_consolecmds.c
%cc% %src%/cgame/cg_draw.c
%cc% %src%/cgame/cg_drawtools.c
%cc% %src%/cgame/cg_effects.c
%cc% %src%/cgame/cg_ents.c
%cc% %src%/cgame/cg_event.c
%cc% %src%/cgame/cg_info.c
%cc% %src%/cgame/cg_localents.c
%cc% %src%/cgame/cg_main.c
%cc% %src%/cgame/cg_marks.c
%cc% %src%/cgame/cg_players.c
%cc% %src%/cgame/cg_playerstate.c
%cc% %src%/cgame/cg_predict.c
%cc% %src%/cgame/cg_scoreboard.c
%cc% %src%/cgame/cg_servercmds.c
%cc% %src%/cgame/cg_snapshot.c
%cc% %src%/cgame/cg_view.c
%cc% %src%/cgame/cg_weapons.c

"..\..\tools\q3asm.exe" -o "..\..\cgame.qvm" ^
cg_main ^
cg_syscalls ^
cg_consolecmds ^
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
..\game\bg_slidemove ^
..\game\bg_pmove ^
..\game\bg_lib ^
..\game\bg_misc ^
..\qcommon\q_math ^
..\qcommon\q_shared ^
cg_syscalls


:quit
cd %src%/cgame
pause