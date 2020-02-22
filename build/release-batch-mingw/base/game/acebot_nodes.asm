export ACEND_FindCost
code
proc ACEND_FindCost 12 0
file "..\..\..\..\src/game/acebot_nodes.c"
line 43
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
;24://  acebot_nodes.c -   This file contains all of the 
;25://                     pathing routines for the ACE bot.
;26:
;27:
;28:#include "g_local.h"
;29:#include "acebot.h"
;30:
;31:#if defined(ACEBOT)
;32:
;33:// Total number of nodes
;34:int numNodes;
;35:
;36:// array for node data
;37:node_t nodes[MAX_NODES];
;38:short int path_table[MAX_NODES][MAX_NODES];
;39:
;40:// Determin cost of moving from one node to another
;41:int
;42:ACEND_FindCost(int from, int to)
;43:{
line 45
;44:  int curnode;
;45:  int cost = 1; // Shortest possible is 1
ADDRLP4 4
CNSTI4 1
ASGNI4
line 47
;46:
;47:  if (from == INVALID || to == INVALID)
ADDRLP4 8
CNSTI4 -1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $90
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $88
LABELV $90
line 48
;48:    return INVALID;
CNSTI4 -1
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 51
;49:
;50:  // If we can not get there then return invalid
;51:  if (path_table[from][to] == INVALID)
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
CNSTI4 -1
NEI4 $91
line 52
;52:    return INVALID;
CNSTI4 -1
RETI4
ADDRGP4 $87
JUMPV
LABELV $91
line 55
;53:
;54:  // Otherwise check the path and return the cost
;55:  curnode = path_table[from][to];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $93
line 59
;56:
;57:  // Find a path (linear time, very fast)
;58:  while(curnode != to)
;59:  {
line 60
;60:    curnode = path_table[curnode][to];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ASGNI4
line 61
;61:    if (curnode == INVALID) // something has corrupted the path abort
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $96
line 62
;62:      return INVALID;
CNSTI4 -1
RETI4
ADDRGP4 $87
JUMPV
LABELV $96
line 63
;63:    cost++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 64
;64:  }
LABELV $94
line 58
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $93
line 66
;65:
;66:  return cost;
ADDRLP4 4
INDIRI4
RETI4
LABELV $87
endproc ACEND_FindCost 12 0
export G_canSpawn
proc G_canSpawn 108 28
line 71
;67:}
;68:
;69:qboolean
;70:G_canSpawn(gentity_t * ent)
;71:{
line 75
;72:  vec3_t cmins, cmaxs, localOrigin;
;73:  trace_t tr;
;74:
;75:  BG_FindBBoxForClass(PCL_HUMAN, cmins, cmaxs, NULL, NULL, NULL);
CNSTI4 11
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 78
;76://  { -15, -15, -24 }, //vec3_t  mins;
;77://  { 15, 15, 32 }, //vec3_t  maxs;
;78:  ent->nextSpawnLocation[2]+=5;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 79
;79:  VectorCopy(ent->nextSpawnLocation, localOrigin);
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
INDIRB
ASGNB 12
line 82
;80:  //localOrigin[2] += fabs(cmins[2]) + 1.0f;
;81:
;82:  trap_Trace(&tr, ent->nextSpawnLocation, cmins, cmaxs, localOrigin, ent->s.number, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 2324
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 104
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 83
;83:  if(tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $99
line 84
;84:  {
line 85
;85:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 87
;86:  }
;87:  if (tr.fraction < 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $102
line 88
;88:  {
line 89
;89:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $102
line 91
;90:  }
;91:  return qtrue;
CNSTI4 1
RETI4
LABELV $98
endproc G_canSpawn 108 28
export ACEND_FindClosestSpawnNodeToEnemy
proc ACEND_FindClosestSpawnNodeToEnemy 172 28
line 96
;92:}
;93:
;94:qboolean
;95:ACEND_FindClosestSpawnNodeToEnemy(gentity_t * self)
;96:{
line 98
;97:  vec3_t v;
;98:  float range = 1024.0f;
ADDRLP4 32
CNSTF4 1149239296
ASGNF4
line 99
;99:  float minrange = 128; // Around the corner :>
ADDRLP4 36
CNSTF4 1124073472
ASGNF4
line 102
;100:  float dist;
;101:  int i;
;102:  int closestNode = -1;
ADDRLP4 116
CNSTI4 -1
ASGNI4
line 107
;103:  vec3_t enemyOrigin;
;104:  vec3_t nodeOrigin;
;105:  trace_t tr;
;106:
;107:  int cost = -1;
ADDRLP4 112
CNSTI4 -1
ASGNI4
line 108
;108:  int bestNode = INVALID;
ADDRLP4 120
CNSTI4 -1
ASGNI4
line 109
;109:  int bestCost = 9999;
ADDRLP4 124
CNSTI4 9999
ASGNI4
line 111
;110:
;111:  VectorCopy(self->botEnemy->client->ps.origin, enemyOrigin);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 112
;112:  enemyOrigin[2]+=26;
ADDRLP4 100+8
ADDRLP4 100+8
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 114
;113:
;114:  closestNode = ACEND_FindClosestReachableNode(self->botEnemy, 300.0f, NODE_MOVE);
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
ARGP4
CNSTF4 1133903872
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 128
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 116
ADDRLP4 128
INDIRI4
ASGNI4
line 116
;115:
;116:  for(i = numNodes - 1;i >= 0;i--)
ADDRLP4 0
ADDRGP4 numNodes
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 117
;117:  {
line 118
;118:    if (nodes[i].type != NODE_MOVE)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 119
;119:      continue;
ADDRGP4 $108
JUMPV
LABELV $111
line 121
;120:
;121:    VectorSubtract(nodes[i].origin, self->botEnemy->client->ps.origin, v); // subtract first
ADDRLP4 132
CNSTI4 24
ASGNI4
ADDRLP4 136
ADDRLP4 132
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 144
CNSTI4 516
ASGNI4
ADDRLP4 4
ADDRLP4 136
INDIRI4
ADDRGP4 nodes
ADDP4
INDIRF4
ADDRLP4 140
INDIRP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 136
INDIRI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
ADDRLP4 140
INDIRP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 122
;122:    dist = VectorLength(v);
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 148
INDIRF4
ASGNF4
line 124
;123:
;124:    if (dist > minrange && dist < range)
ADDRLP4 16
INDIRF4
ADDRLP4 36
INDIRF4
LEF4 $118
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
GEF4 $118
line 125
;125:    {
line 126
;126:      VectorCopy(nodes[i].origin, nodeOrigin);
ADDRLP4 20
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 127
;127:      nodeOrigin[2] += 32;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 129
;128:
;129:      trap_Trace(
ADDRLP4 40
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 156
CNSTP4 0
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 -33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 134
;130:        &tr, enemyOrigin, NULL, NULL, nodeOrigin, self->s.number,
;131:        CONTENTS_SOLID | ~MASK_PLAYERSOLID);
;132:
;133:      //Not Visible
;134:      if (tr.fraction != 1.0)
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
EQF4 $121
line 135
;135:      {
line 136
;136:        VectorCopy(nodes[i].origin, self->nextSpawnLocation);
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 137
;137:        if(G_canSpawn(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 G_canSpawn
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $124
line 138
;138:        {
line 139
;139:          cost = ACEND_FindCost(i,closestNode);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 ACEND_FindCost
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 164
INDIRI4
ASGNI4
line 140
;140:          if(cost > 2 && cost < bestCost)
ADDRLP4 112
INDIRI4
CNSTI4 2
LEI4 $125
ADDRLP4 112
INDIRI4
ADDRLP4 124
INDIRI4
GEI4 $125
line 141
;141:          {
line 142
;142:            bestNode = i;
ADDRLP4 120
ADDRLP4 0
INDIRI4
ASGNI4
line 143
;143:            bestCost = cost;
ADDRLP4 124
ADDRLP4 112
INDIRI4
ASGNI4
line 144
;144:          }
line 146
;145:          //return qtrue;
;146:        }
LABELV $124
line 148
;147:        else
;148:        {
line 149
;149:        }
LABELV $125
line 150
;150:      }
LABELV $121
line 151
;151:    }
LABELV $118
line 152
;152:  }
LABELV $108
line 116
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $107
line 153
;153:  if(bestNode != INVALID)
ADDRLP4 120
INDIRI4
CNSTI4 -1
EQI4 $128
line 154
;154:  {
line 155
;155:    VectorCopy(nodes[bestNode].origin, self->nextSpawnLocation);
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
CNSTI4 24
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 156
;156:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $105
JUMPV
LABELV $128
line 158
;157:  }
;158:  return qfalse;
CNSTI4 0
RETI4
LABELV $105
endproc ACEND_FindClosestSpawnNodeToEnemy 172 28
export ACEND_FindCloseReachableNode
proc ACEND_FindCloseReachableNode 104 28
line 167
;159:}
;160:
;161:// Find a close node to the player within dist.
;162://
;163:// Faster than looking for the closest node, but not very 
;164:// accurate.
;165:int
;166:ACEND_FindCloseReachableNode(gentity_t * self, float range, int type)
;167:{
line 175
;168:  vec3_t v;
;169:  int i;
;170:  trace_t tr;
;171:  float dist;
;172:
;173:  //  range *= range;
;174:
;175:  for(i = 0;i < numNodes;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 176
;176:  {
line 177
;177:    if (type == NODE_ALL || type == nodes[i].type) // check node type
ADDRLP4 80
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 99
EQI4 $138
ADDRLP4 80
INDIRI4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
NEI4 $135
LABELV $138
line 178
;178:    {
line 180
;179:
;180:      VectorSubtract(nodes[i].origin, self->client->ps.origin, v); // subtract first
ADDRLP4 84
CNSTI4 24
ASGNI4
ADDRLP4 88
ADDRLP4 84
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ADDRGP4 nodes
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 88
INDIRI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+8
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
line 182
;181:
;182:      dist = VectorLength(v);
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 96
INDIRF4
ASGNF4
line 184
;183:
;184:      if (dist < range) // square range instead of sqrt
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $143
line 185
;185:      {
line 187
;186:        // make sure it is visible
;187:        trap_Trace(
ADDRLP4 20
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
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
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
line 191
;188:          &tr, self->client->ps.origin, self->r.mins, self->r.maxs, nodes[i].origin,
;189:          self->s.number, MASK_PLAYERSOLID);
;190:
;191:        if (tr.fraction == 1.0)
ADDRLP4 20+8
INDIRF4
CNSTF4 1065353216
NEF4 $145
line 192
;192:          return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $130
JUMPV
LABELV $145
line 193
;193:      }
LABELV $143
line 194
;194:    }
LABELV $135
line 195
;195:  }
LABELV $132
line 175
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
LTI4 $131
line 197
;196:
;197:  return -1;
CNSTI4 -1
RETI4
LABELV $130
endproc ACEND_FindCloseReachableNode 104 28
export ACEND_FindClosestReachableNode
proc ACEND_FindClosestReachableNode 148 28
line 203
;198:}
;199:
;200:// Find the closest node to the player within a certain range
;201:int
;202:ACEND_FindClosestReachableNode(gentity_t * self, float range, int type)
;203:{
line 205
;204:  int i;
;205:  float closest = 99999;
ADDRLP4 32
CNSTF4 1203982208
ASGNF4
line 207
;206:  float dist;
;207:  int node = INVALID;
ADDRLP4 108
CNSTI4 -1
ASGNI4
line 213
;208:  vec3_t v;
;209:  trace_t tr;
;210:  //float           rng;
;211:  vec3_t maxs, mins;
;212:
;213:  VectorCopy(self->r.mins, mins);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 214
;214:  VectorCopy(self->r.maxs, maxs);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 215
;215:  mins[0] = -10;//{ -15, -15, -24 };
ADDRLP4 20
CNSTF4 3240099840
ASGNF4
line 216
;216:  mins[1] = -10;
ADDRLP4 20+4
CNSTF4 3240099840
ASGNF4
line 217
;217:  mins[2] = -19;
ADDRLP4 20+8
CNSTF4 3247964160
ASGNF4
line 219
;218:
;219:  maxs[0] = 10;//{ 15, 15, 32 };
ADDRLP4 36
CNSTF4 1092616192
ASGNF4
line 220
;220:  maxs[1] = 10;
ADDRLP4 36+4
CNSTF4 1092616192
ASGNF4
line 221
;221:  maxs[2] = 27;
ADDRLP4 36+8
CNSTF4 1104674816
ASGNF4
line 223
;222:
;223:  if (self->client->ps.pm_flags & PMF_DUCKED)
ADDRFP4 0
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
EQI4 $153
line 224
;224:  {
line 225
;225:    maxs[2] = 15;
ADDRLP4 36+8
CNSTF4 1097859072
ASGNF4
line 226
;226:  }
LABELV $153
line 228
;227:
;228:  mins[2] += STEPSIZE;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 231
;229:
;230:  //  rng = (float)(range * range);   // square range for distance comparison (eliminate sqrt)
;231:  for(i = 0;i < numNodes;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $160
JUMPV
LABELV $157
line 232
;232:  {
line 234
;233:    //FIXME: should not be i?
;234:    if (ACEND_nodeInUse(self->bs.currentNode))
ADDRFP4 0
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 ACEND_nodeInUse
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $161
line 235
;235:    {
line 236
;236:      continue;
ADDRGP4 $158
JUMPV
LABELV $161
line 238
;237:    }
;238:    if (type == NODE_ALL || type == nodes[i].type) // check node type
ADDRLP4 116
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 99
EQI4 $166
ADDRLP4 116
INDIRI4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
NEI4 $163
LABELV $166
line 239
;239:    {
line 240
;240:      VectorSubtract(nodes[i].origin, self->client->ps.origin, v); // subtract first
ADDRLP4 120
CNSTI4 24
ASGNI4
ADDRLP4 124
ADDRLP4 120
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 124
INDIRI4
ADDRGP4 nodes
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 124
INDIRI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+8
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
line 242
;241:
;242:      dist = VectorLength(v);
ADDRLP4 4
ARGP4
ADDRLP4 132
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 132
INDIRF4
ASGNF4
line 244
;243:
;244:      if (dist < closest && dist < range)
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
GEF4 $171
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $171
line 245
;245:      {
line 247
;246:        // make sure it is visible
;247:        if (range == NODE_DENSITY)
ADDRFP4 4
INDIRF4
CNSTF4 1124073472
NEF4 $173
line 248
;248:          trap_Trace(
ADDRLP4 48
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRGP4 $174
JUMPV
LABELV $173
line 251
;249:            &tr, self->client->ps.origin, mins, maxs, nodes[i].origin, self->s.number, MASK_SOLID);
;250:        else
;251:          trap_Trace(
ADDRLP4 48
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
LABELV $174
line 255
;252:            &tr, self->client->ps.origin, mins, maxs, nodes[i].origin, self->s.number,
;253:            MASK_PLAYERSOLID);
;254:
;255:        if (tr.fraction == 1.0)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $175
line 256
;256:        {
line 257
;257:          node = i;
ADDRLP4 108
ADDRLP4 0
INDIRI4
ASGNI4
line 258
;258:          closest = dist;
ADDRLP4 32
ADDRLP4 16
INDIRF4
ASGNF4
line 259
;259:        }
LABELV $175
line 260
;260:      }
LABELV $171
line 261
;261:    }
LABELV $163
line 262
;262:  }
LABELV $158
line 231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $160
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
LTI4 $157
line 263
;263:  return node;
ADDRLP4 108
INDIRI4
RETI4
LABELV $148
endproc ACEND_FindClosestReachableNode 148 28
export ACEND_SetGoal
proc ACEND_SetGoal 20 12
line 268
;264:}
;265:
;266:void
;267:ACEND_SetGoal(gentity_t * self, int goalNode, int type)
;268:{
line 271
;269:  int node;
;270:
;271:  self->bs.goalNode = goalNode;
ADDRFP4 0
INDIRP4
CNSTI4 2404
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 273
;272:
;273:  node = ACEND_FindClosestReachableNode(self, NODE_DENSITY * 3, type);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1136656384
ARGF4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 275
;274:
;275:  if (node == INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $179
line 276
;276:    return;
ADDRGP4 $178
JUMPV
LABELV $179
line 278
;277:
;278:  if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $181
line 279
;279:    G_Printf("print \"%s: new start node selected %d\n\"", self->client->pers.netname, node);
ADDRGP4 $184
ARGP4
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $181
line 281
;280:
;281:  ACEND_setCurrentNode(self, node);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_setCurrentNode
CALLV
pop
line 283
;282:
;283:  ACEND_setNextNode(self, self->bs.currentNode);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
ARGI4
ADDRGP4 ACEND_setNextNode
CALLV
pop
line 284
;284:  self->bs.node_timeout = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2416
ADDP4
CNSTI4 0
ASGNI4
line 286
;285:
;286:  if (ace_showPath.integer)
ADDRGP4 ace_showPath+12
INDIRI4
CNSTI4 0
EQI4 $185
line 287
;287:  {
line 289
;288:    // draw path to LR goal
;289:    ACEND_DrawPath(self->bs.currentNode, self->bs.goalNode);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 2404
ADDP4
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
line 290
;290:  }
LABELV $185
line 291
;291:}
LABELV $178
endproc ACEND_SetGoal 20 12
export ACEND_FollowPath
proc ACEND_FollowPath 40 12
line 297
;292:
;293:// Move closer to goal by pointing the bot to the next node
;294:// that is closer to the goal
;295:qboolean
;296:ACEND_FollowPath(gentity_t * self)
;297:{
line 299
;298:  // try again?
;299:  if (self->bs.node_timeout++ > 20)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 2416
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 20
LEI4 $189
line 300
;300:  {
line 308
;301:    //    self->client->pers.cmd.forwardmove = 0;
;302:    //    self->client->pers.cmd.upmove = 0;
;303:    //    self->client->pers.cmd.buttons = 0;
;304:    //    self->client->pers.cmd.rightmove = 0;
;305:    //    self->client->pers.cmd.rightmove = 0;
;306:    //    VectorSet(self->client->ps.velocity,0,0,0);
;307:    //self->client->ps.velocity[2] = 0;
;308:    if (self->bs.tries++ > 3)
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 2420
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $191
line 309
;309:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $188
JUMPV
LABELV $191
line 311
;310:    else
;311:      ACEND_SetGoal(self, self->bs.goalNode, NODE_MOVE);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2404
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ACEND_SetGoal
CALLV
pop
line 312
;312:  }
LABELV $189
line 317
;313:
;314:  // are we there yet?
;315:
;316:  //if(Distance(self->client->ps.origin, nodes[self->bs.nextNode].origin) < 32)
;317:  if (BoundsIntersectPoint(self->r.absmin, self->r.absmax, nodes[self->bs.nextNode].origin))
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
ARGP4
CNSTI4 24
ADDRLP4 8
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 BoundsIntersectPoint
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $193
line 318
;318:  {
line 320
;319:    // reset timeout
;320:    self->bs.node_timeout = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2416
ADDP4
CNSTI4 0
ASGNI4
line 322
;321:
;322:    if (self->bs.nextNode == self->bs.goalNode)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 2404
ADDP4
INDIRI4
NEI4 $195
line 323
;323:    {
line 324
;324:      if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $197
line 325
;325:        G_Printf("print \"%s: reached goal node!\n\"", self->client->pers.netname);
ADDRGP4 $200
ARGP4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $197
line 328
;326:
;327:      //      G_Printf("Is %s visible?", self->botEnemy->client->pers.netname);
;328:      if (Distance(nodes[self->bs.goalNode].origin, self->botEnemy->s.origin) < 200)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 24
ADDRLP4 24
INDIRP4
CNSTI4 2404
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 908
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1128792064
GEF4 $201
line 329
;329:      {
line 330
;330:        self->botCommand = BOT_CHOMP;
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 12
ASGNI4
line 331
;331:      }
LABELV $201
line 332
;332:      ACEAI_PickLongRangeGoal(self); // pick a new goal
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_PickLongRangeGoal
CALLV
pop
line 333
;333:    }
ADDRGP4 $196
JUMPV
LABELV $195
line 335
;334:    else
;335:    {
line 339
;336:      ////////////////////////////////////////////////////////////////////////////
;337:      // Special Slow Land Jump
;338:      ////////////////////////////////////////////////////////////////////////////
;339:      if (nodes[self->bs.nextNode].type == NODE_JUMP && nodes[self->bs.lastNode].type == NODE_JUMP
ADDRLP4 20
CNSTI4 24
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 6
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $203
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $203
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $203
line 341
;340:          && nodes[self->bs.currentNode].type == NODE_JUMP)
;341:      {
line 342
;342:        self->botPause = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 2440
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 345
;343:        // VectorSet(self->client->ps.velocity,0,0,0);
;344:        // G_Printf("Stop a bit.\n");
;345:      }
ADDRGP4 $204
JUMPV
LABELV $203
line 346
;346:      else if (nodes[self->bs.lastNode].type == NODE_MOVE && nodes[self->bs.nextNode].type
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $209
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 6
NEI4 $209
line 348
;347:          == NODE_JUMP)
;348:      {
line 349
;349:        self->botPause = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 2440
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 350
;350:      }
LABELV $209
LABELV $204
line 357
;351:
;352:      /*else if(self->botPause+300 > level.time && nodes[self->bs.lastNode].type == NODE_JUMP)
;353:       {
;354:       G_Printf("\n\n\nHAAA\n");
;355:       }*/
;356:
;357:      ACEND_selectNextNode(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEND_selectNextNode
CALLV
pop
line 360
;358:      //self->bs.currentNode = self->bs.nextNode;
;359:      //self->bs.nextNode = path_table[self->bs.currentNode][self->bs.goalNode];
;360:    }
LABELV $196
line 361
;361:  }
LABELV $193
line 363
;362:
;363:  if (self->bs.currentNode == INVALID || self->bs.nextNode == INVALID)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $216
ADDRLP4 16
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $214
LABELV $216
line 364
;364:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $188
JUMPV
LABELV $214
line 367
;365:
;366:  // set bot's movement vector
;367:  VectorSubtract(nodes[self->bs.nextNode].origin, self->client->ps.origin, self->bs.moveVector);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 2368
ADDP4
CNSTI4 24
ADDRLP4 24
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 2372
ADDP4
ADDRLP4 32
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 2376
ADDP4
CNSTI4 24
ADDRLP4 36
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 369
;368:
;369:  return qtrue;
CNSTI4 1
RETI4
LABELV $188
endproc ACEND_FollowPath 40 12
export ACEND_CheckForDucking
proc ACEND_CheckForDucking 100 28
line 373
;370:}
;371:qboolean
;372:ACEND_CheckForDucking(gentity_t *self)
;373:{
line 378
;374:  vec3_t crouchingMaxs;
;375:  trace_t trace;
;376:  int closestNode;
;377:
;378:  if (self->s.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $220
line 379
;379:  {
line 380
;380:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $220
line 383
;381:  }
;382:
;383:  VectorSet(crouchingMaxs, 15, 15, 32);
ADDRLP4 76
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1107296256
ASGNF4
line 384
;384:  if ((self->client->ps.pm_flags & PMF_DUCKED))
ADDRFP4 0
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
EQI4 $224
line 385
;385:  {
line 387
;386:    // try to stand up
;387:    trap_Trace(
ADDRLP4 16
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 390
;388:      &trace, self->s.origin, self->r.mins, crouchingMaxs, self->s.origin, self->s.clientNum,
;389:      MASK_SOLID);
;390:    if (!trace.allsolid)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $226
line 391
;391:    {
line 393
;392:      //Well the place is crouching... but...
;393:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $226
line 396
;394:    }
;395:    else
;396:    {
line 397
;397:      closestNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_DUCK);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 10
ARGI4
ADDRLP4 88
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 88
INDIRI4
ASGNI4
line 398
;398:      if (closestNode != INVALID)
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $228
line 399
;399:      {
line 400
;400:        if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $230
ADDRLP4 92
INDIRI4
CNSTI4 -1
EQI4 $230
line 401
;401:        {
line 402
;402:          ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 403
;403:          if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $232
line 404
;404:            ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $232
line 405
;405:        }
LABELV $230
line 407
;406:
;407:        self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 408
;408:      }
ADDRGP4 $229
JUMPV
LABELV $228
line 409
;409:      else if (closestNode == INVALID)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $235
line 410
;410:      {
line 411
;411:        closestNode = ACEND_AddNode(self, NODE_DUCK);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 92
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 92
INDIRI4
ASGNI4
line 413
;412:
;413:        if (self->bs.lastNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $237
line 414
;414:        {
line 415
;415:          ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 417
;416:
;417:          if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $239
line 418
;418:            ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $239
line 419
;419:        }
LABELV $237
line 420
;420:        self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 421
;421:      }
LABELV $235
LABELV $229
line 422
;422:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $219
JUMPV
LABELV $224
line 426
;423:    }
;424:  }
;425:  else
;426:  {
line 427
;427:    return qfalse;
CNSTI4 0
RETI4
LABELV $219
endproc ACEND_CheckForDucking 100 28
export ACEND_CheckForLadder
proc ACEND_CheckForLadder 124 28
line 433
;428:  }
;429:}
;430:
;431:qboolean
;432:ACEND_CheckForLadder(gentity_t *self)
;433:{
line 438
;434:  int closestNode;
;435:  vec3_t forward, end;
;436:  trace_t trace;
;437:
;438:  if (self->s.groundEntityNum == ENTITYNUM_NONE && self->client->ps.velocity[2] > 0)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $243
ADDRLP4 88
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $243
line 439
;439:  {
line 440
;440:    AngleVectors(self->client->ps.viewangles, forward, NULL, NULL);
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
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 441
;441:    forward[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 443
;442:
;443:    VectorMA(self->client->ps.origin, 1.0f, forward, end);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 445
;444:
;445:    trap_Trace(
ADDRLP4 24
ARGP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 104
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 449
;446:      &trace, self->client->ps.origin, self->r.mins, self->r.maxs, end, self->client->ps.clientNum,
;447:      MASK_PLAYERSOLID);
;448:
;449:    if ((trace.fraction < 1.0f) && (trace.surfaceFlags & SURF_LADDER))
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $250
ADDRLP4 24+44
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $250
line 450
;450:    {
line 451
;451:      closestNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_LADDER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 9
ARGI4
ADDRLP4 112
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 112
INDIRI4
ASGNI4
line 452
;452:      if (closestNode != INVALID)
ADDRLP4 84
INDIRI4
CNSTI4 -1
EQI4 $254
line 453
;453:      {
line 454
;454:        if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $256
ADDRLP4 116
INDIRI4
CNSTI4 -1
EQI4 $256
line 455
;455:        {
line 456
;456:          ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 457
;457:          if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $258
line 458
;458:            ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $258
line 459
;459:        }
LABELV $256
line 461
;460:
;461:        self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 462
;462:      }
ADDRGP4 $255
JUMPV
LABELV $254
line 463
;463:      else if (closestNode == INVALID)
ADDRLP4 84
INDIRI4
CNSTI4 -1
NEI4 $261
line 464
;464:      {
line 465
;465:        closestNode = ACEND_AddNode(self, NODE_LADDER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 116
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 116
INDIRI4
ASGNI4
line 467
;466:        // now add link
;467:        if (self->bs.lastNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $263
line 468
;468:        {
line 469
;469:          ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 471
;470:
;471:          if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $265
line 472
;472:            ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $265
line 473
;473:        }
LABELV $263
line 475
;474:
;475:        self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 476
;476:      }
LABELV $261
LABELV $255
line 477
;477:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $242
JUMPV
LABELV $250
line 479
;478:    }
;479:  }
LABELV $243
line 480
;480:  return qfalse;
CNSTI4 0
RETI4
LABELV $242
endproc ACEND_CheckForLadder 124 28
export ACEND_PathMap
proc ACEND_PathMap 72 12
line 487
;481:}
;482:
;483:// This routine is called to hook in the pathing code and sets
;484:// the current node if valid.
;485:void
;486:ACEND_PathMap(gentity_t * self)
;487:{
line 491
;488:  int closestNode;
;489:  vec3_t v;
;490:
;491:  int currentNodeType = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 492
;492:  int nextNodeType = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 493
;493:  int lastNodeType = -1;
ADDRLP4 24
CNSTI4 -1
ASGNI4
line 495
;494:
;495:  lastNodeType = nodes[self->bs.lastNode].type;
ADDRLP4 24
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
line 496
;496:  currentNodeType = nodes[self->bs.currentNode].type;
ADDRLP4 16
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
line 497
;497:  nextNodeType = nodes[self->bs.nextNode].type;
ADDRLP4 20
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
line 499
;498:
;499:  if (!g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
NEI4 $272
line 500
;500:      return;
ADDRGP4 $268
JUMPV
LABELV $272
line 502
;501:
;502:  if ((self->r.svFlags & SVF_BOT))
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $275
line 503
;503:  {
line 504
;504:    return;
ADDRGP4 $268
JUMPV
LABELV $275
line 508
;505:  }
;506:
;507:  // don't add links when you went into a trap
;508:  if (self->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $277
line 509
;509:    return;
ADDRGP4 $268
JUMPV
LABELV $277
line 514
;510:
;511:  ////////////////////////////////////////////////////////
;512:  // LADDER
;513:  ///////////////////////////////////////////////////////
;514:  if (ACEND_CheckForLadder(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 ACEND_CheckForLadder
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $279
line 515
;515:  {
line 516
;516:    return;
ADDRGP4 $268
JUMPV
LABELV $279
line 521
;517:  }
;518:  ////////////////////////////////////////////////////////////////////////////
;519:  // DUCKING
;520:  ////////////////////////////////////////////////////////////////////////////
;521:  if (ACEND_CheckForDucking(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 ACEND_CheckForDucking
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $281
line 522
;522:  {
line 523
;523:    return;
ADDRGP4 $268
JUMPV
LABELV $281
line 529
;524:  }
;525:
;526:  ////////////////////////////////////////////////////////
;527:  // JUMPING
;528:  ///////////////////////////////////////////////////////
;529:  if (self->bs.isJumping && self->s.groundEntityNum != ENTITYNUM_NONE)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
ADDRLP4 36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $283
line 530
;530:  {
line 531
;531:    self->bs.isJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 0
ASGNI4
line 532
;532:    closestNode = ACEND_FindClosestReachableNode(self, 30, NODE_JUMP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1106247680
ARGF4
CNSTI4 6
ARGI4
ADDRLP4 40
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 533
;533:    if (closestNode != INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $285
line 534
;534:    {
line 535
;535:      if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $287
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $287
line 536
;536:      {
line 537
;537:        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 538
;538:        if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $289
line 539
;539:        {
line 540
;540:          ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
line 541
;541:        }
LABELV $289
line 542
;542:      }
LABELV $287
line 543
;543:      self->bs.lastNode = closestNode;
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 544
;544:    }
ADDRGP4 $268
JUMPV
LABELV $285
line 545
;545:    else if (closestNode == INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $268
line 546
;546:    {
line 547
;547:      closestNode = ACEND_AddNode(self, NODE_JUMP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 44
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 548
;548:      if (self->bs.lastNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $294
line 549
;549:      {
line 550
;550:        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 552
;551:
;552:        if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $296
line 553
;553:          ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $296
line 554
;554:      }
LABELV $294
line 555
;555:      self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 556
;556:    }
line 557
;557:    return;
ADDRGP4 $268
JUMPV
LABELV $283
line 560
;558:  }
;559:
;560:  if ((self->client->ps.pm_flags & PMF_JUMP_HELD) && self->s.groundEntityNum == ENTITYNUM_NONE
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $299
ADDRLP4 40
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $299
ADDRLP4 40
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $299
line 562
;561:      && !self->bs.isJumping)
;562:  {
line 563
;563:    closestNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_JUMP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 6
ARGI4
ADDRLP4 48
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 565
;564:
;565:    self->bs.isJumping = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 567
;566:
;567:    if (closestNode != INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $301
line 568
;568:    {
line 569
;569:      if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $303
ADDRLP4 52
INDIRI4
CNSTI4 -1
EQI4 $303
line 570
;570:      {
line 571
;571:        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 572
;572:        if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $305
line 573
;573:        {
line 574
;574:          ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
line 575
;575:        }
LABELV $305
line 576
;576:      }
LABELV $303
line 577
;577:      self->bs.lastNode = closestNode;
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 578
;578:    }
ADDRGP4 $268
JUMPV
LABELV $301
line 579
;579:    else if (closestNode == INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $268
line 580
;580:    {
line 581
;581:      closestNode = ACEND_AddNode(self, NODE_JUMP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 52
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 52
INDIRI4
ASGNI4
line 582
;582:      if (self->bs.lastNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $310
line 583
;583:      {
line 584
;584:        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 586
;585:
;586:        if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $312
line 587
;587:          ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $312
line 588
;588:      }
LABELV $310
line 589
;589:      self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 590
;590:    }
line 591
;591:    return;
ADDRGP4 $268
JUMPV
LABELV $299
line 633
;592:  }
;593:  //  if (self->s.groundEntityNum == ENTITYNUM_NONE
;594:  //  //&& (self->client->ps.pm_flags & PMF_JUMP_HELD)
;595:  //      && (self->client->pers.cmd.upmove >= 1) && !self->waterlevel && !(self->r.svFlags & SVF_BOT))
;596:  //  {
;597:  //    // See if there is a closeby jump landing node (prevent adding too many)
;598:  //    closestNode = ACEND_FindClosestReachableNode(self, 64, NODE_JUMP);
;599:  //
;600:  //    if (closestNode != INVALID)
;601:  //    {
;602:  //      // add automatically some links between nodes
;603:  //      if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
;604:  //      {
;605:  //        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
;606:  //        if (ace_showLinks.integer)
;607:  //          ACEND_DrawPath(self->bs.lastNode, closestNode);
;608:  //      }
;609:  //
;610:  //      self->bs.lastNode = closestNode; // set visited to last
;611:  //    }
;612:  //    else if (closestNode == INVALID)
;613:  //    {
;614:  //      closestNode = ACEND_AddNode(self, NODE_JUMP);
;615:  //
;616:  //      // now add link
;617:  //      if (self->bs.lastNode != INVALID)
;618:  //      {
;619:  //        ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
;620:  //
;621:  //        if (ace_showLinks.integer)
;622:  //          ACEND_DrawPath(self->bs.lastNode, closestNode);
;623:  //      }
;624:  //
;625:  //      self->bs.lastNode = closestNode; // set visited to last
;626:  //    }
;627:  //    return;
;628:  //  }
;629:
;630:  ////////////////////////////////////////////////////////
;631:  // FLYING
;632:  ///////////////////////////////////////////////////////
;633:  if (self->s.groundEntityNum == ENTITYNUM_NONE && !self->waterlevel)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $315
ADDRLP4 48
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 0
NEI4 $315
line 634
;634:    return;
ADDRGP4 $268
JUMPV
LABELV $315
line 637
;635:
;636:  // lava / slime
;637:  VectorCopy(self->client->ps.origin, v);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 638
;638:  v[2] -= 18;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 640
;639:
;640:  if (trap_PointContents(self->client->ps.origin, -1) & (CONTENTS_LAVA | CONTENTS_SLIME))
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 52
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $318
line 641
;641:    return;
ADDRGP4 $268
JUMPV
LABELV $318
line 644
;642:
;643:  // iterate through all nodes to make sure far enough apart
;644:  closestNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_ALL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 56
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 56
INDIRI4
ASGNI4
line 646
;645:
;646:  if (closestNode != INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $320
line 647
;647:  {
line 649
;648:    // add automatically some links between nodes
;649:    if (closestNode != self->bs.lastNode && self->bs.lastNode != INVALID)
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $322
ADDRLP4 60
INDIRI4
CNSTI4 -1
EQI4 $322
line 650
;650:    {
line 651
;651:      ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 652
;652:      if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $324
line 653
;653:        ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $324
line 654
;654:    }
LABELV $322
line 656
;655:
;656:    self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 657
;657:  }
ADDRGP4 $321
JUMPV
LABELV $320
line 658
;658:  else if (closestNode == INVALID && self->s.groundEntityNum != ENTITYNUM_NONE)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $327
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $327
line 659
;659:  {
line 661
;660:    // add nodes in the water as needed
;661:    if (self->waterlevel)
ADDRFP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 0
EQI4 $329
line 662
;662:      closestNode = ACEND_AddNode(self, NODE_WATER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 60
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $330
JUMPV
LABELV $329
line 664
;663:    else
;664:      closestNode = ACEND_AddNode(self, NODE_MOVE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 64
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
LABELV $330
line 667
;665:
;666:    // now add link
;667:    if (self->bs.lastNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $331
line 668
;668:    {
line 669
;669:      ACEND_UpdateNodeEdge(self->bs.lastNode, closestNode, self);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 ACEND_UpdateNodeEdge
CALLV
pop
line 671
;670:
;671:      if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $333
line 672
;672:        ACEND_DrawPath(self->bs.lastNode, closestNode);
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
LABELV $333
line 673
;673:    }
LABELV $331
line 675
;674:
;675:    self->bs.lastNode = closestNode; // set visited to last
ADDRFP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 676
;676:  }
LABELV $327
LABELV $321
line 677
;677:}
LABELV $268
endproc ACEND_PathMap 72 12
export ACEND_InitNodes
proc ACEND_InitNodes 0 12
line 681
;678:
;679:void
;680:ACEND_InitNodes(void)
;681:{
line 683
;682:  // init node array (set all to INVALID)
;683:  numNodes = 0;
ADDRGP4 numNodes
CNSTI4 0
ASGNI4
line 684
;684:  memset(nodes, 0, sizeof(node_t) * MAX_NODES);
ADDRGP4 nodes
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24000
ARGI4
ADDRGP4 memset
CALLP4
pop
line 685
;685:  memset(path_table, INVALID, sizeof(short int) * MAX_NODES * MAX_NODES);
ADDRGP4 path_table
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 2000000
ARGI4
ADDRGP4 memset
CALLP4
pop
line 687
;686:
;687:}
LABELV $336
endproc ACEND_InitNodes 0 12
export ACEND_ShowNode
proc ACEND_ShowNode 16 4
line 692
;688:
;689:// show the node for debugging (utility function)
;690:void
;691:ACEND_ShowNode(int node, int type)
;692:{
line 695
;693:  gentity_t *ent;
;694:
;695:  if (!ace_showNodes.integer)
ADDRGP4 ace_showNodes+12
INDIRI4
CNSTI4 0
NEI4 $338
line 696
;696:    return;
ADDRGP4 $337
JUMPV
LABELV $338
line 698
;697:
;698:  ent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 700
;699:
;700:  ent->s.eType = ET_AI_NODE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 19
ASGNI4
line 701
;701:  ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 703
;702:
;703:  ent->classname = "ACEND_node";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $341
ASGNP4
line 705
;704:
;705:  VectorCopy(nodes[node].origin, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 706
;706:  VectorCopy(nodes[node].origin, ent->s.pos.trBase);
ADDRLP4 12
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 709
;707:
;708:  // otherEntityNum is transmitted with GENTITYNUM_BITS so enough for 1000 nodes
;709:  ent->s.otherEntityNum = node;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 710
;710:  ent->s.constantLight = type;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 715
;711:
;712:  //ent->nextthink = level.time + 200000;
;713:  //ent->think = G_FreeEntity;
;714:
;715:  trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 716
;716:}
LABELV $337
endproc ACEND_ShowNode 16 4
export ACEND_DrawPath
proc ACEND_DrawPath 24 4
line 721
;717:
;718:// draws the current path (utility function)
;719:void
;720:ACEND_DrawPath(int currentNode, int goalNode)
;721:{
line 724
;722:  int nextNode;
;723:
;724:  if (currentNode == INVALID || goalNode == INVALID)
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $345
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $343
LABELV $345
line 725
;725:    return;
ADDRGP4 $342
JUMPV
LABELV $343
line 727
;726:
;727:  nextNode = path_table[currentNode][goalNode];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $346
line 731
;728:
;729:  // Now set up and display the path
;730:  while(currentNode != goalNode && currentNode != -1)
;731:  {
line 734
;732:    gentity_t *ent;
;733:
;734:    ent = G_Spawn();
ADDRLP4 12
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 736
;735:
;736:    ent->s.eType = ET_AI_LINK;
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 20
ASGNI4
line 737
;737:    ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 739
;738:
;739:    ent->classname = "ACEND_link";
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $349
ASGNP4
line 741
;740:
;741:    VectorCopy(nodes[currentNode].origin, ent->s.origin);
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 742
;742:    VectorCopy(nodes[currentNode].origin, ent->s.pos.trBase);
ADDRLP4 20
CNSTI4 24
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 743
;743:    VectorCopy(nodes[nextNode].origin, ent->s.origin2);
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
INDIRB
ASGNB 12
line 745
;744:
;745:    ent->nextthink = level.time + 3000;
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 746
;746:    ent->think = G_FreeEntity;
ADDRLP4 8
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 748
;747:
;748:    trap_LinkEntity(ent);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 750
;749:
;750:    currentNode = nextNode;
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 751
;751:    nextNode = path_table[currentNode][goalNode];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ASGNI4
line 752
;752:  }
LABELV $347
line 730
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $351
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $346
LABELV $351
line 753
;753:}
LABELV $342
endproc ACEND_DrawPath 24 4
export ACEND_ShowPath
proc ACEND_ShowPath 8 12
line 759
;754:
;755:// Turns on showing of the path, set goal to -1 to 
;756:// shut off. (utility function)
;757:void
;758:ACEND_ShowPath(gentity_t * self, int goalNode)
;759:{
line 762
;760:  int currentNode;
;761:
;762:  currentNode = ACEND_FindClosestReachableNode(self, NODE_DENSITY, NODE_ALL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 4
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 763
;763:  if (currentNode == INVALID)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $353
line 764
;764:  {
line 765
;765:    trap_SendServerCommand(self - g_entities, "print \"no closest reachable node!\n\"");
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
ADDRGP4 $355
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 766
;766:    return;
ADDRGP4 $352
JUMPV
LABELV $353
line 769
;767:  }
;768:
;769:  ACEND_DrawPath(currentNode, goalNode);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ACEND_DrawPath
CALLV
pop
line 770
;770:}
LABELV $352
endproc ACEND_ShowPath 8 12
export ACEND_AddNode
proc ACEND_AddNode 44 28
line 774
;771:
;772:int
;773:ACEND_AddNode(gentity_t * self, int type)
;774:{
line 779
;775:  vec3_t v, v2;
;776:  const char *entityName;
;777:
;778:  // block if we exceed maximum
;779:  if (numNodes >= MAX_NODES)
ADDRGP4 numNodes
INDIRI4
CNSTI4 1000
LTI4 $357
line 780
;780:    return INVALID;
CNSTI4 -1
RETI4
ADDRGP4 $356
JUMPV
LABELV $357
line 782
;781:
;782:  entityName = self->classname;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 787
;783:
;784:  ////////////////////////////////////////////////////////////////////////////
;785:  // Initialize node.
;786:  ////////////////////////////////////////////////////////////////////////////
;787:  if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $359
line 788
;788:  {
line 789
;789:    VectorCopy(self->client->ps.origin, nodes[numNodes].origin);
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 790
;790:  }
ADDRGP4 $360
JUMPV
LABELV $359
line 792
;791:  else
;792:  {
line 793
;793:    VectorCopy(self->s.origin, nodes[numNodes].origin);
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 794
;794:  }
LABELV $360
line 796
;795:
;796:  nodes[numNodes].type = type;
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 797
;797:  nodes[numNodes].inuse = qfalse;
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes+16
ADDP4
CNSTI4 0
ASGNI4
line 798
;798:  nodes[numNodes].follower = NULL;
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes+20
ADDP4
CNSTP4 0
ASGNP4
line 800
;799:
;800:  if (type == NODE_JUMPPAD)
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $364
line 801
;801:  {
line 802
;802:    VectorAdd(self->r.absmin, self->r.absmax, v);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 803
;803:    VectorScale(v, 0.5, v);
ADDRLP4 36
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 806
;804:
;805:    // add jumppad target offset
;806:    VectorNormalize2(self->s.origin2, v2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 807
;807:    VectorMA(v, 32, v2, v);
ADDRLP4 40
CNSTF4 1107296256
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 809
;808:
;809:    VectorCopy(v, nodes[numNodes].origin);
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 810
;810:  }
LABELV $364
line 812
;811:
;812:  SnapVector(nodes[numNodes].origin);
ADDRLP4 28
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 nodes+4
ADDP4
ADDRLP4 32
INDIRI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 36
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 nodes+8
ADDP4
ADDRLP4 36
INDIRI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 814
;813:
;814:  if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $382
line 815
;815:  {
line 816
;816:    G_Printf(
CNSTI4 24
ADDRGP4 numNodes
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 ACEND_NodeTypeToString
CALLP4
ASGNP4
ADDRGP4 $385
ARGP4
ADDRLP4 32
ADDRGP4 numNodes
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
CNSTI4 24
ADDRLP4 32
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 nodes
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ADDRGP4 nodes+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_Printf
CALLV
pop
line 821
;817:      "node %d added for entity %s type: %s pos: %f %f %f\n", numNodes, entityName,
;818:      ACEND_NodeTypeToString(nodes[numNodes].type), nodes[numNodes].origin[0],
;819:      nodes[numNodes].origin[1], nodes[numNodes].origin[2]);
;820:
;821:    if (level.num_entities > 800)
ADDRGP4 level+12
INDIRI4
CNSTI4 800
LEI4 $389
line 822
;822:    {
line 823
;823:      G_Printf("Entity number is to hight not gonna Draw more nodes.\n");
ADDRGP4 $392
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 824
;824:    }
ADDRGP4 $390
JUMPV
LABELV $389
line 826
;825:    else
;826:    {
line 827
;827:      ACEND_ShowNode(numNodes, nodes[numNodes].type);
ADDRLP4 40
ADDRGP4 numNodes
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 24
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ARGI4
ADDRGP4 ACEND_ShowNode
CALLV
pop
line 828
;828:    }
LABELV $390
line 829
;829:  }
LABELV $382
line 831
;830:
;831:  numNodes++;
ADDRLP4 28
ADDRGP4 numNodes
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 832
;832:  return numNodes - 1; // return the node added
ADDRGP4 numNodes
INDIRI4
CNSTI4 1
SUBI4
RETI4
LABELV $356
endproc ACEND_AddNode 44 28
export ACEND_NodeTypeToString
proc ACEND_NodeTypeToString 0 0
line 837
;833:}
;834:
;835:const char *
;836:ACEND_NodeTypeToString(int type)
;837:{
line 838
;838:  if (type == NODE_MOVE)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $395
line 839
;839:  {
line 840
;840:    return "move";
ADDRGP4 $397
RETP4
ADDRGP4 $394
JUMPV
LABELV $395
line 842
;841:  }
;842:  else if (type == NODE_PLATFORM)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $398
line 843
;843:  {
line 844
;844:    return "platform";
ADDRGP4 $400
RETP4
ADDRGP4 $394
JUMPV
LABELV $398
line 846
;845:  }
;846:  else if (type == NODE_TRIGGER_TELEPORT)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $401
line 847
;847:  {
line 848
;848:    return "trigger_teleport";
ADDRGP4 $403
RETP4
ADDRGP4 $394
JUMPV
LABELV $401
line 856
;849:  }
;850:  /*
;851:   else if(type == NODE_TARGET_TELEPORT)
;852:   {
;853:   return "target_teleport";
;854:   }
;855:   */
;856:  else if (type == NODE_ITEM)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $404
line 857
;857:  {
line 858
;858:    return "item";
ADDRGP4 $406
RETP4
ADDRGP4 $394
JUMPV
LABELV $404
line 860
;859:  }
;860:  else if (type == NODE_WATER)
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $407
line 861
;861:  {
line 862
;862:    return "water";
ADDRGP4 $409
RETP4
ADDRGP4 $394
JUMPV
LABELV $407
line 864
;863:  }
;864:  else if (type == NODE_JUMP)
ADDRFP4 0
INDIRI4
CNSTI4 6
NEI4 $410
line 865
;865:  {
line 866
;866:    return "jump";
ADDRGP4 $412
RETP4
ADDRGP4 $394
JUMPV
LABELV $410
line 868
;867:  }
;868:  else if (type == NODE_JUMPPAD)
ADDRFP4 0
INDIRI4
CNSTI4 8
NEI4 $413
line 869
;869:  {
line 870
;870:    return "jumppad";
ADDRGP4 $415
RETP4
ADDRGP4 $394
JUMPV
LABELV $413
line 873
;871:  }
;872:
;873:  return "BAD";
ADDRGP4 $416
RETP4
LABELV $394
endproc ACEND_NodeTypeToString 0 0
export ACEND_nodesVisible
proc ACEND_nodesVisible 64 28
line 878
;874:}
;875:
;876:qboolean
;877:ACEND_nodesVisible(vec3_t from, vec3_t to)
;878:{
line 881
;879:  trace_t trace;
;880:
;881:  trap_Trace(&trace, from, NULL, NULL, to, -1, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 883
;882:
;883:  if (trace.contents & CONTENTS_SOLID)
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $418
line 884
;884:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $418
line 886
;885:
;886:  return qtrue;
CNSTI4 1
RETI4
LABELV $417
endproc ACEND_nodesVisible 64 28
export ACEND_UpdateNodeEdge
proc ACEND_UpdateNodeEdge 36 12
line 892
;887:}
;888:
;889:// add / update node connections (paths)
;890:void
;891:ACEND_UpdateNodeEdge(int from, int to, gentity_t *self)
;892:{
line 895
;893:  int i;
;894:
;895:  if (from == -1 || to == -1 || from == to)
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 -1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $425
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $425
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $422
LABELV $425
line 896
;896:    return; // safety
ADDRGP4 $421
JUMPV
LABELV $422
line 898
;897:
;898:  if ((self->r.svFlags & SVF_BOT) && (nodes[from].type == NODE_JUMP || nodes[from].type
ADDRFP4 8
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $426
ADDRLP4 16
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 6
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $432
ADDRLP4 16
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $432
ADDRLP4 16
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 10
NEI4 $426
LABELV $432
line 900
;899:      == NODE_JUMP || nodes[from].type == NODE_DUCK))
;900:  {
line 901
;901:    return;
ADDRGP4 $421
JUMPV
LABELV $426
line 904
;902:  }
;903:  // Add the link
;904:  path_table[from][to] = to;
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
CVII2 4
ASGNI2
line 907
;905:
;906:  // Now for the self-referencing part, linear time for each link added
;907:  for(i = 0;i < numNodes;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 908
;908:  {
line 909
;909:    if (path_table[i][from] != INVALID)
ADDRFP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
CNSTI4 -1
EQI4 $437
line 910
;910:    {
line 911
;911:      if (i == to)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $439
line 912
;912:        path_table[i][to] = INVALID; // make sure we terminate
ADDRFP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
CNSTI2 -1
ASGNI2
ADDRGP4 $440
JUMPV
LABELV $439
line 915
;913:
;914:      else
;915:        path_table[i][to] = path_table[i][from];
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 32
CNSTI4 2000
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
ADDP4
ADDRFP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
ADDP4
INDIRI2
ASGNI2
LABELV $440
line 916
;916:    }
LABELV $437
line 917
;917:  }
LABELV $434
line 907
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
LTI4 $433
line 918
;918:  if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $441
line 919
;919:    G_Printf("print \"Link %d -> %d\n\"", from, to);
ADDRGP4 $444
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $441
line 920
;920:}
LABELV $421
endproc ACEND_UpdateNodeEdge 36 12
export ACEND_RemoveNodeEdge
proc ACEND_RemoveNodeEdge 8 16
line 925
;921:
;922:// remove a node edge
;923:void
;924:ACEND_RemoveNodeEdge(gentity_t * self, int from, int to)
;925:{
line 928
;926:  int i;
;927:
;928:  if (ace_showLinks.integer)
ADDRGP4 ace_showLinks+12
INDIRI4
CNSTI4 0
EQI4 $446
line 929
;929:    G_Printf("print \"%s: removing link %d -> %d\n\"", self->client->pers.netname, from, to);
ADDRGP4 $449
ARGP4
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $446
line 931
;930:
;931:  path_table[from][to] = INVALID; // set to invalid
ADDRFP4 8
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
CNSTI2 -1
ASGNI2
line 934
;932:
;933:  // Make sure this gets updated in our path array
;934:  for(i = 0;i < numNodes;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $453
JUMPV
LABELV $450
line 935
;935:  {
line 936
;936:    if (path_table[from][i] == to)
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ADDRFP4 8
INDIRI4
NEI4 $454
line 937
;937:      path_table[from][i] = INVALID;
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
CNSTI2 -1
ASGNI2
LABELV $454
line 938
;938:  }
LABELV $451
line 934
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $453
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
LTI4 $450
line 939
;939:}
LABELV $445
endproc ACEND_RemoveNodeEdge 8 16
export ACEND_selectNextNode
proc ACEND_selectNextNode 12 8
line 942
;940:void
;941:ACEND_selectNextNode(gentity_t *self)
;942:{
line 943
;943:  self->bs.lastNode = self->bs.currentNode;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2412
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
ASGNI4
line 944
;944:  ACEND_setCurrentNode(self, self->bs.nextNode);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
ARGI4
ADDRGP4 ACEND_setCurrentNode
CALLV
pop
line 945
;945:  ACEND_setNextNode(self, path_table[self->bs.currentNode][self->bs.goalNode]);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 2404
ADDP4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2000
ADDRLP4 8
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRGP4 path_table
ADDP4
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 ACEND_setNextNode
CALLV
pop
line 947
;946:  //self->bs.nextNode = path_table[self->bs.currentNode][self->bs.goalNode];
;947:}
LABELV $456
endproc ACEND_selectNextNode 12 8
export ACEND_pointVisibleFromEntity
proc ACEND_pointVisibleFromEntity 68 28
line 951
;948:
;949:qboolean
;950:ACEND_pointVisibleFromEntity(vec3_t point, gentity_t *self)
;951:{
line 954
;952:  trace_t trace;
;953:
;954:  trap_Trace(&trace, self->s.origin, NULL, NULL, point, self->s.number, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 956
;955:
;956:  if (trace.fraction < 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $458
line 957
;957:  {
line 958
;958:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $457
JUMPV
LABELV $458
line 961
;959:  }
;960:
;961:  return qtrue;
CNSTI4 1
RETI4
LABELV $457
endproc ACEND_pointVisibleFromEntity 68 28
export ACEND_setCurrentNode
proc ACEND_setCurrentNode 0 0
line 965
;962:}
;963:void
;964:ACEND_setCurrentNode(gentity_t *self, int node)
;965:{
line 970
;966:  //  if (self->bs.currentNode != INVALID)
;967:  //  {
;968:  //    nodes[self->bs.currentNode].inuse = qfalse;
;969:  //  }
;970:  self->bs.currentNode = node;
ADDRFP4 0
INDIRP4
CNSTI4 2400
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 976
;971:  //  if (self->bs.currentNode != INVALID)
;972:  //  {
;973:  //    nodes[self->bs.currentNode].inuse = qtrue;
;974:  //  }
;975:  //self->bs.nextNode = self->bs.currentNode;
;976:}
LABELV $461
endproc ACEND_setCurrentNode 0 0
export ACEND_setNextNode
proc ACEND_setNextNode 0 0
line 979
;977:void
;978:ACEND_setNextNode(gentity_t *self, int node)
;979:{
line 980
;980:  if (self->bs.nextNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $463
line 981
;981:  {
line 982
;982:    nodes[self->bs.nextNode].inuse = qfalse;
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+16
ADDP4
CNSTI4 0
ASGNI4
line 983
;983:  }
LABELV $463
line 984
;984:  self->bs.nextNode = node;
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 985
;985:  if (self->bs.nextNode != INVALID)
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $466
line 986
;986:  {
line 987
;987:    nodes[self->bs.nextNode].inuse = qtrue;
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+16
ADDP4
CNSTI4 1
ASGNI4
line 988
;988:  }
LABELV $466
line 989
;989:}
LABELV $462
endproc ACEND_setNextNode 0 0
export ACEND_nodeInUse
proc ACEND_nodeInUse 16 0
line 993
;990:
;991:qboolean
;992:ACEND_nodeInUse(int node)
;993:{
line 994
;994:  gentity_t *bot = nodes[node].follower;
ADDRLP4 0
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes+20
ADDP4
INDIRP4
ASGNP4
line 995
;995:  if (node == INVALID)
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $471
line 996
;996:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $469
JUMPV
LABELV $471
line 998
;997:
;998:  if (nodes[node].inuse == qfalse)
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 nodes+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $473
line 999
;999:  {
line 1000
;1000:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $469
JUMPV
LABELV $473
line 1002
;1001:  }
;1002:  if (bot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $476
line 1003
;1003:  {
line 1004
;1004:    if ((bot->r.svFlags & SVF_BOT) && bot->health > 0 && bot->client
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $478
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $478
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $478
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $478
line 1006
;1005:        && bot->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
;1006:    {
line 1007
;1007:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $469
JUMPV
LABELV $478
line 1010
;1008:    }
;1009:    else
;1010:    {
line 1011
;1011:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $469
JUMPV
LABELV $476
line 1014
;1012:    }
;1013:  }
;1014:  return qfalse;
CNSTI4 0
RETI4
LABELV $469
endproc ACEND_nodeInUse 16 0
bss
export path_table
align 2
LABELV path_table
skip 2000000
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
import ACEND_GrapFired
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
export nodes
align 4
LABELV nodes
skip 24000
export numNodes
align 4
LABELV numNodes
skip 4
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
LABELV $449
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
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $444
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 76
byte 1 105
byte 1 110
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $416
byte 1 66
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $415
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $412
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $409
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $406
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $403
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $400
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $397
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $392
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 103
byte 1 111
byte 1 110
byte 1 110
byte 1 97
byte 1 32
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $385
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $355
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $349
byte 1 65
byte 1 67
byte 1 69
byte 1 78
byte 1 68
byte 1 95
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $341
byte 1 65
byte 1 67
byte 1 69
byte 1 78
byte 1 68
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
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
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $184
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
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
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
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
