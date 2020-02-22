export Com_Error
code
proc Com_Error 1032 12
file "..\..\..\..\src/ui/ui_atoms.c"
line 33
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:Copyright (C) 2000-2006 Tim Angus
;5:
;6:This file is part of Tremulous.
;7:
;8:Tremulous is free software; you can redistribute it
;9:and/or modify it under the terms of the GNU General Public License as
;10:published by the Free Software Foundation; either version 2 of the License,
;11:or (at your option) any later version.
;12:
;13:Tremulous is distributed in the hope that it will be
;14:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16:GNU General Public License for more details.
;17:
;18:You should have received a copy of the GNU General Public License
;19:along with Tremulous; if not, write to the Free Software
;20:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21:===========================================================================
;22:*/
;23:
;24:/**********************************************************************
;25:  UI_ATOMS.C
;26:
;27:  User interface building blocks and support functions.
;28:**********************************************************************/
;29:#include "ui_local.h"
;30:
;31:qboolean    m_entersound;    // after a frame, so caching won't disrupt the sound
;32:
;33:void QDECL Com_Error( int level, const char *error, ... ) {
line 37
;34:  va_list    argptr;
;35:  char    text[1024];
;36:
;37:  va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 38
;38:  vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 39
;39:  va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 41
;40:
;41:  trap_Error( va("%s", text) );
ADDRGP4 $111
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 42
;42:}
LABELV $109
endproc Com_Error 1032 12
export Com_Printf
proc Com_Printf 1032 12
line 44
;43:
;44:void QDECL Com_Printf( const char *msg, ... ) {
line 48
;45:  va_list    argptr;
;46:  char    text[1024];
;47:
;48:  va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 49
;49:  vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 50
;50:  va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 52
;51:
;52:  trap_Print( va("%s", text) );
ADDRGP4 $111
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 53
;53:}
LABELV $112
endproc Com_Printf 1032 12
data
export newUI
align 4
LABELV newUI
byte 4 0
export UI_ClampCvar
code
proc UI_ClampCvar 0 0
line 64
;54:
;55:qboolean newUI = qfalse;
;56:
;57:
;58:/*
;59:=================
;60:UI_ClampCvar
;61:=================
;62:*/
;63:float UI_ClampCvar( float min, float max, float value )
;64:{
line 65
;65:  if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $115
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $114
JUMPV
LABELV $115
line 66
;66:  if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $117
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $114
JUMPV
LABELV $117
line 67
;67:  return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $114
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 75
;68:}
;69:
;70:/*
;71:=================
;72:UI_StartDemoLoop
;73:=================
;74:*/
;75:void UI_StartDemoLoop( void ) {
line 76
;76:  trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $120
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 77
;77:}
LABELV $119
endproc UI_StartDemoLoop 0 8
bss
align 1
LABELV $122
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 79
;78:
;79:char *UI_Argv( int arg ) {
line 82
;80:  static char  buffer[MAX_STRING_CHARS];
;81:
;82:  trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $122
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 84
;83:
;84:  return buffer;
ADDRGP4 $122
RETP4
LABELV $121
endproc UI_Argv 0 12
bss
align 1
LABELV $124
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 88
;85:}
;86:
;87:
;88:char *UI_Cvar_VariableString( const char *var_name ) {
line 91
;89:  static char  buffer[MAX_STRING_CHARS];
;90:
;91:  trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 93
;92:
;93:  return buffer;
ADDRGP4 $124
RETP4
LABELV $123
endproc UI_Cvar_VariableString 0 12
export UI_SetBestScores
proc UI_SetBestScores 144 12
line 98
;94:}
;95:
;96:
;97:
;98:void UI_SetBestScores(postGameInfo_t *newInfo, qboolean postGame) {
line 99
;99:  trap_Cvar_Set("ui_scoreAccuracy",     va("%i%%", newInfo->accuracy));
ADDRGP4 $127
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 100
;100:  trap_Cvar_Set("ui_scoreImpressives",  va("%i", newInfo->impressives));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $128
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 101
;101:  trap_Cvar_Set("ui_scoreExcellents",   va("%i", newInfo->excellents));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $130
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 102
;102:  trap_Cvar_Set("ui_scoreDefends",       va("%i", newInfo->defends));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $131
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 103
;103:  trap_Cvar_Set("ui_scoreAssists",       va("%i", newInfo->assists));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $132
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 104
;104:  trap_Cvar_Set("ui_scoreGauntlets",     va("%i", newInfo->gauntlets));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $133
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 105
;105:  trap_Cvar_Set("ui_scoreScore",         va("%i", newInfo->score));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $134
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 106
;106:  trap_Cvar_Set("ui_scorePerfect",       va("%i", newInfo->perfects));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $135
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 107
;107:  trap_Cvar_Set("ui_scoreTeam",          va("%i to %i", newInfo->redScore, newInfo->blueScore));
ADDRGP4 $137
ARGP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $136
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 108
;108:  trap_Cvar_Set("ui_scoreBase",          va("%i", newInfo->baseScore));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $138
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 109
;109:  trap_Cvar_Set("ui_scoreTimeBonus",    va("%i", newInfo->timeBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $139
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 110
;110:  trap_Cvar_Set("ui_scoreSkillBonus",    va("%i", newInfo->skillBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $140
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 111
;111:  trap_Cvar_Set("ui_scoreShutoutBonus",  va("%i", newInfo->shutoutBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $141
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 112
;112:  trap_Cvar_Set("ui_scoreTime",          va("%02i:%02i", newInfo->time / 60, newInfo->time % 60));
ADDRGP4 $143
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
CNSTI4 60
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
DIVI4
ARGI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
MODI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $142
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 113
;113:  trap_Cvar_Set("ui_scoreCaptures",    va("%i", newInfo->captures));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $144
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 114
;114:  if (postGame) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $145
line 115
;115:    trap_Cvar_Set("ui_scoreAccuracy2",     va("%i%%", newInfo->accuracy));
ADDRGP4 $127
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 116
;116:    trap_Cvar_Set("ui_scoreImpressives2",  va("%i", newInfo->impressives));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $148
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 117
;117:    trap_Cvar_Set("ui_scoreExcellents2",   va("%i", newInfo->excellents));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $149
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 118
;118:    trap_Cvar_Set("ui_scoreDefends2",       va("%i", newInfo->defends));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $150
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 119
;119:    trap_Cvar_Set("ui_scoreAssists2",       va("%i", newInfo->assists));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $151
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 120
;120:    trap_Cvar_Set("ui_scoreGauntlets2",     va("%i", newInfo->gauntlets));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $152
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 121
;121:    trap_Cvar_Set("ui_scoreScore2",         va("%i", newInfo->score));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $153
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 122
;122:    trap_Cvar_Set("ui_scorePerfect2",       va("%i", newInfo->perfects));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $154
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 123
;123:    trap_Cvar_Set("ui_scoreTeam2",          va("%i to %i", newInfo->redScore, newInfo->blueScore));
ADDRGP4 $137
ARGP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $155
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 124
;124:    trap_Cvar_Set("ui_scoreBase2",          va("%i", newInfo->baseScore));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $156
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 125
;125:    trap_Cvar_Set("ui_scoreTimeBonus2",    va("%i", newInfo->timeBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $157
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 126
;126:    trap_Cvar_Set("ui_scoreSkillBonus2",    va("%i", newInfo->skillBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $158
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 127
;127:    trap_Cvar_Set("ui_scoreShutoutBonus2",  va("%i", newInfo->shutoutBonus));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $159
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:    trap_Cvar_Set("ui_scoreTime2",          va("%02i:%02i", newInfo->time / 60, newInfo->time % 60));
ADDRGP4 $143
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
CNSTI4 60
ASGNI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
ARGI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
MODI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $160
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 129
;129:    trap_Cvar_Set("ui_scoreCaptures2",    va("%i", newInfo->captures));
ADDRGP4 $129
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $161
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 130
;130:  }
LABELV $145
line 131
;131:}
LABELV $125
endproc UI_SetBestScores 144 12
export UI_LoadBestScores
proc UI_LoadBestScores 144 24
line 133
;132:
;133:void UI_LoadBestScores(const char *map, int game) {
line 137
;134:  char    fileName[MAX_QPATH];
;135:  fileHandle_t f;
;136:  postGameInfo_t newInfo;
;137:  memset(&newInfo, 0, sizeof(postGameInfo_t));
ADDRLP4 68
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 138
;138:  Com_sprintf(fileName, MAX_QPATH, "games/%s_%i.game", map, game);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $163
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 139
;139:  if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 132
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $164
line 140
;140:    int size = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 141
;141:    trap_FS_Read(&size, sizeof(int), f);
ADDRLP4 136
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 142
;142:    if (size == sizeof(postGameInfo_t)) {
ADDRLP4 136
INDIRI4
CVIU4 4
CNSTU4 64
NEU4 $166
line 143
;143:      trap_FS_Read(&newInfo, sizeof(postGameInfo_t), f);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 144
;144:    }
LABELV $166
line 145
;145:    trap_FS_FCloseFile(f);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 146
;146:  }
LABELV $164
line 147
;147:  UI_SetBestScores(&newInfo, qfalse);
ADDRLP4 68
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 149
;148:
;149:  Com_sprintf(fileName, MAX_QPATH, "demos/%s_%d.dm_%d", map, game, (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $169
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $168
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 136
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 150
;150:  uiInfo.demoAvailable = qfalse;
ADDRGP4 uiInfo+73372
CNSTI4 0
ASGNI4
line 151
;151:  if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $171
line 152
;152:    uiInfo.demoAvailable = qtrue;
ADDRGP4 uiInfo+73372
CNSTI4 1
ASGNI4
line 153
;153:    trap_FS_FCloseFile(f);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 154
;154:  }
LABELV $171
line 155
;155:}
LABELV $162
endproc UI_LoadBestScores 144 24
export UI_ClearScores
proc UI_ClearScores 4200 16
line 162
;156:
;157:/*
;158:===============
;159:UI_ClearScores
;160:===============
;161:*/
;162:void UI_ClearScores( void ) {
line 169
;163:  char  gameList[4096];
;164:  char *gameFile;
;165:  int    i, len, count, size;
;166:  fileHandle_t f;
;167:  postGameInfo_t newInfo;
;168:
;169:  count = trap_FS_GetFileList( "games", "game", gameList, sizeof(gameList) );
ADDRGP4 $175
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 88
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4184
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 4184
INDIRI4
ASGNI4
line 171
;170:
;171:  size = sizeof(postGameInfo_t);
ADDRLP4 20
CNSTI4 64
ASGNI4
line 172
;172:  memset(&newInfo, 0, size);
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 174
;173:
;174:  if (count > 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $177
line 175
;175:    gameFile = gameList;
ADDRLP4 0
ADDRLP4 88
ASGNP4
line 176
;176:    for ( i = 0; i < count; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 177
;177:      len = strlen(gameFile);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4188
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 4188
INDIRI4
ASGNI4
line 178
;178:      if (trap_FS_FOpenFile(va("games/%s",gameFile), &f, FS_WRITE) >= 0) {
ADDRGP4 $185
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4192
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4196
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4196
INDIRI4
CNSTI4 0
LTI4 $183
line 179
;179:        trap_FS_Write(&size, sizeof(int), f);
ADDRLP4 20
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 180
;180:        trap_FS_Write(&newInfo, size, f);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 181
;181:        trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 182
;182:      }
LABELV $183
line 183
;183:      gameFile += len + 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 184
;184:    }
LABELV $180
line 176
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $179
line 185
;185:  }
LABELV $177
line 187
;186:
;187:  UI_SetBestScores(&newInfo, qfalse);
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 189
;188:
;189:}
LABELV $174
endproc UI_ClearScores 4200 16
proc UI_Cache_f 0 0
line 193
;190:
;191:
;192:
;193:static void  UI_Cache_f( void ) {
line 194
;194:  Display_CacheAll();
ADDRGP4 Display_CacheAll
CALLV
pop
line 195
;195:}
LABELV $186
endproc UI_Cache_f 0 0
proc UI_CalcPostGameStats 1456 20
line 202
;196:
;197:/*
;198:=======================
;199:UI_CalcPostGameStats
;200:=======================
;201:*/
;202:static void UI_CalcPostGameStats( void ) {
line 210
;203:  char    map[MAX_QPATH];
;204:  char    fileName[MAX_QPATH];
;205:  char    info[MAX_INFO_STRING];
;206:  fileHandle_t f;
;207:  int size, game, time, adjustedTime;
;208:  postGameInfo_t oldInfo;
;209:  postGameInfo_t newInfo;
;210:  qboolean newHigh = qfalse;
ADDRLP4 1088
CNSTI4 0
ASGNI4
line 212
;211:
;212:  trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 213
;213:  Q_strncpyz( map, Info_ValueForKey( info, "mapname" ), sizeof(map) );
ADDRLP4 64
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1160
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 214
;214:  game = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 64
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 1312
INDIRI4
ASGNI4
line 217
;215:
;216:  // compose file name
;217:  Com_sprintf(fileName, MAX_QPATH, "games/%s_%i.game", map, game);
ADDRLP4 1228
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $163
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1224
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 219
;218:  // see if we have one already
;219:  memset(&oldInfo, 0, sizeof(postGameInfo_t));
ADDRLP4 1096
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 220
;220:  if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 1228
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1316
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
LTI4 $190
line 222
;221:  // if so load it
;222:    size = 0;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 223
;223:    trap_FS_Read(&size, sizeof(int), f);
ADDRLP4 1296
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 224
;224:    if (size == sizeof(postGameInfo_t)) {
ADDRLP4 1296
INDIRI4
CVIU4 4
CNSTU4 64
NEU4 $192
line 225
;225:      trap_FS_Read(&oldInfo, sizeof(postGameInfo_t), f);
ADDRLP4 1096
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 226
;226:    }
LABELV $192
line 227
;227:    trap_FS_FCloseFile(f);
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 228
;228:  }
LABELV $190
line 230
;229:
;230:  newInfo.accuracy = atoi(UI_Argv(3));
CNSTI4 3
ARGI4
ADDRLP4 1320
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+16
ADDRLP4 1324
INDIRI4
ASGNI4
line 231
;231:  newInfo.impressives = atoi(UI_Argv(4));
CNSTI4 4
ARGI4
ADDRLP4 1328
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRLP4 1332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+20
ADDRLP4 1332
INDIRI4
ASGNI4
line 232
;232:  newInfo.excellents = atoi(UI_Argv(5));
CNSTI4 5
ARGI4
ADDRLP4 1336
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRLP4 1340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+24
ADDRLP4 1340
INDIRI4
ASGNI4
line 233
;233:  newInfo.defends = atoi(UI_Argv(6));
CNSTI4 6
ARGI4
ADDRLP4 1344
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1344
INDIRP4
ARGP4
ADDRLP4 1348
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+28
ADDRLP4 1348
INDIRI4
ASGNI4
line 234
;234:  newInfo.assists = atoi(UI_Argv(7));
CNSTI4 7
ARGI4
ADDRLP4 1352
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+32
ADDRLP4 1356
INDIRI4
ASGNI4
line 235
;235:  newInfo.gauntlets = atoi(UI_Argv(8));
CNSTI4 8
ARGI4
ADDRLP4 1360
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+36
ADDRLP4 1364
INDIRI4
ASGNI4
line 236
;236:  newInfo.baseScore = atoi(UI_Argv(9));
CNSTI4 9
ARGI4
ADDRLP4 1368
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1368
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+60
ADDRLP4 1372
INDIRI4
ASGNI4
line 237
;237:  newInfo.perfects = atoi(UI_Argv(10));
CNSTI4 10
ARGI4
ADDRLP4 1376
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRLP4 1380
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+12
ADDRLP4 1380
INDIRI4
ASGNI4
line 238
;238:  newInfo.redScore = atoi(UI_Argv(11));
CNSTI4 11
ARGI4
ADDRLP4 1384
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRLP4 1388
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 1388
INDIRI4
ASGNI4
line 239
;239:  newInfo.blueScore = atoi(UI_Argv(12));
CNSTI4 12
ARGI4
ADDRLP4 1392
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1392
INDIRP4
ARGP4
ADDRLP4 1396
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 1396
INDIRI4
ASGNI4
line 240
;240:  time = atoi(UI_Argv(13));
CNSTI4 13
ARGI4
ADDRLP4 1400
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1400
INDIRP4
ARGP4
ADDRLP4 1404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1300
ADDRLP4 1404
INDIRI4
ASGNI4
line 241
;241:  newInfo.captures = atoi(UI_Argv(14));
CNSTI4 14
ARGI4
ADDRLP4 1408
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1408
INDIRP4
ARGP4
ADDRLP4 1412
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1412
INDIRI4
ASGNI4
line 243
;242:
;243:  newInfo.time = (time - trap_Cvar_VariableValue("ui_matchStartTime")) / 1000;
ADDRGP4 $206
ARGP4
ADDRLP4 1416
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+44
ADDRLP4 1300
INDIRI4
CVIF4 4
ADDRLP4 1416
INDIRF4
SUBF4
CNSTF4 1148846080
DIVF4
CVFI4 4
ASGNI4
line 244
;244:  adjustedTime = uiInfo.mapList[ui_currentMap.integer].timeToBeat[game];
ADDRLP4 1292
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 245
;245:  if (newInfo.time < adjustedTime) {
ADDRLP4 0+44
INDIRI4
ADDRLP4 1292
INDIRI4
GEI4 $210
line 246
;246:    newInfo.timeBonus = (adjustedTime - newInfo.time) * 10;
ADDRLP4 0+48
CNSTI4 10
ADDRLP4 1292
INDIRI4
ADDRLP4 0+44
INDIRI4
SUBI4
MULI4
ASGNI4
line 247
;247:  } else {
ADDRGP4 $211
JUMPV
LABELV $210
line 248
;248:    newInfo.timeBonus = 0;
ADDRLP4 0+48
CNSTI4 0
ASGNI4
line 249
;249:  }
LABELV $211
line 251
;250:
;251:  if (newInfo.redScore > newInfo.blueScore && newInfo.blueScore <= 0) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $216
ADDRLP4 0+8
INDIRI4
CNSTI4 0
GTI4 $216
line 252
;252:    newInfo.shutoutBonus = 100;
ADDRLP4 0+52
CNSTI4 100
ASGNI4
line 253
;253:  } else {
ADDRGP4 $217
JUMPV
LABELV $216
line 254
;254:    newInfo.shutoutBonus = 0;
ADDRLP4 0+52
CNSTI4 0
ASGNI4
line 255
;255:  }
LABELV $217
line 257
;256:
;257:  newInfo.skillBonus = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $224
ARGP4
ADDRLP4 1420
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+56
ADDRLP4 1420
INDIRF4
CVFI4 4
ASGNI4
line 258
;258:  if (newInfo.skillBonus <= 0) {
ADDRLP4 0+56
INDIRI4
CNSTI4 0
GTI4 $225
line 259
;259:    newInfo.skillBonus = 1;
ADDRLP4 0+56
CNSTI4 1
ASGNI4
line 260
;260:  }
LABELV $225
line 261
;261:  newInfo.score = newInfo.baseScore + newInfo.shutoutBonus + newInfo.timeBonus;
ADDRLP4 0
ADDRLP4 0+60
INDIRI4
ADDRLP4 0+52
INDIRI4
ADDI4
ADDRLP4 0+48
INDIRI4
ADDI4
ASGNI4
line 262
;262:  newInfo.score *= newInfo.skillBonus;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 0+56
INDIRI4
MULI4
ASGNI4
line 265
;263:
;264:  // see if the score is higher for this one
;265:  newHigh = (newInfo.redScore > newInfo.blueScore && newInfo.score > oldInfo.score);
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $236
ADDRLP4 0
INDIRI4
ADDRLP4 1096
INDIRI4
LEI4 $236
ADDRLP4 1424
CNSTI4 1
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
ADDRLP4 1424
CNSTI4 0
ASGNI4
LABELV $237
ADDRLP4 1088
ADDRLP4 1424
INDIRI4
ASGNI4
line 267
;266:
;267:  if  (newHigh) {
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $238
line 269
;268:    // if so write out the new one
;269:    uiInfo.newHighScoreTime = uiInfo.uiDC.realTime + 20000;
ADDRGP4 uiInfo+73356
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 270
;270:    if (trap_FS_FOpenFile(fileName, &f, FS_WRITE) >= 0) {
ADDRLP4 1228
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1428
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1428
INDIRI4
CNSTI4 0
LTI4 $242
line 271
;271:      size = sizeof(postGameInfo_t);
ADDRLP4 1296
CNSTI4 64
ASGNI4
line 272
;272:      trap_FS_Write(&size, sizeof(int), f);
ADDRLP4 1296
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 273
;273:      trap_FS_Write(&newInfo, sizeof(postGameInfo_t), f);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 274
;274:      trap_FS_FCloseFile(f);
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 275
;275:    }
LABELV $242
line 276
;276:  }
LABELV $238
line 278
;277:
;278:  if (newInfo.time < oldInfo.time) {
ADDRLP4 0+44
INDIRI4
ADDRLP4 1096+44
INDIRI4
GEI4 $244
line 279
;279:    uiInfo.newBestTime = uiInfo.uiDC.realTime + 20000;
ADDRGP4 uiInfo+73360
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 280
;280:  }
LABELV $244
line 283
;281:
;282:  // put back all the ui overrides
;283:  trap_Cvar_Set("capturelimit", UI_Cvar_VariableString("ui_saveCaptureLimit"));
ADDRGP4 $251
ARGP4
ADDRLP4 1428
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 284
;284:  trap_Cvar_Set("fraglimit", UI_Cvar_VariableString("ui_saveFragLimit"));
ADDRGP4 $253
ARGP4
ADDRLP4 1432
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $252
ARGP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 285
;285:  trap_Cvar_Set("cg_drawTimer", UI_Cvar_VariableString("ui_drawTimer"));
ADDRGP4 $255
ARGP4
ADDRLP4 1436
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $254
ARGP4
ADDRLP4 1436
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 286
;286:  trap_Cvar_Set("g_doWarmup", UI_Cvar_VariableString("ui_doWarmup"));
ADDRGP4 $257
ARGP4
ADDRLP4 1440
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $256
ARGP4
ADDRLP4 1440
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 287
;287:  trap_Cvar_Set("g_Warmup", UI_Cvar_VariableString("ui_Warmup"));
ADDRGP4 $259
ARGP4
ADDRLP4 1444
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $258
ARGP4
ADDRLP4 1444
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 288
;288:  trap_Cvar_Set("sv_pure", UI_Cvar_VariableString("ui_pure"));
ADDRGP4 $261
ARGP4
ADDRLP4 1448
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $260
ARGP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 289
;289:  trap_Cvar_Set("g_friendlyFire", UI_Cvar_VariableString("ui_friendlyFire"));
ADDRGP4 $263
ARGP4
ADDRLP4 1452
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $262
ARGP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 291
;290:
;291:  UI_SetBestScores(&newInfo, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 292
;292:  UI_ShowPostGame(newHigh);
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 UI_ShowPostGame
CALLV
pop
line 295
;293:
;294:
;295:}
LABELV $187
endproc UI_CalcPostGameStats 1456 20
export UI_ConsoleCommand
proc UI_ConsoleCommand 172 12
line 304
;296:
;297:
;298:/*
;299:=================
;300:UI_ConsoleCommand
;301:=================
;302:*/
;303:qboolean UI_ConsoleCommand( int realTime )
;304:{
line 308
;305:  char  *cmd;
;306:  char  *arg1;
;307:
;308:  uiInfo.uiDC.frameTime = realTime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+212
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
SUBI4
ASGNI4
line 309
;309:  uiInfo.uiDC.realTime = realTime;
ADDRGP4 uiInfo+208
ADDRFP4 0
INDIRI4
ASGNI4
line 311
;310:
;311:  cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 316
;312:
;313:  // ensure minimum menu data is available
;314:  //Menu_Cache();
;315:
;316:  if ( Q_stricmp (cmd, "ui_test") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $268
line 317
;317:    UI_ShowPostGame(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_ShowPostGame
CALLV
pop
line 318
;318:  }
LABELV $268
line 320
;319:
;320:  if ( Q_stricmp (cmd, "ui_report") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $271
line 321
;321:    UI_Report();
ADDRGP4 UI_Report
CALLV
pop
line 322
;322:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $271
line 325
;323:  }
;324:
;325:  if ( Q_stricmp (cmd, "ui_load") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $274
line 326
;326:    UI_Load();
ADDRGP4 UI_Load
CALLV
pop
line 327
;327:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $274
line 330
;328:  }
;329:
;330:  if ( Q_stricmp (cmd, "remapShader") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $277
line 331
;331:    if (trap_Argc() == 4) {
ADDRLP4 28
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $280
line 334
;332:      char shader1[MAX_QPATH];
;333:      char shader2[MAX_QPATH];
;334:      Q_strncpyz(shader1, UI_Argv(1), sizeof(shader1));
CNSTI4 1
ARGI4
ADDRLP4 160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 32
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 335
;335:      Q_strncpyz(shader2, UI_Argv(2), sizeof(shader2));
CNSTI4 2
ARGI4
ADDRLP4 164
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 96
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 336
;336:      trap_R_RemapShader(shader1, shader2, UI_Argv(3));
CNSTI4 3
ARGI4
ADDRLP4 168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 32
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 337
;337:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $280
line 339
;338:    }
;339:  }
LABELV $277
line 341
;340:
;341:  if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $282
line 342
;342:    UI_CalcPostGameStats();
ADDRGP4 UI_CalcPostGameStats
CALLV
pop
line 343
;343:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $282
line 346
;344:  }
;345:
;346:  if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $285
line 347
;347:    UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 348
;348:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $285
line 351
;349:  }
;350:
;351:  if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $288
line 353
;352:    //UI_TeamOrdersMenu_f();
;353:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $288
line 356
;354:  }
;355:
;356:  if( Q_stricmp ( cmd, "menu" ) == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $293
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $291
line 357
;357:  {
line 358
;358:    arg1 = UI_Argv( 1 );
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 360
;359:
;360:    if( Menu_Count( ) > 0 )
ADDRLP4 48
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $294
line 361
;361:    {
line 362
;362:      trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 363
;363:      Menus_ActivateByName( arg1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 364
;364:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $294
line 366
;365:    }
;366:  }
LABELV $291
line 368
;367:
;368:  if( Q_stricmp ( cmd, "closemenus" ) == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $296
line 369
;369:  {
line 370
;370:    if( Menu_Count( ) > 0 )
ADDRLP4 48
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $299
line 371
;371:    {
line 372
;372:      trap_Key_SetCatcher( trap_Key_GetCatcher( ) & ~KEYCATCH_UI );
ADDRLP4 52
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 373
;373:      trap_Key_ClearStates( );
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 374
;374:      trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $301
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 375
;375:      Menus_CloseAll( );
ADDRGP4 Menus_CloseAll
CALLV
pop
line 376
;376:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $299
line 378
;377:    }
;378:  }
LABELV $296
line 380
;379:
;380:  return qfalse;
CNSTI4 0
RETI4
LABELV $264
endproc UI_ConsoleCommand 172 12
export UI_Shutdown
proc UI_Shutdown 0 0
line 388
;381:}
;382:
;383:/*
;384:=================
;385:UI_Shutdown
;386:=================
;387:*/
;388:void UI_Shutdown( void ) {
line 389
;389:}
LABELV $303
endproc UI_Shutdown 0 0
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 398
;390:
;391:/*
;392:================
;393:UI_AdjustFrom640
;394:
;395:Adjusted for resolution and screen aspect ratio
;396:================
;397:*/
;398:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 407
;399:  // expect valid pointers
;400:#if 0
;401:  *x = *x * uiInfo.uiDC.scale + uiInfo.uiDC.bias;
;402:  *y *= uiInfo.uiDC.scale;
;403:  *w *= uiInfo.uiDC.scale;
;404:  *h *= uiInfo.uiDC.scale;
;405:#endif
;406:
;407:  *x *= uiInfo.uiDC.xscale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 408
;408:  *y *= uiInfo.uiDC.yscale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uiInfo+196
INDIRF4
MULF4
ASGNF4
line 409
;409:  *w *= uiInfo.uiDC.xscale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 410
;410:  *h *= uiInfo.uiDC.yscale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uiInfo+196
INDIRF4
MULF4
ASGNF4
line 412
;411:
;412:}
LABELV $304
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 414
;413:
;414:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 417
;415:  qhandle_t  hShader;
;416:
;417:  hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 418
;418:  UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 419
;419:  trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 420
;420:}
LABELV $309
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 422
;421:
;422:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 428
;423:  float  s0;
;424:  float  s1;
;425:  float  t0;
;426:  float  t1;
;427:
;428:  if( w < 0 ) {  // flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $311
line 429
;429:    w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 430
;430:    s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 431
;431:    s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 432
;432:  }
ADDRGP4 $312
JUMPV
LABELV $311
line 433
;433:  else {
line 434
;434:    s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 435
;435:    s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 436
;436:  }
LABELV $312
line 438
;437:
;438:  if( h < 0 ) {  // flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $313
line 439
;439:    h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 440
;440:    t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 441
;441:    t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 442
;442:  }
ADDRGP4 $314
JUMPV
LABELV $313
line 443
;443:  else {
line 444
;444:    t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 445
;445:    t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 446
;446:  }
LABELV $314
line 448
;447:
;448:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 449
;449:  trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 450
;450:}
LABELV $310
endproc UI_DrawHandlePic 16 36
export UI_FillRect
proc UI_FillRect 4 36
line 459
;451:
;452:/*
;453:================
;454:UI_FillRect
;455:
;456:Coordinates are 640*480 virtual values
;457:=================
;458:*/
;459:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 460
;460:  trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 462
;461:
;462:  UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 463
;463:  trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 465
;464:
;465:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 466
;466:}
LABELV $315
endproc UI_FillRect 4 36
export UI_DrawSides
proc UI_DrawSides 12 36
line 468
;467:
;468:void UI_DrawSides(float x, float y, float w, float h) {
line 469
;469:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 470
;470:  trap_R_DrawStretchPic( x, y, 1, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 471
;471:  trap_R_DrawStretchPic( x + w - 1, y, 1, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 472
;472:}
LABELV $317
endproc UI_DrawSides 12 36
export UI_DrawTopBottom
proc UI_DrawTopBottom 12 36
line 474
;473:
;474:void UI_DrawTopBottom(float x, float y, float w, float h) {
line 475
;475:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 476
;476:  trap_R_DrawStretchPic( x, y, w, 1, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 477
;477:  trap_R_DrawStretchPic( x, y + h - 1, w, 1, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 478
;478:}
LABELV $320
endproc UI_DrawTopBottom 12 36
export UI_DrawRect
proc UI_DrawRect 0 16
line 486
;479:/*
;480:================
;481:UI_DrawRect
;482:
;483:Coordinates are 640*480 virtual values
;484:=================
;485:*/
;486:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 487
;487:  trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 489
;488:
;489:  UI_DrawTopBottom(x, y, width, height);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 UI_DrawTopBottom
CALLV
pop
line 490
;490:  UI_DrawSides(x, y, width, height);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 UI_DrawSides
CALLV
pop
line 492
;491:
;492:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 493
;493:}
LABELV $323
endproc UI_DrawRect 0 16
export UI_SetColor
proc UI_SetColor 0 4
line 495
;494:
;495:void UI_SetColor( const float *rgba ) {
line 496
;496:  trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 497
;497:}
LABELV $324
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 499
;498:
;499:void UI_UpdateScreen( void ) {
line 500
;500:  trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 501
;501:}
LABELV $325
endproc UI_UpdateScreen 0 0
export UI_DrawTextBox
proc UI_DrawTextBox 24 20
line 505
;502:
;503:
;504:void UI_DrawTextBox (int x, int y, int width, int lines)
;505:{
line 506
;506:  UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 507
;507:  UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 508
;508:}
LABELV $326
endproc UI_DrawTextBox 24 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 511
;509:
;510:qboolean UI_CursorInRect (int x, int y, int width, int height)
;511:{
line 512
;512:  if (uiInfo.uiDC.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uiInfo+216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $336
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $336
ADDRGP4 uiInfo+216
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
GTI4 $336
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
LEI4 $328
LABELV $336
line 516
;513:    uiInfo.uiDC.cursory < y ||
;514:    uiInfo.uiDC.cursorx > x+width ||
;515:    uiInfo.uiDC.cursory > y+height)
;516:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $327
JUMPV
LABELV $328
line 518
;517:
;518:  return qtrue;
CNSTI4 1
RETI4
LABELV $327
endproc UI_CursorInRect 8 0
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
bss
export m_entersound
align 4
LABELV m_entersound
skip 4
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Init
import uiInfo
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ShowPostGame
import UI_AdjustTimeByGame
import _UI_SetActiveMenu
import UI_LoadMenus
import UI_Load
import UI_Report
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_bank
import ui_serverStatusTimeOut
import ui_bigFont
import ui_smallFont
import ui_scoreTime
import ui_scoreShutoutBonus
import ui_scoreSkillBonus
import ui_scoreTimeBonus
import ui_scoreBase
import ui_scoreTeam
import ui_scorePerfect
import ui_scoreScore
import ui_scoreGauntlets
import ui_scoreAssists
import ui_scoreDefends
import ui_scoreExcellents
import ui_scoreImpressives
import ui_scoreAccuracy
import ui_singlePlayerActive
import ui_lastServerRefresh_3
import ui_lastServerRefresh_2
import ui_lastServerRefresh_1
import ui_lastServerRefresh_0
import ui_selectedPlayerName
import ui_selectedPlayer
import ui_currentOpponent
import ui_mapIndex
import ui_currentNetMap
import ui_currentMap
import ui_currentTier
import ui_menuFiles
import ui_opponentName
import ui_dedicated
import ui_serverFilterType
import ui_netSource
import ui_joinGameType
import ui_actualNetGameType
import ui_netGameType
import ui_gameType
import ui_fragLimit
import ui_captureLimit
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import g_nameBind2
import g_nameBind1
import BindingFromName
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Item_Text_AutoWrapped_Paint
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import BG_ClientListParse
import BG_ClientListString
import BG_ClientListRemove
import BG_ClientListAdd
import BG_ClientListTest
import BG_UpgradeClassAvailable
import BG_BuildableIsAllowed
import BG_ClassIsAllowed
import BG_UpgradeIsAllowed
import BG_WeaponIsAllowed
import BG_InitAllowedGameElements
import BG_ParseCSVBuildableList
import BG_ParseCSVClassList
import BG_ParseCSVEquipmentList
import atoi_neg
import atof_neg
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_FindTeamForUpgrade
import BG_FindUsableForUpgrade
import BG_FindPurchasableForUpgrade
import BG_FindIconForUpgrade
import BG_FindHumanNameForUpgrade
import BG_FindUpgradeNumForName
import BG_FindNameForUpgrade
import BG_FindSlotsForUpgrade
import BG_FindStagesForUpgrade
import BG_FindPriceForUpgrade
import BG_FindTeamForWeapon
import BG_FindBuildDelayForWeapon
import BG_FindLongRangedForWeapon
import BG_FindPurchasableForWeapon
import BG_FindZoomFovForWeapon
import BG_WeaponCanZoom
import BG_WeaponHasThirdMode
import BG_WeaponHasAltMode
import BG_FindKnockbackScaleForWeapon
import BG_FindReloadTimeForWeapon
import BG_FindRepeatRate3ForWeapon
import BG_FindRepeatRate2ForWeapon
import BG_FindRepeatRate1ForWeapon
import BG_FindUsesEnergyForWeapon
import BG_FindInfinteAmmoForWeapon
import BG_FindAmmoForWeapon
import BG_FindCrosshairSizeForWeapon
import BG_FindCrosshairForWeapon
import BG_FindIconForWeapon
import BG_FindModelsForWeapon
import BG_FindHumanNameForWeapon
import BG_FindWeaponNumForName
import BG_FindNameForWeapon
import BG_FindSlotsForWeapon
import BG_FindStagesForWeapon
import BG_FindPriceForWeapon
import BG_InitClassOverrides
import BG_FindValueOfClass
import BG_FindCostOfClass
import BG_ClassCanEvolveFromTo
import BG_FindBuildDistForClass
import BG_FindStartWeaponForClass
import BG_ClassHasAbility
import BG_FindSteptimeForClass
import BG_FindKnockbackScaleForClass
import BG_FindJumpMagnitudeForClass
import BG_FindStopSpeedForClass
import BG_FindFrictionForClass
import BG_FindAirAccelerationForClass
import BG_FindAccelerationForClass
import BG_FindSpeedForClass
import BG_FindBobCycleForClass
import BG_FindBobForClass
import BG_FindFovForClass
import BG_FindRegenRateForClass
import BG_FindFallDamageForClass
import BG_FindHealthForClass
import BG_FindViewheightForClass
import BG_FindZOffsetForClass
import BG_FindBBoxForClass
import BG_FindSpriteHeightForClass
import BG_FindStagesForClass
import BG_FindHudNameForClass
import BG_FindShadowScaleForClass
import BG_FindSkinNameForClass
import BG_FindModelScaleForClass
import BG_FindModelNameForClass
import BG_FindHumanNameForClassNum
import BG_FindNameForClassNum
import BG_FindClassNumForName
import BG_InitBuildableOverrides
import BG_FindTransparentTestForBuildable
import BG_FindReplaceableTestForBuildable
import BG_FindUniqueTestForBuildable
import BG_FindDCCTestForBuildable
import BG_FindCreepSizeForBuildable
import BG_FindCreepTestForBuildable
import BG_FindInvertNormalForBuildable
import BG_FindMinNormalForBuildable
import BG_FindProjTypeForBuildable
import BG_FindFireSpeedForBuildable
import BG_FindRangeForBuildable
import BG_FindUsableForBuildable
import BG_FindBuildTimeForBuildable
import BG_FindNextThinkForBuildable
import BG_FindAnimForBuildable
import BG_FindBuildWeaponForBuildable
import BG_FindTeamForBuildable
import BG_FindMODForBuildable
import BG_FindSplashRadiusForBuildable
import BG_FindSplashDamageForBuildable
import BG_FindStagesForBuildable
import BG_FindBuildPointsForBuildable
import BG_FindBounceForBuildable
import BG_FindTrajectoryForBuildable
import BG_FindRegenRateForBuildable
import BG_FindHealthForBuildable
import BG_FindZOffsetForBuildable
import BG_FindBBoxForBuildable
import BG_FindModelScaleForBuildable
import BG_FindModelsForBuildable
import BG_FindEntityNameForBuildable
import BG_FindHumanNameForBuildable
import BG_FindNameForBuildable
import BG_FindBuildNumForEntityName
import BG_FindBuildNumForName
import BG_GetValueOfEquipment
import BG_GetValueOfHuman
import BG_PositionBuildableRelativeToPlayer
import BG_RotateAxis
import BG_UpgradeIsActive
import BG_DeactivateUpgrade
import BG_ActivateUpgrade
import BG_InventoryContainsUpgrade
import BG_RemoveUpgradeFromInventory
import BG_AddUpgradeToInventory
import BG_InventoryContainsWeapon
import BG_RemoveWeaponFromInventory
import BG_AddWeaponToInventory
import BG_WeaponIsFull
import BG_PackAmmoArray
import BG_UnpackAmmoArray
import Pmove
import PM_UpdateViewAngles
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isintegral
import Q_isanumber
import Q_isdigit
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Com_HexStrToInt
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import DistanceBetweenLineSegments
import DistanceBetweenLineSegmentsSquared
import VectorMaxComponent
import VectorMinComponent
import pointToLineDistance
import VectorDistance
import ProjectPointOntoVector
import GetPerpendicularViewVector
import Q_isnan
import PerpendicularVector
import AngleVectors
import VectorMatrixMultiply
import MatrixMultiply
import MakeNormalVectors
import RotateAroundAxe
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AxisToAngles
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import rint
import pow
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $302
byte 1 48
byte 1 0
align 1
LABELV $301
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $298
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $293
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $287
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $284
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $279
byte 1 114
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $276
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $273
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $270
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $263
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $262
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $261
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $259
byte 1 117
byte 1 105
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $258
byte 1 103
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $257
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $256
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $255
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $253
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $252
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $251
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $250
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $224
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $206
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $188
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $185
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $176
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $175
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $169
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $168
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 100
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $163
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $160
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $159
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $158
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $157
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $156
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $155
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $154
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $153
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $152
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $151
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $150
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $149
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $148
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $147
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 50
byte 1 0
align 1
LABELV $144
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $142
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $139
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $136
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $135
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $134
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $132
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $130
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $129
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $128
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $126
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $120
byte 1 100
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $111
byte 1 37
byte 1 115
byte 1 0
