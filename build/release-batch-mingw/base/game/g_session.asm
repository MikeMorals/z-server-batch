export G_WriteClientSessionData
code
proc G_WriteClientSessionData 24 40
file "..\..\..\..\src/game/g_session.c"
line 44
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
;22: */
;23:
;24:#include "g_local.h"
;25:
;26:
;27:/*
;28:=======================================================================
;29:
;30:  SESSION DATA
;31:
;32:Session data is the only data that stays persistant across level loads
;33:and tournament restarts.
;34:=======================================================================
;35: */
;36:
;37:/*
;38:================
;39:G_WriteClientSessionData
;40:
;41:Called on game shutdown
;42:================
;43: */
;44:void G_WriteClientSessionData(gclient_t *client) {
line 48
;45:  const char *s;
;46:  const char *var;
;47:
;48:  s = va("%i %i %i %i %i %i %i %i %s",
ADDRFP4 0
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_ClientListString
CALLP4
ASGNP4
ADDRGP4 $85
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1124
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1128
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1140
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1148
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 60
;49:          client->sess.sessionTeam,
;50:          client->sess.restartTeam,
;51:          client->sess.spectatorTime,
;52:          client->sess.spectatorState,
;53:          client->sess.spectatorClient,
;54:          client->sess.wins,
;55:          client->sess.losses,
;56:          client->sess.teamLeader,
;57:          BG_ClientListString(&client->sess.ignoreList)
;58:          );
;59:
;60:  var = va("session%i", client - level.clients);
ADDRGP4 $86
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2148
DIVI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 62
;61:
;62:  trap_Cvar_Set(var, s);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 63
;63:}
LABELV $84
endproc G_WriteClientSessionData 24 40
export G_ReadSessionData
proc G_ReadSessionData 1052 48
line 168
;64:/*
;65: ================
;66: G_EvalPlayerLevel
;67: 
;68: evalaute player level
;69: ================
;70: */
;71:/*int G_EvalPlayerLevel(int kills, int deaths)
;72:{
;73:	int i;
;74:	int kdr;
;75:	kdr = (kills/deaths);
;76:	i = 0;
;77:			if ( kills >= 100 && kills < 200 ) {
;78:				i = 1;
;79:			} else if ( kills >= 200 && kills < 500 ) {
;80:				
;81:				i = 2;
;82:				
;83:			} else if ( kills >= 500 && kills < 1000 ) {
;84:				
;85:				i = 3;
;86:				
;87:			} else if ( kills >= 1000 && kills < 5000 ) {
;88:				
;89:				i = 4;
;90:				
;91:			} else if ( kills >= 5000 && kills < 10000 ) {
;92:				
;93:				i = 5;
;94:				
;95:			} else if ( kills >= 10000 && kills < 17000 ) {
;96:				
;97:				i = 6;
;98:				
;99:			} else if ( kills >= 17000 && kills < 25000 ) {
;100:				
;101:				i = 7;
;102:				
;103:			} else if ( kills >= 25000 && kills < 35000 ) {
;104:				
;105:				i = 8;
;106:				
;107:			} else if ( kills >= 35000 && kills < 47000 ) {
;108:				
;109:				i = 9;
;110:				
;111:			} else if ( kills >= 47000 && kills < 62000 ) {
;112:				
;113:				i = 10;
;114:				
;115:			} else if ( kills >= 62000 && kills < 80000 && kdr > 10) {
;116:				
;117:				i = 11;
;118:				
;119:			} else if ( kills >= 80000 && kills < 100000 && kdr > 20 ) {
;120:				
;121:				i = 12;
;122:				
;123:			} else if ( kills >= 100000 && kills < 150000 && kdr > 30 ) {
;124:				
;125:				i = 13;
;126:				
;127:			} else if ( kills >= 210000 && kills < 280000 && kdr > 40 ) {
;128:				
;129:				i = 14;
;130:				
;131:			} else if ( kills >= 280000 && kills < 360000 && kdr > 50 ) {
;132:				
;133:				i = 15;
;134:				
;135:			} else if ( kills >= 360000 && kills < 450000 && kdr > 60 ) {
;136:				
;137:				i = 16;
;138:				
;139:			} else if ( kills >= 450000 && kills < 550000 && kdr > 70 ) {
;140:				
;141:				i = 17;
;142:				
;143:			} else if ( kills >= 670000 && kills < 8000000 && kdr > 80 ) {
;144:				
;145:				i = 18;
;146:				
;147:			} else if ( kills >= 800000 && kills < 10000000 && kdr > 90 ) {
;148:				
;149:				i = 19;
;150:				
;151:			} else if ( kills >= 1000000  && kdr > 100 ) {
;152:				
;153:				i = 20;
;154:				
;155:			} else {
;156:				
;157:				i = 0;
;158:			}
;159:	return i;
;160:}*/
;161:/*
;162:================
;163:G_ReadSessionData
;164:
;165:Called on a reconnect
;166:================
;167: */
;168:void G_ReadSessionData(gclient_t *client) {
line 178
;169:  char s[ MAX_STRING_CHARS ];
;170:  const char *var;
;171:
;172:  // bk001205 - format
;173:  int teamLeader;
;174:  int spectatorState;
;175:  int sessionTeam;
;176:  int restartTeam;
;177:
;178:  var = va("session%i", client - level.clients);
ADDRGP4 $86
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2148
DIVI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1044
INDIRP4
ASGNP4
line 179
;179:  trap_Cvar_VariableStringBuffer(var, s, sizeof (s));
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 183
;180:
;181:  // FIXME: should be using BG_ClientListParse() for ignoreList, but
;182:  //        bg_lib.c's sscanf() currently lacks %s
;183:  sscanf(s, "%i %i %i %i %i %i %i %i %x%x",
ADDRLP4 0
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 1128
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1048
INDIRP4
CNSTI4 1136
ADDP4
ARGP4
ADDRLP4 1048
INDIRP4
CNSTI4 1140
ADDP4
ARGP4
ADDRLP4 1048
INDIRP4
CNSTI4 1144
ADDP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1048
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 1048
INDIRP4
CNSTI4 1156
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 196
;184:          &sessionTeam,
;185:          &restartTeam,
;186:          &client->sess.spectatorTime,
;187:          &spectatorState,
;188:          &client->sess.spectatorClient,
;189:          &client->sess.wins,
;190:          &client->sess.losses,
;191:          &teamLeader,
;192:          &client->sess.ignoreList.hi,
;193:          &client->sess.ignoreList.lo
;194:          );
;195:  // bk001205 - format issues
;196:  client->sess.sessionTeam = (team_t) sessionTeam;
ADDRFP4 0
INDIRP4
CNSTI4 1120
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 197
;197:  client->sess.restartTeam = (pTeam_t) restartTeam;
ADDRFP4 0
INDIRP4
CNSTI4 1124
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 198
;198:  client->sess.spectatorState = (spectatorState_t) spectatorState;
ADDRFP4 0
INDIRP4
CNSTI4 1132
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 199
;199:  client->sess.teamLeader = (qboolean) teamLeader;
ADDRFP4 0
INDIRP4
CNSTI4 1148
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 200
;200:}
LABELV $87
endproc G_ReadSessionData 1052 48
export G_InitSessionData
proc G_InitSessionData 12 12
line 209
;201:
;202:/*
;203:================
;204:G_InitSessionData
;205:
;206:Called on a first-time connect
;207:================
;208: */
;209:void G_InitSessionData(gclient_t *client, char *userinfo) {
line 213
;210:  clientSession_t *sess;
;211:  const char *value;
;212:
;213:  sess = &client->sess;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1120
ADDP4
ASGNP4
line 216
;214:
;215:  // initial team determination
;216:  value = Info_ValueForKey(userinfo, "team");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 217
;217:  if (value[ 0 ] == 's') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $91
line 219
;218:    // a willing spectator, not a waiting-in-line
;219:    sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 220
;220:  } else {
ADDRGP4 $92
JUMPV
LABELV $91
line 221
;221:    if (g_maxGameClients.integer > 0 &&
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $93
ADDRGP4 level+173944
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $93
line 223
;222:            level.numNonSpectatorClients >= g_maxGameClients.integer)
;223:      sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $93
line 225
;224:    else
;225:      sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $94
line 226
;226:  }
LABELV $92
line 228
;227:
;228:  sess->restartTeam = PTE_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 229
;229:  sess->spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 230
;230:  sess->spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 231
;231:  sess->spectatorClient = -1;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 -1
ASGNI4
line 232
;232:  memset(&sess->ignoreList, 0, sizeof ( sess->ignoreList));
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRGP4 memset
CALLP4
pop
line 234
;233:
;234:  G_WriteClientSessionData(client);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 235
;235:}
LABELV $89
endproc G_InitSessionData 12 12
export G_WriteSessionData
proc G_WriteSessionData 1368 44
line 243
;236:
;237:/*
;238:==================
;239:G_WriteSessionData
;240:
;241:==================
;242: */
;243:void G_WriteSessionData(void) {
line 247
;244:  char map[ MAX_STRING_CHARS ];
;245:  int i;
;246:  //int record = 0;
;247:  int gameid = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 252
;248:	int j;
;249:	
;250:  char data[ 255 ];
;251:
;252:  trap_Cvar_VariableStringBuffer("mapname", map, sizeof ( map));
ADDRGP4 $100
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 254
;253:  //TA: ?
;254:  trap_Cvar_Set("session", va("%i", 0));
ADDRGP4 $102
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1292
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $101
ARGP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 256
;255:  
;256:	trap_SendServerCommand( -1, "print \"^2Syncing with database\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 257
;257:	for( i = 0 ; i < level.maxclients ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $104
line 258
;258:	{
line 259
;259:		if( level.clients[ i ].pers.connected == CON_CONNECTED )
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $109
line 260
;260:		{
line 261
;261:			G_WriteClientSessionData( &level.clients[ i ] );
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 263
;262:			//Update mysql stuff here to.
;263:			if(level.clients[ i ].pers.mysqlid > 1)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 1
LEI4 $111
line 264
;264:			{
line 266
;265:				//level.clients[ i ].pers.playerlevel = G_EvalPlayerLevel( (level.clients[ i ].pers.statscounters.kills + level.clients[ i ].pers.totalkills), (level.clients[ i ].pers.statscounters.deaths + level.clients[ i ].pers.totaldeaths));
;266:				if (!level.clients[ i ].pers.playerlevel)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
NEI4 $113
line 267
;267:					level.clients[ i ].pers.playerlevel= 0;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
LABELV $113
line 268
;268:				level.clients[ i ].pers.timeplayed += (level.time - level.clients[ i ].pers.enterTime) / 60000; //Minutes played
ADDRLP4 1296
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1300
ADDRLP4 1296
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
ADDRLP4 1300
INDIRP4
ADDRLP4 1300
INDIRP4
INDIRI4
ADDRGP4 level+28
INDIRI4
ADDRLP4 1296
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ADDI4
ASGNI4
line 269
;269:				level.clients[ i ].pers.structsbuilt += level.clients[ i ].pers.statscounters.structsbuilt;
ADDRLP4 1304
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1308
ADDRLP4 1304
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 1308
INDIRP4
ADDRLP4 1308
INDIRP4
INDIRI4
ADDRLP4 1304
INDIRP4
CNSTI4 1076
ADDP4
INDIRI2
CVII4 2
ADDI4
ASGNI4
line 271
;270:				//level.clients[ i ].pers.structskilled += level.clients[ i ].pers.statscounters.structskilled; don't count anything but nodes
;271:				if(level.clients[ i ].pers.teamSelection == PTE_HUMANS)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $116
line 272
;272:				{
line 273
;273:					level.clients[ i ].pers.credits+=level.clients[ i ].ps.persistant[ PERS_CREDIT ];
ADDRLP4 1312
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1316
ADDRLP4 1312
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 1316
INDIRP4
ADDRLP4 1316
INDIRP4
INDIRI4
ADDRLP4 1312
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDI4
ASGNI4
line 274
;274:				}
LABELV $116
line 275
;275:				if(level.clients[ i ].pers.teamSelection == PTE_ALIENS)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $118
line 276
;276:				{
line 277
;277:					level.clients[ i ].pers.evos = 0;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 278
;278:				}
LABELV $118
line 281
;279:				
;280:				/* Badge related stuff */
;281:				if(level.clients[ i ].pers.teamSelection == level.lastWin)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+189264
INDIRI4
NEI4 $120
line 282
;282:				{
line 283
;283:					level.clients[ i ].pers.gameswin += 1;
ADDRLP4 1312
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 888
ADDP4
ASGNP4
ADDRLP4 1312
INDIRP4
ADDRLP4 1312
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 284
;284:				}
LABELV $120
line 287
;285:				/************************IF MAZE for BADGES************************************/
;286:				//16 Zombie Bait		Die 200 times
;287:				if ( (level.clients[ i ].pers.badges[ 16 ] != 1) && ((level.clients[ i ].pers.totaldeaths + level.clients[ i ].pers.statscounters.deaths) >= 200) )
ADDRLP4 1312
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1312
INDIRP4
CNSTI4 788
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $123
ADDRLP4 1312
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ADDRLP4 1312
INDIRP4
CNSTI4 1054
ADDP4
INDIRI2
CVII4 2
ADDI4
CNSTI4 200
LTI4 $123
line 288
;288:				{
line 289
;289:					level.clients[ i ].pers.badgeupdate[16] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 838
ADDP4
CNSTI1 1
ASGNI1
line 290
;290:					level.clients[ i ].pers.badges[16] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 788
ADDP4
CNSTI1 1
ASGNI1
line 291
;291:				}
LABELV $123
line 293
;292:				//17 Champion			Win 500 games	
;293:				if ( (level.clients[ i ].pers.badges[ 17 ] != 1) && (level.clients[ i ].pers.gameswin >= 500) )
ADDRLP4 1316
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1316
INDIRP4
CNSTI4 789
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $125
ADDRLP4 1316
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 500
LTI4 $125
line 294
;294:				{
line 295
;295:					level.clients[ i ].pers.badgeupdate[17] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 839
ADDP4
CNSTI1 1
ASGNI1
line 296
;296:					level.clients[ i ].pers.badges[17] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 789
ADDP4
CNSTI1 1
ASGNI1
line 297
;297:				}
LABELV $125
line 299
;298:				//19 Axe Me a Question			Only get axe kills for an entire round	
;299:				if ( (level.clients[ i ].pers.badges[ 19 ] != 1) && (level.clients[ i ].pers.statscounters.kills > 0) && (level.clients[ i ].pers.statscounters.kills == level.clients[ i ].pers.axekills) )
ADDRLP4 1320
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI4 791
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $127
ADDRLP4 1324
ADDRLP4 1320
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
LEI4 $127
ADDRLP4 1324
INDIRI4
ADDRLP4 1320
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
NEI4 $127
line 300
;300:				{
line 301
;301:					level.clients[ i ].pers.badgeupdate[19] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 841
ADDP4
CNSTI1 1
ASGNI1
line 302
;302:					level.clients[ i ].pers.badges[19] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 791
ADDP4
CNSTI1 1
ASGNI1
line 303
;303:				}
LABELV $127
line 305
;304:				//26 Eradication			Kill 200 zombie nodes	
;305:				if ( (level.clients[ i ].pers.badges[ 26 ] != 1) && (level.clients[ i ].pers.structskilled >= 200) )
ADDRLP4 1328
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1328
INDIRP4
CNSTI4 798
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $129
ADDRLP4 1328
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 200
LTI4 $129
line 306
;306:				{
line 307
;307:					level.clients[ i ].pers.badgeupdate[26] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 848
ADDP4
CNSTI1 1
ASGNI1
line 308
;308:					level.clients[ i ].pers.badges[26] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 798
ADDP4
CNSTI1 1
ASGNI1
line 309
;309:				}
LABELV $129
line 311
;310:				//30 Wingman			Get 200 assists in one round	
;311:				if ( (level.clients[ i ].pers.badges[ 30 ] != 1) && (level.clients[ i ].pers.statscounters.assists >= 200) )
ADDRLP4 1332
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1332
INDIRP4
CNSTI4 802
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $131
ADDRLP4 1332
INDIRP4
CNSTI4 1060
ADDP4
INDIRI2
CVII4 2
CNSTI4 200
LTI4 $131
line 312
;312:				{
line 313
;313:					level.clients[ i ].pers.badgeupdate[30] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI1 1
ASGNI1
line 314
;314:					level.clients[ i ].pers.badges[30] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 802
ADDP4
CNSTI1 1
ASGNI1
line 315
;315:				}
LABELV $131
line 317
;316:				//31 Humanitarian		Make it the first 10 minutes in a survival round without killing a single zombie	
;317:				if ( (level.clients[ i ].pers.badges[ 31 ] != 1) && (level.time >= 600000) && (level.clients[ i ].pers.statscounters.kills = 0))
ADDRLP4 1336
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1336
INDIRP4
CNSTI4 803
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $133
ADDRGP4 level+28
INDIRI4
CNSTI4 600000
LTI4 $133
ADDRLP4 1340
CNSTI2 0
ASGNI2
ADDRLP4 1336
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 1340
INDIRI2
ASGNI2
ADDRLP4 1340
INDIRI2
CVII4 2
CNSTI4 0
EQI4 $133
line 318
;318:				{
line 319
;319:					level.clients[ i ].pers.badgeupdate[31] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 853
ADDP4
CNSTI1 1
ASGNI1
line 320
;320:					level.clients[ i ].pers.badges[31] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 803
ADDP4
CNSTI1 1
ASGNI1
line 321
;321:				}
LABELV $133
line 323
;322:				//38 Flawless			Make it an entire round without being hurt, and get at least 20 kills (so we know you aren't just hanging around base. =])
;323:				if ((level.clients[ i ].pers.badges[ 38 ] != 1) && (level.clients[ i ].pers.statscounters.kills >= 20) && !level.clients[ i ].pers.lastDamaged) {
ADDRLP4 1344
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1344
INDIRP4
CNSTI4 810
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
EQI4 $136
ADDRLP4 1344
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
CNSTI4 20
LTI4 $136
ADDRLP4 1344
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $136
line 324
;324:					level.clients[ i ].pers.badgeupdate[38] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 860
ADDP4
CNSTI1 1
ASGNI1
line 325
;325:					level.clients[ i ].pers.badges[38] = 1;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 810
ADDP4
CNSTI1 1
ASGNI1
line 326
;326:				}
LABELV $136
line 329
;327:				/*************************************************************/
;328:				//Would be better if i runquery just one time instead of one per client.
;329:				if( trap_mysql_runquery( va("UPDATE zplayers SET kills=\"%d\",deaths=\"%d\",pistolkills=\"%d\",timeplayed=\"%d\",adminlevel=\"%d\",playerlevel=\"%d\",lasttime=NOW(),gameswin=\"%d\",structsbuilt=\"%d\",structskilled=\"%d\" WHERE id=\"%d\" LIMIT 1",(level.clients[ i ].pers.statscounters.kills + level.clients[ i ].pers.totalkills), (level.clients[ i ].pers.statscounters.deaths + level.clients[ i ].pers.totaldeaths), level.clients[ i ].pers.pistolkills, level.clients[ i ].pers.timeplayed, level.clients[ i ].pers.adminlevel, level.clients[ i ].pers.playerlevel, level.clients[ i ].pers.gameswin, level.clients[ i ].pers.structsbuilt, level.clients[ i ].pers.structskilled, level.clients[ i ].pers.mysqlid ) ) == qtrue )
ADDRGP4 $140
ARGP4
ADDRLP4 1348
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1348
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ADDRLP4 1348
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 1054
ADDP4
INDIRI2
CVII4 2
ADDRLP4 1348
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 928
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ARGI4
ADDRLP4 1348
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 1
NEI4 $138
line 330
;330:				{
line 331
;331:					trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 333
;332:					//Lets update the badges. //FIX ME: WTF LOL DOUBLE LOOPED UNECESARY
;333:					for(j=1;j<49;j++)
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $141
line 334
;334:					{
line 335
;335:						if(level.clients[ i ].pers.badgeupdate[j] == 1)
ADDRLP4 4
INDIRI4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 822
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 1
NEI4 $145
line 336
;336:						{
line 337
;337:							if(trap_mysql_runquery( va("INSERT HIGH_PRIORITY INTO zbadges_player (idplayer,idbadge) VALUES (\"%d\",\"%d\")", level.clients[ i ].pers.mysqlid, j ) ) == qtrue)
ADDRGP4 $149
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1360
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 1
NEI4 $147
line 338
;338:							{
line 339
;339:								trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 340
;340:							}
ADDRGP4 $148
JUMPV
LABELV $147
line 342
;341:							else
;342:							{
line 343
;343:								trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 344
;344:							}
LABELV $148
line 345
;345:						}
LABELV $145
line 346
;346:					}
LABELV $142
line 333
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 49
LTI4 $141
line 347
;347:				}
ADDRGP4 $139
JUMPV
LABELV $138
line 349
;348:				else
;349:				{
line 350
;350:					trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 351
;351:				}
LABELV $139
line 352
;352:			}
LABELV $111
line 353
;353:		}
LABELV $109
line 354
;354:	}
LABELV $105
line 257
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $107
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $104
line 355
;355:	trap_SendServerCommand( -1, "print \"^5Data updated\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 358
;356:	
;357:  
;358:  if(g_survival.integer && level.survivalRecordsBroke[0] > 0 && level.survivalRecordTime > 0 && !level.mysqlupdated)
ADDRLP4 1296
CNSTI4 0
ASGNI4
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 1296
INDIRI4
EQI4 $151
ADDRGP4 level+64
INDIRI4
ADDRLP4 1296
INDIRI4
LEI4 $151
ADDRGP4 level+76
INDIRI4
ADDRLP4 1296
INDIRI4
LEI4 $151
ADDRGP4 level+80
INDIRI4
ADDRLP4 1296
INDIRI4
NEI4 $151
line 359
;359:  {
line 360
;360:    if(trap_mysql_runquery(va("INSERT HIGH_PRIORITY INTO zgames (map,time) VALUES (\"%s\",\"%d\")",
ADDRGP4 $159
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1304
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 1
NEI4 $157
line 362
;361:      map, level.survivalRecordTime)) == qtrue)
;362:      {
line 363
;363:        trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 364
;364:        if(trap_mysql_runquery("SELECT id FROM zgames ORDER BY id desc LIMIT 1") == qtrue)
ADDRGP4 $163
ARGP4
ADDRLP4 1308
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 1
NEI4 $161
line 365
;365:        {
line 366
;366:          if(trap_mysql_fetchrow() == qtrue)
ADDRLP4 1312
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 1
NEI4 $164
line 367
;367:          {
line 368
;368:            trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $166
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 369
;369:            gameid = atoi(data);
ADDRLP4 1036
ARGP4
ADDRLP4 1316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1316
INDIRI4
ASGNI4
line 370
;370:          }
LABELV $164
line 371
;371:        }
LABELV $161
line 372
;372:      }
LABELV $157
line 373
;373:      trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 374
;374:  }
LABELV $151
line 378
;375:  
;376:  //trap_SendServerCommand( -1, va("print \"^5Game id: %d\n\"",gameid) );
;377:
;378:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 379
;379:    if (level.clients[ i ].pers.connected == CON_CONNECTED)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $172
line 380
;380:      G_WriteClientSessionData(&level.clients[ i ]);
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
LABELV $172
line 381
;381:      if(!g_survival.integer) continue;
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
NEI4 $174
ADDRGP4 $168
JUMPV
LABELV $174
line 382
;382:      if(level.clients[i].pers.mysqlid > 0 && gameid > 0 && !level.mysqlupdated)
ADDRLP4 1300
CNSTI4 0
ASGNI4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 1300
INDIRI4
LEI4 $177
ADDRLP4 8
INDIRI4
ADDRLP4 1300
INDIRI4
LEI4 $177
ADDRGP4 level+80
INDIRI4
ADDRLP4 1300
INDIRI4
NEI4 $177
line 383
;383:      {
line 384
;384:        if(trap_mysql_runquery(va("UPDATE zplayers set lasttime=NOW() WHERE id = \"%d\" LIMIT 1",
ADDRGP4 $182
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 1
NEI4 $180
line 386
;385:          level.clients[i].pers.mysqlid)) == qtrue)
;386:        {
line 388
;387:         // trap_SendServerCommand( -1, va("print \"^5Update player date %d\n\"",gameid) );
;388:          trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 389
;389:        }
LABELV $180
line 390
;390:        if(trap_mysql_runquery(va("INSERT HIGH_PRIORITY INTO zplayers_game (idgame,idplayer,timealive) VALUES (%d,%d,%d)",
ADDRGP4 $185
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1312
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1312
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 1312
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1316
INDIRP4
ARGP4
ADDRLP4 1320
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 1
NEI4 $183
line 392
;391:        gameid, level.clients[i].pers.mysqlid, level.clients[i].pers.lastdeadtime)) == qtrue)
;392:        {
line 394
;393:          //trap_SendServerCommand( -1, va("print \"^5Insert players_game relation %d\n\"",gameid) );
;394:          trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 395
;395:        }
LABELV $183
line 396
;396:      }
LABELV $177
line 397
;397:  }
LABELV $168
line 378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $167
line 399
;398:  
;399:  if(g_survival.integer && level.survivalRecordTime > 0 && !level.mysqlupdated)
ADDRLP4 1300
CNSTI4 0
ASGNI4
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 1300
INDIRI4
EQI4 $186
ADDRGP4 level+76
INDIRI4
ADDRLP4 1300
INDIRI4
LEI4 $186
ADDRGP4 level+80
INDIRI4
ADDRLP4 1300
INDIRI4
NEI4 $186
line 400
;400:  {
line 401
;401:    trap_SendServerCommand( -1, "print \"^5Records stored on the server.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 402
;402:  }
LABELV $186
line 403
;403:  level.mysqlupdated = 1;
ADDRGP4 level+80
CNSTI4 1
ASGNI4
line 404
;404:}
LABELV $99
endproc G_WriteSessionData 1368 44
export G_WinBadge
proc G_WinBadge 4 8
line 407
;405:
;406:void G_WinBadge( gentity_t *ent, int id )
;407:{
line 409
;408:	//trap_SendServerCommand( ent-g_entities, "print \"^3You have win a new Badge\ntype !badges for more information\n\"" );
;409:	trap_SendServerCommand( ent-g_entities, "print \"^7You won the badge: \"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $194
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 410
;410:	switch(id)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $195
ADDRLP4 0
INDIRI4
CNSTI4 39
GTI4 $195
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $275-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $275
address $197
address $199
address $201
address $203
address $205
address $207
address $209
address $211
address $213
address $215
address $217
address $219
address $221
address $223
address $225
address $227
address $229
address $231
address $233
address $235
address $237
address $239
address $241
address $243
address $245
address $247
address $249
address $251
address $253
address $255
address $257
address $259
address $261
address $263
address $265
address $267
address $269
address $271
address $273
code
line 411
;411:	{
LABELV $197
line 413
;412:		case 1:
;413:			trap_SendServerCommand( ent-g_entities, "print \"^3[Get Your Hands Dirty] Kill your first zombie.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $198
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 414
;414:			break;
ADDRGP4 $196
JUMPV
LABELV $199
line 416
;415:		case 2:
;416:			trap_SendServerCommand( ent-g_entities, "print \"^3[Pro Sniper] Get 200 headshots in a single game.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $200
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 417
;417:			break;
ADDRGP4 $196
JUMPV
LABELV $201
line 419
;418:		case 3:
;419:			trap_SendServerCommand( ent-g_entities, "print \"^3[Sucks TuBe You] Get 12 kills in a single normal grenade launcher shot.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $202
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 420
;420:			break;
ADDRGP4 $196
JUMPV
LABELV $203
line 422
;421:		case 4:
;422:			trap_SendServerCommand( ent-g_entities, "print \"^3[Bloodbath] Get 1000 kills in a single survival round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $204
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 423
;423:			break;
ADDRGP4 $196
JUMPV
LABELV $205
line 425
;424:		case 5:
;425:			trap_SendServerCommand( ent-g_entities, "print \"^3[Laser Sight] Get 300 kills in a row with the laser gun.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $206
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 426
;426:			break;
ADDRGP4 $196
JUMPV
LABELV $207
line 428
;427:		case 6:
;428:			trap_SendServerCommand( ent-g_entities, "print \"^3[First Blood] Get the first kill in a survival round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $208
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 429
;429:			break;
ADDRGP4 $196
JUMPV
LABELV $209
line 431
;430:		case 7:
;431:			trap_SendServerCommand( ent-g_entities, "print \"^3[Jump Shot] Kill an enemy from the sky, without using any explosives or the lasergun.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $210
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 432
;432:			break;
ADDRGP4 $196
JUMPV
LABELV $211
line 434
;433:		case 8:
;434:			trap_SendServerCommand( ent-g_entities, "print \"^3[Trap Shoot] Kill an enemy with a shotgun while they are in the air.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $212
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 435
;435:			break;
ADDRGP4 $196
JUMPV
LABELV $213
line 437
;436:		case 9:
;437:			trap_SendServerCommand( ent-g_entities, "print \"^3[Holey Zombies] Fill 50 zombies with holes from a single chaingun clip.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $214
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 438
;438:			break;
ADDRGP4 $196
JUMPV
LABELV $215
line 440
;439:		case 10:
;440:			trap_SendServerCommand( ent-g_entities, "print \"^3[Public Enemy No.1] Get 100 Tommy Gun kills in one round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 441
;441:			break;
ADDRGP4 $196
JUMPV
LABELV $217
line 443
;442:		case 11:
;443:			trap_SendServerCommand( ent-g_entities, "print \"^3[Gunslinger] Get 1,000 pistol kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $218
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 444
;444:			break;
ADDRGP4 $196
JUMPV
LABELV $219
line 446
;445:		case 12:
;446:			trap_SendServerCommand( ent-g_entities, "print \"^3[Survivor] Get 1,000 kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $220
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 447
;447:			break;
ADDRGP4 $196
JUMPV
LABELV $221
line 449
;448:		case 13:
;449:			trap_SendServerCommand( ent-g_entities, "print \"^3[Killer] Get 10,000 kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $222
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 450
;450:			break;
ADDRGP4 $196
JUMPV
LABELV $223
line 452
;451:		case 14:
;452:			trap_SendServerCommand( ent-g_entities, "print \"^3[Deadly] Get 100,000 kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $224
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 453
;453:			break;
ADDRGP4 $196
JUMPV
LABELV $225
line 455
;454:		case 15:
;455:			trap_SendServerCommand( ent-g_entities, "print \"^3[Exterminator] Get 1,000,000 kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 456
;456:			break;
ADDRGP4 $196
JUMPV
LABELV $227
line 458
;457:		case 16:
;458:			trap_SendServerCommand( ent-g_entities, "print \"^3[Zombie Bait] Die 200 times.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 459
;459:			break;
ADDRGP4 $196
JUMPV
LABELV $229
line 461
;460:		case 17:
;461:			trap_SendServerCommand( ent-g_entities, "print \"^3[Champion] Win 500 rounds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $230
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 462
;462:			break;
ADDRGP4 $196
JUMPV
LABELV $231
line 464
;463:		case 18:
;464:			trap_SendServerCommand( ent-g_entities, "print \"^3[Seen the Light] Go down to 1 hp then recover to at least 75.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 465
;465:			break;
ADDRGP4 $196
JUMPV
LABELV $233
line 467
;466:		case 19:
;467:			trap_SendServerCommand( ent-g_entities, "print \"^3[Axe Me a Question] Only get axe kills for an entire round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $234
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 468
;468:			break;
ADDRGP4 $196
JUMPV
LABELV $235
line 470
;469:		case 20:
;470:			trap_SendServerCommand( ent-g_entities, "print \"^3[Multikill] Get 5 Mass Driver kills in one shot.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $236
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 471
;471:			break;
ADDRGP4 $196
JUMPV
LABELV $237
line 473
;472:		case 21:
;473:			trap_SendServerCommand( ent-g_entities, "print \"^3[Rocket Launched] Knock 5 enemies off the ground, killing them, with the rocket launcher.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 474
;474:			break;
ADDRGP4 $196
JUMPV
LABELV $239
line 476
;475:		case 22:
;476:			trap_SendServerCommand( ent-g_entities, "print \"^3[It Went Boom!] Kill 10 enemies with one grenade.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $240
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 477
;477:			break;
ADDRGP4 $196
JUMPV
LABELV $241
line 479
;478:		case 23:
;479:			trap_SendServerCommand( ent-g_entities, "print \"^3[Minefield] Kill 50 enemies with mines in one round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 480
;480:			break;
ADDRGP4 $196
JUMPV
LABELV $243
line 482
;481:		case 24:
;482:			trap_SendServerCommand( ent-g_entities, "print \"^3[Burn Baby Burn!] Light 7 zombies on fire with one incendiary round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 483
;483:			break;
ADDRGP4 $196
JUMPV
LABELV $245
line 485
;484:		case 25:
;485:			trap_SendServerCommand( ent-g_entities, "print \"^3[Mr. Streaky] Kill at least one zombie every 2 seconds for 2 minutes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 486
;486:			break;
ADDRGP4 $196
JUMPV
LABELV $247
line 488
;487:		case 26:
;488:			trap_SendServerCommand( ent-g_entities, "print \"^3[Eradication] Kill 200 zombie nodes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 489
;489:			break;
ADDRGP4 $196
JUMPV
LABELV $249
line 491
;490:		case 27:
;491:			trap_SendServerCommand( ent-g_entities, "print \"^3[Ultimate Sacrifice] Deploy a medical dome that heals a teammate, dying in the process.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 492
;492:			break;
ADDRGP4 $196
JUMPV
LABELV $251
line 494
;493:		case 28:
;494:			trap_SendServerCommand( ent-g_entities, "print \"^3[Survivalist] Live for 30minutes in a survival round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 495
;495:			break;
ADDRGP4 $196
JUMPV
LABELV $253
line 497
;496:		case 29:
;497:			trap_SendServerCommand( ent-g_entities, "print \"^3[Hands Tied] Make a zombie commit suicide.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 498
;498:			break;
ADDRGP4 $196
JUMPV
LABELV $255
line 500
;499:		case 30:
;500:			trap_SendServerCommand( ent-g_entities, "print \"^3[Wingman] Get 200 assists in one round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $256
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 501
;501:			break;
ADDRGP4 $196
JUMPV
LABELV $257
line 503
;502:		case 31:
;503:			trap_SendServerCommand( ent-g_entities, "print \"^3[Humanitarian] Survive the first 10minutes of a survival round without killing a zombie.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $258
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 504
;504:			break;
ADDRGP4 $196
JUMPV
LABELV $259
line 506
;505:		case 32:
;506:			trap_SendServerCommand( ent-g_entities, "print \"^3[Gibbed] Kill 20+ zombies at once with any weapon.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $260
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 507
;507:			break;
ADDRGP4 $196
JUMPV
LABELV $261
line 509
;508:		case 33:
;509:			trap_SendServerCommand( ent-g_entities, "print \"^3[Tastes Like Chicken] Eat a human.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $262
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 510
;510:			break;
ADDRGP4 $196
JUMPV
LABELV $263
line 512
;511:		case 34:
;512:			trap_SendServerCommand( ent-g_entities, "print \"^3[Fore!] Kill 6 zombies with a thrown axe.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 513
;513:			break;
ADDRGP4 $196
JUMPV
LABELV $265
line 515
;514:		case 35:
;515:			trap_SendServerCommand( ent-g_entities, "print \"^3[Last Man Standing] Make it to 20 minutes and be the last man alive.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 516
;516:			break;
ADDRGP4 $196
JUMPV
LABELV $267
line 518
;517:		case 36:
;518:			trap_SendServerCommand( ent-g_entities, "print \"^3[Guns Blazing] Kill 100 zombies in a row with 20HP or less.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 519
;519:			break;
ADDRGP4 $196
JUMPV
LABELV $269
line 521
;520:		case 37:
;521:			trap_SendServerCommand( ent-g_entities, "print \"^3[Ninja] In survival, don't get touched by a zombie for 5minutes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 522
;522:			break;
ADDRGP4 $196
JUMPV
LABELV $271
line 524
;523:		case 38:
;524:			trap_SendServerCommand( ent-g_entities, "print \"^3[Flawless] Go an entire round without getting hurt, and get at least 20 kills.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $272
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 525
;525:			break;
ADDRGP4 $196
JUMPV
LABELV $273
line 527
;526:		case 39:
;527:			trap_SendServerCommand( ent-g_entities, "print \"^3[Medic] Use 6 medikits on teammates, either domes or heals, in a single round.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 528
;528:			break;
LABELV $195
LABELV $196
line 530
;529:	}
;530:}
LABELV $193
endproc G_WinBadge 4 8
import G_deleteWhite
import G_adminWhitelistGlobal
import G_adminGlobal
import G_whitelistCheck
import G_globalCheck
import G_globalBanCheck
import G_deleteGlobal
import getGlobalTypeString
import G_globalInit
import G_globalAdd
import G_getLongerWhiteName
import G_isValidIpAddress
import G_globalExit
import G_isPlayerConnected
import botSelectEnemy
import botCanSeeEnemy
import botForgetEnemy
import G_healFriend
import G_BotAimAt
import G_printVector
import G_doorInRange
import G_itemInRange
import G_playerInRange
import g_comboPrint
import g_comboClear
import modString
import director_debug
import ace_botsFile
import ace_spSkill
import ace_attackEnemies
import ace_pickShortRangeGoal
import ace_pickLongRangeGoal
import ace_showPath
import ace_showLinks
import ace_showNodes
import ace_debug
import AngleBetweenVectors
import G_KillStructuresSurvival
import spawnItem
import G_itemUse
import G_itemThink
import syrinxSpawn
import selectBetterWay
import drawRedBall
import G_FindRadius
import G_ProjectSource
import pointBehindWall
import spawnGridNode
import convertGridToWorld
import convertWorldToGrid
import fillGrid
import WallInFront
import trap_mysql_reconnect
import trap_mysql_fetchfieldbyName
import trap_mysql_fetchfieldbyID
import trap_mysql_fetchrow
import trap_mysql_finishquery
import trap_mysql_runquery
import trap_SendGameStat
import trap_SnapVector
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_antispawncamp
import mega_wave
import ROTACAK_ambush_kills
import ROTACAK_ambush_stage
import ROTACAK_ambush_rebuild_time_temp
import g_bot_lcannon
import g_bot_flamer
import g_bot_prifle
import g_bot_chaingun
import g_bot_mdriver
import g_bot_lasgun
import g_bot_psaw
import g_bot_shotgun
import g_bot_mgun
import g_bot
import g_ambush_turnangle
import g_ambush_range
import g_ambush_att_buildables
import g_ambush_kill_spawns
import g_ambush
import g_ambush_no_egg_ffoff
import g_ambush_stage_suicide
import g_ambush_sec_to_start
import g_ambush_rebuild_time
import g_ambush_dodge_random
import g_ambush_dodge
import g_ambush_tyrants_to_win
import g_ambush_dragon2_s8
import g_ambush_dragon_s7
import g_ambush_marauder2_s6
import g_ambush_marauder_s5
import g_ambush_basilisk2_s4
import g_ambush_basilisk_s3
import g_ambush_dretch_s2
import g_ambush_granger_s1
import g_buildLogMaxLength
import g_survival
import g_ctncapturetime
import g_ctnbuildlimit
import g_ctn
import g_msgTime
import g_msg
import g_mapvoteMaxTime
import g_voteMinTime
import g_devmapNoStructDmg
import g_devmapNoGod
import g_dretchPunt
import g_antiSpawnBlock
import g_myStats
import g_publicSayadmins
import g_decolourLogfiles
import g_privateMessages
import g_devmapKillerHP
import g_banNotice
import g_minLevelToSpecMM1
import g_forceAutoSelect
import g_minLevelToJoinTeam
import g_adminMapLog
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminSayFilter
import g_adminParseSay
import g_adminLog
import g_admin
import g_layoutAuto
import g_layouts
import g_mapConfigs
import g_shove
import g_floodMinTime
import g_floodMaxDemerits
import g_actionPrefix
import g_chatTeamPrefix
import g_initialMapRotation
import g_nextMap
import g_currentMap
import g_currentMapRotation
import g_debugMapRotation
import g_deconDead
import g_markDeconstruct
import g_disabledBuildables
import g_disabledClasses
import g_disabledEquipment
import g_unlagged
import g_teamImbalanceWarnings
import g_alienStage3Threshold
import g_alienStage2Threshold
import g_alienMaxStage
import g_alienKills
import g_alienStage
import g_humanStage3Threshold
import g_humanStage2Threshold
import g_humanMaxStage
import g_humanKills
import g_humanStage
import g_alienBuildPoints
import g_humanBuildPoints
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_allowShare
import g_rankings
import pmove_msec
import pmove_fixed
import g_clientUpgradeNotice
import g_smoothClients
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_designateVotes
import g_mapVotesPercent
import g_suddenDeathVoteDelay
import g_suddenDeathVotePercent
import g_voteLimit
import g_requireVoteReasons
import g_allowVote
import g_blood
import g_doWarmup
import g_warmupMode
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyBuildableFire
import g_friendlyFireMovementAttacks
import g_retribution
import g_friendlyFireAliens
import g_friendlyFireHumans
import g_friendlyFire
import g_layoutmaking
import g_suddenDeathMode
import g_suddenDeath
import g_suddenDeathTime
import g_timelimit
import g_enterString
import g_newbieNamePrefix
import g_newbieNumbering
import g_maxNameChanges
import g_minNameChangePeriod
import g_minCommandPeriod
import g_lockTeamsAtStart
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_entities
import level
import G_FindConnectionForCode
import G_ResetPTRConnections
import G_GenerateNewConnection
import G_UpdatePTRConnection
import G_GetCurrentMap
import G_MapExists
import G_InitMapRotations
import G_MapRotationActive
import G_StopMapRotation
import G_StartMapRotation
import G_AdvanceMapRotation
import G_PrintRotations
import Svcmd_GameMem_f
import G_DefragmentMemory
import G_Free
import G_InitMemory
import G_Alloc
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_UnlaggedOff
import G_UnlaggedOn
import G_UnlaggedCalc
import G_UnlaggedClear
import G_UnlaggedStore
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Flood_Limited
import CheckMsgTimer
import G_TimeTilSuddenDeath
import LogExit
import CheckTeamVote
import CheckVote
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_AdminsPrintf
import G_LogOnlyPrintf
import G_LogPrintfColoured
import G_LogPrintf
import G_RunThink
import FindIntermissionPoint
import CalculateRanks
import G_MapConfigs
import MoveClientToIntermission
import ScoreboardMessage
import FireWeapon3
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import G_NextNewbieName
import SpotWouldTelefrag
import player_die
import ClientSpawn
import BeginIntermission
import respawn
import SpawnCorpse
import G_SelectHumanLockSpawnPoint
import G_SelectAlienLockSpawnPoint
import G_SelectSpawnPoint
import G_SelectTremulousSpawnPoint
import G_SetClientViewAngle
import TeamCount
import G_AddCreditToClient
import G_UpdateZaps
import ChargeAttack
import CheckPounceAttack
import CheckGrabAttack
import CheckVenomAttack
import SnapVectorTowards
import CalcMuzzlePoint
import G_GiveClientMaxAmmo
import G_ForceWeaponChange
import ShineTorch
import TeleportPlayer
import TeleportZombie
import G_Checktrigger_stages
import trigger_teleporter_touch
import manualTriggerSpectator
import Touch_DoorTrigger
import G_RunMover
import fire_dome
import fire_rocket
import massDriverFire2
import fire_axe
import plant_mine
import launch_grenade_primary
import launch_grenade_secondary
import launch_bomb
import launch_grenade
import fire_hive
import fire_bounceBall
import fire_slowBlob
import fire_paraLockBlob
import fire_lockblob
import fire_luciferCannon
import fire_pulseRifle
import fire_flamer
import G_RunMissile
import G_InitDamageLocations
import AddScore
import body_die
import G_SelectiveRadiusDamage
import G_RadiusDamage
import G_SelectiveDamage
import G_Damage
import CanDamage
import G_ClosestEnt
import G_Visible
import Distance2d
import G_CloseMenus
import G_TriggerMenu
import G_ClientIsLagging
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_BroadcastEvent
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import G_ShaderIndex
import G_ParticleSystemIndex
import G_FindBuildLogName
import G_CountBuildLog
import G_LogBuild
import G_RevertCanFit
import G_CommitRevertedBuildable
import G_SpawnRevertedBuildable
import G_InstantBuild
import G_BaseSelfDestruct
import G_LayoutLoad
import G_LayoutSelect
import G_LayoutList
import G_LayoutSave
import G_CheckDBProtection
import FinishSpawningBuildable
import G_SpawnBuildable
import G_SetIdleBuildableAnim
import G_SetBuildableAnim
import G_BuildIfValid
import G_BuildingExists
import G_CanBuild
import G_ArmoryRange
import G_BuildableRange
import G_BuildableThink
import G_IsOvermindBuilt
import G_IsDCCBuilt
import G_IsPowered
import G_CheckSpawnPoint
import AHovel_Blocked
import G_Physics
import G_CP
import G_WordWrap
import Cmd_Builder_f
import Cmd_TeamVote_f
import Cmd_Donate_f
import Cmd_Share_f
import G_statsString
import G_PrivateMessage
import G_SanitiseString
import G_ChangeTeam
import G_LeaveTeam
import G_ParseEscapedString
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import G_Say
import G_ClientNumbersFromString
import G_MatchOnePlayer
import G_ToggleFollow
import G_FollowNewClient
import G_StopFollowing
import G_StopFromFollowing
import Cmd_Score_f
import botJump
import botCrouch
import botWalk
import botShootIfTargetInRange
import botGetDistanceBetweenPlayer
import botTargetInRange
import botFindClosestEnemy
import botAimAtTarget
import G_BotSpectatorThink
import G_BotThink
import G_BotCmd
import G_BotDel
import G_BotAdd
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import G_GetPosInSpawnQueue
import G_RemoveFromSpawnQueue
import G_PushSpawnQueue
import G_SearchSpawnQueue
import G_PeekSpawnQueue
import G_PopSpawnQueue
import G_GetSpawnQueueLength
import G_InitSpawnQueue
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_mystats
import G_admin_message
import G_badgelist
import G_badges
import G_adminWhiteAdd
import G_adminWhiteDelete
import G_adminWhiteList
import G_adminGlobalSync
import G_adminGlobalBan
import G_adminGlobalHandicap
import G_adminGlobalDenyBuild
import G_adminGlobalForcespec
import G_adminGlobalMute
import G_adminListGlobals
import G_adminDeleteGlobal
import G_setnextnode
import G_drawnodes
import G_reconnectdb
import G_switchnodes
import G_admin_botcmd
import G_admin_bot
import G_set_survival_stage
import G_admin_findpath
import G_admin_printpath
import G_admin_printgrid
import G_admin_switch
import G_admin_cp
import G_admin_designate
import G_admin_warn
import G_admin_putmespec
import G_admin_L1
import G_admin_L0
import G_admin_pause
import G_admin_revert
import G_admin_buildlog
import G_admin_info
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_register
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_denybuild
import G_admin_mute
import G_admin_layoutsave
import G_admin_maplog
import G_admin_maplog_update
import G_admin_devmap
import G_admin_map
import G_admin_listrotation
import G_admin_listmaps
import G_admin_listplayers
import G_admin_listlayouts
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_subnetban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_adminPrintName
import G_admin_set_adminname
import G_admin_level
import G_admin_maplog_result
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
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
LABELV $274
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 93
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 54
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 107
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 101
byte 1 105
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $272
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 70
byte 1 108
byte 1 97
byte 1 119
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 93
byte 1 32
byte 1 71
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $270
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 78
byte 1 105
byte 1 110
byte 1 106
byte 1 97
byte 1 93
byte 1 32
byte 1 73
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 44
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 53
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $268
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 66
byte 1 108
byte 1 97
byte 1 122
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 50
byte 1 48
byte 1 72
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $266
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $264
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 70
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 54
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 120
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $262
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 84
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 76
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 67
byte 1 104
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 110
byte 1 93
byte 1 32
byte 1 69
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $260
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 71
byte 1 105
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 48
byte 1 43
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $258
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 105
byte 1 116
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $256
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 87
byte 1 105
byte 1 110
byte 1 103
byte 1 109
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $254
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $252
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 93
byte 1 32
byte 1 76
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 51
byte 1 48
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $250
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 85
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 83
byte 1 97
byte 1 99
byte 1 114
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 101
byte 1 93
byte 1 32
byte 1 68
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 100
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $248
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 69
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $246
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 77
byte 1 114
byte 1 46
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 121
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 50
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 50
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $244
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 66
byte 1 117
byte 1 114
byte 1 110
byte 1 32
byte 1 66
byte 1 97
byte 1 98
byte 1 121
byte 1 32
byte 1 66
byte 1 117
byte 1 114
byte 1 110
byte 1 33
byte 1 93
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 55
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $242
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $240
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 73
byte 1 116
byte 1 32
byte 1 87
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 111
byte 1 111
byte 1 109
byte 1 33
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $238
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 53
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 109
byte 1 44
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $236
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 53
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $234
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 65
byte 1 120
byte 1 101
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 81
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 120
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $232
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 83
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 93
byte 1 32
byte 1 71
byte 1 111
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 32
byte 1 104
byte 1 112
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 55
byte 1 53
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $230
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 67
byte 1 104
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 32
byte 1 53
byte 1 48
byte 1 48
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $228
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 105
byte 1 116
byte 1 93
byte 1 32
byte 1 68
byte 1 105
byte 1 101
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $226
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $224
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 108
byte 1 121
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $222
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $220
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $218
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $216
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 80
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 46
byte 1 49
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 84
byte 1 111
byte 1 109
byte 1 109
byte 1 121
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $214
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 72
byte 1 111
byte 1 108
byte 1 101
byte 1 121
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 93
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $212
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 84
byte 1 114
byte 1 97
byte 1 112
byte 1 32
byte 1 83
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 105
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $210
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 107
byte 1 121
byte 1 44
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $208
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $206
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 51
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $204
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 98
byte 1 97
byte 1 116
byte 1 104
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $202
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 83
byte 1 117
byte 1 99
byte 1 107
byte 1 115
byte 1 32
byte 1 84
byte 1 117
byte 1 66
byte 1 101
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 50
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $200
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 80
byte 1 114
byte 1 111
byte 1 32
byte 1 83
byte 1 110
byte 1 105
byte 1 112
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $198
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 91
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 68
byte 1 105
byte 1 114
byte 1 116
byte 1 121
byte 1 93
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $194
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $191
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 82
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $185
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 122
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 40
byte 1 105
byte 1 100
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 105
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 44
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 44
byte 1 37
byte 1 100
byte 1 44
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $182
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 122
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 61
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $166
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $163
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 122
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $159
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 122
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 40
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $150
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $149
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 122
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 40
byte 1 105
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 44
byte 1 105
byte 1 100
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $140
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 122
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 61
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 44
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 61
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $103
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $101
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $100
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $88
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 120
byte 1 37
byte 1 120
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $85
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
