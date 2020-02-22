export G_SetBuildableAnim
code
proc G_SetBuildableAnim 8 0
file "..\..\..\..\src/game/g_buildable.c"
line 38
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
;25:
;26:// from g_combat.c
;27:extern char *modNames[];
;28:
;29:/*
;30: ================
;31: G_SetBuildableAnim
;32:
;33: Triggers an animation client side
;34: ================
;35: */
;36:void
;37:G_SetBuildableAnim(gentity_t *ent, buildableAnimNumber_t anim, qboolean force)
;38:{
line 39
;39:  int localAnim = anim;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 41
;40:
;41:  if (force)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $85
line 42
;42:    localAnim |= ANIM_FORCEBIT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $85
line 45
;43:
;44:  // don't toggle the togglebit more than once per frame
;45:  if (ent->animTime != level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
EQI4 $87
line 46
;46:  {
line 47
;47:    localAnim |= ((ent->s.legsAnim & ANIM_TOGGLEBIT) ^ ANIM_TOGGLEBIT);
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
BORI4
ASGNI4
line 48
;48:    ent->animTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 49
;49:  }
ADDRGP4 $88
JUMPV
LABELV $87
line 51
;50:  else
;51:    localAnim |= ent->s.legsAnim & ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 128
BANDI4
BORI4
ASGNI4
LABELV $88
line 53
;52:
;53:  ent->s.legsAnim = localAnim;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 54
;54:}
LABELV $84
endproc G_SetBuildableAnim 8 0
export G_SetIdleBuildableAnim
proc G_SetIdleBuildableAnim 0 0
line 65
;55:
;56:/*
;57: ================
;58: G_SetIdleBuildableAnim
;59:
;60: Set the animation to use whilst no other animations are running
;61: ================
;62: */
;63:void
;64:G_SetIdleBuildableAnim(gentity_t *ent, buildableAnimNumber_t anim)
;65:{
line 66
;66:  ent->s.torsoAnim = anim;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 67
;67:}
LABELV $91
endproc G_SetIdleBuildableAnim 0 0
export G_CheckSpawnPoint
proc G_CheckSpawnPoint 136 28
line 78
;68:
;69:/*
;70: ===============
;71: G_CheckSpawnPoint
;72:
;73: Check if a spawn at a specified point is valid
;74: ===============
;75: */
;76:gentity_t *
;77:G_CheckSpawnPoint(int spawnNum, vec3_t origin, vec3_t normal, buildable_t spawn, vec3_t spawnOrigin)
;78:{
line 84
;79:  vec3_t mins, maxs;
;80:  vec3_t cmins, cmaxs;
;81:  vec3_t localOrigin;
;82:  trace_t tr;
;83:
;84:  BG_FindBBoxForBuildable(spawn, mins, maxs);
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 112
;85:
;86:  /*if( spawn == BA_A_SPAWN )
;87:   {
;88:   VectorSet( cmins, -MAX_ALIEN_BBOX, -MAX_ALIEN_BBOX, -MAX_ALIEN_BBOX );
;89:   VectorSet( cmaxs,  MAX_ALIEN_BBOX,  MAX_ALIEN_BBOX,  MAX_ALIEN_BBOX );
;90:
;91:   displacement = ( maxs[ 2 ] + MAX_ALIEN_BBOX ) * M_ROOT3;
;92:   VectorMA( origin, displacement, normal, localOrigin );
;93:
;94:   trap_Trace( &tr, origin, NULL, NULL, localOrigin, spawnNum, MASK_SHOT );
;95:
;96:   if( tr.entityNum != ENTITYNUM_NONE )
;97:   return &g_entities[ tr.entityNum ];
;98:
;99:   trap_Trace( &tr, localOrigin, cmins, cmaxs, localOrigin, -1, MASK_PLAYERSOLID );
;100:
;101:   if( tr.entityNum == ENTITYNUM_NONE )
;102:   {
;103:   if( spawnOrigin != NULL )
;104:   VectorCopy( localOrigin, spawnOrigin );
;105:
;106:   return NULL;
;107:   }
;108:   else
;109:   return &g_entities[ tr.entityNum ];
;110:   }
;111:   else*/
;112:  if (spawn == BA_H_SPAWN || spawn == BA_A_SPAWN)
ADDRLP4 120
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 9
EQI4 $95
ADDRLP4 120
INDIRI4
CNSTI4 1
NEI4 $93
LABELV $95
line 113
;113:  {
line 114
;114:    BG_FindBBoxForClass(PCL_HUMAN, cmins, cmaxs, NULL, NULL, NULL);
CNSTI4 11
ARGI4
ADDRLP4 84
ARGP4
ADDRLP4 108
ARGP4
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
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 116
;115:
;116:    VectorCopy(origin, localOrigin);
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 117
;117:    localOrigin[2] += maxs[2] + fabs(cmins[2]) + 1.0f;
ADDRLP4 84+8
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDRLP4 128
INDIRF4
ADDF4
CNSTF4 1065353216
ADDF4
ADDF4
ASGNF4
line 119
;118:
;119:    trap_Trace(&tr, origin, NULL, NULL, localOrigin, spawnNum, MASK_SHOT);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
CNSTP4 0
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 121
;120:
;121:    if (tr.entityNum != ENTITYNUM_NONE)
ADDRLP4 12+52
INDIRI4
CNSTI4 1023
EQI4 $99
line 122
;122:    {
line 123
;123:      return &g_entities[tr.entityNum];
CNSTI4 2476
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $92
JUMPV
LABELV $99
line 125
;124:    }
;125:    trap_Trace(&tr, localOrigin, cmins, cmaxs, localOrigin, -1, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 127
;126:
;127:    if (tr.entityNum == ENTITYNUM_NONE)
ADDRLP4 12+52
INDIRI4
CNSTI4 1023
NEI4 $103
line 128
;128:    {
line 129
;129:      if (spawnOrigin != NULL)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
line 130
;130:        VectorCopy(localOrigin, spawnOrigin);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 12
LABELV $106
line 132
;131:      
;132:      return NULL;
CNSTP4 0
RETP4
ADDRGP4 $92
JUMPV
LABELV $103
line 136
;133:      
;134:    }
;135:    else
;136:    {
line 137
;137:      return &g_entities[tr.entityNum];
CNSTI4 2476
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $92
JUMPV
LABELV $93
line 140
;138:    }
;139:  }
;140:  return NULL;
CNSTP4 0
RETP4
LABELV $92
endproc G_CheckSpawnPoint 136 28
proc G_NumberOfDependants 12 0
line 152
;141:}
;142:
;143:/*
;144: ================
;145: G_NumberOfDependants
;146:
;147: Return number of entities that depend on this one
;148: ================
;149: */
;150:static int
;151:G_NumberOfDependants(gentity_t *self)
;152:{
line 153
;153:  int i, n = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 156
;154:  gentity_t *ent;
;155:
;156:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $110
line 157
;157:  {
line 158
;158:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $115
line 159
;159:      continue;
ADDRGP4 $111
JUMPV
LABELV $115
line 161
;160:
;161:    if (ent->parentNode == self)
ADDRLP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $117
line 162
;162:      n++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
line 163
;163:  }
LABELV $111
line 156
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $113
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $110
line 165
;164:
;165:  return n;
ADDRLP4 8
INDIRI4
RETI4
LABELV $109
endproc G_NumberOfDependants 12 0
proc G_FindPower 84 4
line 180
;166:}
;167:
;168:#define POWER_REFRESH_TIME  2000
;169:
;170:
;171:/*
;172: ================
;173: G_FindPower
;174:
;175: attempt to find power for self, return qtrue if successful
;176: ================
;177: */
;178:static qboolean
;179:G_FindPower(gentity_t *self)
;180:{
line 183
;181:  int i;
;182:  gentity_t *ent;
;183:  gentity_t *closestPower = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 185
;184:
;185:  int distance = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 186
;186:  int minDistance = 10000;
ADDRLP4 28
CNSTI4 10000
ASGNI4
line 189
;187:  vec3_t temp_v;
;188:  int biteam;
;189:  biteam = self->biteam;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
line 191
;190:
;191:  if (g_ctn.integer > 0)
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $120
line 192
;192:  {
line 193
;193:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $120
line 197
;194:  }
;195:
;196:  //reactor is always powered
;197:  if (self->s.modelindex == BA_H_REACTOR)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $123
line 198
;198:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $123
line 200
;199:
;200:  if (self->s.modelindex == BA_H_REPEATER && g_survival.integer && self->biteam == BIT_HUMANS)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 16
NEI4 $125
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 36
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $125
line 201
;201:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $125
line 204
;202:
;203:  //if this already has power then stop now
;204:  if (self->parentNode && self->parentNode->powered)
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $128
ADDRLP4 40
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $128
line 205
;205:  {
line 206
;206:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $128
line 210
;207:  }
;208:
;209:  //reset parent
;210:  self->parentNode = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
CNSTP4 0
ASGNP4
line 213
;211:
;212:  //iterate through entities
;213:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $133
JUMPV
LABELV $130
line 214
;214:  {
line 215
;215:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $135
line 216
;216:      continue;
ADDRGP4 $131
JUMPV
LABELV $135
line 219
;217:
;218:    //if entity is a power item calculate the distance to it
;219:    if ((ent->s.modelindex == BA_H_REACTOR || ent->s.modelindex == BA_H_REPEATER) && ent->spawned
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 15
EQI4 $139
ADDRLP4 44
INDIRI4
CNSTI4 16
NEI4 $137
LABELV $139
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $137
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $137
line 221
;220:        && (ent->biteam == biteam))
;221:    {
line 222
;222:      VectorSubtract(self->s.origin, ent->s.origin, temp_v);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 92
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 96
ASGNI4
ADDRLP4 12+4
ADDRLP4 52
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 100
ASGNI4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 223
;223:      distance = VectorLength(temp_v);
ADDRLP4 12
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 225
;224:
;225:      if (distance < minDistance && ent->powered && ((ent->s.modelindex == BA_H_REACTOR && distance
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $142
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $145
ADDRLP4 4
INDIRI4
CNSTI4 500
LEI4 $144
LABELV $145
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 16
NEI4 $142
ADDRLP4 4
INDIRI4
CNSTI4 500
GTI4 $142
LABELV $144
line 228
;226:          <= REACTOR_BASESIZE) || (ent->s.modelindex == BA_H_REPEATER && distance
;227:          <= REPEATER_BASESIZE)))
;228:      {
line 230
;229:
;230:        closestPower = ent;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 231
;231:        minDistance = distance;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
line 232
;232:      }
LABELV $142
line 233
;233:    }
LABELV $137
line 234
;234:  }
LABELV $131
line 213
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $133
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $130
line 237
;235:
;236:  //if there were no power items nearby give up
;237:  if (closestPower)
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
line 238
;238:  {
line 239
;239:    self->parentNode = closestPower;
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
line 240
;240:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $119
JUMPV
LABELV $146
line 243
;241:  }
;242:  else
;243:  {
line 244
;244:    if (g_survival.integer && self->s.modelindex == BA_H_SPAWN && self->biteam == BIT_HUMANS
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $148
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $148
ADDRLP4 48
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $148
ADDRLP4 48
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $148
line 246
;245:        && self->health > 0)
;246:    {
line 263
;247:      /*
;248:       if(ent->survivalchance == 0) // Will allow go back to main loop and get a chance to get powered.
;249:       {
;250:       ent->survivalchance = 1;
;251:       return qfalse;
;252:       }
;253:       //level.survivalmoney = 0;
;254:       if ((level.time - level.startTime) > 6000) {//Prevent  the game get fucked when loading map.
;255:       trap_SendServerCommand(-1, "print \"This shuld only happend 1 time per struct..\n\"");
;256:
;257:       trap_SendServerCommand(-1, "cp \"^1Find the next base.\n\"");
;258:       level.slowdownTime = level.time + 16000; //Will slow down aliens 10 second to allow players to move on.
;259:       G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
;260:       G_DestroyAlienSpawns(pew, 800);
;261:       kill_aliens();
;262:       }*/
;263:    }
LABELV $148
line 264
;264:    return qfalse;
CNSTI4 0
RETI4
LABELV $119
endproc G_FindPower 84 4
export G_IsPowered
proc G_IsPowered 2480 4
line 277
;265:  }
;266:}
;267:
;268:/*
;269: ================
;270: G_IsPowered
;271:
;272: Simple wrapper to G_FindPower to check if a location has power
;273: ================
;274: */
;275:qboolean
;276:G_IsPowered(vec3_t origin, int biteam)
;277:{
line 280
;278:  gentity_t dummy;
;279:
;280:  if (g_ctn.integer > 0)
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $152
line 281
;281:  {
line 282
;282:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $151
JUMPV
LABELV $152
line 285
;283:  }
;284:
;285:  dummy.parentNode = NULL;
ADDRLP4 0+964
CNSTP4 0
ASGNP4
line 286
;286:  dummy.biteam = biteam;
ADDRLP4 0+956
ADDRFP4 4
INDIRI4
ASGNI4
line 287
;287:  dummy.s.modelindex = BA_NONE;
ADDRLP4 0+160
CNSTI4 0
ASGNI4
line 288
;288:  VectorCopy(origin, dummy.s.origin);
ADDRLP4 0+92
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 290
;289:
;290:  return G_FindPower(&dummy);
ADDRLP4 0
ARGP4
ADDRLP4 2476
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 2476
INDIRI4
RETI4
LABELV $151
endproc G_IsPowered 2480 4
proc G_FindDCC 76 4
line 302
;291:}
;292:
;293:/*
;294: ================
;295: G_FindDCC
;296:
;297: attempt to find a controlling DCC for self, return qtrue if successful
;298: ================
;299: */
;300:static qboolean
;301:G_FindDCC(gentity_t *self)
;302:{
line 305
;303:  int i;
;304:  gentity_t *ent;
;305:  gentity_t *closestDCC = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 306
;306:  int distance = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 307
;307:  int minDistance = 10000;
ADDRLP4 24
CNSTI4 10000
ASGNI4
line 309
;308:  vec3_t temp_v;
;309:  qboolean foundDCC = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 315
;310:
;311:  /*if( self->biteam != BIT_HUMANS )
;312:   return qfalse;*/
;313:
;314:  //if this already has dcc then stop now
;315:  if (self->dccNode && self->dccNode->powered)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
ADDRLP4 36
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
line 316
;316:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $159
JUMPV
LABELV $160
line 319
;317:
;318:  //reset parent
;319:  self->dccNode = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
CNSTP4 0
ASGNP4
line 322
;320:
;321:  //iterate through entities
;322:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $165
JUMPV
LABELV $162
line 323
;323:  {
line 324
;324:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $167
line 325
;325:      continue;
ADDRGP4 $163
JUMPV
LABELV $167
line 328
;326:
;327:    //if entity is a dcc calculate the distance to it
;328:    if (ent->s.modelindex == BA_H_DCC && ent->spawned)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 13
NEI4 $169
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $169
line 329
;329:    {
line 330
;330:      VectorSubtract(self->s.origin, ent->s.origin, temp_v);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 92
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 96
ASGNI4
ADDRLP4 8+4
ADDRLP4 44
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
CNSTI4 100
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 331
;331:      distance = VectorLength(temp_v);
ADDRLP4 8
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 64
INDIRF4
CVFI4 4
ASGNI4
line 332
;332:      if (distance < minDistance && ent->powered && (self->biteam == ent->biteam))
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $173
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $173
ADDRLP4 72
CNSTI4 956
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
NEI4 $173
line 333
;333:      {
line 334
;334:        closestDCC = ent;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
line 335
;335:        minDistance = distance;
ADDRLP4 24
ADDRLP4 20
INDIRI4
ASGNI4
line 336
;336:        foundDCC = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 337
;337:      }
LABELV $173
line 338
;338:    }
LABELV $169
line 339
;339:  }
LABELV $163
line 322
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $165
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $162
line 342
;340:
;341:  //if there was no nearby DCC give up
;342:  if (!foundDCC)
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $175
line 343
;343:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $159
JUMPV
LABELV $175
line 345
;344:
;345:  self->dccNode = closestDCC;
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
line 347
;346:
;347:  return qtrue;
CNSTI4 1
RETI4
LABELV $159
endproc G_FindDCC 76 4
export G_IsDCCBuilt
proc G_IsDCCBuilt 2480 12
line 359
;348:}
;349:
;350:/*
;351: ================
;352: G_IsDCCBuilt
;353:
;354: simple wrapper to G_FindDCC to check for a dcc
;355: ================
;356: */
;357:qboolean
;358:G_IsDCCBuilt(int biteam)
;359:{
line 362
;360:  gentity_t dummy;
;361:
;362:  memset(&dummy, 0, sizeof(gentity_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2476
ARGI4
ADDRGP4 memset
CALLP4
pop
line 364
;363:
;364:  dummy.dccNode = NULL;
ADDRLP4 0+980
CNSTP4 0
ASGNP4
line 365
;365:  dummy.biteam = biteam;
ADDRLP4 0+956
ADDRFP4 0
INDIRI4
ASGNI4
line 367
;366:
;367:  return G_FindDCC(&dummy);
ADDRLP4 0
ARGP4
ADDRLP4 2476
ADDRGP4 G_FindDCC
CALLI4
ASGNI4
ADDRLP4 2476
INDIRI4
RETI4
LABELV $177
endproc G_IsDCCBuilt 2480 12
proc G_FindOvermind 20 0
line 379
;368:}
;369:
;370:/*
;371: ================
;372: G_FindOvermind
;373:
;374: Attempt to find an overmind for self
;375: ================
;376: */
;377:static qboolean
;378:G_FindOvermind(gentity_t *self)
;379:{
line 383
;380:  int i;
;381:  gentity_t *ent;
;382:
;383:  if (self->biteam != BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
EQI4 $181
line 384
;384:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $180
JUMPV
LABELV $181
line 387
;385:
;386:  //if this already has overmind then stop now
;387:  if (self->overmindNode && self->overmindNode->health > 0)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 8
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $183
line 388
;388:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $180
JUMPV
LABELV $183
line 391
;389:
;390:  //reset parent
;391:  self->overmindNode = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
CNSTP4 0
ASGNP4
line 394
;392:
;393:  //iterate through entities
;394:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $185
line 395
;395:  {
line 396
;396:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $190
line 397
;397:      continue;
ADDRGP4 $186
JUMPV
LABELV $190
line 400
;398:
;399:    //if entity is an overmind calculate the distance to it
;400:    if (ent->s.modelindex == BA_A_OVERMIND && ent->spawned && ent->health > 0)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $192
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $192
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $192
line 401
;401:    {
line 402
;402:      self->overmindNode = ent;
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 403
;403:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $180
JUMPV
LABELV $192
line 405
;404:    }
;405:  }
LABELV $186
line 394
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $188
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $185
line 407
;406:
;407:  return qfalse;
CNSTI4 0
RETI4
LABELV $180
endproc G_FindOvermind 20 0
export G_IsOvermindBuilt
proc G_IsOvermindBuilt 2480 12
line 419
;408:}
;409:
;410:/*
;411: ================
;412: G_IsOvermindBuilt
;413:
;414: Simple wrapper to G_FindOvermind to check if a location has an overmind
;415: ================
;416: */
;417:qboolean
;418:G_IsOvermindBuilt(void)
;419:{
line 422
;420:  gentity_t dummy;
;421:
;422:  memset(&dummy, 0, sizeof(gentity_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2476
ARGI4
ADDRGP4 memset
CALLP4
pop
line 424
;423:
;424:  dummy.overmindNode = NULL;
ADDRLP4 0+984
CNSTP4 0
ASGNP4
line 425
;425:  dummy.biteam = BIT_ALIENS;
ADDRLP4 0+956
CNSTI4 1
ASGNI4
line 427
;426:
;427:  return G_FindOvermind(&dummy);
ADDRLP4 0
ARGP4
ADDRLP4 2476
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 2476
INDIRI4
RETI4
LABELV $194
endproc G_IsOvermindBuilt 2480 12
proc G_FindCreep 64 4
line 439
;428:}
;429:
;430:/*
;431: ================
;432: G_FindCreep
;433:
;434: attempt to find creep for self, return qtrue if successful
;435: ================
;436: */
;437:static qboolean
;438:G_FindCreep(gentity_t *self)
;439:{
line 442
;440:  int i;
;441:  gentity_t *ent;
;442:  gentity_t *closestSpawn = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 443
;443:  int distance = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 444
;444:  int minDistance = 10000;
ADDRLP4 24
CNSTI4 10000
ASGNI4
line 448
;445:  vec3_t temp_v;
;446:
;447:  //don't check for creep if flying through the air
;448:  if (self->s.groundEntityNum == -1)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $198
line 449
;449:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $197
JUMPV
LABELV $198
line 452
;450:
;451:  //if self does not have a parentNode or it's parentNode is invalid find a new one
;452:  if ((self->parentNode == NULL) || !self->parentNode->inuse)
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $202
ADDRLP4 32
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
LABELV $202
line 453
;453:  {
line 454
;454:    for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $206
JUMPV
LABELV $203
line 455
;455:    {
line 456
;456:      if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $208
line 457
;457:        continue;
ADDRGP4 $204
JUMPV
LABELV $208
line 459
;458:
;459:      if ((ent->s.modelindex == BA_A_SPAWN || ent->s.modelindex == BA_A_OVERMIND) && ent->spawned)
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $212
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $210
LABELV $212
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 460
;460:      {
line 461
;461:        VectorSubtract(self->s.origin, ent->s.origin, temp_v);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 92
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 96
ASGNI4
ADDRLP4 8+4
ADDRLP4 40
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 100
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 462
;462:        distance = VectorLength(temp_v);
ADDRLP4 8
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 463
;463:        if (distance < minDistance)
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $215
line 464
;464:        {
line 465
;465:          closestSpawn = ent;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
line 466
;466:          minDistance = distance;
ADDRLP4 24
ADDRLP4 20
INDIRI4
ASGNI4
line 467
;467:        }
LABELV $215
line 468
;468:      }
LABELV $210
line 469
;469:    }
LABELV $204
line 454
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $206
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $203
line 471
;470:
;471:    if (minDistance <= CREEP_BASESIZE)
ADDRLP4 24
INDIRI4
CNSTI4 700
GTI4 $217
line 472
;472:    {
line 473
;473:      self->parentNode = closestSpawn;
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
line 474
;474:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $197
JUMPV
LABELV $217
line 477
;475:    }
;476:    else
;477:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $200
line 481
;478:  }
;479:
;480:  //if we haven't returned by now then we must already have a valid parent
;481:  return qtrue;
CNSTI4 1
RETI4
LABELV $197
endproc G_FindCreep 64 4
proc G_CreepSlow 4188 16
line 493
;482:}
;483:
;484:/*
;485: ================
;486: G_CreepSlow
;487:
;488: Set any nearby humans' SS_CREEPSLOWED flag
;489: ================
;490: */
;491:static void
;492:G_CreepSlow(gentity_t *self)
;493:{
line 499
;494:  int entityList[MAX_GENTITIES];
;495:  vec3_t range;
;496:  vec3_t mins, maxs;
;497:  int i, num;
;498:  gentity_t *enemy;
;499:  buildable_t buildable = self->s.modelindex;
ADDRLP4 4148
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 500
;500:  float creepSize = (float) BG_FindCreepSizeForBuildable(buildable);
ADDRLP4 4148
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 BG_FindCreepSizeForBuildable
CALLI4
ASGNI4
ADDRLP4 4144
ADDRLP4 4152
INDIRI4
CVIF4 4
ASGNF4
line 502
;501:
;502:  VectorSet(range, creepSize, creepSize, creepSize);
ADDRLP4 4108
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+8
ADDRLP4 4144
INDIRF4
ASGNF4
line 504
;503:
;504:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4160
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4108
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4160
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
ADDF4
ASGNF4
line 505
;505:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4164
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4108
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4164
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
SUBF4
ASGNF4
line 508
;506:
;507:  //find humans
;508:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4168
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4168
INDIRI4
ASGNI4
line 509
;509:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $233
JUMPV
LABELV $230
line 510
;510:  {
line 511
;511:    enemy = &g_entities[entityList[i]];
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
line 513
;512:
;513:    if (enemy->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $234
line 514
;514:      continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 516
;515:
;516:    if (enemy->client && enemy->client->ps.stats[STAT_PTEAM] == PTE_HUMANS
ADDRLP4 4176
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $236
ADDRLP4 4176
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $236
ADDRLP4 4176
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $236
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $236
line 518
;517:        && enemy->client->ps.groundEntityNum != ENTITYNUM_NONE && G_Visible(self, enemy))
;518:    {
line 519
;519:      enemy->client->ps.stats[STAT_STATE] |= SS_CREEPSLOWED;
ADDRLP4 4184
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 520
;520:      enemy->client->lastCreepSlowTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1376
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 521
;521:    }
LABELV $236
line 522
;522:  }
LABELV $231
line 509
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $233
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $230
line 523
;523:}
LABELV $219
endproc G_CreepSlow 4188 16
proc nullDieFunction 0 0
line 534
;524:
;525:/*
;526: ================
;527: nullDieFunction
;528:
;529: hack to prevent compilers complaining about function pointer -> NULL conversion
;530: ================
;531: */
;532:static void
;533:nullDieFunction(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;534:{
line 535
;535:}
LABELV $239
endproc nullDieFunction 0 0
proc freeBuildable 0 4
line 544
;536:
;537:/*
;538: ================
;539: freeBuildable
;540: ================
;541: */
;542:static void
;543:freeBuildable(gentity_t *self)
;544:{
line 545
;545:  G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 546
;546:}
LABELV $240
endproc freeBuildable 0 4
export A_CreepRecede
proc A_CreepRecede 12 12
line 559
;547:
;548://==================================================================================
;549:
;550:/*
;551: ================
;552: A_CreepRecede
;553:
;554: Called when an alien spawn dies
;555: ================
;556: */
;557:void
;558:A_CreepRecede(gentity_t *self)
;559:{
line 561
;560:  //if the creep just died begin the recession
;561:  if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $242
line 562
;562:  {
line 563
;563:    self->s.eFlags |= EF_DEAD;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 564
;564:    G_AddEvent(self, EV_BUILD_DESTROY, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 566
;565:
;566:    if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 567
;567:      self->s.time = -level.time;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+28
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $245
JUMPV
LABELV $244
line 569
;568:    else
;569:      self->s.time = -(level.time - (int) ((float) CREEP_SCALEDOWN_TIME * (1.0f
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindBuildTimeForBuildable
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTF4 1161527296
CNSTF4 1065353216
ADDRGP4 level+28
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRI4
CVIF4 4
DIVF4
SUBF4
MULF4
CVFI4 4
SUBI4
NEGI4
ASGNI4
LABELV $245
line 572
;570:          - ((float) (level.time - self->buildTime) / (float) BG_FindBuildTimeForBuildable(
;571:            self->s.modelindex)))));
;572:  }
LABELV $242
line 575
;573:
;574:  //creep is still receeding
;575:  if ((self->timestamp + 10000) > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $249
line 576
;576:    self->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $249
line 579
;577:  else
;578:    //creep has died
;579:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $250
line 580
;580:}
LABELV $241
endproc A_CreepRecede 12 12
export ASpawn_Melt
proc ASpawn_Melt 16 28
line 593
;581:
;582://==================================================================================
;583:
;584:/*
;585: ================
;586: ASpawn_Melt
;587:
;588: Called when an alien spawn dies
;589: ================
;590: */
;591:void
;592:ASpawn_Melt(gentity_t *self)
;593:{
line 594
;594:  G_SelectiveRadiusDamage(
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 599
;595:    self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;596:    self->splashMethodOfDeath, PTE_ALIENS);
;597:
;598:  //start creep recession
;599:  if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $254
line 600
;600:  {
line 601
;601:    self->s.eFlags |= EF_DEAD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
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
line 602
;602:    G_AddEvent(self, EV_BUILD_DESTROY, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 604
;603:
;604:    if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 605
;605:      self->s.time = -level.time;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+28
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
line 607
;606:    else
;607:      self->s.time = -(level.time - (int) ((float) CREEP_SCALEDOWN_TIME * (1.0f
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindBuildTimeForBuildable
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTF4 1161527296
CNSTF4 1065353216
ADDRGP4 level+28
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
SUBF4
MULF4
CVFI4 4
SUBI4
NEGI4
ASGNI4
LABELV $257
line 610
;608:          - ((float) (level.time - self->buildTime) / (float) BG_FindBuildTimeForBuildable(
;609:            self->s.modelindex)))));
;610:  }
LABELV $254
line 613
;611:
;612:  //not dead yet
;613:  if ((self->timestamp + 10000) > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $261
line 614
;614:    self->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $261
line 617
;615:  else
;616:    //dead now
;617:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $262
line 618
;618:}
LABELV $253
endproc ASpawn_Melt 16 28
export ASpawn_Blast
proc ASpawn_Blast 24 28
line 629
;619:
;620:/*
;621: ================
;622: ASpawn_Blast
;623:
;624: Called when an alien spawn dies
;625: ================
;626: */
;627:void
;628:ASpawn_Blast(gentity_t *self)
;629:{
line 632
;630:  vec3_t dir;
;631:
;632:  VectorCopy(self->s.origin2, dir);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 635
;633:
;634:  //do a bit of radius damage
;635:  G_SelectiveRadiusDamage(
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 640
;636:    self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;637:    self->splashMethodOfDeath, PTE_ALIENS);
;638:
;639:  //pretty events and item cleanup
;640:  self->s.eFlags |= EF_NODRAW; //don't draw the model once it's destroyed
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
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 641
;641:  G_AddEvent(self, EV_ALIEN_BUILDABLE_EXPLOSION, DirToByte(dir));
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 642
;642:  self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 643
;643:  self->think = ASpawn_Melt;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ASpawn_Melt
ASGNP4
line 644
;644:  self->nextthink = level.time + 500; //wait .5 seconds before damaging others
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 646
;645:
;646:  self->r.contents = 0; //stop collisions...
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 647
;647:  trap_LinkEntity(self); //...requires a relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 648
;648:}
LABELV $265
endproc ASpawn_Blast 24 28
export ASpawn_Die
proc ASpawn_Die 88 28
line 659
;649:
;650:/*
;651: ================
;652: ASpawn_Die
;653:
;654: Called when an alien spawn dies
;655: ================
;656: */
;657:void
;658:ASpawn_Die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;659:{
line 661
;660:  buildHistory_t *new;
;661:  new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 4
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 662
;662:  new->ID = (++level.lastBuildID > 1000) ? (level.lastBuildID = 1) : level.lastBuildID;
ADDRLP4 12
ADDRGP4 level+189976
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1000
LEI4 $273
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $274
JUMPV
LABELV $273
ADDRLP4 8
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $274
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 663
;663:  new->ent = (attacker && attacker->client) ? attacker : NULL;
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $276
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $276
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $277
JUMPV
LABELV $276
ADDRLP4 24
CNSTP4 0
ASGNP4
LABELV $277
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 664
;664:  if (new->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 665
;665:    new->name[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $279
JUMPV
LABELV $278
line 667
;666:  else
;667:    Q_strncpyz(new->name, "<world>", 8);
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $279
line 668
;668:  new->buildable = self->s.modelindex;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 669
;669:  VectorCopy(self->s.pos.trBase, new->origin);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 670
;670:  VectorCopy(self->s.angles, new->angles);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 671
;671:  VectorCopy(self->s.origin2, new->origin2);
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 672
;672:  VectorCopy(self->s.angles2, new->angles2);
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 673
;673:  new->fate
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $282
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $282
ADDRLP4 52
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $282
ADDRLP4 40
CNSTI4 3
ASGNI4
ADDRGP4 $283
JUMPV
LABELV $282
ADDRLP4 40
CNSTI4 2
ASGNI4
LABELV $283
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 676
;674:      = (attacker && attacker->client && attacker->client->ps.stats[STAT_PTEAM] == PTE_ALIENS) ? BF_TEAMKILLED
;675:          : BF_DESTROYED;
;676:  new->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 677
;677:  G_LogBuild(new);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 679
;678:
;679:  G_SetBuildableAnim(self, BANIM_DESTROY1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 680
;680:  G_SetIdleBuildableAnim(self, BANIM_DESTROYED);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 682
;681:
;682:  self->die = nullDieFunction;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 nullDieFunction
ASGNP4
line 683
;683:  self->think = ASpawn_Blast;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ASpawn_Blast
ASGNP4
line 685
;684:
;685:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $284
line 686
;686:    self->nextthink = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
ADDRGP4 $285
JUMPV
LABELV $284
line 688
;687:  else
;688:    self->nextthink = level.time; //blast immediately
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
LABELV $285
line 690
;689:
;690:  self->s.eFlags &= ~EF_FIRING; //prevent any firing effects
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 692
;691:
;692:  if (attacker && attacker->client)
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $288
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $288
line 693
;693:  {
line 694
;694:    if (attacker->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $290
line 695
;695:    {
line 696
;696:      if (self->s.modelindex == BA_A_OVERMIND)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $292
line 697
;697:        G_AddCreditToClient(attacker->client, OVERMIND_VALUE, qtrue);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 300
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
ADDRGP4 $291
JUMPV
LABELV $292
line 698
;698:      else if (self->s.modelindex == BA_A_SPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $291
line 699
;699:        G_AddCreditToClient(attacker->client, ASPAWN_VALUE, qtrue);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 150
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 700
;700:    }
ADDRGP4 $291
JUMPV
LABELV $290
line 702
;701:    else
;702:    {
line 703
;703:      G_TeamCommand(PTE_ALIENS, va(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $296
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 706
;704:        "print \"%s ^3DESTROYED^7 by teammate %s^7\n\"", BG_FindHumanNameForBuildable(
;705:          self->s.modelindex), attacker->client->pers.netname));
;706:      G_LogOnlyPrintf("%s ^3DESTROYED^7 by teammate %s^7\n", BG_FindHumanNameForBuildable(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 708
;707:        self->s.modelindex), attacker->client->pers.netname);
;708:    }
LABELV $291
line 709
;709:    G_LogPrintf(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 72
CNSTI4 516
ASGNI4
ADDRLP4 76
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 713
;710:      "Decon: %i %i %i: %s^7 destroyed %s by %s\n", attacker->client->ps.clientNum,
;711:      self->s.modelindex, mod, attacker->client->pers.netname, BG_FindNameForBuildable(
;712:        self->s.modelindex), modNames[mod]);
;713:  }
LABELV $288
line 714
;714:}
LABELV $268
endproc ASpawn_Die 88 28
export ASpawn_Think
proc ASpawn_Think 60 32
line 725
;715:
;716:/*
;717: ================
;718: ASpawn_Think
;719:
;720: think function for Alien Spawn
;721: ================
;722: */
;723:void
;724:ASpawn_Think(gentity_t *self)
;725:{
line 728
;726:  gentity_t *ent;
;727:
;728:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $300
line 729
;729:  {
line 731
;730:    //only suicide if at rest
;731:    if (self->s.groundEntityNum)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $302
line 732
;732:    {
line 733
;733:      if ((ent = G_CheckSpawnPoint(
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $304
line 735
;734:        self->s.number, self->s.origin, self->s.origin2, BA_A_SPAWN, NULL)) != NULL)
;735:      {
line 738
;736:        // If the thing blocking the spawn is a buildable, kill it. 
;737:        // If it's part of the map, kill self. 
;738:        if (ent->s.eType == ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $306
line 739
;739:        {
line 740
;740:          G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 0
INDIRP4
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
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 741
;741:          G_SetBuildableAnim(self, BANIM_SPAWN1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 742
;742:        }
ADDRGP4 $307
JUMPV
LABELV $306
line 743
;743:        else if (ent->s.number == ENTITYNUM_WORLD || ent->s.eType == ET_MOVER)
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1022
EQI4 $310
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $308
LABELV $310
line 744
;744:        {
line 745
;745:          G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 746
;746:          return;
ADDRGP4 $299
JUMPV
LABELV $308
line 748
;747:        }
;748:        else if (g_antiSpawnBlock.integer && ent->client && ent->client->ps.stats[STAT_PTEAM]
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CNSTI4 0
EQI4 $311
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $311
line 750
;749:            == PTE_ALIENS)
;750:        {
line 752
;751:          //spawnblock protection
;752:          if (self->spawnBlockTime && level.time - self->spawnBlockTime > 10000)
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $314
ADDRGP4 level+28
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 10000
LEI4 $314
line 753
;753:          {
line 756
;754:            //five seconds of countermeasures and we're still blocked
;755:            //time for something more drastic
;756:            G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_TRIGGER_HURT);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
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
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 757
;757:            self->spawnBlockTime += 2000;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 759
;758:            //inappropriate MOD but prints an apt obituary
;759:          }
ADDRGP4 $315
JUMPV
LABELV $314
line 760
;760:          else if (self->spawnBlockTime && level.time - self->spawnBlockTime > 5000)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $317
ADDRGP4 level+28
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CNSTI4 5000
LEI4 $317
line 762
;761:          //five seconds of blocked by client and...
;762:          {
line 765
;763:            //random direction
;764:            vec3_t velocity;
;765:            velocity[0] = crandom() * g_antiSpawnBlock.integer;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
CNSTF4 1073741824
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 766
;766:            velocity[1] = crandom() * g_antiSpawnBlock.integer;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28+4
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 767
;767:            velocity[2] = g_antiSpawnBlock.integer;
ADDRLP4 28+8
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
ASGNF4
line 769
;768:
;769:            VectorAdd(ent->client->ps.velocity, velocity, ent->client->ps.velocity);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
ASGNF4
line 770
;770:            trap_SendServerCommand(ent - g_entities, "cp \"Don't spawn block!\"");
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $327
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 771
;771:          }
ADDRGP4 $318
JUMPV
LABELV $317
line 772
;772:          else if (!self->spawnBlockTime)
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 0
NEI4 $328
line 773
;773:            self->spawnBlockTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
LABELV $328
LABELV $318
LABELV $315
line 774
;774:        }
LABELV $311
LABELV $307
line 775
;775:        if (ent->s.eType == ET_CORPSE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $305
line 776
;776:          G_FreeEntity(ent); //quietly remove
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 777
;777:      }
ADDRGP4 $305
JUMPV
LABELV $304
line 779
;778:      else
;779:        self->spawnBlockTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 0
ASGNI4
LABELV $305
line 780
;780:    }
LABELV $302
line 781
;781:  }
LABELV $300
line 783
;782:
;783:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 785
;784:
;785:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 786
;786:}
LABELV $299
endproc ASpawn_Think 60 32
export ASpawn_Pain
proc ASpawn_Pain 0 12
line 797
;787:
;788:/*
;789: ================
;790: ASpawn_Pain
;791:
;792: pain function for Alien Spawn
;793: ================
;794: */
;795:void
;796:ASpawn_Pain(gentity_t *self, gentity_t *attacker, int damage)
;797:{
line 798
;798:  G_SetBuildableAnim(self, BANIM_PAIN1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 799
;799:}
LABELV $334
endproc ASpawn_Pain 0 12
lit
align 4
LABELV $336
byte 4 1125515264
byte 4 1125515264
byte 4 1125515264
export AOvermind_Think
code
proc AOvermind_Think 4184 28
line 817
;800:
;801://==================================================================================
;802:
;803:
;804:#define OVERMIND_ATTACK_PERIOD 10000
;805:#define OVERMIND_DYING_PERIOD  5000
;806:#define OVERMIND_SPAWNS_PERIOD 30000
;807:
;808:/*
;809: ================
;810: AOvermind_Think
;811:
;812: Think function for Alien Overmind
;813: ================
;814: */
;815:void
;816:AOvermind_Think(gentity_t *self)
;817:{
line 820
;818:  int entityList[MAX_GENTITIES];
;819:  vec3_t range =
;820:  { OVERMIND_ATTACK_RANGE, OVERMIND_ATTACK_RANGE, OVERMIND_ATTACK_RANGE };
ADDRLP4 8
ADDRGP4 $336
INDIRB
ASGNB 12
line 825
;821:  vec3_t mins, maxs;
;822:  int i, num;
;823:  gentity_t *enemy;
;824:
;825:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4144
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4144
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
ADDF4
ASGNF4
line 826
;826:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4148
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4148
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
SUBF4
ASGNF4
line 828
;827:
;828:  if (self->spawned && (self->health > 0))
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4156
CNSTI4 0
ASGNI4
ADDRLP4 4152
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 4156
INDIRI4
EQI4 $345
ADDRLP4 4152
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4156
INDIRI4
LEI4 $345
line 829
;829:  {
line 831
;830:    //do some damage
;831:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4160
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4160
INDIRI4
ASGNI4
line 832
;832:    for(i = 0;i < num;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $347
line 833
;833:    {
line 834
;834:      enemy = &g_entities[entityList[i]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 836
;835:
;836:      if (enemy->flags & FL_NOTARGET)
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $351
line 837
;837:        continue;
ADDRGP4 $348
JUMPV
LABELV $351
line 839
;838:
;839:      if (enemy->client && enemy->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRLP4 4164
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
ADDRLP4 4164
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $353
line 840
;840:      {
line 841
;841:        self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 842
;842:        G_SelectiveRadiusDamage(
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4168
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4168
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 35
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 845
;843:          self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self, MOD_OVERMIND,
;844:          PTE_ALIENS);
;845:        G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 846
;846:      }
LABELV $353
line 847
;847:    }
LABELV $348
line 832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $350
ADDRLP4 0
INDIRI4
ADDRLP4 4116
INDIRI4
LTI4 $347
line 850
;848:
;849:    // just in case an egg finishes building after we tell overmind to stfu
;850:    if (level.numAlienSpawns > 0)
ADDRGP4 level+185088
INDIRI4
CNSTI4 0
LEI4 $356
line 851
;851:      level.overmindMuted = qfalse;
ADDRGP4 level+189256
CNSTI4 0
ASGNI4
LABELV $356
line 854
;852:
;853:    //low on spawns
;854:    if (!level.overmindMuted && level.numAlienSpawns <= 0 && level.time > self->overmindSpawnsTimer)
ADDRLP4 4164
CNSTI4 0
ASGNI4
ADDRGP4 level+189256
INDIRI4
ADDRLP4 4164
INDIRI4
NEI4 $360
ADDRGP4 level+185088
INDIRI4
ADDRLP4 4164
INDIRI4
GTI4 $360
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
LEI4 $360
line 855
;855:    {
line 856
;856:      qboolean haveBuilder = qfalse;
ADDRLP4 4172
CNSTI4 0
ASGNI4
line 859
;857:      gentity_t *builder;
;858:
;859:      self->overmindSpawnsTimer = level.time + OVERMIND_SPAWNS_PERIOD;
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 860
;860:      G_BroadcastEvent(EV_OVERMIND_SPAWNS, 0);
CNSTI4 69
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_BroadcastEvent
CALLV
pop
line 862
;861:
;862:      for(i = 0;i < level.numConnectedClients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 863
;863:      {
line 864
;864:        builder = &g_entities[level.sortedClients[i]];
ADDRLP4 4168
CNSTI4 2476
ADDRLP4 0
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
line 865
;865:        if (builder->health > 0 && (builder->client->pers.classSelection == PCL_ALIEN_BUILDER0
ADDRLP4 4168
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $372
ADDRLP4 4180
ADDRLP4 4168
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 1
EQI4 $374
ADDRLP4 4180
INDIRI4
CNSTI4 2
NEI4 $372
LABELV $374
line 867
;866:            || builder->client->pers.classSelection == PCL_ALIEN_BUILDER0_UPG))
;867:        {
line 868
;868:          haveBuilder = qtrue;
ADDRLP4 4172
CNSTI4 1
ASGNI4
line 869
;869:          break;
ADDRGP4 $368
JUMPV
LABELV $372
line 871
;870:        }
;871:      }
LABELV $367
line 862
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 0
INDIRI4
ADDRGP4 level+173940
INDIRI4
LTI4 $366
LABELV $368
line 873
;872:      // aliens now know they have no eggs, but they're screwed, so stfu
;873:      if (!haveBuilder || G_TimeTilSuddenDeath() <= 0)
ADDRLP4 4172
INDIRI4
CNSTI4 0
EQI4 $377
ADDRLP4 4176
ADDRGP4 G_TimeTilSuddenDeath
CALLI4
ASGNI4
ADDRLP4 4176
INDIRI4
CNSTI4 0
GTI4 $375
LABELV $377
line 874
;874:        level.overmindMuted = qtrue;
ADDRGP4 level+189256
CNSTI4 1
ASGNI4
LABELV $375
line 875
;875:    }
LABELV $360
line 878
;876:
;877:    //overmind dying
;878:    if (self->health < (OVERMIND_HEALTH / 10.0f) && level.time > self->overmindDyingTimer)
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1117126656
GEF4 $379
ADDRGP4 level+28
INDIRI4
ADDRLP4 4168
INDIRP4
CNSTI4 1020
ADDP4
INDIRI4
LEI4 $379
line 879
;879:    {
line 880
;880:      self->overmindDyingTimer = level.time + OVERMIND_DYING_PERIOD;
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 881
;881:      G_BroadcastEvent(EV_OVERMIND_DYING, 0);
CNSTI4 68
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_BroadcastEvent
CALLV
pop
line 882
;882:    }
LABELV $379
line 885
;883:
;884:    //overmind under attack
;885:    if (self->health < self->lastHealth && level.time > self->overmindAttackTimer)
ADDRLP4 4172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4172
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
GEI4 $383
ADDRGP4 level+28
INDIRI4
ADDRLP4 4172
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
LEI4 $383
line 886
;886:    {
line 887
;887:      self->overmindAttackTimer = level.time + OVERMIND_ATTACK_PERIOD;
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 888
;888:      G_BroadcastEvent(EV_OVERMIND_ATTACK, 0);
CNSTI4 67
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_BroadcastEvent
CALLV
pop
line 889
;889:    }
LABELV $383
line 891
;890:
;891:    self->lastHealth = self->health;
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 4176
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 892
;892:  }
ADDRGP4 $346
JUMPV
LABELV $345
line 894
;893:  else
;894:    self->overmindSpawnsTimer = level.time + OVERMIND_SPAWNS_PERIOD;
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
LABELV $346
line 896
;895:
;896:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 898
;897:
;898:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4164
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4160
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4164
INDIRI4
ADDI4
ASGNI4
line 899
;899:}
LABELV $335
endproc AOvermind_Think 4184 28
export ABarricade_Pain
proc ABarricade_Pain 4 12
line 912
;900:
;901://==================================================================================
;902:
;903:/*
;904: ================
;905: ABarricade_Pain
;906:
;907: pain function for Alien Spawn
;908: ================
;909: */
;910:void
;911:ABarricade_Pain(gentity_t *self, gentity_t *attacker, int damage)
;912:{
line 913
;913:  if (rand() % 2)
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
CNSTI4 0
EQI4 $390
line 914
;914:    G_SetBuildableAnim(self, BANIM_PAIN1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
ADDRGP4 $391
JUMPV
LABELV $390
line 916
;915:  else
;916:    G_SetBuildableAnim(self, BANIM_PAIN2, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
LABELV $391
line 917
;917:}
LABELV $389
endproc ABarricade_Pain 4 12
export ABarricade_Blast
proc ABarricade_Blast 24 28
line 928
;918:
;919:/*
;920: ================
;921: ABarricade_Blast
;922:
;923: Called when an alien spawn dies
;924: ================
;925: */
;926:void
;927:ABarricade_Blast(gentity_t *self)
;928:{
line 931
;929:  vec3_t dir;
;930:
;931:  VectorCopy(self->s.origin2, dir);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 934
;932:
;933:  //do a bit of radius damage
;934:  G_SelectiveRadiusDamage(
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 939
;935:    self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;936:    self->splashMethodOfDeath, PTE_ALIENS);
;937:
;938:  //pretty events and item cleanup
;939:  self->s.eFlags |= EF_NODRAW; //don't draw the model once its destroyed
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
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 940
;940:  G_AddEvent(self, EV_ALIEN_BUILDABLE_EXPLOSION, DirToByte(dir));
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 941
;941:  self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 942
;942:  self->think = A_CreepRecede;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 A_CreepRecede
ASGNP4
line 943
;943:  self->nextthink = level.time + 500; //wait .5 seconds before damaging others
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 945
;944:
;945:  self->r.contents = 0; //stop collisions...
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 946
;946:  trap_LinkEntity(self); //...requires a relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 947
;947:}
LABELV $392
endproc ABarricade_Blast 24 28
export ABarricade_Die
proc ABarricade_Die 88 28
line 958
;948:
;949:/*
;950: ================
;951: ABarricade_Die
;952:
;953: Called when an alien spawn dies
;954: ================
;955: */
;956:void
;957:ABarricade_Die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;958:{
line 960
;959:  buildHistory_t *new;
;960:  new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 4
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 961
;961:  new->ID = (++level.lastBuildID > 1000) ? (level.lastBuildID = 1) : level.lastBuildID;
ADDRLP4 12
ADDRGP4 level+189976
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1000
LEI4 $400
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 8
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $401
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 962
;962:  new->ent = (attacker && attacker->client) ? attacker : NULL;
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $403
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $403
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $404
JUMPV
LABELV $403
ADDRLP4 24
CNSTP4 0
ASGNP4
LABELV $404
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 963
;963:  if (new->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $405
line 964
;964:    new->name[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $406
JUMPV
LABELV $405
line 966
;965:  else
;966:    Q_strncpyz(new->name, "<world>", 8);
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $406
line 967
;967:  new->buildable = self->s.modelindex;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 968
;968:  VectorCopy(self->s.pos.trBase, new->origin);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 969
;969:  VectorCopy(self->s.angles, new->angles);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 970
;970:  VectorCopy(self->s.origin2, new->origin2);
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 971
;971:  VectorCopy(self->s.angles2, new->angles2);
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 972
;972:  new->fate
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $408
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $408
ADDRLP4 52
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $408
ADDRLP4 40
CNSTI4 3
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $408
ADDRLP4 40
CNSTI4 2
ASGNI4
LABELV $409
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 975
;973:      = (attacker && attacker->client && attacker->client->ps.stats[STAT_PTEAM] == PTE_ALIENS) ? BF_TEAMKILLED
;974:          : BF_DESTROYED;
;975:  new->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 976
;976:  G_LogBuild(new);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 978
;977:
;978:  G_SetBuildableAnim(self, BANIM_DESTROY1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 979
;979:  G_SetIdleBuildableAnim(self, BANIM_DESTROYED);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 981
;980:
;981:  self->die = nullDieFunction;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 nullDieFunction
ASGNP4
line 982
;982:  self->think = ABarricade_Blast;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ABarricade_Blast
ASGNP4
line 983
;983:  self->s.eFlags &= ~EF_FIRING; //prevent any firing effects
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 985
;984:
;985:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $410
line 986
;986:    self->nextthink = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $410
line 988
;987:  else
;988:    self->nextthink = level.time; //blast immediately
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
LABELV $411
line 990
;989:
;990:  if (attacker && attacker->client)
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $414
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $414
line 991
;991:  {
line 992
;992:    if (attacker->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $416
line 993
;993:    {
line 994
;994:      G_TeamCommand(PTE_ALIENS, va(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $296
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 997
;995:        "print \"%s ^3DESTROYED^7 by teammate %s^7\n\"", BG_FindHumanNameForBuildable(
;996:          self->s.modelindex), attacker->client->pers.netname));
;997:      G_LogOnlyPrintf("%s ^3DESTROYED^7 by teammate %s^7\n", BG_FindHumanNameForBuildable(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 999
;998:        self->s.modelindex), attacker->client->pers.netname);
;999:    }
LABELV $416
line 1000
;1000:    G_LogPrintf(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 72
CNSTI4 516
ASGNI4
ADDRLP4 76
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1004
;1001:      "Decon: %i %i %i: %s^7 destroyed %s by %s\n", attacker->client->ps.clientNum,
;1002:      self->s.modelindex, mod, attacker->client->pers.netname, BG_FindNameForBuildable(
;1003:        self->s.modelindex), modNames[mod]);
;1004:  }
LABELV $414
line 1005
;1005:}
LABELV $395
endproc ABarricade_Die 88 28
export ABarricade_Think
proc ABarricade_Think 16 32
line 1016
;1006:
;1007:/*
;1008: ================
;1009: ABarricade_Think
;1010:
;1011: Think function for Alien Barricade
;1012: ================
;1013: */
;1014:void
;1015:ABarricade_Think(gentity_t *self)
;1016:{
line 1018
;1017:
;1018:  self->powered = G_IsOvermindBuilt();
ADDRLP4 0
ADDRGP4 G_IsOvermindBuilt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1021
;1019:
;1020:  //if there is no creep nearby die
;1021:  if (!G_FindCreep(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_FindCreep
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $419
line 1022
;1022:  {
line 1023
;1023:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
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
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1024
;1024:    return;
ADDRGP4 $418
JUMPV
LABELV $419
line 1027
;1025:  }
;1026:
;1027:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1029
;1028:
;1029:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1030
;1030:}
LABELV $418
endproc ABarricade_Think 16 32
export AAcidTube_Damage
proc AAcidTube_Damage 8 28
line 1047
;1031:
;1032://==================================================================================
;1033:
;1034:
;1035:void
;1036:AAcidTube_Think(gentity_t *self);
;1037:
;1038:/*
;1039: ================
;1040: AAcidTube_Damage
;1041:
;1042: Damage function for Alien Acid Tube
;1043: ================
;1044: */
;1045:void
;1046:AAcidTube_Damage(gentity_t *self)
;1047:{
line 1048
;1048:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
line 1049
;1049:  {
line 1050
;1050:    if (!(self->s.eFlags & EF_FIRING))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $425
line 1051
;1051:    {
line 1052
;1052:      self->s.eFlags |= EF_FIRING;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1053
;1053:      G_AddEvent(self, EV_ALIEN_ACIDTUBE, DirToByte(self->s.origin2));
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1054
;1054:    }
LABELV $425
line 1056
;1055:
;1056:    if ((self->timestamp + ACIDTUBE_REPEAT) > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 3000
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $427
line 1057
;1057:      self->think = AAcidTube_Damage;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AAcidTube_Damage
ASGNP4
ADDRGP4 $428
JUMPV
LABELV $427
line 1059
;1058:    else
;1059:    {
line 1060
;1060:      self->think = AAcidTube_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AAcidTube_Think
ASGNP4
line 1061
;1061:      self->s.eFlags &= ~EF_FIRING;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1062
;1062:    }
LABELV $428
line 1065
;1063:
;1064:    //do some damage
;1065:    G_SelectiveRadiusDamage(
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 1068
;1066:      self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;1067:      self->splashMethodOfDeath, PTE_ALIENS);
;1068:  }
LABELV $423
line 1070
;1069:
;1070:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1072
;1071:
;1072:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1073
;1073:}
LABELV $422
endproc AAcidTube_Damage 8 28
lit
align 4
LABELV $432
byte 4 1133903872
byte 4 1133903872
byte 4 1133903872
export AAcidTube_Think
code
proc AAcidTube_Think 4180 32
line 1084
;1074:
;1075:/*
;1076: ================
;1077: AAcidTube_Think
;1078:
;1079: Think function for Alien Acid Tube
;1080: ================
;1081: */
;1082:void
;1083:AAcidTube_Think(gentity_t *self)
;1084:{
line 1087
;1085:  int entityList[MAX_GENTITIES];
;1086:  vec3_t range =
;1087:  { ACIDTUBE_RANGE, ACIDTUBE_RANGE, ACIDTUBE_RANGE };
ADDRLP4 8
ADDRGP4 $432
INDIRB
ASGNB 12
line 1092
;1088:  vec3_t mins, maxs;
;1089:  int i, num;
;1090:  gentity_t *enemy;
;1091:
;1092:  self->powered = G_IsOvermindBuilt();
ADDRLP4 4144
ADDRGP4 G_IsOvermindBuilt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4144
INDIRI4
ASGNI4
line 1094
;1093:
;1094:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4148
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4148
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
ADDF4
ASGNF4
line 1095
;1095:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4152
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4152
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
SUBF4
ASGNF4
line 1098
;1096:
;1097:  //if there is no creep nearby die
;1098:  if (!G_FindCreep(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4156
ADDRGP4 G_FindCreep
CALLI4
ASGNI4
ADDRLP4 4156
INDIRI4
CNSTI4 0
NEI4 $441
line 1099
;1099:  {
line 1100
;1100:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4160
CNSTP4 0
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
CNSTP4 0
ASGNP4
ADDRLP4 4164
INDIRP4
ARGP4
ADDRLP4 4164
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1101
;1101:    return;
ADDRGP4 $431
JUMPV
LABELV $441
line 1104
;1102:  }
;1103:
;1104:  if (self->spawned && G_FindOvermind(self))
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $443
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 4164
INDIRI4
CNSTI4 0
EQI4 $443
line 1105
;1105:  {
line 1107
;1106:    //do some damage
;1107:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4168
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4168
INDIRI4
ASGNI4
line 1108
;1108:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $448
JUMPV
LABELV $445
line 1109
;1109:    {
line 1110
;1110:      enemy = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1112
;1111:
;1112:      if (enemy->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $449
line 1113
;1113:        continue;
ADDRGP4 $446
JUMPV
LABELV $449
line 1115
;1114:
;1115:      if (!G_Visible(self, enemy))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4172
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4172
INDIRI4
CNSTI4 0
NEI4 $451
line 1116
;1116:        continue;
ADDRGP4 $446
JUMPV
LABELV $451
line 1118
;1117:
;1118:      if (enemy->client && enemy->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRLP4 4176
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $453
ADDRLP4 4176
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $453
line 1119
;1119:      {
line 1120
;1120:        self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1121
;1121:        self->think = AAcidTube_Damage;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AAcidTube_Damage
ASGNP4
line 1122
;1122:        self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1123
;1123:        G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1124
;1124:        return;
ADDRGP4 $431
JUMPV
LABELV $453
line 1126
;1125:      }
;1126:    }
LABELV $446
line 1108
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $448
ADDRLP4 4
INDIRI4
ADDRLP4 4116
INDIRI4
LTI4 $445
line 1127
;1127:  }
LABELV $443
line 1129
;1128:
;1129:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1131
;1130:
;1131:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4172
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4168
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4172
INDIRI4
ADDI4
ASGNI4
line 1132
;1132:}
LABELV $431
endproc AAcidTube_Think 4180 32
lit
align 4
LABELV $459
byte 4 1133903872
byte 4 1133903872
byte 4 1133903872
export AHive_Think
code
proc AHive_Think 4224 32
line 1145
;1133:
;1134://==================================================================================
;1135:
;1136:/*
;1137: ================
;1138: AHive_Think
;1139:
;1140: Think function for Alien Hive
;1141: ================
;1142: */
;1143:void
;1144:AHive_Think(gentity_t *self)
;1145:{
line 1148
;1146:  int entityList[MAX_GENTITIES];
;1147:  vec3_t range =
;1148:  { ACIDTUBE_RANGE, ACIDTUBE_RANGE, ACIDTUBE_RANGE };
ADDRLP4 20
ADDRGP4 $459
INDIRB
ASGNB 12
line 1154
;1149:  vec3_t mins, maxs;
;1150:  int i, num;
;1151:  gentity_t *enemy;
;1152:  vec3_t dirToTarget;
;1153:
;1154:  self->powered = G_IsOvermindBuilt();
ADDRLP4 4156
ADDRGP4 G_IsOvermindBuilt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4156
INDIRI4
ASGNI4
line 1156
;1155:
;1156:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4164
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4160
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4164
INDIRI4
ADDI4
ASGNI4
line 1158
;1157:
;1158:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4144
ADDRLP4 4168
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4144+4
ADDRLP4 4168
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4144+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDF4
ASGNF4
line 1159
;1159:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4172
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4172
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
SUBF4
ASGNF4
line 1162
;1160:
;1161:  //if there is no creep nearby die
;1162:  if (!G_FindCreep(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4176
ADDRGP4 G_FindCreep
CALLI4
ASGNI4
ADDRLP4 4176
INDIRI4
CNSTI4 0
NEI4 $469
line 1163
;1163:  {
line 1164
;1164:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
CNSTP4 0
ASGNP4
ADDRLP4 4180
INDIRP4
ARGP4
ADDRLP4 4180
INDIRP4
ARGP4
ADDRLP4 4184
CNSTP4 0
ASGNP4
ADDRLP4 4184
INDIRP4
ARGP4
ADDRLP4 4184
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1165
;1165:    return;
ADDRGP4 $458
JUMPV
LABELV $469
line 1168
;1166:  }
;1167:
;1168:  if (self->timestamp < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $471
line 1169
;1169:    self->active = qfalse; //nothing has returned in HIVE_REPEAT seconds, forget about it
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 0
ASGNI4
LABELV $471
line 1171
;1170:
;1171:  if (self->spawned && !self->active && G_FindOvermind(self))
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4184
CNSTI4 0
ASGNI4
ADDRLP4 4180
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 4184
INDIRI4
EQI4 $474
ADDRLP4 4180
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ADDRLP4 4184
INDIRI4
NEI4 $474
ADDRLP4 4180
INDIRP4
ARGP4
ADDRLP4 4188
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 4188
INDIRI4
CNSTI4 0
EQI4 $474
line 1172
;1172:  {
line 1174
;1173:    //do some damage
;1174:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4132
ARGP4
ADDRLP4 4144
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4192
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4128
ADDRLP4 4192
INDIRI4
ASGNI4
line 1175
;1175:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $479
JUMPV
LABELV $476
line 1176
;1176:    {
line 1177
;1177:      enemy = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1179
;1178:
;1179:      if (enemy->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $480
line 1180
;1180:        continue;
ADDRGP4 $477
JUMPV
LABELV $480
line 1182
;1181:
;1182:      if (enemy->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $482
line 1183
;1183:        continue;
ADDRGP4 $477
JUMPV
LABELV $482
line 1185
;1184:
;1185:      if (!G_Visible(self, enemy))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4196
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4196
INDIRI4
CNSTI4 0
NEI4 $484
line 1186
;1186:        continue;
ADDRGP4 $477
JUMPV
LABELV $484
line 1188
;1187:
;1188:      if (enemy->client && enemy->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRLP4 4200
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $486
ADDRLP4 4200
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $486
line 1189
;1189:      {
line 1190
;1190:        self->active = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 1
ASGNI4
line 1191
;1191:        self->target_ent = enemy;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1192
;1192:        self->timestamp = level.time + HIVE_REPEAT;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1194
;1193:
;1194:        VectorSubtract(enemy->s.pos.trBase, self->s.pos.trBase, dirToTarget);
ADDRLP4 4208
CNSTI4 24
ASGNI4
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 4208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
ADDRLP4 4208
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4216
CNSTI4 28
ASGNI4
ADDRLP4 8+4
ADDRLP4 0
INDIRP4
ADDRLP4 4216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
ADDRLP4 4216
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4220
CNSTI4 32
ASGNI4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
ADDRLP4 4220
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 4220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1195
;1195:        VectorNormalize(dirToTarget);
ADDRLP4 8
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1196
;1196:        vectoangles(dirToTarget, self->turretAim);
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1199
;1197:
;1198:        //fire at target
;1199:        FireWeapon(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 1200
;1200:        G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1201
;1201:        return;
ADDRGP4 $458
JUMPV
LABELV $486
line 1203
;1202:      }
;1203:    }
LABELV $477
line 1175
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $479
ADDRLP4 4
INDIRI4
ADDRLP4 4128
INDIRI4
LTI4 $476
line 1204
;1204:  }
LABELV $474
line 1206
;1205:
;1206:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1207
;1207:}
LABELV $458
endproc AHive_Think 4224 32
export AHovel_Blocked
proc AHovel_Blocked 216 28
line 1223
;1208:
;1209://==================================================================================
;1210:
;1211:
;1212:#define HOVEL_TRACE_DEPTH 128.0f
;1213:
;1214:/*
;1215: ================
;1216: AHovel_Blocked
;1217:
;1218: Is this hovel entrance blocked?
;1219: ================
;1220: */
;1221:qboolean
;1222:AHovel_Blocked(gentity_t *hovel, gentity_t *player, qboolean provideExit)
;1223:{
line 1229
;1224:  vec3_t forward, normal, origin, start, end, angles, hovelMaxs;
;1225:  vec3_t mins, maxs;
;1226:  float displacement;
;1227:  trace_t tr;
;1228:
;1229:  BG_FindBBoxForBuildable(BA_A_HOVEL, NULL, hovelMaxs);
CNSTI4 8
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 1230
;1230:  BG_FindBBoxForClass(player->client->ps.stats[STAT_PCLASS], mins, maxs, NULL, NULL, NULL);
ADDRFP4 4
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
ADDRLP4 120
ARGP4
ADDRLP4 172
CNSTP4 0
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 1232
;1231:
;1232:  VectorCopy(hovel->s.origin2, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1233
;1233:  AngleVectors(hovel->s.angles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 176
CNSTP4 0
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1234
;1234:  VectorInverse(forward);
ADDRLP4 96
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 1236
;1235:
;1236:  displacement = VectorMaxComponent(maxs) + VectorMaxComponent(hovelMaxs) + 1.0f;
ADDRLP4 120
ARGP4
ADDRLP4 180
ADDRGP4 VectorMaxComponent
CALLF4
ASGNF4
ADDRLP4 148
ARGP4
ADDRLP4 184
ADDRGP4 VectorMaxComponent
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1238
;1237:
;1238:  VectorMA(hovel->s.origin, displacement, forward, origin);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 188
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDF4
ASGNF4
line 1240
;1239:
;1240:  VectorCopy(hovel->s.origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1241
;1241:  VectorCopy(origin, end);
ADDRLP4 108
ADDRLP4 0
INDIRB
ASGNB 12
line 1245
;1242:
;1243:  // see if there's something between the hovel and its exit 
;1244:  // (eg built right up against a wall)
;1245:  trap_Trace(&tr, start, NULL, NULL, end, player->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 196
CNSTP4 0
ASGNP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1246
;1246:  if (tr.fraction < 1.0f)
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $496
line 1247
;1247:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $491
JUMPV
LABELV $496
line 1249
;1248:
;1249:  vectoangles(forward, angles);
ADDRLP4 96
ARGP4
ADDRLP4 160
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1251
;1250:
;1251:  VectorMA(origin, HOVEL_TRACE_DEPTH, normal, start);
ADDRLP4 200
CNSTF4 1124073472
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 200
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 200
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1124073472
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1254
;1252:
;1253:  //compute a place up in the air to start the real trace
;1254:  trap_Trace(&tr, origin, mins, maxs, start, player->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1256
;1255:
;1256:  VectorMA(origin, (HOVEL_TRACE_DEPTH * tr.fraction) - 1.0f, normal, start);
ADDRLP4 204
CNSTF4 1124073472
ASGNF4
ADDRLP4 208
CNSTF4 1065353216
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 204
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDRLP4 208
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 204
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDRLP4 208
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1124073472
ADDRLP4 36+8
INDIRF4
MULF4
CNSTF4 1065353216
SUBF4
MULF4
ADDF4
ASGNF4
line 1257
;1257:  VectorMA(origin, -HOVEL_TRACE_DEPTH, normal, end);
ADDRLP4 212
CNSTF4 3271557120
ASGNF4
ADDRLP4 108
ADDRLP4 0
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3271557120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1259
;1258:
;1259:  trap_Trace(&tr, start, mins, maxs, end, player->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 108
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1261
;1260:
;1261:  VectorCopy(tr.endpos, origin);
ADDRLP4 0
ADDRLP4 36+12
INDIRB
ASGNB 12
line 1263
;1262:
;1263:  trap_Trace(&tr, origin, mins, maxs, origin, player->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1265
;1264:
;1265:  if (provideExit)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $521
line 1266
;1266:  {
line 1267
;1267:    G_SetOrigin(player, origin);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1268
;1268:    VectorCopy(origin, player->client->ps.origin);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1270
;1269:    // nudge
;1270:    VectorMA(normal, 200.0f, forward, player->client->ps.velocity);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRF4
CNSTF4 1128792064
ADDRLP4 96
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12+4
INDIRF4
CNSTF4 1128792064
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12+8
INDIRF4
CNSTF4 1128792064
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1271
;1271:    G_SetClientViewAngle(player, angles);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 160
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 1272
;1272:  }
LABELV $521
line 1274
;1273:
;1274:  if (tr.fraction < 1.0f)
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $527
line 1275
;1275:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $491
JUMPV
LABELV $527
line 1277
;1276:  else
;1277:    return qfalse;
CNSTI4 0
RETI4
LABELV $491
endproc AHovel_Blocked 216 28
export AHovel_Use
proc AHovel_Use 84 12
line 1288
;1278:}
;1279:/*
;1280: ================
;1281: AHovel_Use
;1282:
;1283: Called when an alien uses a hovel
;1284: ================
;1285: */
;1286:void
;1287:AHovel_Use(gentity_t *self, gentity_t *other, gentity_t *activator)
;1288:{
line 1291
;1289:  vec3_t hovelOrigin, hovelAngles, inverseNormal;
;1290:
;1291:  if (self->spawned && G_FindOvermind(self))
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $531
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $531
line 1292
;1292:  {
line 1293
;1293:    if (self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $533
line 1294
;1294:    {
line 1296
;1295:      //this hovel is in use
;1296:      G_TriggerMenu(activator->client->ps.clientNum, MN_A_HOVEL_OCCUPIED);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 1297
;1297:    }
ADDRGP4 $534
JUMPV
LABELV $533
line 1298
;1298:    else if (((activator->client->ps.stats[STAT_PCLASS] == PCL_ALIEN_BUILDER0)
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
EQI4 $537
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $535
LABELV $537
ADDRLP4 48
CNSTI4 812
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $535
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $535
line 1301
;1299:        || (activator->client->ps.stats[STAT_PCLASS] == PCL_ALIEN_BUILDER0_UPG))
;1300:        && activator->health > 0 && self->health > 0)
;1301:    {
line 1302
;1302:      if (AHovel_Blocked(self, activator, qfalse))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 56
ADDRGP4 AHovel_Blocked
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $538
line 1303
;1303:      {
line 1305
;1304:        //you can get in, but you can't get out
;1305:        G_TriggerMenu(activator->client->ps.clientNum, MN_A_HOVEL_BLOCKED);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 1306
;1306:        return;
ADDRGP4 $530
JUMPV
LABELV $538
line 1309
;1307:      }
;1308:
;1309:      self->active = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 1
ASGNI4
line 1310
;1310:      G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1313
;1311:
;1312:      //prevent lerping
;1313:      activator->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 60
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 1314
;1314:      activator->client->ps.eFlags |= EF_NODRAW;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1315
;1315:      G_UnlaggedClear(activator);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UnlaggedClear
CALLV
pop
line 1317
;1316:
;1317:      activator->client->ps.stats[STAT_STATE] |= SS_HOVELING;
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1318
;1318:      activator->client->hovel = self;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1319
;1319:      self->builder = activator;
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1322
;1320:
;1321:      // Cancel pending suicides
;1322:      activator->suicideTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1920
ADDP4
CNSTI4 0
ASGNI4
line 1324
;1323:
;1324:      VectorCopy(self->s.pos.trBase, hovelOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1325
;1325:      VectorMA(hovelOrigin, 128.0f, self->s.origin2, hovelOrigin);
ADDRLP4 72
CNSTF4 1124073472
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1124073472
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1327
;1326:
;1327:      VectorCopy(self->s.origin2, inverseNormal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1328
;1328:      VectorInverse(inverseNormal);
ADDRLP4 12
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 1329
;1329:      vectoangles(inverseNormal, hovelAngles);
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1331
;1330:
;1331:      VectorCopy(activator->s.pos.trBase, activator->client->hovelOrigin);
ADDRLP4 80
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1388
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1333
;1332:
;1333:      G_SetOrigin(activator, hovelOrigin);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1334
;1334:      VectorCopy(hovelOrigin, activator->client->ps.origin);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1335
;1335:      G_SetClientViewAngle(activator, hovelAngles);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 1336
;1336:    }
LABELV $535
LABELV $534
line 1337
;1337:  }
LABELV $531
line 1338
;1338:}
LABELV $530
endproc AHovel_Use 84 12
export AHovel_Think
proc AHovel_Think 4 8
line 1349
;1339:
;1340:/*
;1341: ================
;1342: AHovel_Think
;1343:
;1344: Think for alien hovel
;1345: ================
;1346: */
;1347:void
;1348:AHovel_Think(gentity_t *self)
;1349:{
line 1350
;1350:  self->powered = G_IsOvermindBuilt();
ADDRLP4 0
ADDRGP4 G_IsOvermindBuilt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1351
;1351:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $545
line 1352
;1352:  {
line 1353
;1353:    if (self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $547
line 1354
;1354:      G_SetIdleBuildableAnim(self, BANIM_IDLE2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
ADDRGP4 $548
JUMPV
LABELV $547
line 1356
;1355:    else
;1356:      G_SetIdleBuildableAnim(self, BANIM_IDLE1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
LABELV $548
line 1357
;1357:  }
LABELV $545
line 1359
;1358:
;1359:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1361
;1360:
;1361:  self->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1362
;1362:}
LABELV $544
endproc AHovel_Think 4 8
export AHovel_Die
proc AHovel_Die 132 28
line 1373
;1363:
;1364:/*
;1365: ================
;1366: AHovel_Die
;1367:
;1368: Die for alien hovel
;1369: ================
;1370: */
;1371:void
;1372:AHovel_Die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1373:{
line 1377
;1374:  vec3_t dir;
;1375:
;1376:  buildHistory_t *new;
;1377:  new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 16
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1378
;1378:  new->ID = (++level.lastBuildID > 1000) ? (level.lastBuildID = 1) : level.lastBuildID;
ADDRLP4 24
ADDRGP4 level+189976
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1000
LEI4 $555
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 20
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 $556
JUMPV
LABELV $555
ADDRLP4 20
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $556
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1379
;1379:  new->ent = (attacker && attacker->client) ? attacker : NULL;
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $558
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $558
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $559
JUMPV
LABELV $558
ADDRLP4 36
CNSTP4 0
ASGNP4
LABELV $559
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 1380
;1380:  if (new->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $560
line 1381
;1381:    new->name[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $561
JUMPV
LABELV $560
line 1383
;1382:  else
;1383:    Q_strncpyz(new->name, "<world>", 8);
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $561
line 1384
;1384:  new->buildable = self->s.modelindex;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1385
;1385:  VectorCopy(self->s.pos.trBase, new->origin);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1386
;1386:  VectorCopy(self->s.angles, new->angles);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1387
;1387:  VectorCopy(self->s.origin2, new->origin2);
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1388
;1388:  VectorCopy(self->s.angles2, new->angles2);
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1389
;1389:  new->fate
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $563
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $563
ADDRLP4 64
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $563
ADDRLP4 52
CNSTI4 3
ASGNI4
ADDRGP4 $564
JUMPV
LABELV $563
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $564
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 1392
;1390:      = (attacker && attacker->client && attacker->client->ps.stats[STAT_PTEAM] == PTE_ALIENS) ? BF_TEAMKILLED
;1391:          : BF_DESTROYED;
;1392:  new->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 1393
;1393:  G_LogBuild(new);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 1395
;1394:
;1395:  VectorCopy(self->s.origin2, dir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1398
;1396:
;1397:  //do a bit of radius damage
;1398:  G_SelectiveRadiusDamage(
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 1403
;1399:    self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;1400:    self->splashMethodOfDeath, PTE_ALIENS);
;1401:
;1402:  //pretty events and item cleanup
;1403:  self->s.eFlags |= EF_NODRAW; //don't draw the model once its destroyed
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1404
;1404:  G_AddEvent(self, EV_ALIEN_BUILDABLE_EXPLOSION, DirToByte(dir));
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1405
;1405:  self->s.eFlags &= ~EF_FIRING; //prevent any firing effects
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1406
;1406:  self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1407
;1407:  self->think = ASpawn_Melt;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ASpawn_Melt
ASGNP4
line 1408
;1408:  self->nextthink = level.time + 500; //wait .5 seconds before damaging others
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1409
;1409:  self->die = nullDieFunction;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 nullDieFunction
ASGNP4
line 1412
;1410:
;1411:  //if the hovel is occupied free the occupant
;1412:  if (self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $567
line 1413
;1413:  {
line 1414
;1414:    gentity_t *builder = self->builder;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRP4
ASGNP4
line 1418
;1415:    vec3_t newOrigin;
;1416:    vec3_t newAngles;
;1417:
;1418:    VectorCopy(self->s.angles, newAngles);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1419
;1419:    newAngles[ROLL] = 0;
ADDRLP4 100+8
CNSTF4 0
ASGNF4
line 1421
;1420:
;1421:    VectorCopy(self->s.origin, newOrigin);
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1422
;1422:    VectorMA(newOrigin, 1.0f, self->s.origin2, newOrigin);
ADDRLP4 112
CNSTF4 1065353216
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 88
INDIRF4
ADDRLP4 112
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 88+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRLP4 88+8
INDIRF4
CNSTF4 1065353216
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1425
;1423:
;1424:    //prevent lerping
;1425:    builder->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 120
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 1426
;1426:    builder->client->ps.eFlags &= ~EF_NODRAW;
ADDRLP4 124
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1427
;1427:    G_UnlaggedClear(builder);
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 G_UnlaggedClear
CALLV
pop
line 1429
;1428:
;1429:    G_SetOrigin(builder, newOrigin);
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1430
;1430:    VectorCopy(newOrigin, builder->client->ps.origin);
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 88
INDIRB
ASGNB 12
line 1431
;1431:    G_SetClientViewAngle(builder, newAngles);
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 1434
;1432:
;1433:    //client leaves hovel
;1434:    builder->client->ps.stats[STAT_STATE] &= ~SS_HOVELING;
ADDRLP4 128
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1435
;1435:  }
LABELV $567
line 1437
;1436:
;1437:  self->r.contents = 0; //stop collisions...
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1438
;1438:  trap_LinkEntity(self); //...requires a relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1440
;1439:
;1440:  if (attacker && attacker->client)
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
CNSTU4 0
ASGNU4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $574
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $574
line 1441
;1441:  {
line 1442
;1442:    if (attacker->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $576
line 1443
;1443:    {
line 1444
;1444:      G_TeamCommand(PTE_ALIENS, va(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $296
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 1447
;1445:        "print \"%s ^3DESTROYED^7 by teammate %s^7\n\"", BG_FindHumanNameForBuildable(
;1446:          self->s.modelindex), attacker->client->pers.netname));
;1447:      G_LogOnlyPrintf("%s ^3DESTROYED^7 by teammate %s^7\n", BG_FindHumanNameForBuildable(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 1449
;1448:        self->s.modelindex), attacker->client->pers.netname);
;1449:    }
LABELV $576
line 1450
;1450:    G_LogPrintf(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 96
CNSTI4 516
ASGNI4
ADDRLP4 100
ADDRFP4 8
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 100
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1454
;1451:      "Decon: %i %i %i: %s^7 destroyed %s by %s\n", attacker->client->ps.clientNum,
;1452:      self->s.modelindex, mod, attacker->client->pers.netname, BG_FindNameForBuildable(
;1453:        self->s.modelindex), modNames[mod]);
;1454:  }
LABELV $574
line 1455
;1455:}
LABELV $550
endproc AHovel_Die 132 28
export ABooster_Touch
proc ABooster_Touch 24 4
line 1468
;1456:
;1457://==================================================================================
;1458:
;1459:/*
;1460: ================
;1461: ABooster_Touch
;1462:
;1463: Called when an alien touches a booster
;1464: ================
;1465: */
;1466:void
;1467:ABooster_Touch(gentity_t *self, gentity_t *other, trace_t *trace)
;1468:{
line 1469
;1469:  gclient_t *client = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1471
;1470:
;1471:  if (other->flags & FL_NOTARGET)
ADDRFP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $579
line 1472
;1472:    return; // notarget cancels even beneficial effects?
ADDRGP4 $578
JUMPV
LABELV $579
line 1474
;1473:
;1474:  if (!self->spawned || self->health <= 0)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $583
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GTI4 $581
LABELV $583
line 1475
;1475:    return;
ADDRGP4 $578
JUMPV
LABELV $581
line 1477
;1476:
;1477:  if (!G_FindOvermind(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $584
line 1478
;1478:    return;
ADDRGP4 $578
JUMPV
LABELV $584
line 1480
;1479:
;1480:  if (!client)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $586
line 1481
;1481:    return;
ADDRGP4 $578
JUMPV
LABELV $586
line 1483
;1482:
;1483:  if (client && client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $588
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $588
line 1484
;1484:    return;
ADDRGP4 $578
JUMPV
LABELV $588
line 1487
;1485:
;1486:  //only allow boostage once every 30 seconds
;1487:  if (client->lastBoostedTime + BOOSTER_INTERVAL > level.time)
ADDRLP4 0
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
CNSTI4 30000
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $590
line 1488
;1488:    return;
ADDRGP4 $578
JUMPV
LABELV $590
line 1490
;1489:
;1490:  if (!(client->ps.stats[STAT_STATE] & SS_BOOSTED))
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $593
line 1491
;1491:  {
line 1492
;1492:    client->ps.stats[STAT_STATE] |= SS_BOOSTED;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1493
;1493:    client->lastBoostedTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1360
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1494
;1494:  }
LABELV $593
line 1495
;1495:}
LABELV $578
endproc ABooster_Touch 24 4
export ATrapper_FireOnEnemy
proc ATrapper_FireOnEnemy 136 12
line 1509
;1496:
;1497://==================================================================================
;1498:
;1499:#define TRAPPER_ACCURACY 10 // lower is better
;1500:/*
;1501: ================
;1502: ATrapper_FireOnEnemy
;1503:
;1504: Used by ATrapper_Think to fire at enemy
;1505: ================
;1506: */
;1507:void
;1508:ATrapper_FireOnEnemy(gentity_t *self, int firespeed, float range)
;1509:{
line 1510
;1510:  gentity_t *enemy = self->enemy;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ASGNP4
line 1513
;1511:  vec3_t dirToTarget;
;1512:  vec3_t halfAcceleration, thirdJerk;
;1513:  float distanceToTarget = BG_FindRangeForBuildable(self->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindRangeForBuildable
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 52
INDIRI4
CVIF4 4
ASGNF4
line 1514
;1514:  int lowMsec = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 1515
;1515:  int highMsec = (int) ((((distanceToTarget * LOCKBLOB_SPEED) + (distanceToTarget
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindSpeedForClass
CALLF4
ASGNF4
ADDRLP4 48
CNSTF4 1148846080
CNSTF4 1143111680
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDF4
CNSTF4 1221479552
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1519
;1516:      * BG_FindSpeedForClass(enemy->client->ps.stats[STAT_PCLASS]))) / (LOCKBLOB_SPEED
;1517:      * LOCKBLOB_SPEED)) * 1000.0f);
;1518:
;1519:  VectorScale(enemy->acceleration, 1.0f / 2.0f, halfAcceleration);
ADDRLP4 64
CNSTF4 1056964608
ASGNF4
ADDRLP4 16
ADDRLP4 64
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 64
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1056964608
ADDRLP4 12
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
MULF4
ASGNF4
line 1520
;1520:  VectorScale(enemy->jerk, 1.0f / 3.0f, thirdJerk);
ADDRLP4 72
CNSTF4 1051372203
ASGNF4
ADDRLP4 28
ADDRLP4 72
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 740
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 72
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+8
CNSTF4 1051372203
ADDRLP4 12
INDIRP4
CNSTI4 748
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRGP4 $602
JUMPV
LABELV $601
line 1525
;1521:
;1522:  // highMsec and lowMsec can only move toward
;1523:  // one another, so the loop must terminate
;1524:  while(highMsec - lowMsec > TRAPPER_ACCURACY)
;1525:  {
line 1526
;1526:    int partitionMsec = (highMsec + lowMsec) / 2;
ADDRLP4 84
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 2
DIVI4
ASGNI4
line 1527
;1527:    float time = (float) partitionMsec / 1000.0f;
ADDRLP4 80
ADDRLP4 84
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1528
;1528:    float projectileDistance = LOCKBLOB_SPEED * time;
ADDRLP4 88
CNSTF4 1143111680
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
line 1530
;1529:
;1530:    VectorMA(enemy->s.pos.trBase, time, enemy->s.pos.trDelta, dirToTarget);
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDF4
ASGNF4
line 1531
;1531:    VectorMA(dirToTarget, time * time, halfAcceleration, dirToTarget);
ADDRLP4 108
ADDRLP4 80
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1532
;1532:    VectorMA(dirToTarget, time * time * time, thirdJerk, dirToTarget);
ADDRLP4 120
ADDRLP4 80
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1533
;1533:    VectorSubtract(dirToTarget, self->s.pos.trBase, dirToTarget);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1534
;1534:    distanceToTarget = VectorLength(dirToTarget);
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 132
INDIRF4
ASGNF4
line 1536
;1535:
;1536:    if (projectileDistance < distanceToTarget)
ADDRLP4 88
INDIRF4
ADDRLP4 40
INDIRF4
GEF4 $622
line 1537
;1537:      lowMsec = partitionMsec;
ADDRLP4 44
ADDRLP4 84
INDIRI4
ASGNI4
ADDRGP4 $623
JUMPV
LABELV $622
line 1538
;1538:    else if (projectileDistance > distanceToTarget)
ADDRLP4 88
INDIRF4
ADDRLP4 40
INDIRF4
LEF4 $624
line 1539
;1539:      highMsec = partitionMsec;
ADDRLP4 48
ADDRLP4 84
INDIRI4
ASGNI4
ADDRGP4 $625
JUMPV
LABELV $624
line 1540
;1540:    else if (projectileDistance == distanceToTarget)
ADDRLP4 88
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $626
line 1541
;1541:      break; // unlikely to happen
ADDRGP4 $603
JUMPV
LABELV $626
LABELV $625
LABELV $623
line 1542
;1542:  }
LABELV $602
line 1524
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
CNSTI4 10
GTI4 $601
LABELV $603
line 1544
;1543:
;1544:  VectorNormalize(dirToTarget);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1545
;1545:  vectoangles(dirToTarget, self->turretAim);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1548
;1546:
;1547:  //fire at target
;1548:  FireWeapon(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 1549
;1549:  G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1550
;1550:  self->count = level.time + firespeed;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1551
;1551:}
LABELV $596
endproc ATrapper_FireOnEnemy 136 12
export ATrapper_CheckTarget
proc ATrapper_CheckTarget 112 28
line 1562
;1552:
;1553:/*
;1554: ================
;1555: ATrapper_CheckTarget
;1556:
;1557: Used by ATrapper_Think to check enemies for validity
;1558: ================
;1559: */
;1560:qboolean
;1561:ATrapper_CheckTarget(gentity_t *self, gentity_t *target, int range)
;1562:{
line 1566
;1563:  vec3_t distance;
;1564:  trace_t trace;
;1565:
;1566:  if (!target) // Do we have a target?
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $630
line 1567
;1567:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $630
line 1568
;1568:  if (!target->inuse) // Does the target still exist?
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $632
line 1569
;1569:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $632
line 1570
;1570:  if (target == self) // is the target us?
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $634
line 1571
;1571:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $634
line 1572
;1572:  if (!target->client) // is the target a bot or player?
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $636
line 1573
;1573:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $636
line 1574
;1574:  if (target->flags & FL_NOTARGET) // is the target cheating?
ADDRFP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $638
line 1575
;1575:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $638
line 1576
;1576:  if (target->client->ps.stats[STAT_PTEAM] == PTE_ALIENS) // one of us?
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $640
line 1577
;1577:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $640
line 1578
;1578:  if (target->client->sess.sessionTeam == TEAM_SPECTATOR) // is the target alive?
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $642
line 1579
;1579:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $642
line 1580
;1580:  if (target->health <= 0) // is the target still alive?
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $644
line 1581
;1581:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $644
line 1582
;1582:  if (target->client->ps.stats[STAT_STATE] & SS_BLOBLOCKED) // locked?
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $646
line 1583
;1583:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $646
line 1585
;1584:
;1585:  VectorSubtract(target->r.currentOrigin, self->r.currentOrigin, distance);
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 488
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
CNSTI4 492
ASGNI4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
CNSTI4 496
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1586
;1586:  if (VectorLength(distance) > range) // is the target within range?
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 92
INDIRF4
ADDRFP4 8
INDIRI4
CVIF4 4
LEF4 $650
line 1587
;1587:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $650
line 1590
;1588:
;1589:  //only allow a narrow field of "vision"
;1590:  VectorNormalize(distance); //is now direction of target
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1591
;1591:  if (DotProduct(distance, self->s.origin2) < LOCKBLOB_DOT)
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1062836634
GEF4 $652
line 1592
;1592:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $652
line 1594
;1593:
;1594:  trap_Trace(
ADDRLP4 12
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 24
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ARGP4
ADDRLP4 108
CNSTP4 0
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1596
;1595:    &trace, self->s.pos.trBase, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT);
;1596:  if (trace.contents & CONTENTS_SOLID) // can we see the target?
ADDRLP4 12+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $656
line 1597
;1597:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $629
JUMPV
LABELV $656
line 1599
;1598:
;1599:  return qtrue;
CNSTI4 1
RETI4
LABELV $629
endproc ATrapper_CheckTarget 112 28
export ATrapper_FindEnemy
proc ATrapper_FindEnemy 8 12
line 1611
;1600:}
;1601:
;1602:/*
;1603: ================
;1604: ATrapper_FindEnemy
;1605:
;1606: Used by ATrapper_Think to locate enemy gentities
;1607: ================
;1608: */
;1609:void
;1610:ATrapper_FindEnemy(gentity_t *ent, int range)
;1611:{
line 1615
;1612:  gentity_t *target;
;1613:
;1614:  //iterate through entities
;1615:  for(target = g_entities;target < &g_entities[level.num_entities];target++)
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $663
JUMPV
LABELV $660
line 1616
;1616:  {
line 1618
;1617:    //if target is not valid keep searching
;1618:    if (!ATrapper_CheckTarget(ent, target, range))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ATrapper_CheckTarget
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $665
line 1619
;1619:      continue;
ADDRGP4 $661
JUMPV
LABELV $665
line 1622
;1620:
;1621:    //we found a target
;1622:    ent->enemy = target;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1623
;1623:    return;
ADDRGP4 $659
JUMPV
LABELV $661
line 1615
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $663
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTI4 2476
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $660
line 1627
;1624:  }
;1625:
;1626:  //couldn't find a target
;1627:  ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 1628
;1628:}
LABELV $659
endproc ATrapper_FindEnemy 8 12
export ATrapper_Think
proc ATrapper_Think 48 32
line 1639
;1629:
;1630:/*
;1631: ================
;1632: ATrapper_Think
;1633:
;1634: think function for Alien Defense
;1635: ================
;1636: */
;1637:void
;1638:ATrapper_Think(gentity_t *self)
;1639:{
line 1640
;1640:  int range = BG_FindRangeForBuildable(self->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindRangeForBuildable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1641
;1641:  int firespeed = BG_FindFireSpeedForBuildable(self->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindFireSpeedForBuildable
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1643
;1642:
;1643:  self->powered = G_IsOvermindBuilt();
ADDRLP4 16
ADDRGP4 G_IsOvermindBuilt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1645
;1644:
;1645:  G_CreepSlow(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CreepSlow
CALLV
pop
line 1647
;1646:
;1647:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 1650
;1648:
;1649:  //if there is no creep nearby die
;1650:  if (!G_FindCreep(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_FindCreep
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $669
line 1651
;1651:  {
line 1652
;1652:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1653
;1653:    return;
ADDRGP4 $667
JUMPV
LABELV $669
line 1656
;1654:  }
;1655:
;1656:  if (self->spawned && G_FindOvermind(self))
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $671
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_FindOvermind
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $671
line 1657
;1657:  {
line 1659
;1658:    //if the current target is not valid find a new one
;1659:    if (!ATrapper_CheckTarget(self, self->enemy, range))
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 ATrapper_CheckTarget
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $673
line 1660
;1660:      ATrapper_FindEnemy(self, range);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ATrapper_FindEnemy
CALLV
pop
LABELV $673
line 1663
;1661:
;1662:    //if a new target cannot be found don't do anything
;1663:    if (!self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $675
line 1664
;1664:      return;
ADDRGP4 $667
JUMPV
LABELV $675
line 1667
;1665:
;1666:    //if we are pointing at our target and we can fire shoot it
;1667:    if (self->count < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $677
line 1668
;1668:      ATrapper_FireOnEnemy(self, firespeed, range);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 ATrapper_FireOnEnemy
CALLV
pop
LABELV $677
line 1669
;1669:  }
LABELV $671
line 1670
;1670:}
LABELV $667
endproc ATrapper_Think 48 32
export HRepeater_Think
proc HRepeater_Think 32 32
line 1683
;1671:
;1672://==================================================================================
;1673:
;1674:/*
;1675: ================
;1676: HRepeater_Think
;1677:
;1678: Think for human power repeater
;1679: ================
;1680: */
;1681:void
;1682:HRepeater_Think(gentity_t *self)
;1683:{
line 1685
;1684:  int i;
;1685:  qboolean reactor = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1688
;1686:  gentity_t *ent;
;1687:
;1688:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $681
line 1689
;1689:  {
line 1690
;1690:    if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $683
line 1691
;1691:      reactor = qtrue; //No need rc on survival modes.
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $683
line 1693
;1692:
;1693:    if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $686
line 1694
;1694:    {
line 1695
;1695:      G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
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
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1696
;1696:      return;
ADDRGP4 $680
JUMPV
LABELV $686
line 1699
;1697:    }
;1698:    //iterate through entities
;1699:    for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $692
JUMPV
LABELV $689
line 1700
;1700:    {
line 1701
;1701:      if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $694
line 1702
;1702:        continue;
ADDRGP4 $690
JUMPV
LABELV $694
line 1704
;1703:
;1704:      if (ent->s.modelindex == BA_H_REACTOR && ent->spawned && (ent->biteam == self->biteam))
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $696
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $696
ADDRLP4 16
CNSTI4 956
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
NEI4 $696
line 1705
;1705:        reactor = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $696
line 1706
;1706:    }
LABELV $690
line 1699
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $692
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $689
line 1707
;1707:  }
LABELV $681
line 1709
;1708:
;1709:  if (g_survival.integer && self->biteam == PTE_ALIENS)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $698
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $698
line 1710
;1710:  {
line 1711
;1711:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
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
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1712
;1712:  }
LABELV $698
line 1714
;1713:
;1714:  if (G_NumberOfDependants(self) == 0 && !g_survival.integer)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_NumberOfDependants
CALLI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $701
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $701
line 1715
;1715:  {
line 1717
;1716:    //if no dependants for x seconds then disappear
;1717:    if (self->count < 0)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 0
GEI4 $704
line 1718
;1718:      self->count = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
ADDRGP4 $702
JUMPV
LABELV $704
line 1719
;1719:    else if (self->count > 0 && ((level.time - self->count) > REPEATER_INACTIVE_TIME))
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $702
ADDRGP4 level+28
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 90000
LEI4 $702
line 1720
;1720:      G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
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
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1721
;1721:  }
ADDRGP4 $702
JUMPV
LABELV $701
line 1723
;1722:  else
;1723:    self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 -1
ASGNI4
LABELV $702
line 1725
;1724:
;1725:  self->powered = reactor;
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1727
;1726:
;1727:  self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1728
;1728:}
LABELV $680
endproc HRepeater_Think 32 32
export HRepeater_Use
proc HRepeater_Use 0 8
line 1739
;1729:
;1730:/*
;1731: ================
;1732: HRepeater_Use
;1733:
;1734: Use for human power repeater
;1735: ================
;1736: */
;1737:void
;1738:HRepeater_Use(gentity_t *self, gentity_t *other, gentity_t *activator)
;1739:{
line 1740
;1740:  if (self->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $712
line 1741
;1741:    return;
ADDRGP4 $711
JUMPV
LABELV $712
line 1743
;1742:
;1743:  if (!self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $714
line 1744
;1744:    return;
ADDRGP4 $711
JUMPV
LABELV $714
line 1746
;1745:
;1746:  if (other)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $716
line 1747
;1747:    G_GiveClientMaxAmmo(other, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
LABELV $716
line 1748
;1748:}
LABELV $711
endproc HRepeater_Use 0 8
lit
align 4
LABELV $719
byte 4 1120403456
byte 4 1120403456
byte 4 1120403456
export HReactor_Think
code
proc HReactor_Think 4184 32
line 1761
;1749:
;1750:#define DCC_ATTACK_PERIOD 10000
;1751:
;1752:/*
;1753: ================
;1754: HReactor_Think
;1755:
;1756: Think function for Human Reactor
;1757: ================
;1758: */
;1759:void
;1760:HReactor_Think(gentity_t *self)
;1761:{
line 1764
;1762:  int entityList[MAX_GENTITIES];
;1763:  vec3_t range =
;1764:  { REACTOR_ATTACK_RANGE, REACTOR_ATTACK_RANGE, REACTOR_ATTACK_RANGE };
ADDRLP4 16
ADDRGP4 $719
INDIRB
ASGNB 12
line 1769
;1765:  vec3_t mins, maxs;
;1766:  int i, num, team;
;1767:  gentity_t *enemy, *tent;
;1768:
;1769:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $720
line 1770
;1770:  {
line 1771
;1771:    team = PTE_ALIENS;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1772
;1772:  }
ADDRGP4 $721
JUMPV
LABELV $720
line 1774
;1773:  else
;1774:  {
line 1775
;1775:    team = PTE_HUMANS;
ADDRLP4 12
CNSTI4 2
ASGNI4
line 1776
;1776:  }
LABELV $721
line 1778
;1777:
;1778:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4140
ADDRLP4 4152
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140+4
ADDRLP4 4152
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDF4
ASGNF4
line 1779
;1779:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4128
ADDRLP4 4156
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4128+4
ADDRLP4 4156
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4128+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 1781
;1780:
;1781:  if (self->spawned && (self->health > 0))
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4164
CNSTI4 0
ASGNI4
ADDRLP4 4160
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 4164
INDIRI4
EQI4 $730
ADDRLP4 4160
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4164
INDIRI4
LEI4 $730
line 1782
;1782:  {
line 1783
;1783:    if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $732
line 1784
;1784:    {
line 1785
;1785:      G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4168
CNSTP4 0
ASGNP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4172
CNSTP4 0
ASGNP4
ADDRLP4 4172
INDIRP4
ARGP4
ADDRLP4 4172
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1786
;1786:      return;
ADDRGP4 $718
JUMPV
LABELV $732
line 1789
;1787:    }
;1788:    //do some damage
;1789:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4128
ARGP4
ADDRLP4 4140
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4168
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4124
ADDRLP4 4168
INDIRI4
ASGNI4
line 1790
;1790:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $738
JUMPV
LABELV $735
line 1791
;1791:    {
line 1792
;1792:      enemy = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1794
;1793:
;1794:      if (enemy->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $739
line 1795
;1795:        continue;
ADDRGP4 $736
JUMPV
LABELV $739
line 1797
;1796:
;1797:      if (enemy->client && (enemy->client->ps.stats[STAT_PTEAM] != team))
ADDRLP4 4172
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $741
ADDRLP4 4172
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $741
line 1798
;1798:      {
line 1799
;1799:        self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1800
;1800:        G_SelectiveRadiusDamage(
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4176
INDIRP4
ARGP4
CNSTF4 1109393408
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 4176
INDIRP4
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_SelectiveRadiusDamage
CALLI4
pop
line 1804
;1801:          self->s.pos.trBase, self, REACTOR_ATTACK_DAMAGE, REACTOR_ATTACK_RANGE, self, MOD_REACTOR,
;1802:          team);
;1803:
;1804:        tent = G_TempEntity(enemy->s.pos.trBase, EV_TESLATRAIL);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 4180
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 4180
INDIRP4
ASGNP4
line 1806
;1805:
;1806:        VectorCopy(self->s.pos.trBase, tent->s.origin2);
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1808
;1807:
;1808:        tent->s.generic1 = self->s.number; //src
ADDRLP4 8
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1809
;1809:        tent->s.clientNum = enemy->s.number; //dest
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1810
;1810:      }
LABELV $741
line 1811
;1811:    }
LABELV $736
line 1790
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $738
ADDRLP4 4
INDIRI4
ADDRLP4 4124
INDIRI4
LTI4 $735
line 1814
;1812:
;1813:    //reactor under attack
;1814:    if (self->health < self->lastHealth && level.time > level.humanBaseAttackTimer && G_IsDCCBuilt(
ADDRLP4 4172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4172
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
GEI4 $744
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+189260
INDIRI4
LEI4 $744
ADDRLP4 4172
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ARGI4
ADDRLP4 4176
ADDRGP4 G_IsDCCBuilt
CALLI4
ASGNI4
ADDRLP4 4176
INDIRI4
CNSTI4 0
EQI4 $744
line 1816
;1815:      self->biteam))
;1816:    {
line 1817
;1817:      level.humanBaseAttackTimer = level.time + DCC_ATTACK_PERIOD;
ADDRGP4 level+189260
ADDRGP4 level+28
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1818
;1818:      G_BroadcastEvent(EV_DCC_ATTACK, 0);
CNSTI4 70
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_BroadcastEvent
CALLV
pop
line 1819
;1819:    }
LABELV $744
line 1821
;1820:
;1821:    self->lastHealth = self->health;
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 4180
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 1822
;1822:  }
LABELV $730
line 1824
;1823:
;1824:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4172
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4168
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4172
INDIRI4
ADDI4
ASGNI4
line 1825
;1825:}
LABELV $718
endproc HReactor_Think 4184 32
export HArmoury_Activate
proc HArmoury_Activate 8 8
line 1838
;1826:
;1827://==================================================================================
;1828:
;1829:/*
;1830: ================
;1831: HArmoury_Activate
;1832:
;1833: Called when a human activates an Armoury
;1834: ================
;1835: */
;1836:void
;1837:HArmoury_Activate(gentity_t *self, gentity_t *other, gentity_t *activator)
;1838:{
line 1841
;1839:  int team;
;1840:
;1841:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $752
line 1842
;1842:  {
line 1843
;1843:    team = PTE_ALIENS;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1844
;1844:  }
ADDRGP4 $753
JUMPV
LABELV $752
line 1846
;1845:  else
;1846:  {
line 1847
;1847:    team = PTE_HUMANS;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1848
;1848:  }
LABELV $753
line 1850
;1849:
;1850:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $754
line 1851
;1851:  {
line 1853
;1852:    //only humans can activate this
;1853:    if ((activator->client->ps.stats[STAT_PTEAM] != PTE_HUMANS
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $759
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $758
LABELV $759
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $756
LABELV $758
line 1856
;1854:        && activator->client->ps.stats[STAT_PTEAM] != PTE_ALIENS)
;1855:        || (activator->client->ps.stats[STAT_PTEAM] != team))
;1856:      return;
ADDRGP4 $751
JUMPV
LABELV $756
line 1859
;1857:
;1858:    //if this is powered then call the armoury menu
;1859:    if (self->powered)
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $760
line 1860
;1860:    {
line 1861
;1861:      G_TriggerMenu(activator->client->ps.clientNum, MN_H_ARMOURY);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 1862
;1862:    }
ADDRGP4 $761
JUMPV
LABELV $760
line 1864
;1863:    else
;1864:    {
line 1865
;1865:      G_TriggerMenu(activator->client->ps.clientNum, MN_H_NOTPOWERED);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 1866
;1866:    }
LABELV $761
line 1867
;1867:  }
LABELV $754
line 1868
;1868:}
LABELV $751
endproc HArmoury_Activate 8 8
export HArmoury_Think
proc HArmoury_Think 8 32
line 1879
;1869:
;1870:/*
;1871: ================
;1872: HArmoury_Think
;1873:
;1874: Think for armoury
;1875: ================
;1876: */
;1877:void
;1878:HArmoury_Think(gentity_t *self)
;1879:{
line 1881
;1880:  //make sure we have power
;1881:  self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1883
;1882:
;1883:  if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $764
line 1884
;1884:  {
line 1885
;1885:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
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
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1886
;1886:    return;
ADDRGP4 $762
JUMPV
LABELV $764
line 1889
;1887:  }
;1888:
;1889:  self->powered = G_FindPower(self);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1890
;1890:}
LABELV $762
endproc HArmoury_Think 8 32
export HDCC_Think
proc HDCC_Think 8 4
line 1903
;1891:
;1892://==================================================================================
;1893:
;1894:/*
;1895: ================
;1896: HDCC_Think
;1897:
;1898: Think for dcc
;1899: ================
;1900: */
;1901:void
;1902:HDCC_Think(gentity_t *self)
;1903:{
line 1905
;1904:  //make sure we have power
;1905:  self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1907
;1906:
;1907:  self->powered = G_FindPower(self);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1908
;1908:}
LABELV $767
endproc HDCC_Think 8 4
export HMedistat_Think
proc HMedistat_Think 4224 32
line 1921
;1909:
;1910://==================================================================================
;1911:
;1912:/*
;1913: ================
;1914: HMedistat_Think
;1915:
;1916: think function for Human Medistation
;1917: ================
;1918: */
;1919:void
;1920:HMedistat_Think(gentity_t *self)
;1921:{
line 1926
;1922:  int entityList[MAX_GENTITIES];
;1923:  vec3_t mins, maxs;
;1924:  int i, num;
;1925:  gentity_t *player;
;1926:  qboolean occupied = qfalse;
ADDRLP4 4112
CNSTI4 0
ASGNI4
line 1929
;1927:  int team;
;1928:
;1929:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $770
line 1930
;1930:  {
line 1931
;1931:    team = PTE_ALIENS;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1932
;1932:  }
ADDRGP4 $771
JUMPV
LABELV $770
line 1934
;1933:  else
;1934:  {
line 1935
;1935:    team = PTE_HUMANS;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1936
;1936:  }
LABELV $771
line 1937
;1937:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4140
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4144
INDIRI4
ADDI4
ASGNI4
line 1939
;1938:
;1939:  if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $773
line 1940
;1940:  {
line 1941
;1941:    G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4148
CNSTP4 0
ASGNP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRLP4 4152
CNSTP4 0
ASGNP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1942
;1942:    return;
ADDRGP4 $769
JUMPV
LABELV $773
line 1946
;1943:  }
;1944:
;1945:  //make sure we have power
;1946:  if (!(self->powered = G_FindPower(self)))
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 4148
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4152
INDIRI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
NEI4 $776
line 1947
;1947:  {
line 1948
;1948:    if (self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $778
line 1949
;1949:    {
line 1950
;1950:      G_SetBuildableAnim(self, BANIM_CONSTRUCT2, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 1951
;1951:      G_SetIdleBuildableAnim(self, BANIM_IDLE1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 1952
;1952:      self->active = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 0
ASGNI4
line 1953
;1953:      self->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 1954
;1954:    }
LABELV $778
line 1956
;1955:
;1956:    self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1957
;1957:    return;
ADDRGP4 $769
JUMPV
LABELV $776
line 1960
;1958:  }
;1959:
;1960:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $781
line 1961
;1961:  {
line 1962
;1962:    VectorAdd(self->s.origin, self->r.maxs, maxs);
ADDRLP4 4156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4128
ADDRLP4 4156
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4156
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4128+4
ADDRLP4 4156
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4156
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4128+8
ADDRLP4 4160
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4160
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1963
;1963:    VectorAdd(self->s.origin, self->r.mins, mins);
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4116
ADDRLP4 4164
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4164
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4116+4
ADDRLP4 4164
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4164
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4116+8
ADDRLP4 4168
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4168
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1965
;1964:
;1965:    mins[2] += fabs(self->r.mins[2]) + self->r.maxs[2];
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ARGF4
ADDRLP4 4172
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4116+8
ADDRLP4 4116+8
INDIRF4
ADDRLP4 4172
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ADDF4
ASGNF4
line 1966
;1966:    maxs[2] += 60; //player height
ADDRLP4 4128+8
ADDRLP4 4128+8
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1969
;1967:
;1968:    //if active use the healing idle
;1969:    if (self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
line 1970
;1970:      G_SetIdleBuildableAnim(self, BANIM_IDLE2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
LABELV $789
line 1973
;1971:
;1972:    //check if a previous occupier is still here
;1973:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4116
ARGP4
ADDRLP4 4128
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4176
INDIRI4
ASGNI4
line 1974
;1974:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $794
JUMPV
LABELV $791
line 1975
;1975:    {
line 1976
;1976:      player = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
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
line 1978
;1977:
;1978:      if (player->client && (player->client->ps.stats[STAT_PTEAM] == team))
ADDRLP4 4180
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $795
ADDRLP4 4180
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $795
line 1979
;1979:      {
line 1980
;1980:        if (player->health < player->client->ps.stats[STAT_MAX_HEALTH]
ADDRLP4 4188
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4188
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $797
ADDRLP4 4188
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $797
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
NEU4 $797
line 1982
;1981:            && player->client->ps.pm_type != PM_DEAD && self->enemy == player)
;1982:          occupied = qtrue;
ADDRLP4 4112
CNSTI4 1
ASGNI4
LABELV $797
line 1983
;1983:      }
LABELV $795
line 1984
;1984:    }
LABELV $792
line 1974
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $794
ADDRLP4 4
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $791
line 1986
;1985:
;1986:    if (!occupied)
ADDRLP4 4112
INDIRI4
CNSTI4 0
NEI4 $799
line 1987
;1987:    {
line 1988
;1988:      self->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 1991
;1989:
;1990:      //look for something to heal
;1991:      for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $804
JUMPV
LABELV $801
line 1992
;1992:      {
line 1993
;1993:        player = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
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
line 1995
;1994:
;1995:        if (player->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $805
line 1996
;1996:          continue; // notarget cancels even beneficial effects?
ADDRGP4 $802
JUMPV
LABELV $805
line 1998
;1997:
;1998:        if (player->client && (player->client->ps.stats[STAT_PTEAM] == team))
ADDRLP4 4180
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $807
ADDRLP4 4180
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $807
line 1999
;1999:        {
line 2000
;2000:          if (player->health < player->client->ps.stats[STAT_MAX_HEALTH]
ADDRLP4 4188
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4188
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $809
ADDRLP4 4188
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $809
line 2002
;2001:              && player->client->ps.pm_type != PM_DEAD)
;2002:          {
line 2003
;2003:            self->enemy = player;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2006
;2004:
;2005:            //start the heal anim
;2006:            if (!self->active)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $810
line 2007
;2007:            {
line 2008
;2008:              G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 2009
;2009:              self->active = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 1
ASGNI4
line 2010
;2010:            }
line 2011
;2011:          }
ADDRGP4 $810
JUMPV
LABELV $809
line 2012
;2012:          else if (!BG_InventoryContainsUpgrade(UP_MEDKIT, player->client->ps.stats))
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 4192
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 4192
INDIRI4
CNSTI4 0
NEI4 $813
line 2013
;2013:            BG_AddUpgradeToInventory(UP_MEDKIT, player->client->ps.stats);
CNSTI4 3
ARGI4
ADDRLP4 0
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
LABELV $813
LABELV $810
line 2014
;2014:        }
LABELV $807
line 2015
;2015:      }
LABELV $802
line 1991
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $804
ADDRLP4 4
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $801
line 2016
;2016:    }
LABELV $799
line 2019
;2017:
;2018:    //nothing left to heal so go back to idling
;2019:    if (!self->enemy && self->active)
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $815
ADDRLP4 4180
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $815
line 2020
;2020:    {
line 2021
;2021:      G_SetBuildableAnim(self, BANIM_CONSTRUCT2, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 2022
;2022:      G_SetIdleBuildableAnim(self, BANIM_IDLE1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 2024
;2023:
;2024:      self->active = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 0
ASGNI4
line 2025
;2025:    }
ADDRGP4 $816
JUMPV
LABELV $815
line 2026
;2026:    else if (self->enemy) //heal!
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $817
line 2027
;2027:    {
line 2028
;2028:      if (self->enemy->client && self->enemy->client->ps.stats[STAT_STATE] & SS_POISONED)
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $819
ADDRLP4 4184
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $819
line 2029
;2029:        self->enemy->client->ps.stats[STAT_STATE] &= ~SS_POISONED;
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
LABELV $819
line 2031
;2030:
;2031:      if (self->enemy->client && self->enemy->client->ps.stats[STAT_STATE] & SS_MEDKIT_ACTIVE)
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4192
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $821
ADDRLP4 4192
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $821
line 2032
;2032:        self->enemy->client->ps.stats[STAT_STATE] &= ~SS_MEDKIT_ACTIVE;
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
LABELV $821
line 2034
;2033:
;2034:      self->enemy->health++;
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2036
;2035:
;2036:      if (self->enemy->client && self->enemy->client->ps.stats[STAT_STATE] & SS_POISONCLOUDED)
ADDRLP4 4204
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $823
ADDRLP4 4204
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $823
line 2037
;2037:        self->enemy->client->ps.stats[STAT_STATE] &= ~SS_POISONCLOUDED;
ADDRLP4 4208
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 4208
INDIRP4
ADDRLP4 4208
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
LABELV $823
line 2040
;2038:
;2039:      //if they're completely healed, give them a medkit
;2040:      if (self->enemy->health >= self->enemy->client->ps.stats[STAT_MAX_HEALTH]
ADDRLP4 4212
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4216
ADDRLP4 4212
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4212
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4216
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $825
CNSTI4 3
ARGI4
ADDRLP4 4216
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 4220
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 4220
INDIRI4
CNSTI4 0
NEI4 $825
line 2042
;2041:          && !BG_InventoryContainsUpgrade(UP_MEDKIT, self->enemy->client->ps.stats))
;2042:        BG_AddUpgradeToInventory(UP_MEDKIT, self->enemy->client->ps.stats);
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
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
LABELV $825
line 2043
;2043:    }
LABELV $817
LABELV $816
line 2044
;2044:  }
LABELV $781
line 2045
;2045:}
LABELV $769
endproc HMedistat_Think 4224 32
lit
align 4
LABELV $828
byte 4 0
byte 4 0
byte 4 1065353216
export HMGTurret_TrackEnemy
code
proc HMGTurret_TrackEnemy 160 16
line 2058
;2046:
;2047://==================================================================================
;2048:
;2049:/*
;2050: ================
;2051: HMGTurret_TrackEnemy
;2052:
;2053: Used by HMGTurret_Think to track enemy location
;2054: ================
;2055: */
;2056:qboolean
;2057:HMGTurret_TrackEnemy(gentity_t *self)
;2058:{
line 2061
;2059:  vec3_t dirToTarget, dttAdjusted, angleToTarget, angularDiff, xNormal;
;2060:  vec3_t refNormal =
;2061:  { 0.0f, 0.0f, 1.0f };
ADDRLP4 40
ADDRGP4 $828
INDIRB
ASGNB 12
line 2065
;2062:  float temp, rotAngle;
;2063:  float accuracyTolerance, angularSpeed;
;2064:
;2065:  if (self->lev1Grabbed)
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
INDIRI4
CNSTI4 0
EQI4 $829
line 2066
;2066:  {
line 2068
;2067:    //can't turn fast if grabbed
;2068:    accuracyTolerance = MGTURRET_GRAB_ACCURACYTOLERANCE;
ADDRLP4 12
CNSTF4 1101004800
ASGNF4
line 2069
;2069:    angularSpeed = MGTURRET_GRAB_ANGULARSPEED;
ADDRLP4 84
CNSTF4 1106247680
ASGNF4
line 2070
;2070:  }
ADDRGP4 $830
JUMPV
LABELV $829
line 2071
;2071:  else if (self->dcced)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
EQI4 $831
line 2072
;2072:  {
line 2073
;2073:    accuracyTolerance = MGTURRET_DCC_ACCURACYTOLERANCE;
ADDRLP4 12
CNSTF4 1116034389
ASGNF4
line 2074
;2074:    angularSpeed = MGTURRET_DCC_ANGULARSPEED;
ADDRLP4 84
CNSTF4 1120403456
ASGNF4
line 2075
;2075:  }
ADDRGP4 $832
JUMPV
LABELV $831
line 2077
;2076:  else
;2077:  {
line 2078
;2078:    accuracyTolerance = MGTURRET_ACCURACYTOLERANCE;
ADDRLP4 12
CNSTF4 1084926635
ASGNF4
line 2079
;2079:    angularSpeed = MGTURRET_ANGULARSPEED;
ADDRLP4 84
CNSTF4 1090519040
ASGNF4
line 2080
;2080:  }
LABELV $832
LABELV $830
line 2082
;2081:
;2082:  VectorSubtract(self->enemy->s.pos.trBase, self->s.pos.trBase, dirToTarget);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 96
CNSTI4 24
ASGNI4
ADDRLP4 0
ADDRLP4 92
INDIRP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRLP4 104
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2084
;2083:
;2084:  VectorNormalize(dirToTarget);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2086
;2085:
;2086:  CrossProduct(self->s.origin2, refNormal, xNormal);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2087
;2087:  VectorNormalize(xNormal);
ADDRLP4 64
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2088
;2088:  rotAngle = RAD2DEG(acos(DotProduct(self->s.origin2, refNormal)));
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 112
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ADDRLP4 112
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 116
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 80
CNSTF4 1127481344
ADDRLP4 116
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 2089
;2089:  RotatePointAroundVector(dttAdjusted, xNormal, dirToTarget, rotAngle);
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 2091
;2090:
;2091:  vectoangles(dttAdjusted, angleToTarget);
ADDRLP4 52
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2093
;2092:
;2093:  angularDiff[PITCH] = AngleSubtract(self->s.angles2[PITCH], angleToTarget[PITCH]);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 120
INDIRF4
ASGNF4
line 2094
;2094:  angularDiff[YAW] = AngleSubtract(self->s.angles2[YAW], angleToTarget[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 16+4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 124
INDIRF4
ASGNF4
line 2097
;2095:
;2096:  //if not pointing at our target then move accordingly
;2097:  if (angularDiff[PITCH] < (-accuracyTolerance))
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
NEGF4
GEF4 $839
line 2098
;2098:    self->s.angles2[PITCH] += angularSpeed;
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $840
JUMPV
LABELV $839
line 2099
;2099:  else if (angularDiff[PITCH] > accuracyTolerance)
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
LEF4 $841
line 2100
;2100:    self->s.angles2[PITCH] -= angularSpeed;
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $842
JUMPV
LABELV $841
line 2102
;2101:  else
;2102:    self->s.angles2[PITCH] = angleToTarget[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
LABELV $842
LABELV $840
line 2105
;2103:
;2104:  //disallow vertical movement past a certain limit
;2105:  temp = fabs(self->s.angles2[PITCH]);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 136
INDIRF4
ASGNF4
line 2106
;2106:  if (temp > 180)
ADDRLP4 76
INDIRF4
CNSTF4 1127481344
LEF4 $843
line 2107
;2107:    temp -= 360;
ADDRLP4 76
ADDRLP4 76
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $843
line 2109
;2108:
;2109:  if (temp < -MGTURRET_VERTICALCAP)
ADDRLP4 76
INDIRF4
CNSTF4 3253731328
GEF4 $845
line 2110
;2110:    self->s.angles2[PITCH] = (-360) + MGTURRET_VERTICALCAP;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 3282370560
ASGNF4
LABELV $845
line 2113
;2111:
;2112:  //if not pointing at our target then move accordingly
;2113:  if (angularDiff[YAW] < (-accuracyTolerance))
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
NEGF4
GEF4 $847
line 2114
;2114:    self->s.angles2[YAW] += angularSpeed;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $848
JUMPV
LABELV $847
line 2115
;2115:  else if (angularDiff[YAW] > accuracyTolerance)
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
LEF4 $850
line 2116
;2116:    self->s.angles2[YAW] -= angularSpeed;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $851
JUMPV
LABELV $850
line 2118
;2117:  else
;2118:    self->s.angles2[YAW] = angleToTarget[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 16+4
INDIRF4
ASGNF4
LABELV $851
LABELV $848
line 2120
;2119:
;2120:  AngleVectors(self->s.angles2, dttAdjusted, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2121
;2121:  RotatePointAroundVector(dirToTarget, xNormal, dttAdjusted, -rotAngle);
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 80
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 2122
;2122:  vectoangles(dirToTarget, self->turretAim);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2125
;2123:
;2124:  //if pointing at our target return true
;2125:  if (abs(angleToTarget[YAW] - self->s.angles2[YAW]) <= accuracyTolerance && abs(
ADDRLP4 16+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 152
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
GTF4 $854
ADDRLP4 16
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 156
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
GTF4 $854
line 2127
;2126:    angleToTarget[PITCH] - self->s.angles2[PITCH]) <= accuracyTolerance)
;2127:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $827
JUMPV
LABELV $854
line 2129
;2128:
;2129:  return qfalse;
CNSTI4 0
RETI4
LABELV $827
endproc HMGTurret_TrackEnemy 160 16
export HMGTurret_CheckTarget
proc HMGTurret_CheckTarget 116 28
line 2141
;2130:}
;2131:
;2132:/*
;2133: ================
;2134: HMGTurret_CheckTarget
;2135:
;2136: Used by HMGTurret_Think to check enemies for validity
;2137: ================
;2138: */
;2139:qboolean
;2140:HMGTurret_CheckTarget(gentity_t *self, gentity_t *target, qboolean ignorePainted)
;2141:{
line 2146
;2142:  trace_t trace;
;2143:  gentity_t *traceEnt;
;2144:  int team;
;2145:
;2146:  if (!target)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $858
line 2147
;2147:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $858
line 2148
;2148:  if (target->s.eType == ET_BUILDABLE)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $860
line 2149
;2149:  {
line 2150
;2150:    if (g_ctn.integer > 0 && target->s.modelindex == BA_H_SPAWN)
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $862
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $862
line 2151
;2151:    {
line 2152
;2152:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $862
line 2154
;2153:    }
;2154:    if (self->biteam == target->biteam)
ADDRLP4 68
CNSTI4 956
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
NEI4 $865
line 2155
;2155:    {
line 2156
;2156:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $865
line 2158
;2157:    }
;2158:  }
LABELV $860
line 2160
;2159:
;2160:  if (target->flags & FL_NOTARGET)
ADDRFP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $867
line 2161
;2161:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $867
line 2163
;2162:
;2163:  if (!target->client && target->s.eType != ET_BUILDABLE)
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $869
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $869
line 2164
;2164:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $869
line 2166
;2165:
;2166:  if (target->client && target->client->ps.stats[STAT_STATE] & SS_HOVELING)
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $871
ADDRLP4 72
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $871
line 2167
;2167:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $871
line 2169
;2168:
;2169:  if (target->health <= 0)
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $873
line 2170
;2170:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $873
line 2172
;2171:
;2172:  if (Distance(self->s.origin, target->s.pos.trBase) > MGTURRET_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1128792064
LEF4 $875
line 2173
;2173:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $875
line 2176
;2174:
;2175:  //some turret has already selected this target
;2176:  if (self->dcced && target->targeted && target->targeted->powered && !ignorePainted)
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $877
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 1564
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $877
ADDRLP4 84
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $877
ADDRFP4 8
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $877
line 2177
;2177:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $877
line 2179
;2178:
;2179:  trap_Trace(
ADDRLP4 4
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 24
ASGNI4
ADDRLP4 88
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
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
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2182
;2180:    &trace, self->s.pos.trBase, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT);
;2181:
;2182:  traceEnt = &g_entities[trace.entityNum];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2184
;2183:
;2184:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $880
line 2185
;2185:  {
line 2186
;2186:    team = PTE_ALIENS;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 2187
;2187:  }
LABELV $880
line 2188
;2188:  if (self->biteam == BIT_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $882
line 2189
;2189:  {
line 2190
;2190:    team = PTE_HUMANS;
ADDRLP4 64
CNSTI4 2
ASGNI4
line 2191
;2191:  }
LABELV $882
line 2193
;2192:
;2193:  if (!traceEnt->client && !(traceEnt->s.eType == ET_BUILDABLE))
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $884
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $884
line 2194
;2194:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $884
line 2196
;2195:
;2196:  if ((traceEnt->s.eType == ET_BUILDABLE) && (traceEnt->biteam == self->biteam))
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $886
ADDRLP4 108
CNSTI4 956
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
NEI4 $886
line 2197
;2197:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $886
line 2199
;2198:
;2199:  if (traceEnt->client && (traceEnt->client->ps.stats[STAT_PTEAM] == team))
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
CNSTU4 0
EQU4 $888
ADDRLP4 112
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $888
line 2200
;2200:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $888
line 2202
;2201:
;2202:  return qtrue;
CNSTI4 1
RETI4
LABELV $857
endproc HMGTurret_CheckTarget 116 28
export HMGTurret_FindEnemy
proc HMGTurret_FindEnemy 4180 16
line 2214
;2203:}
;2204:
;2205:/*
;2206: ================
;2207: HMGTurret_FindEnemy
;2208:
;2209: Used by HMGTurret_Think to locate enemy gentities
;2210: ================
;2211: */
;2212:void
;2213:HMGTurret_FindEnemy(gentity_t *self)
;2214:{
line 2222
;2215:  int entityList[MAX_GENTITIES];
;2216:  vec3_t range;
;2217:  vec3_t mins, maxs;
;2218:  int i, num;
;2219:  gentity_t *target;
;2220:  int team;
;2221:
;2222:  VectorSet(range, MGTURRET_RANGE, MGTURRET_RANGE, MGTURRET_RANGE);
ADDRLP4 4148
CNSTF4 1128792064
ASGNF4
ADDRLP4 4112
ADDRLP4 4148
INDIRF4
ASGNF4
ADDRLP4 4112+4
ADDRLP4 4148
INDIRF4
ASGNF4
ADDRLP4 4112+8
CNSTF4 1128792064
ASGNF4
line 2223
;2223:  VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4152
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4112
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4136+4
ADDRLP4 4152
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4112+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4136+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4112+8
INDIRF4
ADDF4
ASGNF4
line 2224
;2224:  VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
ADDRLP4 4156
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4112
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4124+4
ADDRLP4 4156
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4112+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4124+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4112+8
INDIRF4
SUBF4
ASGNF4
line 2226
;2225:
;2226:  if (self->biteam == BIT_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $901
line 2227
;2227:  {
line 2228
;2228:    team = PTE_HUMANS;
ADDRLP4 4108
CNSTI4 2
ASGNI4
line 2229
;2229:  }
LABELV $901
line 2230
;2230:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $903
line 2231
;2231:  {
line 2232
;2232:    team = PTE_ALIENS;
ADDRLP4 4108
CNSTI4 1
ASGNI4
line 2233
;2233:  }
LABELV $903
line 2236
;2234:
;2235:  //find aliens
;2236:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4124
ARGP4
ADDRLP4 4136
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4160
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4160
INDIRI4
ASGNI4
line 2237
;2237:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $908
JUMPV
LABELV $905
line 2238
;2238:  {
line 2239
;2239:    target = &g_entities[entityList[i]];
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
line 2241
;2240:
;2241:    if ((target->biteam != self->biteam) || (target->client
ADDRLP4 4168
CNSTI4 956
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4168
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 4168
INDIRI4
ADDP4
INDIRI4
NEI4 $911
ADDRLP4 4172
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $909
ADDRLP4 4172
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4108
INDIRI4
EQI4 $909
LABELV $911
line 2243
;2242:        && (target->client->ps.stats[STAT_PTEAM] != team)))
;2243:    {
line 2245
;2244:      //if target is not valid keep searching
;2245:      if (!HMGTurret_CheckTarget(self, target, qfalse))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4176
ADDRGP4 HMGTurret_CheckTarget
CALLI4
ASGNI4
ADDRLP4 4176
INDIRI4
CNSTI4 0
NEI4 $912
line 2246
;2246:        continue;
ADDRGP4 $906
JUMPV
LABELV $912
line 2249
;2247:
;2248:      //we found a target
;2249:      self->enemy = target;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2250
;2250:      return;
ADDRGP4 $890
JUMPV
LABELV $909
line 2252
;2251:    }
;2252:  }
LABELV $906
line 2237
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $908
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $905
line 2254
;2253:
;2254:  if (self->dcced)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
EQI4 $914
line 2255
;2255:  {
line 2257
;2256:    //check again, this time ignoring painted targets
;2257:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $919
JUMPV
LABELV $916
line 2258
;2258:    {
line 2259
;2259:      target = &g_entities[entityList[i]];
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
line 2261
;2260:
;2261:      if (target->client && (target->client->ps.stats[STAT_PTEAM] != team))
ADDRLP4 4164
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $920
ADDRLP4 4164
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4108
INDIRI4
EQI4 $920
line 2262
;2262:      {
line 2264
;2263:        //if target is not valid keep searching
;2264:        if (!HMGTurret_CheckTarget(self, target, qtrue))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4168
ADDRGP4 HMGTurret_CheckTarget
CALLI4
ASGNI4
ADDRLP4 4168
INDIRI4
CNSTI4 0
NEI4 $922
line 2265
;2265:          continue;
ADDRGP4 $917
JUMPV
LABELV $922
line 2268
;2266:
;2267:        //we found a target
;2268:        self->enemy = target;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2269
;2269:        return;
ADDRGP4 $890
JUMPV
LABELV $920
line 2271
;2270:      }
;2271:    }
LABELV $917
line 2257
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $919
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $916
line 2272
;2272:  }
LABELV $914
line 2275
;2273:
;2274:  //couldn't find a target
;2275:  self->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 2276
;2276:}
LABELV $890
endproc HMGTurret_FindEnemy 4180 16
export HMGTurret_Think
proc HMGTurret_Think 56 12
line 2287
;2277:
;2278:/*
;2279: ================
;2280: HMGTurret_Think
;2281:
;2282: Think function for MG turret
;2283: ================
;2284: */
;2285:void
;2286:HMGTurret_Think(gentity_t *self)
;2287:{
line 2288
;2288:  int firespeed = BG_FindFireSpeedForBuildable(self->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindFireSpeedForBuildable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2290
;2289:
;2290:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 2293
;2291:
;2292:  //used for client side muzzle flashes
;2293:  self->s.eFlags &= ~EF_FIRING;
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
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2296
;2294:
;2295:  //if not powered don't do anything and check again for power next think
;2296:  if (!(self->powered = G_FindPower(self)))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $926
line 2297
;2297:  {
line 2298
;2298:    self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2299
;2299:    return;
ADDRGP4 $924
JUMPV
LABELV $926
line 2302
;2300:  }
;2301:
;2302:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $929
line 2303
;2303:  {
line 2305
;2304:    //find a dcc for self
;2305:    self->dcced = G_FindDCC(self);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_FindDCC
CALLI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 2308
;2306:
;2307:    //if the current target is not valid find a new one
;2308:    if (!HMGTurret_CheckTarget(self, self->enemy, qfalse))
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 HMGTurret_CheckTarget
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $931
line 2309
;2309:    {
line 2310
;2310:      if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $933
line 2311
;2311:        self->enemy->targeted = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTP4 0
ASGNP4
LABELV $933
line 2313
;2312:
;2313:      HMGTurret_FindEnemy(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HMGTurret_FindEnemy
CALLV
pop
line 2314
;2314:    }
LABELV $931
line 2317
;2315:
;2316:    //if a new target cannot be found don't do anything
;2317:    if (!self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $935
line 2318
;2318:      return;
ADDRGP4 $924
JUMPV
LABELV $935
line 2320
;2319:
;2320:    self->enemy->targeted = self;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 2323
;2321:
;2322:    //if we are pointing at our target and we can fire shoot it
;2323:    if (HMGTurret_TrackEnemy(self) && (self->count < level.time))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 HMGTurret_TrackEnemy
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $937
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $937
line 2324
;2324:    {
line 2326
;2325:      //fire at target
;2326:      FireWeapon(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 2328
;2327:
;2328:      self->s.eFlags |= EF_FIRING;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2329
;2329:      G_AddEvent(self, EV_FIRE_WEAPON, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 26
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2330
;2330:      G_SetBuildableAnim(self, BANIM_ATTACK1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 2332
;2331:
;2332:      self->count = level.time + firespeed;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2333
;2333:    }
LABELV $937
line 2334
;2334:  }
LABELV $929
line 2335
;2335:}
LABELV $924
endproc HMGTurret_Think 56 12
export HTeslaGen_Think
proc HTeslaGen_Think 4240 16
line 2348
;2336:
;2337://==================================================================================
;2338:
;2339:/*
;2340: ================
;2341: HTeslaGen_Think
;2342:
;2343: Think function for Tesla Generator
;2344: ================
;2345: */
;2346:void
;2347:HTeslaGen_Think(gentity_t *self)
;2348:{
line 2357
;2349:  int entityList[MAX_GENTITIES];
;2350:  vec3_t range;
;2351:  vec3_t mins, maxs;
;2352:  vec3_t dir;
;2353:  int i, num;
;2354:  gentity_t *enemy;
;2355:  int biteam;
;2356:
;2357:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4164
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4160
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4164
INDIRI4
ADDI4
ASGNI4
line 2360
;2358:
;2359:  //if not powered don't do anything and check again for power next think
;2360:  if (!(self->powered = G_FindPower(self)) || !(self->dcced = G_FindDCC(self)))
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4172
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 4168
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 4172
INDIRI4
ASGNI4
ADDRLP4 4172
INDIRI4
CNSTI4 0
EQI4 $945
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 G_FindDCC
CALLI4
ASGNI4
ADDRLP4 4176
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 4180
INDIRI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
NEI4 $943
LABELV $945
line 2361
;2361:  {
line 2362
;2362:    self->s.eFlags &= ~EF_FIRING;
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2363
;2363:    self->nextthink = level.time + POWER_REFRESH_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2364
;2364:    return;
ADDRGP4 $941
JUMPV
LABELV $943
line 2367
;2365:  }
;2366:
;2367:  if (self->spawned && self->count < level.time)
ADDRLP4 4184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4184
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $947
ADDRLP4 4184
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $947
line 2368
;2368:  {
line 2370
;2369:    //used to mark client side effects
;2370:    self->s.eFlags &= ~EF_FIRING;
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2372
;2371:
;2372:    VectorSet(range, TESLAGEN_RANGE, TESLAGEN_RANGE, TESLAGEN_RANGE);
ADDRLP4 4192
CNSTF4 1125515264
ASGNF4
ADDRLP4 4124
ADDRLP4 4192
INDIRF4
ASGNF4
ADDRLP4 4124+4
ADDRLP4 4192
INDIRF4
ASGNF4
ADDRLP4 4124+8
CNSTF4 1125515264
ASGNF4
line 2373
;2373:    VectorAdd(self->s.origin, range, maxs);
ADDRLP4 4196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4148
ADDRLP4 4196
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4124
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4148+4
ADDRLP4 4196
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4124+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4148+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4124+8
INDIRF4
ADDF4
ASGNF4
line 2374
;2374:    VectorSubtract(self->s.origin, range, mins);
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4200
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4124
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4136+4
ADDRLP4 4200
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4124+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4136+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4124+8
INDIRF4
SUBF4
ASGNF4
line 2377
;2375:
;2376:    //find aliens
;2377:    num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4136
ARGP4
ADDRLP4 4148
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4204
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4204
INDIRI4
ASGNI4
line 2378
;2378:    for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $963
JUMPV
LABELV $960
line 2379
;2379:    {
line 2380
;2380:      enemy = &g_entities[entityList[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2382
;2381:
;2382:      if (enemy->s.eType == ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $964
line 2383
;2383:      {
line 2384
;2384:        if (g_ctn.integer > 0 && enemy->s.modelindex == BA_H_SPAWN)
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $966
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $966
line 2385
;2385:        {
line 2386
;2386:          continue;
ADDRGP4 $961
JUMPV
LABELV $966
line 2388
;2387:        }
;2388:        if (self->biteam == enemy->biteam)
ADDRLP4 4208
CNSTI4 956
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4208
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 4208
INDIRI4
ADDP4
INDIRI4
NEI4 $969
line 2389
;2389:        {
line 2390
;2390:          continue;
ADDRGP4 $961
JUMPV
LABELV $969
line 2392
;2391:        }
;2392:      }
LABELV $964
line 2394
;2393:
;2394:      if (enemy->flags & FL_NOTARGET)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $971
line 2395
;2395:        continue;
ADDRGP4 $961
JUMPV
LABELV $971
line 2397
;2396:
;2397:      if (enemy->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $973
line 2398
;2398:      {
line 2399
;2399:        biteam = BIT_HUMANS;
ADDRLP4 4120
CNSTI4 2
ASGNI4
line 2400
;2400:      }
ADDRGP4 $974
JUMPV
LABELV $973
line 2402
;2401:      else
;2402:      {
line 2403
;2403:        biteam = BIT_ALIENS;
ADDRLP4 4120
CNSTI4 1
ASGNI4
line 2404
;2404:      }
LABELV $974
line 2406
;2405:
;2406:      /* if( enemy->client &&
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $975
ADDRLP4 4212
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4212
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 4212
INDIRI4
ADDP4
ARGP4
ADDRLP4 4216
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 4216
INDIRF4
CNSTF4 1125515264
GTF4 $975
line 2409
;2407:       ( enemy->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS || enemy->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS  ) &&
;2408:       */if (enemy->health > 0 && Distance(enemy->s.pos.trBase, self->s.pos.trBase) <= TESLAGEN_RANGE)
;2409:      {
line 2410
;2410:        VectorSubtract(enemy->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 4224
CNSTI4 24
ASGNI4
ADDRLP4 4228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4228
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4232
CNSTI4 28
ASGNI4
ADDRLP4 8+4
ADDRLP4 0
INDIRP4
ADDRLP4 4232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4228
INDIRP4
ADDRLP4 4232
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4236
CNSTI4 32
ASGNI4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
ADDRLP4 4236
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 4236
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2411
;2411:        VectorNormalize(dir);
ADDRLP4 8
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2412
;2412:        vectoangles(dir, self->turretAim);
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2415
;2413:
;2414:        //fire at target
;2415:        FireWeapon(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 2416
;2416:      }
LABELV $975
line 2417
;2417:    }
LABELV $961
line 2378
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $963
ADDRLP4 4
INDIRI4
ADDRLP4 4116
INDIRI4
LTI4 $960
line 2419
;2418:
;2419:    if (self->s.eFlags & EF_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $979
line 2420
;2420:    {
line 2421
;2421:      G_AddEvent(self, EV_FIRE_WEAPON, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 26
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2426
;2422:
;2423:      //doesn't really need an anim
;2424:      //G_SetBuildableAnim( self, BANIM_ATTACK1, qfalse );
;2425:
;2426:      self->count = level.time + TESLAGEN_REPEAT;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 2427
;2427:    }
LABELV $979
line 2428
;2428:  }
LABELV $947
line 2429
;2429:}
LABELV $941
endproc HTeslaGen_Think 4240 16
export HSpawn_Disappear
proc HSpawn_Disappear 20 4
line 2443
;2430:
;2431://==================================================================================
;2432:
;2433:/*
;2434: ================
;2435: HSpawn_Disappear
;2436:
;2437: Called when a human spawn is destroyed before it is spawned
;2438: think function
;2439: ================
;2440: */
;2441:void
;2442:HSpawn_Disappear(gentity_t *self)
;2443:{
line 2447
;2444:  vec3_t dir;
;2445:
;2446:  // we don't have a valid direction, so just point straight up
;2447:  dir[0] = dir[1] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2448
;2448:  dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2450
;2449:
;2450:  self->s.eFlags |= EF_NODRAW; //don't draw the model once its destroyed
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
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2451
;2451:  self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2453
;2452:
;2453:  self->think = freeBuildable;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 freeBuildable
ASGNP4
line 2454
;2454:  self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2456
;2455:
;2456:  self->r.contents = 0; //stop collisions...
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 2457
;2457:  trap_LinkEntity(self); //...requires a relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2458
;2458:}
LABELV $982
endproc HSpawn_Disappear 20 4
export HSpawn_Blast
proc HSpawn_Blast 28 24
line 2470
;2459:
;2460:/*
;2461: ================
;2462: HSpawn_blast
;2463:
;2464: Called when a human spawn explodes
;2465: think function
;2466: ================
;2467: */
;2468:void
;2469:HSpawn_Blast(gentity_t *self)
;2470:{
line 2474
;2471:  vec3_t dir;
;2472:
;2473:  // we don't have a valid direction, so just point straight up
;2474:  dir[0] = dir[1] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2475
;2475:  dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2477
;2476:
;2477:  self->s.eFlags |= EF_NODRAW; //don't draw the model once its destroyed
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
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2478
;2478:  G_AddEvent(self, EV_HUMAN_BUILDABLE_EXPLOSION, DirToByte(dir));
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 58
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2479
;2479:  self->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2482
;2480:
;2481:  //do some radius damage
;2482:  G_RadiusDamage(
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2486
;2483:    self->s.pos.trBase, self, self->splashDamage, self->splashRadius, self,
;2484:    self->splashMethodOfDeath);
;2485:
;2486:  self->think = freeBuildable;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 freeBuildable
ASGNP4
line 2487
;2487:  self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2489
;2488:
;2489:  self->r.contents = 0; //stop collisions...
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 2490
;2490:  trap_LinkEntity(self); //...requires a relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2491
;2491:}
LABELV $987
endproc HSpawn_Blast 28 24
export HSpawn_Die
proc HSpawn_Die 92 28
line 2502
;2492:
;2493:/*
;2494: ================
;2495: HSpawn_die
;2496:
;2497: Called when a human spawn dies
;2498: ================
;2499: */
;2500:void
;2501:HSpawn_Die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2502:{
line 2505
;2503:  buildHistory_t *new;
;2504:  int team;
;2505:  if (self->biteam == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $993
line 2506
;2506:  {
line 2507
;2507:    team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2508
;2508:  }
ADDRGP4 $994
JUMPV
LABELV $993
line 2510
;2509:  else
;2510:  {
line 2511
;2511:    team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 2512
;2512:  }
LABELV $994
line 2514
;2513:
;2514:  new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 8
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2515
;2515:  new->ID = (++level.lastBuildID > 1000) ? (level.lastBuildID = 1) : level.lastBuildID;
ADDRLP4 16
ADDRGP4 level+189976
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1000
LEI4 $999
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $1000
JUMPV
LABELV $999
ADDRLP4 12
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $1000
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2516
;2516:  new->ent = (attacker && attacker->client) ? attacker : NULL;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1002
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1002
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $1003
JUMPV
LABELV $1002
ADDRLP4 28
CNSTP4 0
ASGNP4
LABELV $1003
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
line 2517
;2517:  if (new->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1004
line 2518
;2518:    new->name[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $1005
JUMPV
LABELV $1004
line 2520
;2519:  else
;2520:    Q_strncpyz(new->name, "<world>", 8);
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1005
line 2521
;2521:  new->buildable = self->s.modelindex;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 2522
;2522:  VectorCopy(self->s.pos.trBase, new->origin);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2523
;2523:  VectorCopy(self->s.angles, new->angles);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2524
;2524:  VectorCopy(self->s.origin2, new->origin2);
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2525
;2525:  VectorCopy(self->s.angles2, new->angles2);
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 2526
;2526:  new->fate
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $1007
ADDRLP4 56
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $1007
ADDRLP4 56
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1007
ADDRLP4 44
CNSTI4 3
ASGNI4
ADDRGP4 $1008
JUMPV
LABELV $1007
ADDRLP4 44
CNSTI4 2
ASGNI4
LABELV $1008
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 2529
;2527:      = (attacker && attacker->client && (attacker->client->ps.stats[STAT_PTEAM] == team)) ? BF_TEAMKILLED
;2528:          : BF_DESTROYED;
;2529:  new->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 2530
;2530:  G_LogBuild(new);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 2533
;2531:
;2532:  //pretty events and cleanup
;2533:  G_SetBuildableAnim(self, BANIM_DESTROY1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 2534
;2534:  G_SetIdleBuildableAnim(self, BANIM_DESTROYED);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 2536
;2535:
;2536:  self->die = nullDieFunction;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 nullDieFunction
ASGNP4
line 2537
;2537:  self->powered = qfalse; //free up power
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 2539
;2538:  //prevent any firing effects and cancel structure protection
;2539:  self->s.eFlags &= ~(EF_FIRING | EF_DBUILDER);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 -524801
BANDI4
ASGNI4
line 2541
;2540:
;2541:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1009
line 2542
;2542:  {
line 2543
;2543:    self->think = HSpawn_Blast;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HSpawn_Blast
ASGNP4
line 2544
;2544:    self->nextthink = level.time + HUMAN_DETONATION_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 2545
;2545:  }
ADDRGP4 $1010
JUMPV
LABELV $1009
line 2547
;2546:  else
;2547:  {
line 2548
;2548:    self->think = HSpawn_Disappear;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HSpawn_Disappear
ASGNP4
line 2549
;2549:    self->nextthink = level.time; //blast immediately
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2550
;2550:  }
LABELV $1010
line 2552
;2551:
;2552:  if (attacker && attacker->client)
ADDRLP4 64
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1013
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1013
line 2553
;2553:  {
line 2554
;2554:    if (attacker->client->ps.stats[STAT_PTEAM] != team)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1015
line 2555
;2555:    {
line 2556
;2556:      if (self->s.modelindex == BA_H_REACTOR)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1017
line 2557
;2557:        G_AddCreditToClient(attacker->client, REACTOR_VALUE, qtrue);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 300
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
ADDRGP4 $1016
JUMPV
LABELV $1017
line 2558
;2558:      else if (self->s.modelindex == BA_H_SPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1016
line 2559
;2559:        G_AddCreditToClient(attacker->client, HSPAWN_VALUE, qtrue);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 150
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2560
;2560:    }
ADDRGP4 $1016
JUMPV
LABELV $1015
line 2562
;2561:    else
;2562:    {
line 2563
;2563:      G_TeamCommand(PTE_HUMANS, va(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $296
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 2566
;2564:        "print \"%s ^3DESTROYED^7 by teammate %s^7\n\"", BG_FindHumanNameForBuildable(
;2565:          self->s.modelindex), attacker->client->pers.netname));
;2566:      G_LogOnlyPrintf("%s ^3DESTROYED^7 by teammate %s^7\n", BG_FindHumanNameForBuildable(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
CNSTI4 516
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 2568
;2567:        self->s.modelindex), attacker->client->pers.netname);
;2568:    }
LABELV $1016
line 2569
;2569:    G_LogPrintf(
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 76
CNSTI4 516
ASGNI4
ADDRLP4 80
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 80
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2573
;2570:      "Decon: %i %i %i: %s^7 destroyed %s by %s\n", attacker->client->ps.clientNum,
;2571:      self->s.modelindex, mod, attacker->client->pers.netname, BG_FindNameForBuildable(
;2572:        self->s.modelindex), modNames[mod]);
;2573:  }
LABELV $1013
line 2574
;2574:}
LABELV $992
endproc HSpawn_Die 92 28
export HSpawn_Think
proc HSpawn_Think 72 32
line 2585
;2575:
;2576:/*
;2577: ================
;2578: HSpawn_Think
;2579:
;2580: Think for human spawn
;2581: ================
;2582: */
;2583:void
;2584:HSpawn_Think(gentity_t *self)
;2585:{
line 2589
;2586:  gentity_t *ent;
;2587:
;2588:  // spawns work without power
;2589:  self->powered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 1
ASGNI4
line 2591
;2590:
;2591:  if (self->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1022
line 2592
;2592:  {
line 2594
;2593:    //only suicide if at rest
;2594:    if (self->s.groundEntityNum && level.time % 1000 == 0) // Check spawnpoint is expensive
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1024
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
MODI4
ADDRLP4 4
INDIRI4
NEI4 $1024
line 2595
;2595:    {
line 2596
;2596:      if ((ent = G_CheckSpawnPoint(
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
ARGP4
CNSTI4 9
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1027
line 2598
;2597:        self->s.number, self->s.origin, self->s.origin2, BA_H_SPAWN, NULL)) != NULL)
;2598:      {
line 2601
;2599:        // If the thing blocking the spawn is a buildable, kill it. 
;2600:        // If it's part of the map, kill self. 
;2601:        if (ent->s.eType == ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1029
line 2602
;2602:        {
line 2603
;2603:          G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2604
;2604:          G_SetBuildableAnim(self, BANIM_SPAWN1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
line 2605
;2605:        }
ADDRGP4 $1030
JUMPV
LABELV $1029
line 2606
;2606:        else if (ent->s.number == ENTITYNUM_WORLD || ent->s.eType == ET_MOVER)
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1022
EQI4 $1033
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1031
LABELV $1033
line 2607
;2607:        {
line 2608
;2608:          G_Damage(self, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2609
;2609:          return;
ADDRGP4 $1021
JUMPV
LABELV $1031
line 2611
;2610:        }
;2611:        else if (g_ctn.integer > 0 && ent->client && ent->health > 0 && self->biteam
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 g_ctn+12
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $1034
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1034
ADDRLP4 24
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $1034
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
EQI4 $1034
line 2613
;2612:            != ent->client->ps.stats[STAT_PTEAM])
;2613:        {
line 2614
;2614:          if (level.time - self->antispawncamp > g_ctncapturetime.integer)
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_ctncapturetime+12
INDIRI4
LEI4 $1035
line 2615
;2615:          {
line 2616
;2616:            trap_SendServerCommand(-1, va(
ADDRGP4 $1041
ARGP4
ADDRLP4 32
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2618
;2617:              "print \"^7%s^2 captured a telenode!\n\"", ent->client->pers.netname));
;2618:            self->spawnBlockTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2619
;2619:            self->s.modelindex2 = self->biteam = ent->client->ps.stats[STAT_PTEAM];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 2620
;2620:            self->antispawncamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2621
;2621:            G_AddCreditToClient(ent->client, 150, qtrue);
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 150
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2622
;2622:          }
line 2623
;2623:        }
ADDRGP4 $1035
JUMPV
LABELV $1034
line 2624
;2624:        else if (g_antiSpawnBlock.integer && ent->client) // && //ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS ) it push everything out
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CNSTI4 0
EQI4 $1044
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1044
line 2625
;2625:        {
line 2627
;2626:          //spawnblock protection
;2627:          if (self->spawnBlockTime && level.time - self->spawnBlockTime > 10000)
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1047
ADDRGP4 level+28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CNSTI4 10000
LEI4 $1047
line 2628
;2628:          {
line 2631
;2629:            //five seconds of countermeasures and we're still blocked
;2630:            //time for something more drastic
;2631:            G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_TRIGGER_HURT);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2632
;2632:            self->spawnBlockTime += 2000;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2634
;2633:            //inappropriate MOD but prints an apt obituary
;2634:          }
ADDRGP4 $1048
JUMPV
LABELV $1047
line 2635
;2635:          else if (self->spawnBlockTime && level.time - self->spawnBlockTime > 5000)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1050
ADDRGP4 level+28
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CNSTI4 5000
LEI4 $1050
line 2637
;2636:          //five seconds of blocked by client and...
;2637:          {
line 2640
;2638:            //random direction
;2639:            vec3_t velocity;
;2640:            velocity[0] = crandom() * g_antiSpawnBlock.integer;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
CNSTF4 1073741824
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2641
;2641:            velocity[1] = crandom() * g_antiSpawnBlock.integer;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40+4
CNSTF4 1073741824
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2642
;2642:            velocity[2] = g_antiSpawnBlock.integer;
ADDRLP4 40+8
ADDRGP4 g_antiSpawnBlock+12
INDIRI4
CVIF4 4
ASGNF4
line 2644
;2643:
;2644:            VectorAdd(ent->client->ps.velocity, velocity, ent->client->ps.velocity);
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDF4
ASGNF4
line 2645
;2645:            trap_SendServerCommand(ent - g_entities, "cp \"Don't spawn block!\"");
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $327
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2646
;2646:          }
ADDRGP4 $1051
JUMPV
LABELV $1050
line 2647
;2647:          else if (!self->spawnBlockTime)
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1060
line 2648
;2648:            self->spawnBlockTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
LABELV $1060
LABELV $1051
LABELV $1048
line 2649
;2649:        }
LABELV $1044
LABELV $1035
LABELV $1030
line 2651
;2650:
;2651:        if (ent->s.eType == ET_CORPSE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1028
line 2652
;2652:          G_FreeEntity(ent); //quietly remove
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2653
;2653:      }
ADDRGP4 $1028
JUMPV
LABELV $1027
line 2655
;2654:      else
;2655:        self->spawnBlockTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 0
ASGNI4
LABELV $1028
line 2656
;2656:    }
LABELV $1024
line 2659
;2657:
;2658:    //spawn under attack
;2659:    if (self->health < self->lastHealth && level.time > level.humanBaseAttackTimer && G_IsDCCBuilt(
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
GEI4 $1065
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+189260
INDIRI4
LEI4 $1065
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 G_IsDCCBuilt
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1065
line 2661
;2660:      self->biteam))
;2661:    {
line 2662
;2662:      level.humanBaseAttackTimer = level.time + DCC_ATTACK_PERIOD;
ADDRGP4 level+189260
ADDRGP4 level+28
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2663
;2663:      G_BroadcastEvent(EV_DCC_ATTACK, 0);
CNSTI4 70
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_BroadcastEvent
CALLV
pop
line 2664
;2664:    }
LABELV $1065
line 2666
;2665:
;2666:    self->lastHealth = self->health;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 2667
;2667:  }
LABELV $1022
line 2669
;2668:
;2669:  self->nextthink = level.time + BG_FindNextThinkForBuildable(self->s.modelindex);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2670
;2670:}
LABELV $1021
endproc HSpawn_Think 72 32
data
align 4
LABELV $1073
byte 4 1092616192
byte 4 1092616192
byte 4 1092616192
export G_BuildableTouchTriggers
code
proc G_BuildableTouchTriggers 4244 16
line 2683
;2671:
;2672://==================================================================================
;2673:
;2674:/*
;2675: ============
;2676: G_BuildableTouchTriggers
;2677:
;2678: Find all trigger entities that a buildable touches.
;2679: ============
;2680: */
;2681:void
;2682:G_BuildableTouchTriggers(gentity_t *ent)
;2683:{
line 2694
;2684:  int i, num;
;2685:  int touch[MAX_GENTITIES];
;2686:  gentity_t *hit;
;2687:  trace_t trace;
;2688:  vec3_t mins, maxs;
;2689:  vec3_t bmins, bmaxs;
;2690:  static vec3_t range =
;2691:  { 10, 10, 10 };
;2692:
;2693:  // dead buildables don't activate triggers!
;2694:  if (ent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1074
line 2695
;2695:    return;
ADDRGP4 $1072
JUMPV
LABELV $1074
line 2697
;2696:
;2697:  BG_FindBBoxForBuildable(ent->s.modelindex, bmins, bmaxs);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4192
ARGP4
ADDRLP4 4204
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 2699
;2698:
;2699:  VectorAdd(ent->s.origin, bmins, mins);
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 4216
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4192
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 4216
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4192+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4192+8
INDIRF4
ADDF4
ASGNF4
line 2700
;2700:  VectorAdd(ent->s.origin, bmaxs, maxs);
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 4220
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4204
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 4220
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4204+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4204+8
INDIRF4
ADDF4
ASGNF4
line 2702
;2701:
;2702:  VectorSubtract(mins, range, mins);
ADDRLP4 68
ADDRLP4 68
INDIRF4
ADDRGP4 $1073
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 68+4
INDIRF4
ADDRGP4 $1073+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRGP4 $1073+8
INDIRF4
SUBF4
ASGNF4
line 2703
;2703:  VectorAdd(maxs, range, maxs);
ADDRLP4 80
ADDRLP4 80
INDIRF4
ADDRGP4 $1073
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 80+4
INDIRF4
ADDRGP4 $1073+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRGP4 $1073+8
INDIRF4
ADDF4
ASGNF4
line 2705
;2704:
;2705:  num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 68
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4224
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 4224
INDIRI4
ASGNI4
line 2707
;2706:
;2707:  VectorAdd(ent->s.origin, bmins, mins);
ADDRLP4 4228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 4228
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4192
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 4228
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4192+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4192+8
INDIRF4
ADDF4
ASGNF4
line 2708
;2708:  VectorAdd(ent->s.origin, bmaxs, maxs);
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 4232
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4204
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 4232
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4204+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4204+8
INDIRF4
ADDF4
ASGNF4
line 2710
;2709:
;2710:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1107
JUMPV
LABELV $1104
line 2711
;2711:  {
line 2712
;2712:    hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2714
;2713:
;2714:    if (!hit->touch)
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1108
line 2715
;2715:      continue;
ADDRGP4 $1105
JUMPV
LABELV $1108
line 2717
;2716:
;2717:    if (!(hit->r.contents & CONTENTS_TRIGGER))
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $1110
line 2718
;2718:      continue;
ADDRGP4 $1105
JUMPV
LABELV $1110
line 2721
;2719:
;2720:    //ignore buildables not yet spawned
;2721:    if (!ent->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1112
line 2722
;2722:      continue;
ADDRGP4 $1105
JUMPV
LABELV $1112
line 2724
;2723:
;2724:    if (!trap_EntityContact(mins, maxs, hit))
ADDRLP4 68
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4236
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4236
INDIRI4
CNSTI4 0
NEI4 $1114
line 2725
;2725:      continue;
ADDRGP4 $1105
JUMPV
LABELV $1114
line 2727
;2726:
;2727:    memset(&trace, 0, sizeof(trace));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 60
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2729
;2728:
;2729:    if (hit->touch)
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1116
line 2730
;2730:      hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
LABELV $1116
line 2731
;2731:  }
LABELV $1105
line 2710
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1107
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
LTI4 $1104
line 2732
;2732:}
LABELV $1072
endproc G_BuildableTouchTriggers 4244 16
export G_BuildableThink
proc G_BuildableThink 92 8
line 2743
;2733:
;2734:/*
;2735: ===============
;2736: G_BuildableThink
;2737:
;2738: General think function for buildables
;2739: ===============
;2740: */
;2741:void
;2742:G_BuildableThink(gentity_t *ent, int msec)
;2743:{
line 2744
;2744:  int bHealth = BG_FindHealthForBuildable(ent->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindHealthForBuildable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2745
;2745:  int bRegen = BG_FindRegenRateForBuildable(ent->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindRegenRateForBuildable
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 2746
;2746:  int bTime = BG_FindBuildTimeForBuildable(ent->s.modelindex);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindBuildTimeForBuildable
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 2751
;2747:
;2748:  //pack health, power and dcc
;2749:
;2750:  //toggle spawned flag for buildables
;2751:  if (!ent->spawned && ent->health > 0 && !level.pausedTime)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1119
ADDRLP4 24
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $1119
ADDRGP4 level+189856
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1119
line 2752
;2752:  {
line 2753
;2753:    if (ent->buildTime + bTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 level+28
INDIRI4
GEI4 $1122
line 2754
;2754:      ent->spawned = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 1
ASGNI4
LABELV $1122
line 2755
;2755:  }
LABELV $1119
line 2757
;2756:
;2757:  ent->s.generic1 = (int) (((float) ent->health / (float) bHealth) * B_HEALTH_MASK);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 204
ADDP4
CNSTF4 1106771968
ADDRLP4 32
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
DIVF4
MULF4
CVFI4 4
ASGNI4
line 2759
;2758:
;2759:  if (ent->s.generic1 < 0)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1125
line 2760
;2760:    ent->s.generic1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
LABELV $1125
line 2762
;2761:
;2762:  if (ent->powered)
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1127
line 2763
;2763:    ent->s.generic1 |= B_POWERED_TOGGLEBIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $1127
line 2765
;2764:
;2765:  if (ent->dcced)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1129
line 2766
;2766:    ent->s.generic1 |= B_DCCED_TOGGLEBIT;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ASGNI4
LABELV $1129
line 2768
;2767:
;2768:  if (ent->spawned)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1131
line 2769
;2769:    ent->s.generic1 |= B_SPAWNED_TOGGLEBIT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $1131
line 2771
;2770:
;2771:  if (ent->deconstruct)
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1133
line 2772
;2772:    ent->s.generic1 |= B_MARKED_TOGGLEBIT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $1133
line 2774
;2773:
;2774:  ent->time1000 += msec;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 2776
;2775:
;2776:  if (ent->time1000 >= 1000)
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1000
LTI4 $1135
line 2777
;2777:  {
line 2778
;2778:    ent->time1000 -= 1000;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2780
;2779:
;2780:    if (!ent->spawned && ent->health > 0)
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1137
ADDRLP4 60
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $1137
line 2781
;2781:      ent->health += (int) (ceil((float) bHealth / (float) (bTime * 0.001)));
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 981668463
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
ADDRLP4 68
INDIRF4
CVFI4 4
ADDI4
ASGNI4
ADDRGP4 $1138
JUMPV
LABELV $1137
line 2782
;2782:    else if (ent->biteam == BIT_ALIENS && ent->health > 0 && ent->health < bHealth && bRegen
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1139
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $1139
ADDRLP4 80
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $1139
ADDRLP4 8
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $1139
ADDRLP4 76
INDIRP4
CNSTI4 1924
ADDP4
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 level+28
INDIRI4
GEI4 $1139
line 2784
;2783:        && (ent->lastDamageTime + ALIEN_REGEN_DAMAGE_TIME) < level.time)
;2784:      ent->health += bRegen;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $1139
LABELV $1138
line 2786
;2785:
;2786:    if (ent->health > bHealth)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1142
line 2787
;2787:      ent->health = bHealth;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $1142
line 2788
;2788:  }
LABELV $1135
line 2790
;2789:
;2790:  if (ent->lev1Grabbed && ent->lev1GrabTime + LEVEL1_GRAB_TIME < level.time)
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1036
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1144
ADDRLP4 56
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ADDRGP4 level+28
INDIRI4
GEI4 $1144
line 2791
;2791:    ent->lev1Grabbed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
LABELV $1144
line 2793
;2792:
;2793:  if (ent->clientSpawnTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1147
line 2794
;2794:    ent->clientSpawnTime -= msec;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
SUBI4
ASGNI4
LABELV $1147
line 2796
;2795:
;2796:  if (ent->clientSpawnTime < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1149
line 2797
;2797:    ent->clientSpawnTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 0
ASGNI4
LABELV $1149
line 2800
;2798:
;2799:  //check if this buildable is touching any triggers
;2800:  G_BuildableTouchTriggers(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_BuildableTouchTriggers
CALLV
pop
line 2804
;2801:
;2802:  //fall back on normal physics routines
;2803:  //G_RunThink(ent);
;2804:  G_Physics(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Physics
CALLV
pop
line 2805
;2805:}
LABELV $1118
endproc G_BuildableThink 92 8
export G_BuildableRange
proc G_BuildableRange 4168 16
line 2816
;2806:
;2807:/*
;2808: ===============
;2809: G_BuildableRange
;2810:
;2811: Check whether a point is within some range of a type of buildable
;2812: ===============
;2813: */
;2814:qboolean
;2815:G_BuildableRange(vec3_t origin, float r, buildable_t buildable)
;2816:{
line 2823
;2817:  int entityList[MAX_GENTITIES];
;2818:  vec3_t range;
;2819:  vec3_t mins, maxs;
;2820:  int i, num;
;2821:  gentity_t *ent;
;2822:
;2823:  VectorSet(range, r, r, r);
ADDRLP4 4144
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 4108
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 4
INDIRF4
ASGNF4
line 2824
;2824:  VectorAdd(origin, range, maxs);
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4148
INDIRP4
INDIRF4
ADDRLP4 4108
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4148
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
ADDF4
ASGNF4
line 2825
;2825:  VectorSubtract(origin, range, mins);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4152
INDIRP4
INDIRF4
ADDRLP4 4108
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4152
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
SUBF4
ASGNF4
line 2827
;2826:
;2827:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4156
INDIRI4
ASGNI4
line 2828
;2828:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1165
JUMPV
LABELV $1162
line 2829
;2829:  {
line 2830
;2830:    ent = &g_entities[entityList[i]];
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
line 2832
;2831:
;2832:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1166
line 2833
;2833:      continue;
ADDRGP4 $1163
JUMPV
LABELV $1166
line 2835
;2834:
;2835:    if (ent->biteam == BIT_HUMANS && !ent->powered)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1168
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1168
line 2836
;2836:      continue;
ADDRGP4 $1163
JUMPV
LABELV $1168
line 2838
;2837:
;2838:    if (ent->s.modelindex == buildable && ent->spawned)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $1170
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1170
line 2839
;2839:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1151
JUMPV
LABELV $1170
line 2840
;2840:  }
LABELV $1163
line 2828
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1165
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $1162
line 2842
;2841:
;2842:  return qfalse;
CNSTI4 0
RETI4
LABELV $1151
endproc G_BuildableRange 4168 16
export G_ArmoryRange
proc G_ArmoryRange 4168 16
line 2847
;2843:}
;2844:
;2845:qboolean
;2846:G_ArmoryRange(vec3_t origin, float r, buildable_t buildable, int biteam)
;2847:{
line 2854
;2848:  int entityList[MAX_GENTITIES];
;2849:  vec3_t range;
;2850:  vec3_t mins, maxs;
;2851:  int i, num;
;2852:  gentity_t *ent;
;2853:
;2854:  VectorSet(range, r, r, r);
ADDRLP4 4144
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 4108
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4144
INDIRF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 4
INDIRF4
ASGNF4
line 2855
;2855:  VectorAdd(origin, range, maxs);
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4148
INDIRP4
INDIRF4
ADDRLP4 4108
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4148
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
ADDF4
ASGNF4
line 2856
;2856:  VectorSubtract(origin, range, mins);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4152
INDIRP4
INDIRF4
ADDRLP4 4108
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4152
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4108+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4108+8
INDIRF4
SUBF4
ASGNF4
line 2858
;2857:
;2858:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4156
INDIRI4
ASGNI4
line 2859
;2859:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1186
JUMPV
LABELV $1183
line 2860
;2860:  {
line 2861
;2861:    ent = &g_entities[entityList[i]];
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
line 2863
;2862:
;2863:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1187
line 2864
;2864:      continue;
ADDRGP4 $1184
JUMPV
LABELV $1187
line 2866
;2865:
;2866:    if (ent->biteam == BIT_HUMANS && !ent->powered)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1189
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1189
line 2867
;2867:      continue;
ADDRGP4 $1184
JUMPV
LABELV $1189
line 2869
;2868:
;2869:    if (ent->s.modelindex == buildable && ent->spawned && (ent->biteam == biteam))
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $1191
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1191
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $1191
line 2870
;2870:    {
line 2871
;2871:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1172
JUMPV
LABELV $1191
line 2873
;2872:    }
;2873:  }
LABELV $1184
line 2859
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1186
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $1183
line 2875
;2874:
;2875:  return qfalse;
CNSTI4 0
RETI4
LABELV $1172
endproc G_ArmoryRange 4168 16
proc G_BoundsIntersect 24 0
line 2880
;2876:}
;2877:
;2878:static qboolean
;2879:G_BoundsIntersect(const vec3_t mins, const vec3_t maxs, const vec3_t mins2, const vec3_t maxs2)
;2880:{
line 2881
;2881:  if (maxs[0] < mins2[0] || maxs[1] < mins2[1] || maxs[2] < mins2[2] || mins[0] > maxs2[0]
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
LTF4 $1200
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
LTF4 $1200
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LTF4 $1200
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
GTF4 $1200
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
GTF4 $1200
ADDRLP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LEF4 $1194
LABELV $1200
line 2883
;2882:      || mins[1] > maxs2[1] || mins[2] > maxs2[2])
;2883:  {
line 2884
;2884:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1193
JUMPV
LABELV $1194
line 2887
;2885:  }
;2886:
;2887:  return qtrue;
CNSTI4 1
RETI4
LABELV $1193
endproc G_BoundsIntersect 24 0
proc G_BuildablesIntersect 68 16
line 2899
;2888:}
;2889:
;2890:/*
;2891: ===============
;2892: G_BuildablesIntersect
;2893:
;2894: Test if two buildables intersect each other
;2895: ===============
;2896: */
;2897:static qboolean
;2898:G_BuildablesIntersect(buildable_t a, vec3_t originA, buildable_t b, vec3_t originB)
;2899:{
line 2903
;2900:  vec3_t minsA, maxsA;
;2901:  vec3_t minsB, maxsB;
;2902:
;2903:  BG_FindBBoxForBuildable(a, minsA, maxsA);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 2904
;2904:  VectorAdd(minsA, originA, minsA);
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2905
;2905:  VectorAdd(maxsA, originA, maxsA);
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 52
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2907
;2906:
;2907:  BG_FindBBoxForBuildable(b, minsB, maxsB);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 2908
;2908:  VectorAdd(minsB, originB, minsB);
ADDRLP4 56
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 56
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2909
;2909:  VectorAdd(maxsB, originB, maxsB);
ADDRLP4 60
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2911
;2910:
;2911:  return G_BoundsIntersect(minsA, maxsA, minsB, maxsB);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 64
ADDRGP4 G_BoundsIntersect
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $1201
endproc G_BuildablesIntersect 68 16
lit
align 4
LABELV $1219
byte 4 0
byte 4 3
byte 4 4
byte 4 5
byte 4 7
byte 4 6
byte 4 8
byte 4 1
byte 4 2
byte 4 10
byte 4 11
byte 4 13
byte 4 14
byte 4 12
byte 4 9
byte 4 16
byte 4 15
code
proc G_CompareBuildablesForRemoval 144 16
line 2926
;2912:}
;2913:
;2914:/*
;2915: ===============
;2916: G_CompareBuildablesForRemoval
;2917:
;2918: qsort comparison function for a buildable removal list
;2919: ===============
;2920: */
;2921:static buildable_t cmpBuildable;
;2922:static vec3_t cmpOrigin;
;2923:
;2924:static int
;2925:G_CompareBuildablesForRemoval(const void *a, const void *b)
;2926:{
line 2928
;2927:  int precedence[] =
;2928:  { BA_NONE,
ADDRLP4 4
ADDRGP4 $1219
INDIRB
ASGNB 68
line 2938
;2929:
;2930:  BA_A_BARRICADE, BA_A_ACIDTUBE, BA_A_TRAPPER, BA_A_HIVE, BA_A_BOOSTER, BA_A_HOVEL, BA_A_SPAWN,
;2931:      BA_A_OVERMIND,
;2932:
;2933:      BA_H_MGTURRET, BA_H_TESLAGEN, BA_H_DCC, BA_H_MEDISTAT, BA_H_ARMOURY, BA_H_SPAWN,
;2934:      BA_H_REPEATER, BA_H_REACTOR };
;2935:
;2936:  gentity_t *buildableA, *buildableB;
;2937:  int i;
;2938:  int aPrecedence = 0, bPrecedence = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
line 2939
;2939:  qboolean aMatches = qfalse, bMatches = qfalse;
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 92
CNSTI4 0
ASGNI4
line 2941
;2940:
;2941:  buildableA = *(gentity_t **) a;
ADDRLP4 72
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 2942
;2942:  buildableB = *(gentity_t **) b;
ADDRLP4 76
ADDRFP4 4
INDIRP4
INDIRP4
ASGNP4
line 2945
;2943:
;2944:  // Prefer the one that collides with the thing we're building
;2945:  aMatches = G_BuildablesIntersect(
ADDRGP4 cmpBuildable
INDIRI4
ARGI4
ADDRGP4 cmpOrigin
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 G_BuildablesIntersect
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 100
INDIRI4
ASGNI4
line 2947
;2946:    cmpBuildable, cmpOrigin, buildableA->s.modelindex, buildableA->s.origin);
;2947:  bMatches = G_BuildablesIntersect(
ADDRGP4 cmpBuildable
INDIRI4
ARGI4
ADDRGP4 cmpOrigin
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 108
ADDRGP4 G_BuildablesIntersect
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 108
INDIRI4
ASGNI4
line 2949
;2948:    cmpBuildable, cmpOrigin, buildableB->s.modelindex, buildableB->s.origin);
;2949:  if (aMatches && !bMatches)
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1220
ADDRLP4 92
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1220
line 2950
;2950:    return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1220
line 2951
;2951:  if (!aMatches && bMatches)
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 116
INDIRI4
NEI4 $1222
ADDRLP4 92
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $1222
line 2952
;2952:    return 1;
CNSTI4 1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1222
line 2955
;2953:
;2954:  // If one matches the thing we're building, prefer it
;2955:  aMatches = (buildableA->s.modelindex == cmpBuildable);
ADDRLP4 72
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 cmpBuildable
INDIRI4
NEI4 $1225
ADDRLP4 120
CNSTI4 1
ASGNI4
ADDRGP4 $1226
JUMPV
LABELV $1225
ADDRLP4 120
CNSTI4 0
ASGNI4
LABELV $1226
ADDRLP4 88
ADDRLP4 120
INDIRI4
ASGNI4
line 2956
;2956:  bMatches = (buildableB->s.modelindex == cmpBuildable);
ADDRLP4 76
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 cmpBuildable
INDIRI4
NEI4 $1228
ADDRLP4 124
CNSTI4 1
ASGNI4
ADDRGP4 $1229
JUMPV
LABELV $1228
ADDRLP4 124
CNSTI4 0
ASGNI4
LABELV $1229
ADDRLP4 92
ADDRLP4 124
INDIRI4
ASGNI4
line 2957
;2957:  if (aMatches && !bMatches)
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $1230
ADDRLP4 92
INDIRI4
ADDRLP4 128
INDIRI4
NEI4 $1230
line 2958
;2958:    return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1230
line 2959
;2959:  if (!aMatches && bMatches)
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $1232
ADDRLP4 92
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $1232
line 2960
;2960:    return 1;
CNSTI4 1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1232
line 2963
;2961:
;2962:  // If they're the same type then pick the one marked earliest
;2963:  if (buildableA->s.modelindex == buildableB->s.modelindex)
ADDRLP4 136
CNSTI4 160
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
NEI4 $1234
line 2964
;2964:    return buildableA->deconstructTime - buildableB->deconstructTime;
ADDRLP4 140
CNSTI4 1012
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
SUBI4
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1234
line 2966
;2965:
;2966:  for(i = 0;i < sizeof(precedence) / sizeof(precedence[0]);i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1239
JUMPV
LABELV $1236
line 2967
;2967:  {
line 2968
;2968:    if (buildableA->s.modelindex == precedence[i])
ADDRLP4 72
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
NEI4 $1240
line 2969
;2969:      aPrecedence = i;
ADDRLP4 80
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $1240
line 2971
;2970:
;2971:    if (buildableB->s.modelindex == precedence[i])
ADDRLP4 76
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
NEI4 $1242
line 2972
;2972:      bPrecedence = i;
ADDRLP4 84
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $1242
line 2973
;2973:  }
LABELV $1237
line 2966
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1239
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 17
LTU4 $1236
line 2975
;2974:
;2975:  return aPrecedence - bPrecedence;
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
SUBI4
RETI4
LABELV $1218
endproc G_CompareBuildablesForRemoval 144 16
export G_FreeMarkedBuildables
proc G_FreeMarkedBuildables 24 12
line 2987
;2976:}
;2977:
;2978:/*
;2979: ===============
;2980: G_FreeMarkedBuildables
;2981:
;2982: Free up build points for a team by deconstructing marked buildables
;2983: ===============
;2984: */
;2985:void
;2986:G_FreeMarkedBuildables(void)
;2987:{
line 2991
;2988:  int i;
;2989:  gentity_t *ent;
;2990:  buildHistory_t *new, *last;
;2991:  last = level.buildHistory;
ADDRLP4 12
ADDRGP4 level+189972
INDIRP4
ASGNP4
line 2993
;2992:
;2993:  if (!g_markDeconstruct.integer)
ADDRGP4 g_markDeconstruct+12
INDIRI4
CNSTI4 0
NEI4 $1246
line 2994
;2994:    return; // Not enabled, can't deconstruct anything
ADDRGP4 $1244
JUMPV
LABELV $1246
line 2996
;2995:
;2996:  for(i = 0;i < level.numBuildablesForRemoval;i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1252
JUMPV
LABELV $1249
line 2997
;2997:  {
line 2998
;2998:    ent = level.markedBuildables[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+185140
ADDP4
INDIRP4
ASGNP4
line 3000
;2999:
;3000:    new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 16
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 3001
;3001:    new->ID = -1;
ADDRLP4 0
INDIRP4
CNSTI4 -1
ASGNI4
line 3002
;3002:    new->ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTP4 0
ASGNP4
line 3003
;3003:    Q_strncpyz(new->name, "<markdecon>", 12);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 $1255
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3004
;3004:    new->buildable = ent->s.modelindex;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 3005
;3005:    VectorCopy(ent->s.pos.trBase, new->origin);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 3006
;3006:    VectorCopy(ent->s.angles, new->angles);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3007
;3007:    VectorCopy(ent->s.origin2, new->origin2);
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 3008
;3008:    VectorCopy(ent->s.angles2, new->angles2);
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 3009
;3009:    new->fate = BF_DECONNED;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 3010
;3010:    new->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 3011
;3011:    new->marked = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTP4 0
ASGNP4
line 3013
;3012:
;3013:    last = last->marked = new;
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 3015
;3014:
;3015:    G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3016
;3016:  }
LABELV $1250
line 2996
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1252
ADDRLP4 8
INDIRI4
ADDRGP4 level+189236
INDIRI4
LTI4 $1249
line 3017
;3017:}
LABELV $1244
endproc G_FreeMarkedBuildables 24 12
proc G_SufficientBPAvailable 124 16
line 3029
;3018:
;3019:/*
;3020: ===============
;3021: G_SufficientBPAvailable
;3022:
;3023: Determine if enough build points can be released for the buildable
;3024: and list the buildables that much be destroyed if this is the case
;3025: ===============
;3026: */
;3027:static itemBuildError_t
;3028:G_SufficientBPAvailable(buildable_t buildable, vec3_t origin, int biteam)
;3029:{
line 3031
;3030:  int i;
;3031:  int numBuildables = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3032
;3032:  int pointsYielded = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3034
;3033:  gentity_t *ent;
;3034:  qboolean unique = BG_FindUniqueTestForBuildable(buildable);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindUniqueTestForBuildable
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 68
INDIRI4
ASGNI4
line 3038
;3035:  int remainingBP, remainingSpawns;
;3036:  int team;
;3037:  int buildPoints;
;3038:  qboolean collision = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3039
;3039:  int collisionCount = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 3040
;3040:  qboolean repeaterInRange = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 3041
;3041:  int repeaterInRangeCount = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 3045
;3042:  itemBuildError_t bpError;
;3043:  buildable_t spawn;
;3044:  buildable_t core;
;3045:  int spawnCount = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 3047
;3046:
;3047:  level.numBuildablesForRemoval = 0;
ADDRGP4 level+189236
CNSTI4 0
ASGNI4
line 3049
;3048:
;3049:  buildPoints = BG_FindBuildPointsForBuildable(buildable);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 3050
;3050:  team = BG_FindTeamForBuildable(buildable);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 76
INDIRI4
ASGNI4
line 3051
;3051:  if (biteam == BIT_ALIENS)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1258
line 3052
;3052:  {
line 3053
;3053:    remainingBP = level.alienBuildPoints;
ADDRLP4 56
ADDRGP4 level+185128
INDIRI4
ASGNI4
line 3054
;3054:    remainingSpawns = level.numAlienSpawns;
ADDRLP4 52
ADDRGP4 level+185088
INDIRI4
ASGNI4
line 3055
;3055:    bpError = IBE_NOPOWER;
ADDRLP4 60
CNSTI4 13
ASGNI4
line 3056
;3056:    spawn = BA_H_SPAWN;
ADDRLP4 32
CNSTI4 9
ASGNI4
line 3057
;3057:    core = BA_H_REACTOR;
ADDRLP4 16
CNSTI4 15
ASGNI4
line 3058
;3058:  }
ADDRGP4 $1259
JUMPV
LABELV $1258
line 3059
;3059:  else if (biteam == BIT_HUMANS)
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $1262
line 3060
;3060:  {
line 3061
;3061:    remainingBP = level.humanBuildPoints;
ADDRLP4 56
ADDRGP4 level+185132
INDIRI4
ASGNI4
line 3062
;3062:    remainingSpawns = level.numHumanSpawns;
ADDRLP4 52
ADDRGP4 level+185092
INDIRI4
ASGNI4
line 3063
;3063:    bpError = IBE_NOPOWER;
ADDRLP4 60
CNSTI4 13
ASGNI4
line 3064
;3064:    spawn = BA_H_SPAWN;
ADDRLP4 32
CNSTI4 9
ASGNI4
line 3065
;3065:    core = BA_H_REACTOR;
ADDRLP4 16
CNSTI4 15
ASGNI4
line 3066
;3066:  }
ADDRGP4 $1263
JUMPV
LABELV $1262
line 3068
;3067:  else
;3068:    return IBE_NONE;
CNSTI4 0
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1263
LABELV $1259
line 3071
;3069:
;3070:  // Simple non-marking case
;3071:  if (!g_markDeconstruct.integer)
ADDRGP4 g_markDeconstruct+12
INDIRI4
CNSTI4 0
NEI4 $1266
line 3072
;3072:  {
line 3073
;3073:    if (remainingBP - buildPoints < 0)
ADDRLP4 56
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CNSTI4 0
GEI4 $1269
line 3074
;3074:      return bpError;
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1269
line 3077
;3075:
;3076:    // Check for buildable<->buildable collisions
;3077:    for(i = MAX_CLIENTS, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1274
JUMPV
LABELV $1271
line 3078
;3078:    {
line 3079
;3079:      if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1276
line 3080
;3080:        continue;
ADDRGP4 $1272
JUMPV
LABELV $1276
line 3082
;3081:
;3082:      if (G_BuildablesIntersect(buildable, origin, ent->s.modelindex, ent->s.origin))
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 G_BuildablesIntersect
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1278
line 3083
;3083:        return IBE_NOROOM;
CNSTI4 16
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1278
line 3084
;3084:    }
LABELV $1272
line 3077
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1274
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1271
line 3086
;3085:
;3086:    return IBE_NONE;
CNSTI4 0
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1266
line 3090
;3087:  }
;3088:
;3089:  // Set buildPoints to the number extra that are required
;3090:  buildPoints -= remainingBP;
ADDRLP4 28
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ASGNI4
line 3093
;3091:
;3092:  // Build a list of buildable entities
;3093:  for(i = MAX_CLIENTS, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1283
JUMPV
LABELV $1280
line 3094
;3094:  {
line 3095
;3095:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1285
line 3096
;3096:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1285
line 3098
;3097:
;3098:    collision = G_BuildablesIntersect(buildable, origin, ent->s.modelindex, ent->s.origin);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 G_BuildablesIntersect
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
ASGNI4
line 3100
;3099:
;3100:    if (collision)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1287
line 3101
;3101:      collisionCount++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1287
line 3104
;3102:
;3103:    // Check if this is a repeater and it's in range
;3104:    if (buildable == BA_H_REPEATER && buildable == ent->s.modelindex && Distance(
ADDRLP4 88
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 16
NEI4 $1289
ADDRLP4 88
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
NEI4 $1289
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 1140457472
GEF4 $1289
line 3106
;3105:      ent->s.origin, origin) < REPEATER_BASESIZE)
;3106:    {
line 3107
;3107:      repeaterInRange = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 3108
;3108:      repeaterInRangeCount++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3109
;3109:    }
ADDRGP4 $1290
JUMPV
LABELV $1289
line 3111
;3110:    else
;3111:      repeaterInRange = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1290
line 3113
;3112:
;3113:    if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1291
line 3114
;3114:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1291
line 3116
;3115:
;3116:    if (ent->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1293
line 3117
;3117:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1293
line 3119
;3118:
;3119:    if (ent->biteam != biteam)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
EQI4 $1295
line 3120
;3120:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1295
line 3123
;3121:
;3122:    // Don't allow destruction of hovel with granger inside
;3123:    if (ent->s.modelindex == BA_A_HOVEL && ent->active)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1297
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1297
line 3124
;3124:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1297
line 3128
;3125:
;3126:    // Explicitly disallow replacement of the core buildable with anything
;3127:    // other than the core buildable
;3128:    if (ent->s.modelindex == core && buildable != core)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1299
ADDRFP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1299
line 3129
;3129:      continue;
ADDRGP4 $1281
JUMPV
LABELV $1299
line 3131
;3130:
;3131:    if (ent->deconstruct)
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1301
line 3132
;3132:    {
line 3133
;3133:      level.markedBuildables[numBuildables++] = ent;
ADDRLP4 108
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+185140
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3135
;3134:
;3135:      if (collision || repeaterInRange)
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1306
ADDRLP4 20
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1304
LABELV $1306
line 3136
;3136:      {
line 3137
;3137:        if (collision)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1307
line 3138
;3138:          collisionCount--;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1307
line 3140
;3139:
;3140:        if (repeaterInRange)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1309
line 3141
;3141:          repeaterInRangeCount--;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1309
line 3143
;3142:
;3143:        pointsYielded += BG_FindBuildPointsForBuildable(ent->s.modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 116
INDIRI4
ADDI4
ASGNI4
line 3144
;3144:        level.numBuildablesForRemoval++;
ADDRLP4 120
ADDRGP4 level+189236
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3145
;3145:      }
ADDRGP4 $1305
JUMPV
LABELV $1304
line 3146
;3146:      else if (unique && ent->s.modelindex == buildable)
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1312
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1312
line 3147
;3147:      {
line 3149
;3148:        // If it's a unique buildable, it must be replaced by the same type
;3149:        pointsYielded += BG_FindBuildPointsForBuildable(ent->s.modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 116
INDIRI4
ADDI4
ASGNI4
line 3150
;3150:        level.numBuildablesForRemoval++;
ADDRLP4 120
ADDRGP4 level+189236
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3151
;3151:      }
LABELV $1312
LABELV $1305
line 3152
;3152:    }
LABELV $1301
line 3153
;3153:  }
LABELV $1281
line 3093
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1283
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1280
line 3156
;3154:
;3155:  // We still need build points, but have no candidates for removal
;3156:  if (buildPoints > 0 && numBuildables == 0)
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 80
INDIRI4
LEI4 $1315
ADDRLP4 24
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1315
line 3157
;3157:    return bpError;
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1315
line 3160
;3158:
;3159:  // Collided with something we can't remove
;3160:  if (collisionCount > 0)
ADDRLP4 36
INDIRI4
CNSTI4 0
LEI4 $1317
line 3161
;3161:    return IBE_NOROOM;
CNSTI4 16
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1317
line 3164
;3162:
;3163:  // There are one or more repeaters we can't remove
;3164:  if (repeaterInRangeCount > 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
LEI4 $1319
line 3165
;3165:    return IBE_RPTWARN2;
CNSTI4 12
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1319
line 3168
;3166:
;3167:  // Sort the list
;3168:  cmpBuildable = buildable;
ADDRGP4 cmpBuildable
ADDRFP4 0
INDIRI4
ASGNI4
line 3169
;3169:  VectorCopy(origin, cmpOrigin);
ADDRGP4 cmpOrigin
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3170
;3170:  qsort(
ADDRGP4 level+185140
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 G_CompareBuildablesForRemoval
ARGP4
ADDRGP4 qsort
CALLV
pop
line 3175
;3171:    level.markedBuildables, numBuildables, sizeof(level.markedBuildables[0]),
;3172:    G_CompareBuildablesForRemoval);
;3173:
;3174:  // Determine if there are enough markees to yield the required BP
;3175:  for(;pointsYielded < buildPoints && level.numBuildablesForRemoval < numBuildables;level.numBuildablesForRemoval++)
ADDRGP4 $1326
JUMPV
LABELV $1323
line 3176
;3176:  {
line 3177
;3177:    ent = level.markedBuildables[level.numBuildablesForRemoval];
ADDRLP4 0
ADDRGP4 level+189236
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+185140
ADDP4
INDIRP4
ASGNP4
line 3178
;3178:    pointsYielded += BG_FindBuildPointsForBuildable(ent->s.modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
ASGNI4
line 3179
;3179:  }
LABELV $1324
line 3175
ADDRLP4 84
ADDRGP4 level+189236
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1326
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $1331
ADDRGP4 level+189236
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $1323
LABELV $1331
line 3182
;3180:
;3181:  // Make sure we're not removing the last spawn
;3182:  for(i = 0;i < level.numBuildablesForRemoval;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1335
JUMPV
LABELV $1332
line 3183
;3183:  {
line 3184
;3184:    if (level.markedBuildables[i]->s.modelindex == spawn)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+185140
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1337
line 3185
;3185:      spawnCount++;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1337
line 3186
;3186:  }
LABELV $1333
line 3182
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1335
ADDRLP4 4
INDIRI4
ADDRGP4 level+189236
INDIRI4
LTI4 $1332
line 3187
;3187:  if (!g_cheats.integer && remainingSpawns > 0 && (remainingSpawns - spawnCount) < 1)
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $1340
ADDRLP4 92
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $1340
ADDRLP4 92
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
CNSTI4 1
GEI4 $1340
line 3188
;3188:    return IBE_NORMAL;
CNSTI4 15
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1340
line 3191
;3189:
;3190:  // Not enough points yielded
;3191:  if (pointsYielded < buildPoints)
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $1343
line 3192
;3192:    return bpError;
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $1256
JUMPV
LABELV $1343
line 3194
;3193:
;3194:  return IBE_NONE;
CNSTI4 0
RETI4
LABELV $1256
endproc G_SufficientBPAvailable 124 16
proc G_SetBuildableLinkState 8 4
line 3206
;3195:}
;3196:
;3197:/*
;3198: ================
;3199: G_SetBuildableLinkState
;3200:
;3201: Links or unlinks all the buildable entities
;3202: ================
;3203: */
;3204:static void
;3205:G_SetBuildableLinkState(qboolean link)
;3206:{
line 3210
;3207:  int i;
;3208:  gentity_t *ent;
;3209:
;3210:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1349
JUMPV
LABELV $1346
line 3211
;3211:  {
line 3212
;3212:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1351
line 3213
;3213:      continue;
ADDRGP4 $1347
JUMPV
LABELV $1351
line 3215
;3214:
;3215:    if (link)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1353
line 3216
;3216:      trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
ADDRGP4 $1354
JUMPV
LABELV $1353
line 3218
;3217:    else
;3218:      trap_UnlinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
LABELV $1354
line 3219
;3219:  }
LABELV $1347
line 3210
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1349
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1346
line 3220
;3220:}
LABELV $1345
endproc G_SetBuildableLinkState 8 4
proc G_SetBuildableMarkedLinkState 8 4
line 3224
;3221:
;3222:static void
;3223:G_SetBuildableMarkedLinkState(qboolean link)
;3224:{
line 3228
;3225:  int i;
;3226:  gentity_t *ent;
;3227:
;3228:  for(i = 0;i < level.numBuildablesForRemoval;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1359
JUMPV
LABELV $1356
line 3229
;3229:  {
line 3230
;3230:    ent = level.markedBuildables[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+185140
ADDP4
INDIRP4
ASGNP4
line 3231
;3231:    if (link)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1362
line 3232
;3232:      trap_LinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
ADDRGP4 $1363
JUMPV
LABELV $1362
line 3234
;3233:    else
;3234:      trap_UnlinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
LABELV $1363
line 3235
;3235:  }
LABELV $1357
line 3228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1359
ADDRLP4 0
INDIRI4
ADDRGP4 level+189236
INDIRI4
LTI4 $1356
line 3236
;3236:}
LABELV $1355
endproc G_SetBuildableMarkedLinkState 8 4
export G_CanBuild
proc G_CanBuild 344 28
line 3247
;3237:
;3238:/*
;3239: ================
;3240: G_CanBuild
;3241:
;3242: Checks to see if a buildable can be built
;3243: ================
;3244: */
;3245:itemBuildError_t
;3246:G_CanBuild(gentity_t *ent, buildable_t buildable, int distance, vec3_t origin)
;3247:{
line 3253
;3248:  vec3_t angles;
;3249:  vec3_t entity_origin, normal;
;3250:  vec3_t mins, maxs;
;3251:  trace_t tr1, tr2, tr3;
;3252:  int i;
;3253:  itemBuildError_t reason = IBE_NONE;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3258
;3254:  gentity_t *tempent;
;3255:  float minNormal;
;3256:  qboolean invert;
;3257:  int contents;
;3258:  playerState_t *ps = &ent->client->ps;
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 3263
;3259:  int buildPoints;
;3260:  itemBuildError_t tempReason;
;3261:  int biteam;
;3262:
;3263:  if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1365
line 3264
;3264:  {
line 3265
;3265:    return IBE_PERMISSION;
CNSTI4 17
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1365
line 3268
;3266:  }
;3267:
;3268:  if (ent && ent->client && g_ctn.integer > 0)
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
CNSTU4 0
ASGNU4
ADDRLP4 280
INDIRP4
CVPU4 4
ADDRLP4 284
INDIRU4
EQU4 $1368
ADDRLP4 280
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 284
INDIRU4
EQU4 $1368
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $1368
line 3269
;3269:  {
line 3270
;3270:    switch(buildable)
ADDRLP4 288
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 9
LTI4 $1371
ADDRLP4 288
INDIRI4
CNSTI4 16
GTI4 $1371
ADDRLP4 288
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1379-36
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1379
address $1378
address $1374
address $1374
address $1374
address $1374
address $1374
address $1378
address $1378
code
line 3271
;3271:    {
LABELV $1374
line 3277
;3272:      case BA_H_MGTURRET:
;3273:      case BA_H_TESLAGEN:
;3274:      case BA_H_ARMOURY:
;3275:      case BA_H_DCC:
;3276:      case BA_H_MEDISTAT:
;3277:        if (ent->ctn_build_count >= g_ctnbuildlimit.integer)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ADDRGP4 g_ctnbuildlimit+12
INDIRI4
LTI4 $1372
line 3278
;3278:        {
line 3279
;3279:          return IBE_PERMISSION;
CNSTI4 17
RETI4
ADDRGP4 $1364
JUMPV
line 3281
;3280:        }
;3281:        break;
LABELV $1378
line 3285
;3282:      case BA_H_REACTOR:
;3283:      case BA_H_REPEATER:
;3284:      case BA_H_SPAWN:
;3285:        return IBE_PERMISSION;
CNSTI4 17
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1371
line 3287
;3286:      default:
;3287:        return IBE_PERMISSION;
CNSTI4 17
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1372
line 3289
;3288:    }
;3289:  }
LABELV $1368
line 3291
;3290:
;3291:  if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1381
line 3292
;3292:  {
line 3293
;3293:    biteam = BIT_HUMANS;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 3294
;3294:  }
ADDRGP4 $1382
JUMPV
LABELV $1381
line 3296
;3295:  else
;3296:  {
line 3297
;3297:    biteam = BIT_ALIENS;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 3298
;3298:  }
LABELV $1382
line 3301
;3299:
;3300:  // Stop all buildables from interacting with traces
;3301:  G_SetBuildableLinkState(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableLinkState
CALLV
pop
line 3303
;3302:
;3303:  BG_FindBBoxForBuildable(buildable, mins, maxs);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 3305
;3304:
;3305:  BG_PositionBuildableRelativeToPlayer(ps, mins, maxs, trap_Trace, entity_origin, angles, &tr1);
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 trap_Trace
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 BG_PositionBuildableRelativeToPlayer
CALLV
pop
line 3307
;3306:
;3307:  trap_Trace(&tr2, entity_origin, mins, maxs, entity_origin, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 132
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
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
line 3308
;3308:  trap_Trace(&tr3, ps->origin, NULL, NULL, entity_origin, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 192
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 288
CNSTP4 0
ASGNP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 288
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
line 3310
;3309:
;3310:  VectorCopy(entity_origin, origin);
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 3312
;3311:
;3312:  VectorCopy(tr1.plane.normal, normal);
ADDRLP4 88
ADDRLP4 28+24
INDIRB
ASGNB 12
line 3313
;3313:  minNormal = BG_FindMinNormalForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 292
ADDRGP4 BG_FindMinNormalForBuildable
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 292
INDIRF4
ASGNF4
line 3314
;3314:  invert = BG_FindInvertNormalForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 BG_FindInvertNormalForBuildable
CALLI4
ASGNI4
ADDRLP4 252
ADDRLP4 296
INDIRI4
ASGNI4
line 3317
;3315:
;3316:  //can we build at this angle?
;3317:  if (!(normal[2] >= minNormal || (invert && normal[2] <= -minNormal)))
ADDRLP4 88+8
INDIRF4
ADDRLP4 124
INDIRF4
GEF4 $1384
ADDRLP4 252
INDIRI4
CNSTI4 0
EQI4 $1388
ADDRLP4 88+8
INDIRF4
ADDRLP4 124
INDIRF4
NEGF4
LEF4 $1384
LABELV $1388
line 3318
;3318:    reason = IBE_NORMAL;
ADDRLP4 8
CNSTI4 15
ASGNI4
LABELV $1384
line 3320
;3319:
;3320:  if (tr1.entityNum != ENTITYNUM_WORLD)
ADDRLP4 28+52
INDIRI4
CNSTI4 1022
EQI4 $1389
line 3321
;3321:    reason = IBE_NORMAL;
ADDRLP4 8
CNSTI4 15
ASGNI4
LABELV $1389
line 3323
;3322:
;3323:  contents = trap_PointContents(entity_origin, -1);
ADDRLP4 12
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 304
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 304
INDIRI4
ASGNI4
line 3324
;3324:  buildPoints = BG_FindBuildPointsForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 276
ADDRLP4 308
INDIRI4
ASGNI4
line 3326
;3325:
;3326:  if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS || ent->client->ps.stats[STAT_PTEAM]
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $1394
ADDRLP4 312
INDIRI4
CNSTI4 1
NEI4 $1392
LABELV $1394
line 3328
;3327:      == PTE_ALIENS)
;3328:  {
line 3330
;3329:    //human criteria
;3330:    if (!G_IsPowered(entity_origin, biteam))
ADDRLP4 12
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 G_IsPowered
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
NEI4 $1395
line 3331
;3331:    {
line 3333
;3332:      //tell player to build a repeater to provide power
;3333:      if (buildable != BA_H_REACTOR && buildable != BA_H_REPEATER)
ADDRLP4 320
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 15
EQI4 $1397
ADDRLP4 320
INDIRI4
CNSTI4 16
EQI4 $1397
line 3334
;3334:        reason = IBE_REPEATER;
ADDRLP4 8
CNSTI4 9
ASGNI4
LABELV $1397
line 3335
;3335:    }
LABELV $1395
line 3338
;3336:
;3337:    //this buildable requires a DCC
;3338:    if (BG_FindDCCTestForBuildable(buildable) && !G_IsDCCBuilt(biteam))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 BG_FindDCCTestForBuildable
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $1399
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 G_IsDCCBuilt
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
NEI4 $1399
line 3339
;3339:      reason = IBE_NODCC;
ADDRLP4 8
CNSTI4 14
ASGNI4
LABELV $1399
line 3342
;3340:
;3341:    //check that there is a parent reactor when building a repeater
;3342:    if (buildable == BA_H_REPEATER)
ADDRFP4 4
INDIRI4
CNSTI4 16
NEI4 $1401
line 3343
;3343:    {
line 3344
;3344:      for(i = 1, tempent = g_entities + i;i < level.num_entities;i++, tempent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1406
JUMPV
LABELV $1403
line 3345
;3345:      {
line 3346
;3346:        if (tempent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1408
line 3347
;3347:          continue;
ADDRGP4 $1404
JUMPV
LABELV $1408
line 3349
;3348:
;3349:        if (tempent->s.modelindex == BA_H_REACTOR)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1410
line 3350
;3350:          break;
ADDRGP4 $1405
JUMPV
LABELV $1410
line 3351
;3351:      }
LABELV $1404
line 3344
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1406
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1403
LABELV $1405
line 3353
;3352:
;3353:      if (i >= level.num_entities)
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1412
line 3354
;3354:      {
line 3358
;3355:        //no reactor present
;3356:
;3357:        //check for other nearby repeaters
;3358:        for(i = 1, tempent = g_entities + i;i < level.num_entities;i++, tempent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1418
JUMPV
LABELV $1415
line 3359
;3359:        {
line 3360
;3360:          if (tempent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1420
line 3361
;3361:            continue;
ADDRGP4 $1416
JUMPV
LABELV $1420
line 3363
;3362:
;3363:          if (tempent->s.modelindex == BA_H_REPEATER && Distance(tempent->s.origin, entity_origin)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 16
NEI4 $1422
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 332
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 332
INDIRF4
CNSTF4 1140457472
GEF4 $1422
line 3365
;3364:              < REPEATER_BASESIZE)
;3365:          {
line 3366
;3366:            reason = IBE_RPTWARN2;
ADDRLP4 8
CNSTI4 12
ASGNI4
line 3367
;3367:            break;
ADDRGP4 $1417
JUMPV
LABELV $1422
line 3369
;3368:          }
;3369:        }
LABELV $1416
line 3358
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1418
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1415
LABELV $1417
line 3371
;3370:
;3371:        if (reason == IBE_NONE)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1413
line 3372
;3372:          reason = IBE_RPTWARN;
ADDRLP4 8
CNSTI4 11
ASGNI4
line 3373
;3373:      }
ADDRGP4 $1413
JUMPV
LABELV $1412
line 3374
;3374:      else if (G_IsPowered(entity_origin, biteam))
ADDRLP4 12
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 G_IsPowered
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1426
line 3375
;3375:        reason = IBE_RPTWARN2;
ADDRLP4 8
CNSTI4 12
ASGNI4
LABELV $1426
LABELV $1413
line 3376
;3376:    }
LABELV $1401
line 3379
;3377:
;3378:    //check permission to build here
;3379:    if (tr1.surfaceFlags & SURF_NOHUMANBUILD || tr1.surfaceFlags & SURF_NOBUILD || contents
ADDRLP4 328
CNSTI4 0
ASGNI4
ADDRLP4 28+44
INDIRI4
CNSTI4 1048576
BANDI4
ADDRLP4 328
INDIRI4
NEI4 $1434
ADDRLP4 28+44
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 328
INDIRI4
NEI4 $1434
ADDRLP4 332
ADDRLP4 256
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 328
INDIRI4
NEI4 $1434
ADDRLP4 332
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 328
INDIRI4
EQI4 $1428
LABELV $1434
line 3381
;3380:        & CONTENTS_NOHUMANBUILD || contents & CONTENTS_NOBUILD)
;3381:      reason = IBE_PERMISSION;
ADDRLP4 8
CNSTI4 17
ASGNI4
LABELV $1428
line 3384
;3382:
;3383:    //can we only build one of these?
;3384:    if (BG_FindUniqueTestForBuildable(buildable))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 BG_FindUniqueTestForBuildable
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $1435
line 3385
;3385:    {
line 3386
;3386:      for(i = 1, tempent = g_entities + i;i < level.num_entities;i++, tempent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1440
JUMPV
LABELV $1437
line 3387
;3387:      {
line 3388
;3388:        if (tempent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1442
line 3389
;3389:          continue;
ADDRGP4 $1438
JUMPV
LABELV $1442
line 3391
;3390:
;3391:        if (tempent->s.modelindex == BA_H_REACTOR && !tempent->deconstruct && (tempent->biteam
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1444
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1444
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1444
line 3393
;3392:            == biteam))
;3393:        {
line 3394
;3394:          reason = IBE_REACTOR;
ADDRLP4 8
CNSTI4 8
ASGNI4
line 3395
;3395:          break;
ADDRGP4 $1439
JUMPV
LABELV $1444
line 3397
;3396:        }
;3397:      }
LABELV $1438
line 3386
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1440
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1437
LABELV $1439
line 3398
;3398:    }
LABELV $1435
line 3399
;3399:  }
LABELV $1392
line 3401
;3400:
;3401:  if ((tempReason = G_SufficientBPAvailable(buildable, origin, biteam)) != IBE_NONE)
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 G_SufficientBPAvailable
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 316
INDIRI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $1446
line 3402
;3402:    reason = tempReason;
ADDRLP4 8
ADDRLP4 260
INDIRI4
ASGNI4
LABELV $1446
line 3405
;3403:
;3404:  // Relink buildables
;3405:  G_SetBuildableLinkState(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableLinkState
CALLV
pop
line 3408
;3406:
;3407:  //check there is enough room to spawn from (presuming this is a spawn)
;3408:  if (reason == IBE_NONE)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1448
line 3409
;3409:  {
line 3410
;3410:    G_SetBuildableMarkedLinkState(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 G_SetBuildableMarkedLinkState
CALLV
pop
line 3411
;3411:    if (G_CheckSpawnPoint(ENTITYNUM_NONE, origin, normal, buildable, NULL) != NULL)
CNSTI4 1023
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 320
ADDRGP4 G_CheckSpawnPoint
CALLP4
ASGNP4
ADDRLP4 320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1450
line 3412
;3412:      reason = IBE_NORMAL;
ADDRLP4 8
CNSTI4 15
ASGNI4
LABELV $1450
line 3413
;3413:    G_SetBuildableMarkedLinkState(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 G_SetBuildableMarkedLinkState
CALLV
pop
line 3414
;3414:  }
LABELV $1448
line 3417
;3415:
;3416:  //this item does not fit here
;3417:  if (reason == IBE_NONE && (tr2.fraction < 1.0 || tr3.fraction < 1.0))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1452
ADDRLP4 320
CNSTF4 1065353216
ASGNF4
ADDRLP4 132+8
INDIRF4
ADDRLP4 320
INDIRF4
LTF4 $1456
ADDRLP4 192+8
INDIRF4
ADDRLP4 320
INDIRF4
GEF4 $1452
LABELV $1456
line 3418
;3418:    return IBE_NOROOM;
CNSTI4 16
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1452
line 3420
;3419:
;3420:  if (reason != IBE_NONE)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1457
line 3421
;3421:    level.numBuildablesForRemoval = 0;
ADDRGP4 level+189236
CNSTI4 0
ASGNI4
LABELV $1457
line 3423
;3422:
;3423:  return reason;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1364
endproc G_CanBuild 344 28
export G_BuildingExists
proc G_BuildingExists 12 0
line 3433
;3424:}
;3425:
;3426:/*
;3427: ==============
;3428: G_BuildingExists
;3429: ==============
;3430: */
;3431:qboolean
;3432:G_BuildingExists(int bclass)
;3433:{
line 3437
;3434:  int i;
;3435:  gentity_t *tempent;
;3436:  //look for an Armoury
;3437:  for(i = 1, tempent = g_entities + i;i < level.num_entities;i++, tempent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1464
JUMPV
LABELV $1461
line 3438
;3438:  {
line 3439
;3439:    if (tempent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1466
line 3440
;3440:      continue;
ADDRGP4 $1462
JUMPV
LABELV $1466
line 3441
;3441:    if (tempent->s.modelindex == bclass && tempent->health > 0)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1468
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1468
line 3442
;3442:    {
line 3443
;3443:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1460
JUMPV
LABELV $1468
line 3445
;3444:    }
;3445:  }
LABELV $1462
line 3437
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1464
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1461
line 3446
;3446:  return qfalse;
CNSTI4 0
RETI4
LABELV $1460
endproc G_BuildingExists 12 0
proc G_Build 188 20
line 3458
;3447:}
;3448:
;3449:/*
;3450: ================
;3451: G_Build
;3452:
;3453: Spawns a buildable
;3454: ================
;3455: */
;3456:static gentity_t *
;3457:G_Build(gentity_t *builder, buildable_t buildable, vec3_t origin, vec3_t angles)
;3458:{
line 3464
;3459:  gentity_t *built;
;3460:  buildHistory_t *new;
;3461:  vec3_t normal;
;3462:
;3463:  // initialise the buildhistory so other functions can use it
;3464:  if (builder && builder->client)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1471
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1471
line 3465
;3465:  {
line 3466
;3466:    new = G_Alloc(sizeof(buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 28
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 3467
;3467:    G_LogBuild(new);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 3468
;3468:  }
LABELV $1471
line 3471
;3469:
;3470:  // Free existing buildables
;3471:  G_FreeMarkedBuildables();
ADDRGP4 G_FreeMarkedBuildables
CALLV
pop
line 3474
;3472:
;3473:  //spawn the buildable
;3474:  built = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 3475
;3475:  built->builder = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
CNSTP4 0
ASGNP4
line 3476
;3476:  if (builder && builder->client)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1473
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1473
line 3477
;3477:  {
line 3478
;3478:    built->builder = builder;
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3479
;3479:    builder->ctn_build_count++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3480
;3480:  }
LABELV $1473
line 3482
;3481:
;3482:  built->s.eType = ET_BUILDABLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 3484
;3483:
;3484:  built->classname = BG_FindEntityNameForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_FindEntityNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 3486
;3485:
;3486:  built->s.modelindex = buildable; //so we can tell what this is on the client side
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3488
;3487:
;3488:  built->biteam = built->s.modelindex2 = BG_FindTeamForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 3490
;3489:
;3490:  built->survivalStage = level.survivalStage;
ADDRLP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRGP4 level+173912
INDIRI4
ASGNI4
line 3492
;3491:
;3492:  if (builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1476
line 3493
;3493:  {
line 3494
;3494:    if (builder->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1478
line 3495
;3495:    {
line 3496
;3496:      built->biteam = built->s.modelindex2 = BIT_HUMANS;
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 3497
;3497:    }
LABELV $1478
line 3498
;3498:    if (builder->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1480
line 3499
;3499:    {
line 3500
;3500:      built->biteam = built->s.modelindex2 = BIT_ALIENS;
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 3501
;3501:    }
LABELV $1480
line 3502
;3502:  }
LABELV $1476
line 3504
;3503:
;3504:  BG_FindBBoxForBuildable(buildable, built->r.mins, built->r.maxs);
ADDRFP4 4
INDIRI4
ARGI4
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
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 3507
;3505:
;3506:  // detect the buildable's normal vector
;3507:  if (!builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1482
line 3508
;3508:  {
line 3511
;3509:    // initial base layout created by server
;3510:
;3511:    if (builder->s.origin2[0] || builder->s.origin2[1] || builder->s.origin2[2])
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $1487
ADDRLP4 56
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $1487
ADDRLP4 56
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
EQF4 $1484
LABELV $1487
line 3512
;3512:    {
line 3513
;3513:      VectorCopy(builder->s.origin2, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 3514
;3514:    }
ADDRGP4 $1483
JUMPV
LABELV $1484
line 3515
;3515:    else if (BG_FindTrajectoryForBuildable(buildable) == TR_BUOYANCY)
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindTrajectoryForBuildable
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 6
NEI4 $1488
line 3516
;3516:      VectorSet(normal, 0.0f, 0.0f, -1.0f);
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $1483
JUMPV
LABELV $1488
line 3517
;3517:else      VectorSet(normal, 0.0f, 0.0f, 1.0f);
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 3518
;3518:    }
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3520
;3519:    else
;3520:    {
line 3523
;3521:      // in-game building by a player
;3522:
;3523:      if (builder->client->ps.stats[ STAT_STATE ] & SS_WALLCLIMBING)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1494
line 3524
;3524:      {
line 3525
;3525:        if (builder->client->ps.stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1496
line 3526
;3526:        VectorSet(normal, 0.0f, 0.0f, -1.0f);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $1495
JUMPV
LABELV $1496
line 3528
;3527:        else
;3528:        VectorCopy(builder->client->ps.grapplePoint, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3529
;3529:      }
ADDRGP4 $1495
JUMPV
LABELV $1494
line 3531
;3530:      else
;3531:      VectorSet(normal, 0.0f, 0.0f, 1.0f);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
LABELV $1495
line 3532
;3532:    }
LABELV $1483
line 3536
;3533:
;3534:    // when building the initial layout, spawn the entity slightly off its
;3535:    // target surface so that it can be "dropped" onto it
;3536:    if (!builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1502
line 3537
;3537:    VectorMA(origin, 1.0f, normal, origin);
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1502
line 3539
;3538:
;3539:    built->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 3541
;3540:
;3541:    built->splashDamage = BG_FindSplashDamageForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindSplashDamageForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 3542
;3542:    built->splashRadius = BG_FindSplashRadiusForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindSplashRadiusForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 3543
;3543:    built->splashMethodOfDeath = BG_FindMODForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FindMODForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 3545
;3544:
;3545:    built->nextthink = BG_FindNextThinkForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 3547
;3546:
;3547:    built->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 3548
;3548:    built->spawned = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 3549
;3549:    built->buildTime = built->s.time = level.time;
ADDRLP4 88
ADDRGP4 level+28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 3550
;3550:    built->spawnBlockTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 0
ASGNI4
line 3551
;3551:    built->antispawncamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 3554
;3552:
;3553:    // build instantly in cheat mode
;3554:    if (builder->client && g_cheats.integer)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1508
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
EQI4 $1508
line 3555
;3555:    {
line 3556
;3556:      built->health = BG_FindHealthForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FindHealthForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 3557
;3557:      built->buildTime = built->s.time =
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_FindBuildTimeForBuildable
CALLI4
ASGNI4
ADDRLP4 104
ADDRGP4 level+28
INDIRI4
ADDRLP4 96
INDIRI4
SUBI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 3559
;3558:      level.time - BG_FindBuildTimeForBuildable(buildable);
;3559:    }
LABELV $1508
line 3562
;3560:
;3561:    //things that vary for each buildable that aren't in the dbase
;3562:    switch (buildable)
ADDRLP4 92
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $1513
ADDRLP4 92
INDIRI4
CNSTI4 16
GTI4 $1513
ADDRLP4 92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1531-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1531
address $1515
address $1521
address $1516
address $1518
address $1520
address $1517
address $1519
address $1522
address $1523
address $1524
address $1525
address $1526
address $1527
address $1528
address $1529
address $1530
code
line 3563
;3563:    {
LABELV $1515
line 3565
;3564:      case BA_A_SPAWN:
;3565:      built->die = ASpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ASpawn_Die
ASGNP4
line 3566
;3566:      built->think = ASpawn_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ASpawn_Think
ASGNP4
line 3567
;3567:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3568
;3568:      break;
ADDRGP4 $1513
JUMPV
LABELV $1516
line 3571
;3569:
;3570:      case BA_A_BARRICADE:
;3571:      built->die = ABarricade_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ABarricade_Die
ASGNP4
line 3572
;3572:      built->think = ABarricade_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ABarricade_Think
ASGNP4
line 3573
;3573:      built->pain = ABarricade_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ABarricade_Pain
ASGNP4
line 3574
;3574:      break;
ADDRGP4 $1513
JUMPV
LABELV $1517
line 3577
;3575:
;3576:      case BA_A_BOOSTER:
;3577:      built->die = ABarricade_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ABarricade_Die
ASGNP4
line 3578
;3578:      built->think = ABarricade_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ABarricade_Think
ASGNP4
line 3579
;3579:      built->pain = ABarricade_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ABarricade_Pain
ASGNP4
line 3580
;3580:      built->touch = ABooster_Touch;
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 ABooster_Touch
ASGNP4
line 3581
;3581:      break;
ADDRGP4 $1513
JUMPV
LABELV $1518
line 3584
;3582:
;3583:      case BA_A_ACIDTUBE:
;3584:      built->die = ABarricade_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ABarricade_Die
ASGNP4
line 3585
;3585:      built->think = AAcidTube_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AAcidTube_Think
ASGNP4
line 3586
;3586:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3587
;3587:      break;
ADDRGP4 $1513
JUMPV
LABELV $1519
line 3590
;3588:
;3589:      case BA_A_HIVE:
;3590:      built->die = ABarricade_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ABarricade_Die
ASGNP4
line 3591
;3591:      built->think = AHive_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AHive_Think
ASGNP4
line 3592
;3592:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3593
;3593:      break;
ADDRGP4 $1513
JUMPV
LABELV $1520
line 3596
;3594:
;3595:      case BA_A_TRAPPER:
;3596:      built->die = ABarricade_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ABarricade_Die
ASGNP4
line 3597
;3597:      built->think = ATrapper_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ATrapper_Think
ASGNP4
line 3598
;3598:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3599
;3599:      break;
ADDRGP4 $1513
JUMPV
LABELV $1521
line 3602
;3600:
;3601:      case BA_A_OVERMIND:
;3602:      built->die = ASpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 ASpawn_Die
ASGNP4
line 3603
;3603:      built->think = AOvermind_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AOvermind_Think
ASGNP4
line 3604
;3604:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3605
;3605:      break;
ADDRGP4 $1513
JUMPV
LABELV $1522
line 3608
;3606:
;3607:      case BA_A_HOVEL:
;3608:      built->die = AHovel_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 AHovel_Die
ASGNP4
line 3609
;3609:      built->use = AHovel_Use;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 AHovel_Use
ASGNP4
line 3610
;3610:      built->think = AHovel_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AHovel_Think
ASGNP4
line 3611
;3611:      built->pain = ASpawn_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ASpawn_Pain
ASGNP4
line 3612
;3612:      break;
ADDRGP4 $1513
JUMPV
LABELV $1523
line 3615
;3613:
;3614:      case BA_H_SPAWN:
;3615:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3616
;3616:      built->think = HSpawn_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HSpawn_Think
ASGNP4
line 3617
;3617:      break;
ADDRGP4 $1513
JUMPV
LABELV $1524
line 3620
;3618:
;3619:      case BA_H_MGTURRET:
;3620:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3621
;3621:      built->think = HMGTurret_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HMGTurret_Think
ASGNP4
line 3622
;3622:      break;
ADDRGP4 $1513
JUMPV
LABELV $1525
line 3625
;3623:
;3624:      case BA_H_TESLAGEN:
;3625:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3626
;3626:      built->think = HTeslaGen_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HTeslaGen_Think
ASGNP4
line 3627
;3627:      break;
ADDRGP4 $1513
JUMPV
LABELV $1526
line 3630
;3628:
;3629:      case BA_H_ARMOURY:
;3630:      built->think = HArmoury_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HArmoury_Think
ASGNP4
line 3631
;3631:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3632
;3632:      built->use = HArmoury_Activate;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 HArmoury_Activate
ASGNP4
line 3633
;3633:      break;
ADDRGP4 $1513
JUMPV
LABELV $1527
line 3636
;3634:
;3635:      case BA_H_DCC:
;3636:      built->think = HDCC_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HDCC_Think
ASGNP4
line 3637
;3637:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3638
;3638:      break;
ADDRGP4 $1513
JUMPV
LABELV $1528
line 3641
;3639:
;3640:      case BA_H_MEDISTAT:
;3641:      built->think = HMedistat_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HMedistat_Think
ASGNP4
line 3642
;3642:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3643
;3643:      break;
ADDRGP4 $1513
JUMPV
LABELV $1529
line 3646
;3644:
;3645:      case BA_H_REACTOR:
;3646:      built->think = HReactor_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HReactor_Think
ASGNP4
line 3647
;3647:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3648
;3648:      built->use = HRepeater_Use;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 HRepeater_Use
ASGNP4
line 3649
;3649:      built->powered = built->active = qtrue;
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 3650
;3650:      break;
ADDRGP4 $1513
JUMPV
LABELV $1530
line 3653
;3651:
;3652:      case BA_H_REPEATER:
;3653:      built->think = HRepeater_Think;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HRepeater_Think
ASGNP4
line 3654
;3654:      built->die = HSpawn_Die;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 HSpawn_Die
ASGNP4
line 3655
;3655:      built->use = HRepeater_Use;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 HRepeater_Use
ASGNP4
line 3656
;3656:      built->count = -1;
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 -1
ASGNI4
line 3657
;3657:      break;
line 3661
;3658:
;3659:      default:
;3660:      //erk
;3661:      break;
LABELV $1513
line 3664
;3662:    }
;3663:
;3664:    built->s.number = built - g_entities;
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
line 3665
;3665:    built->r.contents = CONTENTS_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 3666
;3666:    built->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 3667
;3667:    built->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 3668
;3668:    built->s.weapon = BG_FindProjTypeForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindProjTypeForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 3670
;3669:
;3670:    if (builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1533
line 3671
;3671:    {
line 3672
;3672:      built->builtBy = builder->client->ps.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 976
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 3674
;3673:
;3674:      if (builder->client->pers.designatedBuilder)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1534
line 3675
;3675:      {
line 3676
;3676:        built->s.eFlags |= EF_DBUILDER; // designated builder protection
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 3677
;3677:      }
line 3678
;3678:    }
ADDRGP4 $1534
JUMPV
LABELV $1533
line 3680
;3679:    else
;3680:    built->builtBy = -1;
ADDRLP4 0
INDIRP4
CNSTI4 976
ADDP4
CNSTI4 -1
ASGNI4
LABELV $1534
line 3682
;3681:
;3682:    G_SetOrigin(built, origin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3685
;3683:
;3684:    // gently nudge the buildable onto the surface :)
;3685:    VectorScale(normal, -50.0f, built->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3259498496
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3259498496
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 3259498496
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 3686
;3686:    VectorSet(built->s.pos.trDelta,0,0,0);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 3689
;3687:
;3688:    // set turret angles
;3689:    VectorCopy(builder->s.angles2, built->s.angles2);
ADDRLP4 108
CNSTI4 128
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
INDIRB
ASGNB 12
line 3691
;3690:
;3691:    VectorCopy(angles, built->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 3692
;3692:    built->s.angles[ PITCH ] = 0.0f;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 3693
;3693:    built->s.angles2[ YAW ] = angles[ YAW ];
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 3694
;3694:    built->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 3696
;3695:
;3696:    built->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 3697
;3697:    built->physicsBounce = BG_FindBounceForBuildable(buildable);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_FindBounceForBuildable
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 112
INDIRF4
ASGNF4
line 3698
;3698:    built->s.groundEntityNum = -1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 3700
;3699:
;3700:    built->s.generic1 = (int) (((float) built->health /
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 BG_FindHealthForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTF4 1106771968
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 116
INDIRI4
CVIF4 4
DIVF4
MULF4
CVFI4 4
ASGNI4
line 3703
;3701:            (float) BG_FindHealthForBuildable(buildable)) * B_HEALTH_MASK);
;3702:
;3703:    if (built->s.generic1 < 0)
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1540
line 3704
;3704:    built->s.generic1 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
LABELV $1540
line 3706
;3705:
;3706:    if (BG_FindTeamForBuildable(built->s.modelindex) == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
NEI4 $1542
line 3707
;3707:    {
line 3708
;3708:      built->powered = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 1
ASGNI4
line 3709
;3709:      built->s.generic1 |= B_POWERED_TOGGLEBIT;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 3710
;3710:    }
ADDRGP4 $1543
JUMPV
LABELV $1542
line 3711
;3711:    else if ((built->powered = G_FindPower(built)))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 G_FindPower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1544
line 3712
;3712:    built->s.generic1 |= B_POWERED_TOGGLEBIT;
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $1544
LABELV $1543
line 3714
;3713:
;3714:    if ((built->dcced = G_FindDCC(built)))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_FindDCC
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1546
line 3715
;3715:    built->s.generic1 |= B_DCCED_TOGGLEBIT;
ADDRLP4 148
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
ASGNI4
LABELV $1546
line 3717
;3716:
;3717:    built->s.generic1 &= ~B_SPAWNED_TOGGLEBIT;
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 3719
;3718:
;3719:    VectorCopy(normal, built->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3721
;3720:
;3721:    G_AddEvent(built, EV_BUILD_CONSTRUCT, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3723
;3722:
;3723:    G_SetIdleBuildableAnim(built, BG_FindAnimForBuildable(buildable));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 BG_FindAnimForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRI4
ARGI4
ADDRGP4 G_SetIdleBuildableAnim
CALLV
pop
line 3725
;3724:
;3725:    if (built->builtBy >= 0)
ADDRLP4 0
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1548
line 3726
;3726:    G_SetBuildableAnim(built, BANIM_CONSTRUCT1, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 160
CNSTI4 1
ASGNI4
ADDRLP4 160
INDIRI4
ARGI4
ADDRLP4 160
INDIRI4
ARGI4
ADDRGP4 G_SetBuildableAnim
CALLV
pop
LABELV $1548
line 3728
;3727:
;3728:    trap_LinkEntity(built);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3730
;3729:
;3730:    if (builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1550
line 3731
;3731:    {
line 3732
;3732:      builder->client->pers.statscounters.structsbuilt++;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1076
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI2
CVII4 2
CNSTI4 1
ADDI4
CVII2 4
ASGNI2
line 3733
;3733:      if (builder->client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1552
line 3734
;3734:      {
line 3735
;3735:        level.alienStatsCounters.structsbuilt++;
ADDRLP4 168
ADDRGP4 level+190028+32
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3736
;3736:      }
ADDRGP4 $1553
JUMPV
LABELV $1552
line 3737
;3737:      else if (builder->client->pers.teamSelection == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1556
line 3738
;3738:      {
line 3739
;3739:        level.humanStatsCounters.structsbuilt++;
ADDRLP4 168
ADDRGP4 level+190108+32
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3740
;3740:      }
LABELV $1556
LABELV $1553
line 3741
;3741:    }
LABELV $1550
line 3743
;3742:
;3743:    if (builder->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1560
line 3744
;3744:    {
line 3745
;3745:      G_TeamCommand(builder->client->pers.teamSelection,
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $1562
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 3749
;3746:          va("print \"%s is ^2being built^7 by %s^7\n\"",
;3747:              BG_FindHumanNameForBuildable(built->s.modelindex),
;3748:              builder->client->pers.netname));
;3749:      G_LogPrintf("Build: %i %i 0: %s^7 is ^2building^7 %s\n",
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $1563
ARGP4
ADDRLP4 180
CNSTI4 516
ASGNI4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3754
;3750:          builder->client->ps.clientNum,
;3751:          built->s.modelindex,
;3752:          builder->client->pers.netname,
;3753:          BG_FindNameForBuildable(built->s.modelindex));
;3754:    }
LABELV $1560
line 3757
;3755:
;3756:    // ok we're all done building, so what we log here should be the final values
;3757:    if (builder && builder->client) // log ingame building only
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 164
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1564
ADDRLP4 164
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1564
line 3759
;3758:
;3759:    {
line 3760
;3760:      new = level.buildHistory;
ADDRLP4 16
ADDRGP4 level+189972
INDIRP4
ASGNP4
line 3761
;3761:      new->ID = (++level.lastBuildID > 1000) ? (level.lastBuildID = 1) : level.lastBuildID;
ADDRLP4 176
ADDRGP4 level+189976
ASGNP4
ADDRLP4 180
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 176
INDIRP4
ADDRLP4 180
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1000
LEI4 $1571
ADDRLP4 184
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 172
ADDRLP4 184
INDIRI4
ASGNI4
ADDRGP4 $1572
JUMPV
LABELV $1571
ADDRLP4 172
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $1572
ADDRLP4 16
INDIRP4
ADDRLP4 172
INDIRI4
ASGNI4
line 3762
;3762:      new->ent = builder;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3763
;3763:      new->name[ 0 ] = 0;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
line 3764
;3764:      new->buildable = buildable;
ADDRLP4 16
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3765
;3765:      VectorCopy(built->s.pos.trBase, new->origin);
ADDRLP4 16
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 3766
;3766:      VectorCopy(built->s.angles, new->angles);
ADDRLP4 16
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3767
;3767:      VectorCopy(built->s.origin2, new->origin2);
ADDRLP4 16
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 3768
;3768:      VectorCopy(built->s.angles2, new->angles2);
ADDRLP4 16
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 3769
;3769:      new->fate = BF_BUILT;
ADDRLP4 16
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 3770
;3770:    }
LABELV $1564
line 3772
;3771:
;3772:    if (builder && builder->client)
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $1573
ADDRLP4 172
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $1573
line 3773
;3773:    built->bdnumb = new->ID;
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
ADDRLP4 16
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $1574
JUMPV
LABELV $1573
line 3775
;3774:    else
;3775:    built->bdnumb = -1;
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
CNSTI4 -1
ASGNI4
LABELV $1574
line 3777
;3776:
;3777:    return built;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1470
endproc G_Build 188 20
export G_BuildIfValid
proc G_BuildIfValid 48 16
line 3787
;3778:  }
;3779:
;3780:  /*
;3781:   =================
;3782:   G_BuildIfValid
;3783:   =================
;3784:   */
;3785:qboolean
;3786:G_BuildIfValid(gentity_t *ent, buildable_t buildable)
;3787:{
line 3791
;3788:  float dist;
;3789:  vec3_t origin;
;3790:
;3791:  dist = BG_FindBuildDistForClass(ent->client->ps.stats[STAT_PCLASS]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindBuildDistForClass
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 3793
;3792:
;3793:  switch(G_CanBuild(ent, buildable, dist, origin))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 G_CanBuild
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $1577
ADDRLP4 20
INDIRI4
CNSTI4 17
GTI4 $1577
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1603
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1603
address $1579
address $1581
address $1583
address $1580
address $1599
address $1582
address $1584
address $1585
address $1592
address $1593
address $1600
address $1601
address $1602
address $1597
address $1598
address $1586
address $1594
address $1589
code
line 3794
;3794:  {
LABELV $1579
line 3796
;3795:    case IBE_NONE:
;3796:      G_Build(ent, buildable, origin, ent->s.apos.trBase);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 G_Build
CALLP4
pop
line 3797
;3797:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1580
line 3800
;3798:
;3799:    case IBE_NOASSERT:
;3800:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOASSERT);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3801
;3801:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1581
line 3804
;3802:
;3803:    case IBE_NOOVERMIND:
;3804:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOOVMND);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3805
;3805:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1582
line 3808
;3806:
;3807:    case IBE_NOCREEP:
;3808:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOCREEP);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3809
;3809:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1583
line 3812
;3810:
;3811:    case IBE_OVERMIND:
;3812:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_OVERMIND);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3813
;3813:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1584
line 3816
;3814:
;3815:    case IBE_HOVEL:
;3816:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_HOVEL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3817
;3817:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1585
line 3820
;3818:
;3819:    case IBE_HOVELEXIT:
;3820:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_HOVEL_EXIT);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3821
;3821:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1586
line 3824
;3822:
;3823:    case IBE_NORMAL:
;3824:      if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1587
line 3825
;3825:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_NORMAL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
ADDRGP4 $1588
JUMPV
LABELV $1587
line 3827
;3826:      else
;3827:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NORMAL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
LABELV $1588
line 3828
;3828:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1589
line 3831
;3829:
;3830:    case IBE_PERMISSION:
;3831:      if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1590
line 3832
;3832:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_NORMAL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
ADDRGP4 $1591
JUMPV
LABELV $1590
line 3834
;3833:      else
;3834:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NORMAL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
LABELV $1591
line 3835
;3835:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1592
line 3838
;3836:
;3837:    case IBE_REACTOR:
;3838:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_REACTOR);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3839
;3839:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1593
line 3842
;3840:
;3841:    case IBE_REPEATER:
;3842:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_REPEATER);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3843
;3843:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1594
line 3846
;3844:
;3845:    case IBE_NOROOM:
;3846:      if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1595
line 3847
;3847:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOROOM);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 31
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
ADDRGP4 $1596
JUMPV
LABELV $1595
line 3849
;3848:      else
;3849:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOROOM);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
LABELV $1596
line 3850
;3850:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1597
line 3853
;3851:
;3852:    case IBE_NOPOWER:
;3853:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOPOWER);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3854
;3854:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1598
line 3857
;3855:
;3856:    case IBE_NODCC:
;3857:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NODCC);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3858
;3858:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1599
line 3861
;3859:
;3860:    case IBE_SPWNWARN:
;3861:      G_TriggerMenu(ent->client->ps.clientNum, MN_A_SPWNWARN);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3862
;3862:      G_Build(ent, buildable, origin, ent->s.apos.trBase);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 G_Build
CALLP4
pop
line 3863
;3863:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1600
line 3866
;3864:
;3865:    case IBE_TNODEWARN:
;3866:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_TNODEWARN);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3867
;3867:      G_Build(ent, buildable, origin, ent->s.apos.trBase);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 G_Build
CALLP4
pop
line 3868
;3868:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1601
line 3871
;3869:
;3870:    case IBE_RPTWARN:
;3871:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_RPTWARN);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3872
;3872:      G_Build(ent, buildable, origin, ent->s.apos.trBase);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 G_Build
CALLP4
pop
line 3873
;3873:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1575
JUMPV
LABELV $1602
line 3876
;3874:
;3875:    case IBE_RPTWARN2:
;3876:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_RPTWARN2);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3877
;3877:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1575
JUMPV
line 3880
;3878:
;3879:    default:
;3880:      break;
LABELV $1577
line 3883
;3881:  }
;3882:
;3883:  return qfalse;
CNSTI4 0
RETI4
LABELV $1575
endproc G_BuildIfValid 48 16
proc G_FinishSpawningBuildable 132 28
line 3898
;3884:}
;3885:
;3886:/*
;3887: ================
;3888: G_FinishSpawningBuildable
;3889:
;3890: Traces down to find where an item should rest, instead of letting them
;3891: free fall from their spawn points
;3892: ================
;3893: *
;3894: * Seems to be only used on the load of map.
;3895: */
;3896:static void
;3897:G_FinishSpawningBuildable(gentity_t *ent)
;3898:{
line 3902
;3899:  trace_t tr;
;3900:  vec3_t dest;
;3901:  gentity_t *built;
;3902:  buildable_t buildable = ent->s.modelindex;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 3903
;3903:  int biteam = ent->biteam;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
line 3904
;3904:  int survivalStage = ent->survivalStage;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ASGNI4
line 3906
;3905:
;3906:  built = G_Build(ent, buildable, ent->s.pos.trBase, ent->s.angles);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 G_Build
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
ASGNP4
line 3907
;3907:  G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3909
;3908:
;3909:  built->biteam = built->s.modelindex2 = biteam;
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 3910
;3910:  built->survivalStage = survivalStage;
ADDRLP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 3911
;3911:  built->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 3912
;3912:  built->spawned = qtrue; //map entities are already spawned
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 1
ASGNI4
line 3913
;3913:  built->health = BG_FindHealthForBuildable(buildable);
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindHealthForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 3914
;3914:  built->s.generic1 |= B_SPAWNED_TOGGLEBIT;
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3916
;3915:  
;3916:  if (g_survival.integer && biteam == BIT_ALIENS && built->s.modelindex == BA_H_SPAWN)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1605
ADDRLP4 80
INDIRI4
CNSTI4 1
NEI4 $1605
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1605
line 3917
;3917:  {
line 3918
;3918:    built->s.eFlags ^= EF_NODRAW;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 256
BXORI4
ASGNI4
line 3919
;3919:    built->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 3920
;3920:  }
LABELV $1605
line 3923
;3921:
;3922:  // drop towards normal surface
;3923:  VectorScale(built->s.origin2, -4096.0f, dest);
ADDRLP4 112
CNSTF4 3313500160
ASGNF4
ADDRLP4 4
ADDRLP4 112
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 112
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3313500160
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
line 3924
;3924:  VectorAdd(dest, built->s.origin, dest);
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3926
;3925:
;3926:  trap_Trace(
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
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
ADDRLP4 4
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
line 3929
;3927:    &tr, built->s.origin, built->r.mins, built->r.maxs, dest, built->s.number, built->clipmask);
;3928:
;3929:  if (tr.startsolid)
ADDRLP4 16+4
INDIRI4
CNSTI4 0
EQI4 $1614
line 3930
;3930:  {
line 3931
;3931:    G_Printf(
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 128
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $1617
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 3934
;3932:      S_COLOR_YELLOW "G_FinishSpawningBuildable: %s startsolid at %s\n", built->classname, vtos(
;3933:        built->s.origin));
;3934:    G_FreeEntity(built);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3935
;3935:    return;
ADDRGP4 $1604
JUMPV
LABELV $1614
line 3939
;3936:  }
;3937:
;3938:  //point items in the correct direction
;3939:  VectorCopy(tr.plane.normal, built->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16+24
INDIRB
ASGNB 12
line 3942
;3940:
;3941:  // allow to ride movers
;3942:  built->s.groundEntityNum = tr.entityNum;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 16+52
INDIRI4
ASGNI4
line 3944
;3943:
;3944:  G_SetOrigin(built, tr.endpos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3946
;3945:
;3946:  trap_LinkEntity(built);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3947
;3947:}
LABELV $1604
endproc G_FinishSpawningBuildable 132 28
export G_SpawnBuildable
proc G_SpawnBuildable 0 0
line 3961
;3948:
;3949:/*
;3950: ============
;3951: G_SpawnBuildable
;3952:
;3953: Sets the clipping size and plants the object on the floor.
;3954:
;3955: Items can't be immediately dropped to floor, because they might
;3956: be on an entity that hasn't spawned yet.
;3957: ============
;3958: */
;3959:void
;3960:G_SpawnBuildable(gentity_t *ent, buildable_t buildable, int biteam, int survivalStage)
;3961:{
line 3965
;3962:  //buildable->biteam = BIT_ALIENS;
;3963:  //Lets convert
;3964:  //OM to RC
;3965:  if (buildable == 2)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1622
line 3966
;3966:  {
line 3967
;3967:    buildable = 15;
ADDRFP4 4
CNSTI4 15
ASGNI4
line 3968
;3968:    biteam = BIT_ALIENS;
ADDRFP4 8
CNSTI4 1
ASGNI4
line 3969
;3969:  }
LABELV $1622
line 3971
;3970:  //eggs to nodes
;3971:  if (buildable == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1624
line 3972
;3972:  {
line 3973
;3973:    buildable = 9;
ADDRFP4 4
CNSTI4 9
ASGNI4
line 3974
;3974:    biteam = BIT_ALIENS;
ADDRFP4 8
CNSTI4 1
ASGNI4
line 3975
;3975:  }
LABELV $1624
line 3977
;3976:  //acids to rets
;3977:  if (buildable == 4)
ADDRFP4 4
INDIRI4
CNSTI4 4
NEI4 $1626
line 3978
;3978:  {
line 3979
;3979:    buildable = 10;
ADDRFP4 4
CNSTI4 10
ASGNI4
line 3980
;3980:    biteam = BIT_ALIENS;
ADDRFP4 8
CNSTI4 1
ASGNI4
line 3981
;3981:  }
LABELV $1626
line 3983
;3982:  //barricade to arm
;3983:  if (buildable == 3)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1628
line 3984
;3984:  {
line 3985
;3985:    buildable = 12;
ADDRFP4 4
CNSTI4 12
ASGNI4
line 3986
;3986:    biteam = BIT_ALIENS;
ADDRFP4 8
CNSTI4 1
ASGNI4
line 3987
;3987:  }
LABELV $1628
line 3989
;3988:  //Cuando carga la layout normal bitteam no tiene valor.
;3989:  if (biteam != BIT_ALIENS) //< BIT_NONE || biteam > BIT_HUMANS)
ADDRFP4 8
INDIRI4
CNSTI4 1
EQI4 $1630
line 3990
;3990:  {
line 3995
;3991:    /*if(level.time < 10000)
;3992:     {
;3993:     trap_SendServerCommand( -1, "print \"Setting human biteam for build.!\n\"");
;3994:     }*/
;3995:    biteam = BIT_HUMANS;
ADDRFP4 8
CNSTI4 2
ASGNI4
line 3996
;3996:  }
LABELV $1630
line 3998
;3997:
;3998:  ent->s.modelindex = buildable;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3999
;3999:  ent->s.modelindex2 = biteam;
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4000
;4000:  ent->biteam = biteam;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4001
;4001:  ent->survivalStage = survivalStage;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 4007
;4002:
;4003:  //AP( va( "print \"^3Spawning Buildable %d\n\"", buildable) );
;4004:
;4005:  // some movers spawn on the second frame, so delay item
;4006:  // spawns until the third frame so they can ride trains
;4007:  ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 4008
;4008:  ent->think = G_FinishSpawningBuildable;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FinishSpawningBuildable
ASGNP4
line 4009
;4009:}
LABELV $1621
endproc G_SpawnBuildable 0 0
export G_CheckDBProtection
proc G_CheckDBProtection 24 0
line 4023
;4010:
;4011:/*
;4012: ============
;4013: G_CheckDBProtection
;4014: 
;4015: Count how many designated builders are in both teams and
;4016: if none found in some team, cancel protection for all
;4017: structures of that team
;4018: ============
;4019: */
;4020:
;4021:void
;4022:G_CheckDBProtection(void)
;4023:{
line 4024
;4024:  int alienDBs = 0, humanDBs = 0, i;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4028
;4025:  gentity_t *ent;
;4026:
;4027:  // count designated builders
;4028:  for(i = 0, ent = g_entities + i;i < level.maxclients;i++, ent++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1637
JUMPV
LABELV $1634
line 4029
;4029:  {
line 4030
;4030:    if (!ent->client || (ent->client->pers.connected != CON_CONNECTED))
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1641
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1639
LABELV $1641
line 4031
;4031:      continue;
ADDRGP4 $1635
JUMPV
LABELV $1639
line 4033
;4032:
;4033:    if (ent->client->pers.designatedBuilder)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1642
line 4034
;4034:    {
line 4035
;4035:      if (ent->client->pers.teamSelection == PTE_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1644
line 4036
;4036:      {
line 4037
;4037:        humanDBs++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4038
;4038:      }
ADDRGP4 $1645
JUMPV
LABELV $1644
line 4039
;4039:      else if (ent->client->pers.teamSelection == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1646
line 4040
;4040:      {
line 4041
;4041:        alienDBs++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4042
;4042:      }
LABELV $1646
LABELV $1645
line 4043
;4043:    }
LABELV $1642
line 4044
;4044:  }
LABELV $1635
line 4028
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1637
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1634
line 4047
;4045:
;4046:  // both teams have designate builders, we're done
;4047:  if (alienDBs > 0 && humanDBs > 0)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1648
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1648
line 4048
;4048:    return;
ADDRGP4 $1633
JUMPV
LABELV $1648
line 4051
;4049:
;4050:  // cancel protection if needed
;4051:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1653
JUMPV
LABELV $1650
line 4052
;4052:  {
line 4053
;4053:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1655
line 4054
;4054:      continue;
ADDRGP4 $1651
JUMPV
LABELV $1655
line 4056
;4055:
;4056:    if ((!alienDBs && ent->biteam == BIT_ALIENS) || (!humanDBs && ent->biteam == BIT_HUMANS))
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1660
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1659
LABELV $1660
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1657
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1657
LABELV $1659
line 4057
;4057:    {
line 4058
;4058:      ent->s.eFlags &= ~EF_DBUILDER;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 4059
;4059:    }
LABELV $1657
line 4060
;4060:  }
LABELV $1651
line 4051
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $1653
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1650
line 4061
;4061:}
LABELV $1633
endproc G_CheckDBProtection 24 0
export G_LayoutSave
proc G_LayoutSave 356 64
line 4071
;4062:
;4063:/*
;4064: ============
;4065: G_LayoutSave
;4066:
;4067: ============
;4068: */
;4069:void
;4070:G_LayoutSave(char *name)
;4071:{
line 4080
;4072:  char map[MAX_QPATH];
;4073:  char fileName[MAX_OSPATH];
;4074:  fileHandle_t f;
;4075:  int len;
;4076:  int i;
;4077:  gentity_t *ent;
;4078:  char *s;
;4079:
;4080:  trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1662
ARGP4
ADDRLP4 272
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4081
;4081:  if (!map[0])
ADDRLP4 272
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1663
line 4082
;4082:  {
line 4083
;4083:    G_Printf("LayoutSave( ): no map is loaded\n");
ADDRGP4 $1665
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4084
;4084:    return;
ADDRGP4 $1661
JUMPV
LABELV $1663
line 4086
;4085:  }
;4086:  Com_sprintf(fileName, sizeof(fileName), "layouts/%s/%s.dat", map, name);
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1666
ARGP4
ADDRLP4 272
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4088
;4087:
;4088:  len = trap_FS_FOpenFile(fileName, &f, FS_WRITE);
ADDRLP4 16
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 340
INDIRI4
ASGNI4
line 4089
;4089:  if (len < 0)
ADDRLP4 336
INDIRI4
CNSTI4 0
GEI4 $1667
line 4090
;4090:  {
line 4091
;4091:    G_Printf("layoutsave: could not open %s\n", fileName);
ADDRGP4 $1669
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4092
;4092:    return;
ADDRGP4 $1661
JUMPV
LABELV $1667
line 4095
;4093:  }
;4094:
;4095:  G_Printf("layoutsave: saving layout to %s\n", fileName);
ADDRGP4 $1670
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4097
;4096:
;4097:  for(i = MAX_CLIENTS;i < level.num_entities;i++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $1674
JUMPV
LABELV $1671
line 4098
;4098:  {
line 4099
;4099:    ent = &level.gentities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 4100
;4100:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1677
line 4101
;4101:      continue;
ADDRGP4 $1672
JUMPV
LABELV $1677
line 4103
;4102:
;4103:    if (ent->biteam == 0)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1679
line 4104
;4104:    {
line 4105
;4105:      ent->biteam = 2;
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 2
ASGNI4
line 4106
;4106:    }
LABELV $1679
line 4107
;4107:    s = va(
ADDRGP4 $1681
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ARGI4
ADDRLP4 348
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 348
INDIRP4
ASGNP4
line 4112
;4108:      "%i %f %f %f %f %f %f %f %f %f %f %f %f %d %d\n", ent->s.modelindex, ent->s.pos.trBase[0],
;4109:      ent->s.pos.trBase[1], ent->s.pos.trBase[2], ent->s.angles[0], ent->s.angles[1],
;4110:      ent->s.angles[2], ent->s.origin2[0], ent->s.origin2[1], ent->s.origin2[2], ent->s.angles2[0],
;4111:      ent->s.angles2[1], ent->s.angles2[2], ent->biteam, ent->survivalStage);
;4112:    trap_FS_Write(s, strlen(s), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 352
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 4113
;4113:  }
LABELV $1672
line 4097
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1674
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1671
line 4114
;4114:  trap_FS_FCloseFile(f);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4115
;4115:}
LABELV $1661
endproc G_LayoutSave 356 64
lit
align 1
LABELV $1683
byte 1 0
skip 639
align 1
LABELV $1684
byte 1 0
skip 255
export G_LayoutList
code
proc G_LayoutList 940 16
line 4119
;4116:
;4117:int
;4118:G_LayoutList(const char *map, char *list, int len)
;4119:{
line 4122
;4120:  // up to 128 single character layout names could fit in layouts
;4121:  char fileList[(MAX_CVAR_VALUE_STRING / 2) * 5] =
;4122:  { "" };
ADDRLP4 280
ADDRGP4 $1683
INDIRB
ASGNB 640
line 4124
;4123:  char layouts[MAX_CVAR_VALUE_STRING] =
;4124:  { "" };
ADDRLP4 0
ADDRGP4 $1684
INDIRB
ASGNB 256
line 4125
;4125:  int numFiles, i, fileLen = 0, listLen;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 4126
;4126:  int count = 0;
ADDRLP4 272
CNSTI4 0
ASGNI4
line 4129
;4127:  char *filePtr;
;4128:
;4129:  Q_strcat(layouts, sizeof(layouts), "*BUILTIN* ");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1685
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4130
;4130:  numFiles = trap_FS_GetFileList(va("layouts/%s", map), ".dat", fileList, sizeof(fileList));
ADDRGP4 $1686
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 920
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 920
INDIRP4
ARGP4
ADDRGP4 $1687
ARGP4
ADDRLP4 280
ARGP4
CNSTI4 640
ARGI4
ADDRLP4 924
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 276
ADDRLP4 924
INDIRI4
ASGNI4
line 4131
;4131:  filePtr = fileList;
ADDRLP4 264
ADDRLP4 280
ASGNP4
line 4132
;4132:  for(i = 0;i < numFiles;i++, filePtr += fileLen + 1)
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 $1691
JUMPV
LABELV $1688
line 4133
;4133:  {
line 4134
;4134:    fileLen = strlen(filePtr);
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 928
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 928
INDIRI4
ASGNI4
line 4135
;4135:    listLen = strlen(layouts);
ADDRLP4 0
ARGP4
ADDRLP4 932
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 932
INDIRI4
ASGNI4
line 4136
;4136:    if (fileLen < 5)
ADDRLP4 260
INDIRI4
CNSTI4 5
GEI4 $1692
line 4137
;4137:      continue;
ADDRGP4 $1689
JUMPV
LABELV $1692
line 4140
;4138:
;4139:    // list is full, stop trying to add to it
;4140:    if ((listLen + fileLen) >= sizeof(layouts))
ADDRLP4 256
INDIRI4
ADDRLP4 260
INDIRI4
ADDI4
CVIU4 4
CNSTU4 256
LTU4 $1694
line 4141
;4141:      break;
ADDRGP4 $1690
JUMPV
LABELV $1694
line 4143
;4142:
;4143:    Q_strcat(layouts, sizeof(layouts), filePtr);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4144
;4144:    listLen = strlen(layouts);
ADDRLP4 0
ARGP4
ADDRLP4 936
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 936
INDIRI4
ASGNI4
line 4147
;4145:
;4146:    // strip extension and add space delimiter
;4147:    layouts[listLen - 4] = ' ';
ADDRLP4 256
INDIRI4
ADDRLP4 0-4
ADDP4
CNSTI1 32
ASGNI1
line 4148
;4148:    layouts[listLen - 3] = '\0';
ADDRLP4 256
INDIRI4
ADDRLP4 0-3
ADDP4
CNSTI1 0
ASGNI1
line 4149
;4149:    count++;
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4150
;4150:  }
LABELV $1689
line 4132
ADDRLP4 928
CNSTI4 1
ASGNI4
ADDRLP4 268
ADDRLP4 268
INDIRI4
ADDRLP4 928
INDIRI4
ADDI4
ASGNI4
ADDRLP4 264
ADDRLP4 260
INDIRI4
ADDRLP4 928
INDIRI4
ADDI4
ADDRLP4 264
INDIRP4
ADDP4
ASGNP4
LABELV $1691
ADDRLP4 268
INDIRI4
ADDRLP4 276
INDIRI4
LTI4 $1688
LABELV $1690
line 4151
;4151:  if (count != numFiles)
ADDRLP4 272
INDIRI4
ADDRLP4 276
INDIRI4
EQI4 $1698
line 4152
;4152:  {
line 4153
;4153:    G_Printf(S_COLOR_YELLOW "WARNING: layout list was truncated to %d "
ADDRGP4 $1700
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 276
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4155
;4154:    "layouts, but %d layout files exist in layouts/%s/.\n", count, numFiles, map);
;4155:  }
LABELV $1698
line 4156
;4156:  Q_strncpyz(list, layouts, len);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4157
;4157:  return count + 1;
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $1682
endproc G_LayoutList 940 16
export G_LayoutSelect
proc G_LayoutSelect 868 20
line 4169
;4158:}
;4159:
;4160:/*
;4161: ============
;4162: G_LayoutSelect
;4163:
;4164: set level.layout based on g_layouts or g_layoutAuto
;4165: ============
;4166: */
;4167:void
;4168:G_LayoutSelect(void)
;4169:{
line 4176
;4170:  char fileName[MAX_OSPATH];
;4171:  char layouts[MAX_CVAR_VALUE_STRING];
;4172:  char layouts2[MAX_CVAR_VALUE_STRING];
;4173:  char *l;
;4174:  char map[MAX_QPATH];
;4175:  char *s;
;4176:  int cnt = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 4179
;4177:  int layoutNum;
;4178:
;4179:  Q_strncpyz(layouts, g_layouts.string, sizeof(layouts));
ADDRLP4 4
ARGP4
ADDRGP4 g_layouts+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4180
;4180:  trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1662
ARGP4
ADDRLP4 524
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4183
;4181:
;4182:  // one time use cvar 
;4183:  trap_Cvar_Set("g_layouts", "");
ADDRGP4 $1703
ARGP4
ADDRGP4 $1704
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4186
;4184:
;4185:  // pick an included layout at random if no list has been provided 
;4186:  if (!layouts[0] && g_layoutAuto.integer)
ADDRLP4 848
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 848
INDIRI4
NEI4 $1705
ADDRGP4 g_layoutAuto+12
INDIRI4
ADDRLP4 848
INDIRI4
EQI4 $1705
line 4187
;4187:  {
line 4188
;4188:    G_LayoutList(map, layouts, sizeof(layouts));
ADDRLP4 524
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_LayoutList
CALLI4
pop
line 4189
;4189:  }
LABELV $1705
line 4191
;4190:
;4191:  if (!layouts[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1708
line 4192
;4192:    return;
ADDRGP4 $1701
JUMPV
LABELV $1708
line 4194
;4193:
;4194:  Q_strncpyz(layouts2, layouts, sizeof(layouts2));
ADDRLP4 592
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4195
;4195:  l = &layouts2[0];
ADDRLP4 520
ADDRLP4 592
ASGNP4
line 4196
;4196:  layouts[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 4197
;4197:  s = COM_ParseExt(&l, qfalse);
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 852
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 852
INDIRP4
ASGNP4
ADDRGP4 $1711
JUMPV
LABELV $1710
line 4199
;4198:  while(*s)
;4199:  {
line 4200
;4200:    if (!Q_stricmp(s, "*BUILTIN*"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1715
ARGP4
ADDRLP4 856
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 856
INDIRI4
CNSTI4 0
NEI4 $1713
line 4201
;4201:    {
line 4202
;4202:      Q_strcat(layouts, sizeof(layouts), s);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4203
;4203:      Q_strcat(layouts, sizeof(layouts), " ");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1716
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4204
;4204:      cnt++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4205
;4205:      s = COM_ParseExt(&l, qfalse);
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 860
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 860
INDIRP4
ASGNP4
line 4206
;4206:      continue;
ADDRGP4 $1711
JUMPV
LABELV $1713
line 4209
;4207:    }
;4208:
;4209:    Com_sprintf(fileName, sizeof(fileName), "layouts/%s/%s.dat", map, s);
ADDRLP4 264
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1666
ARGP4
ADDRLP4 524
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4210
;4210:    if (trap_FS_FOpenFile(fileName, NULL, FS_READ) > 0)
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 860
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 860
INDIRI4
CNSTI4 0
LEI4 $1717
line 4211
;4211:    {
line 4212
;4212:      Q_strcat(layouts, sizeof(layouts), s);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4213
;4213:      Q_strcat(layouts, sizeof(layouts), " ");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1716
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4214
;4214:      cnt++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4215
;4215:    }
ADDRGP4 $1718
JUMPV
LABELV $1717
line 4217
;4216:    else
;4217:      G_Printf(S_COLOR_YELLOW "WARNING: layout \"%s\" does not exist\n", s);
ADDRGP4 $1719
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $1718
line 4218
;4218:    s = COM_ParseExt(&l, qfalse);
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 864
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 864
INDIRP4
ASGNP4
line 4219
;4219:  }
LABELV $1711
line 4198
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1710
line 4220
;4220:  if (!cnt)
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1720
line 4221
;4221:  {
line 4222
;4222:    G_Printf(S_COLOR_RED "ERROR: none of the specified layouts could be "
ADDRGP4 $1722
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4224
;4223:    "found, using map default\n");
;4224:    return;
ADDRGP4 $1701
JUMPV
LABELV $1720
line 4226
;4225:  }
;4226:  layoutNum = (rand() % cnt) + 1;
ADDRLP4 856
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 588
ADDRLP4 856
INDIRI4
ADDRLP4 260
INDIRI4
MODI4
CNSTI4 1
ADDI4
ASGNI4
line 4227
;4227:  cnt = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 4229
;4228:
;4229:  Q_strncpyz(layouts2, layouts, sizeof(layouts2));
ADDRLP4 592
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4230
;4230:  l = &layouts2[0];
ADDRLP4 520
ADDRLP4 592
ASGNP4
line 4231
;4231:  s = COM_ParseExt(&l, qfalse);
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 860
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 860
INDIRP4
ASGNP4
ADDRGP4 $1724
JUMPV
LABELV $1723
line 4233
;4232:  while(*s)
;4233:  {
line 4234
;4234:    Q_strncpyz(level.layout, s, sizeof(level.layout));
ADDRGP4 level+189904
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4235
;4235:    cnt++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4236
;4236:    if (cnt >= layoutNum)
ADDRLP4 260
INDIRI4
ADDRLP4 588
INDIRI4
LTI4 $1728
line 4237
;4237:      break;
ADDRGP4 $1725
JUMPV
LABELV $1728
line 4238
;4238:    s = COM_ParseExt(&l, qfalse);
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 864
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 864
INDIRP4
ASGNP4
line 4239
;4239:  }
LABELV $1724
line 4232
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1723
LABELV $1725
line 4240
;4240:  G_Printf("using layout \"%s\" from list ( %s)\n", level.layout, layouts);
ADDRGP4 $1730
ARGP4
ADDRGP4 level+189904
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4241
;4241:}
LABELV $1701
endproc G_LayoutSelect 868 20
proc G_LayoutBuildItem 8 16
line 4246
;4242:
;4243:static void
;4244:G_LayoutBuildItem(buildable_t buildable, vec3_t origin, vec3_t angles, vec3_t origin2,
;4245:  vec3_t angles2, int biteam, int survivalStage)
;4246:{
line 4249
;4247:  gentity_t *builder;
;4248:
;4249:  builder = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4250
;4250:  builder->client = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTP4 0
ASGNP4
line 4251
;4251:  VectorCopy(origin, builder->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4252
;4252:  VectorCopy(angles, builder->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 4253
;4253:  VectorCopy(origin2, builder->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 4254
;4254:  VectorCopy(angles2, builder->s.angles2);
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 4256
;4255:  //This is to load hacked layout.
;4256:  G_SpawnBuildable(builder, buildable, biteam, survivalStage);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 G_SpawnBuildable
CALLV
pop
line 4257
;4257:}
LABELV $1732
endproc G_LayoutBuildItem 8 16
export G_InstantBuild
proc G_InstantBuild 120 28
line 4272
;4258:
;4259:/*
;4260: ============
;4261: G_InstantBuild
;4262:
;4263: This function is extremely similar to the few functions that place a
;4264: buildable on map load. It exists because G_LayoutBuildItem takes a couple
;4265: of frames to finish spawning it, so it's not truly instant
;4266: Do not call this function immediately after the map loads - that's what
;4267: G_LayoutBuildItem is for.
;4268: ============
;4269: */
;4270:gentity_t *
;4271:G_InstantBuild(buildable_t buildable, vec3_t origin, vec3_t angles, vec3_t origin2, vec3_t angles2)
;4272:{
line 4277
;4273:  gentity_t *builder, *built;
;4274:  trace_t tr;
;4275:  vec3_t dest;
;4276:
;4277:  builder = G_Spawn();
ADDRLP4 80
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 4278
;4278:  builder->client = 0;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTP4 0
ASGNP4
line 4279
;4279:  VectorCopy(origin, builder->s.pos.trBase);
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4280
;4280:  VectorCopy(angles, builder->s.angles);
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 4281
;4281:  VectorCopy(origin2, builder->s.origin2);
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 4282
;4282:  VectorCopy(angles2, builder->s.angles2);
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 4287
;4283:  //old method didn't quite work out
;4284:  //builder->s.modelindex = buildable;
;4285:  //G_FinishSpawningBuildable( builder );
;4286:
;4287:  built = G_Build(builder, buildable, builder->s.pos.trBase, builder->s.angles);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 G_Build
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 4288
;4288:  G_FreeEntity(builder);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 4290
;4289:
;4290:  built->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 4291
;4291:  built->spawned = qtrue; //map entities are already spawned
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 1
ASGNI4
line 4292
;4292:  built->health = BG_FindHealthForBuildable(buildable);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FindHealthForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 4293
;4293:  built->s.generic1 |= B_SPAWNED_TOGGLEBIT;
ADDRLP4 96
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 4296
;4294:
;4295:  // drop towards normal surface
;4296:  VectorScale(built->s.origin2, -4096.0f, dest);
ADDRLP4 100
CNSTF4 3313500160
ASGNF4
ADDRLP4 8
ADDRLP4 100
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 100
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 8+8
CNSTF4 3313500160
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
line 4297
;4297:  VectorAdd(dest, built->s.origin, dest);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4299
;4298:
;4299:  trap_Trace(
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
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
ADDRLP4 8
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
line 4301
;4300:    &tr, built->s.origin, built->r.mins, built->r.maxs, dest, built->s.number, built->clipmask);
;4301:  if (tr.startsolid)
ADDRLP4 20+4
INDIRI4
CNSTI4 0
EQI4 $1740
line 4302
;4302:  {
line 4303
;4303:    G_Printf(
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 116
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $1617
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4306
;4304:      S_COLOR_YELLOW "G_FinishSpawningBuildable: %s startsolid at %s\n", built->classname, vtos(
;4305:        built->s.origin));
;4306:    G_FreeEntity(built);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 4307
;4307:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1733
JUMPV
LABELV $1740
line 4311
;4308:  }
;4309:
;4310:  //point items in the correct direction
;4311:  VectorCopy(tr.plane.normal, built->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 20+24
INDIRB
ASGNB 12
line 4314
;4312:
;4313:  // allow to ride movers
;4314:  built->s.groundEntityNum = tr.entityNum;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 20+52
INDIRI4
ASGNI4
line 4316
;4315:
;4316:  G_SetOrigin(built, tr.endpos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 4318
;4317:
;4318:  trap_LinkEntity(built);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 4319
;4319:  return built;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1733
endproc G_InstantBuild 120 28
export G_SpawnRevertedBuildable
proc G_SpawnRevertedBuildable 8260 20
line 4331
;4320:}
;4321:
;4322:/*
;4323: ============
;4324: G_SpawnRevertedBuildable
;4325:
;4326: Given a buildhistory, try to replace the lost buildable
;4327: ============
;4328: */
;4329:void
;4330:G_SpawnRevertedBuildable(buildHistory_t *bh, qboolean mark)
;4331:{
line 4336
;4332:  vec3_t mins, maxs;
;4333:  int i, j, blockCount, blockers[MAX_GENTITIES];
;4334:  gentity_t *targ, *built, *toRecontent[MAX_GENTITIES];
;4335:
;4336:  BG_FindBBoxForBuildable(bh->buildable, mins, maxs);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 8208
ARGP4
ADDRLP4 8220
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 4337
;4337:  VectorAdd(bh->origin, mins, mins);
ADDRLP4 8236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8208
ADDRLP4 8236
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 8208
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8208+4
ADDRLP4 8236
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 8208+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8208+8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 8208+8
INDIRF4
ADDF4
ASGNF4
line 4338
;4338:  VectorAdd(bh->origin, maxs, maxs);
ADDRLP4 8240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8220
ADDRLP4 8240
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 8220
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8220+4
ADDRLP4 8240
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 8220+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8220+8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 8220+8
INDIRF4
ADDF4
ASGNF4
line 4339
;4339:  blockCount = trap_EntitiesInBox(mins, maxs, blockers, MAX_GENTITIES);
ADDRLP4 8208
ARGP4
ADDRLP4 8220
ARGP4
ADDRLP4 4112
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8244
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 8244
INDIRI4
ASGNI4
line 4340
;4340:  for(i = j = 0;i < blockCount;i++)
ADDRLP4 8248
CNSTI4 0
ASGNI4
ADDRLP4 8
ADDRLP4 8248
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 8248
INDIRI4
ASGNI4
ADDRGP4 $1758
JUMPV
LABELV $1755
line 4341
;4341:  {
line 4342
;4342:    targ = g_entities + blockers[i];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4112
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4343
;4343:    if (targ->s.eType == ET_BUILDABLE)
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1759
line 4344
;4344:      G_FreeEntity(targ);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $1760
JUMPV
LABELV $1759
line 4345
;4345:    else if (targ->s.eType == ET_PLAYER)
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1761
line 4346
;4346:    {
line 4347
;4347:      targ->r.contents = 0; // make it intangible
ADDRLP4 4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 4348
;4348:      toRecontent[j++] = targ; // and remember it
ADDRLP4 8252
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 8252
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8252
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4349
;4349:    }
LABELV $1761
LABELV $1760
line 4350
;4350:  }
LABELV $1756
line 4340
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1758
ADDRLP4 0
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $1755
line 4351
;4351:  level.numBuildablesForRemoval = 0;
ADDRGP4 level+189236
CNSTI4 0
ASGNI4
line 4352
;4352:  built = G_InstantBuild(bh->buildable, bh->origin, bh->angles, bh->origin2, bh->angles2);
ADDRLP4 8252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8252
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 8252
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 8252
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 8252
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 8252
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 8256
ADDRGP4 G_InstantBuild
CALLP4
ASGNP4
ADDRLP4 8232
ADDRLP4 8256
INDIRP4
ASGNP4
line 4353
;4353:  if (built)
ADDRLP4 8232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1764
line 4354
;4354:  {
line 4355
;4355:    built->r.contents = 0;
ADDRLP4 8232
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 4356
;4356:    built->think = G_CommitRevertedBuildable;
ADDRLP4 8232
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_CommitRevertedBuildable
ASGNP4
line 4357
;4357:    built->nextthink = level.time;
ADDRLP4 8232
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 4358
;4358:    built->deconstruct = mark;
ADDRLP4 8232
INDIRP4
CNSTI4 1008
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 4359
;4359:  }
LABELV $1764
line 4360
;4360:  for(i = 0;i < j;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1770
JUMPV
LABELV $1767
line 4361
;4361:    toRecontent[i]->r.contents = CONTENTS_BODY;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
LABELV $1768
line 4360
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1770
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1767
line 4362
;4362:}
LABELV $1746
endproc G_SpawnRevertedBuildable 8260 20
export G_CommitRevertedBuildable
proc G_CommitRevertedBuildable 4192 16
line 4374
;4363:
;4364:/*
;4365: ============
;4366: G_CommitRevertedBuildable
;4367:
;4368: Check if there's anyone occupying me, and if not, become solid and operate as
;4369: normal. Else, try to get rid of them.
;4370: ============
;4371: */
;4372:void
;4373:G_CommitRevertedBuildable(gentity_t *ent)
;4374:{
line 4378
;4375:  gentity_t *targ;
;4376:  int i, n, occupants[MAX_GENTITIES];
;4377:  vec3_t mins, maxs;
;4378:  int victims = 0;
ADDRLP4 4108
CNSTI4 0
ASGNI4
line 4380
;4379:
;4380:  VectorAdd(ent->s.origin, ent->r.mins, mins);
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4136
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4112+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4136
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112+8
ADDRLP4 4140
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4381
;4381:  VectorAdd(ent->s.origin, ent->r.maxs, maxs);
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
ADDRLP4 4144
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4124+4
ADDRLP4 4144
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124+8
ADDRLP4 4148
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4148
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4382
;4382:  trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 4383
;4383:  n = trap_EntitiesInBox(mins, maxs, occupants, MAX_GENTITIES);
ADDRLP4 4112
ARGP4
ADDRLP4 4124
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4152
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4152
INDIRI4
ASGNI4
line 4384
;4384:  trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 4386
;4385:
;4386:  for(i = 0;i < n;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1779
JUMPV
LABELV $1776
line 4387
;4387:  {
line 4389
;4388:    vec3_t gtfo;
;4389:    targ = g_entities + occupants[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
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
line 4390
;4390:    if (targ->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1780
line 4391
;4391:    {
line 4392
;4392:      VectorSet(gtfo, crandom() * 150, crandom() * 150, random() * 150);
ADDRLP4 4168
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4156
CNSTF4 1125515264
CNSTF4 1073741824
ADDRLP4 4168
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ASGNF4
ADDRLP4 4172
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4156+4
CNSTF4 1125515264
CNSTF4 1073741824
ADDRLP4 4172
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ASGNF4
ADDRLP4 4176
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4156+8
CNSTF4 1125515264
ADDRLP4 4176
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 4393
;4393:      VectorAdd(targ->client->ps.velocity, gtfo, targ->client->ps.velocity);
ADDRLP4 4180
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4156
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRLP4 4156+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRLP4 4156+8
INDIRF4
ADDF4
ASGNF4
line 4394
;4394:      victims++;
ADDRLP4 4108
ADDRLP4 4108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4395
;4395:    }
LABELV $1780
line 4396
;4396:  }
LABELV $1777
line 4386
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1779
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1776
line 4397
;4397:  if (!victims)
ADDRLP4 4108
INDIRI4
CNSTI4 0
NEI4 $1786
line 4398
;4398:  { // we're in the clear!
line 4399
;4399:    ent->r.contents = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33619969
ASGNI4
line 4400
;4400:    trap_LinkEntity(ent); // relink
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 4402
;4401:    // oh dear, manual think set
;4402:    switch(ent->s.modelindex)
ADDRLP4 4156
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4156
INDIRI4
CNSTI4 1
LTI4 $1788
ADDRLP4 4156
INDIRI4
CNSTI4 16
GTI4 $1788
ADDRLP4 4156
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1806-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1806
address $1791
address $1796
address $1792
address $1793
address $1795
address $1792
address $1794
address $1797
address $1798
address $1799
address $1800
address $1801
address $1802
address $1803
address $1804
address $1805
code
line 4403
;4403:    {
LABELV $1791
line 4405
;4404:      case BA_A_SPAWN:
;4405:        ent->think = ASpawn_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ASpawn_Think
ASGNP4
line 4406
;4406:        break;
ADDRGP4 $1789
JUMPV
LABELV $1792
line 4409
;4407:      case BA_A_BARRICADE:
;4408:      case BA_A_BOOSTER:
;4409:        ent->think = ABarricade_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ABarricade_Think
ASGNP4
line 4410
;4410:        break;
ADDRGP4 $1789
JUMPV
LABELV $1793
line 4412
;4411:      case BA_A_ACIDTUBE:
;4412:        ent->think = AAcidTube_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AAcidTube_Think
ASGNP4
line 4413
;4413:        break;
ADDRGP4 $1789
JUMPV
LABELV $1794
line 4415
;4414:      case BA_A_HIVE:
;4415:        ent->think = AHive_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AHive_Think
ASGNP4
line 4416
;4416:        break;
ADDRGP4 $1789
JUMPV
LABELV $1795
line 4418
;4417:      case BA_A_TRAPPER:
;4418:        ent->think = ATrapper_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 ATrapper_Think
ASGNP4
line 4419
;4419:        break;
ADDRGP4 $1789
JUMPV
LABELV $1796
line 4421
;4420:      case BA_A_OVERMIND:
;4421:        ent->think = AOvermind_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AOvermind_Think
ASGNP4
line 4422
;4422:        break;
ADDRGP4 $1789
JUMPV
LABELV $1797
line 4424
;4423:      case BA_A_HOVEL:
;4424:        ent->think = AHovel_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AHovel_Think
ASGNP4
line 4425
;4425:        break;
ADDRGP4 $1789
JUMPV
LABELV $1798
line 4427
;4426:      case BA_H_SPAWN:
;4427:        ent->think = HSpawn_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HSpawn_Think
ASGNP4
line 4428
;4428:        break;
ADDRGP4 $1789
JUMPV
LABELV $1799
line 4430
;4429:      case BA_H_MGTURRET:
;4430:        ent->think = HMGTurret_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HMGTurret_Think
ASGNP4
line 4431
;4431:        break;
ADDRGP4 $1789
JUMPV
LABELV $1800
line 4433
;4432:      case BA_H_TESLAGEN:
;4433:        ent->think = HTeslaGen_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HTeslaGen_Think
ASGNP4
line 4434
;4434:        break;
ADDRGP4 $1789
JUMPV
LABELV $1801
line 4436
;4435:      case BA_H_ARMOURY:
;4436:        ent->think = HArmoury_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HArmoury_Think
ASGNP4
line 4437
;4437:        break;
ADDRGP4 $1789
JUMPV
LABELV $1802
line 4439
;4438:      case BA_H_DCC:
;4439:        ent->think = HDCC_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HDCC_Think
ASGNP4
line 4440
;4440:        break;
ADDRGP4 $1789
JUMPV
LABELV $1803
line 4442
;4441:      case BA_H_MEDISTAT:
;4442:        ent->think = HMedistat_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HMedistat_Think
ASGNP4
line 4443
;4443:        break;
ADDRGP4 $1789
JUMPV
LABELV $1804
line 4445
;4444:      case BA_H_REACTOR:
;4445:        ent->think = HReactor_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HReactor_Think
ASGNP4
line 4446
;4446:        break;
ADDRGP4 $1789
JUMPV
LABELV $1805
line 4448
;4447:      case BA_H_REPEATER:
;4448:        ent->think = HRepeater_Think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 HRepeater_Think
ASGNP4
line 4449
;4449:        break;
LABELV $1788
LABELV $1789
line 4451
;4450:    }
;4451:    ent->nextthink = level.time + BG_FindNextThinkForBuildable(ent->s.modelindex);
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4164
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4168
ADDRGP4 BG_FindNextThinkForBuildable
CALLI4
ASGNI4
ADDRLP4 4164
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
ADDRLP4 4168
INDIRI4
ADDI4
ASGNI4
line 4453
;4452:    // oh if only everything was that simple
;4453:    return;
ADDRGP4 $1771
JUMPV
LABELV $1786
line 4456
;4454:  }
;4455:#define REVERT_THINK_INTERVAL 50
;4456:  ent->nextthink = level.time + REVERT_THINK_INTERVAL;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 4457
;4457:}
LABELV $1771
endproc G_CommitRevertedBuildable 4192 16
export G_RevertCanFit
proc G_RevertCanFit 4168 16
line 4468
;4458:
;4459:/*
;4460: ============
;4461: G_RevertCanFit
;4462:
;4463: take a bhist and make sure you're not overwriting anything by placing it
;4464: ============
;4465: */
;4466:qboolean
;4467:G_RevertCanFit(buildHistory_t *bh)
;4468:{
line 4474
;4469:  int i, num, blockers[MAX_GENTITIES];
;4470:  vec3_t mins, maxs;
;4471:  gentity_t *targ;
;4472:  vec3_t dist;
;4473:
;4474:  BG_FindBBoxForBuildable(bh->buildable, mins, maxs);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 4475
;4475:  VectorAdd(bh->origin, mins, mins);
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4144
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 4120
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4144
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 4120+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 4120+8
INDIRF4
ADDF4
ASGNF4
line 4476
;4476:  VectorAdd(bh->origin, maxs, maxs);
ADDRLP4 4148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4132
ADDRLP4 4148
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 4132
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4148
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 4132+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 4132+8
INDIRF4
ADDF4
ASGNF4
line 4477
;4477:  num = trap_EntitiesInBox(mins, maxs, blockers, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4152
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 4152
INDIRI4
ASGNI4
line 4478
;4478:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1822
JUMPV
LABELV $1819
line 4479
;4479:  {
line 4480
;4480:    targ = g_entities + blockers[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4481
;4481:    if (targ->s.eType == ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1820
line 4482
;4482:    {
line 4483
;4483:      VectorSubtract(bh->origin, targ->s.pos.trBase, dist);
ADDRLP4 4156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4156
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 4156
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4484
;4484:      if (targ->s.modelindex == bh->buildable && VectorLength(dist) < 10 && targ->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $1827
ADDRLP4 8
ARGP4
ADDRLP4 4164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4164
INDIRF4
CNSTF4 1092616192
GEF4 $1827
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1827
line 4485
;4485:        continue; // it's the same buildable, hasn't blown up yet
ADDRGP4 $1820
JUMPV
LABELV $1827
line 4487
;4486:      else
;4487:        return qfalse; // can't get rid of this one
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
line 4490
;4488:    }
;4489:    else
;4490:      continue;
LABELV $1820
line 4478
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1822
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $1819
line 4492
;4491:  }
;4492:  return qtrue;
CNSTI4 1
RETI4
LABELV $1810
endproc G_RevertCanFit 4168 16
lit
align 4
LABELV $1830
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $1831
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $1832
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $1833
byte 4 0
byte 4 0
byte 4 0
export G_LayoutLoad
code
proc G_LayoutLoad 1188 68
line 4505
;4493:}
;4494:
;4495:/*
;4496: ============
;4497: G_LayoutLoad
;4498:
;4499: load the layout .dat file indicated by level.layout and spawn buildables
;4500: as if a builder was creating them
;4501: ============
;4502: */
;4503:void
;4504:G_LayoutLoad(void)
;4505:{
line 4510
;4506:  fileHandle_t f;
;4507:  int len;
;4508:  char *layout;
;4509:  char map[MAX_QPATH];
;4510:  int buildable = BA_NONE;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 4512
;4511:  vec3_t origin =
;4512:  { 0.0f, 0.0f, 0.0f };
ADDRLP4 1036
ADDRGP4 $1830
INDIRB
ASGNB 12
line 4514
;4513:  vec3_t angles =
;4514:  { 0.0f, 0.0f, 0.0f };
ADDRLP4 1048
ADDRGP4 $1831
INDIRB
ASGNB 12
line 4516
;4515:  vec3_t origin2 =
;4516:  { 0.0f, 0.0f, 0.0f };
ADDRLP4 1060
ADDRGP4 $1832
INDIRB
ASGNB 12
line 4518
;4517:  vec3_t angles2 =
;4518:  { 0.0f, 0.0f, 0.0f };
ADDRLP4 1072
ADDRGP4 $1833
INDIRB
ASGNB 12
line 4520
;4519:  char line[MAX_STRING_CHARS];
;4520:  int i = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 4523
;4521:  int biteam, survivalStage;
;4522:
;4523:  if (!level.layout[0] || !Q_stricmp(level.layout, "*BUILTIN*"))
ADDRGP4 level+189904
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1838
ADDRGP4 level+189904
ARGP4
ADDRGP4 $1715
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1834
LABELV $1838
line 4524
;4524:    return;
ADDRGP4 $1829
JUMPV
LABELV $1834
line 4526
;4525:
;4526:  trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1662
ARGP4
ADDRLP4 1084
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4527
;4527:  len = trap_FS_FOpenFile(va("layouts/%s/%s.dat", map, level.layout), &f, FS_READ);
ADDRGP4 $1666
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 level+189904
ARGP4
ADDRLP4 1168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1160
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1172
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1156
ADDRLP4 1172
INDIRI4
ASGNI4
line 4528
;4528:  if (len < 0)
ADDRLP4 1156
INDIRI4
CNSTI4 0
GEI4 $1840
line 4529
;4529:  {
line 4530
;4530:    G_Printf("ERROR: layout %s could not be opened\n", level.layout);
ADDRGP4 $1842
ARGP4
ADDRGP4 level+189904
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4531
;4531:    return;
ADDRGP4 $1829
JUMPV
LABELV $1840
line 4533
;4532:  }
;4533:  layout = G_Alloc(len + 1);
ADDRLP4 1156
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1176
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1176
INDIRP4
ASGNP4
line 4534
;4534:  trap_FS_Read(layout, len, f);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1156
INDIRI4
ARGI4
ADDRLP4 1160
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 4535
;4535:  *(layout + len) = '\0';
ADDRLP4 1156
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4536
;4536:  trap_FS_FCloseFile(f);
ADDRLP4 1160
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
ADDRGP4 $1845
JUMPV
LABELV $1844
line 4538
;4537:  while(*layout)
;4538:  {
line 4539
;4539:    if (i >= sizeof(line) - 1)
ADDRLP4 1028
INDIRI4
CVIU4 4
CNSTU4 1023
LTU4 $1847
line 4540
;4540:    {
line 4541
;4541:      G_Printf(S_COLOR_RED "ERROR: line overflow in %s before \"%s\"\n", va(
ADDRGP4 $1666
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 level+189904
ARGP4
ADDRLP4 1180
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1849
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4543
;4542:        "layouts/%s/%s.dat", map, level.layout), line);
;4543:      return;
ADDRGP4 $1829
JUMPV
LABELV $1847
line 4545
;4544:    }
;4545:    line[i++] = *layout;
ADDRLP4 1180
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1180
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 4546
;4546:    line[i] = '\0';
ADDRLP4 1028
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 4547
;4547:    if (*layout == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1851
line 4548
;4548:    {
line 4549
;4549:      i = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 4550
;4550:      sscanf(
ADDRLP4 4
ARGP4
ADDRGP4 $1853
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1036+4
ARGP4
ADDRLP4 1036+8
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1048+4
ARGP4
ADDRLP4 1048+8
ARGP4
ADDRLP4 1060
ARGP4
ADDRLP4 1060+4
ARGP4
ADDRLP4 1060+8
ARGP4
ADDRLP4 1072
ARGP4
ADDRLP4 1072+4
ARGP4
ADDRLP4 1072+8
ARGP4
ADDRLP4 1148
ARGP4
ADDRLP4 1152
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 4555
;4551:        line, "%d %f %f %f %f %f %f %f %f %f %f %f %f %d %d\n", &buildable, &origin[0], &origin[1],
;4552:        &origin[2], &angles[0], &angles[1], &angles[2], &origin2[0], &origin2[1], &origin2[2],
;4553:        &angles2[0], &angles2[1], &angles2[2], &biteam, &survivalStage);
;4554:
;4555:      if (buildable > BA_NONE && buildable < BA_NUM_BUILDABLES)
ADDRLP4 1184
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
LEI4 $1862
ADDRLP4 1184
INDIRI4
CNSTI4 27
GEI4 $1862
line 4556
;4556:        G_LayoutBuildItem(buildable, origin, angles, origin2, angles2, biteam, survivalStage);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1060
ARGP4
ADDRLP4 1072
ARGP4
ADDRLP4 1148
INDIRI4
ARGI4
ADDRLP4 1152
INDIRI4
ARGI4
ADDRGP4 G_LayoutBuildItem
CALLV
pop
ADDRGP4 $1863
JUMPV
LABELV $1862
line 4558
;4557:      else
;4558:        G_Printf(S_COLOR_YELLOW "WARNING: bad buildable number (%d) in "
ADDRGP4 $1864
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $1863
line 4560
;4559:        " layout.  skipping\n", buildable);
;4560:    }
LABELV $1851
line 4561
;4561:    layout++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 4562
;4562:  }
LABELV $1845
line 4537
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1844
line 4563
;4563:}
LABELV $1829
endproc G_LayoutLoad 1188 68
export G_BaseSelfDestruct
proc G_BaseSelfDestruct 24 32
line 4567
;4564:
;4565:void
;4566:G_BaseSelfDestruct(pTeam_t team)
;4567:{
line 4571
;4568:  int i;
;4569:  gentity_t *ent;
;4570:
;4571:  for(i = MAX_CLIENTS;i < level.num_entities;i++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $1869
JUMPV
LABELV $1866
line 4572
;4572:  {
line 4573
;4573:    ent = &level.gentities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 4574
;4574:    if (ent->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1872
line 4575
;4575:      continue;
ADDRGP4 $1867
JUMPV
LABELV $1872
line 4576
;4576:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1874
line 4577
;4577:      continue;
ADDRGP4 $1867
JUMPV
LABELV $1874
line 4578
;4578:    if (team == PTE_HUMANS && ent->biteam != BIT_HUMANS)
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1876
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1876
line 4579
;4579:      continue;
ADDRGP4 $1867
JUMPV
LABELV $1876
line 4580
;4580:    if (team == PTE_ALIENS && ent->biteam != BIT_ALIENS)
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1878
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1878
line 4581
;4581:      continue;
ADDRGP4 $1867
JUMPV
LABELV $1878
line 4582
;4582:    G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 4583
;4583:  }
LABELV $1867
line 4571
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1869
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1866
line 4584
;4584:}
LABELV $1865
endproc G_BaseSelfDestruct 24 32
export G_LogBuild
proc G_LogBuild 4 0
line 4588
;4585:
;4586:int
;4587:G_LogBuild(buildHistory_t *new)
;4588:{
line 4589
;4589:  new->next = level.buildHistory;
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 level+189972
INDIRP4
ASGNP4
line 4590
;4590:  level.buildHistory = new;
ADDRGP4 level+189972
ADDRFP4 0
INDIRP4
ASGNP4
line 4591
;4591:  return G_CountBuildLog();
ADDRLP4 0
ADDRGP4 G_CountBuildLog
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1880
endproc G_LogBuild 4 0
export G_CountBuildLog
proc G_CountBuildLog 24 4
line 4596
;4592:}
;4593:
;4594:int
;4595:G_CountBuildLog(void)
;4596:{
line 4598
;4597:  buildHistory_t *ptr, *mark;
;4598:  int i = 0, overflow;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4599
;4599:  for(ptr = level.buildHistory;ptr;ptr = ptr->next, i++)
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRGP4 $1887
JUMPV
LABELV $1884
line 4600
;4600:    ;
LABELV $1885
line 4599
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1887
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1884
line 4601
;4601:  if (i > g_buildLogMaxLength.integer)
ADDRLP4 8
INDIRI4
ADDRGP4 g_buildLogMaxLength+12
INDIRI4
LEI4 $1889
line 4602
;4602:  {
line 4603
;4603:    for(overflow = i - g_buildLogMaxLength.integer;overflow > 0;overflow--)
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 g_buildLogMaxLength+12
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1895
JUMPV
LABELV $1892
line 4604
;4604:    {
line 4605
;4605:      ptr = level.buildHistory;
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRGP4 $1899
JUMPV
LABELV $1898
line 4607
;4606:      while(ptr->next)
;4607:      {
line 4608
;4608:        if (ptr->next->next)
ADDRLP4 16
CNSTI4 100
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1904
line 4609
;4609:          ptr = ptr->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1902
JUMPV
line 4611
;4610:        else
;4611:        {
LABELV $1903
line 4613
;4612:          while((mark = ptr->next))
;4613:          {
line 4614
;4614:            ptr->next = ptr->next->marked;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
line 4615
;4615:            G_Free(mark);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 4616
;4616:          }
LABELV $1904
line 4612
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1903
line 4617
;4617:        }
LABELV $1902
line 4618
;4618:      }
LABELV $1899
line 4606
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1898
line 4619
;4619:    }
LABELV $1893
line 4603
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1895
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $1892
line 4620
;4620:    return g_buildLogMaxLength.integer;
ADDRGP4 g_buildLogMaxLength+12
INDIRI4
RETI4
ADDRGP4 $1883
JUMPV
LABELV $1889
line 4622
;4621:  }
;4622:  return i;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1883
endproc G_CountBuildLog 24 4
export G_FindBuildLogName
proc G_FindBuildLogName 12 0
line 4627
;4623:}
;4624:
;4625:char *
;4626:G_FindBuildLogName(int id)
;4627:{
line 4630
;4628:  buildHistory_t *ptr;
;4629:
;4630:  for(ptr = level.buildHistory;ptr && ptr->ID != id;ptr = ptr->next)
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRGP4 $1911
JUMPV
LABELV $1908
line 4631
;4631:    ;
LABELV $1909
line 4630
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $1911
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1913
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1908
LABELV $1913
line 4632
;4632:  if (ptr)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1914
line 4633
;4633:  {
line 4634
;4634:    if (ptr->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1916
line 4635
;4635:    {
line 4636
;4636:      if (ptr->ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1917
line 4637
;4637:        return ptr->ent->client->pers.netname;
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
RETP4
ADDRGP4 $1907
JUMPV
line 4638
;4638:    }
LABELV $1916
line 4639
;4639:    else if (ptr->name[0])
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1920
line 4640
;4640:    {
line 4641
;4641:      return ptr->name;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
RETP4
ADDRGP4 $1907
JUMPV
LABELV $1920
LABELV $1917
line 4643
;4642:    }
;4643:  }
LABELV $1914
line 4645
;4644:
;4645:  return "<buildlog entry expired>";
ADDRGP4 $1922
RETP4
LABELV $1907
endproc G_FindBuildLogName 12 0
bss
align 4
LABELV cmpOrigin
skip 12
align 4
LABELV cmpBuildable
skip 4
import modNames
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
import FinishSpawningBuildable
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
LABELV $1922
byte 1 60
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $1864
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $1853
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1849
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1842
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1730
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1722
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1719
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1716
byte 1 32
byte 1 0
align 1
LABELV $1715
byte 1 42
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 84
byte 1 73
byte 1 78
byte 1 42
byte 1 0
align 1
LABELV $1704
byte 1 0
align 1
LABELV $1703
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1700
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 114
byte 1 117
byte 1 110
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1687
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1686
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1685
byte 1 42
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 84
byte 1 73
byte 1 78
byte 1 42
byte 1 32
byte 1 0
align 1
LABELV $1681
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1670
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1669
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1666
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1665
byte 1 76
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 40
byte 1 32
byte 1 41
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1662
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1617
byte 1 94
byte 1 51
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1563
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 48
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 94
byte 1 50
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1562
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 94
byte 1 50
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1255
byte 1 60
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 62
byte 1 0
align 1
LABELV $1041
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 50
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $327
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 33
byte 1 34
byte 1 0
align 1
LABELV $298
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $297
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 69
byte 1 83
byte 1 84
byte 1 82
byte 1 79
byte 1 89
byte 1 69
byte 1 68
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 69
byte 1 83
byte 1 84
byte 1 82
byte 1 79
byte 1 89
byte 1 69
byte 1 68
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $280
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
