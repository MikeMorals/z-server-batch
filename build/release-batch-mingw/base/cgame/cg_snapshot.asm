code
proc CG_ResetEntity 8 4
file "..\..\..\..\src/cgame/cg_snapshot.c"
line 36
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
;24:// cg_snapshot.c -- things that happen on snapshot transition,
;25:// not necessarily every single rendered frame
;26:
;27:
;28:#include "cg_local.h"
;29:
;30:/*
;31:==================
;32:CG_ResetEntity
;33:==================
;34:*/
;35:static void CG_ResetEntity( centity_t *cent )
;36:{
line 39
;37:  // if the previous snapshot this entity was updated in is at least
;38:  // an event window back in time then we can reset the previous event
;39:  if( cent->snapShotTime < cg.time - EVENT_VALID_MSEC )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 300
SUBI4
GEI4 $100
line 40
;40:    cent->previousEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 0
ASGNI4
LABELV $100
line 42
;41:
;42:  cent->trailTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 44
;43:
;44:  VectorCopy( cent->currentState.origin, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 45
;45:  VectorCopy( cent->currentState.angles, cent->lerpAngles );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1568
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 47
;46:
;47:  if( cent->currentState.eType == ET_PLAYER )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $104
line 48
;48:    CG_ResetPlayerEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
LABELV $104
line 49
;49:}
LABELV $99
endproc CG_ResetEntity 8 4
proc CG_TransitionEntity 4 4
line 59
;50:
;51:/*
;52:===============
;53:CG_TransitionEntity
;54:
;55:cent->nextState is moved to cent->currentState and events are fired
;56:===============
;57:*/
;58:static void CG_TransitionEntity( centity_t *cent )
;59:{
line 60
;60:  cent->currentState = cent->nextState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 208
line 61
;61:  cent->currentValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 64
;62:
;63:  // reset if the entity wasn't in the last frame or was teleported
;64:  if( !cent->interpolate )
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $107
line 65
;65:    CG_ResetEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
LABELV $107
line 68
;66:
;67:  // clear the next state.  if will be set by the next CG_SetNextSnap
;68:  cent->interpolate = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 71
;69:
;70:  // check for events
;71:  CG_CheckEvents( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 72
;72:}
LABELV $106
endproc CG_TransitionEntity 4 4
export CG_SetInitialSnapshot
proc CG_SetInitialSnapshot 16 12
line 87
;73:
;74:
;75:/*
;76:==================
;77:CG_SetInitialSnapshot
;78:
;79:This will only happen on the very first snapshot, or
;80:on tourney restarts.  All other times will use
;81:CG_TransitionSnapshot instead.
;82:
;83:FIXME: Also called by map_restart?
;84:==================
;85:*/
;86:void CG_SetInitialSnapshot( snapshot_t *snap )
;87:{
line 92
;88:  int           i;
;89:  centity_t     *cent;
;90:  entityState_t *state;
;91:
;92:  cg.snap = snap;
ADDRGP4 cg+36
ADDRFP4 0
INDIRP4
ASGNP4
line 94
;93:
;94:  BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].currentState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1724
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 97
;95:
;96:  // sort out solid entities
;97:  CG_BuildSolidList( );
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 99
;98:
;99:  CG_ExecuteNewServerCommands( snap->serverCommandSequence );
ADDRFP4 0
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 103
;100:
;101:  // set our local weapon selection pointer to
;102:  // what the server has indicated the current weapon is
;103:  CG_Respawn( );
ADDRGP4 CG_Respawn
CALLV
pop
line 105
;104:
;105:  for( i = 0; i < cg.snap->numEntities; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 106
;106:  {
line 107
;107:    state = &cg.snap->entities[ i ];
ADDRLP4 8
CNSTI4 208
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 108
;108:    cent = &cg_entities[ state->number ];
ADDRLP4 0
CNSTI4 1724
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 110
;109:
;110:    memcpy( &cent->currentState, state, sizeof( entityState_t ) );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 112
;111:    //cent->currentState = *state;
;112:    cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 113
;113:    cent->currentValid = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 115
;114:
;115:    CG_ResetEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 118
;116:
;117:    // check for events
;118:    CG_CheckEvents( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 119
;119:  }
LABELV $112
line 105
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $111
line 120
;120:}
LABELV $109
endproc CG_SetInitialSnapshot 16 12
proc CG_TransitionSnapshot 28 12
line 131
;121:
;122:
;123:/*
;124:===================
;125:CG_TransitionSnapshot
;126:
;127:The transition point from snap to nextSnap has passed
;128:===================
;129:*/
;130:static void CG_TransitionSnapshot( void )
;131:{
line 136
;132:  centity_t   *cent;
;133:  snapshot_t  *oldFrame;
;134:  int         i;
;135:
;136:  if( !cg.snap )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $118
line 137
;137:    CG_Error( "CG_TransitionSnapshot: NULL cg.snap" );
ADDRGP4 $121
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $118
line 139
;138:
;139:  if( !cg.nextSnap )
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $122
line 140
;140:    CG_Error( "CG_TransitionSnapshot: NULL cg.nextSnap" );
ADDRGP4 $125
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $122
line 143
;141:
;142:  // execute any server string commands before transitioning entities
;143:  CG_ExecuteNewServerCommands( cg.nextSnap->serverCommandSequence );
ADDRGP4 cg+40
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 146
;144:
;145:  // if we had a map_restart, set everthing with initial
;146:  if( !cg.snap ) { } //TA: ?
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
LABELV $127
line 149
;147:
;148:  // clear the currentValid flag for all entities in the existing snapshot
;149:  for( i = 0; i < cg.snap->numEntities; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 150
;150:  {
line 151
;151:    cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 1724
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 152
;152:    cent->currentValid = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 0
ASGNI4
line 153
;153:  }
LABELV $131
line 149
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $130
line 156
;154:
;155:  // move nextSnap to snap and do the transitions
;156:  oldFrame = cg.snap;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 157
;157:  cg.snap = cg.nextSnap;
ADDRGP4 cg+36
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 159
;158:
;159:  BG_PlayerStateToEntityState( &cg.snap->ps, &cg_entities[ cg.snap->ps.clientNum ].currentState, qfalse );
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1724
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 160
;160:  cg_entities[ cg.snap->ps.clientNum ].interpolate = qfalse;
CNSTI4 1724
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 0
ASGNI4
line 162
;161:
;162:  for( i = 0; i < cg.snap->numEntities; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $146
JUMPV
LABELV $143
line 163
;163:  {
line 164
;164:    cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 1724
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 165
;165:    CG_TransitionEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 168
;166:
;167:    // remember time of snapshot this entity was last updated in
;168:    cent->snapShotTime = cg.snap->serverTime;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 169
;169:  }
LABELV $144
line 162
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $146
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $143
line 171
;170:
;171:  cg.nextSnap = NULL;
ADDRGP4 cg+40
CNSTP4 0
ASGNP4
line 174
;172:
;173:  // check for playerstate transition events
;174:  if( oldFrame )
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $151
line 175
;175:  {
line 178
;176:    playerState_t *ops, *ps;
;177:
;178:    ops = &oldFrame->ps;
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 179
;179:    ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 181
;180:    // teleporting checks are irrespective of prediction
;181:    if( ( ps->eFlags ^ ops->eFlags ) & EF_TELEPORT_BIT )
ADDRLP4 20
CNSTI4 104
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $154
line 182
;182:      cg.thisFrameTeleport = qtrue; // will be cleared by prediction code
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
LABELV $154
line 186
;183:
;184:    // if we are not doing client side movement prediction for any
;185:    // reason, then the client events and view changes will be issued now
;186:    if( cg.demoPlayback || ( cg.snap->ps.pm_flags & PMF_FOLLOW ) ||
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $165
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $165
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $165
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $157
LABELV $165
line 188
;187:        cg_nopredict.integer || cg_synchronousClients.integer )
;188:      CG_TransitionPlayerState( ps, ops );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
LABELV $157
line 189
;189:  }
LABELV $151
line 190
;190:}
LABELV $117
endproc CG_TransitionSnapshot 28 12
proc CG_SetNextSnap 32 12
line 201
;191:
;192:
;193:/*
;194:===================
;195:CG_SetNextSnap
;196:
;197:A new snapshot has just been read in from the client system.
;198:===================
;199:*/
;200:static void CG_SetNextSnap( snapshot_t *snap )
;201:{
line 206
;202:  int           num;
;203:  entityState_t *es;
;204:  centity_t     *cent;
;205:
;206:  cg.nextSnap = snap;
ADDRGP4 cg+40
ADDRFP4 0
INDIRP4
ASGNP4
line 208
;207:
;208:  BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].nextState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1724
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+208
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 209
;209:  cg_entities[ cg.snap->ps.clientNum ].interpolate = qtrue;
CNSTI4 1724
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 1
ASGNI4
line 212
;210:
;211:  // check for extrapolation errors
;212:  for( num = 0 ; num < snap->numEntities ; num++ )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $171
line 213
;213:  {
line 214
;214:    es = &snap->entities[ num ];
ADDRLP4 4
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 215
;215:    cent = &cg_entities[ es->number ];
ADDRLP4 0
CNSTI4 1724
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 217
;216:
;217:    memcpy( &cent->nextState, es, sizeof( entityState_t ) );
ADDRLP4 16
CNSTI4 208
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 222
;218:    //cent->nextState = *es;
;219:
;220:    // if this frame is a teleport, or the entity wasn't in the
;221:    // previous frame, don't interpolate
;222:    if( !cent->currentValid || ( ( cent->currentState.eFlags ^ es->eFlags ) & EF_TELEPORT_BIT ) )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $177
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 2
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $175
LABELV $177
line 223
;223:      cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $175
line 225
;224:    else
;225:      cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
LABELV $176
line 226
;226:  }
LABELV $172
line 212
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $174
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $171
line 230
;227:
;228:  // if the next frame is a teleport for the playerstate, we
;229:  // can't interpolate during demos
;230:  if( cg.snap && ( ( snap->ps.eFlags ^ cg.snap->ps.eFlags ) & EF_TELEPORT_BIT ) )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
ADDRLP4 16
CNSTI4 148
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $178
line 231
;231:    cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $178
line 233
;232:  else
;233:    cg.nextFrameTeleport = qfalse;
ADDRGP4 cg+107596
CNSTI4 0
ASGNI4
LABELV $179
line 236
;234:
;235:  // if changing follow mode, don't interpolate
;236:  if( cg.nextSnap->ps.clientNum != cg.snap->ps.clientNum )
ADDRLP4 20
CNSTI4 184
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $184
line 237
;237:    cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
LABELV $184
line 240
;238:
;239:  // if changing server restarts, don't interpolate
;240:  if( ( cg.nextSnap->snapFlags ^ cg.snap->snapFlags ) & SNAPFLAG_SERVERCOUNT )
ADDRGP4 cg+40
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $189
line 241
;241:    cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
LABELV $189
line 244
;242:
;243:  // sort out solid entities
;244:  CG_BuildSolidList( );
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 245
;245:}
LABELV $166
endproc CG_SetNextSnap 32 12
proc CG_ReadNextSnapshot 20 12
line 259
;246:
;247:
;248:/*
;249:========================
;250:CG_ReadNextSnapshot
;251:
;252:This is the only place new snapshots are requested
;253:This may increment cgs.processedSnapshotNum multiple
;254:times if the client system fails to return a
;255:valid snapshot.
;256:========================
;257:*/
;258:static snapshot_t *CG_ReadNextSnapshot( void )
;259:{
line 263
;260:  qboolean    r;
;261:  snapshot_t  *dest;
;262:
;263:  if( cg.latestSnapshotNum > cgs.processedSnapshotNum + 1000 )
ADDRGP4 cg+28
INDIRI4
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $203
line 264
;264:  {
line 265
;265:    CG_Printf( "WARNING: CG_ReadNextSnapshot: way out of range, %i > %i",
ADDRGP4 $199
ARGP4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31460
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 267
;266:      cg.latestSnapshotNum, cgs.processedSnapshotNum );
;267:  }
ADDRGP4 $203
JUMPV
LABELV $202
line 270
;268:
;269:  while( cgs.processedSnapshotNum < cg.latestSnapshotNum )
;270:  {
line 272
;271:    // decide which of the two slots to load it into
;272:    if( cg.snap == &cg.activeSnapshots[ 0 ] )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRGP4 cg+44
CVPU4 4
NEU4 $207
line 273
;273:      dest = &cg.activeSnapshots[ 1 ];
ADDRLP4 0
ADDRGP4 cg+44+53772
ASGNP4
ADDRGP4 $208
JUMPV
LABELV $207
line 275
;274:    else
;275:      dest = &cg.activeSnapshots[ 0 ];
ADDRLP4 0
ADDRGP4 cg+44
ASGNP4
LABELV $208
line 278
;276:
;277:    // try to read the snapshot from the client system
;278:    cgs.processedSnapshotNum++;
ADDRLP4 8
ADDRGP4 cgs+31460
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 279
;279:    r = trap_GetSnapshot( cgs.processedSnapshotNum, dest );
ADDRGP4 cgs+31460
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_GetSnapshot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 282
;280:
;281:    // FIXME: why would trap_GetSnapshot return a snapshot with the same server time
;282:    if( cg.snap && r && dest->serverTime == cg.snap->serverTime )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $216
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
NEI4 $216
line 283
;283:    {
line 285
;284:      //continue;
;285:    }
LABELV $216
line 288
;286:
;287:    // if it succeeded, return
;288:    if( r )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $220
line 289
;289:    {
line 290
;290:      CG_AddLagometerSnapshotInfo( dest );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 291
;291:      return dest;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $194
JUMPV
LABELV $220
line 300
;292:    }
;293:
;294:    // a GetSnapshot will return failure if the snapshot
;295:    // never arrived, or  is so old that its entities
;296:    // have been shoved off the end of the circular
;297:    // buffer in the client system.
;298:
;299:    // record as a dropped packet
;300:    CG_AddLagometerSnapshotInfo( NULL );
CNSTP4 0
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 304
;301:
;302:    // If there are additional snapshots, continue trying to
;303:    // read them.
;304:  }
LABELV $203
line 269
ADDRGP4 cgs+31460
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $202
line 307
;305:
;306:  // nothing left to read
;307:  return NULL;
CNSTP4 0
RETP4
LABELV $194
endproc CG_ReadNextSnapshot 20 12
export CG_ProcessSnapshots
proc CG_ProcessSnapshots 16 8
line 331
;308:}
;309:
;310:
;311:/*
;312:============
;313:CG_ProcessSnapshots
;314:
;315:We are trying to set up a renderable view, so determine
;316:what the simulated time is, and try to get snapshots
;317:both before and after that time if available.
;318:
;319:If we don't have a valid cg.snap after exiting this function,
;320:then a 3D game view cannot be rendered.  This should only happen
;321:right after the initial connection.  After cg.snap has been valid
;322:once, it will never turn invalid.
;323:
;324:Even if cg.snap is valid, cg.nextSnap may not be, if the snapshot
;325:hasn't arrived yet (it becomes an extrapolating situation instead
;326:of an interpolating one)
;327:
;328:============
;329:*/
;330:void CG_ProcessSnapshots( void )
;331:{
line 336
;332:  snapshot_t  *snap;
;333:  int         n;
;334:
;335:  // see what the latest snapshot the client system has is
;336:  trap_GetCurrentSnapshotNumber( &n, &cg.latestSnapshotTime );
ADDRLP4 4
ARGP4
ADDRGP4 cg+32
ARGP4
ADDRGP4 trap_GetCurrentSnapshotNumber
CALLV
pop
line 338
;337:
;338:  if( n != cg.latestSnapshotNum )
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
EQI4 $233
line 339
;339:  {
line 340
;340:    if( n < cg.latestSnapshotNum )
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
GEI4 $227
line 341
;341:    {
line 343
;342:      // this should never happen
;343:      CG_Error( "CG_ProcessSnapshots: n < cg.latestSnapshotNum" );
ADDRGP4 $230
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 344
;344:    }
LABELV $227
line 346
;345:
;346:    cg.latestSnapshotNum = n;
ADDRGP4 cg+28
ADDRLP4 4
INDIRI4
ASGNI4
line 347
;347:  }
ADDRGP4 $233
JUMPV
LABELV $232
line 353
;348:
;349:  // If we have yet to receive a snapshot, check for it.
;350:  // Once we have gotten the first snapshot, cg.snap will
;351:  // always have valid data for the rest of the game
;352:  while( !cg.snap )
;353:  {
line 354
;354:    snap = CG_ReadNextSnapshot( );
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 356
;355:
;356:    if( !snap )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 357
;357:    {
line 359
;358:      // we can't continue until we get a snapshot
;359:      return;
ADDRGP4 $222
JUMPV
LABELV $236
line 364
;360:    }
;361:
;362:    // set our weapon selection to what
;363:    // the playerstate is currently using
;364:    if( !( snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $238
line 365
;365:      CG_SetInitialSnapshot( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetInitialSnapshot
CALLV
pop
LABELV $238
line 366
;366:  }
LABELV $233
line 352
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $232
LABELV $240
line 372
;367:
;368:  // loop until we either have a valid nextSnap with a serverTime
;369:  // greater than cg.time to interpolate towards, or we run
;370:  // out of available snapshots
;371:  do
;372:  {
line 374
;373:    // if we don't have a nextframe, try and read a new one in
;374:    if( !cg.nextSnap )
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $243
line 375
;375:    {
line 376
;376:      snap = CG_ReadNextSnapshot( );
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 380
;377:
;378:      // if we still don't have a nextframe, we will just have to
;379:      // extrapolate
;380:      if( !snap )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $246
line 381
;381:        break;
ADDRGP4 $242
JUMPV
LABELV $246
line 383
;382:
;383:      CG_SetNextSnap( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetNextSnap
CALLV
pop
line 386
;384:
;385:      // if time went backwards, we have a level restart
;386:      if( cg.nextSnap->serverTime < cg.snap->serverTime )
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
GEI4 $248
line 387
;387:        CG_Error( "CG_ProcessSnapshots: Server time went backwards" );
ADDRGP4 $252
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $248
line 388
;388:    }
LABELV $243
line 391
;389:
;390:    // if our time is < nextFrame's, we have a nice interpolating state
;391:    if( cg.time >= cg.snap->serverTime && cg.time < cg.nextSnap->serverTime )
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
LTI4 $253
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
GEI4 $253
line 392
;392:      break;
ADDRGP4 $242
JUMPV
LABELV $253
line 395
;393:
;394:    // we have passed the transition from nextFrame to frame
;395:    CG_TransitionSnapshot( );
ADDRGP4 CG_TransitionSnapshot
CALLV
pop
line 396
;396:  } while( 1 );
LABELV $241
ADDRGP4 $240
JUMPV
LABELV $242
line 399
;397:
;398:  // assert our valid conditions upon exiting
;399:  if( cg.snap == NULL )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 400
;400:    CG_Error( "CG_ProcessSnapshots: cg.snap == NULL" );
ADDRGP4 $262
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $259
line 402
;401:
;402:  if( cg.time < cg.snap->serverTime )
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $263
line 403
;403:  {
line 405
;404:    // this can happen right after a vid_restart
;405:    cg.time = cg.snap->serverTime;
ADDRGP4 cg+107604
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 406
;406:  }
LABELV $263
line 408
;407:
;408:  if( cg.nextSnap != NULL && cg.nextSnap->serverTime <= cg.time )
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $269
line 409
;409:    CG_Error( "CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time" );
ADDRGP4 $274
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $269
line 410
;410:}
LABELV $222
endproc CG_ProcessSnapshots 16 8
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
LABELV $274
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 45
byte 1 62
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $262
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $252
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $230
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 32
byte 1 60
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $199
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $125
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $121
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 0
