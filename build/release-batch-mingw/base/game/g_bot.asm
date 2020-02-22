export G_BotAdd
code
proc G_BotAdd 1196 24
file "..\..\..\..\src/game/g_bot.c"
line 36
;1:/*
;2: ===========================================================================
;3: Copyright (C) 2007 Amine Haddad
;4:
;5: This file is part of Tremulous.
;6:
;7: The original works of vcxzet (lamebot3) were used a guide to create TremBot.
;8:
;9: Tremulous is free software; you can redistribute it
;10: and/or modify it under the terms of the GNU General Public License as
;11: published by the Free Software Foundation; either version 2 of the License,
;12: or (at your option) any later version.
;13:
;14: Tremulous is distributed in the hope that it will be
;15: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;16: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;17: GNU General Public License for more details.
;18:
;19: You should have received a copy of the GNU General Public License
;20: along with Tremulous; if not, write to the Free Software
;21: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;22: ===========================================================================
;23: */
;24:
;25:/* Current version: v0.01 */
;26:
;27:#include "g_local.h"
;28:#include "acebot.h"
;29:
;30:#ifndef RAND_MAX
;31:#define RAND_MAX 32768
;32:#endif
;33:
;34:void
;35:G_BotAdd(char *name, int team, int skill, gentity_t * ent)
;36:{
line 44
;37:  int i;
;38:  int clientNum;
;39:  char userinfo[MAX_INFO_STRING];
;40:  char model[MAX_QPATH];
;41:  char buffer[MAX_QPATH];
;42:  gentity_t *bot;
;43:
;44:  if (level.intermissiontime)
ADDRGP4 level+185040
INDIRI4
CNSTI4 0
EQI4 $88
line 45
;45:  {
line 46
;46:    return;
ADDRGP4 $87
JUMPV
LABELV $88
line 48
;47:  }
;48:  if (level.time - level.startTime < 10000)
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 10000
GEI4 $91
line 49
;49:  {
line 50
;50:    return;
ADDRGP4 $87
JUMPV
LABELV $91
line 56
;51:  }
;52:
;53:  //reservedSlots = trap_Cvar_VariableIntegerValue ("sv_privateclients"); // Found a way to have this var in level.
;54:
;55:  // find what clientNum to use for bot
;56:  clientNum = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 58
;57:
;58:  for(i = 0;i < level.botslots;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $95
line 59
;59:  {
line 60
;60:    if (!g_entities[i].inuse)
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $100
line 61
;61:    {
line 62
;62:      clientNum = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 63
;63:      break;
ADDRGP4 $97
JUMPV
LABELV $100
line 65
;64:    }
;65:  }
LABELV $96
line 58
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $98
ADDRLP4 0
INDIRI4
ADDRGP4 level+190008
INDIRI4
LTI4 $95
LABELV $97
line 67
;66:
;67:  if (clientNum < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $103
line 68
;68:  {
line 69
;69:    trap_Printf("no more slots for bot\n");
ADDRGP4 $105
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 70
;70:    return;
ADDRGP4 $87
JUMPV
LABELV $103
line 72
;71:  }
;72:  if (skill < 1)
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $106
line 73
;73:    skill = 1;
ADDRFP4 8
CNSTI4 1
ASGNI4
LABELV $106
line 75
;74:
;75:  bot = &g_entities[clientNum];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 76
;76:  bot->r.svFlags |= SVF_BOT;
ADDRLP4 1164
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1164
INDIRP4
ADDRLP4 1164
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 77
;77:  bot->inuse = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 80
;78:
;79:  //default bot data
;80:  bot->botCommand = BOT_REGULAR;
ADDRLP4 4
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 81
;81:  if (ent == NULL)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 82
;82:  {
line 83
;83:    bot->botFriend = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 912
ADDP4
CNSTP4 0
ASGNP4
line 84
;84:  }
ADDRGP4 $109
JUMPV
LABELV $108
line 86
;85:  else
;86:  {
line 87
;87:    bot->botFriend = ent;
ADDRLP4 4
INDIRP4
CNSTI4 912
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 88
;88:    bot->botFriend->botclientnum[ent->havebot] = clientNum;
ADDRFP4 12
INDIRP4
CNSTI4 1976
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 912
ADDP4
INDIRP4
CNSTI4 1980
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 89
;89:  }
LABELV $109
line 91
;90:
;91:  bot->botEnemy = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 908
ADDP4
CNSTP4 0
ASGNP4
line 92
;92:  bot->botFriendLastSeen = 0;
ADDRLP4 4
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 0
ASGNI4
line 93
;93:  bot->botEnemyLastSeen = 0;
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 0
ASGNI4
line 94
;94:  bot->botSkillLevel = skill;
ADDRLP4 4
INDIRP4
CNSTI4 924
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 95
;95:  bot->botTeam = team;
ADDRLP4 4
INDIRP4
CNSTI4 928
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 96
;96:  bot->turntime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 1940
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 99
;97:
;98:  // register user information
;99:  userinfo[0] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 100
;100:  Info_SetValueForKey(userinfo, "name", name);
ADDRLP4 12
ARGP4
ADDRGP4 $111
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 101
;101:  Info_SetValueForKey(userinfo, "rate", "8000");
ADDRLP4 12
ARGP4
ADDRGP4 $112
ARGP4
ADDRGP4 $113
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 102
;102:  Info_SetValueForKey(userinfo, "snaps", "20");
ADDRLP4 12
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 $115
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 104
;103:
;104:  trap_SetUserinfo(clientNum, userinfo);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 107
;105:
;106:  // have it connect to the game as a normal client
;107:  if (ClientConnect(clientNum, qtrue) != NULL)
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1168
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
line 108
;108:  {
line 110
;109:    // won't let us join
;110:    return;
ADDRGP4 $87
JUMPV
LABELV $116
line 113
;111:  }
;112:
;113:  level.bots++;
ADDRLP4 1172
ADDRGP4 level+190004
ASGNP4
ADDRLP4 1172
INDIRP4
ADDRLP4 1172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 115
;114:  //Since i dont update UserInfo for bots i need to set the netname here.
;115:  Q_strncpyz(bot->client->pers.netname, name, sizeof(bot->client->pers.netname));
ADDRLP4 1176
CNSTI4 516
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 116
;116:  ClientBegin(clientNum);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 117
;117:  G_ChangeTeam(bot, team);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 120
;118:
;119:  //Setting initial client information.
;120:  Com_sprintf(
CNSTI4 11
ARGI4
ADDRLP4 1180
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 1184
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $119
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 123
;121:    buffer, MAX_QPATH, "%s/%s", BG_FindModelNameForClass(PCL_HUMAN), BG_FindSkinNameForClass(
;122:      PCL_HUMAN));
;123:  Q_strncpyz(model, buffer, sizeof(model));
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 124
;124:  Com_sprintf(
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $120
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 126
;125:    userinfo, sizeof(userinfo), "t\\%i\\model\\%s\\hmodel\\%s\\", PTE_ALIENS, model, model);
;126:  trap_SetConfigstring(CS_PLAYERS + clientNum, userinfo);
ADDRLP4 8
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 127
;127:  bot->client->ps.persistant[PERS_STATE] &= ~PS_NONSEGMODEL;
ADDRLP4 1188
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 1188
INDIRP4
ADDRLP4 1188
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 128
;128:  bot->client->ps.persistant[PERS_STATE] &= ~PS_WALLCLIMBINGFOLLOW;
ADDRLP4 1192
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 1192
INDIRP4
ADDRLP4 1192
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 129
;129:  bot->client->pers.useUnlagged = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:  bot->client->pers.predictItemPickup = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 131
;131:  bot->client->pers.localClient = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 132
;132:}
LABELV $87
endproc G_BotAdd 1196 24
export G_BotDel
proc G_BotDel 12 8
line 136
;133:
;134:void
;135:G_BotDel(int clientNum)
;136:{
line 139
;137:  gentity_t *bot;
;138:
;139:  bot = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 140
;140:  if (!(bot->r.svFlags & SVF_BOT))
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $122
line 141
;141:  {
line 142
;142:    trap_Printf(va("'^7%s^7' is not a bot\n", bot->client->pers.netname));
ADDRGP4 $124
ARGP4
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 143
;143:    return;
ADDRGP4 $121
JUMPV
LABELV $122
line 145
;144:  }
;145:  if (bot->botFriend != NULL)
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
line 146
;146:  {
line 148
;147:    //bot->botFriend->havebot = 0;
;148:  }
LABELV $125
line 149
;149:  level.bots--;
ADDRLP4 4
ADDRGP4 level+190004
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 150
;150:  ClientDisconnect(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 151
;151:}
LABELV $121
endproc G_BotDel 12 8
export G_BotCmd
proc G_BotCmd 40 8
line 155
;152:
;153:void
;154:G_BotCmd(gentity_t * master, int clientNum, char *command)
;155:{
line 158
;156:  gentity_t *bot;
;157:
;158:  bot = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 2476
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 159
;159:  if (!(bot->r.svFlags & SVF_BOT))
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $129
line 160
;160:  {
line 161
;161:    return;
ADDRGP4 $128
JUMPV
LABELV $129
line 164
;162:  }
;163:
;164:  bot->botFriend = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
CNSTP4 0
ASGNP4
line 165
;165:  bot->botEnemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
CNSTP4 0
ASGNP4
line 166
;166:  bot->botFriendLastSeen = 0;
ADDRLP4 0
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 0
ASGNI4
line 167
;167:  bot->botEnemyLastSeen = 0;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 0
ASGNI4
line 170
;168:
;169:  //ROTAX
;170:  if (g_ambush.integer == 1)
ADDRGP4 g_ambush+12
INDIRI4
CNSTI4 1
NEI4 $131
line 171
;171:  {
line 172
;172:    trap_Printf(va("You can't change aliens behavior in ambush mod\n"));
ADDRGP4 $134
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 173
;173:    return;
ADDRGP4 $128
JUMPV
LABELV $131
line 176
;174:  }
;175:
;176:  if (!Q_stricmp(command, "regular"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $135
line 177
;177:  {
line 179
;178:
;179:    bot->botCommand = BOT_REGULAR;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 182
;180:    //trap_SendServerCommand(-1, "print \"regular mode\n\"");
;181:
;182:  }
ADDRGP4 $128
JUMPV
LABELV $135
line 183
;183:  else if (!Q_stricmp(command, "idle"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $138
line 184
;184:  {
line 186
;185:
;186:    bot->botCommand = BOT_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 2
ASGNI4
line 189
;187:    //trap_SendServerCommand(-1, "print \"idle mode\n\"");
;188:
;189:  }
ADDRGP4 $128
JUMPV
LABELV $138
line 190
;190:  else if (!Q_stricmp(command, "attack"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $141
line 191
;191:  {
line 193
;192:
;193:    bot->botCommand = BOT_ATTACK;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 3
ASGNI4
line 196
;194:    //trap_SendServerCommand(-1, "print \"attack mode\n\"");
;195:
;196:  }
ADDRGP4 $128
JUMPV
LABELV $141
line 197
;197:  else if (!Q_stricmp(command, "standground"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $144
line 198
;198:  {
line 200
;199:
;200:    bot->botCommand = BOT_STAND_GROUND;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 4
ASGNI4
line 203
;201:    //trap_SendServerCommand(-1, "print \"stand ground mode\n\"");
;202:
;203:  }
ADDRGP4 $128
JUMPV
LABELV $144
line 204
;204:  else if (!Q_stricmp(command, "defensive"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $147
line 205
;205:  {
line 207
;206:
;207:    bot->botCommand = BOT_DEFENSIVE;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 5
ASGNI4
line 210
;208:    //trap_SendServerCommand(-1, "print \"defensive mode\n\"");
;209:
;210:  }
ADDRGP4 $128
JUMPV
LABELV $147
line 211
;211:  else if (!Q_stricmp(command, "followprotect"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $152
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $150
line 212
;212:  {
line 214
;213:
;214:    bot->botCommand = BOT_FOLLOW_FRIEND_PROTECT;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 6
ASGNI4
line 215
;215:    bot->botFriend = master;
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 218
;216:    //trap_SendServerCommand(-1, "print \"follow-protect mode\n\"");
;217:
;218:  }
ADDRGP4 $128
JUMPV
LABELV $150
line 219
;219:  else if (!Q_stricmp(command, "followattack"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $153
line 220
;220:  {
line 222
;221:
;222:    bot->botCommand = BOT_FOLLOW_FRIEND_ATTACK;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 7
ASGNI4
line 223
;223:    bot->botFriend = master;
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 226
;224:    //trap_SendServerCommand(-1, "print \"follow-attack mode\n\"");
;225:
;226:  }
ADDRGP4 $128
JUMPV
LABELV $153
line 227
;227:  else if (!Q_stricmp(command, "followidle"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $156
line 228
;228:  {
line 230
;229:
;230:    bot->botCommand = BOT_FOLLOW_FRIEND_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 8
ASGNI4
line 231
;231:    bot->botFriend = master;
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 234
;232:    //trap_SendServerCommand(-1, "print \"follow-idle mode\n\"");
;233:
;234:  }
ADDRGP4 $128
JUMPV
LABELV $156
line 235
;235:  else if (!Q_stricmp(command, "teamkill"))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $159
line 236
;236:  {
line 238
;237:
;238:    bot->botCommand = BOT_TEAM_KILLER;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 9
ASGNI4
line 241
;239:    //trap_SendServerCommand(-1, "print \"team kill mode\n\"");
;240:
;241:  }
ADDRGP4 $128
JUMPV
LABELV $159
line 243
;242:  else
;243:  {
line 245
;244:
;245:    bot->botCommand = BOT_REGULAR;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 248
;246:    //trap_SendServerCommand(-1, "print \"regular (unknown) mode\n\"");
;247:
;248:  }
line 250
;249:
;250:  return;
LABELV $128
endproc G_BotCmd 40 8
export Bot_Buy
proc Bot_Buy 0 0
line 255
;251:}
;252:
;253:void
;254:Bot_Buy(gentity_t * self)
;255:{
line 257
;256:
;257:}
LABELV $162
endproc Bot_Buy 0 0
export botBlockedByBot
proc botBlockedByBot 148 28
line 261
;258:
;259:qboolean
;260:botBlockedByBot(gentity_t *self)
;261:{
line 262
;262:  gentity_t *traceEnt = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 266
;263:  trace_t tr;
;264:  vec3_t end, forward;
;265:
;266:  AngleVectors(self->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 88
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 267
;267:  VectorMA(self->client->ps.origin, 75, forward, end);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 96
CNSTF4 1117126656
ASGNF4
ADDRLP4 4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1117126656
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 269
;268:
;269:  trap_Trace(
ADDRLP4 28
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 271
;270:    &tr, self->client->ps.origin, self->r.mins, self->r.maxs, end, self->s.number, MASK_PLAYERSOLID);
;271:  traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 273
;272:
;273:  if (traceEnt && traceEnt->client && traceEnt->client->pers.teamSelection == PTE_ALIENS)
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $169
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $169
ADDRLP4 112
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $169
line 274
;274:  {
line 276
;275:    //So is blocked lets try the other side
;276:    AngleVectors(self->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 277
;277:    VectorMA(self->client->ps.origin, -40, forward, end);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 124
CNSTF4 3256877056
ASGNF4
ADDRLP4 4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3256877056
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 279
;278:
;279:    trap_Trace(
ADDRLP4 28
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 128
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 283
;280:      &tr, self->client->ps.origin, self->r.mins, self->r.maxs, end, self->s.number,
;281:      MASK_PLAYERSOLID);
;282:
;283:    traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 284
;284:    if (traceEnt && traceEnt->client && traceEnt->client->pers.teamSelection == PTE_ALIENS)
ADDRLP4 136
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 136
INDIRU4
EQU4 $176
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRLP4 136
INDIRU4
EQU4 $176
ADDRLP4 140
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $176
line 285
;285:    {
line 286
;286:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $176
line 288
;287:    }
;288:    else if(tr.fraction == 1.0)
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
NEF4 $178
line 289
;289:    {
line 290
;290:      self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] + 180);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 16
LSHI4
CNSTI4 11796480
ADDI4
CNSTI4 360
DIVI4
CNSTI4 65535
BANDI4
ASGNI4
line 291
;291:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $178
line 294
;292:    }
;293:    else
;294:    {
line 296
;295:      //Hit something.
;296:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $169
line 301
;297:    }
;298:    //self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] + 90);
;299:  }
;300:  else
;301:  {
line 302
;302:    return qfalse;
CNSTI4 0
RETI4
LABELV $163
endproc botBlockedByBot 148 28
export Bot_Stuck
proc Bot_Stuck 28 4
line 309
;303:  }
;304:
;305:}
;306:
;307:qboolean
;308:Bot_Stuck(gentity_t * self, int zone)
;309:{
line 310
;310:  if (self->turntime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1940
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $182
line 311
;311:  {
line 312
;312:    self->turntime = level.time + 800;
ADDRFP4 0
INDIRP4
CNSTI4 1940
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 313
;313:    if (abs(self->posX - self->client->ps.origin[0]) < zone && abs(self->posY
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1952
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $186
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1956
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $186
line 315
;314:        - self->client->ps.origin[1]) < zone)
;315:    {
line 316
;316:      self->posX = self->client->ps.origin[0];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1952
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 317
;317:      self->posY = self->client->ps.origin[1];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1956
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 318
;318:      self->posZ = self->client->ps.origin[2];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1960
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 319
;319:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $181
JUMPV
LABELV $186
line 322
;320:    }
;321:
;322:    self->posX = self->client->ps.origin[0];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1952
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 323
;323:    self->posY = self->client->ps.origin[1];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1956
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 324
;324:    self->posZ = self->client->ps.origin[2];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1960
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 325
;325:  }
LABELV $182
line 326
;326:  return qfalse;
CNSTI4 0
RETI4
LABELV $181
endproc Bot_Stuck 28 4
lit
align 4
LABELV $189
byte 4 0
byte 4 0
byte 4 0
export WallBlockingNode
code
proc WallBlockingNode 172 28
line 331
;327:}
;328:
;329:qboolean
;330:WallBlockingNode(gentity_t * self)
;331:{
line 335
;332:  vec3_t forward, right, up, muzzle, end;
;333:  vec3_t nextnode;
;334:  vec3_t top =
;335:  { 0, 0, 0 };
ADDRLP4 76
ADDRGP4 $189
INDIRB
ASGNB 12
line 336
;336:  int vh = 0;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 341
;337:  trace_t tr;
;338:  int distanceNode;
;339:  int distance;
;340:
;341:  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BG_FindViewheightForClass
CALLV
pop
line 342
;342:  top[2] = vh;
ADDRLP4 76+8
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 344
;343:
;344:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 345
;345:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 346
;346:  VectorMA(muzzle, 10000, forward, end);
ADDRLP4 156
CNSTF4 1176256512
ASGNF4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 156
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 156
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1176256512
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 348
;347:
;348:  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
ADDRLP4 88
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 160
CNSTP4 0
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 350
;349:
;350:  nextnode[0] = ((-(BLOCKSIZE / 2) + level.pathx[self->botnextpath]) * BLOCKSIZE);
ADDRLP4 36
CNSTI4 100
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+172936
ADDP4
INDIRI4
MULI4
CNSTI4 -5000
ADDI4
CVIF4 4
ASGNF4
line 351
;351:  nextnode[1] = ((-(BLOCKSIZE / 2) + level.pathy[self->botnextpath]) * BLOCKSIZE);
ADDRLP4 36+4
CNSTI4 100
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173416
ADDP4
INDIRI4
MULI4
CNSTI4 -5000
ADDI4
CVIF4 4
ASGNF4
line 352
;352:  nextnode[2] = self->s.pos.trBase[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 354
;353:
;354:  distanceNode = Distance(nextnode, self->s.pos.trBase);
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 164
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 164
INDIRF4
CVFI4 4
ASGNI4
line 356
;355:
;356:  distance = Distance(self->s.pos.trBase, tr.endpos);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 88+12
ARGP4
ADDRLP4 168
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 152
ADDRLP4 168
INDIRF4
CVFI4 4
ASGNI4
line 357
;357:  if (distance < distanceNode)
ADDRLP4 152
INDIRI4
ADDRLP4 148
INDIRI4
GEI4 $202
line 358
;358:  {
line 359
;359:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $188
JUMPV
LABELV $202
line 361
;360:  }
;361:  return qfalse;
CNSTI4 0
RETI4
LABELV $188
endproc WallBlockingNode 172 28
export botSetEnemy
proc botSetEnemy 8 12
line 481
;362:}
;363:/*
;364: void
;365: G_BotFollowPath(gentity_t * self) {
;366: vec3_t dirToTarget, angleToTarget;
;367: vec3_t top = {0, 0, 0};
;368: int vh = 0;
;369: int tempEntityIndex = -1;
;370: int cuadrado;
;371:
;372: int x,y;
;373:
;374: if(self->pathfindthink > level.time ) return;
;375:
;376: if(botReachedDestination(self))
;377: {
;378: botStopWalk(self);
;379: trap_SendServerCommand(-1,
;380: "print \"^1Objetive Reached\n\"");
;381: return;
;382: }
;383:
;384: if(self->timedropnodepath > level.time)
;385: return;
;386:
;387: if(visitedLastNode(self))
;388: {
;389: if(nextNode(self))
;390: {
;391: trap_SendServerCommand(-1,
;392: "print \"Moving to next node  \"");
;393: aimNode(self);
;394: botWalk(self);
;395: }
;396:
;397:
;398: trap_SendServerCommand(-1,
;399: va("print \"Distance to node: %d, X:%f , Y:%f, POSx: %f, POSXy: %f, %d\n\"",
;400: Distance2d(self->s.origin, self->nextnode),
;401: ((BLOCKSIZE/2)+(self->s.origin[0]/BLOCKSIZE)),
;402: ((BLOCKSIZE/2)+(self->s.origin[1]/BLOCKSIZE)),
;403: self->s.origin[0],
;404: self->s.origin[1],
;405: self->botnextpath
;406: ));
;407:
;408: //botStopWalk(self);
;409: }
;410: else
;411: {
;412: //Posibility of getting stuck here
;413: //Bot have run out of place.
;414: if(botLost(self))
;415: {
;416: trap_SendServerCommand(-1,
;417: va("print \"^1BOTLOST: %f %f %f %f.\n\"", self->nextnode[0],self->nextnode[1],self->s.origin[0],self->s.origin[1]));
;418:
;419: if(canMakeWay(self))
;420: {
;421: trap_SendServerCommand(-1,
;422: "print \"i make a way\n\"");
;423: aimNode(self);
;424: botWalk(self);
;425: self->timedropnodepath = level.time +2000;
;426: }
;427: else
;428: {
;429: //The bot have complety lost him self
;430: if(findNodeCanSee(self))
;431: {
;432: aimNode(self);
;433: botWalk(self);
;434: }
;435: else
;436: {
;437: trap_SendServerCommand(-1,
;438: "print \"Darn it.\n\"");
;439: }
;440: }
;441: }
;442: else
;443: {
;444: trap_SendServerCommand(-1,
;445: "print \"Looking for next node\n\"");
;446: if(Bot_Stuck(self,20))
;447: {
;448: trap_SendServerCommand(-1,
;449: "print \"I stuck\n\"");
;450: if(findNodeCanSee(self))
;451: {
;452: trap_SendServerCommand(-1,
;453: "print \"Finding a node i can see\n\"");
;454: }
;455: else
;456: {
;457: if(canMakeWay(self))
;458: {
;459: aimNode(self);
;460: botWalk(self);
;461: self->client->ps.stats[ STAT_STATE ] |= SS_SPEEDBOOST;
;462: self->pathfindthink = level.time + 3000;
;463: }
;464: else
;465: {
;466: trap_SendServerCommand(-1,
;467: "print \"That just damn sucks.\n\"");
;468: }
;469: }
;470: aimNode(self);
;471: botWalk(self);
;472:
;473: }
;474: }
;475: }
;476: }
;477: */
;478:
;479:void
;480:botSetEnemy(gentity_t *self, gentity_t *enemy, int entityId)
;481:{
line 482
;482:  self->lastTimeSawEnemy = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 484
;483:
;484:  if (enemy)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 485
;485:  {
line 486
;486:    self->botEnemy = enemy;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 487
;487:  }
ADDRGP4 $207
JUMPV
LABELV $206
line 489
;488:  else
;489:  {
line 490
;490:    if (entityId >= 0)
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $208
line 491
;491:    {
line 492
;492:      self->botEnemy = &g_entities[entityId];
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
CNSTI4 2476
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 493
;493:    }
LABELV $208
line 494
;494:  }
LABELV $207
line 495
;495:  if (self->botEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $210
line 496
;496:  {
line 497
;497:    self->botEnemy->lastTimeSeen = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 2272
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 498
;498:    if (director_debug.integer)
ADDRGP4 director_debug+12
INDIRI4
CNSTI4 0
EQI4 $213
line 499
;499:    {
line 500
;500:      G_Printf(
ADDRGP4 $216
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 502
;501:        "%s: new enemy = %s", self->client->pers.netname, self->botEnemy->client->pers.netname);
;502:    }
LABELV $213
line 503
;503:  }
LABELV $210
line 504
;504:}
LABELV $204
endproc botSetEnemy 8 12
export G_BotThink
proc G_BotThink 136 12
line 507
;505:void
;506:G_BotThink(gentity_t * self)
;507:{
line 508
;508:  int distance = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 509
;509:  int clicksToStopChase = 30; //5 seconds
ADDRLP4 40
CNSTI4 30
ASGNI4
line 510
;510:  int forwardMove = 127; // max speed
ADDRLP4 36
CNSTI4 127
ASGNI4
line 511
;511:  int tempEntityIndex = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 512
;512:  float chompDistance = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 514
;513:
;514:  usercmd_t botCmdBuffer = self->client->pers.cmd;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 24
line 516
;515:
;516:  botCmdBuffer.forwardmove = 0;
ADDRLP4 0+21
CNSTI1 0
ASGNI1
line 517
;517:  botCmdBuffer.rightmove = 0;
ADDRLP4 0+22
CNSTI1 0
ASGNI1
line 518
;518:  botCmdBuffer.upmove = 0;
ADDRLP4 0+23
CNSTI1 0
ASGNI1
line 519
;519:  botCmdBuffer.buttons = 0;
ADDRLP4 0+16
CNSTI4 0
ASGNI4
line 521
;520:
;521:  self->client->pers.cmd.buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 522
;522:  botWalk(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 523
;523:  self->client->pers.cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
CNSTI1 0
ASGNI1
line 525
;524:
;525:  switch(self->botCommand)
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $250
ADDRLP4 44
INDIRI4
CNSTI4 2
EQI4 $301
ADDRLP4 44
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $223
LABELV $308
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $225
ADDRLP4 44
INDIRI4
CNSTI4 12
EQI4 $247
ADDRGP4 $223
JUMPV
line 526
;526:  {
LABELV $225
line 528
;527:    case BOT_FOLLOW_PATH:
;528:      if (self->botEnemy->health <= 0 || self->botEnemy->client->ps.stats[STAT_HEALTH] <= 0
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $229
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $229
ADDRLP4 68
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $226
LABELV $229
line 530
;529:          || self->botEnemy->client->pers.connected == CON_DISCONNECTED)
;530:      {
line 531
;531:        self->botCommand = BOT_REGULAR;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 532
;532:        self->botEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
CNSTP4 0
ASGNP4
line 533
;533:        memset(&self->client->pers.cmd, 0, sizeof(self->client->pers.cmd));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 534
;534:        break;
ADDRGP4 $223
JUMPV
LABELV $226
line 536
;535:      }
;536:      if (botBlockedByBot(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 botBlockedByBot
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $230
line 537
;537:      {
line 539
;538:    	//Bot was blocked by other bot, lets jump over it lmao..
;539:    	botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 540
;540:    	self->botCommand = BOT_REGULAR;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 542
;541:        //This prevent our bot explode to soon
;542:        self->lastTimeSawEnemy = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 545
;543:
;544://        self->botCommand = BOT_IDLE;
;545:        return;
ADDRGP4 $217
JUMPV
LABELV $230
line 547
;546:      }
;547:      switch(self->botMetaMode)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
EQI4 $236
ADDRLP4 76
INDIRI4
CNSTI4 2
EQI4 $236
ADDRLP4 76
INDIRI4
CNSTI4 3
EQI4 $236
ADDRGP4 $233
JUMPV
line 548
;548:      {
LABELV $236
LABELV $233
line 553
;549:        case ATTACK_RAMBO:
;550:        case ATTACK_CAMPER:
;551:        case ATTACK_ALL:
;552:        default:
;553:          if (nodes[self->bs.currentNode].type == NODE_DUCK && nodes[self->bs.nextNode].type
ADDRLP4 84
CNSTI4 24
ASGNI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRI4
ADDRLP4 88
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 10
NEI4 $237
ADDRLP4 84
INDIRI4
ADDRLP4 88
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 6
NEI4 $237
line 555
;554:              == NODE_JUMP)
;555:          {
line 556
;556:            ACEAI_Think(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_Think
CALLV
pop
line 557
;557:            return;
ADDRGP4 $217
JUMPV
LABELV $237
line 560
;558:          }
;559:
;560:          tempEntityIndex = botFindClosestEnemy(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 92
ADDRGP4 botFindClosestEnemy
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 92
INDIRI4
ASGNI4
line 561
;561:          if (tempEntityIndex >= 0)
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $241
line 562
;562:          {
line 563
;563:            if (director_debug.integer)
ADDRGP4 director_debug+12
INDIRI4
CNSTI4 0
EQI4 $243
line 564
;564:            {
line 565
;565:              G_Printf("Was following path and i found a enemy around so im gonna attack him.\n");
ADDRGP4 $246
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 566
;566:            }
LABELV $243
line 567
;567:            botSetEnemy(self, NULL, tempEntityIndex);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 botSetEnemy
CALLV
pop
line 571
;568:            //FIXME: THIS was causing bots aim on the wrong direction.
;569:            //whut is this?
;570:            //memset(&self->client->pers.cmd, 0, sizeof(self->client->pers.cmd));
;571:            self->botCommand = BOT_REGULAR;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 572
;572:            ACEND_setCurrentNode(self, INVALID);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 ACEND_setCurrentNode
CALLV
pop
line 573
;573:          }
ADDRGP4 $223
JUMPV
LABELV $241
line 575
;574:          else
;575:          {
line 576
;576:            ACEAI_Think(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_Think
CALLV
pop
line 577
;577:          }
line 578
;578:          break;
line 584
;579:
;580:          //          G_Printf("WHAT THE SHIT\n");
;581:          //          ACEAI_Think(self);
;582:          //          break;
;583:      }
;584:      break;
ADDRGP4 $223
JUMPV
LABELV $247
line 592
;585:
;586:    case BOT_CHOMP:
;587:      //self->botCommand = BOT_REGULAR;
;588:      //      self->client->ps.viewangles[PITCH] = AngleNormalize360(0.0f);
;589:      //      self->bs.viewAngles[PITCH] = self->client->ps.viewangles[PITCH];
;590:      //      G_SetClientViewAngle(self, self->client->ps.viewangles);
;591:
;592:      botAimAtTarget(self, self->botEnemy);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRGP4 botAimAtTarget
CALLI4
pop
line 594
;593:      //G_BotAimAt( self, self->botEnemy->s.origin, &botCmdBuffer);
;594:      botShootIfTargetInRange(self, self->botEnemy);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRGP4 botShootIfTargetInRange
CALLI4
pop
line 596
;595:      //      VectorNormalize(self->client->ps.velocity);
;596:      chompDistance = Distance(self->s.origin, self->botEnemy->s.origin);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 92
ASGNI4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 597
;597:      if (chompDistance > 180)
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $248
line 598
;598:      {
line 599
;599:        self->botCommand = BOT_REGULAR;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 600
;600:      }
LABELV $248
line 601
;601:      botWalk(self, chompDistance);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 602
;602:      botJump(self, chompDistance);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 botJump
CALLV
pop
line 603
;603:      botShootIfTargetInRange(self, self->botEnemy);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRGP4 botShootIfTargetInRange
CALLI4
pop
line 605
;604:      //VectorScale(self->client->ps.velocity, chompDistance, self->client->ps.velocity);
;605:      break;
ADDRGP4 $223
JUMPV
LABELV $250
line 609
;606:
;607:    //This is where the magic happends.
;608:    case BOT_REGULAR:
;609:      if (self->botEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 610
;610:      {
line 611
;611:        if (!botTargetInRange(self, self->botEnemy))
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 botTargetInRange
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $253
line 612
;612:        {
line 613
;613:          if (self->botEnemyLastSeen > clicksToStopChase)
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $255
line 614
;614:          {
line 615
;615:            self->botEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
CNSTP4 0
ASGNP4
line 616
;616:            self->botEnemyLastSeen = 0;
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 0
ASGNI4
line 617
;617:          }
ADDRGP4 $252
JUMPV
LABELV $255
line 619
;618:          else
;619:          {
line 620
;620:            self->botEnemyLastSeen++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 621
;621:          }
line 622
;622:        }
ADDRGP4 $252
JUMPV
LABELV $253
line 624
;623:        else
;624:        {
line 625
;625:          self->botEnemyLastSeen = 0;
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 0
ASGNI4
line 626
;626:        }
line 627
;627:      }
ADDRGP4 $252
JUMPV
LABELV $251
line 629
;628:      else
;629:      {
line 630
;630:        tempEntityIndex = botFindClosestEnemy(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 botFindClosestEnemy
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 108
INDIRI4
ASGNI4
line 631
;631:        if (tempEntityIndex >= 0)
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $257
line 632
;632:        {
line 633
;633:          botSetEnemy(self, NULL, tempEntityIndex);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 botSetEnemy
CALLV
pop
line 634
;634:        }
LABELV $257
line 635
;635:      }
LABELV $252
line 636
;636:      if (!self->botEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 637
;637:      {
line 638
;638:        if (level.time % 5000 && (self->client->ps.viewangles[PITCH] != 0.0f
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
MODI4
CNSTI4 0
EQI4 $261
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ASGNF4
ADDRLP4 108
INDIRF4
CNSTF4 0
EQF4 $261
ADDRLP4 108
INDIRF4
CNSTF4 1135869952
EQF4 $261
line 640
;639:            && self->client->ps.viewangles[PITCH] != 360.0f))
;640:        {
line 641
;641:          self->client->ps.viewangles[PITCH] = AngleNormalize360(0.0f);
CNSTF4 0
ARGF4
ADDRLP4 112
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 112
INDIRF4
ASGNF4
line 642
;642:          self->bs.viewAngles[PITCH] = self->client->ps.viewangles[PITCH];
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 2352
ADDP4
ADDRLP4 116
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ASGNF4
line 643
;643:          G_SetClientViewAngle(self, self->client->ps.viewangles);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 644
;644:        }
LABELV $261
line 645
;645:        if (Bot_Stuck(self, 30))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRLP4 112
ADDRGP4 Bot_Stuck
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $264
line 646
;646:        {
line 647
;647:          self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 45);
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 16
LSHI4
CNSTI4 2949120
SUBI4
CNSTI4 360
DIVI4
CNSTI4 65535
BANDI4
ASGNI4
line 648
;648:        }
ADDRGP4 $265
JUMPV
LABELV $264
line 650
;649:        else
;650:        {
line 651
;651:          if (WallInFront(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 WallInFront
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $266
line 652
;652:          {
line 653
;653:            selectBetterWay(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 selectBetterWay
CALLV
pop
line 654
;654:          }
LABELV $266
line 655
;655:        }
LABELV $265
line 656
;656:        botWalk(self, 60);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 657
;657:      }
ADDRGP4 $223
JUMPV
LABELV $259
line 659
;658:      else
;659:      {
line 667
;660:        /****************************************************************************
;661:         * WE HAVE AN ENEMY
;662:         ****************************************************************************/
;663:
;664:        /****************************************************************************
;665:         * Slow down
;666:         ****************************************************************************/
;667:        if (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $268
line 668
;668:        {
line 669
;669:          self->client->pers.hyperspeed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 670
;670:        }
LABELV $268
line 675
;671:
;672:        /****************************************************************************
;673:         * Aim and walk to it
;674:         ****************************************************************************/
;675:        distance = botGetDistanceBetweenPlayer(self, self->botEnemy);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 botGetDistanceBetweenPlayer
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRI4
ASGNI4
line 677
;676:        //G_BotAimAt( self, self->botEnemy->s.origin, &botCmdBuffer);
;677:        botAimAtTarget(self, self->botEnemy);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRGP4 botAimAtTarget
CALLI4
pop
line 678
;678:        if (distance > 50)
ADDRLP4 28
INDIRI4
CNSTI4 50
LEI4 $270
line 679
;679:        {
line 680
;680:          if (g_survival.integer && (level.time - level.startTime) < 340000)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $272
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 340000
GEI4 $272
line 681
;681:          {
line 682
;682:            botWalk(self, 100);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 683
;683:          }
ADDRGP4 $273
JUMPV
LABELV $272
line 685
;684:          else
;685:          {
line 686
;686:            botWalk(self, forwardMove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 687
;687:          }
LABELV $273
line 689
;688:
;689:          if (g_survival.integer && (level.time - level.startTime) < 240000)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $277
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 240000
GEI4 $277
line 690
;690:          {
line 691
;691:            botWalk(self, 70);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 70
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 692
;692:          }
LABELV $277
line 693
;693:          if (g_survival.integer && (level.time - level.startTime) < 120000)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $282
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 120000
GEI4 $282
line 694
;694:          {
line 695
;695:            botWalk(self, 60);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 696
;696:          }
LABELV $282
line 697
;697:          if (g_survival.integer && (level.time - level.startTime) < 60000)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $287
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 60000
GEI4 $287
line 698
;698:          {
line 699
;699:            botWalk(self, 50);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 700
;700:          }
LABELV $287
line 702
;701:
;702:          if (distance < 200)
ADDRLP4 28
INDIRI4
CNSTI4 200
GEI4 $292
line 703
;703:          {
line 704
;704:            self->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 705
;705:          }
LABELV $292
line 707
;706:
;707:          if (!g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
NEI4 $294
line 708
;708:          {
line 709
;709:            botWalk(self, forwardMove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 710
;710:          }
LABELV $294
line 712
;711:          //botShootIfTargetInRange(self, self->botEnemy);
;712:        }
LABELV $270
line 713
;713:        if (distance < 65)//45
ADDRLP4 28
INDIRI4
CNSTI4 65
GEI4 $297
line 714
;714:        {
line 715
;715:          botWalk(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 716
;716:          botShootIfTargetInRange(self, self->botEnemy);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
ADDRGP4 botShootIfTargetInRange
CALLI4
pop
line 717
;717:        }
LABELV $297
line 718
;718:        if (Bot_Stuck(self, 60) && Distance(self->s.pos.trBase, self->botEnemy->s.pos.trBase) > 80)
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 120
ADDRGP4 Bot_Stuck
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $223
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
CNSTI4 24
ASGNI4
ADDRLP4 124
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
ARGP4
ADDRLP4 132
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 1117782016
LEF4 $223
line 719
;719:        {
line 720
;720:          botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 721
;721:          self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1000
ASGNI4
line 722
;722:        }
line 723
;723:      }
line 724
;724:      break;
ADDRGP4 $223
JUMPV
LABELV $301
line 728
;725:
;726:    case BOT_IDLE:
;727:      // just stand there and look pretty.
;728:      botWalk(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 729
;729:      if (self->idletimer < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $223
line 730
;730:      {
line 731
;731:        self->idletimer = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 732
;732:        if (botBlockedByBot(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 botBlockedByBot
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $306
line 733
;733:        {
line 735
;734:          //Stay the same
;735:        }
ADDRGP4 $223
JUMPV
LABELV $306
line 737
;736:        else
;737:        {
line 739
;738:          //Switch to bot follow path
;739:          self->botCommand = BOT_FOLLOW_PATH;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 11
ASGNI4
line 740
;740:          self->bs.state = STATE_WANDER;
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
CNSTI4 3
ASGNI4
line 741
;741:          botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 742
;742:        }
line 743
;743:      }
line 744
;744:      break;
line 747
;745:    default:
;746:      // dunno.
;747:      break;
LABELV $223
line 749
;748:  }
;749:}
LABELV $217
endproc G_BotThink 136 12
export G_BotSpectatorThink
proc G_BotSpectatorThink 12 8
line 753
;750:
;751:void
;752:G_BotSpectatorThink(gentity_t * self)
;753:{
line 754
;754:  if (self->client->ps.pm_flags & PMF_QUEUED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $310
line 755
;755:  {
line 758
;756:    //we're queued to spawn, all good
;757:    //G_LogPrintf( "ClientQUEUED: %i\n", self->client->ps.clientNum );
;758:    return;
ADDRGP4 $309
JUMPV
LABELV $310
line 761
;759:  }
;760:
;761:  if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $312
line 762
;762:  {
line 763
;763:    int teamnum = self->client->pers.teamSelection;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 764
;764:    int clientNum = self->client->ps.clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 766
;765:
;766:    if (teamnum == PTE_HUMANS)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $314
line 767
;767:    {
line 768
;768:      self->client->pers.classSelection = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 11
ASGNI4
line 769
;769:      self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 11
ASGNI4
line 770
;770:      self->client->pers.humanItemSelection = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
line 771
;771:      G_PushSpawnQueue(&level.humanSpawnQueue, clientNum);
ADDRGP4 level+189556
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 772
;772:    }
ADDRGP4 $315
JUMPV
LABELV $314
line 773
;773:    else if (teamnum == PTE_ALIENS)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $317
line 774
;774:    {
line 776
;775:      //ROTAX
;776:      if (g_ambush.integer == 1)
ADDRGP4 g_ambush+12
INDIRI4
CNSTI4 1
NEI4 $319
line 777
;777:      {
line 778
;778:        if (ROTACAK_ambush_rebuild_time_temp < level.time && ((level.time - level.startTime)
ADDRGP4 ROTACAK_ambush_rebuild_time_temp
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $320
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_ambush_sec_to_start+12
INDIRI4
MULI4
LEI4 $320
line 780
;779:            > (g_ambush_sec_to_start.integer * 1000)))
;780:        {
line 781
;781:          srand(trap_Milliseconds());
ADDRLP4 8
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 783
;782:
;783:          if (ROTACAK_ambush_stage == 1) //adv granger
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 1
NEI4 $328
line 784
;784:          {
line 785
;785:            self->client->pers.classSelection = PCL_ALIEN_BUILDER0_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 2
ASGNI4
line 786
;786:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_BUILDER0_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 2
ASGNI4
line 787
;787:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 788
;788:          }
ADDRGP4 $320
JUMPV
LABELV $328
line 789
;789:          else if (ROTACAK_ambush_stage == 2) //dretch
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 2
NEI4 $331
line 790
;790:          {
line 791
;791:            self->client->pers.classSelection = PCL_ALIEN_LEVEL0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 3
ASGNI4
line 792
;792:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 3
ASGNI4
line 793
;793:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 794
;794:          }
ADDRGP4 $320
JUMPV
LABELV $331
line 795
;795:          else if (ROTACAK_ambush_stage == 3) //basilisk
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 3
NEI4 $334
line 796
;796:          {
line 797
;797:            self->client->pers.classSelection = PCL_ALIEN_LEVEL1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 4
ASGNI4
line 798
;798:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 4
ASGNI4
line 799
;799:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 800
;800:          }
ADDRGP4 $320
JUMPV
LABELV $334
line 801
;801:          else if (ROTACAK_ambush_stage == 4) //adv basilisk
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 4
NEI4 $337
line 802
;802:          {
line 803
;803:            self->client->pers.classSelection = PCL_ALIEN_LEVEL1_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 5
ASGNI4
line 804
;804:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL1_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 5
ASGNI4
line 805
;805:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 806
;806:          }
ADDRGP4 $320
JUMPV
LABELV $337
line 807
;807:          else if (ROTACAK_ambush_stage == 5) //marauder
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 5
NEI4 $340
line 808
;808:          {
line 809
;809:            self->client->pers.classSelection = PCL_ALIEN_LEVEL2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 6
ASGNI4
line 810
;810:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 6
ASGNI4
line 811
;811:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 812
;812:          }
ADDRGP4 $320
JUMPV
LABELV $340
line 813
;813:          else if (ROTACAK_ambush_stage == 6) //adv marauder
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 6
NEI4 $343
line 814
;814:          {
line 815
;815:            self->client->pers.classSelection = PCL_ALIEN_LEVEL2_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 7
ASGNI4
line 816
;816:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL2_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 7
ASGNI4
line 817
;817:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 818
;818:          }
ADDRGP4 $320
JUMPV
LABELV $343
line 819
;819:          else if (ROTACAK_ambush_stage == 7) //dragon
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 7
NEI4 $346
line 820
;820:          {
line 821
;821:            self->client->pers.classSelection = PCL_ALIEN_LEVEL3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 8
ASGNI4
line 822
;822:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 8
ASGNI4
line 823
;823:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 824
;824:          }
ADDRGP4 $320
JUMPV
LABELV $346
line 825
;825:          else if (ROTACAK_ambush_stage == 8) //adv dragon
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 8
NEI4 $349
line 826
;826:          {
line 827
;827:            self->client->pers.classSelection = PCL_ALIEN_LEVEL3_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 9
ASGNI4
line 828
;828:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL3_UPG;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 9
ASGNI4
line 829
;829:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 830
;830:          }
ADDRGP4 $320
JUMPV
LABELV $349
line 831
;831:          else if (ROTACAK_ambush_stage == 9) //tyrant
ADDRGP4 ROTACAK_ambush_stage
INDIRI4
CNSTI4 9
NEI4 $320
line 832
;832:          {
line 833
;833:            self->client->pers.classSelection = PCL_ALIEN_LEVEL4;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 10
ASGNI4
line 834
;834:            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL4;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 10
ASGNI4
line 835
;835:            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 836
;836:          }
line 837
;837:        }
line 838
;838:      }
ADDRGP4 $320
JUMPV
LABELV $319
line 840
;839:      else
;840:      {
line 841
;841:        if (level.slowdownTime < level.time)
ADDRGP4 level+173916
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $355
line 842
;842:        {
line 843
;843:          self->client->pers.classSelection = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 11
ASGNI4
line 844
;844:          self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 11
ASGNI4
line 845
;845:          self->client->pers.humanItemSelection = WP_ZOMBIE_BITE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 13
ASGNI4
line 846
;846:          G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
ADDRGP4 level+189292
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 847
;847:        }
LABELV $355
line 849
;848:        else
;849:        {
line 851
;850:
;851:        }
LABELV $356
line 852
;852:      }
LABELV $320
line 853
;853:    }
LABELV $317
LABELV $315
line 854
;854:  }
LABELV $312
line 855
;855:}
LABELV $309
endproc G_BotSpectatorThink 12 8
export botAimAtTarget
proc botAimAtTarget 96 8
line 859
;856:void VectorToAngles(const vec3_t value1, vec3_t angles);
;857:qboolean
;858:botAimAtTarget(gentity_t * self, gentity_t * target)
;859:{
line 878
;860:  vec3_t ideal_angles;
;861:  vec3_t direction;
;862:  vec3_t ideal_view;
;863:  vec3_t enemyOrigin;
;864:  float ideal_yaw;
;865:  float ideal_pitch;
;866:  float current_yaw;
;867:  float current_pitch;
;868:  int cmdAngle;
;869:  //TODO: Detect Ducking?
;870:
;871:
;872://  if(Distance(target->s.origin, self->oldEnemyOrigin) == 0)
;873://  {
;874://    G_printVector(target->s.origin);
;875://    G_Printf(" %s havent moved\n", target->client->pers.netname);
;876://    return qfalse;
;877://  }
;878:  VectorCopy(target->s.origin, self->oldEnemyOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 2464
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 882
;879:
;880:
;881:
;882:  VectorCopy(target->s.origin, enemyOrigin);
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 884
;883:
;884:  if ((target->client->ps.pm_flags & PMF_DUCKED))
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $361
line 885
;885:  {
line 886
;886:    enemyOrigin[2] -= 16; //min-cmin
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 887
;887:  }
LABELV $361
line 889
;888:
;889:  VectorSubtract(enemyOrigin, self->client->ps.origin, direction);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 68
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 68
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 898
;890:
;891:  //ADD this if u dont want the zombie head flip
;892:  /*if (Distance(target->client->ps.origin, self->client->ps.origin) < 50)
;893:   {
;894:   G_Printf("Distance to short \n");
;895:   return qfalse;
;896:   }*/
;897:
;898:  VectorNormalize(direction);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 900
;899:
;900:  current_yaw = AngleNormalize360(self->client->ps.viewangles[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ASGNF4
line 901
;901:  current_pitch = AngleNormalize360(self->client->ps.viewangles[PITCH]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 76
INDIRF4
ASGNF4
line 903
;902:
;903:  VectorToAngles(direction, ideal_angles);
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 VectorToAngles
CALLV
pop
line 905
;904:
;905:  ideal_yaw = AngleNormalize360(ideal_angles[YAW]);
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 80
INDIRF4
ASGNF4
line 906
;906:  ideal_pitch = AngleNormalize360(ideal_angles[PITCH]);
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 84
INDIRF4
ASGNF4
line 909
;907:
;908:  // yaw
;909:  if (current_yaw != ideal_yaw)
ADDRLP4 56
INDIRF4
ADDRLP4 48
INDIRF4
EQF4 $369
line 910
;910:  {
line 911
;911:    ideal_view[YAW] = AngleNormalize360(ideal_yaw);
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 88
INDIRF4
ASGNF4
line 912
;912:    self->client->pers.cmd.angles[YAW] = ANGLE2SHORT(ideal_view[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 1199570944
ADDRLP4 36+4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 913
;913:    cmdAngle = ANGLE2SHORT(ideal_view[ YAW ]);
ADDRLP4 64
CNSTF4 1199570944
ADDRLP4 36+4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 914
;914:    self->client->ps.delta_angles[YAW] = cmdAngle - self->client->pers.cmd.angles[YAW];
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 64
INDIRI4
ADDRLP4 92
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
SUBI4
ASGNI4
line 915
;915:  }
LABELV $369
line 918
;916:
;917:  // pitch
;918:  if (current_pitch != ideal_pitch)
ADDRLP4 60
INDIRF4
ADDRLP4 52
INDIRF4
EQF4 $374
line 919
;919:  {
line 920
;920:    ideal_view[PITCH] = AngleNormalize360(ideal_pitch);
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 88
INDIRF4
ASGNF4
line 921
;921:    self->client->pers.cmd.angles[PITCH] = ANGLE2SHORT(ideal_view[PITCH]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 1199570944
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 922
;922:    cmdAngle = ANGLE2SHORT(ideal_view[ PITCH ]);
ADDRLP4 64
CNSTF4 1199570944
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 923
;923:    self->client->ps.delta_angles[PITCH] = cmdAngle - self->client->pers.cmd.angles[PITCH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 64
INDIRI4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
SUBI4
ASGNI4
line 924
;924:  }
LABELV $374
line 947
;925:
;926:  //VectorCopy(ideal_view, self->s.angles);
;927:  //VectorCopy(self->s.angles, self->client->ps.viewangles);
;928:
;929:
;930://  if (viewchanged)
;931://  {
;932://    for(i = 0;i < 3;i++)
;933://    {
;934://      self->client->pers.cmd.angles[i] = ANGLE2SHORT(ideal_view[i]);
;935://    }
;936://    for(i = 0;i < 3;i++)
;937://    {
;938://      int cmdAngle;
;939://
;940://      cmdAngle = ANGLE2SHORT(ideal_view[ i ]);
;941://      self->client->ps.delta_angles[i] = cmdAngle - self->client->pers.cmd.angles[i];
;942://    }
;943://
;944://    VectorCopy(ideal_view, self->s.angles);
;945://    VectorCopy(self->s.angles, self->client->ps.viewangles);
;946://  }
;947:  return qtrue;
CNSTI4 1
RETI4
LABELV $360
endproc botAimAtTarget 96 8
export botTargetInRange2
proc botTargetInRange2 0 0
line 952
;948:}
;949:
;950:qboolean
;951:botTargetInRange2(gentity_t * self, gentity_t * target)
;952:{
line 953
;953:  return qfalse;
CNSTI4 0
RETI4
LABELV $376
endproc botTargetInRange2 0 0
export botTargetInRange
proc botTargetInRange 160 28
line 958
;954:}
;955:
;956:qboolean
;957:botTargetInRange(gentity_t * self, gentity_t * target)
;958:{
line 965
;959:  trace_t trace;
;960:  gentity_t *traceEnt;
;961:  vec3_t forward, right, up;
;962:  vec3_t muzzle;
;963:  vec3_t maxs;
;964:
;965:  VectorSet(maxs, 10, 10, 15);
ADDRLP4 124
CNSTF4 1092616192
ASGNF4
ADDRLP4 0
ADDRLP4 124
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 124
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1097859072
ASGNF4
line 967
;966:
;967:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 968
;968:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 973
;969:  //int myGunRange;
;970:  //myGunRange = MGTURRET_RANGE * 3;
;971:
;972:
;973:  if (!self || !target)
ADDRLP4 128
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 128
INDIRU4
EQU4 $382
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 128
INDIRU4
NEU4 $380
LABELV $382
line 974
;974:  {
line 975
;975:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $380
line 978
;976:  }
;977:
;978:  if (!self->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $383
line 979
;979:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $383
line 981
;980:
;981:  if (!target->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $385
line 982
;982:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $385
line 983
;983:  if (target->health <= 0)
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $387
line 984
;984:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $387
line 985
;985:  if (target->client->ps.stats[STAT_HEALTH] <= 0)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $389
line 986
;986:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $389
line 987
;987:  if (target->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $391
line 988
;988:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $391
line 994
;989:
;990:  //To prevent stop following path when isnt need.
;991:  /*if (target->client->ps.origin[2] - self->client->ps.origin[2] >= 50 && self->botCommand == BOT_FOLLOW_PATH)
;992:   return qfalse;*/
;993:
;994:  trap_Trace(&trace, muzzle, self->r.mins, maxs, target->s.pos.trBase, self->s.number, MASK_SHOT);
ADDRLP4 12
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 132
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 995
;995:  traceEnt = &g_entities[trace.entityNum];
ADDRLP4 72
CNSTI4 2476
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 998
;996:
;997:  //check our target is in LOS
;998:  if (!(traceEnt == target))
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $394
line 999
;999:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $394
line 1002
;1000:
;1001:  //Are we on the same level?
;1002:  if (!g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
NEI4 $396
line 1003
;1003:  {
line 1004
;1004:    if (self->client->ps.origin[2] - target->client->ps.origin[2] < -30
ADDRLP4 136
CNSTI4 516
ASGNI4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 28
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
CNSTF4 3253731328
GEF4 $399
ADDRLP4 140
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $399
line 1006
;1005:        && (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS))
;1006:    {
line 1007
;1007:      self->client->pers.cmd.upmove = 30;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 30
ASGNI1
line 1008
;1008:      self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1000
ASGNI4
line 1009
;1009:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $399
line 1012
;1010:    }
;1011:
;1012:    if (self->client->ps.origin[2] - target->client->ps.origin[2] < -100
ADDRLP4 148
CNSTI4 516
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTI4 28
ASGNI4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
SUBF4
CNSTF4 3267887104
GEF4 $401
ADDRLP4 152
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $401
line 1014
;1013:        && (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS))
;1014:    {
line 1015
;1015:      self->client->pers.cmd.upmove = 30;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 30
ASGNI1
line 1016
;1016:      self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1000
ASGNI4
line 1017
;1017:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $377
JUMPV
LABELV $401
line 1019
;1018:    }
;1019:  }
LABELV $396
line 1020
;1020:  return qtrue;
CNSTI4 1
RETI4
LABELV $377
endproc botTargetInRange 160 28
lit
align 4
LABELV $404
byte 4 0
byte 4 0
byte 4 0
export WallInFront
code
proc WallInFront 152 28
line 1025
;1021:}
;1022:
;1023:qboolean
;1024:WallInFront(gentity_t * self)
;1025:{
line 1028
;1026:  vec3_t forward, right, up, muzzle, end;
;1027:  vec3_t top =
;1028:  { 0, 0, 0 };
ADDRLP4 64
ADDRGP4 $404
INDIRB
ASGNB 12
line 1029
;1029:  int vh = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1033
;1030:  trace_t tr;
;1031:  int distance;
;1032:
;1033:  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BG_FindViewheightForClass
CALLV
pop
line 1034
;1034:  top[2] = vh;
ADDRLP4 64+8
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 1045
;1035:
;1036:  //spawn_angles[0] =0;
;1037:  //spawn_angles[1] =90;
;1038:  //spawn_angles[2] =0;
;1039:
;1040:  //This is to fix the view angle when facing floor.
;1041:  //spawn_angles[ YAW ] += 180.0f;
;1042:  //AngleNormalize360( spawn_angles[ YAW ] );
;1043:  //G_SetClientViewAngle( self, spawn_angles );
;1044:
;1045:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1046
;1046:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1047
;1047:  VectorMA(muzzle, 10000, forward, end);
ADDRLP4 140
CNSTF4 1176256512
ASGNF4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1176256512
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1049
;1048:
;1049:  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
ADDRLP4 76
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1051
;1050:
;1051:  distance = Distance(self->s.pos.trBase, tr.endpos);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 76+12
ARGP4
ADDRLP4 148
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 148
INDIRF4
CVFI4 4
ASGNI4
line 1052
;1052:  if (distance < 90)
ADDRLP4 136
INDIRI4
CNSTI4 90
GEI4 $413
line 1053
;1053:  {
line 1054
;1054:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $403
JUMPV
LABELV $413
line 1056
;1055:  }
;1056:  return qfalse;
CNSTI4 0
RETI4
LABELV $403
endproc WallInFront 152 28
lit
align 4
LABELV $416
byte 4 0
byte 4 0
byte 4 0
export selectBetterWay
code
proc selectBetterWay 212 28
line 1061
;1057:}
;1058:
;1059:void
;1060:selectBetterWay(gentity_t * self)
;1061:{
line 1064
;1062:  vec3_t forward, right, up, muzzle, end, tempangle;
;1063:  vec3_t top =
;1064:  { 0, 0, 0 };
ADDRLP4 140
ADDRGP4 $416
INDIRB
ASGNB 12
line 1065
;1065:  int vh = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 1069
;1066:  trace_t tr;
;1067:  int distance1, distance2, distance3;
;1068:
;1069:  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BG_FindViewheightForClass
CALLV
pop
line 1070
;1070:  top[2] = vh;
ADDRLP4 140+8
ADDRLP4 132
INDIRI4
CVIF4 4
ASGNF4
line 1074
;1071:
;1072:  //self->client->ps.delta_angles[1] =
;1073:  //ANGLE2SHORT(self->client->ps.delta_angles[1] - 30);
;1074:  VectorCopy(self->client->ps.viewangles, tempangle);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1076
;1075:
;1076:  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 60);
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTF4 1199570944
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 1114636288
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
ASGNF4
line 1077
;1077:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1078
;1078:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1079
;1079:  VectorMA(muzzle, 1000, forward, end);
ADDRLP4 164
CNSTF4 1148846080
ASGNF4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 164
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 164
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1080
;1080:  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 168
CNSTP4 0
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1081
;1081:  distance1 = Distance(self->s.pos.trBase, tr.endpos);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 60+12
ARGP4
ADDRLP4 172
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 152
ADDRLP4 172
INDIRF4
CVFI4 4
ASGNI4
line 1083
;1082:
;1083:  VectorCopy(tempangle, self->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 120
INDIRB
ASGNB 12
line 1084
;1084:  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 120);
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTF4 1199570944
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
ASGNF4
line 1085
;1085:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1086
;1086:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1087
;1087:  VectorMA(muzzle, 1000, forward, end);
ADDRLP4 180
CNSTF4 1148846080
ASGNF4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 180
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 180
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1088
;1088:  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 184
CNSTP4 0
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1089
;1089:  distance2 = Distance(self->s.pos.trBase, tr.endpos);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 60+12
ARGP4
ADDRLP4 188
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 188
INDIRF4
CVFI4 4
ASGNI4
line 1091
;1090:
;1091:  VectorCopy(tempangle, self->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 120
INDIRB
ASGNB 12
line 1092
;1092:  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 180);
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTF4 1199570944
ADDRLP4 192
INDIRP4
INDIRF4
CNSTF4 1127481344
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
ASGNF4
line 1093
;1093:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1094
;1094:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1095
;1095:  VectorMA(muzzle, 1000, forward, end);
ADDRLP4 196
CNSTF4 1148846080
ASGNF4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 196
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 196
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1096
;1096:  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 200
CNSTP4 0
ASGNP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1097
;1097:  distance3 = Distance(self->s.pos.trBase, tr.endpos);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 60+12
ARGP4
ADDRLP4 204
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 204
INDIRF4
CVFI4 4
ASGNI4
line 1099
;1098:
;1099:  VectorCopy(tempangle, self->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 120
INDIRB
ASGNB 12
line 1101
;1100:
;1101:  if (distance1 > distance2)
ADDRLP4 152
INDIRI4
ADDRLP4 136
INDIRI4
LEI4 $439
line 1102
;1102:  {
line 1103
;1103:    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 60);
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRI4
CNSTI4 16
LSHI4
CNSTI4 3932160
SUBI4
CNSTI4 360
DIVI4
CNSTI4 65535
BANDI4
ASGNI4
line 1104
;1104:  }
ADDRGP4 $440
JUMPV
LABELV $439
line 1105
;1105:  else if (distance2 > distance3)
ADDRLP4 136
INDIRI4
ADDRLP4 156
INDIRI4
LEI4 $441
line 1106
;1106:  {
line 1107
;1107:    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 120);
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRI4
CNSTI4 16
LSHI4
CNSTI4 7864320
SUBI4
CNSTI4 360
DIVI4
CNSTI4 65535
BANDI4
ASGNI4
line 1108
;1108:  }
ADDRGP4 $442
JUMPV
LABELV $441
line 1110
;1109:  else
;1110:  {
line 1111
;1111:    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 180);
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRI4
CNSTI4 16
LSHI4
CNSTI4 11796480
SUBI4
CNSTI4 360
DIVI4
CNSTI4 65535
BANDI4
ASGNI4
line 1112
;1112:  }
LABELV $442
LABELV $440
line 1113
;1113:}
LABELV $415
endproc selectBetterWay 212 28
export botFindClosestEnemy
proc botFindClosestEnemy 4200 16
line 1117
;1114:
;1115:int
;1116:botFindClosestEnemy(gentity_t * self, qboolean includeTeam)
;1117:{
line 1119
;1118:  // return enemy entity index, or -1
;1119:  int vectorRange = MGTURRET_RANGE * 5;
ADDRLP4 4120
CNSTI4 1000
ASGNI4
line 1127
;1120:  int i;
;1121:  int total_entities;
;1122:  int entityList[MAX_GENTITIES];
;1123:  vec3_t range;
;1124:  vec3_t mins, maxs;
;1125:  gentity_t *target;
;1126:
;1127:  int currentNodeType = -1;
ADDRLP4 4148
CNSTI4 -1
ASGNI4
line 1128
;1128:  int nextNodeType = -1;
ADDRLP4 4152
CNSTI4 -1
ASGNI4
line 1129
;1129:  int lastNodeType = -1;
ADDRLP4 4156
CNSTI4 -1
ASGNI4
line 1131
;1130:
;1131:  if (level.numHumanSpawns < 1)
ADDRGP4 level+185092
INDIRI4
CNSTI4 1
GEI4 $444
line 1132
;1132:  {
line 1134
;1133:    //Gonna try to chase enemys in long distances.
;1134:    vectorRange = MGTURRET_RANGE * 10;
ADDRLP4 4120
CNSTI4 2000
ASGNI4
line 1135
;1135:  }
LABELV $444
line 1136
;1136:  if (self->botCommand == BOT_FOLLOW_PATH)
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
CNSTI4 11
NEI4 $447
line 1137
;1137:  {
line 1138
;1138:    currentNodeType = nodes[self->bs.currentNode].type;
ADDRLP4 4148
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ASGNI4
line 1139
;1139:    nextNodeType = nodes[self->bs.nextNode].type;
ADDRLP4 4152
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ASGNI4
line 1140
;1140:    lastNodeType = nodes[self->bs.lastNode].type;
ADDRLP4 4156
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ASGNI4
line 1142
;1141:
;1142:    vectorRange = MGTURRET_RANGE * 1.3;
ADDRLP4 4120
CNSTI4 260
ASGNI4
line 1143
;1143:    if (currentNodeType == NODE_JUMP || nextNodeType == NODE_JUMP || lastNodeType == NODE_JUMP)
ADDRLP4 4160
CNSTI4 6
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRLP4 4160
INDIRI4
EQI4 $455
ADDRLP4 4152
INDIRI4
ADDRLP4 4160
INDIRI4
EQI4 $455
ADDRLP4 4156
INDIRI4
ADDRLP4 4160
INDIRI4
NEI4 $452
LABELV $455
line 1144
;1144:      vectorRange = MGTURRET_RANGE / 3;
ADDRLP4 4120
CNSTI4 66
ASGNI4
LABELV $452
line 1145
;1145:  }
LABELV $447
line 1147
;1146:
;1147:  VectorSet(range, vectorRange, vectorRange, vectorRange);
ADDRLP4 4160
ADDRLP4 4120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 4108
ADDRLP4 4160
INDIRF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4160
INDIRF4
ASGNF4
ADDRLP4 4108+8
ADDRLP4 4120
INDIRI4
CVIF4 4
ASGNF4
line 1148
;1148:  VectorAdd(self->client->ps.origin, range, maxs);
ADDRLP4 4164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4164
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4108
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4136+4
ADDRLP4 4164
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4136+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
ADDF4
ASGNF4
line 1149
;1149:  VectorSubtract(self->client->ps.origin, range, mins);
ADDRLP4 4168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4124
ADDRLP4 4168
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4108
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4124+4
ADDRLP4 4168
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4124+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
SUBF4
ASGNF4
line 1151
;1150:
;1151:  total_entities = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4124
ARGP4
ADDRLP4 4136
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4172
INDIRI4
ASGNI4
line 1154
;1152:
;1153:  // check list for enemies
;1154:  for(i = 0;i < total_entities;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $469
JUMPV
LABELV $466
line 1155
;1155:  {
line 1156
;1156:    target = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1158
;1157:
;1158:    if (target == self)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $470
line 1159
;1159:      continue;
ADDRGP4 $467
JUMPV
LABELV $470
line 1160
;1160:    if (!target->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $472
line 1161
;1161:      continue;
ADDRGP4 $467
JUMPV
LABELV $472
line 1162
;1162:    if (target->client->ps.stats[STAT_PTEAM] == self->client->ps.stats[STAT_PTEAM])
ADDRLP4 4176
CNSTI4 516
ASGNI4
ADDRLP4 4180
CNSTI4 216
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4180
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 4176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4180
INDIRI4
ADDP4
INDIRI4
NEI4 $474
line 1163
;1163:      continue;
ADDRGP4 $467
JUMPV
LABELV $474
line 1165
;1164:
;1165:    if (botTargetInRange(self, target))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 botTargetInRange
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $476
line 1166
;1166:    {
line 1167
;1167:      return entityList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
RETI4
ADDRGP4 $443
JUMPV
LABELV $476
line 1170
;1168:    }
;1169:
;1170:  }
LABELV $467
line 1154
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $469
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $466
line 1172
;1171:
;1172:  if (includeTeam)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $478
line 1173
;1173:  {
line 1175
;1174:    // check list for enemies in team
;1175:    for(i = 0;i < total_entities;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $483
JUMPV
LABELV $480
line 1176
;1176:    {
line 1177
;1177:      target = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1179
;1178:
;1179:      if (target->client && self != target && target->client->ps.stats[STAT_PTEAM]
ADDRLP4 4180
CNSTI4 516
ASGNI4
ADDRLP4 4184
ADDRLP4 0
INDIRP4
ADDRLP4 4180
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $484
ADDRLP4 4188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4188
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $484
ADDRLP4 4192
CNSTI4 216
ASGNI4
ADDRLP4 4184
INDIRP4
ADDRLP4 4192
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4188
INDIRP4
ADDRLP4 4180
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4192
INDIRI4
ADDP4
INDIRI4
NEI4 $484
line 1181
;1180:          == self->client->ps.stats[STAT_PTEAM])
;1181:      {
line 1182
;1182:        if (botTargetInRange(self, target))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4196
ADDRGP4 botTargetInRange
CALLI4
ASGNI4
ADDRLP4 4196
INDIRI4
CNSTI4 0
EQI4 $486
line 1183
;1183:        {
line 1184
;1184:          return entityList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
RETI4
ADDRGP4 $443
JUMPV
LABELV $486
line 1186
;1185:        }
;1186:      }
LABELV $484
line 1187
;1187:    }
LABELV $481
line 1175
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $483
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $480
line 1188
;1188:  }
LABELV $478
line 1190
;1189:
;1190:  return -1;
CNSTI4 -1
RETI4
LABELV $443
endproc botFindClosestEnemy 4200 16
export botGetDistanceBetweenPlayer
proc botGetDistanceBetweenPlayer 8 8
line 1197
;1191:}
;1192:
;1193:// really an int? what if it's too long?
;1194:
;1195:int
;1196:botGetDistanceBetweenPlayer(gentity_t * self, gentity_t * player)
;1197:{
line 1198
;1198:  return Distance(self->s.pos.trBase, player->s.pos.trBase);
ADDRLP4 0
CNSTI4 24
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CVFI4 4
RETI4
LABELV $488
endproc botGetDistanceBetweenPlayer 8 8
export botShootIfTargetInRange
proc botShootIfTargetInRange 20 8
line 1203
;1199:}
;1200:
;1201:qboolean
;1202:botShootIfTargetInRange(gentity_t * self, gentity_t * target)
;1203:{
line 1204
;1204:  float distance = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1208
;1205:
;1206:  //botAimAtTarget(self, self->botEnemy);
;1207:
;1208:  self->client->pers.cmd.buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:  if (self->client->ps.stats[STAT_PTEAM] == PTE_HUMANS) //Human target buildable
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $490
line 1210
;1210:  {
line 1211
;1211:      self->client->pers.cmd.buttons |= BUTTON_ATTACK;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1212
;1212:  }
ADDRGP4 $491
JUMPV
LABELV $490
line 1214
;1213:  else
;1214:  {
line 1215
;1215:    distance = Distance(self->s.origin, self->botEnemy->s.origin);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 92
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1216
;1216:    if (distance <= ZOMBIE_RANGE)
ADDRLP4 0
INDIRF4
CNSTF4 1132462080
GTF4 $492
line 1217
;1217:    {
line 1218
;1218:      self->client->pers.cmd.buttons |= BUTTON_ATTACK;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1219
;1219:    }
LABELV $492
line 1220
;1220:  }
LABELV $491
line 1221
;1221:  return qtrue;
CNSTI4 1
RETI4
LABELV $489
endproc botShootIfTargetInRange 20 8
export botWalk
proc botWalk 12 4
line 1225
;1222:}
;1223:void
;1224:botWalk(gentity_t *self, int speed)
;1225:{
line 1228
;1226:  char validSpeed;
;1227:
;1228:  validSpeed = ClampChar(speed);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ClampChar
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 1230
;1229:
;1230:  self->client->pers.cmd.forwardmove = validSpeed;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 497
ADDP4
ADDRLP4 0
INDIRI1
ASGNI1
line 1231
;1231:  if(g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $495
line 1232
;1232:  {
line 1234
;1233:    //self->client->pers.cmd.forwardmove = validSpeed - 30;
;1234:  }
LABELV $495
line 1235
;1235:  if (speed <= 64)
ADDRFP4 4
INDIRI4
CNSTI4 64
GTI4 $498
line 1236
;1236:  {
line 1238
;1237:
;1238:    self->client->pers.cmd.buttons |= BUTTON_WALKING;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1239
;1239:  }
ADDRGP4 $499
JUMPV
LABELV $498
line 1241
;1240:  else
;1241:  {
line 1242
;1242:    self->client->pers.cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 1243
;1243:  }
LABELV $499
line 1244
;1244:}
LABELV $494
endproc botWalk 12 4
export botCrouch
proc botCrouch 0 4
line 1247
;1245:void
;1246:botCrouch(gentity_t *self)
;1247:{
line 1248
;1248:  G_Printf("Crouch -1\n");
ADDRGP4 $501
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1249
;1249:  self->client->pers.cmd.upmove = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 -1
ASGNI1
line 1250
;1250:}
LABELV $500
endproc botCrouch 0 4
export botJump
proc botJump 0 0
line 1253
;1251:void
;1252:botJump(gentity_t *self, int speed)
;1253:{
line 1254
;1254:  if (self->jumpedTime + 1000 > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2436
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $503
line 1255
;1255:  {
line 1256
;1256:    return;
ADDRGP4 $502
JUMPV
LABELV $503
line 1259
;1257:  }
;1258:
;1259:  self->client->pers.cmd.upmove = speed;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 1260
;1260:  self->jumpedTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2436
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1261
;1261:}
LABELV $502
endproc botJump 0 0
export botCanSeeEnemy
proc botCanSeeEnemy 156 28
line 1264
;1262:qboolean
;1263:botCanSeeEnemy(gentity_t * self)
;1264:{
line 1270
;1265:  trace_t trace;
;1266:  gentity_t *traceEnt;
;1267:  vec3_t forward, right, up;
;1268:  vec3_t muzzle;
;1269:
;1270:  int maxDistance = 1024;
ADDRLP4 100
CNSTI4 1024
ASGNI4
line 1273
;1271:  int distanceToEnemy;
;1272:
;1273:  AngleVectors(self->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1274
;1274:  CalcMuzzlePoint(self, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1276
;1275:
;1276:  if (!self || !self->botEnemy)
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
CNSTU4 0
ASGNU4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
EQU4 $510
ADDRLP4 120
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
NEU4 $508
LABELV $510
line 1277
;1277:  {
line 1278
;1278:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $508
line 1280
;1279:  }
;1280:  if (!self->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $511
line 1281
;1281:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $511
line 1282
;1282:  if (!self->botEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $513
line 1283
;1283:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $513
line 1284
;1284:  if (self->botEnemy->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $515
line 1285
;1285:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $515
line 1286
;1286:  if (self->botEnemy->client->ps.stats[STAT_HEALTH] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $517
line 1287
;1287:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $517
line 1288
;1288:  if (self->botEnemy->client->ps.stats[STAT_PTEAM] != PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $519
line 1289
;1289:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $519
line 1291
;1290:
;1291:  distanceToEnemy = Distance(self->client->ps.origin, self->botEnemy->client->ps.origin);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
CNSTI4 516
ASGNI4
ADDRLP4 136
CNSTI4 20
ASGNI4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
ARGP4
ADDRLP4 140
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 104
ADDRLP4 140
INDIRF4
CVFI4 4
ASGNI4
line 1293
;1292:
;1293:  if (distanceToEnemy > maxDistance)
ADDRLP4 104
INDIRI4
ADDRLP4 100
INDIRI4
LEI4 $521
line 1294
;1294:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $507
JUMPV
LABELV $521
line 1296
;1295:
;1296:  trap_Trace(
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
CNSTI4 516
ASGNI4
ADDRLP4 152
CNSTI4 20
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
INDIRI4
ARGI4
CNSTI4 -65537
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1299
;1297:    &trace, self->client->ps.origin, self->r.mins, self->r.maxs, self->botEnemy->client->ps.origin,
;1298:    self->s.number, MASK_SHOT | ~MASK_PLAYERSOLID);
;1299:  traceEnt = &g_entities[trace.entityNum];
ADDRLP4 60
CNSTI4 2476
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1302
;1300:
;1301:  //check our target is in LOS
;1302:  if (traceEnt == self->botEnemy)
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CVPU4 4
NEU4 $524
line 1303
;1303:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $507
JUMPV
LABELV $524
line 1305
;1304:
;1305:  return qfalse;
CNSTI4 0
RETI4
LABELV $507
endproc botCanSeeEnemy 156 28
export botForgetEnemy
proc botForgetEnemy 0 4
line 1309
;1306:}
;1307:void
;1308:botForgetEnemy(gentity_t *self)
;1309:{
line 1310
;1310:  if (director_debug.integer)
ADDRGP4 director_debug+12
INDIRI4
CNSTI4 0
EQI4 $527
line 1311
;1311:  {
line 1312
;1312:    G_Printf("Forgotten Enemy");
ADDRGP4 $530
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1313
;1313:  }
LABELV $527
line 1314
;1314:  self->botEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
CNSTP4 0
ASGNP4
line 1315
;1315:}
LABELV $526
endproc botForgetEnemy 0 4
export botSelectEnemy
proc botSelectEnemy 48 8
line 1318
;1316:void
;1317:botSelectEnemy(gentity_t *self)
;1318:{
line 1325
;1319:  int i, j;
;1320:  gentity_t *ent;
;1321:  gentity_t *rambo;
;1322:  gentity_t *ent2;
;1323:  gentity_t *other;
;1324:
;1325:  ent = rambo = ent2 = other = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1327
;1326:
;1327:  for(i = level.botslots;i < level.botslots + level.numConnectedClients;i++)
ADDRLP4 12
ADDRGP4 level+190008
INDIRI4
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $532
line 1328
;1328:  {
line 1329
;1329:    ent = &g_entities[i];
ADDRLP4 8
CNSTI4 2476
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1330
;1330:    if (!ent)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $539
line 1331
;1331:      continue;
ADDRGP4 $533
JUMPV
LABELV $539
line 1332
;1332:    if (!ent->client)
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $541
line 1333
;1333:      continue;
ADDRGP4 $533
JUMPV
LABELV $541
line 1334
;1334:    if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $543
line 1335
;1335:      continue;
ADDRGP4 $533
JUMPV
LABELV $543
line 1336
;1336:    if (ent->client->ps.stats[STAT_PTEAM] != PTE_HUMANS)
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $545
line 1337
;1337:      continue;
ADDRGP4 $533
JUMPV
LABELV $545
line 1338
;1338:    if (ent->client->ps.stats[STAT_HEALTH] <= 0 || ent->health <= 0)
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $549
ADDRLP4 8
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $547
LABELV $549
line 1339
;1339:      continue;
ADDRGP4 $533
JUMPV
LABELV $547
line 1341
;1340:
;1341:    other = ent;
ADDRLP4 20
ADDRLP4 8
INDIRP4
ASGNP4
line 1342
;1342:    rambo = ent;
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
line 1344
;1343:
;1344:    for(j = level.botslots;j < level.botslots + level.numConnectedClients;j++)
ADDRLP4 4
ADDRGP4 level+190008
INDIRI4
ASGNI4
ADDRGP4 $553
JUMPV
LABELV $550
line 1345
;1345:    {
line 1346
;1346:      ent2 = &g_entities[j];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1347
;1347:      if (!ent2)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $557
line 1348
;1348:        continue;
ADDRGP4 $551
JUMPV
LABELV $557
line 1349
;1349:      if (!ent2->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $559
line 1350
;1350:        continue;
ADDRGP4 $551
JUMPV
LABELV $559
line 1351
;1351:      if (i == j)
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $561
line 1352
;1352:        continue;
ADDRGP4 $551
JUMPV
LABELV $561
line 1353
;1353:      if (ent2->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $563
line 1354
;1354:        continue;
ADDRGP4 $551
JUMPV
LABELV $563
line 1355
;1355:      if (ent2->client->ps.stats[STAT_PTEAM] != PTE_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $565
line 1356
;1356:        continue;
ADDRGP4 $551
JUMPV
LABELV $565
line 1357
;1357:      if (ent2->client->ps.stats[STAT_HEALTH] <= 0 || ent2->health <= 0)
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $569
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
GTI4 $567
LABELV $569
line 1358
;1358:        continue;
ADDRGP4 $551
JUMPV
LABELV $567
line 1361
;1359:
;1360:      //G_Printf("Checking visibility from %s to %s\n", ent->client->pers.netname, ent2->client->pers.netname);
;1361:      if (G_Visible(ent, ent2))
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $570
line 1362
;1362:      {
line 1363
;1363:        rambo = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1364
;1364:        break;
ADDRGP4 $552
JUMPV
LABELV $570
line 1366
;1365:      }
;1366:    }
LABELV $551
line 1344
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $553
ADDRLP4 4
INDIRI4
ADDRGP4 level+190008
INDIRI4
ADDRGP4 level+173940
INDIRI4
ADDI4
LTI4 $550
LABELV $552
line 1367
;1367:    if (rambo)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $572
line 1368
;1368:      break;
ADDRGP4 $534
JUMPV
LABELV $572
line 1369
;1369:  }
LABELV $533
line 1327
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $535
ADDRLP4 12
INDIRI4
ADDRGP4 level+190008
INDIRI4
ADDRGP4 level+173940
INDIRI4
ADDI4
LTI4 $532
LABELV $534
line 1371
;1370:
;1371:  if (rambo)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
line 1372
;1372:  {
line 1373
;1373:    self->botEnemy = rambo;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1374
;1374:  }
ADDRGP4 $575
JUMPV
LABELV $574
line 1375
;1375:  else if (other)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $576
line 1376
;1376:  {
line 1377
;1377:    self->botEnemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 1378
;1378:  }
LABELV $576
LABELV $575
line 1379
;1379:}
LABELV $531
endproc botSelectEnemy 48 8
export G_BotAimAt
proc G_BotAimAt 124 16
line 1390
;1380:
;1381://Author: f0rqu3
;1382://Trembot code
;1383:
;1384://*************************
;1385://*
;1386://* AIMING STUFF
;1387://*
;1388://*************************
;1389:void G_BotAimAt( gentity_t *self, vec3_t target, usercmd_t *rAngles)
;1390:{
line 1397
;1391:        vec3_t aimVec, oldAimVec, aimAngles;
;1392:        vec3_t refNormal, grapplePoint, xNormal, viewBase;
;1393:        float turnAngle;
;1394:        int i;
;1395:        vec3_t forward;
;1396:
;1397:        if( ! (self && self->client) )
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $581
ADDRLP4 104
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
NEU4 $579
LABELV $581
line 1398
;1398:                return;
ADDRGP4 $578
JUMPV
LABELV $579
line 1400
;1399:
;1400:        VectorCopy( self->s.pos.trBase, viewBase );
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1401
;1401:        viewBase[2] += self->client->ps.viewheight;
ADDRLP4 52+8
ADDRLP4 52+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1403
;1402:
;1403:        VectorSubtract( target, viewBase, aimVec );
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 52+8
INDIRF4
SUBF4
ASGNF4
line 1404
;1404:        VectorCopy(aimVec, oldAimVec);
ADDRLP4 80
ADDRLP4 28
INDIRB
ASGNB 12
line 1406
;1405:
;1406:        {
line 1407
;1407:        VectorSet(refNormal, 0.0f, 0.0f, 1.0f);
ADDRLP4 116
CNSTF4 0
ASGNF4
ADDRLP4 16
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1408
;1408:        VectorCopy( self->client->ps.grapplePoint, grapplePoint);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1410
;1409:        //cross the reference normal and the surface normal to get the rotation axis
;1410:        CrossProduct( refNormal, grapplePoint, xNormal );
ADDRLP4 16
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1411
;1411:        VectorNormalize( xNormal );
ADDRLP4 64
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1412
;1412:        turnAngle = RAD2DEG( acos( DotProduct( refNormal, grapplePoint ) ) );
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 120
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 76
CNSTF4 1127481344
ADDRLP4 120
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1414
;1413:        //G_Printf("turn angle: %f\n", turnAngle);
;1414:        }
line 1416
;1415:
;1416:       if( turnAngle != 0.0f)
ADDRLP4 76
INDIRF4
CNSTF4 0
EQF4 $593
line 1417
;1417:                RotatePointAroundVector( aimVec, xNormal, oldAimVec, -turnAngle);
ADDRLP4 28
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 76
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
LABELV $593
line 1419
;1418:
;1419:        vectoangles( aimVec, aimAngles );
ADDRLP4 28
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1421
;1420:
;1421:        VectorSet(self->client->ps.delta_angles, 0.0f, 0.0f, 0.0f);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 1423
;1422:
;1423:        for( i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $595
line 1424
;1424:        {
line 1425
;1425:                aimAngles[i] = ANGLE2SHORT(aimAngles[i]);
ADDRLP4 116
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTF4 1199570944
ADDRLP4 116
INDIRP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
ASGNF4
line 1426
;1426:        }
LABELV $596
line 1423
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $595
line 1428
;1427:
;1428:        AngleVectors( self->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1430
;1429:
;1430:        rAngles->angles[0] = aimAngles[0];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1431
;1431:        rAngles->angles[1] = aimAngles[1];
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4+4
INDIRF4
CVFI4 4
ASGNI4
line 1432
;1432:        rAngles->angles[2] = aimAngles[2];
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4+8
INDIRF4
CVFI4 4
ASGNI4
line 1433
;1433:}
LABELV $578
endproc G_BotAimAt 124 16
import VectorToAngles
import ACEND_FindClosestSpawnNodeToEnemy
import ACEND_nodeInUse
import ACEND_setNextNode
import ACEND_setCurrentNode
import ACEND_pointVisibleFromEntity
import ACEND_selectNextNode
import ACESP_SetupBotState
import ACESP_BotConnect
import ACESP_RemoveBot
import ACESP_SpawnBot
import ACESP_SetName
import ACESP_FindFreeClient
import ACESP_Respawn
import ACESP_PutClientInServer
import ACESP_HoldSpawn
import ACESP_InitBots
import ACEND_CheckForDucking
import ACEND_RemoveNodeEdge
import ACEND_UpdateNodeEdge
import ACEND_NodeTypeToString
import ACEND_AddNode
import ACEND_ShowPath
import ACEND_DrawPath
import ACEND_ShowNode
import ACEND_InitNodes
import ACEND_PathMap
import ACEND_CheckForLadder
import ACEND_GrapFired
import ACEND_FollowPath
import ACEND_SetGoal
import ACEND_FindClosestReachableNode
import ACEND_FindCloseReachableNode
import ACEND_FindCost
import ACEMV_Wander
import ACEMV_Attack
import ACEMV_Move
import ACEMV_SpecialMove
import ACEIT_BuildItemNodeTable
import ACEIT_ItemNeed
import ACEIT_ChangeWeapon
import ACEIT_IsReachable
import ACEIT_IsVisible
import ACEIT_PlayerRemoved
import ACEIT_PlayerAdded
import ACECM_Commands
import ACEAI_ChooseWeapon
import ACEAI_FindEnemy
import ACEAI_PickShortRangeGoal
import ACEAI_PickLongRangeGoal
import ACEAI_CheckServerCommands
import ACEAI_Think
import ACEAI_StartFrame
import CopyToBodyQue
import SelectSpawnPoint
import ClientThink_real
import LookAtKiller
import nodes
import numNodes
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
import G_healFriend
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
import drawRedBall
import G_FindRadius
import G_ProjectSource
import pointBehindWall
import spawnGridNode
import convertGridToWorld
import convertWorldToGrid
import fillGrid
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
import G_WinBadge
import G_WriteSessionData
import G_InitSessionData
import G_ReadSessionData
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
LABELV $530
byte 1 70
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $501
byte 1 67
byte 1 114
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 45
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $246
byte 1 87
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 111
byte 1 32
byte 1 105
byte 1 109
byte 1 32
byte 1 103
byte 1 111
byte 1 110
byte 1 110
byte 1 97
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $216
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $158
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $152
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $149
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $143
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $140
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 114
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $134
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 104
byte 1 97
byte 1 118
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 109
byte 1 98
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $124
byte 1 39
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 0
align 1
LABELV $119
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $114
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $113
byte 1 56
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $112
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $105
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 10
byte 1 0
