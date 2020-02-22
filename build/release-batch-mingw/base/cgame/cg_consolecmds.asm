export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
file "..\..\..\..\src/cgame/cg_consolecmds.c"
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
;24:// cg_consolecmds.c -- text commands typed in at the local console, or
;25:// executed by a key binding
;26:
;27:
;28:#include "cg_local.h"
;29:
;30:
;31:
;32:void CG_TargetCommand_f( void )
;33:{
line 37
;34:  int   targetNum;
;35:  char  test[ 4 ];
;36:
;37:  targetNum = CG_CrosshairPlayer( );
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 38
;38:  if( !targetNum )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $100
line 39
;39:    return;
ADDRGP4 $99
JUMPV
LABELV $100
line 41
;40:
;41:  trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 42
;42:  trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $102
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 43
;43:}
LABELV $99
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 55
;44:
;45:
;46:
;47:/*
;48:=================
;49:CG_SizeUp_f
;50:
;51:Keybinding command
;52:=================
;53:*/
;54:static void CG_SizeUp_f( void )
;55:{
line 56
;56:  trap_Cvar_Set( "cg_viewsize", va( "%i", (int)( cg_viewsize.integer + 10 ) ) );
ADDRGP4 $105
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 57
;57:}
LABELV $103
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 68
;58:
;59:
;60:/*
;61:=================
;62:CG_SizeDown_f
;63:
;64:Keybinding command
;65:=================
;66:*/
;67:static void CG_SizeDown_f( void )
;68:{
line 69
;69:  trap_Cvar_Set( "cg_viewsize", va( "%i", (int)( cg_viewsize.integer - 10 ) ) );
ADDRGP4 $105
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 70
;70:}
LABELV $107
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 81
;71:
;72:
;73:/*
;74:=============
;75:CG_Viewpos_f
;76:
;77:Debugging command to print the current position
;78:=============
;79:*/
;80:static void CG_Viewpos_f( void )
;81:{
line 82
;82:  CG_Printf( "(%i %i %i) : %i\n", (int)cg.refdef.vieworg[ 0 ],
ADDRGP4 $110
ARGP4
ADDRGP4 cg+110040+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+110040+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+110040+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+110408+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 85
;83:    (int)cg.refdef.vieworg[ 1 ], (int)cg.refdef.vieworg[ 2 ],
;84:    (int)cg.refdefViewAngles[ YAW ] );
;85:}
LABELV $109
endproc CG_Viewpos_f 0 20
export CG_RequestScores
proc CG_RequestScores 0 4
line 88
;86:
;87:qboolean CG_RequestScores( void )
;88:{
line 89
;89:  if( cg.scoresRequestTime + 2000 < cg.time )
ADDRGP4 cg+111456
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $122
line 90
;90:  {
line 93
;91:    // the scores are more than two seconds out of data,
;92:    // so request new ones
;93:    cg.scoresRequestTime = cg.time;
ADDRGP4 cg+111456
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 95
;94:    //TA: added \n SendClientCommand doesn't call flush( )?
;95:    trap_SendClientCommand( "score\n" );
ADDRGP4 $128
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 97
;96:
;97:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $121
JUMPV
LABELV $122
line 100
;98:  }
;99:  else
;100:    return qfalse;
CNSTI4 0
RETI4
LABELV $121
endproc CG_RequestScores 0 4
proc CG_ScoresDown_f 4 4
line 104
;101:}
;102:
;103:static void CG_ScoresDown_f( void )
;104:{
line 105
;105:  if( CG_RequestScores( ) )
ADDRLP4 0
ADDRGP4 CG_RequestScores
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $130
line 106
;106:  {
line 109
;107:    // leave the current scores up if they were already
;108:    // displayed, but if this is the first hit, clear them out
;109:    if( !cg.showScores )
ADDRGP4 cg+113268
INDIRI4
CNSTI4 0
NEI4 $131
line 110
;110:    {
line 111
;111:      if( cg_debugRandom.integer )
ADDRGP4 cg_debugRandom+12
INDIRI4
CNSTI4 0
EQI4 $135
line 112
;112:        CG_Printf( "CG_ScoresDown_f: scores out of date\n" );
ADDRGP4 $138
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $135
line 114
;113:
;114:      cg.showScores = qtrue;
ADDRGP4 cg+113268
CNSTI4 1
ASGNI4
line 115
;115:      cg.numScores = 0;
ADDRGP4 cg+111460
CNSTI4 0
ASGNI4
line 116
;116:    }
line 117
;117:  }
ADDRGP4 $131
JUMPV
LABELV $130
line 119
;118:  else
;119:  {
line 122
;120:    // show the cached contents even if they just pressed if it
;121:    // is within two seconds
;122:    cg.showScores = qtrue;
ADDRGP4 cg+113268
CNSTI4 1
ASGNI4
line 123
;123:  }
LABELV $131
line 124
;124:}
LABELV $129
endproc CG_ScoresDown_f 4 4
proc CG_ScoresUp_f 0 0
line 127
;125:
;126:static void CG_ScoresUp_f( void )
;127:{
line 128
;128:  if( cg.showScores )
ADDRGP4 cg+113268
INDIRI4
CNSTI4 0
EQI4 $143
line 129
;129:  {
line 130
;130:    cg.showScores = qfalse;
ADDRGP4 cg+113268
CNSTI4 0
ASGNI4
line 131
;131:    cg.scoreFadeTime = cg.time;
ADDRGP4 cg+113276
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 132
;132:  }
LABELV $143
line 133
;133:}
LABELV $142
endproc CG_ScoresUp_f 0 0
proc CG_TellTarget_f 264 20
line 136
;134:
;135:static void CG_TellTarget_f( void )
;136:{
line 141
;137:  int   clientNum;
;138:  char  command[ 128 ];
;139:  char  message[ 128 ];
;140:
;141:  clientNum = CG_CrosshairPlayer( );
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 142
;142:  if( clientNum == -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $150
line 143
;143:    return;
ADDRGP4 $149
JUMPV
LABELV $150
line 145
;144:
;145:  trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 146
;146:  Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $152
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 147
;147:  trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 148
;148:}
LABELV $149
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 151
;149:
;150:static void CG_TellAttacker_f( void )
;151:{
line 156
;152:  int   clientNum;
;153:  char  command[ 128 ];
;154:  char  message[ 128 ];
;155:
;156:  clientNum = CG_LastAttacker( );
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 157
;157:  if( clientNum == -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $154
line 158
;158:    return;
ADDRGP4 $153
JUMPV
LABELV $154
line 160
;159:
;160:  trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 161
;161:  Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $152
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 162
;162:  trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 163
;163:}
LABELV $153
endproc CG_TellAttacker_f 264 20
data
align 4
LABELV commands
address $157
address CG_TestGun_f
address $158
address CG_TestModel_f
address $159
address CG_TestModelNextFrame_f
address $160
address CG_TestModelPrevFrame_f
address $161
address CG_TestModelNextSkin_f
address $162
address CG_TestModelPrevSkin_f
address $163
address CG_Viewpos_f
address $164
address CG_ScoresDown_f
address $165
address CG_ScoresUp_f
address $166
address CG_SizeUp_f
address $167
address CG_SizeDown_f
address $168
address CG_NextWeapon_f
address $169
address CG_PrevWeapon_f
address $170
address CG_Weapon_f
address $171
address CG_TellTarget_f
address $172
address CG_TellAttacker_f
address $173
address CG_TargetCommand_f
address $174
address CG_TestPS_f
address $175
address CG_DestroyTestPS_f
address $176
address CG_TestTS_f
address $177
address CG_DestroyTestTS_f
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 28 8
line 206
;164:
;165:typedef struct
;166:{
;167:  char  *cmd;
;168:  void  (*function)( void );
;169:} consoleCommand_t;
;170:
;171:static consoleCommand_t commands[ ] =
;172:{
;173:  { "testgun", CG_TestGun_f },
;174:  { "testmodel", CG_TestModel_f },
;175:  { "nextframe", CG_TestModelNextFrame_f },
;176:  { "prevframe", CG_TestModelPrevFrame_f },
;177:  { "nextskin", CG_TestModelNextSkin_f },
;178:  { "prevskin", CG_TestModelPrevSkin_f },
;179:  { "viewpos", CG_Viewpos_f },
;180:  { "+scores", CG_ScoresDown_f },
;181:  { "-scores", CG_ScoresUp_f },
;182:  { "sizeup", CG_SizeUp_f },
;183:  { "sizedown", CG_SizeDown_f },
;184:  { "weapnext", CG_NextWeapon_f },
;185:  { "weapprev", CG_PrevWeapon_f },
;186:  { "weapon", CG_Weapon_f },
;187:  { "tell_target", CG_TellTarget_f },
;188:  { "tell_attacker", CG_TellAttacker_f },
;189:  { "tcmd", CG_TargetCommand_f },
;190:  { "testPS", CG_TestPS_f },
;191:  { "destroyTestPS", CG_DestroyTestPS_f },
;192:  { "testTS", CG_TestTS_f },
;193:  { "destroyTestTS", CG_DestroyTestTS_f },
;194:};
;195:
;196:
;197:/*
;198:=================
;199:CG_ConsoleCommand
;200:
;201:The string has been tokenized and can be retrieved with
;202:Cmd_Argc() / Cmd_Argv()
;203:=================
;204:*/
;205:qboolean CG_ConsoleCommand( void )
;206:{
line 211
;207:  const char  *cmd;
;208:  const char  *arg1;
;209:  int         i;
;210:
;211:  cmd = CG_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 214
;212:
;213:  //TA: ugly hacky special case
;214:  if( !Q_stricmp( cmd, "ui_menu" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $179
line 215
;215:  {
line 216
;216:    arg1 = CG_Argv( 1 );
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 217
;217:    trap_SendConsoleCommand( va( "menu %s\n", arg1 ) );
ADDRGP4 $182
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 218
;218:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $178
JUMPV
LABELV $179
line 221
;219:  }
;220:
;221:  for( i = 0; i < sizeof( commands ) / sizeof( commands[ 0 ] ); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 222
;222:  {
line 223
;223:    if( !Q_stricmp( cmd, commands[ i ].cmd ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $187
line 224
;224:    {
line 225
;225:      commands[ i ].function( );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 226
;226:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $178
JUMPV
LABELV $187
line 228
;227:    }
;228:  }
LABELV $184
line 221
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $183
line 230
;229:
;230:  return qfalse;
CNSTI4 0
RETI4
LABELV $178
endproc CG_ConsoleCommand 28 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 243
;231:}
;232:
;233:
;234:/*
;235:=================
;236:CG_InitConsoleCommands
;237:
;238:Let the client system know about all of our commands
;239:so it can perform tab completion
;240:=================
;241:*/
;242:void CG_InitConsoleCommands( void )
;243:{
line 246
;244:  int   i;
;245:
;246:  for( i = 0 ; i < sizeof( commands ) / sizeof( commands[ 0 ] ) ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $194
JUMPV
LABELV $191
line 247
;247:    trap_AddCommand( commands[ i ].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
LABELV $192
line 246
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $194
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $191
line 253
;248:
;249:  //
;250:  // the game server will interpret these commands, which will be automatically
;251:  // forwarded to the server after they are not recognized locally
;252:  //
;253:  trap_AddCommand( "kill" );
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 254
;254:  trap_AddCommand( "say" );
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 255
;255:  trap_AddCommand( "say_team" );
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 256
;256:  trap_AddCommand( "tell" );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 257
;257:  trap_AddCommand( "vsay" );
ADDRGP4 $199
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 258
;258:  trap_AddCommand( "vsay_team" );
ADDRGP4 $200
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 259
;259:  trap_AddCommand( "vtell" );
ADDRGP4 $201
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 260
;260:  trap_AddCommand( "vtaunt" );
ADDRGP4 $202
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 261
;261:  trap_AddCommand( "vosay" );
ADDRGP4 $203
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 262
;262:  trap_AddCommand( "vosay_team" );
ADDRGP4 $204
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 263
;263:  trap_AddCommand( "votell" );
ADDRGP4 $205
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 264
;264:  trap_AddCommand( "give" );
ADDRGP4 $206
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 265
;265:  trap_AddCommand( "god" );
ADDRGP4 $207
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 266
;266:  trap_AddCommand( "notarget" );
ADDRGP4 $208
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 267
;267:  trap_AddCommand( "noclip" );
ADDRGP4 $209
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 268
;268:  trap_AddCommand( "team" );
ADDRGP4 $210
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 269
;269:  trap_AddCommand( "follow" );
ADDRGP4 $211
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 270
;270:  trap_AddCommand( "levelshot" );
ADDRGP4 $212
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 271
;271:  trap_AddCommand( "addbot" );
ADDRGP4 $213
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 272
;272:  trap_AddCommand( "setviewpos" );
ADDRGP4 $214
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 273
;273:  trap_AddCommand( "callvote" );
ADDRGP4 $215
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 274
;274:  trap_AddCommand( "vote" );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 275
;275:  trap_AddCommand( "callteamvote" );
ADDRGP4 $217
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 276
;276:  trap_AddCommand( "teamvote" );
ADDRGP4 $218
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 277
;277:  trap_AddCommand( "stats" );
ADDRGP4 $219
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 278
;278:  trap_AddCommand( "teamtask" );
ADDRGP4 $220
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 279
;279:  trap_AddCommand( "class" );
ADDRGP4 $221
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 280
;280:  trap_AddCommand( "build" );
ADDRGP4 $222
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 281
;281:  trap_AddCommand( "buy" );
ADDRGP4 $223
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 282
;282:  trap_AddCommand( "sell" );
ADDRGP4 $224
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 283
;283:  trap_AddCommand( "reload" );
ADDRGP4 $225
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 284
;284:  trap_AddCommand( "itemact" );
ADDRGP4 $226
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 285
;285:  trap_AddCommand( "itemdeact" );
ADDRGP4 $227
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 286
;286:  trap_AddCommand( "itemtoggle" );
ADDRGP4 $228
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 287
;287:  trap_AddCommand( "destroy" );
ADDRGP4 $229
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 288
;288:  trap_AddCommand( "deconstruct" );
ADDRGP4 $230
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 289
;289:  trap_AddCommand( "menu" );
ADDRGP4 $231
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 290
;290:  trap_AddCommand( "ui_menu" );
ADDRGP4 $181
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 291
;291:  trap_AddCommand( "mapRotation" );
ADDRGP4 $232
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 292
;292:  trap_AddCommand( "stopMapRotation" );
ADDRGP4 $233
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 293
;293:  trap_AddCommand( "alienWin" );
ADDRGP4 $234
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 294
;294:  trap_AddCommand( "humanWin" );
ADDRGP4 $235
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 295
;295:}
LABELV $190
endproc CG_InitConsoleCommands 4 4
import trap_GetDemoName
import trap_GetDemoPos
import trap_GetDemoState
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBiSphereTrace
import trap_CM_BiSphereTrace
import trap_CM_TransformedCapsuleTrace
import trap_CM_CapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_LiteralArgs
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_TutorialText
import CG_WritePTRCode
import CG_ReadPTRCode
import CG_DestroyTestTS_f
import CG_TestTS_f
import CG_AddTrails
import CG_IsTrailSystemValid
import CG_DestroyTrailSystem
import CG_SpawnNewTrailSystem
import CG_RegisterTrailSystem
import CG_LoadTrailSystems
import CG_DestroyTestPS_f
import CG_TestPS_f
import CG_ParticleSystemEntity
import CG_AddParticles
import CG_SetParticleSystemNormal
import CG_IsParticleSystemValid
import CG_IsParticleSystemInfinite
import CG_DestroyParticleSystem
import CG_SpawnNewParticleSystem
import CG_RegisterParticleSystem
import CG_LoadParticleSystems
import CG_SetAttachmentOffset
import CG_SetAttachmentParticle
import CG_SetAttachmentTag
import CG_SetAttachmentCent
import CG_SetAttachmentPoint
import CG_AttachToParticle
import CG_AttachToTag
import CG_AttachToCent
import CG_AttachToPoint
import CG_Attached
import CG_AttachmentCentNum
import CG_AttachmentVelocity
import CG_AttachmentAxis
import CG_AttachmentDir
import CG_AttachmentPoint
import CG_DefragmentMemory
import CG_Free
import CG_Alloc
import CG_InitMemory
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_ProcessSnapshots
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_AlienSense
import CG_Scanner
import CG_UpdateEntityPositions
import CG_DrawItemSelectText
import CG_DrawItemSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_ShotgunFire
import CG_Bullet
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterWeapon
import CG_InitWeapons
import CG_RegisterUpgrade
import CG_InitUpgrades
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_DrawBoundingBox
import CG_PainEvent
import CG_EntityEvent
import CG_CheckEvents
import CG_PredictPlayerState
import CG_BiSphereTrace
import CG_CapTrace
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_ModelDoor
import CG_AnimMapObj
import CG_RunLerpFrame
import CG_AlienBuildableExplosion
import CG_HumanBuildableExplosion
import CG_InitBuildables
import CG_Buildable
import CG_GhostBuildable
import CG_AtHighestClass
import CG_Bleed
import CG_PlayerOnFire
import CG_PlayerDisconnect
import CG_CustomSound
import CG_PrecacheClientInfo
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Corpse
import CG_Player
import CG_ResetPainBlend
import CG_UpdateMediaFraction
import CG_DrawLoadingScreen
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_RunMenuScript
import CG_GetValue
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawActive
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawFadePic
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawPlane
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_addSmoothOp
import CG_AddNotifyText
import CG_RemoveNotifyLine
import CG_FileExists
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_PlayerCount
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugRandom
import ui_humanTeamVoteActive
import ui_alienTeamVoteActive
import ui_voteActive
import ui_loading
import ui_dialog
import ui_stages
import ui_carriage
import ui_currentClass
import cg_painBlendZoom
import cg_painBlendScale
import cg_painBlendMax
import cg_painBlendDownRate
import cg_painBlendUpRate
import cg_tutorial
import cg_disableScannerPlane
import cg_disableWarningDialogs
import cg_debugPVS
import cg_debugTrails
import cg_debugParticles
import cg_lightFlare
import cg_consoleLatency
import cg_depthSortParticles
import cg_wwToggle
import cg_wwFollow
import cg_wwSmoothTime
import cg_debugAlloc
import cg_drawBBOX
import cg_drawSurfNormal
import cg_creepRes
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonhax
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRangehax
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_debugMove
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_teslaTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawDemoState
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_buildables
import cg_upgrades
import cg_weapons
import cg_entities
import cg
import cgs
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
import Com_Printf
import Com_Error
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
LABELV $235
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $234
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $233
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $232
byte 1 109
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $231
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $230
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $229
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $228
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $227
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 100
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $226
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 97
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $225
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $224
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $223
byte 1 98
byte 1 117
byte 1 121
byte 1 0
align 1
LABELV $222
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $221
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $220
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $219
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $218
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $217
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $216
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $212
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $211
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $210
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $209
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $208
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $207
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $206
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $205
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $204
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $203
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $202
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $200
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $199
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $198
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $197
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $196
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $195
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $182
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $177
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $176
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $175
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $174
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $173
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $171
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $170
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $169
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $168
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $166
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $165
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $164
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $162
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $161
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $160
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $110
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
