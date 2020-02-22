export CG_AttachmentPoint
code
proc CG_AttachmentPoint 24 16
file "..\..\..\..\src/cgame/cg_attachment.c"
line 35
;1:/*
;2:===========================================================================
;3:Copyright (C) 2000-2006 Tim Angus
;4:
;5:This file is part of Tremulous.
;6:
;7:Tremulous is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Tremulous is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Tremulous; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:// cg_attachment.c -- an abstract attachment system
;24:
;25:#include "cg_local.h"
;26:
;27:/*
;28:===============
;29:CG_AttachmentPoint
;30:
;31:Return the attachment point
;32:===============
;33:*/
;34:qboolean CG_AttachmentPoint( attachment_t *a, vec3_t v )
;35:{
line 38
;36:  centity_t   *cent;
;37:
;38:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
line 39
;39:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $100
line 42
;40:
;41:  // if it all breaks, then use the last point we know was correct
;42:  VectorCopy( a->lastValidAttachmentPoint, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRB
ASGNB 12
line 44
;43:
;44:  switch( a->type )
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $102
ADDRLP4 4
INDIRI4
CNSTI4 3
GTI4 $102
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $126
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $126
address $105
address $108
address $111
address $120
code
line 45
;45:  {
LABELV $105
line 47
;46:    case AT_STATIC:
;47:      if( !a->staticValid )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $106
line 48
;48:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $106
line 50
;49:
;50:      VectorCopy( a->origin, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRB
ASGNB 12
line 51
;51:      break;
ADDRGP4 $103
JUMPV
LABELV $108
line 54
;52:
;53:    case AT_TAG:
;54:      if( !a->tagValid )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $109
line 55
;55:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $109
line 57
;56:
;57:      AxisCopy( axisDefault, a->re.axis );
ADDRGP4 axisDefault
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 58
;58:      CG_PositionRotatedEntityOnTag( &a->re, &a->parent,
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 60
;59:                                     a->model, a->tagName );
;60:      VectorCopy( a->re.origin, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRB
ASGNB 12
line 61
;61:      break;
ADDRGP4 $103
JUMPV
LABELV $111
line 64
;62:
;63:    case AT_CENT:
;64:      if( !a->centValid )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $112
line 65
;65:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $112
line 67
;66:
;67:      if( a->centNum == cg.predictedPlayerState.clientNum )
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $114
line 68
;68:      {
line 70
;69:        // this is smoother if it's the local client
;70:        VectorCopy( cg.predictedPlayerState.origin, v );
ADDRFP4 4
INDIRP4
ADDRGP4 cg+107636+20
INDIRB
ASGNB 12
line 71
;71:      }
ADDRGP4 $103
JUMPV
LABELV $114
line 73
;72:      else
;73:      {
line 74
;74:        cent = &cg_entities[ a->centNum ];
ADDRLP4 0
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 75
;75:        VectorCopy( cent->lerpOrigin, v );
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 76
;76:      }
line 77
;77:      break;
ADDRGP4 $103
JUMPV
LABELV $120
line 80
;78:
;79:    case AT_PARTICLE:
;80:      if( !a->particleValid )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
NEI4 $121
line 81
;81:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $121
line 83
;82:
;83:      if( !a->particle->valid )
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
NEI4 $123
line 84
;84:      {
line 85
;85:        a->particleValid = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $123
line 89
;87:      }
;88:      else
;89:        VectorCopy( a->particle->origin, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 90
;90:      break;
ADDRGP4 $103
JUMPV
LABELV $102
line 93
;91:
;92:    default:
;93:      CG_Printf( S_COLOR_RED "ERROR: Invalid attachmentType_t in attachment\n" );
ADDRGP4 $125
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 94
;94:      break;
LABELV $103
line 97
;95:  }
;96:
;97:  if( a->hasOffset )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $127
line 98
;98:    VectorAdd( v, a->offset, v );
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $127
line 100
;99:
;100:  VectorCopy( v, a->lastValidAttachmentPoint );
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 102
;101:
;102:  return qtrue;
CNSTI4 1
RETI4
LABELV $99
endproc CG_AttachmentPoint 24 16
export CG_AttachmentDir
proc CG_AttachmentDir 28 16
line 113
;103:}
;104:
;105:/*
;106:===============
;107:CG_AttachmentDir
;108:
;109:Return the attachment direction
;110:===============
;111:*/
;112:qboolean CG_AttachmentDir( attachment_t *a, vec3_t v )
;113:{
line 117
;114:  vec3_t      forward;
;115:  centity_t   *cent;
;116:
;117:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $130
line 118
;118:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $130
line 120
;119:
;120:  switch( a->type )
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $132
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $132
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $147
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $147
address $135
address $136
address $139
address $142
code
line 121
;121:  {
LABELV $135
line 123
;122:    case AT_STATIC:
;123:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
line 124
;124:      break;
LABELV $136
line 127
;125:
;126:    case AT_TAG:
;127:      if( !a->tagValid )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $137
line 128
;128:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $137
line 130
;129:
;130:      VectorCopy( a->re.axis[ 0 ], v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 131
;131:      break;
ADDRGP4 $133
JUMPV
LABELV $139
line 134
;132:
;133:    case AT_CENT:
;134:      if( !a->centValid )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $140
line 135
;135:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $140
line 137
;136:
;137:      cent = &cg_entities[ a->centNum ];
ADDRLP4 12
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 138
;138:      AngleVectors( cent->lerpAngles, forward, NULL, NULL );
ADDRLP4 12
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 139
;139:      VectorCopy( forward, v );
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 12
line 140
;140:      break;
ADDRGP4 $133
JUMPV
LABELV $142
line 143
;141:
;142:    case AT_PARTICLE:
;143:      if( !a->particleValid )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
NEI4 $143
line 144
;144:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $143
line 146
;145:
;146:      if( !a->particle->valid )
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
NEI4 $145
line 147
;147:      {
line 148
;148:        a->particleValid = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 149
;149:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $145
line 152
;150:      }
;151:      else
;152:        VectorCopy( a->particle->velocity, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 12
line 153
;153:      break;
ADDRGP4 $133
JUMPV
LABELV $132
line 156
;154:
;155:    default:
;156:      CG_Printf( S_COLOR_RED "ERROR: Invalid attachmentType_t in attachment\n" );
ADDRGP4 $125
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 157
;157:      break;
LABELV $133
line 160
;158:  }
;159:
;160:  VectorNormalize( v );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 161
;161:  return qtrue;
CNSTI4 1
RETI4
LABELV $129
endproc CG_AttachmentDir 28 16
export CG_AttachmentAxis
proc CG_AttachmentAxis 12 8
line 172
;162:}
;163:
;164:/*
;165:===============
;166:CG_AttachmentAxis
;167:
;168:Return the attachment axis
;169:===============
;170:*/
;171:qboolean CG_AttachmentAxis( attachment_t *a, vec3_t axis[ 3 ] )
;172:{
line 175
;173:  centity_t   *cent;
;174:
;175:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
line 176
;176:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
LABELV $149
line 178
;177:
;178:  switch( a->type )
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $151
ADDRLP4 4
INDIRI4
CNSTI4 3
GTI4 $151
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $162
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $162
address $154
address $155
address $158
address $161
code
line 179
;179:  {
LABELV $154
line 181
;180:    case AT_STATIC:
;181:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
line 182
;182:      break;
LABELV $155
line 185
;183:
;184:    case AT_TAG:
;185:      if( !a->tagValid )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $156
line 186
;186:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
LABELV $156
line 188
;187:
;188:      AxisCopy( a->re.axis, axis );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 189
;189:      break;
ADDRGP4 $152
JUMPV
LABELV $158
line 192
;190:
;191:    case AT_CENT:
;192:      if( !a->centValid )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $159
line 193
;193:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
LABELV $159
line 195
;194:
;195:      cent = &cg_entities[ a->centNum ];
ADDRLP4 0
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 196
;196:      AnglesToAxis( cent->lerpAngles, axis );
ADDRLP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 197
;197:      break;
ADDRGP4 $152
JUMPV
LABELV $161
line 200
;198:
;199:    case AT_PARTICLE:
;200:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
line 201
;201:      break;
LABELV $151
line 204
;202:
;203:    default:
;204:      CG_Printf( S_COLOR_RED "ERROR: Invalid attachmentType_t in attachment\n" );
ADDRGP4 $125
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 205
;205:      break;
LABELV $152
line 208
;206:  }
;207:
;208:  return qtrue;
CNSTI4 1
RETI4
LABELV $148
endproc CG_AttachmentAxis 12 8
export CG_AttachmentVelocity
proc CG_AttachmentVelocity 12 0
line 219
;209:}
;210:
;211:/*
;212:===============
;213:CG_AttachmentVelocity
;214:
;215:If the attachment can have velocity, return it
;216:===============
;217:*/
;218:qboolean CG_AttachmentVelocity( attachment_t *a, vec3_t v )
;219:{
line 220
;220:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 221
;221:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $164
line 223
;222:
;223:  if( a->particleValid && a->particle->valid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $166
ADDRLP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $166
line 224
;224:  {
line 225
;225:    VectorCopy( a->particle->velocity, v );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 12
line 226
;226:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $166
line 228
;227:  }
;228:  else if( a->centValid )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $168
line 229
;229:  {
line 230
;230:    centity_t *cent = &cg_entities[ a->centNum ];
ADDRLP4 8
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 232
;231:
;232:    VectorCopy( cent->currentState.pos.trDelta, v );
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 233
;233:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $168
line 236
;234:  }
;235:
;236:  return qfalse;
CNSTI4 0
RETI4
LABELV $163
endproc CG_AttachmentVelocity 12 0
export CG_AttachmentCentNum
proc CG_AttachmentCentNum 4 0
line 247
;237:}
;238:
;239:/*
;240:===============
;241:CG_AttachmentCentNum
;242:
;243:If the attachment has a centNum, return it
;244:===============
;245:*/
;246:int CG_AttachmentCentNum( attachment_t *a )
;247:{
line 248
;248:  if( !a || !a->centValid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $171
LABELV $173
line 249
;249:    return -1;
CNSTI4 -1
RETI4
ADDRGP4 $170
JUMPV
LABELV $171
line 251
;250:
;251:  return a->centNum;
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
RETI4
LABELV $170
endproc CG_AttachmentCentNum 4 0
export CG_Attached
proc CG_Attached 0 0
line 262
;252:}
;253:
;254:/*
;255:===============
;256:CG_Attached
;257:
;258:If the attachment is valid, return qtrue
;259:===============
;260:*/
;261:qboolean CG_Attached( attachment_t *a )
;262:{
line 263
;263:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 264
;264:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $174
JUMPV
LABELV $175
line 266
;265:
;266:  return a->attached;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
RETI4
LABELV $174
endproc CG_Attached 0 0
export CG_AttachToPoint
proc CG_AttachToPoint 4 0
line 277
;267:}
;268:
;269:/*
;270:===============
;271:CG_AttachToPoint
;272:
;273:Attach to a point in space
;274:===============
;275:*/
;276:void CG_AttachToPoint( attachment_t *a )
;277:{
line 278
;278:  if( !a || !a->staticValid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $178
LABELV $180
line 279
;279:    return;
ADDRGP4 $177
JUMPV
LABELV $178
line 281
;280:
;281:  a->type = AT_STATIC;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 282
;282:  a->attached = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 283
;283:}
LABELV $177
endproc CG_AttachToPoint 4 0
export CG_AttachToCent
proc CG_AttachToCent 4 0
line 293
;284:
;285:/*
;286:===============
;287:CG_AttachToCent
;288:
;289:Attach to a centity_t
;290:===============
;291:*/
;292:void CG_AttachToCent( attachment_t *a )
;293:{
line 294
;294:  if( !a || !a->centValid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $182
LABELV $184
line 295
;295:    return;
ADDRGP4 $181
JUMPV
LABELV $182
line 297
;296:
;297:  a->type = AT_CENT;
ADDRFP4 0
INDIRP4
CNSTI4 2
ASGNI4
line 298
;298:  a->attached = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 299
;299:}
LABELV $181
endproc CG_AttachToCent 4 0
export CG_AttachToTag
proc CG_AttachToTag 4 0
line 309
;300:
;301:/*
;302:===============
;303:CG_AttachToTag
;304:
;305:Attach to a model tag
;306:===============
;307:*/
;308:void CG_AttachToTag( attachment_t *a )
;309:{
line 310
;310:  if( !a || !a->tagValid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $186
LABELV $188
line 311
;311:    return;
ADDRGP4 $185
JUMPV
LABELV $186
line 313
;312:
;313:  a->type = AT_TAG;
ADDRFP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 314
;314:  a->attached = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 315
;315:}
LABELV $185
endproc CG_AttachToTag 4 0
export CG_AttachToParticle
proc CG_AttachToParticle 4 0
line 325
;316:
;317:/*
;318:===============
;319:CG_AttachToParticle
;320:
;321:Attach to a particle
;322:===============
;323:*/
;324:void CG_AttachToParticle( attachment_t *a )
;325:{
line 326
;326:  if( !a || !a->particleValid )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
NEI4 $190
LABELV $192
line 327
;327:    return;
ADDRGP4 $189
JUMPV
LABELV $190
line 329
;328:
;329:  a->type = AT_PARTICLE;
ADDRFP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 330
;330:  a->attached = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 331
;331:}
LABELV $189
endproc CG_AttachToParticle 4 0
export CG_SetAttachmentPoint
proc CG_SetAttachmentPoint 0 0
line 339
;332:
;333:/*
;334:===============
;335:CG_SetAttachmentPoint
;336:===============
;337:*/
;338:void CG_SetAttachmentPoint( attachment_t *a, vec3_t v )
;339:{
line 340
;340:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $194
line 341
;341:    return;
ADDRGP4 $193
JUMPV
LABELV $194
line 343
;342:
;343:  VectorCopy( v, a->origin );
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 344
;344:  a->staticValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 345
;345:}
LABELV $193
endproc CG_SetAttachmentPoint 0 0
export CG_SetAttachmentCent
proc CG_SetAttachmentCent 4 0
line 353
;346:
;347:/*
;348:===============
;349:CG_SetAttachmentCent
;350:===============
;351:*/
;352:void CG_SetAttachmentCent( attachment_t *a, centity_t *cent )
;353:{
line 354
;354:  if( !a || !cent )
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $199
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
NEU4 $197
LABELV $199
line 355
;355:    return;
ADDRGP4 $196
JUMPV
LABELV $197
line 357
;356:
;357:  a->centNum = cent->currentState.number;
ADDRFP4 0
INDIRP4
CNSTI4 1372
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 358
;358:  a->centValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
line 359
;359:}
LABELV $196
endproc CG_SetAttachmentCent 4 0
export CG_SetAttachmentTag
proc CG_SetAttachmentTag 0 12
line 368
;360:
;361:/*
;362:===============
;363:CG_SetAttachmentTag
;364:===============
;365:*/
;366:void CG_SetAttachmentTag( attachment_t *a, refEntity_t parent,
;367:    qhandle_t model, char *tagName )
;368:{
line 369
;369:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $201
line 370
;370:    return;
ADDRGP4 $200
JUMPV
LABELV $201
line 372
;371:
;372:  a->parent = parent;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 140
line 373
;373:  a->model = model;
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 374
;374:  strncpy( a->tagName, tagName, MAX_STRING_CHARS );
ADDRFP4 0
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 375
;375:  a->tagValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 376
;376:}
LABELV $200
endproc CG_SetAttachmentTag 0 12
export CG_SetAttachmentParticle
proc CG_SetAttachmentParticle 0 0
line 384
;377:
;378:/*
;379:===============
;380:CG_SetAttachmentParticle
;381:===============
;382:*/
;383:void CG_SetAttachmentParticle( attachment_t *a, particle_t *p )
;384:{
line 385
;385:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $204
line 386
;386:    return;
ADDRGP4 $203
JUMPV
LABELV $204
line 388
;387:
;388:  a->particle = p;
ADDRFP4 0
INDIRP4
CNSTI4 1376
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 389
;389:  a->particleValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 390
;390:}
LABELV $203
endproc CG_SetAttachmentParticle 0 0
export CG_SetAttachmentOffset
proc CG_SetAttachmentOffset 0 0
line 398
;391:
;392:/*
;393:===============
;394:CG_SetAttachmentOffset
;395:===============
;396:*/
;397:void CG_SetAttachmentOffset( attachment_t *a, vec3_t v )
;398:{
line 399
;399:  if( !a )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 400
;400:    return;
ADDRGP4 $206
JUMPV
LABELV $207
line 402
;401:
;402:  VectorCopy( v, a->offset );
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 403
;403:  a->hasOffset = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 1
ASGNI4
line 404
;404:}
LABELV $206
endproc CG_SetAttachmentOffset 0 0
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
import CG_RequestScores
import CG_InitConsoleCommands
import CG_ConsoleCommand
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
LABELV $125
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 104
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 95
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 104
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
