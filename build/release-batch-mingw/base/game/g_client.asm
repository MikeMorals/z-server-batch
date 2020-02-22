data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 12 12
file "..\..\..\..\src/game/g_client.c"
line 43
;1:/*
;2: ===========================================================================
;3: Copyright (C) 1999-2005 Id Software, Inc.
;4: Copyright (C) 2000-2006 Tim Angus
;5:
;6: This file is part of Tremulous.
;7:
;8: Tremulous is free software; you can redistribute it
;9: and/or modify it under the terms of the GNU General Public License as
;10: published by the Free Software Foundation; either version 2 of the License,
;11: or (at your option) any later version.
;12:
;13: Tremulous is distributed in the hope that it will be
;14: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16: GNU General Public License for more details.
;17:
;18: You should have received a copy of the GNU General Public License
;19: along with Tremulous; if not, write to the Free Software
;20: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21: ===========================================================================
;22: */
;23:
;24:#include "g_local.h"
;25:#include "acebot.h"
;26:
;27:// g_client.c -- client functions that don't happen every frame
;28:
;29:static vec3_t playerMins =
;30:{ -15, -15, -24 };
;31:static vec3_t playerMaxs =
;32:{ 15, 15, 32 };
;33:
;34:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;35: potential spawning position for deathmatch games.
;36: The first time a player enters the game, they will be at an 'initial' spot.
;37: Targets will be fired when someone spawns in on them.
;38: "nobots" will prevent bots from using this spot.
;39: "nohumans" will prevent non-bots from using this spot.
;40: */
;41:void
;42:SP_info_player_deathmatch(gentity_t *ent)
;43:{
line 46
;44:  int i;
;45:
;46:  G_SpawnInt("nobots", "0", &i);
ADDRGP4 $88
ARGP4
ADDRGP4 $89
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 48
;47:
;48:  if (i)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $90
line 49
;49:    ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
LABELV $90
line 51
;50:
;51:  G_SpawnInt("nohumans", "0", &i);
ADDRGP4 $92
ARGP4
ADDRGP4 $89
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 52
;52:  if (i)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $93
line 53
;53:    ent->flags |= FL_NO_HUMANS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $93
line 54
;54:}
LABELV $87
endproc SP_info_player_deathmatch 12 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 61
;55:
;56:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;57: equivelant to info_player_deathmatch
;58: */
;59:void
;60:SP_info_player_start(gentity_t *ent)
;61:{
line 62
;62:  ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $96
ASGNP4
line 63
;63:  SP_info_player_deathmatch(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 64
;64:}
LABELV $95
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 71
;65:
;66:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;67: The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;68: */
;69:void
;70:SP_info_player_intermission(gentity_t *ent)
;71:{
line 72
;72:}
LABELV $97
endproc SP_info_player_intermission 0 0
export SP_info_alien_intermission
proc SP_info_alien_intermission 0 0
line 79
;73:
;74:/*QUAKED info_alien_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;75: The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;76: */
;77:void
;78:SP_info_alien_intermission(gentity_t *ent)
;79:{
line 80
;80:}
LABELV $98
endproc SP_info_alien_intermission 0 0
export SP_info_human_intermission
proc SP_info_human_intermission 0 0
line 87
;81:
;82:/*QUAKED info_human_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;83: The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;84: */
;85:void
;86:SP_info_human_intermission(gentity_t *ent)
;87:{
line 88
;88:}
LABELV $99
endproc SP_info_human_intermission 0 0
export G_AddCreditToClient
proc G_AddCreditToClient 8 0
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVII2 4
ASGNI2
line 97
;89:
;90:/*
;91: ===============
;92: G_AddCreditToClient
;93: ===============
;94: */
;95:void
;96:G_AddCreditToClient(gclient_t *client, short credit, qboolean cap)
;97:{
line 98
;98:  if (!client)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 99
;99:    return;
ADDRGP4 $100
JUMPV
LABELV $101
line 102
;100:
;101:  //if we're already at the max and trying to add credit then stop
;102:  if (cap)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $103
line 103
;103:  {
line 104
;104:    if (client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $105
line 105
;105:    {
line 106
;106:      if (client->pers.credit >= ALIEN_MAX_KILLS && credit > 0)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $106
ADDRFP4 4
INDIRI2
CVII4 2
CNSTI4 0
LEI4 $106
line 107
;107:        return;
ADDRGP4 $100
JUMPV
line 108
;108:    }
LABELV $105
line 109
;109:    else if (client->pers.teamSelection == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $109
line 110
;110:    {
line 111
;111:      if (client->pers.credit >= HUMAN_MAX_CREDITS && credit > 0)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $111
ADDRFP4 4
INDIRI2
CVII4 2
CNSTI4 0
LEI4 $111
line 112
;112:        return;
ADDRGP4 $100
JUMPV
LABELV $111
line 113
;113:    }
LABELV $109
LABELV $106
line 114
;114:  }
LABELV $103
line 116
;115:
;116:  client->pers.credit += credit;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI2
CVII4 2
ADDI4
ASGNI4
line 118
;117:
;118:  if (cap)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $113
line 119
;119:  {
line 120
;120:    if (client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $115
line 121
;121:    {
line 122
;122:      if (client->pers.credit > ALIEN_MAX_KILLS)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 2000
LEI4 $116
line 123
;123:        client->pers.credit = ALIEN_MAX_KILLS;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTI4 2000
ASGNI4
line 124
;124:    }
ADDRGP4 $116
JUMPV
LABELV $115
line 125
;125:    else if (client->pers.teamSelection == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $119
line 126
;126:    {
line 127
;127:      if (client->pers.credit > HUMAN_MAX_CREDITS)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 2000
LEI4 $121
line 128
;128:        client->pers.credit = HUMAN_MAX_CREDITS;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTI4 2000
ASGNI4
LABELV $121
line 129
;129:    }
LABELV $119
LABELV $116
line 130
;130:  }
LABELV $113
line 132
;131:
;132:  if (client->pers.credit < 0)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
GEI4 $123
line 133
;133:    client->pers.credit = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTI4 0
ASGNI4
LABELV $123
line 136
;134:
;135:  // keep PERS_CREDIT in sync if not following 
;136:  if (client->sess.spectatorState != SPECTATOR_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
EQI4 $125
line 137
;137:    client->ps.persistant[PERS_CREDIT] = client->pers.credit;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ASGNI4
LABELV $125
line 138
;138:}
LABELV $100
endproc G_AddCreditToClient 8 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 156
;139:
;140:/*
;141: =======================================================================
;142:
;143: G_SelectSpawnPoint
;144:
;145: =======================================================================
;146: */
;147:
;148:/*
;149: ================
;150: SpotWouldTelefrag
;151:
;152: ================
;153: */
;154:qboolean
;155:SpotWouldTelefrag(gentity_t *spot)
;156:{
line 162
;157:  int i, num;
;158:  int touch[MAX_GENTITIES];
;159:  gentity_t *hit;
;160:  vec3_t mins, maxs;
;161:
;162:  VectorAdd(spot->s.origin, playerMins, mins);
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 163
;163:  VectorAdd(spot->s.origin, playerMaxs, maxs);
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 164
;164:  num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 166
;165:
;166:  for(i = 0;i < num;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
line 167
;167:  {
line 168
;168:    hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 170
;169:    //if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;170:    if (hit->client)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 171
;171:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $127
JUMPV
LABELV $140
line 172
;172:  }
LABELV $137
line 166
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $136
line 174
;173:
;174:  return qfalse;
CNSTI4 0
RETI4
LABELV $127
endproc SpotWouldTelefrag 4144 16
export G_SelectNearestDeathmatchSpawnPoint
proc G_SelectNearestDeathmatchSpawnPoint 40 12
line 188
;175:}
;176:
;177:/*
;178: ================
;179: G_SelectNearestDeathmatchSpawnPoint
;180:
;181: Find the spot that we DON'T want to use
;182: ================
;183: */
;184:#define MAX_SPAWN_POINTS  128
;185:
;186:gentity_t *
;187:G_SelectNearestDeathmatchSpawnPoint(vec3_t from)
;188:{
line 194
;189:  gentity_t *spot;
;190:  vec3_t delta;
;191:  float dist, nearestDist;
;192:  gentity_t *nearestSpot;
;193:
;194:  nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 195
;195:  nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 196
;196:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $143
line 199
;197:
;198:  while((spot = G_Find(spot, FOFS(classname), "info_player_deathmatch")) != NULL)
;199:  {
line 200
;200:    VectorSubtract(spot->s.origin, from, delta);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 201
;201:    dist = VectorLength(delta);
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 203
;202:
;203:    if (dist < nearestDist)
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $148
line 204
;204:    {
line 205
;205:      nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 206
;206:      nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 207
;207:    }
LABELV $148
line 208
;208:  }
LABELV $144
line 198
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 210
;209:
;210:  return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $142
endproc G_SelectNearestDeathmatchSpawnPoint 40 12
export G_SelectRandomDeathmatchSpawnPoint
proc G_SelectRandomDeathmatchSpawnPoint 536 12
line 224
;211:}
;212:
;213:/*
;214: ================
;215: G_SelectRandomDeathmatchSpawnPoint
;216:
;217: go to a random point that doesn't telefrag
;218: ================
;219: */
;220:#define MAX_SPAWN_POINTS  128
;221:
;222:gentity_t *
;223:G_SelectRandomDeathmatchSpawnPoint(void)
;224:{
line 230
;225:  gentity_t *spot;
;226:  int count;
;227:  int selection;
;228:  gentity_t * spots[MAX_SPAWN_POINTS];
;229:
;230:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 231
;231:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $151
line 234
;232:
;233:  while((spot = G_Find(spot, FOFS(classname), "info_player_deathmatch")) != NULL)
;234:  {
line 235
;235:    if (SpotWouldTelefrag(spot))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $154
line 236
;236:      continue;
ADDRGP4 $152
JUMPV
LABELV $154
line 238
;237:
;238:    spots[count] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 239
;239:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 240
;240:  }
LABELV $152
line 233
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 242
;241:
;242:  if (!count) // no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $156
line 243
;243:    return G_Find(NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $150
JUMPV
LABELV $156
line 245
;244:
;245:  selection = rand() % count;
ADDRLP4 532
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 532
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 246
;246:  return spots[selection];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $150
endproc G_SelectRandomDeathmatchSpawnPoint 536 12
export G_SelectRandomFurthestSpawnPoint
proc G_SelectRandomFurthestSpawnPoint 572 12
line 258
;247:}
;248:
;249:/*
;250: ===========
;251: G_SelectRandomFurthestSpawnPoint
;252:
;253: Chooses a player start, deathmatch start, etc
;254: ============
;255: */
;256:gentity_t *
;257:G_SelectRandomFurthestSpawnPoint(vec3_t avoidPoint, vec3_t origin, vec3_t angles)
;258:{
line 266
;259:  gentity_t *spot;
;260:  vec3_t delta;
;261:  float dist;
;262:  float list_dist[64];
;263:  gentity_t * list_spot[64];
;264:  int numSpots, rnd, i, j;
;265:
;266:  numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 267
;267:  spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $159
line 270
;268:
;269:  while((spot = G_Find(spot, FOFS(classname), "info_player_deathmatch")) != NULL)
;270:  {
line 271
;271:    if (SpotWouldTelefrag(spot))
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $162
line 272
;272:      continue;
ADDRGP4 $160
JUMPV
LABELV $162
line 274
;273:
;274:    VectorSubtract(spot->s.origin, avoidPoint, delta);
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 275
;275:    dist = VectorLength(delta);
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 277
;276:
;277:    for(i = 0;i < numSpots;i++)
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 278
;278:    {
line 279
;279:      if (dist > list_dist[i])
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $170
line 280
;280:      {
line 281
;281:        if (numSpots >= 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $172
line 282
;282:          numSpots = 64 - 1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $172
line 284
;283:
;284:        for(j = numSpots;j > i;j--)
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $174
line 285
;285:        {
line 286
;286:          list_dist[j] = list_dist[j - 1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 287
;287:          list_spot[j] = list_spot[j - 1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 288
;288:        }
LABELV $175
line 284
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $177
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $174
line 290
;289:
;290:        list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 291
;291:        list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 292
;292:        numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 294
;293:
;294:        if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $168
line 295
;295:          numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 297
;296:
;297:        break;
ADDRGP4 $168
JUMPV
LABELV $170
line 299
;298:      }
;299:    }
LABELV $167
line 277
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $166
LABELV $168
line 301
;300:
;301:    if (i >= numSpots && numSpots < 64)
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $182
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $182
line 302
;302:    {
line 303
;303:      list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 304
;304:      list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 305
;305:      numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 306
;306:    }
LABELV $182
line 307
;307:  }
LABELV $160
line 269
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 309
;308:
;309:  if (!numSpots)
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $184
line 310
;310:  {
line 311
;311:    spot = G_Find(NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 313
;312:
;313:    if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 314
;314:      G_Error("Couldn't find a spawn point");
ADDRGP4 $188
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $186
line 316
;315:
;316:    VectorCopy(spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 317
;317:    origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 318
;318:    VectorCopy(spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 319
;319:    return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $158
JUMPV
LABELV $184
line 323
;320:  }
;321:
;322:  // select a random spot from the spawn points furthest away
;323:  rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 325
;324:
;325:  VectorCopy(list_spot[ rnd ]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 326
;326:  origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 327
;327:  VectorCopy(list_spot[ rnd ]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 329
;328:
;329:  return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $158
endproc G_SelectRandomFurthestSpawnPoint 572 12
export G_SelectAlienSpawnPoint
proc G_SelectAlienSpawnPoint 532 20
line 341
;330:}
;331:
;332:/*
;333: ================
;334: G_SelectAlienSpawnPoint
;335:
;336: go to a random point that doesn't telefrag
;337: ================
;338: */
;339:gentity_t *
;340:G_SelectAlienSpawnPoint(vec3_t preference, gentity_t * ent)
;341:{
line 346
;342:  gentity_t *spot;
;343:  int count;
;344:  gentity_t * spots[MAX_SPAWN_POINTS];
;345:
;346:  if (level.numAlienSpawns <= 0)
ADDRGP4 level+185088
INDIRI4
CNSTI4 0
GTI4 $190
line 347
;347:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $189
JUMPV
LABELV $190
line 349
;348:
;349:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 350
;350:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 353
;351:
;352:  while((spot = G_Find(spot, FOFS(classname), BG_FindEntityNameForBuildable(BA_H_SPAWN))) != NULL)
;353:  {
line 354
;354:    if (!spot->spawned)
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $196
line 355
;355:      continue;
ADDRGP4 $194
JUMPV
LABELV $196
line 357
;356:
;357:    if (spot->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $198
line 358
;358:      continue;
ADDRGP4 $194
JUMPV
LABELV $198
line 360
;359:
;360:    if (!spot->s.groundEntityNum)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 361
;361:      continue;
ADDRGP4 $194
JUMPV
LABELV $200
line 363
;362:
;363:    if (spot->biteam != BIT_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
EQI4 $202
line 364
;364:      continue;
ADDRGP4 $194
JUMPV
LABELV $202
line 366
;365:
;366:    if (spot->clientSpawnTime > 0)
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
LEI4 $204
line 367
;367:      continue;
ADDRGP4 $194
JUMPV
LABELV $204
line 369
;368:
;369:    if (G_CheckSpawnPoint(spot->s.number, spot->s.origin, spot->s.origin2, BA_H_SPAWN, NULL)
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
CNSTI4 9
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 524
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 371
;370:        != NULL)
;371:      continue;
ADDRGP4 $194
JUMPV
LABELV $206
line 375
;372:    /*if (g_survival.integer && spot->survivalStage != level.survivalStage && level.numAlienSpawns > 2)
;373:     continue;*/
;374:
;375:    spots[count] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 376
;376:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 377
;377:  }
LABELV $194
line 352
CNSTI4 9
ARGI4
ADDRLP4 520
ADDRGP4 BG_FindEntityNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $193
line 379
;378:
;379:  if (!count)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $208
line 380
;380:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $189
JUMPV
LABELV $208
line 456
;381:
;382:  //srand(seed);
;383:  //random_integer = rand() % (count);
;384:
;385:  /*if (!g_survival.integer) // Was making zombies spawn in non sense areas.
;386:   {
;387:   for(i = 0;i < level.numConnectedClients;i++)
;388:   {
;389:   pew = &g_entities[level.sortedClients[i]];
;390:   if (pew->health <= 0)
;391:   continue;
;392:   if (pew->s.eType == ET_BUILDABLE)
;393:   continue;
;394:   if (!pew->client)
;395:   continue;
;396:   if (pew->client->ps.stats[STAT_HEALTH] <= 0 || pew->client->sess.sessionTeam == TEAM_SPECTATOR)
;397:   continue;
;398:
;399:   if (pew->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
;400:   {
;401:   sob = pew;
;402:   break;
;403:   }
;404:   }
;405:   }*/
;406:
;407:  /*if (g_survival.integer && level.botsfollowpath && !ent->botlostpath) //if bot have meet our sob make it spawn somewhere else
;408:   {
;409:   if (level.selectednode != NULL)
;410:   {
;411:   level.selectednode->clientSpawnTime = 0;
;412:   //G_LogPrintf(va("Bot shuld spwn in right node. %d %d\n", node->s.origin[0], node->s.origin[1]));
;413:   return level.selectednode;
;414:   }
;415:   G_LogPrintf("No nodes.\n");
;416:   }*/
;417:
;418:  //return spots[random_integer]; //This shuld work fine :s
;419:  /*if (!sob)
;420:   {
;421:   if (g_survival.integer)
;422:   {
;423:   for(i = 1, enemyNode = g_entities + i;i < level.num_entities;i++, enemyNode++)
;424:   {
;425:   if (enemyNode->health <= 0)
;426:   continue;
;427:   if (enemyNode->s.eType != ET_BUILDABLE)
;428:   continue;
;429:   if (enemyNode->biteam != BIT_HUMANS)
;430:   continue;
;431:   if (enemyNode->s.modelindex != BA_H_SPAWN)
;432:   continue;
;433:
;434:   if (enemyNode->survivalStage == level.survivalStage)
;435:   {
;436:   sob = enemyNode;
;437:   break;
;438:   }
;439:   }
;440:   if (!sob)
;441:   {
;442:   return G_ClosestEnt(preference, spots, count);
;443:   }
;444:   else
;445:   {
;446:   return G_ClosestEnt(sob->s.origin, spots, count);
;447:   }
;448:   }
;449:   else
;450:   {
;451:   return G_ClosestEnt(preference, spots, count);
;452:   }
;453:   }
;454:   else
;455:   {*/
;456:  return G_ClosestEnt(preference, spots, count);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 528
ADDRGP4 G_ClosestEnt
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
LABELV $189
endproc G_SelectAlienSpawnPoint 532 20
export G_SelectHumanSpawnPoint
proc G_SelectHumanSpawnPoint 532 20
line 469
;457:  /*}*/
;458:}
;459:
;460:/*
;461: ================
;462: G_SelectHumanSpawnPoint
;463:
;464: go to a random point that doesn't telefrag
;465: ================
;466: */
;467:gentity_t *
;468:G_SelectHumanSpawnPoint(vec3_t preference)
;469:{
line 474
;470:  gentity_t *spot;
;471:  int count;
;472:  gentity_t * spots[MAX_SPAWN_POINTS];
;473:
;474:  if (level.numHumanSpawns <= 0)
ADDRGP4 level+185092
INDIRI4
CNSTI4 0
GTI4 $211
line 475
;475:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $210
JUMPV
LABELV $211
line 477
;476:
;477:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 478
;478:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $215
JUMPV
LABELV $214
line 481
;479:
;480:  while((spot = G_Find(spot, FOFS(classname), BG_FindEntityNameForBuildable(BA_H_SPAWN))) != NULL)
;481:  {
line 482
;482:    if (!spot->spawned)
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
line 483
;483:      continue;
ADDRGP4 $215
JUMPV
LABELV $217
line 485
;484:
;485:    if (spot->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $219
line 486
;486:      continue;
ADDRGP4 $215
JUMPV
LABELV $219
line 488
;487:
;488:    if (spot->biteam != BIT_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
EQI4 $221
line 489
;489:      continue;
ADDRGP4 $215
JUMPV
LABELV $221
line 491
;490:
;491:    if (!spot->s.groundEntityNum)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $223
line 492
;492:      continue;
ADDRGP4 $215
JUMPV
LABELV $223
line 494
;493:
;494:    if (spot->clientSpawnTime > 0)
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
LEI4 $225
line 495
;495:      continue;
ADDRGP4 $215
JUMPV
LABELV $225
line 497
;496:
;497:    if (G_CheckSpawnPoint(spot->s.number, spot->s.origin, spot->s.origin2, BA_H_SPAWN, NULL)
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
CNSTI4 9
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 524
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 499
;498:        != NULL)
;499:      continue;
ADDRGP4 $215
JUMPV
LABELV $227
line 501
;500:
;501:    spots[count] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 502
;502:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 503
;503:  }
LABELV $215
line 480
CNSTI4 9
ARGI4
ADDRLP4 520
ADDRGP4 BG_FindEntityNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 505
;504:
;505:  if (!count)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $229
line 506
;506:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $210
JUMPV
LABELV $229
line 508
;507:
;508:  return G_ClosestEnt(preference, spots, count);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 528
ADDRGP4 G_ClosestEnt
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
LABELV $210
endproc G_SelectHumanSpawnPoint 532 20
export G_SelectSpawnPoint
proc G_SelectSpawnPoint 4 12
line 520
;509:}
;510:
;511:/*
;512: ===========
;513: G_SelectSpawnPoint
;514:
;515: Chooses a player start, deathmatch start, etc
;516: ============
;517: */
;518:gentity_t *
;519:G_SelectSpawnPoint(vec3_t avoidPoint, vec3_t origin, vec3_t angles)
;520:{
line 521
;521:  return G_SelectRandomFurthestSpawnPoint(avoidPoint, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $231
endproc G_SelectSpawnPoint 4 12
export G_SelectTremulousSpawnPoint
proc G_SelectTremulousSpawnPoint 28 20
line 534
;522:}
;523:
;524:/*
;525: ===========
;526: G_SelectTremulousSpawnPoint
;527:
;528: Chooses a player start, deathmatch start, etc
;529: ============
;530: */
;531:gentity_t *
;532:G_SelectTremulousSpawnPoint(pTeam_t team, vec3_t preference, vec3_t origin, vec3_t angles,
;533:  gentity_t * ent)
;534:{
line 535
;535:  gentity_t *spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 536
;536:  gentity_t *valid = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 538
;537:
;538:  if (team == PTE_ALIENS)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $233
line 539
;539:    spot = G_SelectAlienSpawnPoint(preference, ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_SelectAlienSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $234
JUMPV
LABELV $233
line 540
;540:  else if (team == PTE_HUMANS)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $235
line 541
;541:    spot = G_SelectHumanSpawnPoint(preference);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_SelectHumanSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $235
LABELV $234
line 544
;542:
;543:  //no available spots
;544:  if (!spot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 545
;545:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $232
JUMPV
LABELV $237
line 551
;546:
;547:  /*if( team == PTE_ALIENS )
;548:   G_CheckSpawnPoint( spot->s.number, spot->s.origin, spot->s.origin2, BA_A_SPAWN, origin );
;549:   else*/
;550:
;551:  if (team == PTE_HUMANS || team == PTE_ALIENS)
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $241
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $239
LABELV $241
line 552
;552:    valid = G_CheckSpawnPoint(spot->s.number, spot->s.origin, spot->s.origin2, BA_H_SPAWN, origin);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
CNSTI4 9
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
LABELV $239
line 554
;553:  
;554:  if (valid != NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $242
line 555
;555:  {
line 556
;556:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $232
JUMPV
LABELV $242
line 559
;557:  }
;558:
;559:  VectorCopy(spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 560
;560:  angles[ROLL] = 0;
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 562
;561:
;562:  return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $232
endproc G_SelectTremulousSpawnPoint 28 20
export G_SelectInitialSpawnPoint
proc G_SelectInitialSpawnPoint 20 12
line 576
;563:
;564:}
;565:
;566:/*
;567: ===========
;568: G_SelectInitialSpawnPoint
;569:
;570: Try to find a spawn point marked 'initial', otherwise
;571: use normal spawn selection.
;572: ============
;573: */
;574:gentity_t *
;575:G_SelectInitialSpawnPoint(vec3_t origin, vec3_t angles)
;576:{
line 579
;577:  gentity_t *spot;
;578:
;579:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $246
JUMPV
LABELV $245
line 581
;580:  while((spot = G_Find(spot, FOFS(classname), "info_player_deathmatch")) != NULL)
;581:  {
line 582
;582:    if (spot->spawnflags & 1)
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $248
line 583
;583:      break;
ADDRGP4 $247
JUMPV
LABELV $248
line 584
;584:  }
LABELV $246
line 580
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $245
LABELV $247
line 586
;585:
;586:  if (!spot || SpotWouldTelefrag(spot))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $252
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $252
line 587
;587:  {
line 588
;588:    return G_SelectSpawnPoint(vec3_origin, origin, angles);
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $244
JUMPV
LABELV $250
line 591
;589:  }
;590:
;591:  VectorCopy(spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 592
;592:  origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 593
;593:  VectorCopy(spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 595
;594:
;595:  return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $244
endproc G_SelectInitialSpawnPoint 20 12
export G_SelectSpectatorSpawnPoint
proc G_SelectSpectatorSpawnPoint 0 0
line 606
;596:}
;597:
;598:/*
;599: ===========
;600: G_SelectSpectatorSpawnPoint
;601:
;602: ============
;603: */
;604:gentity_t *
;605:G_SelectSpectatorSpawnPoint(vec3_t origin, vec3_t angles)
;606:{
line 607
;607:  FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 609
;608:
;609:  VectorCopy(level.intermission_origin, origin);
ADDRFP4 0
INDIRP4
ADDRGP4 level+185056
INDIRB
ASGNB 12
line 610
;610:  VectorCopy(level.intermission_angle, angles);
ADDRFP4 4
INDIRP4
ADDRGP4 level+185068
INDIRB
ASGNB 12
line 612
;611:
;612:  return NULL;
CNSTP4 0
RETP4
LABELV $253
endproc G_SelectSpectatorSpawnPoint 0 0
export G_SelectAlienLockSpawnPoint
proc G_SelectAlienLockSpawnPoint 12 12
line 625
;613:}
;614:
;615:/*
;616: ===========
;617: G_SelectAlienLockSpawnPoint
;618:
;619: Try to find a spawn point for alien intermission otherwise
;620: use normal intermission spawn.
;621: ============
;622: */
;623:gentity_t *
;624:G_SelectAlienLockSpawnPoint(vec3_t origin, vec3_t angles)
;625:{
line 628
;626:  gentity_t *spot;
;627:
;628:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 629
;629:  spot = G_Find(spot, FOFS(classname), "info_alien_intermission");
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $257
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 631
;630:
;631:  if (!spot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $258
line 632
;632:    return G_SelectSpectatorSpawnPoint(origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $256
JUMPV
LABELV $258
line 634
;633:
;634:  VectorCopy(spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 635
;635:  VectorCopy(spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 637
;636:
;637:  return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $256
endproc G_SelectAlienLockSpawnPoint 12 12
export G_SelectHumanLockSpawnPoint
proc G_SelectHumanLockSpawnPoint 12 12
line 650
;638:}
;639:
;640:/*
;641: ===========
;642: G_SelectHumanLockSpawnPoint
;643:
;644: Try to find a spawn point for human intermission otherwise
;645: use normal intermission spawn.
;646: ============
;647: */
;648:gentity_t *
;649:G_SelectHumanLockSpawnPoint(vec3_t origin, vec3_t angles)
;650:{
line 653
;651:  gentity_t *spot;
;652:
;653:  spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 654
;654:  spot = G_Find(spot, FOFS(classname), "info_human_intermission");
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $261
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 656
;655:
;656:  if (!spot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $262
line 657
;657:    return G_SelectSpectatorSpawnPoint(origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $260
JUMPV
LABELV $262
line 659
;658:
;659:  VectorCopy(spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 660
;660:  VectorCopy(spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 662
;661:
;662:  return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $260
endproc G_SelectHumanLockSpawnPoint 12 12
export BodySink
proc BodySink 24 8
line 682
;663:}
;664:
;665:/*
;666: =======================================================================
;667:
;668: BODYQUE
;669:
;670: =======================================================================
;671: */
;672:
;673:/*
;674: =============
;675: BodySink
;676:
;677: After sitting around for five seconds, fall into the ground and dissapear
;678: =============
;679: */
;680:void
;681:BodySink(gentity_t *ent)
;682:{
line 687
;683:  gentity_t *item;
;684:  int randomitem;
;685:
;686:  //run on first BodySink call
;687:  if (!ent->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $265
line 688
;688:  {
line 689
;689:    ent->active = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 1
ASGNI4
line 692
;690:
;691:    //sinking bodies can't be infested
;692:    ent->killedBy = ent->s.powerups = MAX_CLIENTS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 64
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 188
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1560
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 693
;693:    ent->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 694
;694:  }
LABELV $265
line 696
;695:
;696:  if (level.time - ent->timestamp > 1000)
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $268
line 697
;697:  {
line 699
;698:    //Survival.
;699:    if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $271
line 700
;700:    {
line 701
;701:      srand(trap_Milliseconds());
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
line 702
;702:      randomitem = (rand() % 10) + 1; //N + 1 where x >=0 && x <= N
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
ADDI4
ASGNI4
line 703
;703:      switch(randomitem)
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $274
ADDRLP4 16
INDIRI4
CNSTI4 10
GTI4 $274
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $286-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $286
address $276
address $277
address $278
address $279
address $280
address $281
address $282
address $283
address $284
address $285
code
line 704
;704:      {
LABELV $276
line 706
;705:        case 1:
;706:          randomitem = BA_I_SYRINX;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 707
;707:          break;
ADDRGP4 $275
JUMPV
LABELV $277
line 709
;708:        case 2:
;709:          randomitem = BA_I_MACHINEGUN;
ADDRLP4 0
CNSTI4 18
ASGNI4
line 710
;710:          break;
ADDRGP4 $275
JUMPV
LABELV $278
line 712
;711:        case 3:
;712:          randomitem = BA_I_SHOTGUN;
ADDRLP4 0
CNSTI4 19
ASGNI4
line 713
;713:          break;
ADDRGP4 $275
JUMPV
LABELV $279
line 715
;714:        case 4:
;715:          randomitem = BA_I_AXE;
ADDRLP4 0
CNSTI4 20
ASGNI4
line 716
;716:          break;
ADDRGP4 $275
JUMPV
LABELV $280
line 718
;717:        case 5:
;718:          randomitem = BA_I_ROCKET_LAUNCHER;
ADDRLP4 0
CNSTI4 21
ASGNI4
line 719
;719:          break;
ADDRGP4 $275
JUMPV
LABELV $281
line 721
;720:        case 6:
;721:          randomitem = BA_I_LASERGUN;
ADDRLP4 0
CNSTI4 22
ASGNI4
line 722
;722:          break;
ADDRGP4 $275
JUMPV
LABELV $282
line 724
;723:        case 7:
;724:          randomitem = BA_I_MDRIVER;
ADDRLP4 0
CNSTI4 23
ASGNI4
line 725
;725:          break;
ADDRGP4 $275
JUMPV
LABELV $283
line 727
;726:        case 8:
;727:          randomitem = BA_I_CHAINGUN;
ADDRLP4 0
CNSTI4 24
ASGNI4
line 728
;728:          break;
ADDRGP4 $275
JUMPV
LABELV $284
line 730
;729:        case 9:
;730:          randomitem = BA_I_GRENADE_LAUNCHER;
ADDRLP4 0
CNSTI4 25
ASGNI4
line 731
;731:          break;
ADDRGP4 $275
JUMPV
LABELV $285
line 733
;732:        case 10:
;733:          randomitem = BA_I_MINE;
ADDRLP4 0
CNSTI4 26
ASGNI4
line 734
;734:          break;
ADDRGP4 $275
JUMPV
LABELV $274
line 736
;735:        default:
;736:          randomitem = BA_I_SYRINX;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 737
;737:          break;
LABELV $275
line 739
;738:      }
;739:      if (!level.intermissiontime)
ADDRGP4 level+185040
INDIRI4
CNSTI4 0
NEI4 $288
line 740
;740:      {
line 741
;741:        if ((level.time - level.startTime) > 600000 && randomitem == BA_I_SYRINX)
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 600000
LEI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 17
NEI4 $291
line 742
;742:        {
line 743
;743:          return;
ADDRGP4 $264
JUMPV
LABELV $291
line 745
;744:        }
;745:        item = spawnItem(ent, randomitem);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 spawnItem
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 746
;746:      }
LABELV $288
line 747
;747:      level.spawnedCorpes--;
ADDRLP4 20
ADDRGP4 level+48
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 748
;748:    }
LABELV $271
line 749
;749:    G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 750
;750:    return;
ADDRGP4 $264
JUMPV
LABELV $268
line 753
;751:  }
;752:
;753:  ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 754
;754:  ent->s.pos.trBase[2] -= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 755
;755:}
LABELV $264
endproc BodySink 24 8
export BodyFree
proc BodyFree 0 0
line 766
;756:
;757:/*
;758: =============
;759: BodyFree
;760:
;761: After sitting around for a while the body becomes a freebie
;762: =============
;763: */
;764:void
;765:BodyFree(gentity_t *ent)
;766:{
line 767
;767:  ent->killedBy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 -1
ASGNI4
line 770
;768:
;769:  //if not claimed in the next minute destroy
;770:  ent->think = BodySink;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 BodySink
ASGNP4
line 771
;771:  ent->nextthink = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 772
;772:}
LABELV $297
endproc BodyFree 0 0
export SpawnCorpse
proc SpawnCorpse 148 28
line 784
;773:
;774:/*
;775: =============
;776: SpawnCorpse
;777:
;778: A player is respawning, so make an entity that looks
;779: just like the existing corpse to leave behind.
;780: =============
;781: */
;782:void
;783:SpawnCorpse(gentity_t *ent)
;784:{
line 791
;785:  gentity_t *body;
;786:  int contents;
;787:  vec3_t origin, dest;
;788:  trace_t tr;
;789:  float vDiff;
;790:
;791:  VectorCopy(ent->r.currentOrigin, origin);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 793
;792:
;793:  trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 795
;794:
;795:  if (level.spawnedCorpes > 40)
ADDRGP4 level+48
INDIRI4
CNSTI4 40
LEI4 $300
line 796
;796:  {
line 797
;797:    return;
ADDRGP4 $299
JUMPV
LABELV $300
line 801
;798:  }
;799:
;800:  // if client is in a nodrop area, don't leave the body
;801:  contents = trap_PointContents(origin, -1);
ADDRLP4 4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 96
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 96
INDIRI4
ASGNI4
line 802
;802:  if (contents & CONTENTS_NODROP)
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $303
line 803
;803:    return;
ADDRGP4 $299
JUMPV
LABELV $303
line 805
;804:
;805:  body = G_Spawn();
ADDRLP4 100
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 100
INDIRP4
ASGNP4
line 807
;806:
;807:  VectorCopy(ent->s.apos.trBase, body->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 808
;808:  body->s.eFlags = EF_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 809
;809:  body->s.eType = ET_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 810
;810:  body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
line 811
;811:  body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 812
;812:  body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 813
;813:  body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 814
;814:  body->s.clientNum = ent->client->ps.stats[STAT_PCLASS];
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 815
;815:  body->nonSegModel = ent->client->ps.persistant[PERS_STATE] & PS_NONSEGMODEL;
ADDRLP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 817
;816:
;817:  if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $306
line 818
;818:    body->classname = "humanCorpse";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $308
ASGNP4
ADDRGP4 $307
JUMPV
LABELV $306
line 820
;819:  else
;820:    body->classname = "alienCorpse";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $309
ASGNP4
LABELV $307
line 822
;821:
;822:  body->s.powerups = MAX_CLIENTS;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 64
ASGNI4
line 824
;823:
;824:  body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 BodySink
ASGNP4
line 825
;825:  body->nextthink = level.time + 1000;//FIX ME: make it 20000 again.
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 827
;826:
;827:  body->s.legsAnim = ent->s.legsAnim;
ADDRLP4 108
CNSTI4 196
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 829
;828:
;829:  if (!body->nonSegModel)
ADDRLP4 0
INDIRP4
CNSTI4 1600
ADDP4
INDIRI4
CNSTI4 0
NEI4 $311
line 830
;830:  {
line 831
;831:    switch(body->s.legsAnim & ~ANIM_TOGGLEBIT)
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
LTI4 $313
ADDRLP4 112
INDIRI4
CNSTI4 5
GTI4 $313
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $319
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $319
address $316
address $316
address $317
address $317
address $318
address $318
code
line 832
;832:    {
LABELV $316
line 835
;833:      case BOTH_DEATH1:
;834:      case BOTH_DEAD1:
;835:        body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 124
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
line 836
;836:        break;
ADDRGP4 $312
JUMPV
LABELV $317
line 839
;837:      case BOTH_DEATH2:
;838:      case BOTH_DEAD2:
;839:        body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 132
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 840
;840:        break;
ADDRGP4 $312
JUMPV
LABELV $318
LABELV $313
line 844
;841:      case BOTH_DEATH3:
;842:      case BOTH_DEAD3:
;843:      default:
;844:        body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 140
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 845
;845:        break;
line 847
;846:    }
;847:  }
ADDRGP4 $312
JUMPV
LABELV $311
line 849
;848:  else
;849:  {
line 850
;850:    switch(body->s.legsAnim & ~ANIM_TOGGLEBIT)
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 21
LTI4 $320
ADDRLP4 112
INDIRI4
CNSTI4 26
GTI4 $320
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $326-84
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $326
address $323
address $323
address $324
address $324
address $325
address $325
code
line 851
;851:    {
LABELV $323
line 854
;852:      case NSPA_DEATH1:
;853:      case NSPA_DEAD1:
;854:        body->s.legsAnim = NSPA_DEAD1;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 22
ASGNI4
line 855
;855:        break;
ADDRGP4 $321
JUMPV
LABELV $324
line 858
;856:      case NSPA_DEATH2:
;857:      case NSPA_DEAD2:
;858:        body->s.legsAnim = NSPA_DEAD2;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 24
ASGNI4
line 859
;859:        break;
ADDRGP4 $321
JUMPV
LABELV $325
LABELV $320
line 863
;860:      case NSPA_DEATH3:
;861:      case NSPA_DEAD3:
;862:      default:
;863:        body->s.legsAnim = NSPA_DEAD3;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 26
ASGNI4
line 864
;864:        break;
LABELV $321
line 866
;865:    }
;866:  }
LABELV $312
line 868
;867:
;868:  body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 870
;869:
;870:  body->health = ent->health = ent->client->ps.stats[STAT_HEALTH];
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 812
ASGNI4
ADDRLP4 120
ADDRLP4 112
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 871
;871:  ent->health = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 874
;872:
;873:  //change body dimensions
;874:  BG_FindBBoxForClass(
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 876
;875:    ent->client->ps.stats[STAT_PCLASS], NULL, NULL, NULL, body->r.mins, body->r.maxs);
;876:  vDiff = body->r.mins[2] - ent->r.mins[2];
ADDRLP4 132
CNSTI4 444
ASGNI4
ADDRLP4 92
ADDRLP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 879
;877:
;878:  //drop down to match the *model* origins of ent and body
;879:  VectorSet(dest, origin[ 0 ], origin[ 1 ], origin[ 2 ] - vDiff);
ADDRLP4 16
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
line 880
;880:  trap_Trace(&tr, origin, body->r.mins, body->r.maxs, dest, body->s.number, body->clipmask);
ADDRLP4 32
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 881
;881:  VectorCopy(tr.endpos, origin);
ADDRLP4 4
ADDRLP4 32+12
INDIRB
ASGNB 12
line 883
;882:
;883:  G_SetOrigin(body, origin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 884
;884:  VectorCopy(origin, body->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 885
;885:  body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 886
;886:  body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 887
;887:  VectorCopy(ent->client->ps.velocity, body->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 889
;888:
;889:  VectorCopy(body->s.pos.trBase, body->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 890
;890:  level.spawnedCorpes++;
ADDRLP4 144
ADDRGP4 level+48
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 891
;891:  trap_LinkEntity(body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 892
;892:}
LABELV $299
endproc SpawnCorpse 148 28
export G_SetClientViewAngle
proc G_SetClientViewAngle 16 0
line 904
;893:
;894://======================================================================
;895:
;896:/*
;897: ==================
;898: G_SetClientViewAngle
;899:
;900: ==================
;901: */
;902:void
;903:G_SetClientViewAngle(gentity_t *ent, vec3_t angle)
;904:{
line 908
;905:  int i;
;906:
;907:  // set the delta angle
;908:  for(i = 0;i < 3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $336
line 909
;909:  {
line 912
;910:    int cmdAngle;
;911:
;912:    cmdAngle = ANGLE2SHORT(angle[ i ]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 913
;913:    ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 480
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 914
;914:  }
LABELV $337
line 908
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $336
line 916
;915:
;916:  VectorCopy(angle, ent->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 917
;917:  VectorCopy(ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 918
;918:}
LABELV $335
endproc G_SetClientViewAngle 16 0
export respawn
proc respawn 4 16
line 927
;919:
;920:/*
;921: ================
;922: respawn
;923: ================
;924: */
;925:void
;926:respawn(gentity_t *ent)
;927:{
line 931
;928:  //WTF is doing thise code here WTF lol
;929:  /*if (!((ent->r.svFlags & SVF_BOT) && !ent->botEnemy))
;930:   {*/
;931:  SpawnCorpse(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnCorpse
CALLV
pop
line 935
;932:  /*}*/
;933:
;934:  //TA: Clients can't respawn - they must go thru the class cmd
;935:  ent->client->pers.classSelection = PCL_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 936
;936:  ClientSpawn(ent, NULL, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 937
;937:}
LABELV $340
endproc respawn 4 16
export TeamCount
proc TeamCount 8 0
line 948
;938:
;939:/*
;940: ================
;941: TeamCount
;942:
;943: Returns number of players on a team
;944: ================
;945: */
;946:team_t
;947:TeamCount(int ignoreClientNum, int team)
;948:{
line 950
;949:  int i;
;950:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 952
;951:
;952:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $342
line 953
;953:  {
line 954
;954:    if (i == ignoreClientNum)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $347
line 955
;955:      continue;
ADDRGP4 $343
JUMPV
LABELV $347
line 957
;956:
;957:    if (level.clients[i].pers.connected == CON_DISCONNECTED)
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
CNSTI4 0
NEI4 $349
line 958
;958:      continue;
ADDRGP4 $343
JUMPV
LABELV $349
line 960
;959:
;960:    if (level.clients[i].sess.sessionTeam == team)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $351
line 961
;961:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
line 962
;962:  }
LABELV $343
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $345
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $342
line 964
;963:
;964:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $341
endproc TeamCount 8 0
proc ClientCleanName 64 12
line 974
;965:}
;966:
;967:/*
;968: ===========
;969: ClientCleanName
;970: ============
;971: */
;972:static void
;973:ClientCleanName(const char *in, char *out, int outSize)
;974:{
line 979
;975:  int len, colorlessLen;
;976:  char ch;
;977:  char *p;
;978:  int spaces;
;979:  qboolean invalid = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 982
;980:
;981:  //save room for trailing null byte
;982:  outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 984
;983:
;984:  len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 985
;985:  colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 986
;986:  p = out;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
line 987
;987:  *p = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 988
;988:  spaces = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
line 991
;989:
;990:  while(1)
;991:  {
line 992
;992:    ch = *in++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
line 993
;993:    if (!ch)
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $357
line 994
;994:      break;
ADDRGP4 $356
JUMPV
LABELV $357
line 997
;995:
;996:    // don't allow leading spaces
;997:    if (!*p && ch == ' ')
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $359
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $359
line 998
;998:      continue;
ADDRGP4 $355
JUMPV
LABELV $359
line 1001
;999:
;1000:    // don't allow nonprinting characters or (dead) console keys
;1001:    if (ch < ' ' || ch > '}' || ch == '`')
ADDRLP4 28
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32
LTI4 $364
ADDRLP4 28
INDIRI4
CNSTI4 125
GTI4 $364
ADDRLP4 28
INDIRI4
CNSTI4 96
NEI4 $361
LABELV $364
line 1002
;1002:      continue;
ADDRGP4 $355
JUMPV
LABELV $361
line 1005
;1003:
;1004:    // check colors
;1005:    if (Q_IsColorString(in - 1))
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $365
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $365
ADDRLP4 40
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $365
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $368
ADDRLP4 40
INDIRI4
CNSTI4 90
LEI4 $367
LABELV $368
ADDRLP4 44
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 97
LTI4 $369
ADDRLP4 44
INDIRI4
CNSTI4 122
LEI4 $367
LABELV $369
ADDRLP4 48
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 48
LTI4 $365
ADDRLP4 48
INDIRI4
CNSTI4 57
GTI4 $365
LABELV $367
line 1006
;1006:    {
line 1008
;1007:      // make sure room in dest for both chars
;1008:      if (len > outSize - 2)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $370
line 1009
;1009:        break;
ADDRGP4 $356
JUMPV
LABELV $370
line 1011
;1010:
;1011:      *out++ = ch;
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 1012
;1012:      len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1015
;1013:
;1014:      // solo trailing carat is not a color prefix
;1015:      if (!*in)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $372
line 1016
;1016:      {
line 1017
;1017:        *out++ = COLOR_WHITE;
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 55
ASGNI1
line 1018
;1018:        break;
ADDRGP4 $356
JUMPV
LABELV $372
line 1022
;1019:      }
;1020:
;1021:      // don't allow black in a name, period
;1022:      if (ColorIndex(*in) == 0)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $374
line 1023
;1023:        *out++ = COLOR_WHITE;
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 55
ASGNI1
ADDRGP4 $375
JUMPV
LABELV $374
line 1025
;1024:      else
;1025:        *out++ = *in;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 60
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRFP4 0
INDIRP4
INDIRI1
ASGNI1
LABELV $375
line 1027
;1026:
;1027:      in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1028
;1028:      continue;
ADDRGP4 $355
JUMPV
LABELV $365
line 1032
;1029:    }
;1030:
;1031:    // don't allow too many consecutive spaces
;1032:    if (ch == ' ')
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $376
line 1033
;1033:    {
line 1034
;1034:      spaces++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1035
;1035:      if (spaces > 3)
ADDRLP4 12
INDIRI4
CNSTI4 3
LEI4 $377
line 1036
;1036:        continue;
ADDRGP4 $355
JUMPV
line 1037
;1037:    }
LABELV $376
line 1039
;1038:    else
;1039:      spaces = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $377
line 1041
;1040:
;1041:    if (len > outSize - 1)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $380
line 1042
;1042:      break;
ADDRGP4 $356
JUMPV
LABELV $380
line 1044
;1043:
;1044:    *out++ = ch;
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 1045
;1045:    colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1046
;1046:    len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1047
;1047:  }
LABELV $355
line 990
ADDRGP4 $354
JUMPV
LABELV $356
line 1049
;1048:
;1049:  *out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1052
;1050:
;1051:  // don't allow names beginning with "[skipnotify]" because it messes up /ignore-related code
;1052:  if (!Q_strncmp(p, "[skipnotify]", 12))
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 24
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $382
line 1053
;1053:    invalid = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $382
line 1056
;1054:
;1055:  // don't allow comment-beginning strings because it messes up various parsers
;1056:  if (strstr(p, "//") || strstr(p, "/*"))
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $389
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $388
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
LABELV $389
line 1057
;1057:    invalid = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $385
line 1060
;1058:
;1059:  // don't allow empty names
;1060:  if (*p == 0 || colorlessLen == 0)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $392
ADDRLP4 16
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $390
LABELV $392
line 1061
;1061:    invalid = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $390
line 1064
;1062:
;1063:  // if something made the name bad, put them back to UnnamedPlayer
;1064:  if (invalid)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $393
line 1065
;1065:    Q_strncpyz(p, "UnnamedPlayer", outSize);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $395
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $393
line 1066
;1066:}
LABELV $353
endproc ClientCleanName 64 12
export G_NextNewbieName
proc G_NextNewbieName 1096 16
line 1077
;1067:
;1068:/*
;1069: ===================
;1070: G_NextNewbieName
;1071:
;1072: Generate a unique, known-good name for an UnnamedPlayer
;1073: ===================
;1074: */
;1075:char *
;1076:G_NextNewbieName(gentity_t *ent)
;1077:{
line 1082
;1078:  char newname[MAX_NAME_LENGTH];
;1079:  char namePrefix[MAX_NAME_LENGTH - 4];
;1080:  char err[MAX_STRING_CHARS];
;1081:
;1082:  if (g_newbieNamePrefix.string[0])
ADDRGP4 g_newbieNamePrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $397
line 1083
;1083:    Q_strncpyz(namePrefix, g_newbieNamePrefix.string, sizeof(namePrefix));
ADDRLP4 1056
ARGP4
ADDRGP4 g_newbieNamePrefix+16
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $397
line 1085
;1084:  else
;1085:    strcpy(namePrefix, "Newbie#");
ADDRLP4 1056
ARGP4
ADDRGP4 $401
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $403
JUMPV
LABELV $402
line 1088
;1086:
;1087:  while(level.numNewbies < 10000)
;1088:  {
line 1089
;1089:    strcpy(newname, va("%s%i", namePrefix, level.numNewbies));
ADDRGP4 $406
ARGP4
ADDRLP4 1056
ARGP4
ADDRGP4 level+174208
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1090
;1090:    if (G_admin_name_check(ent, newname, err, sizeof(err)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1088
ADDRGP4 G_admin_name_check
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $408
line 1091
;1091:    {
line 1092
;1092:      return va("%s", newname);
ADDRGP4 $410
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
RETP4
ADDRGP4 $396
JUMPV
LABELV $408
line 1094
;1093:    }
;1094:    level.numNewbies++; // Only increments if the last requested name was used.
ADDRLP4 1092
ADDRGP4 level+174208
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1095
;1095:  }
LABELV $403
line 1087
ADDRGP4 level+174208
INDIRI4
CNSTI4 10000
LTI4 $402
line 1096
;1096:  return "UnnamedPlayer";
ADDRGP4 $395
RETP4
LABELV $396
endproc G_NextNewbieName 1096 16
proc G_NonSegModel 20032 12
line 1108
;1097:}
;1098:
;1099:/*
;1100: ======================
;1101: G_NonSegModel
;1102:
;1103: Reads an animation.cfg to check for nonsegmentation
;1104: ======================
;1105: */
;1106:static qboolean
;1107:G_NonSegModel(const char *filename)
;1108:{
line 1116
;1109:  char *text_p;
;1110:  int len;
;1111:  char *token;
;1112:  char text[20000];
;1113:  fileHandle_t f;
;1114:
;1115:  // load the file
;1116:  len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20016
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20016
INDIRI4
ASGNI4
line 1117
;1117:  if (!f)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $413
line 1118
;1118:  {
line 1119
;1119:    G_Printf("File not found: %s\n", filename);
ADDRGP4 $415
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1120
;1120:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $413
line 1123
;1121:  }
;1122:
;1123:  if (len < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $416
line 1124
;1124:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $416
line 1126
;1125:
;1126:  if (len == 0 || len >= sizeof(text) - 1)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $420
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $418
LABELV $420
line 1127
;1127:  {
line 1128
;1128:    trap_FS_FCloseFile(f);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1129
;1129:    G_Printf("File %s is %s\n", filename, len == 0 ? "empty" : "too long");
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $425
ADDRLP4 20024
ADDRGP4 $422
ASGNP4
ADDRGP4 $426
JUMPV
LABELV $425
ADDRLP4 20024
ADDRGP4 $423
ASGNP4
LABELV $426
ADDRLP4 20024
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1130
;1130:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $418
line 1133
;1131:  }
;1132:
;1133:  trap_FS_Read(text, len, f);
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1134
;1134:  text[len] = 0;
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 1135
;1135:  trap_FS_FCloseFile(f);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1138
;1136:
;1137:  // parse the text
;1138:  text_p = text;
ADDRLP4 4
ADDRLP4 16
ASGNP4
ADDRGP4 $428
JUMPV
LABELV $427
line 1142
;1139:
;1140:  // read optional parameters
;1141:  while(1)
;1142:  {
line 1143
;1143:    token = COM_Parse(&text_p);
ADDRLP4 4
ARGP4
ADDRLP4 20024
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20024
INDIRP4
ASGNP4
line 1146
;1144:
;1145:    //EOF
;1146:    if (!token[0])
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $430
line 1147
;1147:      break;
ADDRGP4 $429
JUMPV
LABELV $430
line 1149
;1148:
;1149:    if (!Q_stricmp(token, "nonsegmented"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 20028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20028
INDIRI4
CNSTI4 0
NEI4 $432
line 1150
;1150:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $412
JUMPV
LABELV $432
line 1151
;1151:  }
LABELV $428
line 1141
ADDRGP4 $427
JUMPV
LABELV $429
line 1153
;1152:
;1153:  return qfalse;
CNSTI4 0
RETI4
LABELV $412
endproc G_NonSegModel 20032 12
lit
align 1
LABELV $499
byte 1 0
skip 1023
export ClientUserinfoChanged
code
proc ClientUserinfoChanged 7436 60
line 1169
;1154:}
;1155:
;1156:/*
;1157: ===========
;1158: ClientUserInfoChanged
;1159:
;1160: Called from ClientConnect when the player first connects and
;1161: directly by the server system when the player updates a userinfo variable.
;1162:
;1163: The game can override any of the settings and call trap_SetUserinfo
;1164: if desired.
;1165: ============
;1166: */
;1167:void
;1168:ClientUserinfoChanged(int clientNum)
;1169:{
line 1179
;1170:  gentity_t *ent;
;1171:  int teamTask, teamLeader, health;
;1172:  char *s;
;1173:  char model[MAX_QPATH];
;1174:  char buffer[MAX_QPATH];
;1175:  char filename[MAX_QPATH];
;1176:  char oldname[MAX_INFO_STRING];
;1177:  char newname[MAX_INFO_STRING];
;1178:  char err[MAX_STRING_CHARS];
;1179:  qboolean revertName = qfalse;
ADDRLP4 5280
CNSTI4 0
ASGNI4
line 1180
;1180:  qboolean showRenameMsg = qtrue;
ADDRLP4 3148
CNSTI4 1
ASGNI4
line 1187
;1181:  gclient_t *client;
;1182:  char c1[MAX_INFO_STRING];
;1183:  char c2[MAX_INFO_STRING];
;1184:  char userinfo[MAX_INFO_STRING];
;1185:  team_t team;
;1186:
;1187:  ent = g_entities + clientNum;
ADDRLP4 3144
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1188
;1188:  client = ent->client;
ADDRLP4 0
ADDRLP4 3144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1190
;1189:
;1190:  trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1193
;1191:
;1192:  // check for malformed or illegal info strings
;1193:  if (!Info_Validate(userinfo))
ADDRLP4 4
ARGP4
ADDRLP4 6372
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6372
INDIRI4
CNSTI4 0
NEI4 $436
line 1194
;1194:  {
line 1195
;1195:    trap_SendServerCommand(ent - g_entities, "disconnect \"illegal or malformed userinfo\n\"");
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $438
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1196
;1196:    trap_DropClient(ent - g_entities, "dropped: illegal or malformed userinfo");
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $439
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 1197
;1197:  }
LABELV $436
line 1200
;1198:
;1199:  // check for local client
;1200:  s = Info_ValueForKey(userinfo, "ip");
ADDRLP4 4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 6376
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6376
INDIRP4
ASGNP4
line 1202
;1201:
;1202:  if (!strcmp(s, "localhost"))
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 6380
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6380
INDIRI4
CNSTI4 0
NEI4 $441
line 1203
;1203:    client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
LABELV $441
line 1206
;1204:
;1205:  // check the item prediction
;1206:  s = Info_ValueForKey(userinfo, "cg_predictItems");
ADDRLP4 4
ARGP4
ADDRGP4 $444
ARGP4
ADDRLP4 6384
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6384
INDIRP4
ASGNP4
line 1208
;1207:
;1208:  if (!atoi(s))
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6388
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6388
INDIRI4
CNSTI4 0
NEI4 $445
line 1209
;1209:    client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $446
JUMPV
LABELV $445
line 1211
;1210:  else
;1211:    client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
LABELV $446
line 1214
;1212:
;1213:  // set name
;1214:  Q_strncpyz(oldname, client->pers.netname, sizeof(oldname));
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1215
;1215:  s = Info_ValueForKey(userinfo, "name");
ADDRLP4 4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 6392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6392
INDIRP4
ASGNP4
line 1216
;1216:  ClientCleanName(s, newname, sizeof(newname));
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 2056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1218
;1217:
;1218:  if (strcmp(oldname, newname))
ADDRLP4 1032
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 6396
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6396
INDIRI4
CNSTI4 0
EQI4 $448
line 1219
;1219:  {
line 1220
;1220:    if (!strlen(oldname) && client->pers.connected != CON_CONNECTED)
ADDRLP4 1032
ARGP4
ADDRLP4 6400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
NEI4 $450
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $450
line 1221
;1221:      showRenameMsg = qfalse;
ADDRLP4 3148
CNSTI4 0
ASGNI4
LABELV $450
line 1224
;1222:
;1223:    // in case we need to revert and there's no oldname
;1224:    ClientCleanName(va("%s", client->pers.netname), oldname, sizeof(oldname));
ADDRGP4 $410
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 6404
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6404
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1226
;1225:
;1226:    if (g_newbieNumbering.integer)
ADDRGP4 g_newbieNumbering+12
INDIRI4
CNSTI4 0
EQI4 $452
line 1227
;1227:    {
line 1228
;1228:      if (!strcmp(newname, "UnnamedPlayer"))
ADDRLP4 2056
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 6408
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6408
INDIRI4
CNSTI4 0
NEI4 $455
line 1229
;1229:        Q_strncpyz(newname, G_NextNewbieName(ent), sizeof(newname));
ADDRLP4 3144
INDIRP4
ARGP4
ADDRLP4 6412
ADDRGP4 G_NextNewbieName
CALLP4
ASGNP4
ADDRLP4 2056
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $455
line 1230
;1230:      if (!strcmp(oldname, "UnnamedPlayer"))
ADDRLP4 1032
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 6416
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6416
INDIRI4
CNSTI4 0
NEI4 $457
line 1231
;1231:        Q_strncpyz(oldname, G_NextNewbieName(ent), sizeof(oldname));
ADDRLP4 3144
INDIRP4
ARGP4
ADDRLP4 6420
ADDRGP4 G_NextNewbieName
CALLP4
ASGNP4
ADDRLP4 1032
ARGP4
ADDRLP4 6420
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $457
line 1232
;1232:    }
LABELV $452
line 1234
;1233:
;1234:    if (client->pers.muted)
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 1235
;1235:    {
line 1236
;1236:    	if(client->pers.globalID)
ADDRLP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $461
line 1237
;1237:    	    		  {
line 1238
;1238:    	    			  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $463
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $464
ARGP4
ADDRLP4 6408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 6408
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1240
;1239:    	    			        va("print \"Caught by global ID: %d Appeal: %s\n\"", client->pers.globalID , GLOBALS_URL));
;1240:    	    		  }
LABELV $461
line 1241
;1241:      trap_SendServerCommand(
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $465
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1243
;1242:        ent - g_entities, "print \"You cannot change your name while you are muted\n\"");
;1243:      revertName = qtrue;
ADDRLP4 5280
CNSTI4 1
ASGNI4
line 1244
;1244:    }
ADDRGP4 $460
JUMPV
LABELV $459
line 1245
;1245:    else if (client->pers.nameChangeTime && (level.time - client->pers.nameChangeTime)
ADDRLP4 6408
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6408
INDIRI4
CNSTI4 0
EQI4 $466
ADDRGP4 level+28
INDIRI4
ADDRLP4 6408
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
ADDRGP4 g_minNameChangePeriod+8
INDIRF4
MULF4
GTF4 $466
line 1247
;1246:        <= (g_minNameChangePeriod.value * 1000))
;1247:    {
line 1248
;1248:      trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $470
ARGP4
ADDRGP4 g_minNameChangePeriod+12
INDIRI4
ARGI4
ADDRLP4 6412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1251
;1249:        "print \"Name change spam protection (g_minNameChangePeriod = %d)\n\"",
;1250:        g_minNameChangePeriod.integer));
;1251:      revertName = qtrue;
ADDRLP4 5280
CNSTI4 1
ASGNI4
line 1252
;1252:    }
ADDRGP4 $467
JUMPV
LABELV $466
line 1253
;1253:    else if (g_maxNameChanges.integer > 0 && client->pers.nameChanges >= g_maxNameChanges.integer)
ADDRGP4 g_maxNameChanges+12
INDIRI4
CNSTI4 0
LEI4 $472
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRGP4 g_maxNameChanges+12
INDIRI4
LTI4 $472
line 1254
;1254:    {
line 1255
;1255:      trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $476
ARGP4
ADDRGP4 g_maxNameChanges+12
INDIRI4
ARGI4
ADDRLP4 6412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1258
;1256:        "print \"Maximum name changes reached (g_maxNameChanges = %d)\n\"",
;1257:        g_maxNameChanges.integer));
;1258:      revertName = qtrue;
ADDRLP4 5280
CNSTI4 1
ASGNI4
line 1259
;1259:    }
ADDRGP4 $473
JUMPV
LABELV $472
line 1260
;1260:    else if (!G_admin_name_check(ent, newname, err, sizeof(err)))
ADDRLP4 3144
INDIRP4
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 5348
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 6412
ADDRGP4 G_admin_name_check
CALLI4
ASGNI4
ADDRLP4 6412
INDIRI4
CNSTI4 0
NEI4 $478
line 1261
;1261:    {
line 1262
;1262:      trap_SendServerCommand(ent - g_entities, va("print \"%s\n\"", err));
ADDRGP4 $480
ARGP4
ADDRLP4 5348
ARGP4
ADDRLP4 6416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3144
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 6416
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1263
;1263:      revertName = qtrue;
ADDRLP4 5280
CNSTI4 1
ASGNI4
line 1264
;1264:    }
LABELV $478
LABELV $473
LABELV $467
LABELV $460
line 1266
;1265:
;1266:    if (revertName)
ADDRLP4 5280
INDIRI4
CNSTI4 0
EQI4 $481
line 1267
;1267:    {
line 1268
;1268:      Q_strncpyz(client->pers.netname, oldname, sizeof(client->pers.netname));
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1269
;1269:      Info_SetValueForKey(userinfo, "name", oldname);
ADDRLP4 4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1270
;1270:      trap_SetUserinfo(clientNum, userinfo);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1271
;1271:    }
ADDRGP4 $482
JUMPV
LABELV $481
line 1273
;1272:    else
;1273:    {
line 1274
;1274:      Q_strncpyz(client->pers.netname, newname, sizeof(client->pers.netname));
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2056
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1275
;1275:      Info_SetValueForKey(userinfo, "name", newname);
ADDRLP4 4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 2056
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1276
;1276:      trap_SetUserinfo(clientNum, userinfo);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1277
;1277:      if (client->pers.connected == CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $483
line 1278
;1278:      {
line 1279
;1279:        client->pers.nameChangeTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1280
;1280:        client->pers.nameChanges++;
ADDRLP4 6416
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ASGNP4
ADDRLP4 6416
INDIRP4
ADDRLP4 6416
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1281
;1281:      }
LABELV $483
line 1282
;1282:    }
LABELV $482
line 1283
;1283:  }
LABELV $448
line 1285
;1284:
;1285:  if (client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $486
line 1286
;1286:  {
line 1287
;1287:    if (client->sess.spectatorState == SPECTATOR_SCOREBOARD)
ADDRLP4 0
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 4
NEI4 $488
line 1288
;1288:      Q_strncpyz(client->pers.netname, "scoreboard", sizeof(client->pers.netname));
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 $490
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $488
line 1289
;1289:  }
LABELV $486
line 1291
;1290:
;1291:  if (client->pers.connected >= CON_CONNECTING && showRenameMsg)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
LTI4 $491
ADDRLP4 3148
INDIRI4
CNSTI4 0
EQI4 $491
line 1292
;1292:  {
line 1293
;1293:    if (strcmp(oldname, client->pers.netname))
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 6400
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
EQI4 $493
line 1294
;1294:    {
line 1295
;1295:      trap_SendServerCommand(-1, va("print \"%s" S_COLOR_WHITE
ADDRGP4 $495
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 6404
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6404
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1297
;1296:      " renamed to %s^7\n\"", oldname, client->pers.netname));
;1297:      if (g_decolourLogfiles.integer)
ADDRGP4 g_decolourLogfiles+12
INDIRI4
CNSTI4 0
EQI4 $496
line 1298
;1298:      {
line 1299
;1299:        char decoloured[MAX_STRING_CHARS] = "";
ADDRLP4 6408
ADDRGP4 $499
INDIRB
ASGNB 1024
line 1300
;1300:        if (g_decolourLogfiles.integer == 1)
ADDRGP4 g_decolourLogfiles+12
INDIRI4
CNSTI4 1
NEI4 $500
line 1301
;1301:        {
line 1302
;1302:          Com_sprintf(
ADDRLP4 6408
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $503
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1305
;1303:            decoloured, sizeof(decoloured), " (\"%s^7\" -> \"%s^7\")", oldname,
;1304:            client->pers.netname);
;1305:          G_DecolorString(decoloured, decoloured);
ADDRLP4 6408
ARGP4
ADDRLP4 6408
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 1306
;1306:          G_LogPrintfColoured(
ADDRGP4 $504
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 6408
ARGP4
ADDRGP4 G_LogPrintfColoured
CALLV
pop
line 1309
;1307:            "ClientRename: %i [%s] (%s) \"%s^7\" -> \"%s^7\"%s\n", clientNum, client->pers.ip,
;1308:            client->pers.guid, oldname, client->pers.netname, decoloured);
;1309:        }
ADDRGP4 $497
JUMPV
LABELV $500
line 1311
;1310:        else
;1311:        {
line 1312
;1312:          G_LogPrintf(
ADDRGP4 $504
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 6408
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1315
;1313:            "ClientRename: %i [%s] (%s) \"%s^7\" -> \"%s^7\"%s\n", clientNum, client->pers.ip,
;1314:            client->pers.guid, oldname, client->pers.netname, decoloured);
;1315:        }
line 1317
;1316:
;1317:      }
ADDRGP4 $497
JUMPV
LABELV $496
line 1319
;1318:      else
;1319:      {
line 1320
;1320:        G_LogPrintf(
ADDRGP4 $505
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1323
;1321:          "ClientRename: %i [%s] (%s) \"%s^7\" -> \"%s^7\"\n", clientNum, client->pers.ip,
;1322:          client->pers.guid, oldname, client->pers.netname);
;1323:      }
LABELV $497
line 1324
;1324:      G_admin_namelog_update(client, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 1325
;1325:    }
LABELV $493
line 1326
;1326:  }
LABELV $491
line 1329
;1327:
;1328:  // set max health
;1329:  health = atoi(Info_ValueForKey(userinfo, "handicap"));
ADDRLP4 4
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 6400
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6400
INDIRP4
ARGP4
ADDRLP4 6404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3160
ADDRLP4 6404
INDIRI4
ASGNI4
line 1330
;1330:  client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 3160
INDIRI4
ASGNI4
line 1332
;1331:
;1332:  if (client->pers.maxHealth < 1 || client->pers.maxHealth > 100)
ADDRLP4 6408
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6408
INDIRI4
CNSTI4 1
LTI4 $509
ADDRLP4 6408
INDIRI4
CNSTI4 100
LEI4 $507
LABELV $509
line 1333
;1333:    client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 100
ASGNI4
LABELV $507
line 1336
;1334:
;1335:  //hack to force a client update if the config string does not change between spawning
;1336:  if (client->pers.classSelection == PCL_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $510
line 1337
;1337:    client->pers.maxHealth = 0;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
LABELV $510
line 1340
;1338:
;1339:  // set model
;1340:  if (client->ps.stats[STAT_PCLASS] == PCL_HUMAN && 0/*BG_InventoryContainsUpgrade(UP_BATTLESUIT, client->ps.stats)*/)
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 11
NEI4 $512
ADDRGP4 $512
JUMPV
line 1341
;1341:   {
line 1342
;1342:   Com_sprintf(buffer, MAX_QPATH, "%s/%s", BG_FindModelNameForClass(PCL_HUMAN_BSUIT), BG_FindSkinNameForClass(PCL_HUMAN_BSUIT));
CNSTI4 12
ARGI4
ADDRLP4 6412
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
CNSTI4 12
ARGI4
ADDRLP4 6416
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 3164
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $514
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRLP4 6416
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1343
;1343:   }
ADDRGP4 $513
JUMPV
LABELV $512
line 1345
;1344:   else 
;1345:  if (client->pers.classSelection == PCL_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $515
line 1346
;1346:  {
line 1351
;1347:    //This looks hacky and frankly it is. The clientInfo string needs to hold different
;1348:    //model details to that of the spawning class or the info change will not be
;1349:    //registered and an axis appears instead of the player model. There is zero chance
;1350:    //the player can spawn with the battlesuit, hence this choice.
;1351:    Com_sprintf(
CNSTI4 12
ARGI4
ADDRLP4 6412
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
CNSTI4 12
ARGI4
ADDRLP4 6416
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 3164
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $514
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRLP4 6416
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1354
;1352:      buffer, MAX_QPATH, "%s/%s", BG_FindModelNameForClass(PCL_HUMAN_BSUIT),
;1353:      BG_FindSkinNameForClass(PCL_HUMAN_BSUIT));
;1354:  }
ADDRGP4 $516
JUMPV
LABELV $515
line 1356
;1355:  else
;1356:  {
line 1357
;1357:    Com_sprintf(
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 6412
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 6416
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 3164
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $514
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRLP4 6416
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1360
;1358:      buffer, MAX_QPATH, "%s/%s", BG_FindModelNameForClass(client->pers.classSelection),
;1359:      BG_FindSkinNameForClass(client->pers.classSelection));
;1360:  }
LABELV $516
LABELV $513
line 1361
;1361:  Q_strncpyz(model, buffer, sizeof(model));
ADDRLP4 3080
ARGP4
ADDRLP4 3164
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1364
;1362:
;1363:  //don't bother setting model type if spectating
;1364:  if (client->pers.classSelection != PCL_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $517
line 1365
;1365:  {
line 1367
;1366:    //model segmentation
;1367:    Com_sprintf(
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 6412
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
ADDRLP4 5284
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $519
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1371
;1368:      filename, sizeof(filename), "models/players/%s/animation.cfg", BG_FindModelNameForClass(
;1369:        client->pers.classSelection));
;1370:
;1371:    if (G_NonSegModel(filename))
ADDRLP4 5284
ARGP4
ADDRLP4 6416
ADDRGP4 G_NonSegModel
CALLI4
ASGNI4
ADDRLP4 6416
INDIRI4
CNSTI4 0
EQI4 $520
line 1372
;1372:      client->ps.persistant[PERS_STATE] |= PS_NONSEGMODEL;
ADDRLP4 6420
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6420
INDIRP4
ADDRLP4 6420
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $520
line 1374
;1373:    else
;1374:      client->ps.persistant[PERS_STATE] &= ~PS_NONSEGMODEL;
ADDRLP4 6424
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6424
INDIRP4
ADDRLP4 6424
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
LABELV $521
line 1375
;1375:  }
LABELV $517
line 1378
;1376:
;1377:  // wallwalk follow
;1378:  s = Info_ValueForKey(userinfo, "cg_wwFollow");
ADDRLP4 4
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 6412
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6412
INDIRP4
ASGNP4
line 1380
;1379:
;1380:  if (atoi(s))
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6416
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6416
INDIRI4
CNSTI4 0
EQI4 $523
line 1381
;1381:    client->ps.persistant[PERS_STATE] |= PS_WALLCLIMBINGFOLLOW;
ADDRLP4 6420
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6420
INDIRP4
ADDRLP4 6420
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
ADDRGP4 $524
JUMPV
LABELV $523
line 1383
;1382:  else
;1383:    client->ps.persistant[PERS_STATE] &= ~PS_WALLCLIMBINGFOLLOW;
ADDRLP4 6424
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6424
INDIRP4
ADDRLP4 6424
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $524
line 1386
;1384:
;1385:  // wallwalk toggle
;1386:  s = Info_ValueForKey(userinfo, "cg_wwToggle");
ADDRLP4 4
ARGP4
ADDRGP4 $525
ARGP4
ADDRLP4 6428
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6428
INDIRP4
ASGNP4
line 1388
;1387:
;1388:  if (atoi(s))
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6432
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6432
INDIRI4
CNSTI4 0
EQI4 $526
line 1389
;1389:    client->ps.persistant[PERS_STATE] |= PS_WALLCLIMBINGTOGGLE;
ADDRLP4 6436
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6436
INDIRP4
ADDRLP4 6436
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
ADDRGP4 $527
JUMPV
LABELV $526
line 1391
;1390:  else
;1391:    client->ps.persistant[PERS_STATE] &= ~PS_WALLCLIMBINGTOGGLE;
ADDRLP4 6440
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 6440
INDIRP4
ADDRLP4 6440
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
LABELV $527
line 1394
;1392:
;1393:  // teamInfo
;1394:  s = Info_ValueForKey(userinfo, "teamoverlay");
ADDRLP4 4
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 6444
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6444
INDIRP4
ASGNP4
line 1396
;1395:
;1396:  if (!*s || atoi(s) != 0)
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $531
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6452
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6452
INDIRI4
CNSTI4 0
EQI4 $529
LABELV $531
line 1397
;1397:    client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $529
line 1399
;1398:  else
;1399:    client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
LABELV $530
line 1401
;1400:
;1401:  s = Info_ValueForKey(userinfo, "cg_unlagged");
ADDRLP4 4
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 6456
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6456
INDIRP4
ASGNP4
line 1402
;1402:  if (!s[0] || atoi(s) != 0)
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $535
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6464
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6464
INDIRI4
CNSTI4 0
EQI4 $533
LABELV $535
line 1403
;1403:    client->pers.useUnlagged = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $534
JUMPV
LABELV $533
line 1405
;1404:  else
;1405:    client->pers.useUnlagged = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 0
ASGNI4
LABELV $534
line 1408
;1406:
;1407:  // team task (0 = none, 1 = offence, 2 = defence)
;1408:  teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 6468
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6468
INDIRP4
ARGP4
ADDRLP4 6472
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3152
ADDRLP4 6472
INDIRI4
ASGNI4
line 1410
;1409:  // team Leader (1 = leader, 0 is normal player)
;1410:  teamLeader = client->sess.teamLeader;
ADDRLP4 3156
ADDRLP4 0
INDIRP4
CNSTI4 1148
ADDP4
INDIRI4
ASGNI4
line 1413
;1411:
;1412:  // colors
;1413:  strcpy(c1, Info_ValueForKey(userinfo, "color1"));
ADDRLP4 4
ARGP4
ADDRGP4 $537
ARGP4
ADDRLP4 6476
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3228
ARGP4
ADDRLP4 6476
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1414
;1414:  strcpy(c2, Info_ValueForKey(userinfo, "color2"));
ADDRLP4 4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 6480
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 6480
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1416
;1415:
;1416:  team = client->pers.teamSelection;
ADDRLP4 5276
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 1421
;1417:
;1418:  // send over a subset of the userinfo keys so other clients can
;1419:  // print scoreboards, display models, and play custom sounds
;1420:
;1421:  Com_sprintf(
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 6484
ADDRGP4 BG_ClientListString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $539
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 5276
INDIRI4
ARGI4
ADDRLP4 3080
ARGP4
ADDRLP4 3080
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 4252
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
ARGI4
ADDRLP4 3152
INDIRI4
ARGI4
ADDRLP4 3156
INDIRI4
ARGI4
ADDRLP4 6484
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1428
;1422:    userinfo, sizeof(userinfo), "n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\"
;1423:      "hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\"
;1424:      "tl\\%d\\ig\\%16s", client->pers.netname, team, model, model, c1, c2, client->pers.maxHealth,
;1425:    client->sess.wins, client->sess.losses, teamTask, teamLeader, BG_ClientListString(
;1426:      &client->sess.ignoreList));
;1427:
;1428:  trap_SetConfigstring(CS_PLAYERS + clientNum, userinfo);
ADDRFP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1431
;1429:
;1430:  /*G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, userinfo );*/
;1431:}
LABELV $435
endproc ClientUserinfoChanged 7436 60
lit
align 1
LABELV $541
byte 1 0
skip 15
align 1
LABELV $542
byte 1 0
skip 1023
align 1
LABELV $594
byte 1 0
skip 1023
export ClientConnect
code
proc ClientConnect 3468 28
line 1455
;1432:
;1433:/*
;1434: ===========
;1435: ClientConnect
;1436:
;1437: Called when a player begins connecting to the server.
;1438: Called again for every map change or tournement restart.
;1439:
;1440: The session information will be valid after exit.
;1441:
;1442: Return NULL if the client should be allowed, otherwise return
;1443: a string with the reason for denial.
;1444:
;1445: Otherwise, the client will be sent the current gamestate
;1446: and will eventually get to ClientBegin.
;1447:
;1448: firstTime will be qtrue the very first time a client connects
;1449: to the server machine, but qfalse on map changes and tournement
;1450: restarts.
;1451: ============
;1452: */
;1453:char *
;1454:ClientConnect(int clientNum, qboolean firstTime)
;1455:{
line 1463
;1456:  char *value;
;1457:  gclient_t *client;
;1458:  char userinfo[MAX_INFO_STRING];
;1459:  gentity_t *ent;
;1460:  char guid[33];
;1461:  char guid2[33];
;1462:  char ip[16] =
;1463:  { "" };
ADDRLP4 48
ADDRGP4 $541
INDIRB
ASGNB 16
line 1465
;1464:  char reason[MAX_STRING_CHARS] =
;1465:  { "" };
ADDRLP4 1347
ADDRGP4 $542
INDIRB
ASGNB 1024
line 1469
;1466:  int i;
;1467:  char data[255];
;1468:
;1469:  ent = &g_entities[clientNum];
ADDRLP4 64
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1471
;1470:
;1471:  trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1473
;1472:
;1473:  value = Info_ValueForKey(userinfo, "cl_guid");
ADDRLP4 68
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 2404
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2404
INDIRP4
ASGNP4
line 1474
;1474:  Q_strncpyz(guid, value, sizeof(guid));
ADDRLP4 2371
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1476
;1475:
;1476:  Q_strncpyz(guid2, value, sizeof(guid2));
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1479
;1477:  
;1478:  // check for admin ban
;1479:  if (G_admin_ban_check(userinfo, reason, sizeof(reason)))
ADDRLP4 68
ARGP4
ADDRLP4 1347
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2408
ADDRGP4 G_admin_ban_check
CALLI4
ASGNI4
ADDRLP4 2408
INDIRI4
CNSTI4 0
EQI4 $544
line 1480
;1480:  {
line 1481
;1481:    return va("%s", reason);
ADDRGP4 $410
ARGP4
ADDRLP4 1347
ARGP4
ADDRLP4 2412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2412
INDIRP4
RETP4
ADDRGP4 $540
JUMPV
LABELV $544
line 1485
;1482:  }
;1483:
;1484:  // check for globals
;1485:   if(G_globalBanCheck(userinfo, reason, sizeof(reason)))
ADDRLP4 68
ARGP4
ADDRLP4 1347
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2412
ADDRGP4 G_globalBanCheck
CALLI4
ASGNI4
ADDRLP4 2412
INDIRI4
CNSTI4 0
EQI4 $546
line 1486
;1486:   {
line 1487
;1487: 	  return va( "%s", reason );
ADDRGP4 $410
ARGP4
ADDRLP4 1347
ARGP4
ADDRLP4 2416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2416
INDIRP4
RETP4
ADDRGP4 $540
JUMPV
LABELV $546
line 1494
;1488:   }
;1489:
;1490:  // IP filtering
;1491:  // https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;1492:  // recommanding PB based IP / GUID banning, the builtin system is pretty limited
;1493:  // check to see if they are on the banned IP list
;1494:  value = Info_ValueForKey(userinfo, "ip");
ADDRLP4 68
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 2416
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2416
INDIRP4
ASGNP4
line 1495
;1495:  i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $549
JUMPV
LABELV $548
line 1497
;1496:  while(*value && i < sizeof(ip) - 2)
;1497:  {
line 1498
;1498:    if (*value != '.' && (*value < '0' || *value > '9'))
ADDRLP4 2420
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2420
INDIRI4
CNSTI4 46
EQI4 $551
ADDRLP4 2420
INDIRI4
CNSTI4 48
LTI4 $553
ADDRLP4 2420
INDIRI4
CNSTI4 57
LEI4 $551
LABELV $553
line 1499
;1499:      break;
ADDRGP4 $550
JUMPV
LABELV $551
line 1500
;1500:    ip[i++] = *value;
ADDRLP4 2424
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 2424
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2424
INDIRI4
ADDRLP4 48
ADDP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 1501
;1501:    value++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1502
;1502:  }
LABELV $549
line 1496
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $554
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 14
LTU4 $548
LABELV $554
LABELV $550
line 1503
;1503:  ip[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 48
ADDP4
CNSTI1 0
ASGNI1
line 1504
;1504:  if (G_FilterPacket(value))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2420
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 2420
INDIRI4
CNSTI4 0
EQI4 $555
line 1505
;1505:    return "Banned, appeal: Blogwtf.com.";
ADDRGP4 $557
RETP4
ADDRGP4 $540
JUMPV
LABELV $555
line 1508
;1506:
;1507:  // check for a password
;1508:  value = Info_ValueForKey(userinfo, "password");
ADDRLP4 68
ARGP4
ADDRGP4 $558
ARGP4
ADDRLP4 2424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2424
INDIRP4
ASGNP4
line 1510
;1509:
;1510:  if (g_password.string[0] && Q_stricmp(g_password.string, "none") && strcmp(
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $559
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $563
ARGP4
ADDRLP4 2428
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2428
INDIRI4
CNSTI4 0
EQI4 $559
ADDRGP4 g_password+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2432
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2432
INDIRI4
CNSTI4 0
EQI4 $559
line 1512
;1511:    g_password.string, value) != 0)
;1512:    return "Invalid password";
ADDRGP4 $565
RETP4
ADDRGP4 $540
JUMPV
LABELV $559
line 1514
;1513:
;1514:  for(i = 0;guid2[i] != '\0';i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $569
JUMPV
LABELV $566
line 1515
;1515:  {
line 1516
;1516:    if (guid2[i] == '/' || guid2[i] == '\'' || guid2[i] == '*' || guid2[i] == ';' || guid2[i]
ADDRLP4 2436
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2436
INDIRI4
CNSTI4 47
EQI4 $575
ADDRLP4 2436
INDIRI4
CNSTI4 39
EQI4 $575
ADDRLP4 2436
INDIRI4
CNSTI4 42
EQI4 $575
ADDRLP4 2436
INDIRI4
CNSTI4 59
EQI4 $575
ADDRLP4 2436
INDIRI4
CNSTI4 61
NEI4 $570
LABELV $575
line 1518
;1517:        == '=')
;1518:    {
line 1519
;1519:      G_LogPrintf(va("Hacked client tried to connect guid: %s ip: %s\n", guid2, ip));
ADDRGP4 $576
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 2440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2440
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1520
;1520:      return "FAIL";
ADDRGP4 $577
RETP4
ADDRGP4 $540
JUMPV
LABELV $570
line 1522
;1521:    }
;1522:  }
LABELV $567
line 1514
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $569
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $566
line 1525
;1523:
;1524:  // they can connect
;1525:  ent->client = level.clients + clientNum;
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 2148
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1526
;1526:  client = ent->client;
ADDRLP4 44
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1528
;1527:
;1528:	client->pers.badgesobtained = 0;
ADDRLP4 44
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 0
ASGNI4
line 1530
;1529:	
;1530:  memset(client, 0, sizeof(*client));
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2148
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1533
;1531:
;1532:  // add guid to session so we don't have to keep parsing userinfo everywhere
;1533:  if (!guid[0])
ADDRLP4 2371
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $578
line 1534
;1534:  {
line 1535
;1535:    Q_strncpyz(client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", sizeof(client->pers.guid));
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 $580
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1536
;1536:    client->pers.mysqlid = -1;
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 -1
ASGNI4
line 1537
;1537:  }
ADDRGP4 $579
JUMPV
LABELV $578
line 1539
;1538:  else
;1539:  {
line 1540
;1540:    Q_strncpyz(client->pers.guid, guid, sizeof(client->pers.guid));
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2371
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1541
;1541:  }
LABELV $579
line 1542
;1542:  Q_strncpyz(client->pers.ip, ip, sizeof(client->pers.ip));
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1543
;1543:  client->pers.adminLevel = G_admin_level(ent);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 2436
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 1000
ADDP4
ADDRLP4 2436
INDIRI4
ASGNI4
line 1545
;1544:
;1545:  client->pers.connected = CON_CONNECTING;
ADDRLP4 44
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 1
ASGNI4
line 1548
;1546:
;1547:  // read or initialize the session data
;1548:  if (!(ent->r.svFlags & SVF_BOT))
ADDRLP4 64
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $581
line 1549
;1549:  {
line 1551
;1550:    //FIXME: There is a shitty OverFlow on one of this functions.
;1551:    if (firstTime || level.newSession)
ADDRLP4 2440
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 2440
INDIRI4
NEI4 $586
ADDRGP4 level+173932
INDIRI4
ADDRLP4 2440
INDIRI4
EQI4 $583
LABELV $586
line 1552
;1552:      G_InitSessionData(client, userinfo);
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
LABELV $583
line 1554
;1553:
;1554:    G_ReadSessionData(client);
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1555
;1555:  }
LABELV $581
line 1557
;1556:
;1557:  if (firstTime)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $587
line 1558
;1558:    client->pers.firstConnect = qtrue;
ADDRLP4 44
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $587
line 1560
;1559:  else
;1560:    client->pers.firstConnect = qfalse;
ADDRLP4 44
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 0
ASGNI4
LABELV $588
line 1563
;1561:
;1562:  // get and distribute relevent paramters
;1563:  if (!(ent->r.svFlags & SVF_BOT))
ADDRLP4 64
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $589
line 1564
;1564:  {
line 1565
;1565:    ClientUserinfoChanged(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1566
;1566:  }
LABELV $589
line 1568
;1567:
;1568:  G_admin_set_adminname(ent);
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 G_admin_set_adminname
CALLV
pop
line 1570
;1569:
;1570:  if (g_decolourLogfiles.integer)
ADDRGP4 g_decolourLogfiles+12
INDIRI4
CNSTI4 0
EQI4 $591
line 1571
;1571:  {
line 1572
;1572:    char decoloured[MAX_STRING_CHARS] = "";
ADDRLP4 2440
ADDRGP4 $594
INDIRB
ASGNB 1024
line 1573
;1573:    if (g_decolourLogfiles.integer == 1)
ADDRGP4 g_decolourLogfiles+12
INDIRI4
CNSTI4 1
NEI4 $595
line 1574
;1574:    {
line 1575
;1575:      Com_sprintf(decoloured, sizeof(decoloured), " (\"%s^7\")", client->pers.netname);
ADDRLP4 2440
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $598
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1576
;1576:      G_DecolorString(decoloured, decoloured);
ADDRLP4 2440
ARGP4
ADDRLP4 2440
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 1577
;1577:      G_LogPrintfColoured(
ADDRGP4 $599
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2440
ARGP4
ADDRGP4 G_LogPrintfColoured
CALLV
pop
line 1580
;1578:        "ClientConnect: %i [%s] (%s) \"%s^7\"%s\n", clientNum, client->pers.ip, client->pers.guid,
;1579:        client->pers.netname, decoloured);
;1580:    }
ADDRGP4 $592
JUMPV
LABELV $595
line 1582
;1581:    else
;1582:    {
line 1583
;1583:      G_LogPrintf(
ADDRGP4 $599
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2440
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1586
;1584:        "ClientConnect: %i [%s] (%s) \"%s^7\"%s\n", clientNum, client->pers.ip, client->pers.guid,
;1585:        client->pers.netname, decoloured);
;1586:    }
line 1587
;1587:  }
ADDRGP4 $592
JUMPV
LABELV $591
line 1589
;1588:  else
;1589:  {
line 1590
;1590:    G_LogPrintf(
ADDRGP4 $600
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1593
;1591:      "ClientConnect: %i [%s] (%s) \"%s^7\"\n", clientNum, client->pers.ip, client->pers.guid,
;1592:      client->pers.netname);
;1593:  }
LABELV $592
line 1595
;1594:
;1595:  if (client->pers.mysqlid != -1 && g_survival.integer)
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $601
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $601
line 1596
;1596:  {
line 1597
;1597:    if (trap_mysql_runquery(va(
ADDRGP4 $606
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2440
INDIRP4
ARGP4
ADDRLP4 2444
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2444
INDIRI4
CNSTI4 1
NEI4 $604
line 1600
;1598:      "SELECT HIGH_PRIORITY id FROM zplayers WHERE qkey = \"%s\" LIMIT 1", client->pers.guid))
;1599:        == qtrue)
;1600:    {
line 1601
;1601:      if (trap_mysql_fetchrow() == qtrue)
ADDRLP4 2448
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 2448
INDIRI4
CNSTI4 1
NEI4 $607
line 1602
;1602:      {
line 1603
;1603:        trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $609
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1604
;1604:        client->pers.mysqlid = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2452
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 2452
INDIRI4
ASGNI4
line 1605
;1605:      }
ADDRGP4 $605
JUMPV
LABELV $607
line 1607
;1606:      else
;1607:      {
line 1608
;1608:        trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1609
;1609:        if (trap_mysql_runquery(va(
ADDRGP4 $612
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 2456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRLP4 2460
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2460
INDIRI4
CNSTI4 1
NEI4 $605
line 1612
;1610:          "INSERT HIGH_PRIORITY INTO zplayers (qkey,name,ip) VALUES (\"%s\",\"%s\",\"%s\")",
;1611:          client->pers.guid, client->pers.netname, client->pers.ip)) == qtrue)
;1612:        {
line 1613
;1613:          trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1614
;1614:          if (trap_mysql_runquery(va(
ADDRGP4 $606
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2464
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2464
INDIRP4
ARGP4
ADDRLP4 2468
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2468
INDIRI4
CNSTI4 0
EQI4 $605
line 1616
;1615:            "SELECT HIGH_PRIORITY id FROM zplayers WHERE qkey = \"%s\" LIMIT 1", client->pers.guid)))
;1616:          {
line 1617
;1617:            if (trap_mysql_fetchrow() == qtrue)
ADDRLP4 2472
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 2472
INDIRI4
CNSTI4 1
NEI4 $605
line 1618
;1618:            {
line 1619
;1619:              trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $609
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1620
;1620:              client->pers.mysqlid = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2476
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 2476
INDIRI4
ASGNI4
line 1621
;1621:              trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1622
;1622:            }
line 1624
;1623:            else
;1624:            {
line 1626
;1625:              //Unexpected error
;1626:            }
line 1627
;1627:          }
line 1628
;1628:        }
line 1629
;1629:      }
line 1630
;1630:    }
LABELV $604
line 1632
;1631:    else
;1632:    {
line 1634
;1633:      //Mysql off or error on query
;1634:    }
LABELV $605
line 1635
;1635:  }
LABELV $601
line 1638
;1636:
;1637:	//badges
;1638:if(client->pers.mysqlid != -1)
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $617
line 1639
;1639:{
line 1640
;1640:	if(trap_mysql_runquery( va("SELECT HIGH_PRIORITY id,kills,deaths,pistolkills,timeplayed,adminlevel,playerlevel,gameswin,structsbuilt,structskilled FROM zplayers WHERE qkey = \"%s\" LIMIT 1", client->pers.guid)) == qtrue)
ADDRGP4 $621
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2440
INDIRP4
ARGP4
ADDRLP4 2444
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2444
INDIRI4
CNSTI4 1
NEI4 $619
line 1641
;1641:	{
line 1642
;1642:		if( trap_mysql_fetchrow() == qtrue ) 
ADDRLP4 2448
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 2448
INDIRI4
CNSTI4 1
NEI4 $622
line 1643
;1643:		{
line 1644
;1644:			trap_mysql_fetchfieldbyName( "id", data, sizeof(data));
ADDRGP4 $609
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1645
;1645:			client->pers.mysqlid = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2452
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 2452
INDIRI4
ASGNI4
line 1646
;1646:			trap_mysql_fetchfieldbyName( "kills", data, sizeof(data));
ADDRGP4 $624
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1647
;1647:			client->pers.totalkills = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2456
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 880
ADDP4
ADDRLP4 2456
INDIRI4
ASGNI4
line 1648
;1648:			trap_mysql_fetchfieldbyName( "deaths", data, sizeof(data));
ADDRGP4 $625
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1649
;1649:			client->pers.totaldeaths = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2460
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 884
ADDP4
ADDRLP4 2460
INDIRI4
ASGNI4
line 1650
;1650:			trap_mysql_fetchfieldbyName( "pistolkills", data, sizeof(data));
ADDRGP4 $626
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1651
;1651:			client->pers.pistolkills = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2464
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 900
ADDP4
ADDRLP4 2464
INDIRI4
ASGNI4
line 1652
;1652:			trap_mysql_fetchfieldbyName( "timeplayed", data, sizeof(data));
ADDRGP4 $627
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1653
;1653:			client->pers.timeplayed = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2468
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 2468
INDIRI4
ASGNI4
line 1654
;1654:			trap_mysql_fetchfieldbyName( "adminlevel", data, sizeof(data));
ADDRGP4 $628
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1655
;1655:			client->pers.adminlevel = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2472
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 2472
INDIRI4
ASGNI4
line 1656
;1656:			trap_mysql_fetchfieldbyName( "playerlevel", data, sizeof(data));
ADDRGP4 $629
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1657
;1657:			client->pers.playerlevel = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2476
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 2476
INDIRI4
ASGNI4
line 1658
;1658:			trap_mysql_fetchfieldbyName( "gameswin", data, sizeof(data));
ADDRGP4 $630
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1659
;1659:			client->pers.gameswin = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2480
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 888
ADDP4
ADDRLP4 2480
INDIRI4
ASGNI4
line 1660
;1660:			trap_mysql_fetchfieldbyName( "structsbuilt", data, sizeof(data));
ADDRGP4 $631
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1661
;1661:			client->pers.structsbuilt = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2484
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 2484
INDIRI4
ASGNI4
line 1662
;1662:			trap_mysql_fetchfieldbyName( "structskilled", data, sizeof(data));
ADDRGP4 $632
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1663
;1663:			client->pers.structskilled = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2488
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 2488
INDIRI4
ASGNI4
line 1664
;1664:			trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1667
;1665:			
;1666:			//Player exists lets get the badges.
;1667:			if( trap_mysql_runquery( va("SELECT HIGH_PRIORITY idbadge FROM zbadges_player WHERE idplayer = \"%d\" LIMIT 50", client->pers.mysqlid)) == qtrue )
ADDRGP4 $635
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 2492
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2492
INDIRP4
ARGP4
ADDRLP4 2496
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2496
INDIRI4
CNSTI4 1
NEI4 $620
line 1668
;1668:			{
line 1669
;1669:				i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $637
JUMPV
LABELV $636
line 1671
;1670:				while(trap_mysql_fetchrow() == qtrue)
;1671:				{
line 1672
;1672:					trap_mysql_fetchfieldbyName( "idbadge", data, sizeof(data));
ADDRGP4 $639
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1673
;1673:					i = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2500
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2500
INDIRI4
ASGNI4
line 1674
;1674:					if(i > 49)
ADDRLP4 0
INDIRI4
CNSTI4 49
LEI4 $640
line 1675
;1675:					{
line 1677
;1676:						//This is not suppose to happend.
;1677:						continue;
ADDRGP4 $637
JUMPV
LABELV $640
line 1679
;1678:					}
;1679:					client->pers.badgesobtained++;
ADDRLP4 2504
ADDRLP4 44
INDIRP4
CNSTI4 968
ADDP4
ASGNP4
ADDRLP4 2504
INDIRP4
ADDRLP4 2504
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1680
;1680:					client->pers.badgeupdate[ i ] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 822
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 1681
;1681:					client->pers.badges[ i ] = 1;
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 772
ADDP4
ADDP4
CNSTI1 1
ASGNI1
line 1682
;1682:				}
LABELV $637
line 1670
ADDRLP4 2500
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 2500
INDIRI4
CNSTI4 1
EQI4 $636
line 1683
;1683:			}
line 1685
;1684:			else
;1685:			{
line 1687
;1686:				//Our user dont have badges.
;1687:			}
line 1688
;1688:		}
ADDRGP4 $620
JUMPV
LABELV $622
line 1690
;1689:		else
;1690:		{
line 1691
;1691:			trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1693
;1692:			//If are gonna put the date when client disconnect the better its not to set here the date.
;1693:			if( trap_mysql_runquery( va("INSERT HIGH_PRIORITY INTO zplayers (qkey,name,kills,deaths,pistolkills,ip) VALUES (\"%s\",\"%s\",\"%d\",\"%d\",\"%d\",\"%s\")", client->pers.guid, client->pers.netname, 0, 0, 0, client->pers.ip ) ) == qtrue )
ADDRGP4 $644
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2456
CNSTI4 0
ASGNI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 2460
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2460
INDIRP4
ARGP4
ADDRLP4 2464
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2464
INDIRI4
CNSTI4 1
NEI4 $620
line 1694
;1694:			{
line 1695
;1695:				trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1697
;1696:				//This player is new we only need the id.
;1697:				if(trap_mysql_runquery( va("SELECT HIGH_PRIORITY id FROM zplayers WHERE qkey = \"%s\" LIMIT 1", client->pers.guid ) ) == qtrue)
ADDRGP4 $606
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2468
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2468
INDIRP4
ARGP4
ADDRLP4 2472
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 2472
INDIRI4
CNSTI4 1
NEI4 $620
line 1698
;1698:				{
line 1699
;1699:					if(trap_mysql_fetchrow() == qtrue)
ADDRLP4 2476
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 2476
INDIRI4
CNSTI4 1
NEI4 $647
line 1700
;1700:					{
line 1701
;1701:						trap_mysql_fetchfieldbyName( "id", data, sizeof(data));
ADDRGP4 $609
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 1702
;1702:						trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 1703
;1703:						client->pers.mysqlid = atoi(data);
ADDRLP4 1092
ARGP4
ADDRLP4 2480
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 2480
INDIRI4
ASGNI4
line 1704
;1704:						client->pers.totalkills = 0;
ADDRLP4 44
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 0
ASGNI4
line 1705
;1705:						client->pers.totaldeaths = 0;
ADDRLP4 44
INDIRP4
CNSTI4 884
ADDP4
CNSTI4 0
ASGNI4
line 1706
;1706:						client->pers.pistolkills = 0;
ADDRLP4 44
INDIRP4
CNSTI4 900
ADDP4
CNSTI4 0
ASGNI4
line 1707
;1707:						client->pers.adminlevel = 0;
ADDRLP4 44
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1708
;1708:						client->pers.timeplayed = 0;
ADDRLP4 44
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1709
;1709:						client->pers.playerlevel = 0;
ADDRLP4 44
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1710
;1710:						client->pers.gameswin = 0;
ADDRLP4 44
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 0
ASGNI4
line 1711
;1711:						client->pers.structsbuilt = 0;
ADDRLP4 44
INDIRP4
CNSTI4 928
ADDP4
CNSTI4 0
ASGNI4
line 1712
;1712:						client->pers.structskilled = 0;
ADDRLP4 44
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 1713
;1713:					}
ADDRGP4 $620
JUMPV
LABELV $647
line 1715
;1714:					else
;1715:					{
line 1716
;1716:						G_LogPrintf( "A unexpected error have happened check line 1417 g_client.c" );//va("Hacked client tried to connect guid: %s ip: %s\n", guid, ip) );
ADDRGP4 $649
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1717
;1717:					}
line 1718
;1718:				}
line 1719
;1719:			}
line 1720
;1720:		}
line 1721
;1721:	}
LABELV $619
line 1723
;1722:	else
;1723:	{
line 1725
;1724:		//mysql error
;1725:	}
LABELV $620
line 1726
;1726:}
LABELV $617
line 1727
;1727:  if (client->pers.adminLevel)
ADDRLP4 44
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 1728
;1728:  {
line 1729
;1729:    G_LogPrintf(
ADDRGP4 $652
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1733
;1730:      "ClientAuth: %i [%s] \"%s^7\" authenticated to admin level %i using GUID %s (^7%s)\n",
;1731:      clientNum, client->pers.ip, client->pers.netname, client->pers.adminLevel, client->pers.guid,
;1732:      client->pers.adminName);
;1733:  }
LABELV $650
line 1736
;1734:
;1735:  // don't do the "xxx connected" messages if they were caried over from previous level
;1736:  if (firstTime && (!(ent->r.svFlags & SVF_BOT) && g_survival.integer) && (level.time
ADDRLP4 2440
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 2440
INDIRI4
EQI4 $653
ADDRLP4 64
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2440
INDIRI4
NEI4 $653
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 2440
INDIRI4
EQI4 $653
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 20000
LEI4 $653
line 1738
;1737:      - level.startTime) > 20000)
;1738:    trap_SendServerCommand(
ADDRGP4 $658
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2444
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2444
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $653
line 1742
;1739:      -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname));
;1740:
;1741:  // count current clients and rank for scoreboard
;1742:  CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1743
;1743:  G_admin_namelog_update(client, qfalse);
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 1746
;1744:
;1745:  // if this is after !restart keepteams or !restart switchteams, apply said selection
;1746:  if (client->sess.restartTeam != PTE_NONE)
ADDRLP4 44
INDIRP4
CNSTI4 1124
ADDP4
INDIRI4
CNSTI4 0
EQI4 $659
line 1747
;1747:  {
line 1748
;1748:    G_ChangeTeam(ent, client->sess.restartTeam);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1124
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 1749
;1749:    client->sess.restartTeam = PTE_NONE;
ADDRLP4 44
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 0
ASGNI4
line 1750
;1750:  }
LABELV $659
line 1752
;1751:
;1752:  return NULL;
CNSTP4 0
RETP4
LABELV $540
endproc ClientConnect 3468 28
export ClientBegin
proc ClientBegin 32 16
line 1766
;1753:}
;1754:
;1755:/*
;1756: ===========
;1757: ClientBegin
;1758:
;1759: called when a client has finished connecting, and is ready
;1760: to be placed into the level.  This will happen every level load,
;1761: and on transition between teams, but doesn't happen on respawns
;1762: ============
;1763: */
;1764:void
;1765:ClientBegin(int clientNum)
;1766:{
line 1771
;1767:  gentity_t *ent;
;1768:  gclient_t *client;
;1769:  int flags;
;1770:
;1771:  ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1773
;1772:
;1773:  client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 2148
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1775
;1774:
;1775:  if (ent->r.linked)
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $662
line 1776
;1776:    trap_UnlinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
LABELV $662
line 1778
;1777:
;1778:  G_InitGentity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1779
;1779:  ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 1780
;1780:  ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 1781
;1781:  ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1782
;1782:  ent->ctn_build_count = 0;
ADDRLP4 4
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 1784
;1783:
;1784:  client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 2
ASGNI4
line 1785
;1785:  client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1786
;1786:  client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1787
;1787:  client->pers.classSelection = PCL_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1794
;1788:
;1789:  // save eflags around this, because changing teams will
;1790:  // cause this to happen with a valid entity, and we
;1791:  // want to make sure the teleport bit is set right
;1792:  // so the viewpoint doesn't interpolate through the
;1793:  // world to the new position
;1794:  flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1795
;1795:  memset(&client->ps, 0, sizeof(client->ps));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1796
;1796:  memset(&client->pmext, 0, sizeof(client->pmext));
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1797
;1797:  client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1801
;1798:
;1799:  // locate ent at a spawn point
;1800:
;1801:  ClientSpawn(ent, NULL, NULL, NULL);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1803
;1802:  
;1803:  if ((!(ent->r.svFlags & SVF_BOT) && g_survival.integer) && (level.time - level.startTime > 20000))
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $665
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $665
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 20000
LEI4 $665
line 1804
;1804:    trap_SendServerCommand(-1, va(
ADDRGP4 $670
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $665
line 1808
;1805:      "print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname));
;1806:
;1807:  // name can change between ClientConnect() and ClientBegin()
;1808:  G_admin_namelog_update(client, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 1811
;1809:
;1810:  // request the clients PTR code
;1811:  trap_SendServerCommand(ent - g_entities, "ptrcrequest");
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $671
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1813
;1812:
;1813:  G_LogPrintf("ClientBegin: %i\n", clientNum);
ADDRGP4 $672
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1815
;1814:
;1815:  if (g_clientUpgradeNotice.integer)
ADDRGP4 g_clientUpgradeNotice+12
INDIRI4
CNSTI4 0
EQI4 $673
line 1816
;1816:  {
line 1817
;1817:    if (!Q_stricmp(ent->client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 $580
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $676
line 1818
;1818:    {
line 1819
;1819:      trap_SendServerCommand(
ADDRGP4 $678
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1824
;1820:        client->ps.clientNum,
;1821:        va(
;1822:          "print \"^1Your client is out of date. Your records will be not saved until you update. Please replace your client executable with the one "
;1823:            "at ^2http://blogwtf.com/backport/^1 and reconnect. \n\""));
;1824:    }
LABELV $676
line 1825
;1825:  }
LABELV $673
line 1826
;1826:  G_whitelistCheck(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_whitelistCheck
CALLV
pop
line 1827
;1827:   G_globalCheck(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_globalCheck
CALLV
pop
line 1829
;1828:
;1829:		trap_SendServerCommand( client->ps.clientNum, va("cp \"Badges are here! Do !badges , !badgelist , and !mystats%s^7\"", g_enterString.string));
ADDRGP4 $679
ARGP4
ADDRGP4 g_enterString+16
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1832
;1830:	
;1831:  // count current clients and rank for scoreboard
;1832:  CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1833
;1833:}
LABELV $661
endproc ClientBegin 32 16
export ClientSpawn
proc ClientSpawn 1956 24
line 1846
;1834:
;1835:/*
;1836: ===========
;1837: ClientSpawn
;1838:
;1839: Called every time a client is placed fresh in the world:
;1840: after the first ClientBegin, and after each respawn
;1841: Initializes all non-persistant parts of playerState
;1842: ============
;1843: */
;1844:void
;1845:ClientSpawn(gentity_t *ent, gentity_t *spawn, vec3_t origin, vec3_t angles)
;1846:{
line 1854
;1847:  int index;
;1848:  vec3_t spawn_origin, spawn_angles;
;1849:  gclient_t *client;
;1850:  int i;
;1851:  clientPersistant_t saved;
;1852:  clientSession_t savedSess;
;1853:  int persistant[MAX_PERSISTANT];
;1854:  gentity_t *spawnPoint = NULL;
ADDRLP4 84
CNSTP4 0
ASGNP4
line 1863
;1855:  int flags;
;1856:  int savedPing;
;1857:  int teamLocal;
;1858:  int eventSequence;
;1859:  char userinfo[MAX_INFO_STRING];
;1860:  int maxAmmo, maxClips;
;1861:  weapon_t weapon;
;1862:
;1863:  index = ent - g_entities;
ADDRLP4 72
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
line 1864
;1864:  client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1866
;1865:
;1866:  teamLocal = client->pers.teamSelection;
ADDRLP4 100
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 1869
;1867:
;1868:  //Reset Everything For path Finding
;1869:  ent->bs.currentNode = INVALID;
ADDRFP4 0
INDIRP4
CNSTI4 2400
ADDP4
CNSTI4 -1
ASGNI4
line 1870
;1870:  ent->bs.goalNode = INVALID;
ADDRFP4 0
INDIRP4
CNSTI4 2404
ADDP4
CNSTI4 -1
ASGNI4
line 1871
;1871:  ent->bs.lastNode = INVALID;
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
CNSTI4 -1
ASGNI4
line 1872
;1872:  ent->bs.nextNode = INVALID;
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
CNSTI4 -1
ASGNI4
line 1873
;1873:  ent->bs.isCrouchJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
CNSTI4 0
ASGNI4
line 1874
;1874:  ent->bs.isJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 0
ASGNI4
line 1875
;1875:  ent->bs.isLongJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
CNSTI4 0
ASGNI4
line 1876
;1876:  ent->bs.isUsingLadder = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2348
ADDP4
CNSTI4 0
ASGNI4
line 1878
;1877:
;1878:  ent->lastTimeSawEnemy = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1881
;1879:
;1880:  //TA: only start client if chosen a class and joined a team
;1881:  if (client->pers.classSelection == PCL_NONE && teamLocal == PTE_NONE)
ADDRLP4 1844
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 1844
INDIRI4
NEI4 $683
ADDRLP4 100
INDIRI4
ADDRLP4 1844
INDIRI4
NEI4 $683
line 1882
;1882:  {
line 1883
;1883:    client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 1
ASGNI4
line 1884
;1884:    client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 1
ASGNI4
line 1885
;1885:  }
ADDRGP4 $684
JUMPV
LABELV $683
line 1886
;1886:  else if (client->pers.classSelection == PCL_NONE)
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $685
line 1887
;1887:  {
line 1888
;1888:    client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 1
ASGNI4
line 1889
;1889:    client->sess.spectatorState = SPECTATOR_LOCKED;
ADDRLP4 4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 2
ASGNI4
line 1890
;1890:  }
LABELV $685
LABELV $684
line 1893
;1891:
;1892:  //if client is dead and following teammate, stop following before spawning
;1893:  if (ent->client->sess.spectatorClient != -1)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $687
line 1894
;1894:  {
line 1895
;1895:    ent->client->sess.spectatorClient = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTI4 -1
ASGNI4
line 1896
;1896:    ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 1
ASGNI4
line 1897
;1897:  }
LABELV $687
line 1899
;1898:
;1899:  if (origin != NULL)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $689
line 1900
;1900:    VectorCopy(origin, spawn_origin);
ADDRLP4 88
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
LABELV $689
line 1902
;1901:
;1902:  if (angles != NULL)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $691
line 1903
;1903:    VectorCopy(angles, spawn_angles);
ADDRLP4 104
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
LABELV $691
line 1908
;1904:
;1905:  // find a spawn point
;1906:  // do it before setting health back up, so farthest
;1907:  // ranging doesn't count this client
;1908:  if (client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $693
line 1909
;1909:  {
line 1910
;1910:    if (teamLocal == PTE_NONE)
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $695
line 1911
;1911:      spawnPoint = G_SelectSpectatorSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 88
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1848
ADDRGP4 G_SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 1848
INDIRP4
ASGNP4
ADDRGP4 $694
JUMPV
LABELV $695
line 1912
;1912:    else if (teamLocal == PTE_ALIENS)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $697
line 1913
;1913:      spawnPoint = G_SelectAlienLockSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 88
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1852
ADDRGP4 G_SelectAlienLockSpawnPoint
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 1852
INDIRP4
ASGNP4
ADDRGP4 $694
JUMPV
LABELV $697
line 1914
;1914:    else if (teamLocal == PTE_HUMANS)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $694
line 1915
;1915:      spawnPoint = G_SelectHumanLockSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 88
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1856
ADDRGP4 G_SelectHumanLockSpawnPoint
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 1856
INDIRP4
ASGNP4
line 1916
;1916:  }
ADDRGP4 $694
JUMPV
LABELV $693
line 1918
;1917:  else
;1918:  {
line 1919
;1919:    if (spawn == NULL)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $701
line 1920
;1920:    {
line 1921
;1921:      G_Error("ClientSpawn: spawn is NULL\n");
ADDRGP4 $703
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1922
;1922:      return;
ADDRGP4 $681
JUMPV
LABELV $701
line 1925
;1923:    }
;1924:
;1925:    spawnPoint = spawn;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
line 1927
;1926:
;1927:    if (ent != spawn)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $704
line 1928
;1928:    {
line 1930
;1929:      //start spawn animation on spawnPoint
;1930:      G_SetBuildableAnim(spawnPoint, BANIM_SPAWN1, qtrue);
ADDRLP4 84
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1932
;1931:
;1932:      if (spawnPoint->biteam == PTE_ALIENS)
ADDRLP4 84
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $706
line 1933
;1933:        spawnPoint->clientSpawnTime = ALIEN_SPAWN_REPEAT_TIME;
ADDRLP4 84
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 10
ASGNI4
ADDRGP4 $707
JUMPV
LABELV $706
line 1934
;1934:      else if (spawnPoint->biteam == PTE_HUMANS)
ADDRLP4 84
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $708
line 1935
;1935:        spawnPoint->clientSpawnTime = HUMAN_SPAWN_REPEAT_TIME;
ADDRLP4 84
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 100
ASGNI4
LABELV $708
LABELV $707
line 1936
;1936:    }
LABELV $704
line 1937
;1937:  }
LABELV $694
line 1938
;1938:  client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 1941
;1939:
;1940:  // toggle the teleport bit so the client knows to not lerp
;1941:  flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 98306
BANDI4
ASGNI4
line 1942
;1942:  flags ^= EF_TELEPORT_BIT;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 1943
;1943:  G_UnlaggedClear(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnlaggedClear
CALLV
pop
line 1947
;1944:
;1945:  // clear everything but the persistant data
;1946:
;1947:  saved = client->pers;
ADDRLP4 116
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 648
line 1948
;1948:  savedSess = client->sess;
ADDRLP4 764
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRB
ASGNB 40
line 1949
;1949:  savedPing = client->ps.ping;
ADDRLP4 804
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1951
;1950:
;1951:  for(i = 0;i < MAX_PERSISTANT;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $710
line 1952
;1952:    persistant[i] = client->ps.persistant[i];
ADDRLP4 1848
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1848
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 1848
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
LABELV $711
line 1951
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $710
line 1954
;1953:
;1954:  eventSequence = client->ps.eventSequence;
ADDRLP4 808
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1955
;1955:  memset(client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2148
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1957
;1956:
;1957:  if (ent->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $714
line 1958
;1958:  {
line 1959
;1959:    botWalk(ent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 1960
;1960:    botJump(ent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botJump
CALLV
pop
line 1961
;1961:    ent->botCommand = BOT_REGULAR;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 1
ASGNI4
line 1962
;1962:  }
LABELV $714
line 1964
;1963:
;1964:  client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRLP4 116
INDIRB
ASGNB 648
line 1965
;1965:  client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
ADDRLP4 764
INDIRB
ASGNB 40
line 1966
;1966:  client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 804
INDIRI4
ASGNI4
line 1967
;1967:  client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1224
ADDP4
CNSTI4 -1
ASGNI4
line 1969
;1968:
;1969:  for(i = 0;i < MAX_PERSISTANT;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $716
line 1970
;1970:    client->ps.persistant[i] = persistant[i];
ADDRLP4 1852
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1852
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 1852
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
LABELV $717
line 1969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $716
line 1972
;1971:
;1972:  client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 808
INDIRI4
ASGNI4
line 1975
;1973:
;1974:  // increment the spawncount so the client will detect the respawn
;1975:  client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1856
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1856
INDIRP4
ADDRLP4 1856
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1976
;1976:  client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ASGNI4
line 1979
;1977:
;1978:  // restore really persistant things
;1979:  client->ps.persistant[PERS_SCORE] = client->pers.score;
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 1980
;1980:  client->ps.persistant[PERS_CREDIT] = client->pers.credit;
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ASGNI4
line 1982
;1981:
;1982:  client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1984
;1983:
;1984:  trap_GetUserinfo(index, userinfo, sizeof(userinfo));
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 812
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1985
;1985:  client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 1989
;1986:
;1987:  //Com_Printf( "ent->client->pers->pclass = %i\n", ent->client->pers.classSelection );
;1988:
;1989:  ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1990
;1990:  ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 2148
ADDRLP4 72
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1991
;1991:  ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 1992
;1992:  ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1993
;1993:  ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $721
ASGNP4
line 1994
;1994:  ent->r.contents = CONTENTS_BODY ;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1995
;1995:  ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1996
;1996:  ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 player_die
ASGNP4
line 1997
;1997:  ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 0
ASGNI4
line 1998
;1998:  ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 0
ASGNI4
line 1999
;1999:  ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 2000
;2000:  if (ent != spawn)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $722
line 2001
;2001:  {
line 2002
;2002:    ent->antispawncamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2003
;2003:  }
LABELV $722
line 2006
;2004:
;2005:  //TA: calculate each client's acceleration
;2006:  ent->evaluateAcceleration = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 1
ASGNI4
line 2008
;2007:
;2008:  client->ps.stats[STAT_WEAPONS] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2009
;2009:  client->ps.stats[STAT_WEAPONS2] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 2010
;2010:  client->ps.stats[STAT_SLOTS] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 2012
;2011:
;2012:  client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 2013
;2013:  client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 2015
;2014:
;2015:  BG_FindBBoxForClass(ent->client->pers.classSelection, ent->r.mins, ent->r.maxs, NULL, NULL, NULL);
ADDRLP4 1872
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1872
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 1872
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 1872
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 1876
CNSTP4 0
ASGNP4
ADDRLP4 1876
INDIRP4
ARGP4
ADDRLP4 1876
INDIRP4
ARGP4
ADDRLP4 1876
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 2017
;2016:
;2017:  if (client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $725
line 2018
;2018:    client->pers.maxHealth = client->ps.stats[STAT_MAX_HEALTH] = BG_FindHealthForClass(
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 1880
ADDRGP4 BG_FindHealthForClass
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 1880
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 1880
INDIRI4
ASGNI4
ADDRGP4 $726
JUMPV
LABELV $725
line 2021
;2019:      ent->client->pers.classSelection);
;2020:  else
;2021:    client->pers.maxHealth = client->ps.stats[STAT_MAX_HEALTH] = 100;
ADDRLP4 1892
CNSTI4 100
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 1892
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 1892
INDIRI4
ASGNI4
LABELV $726
line 2023
;2022:
;2023:  if (ent->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $727
line 2024
;2024:  {
line 2026
;2025:    //Sex request incrase hp depending on numClients.
;2026:    client->pers.maxHealth += (20 * (level.numConnectedClients - level.bots));
ADDRLP4 1896
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1896
INDIRP4
ADDRLP4 1896
INDIRP4
INDIRI4
CNSTI4 20
ADDRGP4 level+173940
INDIRI4
ADDRGP4 level+190004
INDIRI4
SUBI4
MULI4
ADDI4
ASGNI4
line 2028
;2027:    //    G_Printf("New %s HP is %d\n", client->pers.netname, client->pers.maxHealth);
;2028:  }
LABELV $727
line 2030
;2029:  // clear entity values
;2030:  if (ent->client->pers.classSelection == PCL_HUMAN)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 11
NEI4 $731
line 2031
;2031:  {
line 2032
;2032:    BG_AddWeaponToInventory(WP_PISTOL, client->ps.stats);
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 2033
;2033:    BG_AddUpgradeToInventory(UP_MEDKIT, client->ps.stats);
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 2034
;2034:    weapon = client->pers.humanItemSelection;
ADDRLP4 80
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2035
;2035:  }
ADDRGP4 $732
JUMPV
LABELV $731
line 2036
;2036:  else if (client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $733
line 2037
;2037:    weapon = BG_FindStartWeaponForClass(ent->client->pers.classSelection);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 1896
ADDRGP4 BG_FindStartWeaponForClass
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 1896
INDIRI4
ASGNI4
ADDRGP4 $734
JUMPV
LABELV $733
line 2038
;2038:  else if(ent->client->pers.classSelection == PCL_ALIEN_BUILDER0 ||
ADDRLP4 1900
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1900
INDIRI4
CNSTI4 1
EQI4 $738
ADDRLP4 1900
INDIRI4
CNSTI4 2
EQI4 $738
ADDRLP4 1900
INDIRI4
CNSTI4 3
NEI4 $735
LABELV $738
line 2041
;2039:      ent->client->pers.classSelection == PCL_ALIEN_BUILDER0_UPG ||
;2040:      ent->client->pers.classSelection == PCL_ALIEN_LEVEL0)
;2041:  {
line 2042
;2042:    weapon = WP_ZOMBIE_BITE;
ADDRLP4 80
CNSTI4 13
ASGNI4
line 2043
;2043:  }
ADDRGP4 $736
JUMPV
LABELV $735
line 2045
;2044:  else
;2045:    weapon = WP_NONE;
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $736
LABELV $734
LABELV $732
line 2047
;2046:
;2047:  BG_FindAmmoForWeapon(weapon, &maxAmmo, &maxClips);
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 1836
ARGP4
ADDRLP4 1840
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 2048
;2048:  BG_AddWeaponToInventory(weapon, client->ps.stats);
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 2049
;2049:  BG_PackAmmoArray(weapon, &client->ps.ammo, client->ps.powerups, maxAmmo, maxClips);
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 1836
INDIRI4
ARGI4
ADDRLP4 1840
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 2051
;2050:
;2051:  ent->client->ps.stats[STAT_PCLASS] = ent->client->pers.classSelection;
ADDRLP4 1908
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1908
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1908
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 2052
;2052:  ent->client->ps.stats[STAT_PTEAM] = ent->client->pers.teamSelection;
ADDRLP4 1912
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1912
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 1912
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 2054
;2053:
;2054:  ent->client->ps.stats[STAT_BUILDABLE] = BA_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 2055
;2055:  ent->client->ps.stats[STAT_STATE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 2056
;2056:  VectorSet(ent->client->ps.grapplePoint, 0.0f, 0.0f, 1.0f);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 100
ADDP4
CNSTF4 1065353216
ASGNF4
line 2059
;2057:
;2058:  // health will count down towards max_health
;2059:  ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH]; //* 1.25;
ADDRLP4 1920
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1920
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 1920
INDIRI4
ASGNI4
line 2062
;2060:
;2061:  //if evolving scale health
;2062:  if (ent == spawn)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $739
line 2063
;2063:  {
line 2064
;2064:    ent->health *= ent->client->pers.evolveHealthFraction;
ADDRLP4 1924
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1928
ADDRLP4 1924
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 1928
INDIRP4
ADDRLP4 1928
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 1924
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2065
;2065:    client->ps.stats[STAT_HEALTH] *= ent->client->pers.evolveHealthFraction;
ADDRLP4 1932
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ASGNP4
ADDRLP4 1932
INDIRP4
ADDRLP4 1932
INDIRP4
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2066
;2066:  }
LABELV $739
line 2069
;2067:
;2068:  //clear the credits array
;2069:  for(i = 0;i < MAX_CLIENTS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $741
line 2070
;2070:    ent->credits[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
ADDP4
CNSTI4 0
ASGNI4
LABELV $742
line 2069
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $741
line 2072
;2071:
;2072:  client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1000
ASGNI4
line 2074
;2073:
;2074:  G_SetOrigin(ent, spawn_origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2075
;2075:  VectorCopy(spawn_origin, client->ps.origin);
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 88
INDIRB
ASGNB 12
line 2081
;2076:
;2077:#define UP_VEL  150.0f
;2078:#define F_VEL   50.0f
;2079:
;2080:  //give aliens some spawn velocity
;2081:  if (client->sess.sessionTeam != TEAM_SPECTATOR && client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRLP4 1928
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 1928
INDIRI4
EQI4 $745
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1928
INDIRI4
NEI4 $745
line 2082
;2082:  {
line 2107
;2083:    /* if( ent == spawn )
;2084:     {
;2085:     //evolution particle system
;2086:     G_AddPredictableEvent( ent, EV_ALIEN_EVOLVE, DirToByte( up ) );
;2087:     }
;2088:     else
;2089:     {
;2090:     spawn_angles[ YAW ] += 180.0f;
;2091:     AngleNormalize360( spawn_angles[ YAW ] );
;2092:
;2093:     if( spawnPoint->s.origin2[ 2 ] > 0.0f )
;2094:     {
;2095:     vec3_t  forward, dir;
;2096:
;2097:     AngleVectors( spawn_angles, forward, NULL, NULL );
;2098:     VectorScale( forward, F_VEL, forward );
;2099:     VectorAdd( spawnPoint->s.origin2, forward, dir );
;2100:     VectorNormalize( dir );
;2101:
;2102:     VectorScale( dir, UP_VEL, client->ps.velocity );
;2103:     }
;2104:
;2105:     //G_AddPredictableEvent( ent, EV_PLAYER_RESPAWN, 0 );
;2106:     }*/
;2107:  }
ADDRGP4 $746
JUMPV
LABELV $745
line 2108
;2108:  else if (client->sess.sessionTeam != TEAM_SPECTATOR && (client->ps.stats[STAT_PTEAM]
ADDRLP4 1936
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 1936
INDIRI4
EQI4 $747
ADDRLP4 1940
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1940
INDIRI4
CNSTI4 2
EQI4 $749
ADDRLP4 1940
INDIRI4
ADDRLP4 1936
INDIRI4
NEI4 $747
LABELV $749
line 2110
;2109:      == PTE_HUMANS || client->ps.stats[STAT_PTEAM] == PTE_ALIENS))
;2110:  {
line 2111
;2111:    spawn_angles[YAW] += 180.0f;
ADDRLP4 104+4
ADDRLP4 104+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 2112
;2112:    AngleNormalize360(spawn_angles[YAW]);
ADDRLP4 104+4
INDIRF4
ARGF4
ADDRGP4 AngleNormalize360
CALLF4
pop
line 2113
;2113:  }
LABELV $747
LABELV $746
line 2116
;2114:
;2115:  // the respawned flag will be cleared after the attack and jump keys come up
;2116:  client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1944
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1944
INDIRP4
ADDRLP4 1944
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2118
;2117:
;2118:  trap_GetUsercmd(client - level.clients, &ent->client->pers.cmd);
ADDRLP4 4
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
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2119
;2119:  G_SetClientViewAngle(ent, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 2121
;2120:
;2121:  if (!(client->sess.sessionTeam == TEAM_SPECTATOR))
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $752
line 2122
;2122:  {
line 2124
;2123:    /*G_KillBox( ent );*///blame this if a newly spawned client gets stuck in another
;2124:    trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2127
;2125:
;2126:    // force the base weapon up
;2127:    client->ps.weapon = WP_NONE;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2128
;2128:    client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2129
;2129:  }
LABELV $752
line 2132
;2130:
;2131:  // don't allow full run speed for a bit
;2132:  client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1948
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1948
INDIRP4
ADDRLP4 1948
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2133
;2133:  client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 2135
;2134:
;2135:  client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1236
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2136
;2136:  client->lastKillTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1256
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2138
;2137:
;2138:  client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1240
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2139
;2139:  client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1180
ADDP4
CNSTI4 0
ASGNI4
line 2142
;2140:
;2141:  // set default animations
;2142:  client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 2143
;2143:  client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 2145
;2144:
;2145:  if (level.intermissiontime)
ADDRGP4 level+185040
INDIRI4
CNSTI4 0
EQI4 $758
line 2146
;2146:    MoveClientToIntermission(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
ADDRGP4 $759
JUMPV
LABELV $758
line 2148
;2147:  else
;2148:  {
line 2150
;2149:    // fire the targets of the spawn point
;2150:    if (!spawn)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $761
line 2151
;2151:      G_UseTargets(spawnPoint, ent);
ADDRLP4 84
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $761
line 2155
;2152:
;2153:    // select the highest weapon number available, after any
;2154:    // spawn given items have fired
;2155:    client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2157
;2156:
;2157:    for(i = WP_NUM_WEAPONS - 1;i > 0;i--)
ADDRLP4 0
CNSTI4 29
ASGNI4
LABELV $763
line 2158
;2158:    {
line 2159
;2159:      if (BG_InventoryContainsWeapon(i, client->ps.stats))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1952
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1952
INDIRI4
CNSTI4 0
EQI4 $767
line 2160
;2160:      {
line 2161
;2161:        client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2162
;2162:        break;
ADDRGP4 $765
JUMPV
LABELV $767
line 2164
;2163:      }
;2164:    }
LABELV $764
line 2157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $763
LABELV $765
line 2165
;2165:  }
LABELV $759
line 2169
;2166:
;2167:  // run a client frame to drop exactly to the floor,
;2168:  // initialize animations and other things
;2169:  client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 2170
;2170:  ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2171
;2171:  ClientThink(ent - g_entities);
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
ADDRGP4 ClientThink
CALLV
pop
line 2174
;2172:
;2173:  // positively link the client, even if the command times are weird
;2174:  if (client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $771
line 2175
;2175:  {
line 2176
;2176:    BG_PlayerStateToEntityState(&client->ps, &ent->s, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2177
;2177:    VectorCopy(ent->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 1952
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1952
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 1952
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2178
;2178:    trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2179
;2179:  }
LABELV $771
line 2182
;2180:
;2181:  //TA: must do this here so the number of active clients is calculated
;2182:  CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2185
;2183:
;2184:  // run the presend to set anything else
;2185:  ClientEndFrame(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2188
;2186:
;2187:  // clear entity state values
;2188:  BG_PlayerStateToEntityState(&client->ps, &ent->s, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2190
;2189:
;2190:  BG_AddUpgradeToInventory(UP_LIGHTARMOUR, ent->client->ps.stats);
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 2191
;2191:  BG_AddUpgradeToInventory(UP_HELMET, ent->client->ps.stats);
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 2192
;2192:  BG_AddWeaponToInventory(WP_HBUILD2, ent->client->ps.stats);
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 2194
;2193:
;2194:}
LABELV $681
endproc ClientSpawn 1956 24
export ClientDisconnect
proc ClientDisconnect 36 20
line 2210
;2195:
;2196:/*
;2197: ===========
;2198: ClientDisconnect
;2199:
;2200: Called when a player drops from the server.
;2201: Will not be called between levels.
;2202:
;2203: This should NOT be called directly by any game logic,
;2204: call trap_DropClient(), which will call this and do
;2205: server system housekeeping.
;2206: ============
;2207: */
;2208:void
;2209:ClientDisconnect(int clientNum)
;2210:{
line 2216
;2211:  gentity_t *ent;
;2212:  gentity_t *tent;
;2213:  int i;
;2214:  buildHistory_t *ptr;
;2215:
;2216:  ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2218
;2217:
;2218:  if (!ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $774
line 2219
;2219:    return;
ADDRGP4 $773
JUMPV
LABELV $774
line 2222
;2220:
;2221:	//K sob
;2222:	if(ent->client->pers.mysqlid > 0)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
LEI4 $776
line 2223
;2223:	{
line 2224
;2224:		ent->client->pers.timeplayed += (level.time - ent->client->pers.enterTime) / 60000; //Minutes played
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRGP4 level+28
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ADDI4
ASGNI4
line 2225
;2225:		if( trap_mysql_runquery( va("UPDATE players SET timeplayed=\"%d\",adminlevel=\"%d\",lasttime=NOW() WHERE id=\"%d\" LIMIT 1", ent->client->pers.timeplayed, ent->client->pers.adminlevel, ent->client->pers.mysqlid ) ) == qtrue )
ADDRGP4 $781
ARGP4
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $779
line 2226
;2226:		{
line 2227
;2227:		}
LABELV $779
line 2229
;2228:		else
;2229:		{
line 2230
;2230:		}
LABELV $780
line 2231
;2231:		trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 2232
;2232:	}	
LABELV $776
line 2235
;2233:	
;2234:  // look through the bhist and readjust it if the referenced ent has left
;2235:  for(ptr = level.buildHistory;ptr;ptr = ptr->next)
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRGP4 $785
JUMPV
LABELV $782
line 2236
;2236:  {
line 2237
;2237:    if (ptr->ent == ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $787
line 2238
;2238:    {
line 2239
;2239:      ptr->ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTP4 0
ASGNP4
line 2240
;2240:      Q_strncpyz(ptr->name, ent->client->pers.netname, MAX_NETNAME);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 16
CNSTI4 516
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2241
;2241:    }
LABELV $787
line 2242
;2242:  }
LABELV $783
line 2235
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $785
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $782
line 2244
;2243:
;2244:  G_admin_namelog_update(ent->client, qtrue);
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 2245
;2245:  G_LeaveTeam(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LeaveTeam
CALLV
pop
line 2248
;2246:
;2247:  // stop any following clients
;2248:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $792
JUMPV
LABELV $789
line 2249
;2249:  {
line 2251
;2250:    // remove any /ignore settings for this clientNum
;2251:    BG_ClientListRemove(&level.clients[i].sess.ignoreList, clientNum);
CNSTI4 2148
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1152
ADDP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BG_ClientListRemove
CALLV
pop
line 2252
;2252:  }
LABELV $790
line 2248
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $792
ADDRLP4 8
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $789
line 2255
;2253:
;2254:  // send effect if they were completely connected
;2255:  if (ent->client->pers.connected == CON_CONNECTED && ent->client->sess.sessionTeam
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $794
ADDRLP4 16
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $794
line 2257
;2256:      != TEAM_SPECTATOR)
;2257:  {
line 2258
;2258:    tent = G_TempEntity(ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT);
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 2259
;2259:    tent->s.clientNum = ent->s.clientNum;
ADDRLP4 24
CNSTI4 168
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 2260
;2260:    trap_UnlinkEntity(tent);//Trying to free it.
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2261
;2261:    tent = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 2263
;2262:    
;2263:  }
LABELV $794
line 2265
;2264:
;2265:  if (ent->client->pers.connection)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $796
line 2266
;2266:    ent->client->pers.connection->clientNum = -1;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 -1
ASGNI4
LABELV $796
line 2268
;2267:
;2268:  G_LogPrintf(
ADDRGP4 $798
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRLP4 24
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2272
;2269:    "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip,
;2270:    ent->client->pers.guid, ent->client->pers.netname);
;2271:
;2272:  trap_UnlinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2273
;2273:  ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 2274
;2274:  ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2275
;2275:  ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $799
ASGNP4
line 2276
;2276:  ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 0
ASGNI4
line 2277
;2277:  ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 2278
;2278:  ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 0
ASGNI4
line 2280
;2279:
;2280:  trap_SetConfigstring(CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2282
;2281:
;2282:  CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2283
;2283:}
LABELV $773
endproc ClientDisconnect 36 20
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
import player_die
import BeginIntermission
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
LABELV $800
byte 1 0
align 1
LABELV $799
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $798
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $781
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
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
LABELV $721
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $703
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $679
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 33
byte 1 32
byte 1 68
byte 1 111
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 44
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 33
byte 1 109
byte 1 121
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 0
align 1
LABELV $678
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 105
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
byte 1 46
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
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
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 94
byte 1 50
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 47
byte 1 94
byte 1 49
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $672
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $671
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $670
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $658
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $652
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 65
byte 1 117
byte 1 116
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 97
byte 1 117
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $649
byte 1 65
byte 1 32
byte 1 117
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 49
byte 1 52
byte 1 49
byte 1 55
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 99
byte 1 0
align 1
LABELV $644
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
byte 1 32
byte 1 40
byte 1 113
byte 1 107
byte 1 101
byte 1 121
byte 1 44
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 44
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
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
byte 1 44
byte 1 105
byte 1 112
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
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $639
byte 1 105
byte 1 100
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $635
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
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
byte 1 105
byte 1 100
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
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
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $632
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
byte 1 0
align 1
LABELV $631
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
byte 1 0
align 1
LABELV $630
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $629
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
byte 1 0
align 1
LABELV $628
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
byte 1 0
align 1
LABELV $627
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
byte 1 0
align 1
LABELV $626
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
byte 1 0
align 1
LABELV $625
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 0
align 1
LABELV $624
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $621
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
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
byte 1 105
byte 1 100
byte 1 44
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 44
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
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
byte 1 44
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 119
byte 1 105
byte 1 110
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
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 113
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 61
byte 1 32
byte 1 34
byte 1 37
byte 1 115
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
LABELV $612
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
byte 1 32
byte 1 40
byte 1 113
byte 1 107
byte 1 101
byte 1 121
byte 1 44
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 105
byte 1 112
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
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $609
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $606
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
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
byte 1 105
byte 1 100
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 113
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 61
byte 1 32
byte 1 34
byte 1 37
byte 1 115
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
LABELV $600
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $598
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $580
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 0
align 1
LABELV $577
byte 1 70
byte 1 65
byte 1 73
byte 1 76
byte 1 0
align 1
LABELV $576
byte 1 72
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $565
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $563
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $558
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $557
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 66
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 46
byte 1 0
align 1
LABELV $543
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $539
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
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
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 105
byte 1 103
byte 1 92
byte 1 37
byte 1 49
byte 1 54
byte 1 115
byte 1 0
align 1
LABELV $538
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $537
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $536
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
LABELV $532
byte 1 99
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $528
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $525
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 119
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $522
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 119
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $519
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $514
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $506
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $505
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 82
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $504
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 82
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $503
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 41
byte 1 0
align 1
LABELV $495
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $490
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $480
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $476
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $470
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 109
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 40
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 105
byte 1 111
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $465
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $464
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $463
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $447
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $444
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $443
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $440
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $439
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 103
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 108
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $438
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 34
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 103
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 108
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $434
byte 1 110
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $423
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $422
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $421
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $415
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $410
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $406
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $401
byte 1 78
byte 1 101
byte 1 119
byte 1 98
byte 1 105
byte 1 101
byte 1 35
byte 1 0
align 1
LABELV $395
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $388
byte 1 47
byte 1 42
byte 1 0
align 1
LABELV $387
byte 1 47
byte 1 47
byte 1 0
align 1
LABELV $384
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 0
align 1
LABELV $309
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 67
byte 1 111
byte 1 114
byte 1 112
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $308
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 67
byte 1 111
byte 1 114
byte 1 112
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $261
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $257
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $188
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $96
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $92
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 48
byte 1 0
align 1
LABELV $88
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
