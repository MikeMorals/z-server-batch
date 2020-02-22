data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 8
file "..\..\..\..\src/game/g_utils.c"
line 44
;1:/*
;2: ===========================================================================
;3: Copyright (C) 1999-2005 Id Software, Inc.
;4: Copyright (C) 2000-2006 Tim Angus
;5:
;6: This file is part of Tremulous.
;7:
;8: Tremulous is free software; you can redistribute it
;9: and/or modify it under the terms of the GNU General Public License as
;10: published by the Free Software Foundation; either version 2 of the License,
;11: or (at your option) any later version.
;12:
;13: Tremulous is distributed in the hope that it will be
;14: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16: GNU General Public License for more details.
;17:
;18: You should have received a copy of the GNU General Public License
;19: along with Tremulous; if not, write to the Free Software
;20: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21: ===========================================================================
;22: */
;23:
;24:// g_utils.c -- misc utility functions for game module
;25:
;26:#include "g_local.h"
;27:
;28:typedef struct
;29:{
;30:  char oldShader[MAX_QPATH];
;31:  char newShader[MAX_QPATH];
;32:  float timeOffset;
;33:} shaderRemap_t;
;34:
;35:#define MAX_SHADER_REMAPS 128
;36:#define MAX_VALUE 1000
;37:#define MAX_SPAWN_POINTS  128
;38:
;39:int remapCount = 0;
;40:shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];
;41:
;42:void
;43:AddRemap(const char *oldShader, const char *newShader, float timeOffset)
;44:{
line 47
;45:  int i;
;46:
;47:  for(i = 0;i < remapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $86
line 48
;48:  {
line 49
;49:    if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0)
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $90
line 50
;50:    {
line 52
;51:      // found it, just update this one
;52:      strcpy(remappedShaders[i].newShader, newShader);
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 53
;53:      remappedShaders[i].timeOffset = timeOffset;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 54
;54:      return;
ADDRGP4 $85
JUMPV
LABELV $90
line 56
;55:    }
;56:  }
LABELV $87
line 47
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $89
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $86
line 58
;57:
;58:  if (remapCount < MAX_SHADER_REMAPS)
ADDRGP4 remapCount
INDIRI4
CNSTI4 128
GEI4 $94
line 59
;59:  {
line 60
;60:    strcpy(remappedShaders[remapCount].newShader, newShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 61
;61:    strcpy(remappedShaders[remapCount].oldShader, oldShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 62
;62:    remappedShaders[remapCount].timeOffset = timeOffset;
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 63
;63:    remapCount++;
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 64
;64:  }
LABELV $94
line 65
;65:}
LABELV $85
endproc AddRemap 8 8
bss
align 1
LABELV $99
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
line 69
;66:
;67:const char *
;68:BuildShaderStateConfig(void)
;69:{
line 74
;70:  static char buff[MAX_STRING_CHARS * 4];
;71:  char out[(MAX_QPATH * 2) + 5];
;72:  int i;
;73:
;74:  memset(buff, 0, MAX_STRING_CHARS);
ADDRGP4 $99
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 76
;75:
;76:  for(i = 0;i < remapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 77
;77:  {
line 78
;78:    Com_sprintf(
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $104
ARGP4
ADDRLP4 140
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 81
;79:      out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader,
;80:      remappedShaders[i].newShader, remappedShaders[i].timeOffset);
;81:    Q_strcat(buff, sizeof(buff), out);
ADDRGP4 $99
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 82
;82:  }
LABELV $101
line 76
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $100
line 83
;83:  return buff;
ADDRGP4 $99
RETP4
LABELV $98
endproc BuildShaderStateConfig 144 24
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
line 102
;84:}
;85:
;86:/*
;87: =========================================================================
;88:
;89: model / sound configstring indexes
;90:
;91: =========================================================================
;92: */
;93:
;94:/*
;95: ================
;96: G_FindConfigstringIndex
;97:
;98: ================
;99: */
;100:int
;101:G_FindConfigstringIndex(char *name, int start, int max, qboolean create)
;102:{
line 106
;103:  int i;
;104:  char s[MAX_STRING_CHARS];
;105:
;106:  if (!name || !name[0])
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $108
LABELV $110
line 107
;107:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $108
line 109
;108:
;109:  for(i = 1;i < max;i++)
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 110
;110:  {
line 111
;111:    trap_GetConfigstring(start + i, s, sizeof(s));
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 112
;112:    if (!s[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $115
line 113
;113:      break;
ADDRGP4 $113
JUMPV
LABELV $115
line 115
;114:
;115:    if (!strcmp(s, name))
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $117
line 116
;116:      return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $107
JUMPV
LABELV $117
line 117
;117:  }
LABELV $112
line 109
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $111
LABELV $113
line 119
;118:
;119:  if (!create)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $119
line 120
;120:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $119
line 122
;121:
;122:  if (i == max)
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $121
line 123
;123:    G_Error("G_FindConfigstringIndex: overflow");
ADDRGP4 $123
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $121
line 125
;124:
;125:  trap_SetConfigstring(start + i, name);
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 127
;126:
;127:  return i;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $107
endproc G_FindConfigstringIndex 1036 12
export G_ParticleSystemIndex
proc G_ParticleSystemIndex 4 16
line 134
;128:}
;129:
;130://TA: added ParticleSystemIndex
;131:
;132:int
;133:G_ParticleSystemIndex(char *name)
;134:{
line 135
;135:  return G_FindConfigstringIndex(name, CS_PARTICLE_SYSTEMS, MAX_GAME_PARTICLE_SYSTEMS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 609
ARGI4
CNSTI4 64
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $124
endproc G_ParticleSystemIndex 4 16
export G_ShaderIndex
proc G_ShaderIndex 4 16
line 142
;136:}
;137:
;138://TA: added ShaderIndex
;139:
;140:int
;141:G_ShaderIndex(char *name)
;142:{
line 143
;143:  return G_FindConfigstringIndex(name, CS_SHADERS, MAX_GAME_SHADERS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 545
ARGI4
CNSTI4 64
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $125
endproc G_ShaderIndex 4 16
export G_ModelIndex
proc G_ModelIndex 4 16
line 148
;144:}
;145:
;146:int
;147:G_ModelIndex(char *name)
;148:{
line 149
;149:  return G_FindConfigstringIndex(name, CS_MODELS, MAX_MODELS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 33
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $126
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
line 154
;150:}
;151:
;152:int
;153:G_SoundIndex(char *name)
;154:{
line 155
;155:  return G_FindConfigstringIndex(name, CS_SOUNDS, MAX_SOUNDS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 289
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $127
endproc G_SoundIndex 4 16
export G_TeamCommand
proc G_TeamCommand 16 8
line 169
;156:}
;157:
;158://=====================================================================
;159:
;160:/*
;161: ================
;162: G_TeamCommand
;163:
;164: Broadcasts a command to only a specific team
;165: ================
;166: */
;167:void
;168:G_TeamCommand(pTeam_t team, char *cmd)
;169:{
line 172
;170:  int i;
;171:
;172:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 173
;173:  {
line 174
;174:    if (level.clients[i].pers.connected == CON_CONNECTED)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $134
line 175
;175:    {
line 176
;176:      if (level.clients[i].pers.teamSelection == team || (level.clients[i].pers.teamSelection
ADDRLP4 8
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $139
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $136
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 12
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $136
LABELV $139
line 178
;177:          == PTE_NONE && G_admin_permission(&g_entities[i], ADMF_SPEC_ALLCHAT)))
;178:        trap_SendServerCommand(i, cmd);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $136
line 179
;179:    }
LABELV $134
line 180
;180:  }
LABELV $130
line 172
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $129
line 181
;181:}
LABELV $128
endproc G_TeamCommand 16 8
export G_ProjectSource
proc G_ProjectSource 20 0
line 185
;182:
;183:void
;184:G_ProjectSource(vec3_t point, vec3_t distance, vec3_t forward, vec3_t right, vec3_t result)
;185:{
line 186
;186:  result[0] = point[0] + forward[0] * distance[0] + right[0] * distance[1];
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
MULF4
ADDF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 187
;187:  result[1] = point[1] + forward[1] * distance[0] + right[1] * distance[1];
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 16
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 188
;188:  result[2] = point[2] + forward[2] * distance[0] + right[2] * distance[1] + distance[2];
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDF4
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 189
;189:}
LABELV $140
endproc G_ProjectSource 20 0
export G_Find
proc G_Find 8 8
line 205
;190:
;191:/*
;192: =============
;193: G_Find
;194:
;195: Searches all active entities for the next one that holds
;196: the matching string at fieldofs (use the FOFS() macro) in the structure.
;197:
;198: Searches beginning at the entity after from, or the beginning if NULL
;199: NULL will be returned if the end of the list is reached.
;200:
;201: =============
;202: */
;203:gentity_t *
;204:G_Find(gentity_t *from, int fieldofs, const char *match)
;205:{
line 208
;206:  char *s;
;207:
;208:  if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
line 209
;209:    from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $142
line 211
;210:  else
;211:    from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
line 213
;212:
;213:  for(;from < &g_entities[level.num_entities];from++)
ADDRGP4 $147
JUMPV
LABELV $144
line 214
;214:  {
line 215
;215:    if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $149
line 216
;216:      continue;
ADDRGP4 $145
JUMPV
LABELV $149
line 217
;217:    s = *(char **) ((byte *) from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 219
;218:
;219:    if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 220
;220:      continue;
ADDRGP4 $145
JUMPV
LABELV $151
line 222
;221:
;222:    if (!Q_stricmp(s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $153
line 223
;223:      return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $141
JUMPV
LABELV $153
line 224
;224:  }
LABELV $145
line 213
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $147
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2476
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $144
line 226
;225:
;226:  return NULL;
CNSTP4 0
RETP4
LABELV $141
endproc G_Find 8 8
export G_PickTarget
proc G_PickTarget 144 12
line 240
;227:}
;228:
;229:/*
;230: =============
;231: G_PickTarget
;232:
;233: Selects a random entity from among the targets
;234: =============
;235: */
;236:#define MAXCHOICES  32
;237:
;238:gentity_t *
;239:G_PickTarget(char *targetname)
;240:{
line 241
;241:  gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 242
;242:  int num_choices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 245
;243:  gentity_t * choice[MAXCHOICES];
;244:
;245:  if (!targetname)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
line 246
;246:  {
line 247
;247:    G_Printf("G_PickTarget called with NULL targetname\n");
ADDRGP4 $158
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 248
;248:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $155
JUMPV
LABELV $159
line 252
;249:  }
;250:
;251:  while(1)
;252:  {
line 253
;253:    ent = G_Find(ent, FOFS(targetname), targetname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 255
;254:
;255:    if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 256
;256:      break;
ADDRGP4 $161
JUMPV
LABELV $162
line 258
;257:
;258:    choice[num_choices++] = ent;
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 260
;259:
;260:    if (num_choices == MAXCHOICES)
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $164
line 261
;261:      break;
ADDRGP4 $161
JUMPV
LABELV $164
line 262
;262:  }
LABELV $160
line 251
ADDRGP4 $159
JUMPV
LABELV $161
line 264
;263:
;264:  if (!num_choices)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $166
line 265
;265:  {
line 266
;266:    G_Printf("G_PickTarget: target %s not found\n", targetname);
ADDRGP4 $168
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 267
;267:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $155
JUMPV
LABELV $166
line 270
;268:  }
;269:
;270:  return choice[rand() % num_choices];
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $155
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 24 12
line 286
;271:}
;272:
;273:/*
;274: ==============================
;275: G_UseTargets
;276:
;277: "activator" should be set to the entity that initiated the firing.
;278:
;279: Search for (string)targetname in all entities that
;280: match (string)self.target and call their .use function
;281:
;282: ==============================
;283: */
;284:void
;285:G_UseTargets(gentity_t *ent, gentity_t *activator)
;286:{
line 289
;287:  gentity_t *t;
;288:
;289:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $170
line 290
;290:    return;
ADDRGP4 $169
JUMPV
LABELV $170
line 292
;291:
;292:  if (ent->targetShaderName && ent->targetShaderNewName)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $172
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $172
line 293
;293:  {
line 294
;294:    float f = level.time * 0.001;
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 level+28
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 295
;295:    AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 672
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 296
;296:    trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 20
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 297
;297:  }
LABELV $172
line 299
;298:
;299:  if (!ent->target)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 300
;300:    return;
ADDRGP4 $169
JUMPV
LABELV $175
line 302
;301:
;302:  t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $177
line 304
;303:  while((t = G_Find(t, FOFS(targetname), ent->target)) != NULL)
;304:  {
line 305
;305:    if (t == ent)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $180
line 306
;306:      G_Printf("WARNING: Entity used itself.\n");
ADDRGP4 $182
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $181
JUMPV
LABELV $180
line 308
;307:    else
;308:    {
line 309
;309:      if (t->use)
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
line 310
;310:        t->use(t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CALLV
pop
LABELV $183
line 311
;311:    }
LABELV $181
line 313
;312:
;313:    if (!ent->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $185
line 314
;314:    {
line 315
;315:      G_Printf("entity was removed while using targets\n");
ADDRGP4 $187
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 316
;316:      return;
ADDRGP4 $169
JUMPV
LABELV $185
line 318
;317:    }
;318:  }
LABELV $178
line 303
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $177
line 319
;319:}
LABELV $169
endproc G_UseTargets 24 12
bss
align 4
LABELV $189
skip 4
align 4
LABELV $190
skip 96
export tv
code
proc tv 8 0
line 331
;320:
;321:/*
;322: =============
;323: TempVector
;324:
;325: This is just a convenience function
;326: for making temporary vectors for function calls
;327: =============
;328: */
;329:float *
;330:tv(float x, float y, float z)
;331:{
line 338
;332:  static int index;
;333:  static vec3_t vecs[8];
;334:  float *v;
;335:
;336:  // use an array so that multiple tempvectors won't collide
;337:  // for a while
;338:  v = vecs[index];
ADDRLP4 0
CNSTI4 12
ADDRGP4 $189
INDIRI4
MULI4
ADDRGP4 $190
ADDP4
ASGNP4
line 339
;339:  index = (index + 1) & 7;
ADDRLP4 4
ADDRGP4 $189
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 341
;340:
;341:  v[0] = x;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
line 342
;342:  v[1] = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 343
;343:  v[2] = z;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 345
;344:
;345:  return v;
ADDRLP4 0
INDIRP4
RETP4
LABELV $188
endproc tv 8 0
bss
align 4
LABELV $192
skip 4
align 1
LABELV $193
skip 256
export vtos
code
proc vtos 12 24
line 358
;346:}
;347:
;348:/*
;349: =============
;350: VectorToString
;351:
;352: This is just a convenience function
;353: for printing vectors
;354: =============
;355: */
;356:char *
;357:vtos(const vec3_t v)
;358:{
line 364
;359:  static int index;
;360:  static char str[8][32];
;361:  char *s;
;362:
;363:  // use an array so that multiple vtos won't collide
;364:  s = str[index];
ADDRLP4 0
ADDRGP4 $192
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $193
ADDP4
ASGNP4
line 365
;365:  index = (index + 1) & 7;
ADDRLP4 4
ADDRGP4 $192
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 367
;366:
;367:  Com_sprintf(s, 32, "(%i %i %i)", (int) v[0], (int) v[1], (int) v[2]);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $194
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 369
;368:
;369:  return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $191
endproc vtos 12 24
data
align 4
LABELV $196
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $197
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $198
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $199
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 20 16
line 384
;370:}
;371:
;372:/*
;373: ===============
;374: G_SetMovedir
;375:
;376: The editor only specifies a single value for angles (yaw),
;377: but we have special constants to generate an up or down direction.
;378: Angles will be cleared, because it is being used to represent a direction
;379: instead of an orientation.
;380: ===============
;381: */
;382:void
;383:G_SetMovedir(vec3_t angles, vec3_t movedir)
;384:{
line 394
;385:  static vec3_t VEC_UP =
;386:  { 0, -1, 0 };
;387:  static vec3_t MOVEDIR_UP =
;388:  { 0, 0, 1 };
;389:  static vec3_t VEC_DOWN =
;390:  { 0, -2, 0 };
;391:  static vec3_t MOVEDIR_DOWN =
;392:  { 0, 0, -1 };
;393:
;394:  if (VectorCompare(angles, VEC_UP))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $200
line 395
;395:    VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $197
INDIRB
ASGNB 12
ADDRGP4 $201
JUMPV
LABELV $200
line 396
;396:  else if (VectorCompare(angles, VEC_DOWN))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $202
line 397
;397:    VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $199
INDIRB
ASGNB 12
ADDRGP4 $203
JUMPV
LABELV $202
line 399
;398:  else
;399:    AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
LABELV $203
LABELV $201
line 401
;400:
;401:  VectorClear(angles);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
line 402
;402:}
LABELV $195
endproc G_SetMovedir 20 16
export vectoyaw
proc vectoyaw 20 8
line 406
;403:
;404:float
;405:vectoyaw(const vec3_t vec)
;406:{
line 409
;407:  float yaw;
;408:
;409:  if (vec[YAW] == 0 && vec[PITCH] == 0)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $205
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $205
line 410
;410:  {
line 411
;411:    yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 412
;412:  }
ADDRGP4 $206
JUMPV
LABELV $205
line 414
;413:  else
;414:  {
line 415
;415:    if (vec[PITCH])
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $207
line 416
;416:      yaw = (atan2(vec[YAW], vec[PITCH]) * 180 / M_PI);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
ADDRGP4 $208
JUMPV
LABELV $207
line 417
;417:    else if (vec[YAW] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $209
line 418
;418:      yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
ADDRGP4 $210
JUMPV
LABELV $209
line 420
;419:    else
;420:      yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
LABELV $210
LABELV $208
line 422
;421:
;422:    if (yaw < 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $211
line 423
;423:      yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $211
line 424
;424:  }
LABELV $206
line 426
;425:
;426:  return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $204
endproc vectoyaw 20 8
export G_InitGentity
proc G_InitGentity 4 0
line 431
;427:}
;428:
;429:void
;430:G_InitGentity(gentity_t *e)
;431:{
line 432
;432:  e->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 433
;433:  e->classname = "noclass";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $214
ASGNP4
line 434
;434:  e->s.number = e - g_entities;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
line 435
;435:  e->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1023
ASGNI4
line 436
;436:}
LABELV $213
endproc G_InitGentity 4 0
export G_Spawn
proc G_Spawn 16 20
line 455
;437:
;438:/*
;439: =================
;440: G_Spawn
;441:
;442: Either finds a free entity, or allocates a new one.
;443:
;444: The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
;445: never be used by anything else.
;446:
;447: Try to avoid reusing an entity that was recently freed, because it
;448: can cause the client to think the entity morphed into something else
;449: instead of being removed and recreated, which can cause interpolated
;450: angles and bad trails.
;451: =================
;452: */
;453:gentity_t *
;454:G_Spawn(void)
;455:{
line 459
;456:  int i, force;
;457:  gentity_t *e;
;458:
;459:  e = NULL; // shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 460
;460:  i = 0; // shut up warning
ADDRLP4 4
CNSTI4 0
ASGNI4
line 462
;461:
;462:  for(force = 0;force < 2;force++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $216
line 463
;463:  {
line 466
;464:    // if we go through all entities and can't find one to free,
;465:    // override the normal minimum times before use
;466:    e = &g_entities[MAX_CLIENTS];
ADDRLP4 0
ADDRGP4 g_entities+158464
ASGNP4
line 468
;467:
;468:    for(i = MAX_CLIENTS;i < level.num_entities;i++, e++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $221
line 469
;469:    {
line 470
;470:      if (e->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $226
line 471
;471:        continue;
ADDRGP4 $222
JUMPV
LABELV $226
line 475
;472:
;473:      // the first couple seconds of server time can involve a lot of
;474:      // freeing and allocating, so relax the replacement policy
;475:      if (!force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $228
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+40
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $228
ADDRGP4 level+28
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $228
line 476
;476:        continue;
ADDRGP4 $222
JUMPV
LABELV $228
line 479
;477:
;478:      // reuse this slot
;479:      G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 480
;480:      return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $215
JUMPV
LABELV $222
line 468
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $224
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $221
line 483
;481:    }
;482:
;483:    if (i != MAX_GENTITIES)
ADDRLP4 4
INDIRI4
CNSTI4 1024
EQI4 $232
line 484
;484:      break;
ADDRGP4 $218
JUMPV
LABELV $232
line 485
;485:  }
LABELV $217
line 462
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $216
LABELV $218
line 487
;486:
;487:  if (i == ENTITYNUM_MAX_NORMAL)
ADDRLP4 4
INDIRI4
CNSTI4 1022
NEI4 $234
line 488
;488:  {
line 489
;489:    for(i = 0;i < MAX_GENTITIES;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $236
line 490
;490:      G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $240
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $237
line 489
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $236
line 492
;491:
;492:    G_Error("G_Spawn: no free entities");
ADDRGP4 $242
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 493
;493:  }
LABELV $234
line 496
;494:
;495:  // open up a new slot
;496:  level.num_entities++;
ADDRLP4 12
ADDRGP4 level+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 499
;497:
;498:  // let the server system know that there are more entities
;499:  trap_LocateGameData(
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 2476
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 2148
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 503
;500:    level.gentities, level.num_entities, sizeof(gentity_t), &level.clients[0].ps,
;501:    sizeof(level.clients[0]));
;502:
;503:  G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 504
;504:  return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $215
endproc G_Spawn 16 20
export G_EntitiesFree
proc G_EntitiesFree 8 0
line 514
;505:}
;506:
;507:/*
;508: =================
;509: G_EntitiesFree
;510: =================
;511: */
;512:qboolean
;513:G_EntitiesFree(void)
;514:{
line 518
;515:  int i;
;516:  gentity_t *e;
;517:
;518:  e = &g_entities[MAX_CLIENTS];
ADDRLP4 4
ADDRGP4 g_entities+158464
ASGNP4
line 520
;519:
;520:  for(i = MAX_CLIENTS;i < level.num_entities;i++, e++)
ADDRLP4 0
CNSTI4 64
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $248
line 521
;521:  {
line 522
;522:    if (e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $253
line 523
;523:      continue;
ADDRGP4 $249
JUMPV
LABELV $253
line 526
;524:
;525:    // slot available
;526:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $246
JUMPV
LABELV $249
line 520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $251
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $248
line 529
;527:  }
;528:
;529:  return qfalse;
CNSTI4 0
RETI4
LABELV $246
endproc G_EntitiesFree 8 0
export G_FreeEntity
proc G_FreeEntity 20 12
line 541
;530:}
;531:
;532:/*
;533: =================
;534: G_FreeEntity
;535:
;536: Marks the entity as free
;537: =================
;538: */
;539:void
;540:G_FreeEntity(gentity_t *ent)
;541:{
line 542
;542:  if (g_ctn.integer > 0 && ent && ent->builder && ent->s.eType == ET_BUILDABLE
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 g_ctn+12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $256
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $256
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $256
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $256
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $256
ADDRLP4 12
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $256
line 544
;543:      && ent->builder->client && ent->builder->ctn_build_count > 0)
;544:  {
line 545
;545:    ent->builder->ctn_build_count--;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRP4
CNSTI4 2256
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 546
;546:  }
LABELV $256
line 547
;547:  trap_UnlinkEntity(ent); // unlink from world
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 549
;548:
;549:  if (ent->neverFree)
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
line 550
;550:    return;
ADDRGP4 $255
JUMPV
LABELV $259
line 552
;551:
;552:  memset(ent, 0, sizeof(*ent));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2476
ARGI4
ADDRGP4 memset
CALLP4
pop
line 553
;553:  ent->classname = "freent";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $261
ASGNP4
line 554
;554:  ent->freetime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 555
;555:  ent->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 556
;556:}
LABELV $255
endproc G_FreeEntity 20 12
export G_TempEntity
proc G_TempEntity 20 8
line 569
;557:
;558:/*
;559: =================
;560: G_TempEntity
;561:
;562: Spawns an event entity that will be auto-removed
;563: The origin will be snapped to save net bandwidth, so care
;564: must be taken if the origin is right on a surface (snap towards start vector first)
;565: =================
;566: */
;567:gentity_t *
;568:G_TempEntity(vec3_t origin, int event)
;569:{
line 573
;570:  gentity_t *e;
;571:  vec3_t snapped;
;572:
;573:  e = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 574
;574:  e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 576
;575:
;576:  e->classname = "tempEntity";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $264
ASGNP4
line 577
;577:  e->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 578
;578:  e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 580
;579:
;580:  VectorCopy(origin, snapped);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 581
;581:  SnapVector(snapped); // save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 582
;582:  G_SetOrigin(e, snapped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 585
;583:
;584:  // find cluster for PVS
;585:  trap_LinkEntity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 587
;586:
;587:  return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $263
endproc G_TempEntity 20 8
export G_KillBox
proc G_KillBox 4168 32
line 608
;588:}
;589:
;590:/*
;591: ==============================================================================
;592:
;593: Kill box
;594:
;595: ==============================================================================
;596: */
;597:
;598:/*
;599: =================
;600: G_KillBox
;601:
;602: Kills all entities that would touch the proposed new positioning
;603: of ent.  Ent should be unlinked before calling this!
;604: =================
;605: */
;606:void
;607:G_KillBox(gentity_t *ent)
;608:{
line 614
;609:  int i, num;
;610:  int touch[MAX_GENTITIES];
;611:  gentity_t *hit;
;612:  vec3_t mins, maxs;
;613:
;614:  VectorAdd(ent->client->ps.origin, ent->r.mins, mins);
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4132
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108+8
ADDRLP4 4140
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 615
;615:  VectorAdd(ent->client->ps.origin, ent->r.maxs, maxs);
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4148
ADDRLP4 4144
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120+8
ADDRLP4 4152
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4152
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 616
;616:  num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4156
INDIRI4
ASGNI4
line 618
;617:
;618:  for(i = 0;i < num;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 619
;619:  {
line 620
;620:    hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 622
;621:
;622:    if (!hit->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 623
;623:      continue;
ADDRGP4 $276
JUMPV
LABELV $279
line 626
;624:
;625:    //TA: impossible to telefrag self
;626:    if (ent == hit)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
NEU4 $281
line 627
;627:      continue;
ADDRGP4 $276
JUMPV
LABELV $281
line 630
;628:
;629:    // nail it
;630:    G_Damage(hit, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
CNSTP4 0
ASGNP4
ADDRLP4 4164
INDIRP4
ARGP4
ADDRLP4 4164
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 631
;631:  }
LABELV $276
line 618
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $275
line 633
;632:
;633:}
LABELV $270
endproc G_KillBox 4168 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 12
line 648
;634:
;635://==============================================================================
;636:
;637:/*
;638: ===============
;639: G_AddPredictableEvent
;640:
;641: Use for non-pmove events that would also be predicted on the
;642: client side: jumppads and item pickups
;643: Adds an event+parm and twiddles the event counter
;644: ===============
;645: */
;646:void
;647:G_AddPredictableEvent(gentity_t *ent, int event, int eventParm)
;648:{
line 649
;649:  if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $284
line 650
;650:    return;
ADDRGP4 $283
JUMPV
LABELV $284
line 652
;651:
;652:  BG_AddPredictableEventToPlayerstate(event, eventParm, &ent->client->ps);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 653
;653:}
LABELV $283
endproc G_AddPredictableEvent 0 12
export G_AddEvent
proc G_AddEvent 4 12
line 664
;654:
;655:/*
;656: ===============
;657: G_AddEvent
;658:
;659: Adds an event+parm and twiddles the event counter
;660: ===============
;661: */
;662:void
;663:G_AddEvent(gentity_t *ent, int event, int eventParm)
;664:{
line 667
;665:  int bits;
;666:
;667:  if (!event)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $287
line 668
;668:  {
line 669
;669:    G_Printf("G_AddEvent: zero event added for entity %i\n", ent->s.number);
ADDRGP4 $289
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 670
;670:    return;
ADDRGP4 $286
JUMPV
LABELV $287
line 674
;671:  }
;672:
;673:  // eventParm is converted to uint8_t (0 - 255) in msg.c
;674:  if (eventParm & ~0xFF)
ADDRFP4 8
INDIRI4
CNSTI4 -256
BANDI4
CNSTI4 0
EQI4 $290
line 675
;675:  {
line 676
;676:    G_Printf(S_COLOR_YELLOW "WARNING: G_AddEvent: event %d "
ADDRGP4 $292
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 678
;677:    " eventParm uint8_t overflow (given %d)\n", event, eventParm);
;678:  }
LABELV $290
line 681
;679:
;680:  // clients need to add the event in playerState_t instead of entityState_t
;681:  if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $293
line 682
;682:  {
line 683
;683:    bits = ent->client->ps.externalEvent & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 684
;684:    bits = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 685
;685:    ent->client->ps.externalEvent = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 686
;686:    ent->client->ps.externalEventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 687
;687:    ent->client->ps.externalEventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 688
;688:  }
ADDRGP4 $294
JUMPV
LABELV $293
line 690
;689:  else
;690:  {
line 691
;691:    bits = ent->s.event & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 692
;692:    bits = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 693
;693:    ent->s.event = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 694
;694:    ent->s.eventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 695
;695:  }
LABELV $294
line 697
;696:
;697:  ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 698
;698:}
LABELV $286
endproc G_AddEvent 4 12
export G_BroadcastEvent
proc G_BroadcastEvent 8 8
line 709
;699:
;700:/*
;701: ===============
;702: G_BroadcastEvent
;703:
;704: Sends an event to every client
;705: ===============
;706: */
;707:void
;708:G_BroadcastEvent(int event, int eventParm)
;709:{
line 712
;710:  gentity_t *ent;
;711:
;712:  ent = G_TempEntity(vec3_origin, event);
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 713
;713:  ent->s.eventParm = eventParm;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 714
;714:  ent->r.svFlags = SVF_BROADCAST; // send to everyone
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 715
;715:}
LABELV $297
endproc G_BroadcastEvent 8 8
export G_Sound
proc G_Sound 8 8
line 724
;716:
;717:/*
;718: =============
;719: G_Sound
;720: =============
;721: */
;722:void
;723:G_Sound(gentity_t *ent, int channel, int soundIndex)
;724:{
line 727
;725:  gentity_t *te;
;726:
;727:  te = G_TempEntity(ent->r.currentOrigin, EV_GENERAL_SOUND);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 728
;728:  te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 729
;729:}
LABELV $298
endproc G_Sound 8 8
export G_ClientIsLagging
proc G_ClientIsLagging 0 0
line 738
;730:
;731:/*
;732: =============
;733: G_ClientIsLagging
;734: =============
;735: */
;736:qboolean
;737:G_ClientIsLagging(gclient_t *client)
;738:{
line 739
;739:  if (client)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
line 740
;740:  {
line 741
;741:    if (client->ps.ping >= 999)
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
LTI4 $302
line 742
;742:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $302
line 744
;743:    else
;744:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $299
JUMPV
LABELV $300
line 747
;745:  }
;746:
;747:  return qfalse; //is a non-existant client lagging? woooo zen
CNSTI4 0
RETI4
LABELV $299
endproc G_ClientIsLagging 0 0
export G_SetOrigin
proc G_SetOrigin 8 0
line 761
;748:}
;749:
;750://==============================================================================
;751:
;752:/*
;753: ================
;754: G_SetOrigin
;755:
;756: Sets the pos trajectory for a fixed position
;757: ================
;758: */
;759:void
;760:G_SetOrigin(gentity_t *ent, vec3_t origin)
;761:{
line 762
;762:  VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 763
;763:  ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 764
;764:  ent->s.pos.trTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 765
;765:  ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 766
;766:  VectorClear(ent->s.pos.trDelta);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 768
;767:
;768:  VectorCopy(origin, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 769
;769:  VectorCopy(origin, ent->s.origin); //TA: if shit breaks - blame this line
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 770
;770:}
LABELV $304
endproc G_SetOrigin 8 0
export G_FindRadius
proc G_FindRadius 28 4
line 778
;771:
;772://TA: from quakestyle.telefragged.com
;773:// (NOBODY): Code helper function
;774://
;775:
;776:gentity_t *
;777:G_FindRadius(gentity_t * from, const vec3_t org, float rad)
;778:{
line 782
;779:  vec3_t eorg;
;780:  int j;
;781:
;782:  if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $306
line 783
;783:    from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $311
JUMPV
LABELV $306
line 785
;784:  else
;785:    from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
line 787
;786:
;787:  for(;from < &g_entities[level.num_entities];from++)
ADDRGP4 $311
JUMPV
LABELV $308
line 788
;788:  {
line 789
;789:    if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $313
line 790
;790:      continue;
ADDRGP4 $309
JUMPV
LABELV $313
line 792
;791:
;792:    for(j = 0;j < 3;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $315
line 793
;793:      eorg[j] = org[j] - (from->r.currentOrigin[j] + (from->r.mins[j] + from->r.maxs[j]) * 0.5);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 436
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 448
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
SUBF4
ASGNF4
LABELV $316
line 792
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $315
line 795
;794:
;795:    if (VectorLength(eorg) > rad)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $319
line 796
;796:      continue;
ADDRGP4 $309
JUMPV
LABELV $319
line 798
;797:
;798:    return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $305
JUMPV
LABELV $309
line 787
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $311
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2476
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $308
line 801
;799:  }
;800:
;801:  return NULL;
CNSTP4 0
RETP4
LABELV $305
endproc G_FindRadius 28 4
export G_Visible
proc G_Visible 72 28
line 813
;802:}
;803:
;804:/*
;805: ===============
;806: G_Visible
;807:
;808: Test for a LOS between two entities
;809: ===============
;810: */
;811:qboolean
;812:G_Visible(gentity_t *ent1, gentity_t *ent2)
;813:{
line 816
;814:  trace_t trace;
;815:
;816:  trap_Trace(&trace, ent1->s.pos.trBase, NULL, NULL, ent2->s.pos.trBase, ent1->s.number, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 24
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 818
;817:
;818:  if (trace.contents & CONTENTS_SOLID)
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $322
line 819
;819:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $321
JUMPV
LABELV $322
line 821
;820:
;821:  return qtrue;
CNSTI4 1
RETI4
LABELV $321
endproc G_Visible 72 28
export G_ClosestEnt
proc G_ClosestEnt 24 8
line 833
;822:}
;823:
;824:/*
;825: ===============
;826: G_ClosestEnt
;827:
;828: Test a list of entities for the closest to a particular point
;829: ===============
;830: */
;831:gentity_t *
;832:G_ClosestEnt(vec3_t origin, gentity_t **entities, int numEntities)
;833:{
line 835
;834:  int i;
;835:  float nd, d = 1000000.0f;
ADDRLP4 8
CNSTF4 1232348160
ASGNF4
line 836
;836:  gentity_t *closestEnt = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 838
;837:
;838:  for(i = 0;i < numEntities;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $326
line 839
;839:  {
line 840
;840:    gentity_t *ent = entities[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 842
;841:
;842:    nd = DistanceSquared(origin, ent->s.origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
ASGNF4
line 843
;843:    if (i == 0 || nd < d)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $332
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $330
LABELV $332
line 844
;844:    {
line 845
;845:      d = nd;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 846
;846:      closestEnt = ent;
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 847
;847:    }
LABELV $330
line 848
;848:  }
LABELV $327
line 838
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $329
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $326
line 850
;849:
;850:  return closestEnt;
ADDRLP4 12
INDIRP4
RETP4
LABELV $325
endproc G_ClosestEnt 24 8
export G_TriggerMenu
proc G_TriggerMenu 32 16
line 862
;851:}
;852:
;853:/*
;854: ===============
;855: G_TriggerMenu
;856:
;857: Trigger a menu on some client
;858: ===============
;859: */
;860:void
;861:G_TriggerMenu(int clientNum, dynMenu_t menu)
;862:{
line 865
;863:  char buffer[32];
;864:
;865:  Com_sprintf(buffer, 32, "servermenu %d", menu);
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $334
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 866
;866:  trap_SendServerCommand(clientNum, buffer);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 867
;867:}
LABELV $333
endproc G_TriggerMenu 32 16
export G_CloseMenus
proc G_CloseMenus 32 12
line 878
;868:
;869:/*
;870: ===============
;871: G_CloseMenus
;872:
;873: Close all open menus on some client
;874: ===============
;875: */
;876:void
;877:G_CloseMenus(int clientNum)
;878:{
line 881
;879:  char buffer[32];
;880:
;881:  Com_sprintf(buffer, 32, "serverclosemenus");
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $336
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 882
;882:  trap_SendServerCommand(clientNum, buffer);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 883
;883:}
LABELV $335
endproc G_CloseMenus 32 12
export G_KillStructuresSurvival
proc G_KillStructuresSurvival 20 32
line 887
;884:
;885:void
;886:G_KillStructuresSurvival()
;887:{
line 898
;888:  gentity_t *ent;
;889:  int i;
;890:
;891:  /*if (level.numNodes != 0) {
;892:   if (level.numNodes <= 2)
;893:   return;
;894:
;895:   level.numNodes = 0;
;896:   }*/
;897:
;898:  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $341
JUMPV
LABELV $338
line 899
;899:  {
line 901
;900:
;901:    if (ent->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $343
line 902
;902:      continue;
ADDRGP4 $339
JUMPV
LABELV $343
line 903
;903:    if (ent->health < 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GEI4 $345
line 904
;904:      continue;
ADDRGP4 $339
JUMPV
LABELV $345
line 905
;905:    if (ent->biteam == BIT_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $347
line 906
;906:      continue;
ADDRGP4 $339
JUMPV
LABELV $347
line 908
;907:
;908:    if (ent->s.modelindex == BA_H_SPAWN && ent->biteam == BIT_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $349
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $349
line 909
;909:      continue;
ADDRGP4 $339
JUMPV
LABELV $349
line 911
;910:
;911:    G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 913
;912:
;913:  }
LABELV $339
line 898
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $341
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $338
line 914
;914:}
LABELV $337
endproc G_KillStructuresSurvival 20 32
export G_BuyAll
proc G_BuyAll 28 20
line 918
;915:
;916:void
;917:G_BuyAll(gentity_t *ent)
;918:{
line 921
;919:  int maxAmmo, maxClips;
;920:
;921:  level.survivalmoney += MGCLIP_PRICE;
ADDRLP4 8
ADDRGP4 level+92
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 923
;922:
;923:  BG_AddUpgradeToInventory(UP_LIGHTARMOUR, ent->client->ps.stats);
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 924
;924:  BG_AddUpgradeToInventory(UP_HELMET, ent->client->ps.stats);
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 925
;925:  BG_AddUpgradeToInventory(UP_MEDKIT, ent->client->ps.stats);
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 927
;926:
;927:  BG_AddWeaponToInventory(WP_MACHINEGUN, ent->client->ps.stats);
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 928
;928:  BG_FindAmmoForWeapon(WP_MACHINEGUN, &maxAmmo, &maxClips);
CNSTI4 3
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 930
;929:
;930:  if (500 > ent->client->pers.credit)
CNSTI4 500
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
LEI4 $353
line 931
;931:  {
line 932
;932:    trap_SendServerCommand(
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $355
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 934
;933:      ent - g_entities, "print \"^1Inventory: Rifle, Medkit, Helmet and Light Armour\n\"");
;934:    return;
ADDRGP4 $351
JUMPV
LABELV $353
line 936
;935:  }
;936:  BG_AddWeaponToInventory(WP_HBUILD2, ent->client->ps.stats);
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 937
;937:  BG_AddWeaponToInventory(WP_SHOTGUN, ent->client->ps.stats);
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 938
;938:  BG_FindAmmoForWeapon(WP_SHOTGUN, &maxAmmo, &maxClips);
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 939
;939:  BG_PackAmmoArray(WP_SHOTGUN, &ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);
CNSTI4 4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 941
;940:
;941:  BG_AddWeaponToInventory(WP_LAS_GUN, ent->client->ps.stats);
CNSTI4 9
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 942
;942:  BG_FindAmmoForWeapon(WP_LAS_GUN, &maxAmmo, &maxClips);
CNSTI4 9
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 943
;943:  BG_PackAmmoArray(WP_LAS_GUN, &ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);
CNSTI4 9
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 945
;944:
;945:  BG_AddWeaponToInventory(WP_MASS_DRIVER, ent->client->ps.stats);
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 946
;946:  BG_FindAmmoForWeapon(WP_MASS_DRIVER, &maxAmmo, &maxClips);
CNSTI4 5
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 947
;947:  BG_PackAmmoArray(
CNSTI4 5
ARGI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 950
;948:    WP_MASS_DRIVER, &ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);
;949:
;950:  if (1000 > ent->client->pers.credit)
CNSTI4 1000
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
LEI4 $356
line 951
;951:  {
line 952
;952:    trap_SendServerCommand(
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $358
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 955
;953:      ent - g_entities,
;954:      "print \"^1Inventory: Rifle, Shotgun, Lasgun, MassDriver, Medkit, Helmet and Light Armour\n\"");
;955:    return;
ADDRGP4 $351
JUMPV
LABELV $356
line 958
;956:  }
;957:
;958:  BG_AddWeaponToInventory(WP_CHAINGUN, ent->client->ps.stats);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 959
;959:  BG_FindAmmoForWeapon(WP_CHAINGUN, &maxAmmo, &maxClips);
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 960
;960:  BG_PackAmmoArray(WP_CHAINGUN, &ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);
CNSTI4 6
ARGI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 962
;961:
;962:  if (1500 > ent->client->pers.credit)
CNSTI4 1500
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
LEI4 $359
line 963
;963:  {
line 964
;964:    trap_SendServerCommand(
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $361
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 966
;965:      ent - g_entities, "print \"^1Inventory: Everything Except the Lucifer Cannon\n\"");
;966:    return;
ADDRGP4 $351
JUMPV
LABELV $359
line 970
;967:  }
;968:
;969:  //G_GiveClientMaxAmmo( ent, qtrue );
;970:  G_ForceWeaponChange(ent, WP_SHOTGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
line 971
;971:  trap_SendServerCommand(ent - g_entities, "print \"^1Inventory: Everything\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $362
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 972
;972:}
LABELV $351
endproc G_BuyAll 28 20
export convertGridToWorld
proc convertGridToWorld 0 0
line 976
;973:
;974:int
;975:convertGridToWorld(int gridpos)
;976:{
line 977
;977:  return ((-(BLOCKSIZE / 2) + gridpos) * BLOCKSIZE) + (BLOCKSIZE / 2);
CNSTI4 100
ADDRFP4 0
INDIRI4
MULI4
CNSTI4 -5000
ADDI4
CNSTI4 50
ADDI4
RETI4
LABELV $363
endproc convertGridToWorld 0 0
export convertWorldToGrid
proc convertWorldToGrid 0 0
line 982
;978:}
;979:
;980:int
;981:convertWorldToGrid(float worldpos)
;982:{
line 983
;983:  return ((BLOCKSIZE / 2) + (worldpos / BLOCKSIZE));
ADDRFP4 0
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
RETI4
LABELV $364
endproc convertWorldToGrid 0 0
export Distance2d
proc Distance2d 28 8
line 988
;984:}
;985:
;986:int
;987:Distance2d(vec3_t from, vec3_t to)
;988:{
line 990
;989:  vec3_t shit1, shit2; // If calling using ps.origin param it get modified how gay
;990:  VectorCopy(from,shit1);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 991
;991:  VectorCopy(to,shit2);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 993
;992:  //from[2] = to[2] = 0; QVM BUG: try call this using ->ps.origin ps origin gets modified.
;993:  shit1[2] = shit2[2];
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ASGNF4
line 994
;994:  return Distance(shit1, shit2);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CVFI4 4
RETI4
LABELV $365
endproc Distance2d 28 8
lit
align 4
LABELV $369
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $370
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export canSeeNextNode
code
proc canSeeNextNode 116 28
line 999
;995:}
;996:
;997:qboolean
;998:canSeeNextNode(vec3_t playerpos, vec3_t nodepos, gentity_t *ent)
;999:{
line 1003
;1000:  vec3_t point_a, point_b;
;1001:  trace_t tr;
;1002:  vec3_t playerMins =
;1003:  { -15, -15, -24 };
ADDRLP4 84
ADDRGP4 $369
INDIRB
ASGNB 12
line 1005
;1004:  vec3_t playerMaxs =
;1005:  { 15, 15, 32 };
ADDRLP4 96
ADDRGP4 $370
INDIRB
ASGNB 12
line 1008
;1006:
;1007:  //This is because some weired bug on ps.origin
;1008:  VectorCopy(playerpos,point_a);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1009
;1009:  VectorCopy(nodepos,point_b);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1011
;1010:
;1011:  point_b[2] = point_a[2] = point_a[2] + 10;
ADDRLP4 108
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 108
INDIRF4
ASGNF4
line 1013
;1012:
;1013:  trap_Trace(&tr, point_a, playerMins, playerMaxs, point_b, -1, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1015
;1014:
;1015:  if (tr.fraction < 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $374
line 1016
;1016:  {
line 1017
;1017:    trap_SendServerCommand(-1, va(
ADDRGP4 $377
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1020
;1018:      "print\"CANT SEE: %f %f %f -> %f %f %f\n\"", point_a[0], point_a[1], point_a[2], point_b[0],
;1019:      point_b[1], point_b[2]));
;1020:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $374
line 1023
;1021:  }
;1022:
;1023:  if (tr.contents & CONTENTS_SOLID)
ADDRLP4 24+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $382
line 1024
;1024:  {
line 1025
;1025:    trap_SendServerCommand(-1, va(
ADDRGP4 $385
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1028
;1026:      "print\"CONTENT_SOLID %f %f %f -> %f %f %f\"", point_a[0], point_a[1], point_a[2],
;1027:      point_b[0], point_b[1], point_b[2]));
;1028:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $382
line 1030
;1029:  }
;1030:  return qtrue;
CNSTI4 1
RETI4
LABELV $368
endproc canSeeNextNode 116 28
export canSeeNextNodeSpecialCase
proc canSeeNextNodeSpecialCase 4 12
line 1035
;1031:}
;1032:
;1033:qboolean
;1034:canSeeNextNodeSpecialCase(vec3_t playerpos, vec3_t nodepos, gentity_t *ent)
;1035:{
line 1036
;1036:  if (canSeeNextNode(playerpos, nodepos, ent))
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
ADDRGP4 canSeeNextNode
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $391
line 1037
;1037:  {
line 1038
;1038:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $390
JUMPV
LABELV $391
line 1040
;1039:  }
;1040:  return qfalse;
CNSTI4 0
RETI4
LABELV $390
endproc canSeeNextNodeSpecialCase 4 12
export findNodeCanSee
proc findNodeCanSee 32 12
line 1045
;1041:}
;1042:
;1043:qboolean
;1044:findNodeCanSee(gentity_t * self)
;1045:{
line 1047
;1046:  vec3_t nextnode;
;1047:  int i = GRIDSIZE - 1;
ADDRLP4 0
CNSTI4 119
ASGNI4
line 1048
;1048:  for(i = GRIDSIZE - 1;i >= 0;i--)
ADDRLP4 0
CNSTI4 119
ASGNI4
LABELV $394
line 1049
;1049:  {
line 1050
;1050:    if (level.pathx[i] == -1 || level.pathy[i] == -1)
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+172936
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $402
ADDRLP4 16
INDIRI4
ADDRGP4 level+173416
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $398
LABELV $402
line 1051
;1051:      continue;
ADDRGP4 $395
JUMPV
LABELV $398
line 1053
;1052:    else
;1053:    {
line 1054
;1054:      nextnode[0] = ((-(BLOCKSIZE / 2) + level.pathx[i]) * BLOCKSIZE);
ADDRLP4 4
CNSTI4 100
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+172936
ADDP4
INDIRI4
MULI4
CNSTI4 -5000
ADDI4
CVIF4 4
ASGNF4
line 1055
;1055:      nextnode[1] = ((-(BLOCKSIZE / 2) + level.pathy[i]) * BLOCKSIZE);
ADDRLP4 4+4
CNSTI4 100
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173416
ADDP4
INDIRI4
MULI4
CNSTI4 -5000
ADDI4
CVIF4 4
ASGNF4
line 1056
;1056:      nextnode[2] = self->s.pos.trBase[2];
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 1057
;1057:      if (canSeeNextNode(self->s.pos.trBase, nextnode, self))
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 canSeeNextNode
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $407
line 1058
;1058:      {
line 1059
;1059:        VectorCopy(nextnode, self->nextnode);
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1060
;1060:        self->botnextpath = i + 1;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1061
;1061:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $393
JUMPV
LABELV $407
line 1063
;1062:      }
;1063:    }
line 1064
;1064:  }
LABELV $395
line 1048
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $394
line 1065
;1065:  return qfalse;
CNSTI4 0
RETI4
LABELV $393
endproc findNodeCanSee 32 12
export nodeOutOfRange
proc nodeOutOfRange 24 0
line 1070
;1066:}
;1067:
;1068:qboolean
;1069:nodeOutOfRange(vec3_t node)
;1070:{
line 1072
;1071:  int x, y;
;1072:  x = ((BLOCKSIZE / 2) + (node[0] / BLOCKSIZE));
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 1073
;1073:  y = ((BLOCKSIZE / 2) + (node[1] / BLOCKSIZE));
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 1075
;1074:
;1075:  if (x <= 0 || x >= GRIDSIZE || y <= 0 || y >= GRIDSIZE)
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $414
ADDRLP4 16
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $414
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $414
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $410
LABELV $414
line 1076
;1076:  {
line 1077
;1077:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $410
line 1079
;1078:  }
;1079:  return qfalse;
CNSTI4 0
RETI4
LABELV $409
endproc nodeOutOfRange 24 0
export visitedLastNode
proc visitedLastNode 12 8
line 1084
;1080:}
;1081:
;1082:qboolean
;1083:visitedLastNode(gentity_t *self)
;1084:{
line 1085
;1085:  if (self->botnextpath == 0)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $416
line 1086
;1086:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $415
JUMPV
LABELV $416
line 1088
;1087:
;1088:  if (Distance2d(self->nextnode, self->s.origin) < (BLOCKSIZE))
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Distance2d
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 100
GEI4 $418
line 1089
;1089:  {
line 1090
;1090:    self->botnextpath++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1091
;1091:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $415
JUMPV
LABELV $418
line 1093
;1092:  }
;1093:  return qfalse;
CNSTI4 0
RETI4
LABELV $415
endproc visitedLastNode 12 8
export botReachedDestination
proc botReachedDestination 28 8
line 1097
;1094:}
;1095:qboolean
;1096:botReachedDestination(gentity_t *self)
;1097:{
line 1098
;1098:  if (level.pathx[self->botnextpath + 1] == -1 && level.pathy[self->botnextpath + 1] == -1
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
CNSTI4 -1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+172936+4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $421
ADDRLP4 4
INDIRI4
ADDRGP4 level+173416+4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $421
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Distance2d
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $421
line 1100
;1099:      && Distance2d(self->nextnode, self->s.origin) < (BLOCKSIZE / 5))
;1100:  {
line 1101
;1101:    trap_SendServerCommand(-1, va("print \"Distance to node: %d\n\"", Distance2d(
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2288
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Distance2d
CALLI4
ASGNI4
ADDRGP4 $427
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1103
;1102:      self->s.origin, self->nextnode)));
;1103:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $420
JUMPV
LABELV $421
line 1105
;1104:  }
;1105:  return qfalse;
CNSTI4 0
RETI4
LABELV $420
endproc botReachedDestination 28 8
export pointIsSolid
proc pointIsSolid 72 28
line 1109
;1106:}
;1107:qboolean
;1108:pointIsSolid(vec3_t point)
;1109:{
line 1112
;1110:  trace_t tr;
;1111:  //trap_Trace(&tr, playerpos, NULL, NULL, nodepos, -1, MASK_SHOT);
;1112:  trap_Trace(&tr, point, NULL, NULL, point, -1, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1121
;1113:
;1114:  /*if (tr.fraction < 1.0)
;1115:   return qfalse;
;1116:
;1117:   if (tr.contents & CONTENTS_SOLID) {
;1118:   return qfalse;
;1119:   }*/
;1120:
;1121:  if (tr.fraction < 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $429
line 1122
;1122:  {
line 1123
;1123:    trap_SendServerCommand(-1, va("print \"This point is inside of a wall\n\""));
ADDRGP4 $432
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1124
;1124:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $428
JUMPV
LABELV $429
line 1126
;1125:  }
;1126:  return qfalse;
CNSTI4 0
RETI4
LABELV $428
endproc pointIsSolid 72 28
lit
align 4
LABELV $434
byte 4 3253731328
byte 4 3253731328
byte 4 3250585600
align 4
LABELV $435
byte 4 1106247680
byte 4 1106247680
byte 4 1107296256
export pointBehindWall
code
proc pointBehindWall 96 28
line 1130
;1127:}
;1128:qboolean
;1129:pointBehindWall(gentity_t *ent, vec3_t point)
;1130:{
line 1137
;1131:  trace_t tr;
;1132:  vec3_t playerpos2d;
;1133:
;1134:  //Using double size on X and Y to prevent stuck bots.
;1135:  //Double size works very good :)
;1136:  vec3_t playerMins =
;1137:  { -30, -30, -24 };
ADDRLP4 72
ADDRGP4 $434
INDIRB
ASGNB 12
line 1139
;1138:  vec3_t playerMaxs =
;1139:  { 30, 30, 32 };
ADDRLP4 84
ADDRGP4 $435
INDIRB
ASGNB 12
line 1141
;1140:
;1141:  VectorCopy(ent->client->ps.origin, playerpos2d);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1142
;1142:  point[2] = playerpos2d[2];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 60+8
INDIRF4
ASGNF4
line 1144
;1143:
;1144:  trap_Trace(&tr, playerpos2d, playerMins, playerMaxs, point, ent->s.number, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1146
;1145:
;1146:  if (tr.fraction < 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $437
line 1147
;1147:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $433
JUMPV
LABELV $437
line 1148
;1148:  if (tr.contents & CONTENTS_SOLID)
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $440
line 1149
;1149:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $433
JUMPV
LABELV $440
line 1150
;1150:  return qfalse;
CNSTI4 0
RETI4
LABELV $433
endproc pointBehindWall 96 28
export fillGrid
proc fillGrid 60 8
line 1154
;1151:}
;1152:void
;1153:fillGrid(gentity_t *ent)
;1154:{
line 1158
;1155:  int x, y;
;1156:  vec3_t point;
;1157:
;1158:  if (ent->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 1
GEI4 $444
line 1159
;1159:    return;
ADDRGP4 $443
JUMPV
LABELV $444
line 1160
;1160:  if (ent->client->ps.stats[STAT_HEALTH] <= 0 || ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $448
ADDRLP4 20
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $446
LABELV $448
line 1161
;1161:    return;
ADDRGP4 $443
JUMPV
LABELV $446
line 1163
;1162:
;1163:  x = convertWorldToGrid(ent->s.origin[0]);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 convertWorldToGrid
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1164
;1164:  y = convertWorldToGrid(ent->s.origin[1]);
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 convertWorldToGrid
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 1166
;1165:
;1166:  point[0] = convertGridToWorld(x);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 convertGridToWorld
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
line 1167
;1167:  point[1] = convertGridToWorld(y);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 convertGridToWorld
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 1169
;1168:
;1169:  if (level.grid[x][y])
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $450
line 1170
;1170:    return;
ADDRGP4 $443
JUMPV
LABELV $450
line 1171
;1171:  if (x >= GRIDSIZE || y >= GRIDSIZE || x < 0 || y < 0)
ADDRLP4 44
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $457
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $457
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $457
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $453
LABELV $457
line 1172
;1172:    return;
ADDRGP4 $443
JUMPV
LABELV $453
line 1173
;1173:  if (pointBehindWall(ent, point))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 pointBehindWall
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $458
line 1174
;1174:    return;
ADDRGP4 $443
JUMPV
LABELV $458
line 1176
;1175:
;1176:  level.grid[x][y] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 1177
;1177:}
LABELV $443
endproc fillGrid 60 8
export spawnGridNode
proc spawnGridNode 8 12
line 1180
;1178:void
;1179:spawnGridNode(gentity_t *ent, int x, int y)
;1180:{
line 1183
;1181:  gentity_t *m;
;1182:
;1183:  m = drawRedBall(ent, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 drawRedBall
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1184
;1184:}
LABELV $461
endproc spawnGridNode 8 12
export nextNodeVisible
proc nextNodeVisible 44 12
line 1187
;1185:qboolean
;1186:nextNodeVisible(gentity_t *ent)
;1187:{
line 1189
;1188:  vec3_t realPoint;
;1189:  realPoint[0] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[0]));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 convertWorldToGrid
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 convertGridToWorld
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
CVIF4 4
ASGNF4
line 1190
;1190:  realPoint[1] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[1]));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 convertWorldToGrid
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 convertGridToWorld
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRI4
CVIF4 4
ASGNF4
line 1191
;1191:  realPoint[2] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[2]));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 convertWorldToGrid
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 convertGridToWorld
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
line 1192
;1192:  return canSeeNextNode(realPoint, ent->nextnode, ent);
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 2288
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 canSeeNextNode
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $462
endproc nextNodeVisible 44 12
export syrinxSpawn
proc syrinxSpawn 40 0
line 1197
;1193:}
;1194://SYRINX
;1195:gentity_t *
;1196:syrinxSpawn(gentity_t *ent)
;1197:{
line 1202
;1198:
;1199:  gentity_t *bolt;
;1200:  vec3_t start;
;1201:
;1202:  start[0] = ent->client->ps.origin[0];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1203
;1203:  start[1] = ent->client->ps.origin[1];
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1204
;1204:  start[2] = ent->client->ps.origin[2] + 30;//Over the head.
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1206
;1205:
;1206:  bolt = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1207
;1207:  bolt->classname = "pulse";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $468
ASGNP4
line 1208
;1208:  bolt->nextthink = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1209
;1209:  bolt->think = G_itemThink;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_itemThink
ASGNP4
line 1210
;1210:  bolt->s.eType = ET_MISSILE;
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1211
;1211:  bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1213
;1212:  //        bolt->s.weapon = WP_LUCIFER_CANNON;
;1213:  bolt->s.generic1 = ent->s.generic1; //weaponMode
ADDRLP4 24
CNSTI4 204
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1214
;1214:  bolt->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1215
;1215:  bolt->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1216
;1216:  bolt->damage = PRIFLE_DMG;
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 20
ASGNI4
line 1217
;1217:  bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 1218
;1218:  bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 1221
;1219:  //        bolt->methodOfDeath = MOD_PRIFLE;
;1220:  //        bolt->splashMethodOfDeath = MOD_PRIFLE;
;1221:  bolt->clipmask = MASK_WATER;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 56
ASGNI4
line 1222
;1222:  bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1224
;1223:
;1224:  bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1225
;1225:  bolt->s.pos.trTime = level.time - 50; // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1226
;1226:  VectorCopy(start, bolt->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1227
;1227:  VectorScale(start, 0, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 1229
;1228:
;1229:  SnapVector(bolt->s.pos.trDelta); // save net bandwidth
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1231
;1230:
;1231:  VectorCopy(start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1233
;1232:
;1233:  return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $465
endproc syrinxSpawn 40 0
export AngleBetweenVectors
proc AngleBetweenVectors 40 4
line 1244
;1234:}
;1235:/*
;1236: =================
;1237: AngleBetweenVectors
;1238:
;1239: returns the angle between two vectors normalized to the range [0 <= angle <= 180]
;1240: =================
;1241: */
;1242:float
;1243:AngleBetweenVectors(const vec3_t a, const vec3_t b)
;1244:{
line 1247
;1245:  vec_t alen, blen;
;1246:
;1247:  alen = VectorLength(a);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1248
;1248:  blen = VectorLength(b);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 1250
;1249:
;1250:  if (!alen || !blen)
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
EQF4 $476
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $474
LABELV $476
line 1251
;1251:    return 0;
CNSTF4 0
RETF4
ADDRGP4 $473
JUMPV
LABELV $474
line 1257
;1252:
;1253:  // complete dot product of two vectors a, b is |a| * |b| * cos(angle)
;1254:  // this results in:
;1255:  //
;1256:  // angle = acos( (a * b) / (|a| * |b|) )
;1257:  return RAD2DEG(Q_acos(DotProduct(a, b) / (alen * blen)));
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 36
ADDRGP4 Q_acos
CALLF4
ASGNF4
CNSTF4 1127481344
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
RETF4
LABELV $473
endproc AngleBetweenVectors 40 4
export modString
proc modString 4 0
line 1261
;1258:}
;1259:char *
;1260:modString(int mod)
;1261:{
line 1262
;1262:  switch(mod)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $478
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $478
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $505-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $505
address $480
address $482
address $484
address $486
address $488
address $492
address $500
address $496
address $498
address $490
address $494
address $502
code
line 1263
;1263:  {
LABELV $480
line 1265
;1264:    case MOD_PISTOL:
;1265:      return "Pistol";
ADDRGP4 $481
RETP4
ADDRGP4 $477
JUMPV
line 1266
;1266:      break;
LABELV $482
line 1268
;1267:    case MOD_AXE:
;1268:      return "Axe";
ADDRGP4 $483
RETP4
ADDRGP4 $477
JUMPV
line 1269
;1269:      break;
LABELV $484
line 1271
;1270:	case MOD_MACHINEGUN:
;1271:      return "Machine Gun";
ADDRGP4 $485
RETP4
ADDRGP4 $477
JUMPV
line 1272
;1272:      break;
LABELV $486
line 1274
;1273:    case MOD_SHOTGUN:
;1274:      return "Shotgun";
ADDRGP4 $487
RETP4
ADDRGP4 $477
JUMPV
line 1275
;1275:      break;
LABELV $488
line 1277
;1276:    case MOD_MDRIVER:
;1277:      return "Mass Driver";
ADDRGP4 $489
RETP4
ADDRGP4 $477
JUMPV
line 1278
;1278:      break;
LABELV $490
line 1280
;1279:    case MOD_ROCKET_LAUNCHER:
;1280:      return "Rocket Launcher";
ADDRGP4 $491
RETP4
ADDRGP4 $477
JUMPV
line 1281
;1281:      break;
LABELV $492
line 1283
;1282:    case MOD_CHAINGUN:
;1283:      return "Chaingun";
ADDRGP4 $493
RETP4
ADDRGP4 $477
JUMPV
line 1284
;1284:      break;
LABELV $494
line 1286
;1285:    case MOD_GRENADE:
;1286:      return "Grenade";
ADDRGP4 $495
RETP4
ADDRGP4 $477
JUMPV
line 1287
;1287:      break;
LABELV $496
line 1289
;1288:    case MOD_GRENADE_LAUNCHER:
;1289:      return "Grenade Launcher";
ADDRGP4 $497
RETP4
ADDRGP4 $477
JUMPV
line 1290
;1290:      break;
LABELV $498
line 1292
;1291:    case MOD_GRENADE_LAUNCHER_INCENDIARY:
;1292:      return "Grenade Launcher Incendiary";
ADDRGP4 $499
RETP4
ADDRGP4 $477
JUMPV
line 1293
;1293:      break;
LABELV $500
line 1295
;1294:    case MOD_LASERGUN:
;1295:      return "Laser";
ADDRGP4 $501
RETP4
ADDRGP4 $477
JUMPV
line 1296
;1296:      break;
LABELV $502
line 1298
;1297:    case MOD_MINE:
;1298:      return "Mine";
ADDRGP4 $503
RETP4
ADDRGP4 $477
JUMPV
line 1299
;1299:      break;
LABELV $478
line 1301
;1300:    default:
;1301:      return "?";
ADDRGP4 $504
RETP4
line 1302
;1302:      break;
LABELV $477
endproc modString 4 0
export g_comboClear
proc g_comboClear 8 0
line 1307
;1303:  }
;1304:}
;1305:void
;1306:g_comboClear()
;1307:{
line 1311
;1308:  int i;
;1309:  gentity_t *ent2;
;1310:
;1311:  for(i = level.botslots;i < level.botslots + level.numConnectedClients;i++)
ADDRLP4 4
ADDRGP4 level+190008
INDIRI4
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 1312
;1312:  {
line 1313
;1313:    ent2 = &g_entities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1314
;1314:    if (!ent2)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $515
line 1315
;1315:      continue;
ADDRGP4 $509
JUMPV
LABELV $515
line 1316
;1316:    if (!ent2->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $517
line 1317
;1317:      continue;
ADDRGP4 $509
JUMPV
LABELV $517
line 1318
;1318:    if (ent2->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $519
line 1319
;1319:      continue;
ADDRGP4 $509
JUMPV
LABELV $519
line 1320
;1320:    if (ent2->client->ps.stats[STAT_PTEAM] != PTE_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $521
line 1321
;1321:      continue;
ADDRGP4 $509
JUMPV
LABELV $521
line 1323
;1322:
;1323:    ent2->comboKills = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
line 1324
;1324:    ent2->comboMod = -1;
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 -1
ASGNI4
line 1325
;1325:  }
LABELV $509
line 1311
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 4
INDIRI4
ADDRGP4 level+190008
INDIRI4
ADDRGP4 level+173940
INDIRI4
ADDI4
LTI4 $508
line 1326
;1326:}
LABELV $507
endproc g_comboClear 8 0
export g_comboPrint
proc g_comboPrint 28 20
line 1329
;1327:void
;1328:g_comboPrint()
;1329:{
line 1333
;1330:  int i;
;1331:  gentity_t *ent2;
;1332:
;1333:  for(i = level.botslots;i < level.botslots + level.numConnectedClients;i++)
ADDRLP4 4
ADDRGP4 level+190008
INDIRI4
ASGNI4
ADDRGP4 $527
JUMPV
LABELV $524
line 1334
;1334:  {
line 1335
;1335:    ent2 = &g_entities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1336
;1336:    if (!ent2)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $531
line 1337
;1337:      continue;
ADDRGP4 $525
JUMPV
LABELV $531
line 1338
;1338:    if (!ent2->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $533
line 1339
;1339:      continue;
ADDRGP4 $525
JUMPV
LABELV $533
line 1340
;1340:    if (ent2->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $535
line 1341
;1341:      continue;
ADDRGP4 $525
JUMPV
LABELV $535
line 1342
;1342:    if(ent2->client->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $537
line 1343
;1343:      continue;
ADDRGP4 $525
JUMPV
LABELV $537
line 1345
;1344:
;1345:    if (ent2->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $539
line 1346
;1346:    {
line 1347
;1347:      ent2->comboKills = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
line 1348
;1348:      continue;
ADDRGP4 $525
JUMPV
LABELV $539
line 1352
;1349:    }
;1350:
;1351:
;1352:    if (ent2->comboKills > 1)
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 1
LEI4 $541
line 1353
;1353:    {
line 1354
;1354:      trap_SendServerCommand(-1, va(
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 modString
CALLP4
ASGNP4
ADDRGP4 $543
ARGP4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 10
MODI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1357
;1355:        "print \"[x^%d%d ^7%s] %s\n\"", ent2->comboKills % 10, ent2->comboKills, modString(
;1356:          ent2->comboMod), ent2->client->pers.netname));
;1357:    }
LABELV $541
line 1358
;1358:  }
LABELV $525
line 1333
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $527
ADDRLP4 4
INDIRI4
ADDRGP4 level+190008
INDIRI4
ADDRGP4 level+173940
INDIRI4
ADDI4
LTI4 $524
line 1359
;1359:}
LABELV $523
endproc g_comboPrint 28 20
export G_playerInRange
proc G_playerInRange 4160 16
line 1362
;1360:qboolean
;1361:G_playerInRange(gentity_t *ent, int range, int team)
;1362:{
line 1370
;1363:  gentity_t *enemy;
;1364:  int entityList[MAX_GENTITIES];
;1365:  vec3_t mins, maxs;
;1366:  int i, num;
;1367:  int radius;
;1368:  vec3_t origin;
;1369:
;1370:  VectorCopy(ent->s.origin, origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1372
;1371:
;1372:  radius = range;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1374
;1373:
;1374:  for(i = 0;i < 3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $545
line 1375
;1375:  {
line 1376
;1376:    mins[i] = origin[i] - radius;
ADDRLP4 4148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRLP4 4120
ADDP4
ADDRLP4 4148
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1377
;1377:    maxs[i] = origin[i] + radius;
ADDRLP4 4152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4152
INDIRI4
ADDRLP4 4132
ADDP4
ADDRLP4 4152
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1378
;1378:  }
LABELV $546
line 1374
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $545
line 1380
;1379:
;1380:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4148
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4144
ADDRLP4 4148
INDIRI4
ASGNI4
line 1381
;1381:  for(i = 0;i < num;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $552
JUMPV
LABELV $549
line 1382
;1382:  {
line 1383
;1383:    enemy = &g_entities[entityList[i]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1385
;1384:
;1385:    if (G_Visible(ent, enemy) && enemy->client && enemy->client->ps.stats[STAT_PTEAM] == team)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
EQI4 $553
ADDRLP4 4156
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $553
ADDRLP4 4156
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $553
line 1386
;1386:    {
line 1387
;1387:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $544
JUMPV
LABELV $553
line 1389
;1388:    }
;1389:  }
LABELV $550
line 1381
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $552
ADDRLP4 0
INDIRI4
ADDRLP4 4144
INDIRI4
LTI4 $549
line 1390
;1390:  return qfalse;
CNSTI4 0
RETI4
LABELV $544
endproc G_playerInRange 4160 16
export G_itemInRange
proc G_itemInRange 4156 16
line 1394
;1391:}
;1392:qboolean
;1393:G_itemInRange(gentity_t *ent, int range, int team)
;1394:{
line 1402
;1395:  gentity_t *enemy;
;1396:  int entityList[MAX_GENTITIES];
;1397:  vec3_t mins, maxs;
;1398:  int i, num;
;1399:  int radius;
;1400:  vec3_t origin;
;1401:
;1402:  VectorCopy(ent->s.origin, origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1404
;1403:
;1404:  radius = range;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1406
;1405:
;1406:  for(i = 0;i < 3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $556
line 1407
;1407:  {
line 1408
;1408:    mins[i] = origin[i] - radius;
ADDRLP4 4148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRLP4 4120
ADDP4
ADDRLP4 4148
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1409
;1409:    maxs[i] = origin[i] + radius;
ADDRLP4 4152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4152
INDIRI4
ADDRLP4 4132
ADDP4
ADDRLP4 4152
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1410
;1410:  }
LABELV $557
line 1406
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $556
line 1412
;1411:
;1412:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4148
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4144
ADDRLP4 4148
INDIRI4
ASGNI4
line 1413
;1413:  for(i = 0;i < num;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $563
JUMPV
LABELV $560
line 1414
;1414:  {
line 1415
;1415:    enemy = &g_entities[entityList[i]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1417
;1416:
;1417:    if (G_Visible(ent, enemy) && enemy->s.eType == ET_BUILDABLE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
EQI4 $564
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $564
line 1418
;1418:    {
line 1419
;1419:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $555
JUMPV
LABELV $564
line 1421
;1420:    }
;1421:  }
LABELV $561
line 1413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $563
ADDRLP4 0
INDIRI4
ADDRLP4 4144
INDIRI4
LTI4 $560
line 1422
;1422:  return qfalse;
CNSTI4 0
RETI4
LABELV $555
endproc G_itemInRange 4156 16
export G_doorInRange
proc G_doorInRange 4168 16
line 1426
;1423:}
;1424:qboolean
;1425:G_doorInRange(gentity_t *ent, int range, int team)
;1426:{
line 1434
;1427:  gentity_t *enemy;
;1428:  int entityList[MAX_GENTITIES];
;1429:  vec3_t mins, maxs;
;1430:  int i, num;
;1431:  int radius;
;1432:  vec3_t origin;
;1433:
;1434:  VectorCopy(ent->s.origin, origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1436
;1435:
;1436:  radius = range;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1438
;1437:
;1438:  for(i = 0;i < 3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $567
line 1439
;1439:  {
line 1440
;1440:    mins[i] = origin[i] - radius;
ADDRLP4 4148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRLP4 4120
ADDP4
ADDRLP4 4148
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1441
;1441:    maxs[i] = origin[i] + radius;
ADDRLP4 4152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4152
INDIRI4
ADDRLP4 4132
ADDP4
ADDRLP4 4152
INDIRI4
ADDRLP4 12
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1442
;1442:  }
LABELV $568
line 1438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $567
line 1444
;1443:
;1444:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4120
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4148
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4144
ADDRLP4 4148
INDIRI4
ASGNI4
line 1445
;1445:  for(i = 0;i < num;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $574
JUMPV
LABELV $571
line 1446
;1446:  {
line 1447
;1447:    enemy = &g_entities[entityList[i]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1449
;1448:
;1449:    if (G_Visible(ent, enemy) &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 G_Visible
CALLI4
ASGNI4
ADDRLP4 4156
CNSTI4 0
ASGNI4
ADDRLP4 4152
INDIRI4
ADDRLP4 4156
INDIRI4
EQI4 $575
ADDRLP4 4164
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4164
INDIRI4
CNSTI4 16
EQI4 $578
ADDRLP4 4
INDIRP4
CNSTI4 2268
ADDP4
INDIRI4
ADDRLP4 4156
INDIRI4
NEI4 $578
ADDRLP4 4164
INDIRI4
CNSTI4 5
NEI4 $575
LABELV $578
line 1451
;1450:        (enemy->s.eType == ET_MODELDOOR || enemy->door || enemy->s.eType == ET_MOVER))
;1451:    {
line 1452
;1452:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $575
line 1454
;1453:    }
;1454:  }
LABELV $572
line 1445
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $574
ADDRLP4 0
INDIRI4
ADDRLP4 4144
INDIRI4
LTI4 $571
line 1455
;1455:  return qfalse;
CNSTI4 0
RETI4
LABELV $566
endproc G_doorInRange 4168 16
export G_printVector
proc G_printVector 4 16
line 1458
;1456:}
;1457:void G_printVector(vec3_t vector)
;1458:{
line 1460
;1459:  //Yea im that lazy
;1460:  G_Printf("_%f %f %f_", vector[0], vector[1], vector[2]);
ADDRGP4 $580
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_Printf
CALLV
pop
line 1461
;1461:}
LABELV $579
endproc G_printVector 4 16
export G_isPlayerConnected
proc G_isPlayerConnected 8 0
line 1463
;1462:qboolean G_isPlayerConnected(gentity_t *ent)
;1463:{
line 1464
;1464:	if(!ent || !ent->client)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $584
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $582
LABELV $584
line 1465
;1465:	{
line 1466
;1466:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $582
line 1468
;1467:	}
;1468:	if(ent->client->pers.connected != CON_CONNECTED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $585
line 1469
;1469:	{
line 1470
;1470:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $585
line 1472
;1471:	}
;1472:	return qtrue;
CNSTI4 1
RETI4
LABELV $581
endproc G_isPlayerConnected 8 0
bss
export remappedShaders
align 4
LABELV remappedShaders
skip 16896
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
import botSelectEnemy
import botCanSeeEnemy
import botForgetEnemy
import G_healFriend
import G_BotAimAt
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
import spawnItem
import G_itemUse
import G_itemThink
import selectBetterWay
import drawRedBall
import WallInFront
import trap_mysql_reconnect
import trap_mysql_fetchfieldbyName
import trap_mysql_fetchfieldbyID
import trap_mysql_fetchrow
import trap_mysql_finishquery
import trap_mysql_runquery
import trap_SendGameStat
import trap_SnapVector
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
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
import G_TouchSolids
import G_TouchTriggers
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
lit
align 1
LABELV $580
byte 1 95
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 95
byte 1 0
align 1
LABELV $543
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 120
byte 1 94
byte 1 37
byte 1 100
byte 1 37
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $504
byte 1 63
byte 1 0
align 1
LABELV $503
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $501
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $499
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 99
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $497
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $495
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $493
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $491
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $489
byte 1 77
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $487
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $485
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $483
byte 1 65
byte 1 120
byte 1 101
byte 1 0
align 1
LABELV $481
byte 1 80
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $468
byte 1 112
byte 1 117
byte 1 108
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $432
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $427
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $385
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 34
byte 1 67
byte 1 79
byte 1 78
byte 1 84
byte 1 69
byte 1 78
byte 1 84
byte 1 95
byte 1 83
byte 1 79
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 34
byte 1 0
align 1
LABELV $377
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 34
byte 1 67
byte 1 65
byte 1 78
byte 1 84
byte 1 32
byte 1 83
byte 1 69
byte 1 69
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $362
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $361
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 117
byte 1 99
byte 1 105
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $358
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 82
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 44
byte 1 32
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 44
byte 1 32
byte 1 76
byte 1 97
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 44
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 115
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 44
byte 1 32
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 44
byte 1 32
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $355
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 82
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 44
byte 1 32
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 44
byte 1 32
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $336
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $334
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $292
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
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 117
byte 1 105
byte 1 110
byte 1 116
byte 1 56
byte 1 95
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 40
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $289
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $261
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $242
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $240
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $214
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $187
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $182
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $158
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
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
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $138
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $123
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
