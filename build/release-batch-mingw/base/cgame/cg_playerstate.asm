export CG_DamageFeedback
code
proc CG_DamageFeedback 72 16
file "..\..\..\..\src/cgame/cg_playerstate.c"
line 38
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
;24:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;25:// With normal play, this will be done after local prediction, but when
;26:// following another player or playing back a demo, it will be checked
;27:// when the snapshot transitions like all the other entities
;28:
;29:
;30:#include "cg_local.h"
;31:
;32:/*
;33:==============
;34:CG_DamageFeedback
;35:==============
;36:*/
;37:void CG_DamageFeedback( int yawByte, int pitchByte, int damage )
;38:{
line 49
;39:  float   left, front, up;
;40:  float   kick;
;41:  int     health;
;42:  float   scale;
;43:  vec3_t  dir;
;44:  vec3_t  angles;
;45:  float   dist;
;46:  float   yaw, pitch;
;47:
;48:  // show the attacking player's head and name in corner
;49:  cg.attackerTime = cg.time;
ADDRGP4 cg+115432
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 52
;50:
;51:  // the lower on health you are, the greater the view kick will be
;52:  health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 54
;53:
;54:  if( health < 40 )
ADDRLP4 20
INDIRI4
CNSTI4 40
GEI4 $103
line 55
;55:    scale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRGP4 $104
JUMPV
LABELV $103
line 57
;56:  else
;57:    scale = 40.0 / health;
ADDRLP4 28
CNSTF4 1109393408
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
ASGNF4
LABELV $104
line 59
;58:
;59:  kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 61
;60:
;61:  if( kick < 5 )
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $105
line 62
;62:    kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $105
line 64
;63:
;64:  if( kick > 10 )
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $107
line 65
;65:    kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $107
line 68
;66:
;67:  // if yaw and pitch are both 255, make the damage always centered (falling, etc)
;68:  if( yawByte == 255 && pitchByte == 255 )
ADDRLP4 60
CNSTI4 255
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $109
ADDRFP4 4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $109
line 69
;69:  {
line 70
;70:    cg.damageX = 0;
ADDRGP4 cg+115708
CNSTF4 0
ASGNF4
line 71
;71:    cg.damageY = 0;
ADDRGP4 cg+115712
CNSTF4 0
ASGNF4
line 72
;72:    cg.v_dmg_roll = 0;
ADDRGP4 cg+115756
CNSTF4 0
ASGNF4
line 73
;73:    cg.v_dmg_pitch = -kick;
ADDRGP4 cg+115752
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 74
;74:  }
ADDRGP4 $110
JUMPV
LABELV $109
line 76
;75:  else
;76:  {
line 78
;77:    // positional
;78:    pitch = pitchByte / 255.0 * 360;
ADDRLP4 56
CNSTF4 1135869952
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 79
;79:    yaw = yawByte / 255.0 * 360;
ADDRLP4 52
CNSTF4 1135869952
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 81
;80:
;81:    angles[ PITCH ] = pitch;
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 82
;82:    angles[ YAW ] = yaw;
ADDRLP4 32+4
ADDRLP4 52
INDIRF4
ASGNF4
line 83
;83:    angles[ ROLL ] = 0;
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 85
;84:
;85:    AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 32
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 86
;86:    VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 88
;87:
;88:    front = DotProduct( dir, cg.refdef.viewaxis[ 0 ] );
ADDRLP4 16
ADDRLP4 0
INDIRF4
ADDRGP4 cg+110040+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+110040+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+110040+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 89
;89:    left = DotProduct( dir, cg.refdef.viewaxis[ 1 ] );
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRGP4 cg+110040+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+110040+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+110040+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 90
;90:    up = DotProduct( dir, cg.refdef.viewaxis[ 2 ] );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRGP4 cg+110040+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+110040+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+110040+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 92
;91:
;92:    dir[ 0 ] = front;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 93
;93:    dir[ 1 ] = left;
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 94
;94:    dir[ 2 ] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 95
;95:    dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
ASGNF4
line 97
;96:
;97:    if( dist < 0.1f )
ADDRLP4 44
INDIRF4
CNSTF4 1036831949
GEF4 $161
line 98
;98:      dist = 0.1f;
ADDRLP4 44
CNSTF4 1036831949
ASGNF4
LABELV $161
line 100
;99:
;100:    cg.v_dmg_roll = kick * left;
ADDRGP4 cg+115756
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 102
;101:
;102:    cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+115752
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 104
;103:
;104:    if( front <= 0.1 )
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $165
line 105
;105:      front = 0.1f;
ADDRLP4 16
CNSTF4 1036831949
ASGNF4
LABELV $165
line 107
;106:
;107:    cg.damageX = -left / front;
ADDRGP4 cg+115708
ADDRLP4 24
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 108
;108:    cg.damageY = up / dist;
ADDRGP4 cg+115712
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
ASGNF4
line 109
;109:  }
LABELV $110
line 112
;110:
;111:  // clamp the position
;112:  if( cg.damageX > 1.0 )
ADDRGP4 cg+115708
INDIRF4
CNSTF4 1065353216
LEF4 $169
line 113
;113:    cg.damageX = 1.0;
ADDRGP4 cg+115708
CNSTF4 1065353216
ASGNF4
LABELV $169
line 115
;114:
;115:  if( cg.damageX < - 1.0 )
ADDRGP4 cg+115708
INDIRF4
CNSTF4 3212836864
GEF4 $173
line 116
;116:    cg.damageX = -1.0;
ADDRGP4 cg+115708
CNSTF4 3212836864
ASGNF4
LABELV $173
line 118
;117:
;118:  if( cg.damageY > 1.0 )
ADDRGP4 cg+115712
INDIRF4
CNSTF4 1065353216
LEF4 $177
line 119
;119:    cg.damageY = 1.0;
ADDRGP4 cg+115712
CNSTF4 1065353216
ASGNF4
LABELV $177
line 121
;120:
;121:  if( cg.damageY < - 1.0 )
ADDRGP4 cg+115712
INDIRF4
CNSTF4 3212836864
GEF4 $181
line 122
;122:    cg.damageY = -1.0;
ADDRGP4 cg+115712
CNSTF4 3212836864
ASGNF4
LABELV $181
line 125
;123:
;124:  // don't let the screen flashes vary as much
;125:  if( kick > 10 )
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $185
line 126
;126:    kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $185
line 128
;127:
;128:  cg.damageValue = kick;
ADDRGP4 cg+115716
ADDRLP4 12
INDIRF4
ASGNF4
line 129
;129:  cg.v_dmg_time = cg.time + DAMAGE_TIME;
ADDRGP4 cg+115748
ADDRGP4 cg+107604
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 130
;130:  cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+115704
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 131
;131:}
LABELV $99
endproc CG_DamageFeedback 72 16
export CG_Respawn
proc CG_Respawn 0 0
line 144
;132:
;133:
;134:
;135:
;136:/*
;137:================
;138:CG_Respawn
;139:
;140:A respawn happened this snapshot
;141:================
;142:*/
;143:void CG_Respawn( void )
;144:{
line 146
;145:  // no error decay on player movement
;146:  cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 149
;147:
;148:  // display weapons available
;149:  cg.weaponSelectTime = cg.time;
ADDRGP4 cg+115692
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 152
;150:
;151:  // select the weapon the server says we are using
;152:  cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+109940
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 154
;153:
;154:  CG_ResetPainBlend( );
ADDRGP4 CG_ResetPainBlend
CALLV
pop
line 155
;155:}
LABELV $192
endproc CG_Respawn 0 0
export CG_CheckPlayerstateEvents
proc CG_CheckPlayerstateEvents 52 8
line 164
;156:
;157:/*
;158:==============
;159:CG_CheckPlayerstateEvents
;160:
;161:==============
;162:*/
;163:void CG_CheckPlayerstateEvents( playerState_t *ps, playerState_t *ops )
;164:{
line 169
;165:  int       i;
;166:  int       event;
;167:  centity_t *cent;
;168:
;169:  if( ps->externalEvent && ps->externalEvent != ops->externalEvent )
ADDRLP4 12
CNSTI4 128
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $199
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $199
line 170
;170:  {
line 171
;171:    cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 172
;172:    cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 173
;173:    cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 174
;174:    CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 175
;175:  }
LABELV $199
line 177
;176:
;177:  cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 180
;178:
;179:  // go through the predictable events buffer
;180:  for( i = ps->eventSequence - MAX_PS_EVENTS; i < ps->eventSequence; i++ )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 181
;181:  {
line 183
;182:    // if we have a new predictable event
;183:    if( i >= ops->eventSequence ||
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $208
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LEI4 $206
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
CNSTI4 112
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
EQI4 $206
LABELV $208
line 188
;184:      // or the server told us to play another event instead of a predicted event we already issued
;185:      // or something the server told us changed our prediction causing a different event
;186:      ( i > ops->eventSequence - MAX_PS_EVENTS && ps->events[ i & ( MAX_PS_EVENTS - 1 ) ] !=
;187:        ops->events[ i & ( MAX_PS_EVENTS - 1 ) ] ) )
;188:    {
line 189
;189:      event = ps->events[ i & ( MAX_PS_EVENTS - 1 ) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 191
;190:
;191:      cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 192
;192:      cent->currentState.eventParm = ps->eventParms[ i & ( MAX_PS_EVENTS - 1 ) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 193
;193:      CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 194
;194:      cg.predictableEvents[ i & ( MAX_PREDICTED_EVENTS - 1 ) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+109852
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 196
;195:
;196:      cg.eventSequence++;
ADDRLP4 48
ADDRGP4 cg+109848
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 197
;197:    }
LABELV $206
line 198
;198:  }
LABELV $203
line 180
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $202
line 199
;199:}
LABELV $198
endproc CG_CheckPlayerstateEvents 52 8
export CG_CheckChangedPredictableEvents
proc CG_CheckChangedPredictableEvents 24 8
line 208
;200:
;201:
;202:/*
;203:==================
;204:CG_CheckChangedPredictableEvents
;205:==================
;206:*/
;207:void CG_CheckChangedPredictableEvents( playerState_t *ps )
;208:{
line 213
;209:  int       i;
;210:  int       event;
;211:  centity_t *cent;
;212:
;213:  cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 215
;214:
;215:  for( i = ps->eventSequence - MAX_PS_EVENTS; i < ps->eventSequence; i++ )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $213
line 216
;216:  {
line 218
;217:    //
;218:    if( i >= cg.eventSequence )
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109848
INDIRI4
LTI4 $217
line 219
;219:      continue;
ADDRGP4 $214
JUMPV
LABELV $217
line 222
;220:
;221:    // if this event is not further back in than the maximum predictable events we remember
;222:    if( i > cg.eventSequence - MAX_PREDICTED_EVENTS )
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109848
INDIRI4
CNSTI4 16
SUBI4
LEI4 $220
line 223
;223:    {
line 225
;224:      // if the new playerstate event is different from a previously predicted one
;225:      if( ps->events[ i & ( MAX_PS_EVENTS - 1 ) ] != cg.predictableEvents[ i & ( MAX_PREDICTED_EVENTS - 1 ) ] )
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 cg+109852
ADDP4
INDIRI4
EQI4 $223
line 226
;226:      {
line 227
;227:        event = ps->events[ i & ( MAX_PS_EVENTS - 1 ) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 228
;228:        cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 229
;229:        cent->currentState.eventParm = ps->eventParms[ i & ( MAX_PS_EVENTS - 1 ) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 230
;230:        CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 232
;231:
;232:        cg.predictableEvents[ i & ( MAX_PREDICTED_EVENTS - 1 ) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+109852
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 234
;233:
;234:        if( cg_showmiss.integer )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $227
line 235
;235:          CG_Printf( "WARNING: changed predicted event\n" );
ADDRGP4 $230
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $227
line 236
;236:      }
LABELV $223
line 237
;237:    }
LABELV $220
line 238
;238:  }
LABELV $214
line 215
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $216
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $213
line 239
;239:}
LABELV $211
endproc CG_CheckChangedPredictableEvents 24 8
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 12 8
line 247
;240:
;241:/*
;242:==================
;243:CG_CheckLocalSounds
;244:==================
;245:*/
;246:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops )
;247:{
line 251
;248:  int reward;
;249:
;250:  // don't play the sounds if the player just changed teams
;251:  if( ps->persistant[ PERS_TEAM ] != ops->persistant[ PERS_TEAM ] )
ADDRLP4 4
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
EQI4 $232
line 252
;252:    return;
ADDRGP4 $231
JUMPV
LABELV $232
line 255
;253:
;254:  // health changes of more than -1 should make pain sounds
;255:  if( ps->stats[ STAT_HEALTH ] < ops->stats[ STAT_HEALTH ] - 1 )
ADDRLP4 8
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $234
line 256
;256:  {
line 257
;257:    if( ps->stats[ STAT_HEALTH ] > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $236
line 258
;258:      CG_PainEvent( &cg.predictedPlayerEntity, ps->stats[ STAT_HEALTH ] );
ADDRGP4 cg+108104
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
LABELV $236
line 259
;259:  }
LABELV $234
line 263
;260:
;261:
;262:  // if we are going into the intermission, don't start any voices
;263:  if( cg.intermissionStarted )
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $239
line 264
;264:    return;
ADDRGP4 $231
JUMPV
LABELV $239
line 267
;265:
;266:  // reward sounds
;267:  reward = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 268
;268:}
LABELV $231
endproc CG_CheckLocalSounds 12 8
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 28 12
line 278
;269:
;270:
;271:/*
;272:===============
;273:CG_TransitionPlayerState
;274:
;275:===============
;276:*/
;277:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops )
;278:{
line 280
;279:  // check for changing follow mode
;280:  if( ps->clientNum != ops->clientNum )
ADDRLP4 0
CNSTI4 140
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
EQI4 $243
line 281
;281:  {
line 282
;282:    cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 284
;283:    // make sure we don't get any unwanted transition effects
;284:    *ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
line 286
;285:
;286:    CG_ResetPainBlend( );
ADDRGP4 CG_ResetPainBlend
CALLV
pop
line 287
;287:  }
LABELV $243
line 290
;288:
;289:  // damage events (player is getting wounded)
;290:  if( ps->damageEvent != ops->damageEvent && ps->damageCount )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
EQI4 $246
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $246
line 291
;291:    CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
LABELV $246
line 294
;292:
;293:  // respawning
;294:  if( ps->persistant[ PERS_SPAWN_COUNT ] != ops->persistant[ PERS_SPAWN_COUNT ] )
ADDRLP4 16
CNSTI4 264
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
EQI4 $248
line 295
;295:    CG_Respawn( );
ADDRGP4 CG_Respawn
CALLV
pop
LABELV $248
line 297
;296:
;297:  if( cg.mapRestart )
ADDRGP4 cg+107624
INDIRI4
CNSTI4 0
EQI4 $250
line 298
;298:  {
line 299
;299:    CG_Respawn( );
ADDRGP4 CG_Respawn
CALLV
pop
line 300
;300:    cg.mapRestart = qfalse;
ADDRGP4 cg+107624
CNSTI4 0
ASGNI4
line 301
;301:  }
LABELV $250
line 303
;302:
;303:  if( cg.snap->ps.pm_type != PM_INTERMISSION &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
EQI4 $254
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
EQI4 $254
line 305
;304:      ps->persistant[ PERS_TEAM ] != TEAM_SPECTATOR )
;305:    CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
LABELV $254
line 308
;306:
;307:  // run events
;308:  CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 311
;309:
;310:  // smooth the ducking viewheight change
;311:  if( ps->viewheight != ops->viewheight )
ADDRLP4 20
CNSTI4 164
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $257
line 312
;312:  {
line 313
;313:    cg.duckChange = ps->viewheight - ops->viewheight;
ADDRLP4 24
CNSTI4 164
ASGNI4
ADDRGP4 cg+109924
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 314
;314:    cg.duckTime = cg.time;
ADDRGP4 cg+109928
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 315
;315:  }
LABELV $257
line 316
;316:}
LABELV $242
endproc CG_TransitionPlayerState 28 12
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
LABELV $230
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
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
