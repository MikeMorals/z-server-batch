export CG_TestModel_f
code
proc CG_TestModel_f 48 12
file "..\..\..\..\src/cgame/cg_view.c"
line 75
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
;24:// cg_view.c -- setup all the parameters (position, angle, etc)
;25:// for a 3D rendering
;26:
;27:
;28:#include "cg_local.h"
;29:
;30:
;31:/*
;32:=============================================================================
;33:
;34:  MODEL TESTING
;35:
;36:The viewthing and gun positioning tools from Q2 have been integrated and
;37:enhanced into a single model testing facility.
;38:
;39:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;40:
;41:The names must be the full pathname after the basedir, like
;42:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;43:
;44:Testmodel will create a fake entity 100 units in front of the current view
;45:position, directly facing the viewer.  It will remain immobile, so you can
;46:move around it to view it from different angles.
;47:
;48:Testgun will cause the model to follow the player around and supress the real
;49:view weapon model.  The default frame 0 of most guns is completely off screen,
;50:so you will probably have to cycle a couple frames to see it.
;51:
;52:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;53:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;54:q3default.cfg.
;55:
;56:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;57:you adjust the positioning.
;58:
;59:Note that none of the model testing features update while the game is paused, so
;60:it may be convenient to test with deathmatch set to 1 so that bringing down the
;61:console doesn't pause the game.
;62:
;63:=============================================================================
;64:*/
;65:
;66:/*
;67:=================
;68:CG_TestModel_f
;69:
;70:Creates an entity in front of the current position, which
;71:can then be moved around
;72:=================
;73:*/
;74:void CG_TestModel_f( void )
;75:{
line 78
;76:  vec3_t    angles;
;77:
;78:  memset( &cg.testModelEntity, 0, sizeof( cg.testModelEntity ) );
ADDRGP4 cg+115800
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 79
;79:  memset( &cg.testModelBarrelEntity, 0, sizeof( cg.testModelBarrelEntity ) );
ADDRGP4 cg+115940
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 81
;80:
;81:  if( trap_Argc( ) < 2 )
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $104
line 82
;82:    return;
ADDRGP4 $99
JUMPV
LABELV $104
line 84
;83:
;84:  Q_strncpyz( cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+116080
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 85
;85:  cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+116080
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115800+8
ADDRLP4 20
INDIRI4
ASGNI4
line 87
;86:
;87:  Q_strncpyz( cg.testModelBarrelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+116144
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 88
;88:  cg.testModelBarrelName[ strlen( cg.testModelBarrelName ) - 4 ] = '\0';
ADDRGP4 cg+116144
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 cg+116144-4
ADDP4
CNSTI1 0
ASGNI1
line 89
;89:  Q_strcat( cg.testModelBarrelName, MAX_QPATH, "_barrel.md3" );
ADDRGP4 cg+116144
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $115
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 90
;90:  cg.testModelBarrelEntity.hModel = trap_R_RegisterModel( cg.testModelBarrelName );
ADDRGP4 cg+116144
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115940+8
ADDRLP4 32
INDIRI4
ASGNI4
line 92
;91:
;92:  if( trap_Argc( ) == 3 )
ADDRLP4 36
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 3
NEI4 $119
line 93
;93:  {
line 94
;94:    cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 40
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+115800+100
ADDRLP4 44
INDIRF4
ASGNF4
line 95
;95:    cg.testModelEntity.frame = 1;
ADDRGP4 cg+115800+80
CNSTI4 1
ASGNI4
line 96
;96:    cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+115800+96
CNSTI4 0
ASGNI4
line 97
;97:  }
LABELV $119
line 99
;98:
;99:  if( !cg.testModelEntity.hModel )
ADDRGP4 cg+115800+8
INDIRI4
CNSTI4 0
NEI4 $127
line 100
;100:  {
line 101
;101:    CG_Printf( "Can't register model\n" );
ADDRGP4 $131
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 102
;102:    return;
ADDRGP4 $99
JUMPV
LABELV $127
line 105
;103:  }
;104:
;105:  VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[ 0 ], cg.testModelEntity.origin );
ADDRGP4 cg+115800+68
ADDRGP4 cg+110040+24
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+110040+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+115800+68+4
ADDRGP4 cg+110040+24+4
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+110040+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+115800+68+8
ADDRGP4 cg+110040+24+8
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+110040+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 107
;106:
;107:  angles[ PITCH ] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 108
;108:  angles[ YAW ] = 180 + cg.refdefViewAngles[ 1 ];
ADDRLP4 0+4
ADDRGP4 cg+110408+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 109
;109:  angles[ ROLL ] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 111
;110:
;111:  AnglesToAxis( angles, cg.testModelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+115800+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 112
;112:  cg.testGun = qfalse;
ADDRGP4 cg+116208
CNSTI4 0
ASGNI4
line 114
;113:
;114:  if( cg.testModelBarrelEntity.hModel )
ADDRGP4 cg+115940+8
INDIRI4
CNSTI4 0
EQI4 $163
line 115
;115:  {
line 116
;116:    angles[ YAW ] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 117
;117:    angles[ PITCH ] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 118
;118:    angles[ ROLL ] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 119
;119:    AnglesToAxis( angles, cg.testModelBarrelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+115940+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 120
;120:  }
LABELV $163
line 121
;121:}
LABELV $99
endproc CG_TestModel_f 48 12
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 131
;122:
;123:/*
;124:=================
;125:CG_TestGun_f
;126:
;127:Replaces the current view weapon with the given model
;128:=================
;129:*/
;130:void CG_TestGun_f( void )
;131:{
line 132
;132:  CG_TestModel_f( );
ADDRGP4 CG_TestModel_f
CALLV
pop
line 133
;133:  cg.testGun = qtrue;
ADDRGP4 cg+116208
CNSTI4 1
ASGNI4
line 134
;134:  cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+115800+4
CNSTI4 13
ASGNI4
line 135
;135:}
LABELV $171
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 139
;136:
;137:
;138:void CG_TestModelNextFrame_f( void )
;139:{
line 140
;140:  cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+115800+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 141
;141:  CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $178
ARGP4
ADDRGP4 cg+115800+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 142
;142:}
LABELV $175
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 145
;143:
;144:void CG_TestModelPrevFrame_f( void )
;145:{
line 146
;146:  cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+115800+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 148
;147:
;148:  if( cg.testModelEntity.frame < 0 )
ADDRGP4 cg+115800+80
INDIRI4
CNSTI4 0
GEI4 $184
line 149
;149:    cg.testModelEntity.frame = 0;
ADDRGP4 cg+115800+80
CNSTI4 0
ASGNI4
LABELV $184
line 151
;150:
;151:  CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $178
ARGP4
ADDRGP4 cg+115800+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 152
;152:}
LABELV $181
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 155
;153:
;154:void CG_TestModelNextSkin_f( void )
;155:{
line 156
;156:  cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+115800+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 157
;157:  CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $195
ARGP4
ADDRGP4 cg+115800+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 158
;158:}
LABELV $192
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 161
;159:
;160:void CG_TestModelPrevSkin_f( void )
;161:{
line 162
;162:  cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+115800+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 164
;163:
;164:  if( cg.testModelEntity.skinNum < 0 )
ADDRGP4 cg+115800+104
INDIRI4
CNSTI4 0
GEI4 $201
line 165
;165:    cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+115800+104
CNSTI4 0
ASGNI4
LABELV $201
line 167
;166:
;167:  CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $195
ARGP4
ADDRGP4 cg+115800+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 168
;168:}
LABELV $198
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 36 16
line 171
;169:
;170:static void CG_AddTestModel( void )
;171:{
line 175
;172:  int   i;
;173:
;174:  // re-register the model, because the level may have changed
;175:  cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+116080
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115800+8
ADDRLP4 4
INDIRI4
ASGNI4
line 176
;176:  cg.testModelBarrelEntity.hModel = trap_R_RegisterModel( cg.testModelBarrelName );
ADDRGP4 cg+116144
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115940+8
ADDRLP4 8
INDIRI4
ASGNI4
line 178
;177:
;178:  if( !cg.testModelEntity.hModel )
ADDRGP4 cg+115800+8
INDIRI4
CNSTI4 0
NEI4 $216
line 179
;179:  {
line 180
;180:    CG_Printf( "Can't register model\n" );
ADDRGP4 $131
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 181
;181:    return;
ADDRGP4 $209
JUMPV
LABELV $216
line 185
;182:  }
;183:
;184:  // if testing a gun, set the origin reletive to the view origin
;185:  if( cg.testGun )
ADDRGP4 cg+116208
INDIRI4
CNSTI4 0
EQI4 $220
line 186
;186:  {
line 187
;187:    VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+115800+68
ADDRGP4 cg+110040+24
INDIRB
ASGNB 12
line 188
;188:    VectorCopy( cg.refdef.viewaxis[ 0 ], cg.testModelEntity.axis[ 0 ] );
ADDRGP4 cg+115800+28
ADDRGP4 cg+110040+36
INDIRB
ASGNB 12
line 189
;189:    VectorCopy( cg.refdef.viewaxis[ 1 ], cg.testModelEntity.axis[ 1 ] );
ADDRGP4 cg+115800+28+12
ADDRGP4 cg+110040+36+12
INDIRB
ASGNB 12
line 190
;190:    VectorCopy( cg.refdef.viewaxis[ 2 ], cg.testModelEntity.axis[ 2 ] );
ADDRGP4 cg+115800+28+24
ADDRGP4 cg+110040+36+24
INDIRB
ASGNB 12
line 193
;191:
;192:    // allow the position to be adjusted
;193:    for( i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $243
line 194
;194:    {
line 195
;195:      cg.testModelEntity.origin[ i ] += cg.refdef.viewaxis[ 0 ][ i ] * cg_gun_x.value;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+115800+68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRI4
ADDRGP4 cg+110040+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 196
;196:      cg.testModelEntity.origin[ i ] += cg.refdef.viewaxis[ 1 ][ i ] * cg_gun_y.value;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 cg+115800+68
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 cg+110040+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 197
;197:      cg.testModelEntity.origin[ i ] += cg.refdef.viewaxis[ 2 ][ i ] * cg_gun_z.value;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
ADDRLP4 28
INDIRI4
ADDRGP4 cg+115800+68
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 28
INDIRI4
ADDRGP4 cg+110040+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 198
;198:    }
LABELV $244
line 193
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $243
line 199
;199:  }
LABELV $220
line 201
;200:
;201:  trap_R_AddRefEntityToScene( &cg.testModelEntity );
ADDRGP4 cg+115800
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 203
;202:
;203:  if( cg.testModelBarrelEntity.hModel )
ADDRGP4 cg+115940+8
INDIRI4
CNSTI4 0
EQI4 $265
line 204
;204:  {
line 205
;205:    CG_PositionEntityOnTag( &cg.testModelBarrelEntity, &cg.testModelEntity,
ADDRGP4 cg+115940
ARGP4
ADDRGP4 cg+115800
ARGP4
ADDRGP4 cg+115800+8
INDIRI4
ARGI4
ADDRGP4 $273
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 208
;206:        cg.testModelEntity.hModel, "tag_barrel" );
;207:
;208:    trap_R_AddRefEntityToScene( &cg.testModelBarrelEntity );
ADDRGP4 cg+115940
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 209
;209:  }
LABELV $265
line 210
;210:}
LABELV $209
endproc CG_AddTestModel 36 16
proc CG_CalcVrect 12 8
line 225
;211:
;212:
;213:
;214://============================================================================
;215:
;216:
;217:/*
;218:=================
;219:CG_CalcVrect
;220:
;221:Sets the coordinates of the rendered window
;222:=================
;223:*/
;224:static void CG_CalcVrect( void )
;225:{
line 229
;226:  int   size;
;227:
;228:  // the intermission should allways be full screen
;229:  if( cg.snap->ps.pm_type == PM_INTERMISSION )
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
NEI4 $276
line 230
;230:    size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
ADDRGP4 $277
JUMPV
LABELV $276
line 232
;231:  else
;232:  {
line 234
;233:    // bound normal viewsize
;234:    if( cg_viewsize.integer < 30 )
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $279
line 235
;235:    {
line 236
;236:      trap_Cvar_Set( "cg_viewsize", "30" );
ADDRGP4 $282
ARGP4
ADDRGP4 $283
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 237
;237:      size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 238
;238:    }
ADDRGP4 $280
JUMPV
LABELV $279
line 239
;239:    else if( cg_viewsize.integer > 100 )
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 100
LEI4 $284
line 240
;240:    {
line 241
;241:      trap_Cvar_Set( "cg_viewsize","100" );
ADDRGP4 $282
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 242
;242:      size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 243
;243:    }
ADDRGP4 $285
JUMPV
LABELV $284
line 245
;244:    else
;245:      size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
LABELV $285
LABELV $280
line 246
;246:  }
LABELV $277
line 248
;247:
;248:  cg.refdef.width = cgs.glconfig.vidWidth * size / 100;
ADDRGP4 cg+110040+8
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 249
;249:  cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+110040+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 251
;250:
;251:  cg.refdef.height = cgs.glconfig.vidHeight * size / 100;
ADDRGP4 cg+110040+12
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 252
;252:  cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+110040+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 254
;253:
;254:  cg.refdef.x = ( cgs.glconfig.vidWidth - cg.refdef.width ) / 2;
ADDRGP4 cg+110040
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+110040+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 255
;255:  cg.refdef.y = ( cgs.glconfig.vidHeight - cg.refdef.height ) / 2;
ADDRGP4 cg+110040+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+110040+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 256
;256:}
LABELV $275
endproc CG_CalcVrect 12 8
data
align 4
LABELV $313
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $314
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
code
proc CG_OffsetThirdPersonView 216 28
line 269
;257:
;258://==============================================================================
;259:
;260:
;261:/*
;262:===============
;263:CG_OffsetThirdPersonView
;264:
;265:===============
;266:*/
;267:#define FOCUS_DISTANCE  512
;268:static void CG_OffsetThirdPersonView( void )
;269:{
line 281
;270:  vec3_t        forward, right, up;
;271:  vec3_t        view;
;272:  vec3_t        focusAngles;
;273:  trace_t       trace;
;274:  static vec3_t mins = { -8, -8, -8 };
;275:  static vec3_t maxs = { 8, 8, 8 };
;276:  vec3_t        focusPoint, fail;
;277:  float         focusDist;
;278:  float         forwardScale, sideScale;
;279:  vec3_t        surfNormal;
;280:
;281:  if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $315
line 282
;282:  {
line 283
;283:    if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING )
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $320
line 284
;284:      VectorSet( surfNormal, 0.0f, 0.0f, -1.0f );
ADDRLP4 168
CNSTF4 0
ASGNF4
ADDRLP4 24
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 24+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $316
JUMPV
LABELV $320
line 286
;285:    else
;286:      VectorCopy( cg.predictedPlayerState.grapplePoint, surfNormal );
ADDRLP4 24
ADDRGP4 cg+107636+92
INDIRB
ASGNB 12
line 287
;287:  }
ADDRGP4 $316
JUMPV
LABELV $315
line 289
;288:  else
;289:    VectorSet( surfNormal, 0.0f, 0.0f, 1.0f );
ADDRLP4 168
CNSTF4 0
ASGNF4
ADDRLP4 24
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
LABELV $316
line 291
;290://HAX cg_gun
;291:  VectorMA( cg.refdef.vieworg, cg.predictedPlayerState.viewheight, surfNormal, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+8
ADDRGP4 cg+110040+24+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 293
;292:
;293:  VectorCopy( cg.refdefViewAngles, focusAngles );
ADDRLP4 72
ADDRGP4 cg+110408
INDIRB
ASGNB 12
line 296
;294:
;295:  // if dead, look at killer
;296:  if( cg.predictedPlayerState.stats[ STAT_HEALTH ] <= 0 )
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $356
line 297
;297:  {
line 298
;298:    focusAngles[ YAW ] = cg.predictedPlayerState.stats[ STAT_VIEWLOCK ];
ADDRLP4 72+4
ADDRGP4 cg+107636+184+60
INDIRI4
CVIF4 4
ASGNF4
line 299
;299:    cg.refdefViewAngles[ YAW ] = cg.predictedPlayerState.stats[ STAT_VIEWLOCK ];
ADDRGP4 cg+110408+4
ADDRGP4 cg+107636+184+60
INDIRI4
CVIF4 4
ASGNF4
line 300
;300:  }
LABELV $356
line 306
;301:
;302:  //if ( focusAngles[PITCH] > 45 ) {
;303:  //  focusAngles[PITCH] = 45;    // don't go too far overhead
;304:  //}
;305:
;306:  AngleVectors( focusAngles, forward, NULL, NULL );
ADDRLP4 72
ARGP4
ADDRLP4 36
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
ADDRGP4 AngleVectors
CALLV
pop
line 308
;307:
;308:  VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 176
CNSTF4 1140850688
ASGNF4
ADDRLP4 12
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+110040+24+8
INDIRF4
CNSTF4 1140850688
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 310
;309:
;310:  VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+110040+24
INDIRB
ASGNB 12
line 312
;311:
;312:  VectorMA( view, 12, surfNormal, view );
ADDRLP4 180
CNSTF4 1094713344
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 180
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 180
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1094713344
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 316
;313:
;314:	//cg.refdefViewAngles[PITCH] *= 0.5;
;315:
;316:  AngleVectors( cg.refdefViewAngles, forward, right, up );
ADDRGP4 cg+110408
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 144
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 318
;317:
;318:  forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 184
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 184
INDIRF4
ASGNF4
line 319
;319:  sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 188
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 64
ADDRLP4 188
INDIRF4
ASGNF4
line 320
;320:  VectorMA( view, -cg_thirdPersonRangehax.value * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 321
;321:  VectorMA( view, -cg_thirdPersonRangehax.value * sideScale , right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
ADDRGP4 cg_thirdPersonRangehax+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 326
;322:
;323:  // trace a ray from the origin to the viewpoint to make sure the view isn't
;324:  // in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;325:
;326:  if( !cg_cameraMode.integer )
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $410
line 327
;327:  {
line 328
;328:    CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 84
ARGP4
ADDRGP4 cg+110040+24
ARGP4
ADDRGP4 $313
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 330
;329:
;330:    if( trace.fraction != 1.0 )
ADDRLP4 84+8
INDIRF4
CNSTF4 1065353216
EQF4 $417
line 331
;331:    {
line 332
;332:      VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 84+12
INDIRB
ASGNB 12
line 333
;333:      view[ 2 ] += ( 1.0 - trace.fraction ) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
CNSTF4 1065353216
ADDRLP4 84+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 337
;334:      // try another trace to this position, because a tunnel may have the ceiling
;335:      // close enogh that this is poking out
;336:
;337:      CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 84
ARGP4
ADDRGP4 cg+110040+24
ARGP4
ADDRGP4 $313
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 338
;338:      VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 84+12
INDIRB
ASGNB 12
line 339
;339:    }
LABELV $417
line 340
;340:  }
LABELV $410
line 342
;341:
;342:  VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRLP4 0
INDIRB
ASGNB 12
line 345
;343:
;344:  // select pitch to look at focus point from vieword
;345:  VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+110040+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+110040+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+110040+24+8
INDIRF4
SUBF4
ASGNF4
line 346
;346:  focusDist = sqrt( focusPoint[ 0 ] * focusPoint[ 0 ] + focusPoint[ 1 ] * focusPoint[ 1 ] );
ADDRLP4 200
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 200
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 204
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 204
INDIRF4
ASGNF4
line 347
;347:  if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $444
line 348
;348:    focusDist = 1;  // should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 349
;349:  }
LABELV $444
line 350
;350:  cg.refdefViewAngles[ PITCH ] = -180 / M_PI * atan2( focusPoint[ 2 ] , focusDist );
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 208
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+110408
CNSTF4 3261411041
ADDRLP4 208
INDIRF4
MULF4
ASGNF4
line 351
;351:  cg.refdefViewAngles[ YAW ] -= cg_thirdPersonAngle.value;
ADDRLP4 212
ADDRGP4 cg+110408+4
ASGNP4
ADDRLP4 212
INDIRP4
ADDRLP4 212
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
line 352
;352:}
LABELV $312
endproc CG_OffsetThirdPersonView 216 28
proc CG_StepOffset 44 4
line 357
;353:
;354:
;355:// this causes a compiler bug on mac MrC compiler
;356:static void CG_StepOffset( void )
;357:{
line 361
;358:  float         steptime;
;359:  int            timeDelta;
;360:  vec3_t        normal;
;361:  playerState_t *ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+107636
ASGNP4
line 363
;362:
;363:  if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $453
line 364
;364:  {
line 365
;365:    if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING )
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $455
line 366
;366:      VectorSet( normal, 0.0f, 0.0f, -1.0f );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $454
JUMPV
LABELV $455
line 368
;367:    else
;368:      VectorCopy( ps->grapplePoint, normal );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 369
;369:  }
ADDRGP4 $454
JUMPV
LABELV $453
line 371
;370:  else
;371:    VectorSet( normal, 0.0f, 0.0f, 1.0f );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
LABELV $454
line 373
;372:
;373:  steptime = BG_FindSteptimeForClass( ps->stats[ STAT_PCLASS ] );
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindSteptimeForClass
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
line 376
;374:
;375:  // smooth out stair climbing
;376:  timeDelta = cg.time - cg.stepTime;
ADDRLP4 20
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109920
INDIRI4
SUBI4
ASGNI4
line 377
;377:  if( timeDelta < steptime )
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
GEF4 $463
line 378
;378:  {
line 379
;379:    float stepChange = cg.stepChange
ADDRLP4 32
ADDRGP4 cg+109916
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
SUBF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 382
;380:      * (steptime - timeDelta) / steptime;
;381:
;382:    if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $466
line 383
;383:      VectorMA( cg.refdef.vieworg, -stepChange, normal, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 32
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+8
ADDRGP4 cg+110040+24+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 32
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $467
JUMPV
LABELV $466
line 385
;384:    else
;385:      cg.refdef.vieworg[ 2 ] -= stepChange;
ADDRLP4 40
ADDRGP4 cg+110040+24+8
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
LABELV $467
line 386
;386:  }
LABELV $463
line 387
;387:}
LABELV $451
endproc CG_StepOffset 44 4
proc CG_OffsetFirstPersonView 280 16
line 402
;388:
;389:#define PCLOUD_ROLL_AMPLITUDE   25.0f
;390:#define PCLOUD_ROLL_FREQUENCY   0.4f
;391:#define PCLOUD_ZOOM_AMPLITUDE   15
;392:#define PCLOUD_ZOOM_FREQUENCY   0.7f
;393:
;394:
;395:/*
;396:===============
;397:CG_OffsetFirstPersonView
;398:
;399:===============
;400:*/
;401:static void CG_OffsetFirstPersonView( void )
;402:{
line 414
;403:  float         *origin;
;404:  float         *angles;
;405:  float         bob;
;406:  float         ratio;
;407:  float         delta;
;408:  float         speed;
;409:  float         f;
;410:  vec3_t        predictedVelocity;
;411:  int           timeDelta;
;412:  float         bob2;
;413:  vec3_t        normal, baseOrigin;
;414:  playerState_t *ps = &cg.predictedPlayerState;
ADDRLP4 24
ADDRGP4 cg+107636
ASGNP4
line 416
;415:
;416:  if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $491
line 417
;417:  {
line 418
;418:    if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING )
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $493
line 419
;419:      VectorSet( normal, 0.0f, 0.0f, -1.0f );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $492
JUMPV
LABELV $493
line 421
;420:    else
;421:      VectorCopy( ps->grapplePoint, normal );
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 422
;422:  }
ADDRGP4 $492
JUMPV
LABELV $491
line 424
;423:  else
;424:    VectorSet( normal, 0.0f, 0.0f, 1.0f );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+8
CNSTF4 1065353216
ASGNF4
LABELV $492
line 427
;425:
;426:
;427:  if( cg.snap->ps.pm_type == PM_INTERMISSION )
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
NEI4 $499
line 428
;428:    return;
ADDRGP4 $489
JUMPV
LABELV $499
line 430
;429:
;430:  origin = cg.refdef.vieworg;
ADDRLP4 0
ADDRGP4 cg+110040+24
ASGNP4
line 431
;431:  angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+110408
ASGNP4
line 433
;432:
;433:  VectorCopy( origin, baseOrigin );
ADDRLP4 64
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 436
;434:
;435:  // if dead, fix the angle and don't add any kick
;436:  if( cg.snap->ps.stats[ STAT_HEALTH ] <= 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $505
line 437
;437:  {
line 438
;438:    angles[ ROLL ] = 40;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1109393408
ASGNF4
line 439
;439:    angles[ PITCH ] = -15;
ADDRLP4 4
INDIRP4
CNSTF4 3245342720
ASGNF4
line 440
;440:    angles[ YAW ] = cg.snap->ps.stats[ STAT_VIEWLOCK ];
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 441
;441:    origin[ 2 ] += cg.predictedPlayerState.viewheight;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 442
;442:    return;
ADDRGP4 $489
JUMPV
LABELV $505
line 446
;443:  }
;444:
;445:  // add angles based on weapon kick
;446:  VectorAdd( angles, cg.kick_angles, angles );
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+115760
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+115760+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRGP4 cg+115760+8
INDIRF4
ADDF4
ASGNF4
line 449
;447:
;448:  // add angles based on damage kick
;449:  if( cg.damageTime )
ADDRGP4 cg+115704
INDIRF4
CNSTF4 0
EQF4 $516
line 450
;450:  {
line 451
;451:    ratio = cg.time - cg.damageTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+115704
INDIRF4
SUBF4
ASGNF4
line 452
;452:    if( ratio < DAMAGE_DEFLECT_TIME )
ADDRLP4 48
INDIRF4
CNSTF4 1120403456
GEF4 $521
line 453
;453:    {
line 454
;454:      ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 48
ADDRLP4 48
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 455
;455:      angles[ PITCH ] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+115752
INDIRF4
MULF4
ADDF4
ASGNF4
line 456
;456:      angles[ ROLL ] += ratio * cg.v_dmg_roll;
ADDRLP4 96
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+115756
INDIRF4
MULF4
ADDF4
ASGNF4
line 457
;457:    }
ADDRGP4 $522
JUMPV
LABELV $521
line 459
;458:    else
;459:    {
line 460
;460:      ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
ADDRLP4 48
CNSTF4 1065353216
ADDRLP4 48
INDIRF4
CNSTF4 1120403456
SUBF4
CNSTF4 1137180672
DIVF4
SUBF4
ASGNF4
line 461
;461:      if( ratio > 0 )
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $525
line 462
;462:      {
line 463
;463:        angles[ PITCH ] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+115752
INDIRF4
MULF4
ADDF4
ASGNF4
line 464
;464:        angles[ ROLL ] += ratio * cg.v_dmg_roll;
ADDRLP4 96
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+115756
INDIRF4
MULF4
ADDF4
ASGNF4
line 465
;465:      }
LABELV $525
line 466
;466:    }
LABELV $522
line 467
;467:  }
LABELV $516
line 478
;468:
;469:  // add pitch based on fall kick
;470:#if 0
;471:  ratio = ( cg.time - cg.landTime) / FALL_TIME;
;472:  if (ratio < 0)
;473:    ratio = 0;
;474:  angles[PITCH] += ratio * cg.fall_value;
;475:#endif
;476:
;477:  // add angles based on velocity
;478:  VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 12
ADDRGP4 cg+107636+32
INDIRB
ASGNB 12
line 480
;479:
;480:  delta = DotProduct( predictedVelocity, cg.refdef.viewaxis[ 0 ] );
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRGP4 cg+110040+36
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+110040+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+110040+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 481
;481:  angles[ PITCH ] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 483
;482:
;483:  delta = DotProduct( predictedVelocity, cg.refdef.viewaxis[ 1 ] );
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRGP4 cg+110040+36+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+110040+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+110040+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 484
;484:  angles[ ROLL ] -= delta * cg_runroll.value;
ADDRLP4 96
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 489
;485:
;486:  // add angles based on bob
;487:  //TA: bob amount is class dependant
;488:
;489:  if( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $556
line 490
;490:    bob2 = 0.0f;
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRGP4 $557
JUMPV
LABELV $556
line 492
;491:  else
;492:    bob2 = BG_FindBobForClass( cg.predictedPlayerState.stats[ STAT_PCLASS ] );
ADDRGP4 cg+107636+184+28
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_FindBobForClass
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 100
INDIRF4
ASGNF4
LABELV $557
line 498
;493:
;494:
;495:#define LEVEL4_FEEDBACK  10.0f
;496:
;497:  //give a charging player some feedback
;498:  if( ps->weapon == WP_ALEVEL4 )
ADDRLP4 24
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 29
NEI4 $562
line 499
;499:  {
line 500
;500:    if( ps->stats[ STAT_MISC ] > 0 )
ADDRLP4 24
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $564
line 501
;501:    {
line 502
;502:      float fraction = (float)ps->stats[ STAT_MISC ] / (float)LEVEL4_CHARGE_TIME;
ADDRLP4 104
ADDRLP4 24
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1161527296
DIVF4
ASGNF4
line 504
;503:
;504:      if( fraction > 1.0f )
ADDRLP4 104
INDIRF4
CNSTF4 1065353216
LEF4 $566
line 505
;505:        fraction = 1.0f;
ADDRLP4 104
CNSTF4 1065353216
ASGNF4
LABELV $566
line 507
;506:
;507:      bob2 *= ( 1.0f + fraction * LEVEL4_FEEDBACK );
ADDRLP4 40
ADDRLP4 40
INDIRF4
CNSTF4 1092616192
ADDRLP4 104
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 508
;508:    }
LABELV $564
line 509
;509:  }
LABELV $562
line 511
;510:
;511:  if( bob2 != 0.0f )
ADDRLP4 40
INDIRF4
CNSTF4 0
EQF4 $568
line 512
;512:  {
line 514
;513:    // make sure the bob is visible even at low speeds
;514:    speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+115792
INDIRF4
CNSTF4 1128792064
LEF4 $573
ADDRLP4 104
ADDRGP4 cg+115792
INDIRF4
ASGNF4
ADDRGP4 $574
JUMPV
LABELV $573
ADDRLP4 104
CNSTF4 1128792064
ASGNF4
LABELV $574
ADDRLP4 56
ADDRLP4 104
INDIRF4
ASGNF4
line 516
;515:
;516:    delta = cg.bobfracsin * ( bob2 ) * speed;
ADDRLP4 8
ADDRGP4 cg+115784
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 517
;517:    if( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $576
line 518
;518:      delta *= 3;   // crouching
ADDRLP4 8
CNSTF4 1077936128
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
LABELV $576
line 520
;519:
;520:    angles[ PITCH ] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 521
;521:    delta = cg.bobfracsin * ( bob2 ) * speed;
ADDRLP4 8
ADDRGP4 cg+115784
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 522
;522:    if( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $581
line 523
;523:      delta *= 3;   // crouching accentuates roll
ADDRLP4 8
CNSTF4 1077936128
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
LABELV $581
line 525
;524:
;525:    if( cg.bobcycle & 1 )
ADDRGP4 cg+115788
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $585
line 526
;526:      delta = -delta;
ADDRLP4 8
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $585
line 528
;527:
;528:    angles[ ROLL ] += delta;
ADDRLP4 112
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 529
;529:  }
LABELV $568
line 534
;530:
;531:#define LEVEL3_FEEDBACK  20.0f
;532:
;533:  //provide some feedback for pouncing
;534:  if( cg.predictedPlayerState.weapon == WP_ALEVEL3 ||
ADDRGP4 cg+107636+144
INDIRI4
CNSTI4 27
EQI4 $594
ADDRGP4 cg+107636+144
INDIRI4
CNSTI4 28
NEI4 $588
LABELV $594
line 536
;535:      cg.predictedPlayerState.weapon == WP_ALEVEL3_UPG )
;536:  {
line 537
;537:    if( cg.predictedPlayerState.stats[ STAT_MISC ] > 0 )
ADDRGP4 cg+107636+184+44
INDIRI4
CNSTI4 0
LEI4 $595
line 538
;538:    {
line 542
;539:      float   fraction1, fraction2;
;540:      vec3_t  forward;
;541:
;542:      AngleVectors( angles, forward, NULL, NULL );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 104
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
ADDRGP4 AngleVectors
CALLV
pop
line 543
;543:      VectorNormalize( forward );
ADDRLP4 104
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 545
;544:
;545:      fraction1 = (float)( cg.time - cg.weapon2Time ) / (float)LEVEL3_POUNCE_CHARGE_TIME;
ADDRLP4 120
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+116220
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1143930880
DIVF4
ASGNF4
line 547
;546:
;547:      if( fraction1 > 1.0f )
ADDRLP4 120
INDIRF4
CNSTF4 1065353216
LEF4 $602
line 548
;548:        fraction1 = 1.0f;
ADDRLP4 120
CNSTF4 1065353216
ASGNF4
LABELV $602
line 550
;549:
;550:      fraction2 = -sin( fraction1 * M_PI / 2 );
CNSTF4 1078530011
ADDRLP4 120
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 128
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 116
ADDRLP4 128
INDIRF4
NEGF4
ASGNF4
line 552
;551:
;552:      VectorMA( origin, LEVEL3_FEEDBACK * fraction2, forward, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 104
INDIRF4
CNSTF4 1101004800
ADDRLP4 116
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 104+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 116
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 104+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 116
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 553
;553:    }
LABELV $595
line 554
;554:  }
LABELV $588
line 560
;555:
;556:#define STRUGGLE_DIST 5.0f
;557:#define STRUGGLE_TIME 250
;558:
;559:  //allow the player to struggle a little whilst grabbed
;560:  if( cg.predictedPlayerState.pm_type == PM_GRABBED )
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 4
NEI4 $606
line 561
;561:  {
line 568
;562:    vec3_t    forward, right, up;
;563:    usercmd_t cmd;
;564:    int       cmdNum;
;565:    float     fFraction, rFraction, uFraction;
;566:    float     fFraction2, rFraction2, uFraction2;
;567:
;568:    cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 192
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 192
INDIRI4
ASGNI4
line 569
;569:    trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 116
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 571
;570:
;571:    AngleVectors( angles, forward, right, up );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 573
;572:
;573:    fFraction = (float)( cg.time - cg.forwardMoveTime ) / STRUGGLE_TIME;
ADDRLP4 104
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117036
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 574
;574:    rFraction = (float)( cg.time - cg.rightMoveTime ) / STRUGGLE_TIME;
ADDRLP4 108
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117040
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 575
;575:    uFraction = (float)( cg.time - cg.upMoveTime ) / STRUGGLE_TIME;
ADDRLP4 112
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117044
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 577
;576:
;577:    if( fFraction > 1.0f )
ADDRLP4 104
INDIRF4
CNSTF4 1065353216
LEF4 $616
line 578
;578:      fFraction = 1.0f;
ADDRLP4 104
CNSTF4 1065353216
ASGNF4
LABELV $616
line 579
;579:    if( rFraction > 1.0f )
ADDRLP4 108
INDIRF4
CNSTF4 1065353216
LEF4 $618
line 580
;580:      rFraction = 1.0f;
ADDRLP4 108
CNSTF4 1065353216
ASGNF4
LABELV $618
line 581
;581:    if( uFraction > 1.0f )
ADDRLP4 112
INDIRF4
CNSTF4 1065353216
LEF4 $620
line 582
;582:      uFraction = 1.0f;
ADDRLP4 112
CNSTF4 1065353216
ASGNF4
LABELV $620
line 584
;583:
;584:    fFraction2 = -sin( fFraction * M_PI / 2 );
CNSTF4 1078530011
ADDRLP4 104
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 196
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 180
ADDRLP4 196
INDIRF4
NEGF4
ASGNF4
line 585
;585:    rFraction2 = -sin( rFraction * M_PI / 2 );
CNSTF4 1078530011
ADDRLP4 108
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 200
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 184
ADDRLP4 200
INDIRF4
NEGF4
ASGNF4
line 586
;586:    uFraction2 = -sin( uFraction * M_PI / 2 );
CNSTF4 1078530011
ADDRLP4 112
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 204
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 188
ADDRLP4 204
INDIRF4
NEGF4
ASGNF4
line 588
;587:
;588:    if( cmd.forwardmove > 0 )
ADDRLP4 116+21
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $622
line 589
;589:      VectorMA( origin, STRUGGLE_DIST * fFraction, forward, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 140
INDIRF4
CNSTF4 1084227584
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 212
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
ADDRLP4 212
INDIRP4
INDIRF4
ADDRLP4 140+4
INDIRF4
CNSTF4 1084227584
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRF4
ADDRLP4 140+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $623
JUMPV
LABELV $622
line 590
;590:    else if( cmd.forwardmove < 0 )
ADDRLP4 116+21
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $627
line 591
;591:      VectorMA( origin, -STRUGGLE_DIST * fFraction, forward, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 140
INDIRF4
CNSTF4 3231711232
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 224
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 140+4
INDIRF4
CNSTF4 3231711232
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 228
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 140+8
INDIRF4
CNSTF4 3231711232
ADDRLP4 104
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $628
JUMPV
LABELV $627
line 593
;592:    else
;593:      cg.forwardMoveTime = cg.time;
ADDRGP4 cg+117036
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $628
LABELV $623
line 595
;594:
;595:    if( cmd.rightmove > 0 )
ADDRLP4 116+22
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $634
line 596
;596:      VectorMA( origin, STRUGGLE_DIST * rFraction, right, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 1084227584
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 236
INDIRP4
ADDRLP4 236
INDIRP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 1084227584
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
ADDRLP4 240
INDIRP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $635
JUMPV
LABELV $634
line 597
;597:    else if( cmd.rightmove < 0 )
ADDRLP4 116+22
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $639
line 598
;598:      VectorMA( origin, -STRUGGLE_DIST * rFraction, right, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 3231711232
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 3231711232
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 3231711232
ADDRLP4 108
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $640
JUMPV
LABELV $639
line 600
;599:    else
;600:      cg.rightMoveTime = cg.time;
ADDRGP4 cg+117040
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $640
LABELV $635
line 602
;601:
;602:    if( cmd.upmove > 0 )
ADDRLP4 116+23
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $646
line 603
;603:      VectorMA( origin, STRUGGLE_DIST * uFraction, up, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 1084227584
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRF4
ADDRLP4 164+4
INDIRF4
CNSTF4 1084227584
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRF4
ADDRLP4 164+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $647
JUMPV
LABELV $646
line 604
;604:    else if( cmd.upmove < 0 )
ADDRLP4 116+23
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $651
line 605
;605:      VectorMA( origin, -STRUGGLE_DIST * uFraction, up, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 3231711232
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRF4
ADDRLP4 164+4
INDIRF4
CNSTF4 3231711232
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 276
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRF4
ADDRLP4 164+8
INDIRF4
CNSTF4 3231711232
ADDRLP4 112
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $652
JUMPV
LABELV $651
line 607
;606:    else
;607:      cg.upMoveTime = cg.time;
ADDRGP4 cg+117044
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $652
LABELV $647
line 608
;608:  }
LABELV $606
line 610
;609:
;610:  if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_POISONCLOUDED &&
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 104
INDIRI4
EQI4 $658
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 104
INDIRI4
NEI4 $658
line 612
;611:      !( cg.snap->ps.pm_flags & PMF_FOLLOW ) )
;612:  {
line 613
;613:    float fraction = sin( ( (float)cg.time / 1000.0f ) * M_PI * 2 * PCLOUD_ROLL_FREQUENCY );
CNSTF4 1053609165
CNSTF4 1073741824
CNSTF4 1078530011
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ARGF4
ADDRLP4 116
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 116
INDIRF4
ASGNF4
line 614
;614:    float pitchFraction = sin( ( (float)cg.time / 1000.0f ) * M_PI * 5 * PCLOUD_ROLL_FREQUENCY );
CNSTF4 1053609165
CNSTF4 1084227584
CNSTF4 1078530011
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ARGF4
ADDRLP4 120
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 112
ADDRLP4 120
INDIRF4
ASGNF4
line 616
;615:
;616:    fraction *= 1.0f - ( ( cg.time - cg.poisonedTime ) / (float)LEVEL1_PCLOUD_TIME );
ADDRLP4 108
ADDRLP4 108
INDIRF4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+116240
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1176256512
DIVF4
SUBF4
MULF4
ASGNF4
line 617
;617:    pitchFraction *= 1.0f - ( ( cg.time - cg.poisonedTime ) / (float)LEVEL1_PCLOUD_TIME );
ADDRLP4 112
ADDRLP4 112
INDIRF4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+116240
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1176256512
DIVF4
SUBF4
MULF4
ASGNF4
line 619
;618:
;619:    angles[ ROLL ] += fraction * PCLOUD_ROLL_AMPLITUDE;
ADDRLP4 124
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1103626240
ADDRLP4 108
INDIRF4
MULF4
ADDF4
ASGNF4
line 620
;620:    angles[ YAW ] += fraction * PCLOUD_ROLL_AMPLITUDE;
ADDRLP4 128
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1103626240
ADDRLP4 108
INDIRF4
MULF4
ADDF4
ASGNF4
line 621
;621:    angles[ PITCH ] += pitchFraction * PCLOUD_ROLL_AMPLITUDE / 2.0f;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1103626240
ADDRLP4 112
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 622
;622:  }
LABELV $658
line 625
;623:
;624:  //TA: this *feels* more realisitic for humans
;625:  if( cg.predictedPlayerState.stats[ STAT_PTEAM ] == PTE_HUMANS )
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 2
NEI4 $670
line 626
;626:  {
line 627
;627:    angles[PITCH] += cg.bobfracsin * bob2 * 0.5;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1056964608
ADDRGP4 cg+115784
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 630
;628:
;629:    //TA: heavy breathing effects //FIXME: sound
;630:    if( cg.predictedPlayerState.stats[ STAT_STAMINA ] < 0 )
ADDRGP4 cg+107636+184+36
INDIRI4
CNSTI4 0
GEI4 $676
line 631
;631:    {
line 632
;632:      float deltaBreath = (float)(
ADDRGP4 cg+107636+184+36
INDIRI4
CNSTI4 0
GEI4 $691
ADDRLP4 120
ADDRGP4 cg+107636+184+36
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $691
ADDRLP4 120
ADDRGP4 cg+107636+184+36
INDIRI4
ASGNI4
LABELV $692
ADDRLP4 116
ADDRLP4 120
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
ASGNF4
line 636
;633:        cg.predictedPlayerState.stats[ STAT_STAMINA ] < 0 ?
;634:        -cg.predictedPlayerState.stats[ STAT_STAMINA ] :
;635:        cg.predictedPlayerState.stats[ STAT_STAMINA ] ) / 200.0;
;636:      float deltaAngle = cos( (float)cg.time/150.0 ) * deltaBreath;
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1125515264
DIVF4
ARGF4
ADDRLP4 124
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 112
ADDRLP4 124
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ASGNF4
line 638
;637:
;638:      deltaAngle += ( deltaAngle < 0 ? -deltaAngle : deltaAngle ) * 0.5;
ADDRLP4 132
ADDRLP4 112
INDIRF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 0
GEF4 $695
ADDRLP4 128
ADDRLP4 112
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $696
JUMPV
LABELV $695
ADDRLP4 128
ADDRLP4 112
INDIRF4
ASGNF4
LABELV $696
ADDRLP4 112
ADDRLP4 132
INDIRF4
CNSTF4 1056964608
ADDRLP4 128
INDIRF4
MULF4
ADDF4
ASGNF4
line 640
;639:
;640:      angles[ PITCH ] -= deltaAngle;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 112
INDIRF4
SUBF4
ASGNF4
line 641
;641:    }
LABELV $676
line 642
;642:  }
LABELV $670
line 648
;643:
;644://===================================
;645:
;646:  // add view height
;647:  //TA: when wall climbing the viewheight is not straight up
;648:  if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $697
line 649
;649:    VectorMA( origin, ps->viewheight, normal, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $698
JUMPV
LABELV $697
line 651
;650:  else
;651:    origin[ 2 ] += cg.predictedPlayerState.viewheight;
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
LABELV $698
line 654
;652:
;653:  // smooth out duck height changes
;654:  timeDelta = cg.time - cg.duckTime;
ADDRLP4 52
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109928
INDIRI4
SUBI4
ASGNI4
line 655
;655:  if( timeDelta < DUCK_TIME)
ADDRLP4 52
INDIRI4
CNSTI4 100
GEI4 $708
line 656
;656:  {
line 657
;657:    cg.refdef.vieworg[ 2 ] -= cg.duckChange
ADDRLP4 124
ADDRGP4 cg+110040+24+8
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRGP4 cg+109924
INDIRF4
CNSTI4 100
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
ASGNF4
line 659
;658:      * ( DUCK_TIME - timeDelta ) / DUCK_TIME;
;659:  }
LABELV $708
line 662
;660:
;661:  // add bob height
;662:  bob = cg.bobfracsin * cg.xyspeed * bob2;
ADDRLP4 44
ADDRGP4 cg+115784
INDIRF4
ADDRGP4 cg+115792
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 664
;663:
;664:  if( bob > 6 )
ADDRLP4 44
INDIRF4
CNSTF4 1086324736
LEF4 $716
line 665
;665:    bob = 6;
ADDRLP4 44
CNSTF4 1086324736
ASGNF4
LABELV $716
line 668
;666:
;667:  //TA: likewise for bob
;668:  if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $718
line 669
;669:    VectorMA( origin, bob, normal, origin );
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $719
JUMPV
LABELV $718
line 671
;670:  else
;671:    origin[ 2 ] += bob;
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDF4
ASGNF4
LABELV $719
line 675
;672:
;673:
;674:  // add fall height
;675:  delta = cg.time - cg.landTime;
ADDRLP4 8
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109936
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 677
;676:
;677:  if( delta < LAND_DEFLECT_TIME )
ADDRLP4 8
INDIRF4
CNSTF4 1125515264
GEF4 $727
line 678
;678:  {
line 679
;679:    f = delta / LAND_DEFLECT_TIME;
ADDRLP4 60
ADDRLP4 8
INDIRF4
CNSTF4 1125515264
DIVF4
ASGNF4
line 680
;680:    cg.refdef.vieworg[ 2 ] += cg.landChange * f;
ADDRLP4 140
ADDRGP4 cg+110040+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+109932
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ASGNF4
line 681
;681:  }
ADDRGP4 $728
JUMPV
LABELV $727
line 682
;682:  else if( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME )
ADDRLP4 8
INDIRF4
CNSTF4 1138819072
GEF4 $733
line 683
;683:  {
line 684
;684:    delta -= LAND_DEFLECT_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 685
;685:    f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 60
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
CNSTF4 1133903872
DIVF4
SUBF4
ASGNF4
line 686
;686:    cg.refdef.vieworg[ 2 ] += cg.landChange * f;
ADDRLP4 140
ADDRGP4 cg+110040+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+109932
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ASGNF4
line 687
;687:  }
LABELV $733
LABELV $728
line 690
;688:
;689:  // add step offset
;690:  CG_StepOffset( );
ADDRGP4 CG_StepOffset
CALLV
pop
line 694
;691:
;692:  // add kick offset
;693:
;694:  VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cg+115772
INDIRF4
ADDF4
ASGNF4
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRGP4 cg+115772+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRGP4 cg+115772+8
INDIRF4
ADDF4
ASGNF4
line 695
;695:}
LABELV $489
endproc CG_OffsetFirstPersonView 280 16
proc CG_CalcFov 96 8
line 711
;696:
;697://======================================================================
;698:/*
;699:====================
;700:CG_CalcFov
;701:
;702:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;703:====================
;704:*/
;705:#define WAVE_AMPLITUDE  1
;706:#define WAVE_FREQUENCY  0.4
;707:
;708:#define FOVWARPTIME     400.0
;709:
;710:static int CG_CalcFov( void )
;711:{
line 723
;712:  float x;
;713:  float phase;
;714:  float v;
;715:  int   contents;
;716:  float fov_x, fov_y;
;717:  float zoomFov;
;718:  float f;
;719:  int   inwater;
;720:  int   attribFov;
;721:  usercmd_t cmd;
;722:  int       cmdNum;
;723:	playerState_t *ps = &cg.predictedPlayerState;
ADDRLP4 64
ADDRGP4 cg+107636
ASGNP4
line 725
;724:  
;725:	cmdNum = trap_GetCurrentCmdNumber( );
ADDRLP4 72
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 726
;726:  trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 729
;727:
;728:
;729:  if( cg.predictedPlayerState.pm_type == PM_INTERMISSION ||
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 7
EQI4 $751
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $746
LABELV $751
line 731
;730:      ( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) )
;731:  {
line 733
;732:    // if in intermission, use a fixed value
;733:    fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 734
;734:  }
ADDRGP4 $747
JUMPV
LABELV $746
line 736
;735:  else
;736:  {
line 738
;737:    //TA: don't lock the fov globally - we need to be able to change it
;738:    attribFov = BG_FindFovForClass( cg.predictedPlayerState.stats[ STAT_PCLASS ] );
ADDRGP4 cg+107636+184+28
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FindFovForClass
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 76
INDIRI4
ASGNI4
line 739
;739:    fov_x = attribFov;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 741
;740:
;741:    if ( fov_x < 1 )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $755
line 742
;742:      fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
ADDRGP4 $756
JUMPV
LABELV $755
line 743
;743:    else if ( fov_x > 160 )
ADDRLP4 0
INDIRF4
CNSTF4 1126170624
LEF4 $757
line 744
;744:      fov_x = 160;
ADDRLP4 0
CNSTF4 1126170624
ASGNF4
LABELV $757
LABELV $756
line 746
;745:
;746:    if( cg.spawnTime > ( cg.time - FOVWARPTIME ) &&
ADDRGP4 cg+116212
INDIRI4
CVIF4 4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1137180672
SUBF4
LEF4 $759
ADDRGP4 cg+107636+184+28
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 80
ADDRGP4 BG_ClassHasAbility
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $759
line 748
;747:        BG_ClassHasAbility( cg.predictedPlayerState.stats[ STAT_PCLASS ], SCA_FOVWARPS ) )
;748:    {
line 751
;749:      float temp, temp2;
;750:
;751:      temp = (float)( cg.time - cg.spawnTime ) / FOVWARPTIME;
ADDRLP4 84
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+116212
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1137180672
DIVF4
ASGNF4
line 752
;752:      temp2 = ( 170 - fov_x ) * temp;
ADDRLP4 88
CNSTF4 1126825984
ADDRLP4 0
INDIRF4
SUBF4
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
line 756
;753:
;754:      //Com_Printf( "%f %f\n", temp*100, temp2*100 );
;755:
;756:      fov_x = 170 - temp2;
ADDRLP4 0
CNSTF4 1126825984
ADDRLP4 88
INDIRF4
SUBF4
ASGNF4
line 757
;757:    }
LABELV $759
line 760
;758:
;759:    // account for zooms
;760:    zoomFov = BG_FindZoomFovForWeapon( cg.predictedPlayerState.weapon );
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_FindZoomFovForWeapon
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 84
INDIRF4
ASGNF4
line 761
;761:    if ( zoomFov < 1 )
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
GEF4 $770
line 762
;762:      zoomFov = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
ADDRGP4 $771
JUMPV
LABELV $770
line 763
;763:    else if ( zoomFov > attribFov )
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
LEF4 $772
line 764
;764:      zoomFov = attribFov;
ADDRLP4 32
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
LABELV $772
LABELV $771
line 767
;765:
;766:    //TA: only do all the zoom stuff if the client CAN zoom
;767:    if( BG_WeaponCanZoom( cg.predictedPlayerState.weapon ) )
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponCanZoom
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $774
line 768
;768:    {
line 769
;769:      if ( cg.zoomed )
ADDRGP4 cg+110420
INDIRI4
CNSTI4 0
EQI4 $778
line 770
;770:      {
line 771
;771:        f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 68
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+110424
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1125515264
DIVF4
ASGNF4
line 773
;772:
;773:        if ( f > 1.0 )
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
LEF4 $783
line 774
;774:          fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 32
INDIRF4
ASGNF4
ADDRGP4 $784
JUMPV
LABELV $783
line 776
;775:        else
;776:          fov_x = fov_x + f * ( zoomFov - fov_x );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $784
line 778
;777:					  // BUTTON_ATTACK2 isn't held so unzoom next time
;778: 	  	         if( !( cmd.buttons & BUTTON_ATTACK2 ) )
ADDRLP4 40+16
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $779
line 779
;779: 	  	         {
line 780
;780: 	  	           cg.zoomed   = qfalse;
ADDRGP4 cg+110420
CNSTI4 0
ASGNI4
line 781
;781: 	  	           cg.zoomTime = cg.time;
ADDRGP4 cg+110424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 786
;782:								 /*if(ps->weapon == WP_MASS_DRIVER)
;783:									{
;784:										cg_thirdPersonhax.integer = 1;
;785:									}*/
;786: 	  	         }
line 787
;787:      }
ADDRGP4 $779
JUMPV
LABELV $778
line 789
;788:      else
;789:      {
line 790
;790:        f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 68
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+110424
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1125515264
DIVF4
ASGNF4
line 792
;791:
;792:        if ( f > 1.0 )
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
LEF4 $793
line 793
;793:          fov_x = fov_x;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ASGNF4
ADDRGP4 $794
JUMPV
LABELV $793
line 795
;794:        else
;795:          fov_x = zoomFov + f * ( fov_x - zoomFov );
ADDRLP4 92
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $794
line 797
;796:					  // BUTTON_ATTACK2 is held so zoom next time
;797: 	  	         if( cmd.buttons & BUTTON_ATTACK2 )
ADDRLP4 40+16
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $795
line 798
;798: 	  	         {
line 799
;799: 	  	           cg.zoomed   = qtrue;
ADDRGP4 cg+110420
CNSTI4 1
ASGNI4
line 800
;800: 	  	           cg.zoomTime = cg.time;
ADDRGP4 cg+110424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 801
;801:								 if(ps->weapon == WP_MASS_DRIVER)
ADDRLP4 64
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 5
NEI4 $801
line 802
;802:								 {
line 803
;803:										cg_thirdPersonhax.integer = 0;
ADDRGP4 cg_thirdPersonhax+12
CNSTI4 0
ASGNI4
line 804
;804:								 }
LABELV $801
line 805
;805: 	  	         }
LABELV $795
line 806
;806:      }
LABELV $779
line 807
;807:    }
LABELV $774
line 808
;808:  }
LABELV $747
line 810
;809:
;810:  x = cg.refdef.width / tan( fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 76
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 12
ADDRGP4 cg+110040+8
INDIRI4
CVIF4 4
ADDRLP4 76
INDIRF4
DIVF4
ASGNF4
line 811
;811:  fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+110040+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 80
INDIRF4
ASGNF4
line 812
;812:  fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 815
;813:
;814:  // warp if underwater
;815:  contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+110040+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 84
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 817
;816:
;817:  if( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) )
ADDRLP4 20
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $810
line 818
;818:  {
line 819
;819:    phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 16
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 820
;820:    v = WAVE_AMPLITUDE * sin( phase );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
CNSTF4 1065353216
ADDRLP4 88
INDIRF4
MULF4
ASGNF4
line 821
;821:    fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 822
;822:    fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 823
;823:    inwater = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 824
;824:  }
ADDRGP4 $811
JUMPV
LABELV $810
line 826
;825:  else
;826:    inwater = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $811
line 828
;827:
;828:  if( cg.predictedPlayerState.stats[ STAT_STATE ] & SS_POISONCLOUDED &&
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+184+40
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $813
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $813
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $813
line 831
;829:      cg.predictedPlayerState.stats[ STAT_HEALTH ] > 0 &&
;830:      !( cg.snap->ps.pm_flags & PMF_FOLLOW ) )
;831:  {
line 832
;832:    phase = cg.time / 1000.0 * PCLOUD_ZOOM_FREQUENCY * M_PI * 2;
ADDRLP4 16
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1060320051
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 833
;833:    v = PCLOUD_ZOOM_AMPLITUDE * sin( phase );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
CNSTF4 1097859072
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 834
;834:    v *= 1.0f - ( ( cg.time - cg.poisonedTime ) / (float)LEVEL1_PCLOUD_TIME );
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+116240
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1176256512
DIVF4
SUBF4
MULF4
ASGNF4
line 835
;835:    fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 836
;836:    fov_y += v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 837
;837:  }
LABELV $813
line 841
;838:
;839:
;840:  // set it
;841:  cg.refdef.fov_x = fov_x;
ADDRGP4 cg+110040+16
ADDRLP4 0
INDIRF4
ASGNF4
line 842
;842:  cg.refdef.fov_y = fov_y;
ADDRGP4 cg+110040+20
ADDRLP4 4
INDIRF4
ASGNF4
line 844
;843:
;844:  if( !cg.zoomed )
ADDRGP4 cg+110420
INDIRI4
CNSTI4 0
NEI4 $828
line 845
;845:    cg.zoomSensitivity = 1;
ADDRGP4 cg+110428
CNSTF4 1065353216
ASGNF4
ADDRGP4 $829
JUMPV
LABELV $828
line 847
;846:  else
;847:    cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+110428
ADDRGP4 cg+110040+20
INDIRF4
CNSTF4 1117126656
DIVF4
ASGNF4
LABELV $829
line 849
;848:
;849:  return inwater;
ADDRLP4 24
INDIRI4
RETI4
LABELV $744
endproc CG_CalcFov 96 8
lit
align 4
LABELV $836
byte 4 0
byte 4 1132396544
byte 4 0
byte 4 1124073472
code
proc CG_DrawSurfNormal 412 28
line 866
;850:}
;851:
;852:
;853:
;854:#define NORMAL_HEIGHT 64.0f
;855:#define NORMAL_WIDTH  6.0f
;856:
;857:/*
;858:===============
;859:CG_DrawSurfNormal
;860:
;861:Draws a vector against
;862:the surface player is looking at
;863:===============
;864:*/
;865:static void CG_DrawSurfNormal( void )
;866:{
line 870
;867:  trace_t     tr;
;868:  vec3_t      end, temp;
;869:  polyVert_t  normal[ 4 ];
;870:  vec4_t      color = { 0.0f, 255.0f, 0.0f, 128.0f };
ADDRLP4 168
ADDRGP4 $836
INDIRB
ASGNB 16
line 872
;871:
;872:  VectorMA( cg.refdef.vieworg, 8192, cg.refdef.viewaxis[ 0 ], end );
ADDRLP4 196
CNSTF4 1174405120
ASGNF4
ADDRLP4 184
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 196
INDIRF4
ADDRGP4 cg+110040+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 184+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 196
INDIRF4
ADDRGP4 cg+110040+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 184+8
ADDRGP4 cg+110040+24+8
INDIRF4
CNSTF4 1174405120
ADDRGP4 cg+110040+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 874
;873:
;874:  CG_Trace( &tr, cg.refdef.vieworg, NULL, NULL, end, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 108
ARGP4
ADDRGP4 cg+110040+24
ARGP4
ADDRLP4 200
CNSTP4 0
ASGNP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 184
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 876
;875:
;876:  VectorCopy( tr.endpos, normal[ 0 ].xyz );
ADDRLP4 0
ADDRLP4 108+12
INDIRB
ASGNB 12
line 877
;877:  normal[ 0 ].st[ 0 ] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 878
;878:  normal[ 0 ].st[ 1 ] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 879
;879:  Vector4Copy( color, normal[ 0 ].modulate );
ADDRLP4 220
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 224
CNSTF4 1325400064
ASGNF4
ADDRLP4 220
INDIRF4
ADDRLP4 224
INDIRF4
LTF4 $877
ADDRLP4 204
ADDRLP4 220
INDIRF4
ADDRLP4 224
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 204
ADDRLP4 220
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $878
ADDRLP4 0+20
ADDRLP4 204
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 228
ADDRLP4 168+4
INDIRF4
ASGNF4
ADDRLP4 232
CNSTF4 1325400064
ASGNF4
ADDRLP4 228
INDIRF4
ADDRLP4 232
INDIRF4
LTF4 $879
ADDRLP4 208
ADDRLP4 228
INDIRF4
ADDRLP4 232
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $880
JUMPV
LABELV $879
ADDRLP4 208
ADDRLP4 228
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $880
ADDRLP4 0+20+1
ADDRLP4 208
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 236
ADDRLP4 168+8
INDIRF4
ASGNF4
ADDRLP4 240
CNSTF4 1325400064
ASGNF4
ADDRLP4 236
INDIRF4
ADDRLP4 240
INDIRF4
LTF4 $881
ADDRLP4 212
ADDRLP4 236
INDIRF4
ADDRLP4 240
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $882
JUMPV
LABELV $881
ADDRLP4 212
ADDRLP4 236
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $882
ADDRLP4 0+20+2
ADDRLP4 212
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 244
ADDRLP4 168+12
INDIRF4
ASGNF4
ADDRLP4 248
CNSTF4 1325400064
ASGNF4
ADDRLP4 244
INDIRF4
ADDRLP4 248
INDIRF4
LTF4 $883
ADDRLP4 216
ADDRLP4 244
INDIRF4
ADDRLP4 248
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $884
JUMPV
LABELV $883
ADDRLP4 216
ADDRLP4 244
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $884
ADDRLP4 0+20+3
ADDRLP4 216
INDIRU4
CVUU1 4
ASGNU1
line 881
;880:
;881:  VectorMA( tr.endpos, NORMAL_WIDTH, cg.refdef.viewaxis[ 1 ], temp );
ADDRLP4 252
CNSTF4 1086324736
ASGNF4
ADDRLP4 96
ADDRLP4 108+12
INDIRF4
ADDRLP4 252
INDIRF4
ADDRGP4 cg+110040+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 108+12+4
INDIRF4
ADDRLP4 252
INDIRF4
ADDRGP4 cg+110040+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 108+12+8
INDIRF4
CNSTF4 1086324736
ADDRGP4 cg+110040+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 882
;882:  VectorCopy( temp, normal[ 1 ].xyz);
ADDRLP4 0+24
ADDRLP4 96
INDIRB
ASGNB 12
line 883
;883:  normal[ 1 ].st[ 0 ] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 884
;884:  normal[ 1 ].st[ 1 ] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 885
;885:  Vector4Copy( color, normal[ 1 ].modulate );
ADDRLP4 272
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 276
CNSTF4 1325400064
ASGNF4
ADDRLP4 272
INDIRF4
ADDRLP4 276
INDIRF4
LTF4 $927
ADDRLP4 256
ADDRLP4 272
INDIRF4
ADDRLP4 276
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 256
ADDRLP4 272
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $928
ADDRLP4 0+24+20
ADDRLP4 256
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 280
ADDRLP4 168+4
INDIRF4
ASGNF4
ADDRLP4 284
CNSTF4 1325400064
ASGNF4
ADDRLP4 280
INDIRF4
ADDRLP4 284
INDIRF4
LTF4 $929
ADDRLP4 260
ADDRLP4 280
INDIRF4
ADDRLP4 284
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $930
JUMPV
LABELV $929
ADDRLP4 260
ADDRLP4 280
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $930
ADDRLP4 0+24+20+1
ADDRLP4 260
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 288
ADDRLP4 168+8
INDIRF4
ASGNF4
ADDRLP4 292
CNSTF4 1325400064
ASGNF4
ADDRLP4 288
INDIRF4
ADDRLP4 292
INDIRF4
LTF4 $931
ADDRLP4 264
ADDRLP4 288
INDIRF4
ADDRLP4 292
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $932
JUMPV
LABELV $931
ADDRLP4 264
ADDRLP4 288
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $932
ADDRLP4 0+24+20+2
ADDRLP4 264
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 296
ADDRLP4 168+12
INDIRF4
ASGNF4
ADDRLP4 300
CNSTF4 1325400064
ASGNF4
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
LTF4 $933
ADDRLP4 268
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $934
JUMPV
LABELV $933
ADDRLP4 268
ADDRLP4 296
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $934
ADDRLP4 0+24+20+3
ADDRLP4 268
INDIRU4
CVUU1 4
ASGNU1
line 887
;886:
;887:  VectorMA( tr.endpos, NORMAL_HEIGHT, tr.plane.normal, temp );
ADDRLP4 304
CNSTF4 1115684864
ASGNF4
ADDRLP4 96
ADDRLP4 108+12
INDIRF4
ADDRLP4 304
INDIRF4
ADDRLP4 108+24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 108+12+4
INDIRF4
ADDRLP4 304
INDIRF4
ADDRLP4 108+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 108+12+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 108+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 888
;888:  VectorMA( temp, NORMAL_WIDTH, cg.refdef.viewaxis[ 1 ], temp );
ADDRLP4 308
CNSTF4 1086324736
ASGNF4
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 308
INDIRF4
ADDRGP4 cg+110040+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 308
INDIRF4
ADDRGP4 cg+110040+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
CNSTF4 1086324736
ADDRGP4 cg+110040+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 889
;889:  VectorCopy( temp, normal[ 2 ].xyz );
ADDRLP4 0+48
ADDRLP4 96
INDIRB
ASGNB 12
line 890
;890:  normal[ 2 ].st[ 0 ] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 891
;891:  normal[ 2 ].st[ 1 ] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 892
;892:  Vector4Copy( color, normal[ 2 ].modulate );
ADDRLP4 328
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 332
CNSTF4 1325400064
ASGNF4
ADDRLP4 328
INDIRF4
ADDRLP4 332
INDIRF4
LTF4 $986
ADDRLP4 312
ADDRLP4 328
INDIRF4
ADDRLP4 332
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $987
JUMPV
LABELV $986
ADDRLP4 312
ADDRLP4 328
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $987
ADDRLP4 0+48+20
ADDRLP4 312
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 336
ADDRLP4 168+4
INDIRF4
ASGNF4
ADDRLP4 340
CNSTF4 1325400064
ASGNF4
ADDRLP4 336
INDIRF4
ADDRLP4 340
INDIRF4
LTF4 $988
ADDRLP4 316
ADDRLP4 336
INDIRF4
ADDRLP4 340
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $989
JUMPV
LABELV $988
ADDRLP4 316
ADDRLP4 336
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $989
ADDRLP4 0+48+20+1
ADDRLP4 316
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 344
ADDRLP4 168+8
INDIRF4
ASGNF4
ADDRLP4 348
CNSTF4 1325400064
ASGNF4
ADDRLP4 344
INDIRF4
ADDRLP4 348
INDIRF4
LTF4 $990
ADDRLP4 320
ADDRLP4 344
INDIRF4
ADDRLP4 348
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $991
JUMPV
LABELV $990
ADDRLP4 320
ADDRLP4 344
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $991
ADDRLP4 0+48+20+2
ADDRLP4 320
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 352
ADDRLP4 168+12
INDIRF4
ASGNF4
ADDRLP4 356
CNSTF4 1325400064
ASGNF4
ADDRLP4 352
INDIRF4
ADDRLP4 356
INDIRF4
LTF4 $992
ADDRLP4 324
ADDRLP4 352
INDIRF4
ADDRLP4 356
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $993
JUMPV
LABELV $992
ADDRLP4 324
ADDRLP4 352
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $993
ADDRLP4 0+48+20+3
ADDRLP4 324
INDIRU4
CVUU1 4
ASGNU1
line 894
;893:
;894:  VectorMA( tr.endpos, NORMAL_HEIGHT, tr.plane.normal, temp );
ADDRLP4 360
CNSTF4 1115684864
ASGNF4
ADDRLP4 96
ADDRLP4 108+12
INDIRF4
ADDRLP4 360
INDIRF4
ADDRLP4 108+24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 108+12+4
INDIRF4
ADDRLP4 360
INDIRF4
ADDRLP4 108+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 108+12+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 108+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 895
;895:  VectorCopy( temp, normal[ 3 ].xyz );
ADDRLP4 0+72
ADDRLP4 96
INDIRB
ASGNB 12
line 896
;896:  normal[ 3 ].st[ 0 ] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 897
;897:  normal[ 3 ].st[ 1 ] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 898
;898:  Vector4Copy( color, normal[ 3 ].modulate );
ADDRLP4 380
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 384
CNSTF4 1325400064
ASGNF4
ADDRLP4 380
INDIRF4
ADDRLP4 384
INDIRF4
LTF4 $1030
ADDRLP4 364
ADDRLP4 380
INDIRF4
ADDRLP4 384
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1031
JUMPV
LABELV $1030
ADDRLP4 364
ADDRLP4 380
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1031
ADDRLP4 0+72+20
ADDRLP4 364
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 388
ADDRLP4 168+4
INDIRF4
ASGNF4
ADDRLP4 392
CNSTF4 1325400064
ASGNF4
ADDRLP4 388
INDIRF4
ADDRLP4 392
INDIRF4
LTF4 $1032
ADDRLP4 368
ADDRLP4 388
INDIRF4
ADDRLP4 392
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1033
JUMPV
LABELV $1032
ADDRLP4 368
ADDRLP4 388
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1033
ADDRLP4 0+72+20+1
ADDRLP4 368
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 396
ADDRLP4 168+8
INDIRF4
ASGNF4
ADDRLP4 400
CNSTF4 1325400064
ASGNF4
ADDRLP4 396
INDIRF4
ADDRLP4 400
INDIRF4
LTF4 $1034
ADDRLP4 372
ADDRLP4 396
INDIRF4
ADDRLP4 400
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1035
JUMPV
LABELV $1034
ADDRLP4 372
ADDRLP4 396
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1035
ADDRLP4 0+72+20+2
ADDRLP4 372
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 404
ADDRLP4 168+12
INDIRF4
ASGNF4
ADDRLP4 408
CNSTF4 1325400064
ASGNF4
ADDRLP4 404
INDIRF4
ADDRLP4 408
INDIRF4
LTF4 $1036
ADDRLP4 376
ADDRLP4 404
INDIRF4
ADDRLP4 408
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1037
JUMPV
LABELV $1036
ADDRLP4 376
ADDRLP4 404
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1037
ADDRLP4 0+72+20+3
ADDRLP4 376
INDIRU4
CVUU1 4
ASGNU1
line 900
;899:
;900:  trap_R_AddPolyToScene( cgs.media.outlineShader, 4, normal );
ADDRGP4 cgs+268684+8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 901
;901:}
LABELV $835
endproc CG_DrawSurfNormal 412 28
export CG_addSmoothOp
proc CG_addSmoothOp 4 0
line 909
;902:
;903:/*
;904:===============
;905:CG_addSmoothOp
;906:===============
;907:*/
;908:void CG_addSmoothOp( vec3_t rotAxis, float rotAngle, float timeMod )
;909:{
line 913
;910:  int i;
;911:
;912:  //iterate through smooth array
;913:  for( i = 0; i < MAXSMOOTHS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1041
line 914
;914:  {
line 916
;915:    //found an unused index in the smooth array
;916:    if( cg.sList[ i ].time + cg_wwSmoothTime.integer < cg.time )
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
INDIRF4
ADDRGP4 cg_wwSmoothTime+12
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
GEF4 $1045
line 917
;917:    {
line 919
;918:      //copy to array and stop
;919:      VectorCopy( rotAxis, cg.sList[ i ].rotAxis );
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268+8
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 920
;920:      cg.sList[ i ].rotAngle = rotAngle;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268+20
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 921
;921:      cg.sList[ i ].time = cg.time;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ASGNF4
line 922
;922:      cg.sList[ i ].timeMod = timeMod;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268+4
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 923
;923:      return;
ADDRGP4 $1040
JUMPV
LABELV $1045
line 925
;924:    }
;925:  }
LABELV $1042
line 913
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1041
line 928
;926:
;927:  //no free indices in the smooth array
;928:}
LABELV $1040
endproc CG_addSmoothOp 4 0
lit
align 4
LABELV $1059
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $1060
byte 4 0
byte 4 0
byte 4 3212836864
code
proc CG_smoothWWTransitions 220 16
line 936
;929:
;930:/*
;931:===============
;932:CG_smoothWWTransitions
;933:===============
;934:*/
;935:static void CG_smoothWWTransitions( playerState_t *ps, const vec3_t in, vec3_t out )
;936:{
line 938
;937:  vec3_t    surfNormal, rotAxis, temp;
;938:  vec3_t    refNormal     = { 0.0f, 0.0f,  1.0f };
ADDRLP4 176
ADDRGP4 $1059
INDIRB
ASGNB 12
line 939
;939:  vec3_t    ceilingNormal = { 0.0f, 0.0f, -1.0f };
ADDRLP4 164
ADDRGP4 $1060
INDIRB
ASGNB 12
line 943
;940:  int       i;
;941:  float     stLocal, sFraction, rotAngle;
;942:  float     smoothTime, timeMod;
;943:  qboolean  performed = qfalse;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 946
;944:  vec3_t    inAxis[ 3 ], lastAxis[ 3 ], outAxis[ 3 ];
;945:
;946:  if( cg.snap->ps.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1061
line 947
;947:  {
line 948
;948:    VectorCopy( in, out );
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 949
;949:    return;
ADDRGP4 $1058
JUMPV
LABELV $1061
line 953
;950:  }
;951:
;952:  //set surfNormal
;953:  if( !( ps->stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING ) )
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1064
line 954
;954:    VectorCopy( ps->grapplePoint, surfNormal );
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
ADDRGP4 $1065
JUMPV
LABELV $1064
line 956
;955:  else
;956:    VectorCopy( ceilingNormal, surfNormal );
ADDRLP4 104
ADDRLP4 164
INDIRB
ASGNB 12
LABELV $1065
line 958
;957:
;958:  AnglesToAxis( in, inAxis );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 961
;959:
;960:  //if we are moving from one surface to another smooth the transition
;961:  if( !VectorCompare( surfNormal, cg.lastNormal ) )
ADDRLP4 104
ARGP4
ADDRGP4 cg+116244
ARGP4
ADDRLP4 196
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $1066
line 962
;962:  {
line 965
;963:    //if we moving from the ceiling to the floor special case
;964:    //( x product of colinear vectors is undefined)
;965:    if( VectorCompare( ceilingNormal, cg.lastNormal ) &&
ADDRLP4 164
ARGP4
ADDRGP4 cg+116244
ARGP4
ADDRLP4 200
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $1069
ADDRLP4 176
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 204
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $1069
line 967
;966:        VectorCompare( refNormal,     surfNormal ) )
;967:    {
line 968
;968:      AngleVectors( in, temp, NULL, NULL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 208
CNSTP4 0
ASGNP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 969
;969:      ProjectPointOnPlane( rotAxis, temp, refNormal );
ADDRLP4 92
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 176
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 970
;970:      VectorNormalize( rotAxis );
ADDRLP4 92
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 971
;971:      rotAngle = 180.0f;
ADDRLP4 188
CNSTF4 1127481344
ASGNF4
line 972
;972:      timeMod = 1.5f;
ADDRLP4 192
CNSTF4 1069547520
ASGNF4
line 973
;973:    }
ADDRGP4 $1070
JUMPV
LABELV $1069
line 975
;974:    else
;975:    {
line 976
;976:      AnglesToAxis( cg.lastVangles, lastAxis );
ADDRGP4 cg+116256
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 977
;977:      rotAngle = DotProduct( inAxis[ 0 ], lastAxis[ 0 ] ) +
ADDRLP4 188
ADDRLP4 8
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ADDRLP4 8+12
INDIRF4
ADDRLP4 116+12
INDIRF4
MULF4
ADDRLP4 8+12+4
INDIRF4
ADDRLP4 116+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+12+8
INDIRF4
ADDRLP4 116+12+8
INDIRF4
MULF4
ADDF4
ADDF4
ADDRLP4 8+24
INDIRF4
ADDRLP4 116+24
INDIRF4
MULF4
ADDRLP4 8+24+4
INDIRF4
ADDRLP4 116+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+24+8
INDIRF4
ADDRLP4 116+24+8
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 981
;978:                 DotProduct( inAxis[ 1 ], lastAxis[ 1 ] ) +
;979:                 DotProduct( inAxis[ 2 ], lastAxis[ 2 ] );
;980:
;981:      rotAngle = RAD2DEG( acos( ( rotAngle - 1.0f ) / 2.0f ) );
ADDRLP4 188
INDIRF4
CNSTF4 1065353216
SUBF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 208
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 188
CNSTF4 1127481344
ADDRLP4 208
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 983
;982:
;983:      CrossProduct( lastAxis[ 0 ], inAxis[ 0 ], temp );
ADDRLP4 116
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 984
;984:      VectorCopy( temp, rotAxis );
ADDRLP4 92
ADDRLP4 152
INDIRB
ASGNB 12
line 985
;985:      CrossProduct( lastAxis[ 1 ], inAxis[ 1 ], temp );
ADDRLP4 116+12
ARGP4
ADDRLP4 8+12
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 986
;986:      VectorAdd( rotAxis, temp, rotAxis );
ADDRLP4 92
ADDRLP4 92
INDIRF4
ADDRLP4 152
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92+4
ADDRLP4 92+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92+8
ADDRLP4 92+8
INDIRF4
ADDRLP4 152+8
INDIRF4
ADDF4
ASGNF4
line 987
;987:      CrossProduct( lastAxis[ 2 ], inAxis[ 2 ], temp );
ADDRLP4 116+24
ARGP4
ADDRLP4 8+24
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 988
;988:      VectorAdd( rotAxis, temp, rotAxis );
ADDRLP4 92
ADDRLP4 92
INDIRF4
ADDRLP4 152
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92+4
ADDRLP4 92+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92+8
ADDRLP4 92+8
INDIRF4
ADDRLP4 152+8
INDIRF4
ADDF4
ASGNF4
line 990
;989:
;990:      VectorNormalize( rotAxis );
ADDRLP4 92
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 992
;991:
;992:      timeMod = 1.0f;
ADDRLP4 192
CNSTF4 1065353216
ASGNF4
line 993
;993:    }
LABELV $1070
line 996
;994:
;995:    //add the op
;996:    CG_addSmoothOp( rotAxis, rotAngle, timeMod );
ADDRLP4 92
ARGP4
ADDRLP4 188
INDIRF4
ARGF4
ADDRLP4 192
INDIRF4
ARGF4
ADDRGP4 CG_addSmoothOp
CALLV
pop
line 997
;997:  }
LABELV $1066
line 1000
;998:
;999:  //iterate through ops
;1000:  for( i = MAXSMOOTHS - 1; i >= 0; i-- )
ADDRLP4 0
CNSTI4 31
ASGNI4
LABELV $1113
line 1001
;1001:  {
line 1002
;1002:    smoothTime = (int)( cg_wwSmoothTime.integer * cg.sList[ i ].timeMod );
ADDRLP4 4
ADDRGP4 cg_wwSmoothTime+12
INDIRI4
CVIF4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268+4
ADDP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1005
;1003:
;1004:    //if this op has time remaining, perform it
;1005:    if( cg.time < cg.sList[ i ].time + smoothTime )
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
GEF4 $1120
line 1006
;1006:    {
line 1007
;1007:      stLocal = 1.0f - ( ( ( cg.sList[ i ].time + smoothTime ) - cg.time ) / smoothTime );
ADDRLP4 84
CNSTF4 1065353216
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1008
;1008:      sFraction = -( cos( stLocal * M_PI ) + 1.0f ) / 2.0f;
CNSTF4 1078530011
ADDRLP4 84
INDIRF4
MULF4
ARGF4
ADDRLP4 204
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 204
INDIRF4
CNSTF4 1065353216
ADDF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1010
;1009:
;1010:      RotatePointAroundVector( outAxis[ 0 ], cg.sList[ i ].rotAxis,
ADDRLP4 44
ARGP4
ADDRLP4 208
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 208
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 80
INDIRF4
ADDRLP4 208
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1012
;1011:        inAxis[ 0 ], sFraction * cg.sList[ i ].rotAngle );
;1012:      RotatePointAroundVector( outAxis[ 1 ], cg.sList[ i ].rotAxis,
ADDRLP4 44+12
ARGP4
ADDRLP4 212
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 212
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 8+12
ARGP4
ADDRLP4 80
INDIRF4
ADDRLP4 212
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1014
;1013:        inAxis[ 1 ], sFraction * cg.sList[ i ].rotAngle );
;1014:      RotatePointAroundVector( outAxis[ 2 ], cg.sList[ i ].rotAxis,
ADDRLP4 44+24
ARGP4
ADDRLP4 216
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 216
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 8+24
ARGP4
ADDRLP4 80
INDIRF4
ADDRLP4 216
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1017
;1015:        inAxis[ 2 ], sFraction * cg.sList[ i ].rotAngle );
;1016:
;1017:      AxisCopy( outAxis, inAxis );
ADDRLP4 44
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1018
;1018:      performed = qtrue;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 1019
;1019:    }
LABELV $1120
line 1020
;1020:  }
LABELV $1114
line 1000
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1113
line 1024
;1021:
;1022:  //if we performed any ops then return the smoothed angles
;1023:  //otherwise simply return the in angles
;1024:  if( performed )
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1142
line 1025
;1025:    AxisToAngles( outAxis, out );
ADDRLP4 44
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AxisToAngles
CALLV
pop
ADDRGP4 $1143
JUMPV
LABELV $1142
line 1027
;1026:  else
;1027:    VectorCopy( in, out );
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
LABELV $1143
line 1030
;1028:
;1029:  //copy the current normal to the lastNormal
;1030:  VectorCopy( in, cg.lastVangles );
ADDRGP4 cg+116256
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1031
;1031:  VectorCopy( surfNormal, cg.lastNormal );
ADDRGP4 cg+116244
ADDRLP4 104
INDIRB
ASGNB 12
line 1032
;1032:}
LABELV $1058
endproc CG_smoothWWTransitions 220 16
proc CG_smoothWJTransitions 104 16
line 1040
;1033:
;1034:/*
;1035:===============
;1036:CG_smoothWJTransitions
;1037:===============
;1038:*/
;1039:static void CG_smoothWJTransitions( playerState_t *ps, const vec3_t in, vec3_t out )
;1040:{
line 1043
;1041:  int       i;
;1042:  float     stLocal, sFraction;
;1043:  qboolean  performed = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 1046
;1044:  vec3_t    inAxis[ 3 ], outAxis[ 3 ];
;1045:
;1046:  if( cg.snap->ps.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1147
line 1047
;1047:  {
line 1048
;1048:    VectorCopy( in, out );
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1049
;1049:    return;
ADDRGP4 $1146
JUMPV
LABELV $1147
line 1052
;1050:  }
;1051:
;1052:  AnglesToAxis( in, inAxis );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1055
;1053:
;1054:  //iterate through ops
;1055:  for( i = MAXSMOOTHS - 1; i >= 0; i-- )
ADDRLP4 0
CNSTI4 31
ASGNI4
LABELV $1150
line 1056
;1056:  {
line 1058
;1057:    //if this op has time remaining, perform it
;1058:    if( cg.time < cg.sList[ i ].time + cg_wwSmoothTime.integer )
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
INDIRF4
ADDRGP4 cg_wwSmoothTime+12
INDIRI4
CVIF4 4
ADDF4
GEF4 $1154
line 1059
;1059:    {
line 1060
;1060:      stLocal = ( ( cg.sList[ i ].time + cg_wwSmoothTime.integer ) - cg.time ) / cg_wwSmoothTime.integer;
ADDRLP4 80
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+116268
ADDP4
INDIRF4
ADDRGP4 cg_wwSmoothTime+12
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_wwSmoothTime+12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1061
;1061:      sFraction = 1.0f - ( ( cos( stLocal * M_PI * 2.0f ) + 1.0f ) / 2.0f );
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 88
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 76
CNSTF4 1065353216
ADDRLP4 88
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 1063
;1062:
;1063:      RotatePointAroundVector( outAxis[ 0 ], cg.sList[ i ].rotAxis,
ADDRLP4 40
ARGP4
ADDRLP4 92
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 76
INDIRF4
ADDRLP4 92
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1065
;1064:        inAxis[ 0 ], sFraction * cg.sList[ i ].rotAngle );
;1065:      RotatePointAroundVector( outAxis[ 1 ], cg.sList[ i ].rotAxis,
ADDRLP4 40+12
ARGP4
ADDRLP4 96
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRF4
ADDRLP4 96
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1067
;1066:        inAxis[ 1 ], sFraction * cg.sList[ i ].rotAngle );
;1067:      RotatePointAroundVector( outAxis[ 2 ], cg.sList[ i ].rotAxis,
ADDRLP4 40+24
ARGP4
ADDRLP4 100
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 cg+116268+8
ADDP4
ARGP4
ADDRLP4 4+24
ARGP4
ADDRLP4 76
INDIRF4
ADDRLP4 100
INDIRI4
ADDRGP4 cg+116268+20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1070
;1068:        inAxis[ 2 ], sFraction * cg.sList[ i ].rotAngle );
;1069:
;1070:      AxisCopy( outAxis, inAxis );
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1071
;1071:      performed = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 1072
;1072:    }
LABELV $1154
line 1073
;1073:  }
LABELV $1151
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1150
line 1077
;1074:
;1075:  //if we performed any ops then return the smoothed angles
;1076:  //otherwise simply return the in angles
;1077:  if( performed )
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1179
line 1078
;1078:    AxisToAngles( outAxis, out );
ADDRLP4 40
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AxisToAngles
CALLV
pop
ADDRGP4 $1180
JUMPV
LABELV $1179
line 1080
;1079:  else
;1080:    VectorCopy( in, out );
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
LABELV $1180
line 1081
;1081:}
LABELV $1146
endproc CG_smoothWJTransitions 104 16
proc CG_CalcViewValues 60 12
line 1092
;1082:
;1083:
;1084:/*
;1085:===============
;1086:CG_CalcViewValues
;1087:
;1088:Sets cg.refdef view values
;1089:===============
;1090:*/
;1091:static int CG_CalcViewValues( void )
;1092:{
line 1095
;1093:  playerState_t *ps;
;1094:
;1095:  memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+110040
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1098
;1096:
;1097:  // calculate size of 3D view
;1098:  CG_CalcVrect( );
ADDRGP4 CG_CalcVrect
CALLV
pop
line 1100
;1099:
;1100:  ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+107636
ASGNP4
line 1103
;1101:
;1102:  // intermission view
;1103:  if( ps->pm_type == PM_INTERMISSION )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1185
line 1104
;1104:  {
line 1105
;1105:    VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1106
;1106:    VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+110408
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1107
;1107:    AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+110408
ARGP4
ADDRGP4 cg+110040+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1109
;1108:
;1109:    return CG_CalcFov( );
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1181
JUMPV
LABELV $1185
line 1112
;1110:  }
;1111:
;1112:  cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+115788
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 1113
;1113:  cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
CNSTF4 1078530011
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+115784
ADDRLP4 8
INDIRF4
ASGNF4
line 1114
;1114:  cg.xyspeed = sqrt( ps->velocity[ 0 ] * ps->velocity[ 0 ] +
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+115792
ADDRLP4 24
INDIRF4
ASGNF4
line 1117
;1115:    ps->velocity[ 1 ] * ps->velocity[ 1 ] );
;1116:
;1117:  VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1119
;1118:
;1119:  if( BG_ClassHasAbility( ps->stats[ STAT_PCLASS ], SCA_WALLCLIMBER ) )
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 BG_ClassHasAbility
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1198
line 1120
;1120:    CG_smoothWWTransitions( ps, ps->viewangles, cg.refdefViewAngles );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 cg+110408
ARGP4
ADDRGP4 CG_smoothWWTransitions
CALLV
pop
ADDRGP4 $1199
JUMPV
LABELV $1198
line 1121
;1121:  else if( BG_ClassHasAbility( ps->stats[ STAT_PCLASS ], SCA_WALLJUMPER ) )
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 36
ADDRGP4 BG_ClassHasAbility
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1201
line 1122
;1122:    CG_smoothWJTransitions( ps, ps->viewangles, cg.refdefViewAngles );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 cg+110408
ARGP4
ADDRGP4 CG_smoothWJTransitions
CALLV
pop
ADDRGP4 $1202
JUMPV
LABELV $1201
line 1124
;1123:  else
;1124:    VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+110408
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
LABELV $1202
LABELV $1199
line 1128
;1125:
;1126:  //clumsy logic, but it needs to be this way round because the CS propogation
;1127:  //delay screws things up otherwise
;1128:  if( !BG_ClassHasAbility( ps->stats[ STAT_PCLASS ], SCA_WALLJUMPER ) )
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 44
ADDRGP4 BG_ClassHasAbility
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1205
line 1129
;1129:  {
line 1130
;1130:    if( !( ps->stats[ STAT_STATE ] & SS_WALLCLIMBING ) )
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1207
line 1131
;1131:      VectorSet( cg.lastNormal, 0.0f, 0.0f, 1.0f );
ADDRGP4 cg+116244
CNSTF4 0
ASGNF4
ADDRGP4 cg+116244+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+116244+8
CNSTF4 1065353216
ASGNF4
LABELV $1207
line 1132
;1132:  }
LABELV $1205
line 1135
;1133:
;1134:  // add error decay
;1135:  if( cg_errorDecay.value > 0 )
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $1214
line 1136
;1136:  {
line 1140
;1137:    int   t;
;1138:    float f;
;1139:
;1140:    t = cg.time - cg.predictedErrorTime;
ADDRLP4 52
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109832
INDIRI4
SUBI4
ASGNI4
line 1141
;1141:    f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 48
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 52
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 1143
;1142:
;1143:    if( f > 0 && f < 1 )
ADDRLP4 56
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
LEF4 $1221
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
GEF4 $1221
line 1144
;1144:      VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+110040+24
ADDRGP4 cg+110040+24
INDIRF4
ADDRGP4 cg+109836
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRGP4 cg+109836+4
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+110040+24+8
ADDRGP4 cg+110040+24+8
INDIRF4
ADDRGP4 cg+109836+8
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1222
JUMPV
LABELV $1221
line 1146
;1145:    else
;1146:      cg.predictedErrorTime = 0;
ADDRGP4 cg+109832
CNSTI4 0
ASGNI4
LABELV $1222
line 1147
;1147:  }
LABELV $1214
line 1150
;1148:
;1149:  //shut off the poison cloud effect if it's still on the go
;1150:  if( cg.snap->ps.stats[ STAT_HEALTH ] <= 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1245
line 1151
;1151:  {
line 1152
;1152:    if( CG_IsParticleSystemValid( &cg.poisonCloudPS ) )
ADDRGP4 cg+125520
ARGP4
ADDRLP4 48
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1248
line 1153
;1153:      CG_DestroyParticleSystem( &cg.poisonCloudPS );
ADDRGP4 cg+125520
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
LABELV $1248
line 1154
;1154:  }
LABELV $1245
line 1156
;1155:
;1156:  if( cg.renderingThirdPerson )
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1252
line 1157
;1157:  {
line 1159
;1158:    // back away from character
;1159:    CG_OffsetThirdPersonView( );
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 1160
;1160:  }
ADDRGP4 $1253
JUMPV
LABELV $1252
line 1162
;1161:  else
;1162:  {
line 1164
;1163:    // offset for local bobbing and kicks
;1164:    CG_OffsetFirstPersonView( );
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 1165
;1165:  }
LABELV $1253
line 1168
;1166:
;1167:  // position eye reletive to origin
;1168:  AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+110408
ARGP4
ADDRGP4 cg+110040+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1170
;1169:
;1170:  if( cg.hyperspace )
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
EQI4 $1258
line 1171
;1171:    cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 48
ADDRGP4 cg+110040+76
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
LABELV $1258
line 1174
;1172:
;1173:  //draw the surface normal looking at
;1174:  if( cg_drawSurfNormal.integer )
ADDRGP4 cg_drawSurfNormal+12
INDIRI4
CNSTI4 0
EQI4 $1263
line 1175
;1175:    CG_DrawSurfNormal( );
ADDRGP4 CG_DrawSurfNormal
CALLV
pop
LABELV $1263
line 1178
;1176:
;1177:  // field of view
;1178:  return CG_CalcFov( );
ADDRLP4 52
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
RETI4
LABELV $1181
endproc CG_CalcViewValues 60 12
export CG_AddBufferedSound
proc CG_AddBufferedSound 4 0
line 1187
;1179:}
;1180:
;1181:/*
;1182:=====================
;1183:CG_AddBufferedSound
;1184:=====================
;1185:*/
;1186:void CG_AddBufferedSound( sfxHandle_t sfx )
;1187:{
line 1188
;1188:  if( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1267
line 1189
;1189:    return;
ADDRGP4 $1266
JUMPV
LABELV $1267
line 1191
;1190:
;1191:  cg.soundBuffer[ cg.soundBufferIn ] = sfx;
ADDRGP4 cg+115568
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115580
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1192
;1192:  cg.soundBufferIn = ( cg.soundBufferIn + 1 ) % MAX_SOUNDBUFFER;
ADDRGP4 cg+115568
ADDRGP4 cg+115568
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1194
;1193:
;1194:  if( cg.soundBufferIn == cg.soundBufferOut )
ADDRGP4 cg+115568
INDIRI4
ADDRGP4 cg+115572
INDIRI4
NEI4 $1273
line 1195
;1195:    cg.soundBufferOut++;
ADDRLP4 0
ADDRGP4 cg+115572
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1273
line 1196
;1196:}
LABELV $1266
endproc CG_AddBufferedSound 4 0
proc CG_PlayBufferedSounds 0 8
line 1204
;1197:
;1198:/*
;1199:=====================
;1200:CG_PlayBufferedSounds
;1201:=====================
;1202:*/
;1203:static void CG_PlayBufferedSounds( void )
;1204:{
line 1205
;1205:  if( cg.soundTime < cg.time )
ADDRGP4 cg+115576
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1279
line 1206
;1206:  {
line 1207
;1207:    if( cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[ cg.soundBufferOut ] )
ADDRGP4 cg+115572
INDIRI4
ADDRGP4 cg+115568
INDIRI4
EQI4 $1283
ADDRGP4 cg+115572
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1283
line 1208
;1208:    {
line 1209
;1209:      trap_S_StartLocalSound( cg.soundBuffer[ cg.soundBufferOut ], CHAN_ANNOUNCER );
ADDRGP4 cg+115572
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115580
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1210
;1210:      cg.soundBuffer[ cg.soundBufferOut ] = 0;
ADDRGP4 cg+115572
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115580
ADDP4
CNSTI4 0
ASGNI4
line 1211
;1211:      cg.soundBufferOut = ( cg.soundBufferOut + 1 ) % MAX_SOUNDBUFFER;
ADDRGP4 cg+115572
ADDRGP4 cg+115572
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1212
;1212:      cg.soundTime = cg.time + 750;
ADDRGP4 cg+115576
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 1213
;1213:    }
LABELV $1283
line 1214
;1214:  }
LABELV $1279
line 1215
;1215:}
LABELV $1278
endproc CG_PlayBufferedSounds 0 8
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 24 16
line 1227
;1216:
;1217://=========================================================================
;1218:
;1219:/*
;1220:=================
;1221:CG_DrawActiveFrame
;1222:
;1223:Generates and draws a game scene and status information at the given time.
;1224:=================
;1225:*/
;1226:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback )
;1227:{
line 1230
;1228:  int   inwater;
;1229:
;1230:  cg.time = serverTime;
ADDRGP4 cg+107604
ADDRFP4 0
INDIRI4
ASGNI4
line 1231
;1231:  cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 1234
;1232:
;1233:  // update cvars
;1234:  CG_UpdateCvars( );
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 1238
;1235:
;1236:  // if we are only updating the screen as a loading
;1237:  // pacifier, don't even try to read snapshots
;1238:  if( cg.infoScreenText[ 0 ] != 0 )
ADDRGP4 cg+110432
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1300
line 1239
;1239:  {
line 1240
;1240:    CG_DrawLoadingScreen( );
ADDRGP4 CG_DrawLoadingScreen
CALLV
pop
line 1241
;1241:    return;
ADDRGP4 $1297
JUMPV
LABELV $1300
line 1246
;1242:  }
;1243:
;1244:  // any looped sounds will be respecified as entities
;1245:  // are added to the render list
;1246:  trap_S_ClearLoopingSounds( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 1249
;1247:
;1248:  // clear all the render lists
;1249:  trap_R_ClearScene( );
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1252
;1250:
;1251:  // set up cg.snap and possibly cg.nextSnap
;1252:  CG_ProcessSnapshots( );
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 1256
;1253:
;1254:  // if we haven't received any snapshots yet, all
;1255:  // we can draw is the information screen
;1256:  if( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1307
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1303
LABELV $1307
line 1257
;1257:  {
line 1258
;1258:    CG_DrawLoadingScreen( );
ADDRGP4 CG_DrawLoadingScreen
CALLV
pop
line 1259
;1259:    return;
ADDRGP4 $1297
JUMPV
LABELV $1303
line 1263
;1260:  }
;1261:
;1262:  // let the client system know what our weapon and zoom settings are
;1263:  trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+109940
INDIRI4
ARGI4
ADDRGP4 cg+110428
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 1266
;1264:
;1265:  // this counter will be bumped for every valid scene we generate
;1266:  cg.clientFrame++;
ADDRLP4 4
ADDRGP4 cg
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1269
;1267:
;1268:  // update cg.predictedPlayerState
;1269:  CG_PredictPlayerState( );
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 1272
;1270:
;1271:  // decide on third person view
;1272:  cg.renderingThirdPerson = cg_thirdPersonhax.integer || ( cg.snap->ps.stats[ STAT_HEALTH ] <= 0 );
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 cg_thirdPersonhax+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1316
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $1314
LABELV $1316
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1315
JUMPV
LABELV $1314
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1315
ADDRGP4 cg+107628
ADDRLP4 8
INDIRI4
ASGNI4
line 1274
;1273:	
;1274:	if(cg.predictedPlayerState.stats[ STAT_PTEAM ] == PTE_NONE)
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 0
NEI4 $1317
line 1275
;1275:	{
line 1276
;1276:		cg.renderingThirdPerson = 0;
ADDRGP4 cg+107628
CNSTI4 0
ASGNI4
line 1277
;1277:	}
LABELV $1317
line 1280
;1278:
;1279:  // build cg.refdef
;1280:  inwater = CG_CalcViewValues( );
ADDRLP4 16
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 1283
;1281:
;1282:  // build the render lists
;1283:  if( !cg.hyperspace )
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
NEI4 $1323
line 1284
;1284:  {
line 1285
;1285:    CG_AddPacketEntities( );     // after calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 1286
;1286:    CG_AddMarks( );
ADDRGP4 CG_AddMarks
CALLV
pop
line 1287
;1287:  }
LABELV $1323
line 1289
;1288:
;1289:  CG_AddViewWeapon( &cg.predictedPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 1292
;1290:
;1291:  //after CG_AddViewWeapon
;1292:  if( !cg.hyperspace )
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
NEI4 $1327
line 1293
;1293:  {
line 1294
;1294:    CG_AddParticles( );
ADDRGP4 CG_AddParticles
CALLV
pop
line 1295
;1295:    CG_AddTrails( );
ADDRGP4 CG_AddTrails
CALLV
pop
line 1296
;1296:  }
LABELV $1327
line 1299
;1297:
;1298:  // add buffered sounds
;1299:  CG_PlayBufferedSounds( );
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 1302
;1300:
;1301:  // finish up the rest of the refdef
;1302:  if( cg.testModelEntity.hModel )
ADDRGP4 cg+115800+8
INDIRI4
CNSTI4 0
EQI4 $1330
line 1303
;1303:    CG_AddTestModel( );
ADDRGP4 CG_AddTestModel
CALLV
pop
LABELV $1330
line 1305
;1304:
;1305:  cg.refdef.time = cg.time;
ADDRGP4 cg+110040+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1306
;1306:  memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+110040+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1309
;1307:
;1308:  //remove expired console lines
;1309:  if( cg.consoleLines[ 0 ].time + cg_consoleLatency.integer < cg.time && cg_consoleLatency.integer > 0 )
ADDRGP4 cg+125260
INDIRI4
ADDRGP4 cg_consoleLatency+12
INDIRI4
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1342
ADDRGP4 cg_consoleLatency+12
INDIRI4
CNSTI4 0
LEI4 $1342
line 1310
;1310:    CG_RemoveNotifyLine( );
ADDRGP4 CG_RemoveNotifyLine
CALLV
pop
LABELV $1342
line 1313
;1311:
;1312:  // update audio positions
;1313:  trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+110040+24
ARGP4
ADDRGP4 cg+110040+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 1316
;1314:
;1315:  // make sure the lagometerSample and frame timing isn't done twice when in stereo
;1316:  if( stereoView != STEREO_RIGHT )
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $1353
line 1317
;1317:  {
line 1318
;1318:    cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+107600
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
ASGNI4
line 1320
;1319:
;1320:    if( cg.frametime < 0 )
ADDRGP4 cg+107600
INDIRI4
CNSTI4 0
GEI4 $1358
line 1321
;1321:      cg.frametime = 0;
ADDRGP4 cg+107600
CNSTI4 0
ASGNI4
LABELV $1358
line 1323
;1322:
;1323:    cg.oldTime = cg.time;
ADDRGP4 cg+107608
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1324
;1324:    CG_AddLagometerFrameInfo( );
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 1325
;1325:  }
LABELV $1353
line 1327
;1326:
;1327:  if( cg_timescale.value != cg_timescaleFadeEnd.value )
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $1364
line 1328
;1328:  {
line 1329
;1329:    if( cg_timescale.value < cg_timescaleFadeEnd.value )
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1368
line 1330
;1330:    {
line 1331
;1331:      cg_timescale.value += cg_timescaleFadeSpeed.value * ( (float)cg.frametime ) / 1000;
ADDRLP4 20
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ADDF4
ASGNF4
line 1332
;1332:      if( cg_timescale.value > cg_timescaleFadeEnd.value )
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $1369
line 1333
;1333:        cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 1334
;1334:    }
ADDRGP4 $1369
JUMPV
LABELV $1368
line 1336
;1335:    else
;1336:    {
line 1337
;1337:      cg_timescale.value -= cg_timescaleFadeSpeed.value * ( (float)cg.frametime ) / 1000;
ADDRLP4 20
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 1338
;1338:      if( cg_timescale.value < cg_timescaleFadeEnd.value )
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1384
line 1339
;1339:        cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $1384
line 1340
;1340:    }
LABELV $1369
line 1342
;1341:
;1342:    if( cg_timescaleFadeSpeed.value )
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $1390
line 1343
;1343:      trap_Cvar_Set( "timescale", va( "%f", cg_timescale.value ) );
ADDRGP4 $1394
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1393
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $1390
line 1344
;1344:  }
LABELV $1364
line 1347
;1345:
;1346:  // actually issue the rendering calls
;1347:  CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 1349
;1348:
;1349:  if( cg_stats.integer )
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $1396
line 1350
;1350:    CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $1399
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1396
line 1351
;1351:}
LABELV $1297
endproc CG_DrawActiveFrame 24 16
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
LABELV $1399
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1394
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1393
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $287
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $283
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $273
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $195
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $131
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $115
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
