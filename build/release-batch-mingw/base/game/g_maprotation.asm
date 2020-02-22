export G_MapExists
code
proc G_MapExists 8 12
file "..\..\..\..\src/game/g_maprotation.c"
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
;22: */
;23:
;24:// g_maprotation.c -- the map rotation system
;25:
;26:#include "g_local.h"
;27:
;28:mapRotations_t mapRotations;
;29:
;30:/*
;31:===============
;32:G_MapExists
;33:
;34:Check if a map exists
;35:===============
;36: */
;37:qboolean G_MapExists(char *name) {
line 38
;38:  return trap_FS_FOpenFile(va("maps/%s.bsp", name), NULL, FS_READ);
ADDRGP4 $85
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $84
endproc G_MapExists 8 12
proc G_RotationExists 8 12
line 48
;39:}
;40:
;41:/*
;42:===============
;43:G_RotationExists
;44:
;45:Check if a rotation exists
;46:===============
;47: */
;48:static qboolean G_RotationExists(char *name) {
line 51
;49:  int i;
;50:
;51:  for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 52
;52:    if (Q_strncmp(mapRotations.rotations[ i ].name, name, MAX_QPATH) == 0)
CNSTI4 1091144
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $92
line 53
;53:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $86
JUMPV
LABELV $92
line 54
;54:  }
LABELV $88
line 51
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 0
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $87
line 56
;55:
;56:  return qfalse;
CNSTI4 0
RETI4
LABELV $86
endproc G_RotationExists 8 12
proc G_ParseMapCommandSection 44 12
line 66
;57:}
;58:
;59:/*
;60:===============
;61:G_ParseCommandSection
;62:
;63:Parse a map rotation command section
;64:===============
;65: */
;66:static qboolean G_ParseMapCommandSection(mapRotationEntry_t *mre, char **text_p) {
ADDRGP4 $96
JUMPV
LABELV $95
line 70
;67:  char *token;
;68:
;69:  // read optional parameters
;70:  while (1) {
line 71
;71:    token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 73
;72:
;73:    if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $98
line 74
;74:      break;
ADDRGP4 $97
JUMPV
LABELV $98
line 76
;75:
;76:    if (!Q_stricmp(token, ""))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $100
line 77
;77:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $94
JUMPV
LABELV $100
line 79
;78:
;79:    if (!Q_stricmp(token, "}"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $103
line 80
;80:      return qtrue; //reached the end of this command section
CNSTI4 1
RETI4
ADDRGP4 $94
JUMPV
LABELV $103
line 82
;81:
;82:    if (!Q_stricmp(token, "layouts")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $106
line 83
;83:      token = COM_ParseExt(text_p, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 84
;84:      mre->layouts[ 0 ] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 16448
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $110
JUMPV
LABELV $109
line 85
;85:      while (token && token[ 0 ] != 0) {
line 86
;86:        Q_strcat(mre->layouts, sizeof ( mre->layouts), token);
ADDRFP4 0
INDIRP4
CNSTI4 16448
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 87
;87:        Q_strcat(mre->layouts, sizeof ( mre->layouts), " ");
ADDRFP4 0
INDIRP4
CNSTI4 16448
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 88
;88:        token = COM_ParseExt(text_p, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 89
;89:      }
LABELV $110
line 85
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $109
LABELV $113
line 90
;90:      continue;
ADDRGP4 $96
JUMPV
LABELV $106
line 93
;91:    }
;92:
;93:    Q_strncpyz(mre->postCmds[ mre->numCmds ], token, sizeof ( mre->postCmds[ 0 ]));
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 16704
ADDP4
INDIRI4
CNSTI4 10
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 94
;94:    Q_strcat(mre->postCmds[ mre->numCmds ], sizeof ( mre->postCmds[ 0 ]), " ");
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16704
ADDP4
INDIRI4
CNSTI4 10
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 96
;95:
;96:    token = COM_ParseExt(text_p, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRGP4 $115
JUMPV
LABELV $114
line 98
;97:
;98:    while (token && token[ 0 ] != 0) {
line 99
;99:      Q_strcat(mre->postCmds[ mre->numCmds ], sizeof ( mre->postCmds[ 0 ]), token);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 16704
ADDP4
INDIRI4
CNSTI4 10
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 100
;100:      Q_strcat(mre->postCmds[ mre->numCmds ], sizeof ( mre->postCmds[ 0 ]), " ");
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 16704
ADDP4
INDIRI4
CNSTI4 10
LSHI4
ADDRLP4 36
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 101
;101:      token = COM_ParseExt(text_p, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 102
;102:    }
LABELV $115
line 98
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $117
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $114
LABELV $117
line 104
;103:
;104:    if (mre->numCmds == MAX_MAP_COMMANDS) {
ADDRFP4 0
INDIRP4
CNSTI4 16704
ADDP4
INDIRI4
CNSTI4 16
NEI4 $118
line 105
;105:      G_Printf(S_COLOR_RED "ERROR: maximum number of map commands (%d) reached\n",
ADDRGP4 $120
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 107
;106:              MAX_MAP_COMMANDS);
;107:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $94
JUMPV
LABELV $118
line 109
;108:    } else
;109:      mre->numCmds++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 16704
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 110
;110:  }
LABELV $96
line 70
ADDRGP4 $95
JUMPV
LABELV $97
line 112
;111:
;112:  return qfalse;
CNSTI4 0
RETI4
LABELV $94
endproc G_ParseMapCommandSection 44 12
proc G_ParseMapRotation 72 12
line 122
;113:}
;114:
;115:/*
;116:===============
;117:G_ParseMapRotation
;118:
;119:Parse a map rotation section
;120:===============
;121: */
;122:static qboolean G_ParseMapRotation(mapRotation_t *mr, char **text_p) {
line 124
;123:  char *token;
;124:  qboolean mnSet = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 125
;125:  mapRotationEntry_t *mre = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $123
JUMPV
LABELV $122
line 129
;126:  mapRotationCondition_t *mrc;
;127:
;128:  // read optional parameters
;129:  while (1) {
line 130
;130:    token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 132
;131:
;132:    if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 133
;133:      break;
ADDRGP4 $124
JUMPV
LABELV $125
line 135
;134:
;135:    if (!Q_stricmp(token, ""))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $127
line 136
;136:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $127
line 138
;137:
;138:    if (!Q_stricmp(token, "{")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $129
line 139
;139:      if (!mnSet) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $132
line 140
;140:        G_Printf(S_COLOR_RED "ERROR: map settings section with no name\n");
ADDRGP4 $134
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 141
;141:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $132
line 144
;142:      }
;143:
;144:      if (!G_ParseMapCommandSection(mre, text_p)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_ParseMapCommandSection
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $135
line 145
;145:        G_Printf(S_COLOR_RED "ERROR: failed to parse map command section\n");
ADDRGP4 $137
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 146
;146:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $135
line 149
;147:      }
;148:
;149:      mnSet = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 150
;150:      continue;
ADDRGP4 $123
JUMPV
LABELV $129
line 151
;151:    } else if (!Q_stricmp(token, "goto")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $138
line 152
;152:      token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 154
;153:
;154:      if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $141
line 155
;155:        break;
ADDRGP4 $124
JUMPV
LABELV $141
line 157
;156:
;157:      mrc = &mre->conditions[ mre->numConditions ];
ADDRLP4 12
CNSTI4 84
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 16708
ADDP4
ADDP4
ASGNP4
line 158
;158:      mrc->unconditional = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 1
ASGNI4
line 159
;159:      Q_strncpyz(mrc->dest, token, sizeof ( mrc->dest));
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 161
;160:
;161:      if (mre->numConditions == MAX_MAP_ROTATION_CONDS) {
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
INDIRI4
CNSTI4 4
NEI4 $143
line 162
;162:        G_Printf(S_COLOR_RED "ERROR: maximum number of conditions for one map (%d) reached\n",
ADDRGP4 $145
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 164
;163:                MAX_MAP_ROTATION_CONDS);
;164:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $143
line 166
;165:      } else
;166:        mre->numConditions++;
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 168
;167:
;168:      continue;
ADDRGP4 $123
JUMPV
LABELV $138
line 169
;169:    } else if (!Q_stricmp(token, "if")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $146
line 170
;170:      token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 172
;171:
;172:      if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
line 173
;173:        break;
ADDRGP4 $124
JUMPV
LABELV $149
line 175
;174:
;175:      mrc = &mre->conditions[ mre->numConditions ];
ADDRLP4 12
CNSTI4 84
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 16708
ADDP4
ADDP4
ASGNP4
line 177
;176:
;177:      if (!Q_stricmp(token, "numClients")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $151
line 178
;178:        mrc->lhs = MCV_NUMCLIENTS;
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 2
ASGNI4
line 180
;179:
;180:        token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 182
;181:
;182:        if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $154
line 183
;183:          break;
ADDRGP4 $124
JUMPV
LABELV $154
line 185
;184:
;185:        if (!Q_stricmp(token, "<"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $156
line 186
;186:          mrc->op = MCO_LT;
ADDRLP4 12
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 187
;187:        else if (!Q_stricmp(token, ">"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $159
line 188
;188:          mrc->op = MCO_GT;
ADDRLP4 12
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $160
JUMPV
LABELV $159
line 189
;189:        else if (!Q_stricmp(token, "="))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $162
line 190
;190:          mrc->op = MCO_EQ;
ADDRLP4 12
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $163
JUMPV
LABELV $162
line 191
;191:        else {
line 192
;192:          G_Printf(S_COLOR_RED "ERROR: invalid operator in expression: %s\n", token);
ADDRGP4 $165
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 193
;193:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $163
LABELV $160
LABELV $157
line 196
;194:        }
;195:
;196:        token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 198
;197:
;198:        if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 199
;199:          break;
ADDRGP4 $124
JUMPV
LABELV $166
line 201
;200:
;201:        mrc->numClients = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 202
;202:      } else if (!Q_stricmp(token, "lastWin")) {
ADDRGP4 $152
JUMPV
LABELV $151
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $168
line 203
;203:        mrc->lhs = MCV_LASTWIN;
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 3
ASGNI4
line 205
;204:
;205:        token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 207
;206:
;207:        if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
line 208
;208:          break;
ADDRGP4 $124
JUMPV
LABELV $171
line 210
;209:
;210:        if (!Q_stricmp(token, "aliens"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $173
line 211
;211:          mrc->lastWin = PTE_ALIENS;
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $173
line 212
;212:        else if (!Q_stricmp(token, "humans"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $176
line 213
;213:          mrc->lastWin = PTE_HUMANS;
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $176
line 214
;214:        else {
line 215
;215:          G_Printf(S_COLOR_RED "ERROR: invalid right hand side in expression: %s\n", token);
ADDRGP4 $179
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 216
;216:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
line 218
;217:        }
;218:      } else if (!Q_stricmp(token, "random"))
LABELV $168
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $180
line 219
;219:        mrc->lhs = MCV_RANDOM;
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $181
JUMPV
LABELV $180
line 220
;220:      else {
line 221
;221:        G_Printf(S_COLOR_RED "ERROR: invalid left hand side in expression: %s\n", token);
ADDRGP4 $183
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 222
;222:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $181
LABELV $169
LABELV $152
line 225
;223:      }
;224:
;225:      token = COM_Parse(text_p);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 227
;226:
;227:      if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $184
line 228
;228:        break;
ADDRGP4 $124
JUMPV
LABELV $184
line 230
;229:
;230:      mrc->unconditional = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 231
;231:      Q_strncpyz(mrc->dest, token, sizeof ( mrc->dest));
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 233
;232:
;233:      if (mre->numConditions == MAX_MAP_ROTATION_CONDS) {
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
INDIRI4
CNSTI4 4
NEI4 $186
line 234
;234:        G_Printf(S_COLOR_RED "ERROR: maximum number of conditions for one map (%d) reached\n",
ADDRGP4 $145
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 236
;235:                MAX_MAP_ROTATION_CONDS);
;236:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $186
line 238
;237:      } else
;238:        mre->numConditions++;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 17044
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 240
;239:
;240:      continue;
ADDRGP4 $123
JUMPV
LABELV $146
line 241
;241:    } else if (!Q_stricmp(token, "}"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $188
line 242
;242:      return qtrue; //reached the end of this map rotation
CNSTI4 1
RETI4
ADDRGP4 $121
JUMPV
LABELV $188
line 244
;243:
;244:    mre = &mr->maps[ mr->numMaps ];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 17048
ADDRLP4 40
INDIRP4
CNSTI4 1091136
ADDP4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ASGNP4
line 246
;245:
;246:    if (mr->numMaps == MAX_MAP_ROTATION_MAPS) {
ADDRFP4 0
INDIRP4
CNSTI4 1091136
ADDP4
INDIRI4
CNSTI4 64
NEI4 $190
line 247
;247:      G_Printf(S_COLOR_RED "ERROR: maximum number of maps in one rotation (%d) reached\n",
ADDRGP4 $192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 249
;248:              MAX_MAP_ROTATION_MAPS);
;249:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $190
line 251
;250:    } else
;251:      mr->numMaps++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1091136
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 253
;252:
;253:    Q_strncpyz(mre->name, token, sizeof ( mre->name));
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 254
;254:    mnSet = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 255
;255:  }
LABELV $123
line 129
ADDRGP4 $122
JUMPV
LABELV $124
line 257
;256:
;257:  return qfalse;
CNSTI4 0
RETI4
LABELV $121
endproc G_ParseMapRotation 72 12
proc G_ParseMapRotationFile 20124 12
line 267
;258:}
;259:
;260:/*
;261:===============
;262:G_ParseMapRotationFile
;263:
;264:Load the map rotations from a map rotation file
;265:===============
;266: */
;267:static qboolean G_ParseMapRotationFile(const char *fileName) {
line 274
;268:  char *text_p;
;269:  int i, j, k;
;270:  int len;
;271:  char *token;
;272:  char text[ 20000 ];
;273:  char mrName[ MAX_QPATH ];
;274:  qboolean mrNameSet = qfalse;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 278
;275:  fileHandle_t f;
;276:
;277:  // load the file
;278:  len = trap_FS_FOpenFile(fileName, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20092
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20096
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 20096
INDIRI4
ASGNI4
line 279
;279:  if (len < 0)
ADDRLP4 88
INDIRI4
CNSTI4 0
GEI4 $194
line 280
;280:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $194
line 282
;281:
;282:  if (len == 0 || len >= sizeof ( text) - 1) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $198
ADDRLP4 88
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $196
LABELV $198
line 283
;283:    trap_FS_FCloseFile(f);
ADDRLP4 20092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 284
;284:    G_Printf(S_COLOR_RED "ERROR: map rotation file %s is %s\n", fileName,
ADDRGP4 $199
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $203
ADDRLP4 20104
ADDRGP4 $200
ASGNP4
ADDRGP4 $204
JUMPV
LABELV $203
ADDRLP4 20104
ADDRGP4 $201
ASGNP4
LABELV $204
ADDRLP4 20104
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 286
;285:            len == 0 ? "empty" : "too long");
;286:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $196
line 289
;287:  }
;288:
;289:  trap_FS_Read(text, len, f);
ADDRLP4 92
ARGP4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 20092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 290
;290:  text[ len ] = 0;
ADDRLP4 88
INDIRI4
ADDRLP4 92
ADDP4
CNSTI1 0
ASGNI1
line 291
;291:  trap_FS_FCloseFile(f);
ADDRLP4 20092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 294
;292:
;293:  // parse the text
;294:  text_p = text;
ADDRLP4 84
ADDRLP4 92
ASGNP4
ADDRGP4 $206
JUMPV
LABELV $205
line 297
;295:
;296:  // read optional parameters
;297:  while (1) {
line 298
;298:    token = COM_Parse(&text_p);
ADDRLP4 84
ARGP4
ADDRLP4 20104
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 20104
INDIRP4
ASGNP4
line 300
;299:
;300:    if (!token)
ADDRLP4 76
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $208
line 301
;301:      break;
ADDRGP4 $207
JUMPV
LABELV $208
line 303
;302:
;303:    if (!Q_stricmp(token, ""))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 20108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20108
INDIRI4
CNSTI4 0
NEI4 $210
line 304
;304:      break;
ADDRGP4 $207
JUMPV
LABELV $210
line 306
;305:
;306:    if (!Q_stricmp(token, "{")) {
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20112
INDIRI4
CNSTI4 0
NEI4 $212
line 307
;307:      if (mrNameSet) {
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $214
line 309
;308:        //check for name space clashes
;309:        for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $216
line 310
;310:          if (!Q_stricmp(mapRotations.rotations[ i ].name, mrName)) {
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 20116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20116
INDIRI4
CNSTI4 0
NEI4 $221
line 311
;311:            G_Printf(S_COLOR_RED "ERROR: a map rotation is already named %s\n", mrName);
ADDRGP4 $223
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 312
;312:            return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $221
line 314
;313:          }
;314:        }
LABELV $217
line 309
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $219
ADDRLP4 8
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $216
line 316
;315:
;316:        Q_strncpyz(mapRotations.rotations[ mapRotations.numRotations ].name, mrName, MAX_QPATH);
CNSTI4 1091144
ADDRGP4 mapRotations+17458304
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 318
;317:
;318:        if (!G_ParseMapRotation(&mapRotations.rotations[ mapRotations.numRotations ], &text_p)) {
CNSTI4 1091144
ADDRGP4 mapRotations+17458304
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 20116
ADDRGP4 G_ParseMapRotation
CALLI4
ASGNI4
ADDRLP4 20116
INDIRI4
CNSTI4 0
NEI4 $225
line 319
;319:          G_Printf(S_COLOR_RED "ERROR: %s: failed to parse map rotation %s\n", fileName, mrName);
ADDRGP4 $228
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 320
;320:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $225
line 324
;321:        }
;322:
;323:        //start parsing map rotations again
;324:        mrNameSet = qfalse;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 326
;325:
;326:        if (mapRotations.numRotations == MAX_MAP_ROTATIONS) {
ADDRGP4 mapRotations+17458304
INDIRI4
CNSTI4 16
NEI4 $229
line 327
;327:          G_Printf(S_COLOR_RED "ERROR: maximum number of map rotations (%d) reached\n",
ADDRGP4 $232
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 329
;328:                  MAX_MAP_ROTATIONS);
;329:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $229
line 331
;330:        } else
;331:          mapRotations.numRotations++;
ADDRLP4 20120
ADDRGP4 mapRotations+17458304
ASGNP4
ADDRLP4 20120
INDIRP4
ADDRLP4 20120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;332:
;333:        continue;
ADDRGP4 $206
JUMPV
LABELV $214
line 334
;334:      } else {
line 335
;335:        G_Printf(S_COLOR_RED "ERROR: unamed map rotation\n");
ADDRGP4 $234
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 336
;336:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $212
line 340
;337:      }
;338:    }
;339:
;340:    if (!mrNameSet) {
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $235
line 341
;341:      Q_strncpyz(mrName, token, sizeof ( mrName));
ADDRLP4 12
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 342
;342:      mrNameSet = qtrue;
ADDRLP4 80
CNSTI4 1
ASGNI4
line 343
;343:    } else {
ADDRGP4 $236
JUMPV
LABELV $235
line 344
;344:      G_Printf(S_COLOR_RED "ERROR: map rotation already named\n");
ADDRGP4 $237
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 345
;345:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $236
line 347
;346:    }
;347:  }
LABELV $206
line 297
ADDRGP4 $205
JUMPV
LABELV $207
line 349
;348:
;349:  for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $238
line 350
;350:    for (j = 0; j < mapRotations.rotations[ i ].numMaps; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $246
JUMPV
LABELV $243
line 351
;351:      if (!G_MapExists(mapRotations.rotations[ i ].maps[ j ].name)) {
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRLP4 20104
ADDRGP4 G_MapExists
CALLI4
ASGNI4
ADDRLP4 20104
INDIRI4
CNSTI4 0
NEI4 $248
line 352
;352:        G_Printf(S_COLOR_RED "ERROR: map \"%s\" doesn't exist\n",
ADDRGP4 $251
ARGP4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 354
;353:                mapRotations.rotations[ i ].maps[ j ].name);
;354:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $248
line 357
;355:      }
;356:
;357:      for (k = 0; k < mapRotations.rotations[ i ].maps[ j ].numConditions; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $256
JUMPV
LABELV $253
line 358
;358:        if (!G_MapExists(mapRotations.rotations[ i ].maps[ j ].conditions[ k ].dest) &&
CNSTI4 84
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16708
ADDP4
ADDP4
ARGP4
ADDRLP4 20108
ADDRGP4 G_MapExists
CALLI4
ASGNI4
ADDRLP4 20108
INDIRI4
CNSTI4 0
NEI4 $258
CNSTI4 84
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16708
ADDP4
ADDP4
ARGP4
ADDRLP4 20112
ADDRGP4 G_RotationExists
CALLI4
ASGNI4
ADDRLP4 20112
INDIRI4
CNSTI4 0
NEI4 $258
line 359
;359:                !G_RotationExists(mapRotations.rotations[ i ].maps[ j ].conditions[ k ].dest)) {
line 360
;360:          G_Printf(S_COLOR_RED "ERROR: conditional destination \"%s\" doesn't exist\n",
ADDRGP4 $262
ARGP4
CNSTI4 84
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16708
ADDP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 362
;361:                  mapRotations.rotations[ i ].maps[ j ].conditions[ k ].dest);
;362:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $193
JUMPV
LABELV $258
line 365
;363:        }
;364:
;365:      }
LABELV $254
line 357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $256
ADDRLP4 0
INDIRI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 17044
ADDP4
INDIRI4
LTI4 $253
line 367
;366:
;367:    }
LABELV $244
line 350
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $246
ADDRLP4 4
INDIRI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+1091136
ADDP4
INDIRI4
LTI4 $243
line 368
;368:  }
LABELV $239
line 349
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $241
ADDRLP4 8
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $238
line 370
;369:
;370:  return qtrue;
CNSTI4 1
RETI4
LABELV $193
endproc G_ParseMapRotationFile 20124 12
export G_PrintRotations
proc G_PrintRotations 12 8
line 380
;371:}
;372:
;373:/*
;374:===============
;375:G_PrintRotations
;376:
;377:Print the parsed map rotations
;378:===============
;379: */
;380:void G_PrintRotations(void) {
line 383
;381:  int i, j, k;
;382:
;383:  G_Printf("Map rotations as parsed:\n\n");
ADDRGP4 $265
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 385
;384:
;385:  for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $266
line 386
;386:    G_Printf("rotation: %s\n{\n", mapRotations.rotations[ i ].name);
ADDRGP4 $271
ARGP4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 388
;387:
;388:    for (j = 0; j < mapRotations.rotations[ i ].numMaps; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $275
JUMPV
LABELV $272
line 389
;389:      G_Printf("  map: %s\n  {\n", mapRotations.rotations[ i ].maps[ j ].name);
ADDRGP4 $277
ARGP4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 391
;390:
;391:      for (k = 0; k < mapRotations.rotations[ i ].maps[ j ].numCmds; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $279
line 392
;392:        G_Printf("    command: %s\n",
ADDRGP4 $284
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 394
;393:                mapRotations.rotations[ i ].maps[ j ].postCmds[ k ]);
;394:      }
LABELV $280
line 391
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $282
ADDRLP4 0
INDIRI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16704
ADDP4
INDIRI4
LTI4 $279
line 396
;395:
;396:      G_Printf("  }\n");
ADDRGP4 $286
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 398
;397:
;398:      for (k = 0; k < mapRotations.rotations[ i ].maps[ j ].numConditions; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $290
JUMPV
LABELV $287
line 399
;399:        G_Printf("  conditional: %s\n",
ADDRGP4 $292
ARGP4
CNSTI4 84
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16708
ADDP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 401
;400:                mapRotations.rotations[ i ].maps[ j ].conditions[ k ].dest);
;401:      }
LABELV $288
line 398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $290
ADDRLP4 0
INDIRI4
CNSTI4 17048
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 17044
ADDP4
INDIRI4
LTI4 $287
line 403
;402:
;403:    }
LABELV $273
line 388
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $275
ADDRLP4 4
INDIRI4
CNSTI4 1091144
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 mapRotations+1091136
ADDP4
INDIRI4
LTI4 $272
line 405
;404:
;405:    G_Printf("}\n");
ADDRGP4 $294
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 406
;406:  }
LABELV $267
line 385
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $269
ADDRLP4 8
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $266
line 408
;407:
;408:  G_Printf("Total memory used: %d bytes\n", sizeof ( mapRotations));
ADDRGP4 $295
ARGP4
CNSTU4 17458308
ARGU4
ADDRGP4 G_Printf
CALLV
pop
line 409
;409:}
LABELV $264
endproc G_PrintRotations 12 8
bss
align 4
LABELV $297
skip 64
code
proc G_GetCurrentMapArray 60 12
line 418
;410:
;411:/*
;412:===============
;413:G_GetCurrentMapArray
;414:
;415:Fill a static array with the current map of each rotation
;416:===============
;417: */
;418:static int *G_GetCurrentMapArray(void) {
line 420
;419:  static int currentMap[ MAX_MAP_ROTATIONS ];
;420:  int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 424
;421:  char text[ MAX_MAP_ROTATIONS * 2 ];
;422:  char *text_p, *token;
;423:
;424:  Q_strncpyz(text, g_currentMap.string, sizeof ( text));
ADDRLP4 12
ARGP4
ADDRGP4 g_currentMap+16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 426
;425:
;426:  text_p = text;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $300
JUMPV
LABELV $299
line 428
;427:
;428:  while (1) {
line 429
;429:    token = COM_Parse(&text_p);
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 431
;430:
;431:    if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $302
line 432
;432:      break;
ADDRGP4 $301
JUMPV
LABELV $302
line 434
;433:
;434:    if (!Q_stricmp(token, ""))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $304
line 435
;435:      break;
ADDRGP4 $301
JUMPV
LABELV $304
line 437
;436:
;437:    currentMap[ i++ ] = atoi(token);
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $297
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 438
;438:  }
LABELV $300
line 428
ADDRGP4 $299
JUMPV
LABELV $301
line 440
;439:
;440:  return currentMap;
ADDRGP4 $297
RETP4
LABELV $296
endproc G_GetCurrentMapArray 60 12
lit
align 1
LABELV $307
byte 1 0
skip 31
code
proc G_SetCurrentMap 48 12
line 450
;441:}
;442:
;443:/*
;444:===============
;445:G_SetCurrentMap
;446:
;447:Set the current map in some rotation
;448:===============
;449: */
;450:static void G_SetCurrentMap(int currentMap, int rotation) {
line 451
;451:  char text[ MAX_MAP_ROTATIONS * 2 ] = {0};
ADDRLP4 4
ADDRGP4 $307
INDIRB
ASGNB 32
line 452
;452:  int *p = G_GetCurrentMapArray();
ADDRLP4 40
ADDRGP4 G_GetCurrentMapArray
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 40
INDIRP4
ASGNP4
line 455
;453:  int i;
;454:
;455:  p[ rotation ] = currentMap;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 457
;456:
;457:  for (i = 0; i < mapRotations.numRotations; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $308
line 458
;458:    Q_strcat(text, sizeof ( text), va("%d ", p[ i ]));
ADDRGP4 $313
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $309
line 457
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $311
ADDRLP4 0
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $308
line 460
;459:
;460:  trap_Cvar_Set("g_currentMap", text);
ADDRGP4 $314
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 461
;461:  trap_Cvar_Update(&g_currentMap);
ADDRGP4 g_currentMap
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 462
;462:}
LABELV $306
endproc G_SetCurrentMap 48 12
export G_GetCurrentMap
proc G_GetCurrentMap 8 0
line 471
;463:
;464:/*
;465:===============
;466:G_GetCurrentMap
;467:
;468:Return the current map in some rotation
;469:===============
;470: */
;471:int G_GetCurrentMap(int rotation) {
line 472
;472:  int *p = G_GetCurrentMapArray();
ADDRLP4 4
ADDRGP4 G_GetCurrentMapArray
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 474
;473:
;474:  return p[ rotation ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
RETI4
LABELV $315
endproc G_GetCurrentMap 8 0
proc G_IssueMapChange 1044 12
line 484
;475:}
;476:
;477:/*
;478:===============
;479:G_IssueMapChange
;480:
;481:Send commands to the server to actually change the map
;482:===============
;483: */
;484:static void G_IssueMapChange(int rotation) {
line 486
;485:  int i;
;486:  int map = G_GetCurrentMap(rotation);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 G_GetCurrentMap
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 490
;487:  char cmd[ MAX_TOKEN_CHARS ];
;488:
;489:  // allow a manually defined g_layouts setting to override the maprotation
;490:  if (!g_layouts.string[ 0 ] &&
ADDRLP4 1036
CNSTI4 0
ASGNI4
ADDRGP4 g_layouts+16
INDIRI1
CVII4 1
ADDRLP4 1036
INDIRI4
NEI4 $317
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16448
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1036
INDIRI4
EQI4 $317
line 491
;491:          mapRotations.rotations[ rotation ].maps[ map ].layouts[ 0 ]) {
line 492
;492:    trap_Cvar_Set("g_layouts",
ADDRGP4 $321
ARGP4
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16448
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 494
;493:            mapRotations.rotations[ rotation ].maps[ map ].layouts);
;494:  }
LABELV $317
line 496
;495:
;496:  trap_SendConsoleCommand(EXEC_APPEND, va("map %s\n",
ADDRGP4 $323
ARGP4
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 500
;497:          mapRotations.rotations[ rotation ].maps[ map ].name));
;498:
;499:  // load up map defaults if g_mapConfigs is set
;500:  G_MapConfigs(mapRotations.rotations[ rotation ].maps[ map ].name);
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRGP4 G_MapConfigs
CALLV
pop
line 502
;501:
;502:  for (i = 0; i < mapRotations.rotations[ rotation ].maps[ map ].numCmds; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $326
line 503
;503:    Q_strncpyz(cmd, mapRotations.rotations[ rotation ].maps[ map ].postCmds[ i ],
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 10
LSHI4
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 64
ADDP4
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 505
;504:            sizeof ( cmd));
;505:    Q_strcat(cmd, sizeof ( cmd), "\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $332
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 506
;506:    trap_SendConsoleCommand(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 507
;507:  }
LABELV $327
line 502
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $329
ADDRLP4 1024
INDIRI4
CNSTI4 17048
ADDRLP4 1028
INDIRI4
MULI4
CNSTI4 1091144
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
CNSTI4 16704
ADDP4
INDIRI4
LTI4 $326
line 508
;508:}
LABELV $316
endproc G_IssueMapChange 1044 12
proc G_ResolveConditionDestination 8 8
line 517
;509:
;510:/*
;511:===============
;512:G_ResolveConditionDestination
;513:
;514:Resolve the destination of some condition
;515:===============
;516: */
;517:static mapConditionType_t G_ResolveConditionDestination(int *n, char *name) {
line 521
;518:  int i;
;519:
;520:  //search the current rotation first...
;521:  for (i = 0; i < mapRotations.rotations[ g_currentMapRotation.integer ].numMaps; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 522
;522:    if (!Q_stricmp(mapRotations.rotations[ g_currentMapRotation.integer ].maps[ i ].name, name)) {
CNSTI4 17048
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 1091144
ADDRGP4 g_currentMapRotation+12
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $340
line 523
;523:      *n = i;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 524
;524:      return MCT_MAP;
CNSTI4 1
RETI4
ADDRGP4 $333
JUMPV
LABELV $340
line 526
;525:    }
;526:  }
LABELV $335
line 521
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
CNSTI4 1091144
ADDRGP4 g_currentMapRotation+12
INDIRI4
MULI4
ADDRGP4 mapRotations+1091136
ADDP4
INDIRI4
LTI4 $334
line 529
;527:
;528:  //...then search the rotation names
;529:  for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $344
line 530
;530:    if (!Q_stricmp(mapRotations.rotations[ i ].name, name)) {
CNSTI4 1091144
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $349
line 531
;531:      *n = i;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 532
;532:      return MCT_ROTATION;
CNSTI4 2
RETI4
ADDRGP4 $333
JUMPV
LABELV $349
line 534
;533:    }
;534:  }
LABELV $345
line 529
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $347
ADDRLP4 0
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $344
line 536
;535:
;536:  return MCT_ERR;
CNSTI4 0
RETI4
LABELV $333
endproc G_ResolveConditionDestination 8 8
proc G_EvaluateMapCondition 32 4
line 546
;537:}
;538:
;539:/*
;540:===============
;541:G_EvaluateMapCondition
;542:
;543:Evaluate a map condition
;544:===============
;545: */
;546:static qboolean G_EvaluateMapCondition(mapRotationCondition_t *mrc) {
line 547
;547:  switch (mrc->lhs) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $352
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $382
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $382
address $380
address $355
address $356
address $375
code
LABELV $355
line 549
;548:    case MCV_RANDOM:
;549:      return rand() & 1;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
RETI4
ADDRGP4 $351
JUMPV
line 550
;550:      break;
LABELV $356
line 553
;551:
;552:    case MCV_NUMCLIENTS:
;553:      switch (mrc->op) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $360
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $370
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $365
ADDRGP4 $353
JUMPV
LABELV $360
line 555
;554:        case MCO_LT:
;555:          return level.numConnectedClients < mrc->numClients;
ADDRGP4 level+173940
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
GEI4 $363
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $363
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $364
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $351
JUMPV
line 556
;556:          break;
LABELV $365
line 559
;557:
;558:        case MCO_GT:
;559:          return level.numConnectedClients > mrc->numClients;
ADDRGP4 level+173940
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
LEI4 $368
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $368
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $369
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $351
JUMPV
line 560
;560:          break;
LABELV $370
line 563
;561:
;562:        case MCO_EQ:
;563:          return level.numConnectedClients == mrc->numClients;
ADDRGP4 level+173940
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $373
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $373
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $374
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $351
JUMPV
line 564
;564:          break;
line 566
;565:      }
;566:      break;
LABELV $375
line 569
;567:
;568:    case MCV_LASTWIN:
;569:      return level.lastWin == mrc->lastWin;
ADDRGP4 level+189264
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
NEI4 $378
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $379
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $351
JUMPV
line 570
;570:      break;
LABELV $352
LABELV $380
line 574
;571:
;572:    default:
;573:    case MCV_ERR:
;574:      G_Printf(S_COLOR_RED "ERROR: malformed map switch condition\n");
ADDRGP4 $381
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 575
;575:      break;
LABELV $353
line 578
;576:  }
;577:
;578:  return qfalse;
CNSTI4 0
RETI4
LABELV $351
endproc G_EvaluateMapCondition 32 4
export G_AdvanceMapRotation
proc G_AdvanceMapRotation 64 8
line 588
;579:}
;580:
;581:/*
;582:===============
;583:G_AdvanceMapRotation
;584:
;585:Increment the current map rotation
;586:===============
;587: */
;588:qboolean G_AdvanceMapRotation(void) {
line 596
;589:  mapRotation_t *mr;
;590:  mapRotationEntry_t *mre;
;591:  mapRotationCondition_t *mrc;
;592:  int currentRotation, currentMap, nextMap;
;593:  int i, n;
;594:  mapConditionType_t mct;
;595:
;596:  if ((currentRotation = g_currentMapRotation.integer) == NOT_ROTATING)
ADDRLP4 36
ADDRGP4 g_currentMapRotation+12
INDIRI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $384
line 597
;597:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $383
JUMPV
LABELV $384
line 599
;598:
;599:  currentMap = G_GetCurrentMap(currentRotation);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 G_GetCurrentMap
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 40
INDIRI4
ASGNI4
line 601
;600:
;601:  mr = &mapRotations.rotations[ currentRotation ];
ADDRLP4 24
CNSTI4 1091144
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ASGNP4
line 602
;602:  mre = &mr->maps[ currentMap ];
ADDRLP4 8
CNSTI4 17048
ADDRLP4 28
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ASGNP4
line 603
;603:  nextMap = (currentMap + 1) % mr->numMaps;
ADDRLP4 32
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 24
INDIRP4
CNSTI4 1091136
ADDP4
INDIRI4
MODI4
ASGNI4
line 605
;604:
;605:  for (i = 0; i < mre->numConditions; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $387
line 606
;606:    mrc = &mre->conditions[ i ];
ADDRLP4 0
CNSTI4 84
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 16708
ADDP4
ADDP4
ASGNP4
line 608
;607:
;608:    if (mrc->unconditional || G_EvaluateMapCondition(mrc)) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $393
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_EvaluateMapCondition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $391
LABELV $393
line 609
;609:      mct = G_ResolveConditionDestination(&n, mrc->dest);
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_ResolveConditionDestination
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 611
;610:
;611:      switch (mct) {
ADDRLP4 56
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $399
ADDRLP4 56
INDIRI4
CNSTI4 1
EQI4 $397
ADDRLP4 56
INDIRI4
CNSTI4 2
EQI4 $398
ADDRGP4 $394
JUMPV
LABELV $397
line 613
;612:        case MCT_MAP:
;613:          nextMap = n;
ADDRLP4 32
ADDRLP4 20
INDIRI4
ASGNI4
line 614
;614:          break;
ADDRGP4 $395
JUMPV
LABELV $398
line 619
;615:
;616:        case MCT_ROTATION:
;617:          //need to increment the current map before changing the rotation
;618:          //or you get infinite loops with some conditionals
;619:          G_SetCurrentMap(nextMap, currentRotation);
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_SetCurrentMap
CALLV
pop
line 620
;620:          G_StartMapRotation(mrc->dest, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_StartMapRotation
CALLI4
pop
line 621
;621:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $383
JUMPV
line 622
;622:          break;
LABELV $394
LABELV $399
line 626
;623:
;624:        default:
;625:        case MCT_ERR:
;626:          G_Printf(S_COLOR_YELLOW "WARNING: map switch destination could not be resolved: %s\n",
ADDRGP4 $400
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 628
;627:                  mrc->dest);
;628:          break;
LABELV $395
line 630
;629:      }
;630:    }
LABELV $391
line 631
;631:  }
LABELV $388
line 605
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $390
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 17044
ADDP4
INDIRI4
LTI4 $387
line 633
;632:
;633:  G_SetCurrentMap(nextMap, currentRotation);
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_SetCurrentMap
CALLV
pop
line 634
;634:  G_IssueMapChange(currentRotation);
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_IssueMapChange
CALLV
pop
line 636
;635:
;636:  return qtrue;
CNSTI4 1
RETI4
LABELV $383
endproc G_AdvanceMapRotation 64 8
export G_StartMapRotation
proc G_StartMapRotation 12 8
line 646
;637:}
;638:
;639:/*
;640:===============
;641:G_StartMapRotation
;642:
;643:Switch to a new map rotation
;644:===============
;645: */
;646:qboolean G_StartMapRotation(char *name, qboolean changeMap) {
line 649
;647:  int i;
;648:
;649:  for (i = 0; i < mapRotations.numRotations; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $402
line 650
;650:    if (!Q_stricmp(mapRotations.rotations[ i ].name, name)) {
CNSTI4 1091144
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $407
line 651
;651:      trap_Cvar_Set("g_currentMapRotation", va("%d", i));
ADDRGP4 $410
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $409
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 652
;652:      trap_Cvar_Update(&g_currentMapRotation);
ADDRGP4 g_currentMapRotation
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 654
;653:
;654:      if (changeMap)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $404
line 655
;655:        G_IssueMapChange(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_IssueMapChange
CALLV
pop
line 656
;656:      break;
ADDRGP4 $404
JUMPV
LABELV $407
line 658
;657:    }
;658:  }
LABELV $403
line 649
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $405
ADDRLP4 0
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $402
LABELV $404
line 660
;659:
;660:  if (i == mapRotations.numRotations)
ADDRLP4 0
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
NEI4 $413
line 661
;661:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $401
JUMPV
LABELV $413
line 663
;662:  else
;663:    return qtrue;
CNSTI4 1
RETI4
LABELV $401
endproc G_StartMapRotation 12 8
export G_StopMapRotation
proc G_StopMapRotation 4 8
line 673
;664:}
;665:
;666:/*
;667:===============
;668:G_StopMapRotation
;669:
;670:Stop the current map rotation
;671:===============
;672: */
;673:void G_StopMapRotation(void) {
line 674
;674:  trap_Cvar_Set("g_currentMapRotation", va("%d", NOT_ROTATING));
ADDRGP4 $410
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $409
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 675
;675:  trap_Cvar_Update(&g_currentMapRotation);
ADDRGP4 g_currentMapRotation
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 676
;676:}
LABELV $416
endproc G_StopMapRotation 4 8
export G_MapRotationActive
proc G_MapRotationActive 4 0
line 685
;677:
;678:/*
;679:===============
;680:G_MapRotationActive
;681:
;682:Test if any map rotation is currently active
;683:===============
;684: */
;685:qboolean G_MapRotationActive(void) {
line 686
;686:  return ( g_currentMapRotation.integer != NOT_ROTATING);
ADDRGP4 g_currentMapRotation+12
INDIRI4
CNSTI4 -1
EQI4 $420
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $420
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $421
ADDRLP4 0
INDIRI4
RETI4
LABELV $417
endproc G_MapRotationActive 4 0
export G_InitMapRotations
proc G_InitMapRotations 12 12
line 696
;687:}
;688:
;689:/*
;690:===============
;691:G_InitMapRotations
;692:
;693:Load and intialise the map rotations
;694:===============
;695: */
;696:void G_InitMapRotations(void) {
line 697
;697:  const char *fileName = "maprotation.cfg";
ADDRLP4 0
ADDRGP4 $423
ASGNP4
line 700
;698:
;699:  //load the file if it exists
;700:  if (trap_FS_FOpenFile(fileName, NULL, FS_READ)) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $424
line 701
;701:    if (!G_ParseMapRotationFile(fileName))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_ParseMapRotationFile
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $425
line 702
;702:      G_Printf(S_COLOR_RED "ERROR: failed to parse %s file\n", fileName);
ADDRGP4 $428
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 703
;703:  } else
ADDRGP4 $425
JUMPV
LABELV $424
line 704
;704:    G_Printf("%s file not found.\n", fileName);
ADDRGP4 $429
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $425
line 706
;705:
;706:  if (g_currentMapRotation.integer == NOT_ROTATING) {
ADDRGP4 g_currentMapRotation+12
INDIRI4
CNSTI4 -1
NEI4 $430
line 707
;707:    if (g_initialMapRotation.string[ 0 ] != 0) {
ADDRGP4 g_initialMapRotation+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $433
line 708
;708:      G_StartMapRotation(g_initialMapRotation.string, qfalse);
ADDRGP4 g_initialMapRotation+16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_StartMapRotation
CALLI4
pop
line 710
;709:
;710:      trap_Cvar_Set("g_initialMapRotation", "");
ADDRGP4 $437
ARGP4
ADDRGP4 $102
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 711
;711:      trap_Cvar_Update(&g_initialMapRotation);
ADDRGP4 g_initialMapRotation
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 712
;712:    }
LABELV $433
line 713
;713:  }
LABELV $430
line 714
;714:}
LABELV $422
endproc G_InitMapRotations 12 12
bss
export mapRotations
align 4
LABELV mapRotations
skip 17458308
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
lit
align 1
LABELV $437
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $429
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
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
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $428
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
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
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $423
byte 1 109
byte 1 97
byte 1 112
byte 1 114
byte 1 111
byte 1 116
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
LABELV $410
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $409
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $400
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
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 108
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $332
byte 1 10
byte 1 0
align 1
LABELV $323
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $321
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $314
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $313
byte 1 37
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $295
byte 1 84
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $294
byte 1 125
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 32
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $286
byte 1 32
byte 1 32
byte 1 125
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $277
byte 1 32
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 32
byte 1 123
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 123
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 58
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $262
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $251
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $237
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $232
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $228
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
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
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $223
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $201
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $200
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $199
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
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
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $192
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $182
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $179
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $170
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $165
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 61
byte 1 0
align 1
LABELV $161
byte 1 62
byte 1 0
align 1
LABELV $158
byte 1 60
byte 1 0
align 1
LABELV $153
byte 1 110
byte 1 117
byte 1 109
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $145
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $140
byte 1 103
byte 1 111
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $137
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
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
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $131
byte 1 123
byte 1 0
align 1
LABELV $120
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 32
byte 1 0
align 1
LABELV $108
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 125
byte 1 0
align 1
LABELV $102
byte 1 0
align 1
LABELV $85
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
