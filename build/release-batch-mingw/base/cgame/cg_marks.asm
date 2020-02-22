export CG_InitMarkPolys
code
proc CG_InitMarkPolys 12 12
file "..\..\..\..\src/cgame/cg_marks.c"
line 51
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
;24:// cg_marks.c -- wall marks
;25:
;26:
;27:#include "cg_local.h"
;28:
;29:/*
;30:===================================================================
;31:
;32:MARK POLYS
;33:
;34:===================================================================
;35:*/
;36:
;37:
;38:markPoly_t  cg_activeMarkPolys;     // double linked list
;39:markPoly_t  *cg_freeMarkPolys;      // single linked list
;40:markPoly_t  cg_markPolys[ MAX_MARK_POLYS ];
;41:static int  markTotal;
;42:
;43:/*
;44:===================
;45:CG_InitMarkPolys
;46:
;47:This is called at startup and for tournement restarts
;48:===================
;49:*/
;50:void CG_InitMarkPolys( void )
;51:{
line 54
;52:  int   i;
;53:
;54:  memset( cg_markPolys, 0, sizeof( cg_markPolys ) );
ADDRGP4 cg_markPolys
ARGP4
CNSTI4 0
ARGI4
CNSTI4 73728
ARGI4
ADDRGP4 memset
CALLP4
pop
line 56
;55:
;56:  cg_activeMarkPolys.nextMark = &cg_activeMarkPolys;
ADDRGP4 cg_activeMarkPolys+4
ADDRGP4 cg_activeMarkPolys
ASGNP4
line 57
;57:  cg_activeMarkPolys.prevMark = &cg_activeMarkPolys;
ADDRLP4 4
ADDRGP4 cg_activeMarkPolys
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 58
;58:  cg_freeMarkPolys = cg_markPolys;
ADDRGP4 cg_freeMarkPolys
ADDRGP4 cg_markPolys
ASGNP4
line 60
;59:
;60:  for( i = 0; i < MAX_MARK_POLYS - 1; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $101
line 61
;61:    cg_markPolys[ i ].nextMark = &cg_markPolys[ i + 1 ];
ADDRLP4 8
CNSTI4 288
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_markPolys+4
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_markPolys+288
ADDP4
ASGNP4
LABELV $102
line 60
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 255
LTI4 $101
line 62
;62:}
LABELV $99
endproc CG_InitMarkPolys 12 12
export CG_FreeMarkPoly
proc CG_FreeMarkPoly 12 4
line 71
;63:
;64:
;65:/*
;66:==================
;67:CG_FreeMarkPoly
;68:==================
;69:*/
;70:void CG_FreeMarkPoly( markPoly_t *le )
;71:{
line 72
;72:  if( !le->prevMark )
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 73
;73:    CG_Error( "CG_FreeLocalEntity: not active" );
ADDRGP4 $110
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $108
line 76
;74:
;75:  // remove from the doubly linked active list
;76:  le->prevMark->nextMark = le->nextMark;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 77
;77:  le->nextMark->prevMark = le->prevMark;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
line 80
;78:
;79:  // the free list is only singly linked
;80:  le->nextMark = cg_freeMarkPolys;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_freeMarkPolys
INDIRP4
ASGNP4
line 81
;81:  cg_freeMarkPolys = le;
ADDRGP4 cg_freeMarkPolys
ADDRFP4 0
INDIRP4
ASGNP4
line 82
;82:}
LABELV $107
endproc CG_FreeMarkPoly 12 4
export CG_AllocMark
proc CG_AllocMark 12 12
line 92
;83:
;84:/*
;85:===================
;86:CG_AllocMark
;87:
;88:Will allways succeed, even if it requires freeing an old active mark
;89:===================
;90:*/
;91:markPoly_t *CG_AllocMark( void )
;92:{
line 96
;93:  markPoly_t  *le;
;94:  int         time;
;95:
;96:  if( !cg_freeMarkPolys )
ADDRGP4 cg_freeMarkPolys
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $112
line 97
;97:  {
line 100
;98:    // no free entities, so free the one at the end of the chain
;99:    // remove the oldest active entity
;100:    time = cg_activeMarkPolys.prevMark->time;
ADDRLP4 4
ADDRGP4 cg_activeMarkPolys
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $115
JUMPV
LABELV $114
line 103
;101:
;102:    while( cg_activeMarkPolys.prevMark && time == cg_activeMarkPolys.prevMark->time )
;103:      CG_FreeMarkPoly( cg_activeMarkPolys.prevMark );
ADDRGP4 cg_activeMarkPolys
INDIRP4
ARGP4
ADDRGP4 CG_FreeMarkPoly
CALLV
pop
LABELV $115
line 102
ADDRLP4 8
ADDRGP4 cg_activeMarkPolys
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $117
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $114
LABELV $117
line 104
;104:  }
LABELV $112
line 106
;105:
;106:  le = cg_freeMarkPolys;
ADDRLP4 0
ADDRGP4 cg_freeMarkPolys
INDIRP4
ASGNP4
line 107
;107:  cg_freeMarkPolys = cg_freeMarkPolys->nextMark;
ADDRLP4 8
ADDRGP4 cg_freeMarkPolys
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 109
;108:
;109:  memset( le, 0, sizeof( *le ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 112
;110:
;111:  // link into the active list
;112:  le->nextMark = cg_activeMarkPolys.nextMark;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_activeMarkPolys+4
INDIRP4
ASGNP4
line 113
;113:  le->prevMark = &cg_activeMarkPolys;
ADDRLP4 0
INDIRP4
ADDRGP4 cg_activeMarkPolys
ASGNP4
line 114
;114:  cg_activeMarkPolys.nextMark->prevMark = le;
ADDRGP4 cg_activeMarkPolys+4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 115
;115:  cg_activeMarkPolys.nextMark = le;
ADDRGP4 cg_activeMarkPolys+4
ADDRLP4 0
INDIRP4
ASGNP4
line 116
;116:  return le;
ADDRLP4 0
INDIRP4
RETP4
LABELV $111
endproc CG_AllocMark 12 12
export CG_ImpactMark
proc CG_ImpactMark 6088 28
line 138
;117:}
;118:
;119:
;120:
;121:/*
;122:=================
;123:CG_ImpactMark
;124:
;125:origin should be a point within a unit of the plane
;126:dir should be the plane normal
;127:
;128:temporary marks will not be stored or randomly oriented, but immediately
;129:passed to the renderer.
;130:=================
;131:*/
;132:#define MAX_MARK_FRAGMENTS  128
;133:#define MAX_MARK_POINTS   384
;134:
;135:void CG_ImpactMark( qhandle_t markShader, const vec3_t origin, const vec3_t dir,
;136:                    float orientation, float red, float green, float blue, float alpha,
;137:                    qboolean alphaFade, float radius, qboolean temporary )
;138:{
line 149
;139:  vec3_t          axis[ 3 ];
;140:  float           texCoordScale;
;141:  vec3_t          originalPoints[ 4 ];
;142:  byte            colors[ 4 ];
;143:  int             i, j;
;144:  int             numFragments;
;145:  markFragment_t  markFragments[ MAX_MARK_FRAGMENTS ], *mf;
;146:  vec3_t          markPoints[ MAX_MARK_POINTS ];
;147:  vec3_t          projection;
;148:
;149:  if( !cg_addMarks.integer )
ADDRGP4 cg_addMarks+12
INDIRI4
CNSTI4 0
NEI4 $122
line 150
;150:    return;
ADDRGP4 $121
JUMPV
LABELV $122
line 152
;151:
;152:  if( radius <= 0 )
ADDRFP4 36
INDIRF4
CNSTF4 0
GTF4 $125
line 153
;153:    CG_Error( "CG_ImpactMark called with <= 0 radius" );
ADDRGP4 $127
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $125
line 160
;154:
;155:  //if ( markTotal >= MAX_MARK_POLYS ) {
;156:  //  return;
;157:  //}
;158:
;159:  // create the texture axis
;160:  VectorNormalize2( dir, axis[ 0 ] );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 161
;161:  PerpendicularVector( axis[ 1 ], axis[ 0 ] );
ADDRLP4 0+12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 162
;162:  RotatePointAroundVector( axis[ 2 ], axis[ 0 ], axis[ 1 ], orientation );
ADDRLP4 0+24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 163
;163:  CrossProduct( axis[ 0 ], axis[ 2 ], axis[ 1 ] );
ADDRLP4 0
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 165
;164:
;165:  texCoordScale = 0.5 * 1.0 / radius;
ADDRLP4 48
CNSTF4 1056964608
ADDRFP4 36
INDIRF4
DIVF4
ASGNF4
line 168
;166:
;167:  // create the full polygon
;168:  for( i = 0; i < 3; i++ )
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $133
line 169
;169:  {
line 170
;170:    originalPoints[ 0 ][ i ] = origin[ i ] - radius * axis[ 1 ][ i ] - radius * axis[ 2 ][ i ];
ADDRLP4 5752
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5756
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 5752
INDIRI4
ADDRLP4 4664
ADDP4
ADDRLP4 5752
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 5756
INDIRF4
ADDRLP4 5752
INDIRI4
ADDRLP4 0+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 5756
INDIRF4
ADDRLP4 5752
INDIRI4
ADDRLP4 0+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 171
;171:    originalPoints[ 1 ][ i ] = origin[ i ] + radius * axis[ 1 ][ i ] - radius * axis[ 2 ][ i ];
ADDRLP4 5760
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5764
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 5760
INDIRI4
ADDRLP4 4664+12
ADDP4
ADDRLP4 5760
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 5764
INDIRF4
ADDRLP4 5760
INDIRI4
ADDRLP4 0+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 5764
INDIRF4
ADDRLP4 5760
INDIRI4
ADDRLP4 0+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 172
;172:    originalPoints[ 2 ][ i ] = origin[ i ] + radius * axis[ 1 ][ i ] + radius * axis[ 2 ][ i ];
ADDRLP4 5768
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5772
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 5768
INDIRI4
ADDRLP4 4664+24
ADDP4
ADDRLP4 5768
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 5772
INDIRF4
ADDRLP4 5768
INDIRI4
ADDRLP4 0+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 5772
INDIRF4
ADDRLP4 5768
INDIRI4
ADDRLP4 0+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 173
;173:    originalPoints[ 3 ][ i ] = origin[ i ] - radius * axis[ 1 ][ i ] + radius * axis[ 2 ][ i ];
ADDRLP4 5776
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5780
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 5776
INDIRI4
ADDRLP4 4664+36
ADDP4
ADDRLP4 5776
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 5780
INDIRF4
ADDRLP4 5776
INDIRI4
ADDRLP4 0+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 5780
INDIRF4
ADDRLP4 5776
INDIRI4
ADDRLP4 0+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 174
;174:  }
LABELV $134
line 168
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 3
LTI4 $133
line 177
;175:
;176:  // get the fragments
;177:  VectorScale( dir, -20, projection );
ADDRLP4 5752
CNSTF4 3248488448
ASGNF4
ADDRLP4 5756
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4716
ADDRLP4 5752
INDIRF4
ADDRLP4 5756
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4716+4
ADDRLP4 5752
INDIRF4
ADDRLP4 5756
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4716+8
CNSTF4 3248488448
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 178
;178:  numFragments = trap_CM_MarkFragments( 4, (void *)originalPoints,
CNSTI4 4
ARGI4
ADDRLP4 4664
ARGP4
ADDRLP4 4716
ARGP4
CNSTI4 384
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 4728
ARGP4
ADDRLP4 5760
ADDRGP4 trap_CM_MarkFragments
CALLI4
ASGNI4
ADDRLP4 4712
ADDRLP4 5760
INDIRI4
ASGNI4
line 182
;179:          projection, MAX_MARK_POINTS, markPoints[ 0 ],
;180:          MAX_MARK_FRAGMENTS, markFragments );
;181:
;182:  colors[ 0 ] = red * 255;
ADDRLP4 5768
CNSTF4 1132396544
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 5772
CNSTF4 1325400064
ASGNF4
ADDRLP4 5768
INDIRF4
ADDRLP4 5772
INDIRF4
LTF4 $151
ADDRLP4 5764
ADDRLP4 5768
INDIRF4
ADDRLP4 5772
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $152
JUMPV
LABELV $151
ADDRLP4 5764
ADDRLP4 5768
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $152
ADDRLP4 52
ADDRLP4 5764
INDIRU4
CVUU1 4
ASGNU1
line 183
;183:  colors[ 1 ] = green * 255;
ADDRLP4 5780
CNSTF4 1132396544
ADDRFP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 5784
CNSTF4 1325400064
ASGNF4
ADDRLP4 5780
INDIRF4
ADDRLP4 5784
INDIRF4
LTF4 $155
ADDRLP4 5776
ADDRLP4 5780
INDIRF4
ADDRLP4 5784
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $156
JUMPV
LABELV $155
ADDRLP4 5776
ADDRLP4 5780
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $156
ADDRLP4 52+1
ADDRLP4 5776
INDIRU4
CVUU1 4
ASGNU1
line 184
;184:  colors[ 2 ] = blue * 255;
ADDRLP4 5792
CNSTF4 1132396544
ADDRFP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 5796
CNSTF4 1325400064
ASGNF4
ADDRLP4 5792
INDIRF4
ADDRLP4 5796
INDIRF4
LTF4 $159
ADDRLP4 5788
ADDRLP4 5792
INDIRF4
ADDRLP4 5796
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $160
JUMPV
LABELV $159
ADDRLP4 5788
ADDRLP4 5792
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $160
ADDRLP4 52+2
ADDRLP4 5788
INDIRU4
CVUU1 4
ASGNU1
line 185
;185:  colors[ 3 ] = alpha * 255;
ADDRLP4 5804
CNSTF4 1132396544
ADDRFP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 5808
CNSTF4 1325400064
ASGNF4
ADDRLP4 5804
INDIRF4
ADDRLP4 5808
INDIRF4
LTF4 $163
ADDRLP4 5800
ADDRLP4 5804
INDIRF4
ADDRLP4 5808
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $164
JUMPV
LABELV $163
ADDRLP4 5800
ADDRLP4 5804
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $164
ADDRLP4 52+3
ADDRLP4 5800
INDIRU4
CVUU1 4
ASGNU1
line 187
;186:
;187:  for( i = 0, mf = markFragments; i < numFragments; i++, mf++ )
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 4728
ASGNP4
ADDRGP4 $168
JUMPV
LABELV $165
line 188
;188:  {
line 195
;189:    polyVert_t  *v;
;190:    polyVert_t  verts[ MAX_VERTS_ON_POLY ];
;191:    markPoly_t  *mark;
;192:
;193:    // we have an upper limit on the complexity of polygons
;194:    // that we store persistantly
;195:    if( mf->numPoints > MAX_VERTS_ON_POLY )
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $169
line 196
;196:      mf->numPoints = MAX_VERTS_ON_POLY;
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
LABELV $169
line 198
;197:
;198:    for( j = 0, v = verts; j < mf->numPoints; j++, v++ )
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 5812
ADDRLP4 5820
ASGNP4
ADDRGP4 $174
JUMPV
LABELV $171
line 199
;199:    {
line 202
;200:      vec3_t    delta;
;201:
;202:      VectorCopy( markPoints[ mf->firstPoint + j ], v->xyz );
ADDRLP4 5812
INDIRP4
CNSTI4 12
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
MULI4
ADDRLP4 56
ADDP4
INDIRB
ASGNB 12
line 204
;203:
;204:      VectorSubtract( v->xyz, origin, delta );
ADDRLP4 6076
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 6060
ADDRLP4 5812
INDIRP4
INDIRF4
ADDRLP4 6076
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6080
CNSTI4 4
ASGNI4
ADDRLP4 6060+4
ADDRLP4 5812
INDIRP4
ADDRLP4 6080
INDIRI4
ADDP4
INDIRF4
ADDRLP4 6076
INDIRP4
ADDRLP4 6080
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6084
CNSTI4 8
ASGNI4
ADDRLP4 6060+8
ADDRLP4 5812
INDIRP4
ADDRLP4 6084
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 6084
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 205
;205:      v->st[ 0 ] = 0.5 + DotProduct( delta, axis[ 1 ] ) * texCoordScale;
ADDRLP4 5812
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 6060
INDIRF4
ADDRLP4 0+12
INDIRF4
MULF4
ADDRLP4 6060+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6060+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 206
;206:      v->st[ 1 ] = 0.5 + DotProduct( delta, axis[ 2 ] ) * texCoordScale;
ADDRLP4 5812
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 6060
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 6060+4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6060+8
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 207
;207:      *(int *)v->modulate = *(int *)colors;
ADDRLP4 5812
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 208
;208:    }
LABELV $172
line 198
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 5812
ADDRLP4 5812
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
LABELV $174
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $171
line 211
;209:
;210:    // if it is a temporary (shadow) mark, add it immediately and forget about it
;211:    if( temporary )
ADDRFP4 40
INDIRI4
CNSTI4 0
EQI4 $191
line 212
;212:    {
line 213
;213:      trap_R_AddPolyToScene( markShader, mf->numPoints, verts );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 5820
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 214
;214:      continue;
ADDRGP4 $166
JUMPV
LABELV $191
line 218
;215:    }
;216:
;217:    // otherwise save it persistantly
;218:    mark = CG_AllocMark( );
ADDRLP4 6060
ADDRGP4 CG_AllocMark
CALLP4
ASGNP4
ADDRLP4 5816
ADDRLP4 6060
INDIRP4
ASGNP4
line 219
;219:    mark->time = cg.time;
ADDRLP4 5816
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 220
;220:    mark->alphaFade = alphaFade;
ADDRLP4 5816
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 32
INDIRI4
ASGNI4
line 221
;221:    mark->markShader = markShader;
ADDRLP4 5816
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 222
;222:    mark->poly.numVerts = mf->numPoints;
ADDRLP4 5816
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 223
;223:    mark->color[ 0 ] = red;
ADDRLP4 5816
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 224
;224:    mark->color[ 1 ] = green;
ADDRLP4 5816
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 225
;225:    mark->color[ 2 ] = blue;
ADDRLP4 5816
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 24
INDIRF4
ASGNF4
line 226
;226:    mark->color[ 3 ] = alpha;
ADDRLP4 5816
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 28
INDIRF4
ASGNF4
line 227
;227:    memcpy( mark->verts, verts, mf->numPoints * sizeof( verts[ 0 ] ) );
ADDRLP4 5816
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 5820
ARGP4
CNSTU4 24
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 228
;228:    markTotal++;
ADDRLP4 6064
ADDRGP4 markTotal
ASGNP4
ADDRLP4 6064
INDIRP4
ADDRLP4 6064
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 229
;229:  }
LABELV $166
line 187
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 40
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $168
ADDRLP4 44
INDIRI4
ADDRLP4 4712
INDIRI4
LTI4 $165
line 230
;230:}
LABELV $121
endproc CG_ImpactMark 6088 28
export CG_AddMarks
proc CG_AddMarks 76 12
line 242
;231:
;232:
;233:/*
;234:===============
;235:CG_AddMarks
;236:===============
;237:*/
;238:#define MARK_TOTAL_TIME   10000
;239:#define MARK_FADE_TIME    1000
;240:
;241:void CG_AddMarks( void )
;242:{
line 248
;243:  int         j;
;244:  markPoly_t  *mp, *next;
;245:  int         t;
;246:  int         fade;
;247:
;248:  if( !cg_addMarks.integer )
ADDRGP4 cg_addMarks+12
INDIRI4
CNSTI4 0
NEI4 $195
line 249
;249:    return;
ADDRGP4 $194
JUMPV
LABELV $195
line 251
;250:
;251:  mp = cg_activeMarkPolys.nextMark;
ADDRLP4 0
ADDRGP4 cg_activeMarkPolys+4
INDIRP4
ASGNP4
line 252
;252:  for ( ; mp != &cg_activeMarkPolys; mp = next )
ADDRGP4 $202
JUMPV
LABELV $199
line 253
;253:  {
line 256
;254:    // grab next now, so if the local entity is freed we
;255:    // still have it
;256:    next = mp->nextMark;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 259
;257:
;258:    // see if it is time to completely remove it
;259:    if( cg.time > mp->time + MARK_TOTAL_TIME )
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 10000
ADDI4
LEI4 $203
line 260
;260:    {
line 261
;261:      CG_FreeMarkPoly( mp );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeMarkPoly
CALLV
pop
line 262
;262:      continue;
ADDRGP4 $200
JUMPV
LABELV $203
line 266
;263:    }
;264:
;265:    // fade all marks out with time
;266:    t = mp->time + MARK_TOTAL_TIME - cg.time;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 267
;267:    if( t < MARK_FADE_TIME )
ADDRLP4 12
INDIRI4
CNSTI4 1000
GEI4 $207
line 268
;268:    {
line 269
;269:      fade = 255 * t / MARK_FADE_TIME;
ADDRLP4 8
CNSTI4 255
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 1000
DIVI4
ASGNI4
line 270
;270:      if( mp->alphaFade )
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 271
;271:      {
line 272
;272:        for( j = 0; j < mp->poly.numVerts; j++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 273
;273:          mp->verts[ j ].modulate[ 3 ] = fade;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDP4
CNSTI4 23
ADDP4
ADDRLP4 8
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $212
line 272
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LTI4 $211
line 274
;274:      }
ADDRGP4 $210
JUMPV
LABELV $209
line 276
;275:      else
;276:      {
line 277
;277:        for( j = 0; j < mp->poly.numVerts; j++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $215
line 278
;278:        {
line 279
;279:          mp->verts[ j ].modulate[ 0 ] = mp->color[ 0 ] * fade;
ADDRLP4 28
CNSTI4 20
ASGNI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $220
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $221
JUMPV
LABELV $220
ADDRLP4 20
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $221
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 20
INDIRU4
CVUU1 4
ASGNU1
line 280
;280:          mp->verts[ j ].modulate[ 1 ] = mp->color[ 1 ] * fade;
ADDRLP4 48
CNSTI4 24
ASGNI4
ADDRLP4 52
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 56
CNSTF4 1325400064
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
LTF4 $223
ADDRLP4 40
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 40
ADDRLP4 52
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $224
ADDRLP4 48
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 40
INDIRU4
CVUU1 4
ASGNU1
line 281
;281:          mp->verts[ j ].modulate[ 2 ] = mp->color[ 2 ] * fade;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $226
ADDRLP4 60
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $227
JUMPV
LABELV $226
ADDRLP4 60
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $227
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 60
INDIRU4
CVUU1 4
ASGNU1
line 282
;282:        }
LABELV $216
line 277
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LTI4 $215
line 283
;283:      }
LABELV $210
line 284
;284:    }
LABELV $207
line 286
;285:
;286:    trap_R_AddPolyToScene( mp->markShader, mp->poly.numVerts, mp->verts );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 287
;287:  }
LABELV $200
line 252
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
LABELV $202
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg_activeMarkPolys
CVPU4 4
NEU4 $199
line 288
;288:}
LABELV $194
endproc CG_AddMarks 76 12
bss
align 4
LABELV markTotal
skip 4
export cg_freeMarkPolys
align 4
LABELV cg_freeMarkPolys
skip 4
export cg_activeMarkPolys
align 4
LABELV cg_activeMarkPolys
skip 288
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
export cg_markPolys
align 4
LABELV cg_markPolys
skip 73728
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
LABELV $127
byte 1 67
byte 1 71
byte 1 95
byte 1 73
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 48
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $110
byte 1 67
byte 1 71
byte 1 95
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
