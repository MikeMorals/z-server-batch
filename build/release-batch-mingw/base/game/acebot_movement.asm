export ACEMV_CanMove
code
proc ACEMV_CanMove 140 28
file "..\..\..\..\src/game/acebot_movement.c"
line 38
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
;24://  acebot_movement.c - This file contains all of the
;25://                      movement routines for the ACE bot
;26:
;27:
;28:#include "g_local.h"
;29:#include "acebot.h"
;30:
;31:#if defined(ACEBOT)
;32:
;33:// Checks if bot can move (really just checking the ground)
;34:// Also, this is not a real accurate check, but does a
;35:// pretty good job and looks for lava/slime.
;36:qboolean
;37:ACEMV_CanMove(gentity_t * self, int direction)
;38:{
line 45
;39:  vec3_t forward, right;
;40:  vec3_t offset, start, end;
;41:  vec3_t angles;
;42:  trace_t tr;
;43:
;44:  // airborne
;45:  if (self->s.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $88
line 46
;46:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 49
;47:
;48:  // now check to see if move will move us off an edge
;49:  VectorCopy(self->bs.viewAngles, angles);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
INDIRB
ASGNB 12
line 51
;50:
;51:  if (direction == MOVE_LEFT)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $90
line 52
;52:    angles[YAW] += 90;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
ADDRGP4 $91
JUMPV
LABELV $90
line 53
;53:  else if (direction == MOVE_RIGHT)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $93
line 54
;54:    angles[YAW] -= 90;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
CNSTF4 1119092736
SUBF4
ASGNF4
ADDRGP4 $94
JUMPV
LABELV $93
line 55
;55:  else if (direction == MOVE_BACK)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $96
line 56
;56:    angles[YAW] -= 180;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
CNSTF4 1127481344
SUBF4
ASGNF4
LABELV $96
LABELV $94
LABELV $91
line 59
;57:
;58:  // set up the vectors
;59:  AngleVectors(angles, forward, right, NULL);
ADDRLP4 96
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 61
;60:
;61:  VectorSet(offset, 36, 0, 24);
ADDRLP4 0
CNSTF4 1108344832
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 1103101952
ASGNF4
line 62
;62:  G_ProjectSource(self->client->ps.origin, offset, forward, right, start);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 64
;63:
;64:  VectorSet(offset, 36, 0, -400);
ADDRLP4 0
CNSTF4 1108344832
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 3284664320
ASGNF4
line 65
;65:  G_ProjectSource(self->client->ps.origin, offset, forward, right, end);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 120
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 67
;66:
;67:  trap_Trace(&tr, start, NULL, NULL, end, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 108
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
ADDRLP4 120
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
line 70
;68:
;69:  //  if((tr.fraction > 0.3 && tr.fraction != 1) || (tr.contents & (CONTENTS_LAVA | CONTENTS_SLIME)))
;70:  if ((tr.fraction == 1.0)
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
EQF4 $107
ADDRLP4 36+48
INDIRI4
CNSTI4 2097176
BANDI4
CNSTI4 0
EQI4 $103
LABELV $107
line 72
;71:      || (tr.contents & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_DONOTENTER)))
;72:  {
line 73
;73:    if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $108
line 74
;74:      G_Printf("%s:" S_COLOR_WHITE " move blocked\n", self->client->pers.netname);
ADDRGP4 $111
ARGP4
ADDRLP4 136
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $108
line 75
;75:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $103
line 78
;76:  }
;77:
;78:  return qtrue; // yup, can move
CNSTI4 1
RETI4
LABELV $87
endproc ACEMV_CanMove 140 28
export ACEMV_SpecialMove
proc ACEMV_SpecialMove 160 28
line 87
;79:}
;80:
;81:// Handle special cases of crouch/jump
;82://
;83:// If the move is resolved here, this function returns
;84:// true.
;85:qboolean
;86:ACEMV_SpecialMove(gentity_t * self)
;87:{
line 93
;88:  vec3_t dir, forward, right, start, end, offset;
;89:  vec3_t top;
;90:  trace_t tr;
;91:
;92:  // Get current direction
;93:  VectorCopy(self->client->ps.viewangles, dir);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 94
;94:  dir[YAW] = self->bs.viewAngles[YAW];
ADDRLP4 96+4
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
INDIRF4
ASGNF4
line 95
;95:  AngleVectors(dir, forward, right, NULL);
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 97
;96:
;97:  VectorSet(offset, 18, 0, 0);
ADDRLP4 0
CNSTF4 1099956224
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 98
;98:  G_ProjectSource(self->client->ps.origin, offset, forward, right, start);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 99
;99:  offset[0] += 18;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 100
;100:  G_ProjectSource(self->client->ps.origin, offset, forward, right, end);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 103
;101:
;102:  // trace it
;103:  start[2] += 18; // so they are not jumping all the time
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 104
;104:  end[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 107
;105:
;106:  //tr = gi.trace(start, self->mins, self->maxs, end, self, MASK_MONSTERSOLID);
;107:  trap_Trace(&tr, start, self->r.mins, self->r.maxs, end, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
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
ADDRLP4 24
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
line 109
;108:
;109:  if (tr.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $118
line 110
;110:  {
line 112
;111:    // check for crouching
;112:    start[2] -= 14;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1096810496
SUBF4
ASGNF4
line 113
;113:    end[2] -= 14;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1096810496
SUBF4
ASGNF4
line 116
;114:
;115:    // set up for crouching check
;116:    VectorCopy(self->r.maxs, top);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 117
;117:    top[2] = 0.0; // crouching height
ADDRLP4 132+8
CNSTF4 0
ASGNF4
line 120
;118:
;119:    //tr = gi.trace(start, self->mins, top, end, self, MASK_PLAYERSOLID);
;120:    trap_Trace(&tr, start, self->r.mins, self->r.maxs, top, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 148
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 123
;121:
;122:    // crouch
;123:    if (!tr.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $123
line 124
;124:    {
line 125
;125:      if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 152
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $125
line 126
;126:      {
line 127
;127:        botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 128
;128:      }
LABELV $125
line 129
;129:      botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 130
;130:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $112
JUMPV
LABELV $123
line 134
;131:    }
;132:
;133:    // check for jump
;134:    start[2] += 32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 135
;135:    end[2] += 32;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 138
;136:
;137:    //tr = gi.trace(start, self->mins, self->maxs, end, self, MASK_MONSTERSOLID);
;138:    trap_Trace(&tr, start, self->r.mins, self->r.maxs, end, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 152
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 140
;139:
;140:    if (!tr.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $129
line 141
;141:    {
line 142
;142:      if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 156
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $131
line 143
;143:      {
line 144
;144:        botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 145
;145:      }
LABELV $131
line 146
;146:      self->client->pers.cmd.upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 127
ASGNI1
line 147
;147:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $112
JUMPV
LABELV $129
line 149
;148:    }
;149:  }
LABELV $118
line 151
;150:
;151:  return qfalse; // We did not resolve a move here
CNSTI4 0
RETI4
LABELV $112
endproc ACEMV_SpecialMove 160 28
proc ACEMV_CheckEyes 392 28
line 162
;152:}
;153:
;154:// Checks for obstructions in front of bot
;155://
;156:// This is a function I created origianlly for ACE that
;157:// tries to help steer the bot around obstructions.
;158://
;159:// If the move is resolved here, this function returns true.
;160:static qboolean
;161:ACEMV_CheckEyes(gentity_t * self)
;162:{
line 172
;163:  vec3_t forward, right;
;164:  vec3_t leftstart, rightstart, focalpoint;
;165:  vec3_t upstart, upend;
;166:  vec3_t dir, offset;
;167:
;168:  trace_t traceRight, traceLeft, traceUp, traceFront; // for eyesight
;169:  gentity_t *traceEntity;
;170:
;171:  // get current angle and set up "eyes"
;172:  VectorCopy(self->bs.viewAngles, dir);
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
INDIRB
ASGNB 12
line 173
;173:  AngleVectors(dir, forward, right, NULL);
ADDRLP4 204
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 176
;174:
;175:  // let them move to targets by walls
;176:  if (!self->bs.moveTarget)
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $134
line 177
;177:    VectorSet(offset, 200, 0, 4); // focalpoint
ADDRLP4 0
CNSTF4 1128792064
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 1082130432
ASGNF4
ADDRGP4 $135
JUMPV
LABELV $134
line 179
;178:else
;179:    VectorSet(offset, 36, 0, 4); // focalpoint
ADDRLP4 0
CNSTF4 1108344832
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 1082130432
ASGNF4
LABELV $135
line 181
;180:
;181:    G_ProjectSource(self->client->ps.origin, offset, forward, right, focalpoint);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 185
;182:
;183:    // Check from self to focalpoint
;184:    // Ladder code
;185:    VectorSet(offset, 36, 0, 0); // set as high as possible
ADDRLP4 0
CNSTF4 1108344832
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 186
;186:    G_ProjectSource(self->client->ps.origin, offset, forward, right, upend);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 188
;187:
;188:    trap_Trace(&traceFront, self->client->ps.origin, self->r.mins, self->r.maxs, upend, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 276
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 352
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 191
;189:
;190:    // if this check fails we need to continue on with more detailed checks
;191:    if(traceFront.fraction == 1)
ADDRLP4 276+8
INDIRF4
CNSTF4 1065353216
NEF4 $142
line 192
;192:    {
line 193
;193:      if(ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 356
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $145
line 194
;194:      {
line 195
;195:        botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 196
;196:      }
LABELV $145
line 197
;197:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $142
line 200
;198:    }
;199:
;200:    VectorSet(offset, 0, 18, 4);
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 1099956224
ASGNF4
ADDRLP4 0+8
CNSTF4 1082130432
ASGNF4
line 201
;201:    G_ProjectSource(self->client->ps.origin, offset, forward, right, leftstart);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 203
;202:
;203:    offset[1] -= 36; // want to make sure this is correct
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1108344832
SUBF4
ASGNF4
line 205
;204:    //VectorSet(offset, 0, -18, 4);
;205:    G_ProjectSource(self->client->ps.origin, offset, forward, right, rightstart);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 192
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 207
;206:
;207:    trap_Trace(&traceRight, rightstart, NULL, NULL, focalpoint, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 120
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 356
CNSTP4 0
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 108
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
line 208
;208:    trap_Trace(&traceLeft, leftstart, NULL, NULL, focalpoint, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 180
ARGP4
ADDRLP4 360
CNSTP4 0
ASGNP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 108
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
line 214
;209:
;210:    // wall checking code, this will degenerate progressivly so the least cost
;211:    // check will be done first.
;212:
;213:    // if open space move ok
;214:    if(traceLeft.entityNum != ENTITYNUM_WORLD)
ADDRLP4 48+52
INDIRI4
CNSTI4 1022
EQI4 $150
line 215
;215:    {
line 216
;216:      traceEntity = &g_entities[traceLeft.entityNum];
ADDRLP4 348
CNSTI4 2476
ADDRLP4 48+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 217
;217:    }
ADDRGP4 $151
JUMPV
LABELV $150
line 219
;218:    else
;219:    {
line 220
;220:      traceEntity = NULL;
ADDRLP4 348
CNSTP4 0
ASGNP4
line 221
;221:    }
LABELV $151
line 223
;222:
;223:    if(traceRight.fraction != 1 || traceLeft.fraction != 1) // || (traceEntity && strcmp(traceEntity->classname, "func_door") != 0))
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRLP4 120+8
INDIRF4
ADDRLP4 364
INDIRF4
NEF4 $158
ADDRLP4 48+8
INDIRF4
ADDRLP4 364
INDIRF4
EQF4 $154
LABELV $158
line 225
;224:
;225:    {
line 227
;226:      // special uppoint logic to check for slopes/stairs/jumping etc.
;227:      VectorSet(offset, 0, 18, 24);
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 1099956224
ASGNF4
ADDRLP4 0+8
CNSTF4 1103101952
ASGNF4
line 228
;228:      G_ProjectSource(self->client->ps.origin, offset, forward, right, upstart);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 336
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 230
;229:
;230:      VectorSet(offset, 0, 0, 200); // scan for height above head
ADDRLP4 368
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 368
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 368
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1128792064
ASGNF4
line 231
;231:      G_ProjectSource(self->client->ps.origin, offset, forward, right, upend);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 232
;232:      trap_Trace(&traceUp, upstart, NULL, NULL, upend, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 216
ARGP4
ADDRLP4 336
ARGP4
ADDRLP4 372
CNSTP4 0
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 36
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
line 234
;233:
;234:      VectorSet(offset, 200, 0, 200 * traceUp.fraction - 5); // set as high as possible
ADDRLP4 0
CNSTF4 1128792064
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 1128792064
ADDRLP4 216+8
INDIRF4
MULF4
CNSTF4 1084227584
SUBF4
ASGNF4
line 235
;235:      G_ProjectSource(self->client->ps.origin, offset, forward, right, upend);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 236
;236:      trap_Trace(&traceUp, upstart, NULL, NULL, upend, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 216
ARGP4
ADDRLP4 336
ARGP4
ADDRLP4 376
CNSTP4 0
ASGNP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRLP4 36
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
line 239
;237:
;238:      // If the upper trace is not open, we need to turn.
;239:      if(traceUp.fraction != 1)
ADDRLP4 216+8
INDIRF4
CNSTF4 1065353216
EQF4 $166
line 240
;240:      {
line 241
;241:        if(traceRight.fraction > traceLeft.fraction)
ADDRLP4 120+8
INDIRF4
ADDRLP4 48+8
INDIRF4
LEF4 $169
line 242
;242:        self->bs.viewAngles[YAW] += (1.0 - traceLeft.fraction) * 45.0;
ADDRLP4 380
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ASGNP4
ADDRLP4 380
INDIRP4
ADDRLP4 380
INDIRP4
INDIRF4
CNSTF4 1110704128
CNSTF4 1065353216
ADDRLP4 48+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $170
JUMPV
LABELV $169
line 244
;243:        else
;244:        self->bs.viewAngles[YAW] += -(1.0 - traceRight.fraction) * 45.0;
ADDRLP4 384
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRF4
CNSTF4 1110704128
CNSTF4 1065353216
ADDRLP4 120+8
INDIRF4
SUBF4
NEGF4
MULF4
ADDF4
ASGNF4
LABELV $170
line 246
;245:
;246:        if(ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 388
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $175
line 247
;247:        {
line 248
;248:          botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 249
;249:        }
LABELV $175
line 250
;250:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $166
line 252
;251:      }
;252:    }
LABELV $154
line 254
;253:
;254:    return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc ACEMV_CheckEyes 392 28
export ACEMV_ChangeBotAngle
proc ACEMV_ChangeBotAngle 48 8
line 264
;255:  }
;256:
;257:  // Make the change in angles a little more gradual, not so snappy
;258:  // Subtle, but noticeable.
;259:  //
;260:  // Modified from the original id ChangeYaw code...
;261:void VectorToAngles(const vec3_t value1, vec3_t angles);
;262:void
;263:ACEMV_ChangeBotAngle(gentity_t * ent)
;264:{
line 273
;265:#if 1
;266:  vec3_t ideal_angles;
;267:  float ideal_yaw;
;268:  float ideal_pitch;
;269:  float current_yaw;
;270:  float current_pitch;
;271:
;272:  // Normalize the move angle first
;273:  VectorNormalize(ent->bs.moveVector);
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 275
;274:
;275:  current_yaw = AngleNormalize360(ent->bs.viewAngles[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 28
INDIRF4
ASGNF4
line 276
;276:  current_pitch = AngleNormalize360(ent->bs.viewAngles[PITCH]);
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 32
INDIRF4
ASGNF4
line 278
;277:
;278:  VectorToAngles(ent->bs.moveVector, ideal_angles);
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 VectorToAngles
CALLV
pop
line 280
;279:
;280:  ideal_yaw = AngleNormalize360(ideal_angles[YAW]);
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 281
;281:  ideal_pitch = AngleNormalize360(ideal_angles[PITCH]);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 284
;282:
;283:  // yaw
;284:  if (current_yaw != ideal_yaw)
ADDRLP4 20
INDIRF4
ADDRLP4 12
INDIRF4
EQF4 $179
line 285
;285:  {
line 309
;286:    /*move = ideal_yaw - current_yaw;
;287:     speed = ent->bs.turnSpeed;
;288:     if (ideal_yaw > current_yaw)
;289:     {
;290:     if (move >= 180)
;291:     move = move - 360;
;292:     }
;293:     else
;294:     {
;295:     if (move <= -180)
;296:     move = move + 360;
;297:     }
;298:     if (move > 0)
;299:     {
;300:     if (move > speed)
;301:     move = speed;
;302:     }
;303:     else
;304:     {
;305:     if (move < -speed)
;306:     move = -speed;
;307:     }*/
;308:    //ent->bs.viewAngles[YAW] = AngleNormalize360(current_yaw + move);
;309:    ent->bs.viewAngles[YAW] = AngleNormalize360(ideal_yaw);
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 310
;310:  }
LABELV $179
line 313
;311:
;312:  // pitch
;313:  if (current_pitch != ideal_pitch)
ADDRLP4 24
INDIRF4
ADDRLP4 16
INDIRF4
EQF4 $181
line 314
;314:  {
line 338
;315:    /*move = ideal_pitch - current_pitch;
;316:     speed = ent->bs.turnSpeed;
;317:     if (ideal_pitch > current_pitch)
;318:     {
;319:     if (move >= 180)
;320:     move = move - 360;
;321:     }
;322:     else
;323:     {
;324:     if (move <= -180)
;325:     move = move + 360;
;326:     }
;327:     if (move > 0)
;328:     {
;329:     if (move > speed)
;330:     move = speed;
;331:     }
;332:     else
;333:     {
;334:     if (move < -speed)
;335:     move = -speed;
;336:     }*/
;337:    //ent->bs.viewAngles[PITCH] = AngleNormalize360(current_pitch + move);
;338:    ent->bs.viewAngles[PITCH] = AngleNormalize360(ideal_pitch);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 339
;339:  }
LABELV $181
line 343
;340:#else
;341:
;342:#endif
;343:}
LABELV $177
endproc ACEMV_ChangeBotAngle 48 8
export ACEMV_MoveToGoal
proc ACEMV_MoveToGoal 40 8
line 348
;344:
;345:// Set bot to move to it's moveTarget. (following node path)
;346:void
;347:ACEMV_MoveToGoal(gentity_t * self)
;348:{
line 351
;349:  // if a rocket or grenade is around deal with it
;350:  // simple, but effective (could be rewritten to be more accurate)
;351:  if ((strcmp(self->bs.moveTarget->classname, "rocket") == 0 || strcmp(
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $188
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $184
LABELV $188
line 353
;352:    self->bs.moveTarget->classname, "grenade") == 0))
;353:  {
line 354
;354:    VectorSubtract(self->bs.moveTarget->s.origin, self->client->ps.origin, self->bs.moveVector);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2372
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2376
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 355
;355:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 357
;356:
;357:    if (ace_debug.integer)
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $189
line 358
;358:      trap_SendServerCommand(
ADDRGP4 $192
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
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $189
line 364
;359:        -1, va("print \"%s: Oh crap a rocket!\n\"", self->client->pers.netname));
;360:
;361:    //trap_SendServerCommand(-1, va("%s \"%s%c%c%s\"", mode == SAY_TEAM ? "tchat" : "chat", name, Q_COLOR_ESCAPE, color, message));
;362:
;363:    // strafe left/right
;364:    if (rand() % 1 && ACEMV_CanMove(self, MOVE_LEFT))
ADDRGP4 rand
CALLI4
pop
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $193
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $193
line 365
;365:    {
line 366
;366:      self->client->pers.cmd.rightmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
CNSTI1 -127
ASGNI1
line 367
;367:    }
ADDRGP4 $183
JUMPV
LABELV $193
line 368
;368:    else if (ACEMV_CanMove(self, MOVE_RIGHT))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $183
line 369
;369:    {
line 370
;370:      self->client->pers.cmd.rightmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
CNSTI1 127
ASGNI1
line 371
;371:    }
line 372
;372:    return;
ADDRGP4 $183
JUMPV
LABELV $184
line 376
;373:
;374:  }
;375:  else
;376:  {
line 378
;377:    // set bot's movement direction
;378:    VectorSubtract(self->bs.moveTarget->s.origin, self->client->ps.origin, self->bs.moveVector);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2372
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2376
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 379
;379:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 381
;380:
;381:    if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $183
line 382
;382:    {
line 383
;383:      botWalk(self, 60);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 384
;384:    }
line 385
;385:    return;
LABELV $183
endproc ACEMV_MoveToGoal 40 8
export ACEMV_Move
proc ACEMV_Move 88 8
line 392
;386:  }
;387:}
;388:
;389:// Main movement code. (following node path)
;390:void
;391:ACEMV_Move(gentity_t * self)
;392:{
line 393
;393:  int currentNodeType = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 394
;394:  int nextNodeType = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 395
;395:  int lastNodeType = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 398
;396:
;397:  // get current and next node back from nav code.
;398:  if (!ACEND_FollowPath(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 ACEND_FollowPath
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $200
line 399
;399:  {
line 400
;400:    self->bs.state = STATE_WANDER;
ADDRFP4 0
INDIRP4
CNSTI4 2424
ADDP4
CNSTI4 3
ASGNI4
line 401
;401:    self->bs.wander_timeout = level.time + 1000;
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
line 403
;402:
;403:    return;
ADDRGP4 $199
JUMPV
LABELV $200
line 406
;404:  }
;405:  else
;406:  {
line 407
;407:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 408
;408:  }
line 410
;409:
;410:  currentNodeType = nodes[self->bs.currentNode].type;
ADDRLP4 4
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
line 411
;411:  nextNodeType = nodes[self->bs.nextNode].type;
ADDRLP4 0
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
line 412
;412:  lastNodeType = nodes[self->bs.lastNode].type;
ADDRLP4 8
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
line 415
;413:
;414:  // move to a selected goal, if any
;415:  if (self->bs.moveTarget)
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 416
;416:  {
line 417
;417:    ACEMV_MoveToGoal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_MoveToGoal
CALLV
pop
line 418
;418:  }
LABELV $206
line 420
;419:
;420:  if (self->botPause > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $208
line 421
;421:  {
line 422
;422:    return;
ADDRGP4 $199
JUMPV
LABELV $208
line 430
;423:  }
;424:
;425:  ////////////////////////////////////////////////////////////////////////////
;426:  // SPECIAL CROUCH JUMPING
;427:  // This happend when player jump to fast that dont leave a crouch node
;428:  // On for example a window, so the bot will try 3 times till make it.
;429:  ////////////////////////////////////////////////////////////////////////////
;430:  if (self->bs.tries == 1 && nodes[self->bs.currentNode].type == NODE_JUMP
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2420
ADDP4
INDIRI4
CNSTI4 1
NEI4 $211
ADDRLP4 20
CNSTI4 24
ASGNI4
ADDRLP4 24
CNSTI4 6
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $211
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $211
line 432
;431:      && nodes[self->bs.nextNode].type == NODE_JUMP)
;432:  {
line 433
;433:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 434
;434:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 435
;435:    botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 436
;436:    if (self->s.pos.trDelta[2] < -50)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 3259498496
GEF4 $199
line 437
;437:    {
line 438
;438:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 439
;439:      botCrouch(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 botCrouch
CALLV
pop
line 440
;440:      if (self->s.origin[2] <= nodes[self->bs.nextNode].origin[2])
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTI4 24
ADDRLP4 28
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
GTF4 $217
line 441
;441:      {
line 442
;442:        self->client->ps.velocity[2] += 120;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 443
;443:      }
LABELV $217
line 444
;444:      self->client->ps.velocity[2] += 70;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1116471296
ADDF4
ASGNF4
line 445
;445:    }
line 446
;446:    return;
ADDRGP4 $199
JUMPV
LABELV $211
line 451
;447:  }
;448:  ////////////////////////////////////////////////////////////////////////////
;449:  // CROUCH JUMPING
;450:  ////////////////////////////////////////////////////////////////////////////
;451:  if (nextNodeType == NODE_DUCK && currentNodeType == NODE_JUMP && self->s.groundEntityNum
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $220
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $220
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $220
line 453
;452:      != ENTITYNUM_NONE)
;453:  {
line 454
;454:    botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 455
;455:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 456
;456:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 457
;457:    return;
ADDRGP4 $199
JUMPV
LABELV $220
line 460
;458:  }
;459:
;460:  if (nextNodeType == NODE_DUCK && currentNodeType == NODE_JUMP && self->s.groundEntityNum
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $222
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $222
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $222
line 462
;461:      == ENTITYNUM_NONE)
;462:  {
line 463
;463:    if (self->s.pos.trDelta[2] < -50)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 3259498496
GEF4 $224
line 464
;464:    {
line 465
;465:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 466
;466:      botCrouch(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 botCrouch
CALLV
pop
line 467
;467:      if (self->s.origin[2] <= nodes[self->bs.nextNode].origin[2])
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTI4 24
ADDRLP4 28
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
GTF4 $226
line 468
;468:      {
line 469
;469:        self->client->ps.velocity[2] += 120;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 470
;470:      }
LABELV $226
line 471
;471:      self->client->ps.velocity[2] += 70;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1116471296
ADDF4
ASGNF4
line 472
;472:      ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 473
;473:      return;
ADDRGP4 $199
JUMPV
LABELV $224
line 475
;474:    }
;475:  }
LABELV $222
line 479
;476:  ////////////////////////////////////////////////////////////////////////////
;477:  // CROUCH is not exclusive
;478:  ////////////////////////////////////////////////////////////////////////////
;479:  if (nextNodeType == NODE_DUCK || currentNodeType == NODE_DUCK)
ADDRLP4 28
CNSTI4 10
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $231
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $229
LABELV $231
line 480
;480:  {
line 481
;481:    botCrouch(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 botCrouch
CALLV
pop
line 482
;482:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 483
;483:    if (nextNodeType != NODE_DUCK)
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $232
line 484
;484:    {
line 485
;485:      ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 486
;486:    }
LABELV $232
line 487
;487:  }
LABELV $229
line 492
;488:
;489:  ////////////////////////////////////////////////////////////////////////////
;490:  // Special Jump
;491:  ////////////////////////////////////////////////////////////////////////////
;492:  if (lastNodeType == NODE_MOVE
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $234
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $234
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $234
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $234
line 495
;493:      && currentNodeType == NODE_JUMP
;494:      && nextNodeType == NODE_MOVE && !self->bs.isJumping)
;495:  {
line 496
;496:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 497
;497:    botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 498
;498:    self->client->ps.velocity[2] = 211;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1129512960
ASGNF4
line 499
;499:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 500
;500:    self->bs.isJumping = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 501
;501:    return;
ADDRGP4 $199
JUMPV
LABELV $234
line 507
;502:  }
;503:
;504:  ////////////////////////////////////////////////////////
;505:  // Jumpto Nodes
;506:  ///////////////////////////////////////////////////////
;507:  if (!self->bs.isJumping && (lastNodeType == NODE_JUMP || (currentNodeType == NODE_JUMP
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
NEI4 $236
ADDRLP4 40
CNSTI4 6
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $240
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $241
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
CNSTI4 100
ADDP4
INDIRF4
GTF4 $240
LABELV $241
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $236
LABELV $240
line 509
;508:      && nodes[self->bs.nextNode].origin[2] > self->s.origin[2]) || nextNodeType == NODE_JUMP))
;509:  {
line 511
;510:    // Set up a jump move
;511:    if (currentNodeType == NODE_JUMP && nextNodeType == NODE_JUMP && self->s.groundEntityNum
ADDRLP4 44
CNSTI4 6
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $242
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $242
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $242
line 513
;512:        != ENTITYNUM_NONE)
;513:    {
line 514
;514:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 515
;515:      botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 516
;516:      self->client->ps.velocity[2] = 211;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1129512960
ASGNF4
line 517
;517:      ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 518
;518:      self->bs.isJumping = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 519
;519:      if (Distance2d(nodes[self->bs.nextNode].origin, nodes[self->bs.currentNode].origin) >= 288
ADDRLP4 48
CNSTI4 24
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRGP4 nodes
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ARGP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 2400
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 Distance2d
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 288
GEI4 $247
ADDRFP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ADDRGP4 level+28
INDIRI4
LEI4 $199
LABELV $247
line 521
;520:          || ((self->botPause + 200) > level.time))
;521:      {
line 522
;522:        VectorNormalize(self->client->ps.velocity);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 523
;523:        VectorScale(self->client->ps.velocity, 320, self->client->ps.velocity);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTF4 1134559232
ADDRLP4 64
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1134559232
ADDRLP4 68
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTF4 1134559232
ADDRLP4 72
INDIRP4
INDIRF4
MULF4
ASGNF4
line 524
;524:        self->client->ps.velocity[2] += 75;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1117126656
ADDF4
ASGNF4
line 525
;525:        if (self->s.origin[2] + 40 <= nodes[self->bs.nextNode].origin[2])
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1109393408
ADDF4
CNSTI4 24
ADDRLP4 80
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
GTF4 $248
line 526
;526:        {
line 527
;527:          self->client->ps.velocity[2] += 30;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 528
;528:        }
LABELV $248
line 529
;529:        self->bs.isLongJumping = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
CNSTI4 1
ASGNI4
line 530
;530:      }
line 531
;531:      return;
ADDRGP4 $199
JUMPV
LABELV $242
line 533
;532:    }
;533:  }
LABELV $236
line 534
;534:  if (self->bs.isJumping)
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $251
line 535
;535:  {
line 536
;536:    if (lastNodeType == NODE_JUMP)
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $253
line 537
;537:    {
line 538
;538:      self->bs.isJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 0
ASGNI4
line 539
;539:      self->bs.isLongJumping = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
CNSTI4 0
ASGNI4
line 540
;540:    }
ADDRGP4 $254
JUMPV
LABELV $253
line 542
;541:    else
;542:    {
line 543
;543:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 544
;544:      botJump(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botJump
CALLV
pop
line 547
;545:      //Trying to keep momentum, so dont fall to fast.
;546:
;547:      if (self->bs.isLongJumping)
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 548
;548:      {
line 549
;549:        if (self->client->ps.velocity[2] != 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
EQF4 $256
line 550
;550:        {
line 551
;551:          self->client->ps.velocity[2] += 30;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 552
;552:        }
line 553
;553:      }
ADDRGP4 $256
JUMPV
LABELV $255
line 555
;554:      else
;555:      {
line 556
;556:        if (self->client->ps.velocity[2] != 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
EQF4 $259
line 557
;557:        {
line 558
;558:          self->client->ps.velocity[2] += 20;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 559
;559:        }
LABELV $259
line 560
;560:      }
LABELV $256
line 561
;561:      ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 562
;562:    }
LABELV $254
line 563
;563:  }
LABELV $251
line 568
;564:
;565:  ////////////////////////////////////////////////////////
;566:  // Ladder Nodes
;567:  ///////////////////////////////////////////////////////
;568:  if (nextNodeType == NODE_LADDER && nodes[self->bs.nextNode].origin[2] > self->s.origin[2])
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $261
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 24
ADDRLP4 44
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
LEF4 $261
line 569
;569:  {
line 571
;570:    // Otherwise move as fast as we can
;571:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 572
;572:    self->client->ps.velocity[2] = 320;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1134559232
ASGNF4
line 573
;573:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 574
;574:    return;
ADDRGP4 $199
JUMPV
LABELV $261
line 578
;575:
;576:  }
;577:  // If getting off the ladder
;578:  if (currentNodeType == NODE_LADDER && nextNodeType != NODE_LADDER
ADDRLP4 48
CNSTI4 9
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $264
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $264
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 24
ADDRLP4 52
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes+8
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
LEF4 $264
line 580
;579:      && nodes[self->bs.nextNode].origin[2] > self->s.origin[2])
;580:  {
line 581
;581:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 582
;582:    self->client->pers.cmd.upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 127
ASGNI1
line 583
;583:    self->client->ps.velocity[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 584
;584:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 585
;585:    return;
ADDRGP4 $199
JUMPV
LABELV $264
line 591
;586:  }
;587:
;588:  ////////////////////////////////////////////////////////
;589:  // WATER Nodes
;590:  ///////////////////////////////////////////////////////
;591:  if (currentNodeType == NODE_WATER)
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $267
line 592
;592:  {
line 594
;593:    // we need to be pointed up/down
;594:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 597
;595:
;596:    // ff the next node is not in the water, then move up to get out.
;597:    if (nextNodeType != NODE_WATER && !(trap_PointContents(
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $269
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 24
ADDRLP4 56
INDIRP4
CNSTI4 2408
ADDP4
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $269
line 599
;598:      nodes[self->bs.nextNode].origin, self->s.number) & MASK_WATER))
;599:    {
line 601
;600:      // exit water
;601:      self->client->pers.cmd.upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 127
ASGNI1
line 602
;602:    }
LABELV $269
line 604
;603:
;604:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 605
;605:    return;
ADDRGP4 $199
JUMPV
LABELV $267
line 612
;606:
;607:  }
;608:
;609:  ////////////////////////////////////////////////////////
;610:  // FALLING
;611:  ///////////////////////////////////////////////////////
;612:  if (self->s.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $271
line 613
;613:  {
line 614
;614:    ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 616
;615:
;616:    self->client->ps.velocity[0] = self->bs.moveVector[0] * 360;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1135869952
ADDRLP4 56
INDIRP4
CNSTI4 2368
ADDP4
INDIRF4
MULF4
ASGNF4
line 617
;617:    self->client->ps.velocity[1] = self->bs.moveVector[1] * 360;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1135869952
ADDRLP4 60
INDIRP4
CNSTI4 2372
ADDP4
INDIRF4
MULF4
ASGNF4
line 618
;618:    return;
ADDRGP4 $199
JUMPV
LABELV $271
line 623
;619:  }
;620:
;621:  // check to see if stuck, and if so try to free us
;622:  // also handles crouching
;623:  if (VectorLength(self->client->ps.velocity) < 37)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 1108606976
GEF4 $273
line 624
;624:  {
line 631
;625:    // keep a random factor just in case....
;626:    //    if (random() > 0.1 && ACEMV_SpecialMove(self))
;627:    //      return;
;628:    //
;629:    //    self->bs.viewAngles[YAW] += random() * 180 - 90;
;630:
;631:    if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 60
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $275
line 632
;632:    {
line 633
;633:      botWalk(self, 60);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 60
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 634
;634:      self->client->pers.cmd.buttons |= BUTTON_WALKING;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 635
;635:    }
ADDRGP4 $199
JUMPV
LABELV $275
line 636
;636:    else if (ACEMV_CanMove(self, MOVE_BACK))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 64
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $199
line 637
;637:      botWalk(self, -127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 638
;638:    return;
ADDRGP4 $199
JUMPV
LABELV $273
line 642
;639:  }
;640:
;641:  // otherwise move as fast as we can
;642:  if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 60
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $279
line 643
;643:  {
line 644
;644:    botWalk(self, 55);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 645
;645:  }
LABELV $279
line 647
;646:
;647:  ACEMV_ChangeBotAngle(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_ChangeBotAngle
CALLV
pop
line 648
;648:}
LABELV $199
endproc ACEMV_Move 88 8
export ACEMV_Wander
proc ACEMV_Wander 52 8
line 653
;649:
;650:// Wandering code (based on old ACE movement code)
;651:void
;652:ACEMV_Wander(gentity_t * self)
;653:{
line 657
;654:  vec3_t tmp;
;655:
;656:  // do not move
;657:  if (self->bs.next_move_time > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
INDIRF4
ADDRGP4 level+28
INDIRI4
CVIF4 4
LEF4 $282
line 658
;658:    return;
ADDRGP4 $281
JUMPV
LABELV $282
line 661
;659:
;660:  // is there a target to move to
;661:  if (self->bs.moveTarget)
ADDRFP4 0
INDIRP4
CNSTI4 2380
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $285
line 662
;662:  {
line 663
;663:    ACEMV_MoveToGoal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_MoveToGoal
CALLV
pop
line 664
;664:    return;
ADDRGP4 $281
JUMPV
LABELV $285
line 668
;665:  }
;666:
;667:  // swimming?
;668:  VectorCopy(self->client->ps.origin, tmp);
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
line 669
;669:  tmp[2] += 24;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 671
;670:
;671:  if (trap_PointContents(tmp, self->s.number) & MASK_WATER)
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $288
line 672
;672:  {
line 674
;673:    // if drowning and no node, move up
;674:    if (self->client->airOutTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 0
LEI4 $290
line 675
;675:    {
line 676
;676:      self->client->pers.cmd.upmove = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 1
ASGNI1
line 677
;677:      self->bs.viewAngles[PITCH] = -45;
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
CNSTF4 3258187776
ASGNF4
line 678
;678:    }
ADDRGP4 $291
JUMPV
LABELV $290
line 680
;679:    else
;680:      self->client->pers.cmd.upmove = 15;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 15
ASGNI1
LABELV $291
line 682
;681:
;682:    botWalk(self, 100);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 683
;683:  }
LABELV $288
line 685
;684:  else
;685:  {
line 687
;686:    //self->client->airOutTime = 0;    // probably shound not be messing with this, but
;687:  }
LABELV $289
line 690
;688:
;689:  // lava?
;690:  tmp[2] -= 48;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 691
;691:  if (trap_PointContents(tmp, self->s.number) & (CONTENTS_LAVA | CONTENTS_SLIME))
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $293
line 692
;692:  {
line 693
;693:    self->bs.viewAngles[YAW] += random() * 360 - 180;
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1127481344
SUBF4
ADDF4
ASGNF4
line 694
;694:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 695
;695:    self->client->pers.cmd.upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
CNSTI1 127
ASGNI1
line 696
;696:    return;
ADDRGP4 $281
JUMPV
LABELV $293
line 699
;697:  }
;698:
;699:  if (VectorLength(self->client->ps.velocity) < 37)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 1108606976
GEF4 $295
line 700
;700:  {
line 701
;701:    self->bs.viewAngles[YAW] += random() * 180 - 90;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1127481344
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1119092736
SUBF4
ADDF4
ASGNF4
line 703
;702:
;703:    if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $297
line 704
;704:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
ADDRGP4 $298
JUMPV
LABELV $297
line 705
;705:    else if (ACEMV_CanMove(self, MOVE_BACK))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 36
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $299
line 706
;706:      botWalk(self, -127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -127
ARGI4
ADDRGP4 botWalk
CALLV
pop
LABELV $299
LABELV $298
line 709
;707:
;708:    // if there is ground continue otherwise wait for next move
;709:    if ( /*!M_CheckBottom || */self->s.groundEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $281
line 710
;710:    {
line 711
;711:      if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 40
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $281
line 712
;712:        botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 713
;713:    }
line 715
;714:
;715:    return;
ADDRGP4 $281
JUMPV
LABELV $295
line 718
;716:  }
;717:
;718:  if (ACEMV_CheckEyes(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 ACEMV_CheckEyes
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $305
line 719
;719:    return;
ADDRGP4 $281
JUMPV
LABELV $305
line 721
;720:
;721:  if (ACEMV_CanMove(self, MOVE_FORWARD))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $307
line 722
;722:  {
line 723
;723:    if (level.time % 5000 && self->bs.state == STATE_WANDER && (self->client->ps.viewangles[PITCH]
ADDRGP4 level+28
INDIRI4
CNSTI4 5000
MODI4
CNSTI4 0
EQI4 $309
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 2424
ADDP4
INDIRI4
CNSTI4 3
NEI4 $309
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1135869952
EQF4 $309
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $309
line 725
;724:        != 360.0f && self->client->ps.viewangles[PITCH] != 0.0f))
;725:    {
line 726
;726:      self->client->ps.viewangles[PITCH] = AngleNormalize360(0.0f);
CNSTF4 0
ARGF4
ADDRLP4 40
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
ADDRLP4 40
INDIRF4
ASGNF4
line 727
;727:      self->bs.viewAngles[PITCH] = self->client->ps.viewangles[PITCH];
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 2352
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ASGNF4
line 728
;728:      G_SetClientViewAngle(self, self->client->ps.viewangles);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
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
line 729
;729:    }
LABELV $309
line 730
;730:    botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
line 731
;731:  }
LABELV $307
line 732
;732:}
LABELV $281
endproc ACEMV_Wander 52 8
export ACEMV_CheckShot
proc ACEMV_CheckShot 116 28
line 736
;733:
;734:qboolean
;735:ACEMV_CheckShot(gentity_t * self, vec3_t point)
;736:{
line 740
;737:  trace_t tr;
;738:  vec3_t start, forward, right, offset;
;739:
;740:  AngleVectors(self->bs.viewAngles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 742
;741:
;742:  VectorSet(offset, 8, 8, self->client->ps.viewheight - 8);
ADDRLP4 108
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 8
SUBI4
CVIF4 4
ASGNF4
line 743
;743:  G_ProjectSource(self->client->ps.origin, offset, forward, right, start);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 G_ProjectSource
CALLV
pop
line 747
;744:
;745:  // blocked, don't shoot
;746:
;747:  trap_Trace(&tr, start, NULL, NULL, point, self->s.number, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 112
CNSTP4 0
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
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
line 748
;748:  if (tr.fraction < 0.3) //just enough to prevent self damage (by now)
ADDRLP4 12+8
INDIRF4
CNSTF4 1050253722
GEF4 $315
line 749
;749:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $312
JUMPV
LABELV $315
line 751
;750:
;751:  return qtrue;
CNSTI4 1
RETI4
LABELV $312
endproc ACEMV_CheckShot 116 28
lit
align 4
LABELV $319
byte 4 1038174126
byte 4 1038174126
export ACEMV_Attack
code
proc ACEMV_Attack 128 12
line 760
;752:}
;753:
;754:// Attack movement routine
;755://
;756:// NOTE: Very simple for now, just a basic move about avoidance.
;757://       Change this routine for more advanced attack movement.
;758:void
;759:ACEMV_Attack(gentity_t * self)
;760:{
line 766
;761:  float c;
;762:  vec3_t target, forward, right, up;
;763:  float distance;
;764:  vec3_t oldAimVec;
;765:  float aimTremble[2] =
;766:  { 0.11f, 0.11f };
ADDRLP4 12
ADDRGP4 $319
INDIRB
ASGNB 8
line 770
;767:  //float           slowness = 0.35;	//lower is slower
;768:
;769:  // randomly choose a movement direction
;770:  c = random();
ADDRLP4 76
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 76
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 773
;771:
;772:  //if(self->s.groundEntityNum != ENTITYNUM_NONE)
;773:  {
line 774
;774:    if (c < 0.2 && ACEMV_CanMove(self, MOVE_LEFT))
ADDRLP4 20
INDIRF4
CNSTF4 1045220557
GEF4 $320
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $320
line 775
;775:      self->client->pers.cmd.rightmove -= 127;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
ADDRGP4 $321
JUMPV
LABELV $320
line 776
;776:    else if (c < 0.4 && ACEMV_CanMove(self, MOVE_RIGHT))
ADDRLP4 20
INDIRF4
CNSTF4 1053609165
GEF4 $322
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $322
line 777
;777:      self->client->pers.cmd.rightmove += 127;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 498
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $322
LABELV $321
line 779
;778:
;779:    if (c < 0.6 && ACEMV_CanMove(self, MOVE_FORWARD))
ADDRLP4 20
INDIRF4
CNSTF4 1058642330
GEF4 $324
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 96
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $324
line 780
;780:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
ADDRGP4 $325
JUMPV
LABELV $324
line 781
;781:    else if (c < 0.8 && ACEMV_CanMove(self, MOVE_FORWARD))
ADDRLP4 20
INDIRF4
CNSTF4 1061997773
GEF4 $326
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 100
ADDRGP4 ACEMV_CanMove
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $326
line 782
;782:      botWalk(self, 127);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 botWalk
CALLV
pop
LABELV $326
LABELV $325
line 784
;783:
;784:    if (c < 0.95)
ADDRLP4 20
INDIRF4
CNSTF4 1064514355
GEF4 $328
line 785
;785:      self->client->pers.cmd.upmove -= 90;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 90
SUBI4
CVII1 4
ASGNI1
ADDRGP4 $329
JUMPV
LABELV $328
line 787
;786:    else
;787:      self->client->pers.cmd.upmove += 90;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 499
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 90
ADDI4
CVII1 4
ASGNI1
LABELV $329
line 788
;788:  }
line 791
;789:
;790:  // aim
;791:  if (self->enemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
line 792
;792:    VectorCopy(self->enemy->client->ps.origin, target);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
ADDRGP4 $331
JUMPV
LABELV $330
line 793
;793:else    VectorCopy(self->enemy->s.origin, target);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
LABELV $331
line 798
;794:
;795:    // modify attack angles based on accuracy (mess this up to make the bot's aim not so deadly)
;796:
;797:    // save the current angles
;798:    VectorCopy(self->bs.moveVector, oldAimVec);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
INDIRB
ASGNB 12
line 799
;799:    VectorNormalize(oldAimVec);
ADDRLP4 64
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 801
;800:
;801:    VectorSubtract(target, self->client->ps.origin, forward);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
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
line 802
;802:    distance = VectorNormalize(forward);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 84
INDIRF4
ASGNF4
line 804
;803:
;804:    PerpendicularVector(up, forward);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 805
;805:    CrossProduct(up, forward, right);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 807
;806:
;807:    VectorMA(forward, crandom() * aimTremble[0], up, forward);
ADDRLP4 88
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
CNSTF4 1073741824
ADDRLP4 88
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 96
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 808
;808:    VectorMA(forward, crandom() * aimTremble[1], right, forward);
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 1073741824
ADDRLP4 100
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12+4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 104
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12+4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 108
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRLP4 12+4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 809
;809:    VectorNormalize(forward);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 815
;810:
;811:    //VectorLerp(oldAimVec, forward, slowness, forward);
;812:    //VectorMA(oldAimVec, slowness, forward, forward);
;813:    //VectorNormalize(forward);
;814:
;815:    VectorScale(forward, distance, self->bs.moveVector);
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2372
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2376
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
line 817
;816:    //ACEMV_ChangeBotAngle(self);
;817:    VectorToAngles(self->bs.moveVector, self->bs.viewAngles);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 2368
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 2352
ADDP4
ARGP4
ADDRGP4 VectorToAngles
CALLV
pop
line 820
;818:
;819:    // don't attack too much
;820:    if(random() < 0.8 && ACEMV_CheckShot(self, target))
ADDRLP4 116
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
GEF4 $353
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 120
ADDRGP4 ACEMV_CheckShot
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $353
line 821
;821:    {
line 822
;822:      switch (self->client->pers.cmd.weapon)
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $355
JUMPV
line 823
;823:      {
LABELV $355
line 825
;824:        default:
;825:        self->client->pers.cmd.buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 826
;826:        break;
LABELV $356
line 828
;827:      }
;828:    }
LABELV $353
line 832
;829:
;830:    //  if(ace_debug.integer)
;831:    //      trap_SendServerCommand(-1, va("print \"%s: attacking %s\n\"", self->client->pers.netname, self->enemy->client->pers.netname));
;832:  }
LABELV $318
endproc ACEMV_Attack 128 12
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
LABELV $192
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
byte 1 79
byte 1 104
byte 1 32
byte 1 99
byte 1 114
byte 1 97
byte 1 112
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $187
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $111
byte 1 37
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
