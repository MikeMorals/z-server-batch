export ACEAI_CheckServerCommands
code
proc ACEAI_CheckServerCommands 0 0
file "..\..\..\..\src/game/acebot_ai.c"
line 35
;1:/*
;2: ===========================================================================
;3: Copyright (C) 1998 Steve Yeager
;4: Copyright (C) 2008 Robert Beckebans <trebor_7@users.sourceforge.net>
;5:
;6: This file is part of XreaL source code.
;7:
;8: XreaL source code is free software; you can redistribute it
;9: and/or modify it under the terms of the GNU General Public License as
;10: published by the Free Software Foundation; either version 2 of the License,
;11: or (at your option) any later version.
;12:
;13: XreaL source code is distributed in the hope that it will be
;14: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16: GNU General Public License for more details.
;17:
;18: You should have received a copy of the GNU General Public License
;19: along with XreaL source code; if not, write to the Free Software
;20: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21: ===========================================================================
;22: */
;23://
;24://  acebot_ai.c -      This file contains all of the
;25://                     AI routines for the ACE II bot.
;26:
;27:
;28:#include "g_local.h"
;29:#include "acebot.h"
;30:
;31:#if defined(ACEBOT)
;32:
;33:void
;34:ACEAI_CheckServerCommands(gentity_t * self)
;35:{
line 37
;36:
;37:}
LABELV $87
endproc ACEAI_CheckServerCommands 0 0
export ACEAI_CheckSnapshotEntities
proc ACEAI_CheckSnapshotEntities 0 0
line 41
;38:
;39:void
;40:ACEAI_CheckSnapshotEntities(gentity_t * self)
;41:{
line 49
;42:  /*int             sequence, entnum;
;43:
;44:   // parse through the bot's list of snapshot entities and scan each of them
;45:   sequence = 0;
;46:   while((entnum = trap_BotGetSnapshotEntity(self - g_entities, sequence++)) >= 0)	// && (entnum < MAX_CLIENTS))
;47:   ;						//BotScanEntity(bs, &g_entities[entnum], &scan, scan_mode);
;48:   */
;49:}
LABELV $88
endproc ACEAI_CheckSnapshotEntities 0 0
export ACEAI_Think
proc ACEAI_Think 1048 12
line 60
;50:
;51:/*
;52: =============
;53: ACEAI_Think
;54:
;55: Main Think function for bot
;56: =============
;57: */
;58:void
;59:ACEAI_Think(gentity_t * self)
;60:{
line 65
;61:  int i;
;62:  int clientNum;
;63:  char userinfo[MAX_INFO_STRING];
;64:
;65:  if (!self->bs.state)
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $90
line 66
;66:  {
line 67
;67:    G_Printf("Setting bot State.\n");
ADDRGP4 $92
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 68
;68:    ACESP_SetupBotState(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACESP_SetupBotState
CALLV
pop
line 69
;69:  }
LABELV $90
line 71
;70:
;71:  clientNum = self->client - level.clients;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2148
DIVI4
ASGNI4
line 72
;72:  trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 75
;73:
;74:  // set up client movement
;75:  VectorCopy(self->client->ps.viewangles, self->bs.viewAngles);
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 2352
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 76
;76:  VectorSet(self->client->ps.delta_angles, 0, 0, 0);
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
line 80
;77:
;78:  // FIXME: needed?
;79:
;80:  self->client->pers.cmd.buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 81
;81:  botWalk(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 82
;82:  self->client->pers.cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 0
ASGNI1
line 83
;83:  self->client->pers.cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
CNSTI1 0
ASGNI1
line 85
;84:
;85:  self->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 86
;86:  self->bs.moveTarget = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
CNSTP4 0
ASGNP4
line 89
;87:
;88:  // force respawn
;89:  if (self->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $93
line 90
;90:  {
line 91
;91:    self->client->buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 0
ASGNI4
line 92
;92:    self->client->pers.cmd.buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 93
;93:  }
LABELV $93
line 95
;94:
;95:  if (self->bs.state == STATE_WANDER && self->bs.wander_timeout < level.time)
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 2424
ADDP4
INDIRI4
CNSTI4 3
NEI4 $95
ADDRLP4 1036
INDIRP4
CNSTI4 2392
ADDP4
INDIRF4
ADDRGP4 level+28
INDIRI4
CVIF4 4
GEF4 $95
line 96
;96:  {
line 98
;97:    // pick a new long range goal
;98:    ACEAI_PickLongRangeGoal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_PickLongRangeGoal
CALLV
pop
line 99
;99:  }
LABELV $95
line 101
;100:
;101:  if (self->bs.state == STATE_WANDER)
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
INDIRI4
CNSTI4 3
NEI4 $98
line 102
;102:  {
line 103
;103:    if (director_debug.integer)
ADDRGP4 director_debug+12
INDIRI4
CNSTI4 0
EQI4 $100
line 104
;104:    {
line 105
;105:      G_Printf("Wandering\n");
ADDRGP4 $103
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 106
;106:    }
LABELV $100
line 107
;107:    ACEMV_Wander(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_Wander
CALLV
pop
line 108
;108:  }
ADDRGP4 $99
JUMPV
LABELV $98
line 109
;109:  else if (self->bs.state == STATE_MOVE)
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
INDIRI4
CNSTI4 1
NEI4 $104
line 110
;110:  {
line 111
;111:    if (director_debug.integer)
ADDRGP4 director_debug+12
INDIRI4
CNSTI4 0
EQI4 $106
line 112
;112:    {
line 113
;113:      G_Printf("ACEMV_Move\n");
ADDRGP4 $109
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 114
;114:    }
LABELV $106
line 115
;115:    ACEMV_Move(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_Move
CALLV
pop
line 116
;116:  }
LABELV $104
LABELV $99
line 118
;117:
;118:  for(i = 0;i < 3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $110
line 119
;119:  {
line 120
;120:    self->client->pers.cmd.angles[i] = ANGLE2SHORT(self->bs.viewAngles[i]);
ADDRLP4 1040
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 480
ADDP4
ADDP4
CNSTF4 1199570944
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRP4
CNSTI4 2352
ADDP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 121
;121:  }
LABELV $111
line 118
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $110
line 122
;122:}
LABELV $89
endproc ACEAI_Think 1048 12
export ACEAI_InFront
proc ACEAI_InFront 44 16
line 133
;123:
;124:/*
;125: =============
;126: ACEAI_InFront
;127:
;128: returns 1 if the entity is in front (in sight) of self
;129: =============
;130: */
;131:qboolean
;132:ACEAI_InFront(gentity_t * self, gentity_t * other)
;133:{
line 138
;134:  vec3_t vec;
;135:  float angle;
;136:  vec3_t forward;
;137:
;138:  AngleVectors(self->bs.viewAngles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 139
;139:  VectorSubtract(other->s.origin, self->client->ps.origin, vec);
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
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
line 140
;140:  VectorNormalize(vec);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 141
;141:  angle = AngleBetweenVectors(vec, forward);
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 40
ADDRGP4 AngleBetweenVectors
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 143
;142:
;143:  if (angle <= 85)
ADDRLP4 12
INDIRF4
CNSTF4 1118437376
GTF4 $117
line 144
;144:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $114
JUMPV
LABELV $117
line 146
;145:
;146:  return qfalse;
CNSTI4 0
RETI4
LABELV $114
endproc ACEAI_InFront 44 16
export ACEAI_Visible
proc ACEAI_Visible 88 28
line 158
;147:}
;148:
;149:/*
;150: =============
;151: ACEAI_Visible
;152:
;153: returns 1 if the entity is visible to self, even if not infront ()
;154: =============
;155: */
;156:qboolean
;157:ACEAI_Visible(gentity_t * self, gentity_t * other)
;158:{
line 166
;159:  vec3_t spot1;
;160:  vec3_t spot2;
;161:  trace_t trace;
;162:
;163:  //if(!self->client || !other->client)
;164:  //  return qfalse;
;165:
;166:  VectorCopy(self->client->ps.origin, spot1);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 169
;167:  //spot1[2] += self->client->ps.viewheight;
;168:
;169:  VectorCopy(other->client->ps.origin, spot2);
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 172
;170:  //spot2[2] += other->client->ps.viewheight;
;171:
;172:  trap_Trace(&trace, spot1, NULL, NULL, spot2, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 174
;173:
;174:  if (trace.entityNum == other->s.number)
ADDRLP4 24+52
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $120
line 175
;175:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $120
line 177
;176:
;177:  return qfalse;
CNSTI4 0
RETI4
LABELV $119
endproc ACEAI_Visible 88 28
export ACEAI_PickLongRangeGoal
proc ACEAI_PickLongRangeGoal 60 16
line 185
;178:}
;179:
;180:// Evaluate the best long range goal and send the bot on
;181:// its way. This is a good time waster, so use it sparingly.
;182:// Do not call it for every think cycle.
;183:void
;184:ACEAI_PickLongRangeGoal(gentity_t * self)
;185:{
line 188
;186:  int i;
;187:  int node;
;188:  float weight, bestWeight = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 195
;189:  int currentNode, goalNode;
;190:  gentity_t *goalEnt;
;191:  gclient_t *cl;
;192:  gentity_t *player;
;193:  float cost;
;194:
;195:  goalNode = INVALID;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 196
;196:  goalEnt = NULL;
ADDRLP4 36
CNSTP4 0
ASGNP4
line 203
;197:
;198:  //////////////////////////////////////////////////////////////////
;199:  // LOOK FOR A TARGET
;200:  //////////////////////////////////////////////////////////////////
;201:
;202:  //Free currentNode
;203:  currentNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_MOVE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 40
INDIRI4
ASGNI4
line 204
;204:  ACEND_setCurrentNode(self, currentNode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 ACEND_setCurrentNode
CALLV
pop
line 208
;205:  ////////////////////////////////////////////////////////////
;206:  // INVALID TARGET
;207:  ///////////////////////////////////////////////////////////
;208:  if (!ace_pickLongRangeGoal.integer || currentNode == INVALID)
ADDRGP4 ace_pickLongRangeGoal+12
INDIRI4
CNSTI4 0
EQI4 $127
ADDRLP4 28
INDIRI4
CNSTI4 -1
NEI4 $124
LABELV $127
line 209
;209:  {
line 210
;210:    self->bs.state = STATE_WANDER;
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
CNSTI4 3
ASGNI4
line 211
;211:    self->bs.wander_timeout = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2392
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 212
;212:    self->bs.goalNode = -1;
ADDRFP4 0
INDIRP4
CNSTI4 2404
ADDP4
CNSTI4 -1
ASGNI4
line 214
;213:    //G_Printf("There are not good nodes to follow\n");
;214:    return;
ADDRGP4 $123
JUMPV
LABELV $124
line 228
;215:  }
;216:
;217:  /*if (!ACEND_pointVisibleFromEntity(nodes[currentNode].origin, self))
;218:   {
;219:   G_Printf("\n\nJACK POINT\n\n");
;220:   self->bs.state = STATE_WANDER;
;221:   self->bs.wander_timeout = level.time + 1000;
;222:   self->bs.goalNode = -1;
;223:   G_Printf("There are not good nodes to follow\n");
;224:   return;
;225:   }*/
;226:  // this should be its own function and is for now just
;227:  // finds a player to set as the goal
;228:  for(i = 0;i < g_maxclients.integer;i++)
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 229
;229:  {
line 230
;230:    cl = level.clients + i;
ADDRLP4 16
CNSTI4 2148
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 231
;231:    player = level.gentities + cl->ps.clientNum;
ADDRLP4 0
CNSTI4 2476
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 233
;232:
;233:    if (player == self)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $135
line 234
;234:      continue;
ADDRGP4 $130
JUMPV
LABELV $135
line 236
;235:
;236:    if (cl->pers.connected != CON_CONNECTED)
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $137
line 237
;237:      continue;
ADDRGP4 $130
JUMPV
LABELV $137
line 239
;238:
;239:    if (player->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $139
line 240
;240:      continue;
ADDRGP4 $130
JUMPV
LABELV $139
line 242
;241:
;242:    if (player->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $141
line 243
;243:      continue;
ADDRGP4 $130
JUMPV
LABELV $141
line 245
;244:
;245:    node = ACEND_FindClosestReachableNode(player, NODE_DENSITY, NODE_ALL);
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 44
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 44
INDIRI4
ASGNI4
line 246
;246:    cost = ACEND_FindCost(currentNode, node);
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 ACEND_FindCost
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 248
;247:
;248:    if (cost == INVALID || cost < 3) // ignore invalid and very short hops
ADDRLP4 8
INDIRF4
CNSTF4 3212836864
EQF4 $145
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
GEF4 $143
LABELV $145
line 249
;249:      continue;
ADDRGP4 $130
JUMPV
LABELV $143
line 251
;250:
;251:    weight = 0.3f;
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 253
;252:
;253:    weight *= random(); // Allow random variations
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 254
;254:    weight /= cost; // Check against cost of getting there
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 256
;255:
;256:    if (weight > bestWeight)
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $146
line 257
;257:    {
line 258
;258:      bestWeight = weight;
ADDRLP4 24
ADDRLP4 4
INDIRF4
ASGNF4
line 259
;259:      goalNode = node;
ADDRLP4 32
ADDRLP4 20
INDIRI4
ASGNI4
line 260
;260:      goalEnt = player;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
line 261
;261:    }
LABELV $146
line 262
;262:  }
LABELV $130
line 228
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 12
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $129
line 265
;263:
;264:  // if do not find a goal, go wandering....
;265:  if (bestWeight == 0.0f || goalNode == INVALID)
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $150
ADDRLP4 32
INDIRI4
CNSTI4 -1
NEI4 $148
LABELV $150
line 266
;266:  {
line 267
;267:    self->bs.goalNode = INVALID;
ADDRFP4 0
INDIRP4
CNSTI4 2404
ADDP4
CNSTI4 -1
ASGNI4
line 268
;268:    self->bs.state = STATE_WANDER;
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
CNSTI4 3
ASGNI4
line 269
;269:    self->bs.wander_timeout = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2392
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 270
;270:    ACEND_setCurrentNode(self, INVALID);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 ACEND_setCurrentNode
CALLV
pop
line 272
;271:
;272:    if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $123
line 273
;273:      G_Printf("print \"%s: wandering..n\"", self->client->pers.netname);
ADDRGP4 $155
ARGP4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 274
;274:    return; // no path?
ADDRGP4 $123
JUMPV
LABELV $148
line 278
;275:  }
;276:
;277:  // OK, everything valid, let's start moving to our goal
;278:  self->bs.state = STATE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
CNSTI4 1
ASGNI4
line 279
;279:  self->bs.tries = 0; // reset the count of how many times we tried this goal
ADDRFP4 0
INDIRP4
CNSTI4 2420
ADDP4
CNSTI4 0
ASGNI4
line 281
;280:
;281:  if (goalEnt != NULL && ace_debug.integer)
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $156
line 282
;282:    G_Printf(
ADDRGP4 $159
ARGP4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $156
line 286
;283:      "print \"%s: selected a %s at node %d for LR goal\n\"", self->client->pers.netname,
;284:      goalEnt->classname, goalNode);
;285:
;286:  ACEND_SetGoal(self, goalNode, NODE_ALL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 99
ARGI4
ADDRGP4 ACEND_SetGoal
CALLV
pop
line 287
;287:}
LABELV $123
endproc ACEAI_PickLongRangeGoal 60 16
export ACEAI_PickShortRangeGoal
proc ACEAI_PickShortRangeGoal 36 12
line 294
;288:
;289:// Pick best goal based on importance and range. This function
;290:// overrides the long range goal selection for items that
;291:// are very close to the bot and are reachable.
;292:void
;293:ACEAI_PickShortRangeGoal(gentity_t * self)
;294:{
line 296
;295:  gentity_t *target;
;296:  float bestWeight = 0.0f;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 298
;297:  gentity_t *best;
;298:  float shortRange = 200;
ADDRLP4 4
CNSTF4 1128792064
ASGNF4
line 300
;299:
;300:  if (!ace_pickShortRangeGoal.integer)
ADDRGP4 ace_pickShortRangeGoal+12
INDIRI4
CNSTI4 0
NEI4 $161
line 301
;301:    return;
ADDRGP4 $160
JUMPV
LABELV $161
line 303
;302:
;303:  best = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 306
;304:
;305:  // look for a target (should make more efficent later)
;306:  target = G_FindRadius(NULL, self->client->ps.origin, shortRange);
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 G_FindRadius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $165
JUMPV
LABELV $164
line 309
;307:
;308:  while(target)
;309:  {
line 310
;310:    if (target->classname == NULL)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $167
line 311
;311:      return; //goto nextTarget;
ADDRGP4 $160
JUMPV
LABELV $167
line 313
;312:
;313:    if (target == self)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $169
line 314
;314:      goto nextTarget;
ADDRGP4 $171
JUMPV
LABELV $169
line 318
;315:
;316:    // missile avoidance code
;317:    // set our moveTarget to be the rocket or grenade fired at us.
;318:    if (!Q_stricmp(target->classname, "rocket") || !Q_stricmp(target->classname, "grenade"))
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $176
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $172
LABELV $176
line 319
;319:    {
line 320
;320:      if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $177
line 321
;321:        trap_SendServerCommand(-1, va("print \"%s: ROCKET ALERT!\n\"", self->client->pers.netname));
ADDRGP4 $180
ARGP4
ADDRLP4 28
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $177
line 323
;322:
;323:      best = target;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 324
;324:      bestWeight++;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 325
;325:      break;
ADDRGP4 $166
JUMPV
LABELV $172
line 341
;326:    }
;327:
;328:#if 0
;329:    // so players can't sneak RIGHT up on a bot
;330:    if(!Q_stricmp(target->classname, "player"))
;331:    {
;332:      if(target->health && !OnSameTeam(self, target))
;333:      {
;334:        best = target;
;335:        bestWeight++;
;336:        break;
;337:      }
;338:    }
;339:#endif
;340:
;341:    if (ACEIT_IsReachable(self, target->s.origin))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 ACEIT_IsReachable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $181
line 342
;342:    {
line 343
;343:      if (ACEAI_InFront(self, target))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 ACEAI_InFront
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $183
line 344
;344:      {
line 345
;345:      }
LABELV $183
line 346
;346:    }
LABELV $181
LABELV $171
line 349
;347:
;348:    // next target
;349:    nextTarget: target = G_FindRadius(target, self->client->ps.origin, shortRange);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 G_FindRadius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 350
;350:  }
LABELV $165
line 308
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
LABELV $166
line 352
;351:
;352:  if (bestWeight)
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $185
line 353
;353:  {
line 354
;354:    self->bs.moveTarget = best;
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 356
;355:
;356:    if (ace_debug.integer && self->bs.goalEntity != self->bs.moveTarget)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $187
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 2384
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CVPU4 4
EQU4 $187
line 357
;357:      G_Printf(
ADDRGP4 $190
ARGP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 516
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $187
line 361
;358:        "print \"%s: selected a %s for SR goal\n\"", self->client->pers.netname,
;359:        self->bs.moveTarget->classname);
;360:
;361:    self->bs.goalEntity = best;
ADDRFP4 0
INDIRP4
CNSTI4 2384
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 362
;362:  }
LABELV $185
line 363
;363:}
LABELV $160
endproc ACEAI_PickShortRangeGoal 36 12
export ACEAI_FindEnemy
proc ACEAI_FindEnemy 56 8
line 368
;364:
;365:// Scan for enemy (simplifed for now to just pick any visible enemy)
;366:qboolean
;367:ACEAI_FindEnemy(gentity_t * self)
;368:{
line 373
;369:  int i;
;370:  gclient_t *cl;
;371:  gentity_t *player;
;372:  float enemyRange;
;373:  float bestRange = 99999;
ADDRLP4 16
CNSTF4 1203982208
ASGNF4
line 375
;374:
;375:  if (!ace_attackEnemies.integer)
ADDRGP4 ace_attackEnemies+12
INDIRI4
CNSTI4 0
NEI4 $192
line 376
;376:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $191
JUMPV
LABELV $192
line 378
;377:
;378:  for(i = 0;i < g_maxclients.integer;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $195
line 379
;379:  {
line 380
;380:    cl = level.clients + i;
ADDRLP4 8
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 381
;381:    player = level.gentities + cl->ps.clientNum;
ADDRLP4 0
CNSTI4 2476
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 383
;382:
;383:    if (player == self)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $201
line 384
;384:      continue;
ADDRGP4 $196
JUMPV
LABELV $201
line 386
;385:
;386:    if (cl->pers.connected != CON_CONNECTED)
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $203
line 387
;387:      continue;
ADDRGP4 $196
JUMPV
LABELV $203
line 389
;388:
;389:    if (player->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $205
line 390
;390:      continue;
ADDRGP4 $196
JUMPV
LABELV $205
line 393
;391:
;392:    // don't attack team mates
;393:    if (OnSameTeam(self, player))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $207
line 394
;394:      continue;
ADDRGP4 $196
JUMPV
LABELV $207
line 396
;395:
;396:    enemyRange = Distance(self->client->ps.origin, player->client->ps.origin);
ADDRLP4 24
CNSTI4 516
ASGNI4
ADDRLP4 28
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRF4
ASGNF4
line 398
;397:
;398:    if (ACEAI_InFront(self, player) && ACEAI_Visible(self, player) && trap_InPVS(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 ACEAI_InFront
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $209
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 ACEAI_Visible
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
GEF4 $209
line 400
;399:      self->client->ps.origin, player->client->ps.origin) && enemyRange < bestRange)
;400:    {
line 411
;401:      /*
;402:       if(ace_debug.integer && self->enemy != player)
;403:       {
;404:       if(self->enemy == NULL)
;405:       trap_SendServerCommand(-1, va("print \"%s: found enemy %s\n\"", self->client->pers.netname, player->client->pers.netname));
;406:       else
;407:       trap_SendServerCommand(-1, va("print \"%s: found better enemy %s\n\"", self->client->pers.netname, player->client->pers.netname));
;408:       }
;409:       */
;410:
;411:      self->enemy = player;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 412
;412:      bestRange = enemyRange;
ADDRLP4 16
ADDRLP4 12
INDIRF4
ASGNF4
line 413
;413:    }
LABELV $209
line 414
;414:  }
LABELV $196
line 378
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $198
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $195
line 417
;415:
;416:  // FIXME ? bad design
;417:  return self->enemy != NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $212
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $212
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $213
ADDRLP4 20
INDIRI4
RETI4
LABELV $191
endproc ACEAI_FindEnemy 56 8
export ACEAI_CheckShot
proc ACEAI_CheckShot 88 28
line 423
;418:}
;419:
;420:// Hold fire with RL/BFG?
;421:qboolean
;422:ACEAI_CheckShot(gentity_t * self)
;423:{
line 426
;424:  trace_t tr;
;425:
;426:  trap_Trace(
ADDRLP4 60
CNSTF4 3238002688
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 tv
CALLP4
ASGNP4
ADDRLP4 68
CNSTF4 1090519040
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tv
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 516
ASGNI4
ADDRLP4 84
CNSTI4 20
ASGNI4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 431
;427:    &tr, self->client->ps.origin, tv(-8, -8, -8), tv(8, 8, 8), self->enemy->client->ps.origin,
;428:    self->s.number, MASK_SHOT);
;429:
;430:  // if blocked, do not shoot
;431:  if (tr.entityNum == self->enemy->s.number)
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
INDIRI4
NEI4 $215
line 432
;432:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $214
JUMPV
LABELV $215
line 434
;433:
;434:  return qfalse;
CNSTI4 0
RETI4
LABELV $214
endproc ACEAI_CheckShot 88 28
export ACEAI_ChooseWeapon
proc ACEAI_ChooseWeapon 64 8
line 440
;435:}
;436:
;437:// Choose the best weapon for bot (simplified)
;438:void
;439:ACEAI_ChooseWeapon(gentity_t * self)
;440:{
line 445
;441:  float range;
;442:  vec3_t v;
;443:
;444:  // if no enemy, then what are we doing here?
;445:  if (!self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $219
line 446
;446:    return;
ADDRGP4 $218
JUMPV
LABELV $219
line 449
;447:
;448:  // base selection on distance
;449:  VectorSubtract(self->client->ps.origin, self->enemy->client->ps.origin, v);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRLP4 24
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 20
ASGNI4
ADDRLP4 32
ADDRLP4 16
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 450
;450:  range = VectorLength(v);
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
line 459
;451:
;452:#ifdef MISSIONPACK
;453:  // only use CG when ammo > 50
;454:  if(self->client->pers.inventory[ITEMLIST_BULLETS] >= 50)
;455:  if(ACEIT_ChangeWeapon(self, FindItem("chaingun")))
;456:  return;
;457:#endif
;458:
;459:  if (ACEIT_ChangeWeapon(self, WP_SHOTGUN))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 56
ADDRGP4 ACEIT_ChangeWeapon
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $223
line 460
;460:    return;
ADDRGP4 $218
JUMPV
LABELV $223
line 462
;461:
;462:  if (ACEIT_ChangeWeapon(self, WP_MACHINEGUN))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 60
ADDRGP4 ACEIT_ChangeWeapon
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $218
line 463
;463:    return;
line 465
;464:
;465:  return;
LABELV $218
endproc ACEAI_ChooseWeapon 64 8
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
LABELV $190
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 82
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $180
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 32
byte 1 65
byte 1 76
byte 1 69
byte 1 82
byte 1 84
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $175
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $174
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $159
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 76
byte 1 82
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $155
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 110
byte 1 34
byte 1 0
align 1
LABELV $109
byte 1 65
byte 1 67
byte 1 69
byte 1 77
byte 1 86
byte 1 95
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 87
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $92
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 0
