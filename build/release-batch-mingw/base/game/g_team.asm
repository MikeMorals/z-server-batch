export PrintMsg
code
proc PrintMsg 1048 12
file "..\..\..\..\src/game/g_team.c"
line 28
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
;26:// NULL for everyone
;27:
;28:void QDECL PrintMsg(gentity_t *ent, const char *fmt, ...) {
line 33
;29:  char msg[ 1024 ];
;30:  va_list argptr;
;31:  char *p;
;32:
;33:  va_start(argptr, fmt);
ADDRLP4 1028
ADDRFP4 4+4
ASGNP4
line 35
;34:
;35:  if (vsprintf(msg, fmt, argptr) > sizeof ( msg))
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CVIU4 4
CNSTU4 1024
LEU4 $86
line 36
;36:    G_Error("PrintMsg overrun");
ADDRGP4 $88
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $86
line 38
;37:
;38:  va_end(argptr);
ADDRLP4 1028
CNSTP4 0
ASGNP4
ADDRGP4 $90
JUMPV
LABELV $89
line 42
;39:
;40:  // double quotes are bad
;41:  while ((p = strchr(msg, '"')) != NULL)
;42:    *p = '\'';
ADDRLP4 0
INDIRP4
CNSTI1 39
ASGNI1
LABELV $90
line 41
ADDRLP4 4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 44
;43:
;44:  trap_SendServerCommand(((ent == NULL) ? -1 : ent - g_entities), va("print \"%s\"", msg));
ADDRGP4 $93
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
LABELV $95
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 45
;45:}
LABELV $84
endproc PrintMsg 1048 12
export OnSameTeam
proc OnSameTeam 16 0
line 52
;46:
;47:/*
;48:==============
;49:OnSameTeam
;50:==============
;51: */
;52:qboolean OnSameTeam(gentity_t *ent1, gentity_t *ent2) {
line 53
;53:  if (!ent1->client || !ent2->client)
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $99
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $97
LABELV $99
line 54
;54:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $96
JUMPV
LABELV $97
line 56
;55:
;56:  if (ent1->client->pers.teamSelection == ent2->client->pers.teamSelection)
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRLP4 12
CNSTI4 628
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $100
line 57
;57:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $96
JUMPV
LABELV $100
line 59
;58:
;59:  return qfalse;
CNSTI4 0
RETI4
LABELV $96
endproc OnSameTeam 16 0
export Team_GetLocation
proc Team_GetLocation 48 8
line 69
;60:}
;61:
;62:/*
;63:===========
;64:Team_GetLocation
;65:
;66:Report a location for the player. Uses placed nearby target_location entities
;67:============
;68: */
;69:gentity_t *Team_GetLocation(gentity_t *ent) {
line 74
;70:  gentity_t *eloc, *best;
;71:  float bestlen, len;
;72:  vec3_t origin;
;73:
;74:  best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 75
;75:  bestlen = 3.0f * 8192.0f * 8192.0f;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 77
;76:
;77:  VectorCopy(ent->r.currentOrigin, origin);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 79
;78:
;79:  for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+185084
INDIRP4
ASGNP4
ADDRGP4 $106
JUMPV
LABELV $103
line 80
;80:    len = (origin[ 0 ] - eloc->r.currentOrigin[ 0 ]) * (origin[ 0 ] - eloc->r.currentOrigin[ 0 ])
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 84
;81:            + (origin[ 1 ] - eloc->r.currentOrigin[ 1 ]) * (origin[ 1 ] - eloc->r.currentOrigin[ 1 ])
;82:            + (origin[ 2 ] - eloc->r.currentOrigin[ 2 ]) * (origin[ 2 ] - eloc->r.currentOrigin[ 2 ]);
;83:
;84:    if (len > bestlen)
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $112
line 85
;85:      continue;
ADDRGP4 $104
JUMPV
LABELV $112
line 87
;86:
;87:    if (!trap_InPVS(origin, eloc->r.currentOrigin))
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $114
line 88
;88:      continue;
ADDRGP4 $104
JUMPV
LABELV $114
line 90
;89:
;90:    bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 91
;91:    best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 92
;92:  }
LABELV $104
line 79
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
LABELV $106
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
line 94
;93:
;94:  return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $102
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 104
;95:}
;96:
;97:/*
;98:===========
;99:Team_GetLocationMsg
;100:
;101:Report a location message for the player. Uses placed nearby target_location entities
;102:============
;103: */
;104:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen) {
line 107
;105:  gentity_t *best;
;106:
;107:  best = Team_GetLocation(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 109
;108:
;109:  if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $117
line 110
;110:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $116
JUMPV
LABELV $117
line 112
;111:
;112:  if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $119
line 113
;113:    if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 0
GEI4 $121
line 114
;114:      best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 0
ASGNI4
LABELV $121
line 116
;115:
;116:    if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 7
LEI4 $123
line 117
;117:      best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 7
ASGNI4
LABELV $123
line 119
;118:
;119:    Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $125
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 120
;120:  } else
ADDRGP4 $120
JUMPV
LABELV $119
line 121
;121:    Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $120
line 123
;122:
;123:  return qtrue;
CNSTI4 1
RETI4
LABELV $116
endproc Team_GetLocationMsg 12 24
proc SortClients 0 0
line 128
;124:}
;125:
;126:/*---------------------------------------------------------------------------*/
;127:
;128:static int QDECL SortClients(const void *a, const void *b) {
line 129
;129:  return *(int *) a - *(int *) b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $127
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9396 28
line 141
;130:}
;131:
;132:/*
;133:==================
;134:TeamplayLocationsMessage
;135:
;136:Format:
;137:  clientNum location health armor weapon powerups
;138:
;139:==================
;140: */
;141:void TeamplayInfoMessage(gentity_t *ent) {
line 151
;142:  char entry[ 1024 ];
;143:  char string[ 8192 ];
;144:  int stringlength;
;145:  int i, j;
;146:  gentity_t *player;
;147:  int cnt;
;148:  int h;
;149:  int clients[ TEAM_MAXOVERLAY ];
;150:
;151:  if (!ent->client->pers.teamInfo)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $129
line 152
;152:    return;
ADDRGP4 $128
JUMPV
LABELV $129
line 153
;153:  if(ent->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $131
line 154
;154:    return;
ADDRGP4 $128
JUMPV
LABELV $131
line 156
;155:
;156:  for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9368
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9368
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9368
INDIRI4
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $133
line 157
;157:    player = g_entities + level.sortedClients[ i ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173952
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 159
;158:
;159:    if (player->inuse && player->client->sess.sessionTeam ==
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
ADDRLP4 9376
CNSTI4 516
ASGNI4
ADDRLP4 9380
CNSTI4 1120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9376
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9376
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRI4
NEI4 $139
line 161
;160:            ent->client->sess.sessionTeam)
;161:      clients[ cnt++ ] = level.sortedClients[ i ];
ADDRLP4 9384
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9384
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9388
CNSTI4 2
ASGNI4
ADDRLP4 9384
INDIRI4
ADDRLP4 9388
INDIRI4
LSHI4
ADDRLP4 9240
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9388
INDIRI4
LSHI4
ADDRGP4 level+173952
ADDP4
INDIRI4
ASGNI4
LABELV $139
line 162
;162:  }
LABELV $134
line 156
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $136
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $142
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $133
LABELV $142
line 165
;163:
;164:  // We have the top eight players, sort them by clientNum
;165:  qsort(clients, cnt, sizeof ( clients[ 0 ]), SortClients);
ADDRLP4 9240
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 168
;166:
;167:  // send the latest information on all clients
;168:  string[ 0 ] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 169
;169:  stringlength = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 171
;170:
;171:  for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $146
JUMPV
LABELV $143
line 172
;172:    player = g_entities + i;
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 174
;173:
;174:    if (player->inuse && player->client->sess.sessionTeam ==
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $148
ADDRLP4 9380
CNSTI4 516
ASGNI4
ADDRLP4 9384
CNSTI4 1120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $148
line 175
;175:            ent->client->sess.sessionTeam) {
line 176
;176:      h = player->client->ps.stats[ STAT_HEALTH ];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 178
;177:
;178:      if (h < 0)
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $150
line 179
;179:        h = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $150
line 181
;180:
;181:      Com_sprintf(entry, sizeof ( entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $152
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 187
;182:              " %i %i %i %i",
;183:              //        level.sortedClients[i], h, a,
;184:              i, h,
;185:              player->client->ps.weapon, player->s.powerups);
;186:
;187:      j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 9392
INDIRI4
ASGNI4
line 189
;188:
;189:      if (stringlength + j > sizeof ( string))
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $153
line 190
;190:        break;
ADDRGP4 $145
JUMPV
LABELV $153
line 192
;191:
;192:      strcpy(string + stringlength, entry);
ADDRLP4 1040
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 193
;193:      stringlength += j;
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
ASGNI4
line 194
;194:      cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 195
;195:    }
LABELV $148
line 196
;196:  }
LABELV $144
line 171
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $146
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $155
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $143
LABELV $155
LABELV $145
line 198
;197:
;198:  trap_SendServerCommand(ent - g_entities, va("tinfo %i %s", cnt, string));
ADDRGP4 $156
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 9376
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 9376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 199
;199:}
LABELV $128
endproc TeamplayInfoMessage 9396 28
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 201
;200:
;201:void CheckTeamStatus(void) {
line 205
;202:  int i;
;203:  gentity_t *loc, *ent;
;204:
;205:  if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+173928
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $158
line 206
;206:    level.lastTeamLocationTime = level.time;
ADDRGP4 level+173928
ADDRGP4 level+28
INDIRI4
ASGNI4
line 208
;207:
;208:    for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $164
line 209
;209:      ent = g_entities + i;
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 210
;210:      if (ent->client->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $169
line 211
;211:        continue;
ADDRGP4 $165
JUMPV
LABELV $169
line 213
;212:
;213:      if (ent->inuse && (ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS ||
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $171
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $173
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $171
LABELV $173
line 214
;214:              ent->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS)) {
line 216
;215:
;216:        loc = Team_GetLocation(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 218
;217:
;218:        if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 219
;219:          ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
line 221
;220:        else
;221:          ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
LABELV $175
line 222
;222:      }
LABELV $171
line 223
;223:    }
LABELV $165
line 208
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $167
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $164
line 225
;224:
;225:    for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 226
;226:      ent = g_entities + i;
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 227
;227:      if (ent->client->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $181
line 228
;228:        continue;
ADDRGP4 $177
JUMPV
LABELV $181
line 230
;229:
;230:      if (ent->inuse && (ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS ||
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $183
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $185
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $183
LABELV $185
line 232
;231:              ent->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS))
;232:        TeamplayInfoMessage(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
LABELV $183
line 233
;233:    }
LABELV $177
line 225
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $176
line 234
;234:  }
LABELV $158
line 237
;235:
;236:  //Warn on unbalanced teams
;237:  if (g_teamImbalanceWarnings.integer && !level.intermissiontime && level.time - level.lastTeamUnbalancedTime > (g_teamImbalanceWarnings.integer * 1000) && level.numTeamWarnings < 3) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_teamImbalanceWarnings+12
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $186
ADDRGP4 level+185040
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $186
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+189980
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_teamImbalanceWarnings+12
INDIRI4
MULI4
LEI4 $186
ADDRGP4 level+189984
INDIRI4
CNSTI4 3
GEI4 $186
line 238
;238:    level.lastTeamUnbalancedTime = level.time;
ADDRGP4 level+189980
ADDRGP4 level+28
INDIRI4
ASGNI4
line 239
;239:    if (level.numAlienSpawns > 0 && level.numHumanClients - level.numAlienClients > 2) {
ADDRGP4 level+185088
INDIRI4
CNSTI4 0
LEI4 $196
ADDRGP4 level+185100
INDIRI4
ADDRGP4 level+185096
INDIRI4
SUBI4
CNSTI4 2
LEI4 $196
line 241
;240:      //trap_SendServerCommand (-1, "print \"Teams are unbalanced. Humans have more players.\n Humans will keep their points when switching teams.\n\"");
;241:      level.numTeamWarnings++;
ADDRLP4 16
ADDRGP4 level+189984
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 242
;242:    } else if (level.numHumanSpawns > 0 && level.numAlienClients - level.numHumanClients > 2) {
ADDRGP4 $197
JUMPV
LABELV $196
ADDRGP4 level+185092
INDIRI4
CNSTI4 0
LEI4 $202
ADDRGP4 level+185096
INDIRI4
ADDRGP4 level+185100
INDIRI4
SUBI4
CNSTI4 2
LEI4 $202
line 244
;243:      //trap_SendServerCommand (-1, "print \"Teams are unbalanced. Aliens have more players.\n Aliens will keep their points when switching teams.\n\"");
;244:      level.numTeamWarnings++;
ADDRLP4 16
ADDRGP4 level+189984
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 245
;245:    } else {
ADDRGP4 $203
JUMPV
LABELV $202
line 246
;246:      level.numTeamWarnings = 0;
ADDRGP4 level+189984
CNSTI4 0
ASGNI4
line 247
;247:    }
LABELV $203
LABELV $197
line 248
;248:  }
LABELV $186
line 249
;249:}
LABELV $157
endproc CheckTeamStatus 24 4
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
import G_WinBadge
import G_WriteSessionData
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_DefragmentMemory
import G_Free
import G_InitMemory
import G_Alloc
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
LABELV $156
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $152
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
byte 1 0
align 1
LABELV $126
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $93
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $88
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 77
byte 1 115
byte 1 103
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 110
byte 1 0
