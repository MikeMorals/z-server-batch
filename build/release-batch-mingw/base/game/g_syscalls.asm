data
align 4
LABELV syscall
byte 4 4294967295
export dllEntry
code
proc dllEntry 0 0
file "..\..\..\..\src/game/g_syscalls.c"
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
;22: */
;23:
;24:#include "g_local.h"
;25:
;26:// this file is only included when building a dll
;27:// g_syscalls.asm is included instead when building a qvm
;28:
;29:static intptr_t(QDECL *syscall)(intptr_t arg, ...) = (intptr_t(QDECL *)(intptr_t, ...)) - 1;
;30:
;31:void dllEntry(intptr_t(QDECL *syscallptr)(intptr_t arg, ...)) {
line 32
;32:  syscall = syscallptr;
ADDRGP4 syscall
ADDRFP4 0
INDIRP4
ASGNP4
line 33
;33:}
LABELV $84
endproc dllEntry 0 0
export PASSFLOAT
proc PASSFLOAT 4 0
line 35
;34:
;35:int PASSFLOAT(float x) {
line 37
;36:  float floatTemp;
;37:  floatTemp = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 38
;38:  return *(int *) &floatTemp;
ADDRLP4 0
INDIRI4
RETI4
LABELV $85
endproc PASSFLOAT 4 0
export trap_Printf
proc trap_Printf 0 8
line 41
;39:}
;40:
;41:void trap_Printf(const char *fmt) {
line 42
;42:  syscall(G_PRINT, fmt);
CNSTI4 0
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
LABELV $86
endproc trap_Printf 0 8
export trap_Error
proc trap_Error 0 8
line 45
;44:
;45:void trap_Error(const char *fmt) {
line 46
;46:  syscall(G_ERROR, fmt);
CNSTI4 1
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
LABELV $87
endproc trap_Error 0 8
export trap_Milliseconds
proc trap_Milliseconds 4 4
line 49
;48:
;49:int trap_Milliseconds(void) {
line 50
;50:  return syscall(G_MILLISECONDS);
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
LABELV $88
endproc trap_Milliseconds 4 4
export trap_Argc
proc trap_Argc 4 4
line 53
;51:}
;52:
;53:int trap_Argc(void) {
line 54
;54:  return syscall(G_ARGC);
CNSTI4 8
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $89
endproc trap_Argc 4 4
export trap_Argv
proc trap_Argv 0 16
line 57
;55:}
;56:
;57:void trap_Argv(int n, char *buffer, int bufferLength) {
line 58
;58:  syscall(G_ARGV, n, buffer, bufferLength);
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
line 59
;59:}
LABELV $90
endproc trap_Argv 0 16
export trap_FS_FOpenFile
proc trap_FS_FOpenFile 4 16
line 61
;60:
;61:int trap_FS_FOpenFile(const char *qpath, fileHandle_t *f, fsMode_t mode) {
line 62
;62:  return syscall(G_FS_FOPEN_FILE, qpath, f, mode);
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
LABELV $91
endproc trap_FS_FOpenFile 4 16
export trap_FS_Read
proc trap_FS_Read 0 16
line 65
;63:}
;64:
;65:void trap_FS_Read(void *buffer, int len, fileHandle_t f) {
line 66
;66:  syscall(G_FS_READ, buffer, len, f);
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
line 67
;67:}
LABELV $92
endproc trap_FS_Read 0 16
export trap_FS_Write
proc trap_FS_Write 0 16
line 69
;68:
;69:void trap_FS_Write(const void *buffer, int len, fileHandle_t f) {
line 70
;70:  syscall(G_FS_WRITE, buffer, len, f);
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
line 71
;71:}
LABELV $93
endproc trap_FS_Write 0 16
export trap_FS_FCloseFile
proc trap_FS_FCloseFile 0 8
line 73
;72:
;73:void trap_FS_FCloseFile(fileHandle_t f) {
line 74
;74:  syscall(G_FS_FCLOSE_FILE, f);
CNSTI4 13
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 75
;75:}
LABELV $94
endproc trap_FS_FCloseFile 0 8
export trap_FS_GetFileList
proc trap_FS_GetFileList 4 20
line 77
;76:
;77:int trap_FS_GetFileList(const char *path, const char *extension, char *listbuf, int bufsize) {
line 78
;78:  return syscall(G_FS_GETFILELIST, path, extension, listbuf, bufsize);
CNSTI4 36
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
LABELV $95
endproc trap_FS_GetFileList 4 20
export trap_SendConsoleCommand
proc trap_SendConsoleCommand 0 12
line 81
;79:}
;80:
;81:void trap_SendConsoleCommand(int exec_when, const char *text) {
line 82
;82:  syscall(G_SEND_CONSOLE_COMMAND, exec_when, text);
CNSTI4 14
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
line 83
;83:}
LABELV $96
endproc trap_SendConsoleCommand 0 12
export trap_Cvar_Register
proc trap_Cvar_Register 0 20
line 85
;84:
;85:void trap_Cvar_Register(vmCvar_t *cvar, const char *var_name, const char *value, int flags) {
line 86
;86:  syscall(G_CVAR_REGISTER, cvar, var_name, value, flags);
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
line 87
;87:}
LABELV $97
endproc trap_Cvar_Register 0 20
export trap_Cvar_Update
proc trap_Cvar_Update 0 8
line 89
;88:
;89:void trap_Cvar_Update(vmCvar_t *cvar) {
line 90
;90:  syscall(G_CVAR_UPDATE, cvar);
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 91
;91:}
LABELV $98
endproc trap_Cvar_Update 0 8
export trap_Cvar_Set
proc trap_Cvar_Set 0 12
line 93
;92:
;93:void trap_Cvar_Set(const char *var_name, const char *value) {
line 94
;94:  syscall(G_CVAR_SET, var_name, value);
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
line 95
;95:}
LABELV $99
endproc trap_Cvar_Set 0 12
export trap_Cvar_VariableIntegerValue
proc trap_Cvar_VariableIntegerValue 4 8
line 97
;96:
;97:int trap_Cvar_VariableIntegerValue(const char *var_name) {
line 98
;98:  return syscall(G_CVAR_VARIABLE_INTEGER_VALUE, var_name);
CNSTI4 6
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
LABELV $100
endproc trap_Cvar_VariableIntegerValue 4 8
export trap_Cvar_VariableStringBuffer
proc trap_Cvar_VariableStringBuffer 0 16
line 101
;99:}
;100:
;101:void trap_Cvar_VariableStringBuffer(const char *var_name, char *buffer, int bufsize) {
line 102
;102:  syscall(G_CVAR_VARIABLE_STRING_BUFFER, var_name, buffer, bufsize);
CNSTI4 7
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
line 103
;103:}
LABELV $101
endproc trap_Cvar_VariableStringBuffer 0 16
export trap_LocateGameData
proc trap_LocateGameData 0 24
line 106
;104:
;105:void trap_LocateGameData(gentity_t *gEnts, int numGEntities, int sizeofGEntity_t,
;106:        playerState_t *clients, int sizeofGClient) {
line 107
;107:  syscall(G_LOCATE_GAME_DATA, gEnts, numGEntities, sizeofGEntity_t, clients, sizeofGClient);
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
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 108
;108:}
LABELV $102
endproc trap_LocateGameData 0 24
export trap_DropClient
proc trap_DropClient 0 12
line 110
;109:
;110:void trap_DropClient(int clientNum, const char *reason) {
line 111
;111:  syscall(G_DROP_CLIENT, clientNum, reason);
CNSTI4 16
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
line 112
;112:}
LABELV $103
endproc trap_DropClient 0 12
export trap_SendServerCommand
proc trap_SendServerCommand 0 12
line 114
;113:
;114:void trap_SendServerCommand(int clientNum, const char *text) {
line 115
;115:  syscall(G_SEND_SERVER_COMMAND, clientNum, text);
CNSTI4 17
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
line 116
;116:}
LABELV $104
endproc trap_SendServerCommand 0 12
export trap_SetConfigstring
proc trap_SetConfigstring 0 12
line 118
;117:
;118:void trap_SetConfigstring(int num, const char *string) {
line 119
;119:  syscall(G_SET_CONFIGSTRING, num, string);
CNSTI4 18
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
line 120
;120:}
LABELV $105
endproc trap_SetConfigstring 0 12
export trap_GetConfigstring
proc trap_GetConfigstring 0 16
line 122
;121:
;122:void trap_GetConfigstring(int num, char *buffer, int bufferSize) {
line 123
;123:  syscall(G_GET_CONFIGSTRING, num, buffer, bufferSize);
CNSTI4 19
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
line 124
;124:}
LABELV $106
endproc trap_GetConfigstring 0 16
export trap_GetUserinfo
proc trap_GetUserinfo 0 16
line 126
;125:
;126:void trap_GetUserinfo(int num, char *buffer, int bufferSize) {
line 127
;127:  syscall(G_GET_USERINFO, num, buffer, bufferSize);
CNSTI4 20
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
line 128
;128:}
LABELV $107
endproc trap_GetUserinfo 0 16
export trap_SetUserinfo
proc trap_SetUserinfo 0 12
line 130
;129:
;130:void trap_SetUserinfo(int num, const char *buffer) {
line 131
;131:  syscall(G_SET_USERINFO, num, buffer);
CNSTI4 21
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
line 132
;132:}
LABELV $108
endproc trap_SetUserinfo 0 12
export trap_GetServerinfo
proc trap_GetServerinfo 0 12
line 134
;133:
;134:void trap_GetServerinfo(char *buffer, int bufferSize) {
line 135
;135:  syscall(G_GET_SERVERINFO, buffer, bufferSize);
CNSTI4 22
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
line 136
;136:}
LABELV $109
endproc trap_GetServerinfo 0 12
export trap_SetBrushModel
proc trap_SetBrushModel 0 12
line 138
;137:
;138:void trap_SetBrushModel(gentity_t *ent, const char *name) {
line 139
;139:  syscall(G_SET_BRUSH_MODEL, ent, name);
CNSTI4 23
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
line 140
;140:}
LABELV $110
endproc trap_SetBrushModel 0 12
export trap_Trace
proc trap_Trace 0 32
line 143
;141:
;142:void trap_Trace(trace_t *results, const vec3_t start, const vec3_t mins,
;143:        const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask) {
line 144
;144:  syscall(G_TRACE, results, start, mins, maxs, end, passEntityNum, contentmask);
CNSTI4 24
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
line 145
;145:}
LABELV $111
endproc trap_Trace 0 32
export trap_TraceCapsule
proc trap_TraceCapsule 0 32
line 147
;146:
;147:void trap_TraceCapsule(trace_t *results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask) {
line 148
;148:  syscall(G_TRACECAPSULE, results, start, mins, maxs, end, passEntityNum, contentmask);
CNSTI4 39
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
line 149
;149:}
LABELV $112
endproc trap_TraceCapsule 0 32
export trap_PointContents
proc trap_PointContents 4 12
line 151
;150:
;151:int trap_PointContents(const vec3_t point, int passEntityNum) {
line 152
;152:  return syscall(G_POINT_CONTENTS, point, passEntityNum);
CNSTI4 25
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
LABELV $113
endproc trap_PointContents 4 12
export trap_InPVS
proc trap_InPVS 4 12
line 155
;153:}
;154:
;155:qboolean trap_InPVS(const vec3_t p1, const vec3_t p2) {
line 156
;156:  return syscall(G_IN_PVS, p1, p2);
CNSTI4 26
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
LABELV $114
endproc trap_InPVS 4 12
export trap_InPVSIgnorePortals
proc trap_InPVSIgnorePortals 4 12
line 159
;157:}
;158:
;159:qboolean trap_InPVSIgnorePortals(const vec3_t p1, const vec3_t p2) {
line 160
;160:  return syscall(G_IN_PVS_IGNORE_PORTALS, p1, p2);
CNSTI4 27
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
LABELV $115
endproc trap_InPVSIgnorePortals 4 12
export trap_AdjustAreaPortalState
proc trap_AdjustAreaPortalState 0 12
line 163
;161:}
;162:
;163:void trap_AdjustAreaPortalState(gentity_t *ent, qboolean open) {
line 164
;164:  syscall(G_ADJUST_AREA_PORTAL_STATE, ent, open);
CNSTI4 28
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
line 165
;165:}
LABELV $116
endproc trap_AdjustAreaPortalState 0 12
export trap_AreasConnected
proc trap_AreasConnected 4 12
line 167
;166:
;167:qboolean trap_AreasConnected(int area1, int area2) {
line 168
;168:  return syscall(G_AREAS_CONNECTED, area1, area2);
CNSTI4 29
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
LABELV $117
endproc trap_AreasConnected 4 12
export trap_LinkEntity
proc trap_LinkEntity 0 8
line 171
;169:}
;170:
;171:void trap_LinkEntity(gentity_t *ent) {
line 172
;172:  syscall(G_LINKENTITY, ent);
CNSTI4 30
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 173
;173:}
LABELV $118
endproc trap_LinkEntity 0 8
export trap_UnlinkEntity
proc trap_UnlinkEntity 0 8
line 175
;174:
;175:void trap_UnlinkEntity(gentity_t *ent) {
line 176
;176:  syscall(G_UNLINKENTITY, ent);
CNSTI4 31
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 177
;177:}
LABELV $119
endproc trap_UnlinkEntity 0 8
export trap_EntitiesInBox
proc trap_EntitiesInBox 4 20
line 179
;178:
;179:int trap_EntitiesInBox(const vec3_t mins, const vec3_t maxs, int *list, int maxcount) {
line 180
;180:  return syscall(G_ENTITIES_IN_BOX, mins, maxs, list, maxcount);
CNSTI4 32
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
LABELV $120
endproc trap_EntitiesInBox 4 20
export trap_EntityContact
proc trap_EntityContact 4 16
line 183
;181:}
;182:
;183:qboolean trap_EntityContact(const vec3_t mins, const vec3_t maxs, const gentity_t *ent) {
line 184
;184:  return syscall(G_ENTITY_CONTACT, mins, maxs, ent);
CNSTI4 33
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
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $121
endproc trap_EntityContact 4 16
export trap_EntityContactCapsule
proc trap_EntityContactCapsule 4 16
line 187
;185:}
;186:
;187:qboolean trap_EntityContactCapsule(const vec3_t mins, const vec3_t maxs, const gentity_t *ent) {
line 188
;188:  return syscall(G_ENTITY_CONTACTCAPSULE, mins, maxs, ent);
CNSTI4 40
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
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $122
endproc trap_EntityContactCapsule 4 16
export trap_GetUsercmd
proc trap_GetUsercmd 0 12
line 191
;189:}
;190:
;191:void trap_GetUsercmd(int clientNum, usercmd_t *cmd) {
line 192
;192:  syscall(G_GET_USERCMD, clientNum, cmd);
CNSTI4 34
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
line 193
;193:}
LABELV $123
endproc trap_GetUsercmd 0 12
export trap_GetEntityToken
proc trap_GetEntityToken 4 12
line 195
;194:
;195:qboolean trap_GetEntityToken(char *buffer, int bufferSize) {
line 196
;196:  return syscall(G_GET_ENTITY_TOKEN, buffer, bufferSize);
CNSTI4 35
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
LABELV $124
endproc trap_GetEntityToken 4 12
export trap_RealTime
proc trap_RealTime 4 8
line 199
;197:}
;198:
;199:int trap_RealTime(qtime_t *qtime) {
line 200
;200:  return syscall(G_REAL_TIME, qtime);
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
LABELV $125
endproc trap_RealTime 4 8
export trap_SnapVector
proc trap_SnapVector 0 8
line 203
;201:}
;202:
;203:void trap_SnapVector(float *v) {
line 204
;204:  syscall(G_SNAPVECTOR, v);
CNSTI4 38
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 205
;205:  return;
LABELV $126
endproc trap_SnapVector 0 8
export trap_SendGameStat
proc trap_SendGameStat 0 8
line 208
;206:}
;207:
;208:void trap_SendGameStat(const char *data) {
line 209
;209:  syscall(G_SEND_GAMESTAT, data);
CNSTI4 47
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 210
;210:  return;
LABELV $127
endproc trap_SendGameStat 0 8
export trap_Parse_AddGlobalDefine
proc trap_Parse_AddGlobalDefine 4 8
line 213
;211:}
;212:
;213:int trap_Parse_AddGlobalDefine(char *define) {
line 214
;214:  return syscall(G_PARSE_ADD_GLOBAL_DEFINE, define);
CNSTI4 42
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
LABELV $128
endproc trap_Parse_AddGlobalDefine 4 8
export trap_Parse_LoadSource
proc trap_Parse_LoadSource 4 8
line 217
;215:}
;216:
;217:int trap_Parse_LoadSource(const char *filename) {
line 218
;218:  return syscall(G_PARSE_LOAD_SOURCE, filename);
CNSTI4 43
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
LABELV $129
endproc trap_Parse_LoadSource 4 8
export trap_Parse_FreeSource
proc trap_Parse_FreeSource 4 8
line 221
;219:}
;220:
;221:int trap_Parse_FreeSource(int handle) {
line 222
;222:  return syscall(G_PARSE_FREE_SOURCE, handle);
CNSTI4 44
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
LABELV $130
endproc trap_Parse_FreeSource 4 8
export trap_Parse_ReadToken
proc trap_Parse_ReadToken 4 12
line 225
;223:}
;224:
;225:int trap_Parse_ReadToken(int handle, pc_token_t *pc_token) {
line 226
;226:  return syscall(G_PARSE_READ_TOKEN, handle, pc_token);
CNSTI4 45
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
LABELV $131
endproc trap_Parse_ReadToken 4 12
export trap_Parse_SourceFileAndLine
proc trap_Parse_SourceFileAndLine 4 16
line 229
;227:}
;228:
;229:int trap_Parse_SourceFileAndLine(int handle, char *filename, int *line) {
line 230
;230:  return syscall(G_PARSE_SOURCE_FILE_AND_LINE, handle, filename, line);
CNSTI4 46
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
LABELV $132
endproc trap_Parse_SourceFileAndLine 4 16
export trap_mysql_runquery
proc trap_mysql_runquery 4 8
line 232
;231:}
;232:qboolean trap_mysql_runquery( char *query ) {
line 233
;233:   return syscall( G_SQL_RUNQUERY, query );
CNSTI4 49
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
endproc trap_mysql_runquery 4 8
export trap_mysql_finishquery
proc trap_mysql_finishquery 0 4
line 236
;234:}
;235:
;236:void trap_mysql_finishquery( void ) {
line 237
;237:  syscall( G_SQL_FINISHQUERY );
CNSTI4 50
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 238
;238:}
LABELV $134
endproc trap_mysql_finishquery 0 4
export trap_mysql_fetchrow
proc trap_mysql_fetchrow 4 4
line 240
;239:
;240:qboolean trap_mysql_fetchrow( void ) {
line 241
;241:  return syscall( G_SQL_FETCHROW );
CNSTI4 51
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $135
endproc trap_mysql_fetchrow 4 4
export trap_mysql_fetchfieldbyID
proc trap_mysql_fetchfieldbyID 0 12
line 244
;242:}
;243:
;244:void trap_mysql_fetchfieldbyID( int id, char *buffer ) {
line 245
;245:  syscall( G_SQL_FETCHFIELDBYID, id, buffer );
CNSTI4 52
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
line 246
;246:}
LABELV $136
endproc trap_mysql_fetchfieldbyID 0 12
export trap_mysql_fetchfieldbyName
proc trap_mysql_fetchfieldbyName 0 16
line 248
;247:
;248:void trap_mysql_fetchfieldbyName(const char *name, char *buffer, int len){
line 249
;249:  syscall( G_SQL_FETCHFIELDBYNAME, name, buffer, len );
CNSTI4 53
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
line 250
;250:}
LABELV $137
endproc trap_mysql_fetchfieldbyName 0 16
export trap_mysql_reconnect
proc trap_mysql_reconnect 0 4
line 252
;251:
;252:void trap_mysql_reconnect( void ) {
line 253
;253:  syscall( G_SQL_RECONNECT );
CNSTI4 54
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 254
;254:}
LABELV $138
endproc trap_mysql_reconnect 0 4
import G_deleteWhite
import G_adminWhitelistGlobal
import G_adminGlobal
import G_whitelistCheck
import G_globalCheck
import G_globalBanCheck
import G_deleteGlobal
import getGlobalTypeString
import G_globalInit
import G_globalAdd
import G_getLongerWhiteName
import G_isValidIpAddress
import G_globalExit
import G_isPlayerConnected
import botSelectEnemy
import botCanSeeEnemy
import botForgetEnemy
import G_healFriend
import G_BotAimAt
import G_printVector
import G_doorInRange
import G_itemInRange
import G_playerInRange
import g_comboPrint
import g_comboClear
import modString
import director_debug
import ace_botsFile
import ace_spSkill
import ace_attackEnemies
import ace_pickShortRangeGoal
import ace_pickLongRangeGoal
import ace_showPath
import ace_showLinks
import ace_showNodes
import ace_debug
import AngleBetweenVectors
import G_KillStructuresSurvival
import spawnItem
import G_itemUse
import G_itemThink
import syrinxSpawn
import selectBetterWay
import drawRedBall
import G_FindRadius
import G_ProjectSource
import pointBehindWall
import spawnGridNode
import convertGridToWorld
import convertWorldToGrid
import fillGrid
import WallInFront
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_Cvar_VariableValue
import trap_FS_Seek
import trap_Args
import g_antispawncamp
import mega_wave
import ROTACAK_ambush_kills
import ROTACAK_ambush_stage
import ROTACAK_ambush_rebuild_time_temp
import g_bot_lcannon
import g_bot_flamer
import g_bot_prifle
import g_bot_chaingun
import g_bot_mdriver
import g_bot_lasgun
import g_bot_psaw
import g_bot_shotgun
import g_bot_mgun
import g_bot
import g_ambush_turnangle
import g_ambush_range
import g_ambush_att_buildables
import g_ambush_kill_spawns
import g_ambush
import g_ambush_no_egg_ffoff
import g_ambush_stage_suicide
import g_ambush_sec_to_start
import g_ambush_rebuild_time
import g_ambush_dodge_random
import g_ambush_dodge
import g_ambush_tyrants_to_win
import g_ambush_dragon2_s8
import g_ambush_dragon_s7
import g_ambush_marauder2_s6
import g_ambush_marauder_s5
import g_ambush_basilisk2_s4
import g_ambush_basilisk_s3
import g_ambush_dretch_s2
import g_ambush_granger_s1
import g_buildLogMaxLength
import g_survival
import g_ctncapturetime
import g_ctnbuildlimit
import g_ctn
import g_msgTime
import g_msg
import g_mapvoteMaxTime
import g_voteMinTime
import g_devmapNoStructDmg
import g_devmapNoGod
import g_dretchPunt
import g_antiSpawnBlock
import g_myStats
import g_publicSayadmins
import g_decolourLogfiles
import g_privateMessages
import g_devmapKillerHP
import g_banNotice
import g_minLevelToSpecMM1
import g_forceAutoSelect
import g_minLevelToJoinTeam
import g_adminMapLog
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminSayFilter
import g_adminParseSay
import g_adminLog
import g_admin
import g_layoutAuto
import g_layouts
import g_mapConfigs
import g_shove
import g_floodMinTime
import g_floodMaxDemerits
import g_actionPrefix
import g_chatTeamPrefix
import g_initialMapRotation
import g_nextMap
import g_currentMap
import g_currentMapRotation
import g_debugMapRotation
import g_deconDead
import g_markDeconstruct
import g_disabledBuildables
import g_disabledClasses
import g_disabledEquipment
import g_unlagged
import g_teamImbalanceWarnings
import g_alienStage3Threshold
import g_alienStage2Threshold
import g_alienMaxStage
import g_alienKills
import g_alienStage
import g_humanStage3Threshold
import g_humanStage2Threshold
import g_humanMaxStage
import g_humanKills
import g_humanStage
import g_alienBuildPoints
import g_humanBuildPoints
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_allowShare
import g_rankings
import pmove_msec
import pmove_fixed
import g_clientUpgradeNotice
import g_smoothClients
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_designateVotes
import g_mapVotesPercent
import g_suddenDeathVoteDelay
import g_suddenDeathVotePercent
import g_voteLimit
import g_requireVoteReasons
import g_allowVote
import g_blood
import g_doWarmup
import g_warmupMode
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyBuildableFire
import g_friendlyFireMovementAttacks
import g_retribution
import g_friendlyFireAliens
import g_friendlyFireHumans
import g_friendlyFire
import g_layoutmaking
import g_suddenDeathMode
import g_suddenDeath
import g_suddenDeathTime
import g_timelimit
import g_enterString
import g_newbieNamePrefix
import g_newbieNumbering
import g_maxNameChanges
import g_minNameChangePeriod
import g_minCommandPeriod
import g_lockTeamsAtStart
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_entities
import level
import G_FindConnectionForCode
import G_ResetPTRConnections
import G_GenerateNewConnection
import G_UpdatePTRConnection
import G_GetCurrentMap
import G_MapExists
import G_InitMapRotations
import G_MapRotationActive
import G_StopMapRotation
import G_StartMapRotation
import G_AdvanceMapRotation
import G_PrintRotations
import G_WinBadge
import G_WriteSessionData
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_DefragmentMemory
import G_Free
import G_InitMemory
import G_Alloc
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_UnlaggedOff
import G_UnlaggedOn
import G_UnlaggedCalc
import G_UnlaggedClear
import G_UnlaggedStore
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Flood_Limited
import CheckMsgTimer
import G_TimeTilSuddenDeath
import LogExit
import CheckTeamVote
import CheckVote
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_AdminsPrintf
import G_LogOnlyPrintf
import G_LogPrintfColoured
import G_LogPrintf
import G_RunThink
import FindIntermissionPoint
import CalculateRanks
import G_MapConfigs
import MoveClientToIntermission
import ScoreboardMessage
import FireWeapon3
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import G_NextNewbieName
import SpotWouldTelefrag
import player_die
import ClientSpawn
import BeginIntermission
import respawn
import SpawnCorpse
import G_SelectHumanLockSpawnPoint
import G_SelectAlienLockSpawnPoint
import G_SelectSpawnPoint
import G_SelectTremulousSpawnPoint
import G_SetClientViewAngle
import TeamCount
import G_AddCreditToClient
import G_UpdateZaps
import ChargeAttack
import CheckPounceAttack
import CheckGrabAttack
import CheckVenomAttack
import SnapVectorTowards
import CalcMuzzlePoint
import G_GiveClientMaxAmmo
import G_ForceWeaponChange
import ShineTorch
import TeleportPlayer
import TeleportZombie
import G_Checktrigger_stages
import trigger_teleporter_touch
import manualTriggerSpectator
import Touch_DoorTrigger
import G_RunMover
import fire_dome
import fire_rocket
import massDriverFire2
import fire_axe
import plant_mine
import launch_grenade_primary
import launch_grenade_secondary
import launch_bomb
import launch_grenade
import fire_hive
import fire_bounceBall
import fire_slowBlob
import fire_paraLockBlob
import fire_lockblob
import fire_luciferCannon
import fire_pulseRifle
import fire_flamer
import G_RunMissile
import G_InitDamageLocations
import AddScore
import body_die
import G_SelectiveRadiusDamage
import G_RadiusDamage
import G_SelectiveDamage
import G_Damage
import CanDamage
import G_ClosestEnt
import G_Visible
import Distance2d
import G_CloseMenus
import G_TriggerMenu
import G_ClientIsLagging
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_BroadcastEvent
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import G_ShaderIndex
import G_ParticleSystemIndex
import G_FindBuildLogName
import G_CountBuildLog
import G_LogBuild
import G_RevertCanFit
import G_CommitRevertedBuildable
import G_SpawnRevertedBuildable
import G_InstantBuild
import G_BaseSelfDestruct
import G_LayoutLoad
import G_LayoutSelect
import G_LayoutList
import G_LayoutSave
import G_CheckDBProtection
import FinishSpawningBuildable
import G_SpawnBuildable
import G_SetIdleBuildableAnim
import G_SetBuildableAnim
import G_BuildIfValid
import G_BuildingExists
import G_CanBuild
import G_ArmoryRange
import G_BuildableRange
import G_BuildableThink
import G_IsOvermindBuilt
import G_IsDCCBuilt
import G_IsPowered
import G_CheckSpawnPoint
import AHovel_Blocked
import G_Physics
import G_CP
import G_WordWrap
import Cmd_Builder_f
import Cmd_TeamVote_f
import Cmd_Donate_f
import Cmd_Share_f
import G_statsString
import G_PrivateMessage
import G_SanitiseString
import G_ChangeTeam
import G_LeaveTeam
import G_ParseEscapedString
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import G_Say
import G_ClientNumbersFromString
import G_MatchOnePlayer
import G_ToggleFollow
import G_FollowNewClient
import G_StopFollowing
import G_StopFromFollowing
import Cmd_Score_f
import botJump
import botCrouch
import botWalk
import botShootIfTargetInRange
import botGetDistanceBetweenPlayer
import botTargetInRange
import botFindClosestEnemy
import botAimAtTarget
import G_BotSpectatorThink
import G_BotThink
import G_BotCmd
import G_BotDel
import G_BotAdd
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import G_GetPosInSpawnQueue
import G_RemoveFromSpawnQueue
import G_PushSpawnQueue
import G_SearchSpawnQueue
import G_PeekSpawnQueue
import G_PopSpawnQueue
import G_GetSpawnQueueLength
import G_InitSpawnQueue
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_mystats
import G_admin_message
import G_badgelist
import G_badges
import G_adminWhiteAdd
import G_adminWhiteDelete
import G_adminWhiteList
import G_adminGlobalSync
import G_adminGlobalBan
import G_adminGlobalHandicap
import G_adminGlobalDenyBuild
import G_adminGlobalForcespec
import G_adminGlobalMute
import G_adminListGlobals
import G_adminDeleteGlobal
import G_setnextnode
import G_drawnodes
import G_reconnectdb
import G_switchnodes
import G_admin_botcmd
import G_admin_bot
import G_set_survival_stage
import G_admin_findpath
import G_admin_printpath
import G_admin_printgrid
import G_admin_switch
import G_admin_cp
import G_admin_designate
import G_admin_warn
import G_admin_putmespec
import G_admin_L1
import G_admin_L0
import G_admin_pause
import G_admin_revert
import G_admin_buildlog
import G_admin_info
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_register
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_denybuild
import G_admin_mute
import G_admin_layoutsave
import G_admin_maplog
import G_admin_maplog_update
import G_admin_devmap
import G_admin_map
import G_admin_listrotation
import G_admin_listmaps
import G_admin_listplayers
import G_admin_listlayouts
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_subnetban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_adminPrintName
import G_admin_set_adminname
import G_admin_level
import G_admin_maplog_result
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
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
