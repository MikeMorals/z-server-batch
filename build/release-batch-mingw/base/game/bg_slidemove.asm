export PM_SlideMove
code
proc PM_SlideMove 312 28
file "..\..\..\..\src/game/bg_slidemove.c"
line 47
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
;24:// bg_slidemove.c -- part of bg_pmove functionality
;25:
;26:#include "../qcommon/q_shared.h"
;27:#include "bg_public.h"
;28:#include "bg_local.h"
;29:
;30:/*
;31:
;32:input: origin, velocity, bounds, groundPlane, trace function
;33:
;34:output: origin, velocity, impacts, stairup boolean
;35:
;36: */
;37:
;38:/*
;39:==================
;40:PM_SlideMove
;41:
;42:Returns qtrue if the velocity was clipped in some way
;43:==================
;44: */
;45:#define MAX_CLIP_PLANES 5
;46:
;47:qboolean PM_SlideMove(qboolean gravity) {
line 70
;48:  int bumpcount, numbumps;
;49:  vec3_t dir;
;50:  float d;
;51:  int numplanes;
;52:  vec3_t planes[MAX_CLIP_PLANES];
;53:  vec3_t primal_velocity;
;54:  vec3_t clipVelocity;
;55:  int i, j, k;
;56:  trace_t trace;
;57:  vec3_t end;
;58:  float time_left;
;59:  float into;
;60:  vec3_t endVelocity;
;61:  vec3_t endClipVelocity;
;62:
;63://  if(pm->ps->stats[STAT_PTEAM] == PTE_ALIENS)
;64://  {
;65://    //Trying to reduce processing.
;66://    numbumps = 2;
;67://  }
;68://  else
;69://  {
;70:    numbumps = 4;
ADDRLP4 212
CNSTI4 4
ASGNI4
line 73
;71://  }
;72:
;73:  VectorCopy(pm->ps->velocity, primal_velocity);
ADDRLP4 216
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 75
;74:
;75:  if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $59
line 76
;76:    VectorCopy(pm->ps->velocity, endVelocity);
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 77
;77:    endVelocity[ 2 ] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 78
;78:    pm->ps->velocity[ 2 ] = (pm->ps->velocity[ 2 ] + endVelocity[ 2 ]) * 0.5;
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTF4 1056964608
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 79
;79:    primal_velocity[ 2 ] = endVelocity[ 2 ];
ADDRLP4 216+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 81
;80:
;81:    if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $66
line 83
;82:      // slide along the ground plane
;83:      PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 232
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRGP4 pml+56+24
ARGP4
ADDRLP4 232
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 85
;84:              pm->ps->velocity, OVERCLIP);
;85:    }
LABELV $66
line 86
;86:  }
LABELV $59
line 88
;87:
;88:  time_left = pml.frametime;
ADDRLP4 192
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 91
;89:
;90:  // never turn against the ground plane
;91:  if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $72
line 92
;92:    numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 93
;93:    VectorCopy(pml.groundTrace.plane.normal, planes[ 0 ]);
ADDRLP4 4
ADDRGP4 pml+56+24
INDIRB
ASGNB 12
line 94
;94:  } else
ADDRGP4 $73
JUMPV
LABELV $72
line 95
;95:    numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
LABELV $73
line 98
;96:
;97:  // never turn against original velocity
;98:  VectorNormalize2(pm->ps->velocity, planes[ numplanes ]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 99
;99:  numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 101
;100:
;101:  for (bumpcount = 0; bumpcount < numbumps; bumpcount++) {
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $80
JUMPV
LABELV $77
line 103
;102:    // calculate position we are trying to move to
;103:    VectorMA(pm->ps->origin, time_left, pm->ps->velocity, end);
ADDRLP4 228
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 232
ADDRLP4 228
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 196
ADDRLP4 232
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 232
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRLP4 228
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 196+4
ADDRLP4 240
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 196+8
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 244
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
line 106
;104:
;105:    // see if we can make it there
;106:    pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 128
ARGP4
ADDRLP4 248
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 252
ADDRLP4 248
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 252
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
INDIRP4
CNSTI4 352
ADDP4
INDIRP4
CALLV
pop
line 108
;107:
;108:    if (trace.allsolid) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $83
line 110
;109:      // entity is completely trapped in another solid
;110:      pm->ps->velocity[ 2 ] = 0; // don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 111
;111:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $58
JUMPV
LABELV $83
line 114
;112:    }
;113:
;114:    if (trace.fraction > 0) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $85
line 116
;115:      // actually covered some distance
;116:      VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 117
;117:    }
LABELV $85
line 119
;118:
;119:    if (trace.fraction == 1)
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $89
line 120
;120:      break; // moved the entire distance
ADDRGP4 $79
JUMPV
LABELV $89
line 123
;121:
;122:    // save entity for contact
;123:    PM_AddTouchEnt(trace.entityNum);
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 125
;124:
;125:    time_left -= time_left * trace.fraction;
ADDRLP4 192
ADDRLP4 192
INDIRF4
ADDRLP4 192
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 127
;126:
;127:    if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $94
line 129
;128:      // this shouldn't really happen
;129:      VectorClear(pm->ps->velocity);
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 264
CNSTF4 0
ASGNF4
ADDRLP4 260
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 264
INDIRF4
ASGNF4
ADDRLP4 260
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 264
INDIRF4
ASGNF4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 264
INDIRF4
ASGNF4
line 130
;130:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $58
JUMPV
LABELV $94
line 138
;131:    }
;132:
;133:    //
;134:    // if this is the same plane we hit before, nudge velocity
;135:    // out along it, which fixes some epsilon issues with
;136:    // non-axial planes
;137:    //
;138:    for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $96
line 139
;139:      if (DotProduct(trace.plane.normal, planes[i]) > 0.99) {
ADDRLP4 260
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $100
line 140
;140:        VectorAdd(trace.plane.normal, pm->ps->velocity, pm->ps->velocity);
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 268
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 272
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 141
;141:        break;
ADDRGP4 $98
JUMPV
LABELV $100
line 143
;142:      }
;143:    }
LABELV $97
line 138
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $99
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $96
LABELV $98
line 145
;144:
;145:    if (i < numplanes)
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $114
line 146
;146:      continue;
ADDRGP4 $78
JUMPV
LABELV $114
line 148
;147:
;148:    VectorCopy(trace.plane.normal, planes[ numplanes ]);
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 149
;149:    numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 156
;150:
;151:    //
;152:    // modify velocity so it parallels all of the clip planes
;153:    //
;154:
;155:    // find a plane that it enters
;156:    for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $117
line 157
;157:      into = DotProduct(pm->ps->velocity, planes[ i ]);
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 264
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 188
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 260
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 260
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 158
;158:      if (into >= 0.1)
ADDRLP4 188
INDIRF4
CNSTF4 1036831949
LTF4 $123
line 159
;159:        continue; // move doesn't interact with the plane
ADDRGP4 $118
JUMPV
LABELV $123
line 162
;160:
;161:      // see how hard we are hitting things
;162:      if (-into > pml.impactSpeed)
ADDRLP4 188
INDIRF4
NEGF4
ADDRGP4 pml+116
INDIRF4
LEF4 $125
line 163
;163:        pml.impactSpeed = -into;
ADDRGP4 pml+116
ADDRLP4 188
INDIRF4
NEGF4
ASGNF4
LABELV $125
line 166
;164:
;165:      // slide along the plane
;166:      PM_ClipVelocity(pm->ps->velocity, planes[ i ], clipVelocity, OVERCLIP);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 169
;167:
;168:      // slide along the plane
;169:      PM_ClipVelocity(endVelocity, planes[ i ], endClipVelocity, OVERCLIP);
ADDRLP4 116
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 172
;170:
;171:      // see if there is a second plane that the new move enters
;172:      for (j = 0; j < numplanes; j++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 173
;173:        if (j == i)
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $133
line 174
;174:          continue;
ADDRGP4 $130
JUMPV
LABELV $133
line 176
;175:
;176:        if (DotProduct(clipVelocity, planes[ j ]) >= 0.1)
ADDRLP4 268
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $135
line 177
;177:          continue; // move doesn't interact with the plane
ADDRGP4 $130
JUMPV
LABELV $135
line 180
;178:
;179:        // try clipping the move to the plane
;180:        PM_ClipVelocity(clipVelocity, planes[ j ], clipVelocity, OVERCLIP);
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 181
;181:        PM_ClipVelocity(endClipVelocity, planes[ j ], endClipVelocity, OVERCLIP);
ADDRLP4 104
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 184
;182:
;183:        // see if it goes back into the first clip plane
;184:        if (DotProduct(clipVelocity, planes[ i ]) >= 0)
ADDRLP4 272
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $141
line 185
;185:          continue;
ADDRGP4 $130
JUMPV
LABELV $141
line 188
;186:
;187:        // slide the original velocity along the crease
;188:        CrossProduct(planes[ i ], planes[ j ], dir);
ADDRLP4 276
CNSTI4 12
ASGNI4
ADDRLP4 276
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 276
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 189
;189:        VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 190
;190:        d = DotProduct(dir, pm->ps->velocity);
ADDRLP4 280
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 191
;191:        VectorScale(dir, d, clipVelocity);
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 193
;192:
;193:        CrossProduct(planes[ i ], planes[ j ], dir);
ADDRLP4 288
CNSTI4 12
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 288
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 194
;194:        VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 195
;195:        d = DotProduct(dir, endVelocity);
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 196
;196:        VectorScale(dir, d, endClipVelocity);
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 199
;197:
;198:        // see if there is a third plane the the new move enters
;199:        for (k = 0; k < numplanes; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $161
line 200
;200:          if (k == i || k == j)
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $167
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $165
LABELV $167
line 201
;201:            continue;
ADDRGP4 $162
JUMPV
LABELV $165
line 203
;202:
;203:          if (DotProduct(clipVelocity, planes[ k ]) >= 0.1)
ADDRLP4 300
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 300
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 300
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 300
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $168
line 204
;204:            continue; // move doesn't interact with the plane
ADDRGP4 $162
JUMPV
LABELV $168
line 207
;205:
;206:          // stop dead at a tripple plane interaction
;207:          VectorClear(pm->ps->velocity);
ADDRLP4 304
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 308
CNSTF4 0
ASGNF4
ADDRLP4 304
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 304
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 304
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 308
INDIRF4
ASGNF4
line 208
;208:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $58
JUMPV
LABELV $162
line 199
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $161
line 210
;209:        }
;210:      }
LABELV $130
line 172
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $129
line 213
;211:
;212:      // if we have fixed all interactions, try another move
;213:      VectorCopy(clipVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 214
;214:      VectorCopy(endClipVelocity, endVelocity);
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 215
;215:      break;
ADDRGP4 $119
JUMPV
LABELV $118
line 156
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $117
LABELV $119
line 217
;216:    }
;217:  }
LABELV $78
line 101
ADDRLP4 208
ADDRLP4 208
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $80
ADDRLP4 208
INDIRI4
ADDRLP4 212
INDIRI4
LTI4 $77
LABELV $79
line 219
;218:
;219:  if (gravity)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $174
line 220
;220:    VectorCopy(endVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
LABELV $174
line 223
;221:
;222:  // don't change velocity if in a timer (FIXME: is this correct?)
;223:  if (pm->ps->pm_time)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
line 224
;224:    VectorCopy(primal_velocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 216
INDIRB
ASGNB 12
LABELV $176
line 226
;225:
;226:  return ( bumpcount != 0);
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $179
ADDRLP4 228
CNSTI4 1
ASGNI4
ADDRGP4 $180
JUMPV
LABELV $179
ADDRLP4 228
CNSTI4 0
ASGNI4
LABELV $180
ADDRLP4 228
INDIRI4
RETI4
LABELV $58
endproc PM_SlideMove 312 28
export PM_StepEvent
proc PM_StepEvent 56 8
line 234
;227:}
;228:
;229:/*
;230:==================
;231:PM_StepEvent
;232:==================
;233: */
;234:void PM_StepEvent(vec3_t from, vec3_t to, vec3_t normal) {
line 238
;235:  float size;
;236:  vec3_t delta, dNormal;
;237:
;238:  VectorSubtract(from, to, delta);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 239
;239:  VectorCopy(delta, dNormal);
ADDRLP4 12
ADDRLP4 0
INDIRB
ASGNB 12
line 240
;240:  VectorNormalize(dNormal);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 242
;241:
;242:  size = DotProduct(normal, dNormal) * VectorLength(delta);
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 244
;243:
;244:  if (size > 0.0f) {
ADDRLP4 24
INDIRF4
CNSTF4 0
LEF4 $186
line 245
;245:    if (size > 2.0f) {
ADDRLP4 24
INDIRF4
CNSTF4 1073741824
LEF4 $187
line 246
;246:      if (size < 7.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1088421888
GEF4 $190
line 247
;247:        PM_AddEvent(EV_STEPDN_4);
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $187
JUMPV
LABELV $190
line 248
;248:      else if (size < 11.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1093664768
GEF4 $192
line 249
;249:        PM_AddEvent(EV_STEPDN_8);
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $187
JUMPV
LABELV $192
line 250
;250:      else if (size < 15.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1097859072
GEF4 $194
line 251
;251:        PM_AddEvent(EV_STEPDN_12);
CNSTI4 13
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $187
JUMPV
LABELV $194
line 253
;252:      else
;253:        PM_AddEvent(EV_STEPDN_16);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 254
;254:    }
line 255
;255:  } else {
ADDRGP4 $187
JUMPV
LABELV $186
line 256
;256:    size = fabs(size);
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRF4
ASGNF4
line 258
;257:
;258:    if (size > 2.0f) {
ADDRLP4 24
INDIRF4
CNSTF4 1073741824
LEF4 $196
line 259
;259:      if (size < 7.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1088421888
GEF4 $198
line 260
;260:        PM_AddEvent(EV_STEP_4);
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $199
JUMPV
LABELV $198
line 261
;261:      else if (size < 11.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1093664768
GEF4 $200
line 262
;262:        PM_AddEvent(EV_STEP_8);
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $201
JUMPV
LABELV $200
line 263
;263:      else if (size < 15.0f)
ADDRLP4 24
INDIRF4
CNSTF4 1097859072
GEF4 $202
line 264
;264:        PM_AddEvent(EV_STEP_12);
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $203
JUMPV
LABELV $202
line 266
;265:      else
;266:        PM_AddEvent(EV_STEP_16);
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
LABELV $203
LABELV $201
LABELV $199
line 267
;267:    }
LABELV $196
line 268
;268:  }
LABELV $187
line 270
;269:
;270:  if (pm->debugLevel)
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $204
line 271
;271:    Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $206
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $204
line 272
;272:}
LABELV $181
endproc PM_StepEvent 56 8
export PM_StepSlideMove
proc PM_StepSlideMove 228 28
line 279
;273:
;274:/*
;275:==================
;276:PM_StepSlideMove
;277:==================
;278: */
;279:qboolean PM_StepSlideMove(qboolean gravity, qboolean predictive) {
line 287
;280:  vec3_t start_o, start_v;
;281:  vec3_t down_o, down_v;
;282:  trace_t trace;
;283:  vec3_t normal;
;284:  vec3_t step_v, step_vNormal;
;285:  vec3_t up, down;
;286:  float stepSize;
;287:  qboolean stepped = qfalse;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 289
;288:
;289:  if (pm->ps->stats[ STAT_STATE ] & SS_WALLCLIMBING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $208
line 290
;290:    if (pm->ps->stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $210
line 291
;291:      VectorSet(normal, 0.0f, 0.0f, -1.0f);
ADDRLP4 176
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 176
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 176
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $209
JUMPV
LABELV $210
line 293
;292:    else
;293:      VectorCopy(pm->ps->grapplePoint, normal);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 294
;294:  } else
ADDRGP4 $209
JUMPV
LABELV $208
line 295
;295:    VectorSet(normal, 0.0f, 0.0f, 1.0f);
ADDRLP4 176
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 176
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 176
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
LABELV $209
line 297
;296:
;297:  VectorCopy(pm->ps->origin, start_o);
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 298
;298:  VectorCopy(pm->ps->velocity, start_v);
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 300
;299:
;300:  if (PM_SlideMove(gravity) == 0) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $216
line 301
;301:    VectorCopy(start_o, down);
ADDRLP4 12
ADDRLP4 84
INDIRB
ASGNB 12
line 302
;302:    VectorMA(down, -STEPSIZE, normal, down);
ADDRLP4 184
CNSTF4 3247439872
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 184
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 184
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3247439872
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 303
;303:    pm->trace(&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 24
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 188
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 188
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 188
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 188
INDIRP4
CNSTI4 352
ADDP4
INDIRP4
CALLV
pop
line 306
;304:
;305:    //we can step down
;306:    if (trace.fraction > 0.01f && trace.fraction < 1.0f &&
ADDRLP4 24+8
INDIRF4
CNSTF4 1008981770
LEF4 $217
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $217
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $217
ADDRGP4 pml+48
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $217
line 307
;307:            !trace.allsolid && pml.groundPlane != qfalse) {
line 308
;308:      if (pm->debugLevel)
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 309
;309:        Com_Printf("%d: step down\n", c_pmove);
ADDRGP4 $231
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $229
line 311
;310:
;311:      stepped = qtrue;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 312
;312:    }
line 313
;313:  } else {
ADDRGP4 $217
JUMPV
LABELV $216
line 314
;314:    VectorCopy(start_o, down);
ADDRLP4 12
ADDRLP4 84
INDIRB
ASGNB 12
line 315
;315:    VectorMA(down, -STEPSIZE, normal, down);
ADDRLP4 184
CNSTF4 3247439872
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 184
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 184
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3247439872
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 316
;316:    pm->trace(&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 24
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 188
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 188
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 188
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 188
INDIRP4
CNSTI4 352
ADDP4
INDIRP4
CALLV
pop
line 318
;317:    // never step up when you still have up velocity
;318:    if (DotProduct(trace.plane.normal, pm->ps->velocity) > 0.0f &&
ADDRLP4 192
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24+24
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 24+24+4
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+24+8
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $238
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $253
ADDRLP4 24+24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 24+24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $238
LABELV $253
line 319
;319:            (trace.fraction == 1.0f || DotProduct(trace.plane.normal, normal) < 0.7f)) {
line 320
;320:      return stepped;
ADDRLP4 108
INDIRI4
RETI4
ADDRGP4 $207
JUMPV
LABELV $238
line 323
;321:    }
;322:
;323:    VectorCopy(pm->ps->origin, down_o);
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 324
;324:    VectorCopy(pm->ps->velocity, down_v);
ADDRLP4 164
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 326
;325:
;326:    VectorCopy(start_o, up);
ADDRLP4 96
ADDRLP4 84
INDIRB
ASGNB 12
line 327
;327:    VectorMA(up, STEPSIZE, normal, up);
ADDRLP4 196
CNSTF4 1099956224
ASGNF4
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 196
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 196
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 330
;328:
;329:    // test the player position if they were a stepheight higher
;330:    pm->trace(&trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 24
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRLP4 200
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 200
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 200
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 200
INDIRP4
CNSTI4 352
ADDP4
INDIRP4
CALLV
pop
line 331
;331:    if (trace.allsolid) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $260
line 332
;332:      if (pm->debugLevel)
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $262
line 333
;333:        Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $264
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $262
line 335
;334:
;335:      return stepped; // can't step up
ADDRLP4 108
INDIRI4
RETI4
ADDRGP4 $207
JUMPV
LABELV $260
line 338
;336:    }
;337:
;338:    VectorSubtract(trace.endpos, start_o, step_v);
ADDRLP4 112
ADDRLP4 24+12
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 84+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 24+12+8
INDIRF4
ADDRLP4 84+8
INDIRF4
SUBF4
ASGNF4
line 339
;339:    VectorCopy(step_v, step_vNormal);
ADDRLP4 124
ADDRLP4 112
INDIRB
ASGNB 12
line 340
;340:    VectorNormalize(step_vNormal);
ADDRLP4 124
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 342
;341:
;342:    stepSize = DotProduct(normal, step_vNormal) * VectorLength(step_v);
ADDRLP4 112
ARGP4
ADDRLP4 204
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 0
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 124+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 124+8
INDIRF4
MULF4
ADDF4
ADDRLP4 204
INDIRF4
MULF4
ASGNF4
line 344
;343:    // try slidemove from this position
;344:    VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 345
;345:    VectorCopy(start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 140
INDIRB
ASGNB 12
line 347
;346:
;347:    if (PM_SlideMove(gravity) == 0) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 208
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
NEI4 $279
line 348
;348:      if (pm->debugLevel)
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $281
line 349
;349:        Com_Printf("%d: step up\n", c_pmove);
ADDRGP4 $283
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $281
line 351
;350:
;351:      stepped = qtrue;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 352
;352:    }
LABELV $279
line 355
;353:
;354:    // push down the final amount
;355:    VectorCopy(pm->ps->origin, down);
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 356
;356:    VectorMA(down, -stepSize, normal, down);
ADDRLP4 212
ADDRLP4 136
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 136
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 357
;357:    pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 24
ARGP4
ADDRLP4 216
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 216
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 220
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 216
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 216
INDIRP4
CNSTI4 352
ADDP4
INDIRP4
CALLV
pop
line 359
;358:
;359:    if (!trace.allsolid)
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $290
line 360
;360:      VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
LABELV $290
line 362
;361:
;362:    if (trace.fraction < 1.0f)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $293
line 363
;363:      PM_ClipVelocity(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 24+24
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
LABELV $293
line 364
;364:  }
LABELV $217
line 366
;365:
;366:  if (!predictive && stepped)
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 184
INDIRI4
NEI4 $297
ADDRLP4 108
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $297
line 367
;367:    PM_StepEvent(start_o, pm->ps->origin, normal);
ADDRLP4 84
ARGP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PM_StepEvent
CALLV
pop
LABELV $297
line 369
;368:
;369:  return stepped;
ADDRLP4 108
INDIRI4
RETI4
LABELV $207
endproc PM_StepSlideMove 228 28
export PM_PredictStepMove
proc PM_PredictStepMove 36 8
line 377
;370:}
;371:
;372:/*
;373:==================
;374:PM_PredictStepMove
;375:==================
;376: */
;377:qboolean PM_PredictStepMove(void) {
line 380
;378:  vec3_t velocity, origin;
;379:  float impactSpeed;
;380:  qboolean stepped = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 382
;381:
;382:  VectorCopy(pm->ps->velocity, velocity);
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 383
;383:  VectorCopy(pm->ps->origin, origin);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 384
;384:  impactSpeed = pml.impactSpeed;
ADDRLP4 28
ADDRGP4 pml+116
INDIRF4
ASGNF4
line 386
;385:
;386:  if (PM_StepSlideMove(qfalse, qtrue))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 PM_StepSlideMove
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $301
line 387
;387:    stepped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $301
line 389
;388:
;389:  VectorCopy(velocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 390
;390:  VectorCopy(origin, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 391
;391:  pml.impactSpeed = impactSpeed;
ADDRGP4 pml+116
ADDRLP4 28
INDIRF4
ASGNF4
line 393
;392:
;393:  return stepped;
ADDRLP4 0
INDIRI4
RETI4
LABELV $299
endproc PM_PredictStepMove 36 8
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import pm
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
LABELV $283
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 32
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $231
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $206
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
