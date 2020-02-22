code
proc CG_DoorAnimation 0 4
file "..\..\..\..\src/cgame/cg_animmapobj.c"
line 33
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
;24:#include "cg_local.h"
;25:
;26:
;27:/*
;28:===============
;29:CG_DoorAnimation
;30:===============
;31:*/
;32:static void CG_DoorAnimation( centity_t *cent, int *old, int *now, float *backLerp )
;33:{
line 34
;34:  CG_RunLerpFrame( &cent->lerpFrame );
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ARGP4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 36
;35:
;36:  *old      = cent->lerpFrame.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 37
;37:  *now      = cent->lerpFrame.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ASGNI4
line 38
;38:  *backLerp = cent->lerpFrame.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRF4
ASGNF4
line 39
;39:}
LABELV $99
endproc CG_DoorAnimation 0 4
export CG_ModelDoor
proc CG_ModelDoor 184 16
line 48
;40:
;41:
;42:/*
;43:===============
;44:CG_ModelDoor
;45:===============
;46:*/
;47:void CG_ModelDoor( centity_t *cent )
;48:{
line 52
;49:  refEntity_t     ent;
;50:  entityState_t   *es;
;51:  animation_t     anim;
;52:  lerpFrame_t     *lf = &cent->lerpFrame;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ASGNP4
line 54
;53:
;54:  es = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 56
;55:
;56:  if( !es->modelindex )
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $101
line 57
;57:    return;
ADDRGP4 $100
JUMPV
LABELV $101
line 60
;58:
;59:  //create the render entity
;60:  memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 61
;61:  VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 62
;62:  VectorCopy( cent->lerpOrigin, ent.oldorigin );
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 63
;63:  AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 65
;64:
;65:  ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 68
;66:
;67:  //add the door model
;68:  ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 69
;69:  ent.hModel = cgs.gameModels[ es->modelindex ];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34748
ADDP4
INDIRI4
ASGNI4
line 72
;70:
;71:  //scale the door
;72:  VectorScale( ent.axis[ 0 ], es->origin2[ 0 ], ent.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
line 73
;73:  VectorScale( ent.axis[ 1 ], es->origin2[ 1 ], ent.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ASGNF4
line 74
;74:  VectorScale( ent.axis[ 2 ], es->origin2[ 2 ], ent.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
line 75
;75:  ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 78
;76:
;77:  //setup animation
;78:  anim.firstFrame   = es->powerups;
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 79
;79:  anim.numFrames    = es->weapon;
ADDRLP4 144+4
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 80
;80:  anim.reversed     = !es->legsAnim;
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $156
ADDRLP4 176
CNSTI4 1
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
ADDRLP4 176
CNSTI4 0
ASGNI4
LABELV $157
ADDRLP4 144+20
ADDRLP4 176
INDIRI4
ASGNI4
line 81
;81:  anim.flipflop     = qfalse;
ADDRLP4 144+24
CNSTI4 0
ASGNI4
line 82
;82:  anim.loopFrames   = 0;
ADDRLP4 144+8
CNSTI4 0
ASGNI4
line 83
;83:  anim.frameLerp    = 1000 / es->torsoAnim;
ADDRLP4 144+12
CNSTI4 1000
ADDRLP4 140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
DIVI4
ASGNI4
line 84
;84:  anim.initialLerp  = 1000 / es->torsoAnim;
ADDRLP4 144+16
CNSTI4 1000
ADDRLP4 140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
DIVI4
ASGNI4
line 87
;85:
;86:  //door changed state
;87:  if( es->legsAnim != cent->doorState )
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
EQI4 $162
line 88
;88:  {
line 89
;89:    lf->animationTime = lf->frameTime + anim.initialLerp;
ADDRLP4 172
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 172
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 144+16
INDIRI4
ADDI4
ASGNI4
line 90
;90:    cent->doorState = es->legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1664
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 91
;91:  }
LABELV $162
line 93
;92:
;93:  lf->animation = &anim;
ADDRLP4 172
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 144
ASGNP4
line 96
;94:
;95:  //run animation
;96:  CG_DoorAnimation( cent, &ent.oldframe, &ent.frame, &ent.backlerp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_DoorAnimation
CALLV
pop
line 98
;97:
;98:  trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 99
;99:}
LABELV $100
endproc CG_ModelDoor 184 16
proc CG_AMOAnimation 12 4
line 108
;100:
;101:
;102:/*
;103:===============
;104:CG_AMOAnimation
;105:===============
;106:*/
;107:static void CG_AMOAnimation( centity_t *cent, int *old, int *now, float *backLerp )
;108:{
line 109
;109:  if( !( cent->currentState.eFlags & EF_MOVER_STOP ) )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $169
line 110
;110:  {
line 111
;111:    int delta = cg.time - cent->miscTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
SUBI4
ASGNI4
line 114
;112:
;113:    //hack to prevent "pausing" mucking up the lerping
;114:    if( delta > 900 )
ADDRLP4 0
INDIRI4
CNSTI4 900
LEI4 $172
line 115
;115:    {
line 116
;116:      cent->lerpFrame.oldFrameTime  += delta;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1584
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 117
;117:      cent->lerpFrame.frameTime     += delta;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1592
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 118
;118:    }
LABELV $172
line 120
;119:
;120:    CG_RunLerpFrame( &cent->lerpFrame );
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ARGP4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 121
;121:    cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 122
;122:  }
LABELV $169
line 124
;123:
;124:  *old      = cent->lerpFrame.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 125
;125:  *now      = cent->lerpFrame.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ASGNI4
line 126
;126:  *backLerp = cent->lerpFrame.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRF4
ASGNF4
line 127
;127:}
LABELV $168
endproc CG_AMOAnimation 12 4
export CG_AnimMapObj
proc CG_AnimMapObj 184 16
line 136
;128:
;129:
;130:/*
;131:==================
;132:CG_animMapObj
;133:==================
;134:*/
;135:void CG_AnimMapObj( centity_t *cent )
;136:{
line 142
;137:  refEntity_t     ent;
;138:  entityState_t   *es;
;139:  float           scale;
;140:  animation_t     anim;
;141:
;142:  es = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 145
;143:
;144:  // if set to invisible, skip
;145:  if( !es->modelindex || ( es->eFlags & EF_NODRAW ) )
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
EQI4 $178
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 180
INDIRI4
EQI4 $176
LABELV $178
line 146
;146:    return;
ADDRGP4 $175
JUMPV
LABELV $176
line 148
;147:
;148:  memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 150
;149:
;150:  VectorCopy( es->angles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 151
;151:  AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 153
;152:
;153:  ent.hModel = cgs.gameModels[ es->modelindex ];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34748
ADDP4
INDIRI4
ASGNI4
line 155
;154:
;155:  VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 156
;156:  VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 158
;157:
;158:  ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 161
;159:
;160:  //scale the model
;161:  if( es->angles2[ 0 ] )
ADDRLP4 140
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
CNSTF4 0
EQF4 $185
line 162
;162:  {
line 163
;163:    scale = es->angles2[ 0 ];
ADDRLP4 172
ADDRLP4 140
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ASGNF4
line 164
;164:    VectorScale( ent.axis[ 0 ], scale, ent.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
line 165
;165:    VectorScale( ent.axis[ 1 ], scale, ent.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
line 166
;166:    VectorScale( ent.axis[ 2 ], scale, ent.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ASGNF4
line 167
;167:    ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 168
;168:  }
LABELV $185
line 171
;169:
;170:  //setup animation
;171:  anim.firstFrame = es->powerups;
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 172
;172:  anim.numFrames = es->weapon;
ADDRLP4 144+4
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 173
;173:  anim.reversed = qfalse;
ADDRLP4 144+20
CNSTI4 0
ASGNI4
line 174
;174:  anim.flipflop = qfalse;
ADDRLP4 144+24
CNSTI4 0
ASGNI4
line 177
;175:
;176:  // if numFrames is negative the animation is reversed
;177:  if( anim.numFrames < 0 )
ADDRLP4 144+4
INDIRI4
CNSTI4 0
GEI4 $233
line 178
;178:  {
line 179
;179:    anim.numFrames = -anim.numFrames;
ADDRLP4 144+4
ADDRLP4 144+4
INDIRI4
NEGI4
ASGNI4
line 180
;180:    anim.reversed = qtrue;
ADDRLP4 144+20
CNSTI4 1
ASGNI4
line 181
;181:  }
LABELV $233
line 183
;182:
;183:  anim.loopFrames = es->torsoAnim;
ADDRLP4 144+8
ADDRLP4 140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 185
;184:
;185:  if( !es->legsAnim )
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $240
line 186
;186:  {
line 187
;187:    anim.frameLerp = 1000;
ADDRLP4 144+12
CNSTI4 1000
ASGNI4
line 188
;188:    anim.initialLerp = 1000;
ADDRLP4 144+16
CNSTI4 1000
ASGNI4
line 189
;189:  }
ADDRGP4 $241
JUMPV
LABELV $240
line 191
;190:  else
;191:  {
line 192
;192:    anim.frameLerp = 1000 / es->legsAnim;
ADDRLP4 144+12
CNSTI4 1000
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
DIVI4
ASGNI4
line 193
;193:    anim.initialLerp = 1000 / es->legsAnim;
ADDRLP4 144+16
CNSTI4 1000
ADDRLP4 140
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
DIVI4
ASGNI4
line 194
;194:  }
LABELV $241
line 196
;195:
;196:  cent->lerpFrame.animation = &anim;
ADDRFP4 0
INDIRP4
CNSTI4 1620
ADDP4
ADDRLP4 144
ASGNP4
line 199
;197:
;198:  //run animation
;199:  CG_AMOAnimation( cent, &ent.oldframe, &ent.frame, &ent.backlerp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_AMOAnimation
CALLV
pop
line 202
;200:
;201:  // add to refresh list
;202:  trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 203
;203:}
LABELV $175
endproc CG_AnimMapObj 184 16
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
import CG_PredictPlayerState
import CG_BiSphereTrace
import CG_CapTrace
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
