data
align 4
LABELV syscall
byte 4 4294967295
export dllEntry
code
proc dllEntry 0 0
file "..\..\..\..\src/cgame/cg_syscalls.c"
line 34
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
;24:// cg_syscalls.c -- this file is only included when building a dll
;25:// cg_syscalls.asm is included instead when building a qvm
;26:
;27:
;28:#include "cg_local.h"
;29:
;30:static intptr_t (QDECL *syscall)( intptr_t arg, ... ) = (intptr_t (QDECL *)( intptr_t, ...))-1;
;31:
;32:
;33:void dllEntry( intptr_t (QDECL  *syscallptr)( intptr_t arg,... ) )
;34:{
line 35
;35:  syscall = syscallptr;
ADDRGP4 syscall
ADDRFP4 0
INDIRP4
ASGNP4
line 36
;36:}
LABELV $99
endproc dllEntry 0 0
export PASSFLOAT
proc PASSFLOAT 4 0
line 40
;37:
;38:
;39:int PASSFLOAT( float x )
;40:{
line 42
;41:  float floatTemp;
;42:  floatTemp = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 43
;43:  return *(int *)&floatTemp;
ADDRLP4 0
INDIRI4
RETI4
LABELV $100
endproc PASSFLOAT 4 0
export trap_Print
proc trap_Print 0 8
line 47
;44:}
;45:
;46:void trap_Print( const char *fmt )
;47:{
line 48
;48:  syscall( CG_PRINT, fmt );
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 49
;49:}
LABELV $101
endproc trap_Print 0 8
export trap_Error
proc trap_Error 0 8
line 52
;50:
;51:void trap_Error( const char *fmt )
;52:{
line 53
;53:  syscall( CG_ERROR, fmt );
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 54
;54:}
LABELV $102
endproc trap_Error 0 8
export trap_Milliseconds
proc trap_Milliseconds 4 4
line 57
;55:
;56:int trap_Milliseconds( void )
;57:{
line 58
;58:  return syscall( CG_MILLISECONDS );
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
LABELV $103
endproc trap_Milliseconds 4 4
export trap_Cvar_Register
proc trap_Cvar_Register 0 20
line 62
;59:}
;60:
;61:void trap_Cvar_Register( vmCvar_t *vmCvar, const char *varName, const char *defaultValue, int flags )
;62:{
line 63
;63:  syscall( CG_CVAR_REGISTER, vmCvar, varName, defaultValue, flags );
CNSTI4 3
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
line 64
;64:}
LABELV $104
endproc trap_Cvar_Register 0 20
export trap_Cvar_Update
proc trap_Cvar_Update 0 8
line 67
;65:
;66:void trap_Cvar_Update( vmCvar_t *vmCvar )
;67:{
line 68
;68:  syscall( CG_CVAR_UPDATE, vmCvar );
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 69
;69:}
LABELV $105
endproc trap_Cvar_Update 0 8
export trap_Cvar_Set
proc trap_Cvar_Set 0 12
line 72
;70:
;71:void trap_Cvar_Set( const char *var_name, const char *value )
;72:{
line 73
;73:  syscall( CG_CVAR_SET, var_name, value );
CNSTI4 5
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
line 74
;74:}
LABELV $106
endproc trap_Cvar_Set 0 12
export trap_Cvar_VariableStringBuffer
proc trap_Cvar_VariableStringBuffer 0 16
line 77
;75:
;76:void trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize )
;77:{
line 78
;78:  syscall( CG_CVAR_VARIABLESTRINGBUFFER, var_name, buffer, bufsize );
CNSTI4 6
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
line 79
;79:}
LABELV $107
endproc trap_Cvar_VariableStringBuffer 0 16
export trap_Argc
proc trap_Argc 4 4
line 82
;80:
;81:int trap_Argc( void )
;82:{
line 83
;83:  return syscall( CG_ARGC );
CNSTI4 7
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $108
endproc trap_Argc 4 4
export trap_Argv
proc trap_Argv 0 16
line 87
;84:}
;85:
;86:void  trap_Argv( int n, char *buffer, int bufferLength )
;87:{
line 88
;88:  syscall( CG_ARGV, n, buffer, bufferLength );
CNSTI4 8
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
LABELV $109
endproc trap_Argv 0 16
export trap_Args
proc trap_Args 0 12
line 92
;90:
;91:void  trap_Args( char *buffer, int bufferLength )
;92:{
line 93
;93:  syscall( CG_ARGS, buffer, bufferLength );
CNSTI4 9
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
line 94
;94:}
LABELV $110
endproc trap_Args 0 12
export trap_LiteralArgs
proc trap_LiteralArgs 0 12
line 97
;95:
;96:void  trap_LiteralArgs( char *buffer, int bufferLength )
;97:{
line 98
;98:  syscall( CG_LITERAL_ARGS, buffer, bufferLength );
CNSTI4 91
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
line 99
;99:}
LABELV $111
endproc trap_LiteralArgs 0 12
export trap_FS_FOpenFile
proc trap_FS_FOpenFile 4 16
line 102
;100:
;101:int trap_FS_FOpenFile( const char *qpath, fileHandle_t *f, fsMode_t mode )
;102:{
line 103
;103:  return syscall( CG_FS_FOPENFILE, qpath, f, mode );
CNSTI4 10
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
LABELV $112
endproc trap_FS_FOpenFile 4 16
export trap_FS_Read
proc trap_FS_Read 0 16
line 107
;104:}
;105:
;106:void  trap_FS_Read( void *buffer, int len, fileHandle_t f )
;107:{
line 108
;108:  syscall( CG_FS_READ, buffer, len, f );
CNSTI4 11
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
LABELV $113
endproc trap_FS_Read 0 16
export trap_FS_Write
proc trap_FS_Write 0 16
line 112
;110:
;111:void trap_FS_Write( const void *buffer, int len, fileHandle_t f )
;112:{
line 113
;113:  syscall( CG_FS_WRITE, buffer, len, f );
CNSTI4 12
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
line 114
;114:}
LABELV $114
endproc trap_FS_Write 0 16
export trap_FS_FCloseFile
proc trap_FS_FCloseFile 0 8
line 117
;115:
;116:void  trap_FS_FCloseFile( fileHandle_t f )
;117:{
line 118
;118:  syscall( CG_FS_FCLOSEFILE, f );
CNSTI4 13
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 119
;119:}
LABELV $115
endproc trap_FS_FCloseFile 0 8
export trap_FS_Seek
proc trap_FS_Seek 0 16
line 122
;120:
;121:void trap_FS_Seek( fileHandle_t f, long offset, fsOrigin_t origin )
;122:{
line 123
;123:  syscall( CG_FS_SEEK, f, offset, origin );
CNSTI4 89
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
line 124
;124:}
LABELV $116
endproc trap_FS_Seek 0 16
export trap_FS_GetFileList
proc trap_FS_GetFileList 4 20
line 127
;125:
;126:int trap_FS_GetFileList( const char *path, const char *extension, char *listbuf, int bufsize )
;127:{
line 128
;128:  return syscall( CG_FS_GETFILELIST, path, extension, listbuf, bufsize );
CNSTI4 90
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
LABELV $117
endproc trap_FS_GetFileList 4 20
export trap_SendConsoleCommand
proc trap_SendConsoleCommand 0 8
line 132
;129:}
;130:
;131:void  trap_SendConsoleCommand( const char *text )
;132:{
line 133
;133:  syscall( CG_SENDCONSOLECOMMAND, text );
CNSTI4 14
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 134
;134:}
LABELV $118
endproc trap_SendConsoleCommand 0 8
export trap_AddCommand
proc trap_AddCommand 0 8
line 137
;135:
;136:void  trap_AddCommand( const char *cmdName )
;137:{
line 138
;138:  syscall( CG_ADDCOMMAND, cmdName );
CNSTI4 15
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 139
;139:}
LABELV $119
endproc trap_AddCommand 0 8
export trap_RemoveCommand
proc trap_RemoveCommand 0 8
line 142
;140:
;141:void  trap_RemoveCommand( const char *cmdName )
;142:{
line 143
;143:    syscall( CG_REMOVECOMMAND, cmdName );
CNSTI4 72
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 144
;144:}
LABELV $120
endproc trap_RemoveCommand 0 8
export trap_SendClientCommand
proc trap_SendClientCommand 0 8
line 147
;145:
;146:void  trap_SendClientCommand( const char *s )
;147:{
line 148
;148:  syscall( CG_SENDCLIENTCOMMAND, s );
CNSTI4 16
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
LABELV $121
endproc trap_SendClientCommand 0 8
export trap_UpdateScreen
proc trap_UpdateScreen 0 4
line 152
;150:
;151:void  trap_UpdateScreen( void )
;152:{
line 153
;153:  syscall( CG_UPDATESCREEN );
CNSTI4 17
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 154
;154:}
LABELV $122
endproc trap_UpdateScreen 0 4
export trap_CM_LoadMap
proc trap_CM_LoadMap 0 8
line 157
;155:
;156:void  trap_CM_LoadMap( const char *mapname )
;157:{
line 158
;158:  syscall( CG_CM_LOADMAP, mapname );
CNSTI4 18
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 159
;159:}
LABELV $123
endproc trap_CM_LoadMap 0 8
export trap_CM_NumInlineModels
proc trap_CM_NumInlineModels 4 4
line 162
;160:
;161:int   trap_CM_NumInlineModels( void )
;162:{
line 163
;163:  return syscall( CG_CM_NUMINLINEMODELS );
CNSTI4 19
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $124
endproc trap_CM_NumInlineModels 4 4
export trap_CM_InlineModel
proc trap_CM_InlineModel 4 8
line 167
;164:}
;165:
;166:clipHandle_t trap_CM_InlineModel( int index )
;167:{
line 168
;168:  return syscall( CG_CM_INLINEMODEL, index );
CNSTI4 20
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
LABELV $125
endproc trap_CM_InlineModel 4 8
export trap_CM_TempBoxModel
proc trap_CM_TempBoxModel 4 12
line 172
;169:}
;170:
;171:clipHandle_t trap_CM_TempBoxModel( const vec3_t mins, const vec3_t maxs )
;172:{
line 173
;173:  return syscall( CG_CM_TEMPBOXMODEL, mins, maxs );
CNSTI4 22
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
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
LABELV $126
endproc trap_CM_TempBoxModel 4 12
export trap_CM_TempCapsuleModel
proc trap_CM_TempCapsuleModel 4 12
line 177
;174:}
;175:
;176:clipHandle_t trap_CM_TempCapsuleModel( const vec3_t mins, const vec3_t maxs )
;177:{
line 178
;178:  return syscall( CG_CM_TEMPCAPSULEMODEL, mins, maxs );
CNSTI4 82
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
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
LABELV $127
endproc trap_CM_TempCapsuleModel 4 12
export trap_CM_PointContents
proc trap_CM_PointContents 4 12
line 182
;179:}
;180:
;181:int   trap_CM_PointContents( const vec3_t p, clipHandle_t model )
;182:{
line 183
;183:  return syscall( CG_CM_POINTCONTENTS, p, model );
CNSTI4 23
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
LABELV $128
endproc trap_CM_PointContents 4 12
export trap_CM_TransformedPointContents
proc trap_CM_TransformedPointContents 4 20
line 188
;184:}
;185:
;186:int   trap_CM_TransformedPointContents( const vec3_t p, clipHandle_t model, const vec3_t origin,
;187:                                        const vec3_t angles )
;188:{
line 189
;189:  return syscall( CG_CM_TRANSFORMEDPOINTCONTENTS, p, model, origin, angles );
CNSTI4 24
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
ADDRFP4 12
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
LABELV $129
endproc trap_CM_TransformedPointContents 4 20
export trap_CM_BoxTrace
proc trap_CM_BoxTrace 0 32
line 195
;190:}
;191:
;192:void  trap_CM_BoxTrace( trace_t *results, const vec3_t start, const vec3_t end,
;193:              const vec3_t mins, const vec3_t maxs,
;194:              clipHandle_t model, int brushmask )
;195:{
line 196
;196:  syscall( CG_CM_BOXTRACE, results, start, end, mins, maxs, model, brushmask );
CNSTI4 25
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
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 197
;197:}
LABELV $130
endproc trap_CM_BoxTrace 0 32
export trap_CM_CapsuleTrace
proc trap_CM_CapsuleTrace 0 32
line 202
;198:
;199:void  trap_CM_CapsuleTrace( trace_t *results, const vec3_t start, const vec3_t end,
;200:              const vec3_t mins, const vec3_t maxs,
;201:              clipHandle_t model, int brushmask )
;202:{
line 203
;203:  syscall( CG_CM_CAPSULETRACE, results, start, end, mins, maxs, model, brushmask );
CNSTI4 83
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
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 204
;204:}
LABELV $131
endproc trap_CM_CapsuleTrace 0 32
export trap_CM_TransformedBoxTrace
proc trap_CM_TransformedBoxTrace 0 40
line 210
;205:
;206:void  trap_CM_TransformedBoxTrace( trace_t *results, const vec3_t start, const vec3_t end,
;207:              const vec3_t mins, const vec3_t maxs,
;208:              clipHandle_t model, int brushmask,
;209:              const vec3_t origin, const vec3_t angles )
;210:{
line 211
;211:  syscall( CG_CM_TRANSFORMEDBOXTRACE, results, start, end, mins, maxs, model, brushmask, origin, angles );
CNSTI4 26
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
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 212
;212:}
LABELV $132
endproc trap_CM_TransformedBoxTrace 0 40
export trap_CM_TransformedCapsuleTrace
proc trap_CM_TransformedCapsuleTrace 0 40
line 218
;213:
;214:void  trap_CM_TransformedCapsuleTrace( trace_t *results, const vec3_t start, const vec3_t end,
;215:              const vec3_t mins, const vec3_t maxs,
;216:              clipHandle_t model, int brushmask,
;217:              const vec3_t origin, const vec3_t angles )
;218:{
line 219
;219:  syscall( CG_CM_TRANSFORMEDCAPSULETRACE, results, start, end, mins, maxs, model, brushmask, origin, angles );
CNSTI4 84
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
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 220
;220:}
LABELV $133
endproc trap_CM_TransformedCapsuleTrace 0 40
export trap_CM_BiSphereTrace
proc trap_CM_BiSphereTrace 8 32
line 225
;221:
;222:void trap_CM_BiSphereTrace( trace_t *results, const vec3_t start,
;223:             const vec3_t end, float startRad, float endRad,
;224:             clipHandle_t model, int mask )
;225:{
line 226
;226:  syscall( CG_CM_BISPHERETRACE, results, start, end,
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 92
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
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 228
;227:      PASSFLOAT( startRad ), PASSFLOAT( endRad ), model, mask );
;228:}
LABELV $134
endproc trap_CM_BiSphereTrace 8 32
export trap_CM_TransformedBiSphereTrace
proc trap_CM_TransformedBiSphereTrace 8 36
line 234
;229:
;230:void trap_CM_TransformedBiSphereTrace( trace_t *results, const vec3_t start,
;231:             const vec3_t end, float startRad, float endRad,
;232:             clipHandle_t model, int mask,
;233:             const vec3_t origin )
;234:{
line 235
;235:  syscall( CG_CM_TRANSFORMEDBISPHERETRACE, results, start, end, PASSFLOAT( startRad ),
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 93
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
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 237
;236:      PASSFLOAT( endRad ), model, mask, origin );
;237:}
LABELV $135
endproc trap_CM_TransformedBiSphereTrace 8 36
export trap_CM_MarkFragments
proc trap_CM_MarkFragments 4 32
line 243
;238:
;239:int   trap_CM_MarkFragments( int numPoints, const vec3_t *points,
;240:        const vec3_t projection,
;241:        int maxPoints, vec3_t pointBuffer,
;242:        int maxFragments, markFragment_t *fragmentBuffer )
;243:{
line 244
;244:  return syscall( CG_CM_MARKFRAGMENTS, numPoints, points, projection, maxPoints,
CNSTI4 27
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
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
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
LABELV $136
endproc trap_CM_MarkFragments 4 32
export trap_S_StartSound
proc trap_S_StartSound 0 20
line 249
;245:                  pointBuffer, maxFragments, fragmentBuffer );
;246:}
;247:
;248:void  trap_S_StartSound( vec3_t origin, int entityNum, int entchannel, sfxHandle_t sfx )
;249:{
line 250
;250:  syscall( CG_S_STARTSOUND, origin, entityNum, entchannel, sfx );
CNSTI4 28
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
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 251
;251:}
LABELV $137
endproc trap_S_StartSound 0 20
export trap_S_StartLocalSound
proc trap_S_StartLocalSound 0 12
line 254
;252:
;253:void  trap_S_StartLocalSound( sfxHandle_t sfx, int channelNum )
;254:{
line 255
;255:  syscall( CG_S_STARTLOCALSOUND, sfx, channelNum );
CNSTI4 29
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
line 256
;256:}
LABELV $138
endproc trap_S_StartLocalSound 0 12
export trap_S_ClearLoopingSounds
proc trap_S_ClearLoopingSounds 0 8
line 259
;257:
;258:void  trap_S_ClearLoopingSounds( qboolean killall )
;259:{
line 260
;260:  syscall( CG_S_CLEARLOOPINGSOUNDS, killall );
CNSTI4 30
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 261
;261:}
LABELV $139
endproc trap_S_ClearLoopingSounds 0 8
export trap_S_AddLoopingSound
proc trap_S_AddLoopingSound 0 20
line 264
;262:
;263:void  trap_S_AddLoopingSound( int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx )
;264:{
line 265
;265:  syscall( CG_S_ADDLOOPINGSOUND, entityNum, origin, velocity, sfx );
CNSTI4 31
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
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 266
;266:}
LABELV $140
endproc trap_S_AddLoopingSound 0 20
export trap_S_AddRealLoopingSound
proc trap_S_AddRealLoopingSound 0 20
line 269
;267:
;268:void  trap_S_AddRealLoopingSound( int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx )
;269:{
line 270
;270:  syscall( CG_S_ADDREALLOOPINGSOUND, entityNum, origin, velocity, sfx );
CNSTI4 80
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
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 271
;271:}
LABELV $141
endproc trap_S_AddRealLoopingSound 0 20
export trap_S_StopLoopingSound
proc trap_S_StopLoopingSound 0 8
line 274
;272:
;273:void  trap_S_StopLoopingSound( int entityNum )
;274:{
line 275
;275:  syscall( CG_S_STOPLOOPINGSOUND, entityNum );
CNSTI4 81
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 276
;276:}
LABELV $142
endproc trap_S_StopLoopingSound 0 8
export trap_S_UpdateEntityPosition
proc trap_S_UpdateEntityPosition 0 12
line 279
;277:
;278:void  trap_S_UpdateEntityPosition( int entityNum, const vec3_t origin )
;279:{
line 280
;280:  syscall( CG_S_UPDATEENTITYPOSITION, entityNum, origin );
CNSTI4 32
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
line 281
;281:}
LABELV $143
endproc trap_S_UpdateEntityPosition 0 12
export trap_S_Respatialize
proc trap_S_Respatialize 0 20
line 284
;282:
;283:void  trap_S_Respatialize( int entityNum, const vec3_t origin, vec3_t axis[3], int inwater )
;284:{
line 285
;285:  syscall( CG_S_RESPATIALIZE, entityNum, origin, axis, inwater );
CNSTI4 33
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
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 286
;286:}
LABELV $144
endproc trap_S_Respatialize 0 20
export trap_S_RegisterSound
proc trap_S_RegisterSound 4 12
line 289
;287:
;288:sfxHandle_t trap_S_RegisterSound( const char *sample, qboolean compressed )
;289:{
line 290
;290:  return syscall( CG_S_REGISTERSOUND, sample, compressed );
CNSTI4 34
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
LABELV $145
endproc trap_S_RegisterSound 4 12
export trap_S_StartBackgroundTrack
proc trap_S_StartBackgroundTrack 0 12
line 294
;291:}
;292:
;293:void  trap_S_StartBackgroundTrack( const char *intro, const char *loop )
;294:{
line 295
;295:  syscall( CG_S_STARTBACKGROUNDTRACK, intro, loop );
CNSTI4 35
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
line 296
;296:}
LABELV $146
endproc trap_S_StartBackgroundTrack 0 12
export trap_R_LoadWorldMap
proc trap_R_LoadWorldMap 0 8
line 299
;297:
;298:void  trap_R_LoadWorldMap( const char *mapname )
;299:{
line 300
;300:  syscall( CG_R_LOADWORLDMAP, mapname );
CNSTI4 36
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 301
;301:}
LABELV $147
endproc trap_R_LoadWorldMap 0 8
export trap_R_RegisterModel
proc trap_R_RegisterModel 4 8
line 304
;302:
;303:qhandle_t trap_R_RegisterModel( const char *name )
;304:{
line 305
;305:  return syscall( CG_R_REGISTERMODEL, name );
CNSTI4 37
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
LABELV $148
endproc trap_R_RegisterModel 4 8
export trap_R_RegisterSkin
proc trap_R_RegisterSkin 4 8
line 309
;306:}
;307:
;308:qhandle_t trap_R_RegisterSkin( const char *name )
;309:{
line 310
;310:  return syscall( CG_R_REGISTERSKIN, name );
CNSTI4 38
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
LABELV $149
endproc trap_R_RegisterSkin 4 8
export trap_R_RegisterShader
proc trap_R_RegisterShader 4 8
line 314
;311:}
;312:
;313:qhandle_t trap_R_RegisterShader( const char *name )
;314:{
line 315
;315:  return syscall( CG_R_REGISTERSHADER, name );
CNSTI4 39
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
LABELV $150
endproc trap_R_RegisterShader 4 8
export trap_R_RegisterShaderNoMip
proc trap_R_RegisterShaderNoMip 4 8
line 319
;316:}
;317:
;318:qhandle_t trap_R_RegisterShaderNoMip( const char *name )
;319:{
line 320
;320:  return syscall( CG_R_REGISTERSHADERNOMIP, name );
CNSTI4 57
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
LABELV $151
endproc trap_R_RegisterShaderNoMip 4 8
export trap_R_RegisterFont
proc trap_R_RegisterFont 0 16
line 324
;321:}
;322:
;323:void trap_R_RegisterFont( const char *fontName, int pointSize, fontInfo_t *font )
;324:{
line 325
;325:  syscall(CG_R_REGISTERFONT, fontName, pointSize, font );
CNSTI4 59
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
line 326
;326:}
LABELV $152
endproc trap_R_RegisterFont 0 16
export trap_R_ClearScene
proc trap_R_ClearScene 0 4
line 329
;327:
;328:void  trap_R_ClearScene( void )
;329:{
line 330
;330:  syscall( CG_R_CLEARSCENE );
CNSTI4 40
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 331
;331:}
LABELV $153
endproc trap_R_ClearScene 0 4
export trap_R_AddRefEntityToScene
proc trap_R_AddRefEntityToScene 0 8
line 334
;332:
;333:void  trap_R_AddRefEntityToScene( const refEntity_t *re )
;334:{
line 335
;335:  syscall( CG_R_ADDREFENTITYTOSCENE, re );
CNSTI4 41
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 336
;336:}
LABELV $154
endproc trap_R_AddRefEntityToScene 0 8
export trap_R_AddPolyToScene
proc trap_R_AddPolyToScene 0 16
line 339
;337:
;338:void trap_R_AddPolyToScene( qhandle_t hShader , int numVerts, const polyVert_t *verts )
;339:{
line 340
;340:  syscall( CG_R_ADDPOLYTOSCENE, hShader, numVerts, verts );
CNSTI4 42
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
line 341
;341:}
LABELV $155
endproc trap_R_AddPolyToScene 0 16
export trap_R_AddPolysToScene
proc trap_R_AddPolysToScene 0 20
line 344
;342:
;343:void trap_R_AddPolysToScene( qhandle_t hShader , int numVerts, const polyVert_t *verts, int num )
;344:{
line 345
;345:  syscall( CG_R_ADDPOLYSTOSCENE, hShader, numVerts, verts, num );
CNSTI4 87
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
line 346
;346:}
LABELV $156
endproc trap_R_AddPolysToScene 0 20
export trap_R_LightForPoint
proc trap_R_LightForPoint 4 20
line 349
;347:
;348:int trap_R_LightForPoint( vec3_t point, vec3_t ambientLight, vec3_t directedLight, vec3_t lightDir )
;349:{
line 350
;350:  return syscall( CG_R_LIGHTFORPOINT, point, ambientLight, directedLight, lightDir );
CNSTI4 73
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
LABELV $157
endproc trap_R_LightForPoint 4 20
export trap_R_AddLightToScene
proc trap_R_AddLightToScene 16 24
line 354
;351:}
;352:
;353:void  trap_R_AddLightToScene( const vec3_t org, float intensity, float r, float g, float b )
;354:{
line 355
;355:  syscall( CG_R_ADDLIGHTTOSCENE, org, PASSFLOAT(intensity), PASSFLOAT(r), PASSFLOAT(g), PASSFLOAT(b) );
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
CNSTI4 43
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
line 356
;356:}
LABELV $158
endproc trap_R_AddLightToScene 16 24
export trap_R_AddAdditiveLightToScene
proc trap_R_AddAdditiveLightToScene 16 24
line 359
;357:
;358:void  trap_R_AddAdditiveLightToScene( const vec3_t org, float intensity, float r, float g, float b )
;359:{
line 360
;360:  syscall( CG_R_ADDADDITIVELIGHTTOSCENE, org, PASSFLOAT(intensity), PASSFLOAT(r), PASSFLOAT(g), PASSFLOAT(b) );
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
CNSTI4 85
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
line 361
;361:}
LABELV $159
endproc trap_R_AddAdditiveLightToScene 16 24
export trap_R_RenderScene
proc trap_R_RenderScene 0 8
line 364
;362:
;363:void  trap_R_RenderScene( const refdef_t *fd )
;364:{
line 365
;365:  syscall( CG_R_RENDERSCENE, fd );
CNSTI4 44
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 366
;366:}
LABELV $160
endproc trap_R_RenderScene 0 8
export trap_R_SetColor
proc trap_R_SetColor 0 8
line 369
;367:
;368:void  trap_R_SetColor( const float *rgba )
;369:{
line 370
;370:  syscall( CG_R_SETCOLOR, rgba );
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 371
;371:}
LABELV $161
endproc trap_R_SetColor 0 8
export trap_R_DrawStretchPic
proc trap_R_DrawStretchPic 32 40
line 375
;372:
;373:void  trap_R_DrawStretchPic( float x, float y, float w, float h,
;374:                 float s1, float t1, float s2, float t2, qhandle_t hShader )
;375:{
line 376
;376:  syscall( CG_R_DRAWSTRETCHPIC, PASSFLOAT(x), PASSFLOAT(y), PASSFLOAT(w), PASSFLOAT(h),
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
CNSTI4 46
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
line 378
;377:           PASSFLOAT(s1), PASSFLOAT(t1), PASSFLOAT(s2), PASSFLOAT(t2), hShader );
;378:}
LABELV $162
endproc trap_R_DrawStretchPic 32 40
export trap_R_ModelBounds
proc trap_R_ModelBounds 0 16
line 380
;379:
;380:void  trap_R_ModelBounds( clipHandle_t model, vec3_t mins, vec3_t maxs ) {
line 381
;381:  syscall( CG_R_MODELBOUNDS, model, mins, maxs );
CNSTI4 47
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
line 382
;382:}
LABELV $163
endproc trap_R_ModelBounds 0 16
export trap_R_LerpTag
proc trap_R_LerpTag 8 28
line 386
;383:
;384:int   trap_R_LerpTag( orientation_t *tag, clipHandle_t mod, int startFrame, int endFrame,
;385:             float frac, const char *tagName )
;386:{
line 387
;387:  return syscall( CG_R_LERPTAG, tag, mod, startFrame, endFrame, PASSFLOAT(frac), tagName );
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 48
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
LABELV $164
endproc trap_R_LerpTag 8 28
export trap_R_RemapShader
proc trap_R_RemapShader 0 16
line 391
;388:}
;389:
;390:void  trap_R_RemapShader( const char *oldShader, const char *newShader, const char *timeOffset )
;391:{
line 392
;392:  syscall( CG_R_REMAP_SHADER, oldShader, newShader, timeOffset );
CNSTI4 79
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
line 393
;393:}
LABELV $165
endproc trap_R_RemapShader 0 16
export trap_GetGlconfig
proc trap_GetGlconfig 0 8
line 396
;394:
;395:void trap_GetGlconfig( glconfig_t *glconfig )
;396:{
line 397
;397:  syscall( CG_GETGLCONFIG, glconfig );
CNSTI4 49
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 398
;398:}
LABELV $166
endproc trap_GetGlconfig 0 8
export trap_GetGameState
proc trap_GetGameState 0 8
line 401
;399:
;400:void trap_GetGameState( gameState_t *gamestate )
;401:{
line 402
;402:  syscall( CG_GETGAMESTATE, gamestate );
CNSTI4 50
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 403
;403:}
LABELV $167
endproc trap_GetGameState 0 8
export trap_GetCurrentSnapshotNumber
proc trap_GetCurrentSnapshotNumber 0 12
line 406
;404:
;405:void trap_GetCurrentSnapshotNumber( int *snapshotNumber, int *serverTime )
;406:{
line 407
;407:  syscall( CG_GETCURRENTSNAPSHOTNUMBER, snapshotNumber, serverTime );
CNSTI4 51
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
line 408
;408:}
LABELV $168
endproc trap_GetCurrentSnapshotNumber 0 12
export trap_GetSnapshot
proc trap_GetSnapshot 4 12
line 411
;409:
;410:qboolean  trap_GetSnapshot( int snapshotNumber, snapshot_t *snapshot )
;411:{
line 412
;412:  return syscall( CG_GETSNAPSHOT, snapshotNumber, snapshot );
CNSTI4 52
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
LABELV $169
endproc trap_GetSnapshot 4 12
export trap_GetServerCommand
proc trap_GetServerCommand 4 8
line 416
;413:}
;414:
;415:qboolean  trap_GetServerCommand( int serverCommandNumber )
;416:{
line 417
;417:  return syscall( CG_GETSERVERCOMMAND, serverCommandNumber );
CNSTI4 53
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
LABELV $170
endproc trap_GetServerCommand 4 8
export trap_GetCurrentCmdNumber
proc trap_GetCurrentCmdNumber 4 4
line 421
;418:}
;419:
;420:int trap_GetCurrentCmdNumber( void )
;421:{
line 422
;422:  return syscall( CG_GETCURRENTCMDNUMBER );
CNSTI4 54
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $171
endproc trap_GetCurrentCmdNumber 4 4
export trap_GetUserCmd
proc trap_GetUserCmd 4 12
line 426
;423:}
;424:
;425:qboolean  trap_GetUserCmd( int cmdNumber, usercmd_t *ucmd )
;426:{
line 427
;427:  return syscall( CG_GETUSERCMD, cmdNumber, ucmd );
CNSTI4 55
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
LABELV $172
endproc trap_GetUserCmd 4 12
export trap_SetUserCmdValue
proc trap_SetUserCmdValue 4 12
line 431
;428:}
;429:
;430:void    trap_SetUserCmdValue( int stateValue, float sensitivityScale )
;431:{
line 432
;432:  syscall( CG_SETUSERCMDVALUE, stateValue, PASSFLOAT( sensitivityScale ) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 56
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 433
;433:}
LABELV $173
endproc trap_SetUserCmdValue 4 12
export testPrintInt
proc testPrintInt 0 12
line 436
;434:
;435:void    testPrintInt( char *string, int i )
;436:{
line 437
;437:  syscall( CG_TESTPRINTINT, string, i );
CNSTI4 209
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
line 438
;438:}
LABELV $174
endproc testPrintInt 0 12
export testPrintFloat
proc testPrintFloat 4 12
line 441
;439:
;440:void    testPrintFloat( char *string, float f )
;441:{
line 442
;442:  syscall( CG_TESTPRINTFLOAT, string, PASSFLOAT(f) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 210
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
line 443
;443:}
LABELV $175
endproc testPrintFloat 4 12
export trap_MemoryRemaining
proc trap_MemoryRemaining 4 4
line 446
;444:
;445:int trap_MemoryRemaining( void )
;446:{
line 447
;447:  return syscall( CG_MEMORY_REMAINING );
CNSTI4 58
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $176
endproc trap_MemoryRemaining 4 4
export trap_Key_IsDown
proc trap_Key_IsDown 4 8
line 451
;448:}
;449:
;450:qboolean trap_Key_IsDown( int keynum )
;451:{
line 452
;452:  return syscall( CG_KEY_ISDOWN, keynum );
CNSTI4 60
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
LABELV $177
endproc trap_Key_IsDown 4 8
export trap_Key_GetCatcher
proc trap_Key_GetCatcher 4 4
line 456
;453:}
;454:
;455:int trap_Key_GetCatcher( void )
;456:{
line 457
;457:  return syscall( CG_KEY_GETCATCHER );
CNSTI4 61
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
endproc trap_Key_GetCatcher 4 4
export trap_Key_SetCatcher
proc trap_Key_SetCatcher 0 8
line 461
;458:}
;459:
;460:void trap_Key_SetCatcher( int catcher )
;461:{
line 462
;462:  syscall( CG_KEY_SETCATCHER, catcher );
CNSTI4 62
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 463
;463:}
LABELV $179
endproc trap_Key_SetCatcher 0 8
export trap_Key_GetKey
proc trap_Key_GetKey 4 8
line 466
;464:
;465:int trap_Key_GetKey( const char *binding )
;466:{
line 467
;467:  return syscall( CG_KEY_GETKEY, binding );
CNSTI4 63
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
endproc trap_Key_GetKey 4 8
export trap_PC_AddGlobalDefine
proc trap_PC_AddGlobalDefine 4 8
line 471
;468:}
;469:
;470:int trap_PC_AddGlobalDefine( char *define )
;471:{
line 472
;472:  return syscall( CG_PARSE_ADD_GLOBAL_DEFINE, define );
CNSTI4 64
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
endproc trap_PC_AddGlobalDefine 4 8
export trap_PC_LoadSource
proc trap_PC_LoadSource 4 8
line 476
;473:}
;474:
;475:int trap_PC_LoadSource( const char *filename )
;476:{
line 477
;477:  return syscall( CG_PARSE_LOAD_SOURCE, filename );
CNSTI4 65
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
LABELV $182
endproc trap_PC_LoadSource 4 8
export trap_PC_FreeSource
proc trap_PC_FreeSource 4 8
line 481
;478:}
;479:
;480:int trap_PC_FreeSource( int handle )
;481:{
line 482
;482:  return syscall( CG_PARSE_FREE_SOURCE, handle );
CNSTI4 66
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
LABELV $183
endproc trap_PC_FreeSource 4 8
export trap_PC_ReadToken
proc trap_PC_ReadToken 4 12
line 486
;483:}
;484:
;485:int trap_PC_ReadToken( int handle, pc_token_t *pc_token )
;486:{
line 487
;487:  return syscall( CG_PARSE_READ_TOKEN, handle, pc_token );
CNSTI4 67
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
LABELV $184
endproc trap_PC_ReadToken 4 12
export trap_PC_SourceFileAndLine
proc trap_PC_SourceFileAndLine 4 16
line 491
;488:}
;489:
;490:int trap_PC_SourceFileAndLine( int handle, char *filename, int *line )
;491:{
line 492
;492:  return syscall( CG_PARSE_SOURCE_FILE_AND_LINE, handle, filename, line );
CNSTI4 68
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
LABELV $185
endproc trap_PC_SourceFileAndLine 4 16
export trap_S_StopBackgroundTrack
proc trap_S_StopBackgroundTrack 0 4
line 496
;493:}
;494:
;495:void  trap_S_StopBackgroundTrack( void )
;496:{
line 497
;497:  syscall( CG_S_STOPBACKGROUNDTRACK );
CNSTI4 69
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 498
;498:}
LABELV $186
endproc trap_S_StopBackgroundTrack 0 4
export trap_RealTime
proc trap_RealTime 4 8
line 501
;499:
;500:int trap_RealTime(qtime_t *qtime)
;501:{
line 502
;502:  return syscall( CG_REAL_TIME, qtime );
CNSTI4 70
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
export trap_SnapVector
proc trap_SnapVector 0 8
line 506
;503:}
;504:
;505:void trap_SnapVector( float *v )
;506:{
line 507
;507:  syscall( CG_SNAPVECTOR, v );
CNSTI4 71
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 508
;508:}
LABELV $188
endproc trap_SnapVector 0 8
export trap_CIN_PlayCinematic
proc trap_CIN_PlayCinematic 4 28
line 512
;509:
;510:// this returns a handle.  arg0 is the name in the format "idlogo.roq", set arg1 to NULL, alteredstates to qfalse (do not alter gamestate)
;511:int trap_CIN_PlayCinematic( const char *arg0, int xpos, int ypos, int width, int height, int bits )
;512:{
line 513
;513:  return syscall(CG_CIN_PLAYCINEMATIC, arg0, xpos, ypos, width, height, bits);
CNSTI4 74
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
LABELV $189
endproc trap_CIN_PlayCinematic 4 28
export trap_CIN_StopCinematic
proc trap_CIN_StopCinematic 4 8
line 519
;514:}
;515:
;516:// stops playing the cinematic and ends it.  should always return FMV_EOF
;517:// cinematics must be stopped in reverse order of when they are started
;518:e_status trap_CIN_StopCinematic( int handle )
;519:{
line 520
;520:  return syscall(CG_CIN_STOPCINEMATIC, handle);
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
endproc trap_CIN_StopCinematic 4 8
export trap_CIN_RunCinematic
proc trap_CIN_RunCinematic 4 8
line 526
;521:}
;522:
;523:
;524:// will run a frame of the cinematic but will not draw it.  Will return FMV_EOF if the end of the cinematic has been reached.
;525:e_status trap_CIN_RunCinematic( int handle )
;526:{
line 527
;527:  return syscall(CG_CIN_RUNCINEMATIC, handle);
CNSTI4 76
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
LABELV $191
endproc trap_CIN_RunCinematic 4 8
export trap_CIN_DrawCinematic
proc trap_CIN_DrawCinematic 0 8
line 533
;528:}
;529:
;530:
;531:// draws the current frame
;532:void trap_CIN_DrawCinematic( int handle )
;533:{
line 534
;534:  syscall(CG_CIN_DRAWCINEMATIC, handle);
CNSTI4 77
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 535
;535:}
LABELV $192
endproc trap_CIN_DrawCinematic 0 8
export trap_CIN_SetExtents
proc trap_CIN_SetExtents 0 24
line 540
;536:
;537:
;538:// allows you to resize the animation dynamically
;539:void trap_CIN_SetExtents( int handle, int x, int y, int w, int h )
;540:{
line 541
;541:  syscall(CG_CIN_SETEXTENTS, handle, x, y, w, h);
CNSTI4 78
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
line 542
;542:}
LABELV $193
endproc trap_CIN_SetExtents 0 24
export trap_GetDemoState
proc trap_GetDemoState 4 4
line 545
;543:
;544:int trap_GetDemoState( void )
;545:{
line 546
;546:  return syscall( CG_GETDEMOSTATE );
CNSTI4 94
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $194
endproc trap_GetDemoState 4 4
export trap_GetDemoPos
proc trap_GetDemoPos 4 4
line 550
;547:}
;548:
;549:int trap_GetDemoPos( void )
;550:{
line 551
;551:  return syscall( CG_GETDEMOPOS );
CNSTI4 95
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $195
endproc trap_GetDemoPos 4 4
export trap_GetDemoName
proc trap_GetDemoName 0 12
line 555
;552:}
;553:
;554:void trap_GetDemoName( char *buffer, int size )
;555:{
line 556
;556:  syscall( CG_GETDEMONAME, buffer, size );
CNSTI4 96
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
line 557
;557:}
LABELV $196
endproc trap_GetDemoName 0 12
export trap_Key_KeynumToStringBuf
proc trap_Key_KeynumToStringBuf 0 16
line 559
;558:
;559:void trap_Key_KeynumToStringBuf( int keynum, char *buf, int buflen ) {
line 560
;560:  syscall( CG_KEY_KEYNUMTOSTRINGBUF, keynum, buf, buflen );
CNSTI4 97
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
line 561
;561:}
LABELV $197
endproc trap_Key_KeynumToStringBuf 0 16
export trap_Key_GetBindingBuf
proc trap_Key_GetBindingBuf 0 16
line 563
;562:
;563:void trap_Key_GetBindingBuf( int keynum, char *buf, int buflen ) {
line 564
;564:  syscall( CG_KEY_GETBINDINGBUF, keynum, buf, buflen );
CNSTI4 98
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
line 565
;565:}
LABELV $198
endproc trap_Key_GetBindingBuf 0 16
export trap_Key_SetBinding
proc trap_Key_SetBinding 0 12
line 567
;566:
;567:void trap_Key_SetBinding( int keynum, const char *binding ) {
line 568
;568:  syscall( CG_KEY_SETBINDING, keynum, binding );
CNSTI4 99
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
line 569
;569:}
LABELV $199
endproc trap_Key_SetBinding 0 12
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
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
