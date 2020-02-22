data
export cg_buildableSoundNames
align 4
LABELV cg_buildableSoundNames
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
address $109
address $110
address $111
address $112
skip 4
export CG_AlienBuildableExplosion
code
proc CG_AlienBuildableExplosion 12 16
file "..\..\..\..\src/cgame/cg_buildable.c"
line 56
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
;24:
;25:#include "cg_local.h"
;26:
;27:char *cg_buildableSoundNames[ MAX_BUILDABLE_ANIMATIONS ] =
;28:{
;29:  "construct1.wav",
;30:  "construct2.wav",
;31:  "idle1.wav",
;32:  "idle2.wav",
;33:  "idle3.wav",
;34:  "attack1.wav",
;35:  "attack2.wav",
;36:  "spawn1.wav",
;37:  "spawn2.wav",
;38:  "pain1.wav",
;39:  "pain2.wav",
;40:  "destroy1.wav",
;41:  "destroy2.wav",
;42:  "destroyed.wav"
;43:};
;44:
;45:static sfxHandle_t defaultAlienSounds[ MAX_BUILDABLE_ANIMATIONS ];
;46:static sfxHandle_t defaultHumanSounds[ MAX_BUILDABLE_ANIMATIONS ];
;47:
;48:/*
;49:===================
;50:CG_AlienBuildableExplosion
;51:
;52:Generated a bunch of gibs launching out from a location
;53:===================
;54:*/
;55:void CG_AlienBuildableExplosion( vec3_t origin, vec3_t dir )
;56:{
line 59
;57:  particleSystem_t  *ps;
;58:
;59:  trap_S_StartSound( origin, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.alienBuildableExplosion );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+460
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 62
;60:
;61:  //particle system
;62:  ps = CG_SpawnNewParticleSystem( cgs.media.alienBuildableDestroyedPS );
ADDRGP4 cgs+268684+584
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 64
;63:
;64:  if( CG_IsParticleSystemValid( &ps ) )
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $118
line 65
;65:  {
line 66
;66:    CG_SetAttachmentPoint( &ps->attachment, origin );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentPoint
CALLV
pop
line 67
;67:    CG_SetParticleSystemNormal( ps, dir );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SetParticleSystemNormal
CALLV
pop
line 68
;68:    CG_AttachToPoint( &ps->attachment );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToPoint
CALLV
pop
line 69
;69:  }
LABELV $118
line 70
;70:}
LABELV $113
endproc CG_AlienBuildableExplosion 12 16
export CG_HumanBuildableExplosion
proc CG_HumanBuildableExplosion 12 16
line 80
;71:
;72:/*
;73:=================
;74:CG_HumanBuildableExplosion
;75:
;76:Called for human buildables as they are destroyed
;77:=================
;78:*/
;79:void CG_HumanBuildableExplosion( vec3_t origin, vec3_t dir )
;80:{
line 83
;81:  particleSystem_t  *ps;
;82:
;83:  trap_S_StartSound( origin, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.humanBuildableExplosion );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+472
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 86
;84:
;85:  //particle system
;86:  ps = CG_SpawnNewParticleSystem( cgs.media.humanBuildableDestroyedPS );
ADDRGP4 cgs+268684+576
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 88
;87:
;88:  if( CG_IsParticleSystemValid( &ps ) )
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $125
line 89
;89:  {
line 90
;90:    CG_SetAttachmentPoint( &ps->attachment, origin );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentPoint
CALLV
pop
line 91
;91:    CG_SetParticleSystemNormal( ps, dir );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SetParticleSystemNormal
CALLV
pop
line 92
;92:    CG_AttachToPoint( &ps->attachment );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToPoint
CALLV
pop
line 93
;93:  }
LABELV $125
line 94
;94:}
LABELV $120
endproc CG_HumanBuildableExplosion 12 16
proc CG_Creep 124 28
line 105
;95:
;96:
;97:#define CREEP_SIZE            64.0f
;98:
;99:/*
;100:==================
;101:CG_Creep
;102:==================
;103:*/
;104:static void CG_Creep( centity_t *cent )
;105:{
line 110
;106:  int           msec;
;107:  float         size, frac;
;108:  trace_t       tr;
;109:  vec3_t        temp, origin;
;110:  int           scaleUpTime = BG_FindBuildTimeForBuildable( cent->currentState.modelindex );
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindBuildTimeForBuildable
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRI4
ASGNI4
line 113
;111:  int           time;
;112:
;113:  time = cent->currentState.time;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 116
;114:
;115:  //should the creep be growing or receding?
;116:  if( time >= 0 )
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $128
line 117
;117:  {
line 118
;118:    msec = cg.time - time;
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 119
;119:    if( msec >= 0 && msec < scaleUpTime )
ADDRLP4 108
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
LTI4 $131
ADDRLP4 108
INDIRI4
ADDRLP4 84
INDIRI4
GEI4 $131
line 120
;120:      frac = (float)msec / scaleUpTime;
ADDRLP4 80
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 84
INDIRI4
CVIF4 4
DIVF4
ASGNF4
ADDRGP4 $129
JUMPV
LABELV $131
line 122
;121:    else
;122:      frac = 1.0f;
ADDRLP4 80
CNSTF4 1065353216
ASGNF4
line 123
;123:  }
ADDRGP4 $129
JUMPV
LABELV $128
line 124
;124:  else if( time < 0 )
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $133
line 125
;125:  {
line 126
;126:    msec = cg.time + time;
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 127
;127:    if( msec >= 0 && msec < CREEP_SCALEDOWN_TIME )
ADDRLP4 108
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
LTI4 $136
ADDRLP4 108
INDIRI4
CNSTI4 3000
GEI4 $136
line 128
;128:      frac = 1.0f - ( (float)msec / CREEP_SCALEDOWN_TIME );
ADDRLP4 80
CNSTF4 1065353216
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1161527296
DIVF4
SUBF4
ASGNF4
ADDRGP4 $137
JUMPV
LABELV $136
line 130
;129:    else
;130:      frac = 0.0f;
ADDRLP4 80
CNSTF4 0
ASGNF4
LABELV $137
line 131
;131:  }
LABELV $133
LABELV $129
line 133
;132:
;133:  VectorCopy( cent->currentState.origin2, temp );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 134
;134:  VectorScale( temp, -4096, temp );
ADDRLP4 108
CNSTF4 3313500160
ASGNF4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 3313500160
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 135
;135:  VectorAdd( temp, cent->lerpOrigin, temp );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 1556
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 1560
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRF4
ADDF4
ASGNF4
line 137
;136:
;137:  CG_Trace( &tr, cent->lerpOrigin, NULL, NULL, temp, cent->currentState.number, MASK_SOLID );
ADDRLP4 20
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 116
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 139
;138:
;139:  VectorCopy( tr.endpos, origin );
ADDRLP4 92
ADDRLP4 20+12
INDIRB
ASGNB 12
line 141
;140:
;141:  size = CREEP_SIZE * frac;
ADDRLP4 88
CNSTF4 1115684864
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
line 146
;142:
;143:  /*if( size > 0.0f )
;144:    CG_ImpactMark( cgs.media.creepShader, origin, cent->currentState.origin2,
;145:                   0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, size, qtrue );*/
;146:  if(cent->currentState.eType != ET_PLAYER)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $147
line 147
;147:  {
line 148
;148:    if( cent->currentState.modelindex2 == BIT_HUMANS )
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $149
line 149
;149:        {
line 152
;150://          if( size > 0.0f && tr.fraction < 1.0f )
;151://                  CG_ImpactMark( cgs.media.humancreepShader, origin, cent->currentState.origin2, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, size, qtrue );
;152:        }
LABELV $149
line 153
;153:        if( cent->currentState.modelindex2 == BIT_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $151
line 154
;154:        {
line 157
;155:                //if( size > 0.0f && tr.fraction < 1.0f )
;156:                  //CG_ImpactMark( cgs.media.aliencreepShader, origin, cent->currentState.origin2, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, size, qtrue );
;157:        }
LABELV $151
line 158
;158:  }
LABELV $147
line 159
;159:}
LABELV $127
endproc CG_Creep 124 28
proc CG_ParseBuildableAnimationFile 20064 12
line 170
;160:
;161:/*
;162:======================
;163:CG_ParseBuildableAnimationFile
;164:
;165:Read a configuration file containing animation counts and rates
;166:models/buildables/hivemind/animation.cfg, etc
;167:======================
;168:*/
;169:static qboolean CG_ParseBuildableAnimationFile( const char *filename, buildable_t buildable )
;170:{
line 180
;171:  char          *text_p;
;172:  int           len;
;173:  int           i;
;174:  char          *token;
;175:  float         fps;
;176:  char          text[ 20000 ];
;177:  fileHandle_t  f;
;178:  animation_t   *animations;
;179:
;180:  animations = cg_buildables[ buildable ].animations;
ADDRLP4 8
CNSTI4 616
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_buildables+16
ADDP4
ASGNP4
line 183
;181:
;182:  // load the file
;183:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20024
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20028
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 20028
INDIRI4
ASGNI4
line 184
;184:  if( len <= 0 )
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $155
line 185
;185:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $153
JUMPV
LABELV $155
line 187
;186:
;187:  if( len >= sizeof( text ) - 1 )
ADDRLP4 20
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $157
line 188
;188:  {
line 189
;189:    CG_Printf( "File %s too long\n", filename );
ADDRGP4 $159
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 190
;190:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $153
JUMPV
LABELV $157
line 193
;191:  }
;192:
;193:  trap_FS_Read( text, len, f );
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20024
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 194
;194:  text[ len ] = 0;
ADDRLP4 20
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 195
;195:  trap_FS_FCloseFile( f );
ADDRLP4 20024
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 198
;196:
;197:  // parse the text
;198:  text_p = text;
ADDRLP4 16
ADDRLP4 24
ASGNP4
line 201
;199:
;200:  // read information for each frame
;201:  for( i = BANIM_NONE + 1; i < MAX_BUILDABLE_ANIMATIONS; i++ )
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $160
line 202
;202:  {
line 204
;203:
;204:    token = COM_Parse( &text_p );
ADDRLP4 16
ARGP4
ADDRLP4 20032
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20032
INDIRP4
ASGNP4
line 205
;205:    if( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $164
line 206
;206:      break;
ADDRGP4 $162
JUMPV
LABELV $164
line 208
;207:
;208:    animations[ i ].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20036
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20036
INDIRI4
ASGNI4
line 210
;209:
;210:    token = COM_Parse( &text_p );
ADDRLP4 16
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 211
;211:    if( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $166
line 212
;212:      break;
ADDRGP4 $162
JUMPV
LABELV $166
line 214
;213:
;214:    animations[ i ].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20044
INDIRI4
ASGNI4
line 215
;215:    animations[ i ].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 216
;216:    animations[ i ].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 219
;217:
;218:    // if numFrames is negative the animation is reversed
;219:    if( animations[ i ].numFrames < 0 )
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $168
line 220
;220:    {
line 221
;221:      animations[ i ].numFrames = -animations[ i ].numFrames;
ADDRLP4 20048
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20048
INDIRP4
ADDRLP4 20048
INDIRP4
INDIRI4
NEGI4
ASGNI4
line 222
;222:      animations[ i ].reversed = qtrue;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 223
;223:    }
LABELV $168
line 225
;224:
;225:    token = COM_Parse( &text_p );
ADDRLP4 16
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 226
;226:    if ( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $170
line 227
;227:      break;
ADDRGP4 $162
JUMPV
LABELV $170
line 229
;228:
;229:    animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20052
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20052
INDIRI4
ASGNI4
line 231
;230:
;231:    token = COM_Parse( &text_p );
ADDRLP4 16
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 232
;232:    if( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $172
line 233
;233:      break;
ADDRGP4 $162
JUMPV
LABELV $172
line 235
;234:
;235:    fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20060
INDIRF4
ASGNF4
line 236
;236:    if( fps == 0 )
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $174
line 237
;237:      fps = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
LABELV $174
line 239
;238:
;239:    animations[ i ].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 240
;240:    animations[ i ].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 241
;241:  }
LABELV $161
line 201
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 15
LTI4 $160
LABELV $162
line 243
;242:
;243:  if( i != MAX_BUILDABLE_ANIMATIONS )
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $176
line 244
;244:  {
line 245
;245:    CG_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $178
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 246
;246:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $153
JUMPV
LABELV $176
line 249
;247:  }
;248:
;249:  return qtrue;
CNSTI4 1
RETI4
LABELV $153
endproc CG_ParseBuildableAnimationFile 20064 12
proc CG_ParseBuildableSoundFile 20044 12
line 261
;250:}
;251:
;252:/*
;253:======================
;254:CG_ParseBuildableSoundFile
;255:
;256:Read a configuration file containing sound properties
;257:sound/buildables/hivemind/sound.cfg, etc
;258:======================
;259:*/
;260:static qboolean CG_ParseBuildableSoundFile( const char *filename, buildable_t buildable )
;261:{
line 270
;262:  char          *text_p;
;263:  int           len;
;264:  int           i;
;265:  char          *token;
;266:  char          text[ 20000 ];
;267:  fileHandle_t  f;
;268:  sound_t       *sounds;
;269:
;270:  sounds = cg_buildables[ buildable ].sounds;
ADDRLP4 12
CNSTI4 616
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ASGNP4
line 273
;271:
;272:  // load the file
;273:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20020
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20024
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20024
INDIRI4
ASGNI4
line 274
;274:  if ( len <= 0 )
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $181
line 275
;275:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $181
line 277
;276:
;277:  if ( len >= sizeof( text ) - 1 )
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $183
line 278
;278:  {
line 279
;279:    CG_Printf( "File %s too long\n", filename );
ADDRGP4 $159
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 280
;280:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $183
line 283
;281:  }
;282:
;283:  trap_FS_Read( text, len, f );
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20020
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 284
;284:  text[len] = 0;
ADDRLP4 16
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 285
;285:  trap_FS_FCloseFile( f );
ADDRLP4 20020
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 288
;286:
;287:  // parse the text
;288:  text_p = text;
ADDRLP4 8
ADDRLP4 20
ASGNP4
line 291
;289:
;290:  // read information for each frame
;291:  for( i = BANIM_NONE + 1; i < MAX_BUILDABLE_ANIMATIONS; i++ )
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $185
line 292
;292:  {
line 294
;293:
;294:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20028
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20028
INDIRP4
ASGNP4
line 295
;295:    if ( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $189
line 296
;296:      break;
ADDRGP4 $187
JUMPV
LABELV $189
line 298
;297:
;298:    sounds[ i ].enabled = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20032
INDIRI4
ASGNI4
line 300
;299:
;300:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 301
;301:    if ( !*token )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $191
line 302
;302:      break;
ADDRGP4 $187
JUMPV
LABELV $191
line 304
;303:
;304:    sounds[ i ].looped = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20040
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20040
INDIRI4
ASGNI4
line 306
;305:
;306:  }
LABELV $186
line 291
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 15
LTI4 $185
LABELV $187
line 308
;307:
;308:  if( i != MAX_BUILDABLE_ANIMATIONS )
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $193
line 309
;309:  {
line 310
;310:    CG_Printf( "Error parsing sound file: %s\n", filename );
ADDRGP4 $195
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 311
;311:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $193
line 314
;312:  }
;313:
;314:  return qtrue;
CNSTI4 1
RETI4
LABELV $179
endproc CG_ParseBuildableSoundFile 20044 12
export CG_InitBuildables
proc CG_InitBuildables 176 20
line 324
;315:}
;316:/*
;317:===============
;318:CG_InitBuildables
;319:
;320:Initialises the animation db
;321:===============
;322:*/
;323:void CG_InitBuildables( void )
;324:{
line 333
;325:  char          filename[ MAX_QPATH ];
;326:  char          soundfile[ MAX_QPATH ];
;327:  char          *buildableName;
;328:  char          *modelFile;
;329:  int           i;
;330:  int           j;
;331:  fileHandle_t  f;
;332:
;333:  memset( cg_buildables, 0, sizeof( cg_buildables ) );
ADDRGP4 cg_buildables
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16632
ARGI4
ADDRGP4 memset
CALLP4
pop
line 336
;334:
;335:  //default sounds
;336:  for( j = BANIM_NONE + 1; j < MAX_BUILDABLE_ANIMATIONS; j++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $197
line 337
;337:  {
line 338
;338:    strcpy( soundfile, cg_buildableSoundNames[ j - 1 ] );
ADDRLP4 72
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_buildableSoundNames-4
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 340
;339:
;340:    Com_sprintf( filename, sizeof( filename ), "sound/buildables/alien/%s", soundfile );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $202
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 341
;341:    defaultAlienSounds[ j ] = trap_S_RegisterSound( filename, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 defaultAlienSounds
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 343
;342:
;343:    Com_sprintf( filename, sizeof( filename ), "sound/buildables/human/%s", soundfile );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 344
;344:    defaultHumanSounds[ j ] = trap_S_RegisterSound( filename, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 defaultHumanSounds
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 345
;345:  }
LABELV $198
line 336
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $197
line 347
;346:
;347:  cg.buildablesFraction = 0.0f;
ADDRGP4 cg+117056
CNSTF4 0
ASGNF4
line 349
;348:
;349:  for( i = BA_NONE + 1; i < BA_NUM_BUILDABLES; i++ )
ADDRLP4 68
CNSTI4 1
ASGNI4
LABELV $205
line 350
;350:  {
line 351
;351:    buildableName = BG_FindNameForBuildable( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 148
INDIRP4
ASGNP4
line 357
;352:
;353://    if(i >= BA_I_SYRINX)
;354://      continue;
;355:
;356:    //animation.cfg
;357:    Com_sprintf( filename, sizeof( filename ), "models/buildables/%s/animation.cfg", buildableName );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $209
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 358
;358:    if ( !CG_ParseBuildableAnimationFile( filename, i ) )
ADDRLP4 4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 CG_ParseBuildableAnimationFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $210
line 359
;359:      Com_Printf( S_COLOR_YELLOW "WARNING: failed to load animation file %s\n", filename );
ADDRGP4 $212
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $210
line 362
;360:
;361:    //sound.cfg
;362:    Com_sprintf( filename, sizeof( filename ), "sound/buildables/%s/sound.cfg", buildableName );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $213
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 363
;363:    if ( !CG_ParseBuildableSoundFile( filename, i ) )
ADDRLP4 4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 CG_ParseBuildableSoundFile
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $214
line 364
;364:      Com_Printf( S_COLOR_YELLOW "WARNING: failed to load sound file %s\n", filename );
ADDRGP4 $216
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $214
line 367
;365:
;366:    //models
;367:    for( j = 0; j <= 3; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $217
line 368
;368:    {
line 369
;369:      if( ( modelFile = BG_FindModelsForBuildable( i, j ) ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BG_FindModelsForBuildable
CALLP4
ASGNP4
ADDRLP4 136
ADDRLP4 160
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $221
line 370
;370:        cg_buildables[ i ].models[ j ] = trap_R_RegisterModel( modelFile );
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 616
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 cg_buildables
ADDP4
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
LABELV $221
line 371
;371:    }
LABELV $218
line 367
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LEI4 $217
line 374
;372:
;373:    //sounds
;374:    for( j = BANIM_NONE + 1; j < MAX_BUILDABLE_ANIMATIONS; j++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $223
line 375
;375:    {
line 376
;376:      strcpy( soundfile, cg_buildableSoundNames[ j - 1 ] );
ADDRLP4 72
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_buildableSoundNames-4
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 377
;377:      Com_sprintf( filename, sizeof( filename ), "sound/buildables/%s/%s", buildableName, soundfile );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 379
;378:
;379:      if( cg_buildables[ i ].sounds[ j ].enabled )
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 380
;380:      {
line 381
;381:        if( trap_FS_FOpenFile( filename, &f, FS_READ ) > 0 )
ADDRLP4 4
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 160
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
LEI4 $232
line 382
;382:        {
line 384
;383:          //file exists so close it
;384:          trap_FS_FCloseFile( f );
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 386
;385:
;386:          cg_buildables[ i ].sounds[ j ].sound = trap_S_RegisterSound( filename, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 164
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 387
;387:        }
ADDRGP4 $233
JUMPV
LABELV $232
line 389
;388:        else
;389:        {
line 391
;390:          //file doesn't exist - use default
;391:          if( BG_FindTeamForBuildable( i ) == BIT_ALIENS )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 1
NEI4 $235
line 392
;392:            cg_buildables[ i ].sounds[ j ].sound = defaultAlienSounds[ j ];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 defaultAlienSounds
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $235
line 394
;393:          else
;394:            cg_buildables[ i ].sounds[ j ].sound = defaultHumanSounds[ j ];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 defaultHumanSounds
ADDP4
INDIRI4
ASGNI4
LABELV $236
line 395
;395:        }
LABELV $233
line 396
;396:      }
LABELV $229
line 397
;397:    }
LABELV $224
line 374
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $223
line 399
;398:
;399:    cg.buildablesFraction = (float)i / (float)( BA_NUM_BUILDABLES - 1 );
ADDRGP4 cg+117056
ADDRLP4 68
INDIRI4
CVIF4 4
CNSTF4 1104150528
DIVF4
ASGNF4
line 400
;400:    trap_UpdateScreen( );
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 401
;401:  }
LABELV $206
line 349
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 27
LTI4 $205
line 403
;402:
;403:  cgs.media.teslaZapTS = CG_RegisterTrailSystem( "models/buildables/tesla/zap" );
ADDRGP4 $242
ARGP4
ADDRLP4 148
ADDRGP4 CG_RegisterTrailSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+596
ADDRLP4 148
INDIRI4
ASGNI4
line 404
;404:}
LABELV $196
endproc CG_InitBuildables 176 20
proc CG_SetBuildableLerpFrameAnimation 12 8
line 414
;405:
;406:/*
;407:===============
;408:CG_SetBuildableLerpFrameAnimation
;409:
;410:may include ANIM_TOGGLEBIT
;411:===============
;412:*/
;413:static void CG_SetBuildableLerpFrameAnimation( buildable_t buildable, lerpFrame_t *lf, int newAnimation )
;414:{
line 417
;415:  animation_t *anim;
;416:
;417:  lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 419
;418:
;419:  if( newAnimation < 0 || newAnimation >= MAX_BUILDABLE_ANIMATIONS )
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $246
ADDRLP4 4
INDIRI4
CNSTI4 15
LTI4 $244
LABELV $246
line 420
;420:    CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $247
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
LABELV $244
line 422
;421:
;422:  anim = &cg_buildables[ buildable ].animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
CNSTI4 616
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_buildables+16
ADDP4
ADDP4
ASGNP4
line 425
;423:
;424:  //this item has just spawned so lf->frameTime will be zero
;425:  if( !lf->animation )
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $249
line 426
;426:    lf->frameTime = cg.time + 1000; //1 sec delay before starting the spawn anim
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $249
line 428
;427:
;428:  lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 429
;429:  lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 431
;430:
;431:  if( cg_debugAnim.integer )
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $252
line 432
;432:    CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $255
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $252
line 433
;433:}
LABELV $243
endproc CG_SetBuildableLerpFrameAnimation 12 8
proc CG_RunBuildableLerpFrame 88 16
line 444
;434:
;435:/*
;436:===============
;437:CG_RunBuildableLerpFrame
;438:
;439:Sets cg.snap, cg.oldFrame, and cg.backlerp
;440:cg.time should be between oldFrameTime and frameTime after exit
;441:===============
;442:*/
;443:static void CG_RunBuildableLerpFrame( centity_t *cent )
;444:{
line 446
;445:  int                   f, numFrames;
;446:  buildable_t           buildable = cent->currentState.modelindex;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 447
;447:  lerpFrame_t           *lf = &cent->lerpFrame;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ASGNP4
line 449
;448:  animation_t           *anim;
;449:  buildableAnimNumber_t newAnimation = cent->buildableAnim & ~( ANIM_TOGGLEBIT|ANIM_FORCEBIT );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1628
ADDP4
INDIRI4
CNSTI4 -193
BANDI4
ASGNI4
line 452
;450:
;451:  // debugging tool to get no animations
;452:  if( cg_animSpeed.integer == 0 )
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $257
line 453
;453:  {
line 454
;454:    lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ASGNI4
line 455
;455:    return;
ADDRGP4 $256
JUMPV
LABELV $257
line 459
;456:  }
;457:
;458:  // see if the animation sequence is switching
;459:  if( newAnimation != lf->animationNumber || !lf->animation )
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $262
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $260
LABELV $262
line 460
;460:  {
line 461
;461:    if( cg_debugRandom.integer )
ADDRGP4 cg_debugRandom+12
INDIRI4
CNSTI4 0
EQI4 $263
line 462
;462:      CG_Printf( "newAnimation: %d lf->animationNumber: %d lf->animation: %d\n",
ADDRGP4 $266
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $263
line 465
;463:                 newAnimation, lf->animationNumber, lf->animation );
;464:
;465:    CG_SetBuildableLerpFrameAnimation( buildable, lf, newAnimation );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 CG_SetBuildableLerpFrameAnimation
CALLV
pop
line 467
;466:
;467:    if( !cg_buildables[ buildable ].sounds[ newAnimation ].looped &&
ADDRLP4 32
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 616
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $267
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $267
line 469
;468:        cg_buildables[ buildable ].sounds[ newAnimation ].enabled )
;469:    {
line 470
;470:      if( cg_debugRandom.integer )
ADDRGP4 cg_debugRandom+12
INDIRI4
CNSTI4 0
EQI4 $271
line 471
;471:        CG_Printf( "Sound for animation %d for a %s\n",
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $274
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $271
line 474
;472:            newAnimation, BG_FindHumanNameForBuildable( buildable ) );
;473:
;474:      trap_S_StartSound( cent->lerpOrigin, cent->currentState.number, CHAN_AUTO,
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 476
;475:        cg_buildables[ buildable ].sounds[ newAnimation ].sound );
;476:    }
LABELV $267
line 477
;477:  }
LABELV $260
line 479
;478:
;479:  if( cg_buildables[ buildable ].sounds[ lf->animationNumber ].looped &&
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
CNSTI4 616
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $276
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $276
line 481
;480:      cg_buildables[ buildable ].sounds[ lf->animationNumber ].enabled )
;481:    trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin,
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
MULI4
CNSTI4 616
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_buildables+436
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
LABELV $276
line 486
;482:      cg_buildables[ buildable ].sounds[ lf->animationNumber ].sound );
;483:
;484:  // if we have passed the current frame, move it to
;485:  // oldFrame and calculate a new frame
;486:  if( cg.time >= lf->frameTime )
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $281
line 487
;487:  {
line 488
;488:    lf->oldFrame = lf->frame;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 489
;489:    lf->oldFrameTime = lf->frameTime;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 492
;490:
;491:    // get the next frame based on the animation
;492:    anim = lf->animation;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 493
;493:    if( !anim->frameLerp )
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $284
line 494
;494:      return;   // shouldn't happen
ADDRGP4 $256
JUMPV
LABELV $284
line 496
;495:
;496:    if ( cg.time < lf->animationTime )
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $286
line 497
;497:      lf->frameTime = lf->animationTime;    // initial lerp
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $286
line 499
;498:    else
;499:      lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 60
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $287
line 501
;500:
;501:    f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 68
CNSTI4 12
ASGNI4
ADDRLP4 16
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 502
;502:    numFrames = anim->numFrames;
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 503
;503:    if(anim->flipflop)
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $289
line 504
;504:      numFrames *= 2;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $289
line 506
;505:
;506:    if( f >= numFrames )
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $291
line 507
;507:    {
line 508
;508:      f -= numFrames;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 509
;509:      if( anim->loopFrames )
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $293
line 510
;510:      {
line 511
;511:        f %= anim->loopFrames;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 512
;512:        f += anim->numFrames - anim->loopFrames;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 513
;513:      }
ADDRGP4 $294
JUMPV
LABELV $293
line 515
;514:      else
;515:      {
line 516
;516:        f = numFrames - 1;
ADDRLP4 16
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 519
;517:        // the animation is stuck at the end, so it
;518:        // can immediately transition to another sequence
;519:        lf->frameTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 520
;520:        cent->buildableAnim = cent->currentState.torsoAnim;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1628
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 521
;521:      }
LABELV $294
line 522
;522:    }
LABELV $291
line 524
;523:
;524:    if( anim->reversed )
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 525
;525:      lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $296
line 526
;526:    else if( anim->flipflop && f >= anim->numFrames )
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $298
ADDRLP4 16
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $298
line 527
;527:      lf->frame = anim->firstFrame + anim->numFrames - 1 - ( f % anim->numFrames );
ADDRLP4 84
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 16
INDIRI4
ADDRLP4 84
INDIRI4
MODI4
SUBI4
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $298
line 529
;528:    else
;529:      lf->frame = anim->firstFrame + f;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
LABELV $299
LABELV $297
line 531
;530:
;531:    if( cg.time > lf->frameTime )
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $300
line 532
;532:    {
line 533
;533:      lf->frameTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 534
;534:      if( cg_debugAnim.integer )
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $304
line 535
;535:        CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $307
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $304
line 536
;536:    }
LABELV $300
line 537
;537:  }
LABELV $281
line 539
;538:
;539:  if( lf->frameTime > cg.time + 200 )
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $308
line 540
;540:    lf->frameTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $308
line 542
;541:
;542:  if( lf->oldFrameTime > cg.time )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $312
line 543
;543:    lf->oldFrameTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $312
line 546
;544:
;545:  // calculate current lerp value
;546:  if( lf->frameTime == lf->oldFrameTime )
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $316
line 547
;547:    lf->backlerp = 0;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $317
JUMPV
LABELV $316
line 549
;548:  else
;549:    lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
LABELV $317
line 550
;550:}
LABELV $256
endproc CG_RunBuildableLerpFrame 88 16
proc CG_BuildableAnimation 36 28
line 558
;551:
;552:/*
;553:===============
;554:CG_BuildableAnimation
;555:===============
;556:*/
;557:static void CG_BuildableAnimation( centity_t *cent, int *old, int *now, float *backLerp )
;558:{
line 559
;559:  entityState_t *es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 562
;560:
;561:  //if no animation is set default to idle anim
;562:  if( cent->buildableAnim == BANIM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 1628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $320
line 563
;563:    cent->buildableAnim = es->torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1628
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
LABELV $320
line 566
;564:
;565:  //display the first frame of the construction anim if not yet spawned
;566:  if( !( es->generic1 & B_SPAWNED_TOGGLEBIT ) )
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $322
line 567
;567:  {
line 568
;568:    animation_t *anim = &cg_buildables[ es->modelindex ].animations[ BANIM_CONSTRUCT1 ];
ADDRLP4 4
CNSTI4 616
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables+16+28
ADDP4
ASGNP4
line 571
;569:
;570:    //so that when animation starts for real it has sensible numbers
;571:    cent->lerpFrame.oldFrameTime =
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1624
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1592
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1584
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 576
;572:      cent->lerpFrame.frameTime =
;573:      cent->lerpFrame.animationTime =
;574:      cg.time;
;575:
;576:    *old      = cent->lerpFrame.oldFrame = anim->firstFrame;
ADDRLP4 16
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 577
;577:    *now      = cent->lerpFrame.frame    = anim->firstFrame;
ADDRLP4 20
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1588
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 578
;578:    *backLerp = cent->lerpFrame.backlerp = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 581
;579:
;580:    //ensure that an animation is triggered once the buildable has spawned
;581:    cent->oldBuildableAnim = BANIM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 1632
ADDP4
CNSTI4 0
ASGNI4
line 582
;582:  }
ADDRGP4 $323
JUMPV
LABELV $322
line 584
;583:  else
;584:  {
line 585
;585:    if( ( cent->oldBuildableAnim ^ es->legsAnim ) & ANIM_TOGGLEBIT )
ADDRFP4 0
INDIRP4
CNSTI4 1632
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $327
line 586
;586:    {
line 587
;587:      if( cg_debugAnim.integer )
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $329
line 588
;588:        CG_Printf( "%d->%d l:%d t:%d %s(%d)\n",
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $332
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1632
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 1628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $329
line 593
;589:                   cent->oldBuildableAnim, cent->buildableAnim,
;590:                   es->legsAnim, es->torsoAnim,
;591:                   BG_FindHumanNameForBuildable( es->modelindex ), es->number );
;592:
;593:      if( cent->buildableAnim == es->torsoAnim || es->legsAnim & ANIM_FORCEBIT )
ADDRFP4 0
INDIRP4
CNSTI4 1628
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
EQI4 $335
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $333
LABELV $335
line 594
;594:        cent->buildableAnim = cent->oldBuildableAnim = es->legsAnim;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1632
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1628
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $333
line 596
;595:      else
;596:        cent->buildableAnim = cent->oldBuildableAnim = es->torsoAnim;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 1632
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 1628
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
LABELV $334
line 597
;597:    }
LABELV $327
line 599
;598:
;599:    CG_RunBuildableLerpFrame( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_RunBuildableLerpFrame
CALLV
pop
line 601
;600:
;601:    *old      = cent->lerpFrame.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 602
;602:    *now      = cent->lerpFrame.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ASGNI4
line 603
;603:    *backLerp = cent->lerpFrame.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRF4
ASGNF4
line 604
;604:  }
LABELV $323
line 605
;605:}
LABELV $319
endproc CG_BuildableAnimation 36 28
proc CG_PositionAndOrientateBuildable 172 28
ADDRFP4 12
ADDRFP4 12
INDIRI4
ASGNI4
line 618
;606:
;607:#define TRACE_DEPTH 64.0f
;608:
;609:/*
;610:===============
;611:CG_PositionAndOrientateBuildable
;612:===============
;613:*/
;614:static void CG_PositionAndOrientateBuildable( const vec3_t angles, const vec3_t inOrigin,
;615:                                              const vec3_t normal, const int skipNumber,
;616:                                              const vec3_t mins, const vec3_t maxs,
;617:                                              vec3_t outAxis[ 3 ], vec3_t outOrigin )
;618:{
line 622
;619:  vec3_t  forward, start, end;
;620:  trace_t tr;
;621:
;622:  AngleVectors( angles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
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
ADDRGP4 AngleVectors
CALLV
pop
line 623
;623:  VectorCopy( normal, outAxis[ 2 ] );
ADDRFP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 624
;624:  ProjectPointOnPlane( outAxis[ 0 ], forward, outAxis[ 2 ] );
ADDRLP4 100
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 626
;625:
;626:  if( !VectorNormalize( outAxis[ 0 ] ) )
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 104
INDIRF4
CNSTF4 0
NEF4 $337
line 627
;627:  {
line 628
;628:    AngleVectors( angles, NULL, NULL, forward );
ADDRFP4 0
INDIRP4
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
ADDRLP4 84
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 629
;629:    ProjectPointOnPlane( outAxis[ 0 ], forward, outAxis[ 2 ] );
ADDRLP4 112
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 630
;630:    VectorNormalize( outAxis[ 0 ] );
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 631
;631:  }
LABELV $337
line 633
;632:
;633:  CrossProduct( outAxis[ 0 ], outAxis[ 2 ], outAxis[ 1 ] );
ADDRLP4 108
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 634
;634:  outAxis[ 1 ][ 0 ] = -outAxis[ 1 ][ 0 ];
ADDRLP4 112
ADDRFP4 24
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 635
;635:  outAxis[ 1 ][ 1 ] = -outAxis[ 1 ][ 1 ];
ADDRLP4 116
ADDRFP4 24
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 636
;636:  outAxis[ 1 ][ 2 ] = -outAxis[ 1 ][ 2 ];
ADDRLP4 120
ADDRFP4 24
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 638
;637:
;638:  VectorMA( inOrigin, -TRACE_DEPTH, normal, end );
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
CNSTF4 3263168512
ASGNF4
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 124
INDIRP4
INDIRF4
ADDRLP4 128
INDIRF4
ADDRLP4 132
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 136
CNSTI4 4
ASGNI4
ADDRLP4 72+4
ADDRLP4 124
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRF4
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
CNSTI4 8
ASGNI4
ADDRLP4 72+8
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
CNSTF4 3263168512
ADDRFP4 8
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 639
;639:  VectorMA( inOrigin, 1.0f, normal, start );
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 144
INDIRP4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 156
CNSTI4 4
ASGNI4
ADDRLP4 60+4
ADDRLP4 144
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 160
CNSTI4 8
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRFP4 8
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 640
;640:  CG_CapTrace( &tr, start, mins, maxs, end, skipNumber, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_CapTrace
CALLV
pop
line 642
;641:
;642:  if( tr.fraction == 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $343
line 643
;643:  {
line 645
;644:    //erm we missed completely - try again with a box trace
;645:    CG_Trace( &tr, start, mins, maxs, end, skipNumber, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 646
;646:  }
LABELV $343
line 648
;647:
;648:  VectorMA( inOrigin, tr.fraction * -TRACE_DEPTH, normal, outOrigin );
ADDRFP4 28
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 3263168512
ADDRLP4 0+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164
CNSTI4 4
ASGNI4
ADDRFP4 28
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRF4
CNSTF4 3263168512
ADDRLP4 0+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 168
CNSTI4 8
ASGNI4
ADDRFP4 28
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRF4
CNSTF4 3263168512
ADDRLP4 0+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 649
;649:}
LABELV $336
endproc CG_PositionAndOrientateBuildable 172 28
export CG_GhostBuildable
proc CG_GhostBuildable 276 32
line 657
;650:
;651:/*
;652:==================
;653:CG_GhostBuildable
;654:==================
;655:*/
;656:void CG_GhostBuildable( buildable_t buildable )
;657:{
line 665
;658:  refEntity_t     ent;
;659:  playerState_t   *ps;
;660:  vec3_t          angles, entity_origin;
;661:  vec3_t          mins, maxs;
;662:  trace_t         tr;
;663:  float           scale;
;664:
;665:  ps = &cg.predictedPlayerState;
ADDRLP4 144
ADDRGP4 cg+107636
ASGNP4
line 667
;666:
;667:  memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 669
;668:
;669:  BG_FindBBoxForBuildable( buildable, mins, maxs );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 208
ARGP4
ADDRLP4 220
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 671
;670:
;671:  BG_PositionBuildableRelativeToPlayer( ps, mins, maxs, CG_Trace, entity_origin, angles, &tr );
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 208
ARGP4
ADDRLP4 220
ARGP4
ADDRGP4 CG_Trace
ARGP4
ADDRLP4 232
ARGP4
ADDRLP4 244
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 BG_PositionBuildableRelativeToPlayer
CALLV
pop
line 673
;672:
;673:  CG_PositionAndOrientateBuildable( ps->viewangles, entity_origin, tr.plane.normal, ps->clientNum,
ADDRLP4 144
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 232
ARGP4
ADDRLP4 148+24
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
ARGP4
ADDRLP4 220
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 0+68
ARGP4
ADDRGP4 CG_PositionAndOrientateBuildable
CALLV
pop
line 677
;674:                                    mins, maxs, ent.axis, ent.origin );
;675:
;676:  //offset on the Z axis if required
;677:  VectorMA( ent.origin, BG_FindZOffsetForBuildable( buildable ), tr.plane.normal, ent.origin );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 148+24
INDIRF4
ADDRLP4 260
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 264
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 268
INDIRF4
MULF4
ADDF4
ASGNF4
line 679
;678:
;679:  VectorCopy( ent.origin, ent.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 0+68
INDIRB
ASGNB 12
line 680
;680:  VectorCopy( ent.origin, ent.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 682
;681:
;682:  ent.hModel = cg_buildables[ buildable ].models[ 0 ];
ADDRLP4 0+8
CNSTI4 616
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_buildables
ADDP4
INDIRI4
ASGNI4
line 684
;683:
;684:  if( ps->stats[ STAT_BUILDABLE ] & SB_VALID_TOGGLEBIT )
ADDRLP4 144
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $374
line 685
;685:    ent.customShader = cgs.media.greenBuildShader;
ADDRLP4 0+112
ADDRGP4 cgs+268684+232
INDIRI4
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
line 687
;686:  else
;687:    ent.customShader = cgs.media.redBuildShader;
ADDRLP4 0+112
ADDRGP4 cgs+268684+236
INDIRI4
ASGNI4
LABELV $375
line 690
;688:
;689:  //rescale the model
;690:  scale = BG_FindModelScaleForBuildable( buildable );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_FindModelScaleForBuildable
CALLF4
ASGNF4
ADDRLP4 140
ADDRLP4 272
INDIRF4
ASGNF4
line 692
;691:
;692:  if( scale != 1.0f )
ADDRLP4 140
INDIRF4
CNSTF4 1065353216
EQF4 $382
line 693
;693:  {
line 694
;694:    VectorScale( ent.axis[ 0 ], scale, ent.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 695
;695:    VectorScale( ent.axis[ 1 ], scale, ent.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 696
;696:    VectorScale( ent.axis[ 2 ], scale, ent.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 698
;697:
;698:    ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 699
;699:  }
ADDRGP4 $383
JUMPV
LABELV $382
line 701
;700:  else
;701:    ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
LABELV $383
line 704
;702:
;703:  // add to refresh list
;704:  trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 705
;705:}
LABELV $349
endproc CG_GhostBuildable 276 32
proc CG_BuildableParticleEffects 36 8
line 713
;706:
;707:/*
;708:==================
;709:CG_BuildableParticleEffects
;710:==================
;711:*/
;712:static void CG_BuildableParticleEffects( centity_t *cent )
;713:{
line 714
;714:  entityState_t   *es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 715
;715:  buildableTeam_t team = BG_FindTeamForBuildable( es->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 716
;716:  int             health = es->generic1 & ~( B_POWERED_TOGGLEBIT | B_DCCED_TOGGLEBIT | B_SPAWNED_TOGGLEBIT );
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 -97
BANDI4
ASGNI4
line 717
;717:  float           healthFrac = (float)health / B_HEALTH_SCALE;
ADDRLP4 8
ADDRLP4 12
INDIRI4
CVIF4 4
CNSTF4 1106771968
DIVF4
ASGNF4
line 719
;718:
;719:  if( !( es->generic1 & B_SPAWNED_TOGGLEBIT ) )
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $429
line 720
;720:    return;
ADDRGP4 $428
JUMPV
LABELV $429
line 722
;721:
;722:  if( team == BIT_HUMANS )
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $431
line 723
;723:  {
line 724
;724:    if( healthFrac < 0.33f && !CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRLP4 8
INDIRF4
CNSTF4 1051260355
GEF4 $433
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $433
line 725
;725:    {
line 726
;726:      cent->buildablePS = CG_SpawnNewParticleSystem( cgs.media.humanBuildableDamagedPS );
ADDRGP4 cgs+268684+572
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 728
;727:
;728:      if( CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $432
line 729
;729:      {
line 730
;730:        CG_SetAttachmentCent( &cent->buildablePS->attachment, cent );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1636
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 731
;731:        CG_AttachToCent( &cent->buildablePS->attachment );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 732
;732:      }
line 733
;733:    }
ADDRGP4 $432
JUMPV
LABELV $433
line 734
;734:    else if( healthFrac >= 0.33f && CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRLP4 8
INDIRF4
CNSTF4 1051260355
LTF4 $432
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $432
line 735
;735:      CG_DestroyParticleSystem( &cent->buildablePS );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
line 736
;736:  }
ADDRGP4 $432
JUMPV
LABELV $431
line 737
;737:  else if( team == BIT_ALIENS )
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $441
line 738
;738:  {
line 739
;739:    if( healthFrac < 0.33f && !CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRLP4 8
INDIRF4
CNSTF4 1051260355
GEF4 $443
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $443
line 740
;740:    {
line 741
;741:      cent->buildablePS = CG_SpawnNewParticleSystem( cgs.media.alienBuildableDamagedPS );
ADDRGP4 cgs+268684+580
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 743
;742:
;743:      if( CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $444
line 744
;744:      {
line 745
;745:        CG_SetAttachmentCent( &cent->buildablePS->attachment, cent );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1636
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 746
;746:        CG_SetParticleSystemNormal( cent->buildablePS, es->origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 CG_SetParticleSystemNormal
CALLV
pop
line 747
;747:        CG_AttachToCent( &cent->buildablePS->attachment );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 748
;748:      }
line 749
;749:    }
ADDRGP4 $444
JUMPV
LABELV $443
line 750
;750:    else if( healthFrac >= 0.33f && CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRLP4 8
INDIRF4
CNSTF4 1051260355
LTF4 $449
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $449
line 751
;751:      CG_DestroyParticleSystem( &cent->buildablePS );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
LABELV $449
LABELV $444
line 752
;752:  }
LABELV $441
LABELV $432
line 753
;753:}
LABELV $428
endproc CG_BuildableParticleEffects 36 8
proc CG_BuildableHealthBar 228 16
line 765
;754:
;755:
;756:#define HEALTH_BAR_WIDTH  50.0f
;757:#define HEALTH_BAR_HEIGHT 5.0f
;758:
;759:/*
;760:==================
;761:CG_BuildableHealthBar
;762:==================
;763:*/
;764:static void CG_BuildableHealthBar( centity_t *cent )
;765:{
line 767
;766:  vec3_t          origin, origin2, down, right, back, downLength, rightLength;
;767:  float           rimWidth = HEALTH_BAR_HEIGHT / 15.0f;
ADDRLP4 24
CNSTF4 1051372203
ASGNF4
line 774
;768:  float           doneWidth, leftWidth, progress;
;769:  int             health;
;770:  qhandle_t       shader;
;771:  entityState_t   *es;
;772:  vec3_t          mins, maxs;
;773:
;774:  es = &cent->currentState;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
line 776
;775:
;776:  health = es->generic1 & ~( B_POWERED_TOGGLEBIT | B_DCCED_TOGGLEBIT | B_SPAWNED_TOGGLEBIT );
ADDRLP4 120
ADDRLP4 80
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 -97
BANDI4
ASGNI4
line 777
;777:  progress = (float)health / B_HEALTH_SCALE;
ADDRLP4 100
ADDRLP4 120
INDIRI4
CVIF4 4
CNSTF4 1106771968
DIVF4
ASGNF4
line 779
;778:
;779:  if( progress < 0.0f )
ADDRLP4 100
INDIRF4
CNSTF4 0
GEF4 $452
line 780
;780:    progress = 0.0f;
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRGP4 $453
JUMPV
LABELV $452
line 781
;781:  else if( progress > 1.0f )
ADDRLP4 100
INDIRF4
CNSTF4 1065353216
LEF4 $454
line 782
;782:    progress = 1.0f;
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
LABELV $454
LABELV $453
line 784
;783:
;784:  if( progress < 0.33f )
ADDRLP4 100
INDIRF4
CNSTF4 1051260355
GEF4 $456
line 785
;785:    shader = cgs.media.redBuildShader;
ADDRLP4 104
ADDRGP4 cgs+268684+236
INDIRI4
ASGNI4
ADDRGP4 $457
JUMPV
LABELV $456
line 787
;786:  else
;787:    shader = cgs.media.greenBuildShader;
ADDRLP4 104
ADDRGP4 cgs+268684+232
INDIRI4
ASGNI4
LABELV $457
line 789
;788:
;789:  doneWidth = ( HEALTH_BAR_WIDTH - 2 * rimWidth ) * progress;
ADDRLP4 76
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 790
;790:  leftWidth = ( HEALTH_BAR_WIDTH - 2 * rimWidth ) - doneWidth;
ADDRLP4 96
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ADDRLP4 76
INDIRF4
SUBF4
ASGNF4
line 792
;791:
;792:  VectorCopy( cg.refdef.viewaxis[ 2 ], down );
ADDRLP4 40
ADDRGP4 cg+110040+36+24
INDIRB
ASGNB 12
line 793
;793:  VectorInverse( down );
ADDRLP4 40
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 794
;794:  VectorCopy( cg.refdef.viewaxis[ 1 ], right );
ADDRLP4 12
ADDRGP4 cg+110040+36+12
INDIRB
ASGNB 12
line 795
;795:  VectorInverse( right );
ADDRLP4 12
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 796
;796:  VectorSubtract( cg.refdef.vieworg, cent->lerpOrigin, back );
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 1556
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 1560
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+8
ADDRGP4 cg+110040+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRF4
SUBF4
ASGNF4
line 797
;797:  VectorNormalize( back );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 798
;798:  VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 800
;799:
;800:  BG_FindBBoxForBuildable( es->modelindex, mins, maxs );
ADDRLP4 80
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 801
;801:  VectorMA( origin, 48.0f, es->origin2, origin );
ADDRLP4 140
CNSTF4 1111490560
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 80
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
ADDRLP4 140
INDIRF4
ADDRLP4 80
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
CNSTF4 1111490560
ADDRLP4 80
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 802
;802:  VectorMA( origin, -HEALTH_BAR_WIDTH / 2.0f, right, origin );
ADDRLP4 148
CNSTF4 3251109888
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3251109888
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 803
;803:  VectorMA( origin, maxs[ 0 ] + 8.0f, back, origin );
ADDRLP4 152
ADDRLP4 108
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 108
INDIRF4
CNSTF4 1090519040
ADDF4
MULF4
ADDF4
ASGNF4
line 805
;804:
;805:  VectorCopy( origin, origin2 );
ADDRLP4 28
ADDRLP4 0
INDIRB
ASGNB 12
line 806
;806:  VectorScale( right, rimWidth + doneWidth, rightLength );
ADDRLP4 156
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ASGNF4
line 807
;807:  VectorScale( down, HEALTH_BAR_HEIGHT, downLength );
ADDRLP4 160
CNSTF4 1084227584
ASGNF4
ADDRLP4 52
ADDRLP4 160
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 160
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1084227584
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 808
;808:  CG_DrawPlane( origin2, downLength, rightLength, shader );
ADDRLP4 28
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 810
;809:
;810:  VectorMA( origin, rimWidth + doneWidth, right, origin2 );
ADDRLP4 164
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 811
;811:  VectorScale( right, leftWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 812
;812:  VectorScale( down, rimWidth, downLength );
ADDRLP4 52
ADDRLP4 40
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 813
;813:  CG_DrawPlane( origin2, downLength, rightLength, shader );
ADDRLP4 28
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 815
;814:
;815:  VectorMA( origin, rimWidth + doneWidth, right, origin2 );
ADDRLP4 176
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 816
;816:  VectorMA( origin2, HEALTH_BAR_HEIGHT - rimWidth, down, origin2 );
ADDRLP4 180
CNSTF4 1084227584
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 40+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 24
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 817
;817:  VectorScale( right, leftWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 818
;818:  VectorScale( down, rimWidth, downLength );
ADDRLP4 52
ADDRLP4 40
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 819
;819:  CG_DrawPlane( origin2, downLength, rightLength, shader );
ADDRLP4 28
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 821
;820:
;821:  VectorMA( origin, HEALTH_BAR_WIDTH - rimWidth, right, origin2 );
ADDRLP4 192
CNSTF4 1112014848
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1112014848
ADDRLP4 24
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 822
;822:  VectorScale( right, rimWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 823
;823:  VectorScale( down, HEALTH_BAR_HEIGHT, downLength );
ADDRLP4 200
CNSTF4 1084227584
ASGNF4
ADDRLP4 52
ADDRLP4 200
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 200
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1084227584
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 824
;824:  CG_DrawPlane( origin2, downLength, rightLength, shader );
ADDRLP4 28
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 826
;825:
;826:  if( !( es->generic1 & B_POWERED_TOGGLEBIT ) &&
ADDRLP4 80
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $550
ADDRLP4 80
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 2
NEI4 $550
line 828
;827:      BG_FindTeamForBuildable( es->modelindex ) == BIT_HUMANS )
;828:  {
line 829
;829:    VectorMA( origin, 15.0f, right, origin2 );
ADDRLP4 212
CNSTF4 1097859072
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1097859072
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 830
;830:    VectorMA( origin2, HEALTH_BAR_HEIGHT + 5.0f, down, origin2 );
ADDRLP4 216
CNSTF4 1092616192
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 216
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 216
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 831
;831:    VectorScale( right, HEALTH_BAR_WIDTH / 2.0f - 5.0f, rightLength );
ADDRLP4 220
CNSTF4 1101004800
ASGNF4
ADDRLP4 64
ADDRLP4 220
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 220
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
CNSTF4 1101004800
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 832
;832:    VectorScale( down,  HEALTH_BAR_WIDTH / 2.0f - 5.0f, downLength );
ADDRLP4 224
CNSTF4 1101004800
ASGNF4
ADDRLP4 52
ADDRLP4 224
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 224
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1101004800
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 833
;833:    CG_DrawPlane( origin2, downLength, rightLength, cgs.media.noPowerShader );
ADDRLP4 28
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 cgs+268684+240
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 834
;834:  }
LABELV $550
line 835
;835:}
LABELV $451
endproc CG_BuildableHealthBar 228 16
lit
align 4
LABELV $575
byte 4 0
byte 4 0
byte 4 1065353216
export CG_Buildable
code
proc CG_Buildable 452 32
line 845
;836:
;837:#define BUILDABLE_SOUND_PERIOD  500
;838:
;839:/*
;840:==================
;841:CG_Buildable
;842:==================
;843:*/
;844:void CG_Buildable( centity_t *cent )
;845:{
line 847
;846:  refEntity_t     ent;
;847:  entityState_t   *es = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 850
;848:  vec3_t          angles;
;849:  vec3_t          surfNormal, xNormal, mins, maxs;
;850:  vec3_t          refNormal = { 0.0f, 0.0f, 1.0f };
ADDRLP4 172
ADDRGP4 $575
INDIRB
ASGNB 12
line 852
;851:  float           rotAngle;
;852:  buildableTeam_t team = BG_FindTeamForBuildable( es->modelindex );
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 236
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 184
ADDRLP4 236
INDIRI4
ASGNI4
line 859
;853:  float           scale;
;854:  int             health;
;855:  float           healthScale;
;856:
;857:  //must be before EF_NODRAW check
;858:  //if( team == BIT_ALIENS )
;859:  if(team == BIT_ALIENS || team == BIT_HUMANS) //&& (cent->currentState.modelindex2 != cg.predictedPlayerState.stats[ STAT_PTEAM ]))
ADDRLP4 184
INDIRI4
CNSTI4 1
EQI4 $578
ADDRLP4 184
INDIRI4
CNSTI4 2
NEI4 $576
LABELV $578
line 860
;860:    CG_Creep( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Creep
CALLV
pop
LABELV $576
line 863
;861:
;862:  // if set to invisible, skip
;863:  if( es->eFlags & EF_NODRAW )
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $579
line 864
;864:  {
line 865
;865:    if( CG_IsParticleSystemValid( &cent->buildablePS ) )
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRLP4 244
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $574
line 866
;866:      CG_DestroyParticleSystem( &cent->buildablePS );
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
line 868
;867:
;868:    return;
ADDRGP4 $574
JUMPV
LABELV $579
line 871
;869:  }
;870:
;871:  memset ( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 873
;872:
;873:  VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 874
;874:  VectorCopy( cent->lerpOrigin, ent.oldorigin );
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 875
;875:  VectorCopy( cent->lerpOrigin, ent.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 877
;876:
;877:  VectorCopy( es->origin2, surfNormal );
ADDRLP4 148
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 879
;878:
;879:  VectorCopy( es->angles, angles );
ADDRLP4 200
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 880
;880:  BG_FindBBoxForBuildable( es->modelindex, mins, maxs );
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
ARGP4
ADDRLP4 224
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 882
;881:
;882:  if( es->pos.trType == TR_STATIONARY )
ADDRLP4 140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $586
line 883
;883:    CG_PositionAndOrientateBuildable( angles, ent.origin, surfNormal, es->number,
ADDRLP4 200
ARGP4
ADDRLP4 0+68
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRLP4 212
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 0+68
ARGP4
ADDRGP4 CG_PositionAndOrientateBuildable
CALLV
pop
LABELV $586
line 887
;884:                                      mins, maxs, ent.axis, ent.origin );
;885:
;886:  //offset on the Z axis if required
;887:  VectorMA( ent.origin, BG_FindZOffsetForBuildable( es->modelindex ), surfNormal, ent.origin );
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 244
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 148+4
INDIRF4
ADDRLP4 248
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 BG_FindZOffsetForBuildable
CALLF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 148+8
INDIRF4
ADDRLP4 252
INDIRF4
MULF4
ADDF4
ASGNF4
line 889
;888:
;889:  VectorCopy( ent.origin, ent.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 890
;890:  VectorCopy( ent.origin, ent.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 0+68
INDIRB
ASGNB 12
line 892
;891:
;892:  ent.hModel = cg_buildables[ es->modelindex ].models[ 0 ];
ADDRLP4 0+8
CNSTI4 616
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables
ADDP4
INDIRI4
ASGNI4
line 894
;893:
;894:  if( !( es->generic1 & B_SPAWNED_TOGGLEBIT ) )
ADDRLP4 140
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $608
line 895
;895:  {
line 896
;896:    sfxHandle_t prebuildSound = cgs.media.humanBuildablePrebuild;
ADDRLP4 256
ADDRGP4 cgs+268684+476
INDIRI4
ASGNI4
line 898
;897:
;898:    if( team == BIT_HUMANS )
ADDRLP4 184
INDIRI4
CNSTI4 2
NEI4 $612
line 899
;899:    {
line 900
;900:      ent.customShader = cgs.media.humanSpawningShader;
ADDRLP4 0+112
ADDRGP4 cgs+268684+244
INDIRI4
ASGNI4
line 901
;901:      prebuildSound = cgs.media.humanBuildablePrebuild;
ADDRLP4 256
ADDRGP4 cgs+268684+476
INDIRI4
ASGNI4
line 902
;902:    }
ADDRGP4 $613
JUMPV
LABELV $612
line 903
;903:    else if( team == BIT_ALIENS )
ADDRLP4 184
INDIRI4
CNSTI4 1
NEI4 $619
line 904
;904:      prebuildSound = cgs.media.alienBuildablePrebuild;
ADDRLP4 256
ADDRGP4 cgs+268684+468
INDIRI4
ASGNI4
LABELV $619
LABELV $613
line 906
;905:
;906:    trap_S_AddLoopingSound( es->number, cent->lerpOrigin, vec3_origin, prebuildSound );
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 907
;907:  }
LABELV $608
line 909
;908:
;909:  CG_BuildableAnimation( cent, &ent.oldframe, &ent.frame, &ent.backlerp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_BuildableAnimation
CALLV
pop
line 912
;910:
;911:  //rescale the model
;912:  scale = BG_FindModelScaleForBuildable( es->modelindex );
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 BG_FindModelScaleForBuildable
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 256
INDIRF4
ASGNF4
line 914
;913:
;914:  if( scale != 1.0f )
ADDRLP4 144
INDIRF4
CNSTF4 1065353216
EQF4 $626
line 915
;915:  {
line 916
;916:    VectorScale( ent.axis[ 0 ], scale, ent.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 917
;917:    VectorScale( ent.axis[ 1 ], scale, ent.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 918
;918:    VectorScale( ent.axis[ 2 ], scale, ent.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 920
;919:
;920:    ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 921
;921:  }
ADDRGP4 $627
JUMPV
LABELV $626
line 923
;922:  else
;923:    ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
LABELV $627
line 927
;924:
;925:
;926:  //add to refresh list
;927:  trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 929
;928:
;929:  CrossProduct( surfNormal, refNormal, xNormal );
ADDRLP4 148
ARGP4
ADDRLP4 172
ARGP4
ADDRLP4 160
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 930
;930:  VectorNormalize( xNormal );
ADDRLP4 160
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 931
;931:  rotAngle = RAD2DEG( acos( DotProduct( surfNormal, refNormal ) ) );
ADDRLP4 148
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDRLP4 148+4
INDIRF4
ADDRLP4 172+4
INDIRF4
MULF4
ADDF4
ADDRLP4 148+8
INDIRF4
ADDRLP4 172+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 260
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 188
CNSTF4 1127481344
ADDRLP4 260
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 934
;932:
;933:  //turret barrel bit
;934:  if( cg_buildables[ es->modelindex ].models[ 1 ] )
CNSTI4 616
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables+4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $676
line 935
;935:  {
line 939
;936:    refEntity_t turretBarrel;
;937:    vec3_t      flatAxis[ 3 ];
;938:
;939:    memset( &turretBarrel, 0, sizeof( turretBarrel ) );
ADDRLP4 264
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 941
;940:
;941:    turretBarrel.hModel = cg_buildables[ es->modelindex ].models[ 1 ];
ADDRLP4 264+8
CNSTI4 616
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables+4
ADDP4
INDIRI4
ASGNI4
line 943
;942:
;943:    CG_PositionEntityOnTag( &turretBarrel, &ent, ent.hModel, "tag_turret" );
ADDRLP4 264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $682
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 944
;944:    VectorCopy( cent->lerpOrigin, turretBarrel.lightingOrigin );
ADDRLP4 264+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 945
;945:    AnglesToAxis( es->angles2, flatAxis );
ADDRLP4 140
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 404
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 947
;946:
;947:    RotatePointAroundVector( turretBarrel.axis[ 0 ], xNormal, flatAxis[ 0 ], -rotAngle );
ADDRLP4 264+28
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 948
;948:    RotatePointAroundVector( turretBarrel.axis[ 1 ], xNormal, flatAxis[ 1 ], -rotAngle );
ADDRLP4 264+28+12
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404+12
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 949
;949:    RotatePointAroundVector( turretBarrel.axis[ 2 ], xNormal, flatAxis[ 2 ], -rotAngle );
ADDRLP4 264+28+24
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404+24
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 951
;950:
;951:    turretBarrel.oldframe = ent.oldframe;
ADDRLP4 264+96
ADDRLP4 0+96
INDIRI4
ASGNI4
line 952
;952:    turretBarrel.frame    = ent.frame;
ADDRLP4 264+80
ADDRLP4 0+80
INDIRI4
ASGNI4
line 953
;953:    turretBarrel.backlerp = ent.backlerp;
ADDRLP4 264+100
ADDRLP4 0+100
INDIRF4
ASGNF4
line 955
;954:
;955:    turretBarrel.customShader = ent.customShader;
ADDRLP4 264+112
ADDRLP4 0+112
INDIRI4
ASGNI4
line 957
;956:
;957:    if( scale != 1.0f )
ADDRLP4 144
INDIRF4
CNSTF4 1065353216
EQF4 $699
line 958
;958:    {
line 959
;959:      VectorScale( turretBarrel.axis[ 0 ], scale, turretBarrel.axis[ 0 ] );
ADDRLP4 264+28
ADDRLP4 264+28
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+4
ADDRLP4 264+28+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+8
ADDRLP4 264+28+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 960
;960:      VectorScale( turretBarrel.axis[ 1 ], scale, turretBarrel.axis[ 1 ] );
ADDRLP4 264+28+12
ADDRLP4 264+28+12
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+12+4
ADDRLP4 264+28+12+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+12+8
ADDRLP4 264+28+12+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 961
;961:      VectorScale( turretBarrel.axis[ 2 ], scale, turretBarrel.axis[ 2 ] );
ADDRLP4 264+28+24
ADDRLP4 264+28+24
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+24+4
ADDRLP4 264+28+24+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+24+8
ADDRLP4 264+28+24+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 963
;962:
;963:      turretBarrel.nonNormalizedAxes = qtrue;
ADDRLP4 264+64
CNSTI4 1
ASGNI4
line 964
;964:    }
ADDRGP4 $700
JUMPV
LABELV $699
line 966
;965:    else
;966:      turretBarrel.nonNormalizedAxes = qfalse;
ADDRLP4 264+64
CNSTI4 0
ASGNI4
LABELV $700
line 968
;967:
;968:    trap_R_AddRefEntityToScene( &turretBarrel );
ADDRLP4 264
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 969
;969:  }
LABELV $676
line 972
;970:
;971:  //turret barrel bit
;972:  if( cg_buildables[ es->modelindex ].models[ 2 ] )
CNSTI4 616
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables+8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $745
line 973
;973:  {
line 978
;974:    refEntity_t turretTop;
;975:    vec3_t      flatAxis[ 3 ];
;976:    vec3_t      swivelAngles;
;977:
;978:    memset( &turretTop, 0, sizeof( turretTop ) );
ADDRLP4 264
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 980
;979:
;980:    VectorCopy( es->angles2, swivelAngles );
ADDRLP4 440
ADDRLP4 140
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 981
;981:    swivelAngles[ PITCH ] = 0.0f;
ADDRLP4 440
CNSTF4 0
ASGNF4
line 983
;982:
;983:    turretTop.hModel = cg_buildables[ es->modelindex ].models[ 2 ];
ADDRLP4 264+8
CNSTI4 616
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_buildables+8
ADDP4
INDIRI4
ASGNI4
line 985
;984:
;985:    CG_PositionRotatedEntityOnTag( &turretTop, &ent, ent.hModel, "tag_turret" );
ADDRLP4 264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $682
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 986
;986:    VectorCopy( cent->lerpOrigin, turretTop.lightingOrigin );
ADDRLP4 264+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 987
;987:    AnglesToAxis( swivelAngles, flatAxis );
ADDRLP4 440
ARGP4
ADDRLP4 404
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 989
;988:
;989:    RotatePointAroundVector( turretTop.axis[ 0 ], xNormal, flatAxis[ 0 ], -rotAngle );
ADDRLP4 264+28
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 990
;990:    RotatePointAroundVector( turretTop.axis[ 1 ], xNormal, flatAxis[ 1 ], -rotAngle );
ADDRLP4 264+28+12
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404+12
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 991
;991:    RotatePointAroundVector( turretTop.axis[ 2 ], xNormal, flatAxis[ 2 ], -rotAngle );
ADDRLP4 264+28+24
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 404+24
ARGP4
ADDRLP4 188
INDIRF4
NEGF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 993
;992:
;993:    turretTop.oldframe = ent.oldframe;
ADDRLP4 264+96
ADDRLP4 0+96
INDIRI4
ASGNI4
line 994
;994:    turretTop.frame    = ent.frame;
ADDRLP4 264+80
ADDRLP4 0+80
INDIRI4
ASGNI4
line 995
;995:    turretTop.backlerp = ent.backlerp;
ADDRLP4 264+100
ADDRLP4 0+100
INDIRF4
ASGNF4
line 997
;996:
;997:    turretTop.customShader = ent.customShader;
ADDRLP4 264+112
ADDRLP4 0+112
INDIRI4
ASGNI4
line 999
;998:
;999:    if( scale != 1.0f )
ADDRLP4 144
INDIRF4
CNSTF4 1065353216
EQF4 $767
line 1000
;1000:    {
line 1001
;1001:      VectorScale( turretTop.axis[ 0 ], scale, turretTop.axis[ 0 ] );
ADDRLP4 264+28
ADDRLP4 264+28
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+4
ADDRLP4 264+28+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+8
ADDRLP4 264+28+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 1002
;1002:      VectorScale( turretTop.axis[ 1 ], scale, turretTop.axis[ 1 ] );
ADDRLP4 264+28+12
ADDRLP4 264+28+12
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+12+4
ADDRLP4 264+28+12+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+12+8
ADDRLP4 264+28+12+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 1003
;1003:      VectorScale( turretTop.axis[ 2 ], scale, turretTop.axis[ 2 ] );
ADDRLP4 264+28+24
ADDRLP4 264+28+24
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+24+4
ADDRLP4 264+28+24+4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 264+28+24+8
ADDRLP4 264+28+24+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 1005
;1004:
;1005:      turretTop.nonNormalizedAxes = qtrue;
ADDRLP4 264+64
CNSTI4 1
ASGNI4
line 1006
;1006:    }
ADDRGP4 $768
JUMPV
LABELV $767
line 1008
;1007:    else
;1008:      turretTop.nonNormalizedAxes = qfalse;
ADDRLP4 264+64
CNSTI4 0
ASGNI4
LABELV $768
line 1010
;1009:
;1010:    trap_R_AddRefEntityToScene( &turretTop );
ADDRLP4 264
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1011
;1011:  }
LABELV $745
line 1013
;1012:
;1013:  switch( cg.predictedPlayerState.weapon )
ADDRLP4 264
ADDRGP4 cg+107636+144
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 18
LTI4 $814
ADDRLP4 264
INDIRI4
CNSTI4 21
GTI4 $814
ADDRLP4 264
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $822-72
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $822
address $817
address $817
address $817
address $817
code
line 1014
;1014:  {
LABELV $817
line 1019
;1015:    case WP_ABUILD:
;1016:    case WP_ABUILD2:
;1017:    case WP_HBUILD:
;1018:    case WP_HBUILD2:
;1019:      if( BG_FindTeamForBuildable( es->modelindex ) ==
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_FindTeamForWeapon
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
ADDRLP4 272
INDIRI4
NEI4 $814
line 1021
;1020:          BG_FindTeamForWeapon( cg.predictedPlayerState.weapon ) )
;1021:        CG_BuildableHealthBar( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_BuildableHealthBar
CALLV
pop
line 1022
;1022:      break;
line 1025
;1023:
;1024:    default:
;1025:      break;
LABELV $814
line 1027
;1026:  }
;1027:  if(cgs.survivalRecords[0] > 0 
ADDRGP4 cgs+34672
INDIRI4
CNSTI4 0
LEI4 $824
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 2
NEI4 $824
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 12
NEI4 $824
line 1030
;1028:  && cg.predictedPlayerState.stats[ STAT_PTEAM ] == PTE_HUMANS
;1029:  && es->modelindex == BA_H_ARMOURY)
;1030:  {
line 1031
;1031:    CG_BuildableHealthBar( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_BuildableHealthBar
CALLV
pop
line 1032
;1032:  }
LABELV $824
line 1035
;1033:
;1034:  //weapon effects for turrets
;1035:  if( es->eFlags & EF_FIRING )
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $830
line 1036
;1036:  {
line 1037
;1037:    weaponInfo_t  *weapon = &cg_weapons[ es->weapon ];
ADDRLP4 268
CNSTI4 900
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1039
;1038:
;1039:    if( cg.time - cent->muzzleFlashTime > MUZZLE_FLASH_TIME ||
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
SUBI4
CNSTI4 20
GTI4 $835
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_FindProjTypeForBuildable
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 16
NEI4 $832
LABELV $835
line 1041
;1040:        BG_FindProjTypeForBuildable( es->modelindex ) == WP_TESLAGEN )
;1041:    {
line 1042
;1042:      if( weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 0 ] ||
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ADDRLP4 280
INDIRF4
NEF4 $839
ADDRLP4 268
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ADDRLP4 280
INDIRF4
NEF4 $839
ADDRLP4 268
INDIRP4
CNSTI4 240
ADDP4
INDIRF4
ADDRLP4 280
INDIRF4
EQF4 $836
LABELV $839
line 1045
;1043:          weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 1 ] ||
;1044:          weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 2 ] )
;1045:      {
line 1046
;1046:        trap_R_AddLightToScene( cent->lerpOrigin, 300 + ( rand( ) & 31 ),
ADDRLP4 284
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 300
ADDI4
CVIF4 4
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 240
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1050
;1047:            weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 0 ],
;1048:            weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 1 ],
;1049:            weapon->wim[ WPM_PRIMARY ].flashDlightColor[ 2 ] );
;1050:      }
LABELV $836
line 1051
;1051:    }
LABELV $832
line 1053
;1052:
;1053:    if( weapon->wim[ WPM_PRIMARY ].firingSound )
ADDRLP4 268
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $840
line 1054
;1054:    {
line 1055
;1055:      trap_S_AddLoopingSound( es->number, cent->lerpOrigin, vec3_origin,
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1057
;1056:          weapon->wim[ WPM_PRIMARY ].firingSound );
;1057:    }
ADDRGP4 $841
JUMPV
LABELV $840
line 1058
;1058:    else if( weapon->readySound )
ADDRLP4 268
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $842
line 1059
;1059:      trap_S_AddLoopingSound( es->number, cent->lerpOrigin, vec3_origin, weapon->readySound );
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
LABELV $842
LABELV $841
line 1060
;1060:  }
LABELV $830
line 1062
;1061:
;1062:  health = es->generic1 & ~( B_POWERED_TOGGLEBIT | B_DCCED_TOGGLEBIT | B_SPAWNED_TOGGLEBIT );
ADDRLP4 196
ADDRLP4 140
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 -97
BANDI4
ASGNI4
line 1063
;1063:  healthScale = (float)health / B_HEALTH_SCALE;
ADDRLP4 192
ADDRLP4 196
INDIRI4
CVIF4 4
CNSTF4 1106771968
DIVF4
ASGNF4
line 1065
;1064:
;1065:  if( healthScale < cent->lastBuildableHealthScale && ( es->generic1 & B_SPAWNED_TOGGLEBIT ) )
ADDRLP4 192
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1640
ADDP4
INDIRF4
GEF4 $844
ADDRLP4 140
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $844
line 1066
;1066:  {
line 1067
;1067:    if( cent->lastBuildableDamageSoundTime + BUILDABLE_SOUND_PERIOD < cg.time )
ADDRFP4 0
INDIRP4
CNSTI4 1644
ADDP4
INDIRI4
CNSTI4 500
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $846
line 1068
;1068:    {
line 1069
;1069:      if( team == BIT_HUMANS )
ADDRLP4 184
INDIRI4
CNSTI4 2
NEI4 $849
line 1070
;1070:      {
line 1071
;1071:        int i = rand( ) % 4;
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 272
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 1072
;1072:        trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.humanBuildableDamage[ i ] );
CNSTP4 0
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 268
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+480
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1073
;1073:      }
ADDRGP4 $850
JUMPV
LABELV $849
line 1074
;1074:      else if( team == BIT_ALIENS )
ADDRLP4 184
INDIRI4
CNSTI4 1
NEI4 $853
line 1075
;1075:        trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.alienBuildableDamage );
CNSTP4 0
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+268684+464
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $853
LABELV $850
line 1077
;1076:
;1077:      cent->lastBuildableDamageSoundTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1644
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1078
;1078:    }
LABELV $846
line 1079
;1079:  }
LABELV $844
line 1081
;1080:
;1081:  cent->lastBuildableHealthScale = healthScale;
ADDRFP4 0
INDIRP4
CNSTI4 1640
ADDP4
ADDRLP4 192
INDIRF4
ASGNF4
line 1084
;1082:
;1083:  //smoke etc for damaged buildables
;1084:  CG_BuildableParticleEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_BuildableParticleEffects
CALLV
pop
line 1085
;1085:}
LABELV $574
endproc CG_Buildable 452 32
bss
align 4
LABELV defaultHumanSounds
skip 60
align 4
LABELV defaultAlienSounds
skip 60
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
import CG_ModelDoor
import CG_AnimMapObj
import CG_RunLerpFrame
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
LABELV $682
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $332
byte 1 37
byte 1 100
byte 1 45
byte 1 62
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 58
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 58
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $307
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $274
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $266
byte 1 110
byte 1 101
byte 1 119
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $255
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $247
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $242
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 116
byte 1 101
byte 1 115
byte 1 108
byte 1 97
byte 1 47
byte 1 122
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $228
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $216
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
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $212
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
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $209
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $203
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $202
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $195
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $111
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $110
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $109
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $108
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $107
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $105
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $104
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $103
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $102
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $101
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
