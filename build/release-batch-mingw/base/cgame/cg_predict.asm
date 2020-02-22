export CG_BuildSolidList
code
proc CG_BuildSolidList 32 0
file "..\..\..\..\src/cgame/cg_predict.c"
line 49
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
;22:*/
;23:
;24:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;25:// interpolating between snapshots from the server or locally predicting
;26:// ahead the client's movement.
;27:// It also handles local physics interaction, like fragments bouncing off walls
;28:
;29:
;30:#include "cg_local.h"
;31:
;32:static  pmove_t   cg_pmove;
;33:
;34:static  int     cg_numSolidEntities;
;35:static  centity_t *cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;36:static  int     cg_numTriggerEntities;
;37:static  centity_t *cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;38:
;39:/*
;40:====================
;41:CG_BuildSolidList
;42:
;43:When a new cg.snap has been set, this function builds a sublist
;44:of the entities that are actually solid, to make for more
;45:efficient collision detection
;46:====================
;47:*/
;48:void CG_BuildSolidList( void )
;49:{
line 55
;50:  int           i;
;51:  centity_t     *cent;
;52:  snapshot_t    *snap;
;53:  entityState_t *ent;
;54:
;55:  cg_numSolidEntities = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 56
;56:  cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 58
;57:
;58:  if( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport )
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $100
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $100
line 59
;59:    snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
ADDRGP4 $101
JUMPV
LABELV $100
line 61
;60:  else
;61:    snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
LABELV $101
line 63
;62:
;63:  for( i = 0; i < snap->numEntities; i++ )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 64
;64:  {
line 65
;65:    cent = &cg_entities[ snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 1724
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 66
;66:    ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 68
;67:
;68:    if( ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER )
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $114
ADDRLP4 20
INDIRI4
CNSTI4 9
EQI4 $114
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $111
LABELV $114
line 69
;69:    {
line 70
;70:      cg_triggerEntities[ cg_numTriggerEntities ] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 71
;71:      cg_numTriggerEntities++;
ADDRLP4 24
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 72
;72:      continue;
ADDRGP4 $108
JUMPV
LABELV $111
line 75
;73:    }
;74:
;75:    if( cent->nextState.solid && ent->eType != ET_MISSILE )
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $115
line 76
;76:    {
line 77
;77:      cg_solidEntities[ cg_numSolidEntities ] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 78
;78:      cg_numSolidEntities++;
ADDRLP4 28
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 79
;79:      continue;
LABELV $115
line 81
;80:    }
;81:  }
LABELV $108
line 63
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $107
line 82
;82:}
LABELV $99
endproc CG_BuildSolidList 32 0
proc CG_ClipMoveToEntities 156 36
line 93
;83:
;84:/*
;85:====================
;86:CG_ClipMoveToEntities
;87:
;88:====================
;89:*/
;90:static void CG_ClipMoveToEntities ( const vec3_t start, const vec3_t mins,
;91:    const vec3_t maxs, const vec3_t end, int skipNumber,
;92:    int mask, trace_t *tr, traceType_t collisionType )
;93:{
line 104
;94:  int           i, j, x, zd, zu;
;95:  trace_t       trace;
;96:  entityState_t *ent;
;97:  clipHandle_t  cmodel;
;98:  vec3_t        bmins, bmaxs;
;99:  vec3_t        origin, angles;
;100:  centity_t     *cent;
;101:
;102:  //SUPAR HACK
;103:  //this causes a trace to collide with the local player
;104:  if( skipNumber == MAGIC_TRACE_HACK )
ADDRFP4 16
INDIRI4
CNSTI4 -2
NEI4 $118
line 105
;105:    j = cg_numSolidEntities + 1;
ADDRLP4 128
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $118
line 107
;106:  else
;107:    j = cg_numSolidEntities;
ADDRLP4 128
ADDRGP4 cg_numSolidEntities
INDIRI4
ASGNI4
LABELV $119
line 109
;108:
;109:  for( i = 0; i < j; i++ )
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 110
;110:  {
line 111
;111:    if( i < cg_numSolidEntities )
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
GEI4 $124
line 112
;112:      cent = cg_solidEntities[ i ];
ADDRLP4 68
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $125
JUMPV
LABELV $124
line 114
;113:    else
;114:      cent = &cg.predictedPlayerEntity;
ADDRLP4 68
ADDRGP4 cg+108104
ASGNP4
LABELV $125
line 116
;115:
;116:    ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 118
;117:
;118:    if( ent->number == skipNumber )
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $127
line 119
;119:      continue;
ADDRGP4 $121
JUMPV
LABELV $127
line 121
;120:
;121:    if( ent->solid == SOLID_BMODEL )
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $129
line 122
;122:    {
line 124
;123:      // special value for bmodel
;124:      cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 140
INDIRI4
ASGNI4
line 125
;125:      VectorCopy( cent->lerpAngles, angles );
ADDRLP4 112
ADDRLP4 68
INDIRP4
CNSTI4 1568
ADDP4
INDIRB
ASGNB 12
line 126
;126:      BG_EvaluateTrajectory( &cent->currentState.pos, cg.physicsTime, origin );
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 127
;127:    }
ADDRGP4 $130
JUMPV
LABELV $129
line 129
;128:    else
;129:    {
line 131
;130:      // encoded bbox
;131:      x = ( ent->solid & 255 );
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 132
;132:      zd = ( ( ent->solid >> 8 ) & 255 );
ADDRLP4 132
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 133
;133:      zu = ( ( ent->solid >> 16 ) & 255 ) - 32;
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 135
;134:
;135:      bmins[ 0 ] = bmins[ 1 ] = -x;
ADDRLP4 140
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 140
INDIRF4
ASGNF4
line 136
;136:      bmaxs[ 0 ] = bmaxs[ 1 ] = x;
ADDRLP4 144
ADDRLP4 124
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 144
INDIRF4
ASGNF4
line 137
;137:      bmins[ 2 ] = -zd;
ADDRLP4 72+8
ADDRLP4 132
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 138
;138:      bmaxs[ 2 ] = zu;
ADDRLP4 84+8
ADDRLP4 136
INDIRI4
CVIF4 4
ASGNF4
line 140
;139:
;140:      if( i == cg_numSolidEntities )
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
NEI4 $136
line 141
;141:        BG_FindBBoxForClass( ( ent->powerups >> 8 ) & 0xFF, bmins, bmaxs, NULL, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
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
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
LABELV $136
line 143
;142:
;143:      cmodel = trap_CM_TempBoxModel( bmins, bmaxs );
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 152
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 152
INDIRI4
ASGNI4
line 144
;144:      VectorCopy( vec3_origin, angles );
ADDRLP4 112
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 145
;145:      VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 100
ADDRLP4 68
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 146
;146:    }
LABELV $130
line 149
;147:
;148:
;149:    if( collisionType == TT_CAPSULE )
ADDRFP4 28
INDIRI4
CNSTI4 2
NEI4 $138
line 150
;150:    {
line 151
;151:      trap_CM_TransformedCapsuleTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 trap_CM_TransformedCapsuleTrace
CALLV
pop
line 153
;152:        mins, maxs, cmodel,  mask, origin, angles );
;153:    }
ADDRGP4 $139
JUMPV
LABELV $138
line 154
;154:    else if( collisionType == TT_AABB )
ADDRFP4 28
INDIRI4
CNSTI4 1
NEI4 $140
line 155
;155:    {
line 156
;156:      trap_CM_TransformedBoxTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 158
;157:        mins, maxs, cmodel,  mask, origin, angles );
;158:    }
ADDRGP4 $141
JUMPV
LABELV $140
line 159
;159:    else if( collisionType == TT_BISPHERE )
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $142
line 160
;160:    {
line 161
;161:      trap_CM_TransformedBiSphereTrace( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRGP4 trap_CM_TransformedBiSphereTrace
CALLV
pop
line 163
;162:        mins[ 0 ], maxs[ 0 ], cmodel, mask, origin );
;163:    }
LABELV $142
LABELV $141
LABELV $139
line 165
;164:
;165:    if( trace.allsolid || trace.fraction < tr->fraction )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $147
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $144
LABELV $147
line 166
;166:    {
line 167
;167:      trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 169
;168:
;169:      if( tr->lateralFraction < trace.lateralFraction )
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 4+56
INDIRF4
GEF4 $149
line 170
;170:      {
line 171
;171:        float oldLateralFraction = tr->lateralFraction;
ADDRLP4 140
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ASGNF4
line 172
;172:        *tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 60
line 173
;173:        tr->lateralFraction = oldLateralFraction;
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 140
INDIRF4
ASGNF4
line 174
;174:      }
ADDRGP4 $145
JUMPV
LABELV $149
line 176
;175:      else
;176:        *tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 60
line 177
;177:    }
ADDRGP4 $145
JUMPV
LABELV $144
line 178
;178:    else if( trace.startsolid )
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $152
line 179
;179:      tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
LABELV $152
LABELV $145
line 181
;180:
;181:    if( tr->allsolid )
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $155
line 182
;182:      return;
ADDRGP4 $117
JUMPV
LABELV $155
line 183
;183:  }
LABELV $121
line 109
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 64
INDIRI4
ADDRLP4 128
INDIRI4
LTI4 $120
line 184
;184:}
LABELV $117
endproc CG_ClipMoveToEntities 156 36
export CG_Trace
proc CG_Trace 64 32
line 193
;185:
;186:/*
;187:================
;188:CG_Trace
;189:================
;190:*/
;191:void  CG_Trace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;192:                int skipNumber, int mask )
;193:{
line 196
;194:  trace_t t;
;195:
;196:  trap_CM_BoxTrace( &t, start, end, mins, maxs, 0, mask );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 197
;197:  t.entityNum = t.fraction != 1.0 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $161
ADDRLP4 60
CNSTI4 1022
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $161
ADDRLP4 60
CNSTI4 1023
ASGNI4
LABELV $162
ADDRLP4 0+52
ADDRLP4 60
INDIRI4
ASGNI4
line 199
;198:  // check all other solid models
;199:  CG_ClipMoveToEntities( start, mins, maxs, end, skipNumber, mask, &t, TT_AABB );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 201
;200:
;201:  *result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
line 202
;202:}
LABELV $157
endproc CG_Trace 64 32
export CG_CapTrace
proc CG_CapTrace 64 32
line 211
;203:
;204:/*
;205:================
;206:CG_CapTrace
;207:================
;208:*/
;209:void  CG_CapTrace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;210:                   int skipNumber, int mask )
;211:{
line 214
;212:  trace_t t;
;213:
;214:  trap_CM_CapsuleTrace( &t, start, end, mins, maxs, 0, mask );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_CapsuleTrace
CALLV
pop
line 215
;215:  t.entityNum = t.fraction != 1.0 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $167
ADDRLP4 60
CNSTI4 1022
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 60
CNSTI4 1023
ASGNI4
LABELV $168
ADDRLP4 0+52
ADDRLP4 60
INDIRI4
ASGNI4
line 217
;216:  // check all other solid models
;217:  CG_ClipMoveToEntities( start, mins, maxs, end, skipNumber, mask, &t, TT_CAPSULE );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 219
;218:
;219:  *result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
line 220
;220:}
LABELV $163
endproc CG_CapTrace 64 32
export CG_BiSphereTrace
proc CG_BiSphereTrace 88 32
line 229
;221:
;222:/*
;223:================
;224:CG_BiSphereTrace
;225:================
;226:*/
;227:void CG_BiSphereTrace( trace_t *result, const vec3_t start, const vec3_t end,
;228:    const float startRadius, const float endRadius, int skipNumber, int mask )
;229:{
line 233
;230:  trace_t t;
;231:  vec3_t  mins, maxs;
;232:
;233:  mins[ 0 ] = startRadius;
ADDRLP4 60
ADDRFP4 12
INDIRF4
ASGNF4
line 234
;234:  maxs[ 0 ] = endRadius;
ADDRLP4 72
ADDRFP4 16
INDIRF4
ASGNF4
line 236
;235:
;236:  trap_CM_BiSphereTrace( &t, start, end, startRadius, endRadius, 0, mask );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BiSphereTrace
CALLV
pop
line 237
;237:  t.entityNum = t.fraction != 1.0 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $173
ADDRLP4 84
CNSTI4 1022
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 84
CNSTI4 1023
ASGNI4
LABELV $174
ADDRLP4 0+52
ADDRLP4 84
INDIRI4
ASGNI4
line 239
;238:  // check all other solid models
;239:  CG_ClipMoveToEntities( start, mins, maxs, end, skipNumber, mask, &t, TT_BISPHERE );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 241
;240:
;241:  *result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
line 242
;242:}
LABELV $169
endproc CG_BiSphereTrace 88 32
export CG_PointContents
proc CG_PointContents 36 16
line 250
;243:
;244:/*
;245:================
;246:CG_PointContents
;247:================
;248:*/
;249:int   CG_PointContents( const vec3_t point, int passEntityNum )
;250:{
line 257
;251:  int           i;
;252:  entityState_t *ent;
;253:  centity_t     *cent;
;254:  clipHandle_t  cmodel;
;255:  int           contents;
;256:
;257:  contents = trap_CM_PointContents (point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 259
;258:
;259:  for( i = 0; i < cg_numSolidEntities; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 260
;260:  {
line 261
;261:    cent = cg_solidEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 263
;262:
;263:    ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 265
;264:
;265:    if( ent->number == passEntityNum )
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $180
line 266
;266:      continue;
ADDRGP4 $177
JUMPV
LABELV $180
line 268
;267:
;268:    if( ent->solid != SOLID_BMODEL ) // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $182
line 269
;269:      continue;
ADDRGP4 $177
JUMPV
LABELV $182
line 271
;270:
;271:    cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 273
;272:
;273:    if( !cmodel )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $184
line 274
;274:      continue;
ADDRGP4 $177
JUMPV
LABELV $184
line 276
;275:
;276:    contents |= trap_CM_TransformedPointContents( point, cmodel, ent->origin, ent->angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 277
;277:  }
LABELV $177
line 259
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $176
line 279
;278:
;279:  return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $175
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 76 12
line 292
;280:}
;281:
;282:
;283:/*
;284:========================
;285:CG_InterpolatePlayerState
;286:
;287:Generates cg.predictedPlayerState by interpolating between
;288:cg.snap->player_state and cg.nextFrame->player_state
;289:========================
;290:*/
;291:static void CG_InterpolatePlayerState( qboolean grabAngles )
;292:{
line 298
;293:  float         f;
;294:  int           i;
;295:  playerState_t *out;
;296:  snapshot_t    *prev, *next;
;297:
;298:  out = &cg.predictedPlayerState;
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
line 299
;299:  prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 300
;300:  next = cg.nextSnap;
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 302
;301:
;302:  *out = cg.snap->ps;
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 305
;303:
;304:  // if we are still allowing local input, short circuit the view angles
;305:  if( grabAngles )
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $191
line 306
;306:  {
line 310
;307:    usercmd_t cmd;
;308:    int     cmdNum;
;309:
;310:    cmdNum = trap_GetCurrentCmdNumber( );
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 311
;311:    trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 313
;312:
;313:    PM_UpdateViewAngles( out, &cmd );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 314
;314:  }
LABELV $191
line 317
;315:
;316:  // if the next frame is a teleport, we can't lerp to it
;317:  if( cg.nextFrameTeleport )
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $193
line 318
;318:    return;
ADDRGP4 $186
JUMPV
LABELV $193
line 320
;319:
;320:  if( !next || next->serverTime <= prev->serverTime )
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GTI4 $196
LABELV $198
line 321
;321:    return;
ADDRGP4 $186
JUMPV
LABELV $196
line 323
;322:
;323:  f = (float)( cg.time - prev->serverTime ) / ( next->serverTime - prev->serverTime );
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 325
;324:
;325:  i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 326
;326:  if( i < prev->ps.bobCycle )
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $200
line 327
;327:    i += 256;   // handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
LABELV $200
line 329
;328:
;329:  out->bobCycle = prev->ps.bobCycle + f * ( i - prev->ps.bobCycle );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 331
;330:
;331:  for( i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $202
line 332
;332:  {
line 333
;333:    out->origin[ i ] = prev->ps.origin[ i ] + f * ( next->ps.origin[ i ] - prev->ps.origin[ i ] );
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 44
CNSTI4 64
ASGNI4
ADDRLP4 48
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 48
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 335
;334:
;335:    if( !grabAngles )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $206
line 336
;336:      out->viewangles[ i ] = LerpAngle( prev->ps.viewangles[ i ], next->ps.viewangles[ i ], f );
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 196
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
LABELV $206
line 338
;337:
;338:    out->velocity[ i ] = prev->ps.velocity[ i ] +
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
CNSTI4 76
ASGNI4
ADDRLP4 72
ADDRLP4 64
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 340
;339:      f * (next->ps.velocity[ i ] - prev->ps.velocity[ i ] );
;340:  }
LABELV $203
line 331
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $202
line 341
;341:}
LABELV $186
endproc CG_InterpolatePlayerState 76 12
proc CG_TouchTriggerPrediction 92 28
line 352
;342:
;343:
;344:/*
;345:=========================
;346:CG_TouchTriggerPrediction
;347:
;348:Predict push triggers and items
;349:=========================
;350:*/
;351:static void CG_TouchTriggerPrediction( void )
;352:{
line 361
;353:  int           i;
;354:  trace_t       trace;
;355:  entityState_t *ent;
;356:  clipHandle_t  cmodel;
;357:  centity_t     *cent;
;358:  qboolean      spectator;
;359:
;360:  // dead clients don't activate triggers
;361:  if( cg.predictedPlayerState.stats[ STAT_HEALTH ] <= 0 )
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $209
line 362
;362:    return;
ADDRGP4 $208
JUMPV
LABELV $209
line 364
;363:
;364:  spectator = ( cg.predictedPlayerState.pm_type == PM_SPECTATOR );
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $216
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $217
ADDRLP4 76
ADDRLP4 80
INDIRI4
ASGNI4
line 366
;365:
;366:  if( cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator )
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $218
ADDRLP4 76
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $218
line 367
;367:    return;
ADDRGP4 $208
JUMPV
LABELV $218
line 369
;368:
;369:  for( i = 0; i < cg_numTriggerEntities; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $222
line 370
;370:  {
line 371
;371:    cent = cg_triggerEntities[ i ];
ADDRLP4 72
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 372
;372:    ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 374
;373:
;374:    if( ent->solid != SOLID_BMODEL )
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $226
line 375
;375:      continue;
ADDRGP4 $223
JUMPV
LABELV $226
line 377
;376:
;377:    cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 88
INDIRI4
ASGNI4
line 378
;378:    if( !cmodel )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $228
line 379
;379:      continue;
ADDRGP4 $223
JUMPV
LABELV $228
line 381
;380:
;381:    trap_CM_BoxTrace( &trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin,
ADDRLP4 12
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+308
ARGP4
ADDRGP4 cg_pmove+320
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 384
;382:                      cg_pmove.mins, cg_pmove.maxs, cmodel, -1 );
;383:
;384:    if( !trace.startsolid )
ADDRLP4 12+4
INDIRI4
CNSTI4 0
NEI4 $236
line 385
;385:      continue;
ADDRGP4 $223
JUMPV
LABELV $236
line 387
;386:
;387:    if( ent->eType == ET_TELEPORT_TRIGGER )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
NEI4 $239
line 388
;388:      cg.hyperspace = qtrue;
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
LABELV $239
line 389
;389:  }
LABELV $223
line 369
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $225
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $222
line 392
;390:
;391:  // if we didn't touch a jump pad this pmove frame
;392:  if( cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount )
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $242
line 393
;393:  {
line 394
;394:    cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
line 395
;395:    cg.predictedPlayerState.otherEntityNum = 0;
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
line 396
;396:  }
LABELV $242
line 397
;397:}
LABELV $208
endproc CG_TouchTriggerPrediction 92 28
export CG_PredictPlayerState
proc CG_PredictPlayerState 596 20
line 428
;398:
;399:
;400:
;401:/*
;402:=================
;403:CG_PredictPlayerState
;404:
;405:Generates cg.predictedPlayerState for the current cg.time
;406:cg.predictedPlayerState is guaranteed to be valid after exiting.
;407:
;408:For demo playback, this will be an interpolation between two valid
;409:playerState_t.
;410:
;411:For normal gameplay, it will be the result of predicted usercmd_t on
;412:top of the most recent playerState_t received from the server.
;413:
;414:Each new snapshot will usually have one or more new usercmd over the last,
;415:but we simulate all unacknowledged commands each time, not just the new ones.
;416:This means that on an internet connection, quite a few pmoves may be issued
;417:each frame.
;418:
;419:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;420:differs from the predicted one.  Would require saving all intermediate
;421:playerState_t during prediction.
;422:
;423:We detect prediction errors and allow them to be decayed off over several frames
;424:to ease the jerk.
;425:=================
;426:*/
;427:void CG_PredictPlayerState( void )
;428:{
line 435
;429:  int     cmdNum, current, i;
;430:  playerState_t oldPlayerState;
;431:  qboolean  moved;
;432:  usercmd_t oldestCmd;
;433:  usercmd_t latestCmd;
;434:
;435:  cg.hyperspace = qfalse; // will be set if touching a trigger_teleport
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
line 440
;436:
;437:  // if this is the first frame we must guarantee
;438:  // predictedPlayerState is valid even if there is some
;439:  // other error condition
;440:  if( !cg.validPPS )
ADDRGP4 cg+109828
INDIRI4
CNSTI4 0
NEI4 $254
line 441
;441:  {
line 442
;442:    cg.validPPS = qtrue;
ADDRGP4 cg+109828
CNSTI4 1
ASGNI4
line 443
;443:    cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 444
;444:  }
LABELV $254
line 448
;445:
;446:
;447:  // demo playback just copies the moves
;448:  if( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) )
ADDRLP4 532
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 532
INDIRI4
NEI4 $264
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 532
INDIRI4
EQI4 $260
LABELV $264
line 449
;449:  {
line 450
;450:    CG_InterpolatePlayerState( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 451
;451:    return;
ADDRGP4 $252
JUMPV
LABELV $260
line 455
;452:  }
;453:
;454:  // non-predicting local movement will grab the latest angles
;455:  if( cg_nopredict.integer || cg_synchronousClients.integer )
ADDRLP4 536
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 536
INDIRI4
NEI4 $269
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 536
INDIRI4
EQI4 $265
LABELV $269
line 456
;456:  {
line 457
;457:    CG_InterpolatePlayerState( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 458
;458:    return;
ADDRGP4 $252
JUMPV
LABELV $265
line 462
;459:  }
;460:
;461:  // prepare for pmove
;462:  cg_pmove.ps = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
line 463
;463:  cg_pmove.trace = CG_Trace;
ADDRGP4 cg_pmove+352
ADDRGP4 CG_Trace
ASGNP4
line 464
;464:  cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+356
ADDRGP4 CG_PointContents
ASGNP4
line 465
;465:  cg_pmove.debugLevel = cg_debugMove.integer;
ADDRGP4 cg_pmove+36
ADDRGP4 cg_debugMove+12
INDIRI4
ASGNI4
line 467
;466:
;467:  if( cg_pmove.ps->pm_type == PM_DEAD )
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $275
line 468
;468:    cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+32
CNSTI4 65537
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
line 470
;469:  else
;470:    cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+32
CNSTI4 33619969
ASGNI4
LABELV $276
line 472
;471:
;472:  if( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $279
line 473
;473:    cg_pmove.tracemask &= ~CONTENTS_BODY; // spectators can fly through bodies
ADDRLP4 540
ADDRGP4 cg_pmove+32
ASGNP4
ADDRLP4 540
INDIRP4
ADDRLP4 540
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
LABELV $279
line 475
;474:
;475:  cg_pmove.noFootsteps = 0;
ADDRGP4 cg_pmove+40
CNSTI4 0
ASGNI4
line 478
;476:
;477:  // save the state before the pmove so we can detect transitions
;478:  oldPlayerState = cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
INDIRB
ASGNB 468
line 480
;479:
;480:  current = trap_GetCurrentCmdNumber( );
ADDRLP4 544
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 476
ADDRLP4 544
INDIRI4
ASGNI4
line 485
;481:
;482:  // if we don't have the commands right after the snapshot, we
;483:  // can't accurately predict a current position, so just freeze at
;484:  // the last good position we had
;485:  cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 4
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 486
;486:  trap_GetUserCmd( cmdNum, &oldestCmd );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 508
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 488
;487:
;488:  if( oldestCmd.serverTime > cg.snap->ps.commandTime &&
ADDRLP4 548
ADDRLP4 508
INDIRI4
ASGNI4
ADDRLP4 548
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $285
ADDRLP4 548
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $285
line 490
;489:      oldestCmd.serverTime < cg.time )
;490:  { // special check for map_restart
line 491
;491:    if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $252
line 492
;492:      CG_Printf( "exceeded PACKET_BACKUP on commands\n" );
ADDRGP4 $292
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 494
;493:
;494:    return;
ADDRGP4 $252
JUMPV
LABELV $285
line 498
;495:  }
;496:
;497:  // get the latest command so we can know which commands are from previous map_restarts
;498:  trap_GetUserCmd( current, &latestCmd );
ADDRLP4 476
INDIRI4
ARGI4
ADDRLP4 484
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 504
;499:
;500:  // get the most recent information we have, even if
;501:  // the server time is beyond our current cg.time,
;502:  // because predicted player positions are going to
;503:  // be ahead of everything else anyway
;504:  if( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport )
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $293
ADDRLP4 552
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 552
INDIRI4
NEI4 $293
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 552
INDIRI4
NEI4 $293
line 505
;505:  {
line 506
;506:    cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 507
;507:    cg.physicsTime = cg.nextSnap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 508
;508:  }
ADDRGP4 $294
JUMPV
LABELV $293
line 510
;509:  else
;510:  {
line 511
;511:    cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 512
;512:    cg.physicsTime = cg.snap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 513
;513:  }
LABELV $294
line 515
;514:
;515:  if( pmove_msec.integer < 8 )
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $306
line 516
;516:    trap_Cvar_Set( "pmove_msec", "8" );
ADDRGP4 $309
ARGP4
ADDRGP4 $310
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $307
JUMPV
LABELV $306
line 517
;517:  else if( pmove_msec.integer > 33 )
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $311
line 518
;518:    trap_Cvar_Set( "pmove_msec", "33" );
ADDRGP4 $309
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $311
LABELV $307
line 520
;519:
;520:  cg_pmove.pmove_fixed = pmove_fixed.integer;// | cg_pmove_fixed.integer;
ADDRGP4 cg_pmove+344
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 521
;521:  cg_pmove.pmove_msec = pmove_msec.integer;
ADDRGP4 cg_pmove+348
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 524
;522:
;523:  // run cmds
;524:  moved = qfalse;
ADDRLP4 480
CNSTI4 0
ASGNI4
line 526
;525:
;526:  for( cmdNum = current - CMD_BACKUP + 1; cmdNum <= current; cmdNum++ )
ADDRLP4 4
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $319
line 527
;527:  {
line 529
;528:    // get the command
;529:    trap_GetUserCmd( cmdNum, &cg_pmove.cmd );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cg_pmove+8
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 531
;530:
;531:    if( cg_pmove.pmove_fixed )
ADDRGP4 cg_pmove+344
INDIRI4
CNSTI4 0
EQI4 $324
line 532
;532:      PM_UpdateViewAngles( cg_pmove.ps, &cg_pmove.cmd );
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+8
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
LABELV $324
line 535
;533:
;534:    // don't do anything if the time is before the snapshot player time
;535:    if( cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime )
ADDRGP4 cg_pmove+8
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $328
line 536
;536:      continue;
ADDRGP4 $320
JUMPV
LABELV $328
line 539
;537:
;538:    // don't do anything if the command was from a previous map_restart
;539:    if( cg_pmove.cmd.serverTime > latestCmd.serverTime )
ADDRGP4 cg_pmove+8
INDIRI4
ADDRLP4 484
INDIRI4
LEI4 $332
line 540
;540:      continue;
ADDRGP4 $320
JUMPV
LABELV $332
line 547
;541:
;542:    // check for a prediction error from last frame
;543:    // on a lan, this will often be the exact value
;544:    // from the snapshot, but on a wan we will have
;545:    // to predict several commands to get to the point
;546:    // we want to compare
;547:    if( cg.predictedPlayerState.commandTime == oldPlayerState.commandTime )
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $335
line 548
;548:    {
line 552
;549:      vec3_t  delta;
;550:      float   len;
;551:
;552:      if( cg.thisFrameTeleport )
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $338
line 553
;553:      {
line 555
;554:        // a teleport will not cause an error decay
;555:        VectorClear( cg.predictedError );
ADDRLP4 572
CNSTF4 0
ASGNF4
ADDRGP4 cg+109836+8
ADDRLP4 572
INDIRF4
ASGNF4
ADDRGP4 cg+109836+4
ADDRLP4 572
INDIRF4
ASGNF4
ADDRGP4 cg+109836
ADDRLP4 572
INDIRF4
ASGNF4
line 557
;556:
;557:        if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $346
line 558
;558:          CG_Printf( "PredictionTeleport\n" );
ADDRGP4 $349
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $346
line 560
;559:
;560:        cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
line 561
;561:      }
ADDRGP4 $339
JUMPV
LABELV $338
line 563
;562:      else
;563:      {
line 565
;564:        vec3_t  adjusted;
;565:        CG_AdjustPositionForMover( cg.predictedPlayerState.origin,
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 572
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 568
;566:          cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted );
;567:
;568:        if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $357
line 569
;569:        {
line 570
;570:          if( !VectorCompare( oldPlayerState.origin, adjusted ) )
ADDRLP4 8+20
ARGP4
ADDRLP4 572
ARGP4
ADDRLP4 584
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
NEI4 $360
line 571
;571:            CG_Printf("prediction error\n");
ADDRGP4 $363
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $360
line 572
;572:        }
LABELV $357
line 574
;573:
;574:        VectorSubtract( oldPlayerState.origin, adjusted, delta );
ADDRLP4 556
ADDRLP4 8+20
INDIRF4
ADDRLP4 572
INDIRF4
SUBF4
ASGNF4
ADDRLP4 556+4
ADDRLP4 8+20+4
INDIRF4
ADDRLP4 572+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 556+8
ADDRLP4 8+20+8
INDIRF4
ADDRLP4 572+8
INDIRF4
SUBF4
ASGNF4
line 575
;575:        len = VectorLength( delta );
ADDRLP4 556
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 568
ADDRLP4 584
INDIRF4
ASGNF4
line 577
;576:
;577:        if( len > 0.1 )
ADDRLP4 568
INDIRF4
CNSTF4 1036831949
LEF4 $373
line 578
;578:        {
line 579
;579:          if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $375
line 580
;580:            CG_Printf( "Prediction miss: %f\n", len );
ADDRGP4 $378
ARGP4
ADDRLP4 568
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $375
line 582
;581:
;582:          if( cg_errorDecay.integer )
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $379
line 583
;583:          {
line 587
;584:            int   t;
;585:            float f;
;586:
;587:            t = cg.time - cg.predictedErrorTime;
ADDRLP4 592
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109832
INDIRI4
SUBI4
ASGNI4
line 588
;588:            f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 588
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 592
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 590
;589:
;590:            if( f < 0 )
ADDRLP4 588
INDIRF4
CNSTF4 0
GEF4 $386
line 591
;591:              f = 0;
ADDRLP4 588
CNSTF4 0
ASGNF4
LABELV $386
line 593
;592:
;593:            if( f > 0 && cg_showmiss.integer )
ADDRLP4 588
INDIRF4
CNSTF4 0
LEF4 $388
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $388
line 594
;594:              CG_Printf( "Double prediction decay: %f\n", f );
ADDRGP4 $391
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $388
line 596
;595:
;596:            VectorScale( cg.predictedError, f, cg.predictedError );
ADDRGP4 cg+109836
ADDRGP4 cg+109836
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+109836+4
ADDRGP4 cg+109836+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+109836+8
ADDRGP4 cg+109836+8
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
line 597
;597:          }
ADDRGP4 $380
JUMPV
LABELV $379
line 599
;598:          else
;599:            VectorClear( cg.predictedError );
ADDRLP4 588
CNSTF4 0
ASGNF4
ADDRGP4 cg+109836+8
ADDRLP4 588
INDIRF4
ASGNF4
ADDRGP4 cg+109836+4
ADDRLP4 588
INDIRF4
ASGNF4
ADDRGP4 cg+109836
ADDRLP4 588
INDIRF4
ASGNF4
LABELV $380
line 601
;600:
;601:          VectorAdd( delta, cg.predictedError, cg.predictedError );
ADDRGP4 cg+109836
ADDRLP4 556
INDIRF4
ADDRGP4 cg+109836
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+109836+4
ADDRLP4 556+4
INDIRF4
ADDRGP4 cg+109836+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+109836+8
ADDRLP4 556+8
INDIRF4
ADDRGP4 cg+109836+8
INDIRF4
ADDF4
ASGNF4
line 602
;602:          cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+109832
ADDRGP4 cg+107608
INDIRI4
ASGNI4
line 603
;603:        }
LABELV $373
line 604
;604:      }
LABELV $339
line 605
;605:    }
LABELV $335
line 609
;606:
;607:    // don't predict gauntlet firing, which is only supposed to happen
;608:    // when it actually inflicts damage
;609:    for( i = WP_NONE + 1; i < WP_NUM_WEAPONS; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $421
line 610
;610:      cg_pmove.autoWeaponHit[ i ] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_pmove+44
ADDP4
CNSTI4 0
ASGNI4
LABELV $422
line 609
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $421
line 612
;611:
;612:    if( cg_pmove.pmove_fixed )
ADDRGP4 cg_pmove+344
INDIRI4
CNSTI4 0
EQI4 $426
line 613
;613:      cg_pmove.cmd.serverTime = ( ( cg_pmove.cmd.serverTime + pmove_msec.integer - 1 ) /
ADDRGP4 cg_pmove+8
ADDRGP4 cg_pmove+8
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
LABELV $426
line 616
;614:                                  pmove_msec.integer ) * pmove_msec.integer;
;615:
;616:    Pmove( &cg_pmove );
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 618
;617:
;618:    moved = qtrue;
ADDRLP4 480
CNSTI4 1
ASGNI4
line 621
;619:
;620:    // add push trigger movement effects
;621:    CG_TouchTriggerPrediction( );
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 625
;622:
;623:    // check for predictable events that changed from previous predictions
;624:    //CG_CheckChangedPredictableEvents(&cg.predictedPlayerState);
;625:  }
LABELV $320
line 526
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $322
ADDRLP4 4
INDIRI4
ADDRLP4 476
INDIRI4
LEI4 $319
line 627
;626:
;627:  if( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $434
line 628
;628:    CG_Printf( "[%i : %i] ", cg_pmove.cmd.serverTime, cg.time );
ADDRGP4 $437
ARGP4
ADDRGP4 cg_pmove+8
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $434
line 630
;629:
;630:  if( !moved )
ADDRLP4 480
INDIRI4
CNSTI4 0
NEI4 $440
line 631
;631:  {
line 632
;632:    if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $252
line 633
;633:      CG_Printf( "not moved\n" );
ADDRGP4 $445
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 635
;634:
;635:    return;
ADDRGP4 $252
JUMPV
LABELV $440
line 639
;636:  }
;637:
;638:  // adjust for the movement of the groundentity
;639:  CG_AdjustPositionForMover( cg.predictedPlayerState.origin,
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 643
;640:    cg.predictedPlayerState.groundEntityNum,
;641:    cg.physicsTime, cg.time, cg.predictedPlayerState.origin );
;642:
;643:  if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $454
line 644
;644:  {
line 645
;645:    if( cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS )
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 8+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $457
line 646
;646:      CG_Printf( "WARNING: dropped event\n" );
ADDRGP4 $462
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $457
line 647
;647:  }
LABELV $454
line 650
;648:
;649:  // fire events and other transition triggered things
;650:  CG_TransitionPlayerState( &cg.predictedPlayerState, &oldPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 652
;651:
;652:  if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $464
line 653
;653:  {
line 654
;654:    if( cg.eventSequence > cg.predictedPlayerState.eventSequence )
ADDRGP4 cg+109848
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $467
line 655
;655:    {
line 656
;656:      CG_Printf( "WARNING: double event\n" );
ADDRGP4 $472
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 657
;657:      cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+109848
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
line 658
;658:    }
LABELV $467
line 659
;659:  }
LABELV $464
line 660
;660:}
LABELV $252
endproc CG_PredictPlayerState 596 20
bss
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 360
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
import CG_SetAttachmentOffset
import CG_SetAttachmentParticle
import CG_SetAttachmentTag
import CG_SetAttachmentCent
import CG_SetAttachmentPoint
import CG_AttachToParticle
import CG_AttachToTag
import CG_AttachToCent
import CG_AttachToPoint
import CG_Attached
import CG_AttachmentCentNum
import CG_AttachmentVelocity
import CG_AttachmentAxis
import CG_AttachmentDir
import CG_AttachmentPoint
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
LABELV $472
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $462
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $445
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $437
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $391
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $378
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $314
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $310
byte 1 56
byte 1 0
align 1
LABELV $309
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $292
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
