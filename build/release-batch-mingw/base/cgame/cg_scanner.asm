export CG_UpdateEntityPositions
code
proc CG_UpdateEntityPositions 16 0
file "..\..\..\..\src/cgame/cg_scanner.c"
line 38
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
;23:
;24:#include "cg_local.h"
;25:
;26:static entityPos_t   entityPositions;
;27:
;28:#define HUMAN_SCANNER_UPDATE_PERIOD 1
;29:
;30:/*
;31:=============
;32:CG_UpdateEntityPositions
;33:
;34:Update this client's perception of entity positions
;35:=============
;36:*/
;37:void CG_UpdateEntityPositions( void )
;38:{
line 39
;39:  centity_t *cent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 42
;40:  int       i;
;41:
;42:  if( cg.predictedPlayerState.stats[ STAT_PTEAM ] == PTE_HUMANS )
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 2
NEI4 $100
line 43
;43:  {
line 44
;44:    if( entityPositions.lastUpdateTime + HUMAN_SCANNER_UPDATE_PERIOD > cg.time )
ADDRGP4 entityPositions+30224
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $105
line 45
;45:      return;
ADDRGP4 $99
JUMPV
LABELV $105
line 46
;46:  }
LABELV $100
line 48
;47:
;48:  VectorCopy( cg.refdef.vieworg, entityPositions.origin );
ADDRGP4 entityPositions+30228
ADDRGP4 cg+110040+24
INDIRB
ASGNB 12
line 49
;49:  VectorCopy( cg.refdefViewAngles, entityPositions.vangles );
ADDRGP4 entityPositions+30240
ADDRGP4 cg+110408
INDIRB
ASGNB 12
line 50
;50:  entityPositions.lastUpdateTime = cg.time;
ADDRGP4 entityPositions+30224
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 52
;51:
;52:  entityPositions.numAlienBuildables = 0;
ADDRGP4 entityPositions+16384
CNSTI4 0
ASGNI4
line 53
;53:  entityPositions.numHumanBuildables = 0;
ADDRGP4 entityPositions+28676
CNSTI4 0
ASGNI4
line 54
;54:  entityPositions.numAlienClients = 0;
ADDRGP4 entityPositions+29448
CNSTI4 0
ASGNI4
line 55
;55:  entityPositions.numHumanClients = 0;
ADDRGP4 entityPositions+30220
CNSTI4 0
ASGNI4
line 57
;56:
;57:  for( i = 0; i < cg.snap->numEntities; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 58
;58:  {
line 59
;59:    cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 0
CNSTI4 1724
CNSTI4 208
ADDRLP4 4
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
line 61
;60:
;61:    if( cent->currentState.eType == ET_BUILDABLE )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $126
line 62
;62:    {
line 64
;63:      //TA: add to list of item positions (for creep)
;64:      if( cent->currentState.modelindex2 == BIT_ALIENS )
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $128
line 65
;65:      {
line 66
;66:        VectorCopy( cent->lerpOrigin, entityPositions.alienBuildablePos[
CNSTI4 12
ADDRGP4 entityPositions+16384
INDIRI4
MULI4
ADDRGP4 entityPositions
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 68
;67:            entityPositions.numAlienBuildables ] );
;68:        entityPositions.alienBuildableTimes[
ADDRGP4 entityPositions+16384
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 entityPositions+12288
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 71
;69:            entityPositions.numAlienBuildables ] = cent->miscTime;
;70:
;71:        if( entityPositions.numAlienBuildables < MAX_GENTITIES )
ADDRGP4 entityPositions+16384
INDIRI4
CNSTI4 1024
GEI4 $127
line 72
;72:          entityPositions.numAlienBuildables++;
ADDRLP4 8
ADDRGP4 entityPositions+16384
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 73
;73:      }
ADDRGP4 $127
JUMPV
LABELV $128
line 74
;74:      else if( cent->currentState.modelindex2 == BIT_HUMANS )
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $127
line 75
;75:      {
line 76
;76:        VectorCopy( cent->lerpOrigin, entityPositions.humanBuildablePos[
CNSTI4 12
ADDRGP4 entityPositions+28676
INDIRI4
MULI4
ADDRGP4 entityPositions+16388
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 79
;77:            entityPositions.numHumanBuildables ] );
;78:
;79:        if( entityPositions.numHumanBuildables < MAX_GENTITIES )
ADDRGP4 entityPositions+28676
INDIRI4
CNSTI4 1024
GEI4 $127
line 80
;80:          entityPositions.numHumanBuildables++;
ADDRLP4 8
ADDRGP4 entityPositions+28676
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 81
;81:      }
line 82
;82:    }
ADDRGP4 $127
JUMPV
LABELV $126
line 83
;83:    else if( cent->currentState.eType == ET_PLAYER )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $145
line 84
;84:    {
line 85
;85:      int team = cent->currentState.powerups & 0x00FF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 87
;86:
;87:      if( team == PTE_ALIENS )
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $147
line 88
;88:      {
line 89
;89:        VectorCopy( cent->lerpOrigin, entityPositions.alienClientPos[
CNSTI4 12
ADDRGP4 entityPositions+29448
INDIRI4
MULI4
ADDRGP4 entityPositions+28680
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 92
;90:            entityPositions.numAlienClients ] );
;91:
;92:        if( entityPositions.numAlienClients < MAX_CLIENTS )
ADDRGP4 entityPositions+29448
INDIRI4
CNSTI4 64
GEI4 $148
line 93
;93:          entityPositions.numAlienClients++;
ADDRLP4 12
ADDRGP4 entityPositions+29448
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 94
;94:      }
ADDRGP4 $148
JUMPV
LABELV $147
line 95
;95:      else if( team == PTE_HUMANS )
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $155
line 96
;96:      {
line 97
;97:        VectorCopy( cent->lerpOrigin, entityPositions.humanClientPos[
CNSTI4 12
ADDRGP4 entityPositions+30220
INDIRI4
MULI4
ADDRGP4 entityPositions+29452
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 100
;98:            entityPositions.numHumanClients ] );
;99:
;100:        if( entityPositions.numHumanClients < MAX_CLIENTS )
ADDRGP4 entityPositions+30220
INDIRI4
CNSTI4 64
GEI4 $159
line 101
;101:          entityPositions.numHumanClients++;
ADDRLP4 12
ADDRGP4 entityPositions+30220
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $159
line 102
;102:      }
LABELV $155
LABELV $148
line 103
;103:    }
LABELV $145
LABELV $127
line 104
;104:  }
LABELV $121
line 57
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $120
line 105
;105:}
LABELV $99
endproc CG_UpdateEntityPositions 16 0
lit
align 4
LABELV $164
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_DrawBlips 92 20
line 121
;106:
;107:#define STALKWIDTH  2.0f
;108:#define BLIPX       16.0f
;109:#define BLIPY       8.0f
;110:#define FAR_ALPHA   0.8f
;111:#define NEAR_ALPHA  1.2f
;112:
;113:/*
;114:=============
;115:CG_DrawBlips
;116:
;117:Draw blips and stalks for the human scanner
;118:=============
;119:*/
;120:static void CG_DrawBlips( rectDef_t *rect, vec3_t origin, vec4_t colour )
;121:{
line 123
;122:  vec3_t  drawOrigin;
;123:  vec3_t  up = { 0, 0, 1 };
ADDRLP4 32
ADDRGP4 $164
INDIRB
ASGNB 12
line 124
;124:  float   alphaMod = 1.0f;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 125
;125:  float   timeFractionSinceRefresh = 1.0f -
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 44
ADDRLP4 48
INDIRF4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 entityPositions+30224
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 48
INDIRF4
DIVF4
SUBF4
ASGNF4
line 130
;126:    ( (float)( cg.time - entityPositions.lastUpdateTime ) /
;127:      (float)HUMAN_SCANNER_UPDATE_PERIOD );
;128:  vec4_t  localColour;
;129:
;130:  Vector4Copy( colour, localColour );
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 52
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 132
;131:
;132:  RotatePointAroundVector( drawOrigin, up, origin, -entityPositions.vangles[ 1 ] - 90 );
ADDRLP4 0
ARGP4
ADDRLP4 32
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 entityPositions+30240+4
INDIRF4
NEGF4
CNSTF4 1119092736
SUBF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 133
;133:  drawOrigin[ 0 ] /= ( 2 * HELMET_RANGE / rect->w );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1157234688
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
DIVF4
DIVF4
ASGNF4
line 134
;134:  drawOrigin[ 1 ] /= ( 2 * HELMET_RANGE / rect->h );
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1157234688
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
DIVF4
DIVF4
ASGNF4
line 135
;135:  drawOrigin[ 2 ] /= ( 2 * HELMET_RANGE / rect->w );
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157234688
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
DIVF4
DIVF4
ASGNF4
line 137
;136:
;137:  alphaMod = FAR_ALPHA +
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
CNSTF4 1053609165
ADDRLP4 0+4
INDIRF4
ADDRLP4 56
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ADDRLP4 56
INDIRF4
DIVF4
MULF4
CNSTF4 1061997773
ADDF4
ASGNF4
line 140
;138:    ( ( drawOrigin[ 1 ] + ( rect->h / 2.0f ) ) / rect->h ) * ( NEAR_ALPHA - FAR_ALPHA );
;139:
;140:  localColour[ 3 ] *= alphaMod;
ADDRLP4 12+12
ADDRLP4 12+12
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 141
;141:  localColour[ 3 ] *= ( 0.5f + ( timeFractionSinceRefresh * 0.5f ) );
ADDRLP4 60
CNSTF4 1056964608
ASGNF4
ADDRLP4 12+12
ADDRLP4 12+12
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 60
INDIRF4
ADDF4
MULF4
ASGNF4
line 143
;142:
;143:  if( localColour[ 3 ] > 1.0f )
ADDRLP4 12+12
INDIRF4
CNSTF4 1065353216
LEF4 $177
line 144
;144:    localColour[ 3 ] = 1.0f;
ADDRLP4 12+12
CNSTF4 1065353216
ASGNF4
ADDRGP4 $178
JUMPV
LABELV $177
line 145
;145:  else if( localColour[ 3 ] < 0.0f )
ADDRLP4 12+12
INDIRF4
CNSTF4 0
GEF4 $181
line 146
;146:    localColour[ 3 ] = 0.0f;
ADDRLP4 12+12
CNSTF4 0
ASGNF4
LABELV $181
LABELV $178
line 148
;147:
;148:  trap_R_SetColor( localColour );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 150
;149:
;150:  if( drawOrigin[ 2 ] > 0 )
ADDRLP4 0+8
INDIRF4
CNSTF4 0
LEF4 $185
line 151
;151:    CG_DrawPic( rect->x + ( rect->w / 2 ) - ( STALKWIDTH / 2 ) - drawOrigin[ 0 ],
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTF4 1073741824
ASGNF4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 68
INDIRF4
DIVF4
ADDF4
CNSTF4 1065353216
SUBF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 68
INDIRF4
DIVF4
ADDF4
ADDRLP4 0+4
INDIRF4
ADDF4
ADDRLP4 0+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRGP4 cgs+268684+176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
ADDRGP4 $186
JUMPV
LABELV $185
line 155
;152:                rect->y + ( rect->h / 2 ) + drawOrigin[ 1 ] - drawOrigin[ 2 ],
;153:                STALKWIDTH, drawOrigin[ 2 ], cgs.media.scannerLineShader );
;154:  else
;155:    CG_DrawPic( rect->x + ( rect->w / 2 ) - ( STALKWIDTH / 2 ) - drawOrigin[ 0 ],
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTF4 1073741824
ASGNF4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 76
INDIRF4
DIVF4
ADDF4
CNSTF4 1065353216
SUBF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 76
INDIRF4
DIVF4
ADDF4
ADDRLP4 0+4
INDIRF4
ADDF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
NEGF4
ARGF4
ADDRGP4 cgs+268684+176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $186
line 159
;156:                rect->y + ( rect->h / 2 ) + drawOrigin[ 1 ],
;157:                STALKWIDTH, -drawOrigin[ 2 ], cgs.media.scannerLineShader );
;158:
;159:  CG_DrawPic( rect->x + ( rect->w / 2 ) - ( BLIPX / 2 ) - drawOrigin[ 0 ],
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1073741824
ASGNF4
ADDRLP4 88
CNSTF4 1090519040
ASGNF4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
DIVF4
ADDF4
ADDRLP4 88
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
DIVF4
ADDF4
CNSTF4 1082130432
SUBF4
ADDRLP4 0+4
INDIRF4
ADDF4
ADDRLP4 0+8
INDIRF4
SUBF4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRGP4 cgs+268684+172
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 162
;160:              rect->y + ( rect->h / 2 ) - ( BLIPY / 2 ) + drawOrigin[ 1 ] - drawOrigin[ 2 ],
;161:              BLIPX, BLIPY, cgs.media.scannerBlipShader );
;162:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 163
;163:}
LABELV $163
endproc CG_DrawBlips 92 20
lit
align 4
LABELV $202
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $203
byte 4 0
byte 4 3212836864
byte 4 0
code
proc CG_DrawDir 156 20
line 176
;164:
;165:#define BLIPX2  24.0f
;166:#define BLIPY2  24.0f
;167:
;168:/*
;169:=============
;170:CG_DrawDir
;171:
;172:Draw dot marking the direction to an enemy
;173:=============
;174:*/
;175:static void CG_DrawDir( rectDef_t *rect, vec3_t origin, vec4_t colour )
;176:{
line 181
;177:  vec3_t  drawOrigin;
;178:  vec3_t  noZOrigin;
;179:  vec3_t  normal, antinormal, normalDiff;
;180:  vec3_t  view, noZview;
;181:  vec3_t  up  = { 0.0f, 0.0f,   1.0f };
ADDRLP4 92
ADDRGP4 $202
INDIRB
ASGNB 12
line 182
;182:  vec3_t  top = { 0.0f, -1.0f,  0.0f };
ADDRLP4 104
ADDRGP4 $203
INDIRB
ASGNB 12
line 184
;183:  float   angle;
;184:  playerState_t *ps = &cg.snap->ps;
ADDRLP4 76
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 186
;185:
;186:  if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBING )
ADDRLP4 76
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $205
line 187
;187:  {
line 188
;188:    if( ps->stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING )
ADDRLP4 76
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $207
line 189
;189:      VectorSet( normal, 0.0f, 0.0f, -1.0f );
ADDRLP4 116
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $206
JUMPV
LABELV $207
line 191
;190:    else
;191:      VectorCopy( ps->grapplePoint, normal );
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 192
;192:  }
ADDRGP4 $206
JUMPV
LABELV $205
line 194
;193:  else
;194:    VectorSet( normal, 0.0f, 0.0f, 1.0f );
ADDRLP4 116
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 116
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
LABELV $206
line 196
;195:
;196:  AngleVectors( entityPositions.vangles, view, NULL, NULL );
ADDRGP4 entityPositions+30240
ARGP4
ADDRLP4 80
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
ADDRGP4 AngleVectors
CALLV
pop
line 198
;197:
;198:  ProjectPointOnPlane( noZOrigin, origin, normal );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 199
;199:  ProjectPointOnPlane( noZview, view, normal );
ADDRLP4 24
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 200
;200:  VectorNormalize( noZOrigin );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 201
;201:  VectorNormalize( noZview );
ADDRLP4 24
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 204
;202:
;203:  //calculate the angle between the images of the blip and the view
;204:  angle = RAD2DEG( acos( DotProduct( noZOrigin, noZview ) ) );
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 124
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 72
CNSTF4 1127481344
ADDRLP4 124
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 205
;205:  CrossProduct( noZOrigin, noZview, antinormal );
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 206
;206:  VectorNormalize( antinormal );
ADDRLP4 36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 209
;207:
;208:  //decide which way to rotate
;209:  VectorSubtract( normal, antinormal, normalDiff );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 210
;210:  if( VectorLength( normalDiff ) < 1.0f )
ADDRLP4 48
ARGP4
ADDRLP4 128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1065353216
GEF4 $224
line 211
;211:    angle = 360.0f - angle;
ADDRLP4 72
CNSTF4 1135869952
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
LABELV $224
line 213
;212:
;213:  RotatePointAroundVector( drawOrigin, up, top, angle );
ADDRLP4 60
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 215
;214:
;215:  trap_R_SetColor( colour );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 216
;216:  CG_DrawPic( rect->x + ( rect->w / 2 ) - ( BLIPX2 / 2 ) - drawOrigin[ 0 ] * ( rect->w / 2 ),
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
CNSTF4 1073741824
ASGNF4
ADDRLP4 140
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
DIVF4
ASGNF4
ADDRLP4 144
CNSTF4 1094713344
ASGNF4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 140
INDIRF4
ADDF4
ADDRLP4 144
INDIRF4
SUBF4
ADDRLP4 60
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 148
ADDRLP4 132
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
DIVF4
ASGNF4
ADDRLP4 132
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
ADDF4
ADDRLP4 144
INDIRF4
SUBF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 152
CNSTF4 1103101952
ASGNF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRGP4 cgs+268684+172
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 219
;217:              rect->y + ( rect->h / 2 ) - ( BLIPY2 / 2 ) + drawOrigin[ 1 ] * ( rect->h / 2 ),
;218:              BLIPX2, BLIPY2, cgs.media.scannerBlipShader );
;219:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 220
;220:}
LABELV $201
endproc CG_DrawDir 156 20
lit
align 4
LABELV $230
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1060320051
align 4
LABELV $231
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1060320051
export CG_AlienSense
code
proc CG_AlienSense 72 12
line 228
;221:
;222:/*
;223:=============
;224:CG_AlienSense
;225:=============
;226:*/
;227:void CG_AlienSense( rectDef_t *rect )
;228:{
line 232
;229:  int     i;
;230:  vec3_t  origin;
;231:  vec3_t  relOrigin;
;232:  vec4_t  buildable = { 1.0f, 0.0f, 0.0f, 0.7f };
ADDRLP4 28
ADDRGP4 $230
INDIRB
ASGNB 16
line 233
;233:  vec4_t  client    = { 0.0f, 0.0f, 1.0f, 0.7f };
ADDRLP4 44
ADDRGP4 $231
INDIRB
ASGNB 16
line 235
;234:
;235:  VectorCopy( entityPositions.origin, origin );
ADDRLP4 16
ADDRGP4 entityPositions+30228
INDIRB
ASGNB 12
line 238
;236:
;237:  //draw human buildables
;238:  for( i = 0; i < entityPositions.numHumanBuildables; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 239
;239:  {
line 240
;240:    VectorClear( relOrigin );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
line 241
;241:    VectorSubtract( entityPositions.humanBuildablePos[ i ], origin, relOrigin );
ADDRLP4 64
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ADDRGP4 entityPositions+16388
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRI4
ADDRGP4 entityPositions+16388+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+16388+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 243
;242:
;243:    if( VectorLength( relOrigin ) < ALIENSENSE_RANGE )
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 1148846080
GEF4 $249
line 244
;244:      CG_DrawDir( rect, relOrigin, buildable );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CG_DrawDir
CALLV
pop
LABELV $249
line 245
;245:  }
LABELV $234
line 238
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+28676
INDIRI4
LTI4 $233
line 248
;246:
;247:  //draw human clients
;248:  for( i = 0; i < entityPositions.numHumanClients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $251
line 249
;249:  {
line 250
;250:    VectorClear( relOrigin );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
line 251
;251:    VectorSubtract( entityPositions.humanClientPos[ i ], origin, relOrigin );
ADDRLP4 64
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ADDRGP4 entityPositions+29452
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRI4
ADDRGP4 entityPositions+29452+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+29452+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 253
;252:
;253:    if( VectorLength( relOrigin ) < ALIENSENSE_RANGE )
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 1148846080
GEF4 $267
line 254
;254:      CG_DrawDir( rect, relOrigin, client );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CG_DrawDir
CALLV
pop
LABELV $267
line 255
;255:  }
LABELV $252
line 248
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $254
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+30220
INDIRI4
LTI4 $251
line 256
;256:}
LABELV $229
endproc CG_AlienSense 72 12
lit
align 4
LABELV $270
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $271
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $272
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1061158912
align 4
LABELV $273
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1056964608
export CG_Scanner
code
proc CG_Scanner 104 20
line 264
;257:
;258:/*
;259:=============
;260:CG_Scanner
;261:=============
;262:*/
;263:void CG_Scanner( rectDef_t *rect, qhandle_t shader, vec4_t color )
;264:{
line 268
;265:  int     i;
;266:  vec3_t  origin;
;267:  vec3_t  relOrigin;
;268:  vec4_t  hIabove = { 0.0f, 0.0f, 0.0f, 1.0f };
ADDRLP4 28
ADDRGP4 $270
INDIRB
ASGNB 16
line 269
;269:  vec4_t  hIbelow = { 0.0f, 0.0f, 0.0f, 1.0f };
ADDRLP4 44
ADDRGP4 $271
INDIRB
ASGNB 16
line 270
;270:  vec4_t  aIabove = { 1.0f, 0.0f, 0.0f, 0.75f };
ADDRLP4 60
ADDRGP4 $272
INDIRB
ASGNB 16
line 271
;271:  vec4_t  aIbelow = { 1.0f, 0.0f, 0.0f, 0.5f };
ADDRLP4 76
ADDRGP4 $273
INDIRB
ASGNB 16
line 277
;272:
;273:  //Vector4Copy( color, hIabove );
;274:  //hIabove[ 3 ] *= 1.5f;
;275:  //Vector4Copy( color, hIbelow );
;276:
;277:  VectorCopy( entityPositions.origin, origin );
ADDRLP4 16
ADDRGP4 entityPositions+30228
INDIRB
ASGNB 12
line 280
;278:
;279:  //draw human buildables below scanner plane
;280:  for( i = 0; i < entityPositions.numHumanBuildables; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 281
;281:  {
line 282
;282:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 283
;283:    VectorSubtract( entityPositions.humanBuildablePos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+16388
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+16388+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+16388+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 285
;284:
;285:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] < 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $291
ADDRLP4 0+8
INDIRF4
CNSTF4 0
GEF4 $291
line 286
;286:      CG_DrawBlips( rect, relOrigin, hIbelow );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $291
line 287
;287:  }
LABELV $276
line 280
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+28676
INDIRI4
LTI4 $275
line 290
;288:
;289:  //draw alien buildables below scanner plane
;290:  for( i = 0; i < entityPositions.numAlienBuildables; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
line 291
;291:  {
line 292
;292:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 293
;293:    VectorSubtract( entityPositions.alienBuildablePos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 295
;294:
;295:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] < 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $307
ADDRLP4 0+8
INDIRF4
CNSTF4 0
GEF4 $307
line 296
;296:      CG_DrawBlips( rect, relOrigin, aIbelow );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $307
line 297
;297:  }
LABELV $295
line 290
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+16384
INDIRI4
LTI4 $294
line 300
;298:
;299:  //draw human clients below scanner plane
;300:  for( i = 0; i < entityPositions.numHumanClients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 301
;301:  {
line 302
;302:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 303
;303:    VectorSubtract( entityPositions.humanClientPos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+29452
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+29452+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+29452+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 305
;304:
;305:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] < 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $326
ADDRLP4 0+8
INDIRF4
CNSTF4 0
GEF4 $326
line 306
;306:      CG_DrawBlips( rect, relOrigin, hIbelow );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $326
line 307
;307:  }
LABELV $311
line 300
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+30220
INDIRI4
LTI4 $310
line 310
;308:
;309:  //draw alien buildables below scanner plane
;310:  for( i = 0; i < entityPositions.numAlienClients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $329
line 311
;311:  {
line 312
;312:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 313
;313:    VectorSubtract( entityPositions.alienClientPos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+28680
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+28680+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+28680+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 315
;314:
;315:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] < 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $345
ADDRLP4 0+8
INDIRF4
CNSTF4 0
GEF4 $345
line 316
;316:      CG_DrawBlips( rect, relOrigin, aIbelow );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $345
line 317
;317:  }
LABELV $330
line 310
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $332
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+29448
INDIRI4
LTI4 $329
line 319
;318:
;319:  if( !cg_disableScannerPlane.integer )
ADDRGP4 cg_disableScannerPlane+12
INDIRI4
CNSTI4 0
NEI4 $348
line 320
;320:  {
line 321
;321:    trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 322
;322:    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 323
;323:    trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 324
;324:  }
LABELV $348
line 327
;325:
;326:  //draw human buildables above scanner plane
;327:  for( i = 0; i < entityPositions.numHumanBuildables; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $351
line 328
;328:  {
line 329
;329:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 330
;330:    VectorSubtract( entityPositions.humanBuildablePos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+16388
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+16388+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+16388+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 332
;331:
;332:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] > 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $367
ADDRLP4 0+8
INDIRF4
CNSTF4 0
LEF4 $367
line 333
;333:      CG_DrawBlips( rect, relOrigin, hIabove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $367
line 334
;334:  }
LABELV $352
line 327
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $354
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+28676
INDIRI4
LTI4 $351
line 337
;335:
;336:  //draw alien buildables above scanner plane
;337:  for( i = 0; i < entityPositions.numAlienBuildables; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $370
line 338
;338:  {
line 339
;339:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 340
;340:    VectorSubtract( entityPositions.alienBuildablePos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 342
;341:
;342:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] > 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $383
ADDRLP4 0+8
INDIRF4
CNSTF4 0
LEF4 $383
line 343
;343:      CG_DrawBlips( rect, relOrigin, aIabove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $383
line 344
;344:  }
LABELV $371
line 337
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $373
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+16384
INDIRI4
LTI4 $370
line 347
;345:
;346:  //draw human clients above scanner plane
;347:  for( i = 0; i < entityPositions.numHumanClients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $386
line 348
;348:  {
line 349
;349:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 350
;350:    VectorSubtract( entityPositions.humanClientPos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+29452
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+29452+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+29452+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 352
;351:
;352:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] > 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $402
ADDRLP4 0+8
INDIRF4
CNSTF4 0
LEF4 $402
line 353
;353:      CG_DrawBlips( rect, relOrigin, hIabove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $402
line 354
;354:  }
LABELV $387
line 347
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+30220
INDIRI4
LTI4 $386
line 357
;355:
;356:  //draw alien clients above scanner plane
;357:  for( i = 0; i < entityPositions.numAlienClients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 358
;358:  {
line 359
;359:    VectorClear( relOrigin );
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 92
INDIRF4
ASGNF4
line 360
;360:    VectorSubtract( entityPositions.alienClientPos[ i ], origin, relOrigin );
ADDRLP4 96
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+28680
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 96
INDIRI4
ADDRGP4 entityPositions+28680+4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 entityPositions+28680+8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 362
;361:
;362:    if( VectorLength( relOrigin ) < HELMET_RANGE && ( relOrigin[ 2 ] > 0 ) )
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1148846080
GEF4 $421
ADDRLP4 0+8
INDIRF4
CNSTF4 0
LEF4 $421
line 363
;363:      CG_DrawBlips( rect, relOrigin, aIabove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 CG_DrawBlips
CALLV
pop
LABELV $421
line 364
;364:  }
LABELV $406
line 357
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 12
INDIRI4
ADDRGP4 entityPositions+29448
INDIRI4
LTI4 $405
line 365
;365:}
LABELV $269
endproc CG_Scanner 104 20
bss
align 4
LABELV entityPositions
skip 30252
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
