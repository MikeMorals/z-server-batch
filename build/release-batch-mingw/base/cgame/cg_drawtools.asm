export CG_DrawPlane
code
proc CG_DrawPlane 160 12
file "..\..\..\..\src/cgame/cg_drawtools.c"
line 37
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
;24:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;25:
;26:
;27:#include "cg_local.h"
;28:
;29:/*
;30:===============
;31:CG_DrawPlane
;32:
;33:Draw a quad in 3 space - basically CG_DrawPic in 3 space
;34:===============
;35:*/
;36:void CG_DrawPlane( vec3_t origin, vec3_t down, vec3_t right, qhandle_t shader )
;37:{
line 41
;38:  polyVert_t  verts[ 4 ];
;39:  vec3_t      temp;
;40:
;41:  VectorCopy( origin, verts[ 0 ].xyz );
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 42
;42:  verts[ 0 ].st[ 0 ] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 43
;43:  verts[ 0 ].st[ 1 ] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 44
;44:  verts[ 0 ].modulate[ 0 ] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 45
;45:  verts[ 0 ].modulate[ 1 ] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 46
;46:  verts[ 0 ].modulate[ 2 ] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 47
;47:  verts[ 0 ].modulate[ 3 ] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 49
;48:
;49:  VectorAdd( origin, right, temp );
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 112
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 116
CNSTI4 4
ASGNI4
ADDRLP4 96+4
ADDRLP4 108
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 120
CNSTI4 8
ASGNI4
ADDRLP4 96+8
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 50
;50:  VectorCopy( temp, verts[ 1 ].xyz );
ADDRLP4 0+24
ADDRLP4 96
INDIRB
ASGNB 12
line 51
;51:  verts[ 1 ].st[ 0 ] = 1;
ADDRLP4 0+24+12
CNSTF4 1065353216
ASGNF4
line 52
;52:  verts[ 1 ].st[ 1 ] = 0;
ADDRLP4 0+24+12+4
CNSTF4 0
ASGNF4
line 53
;53:  verts[ 1 ].modulate[ 0 ] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 54
;54:  verts[ 1 ].modulate[ 1 ] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 55
;55:  verts[ 1 ].modulate[ 2 ] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 56
;56:  verts[ 1 ].modulate[ 3 ] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 58
;57:
;58:  VectorAdd( origin, right, temp );
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 124
INDIRP4
INDIRF4
ADDRLP4 128
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRLP4 96+4
ADDRLP4 124
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
CNSTI4 8
ASGNI4
ADDRLP4 96+8
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 59
;59:  VectorAdd( temp, down, temp );
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 140
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 140
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 60
;60:  VectorCopy( temp, verts[ 2 ].xyz );
ADDRLP4 0+48
ADDRLP4 96
INDIRB
ASGNB 12
line 61
;61:  verts[ 2 ].st[ 0 ] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 62
;62:  verts[ 2 ].st[ 1 ] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 63
;63:  verts[ 2 ].modulate[ 0 ] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 64
;64:  verts[ 2 ].modulate[ 1 ] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 65
;65:  verts[ 2 ].modulate[ 2 ] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 66
;66:  verts[ 2 ].modulate[ 3 ] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 68
;67:
;68:  VectorAdd( origin, down, temp );
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 144
INDIRP4
INDIRF4
ADDRLP4 148
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
CNSTI4 4
ASGNI4
ADDRLP4 96+4
ADDRLP4 144
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRF4
ADDRLP4 148
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 156
CNSTI4 8
ASGNI4
ADDRLP4 96+8
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 69
;69:  VectorCopy( temp, verts[ 3 ].xyz );
ADDRLP4 0+72
ADDRLP4 96
INDIRB
ASGNB 12
line 70
;70:  verts[ 3 ].st[ 0 ] = 0;
ADDRLP4 0+72+12
CNSTF4 0
ASGNF4
line 71
;71:  verts[ 3 ].st[ 1 ] = 1;
ADDRLP4 0+72+12+4
CNSTF4 1065353216
ASGNF4
line 72
;72:  verts[ 3 ].modulate[ 0 ] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 73
;73:  verts[ 3 ].modulate[ 1 ] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 74
;74:  verts[ 3 ].modulate[ 2 ] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 75
;75:  verts[ 3 ].modulate[ 3 ] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 77
;76:
;77:  trap_R_AddPolyToScene( shader, 4, verts );
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 78
;78:}
LABELV $99
endproc CG_DrawPlane 160 12
export CG_AdjustFrom640
proc CG_AdjustFrom640 16 0
line 88
;79:
;80:/*
;81:================
;82:CG_AdjustFrom640
;83:
;84:Adjusted for resolution and screen aspect ratio
;85:================
;86:*/
;87:void CG_AdjustFrom640( float *x, float *y, float *w, float *h )
;88:{
line 96
;89:#if 0
;90:  // adjust for wide screens
;91:  if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
;92:    *x += 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * 640 / 480 ) );
;93:  }
;94:#endif
;95:  // scale for screen sizes
;96:  *x *= cgs.screenXScale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+31444
INDIRF4
MULF4
ASGNF4
line 97
;97:  *y *= cgs.screenYScale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 98
;98:  *w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+31444
INDIRF4
MULF4
ASGNF4
line 99
;99:  *h *= cgs.screenYScale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 100
;100:}
LABELV $171
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 4 36
line 110
;101:
;102:/*
;103:================
;104:CG_FillRect
;105:
;106:Coordinates are 640*480 virtual values
;107:=================
;108:*/
;109:void CG_FillRect( float x, float y, float width, float height, const float *color )
;110:{
line 111
;111:  trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 113
;112:
;113:  CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 114
;114:  trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+268684+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 116
;115:
;116:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 117
;117:}
LABELV $176
endproc CG_FillRect 4 36
export CG_DrawSides
proc CG_DrawSides 12 36
line 128
;118:
;119:
;120:/*
;121:================
;122:CG_DrawSides
;123:
;124:Coords are virtual 640x480
;125:================
;126:*/
;127:void CG_DrawSides( float x, float y, float w, float h, float size )
;128:{
line 129
;129:  CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 130
;130:  size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31444
INDIRF4
MULF4
ASGNF4
line 131
;131:  trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+268684+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 132
;132:  trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+268684+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 133
;133:}
LABELV $179
endproc CG_DrawSides 12 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 12 36
line 136
;134:
;135:void CG_DrawTopBottom( float x, float y, float w, float h, float size )
;136:{
line 137
;137:  CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 138
;138:  size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 139
;139:  trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+268684+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 140
;140:  trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+268684+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 141
;141:}
LABELV $185
endproc CG_DrawTopBottom 12 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 152
;142:
;143:
;144:/*
;145:================
;146:CG_DrawRect
;147:
;148:Coordinates are 640*480 virtual values
;149:=================
;150:*/
;151:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color )
;152:{
line 153
;153:  trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 155
;154:
;155:  CG_DrawTopBottom( x, y, width, height, size );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 156
;156:  CG_DrawSides( x, y, width, height, size );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 158
;157:
;158:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 159
;159:}
LABELV $191
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 8 36
line 170
;160:
;161:
;162:/*
;163:================
;164:CG_DrawPic
;165:
;166:Coordinates are 640*480 virtual values
;167:=================
;168:*/
;169:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader )
;170:{
line 171
;171:  CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 172
;172:  trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 173
;173:}
LABELV $192
endproc CG_DrawPic 8 36
export CG_DrawFadePic
proc CG_DrawFadePic 40 36
line 186
;174:
;175:
;176:
;177:/*
;178:================
;179:CG_DrawFadePic
;180:
;181:Coordinates are 640*480 virtual values
;182:=================
;183:*/
;184:void CG_DrawFadePic( float x, float y, float width, float height, vec4_t fcolor,
;185:                     vec4_t tcolor, float amount, qhandle_t hShader )
;186:{
line 190
;187:  vec4_t  finalcolor;
;188:  float   inverse;
;189:
;190:  inverse = 100 - amount;
ADDRLP4 16
CNSTF4 1120403456
ADDRFP4 24
INDIRF4
SUBF4
ASGNF4
line 192
;191:
;192:  CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 194
;193:
;194:  finalcolor[ 0 ] = ( ( inverse * fcolor[ 0 ] ) + ( amount * tcolor[ 0 ] ) ) / 100;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDRFP4 20
INDIRP4
INDIRF4
MULF4
ADDF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 195
;195:  finalcolor[ 1 ] = ( ( inverse * fcolor[ 1 ] ) + ( amount * tcolor[ 1 ] ) ) / 100;
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ADDRFP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDRFP4 20
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 196
;196:  finalcolor[ 2 ] = ( ( inverse * fcolor[ 2 ] ) + ( amount * tcolor[ 2 ] ) ) / 100;
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDRFP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 197
;197:  finalcolor[ 3 ] = ( ( inverse * fcolor[ 3 ] ) + ( amount * tcolor[ 3 ] ) ) / 100;
ADDRLP4 28
CNSTI4 12
ASGNI4
ADDRLP4 0+12
ADDRLP4 16
INDIRF4
ADDRFP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDRFP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 199
;198:
;199:  trap_R_SetColor( finalcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 200
;200:  trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 201
;201:  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 202
;202:}
LABELV $193
endproc CG_DrawFadePic 40 36
export CG_DrawStrlen
proc CG_DrawStrlen 24 0
line 212
;203:
;204:/*
;205:=================
;206:CG_DrawStrlen
;207:
;208:Returns character count, skiping color escape codes
;209:=================
;210:*/
;211:int CG_DrawStrlen( const char *str )
;212:{
line 213
;213:  const char  *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 214
;214:  int         count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $198
line 217
;215:
;216:  while( *s )
;217:  {
line 218
;218:    if( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $201
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $201
ADDRLP4 12
INDIRI4
CNSTI4 65
LTI4 $204
ADDRLP4 12
INDIRI4
CNSTI4 90
LEI4 $203
LABELV $204
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $205
ADDRLP4 16
INDIRI4
CNSTI4 122
LEI4 $203
LABELV $205
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $201
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $201
LABELV $203
line 219
;219:      s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $202
JUMPV
LABELV $201
line 221
;220:    else
;221:    {
line 222
;222:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 223
;223:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 224
;224:    }
LABELV $202
line 225
;225:  }
LABELV $199
line 216
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $198
line 227
;226:
;227:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $197
endproc CG_DrawStrlen 24 0
proc CG_TileClearBox 16 36
line 239
;228:}
;229:
;230:/*
;231:=============
;232:CG_TileClearBox
;233:
;234:This repeats a 64*64 tile graphic to fill the screen around a sized down
;235:refresh window.
;236:=============
;237:*/
;238:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader )
;239:{
line 242
;240:  float s1, t1, s2, t2;
;241:
;242:  s1 = x / 64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 243
;243:  t1 = y / 64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 244
;244:  s2 = ( x + w ) / 64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 245
;245:  t2 = ( y + h ) / 64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 246
;246:  trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 247
;247:}
LABELV $206
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 48 20
line 259
;248:
;249:
;250:
;251:/*
;252:==============
;253:CG_TileClear
;254:
;255:Clear around a sized down screen
;256:==============
;257:*/
;258:void CG_TileClear( void )
;259:{
line 263
;260:  int   top, bottom, left, right;
;261:  int   w, h;
;262:
;263:  w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 264
;264:  h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 266
;265:
;266:  if( cg.refdef.x == 0 && cg.refdef.y == 0 &&
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+110040
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $212
ADDRGP4 cg+110040+4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $212
ADDRGP4 cg+110040+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $212
ADDRGP4 cg+110040+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $212
line 268
;267:      cg.refdef.width == w && cg.refdef.height == h )
;268:    return;   // full screen rendering
ADDRGP4 $207
JUMPV
LABELV $212
line 270
;269:
;270:  top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+110040+4
INDIRI4
ASGNI4
line 271
;271:  bottom = top + cg.refdef.height - 1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110040+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 272
;272:  left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+110040
INDIRI4
ASGNI4
line 273
;273:  right = left + cg.refdef.width - 1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+110040+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 276
;274:
;275:  // clear above view screen
;276:  CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+268684+152
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 279
;277:
;278:  // clear below view screen
;279:  CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+268684+152
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 282
;280:
;281:  // clear left of view screen
;282:  CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+268684+152
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 285
;283:
;284:  // clear right of view screen
;285:  CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+268684+152
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 286
;286:}
LABELV $207
endproc CG_TileClear 48 20
bss
align 4
LABELV $237
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 296
;287:
;288:
;289:
;290:/*
;291:================
;292:CG_FadeColor
;293:================
;294:*/
;295:float *CG_FadeColor( int startMsec, int totalMsec )
;296:{
line 300
;297:  static vec4_t   color;
;298:  int     t;
;299:
;300:  if( startMsec == 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $238
line 301
;301:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $236
JUMPV
LABELV $238
line 303
;302:
;303:  t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 305
;304:
;305:  if( t >= totalMsec )
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $241
line 306
;306:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $236
JUMPV
LABELV $241
line 309
;307:
;308:  // fade out
;309:  if( totalMsec - t < FADE_TIME )
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $243
line 310
;310:    color[ 3 ] = ( totalMsec - t ) * 1.0 / FADE_TIME;
ADDRGP4 $237+12
CNSTF4 1065353216
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
ADDRGP4 $244
JUMPV
LABELV $243
line 312
;311:  else
;312:    color[ 3 ] = 1.0;
ADDRGP4 $237+12
CNSTF4 1065353216
ASGNF4
LABELV $244
line 314
;313:
;314:  color[ 0 ] = color[ 1 ] = color[ 2 ] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $237+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $237+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $237
ADDRLP4 4
INDIRF4
ASGNF4
line 316
;315:
;316:  return color;
ADDRGP4 $237
RETP4
LABELV $236
endproc CG_FadeColor 8 0
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
import CG_GetColorForHealth
import CG_ColorForHealth
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
