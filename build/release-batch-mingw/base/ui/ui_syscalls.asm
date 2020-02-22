data
align 4
LABELV syscall
byte 4 4294967295
export dllEntry
code
proc dllEntry 0 0
file "..\..\..\..\src/ui/ui_syscalls.c"
line 31
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
;24:#include "ui_local.h"
;25:
;26:// this file is only included when building a dll
;27:// syscalls.asm is included instead when building a qvm
;28:
;29:static intptr_t (QDECL *syscall)( intptr_t arg, ... ) = (intptr_t (QDECL *)( intptr_t, ...))-1;
;30:
;31:void dllEntry( intptr_t (QDECL *syscallptr)( intptr_t arg,... ) ) {
line 32
;32:  syscall = syscallptr;
ADDRGP4 syscall
ADDRFP4 0
INDIRP4
ASGNP4
line 33
;33:}
LABELV $109
endproc dllEntry 0 0
export PASSFLOAT
proc PASSFLOAT 4 0
line 35
;34:
;35:int PASSFLOAT( float x ) {
line 37
;36:  float  floatTemp;
;37:  floatTemp = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 38
;38:  return *(int *)&floatTemp;
ADDRLP4 0
INDIRI4
RETI4
LABELV $110
endproc PASSFLOAT 4 0
export trap_Print
proc trap_Print 0 8
line 41
;39:}
;40:
;41:void trap_Print( const char *string ) {
line 42
;42:  syscall( UI_PRINT, string );
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 43
;43:}
LABELV $111
endproc trap_Print 0 8
export trap_Error
proc trap_Error 0 8
line 45
;44:
;45:void trap_Error( const char *string ) {
line 46
;46:  syscall( UI_ERROR, string );
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 47
;47:}
LABELV $112
endproc trap_Error 0 8
export trap_Milliseconds
proc trap_Milliseconds 4 4
line 49
;48:
;49:int trap_Milliseconds( void ) {
line 50
;50:  return syscall( UI_MILLISECONDS );
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $113
endproc trap_Milliseconds 4 4
export trap_Cvar_Register
proc trap_Cvar_Register 0 20
line 53
;51:}
;52:
;53:void trap_Cvar_Register( vmCvar_t *cvar, const char *var_name, const char *value, int flags ) {
line 54
;54:  syscall( UI_CVAR_REGISTER, cvar, var_name, value, flags );
CNSTI4 50
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 55
;55:}
LABELV $114
endproc trap_Cvar_Register 0 20
export trap_Cvar_Update
proc trap_Cvar_Update 0 8
line 57
;56:
;57:void trap_Cvar_Update( vmCvar_t *cvar ) {
line 58
;58:  syscall( UI_CVAR_UPDATE, cvar );
CNSTI4 51
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 59
;59:}
LABELV $115
endproc trap_Cvar_Update 0 8
export trap_Cvar_Set
proc trap_Cvar_Set 0 12
line 61
;60:
;61:void trap_Cvar_Set( const char *var_name, const char *value ) {
line 62
;62:  syscall( UI_CVAR_SET, var_name, value );
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 63
;63:}
LABELV $116
endproc trap_Cvar_Set 0 12
export trap_Cvar_VariableValue
proc trap_Cvar_VariableValue 8 8
line 65
;64:
;65:float trap_Cvar_VariableValue( const char *var_name ) {
line 67
;66:  int temp;
;67:  temp = syscall( UI_CVAR_VARIABLEVALUE, var_name );
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 68
;68:  return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $117
endproc trap_Cvar_VariableValue 8 8
export trap_Cvar_VariableStringBuffer
proc trap_Cvar_VariableStringBuffer 0 16
line 71
;69:}
;70:
;71:void trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize ) {
line 72
;72:  syscall( UI_CVAR_VARIABLESTRINGBUFFER, var_name, buffer, bufsize );
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 73
;73:}
LABELV $118
endproc trap_Cvar_VariableStringBuffer 0 16
export trap_Cvar_SetValue
proc trap_Cvar_SetValue 4 12
line 75
;74:
;75:void trap_Cvar_SetValue( const char *var_name, float value ) {
line 76
;76:  syscall( UI_CVAR_SETVALUE, var_name, PASSFLOAT( value ) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 77
;77:}
LABELV $119
endproc trap_Cvar_SetValue 4 12
export trap_Cvar_Reset
proc trap_Cvar_Reset 0 8
line 79
;78:
;79:void trap_Cvar_Reset( const char *name ) {
line 80
;80:  syscall( UI_CVAR_RESET, name );
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 81
;81:}
LABELV $120
endproc trap_Cvar_Reset 0 8
export trap_Cvar_Create
proc trap_Cvar_Create 0 16
line 83
;82:
;83:void trap_Cvar_Create( const char *var_name, const char *var_value, int flags ) {
line 84
;84:  syscall( UI_CVAR_CREATE, var_name, var_value, flags );
CNSTI4 8
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 85
;85:}
LABELV $121
endproc trap_Cvar_Create 0 16
export trap_Cvar_InfoStringBuffer
proc trap_Cvar_InfoStringBuffer 0 16
line 87
;86:
;87:void trap_Cvar_InfoStringBuffer( int bit, char *buffer, int bufsize ) {
line 88
;88:  syscall( UI_CVAR_INFOSTRINGBUFFER, bit, buffer, bufsize );
CNSTI4 9
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 89
;89:}
LABELV $122
endproc trap_Cvar_InfoStringBuffer 0 16
export trap_Argc
proc trap_Argc 4 4
line 91
;90:
;91:int trap_Argc( void ) {
line 92
;92:  return syscall( UI_ARGC );
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $123
endproc trap_Argc 4 4
export trap_Argv
proc trap_Argv 0 16
line 95
;93:}
;94:
;95:void trap_Argv( int n, char *buffer, int bufferLength ) {
line 96
;96:  syscall( UI_ARGV, n, buffer, bufferLength );
CNSTI4 11
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 97
;97:}
LABELV $124
endproc trap_Argv 0 16
export trap_Cmd_ExecuteText
proc trap_Cmd_ExecuteText 0 12
line 99
;98:
;99:void trap_Cmd_ExecuteText( int exec_when, const char *text ) {
line 100
;100:  syscall( UI_CMD_EXECUTETEXT, exec_when, text );
CNSTI4 12
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 101
;101:}
LABELV $125
endproc trap_Cmd_ExecuteText 0 12
export trap_FS_FOpenFile
proc trap_FS_FOpenFile 4 16
line 103
;102:
;103:int trap_FS_FOpenFile( const char *qpath, fileHandle_t *f, fsMode_t mode ) {
line 104
;104:  return syscall( UI_FS_FOPENFILE, qpath, f, mode );
CNSTI4 13
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $126
endproc trap_FS_FOpenFile 4 16
export trap_FS_Read
proc trap_FS_Read 0 16
line 107
;105:}
;106:
;107:void trap_FS_Read( void *buffer, int len, fileHandle_t f ) {
line 108
;108:  syscall( UI_FS_READ, buffer, len, f );
CNSTI4 14
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 109
;109:}
LABELV $127
endproc trap_FS_Read 0 16
export trap_FS_Write
proc trap_FS_Write 0 16
line 111
;110:
;111:void trap_FS_Write( const void *buffer, int len, fileHandle_t f ) {
line 112
;112:  syscall( UI_FS_WRITE, buffer, len, f );
CNSTI4 15
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 113
;113:}
LABELV $128
endproc trap_FS_Write 0 16
export trap_FS_FCloseFile
proc trap_FS_FCloseFile 0 8
line 115
;114:
;115:void trap_FS_FCloseFile( fileHandle_t f ) {
line 116
;116:  syscall( UI_FS_FCLOSEFILE, f );
CNSTI4 16
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 117
;117:}
LABELV $129
endproc trap_FS_FCloseFile 0 8
export trap_FS_GetFileList
proc trap_FS_GetFileList 4 20
line 119
;118:
;119:int trap_FS_GetFileList(  const char *path, const char *extension, char *listbuf, int bufsize ) {
line 120
;120:  return syscall( UI_FS_GETFILELIST, path, extension, listbuf, bufsize );
CNSTI4 17
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $130
endproc trap_FS_GetFileList 4 20
export trap_FS_Seek
proc trap_FS_Seek 4 16
line 123
;121:}
;122:
;123:int trap_FS_Seek( fileHandle_t f, long offset, int origin ) {
line 124
;124:    return syscall( UI_FS_SEEK, f, offset, origin );
CNSTI4 83
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $131
endproc trap_FS_Seek 4 16
export trap_R_RegisterModel
proc trap_R_RegisterModel 4 8
line 127
;125:}
;126:
;127:qhandle_t trap_R_RegisterModel( const char *name ) {
line 128
;128:  return syscall( UI_R_REGISTERMODEL, name );
CNSTI4 18
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $132
endproc trap_R_RegisterModel 4 8
export trap_R_RegisterSkin
proc trap_R_RegisterSkin 4 8
line 131
;129:}
;130:
;131:qhandle_t trap_R_RegisterSkin( const char *name ) {
line 132
;132:  return syscall( UI_R_REGISTERSKIN, name );
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $133
endproc trap_R_RegisterSkin 4 8
export trap_R_RegisterFont
proc trap_R_RegisterFont 0 16
line 135
;133:}
;134:
;135:void trap_R_RegisterFont(const char *fontName, int pointSize, fontInfo_t *font) {
line 136
;136:  syscall( UI_R_REGISTERFONT, fontName, pointSize, font );
CNSTI4 53
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 137
;137:}
LABELV $134
endproc trap_R_RegisterFont 0 16
export trap_R_RegisterShaderNoMip
proc trap_R_RegisterShaderNoMip 4 8
line 139
;138:
;139:qhandle_t trap_R_RegisterShaderNoMip( const char *name ) {
line 140
;140:  return syscall( UI_R_REGISTERSHADERNOMIP, name );
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $135
endproc trap_R_RegisterShaderNoMip 4 8
export trap_R_ClearScene
proc trap_R_ClearScene 0 4
line 143
;141:}
;142:
;143:void trap_R_ClearScene( void ) {
line 144
;144:  syscall( UI_R_CLEARSCENE );
CNSTI4 21
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 145
;145:}
LABELV $136
endproc trap_R_ClearScene 0 4
export trap_R_AddRefEntityToScene
proc trap_R_AddRefEntityToScene 0 8
line 147
;146:
;147:void trap_R_AddRefEntityToScene( const refEntity_t *re ) {
line 148
;148:  syscall( UI_R_ADDREFENTITYTOSCENE, re );
CNSTI4 22
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 149
;149:}
LABELV $137
endproc trap_R_AddRefEntityToScene 0 8
export trap_R_AddPolyToScene
proc trap_R_AddPolyToScene 0 16
line 151
;150:
;151:void trap_R_AddPolyToScene( qhandle_t hShader , int numVerts, const polyVert_t *verts ) {
line 152
;152:  syscall( UI_R_ADDPOLYTOSCENE, hShader, numVerts, verts );
CNSTI4 23
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 153
;153:}
LABELV $138
endproc trap_R_AddPolyToScene 0 16
export trap_R_AddLightToScene
proc trap_R_AddLightToScene 16 24
line 155
;154:
;155:void trap_R_AddLightToScene( const vec3_t org, float intensity, float r, float g, float b ) {
line 156
;156:  syscall( UI_R_ADDLIGHTTOSCENE, org, PASSFLOAT(intensity), PASSFLOAT(r), PASSFLOAT(g), PASSFLOAT(b) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 24
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 157
;157:}
LABELV $139
endproc trap_R_AddLightToScene 16 24
export trap_R_RenderScene
proc trap_R_RenderScene 0 8
line 159
;158:
;159:void trap_R_RenderScene( const refdef_t *fd ) {
line 160
;160:  syscall( UI_R_RENDERSCENE, fd );
CNSTI4 25
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 161
;161:}
LABELV $140
endproc trap_R_RenderScene 0 8
export trap_R_SetColor
proc trap_R_SetColor 0 8
line 163
;162:
;163:void trap_R_SetColor( const float *rgba ) {
line 164
;164:  syscall( UI_R_SETCOLOR, rgba );
CNSTI4 26
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 165
;165:}
LABELV $141
endproc trap_R_SetColor 0 8
export trap_R_DrawStretchPic
proc trap_R_DrawStretchPic 32 40
line 167
;166:
;167:void trap_R_DrawStretchPic( float x, float y, float w, float h, float s1, float t1, float s2, float t2, qhandle_t hShader ) {
line 168
;168:  syscall( UI_R_DRAWSTRETCHPIC, PASSFLOAT(x), PASSFLOAT(y), PASSFLOAT(w), PASSFLOAT(h), PASSFLOAT(s1), PASSFLOAT(t1), PASSFLOAT(s2), PASSFLOAT(t2), hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 20
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 24
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 28
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 27
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 169
;169:}
LABELV $142
endproc trap_R_DrawStretchPic 32 40
export trap_R_ModelBounds
proc trap_R_ModelBounds 0 16
line 171
;170:
;171:void  trap_R_ModelBounds( clipHandle_t model, vec3_t mins, vec3_t maxs ) {
line 172
;172:  syscall( UI_R_MODELBOUNDS, model, mins, maxs );
CNSTI4 54
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 173
;173:}
LABELV $143
endproc trap_R_ModelBounds 0 16
export trap_UpdateScreen
proc trap_UpdateScreen 0 4
line 175
;174:
;175:void trap_UpdateScreen( void ) {
line 176
;176:  syscall( UI_UPDATESCREEN );
CNSTI4 28
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 177
;177:}
LABELV $144
endproc trap_UpdateScreen 0 4
export trap_CM_LerpTag
proc trap_CM_LerpTag 8 28
line 179
;178:
;179:int trap_CM_LerpTag( orientation_t *tag, clipHandle_t mod, int startFrame, int endFrame, float frac, const char *tagName ) {
line 180
;180:  return syscall( UI_CM_LERPTAG, tag, mod, startFrame, endFrame, PASSFLOAT(frac), tagName );
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 29
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $145
endproc trap_CM_LerpTag 8 28
export trap_S_StartLocalSound
proc trap_S_StartLocalSound 0 12
line 183
;181:}
;182:
;183:void trap_S_StartLocalSound( sfxHandle_t sfx, int channelNum ) {
line 184
;184:  syscall( UI_S_STARTLOCALSOUND, sfx, channelNum );
CNSTI4 32
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 185
;185:}
LABELV $146
endproc trap_S_StartLocalSound 0 12
export trap_S_RegisterSound
proc trap_S_RegisterSound 4 12
line 187
;186:
;187:sfxHandle_t  trap_S_RegisterSound( const char *sample, qboolean compressed ) {
line 188
;188:  return syscall( UI_S_REGISTERSOUND, sample, compressed );
CNSTI4 31
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $147
endproc trap_S_RegisterSound 4 12
export trap_Key_KeynumToStringBuf
proc trap_Key_KeynumToStringBuf 0 16
line 191
;189:}
;190:
;191:void trap_Key_KeynumToStringBuf( int keynum, char *buf, int buflen ) {
line 192
;192:  syscall( UI_KEY_KEYNUMTOSTRINGBUF, keynum, buf, buflen );
CNSTI4 33
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 193
;193:}
LABELV $148
endproc trap_Key_KeynumToStringBuf 0 16
export trap_Key_GetBindingBuf
proc trap_Key_GetBindingBuf 0 16
line 195
;194:
;195:void trap_Key_GetBindingBuf( int keynum, char *buf, int buflen ) {
line 196
;196:  syscall( UI_KEY_GETBINDINGBUF, keynum, buf, buflen );
CNSTI4 34
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 197
;197:}
LABELV $149
endproc trap_Key_GetBindingBuf 0 16
export trap_Key_SetBinding
proc trap_Key_SetBinding 0 12
line 199
;198:
;199:void trap_Key_SetBinding( int keynum, const char *binding ) {
line 200
;200:  syscall( UI_KEY_SETBINDING, keynum, binding );
CNSTI4 35
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 201
;201:}
LABELV $150
endproc trap_Key_SetBinding 0 12
export trap_Key_IsDown
proc trap_Key_IsDown 4 8
line 203
;202:
;203:qboolean trap_Key_IsDown( int keynum ) {
line 204
;204:  return syscall( UI_KEY_ISDOWN, keynum );
CNSTI4 36
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $151
endproc trap_Key_IsDown 4 8
export trap_Key_GetOverstrikeMode
proc trap_Key_GetOverstrikeMode 4 4
line 207
;205:}
;206:
;207:qboolean trap_Key_GetOverstrikeMode( void ) {
line 208
;208:  return syscall( UI_KEY_GETOVERSTRIKEMODE );
CNSTI4 37
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $152
endproc trap_Key_GetOverstrikeMode 4 4
export trap_Key_SetOverstrikeMode
proc trap_Key_SetOverstrikeMode 0 8
line 211
;209:}
;210:
;211:void trap_Key_SetOverstrikeMode( qboolean state ) {
line 212
;212:  syscall( UI_KEY_SETOVERSTRIKEMODE, state );
CNSTI4 38
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 213
;213:}
LABELV $153
endproc trap_Key_SetOverstrikeMode 0 8
export trap_Key_ClearStates
proc trap_Key_ClearStates 0 4
line 215
;214:
;215:void trap_Key_ClearStates( void ) {
line 216
;216:  syscall( UI_KEY_CLEARSTATES );
CNSTI4 39
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 217
;217:}
LABELV $154
endproc trap_Key_ClearStates 0 4
export trap_Key_GetCatcher
proc trap_Key_GetCatcher 4 4
line 219
;218:
;219:int trap_Key_GetCatcher( void ) {
line 220
;220:  return syscall( UI_KEY_GETCATCHER );
CNSTI4 40
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $155
endproc trap_Key_GetCatcher 4 4
export trap_Key_SetCatcher
proc trap_Key_SetCatcher 0 8
line 223
;221:}
;222:
;223:void trap_Key_SetCatcher( int catcher ) {
line 224
;224:  syscall( UI_KEY_SETCATCHER, catcher );
CNSTI4 41
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 225
;225:}
LABELV $156
endproc trap_Key_SetCatcher 0 8
export trap_GetClipboardData
proc trap_GetClipboardData 0 12
line 227
;226:
;227:void trap_GetClipboardData( char *buf, int bufsize ) {
line 228
;228:  syscall( UI_GETCLIPBOARDDATA, buf, bufsize );
CNSTI4 42
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 229
;229:}
LABELV $157
endproc trap_GetClipboardData 0 12
export trap_GetClientState
proc trap_GetClientState 0 8
line 231
;230:
;231:void trap_GetClientState( uiClientState_t *state ) {
line 232
;232:  syscall( UI_GETCLIENTSTATE, state );
CNSTI4 44
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 233
;233:}
LABELV $158
endproc trap_GetClientState 0 8
export trap_GetGlconfig
proc trap_GetGlconfig 0 8
line 235
;234:
;235:void trap_GetGlconfig( glconfig_t *glconfig ) {
line 236
;236:  syscall( UI_GETGLCONFIG, glconfig );
CNSTI4 43
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 237
;237:}
LABELV $159
endproc trap_GetGlconfig 0 8
export trap_GetConfigString
proc trap_GetConfigString 4 16
line 239
;238:
;239:int trap_GetConfigString( int index, char* buff, int buffsize ) {
line 240
;240:  return syscall( UI_GETCONFIGSTRING, index, buff, buffsize );
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $160
endproc trap_GetConfigString 4 16
export trap_LAN_GetServerCount
proc trap_LAN_GetServerCount 4 8
line 243
;241:}
;242:
;243:int  trap_LAN_GetServerCount( int source ) {
line 244
;244:  return syscall( UI_LAN_GETSERVERCOUNT, source );
CNSTI4 63
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $161
endproc trap_LAN_GetServerCount 4 8
export trap_LAN_GetServerAddressString
proc trap_LAN_GetServerAddressString 0 20
line 247
;245:}
;246:
;247:void trap_LAN_GetServerAddressString( int source, int n, char *buf, int buflen ) {
line 248
;248:  syscall( UI_LAN_GETSERVERADDRESSSTRING, source, n, buf, buflen );
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 249
;249:}
LABELV $162
endproc trap_LAN_GetServerAddressString 0 20
export trap_LAN_GetServerInfo
proc trap_LAN_GetServerInfo 0 20
line 251
;250:
;251:void trap_LAN_GetServerInfo( int source, int n, char *buf, int buflen ) {
line 252
;252:  syscall( UI_LAN_GETSERVERINFO, source, n, buf, buflen );
CNSTI4 65
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 253
;253:}
LABELV $163
endproc trap_LAN_GetServerInfo 0 20
export trap_LAN_GetServerPing
proc trap_LAN_GetServerPing 4 12
line 255
;254:
;255:int trap_LAN_GetServerPing( int source, int n ) {
line 256
;256:  return syscall( UI_LAN_GETSERVERPING, source, n );
CNSTI4 80
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $164
endproc trap_LAN_GetServerPing 4 12
export trap_LAN_GetPingQueueCount
proc trap_LAN_GetPingQueueCount 4 4
line 259
;257:}
;258:
;259:int trap_LAN_GetPingQueueCount( void ) {
line 260
;260:  return syscall( UI_LAN_GETPINGQUEUECOUNT );
CNSTI4 46
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $165
endproc trap_LAN_GetPingQueueCount 4 4
export trap_LAN_ServerStatus
proc trap_LAN_ServerStatus 4 16
line 263
;261:}
;262:
;263:int trap_LAN_ServerStatus( const char *serverAddress, char *serverStatus, int maxLen ) {
line 264
;264:  return syscall( UI_LAN_SERVERSTATUS, serverAddress, serverStatus, maxLen );
CNSTI4 79
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $166
endproc trap_LAN_ServerStatus 4 16
export trap_LAN_SaveCachedServers
proc trap_LAN_SaveCachedServers 0 4
line 267
;265:}
;266:
;267:void trap_LAN_SaveCachedServers( void ) {
line 268
;268:  syscall( UI_LAN_SAVECACHEDSERVERS );
CNSTI4 70
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 269
;269:}
LABELV $167
endproc trap_LAN_SaveCachedServers 0 4
export trap_LAN_LoadCachedServers
proc trap_LAN_LoadCachedServers 0 4
line 271
;270:
;271:void trap_LAN_LoadCachedServers( void ) {
line 272
;272:  syscall( UI_LAN_LOADCACHEDSERVERS );
CNSTI4 69
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 273
;273:}
LABELV $168
endproc trap_LAN_LoadCachedServers 0 4
export trap_LAN_ResetPings
proc trap_LAN_ResetPings 0 8
line 275
;274:
;275:void trap_LAN_ResetPings(int n) {
line 276
;276:  syscall( UI_LAN_RESETPINGS, n );
CNSTI4 68
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 277
;277:}
LABELV $169
endproc trap_LAN_ResetPings 0 8
export trap_LAN_ClearPing
proc trap_LAN_ClearPing 0 8
line 279
;278:
;279:void trap_LAN_ClearPing( int n ) {
line 280
;280:  syscall( UI_LAN_CLEARPING, n );
CNSTI4 47
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 281
;281:}
LABELV $170
endproc trap_LAN_ClearPing 0 8
export trap_LAN_GetPing
proc trap_LAN_GetPing 0 20
line 283
;282:
;283:void trap_LAN_GetPing( int n, char *buf, int buflen, int *pingtime ) {
line 284
;284:  syscall( UI_LAN_GETPING, n, buf, buflen, pingtime );
CNSTI4 48
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 285
;285:}
LABELV $171
endproc trap_LAN_GetPing 0 20
export trap_LAN_GetPingInfo
proc trap_LAN_GetPingInfo 0 16
line 287
;286:
;287:void trap_LAN_GetPingInfo( int n, char *buf, int buflen ) {
line 288
;288:  syscall( UI_LAN_GETPINGINFO, n, buf, buflen );
CNSTI4 49
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 289
;289:}
LABELV $172
endproc trap_LAN_GetPingInfo 0 16
export trap_LAN_MarkServerVisible
proc trap_LAN_MarkServerVisible 0 16
line 291
;290:
;291:void trap_LAN_MarkServerVisible( int source, int n, qboolean visible ) {
line 292
;292:  syscall( UI_LAN_MARKSERVERVISIBLE, source, n, visible );
CNSTI4 66
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 293
;293:}
LABELV $173
endproc trap_LAN_MarkServerVisible 0 16
export trap_LAN_ServerIsVisible
proc trap_LAN_ServerIsVisible 4 12
line 295
;294:
;295:int trap_LAN_ServerIsVisible( int source, int n) {
line 296
;296:  return syscall( UI_LAN_SERVERISVISIBLE, source, n );
CNSTI4 81
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $174
endproc trap_LAN_ServerIsVisible 4 12
export trap_LAN_UpdateVisiblePings
proc trap_LAN_UpdateVisiblePings 4 8
line 299
;297:}
;298:
;299:qboolean trap_LAN_UpdateVisiblePings( int source ) {
line 300
;300:  return syscall( UI_LAN_UPDATEVISIBLEPINGS, source );
CNSTI4 67
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $175
endproc trap_LAN_UpdateVisiblePings 4 8
export trap_LAN_AddServer
proc trap_LAN_AddServer 4 16
line 303
;301:}
;302:
;303:int trap_LAN_AddServer(int source, const char *name, const char *addr) {
line 304
;304:  return syscall( UI_LAN_ADDSERVER, source, name, addr );
CNSTI4 71
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $176
endproc trap_LAN_AddServer 4 16
export trap_LAN_RemoveServer
proc trap_LAN_RemoveServer 0 12
line 307
;305:}
;306:
;307:void trap_LAN_RemoveServer(int source, const char *addr) {
line 308
;308:  syscall( UI_LAN_REMOVESERVER, source, addr );
CNSTI4 72
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 309
;309:}
LABELV $177
endproc trap_LAN_RemoveServer 0 12
export trap_LAN_CompareServers
proc trap_LAN_CompareServers 4 24
line 311
;310:
;311:int trap_LAN_CompareServers( int source, int sortKey, int sortDir, int s1, int s2 ) {
line 312
;312:  return syscall( UI_LAN_COMPARESERVERS, source, sortKey, sortDir, s1, s2 );
CNSTI4 82
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $178
endproc trap_LAN_CompareServers 4 24
export trap_MemoryRemaining
proc trap_MemoryRemaining 4 4
line 315
;313:}
;314:
;315:int trap_MemoryRemaining( void ) {
line 316
;316:  return syscall( UI_MEMORY_REMAINING );
CNSTI4 52
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $179
endproc trap_MemoryRemaining 4 4
export trap_PC_AddGlobalDefine
proc trap_PC_AddGlobalDefine 4 8
line 319
;317:}
;318:
;319:int trap_PC_AddGlobalDefine( char *define ) {
line 320
;320:  return syscall( UI_PARSE_ADD_GLOBAL_DEFINE, define );
CNSTI4 55
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $180
endproc trap_PC_AddGlobalDefine 4 8
export trap_PC_LoadSource
proc trap_PC_LoadSource 4 8
line 323
;321:}
;322:
;323:int trap_PC_LoadSource( const char *filename ) {
line 324
;324:  return syscall( UI_PARSE_LOAD_SOURCE, filename );
CNSTI4 56
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $181
endproc trap_PC_LoadSource 4 8
export trap_PC_FreeSource
proc trap_PC_FreeSource 4 8
line 327
;325:}
;326:
;327:int trap_PC_FreeSource( int handle ) {
line 328
;328:  return syscall( UI_PARSE_FREE_SOURCE, handle );
CNSTI4 57
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $182
endproc trap_PC_FreeSource 4 8
export trap_PC_ReadToken
proc trap_PC_ReadToken 4 12
line 331
;329:}
;330:
;331:int trap_PC_ReadToken( int handle, pc_token_t *pc_token ) {
line 332
;332:  return syscall( UI_PARSE_READ_TOKEN, handle, pc_token );
CNSTI4 58
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $183
endproc trap_PC_ReadToken 4 12
export trap_PC_SourceFileAndLine
proc trap_PC_SourceFileAndLine 4 16
line 335
;333:}
;334:
;335:int trap_PC_SourceFileAndLine( int handle, char *filename, int *line ) {
line 336
;336:  return syscall( UI_PARSE_SOURCE_FILE_AND_LINE, handle, filename, line );
CNSTI4 59
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $184
endproc trap_PC_SourceFileAndLine 4 16
export trap_S_StopBackgroundTrack
proc trap_S_StopBackgroundTrack 0 4
line 339
;337:}
;338:
;339:void trap_S_StopBackgroundTrack( void ) {
line 340
;340:  syscall( UI_S_STOPBACKGROUNDTRACK );
CNSTI4 60
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 341
;341:}
LABELV $185
endproc trap_S_StopBackgroundTrack 0 4
export trap_S_StartBackgroundTrack
proc trap_S_StartBackgroundTrack 0 12
line 343
;342:
;343:void trap_S_StartBackgroundTrack( const char *intro, const char *loop) {
line 344
;344:  syscall( UI_S_STARTBACKGROUNDTRACK, intro, loop );
CNSTI4 61
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 345
;345:}
LABELV $186
endproc trap_S_StartBackgroundTrack 0 12
export trap_RealTime
proc trap_RealTime 4 8
line 347
;346:
;347:int trap_RealTime(qtime_t *qtime) {
line 348
;348:  return syscall( UI_REAL_TIME, qtime );
CNSTI4 62
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $187
endproc trap_RealTime 4 8
export trap_CIN_PlayCinematic
proc trap_CIN_PlayCinematic 4 28
line 352
;349:}
;350:
;351:// this returns a handle.  arg0 is the name in the format "idlogo.roq", set arg1 to NULL, alteredstates to qfalse (do not alter gamestate)
;352:int trap_CIN_PlayCinematic( const char *arg0, int xpos, int ypos, int width, int height, int bits) {
line 353
;353:  return syscall(UI_CIN_PLAYCINEMATIC, arg0, xpos, ypos, width, height, bits);
CNSTI4 73
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $188
endproc trap_CIN_PlayCinematic 4 28
export trap_CIN_StopCinematic
proc trap_CIN_StopCinematic 4 8
line 358
;354:}
;355:
;356:// stops playing the cinematic and ends it.  should always return FMV_EOF
;357:// cinematics must be stopped in reverse order of when they are started
;358:e_status trap_CIN_StopCinematic(int handle) {
line 359
;359:  return syscall(UI_CIN_STOPCINEMATIC, handle);
CNSTI4 74
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $189
endproc trap_CIN_StopCinematic 4 8
export trap_CIN_RunCinematic
proc trap_CIN_RunCinematic 4 8
line 364
;360:}
;361:
;362:
;363:// will run a frame of the cinematic but will not draw it.  Will return FMV_EOF if the end of the cinematic has been reached.
;364:e_status trap_CIN_RunCinematic (int handle) {
line 365
;365:  return syscall(UI_CIN_RUNCINEMATIC, handle);
CNSTI4 75
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $190
endproc trap_CIN_RunCinematic 4 8
export trap_CIN_DrawCinematic
proc trap_CIN_DrawCinematic 0 8
line 370
;366:}
;367:
;368:
;369:// draws the current frame
;370:void trap_CIN_DrawCinematic (int handle) {
line 371
;371:  syscall(UI_CIN_DRAWCINEMATIC, handle);
CNSTI4 76
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 372
;372:}
LABELV $191
endproc trap_CIN_DrawCinematic 0 8
export trap_CIN_SetExtents
proc trap_CIN_SetExtents 0 24
line 376
;373:
;374:
;375:// allows you to resize the animation dynamically
;376:void trap_CIN_SetExtents (int handle, int x, int y, int w, int h) {
line 377
;377:  syscall(UI_CIN_SETEXTENTS, handle, x, y, w, h);
CNSTI4 77
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 378
;378:}
LABELV $192
endproc trap_CIN_SetExtents 0 24
export trap_R_RemapShader
proc trap_R_RemapShader 0 16
line 381
;379:
;380:
;381:void  trap_R_RemapShader( const char *oldShader, const char *newShader, const char *timeOffset ) {
line 382
;382:  syscall( UI_R_REMAP_SHADER, oldShader, newShader, timeOffset );
CNSTI4 78
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 383
;383:}
LABELV $193
endproc trap_R_RemapShader 0 16
export trap_SetPbClStatus
proc trap_SetPbClStatus 0 8
line 385
;384:
;385:void trap_SetPbClStatus( int status ) {
line 386
;386:    syscall( UI_SET_PBCLSTATUS, status );
CNSTI4 84
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 387
;387:}
LABELV $194
endproc trap_SetPbClStatus 0 8
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import UI_LoadBestScores
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import uiInfo
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_ShowPostGame
import UI_AdjustTimeByGame
import _UI_SetActiveMenu
import UI_LoadMenus
import UI_Load
import UI_Report
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_bank
import ui_serverStatusTimeOut
import ui_bigFont
import ui_smallFont
import ui_scoreTime
import ui_scoreShutoutBonus
import ui_scoreSkillBonus
import ui_scoreTimeBonus
import ui_scoreBase
import ui_scoreTeam
import ui_scorePerfect
import ui_scoreScore
import ui_scoreGauntlets
import ui_scoreAssists
import ui_scoreDefends
import ui_scoreExcellents
import ui_scoreImpressives
import ui_scoreAccuracy
import ui_singlePlayerActive
import ui_lastServerRefresh_3
import ui_lastServerRefresh_2
import ui_lastServerRefresh_1
import ui_lastServerRefresh_0
import ui_selectedPlayerName
import ui_selectedPlayer
import ui_currentOpponent
import ui_mapIndex
import ui_currentNetMap
import ui_currentMap
import ui_currentTier
import ui_menuFiles
import ui_opponentName
import ui_dedicated
import ui_serverFilterType
import ui_netSource
import ui_joinGameType
import ui_actualNetGameType
import ui_netGameType
import ui_gameType
import ui_fragLimit
import ui_captureLimit
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import g_nameBind2
import g_nameBind1
import BindingFromName
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
