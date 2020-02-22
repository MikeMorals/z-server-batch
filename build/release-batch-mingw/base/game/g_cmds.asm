export G_SanitiseString
code
proc G_SanitiseString 40 4
file "..\..\..\..\src/game/g_cmds.c"
line 33
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
;26:/*
;27:==================
;28:G_SanitiseString
;29:
;30:Remove case and control characters from a player name
;31:==================
;32: */
;33:void G_SanitiseString(char *in, char *out, int len) {
line 34
;34:  qboolean skip = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 35
;35:  int spaces = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $85
line 37
;36:
;37:  while (*in && len > 0) {
line 39
;38:    // strip leading white space
;39:    if (*in == ' ') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $88
line 40
;40:      if (skip) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $90
line 41
;41:        in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 42
;42:        continue;
ADDRGP4 $86
JUMPV
LABELV $90
line 44
;43:      }
;44:      spaces++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 45
;45:    } else {
ADDRGP4 $89
JUMPV
LABELV $88
line 46
;46:      spaces = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 47
;47:      skip = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 48
;48:    }
LABELV $89
line 50
;49:
;50:    if (Q_IsColorString(in)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $92
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $92
ADDRLP4 12
INDIRI4
CNSTI4 65
LTI4 $95
ADDRLP4 12
INDIRI4
CNSTI4 90
LEI4 $94
LABELV $95
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $96
ADDRLP4 16
INDIRI4
CNSTI4 122
LEI4 $94
LABELV $96
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $92
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $92
LABELV $94
line 51
;51:      in += 2; // skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 52
;52:      continue;
ADDRGP4 $86
JUMPV
LABELV $92
line 55
;53:    }
;54:
;55:    if (*in < 32) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $97
line 56
;56:      in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 57
;57:      continue;
ADDRGP4 $86
JUMPV
LABELV $97
line 60
;58:    }
;59:
;60:    *out++ = tolower(*in++);
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 36
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 36
INDIRI4
CVII1 4
ASGNI1
line 61
;61:    len--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 62
;62:  }
LABELV $86
line 37
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $99
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
GTI4 $85
LABELV $99
line 63
;63:  out -= spaces;
ADDRFP4 4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
SUBP4
ASGNP4
line 64
;64:  *out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 65
;65:}
LABELV $84
endproc G_SanitiseString 40 4
export G_ClientNumberFromString
proc G_ClientNumberFromString 2068 12
line 75
;66:
;67:/*
;68:==================
;69:G_ClientNumberFromString
;70:
;71:Returns a player number for either a number or name string
;72:Returns -1 if invalid
;73:==================
;74: */
;75:int G_ClientNumberFromString(gentity_t *to, char *s) {
line 82
;76:  gclient_t *cl;
;77:  int idnum;
;78:  char s2[ MAX_STRING_CHARS ];
;79:  char n2[ MAX_STRING_CHARS ];
;80:
;81:  // numeric values are just slot numbers
;82:  if (s[ 0 ] >= '0' && s[ 0 ] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $101
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $101
line 83
;83:    idnum = atoi(s);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 2060
INDIRI4
ASGNI4
line 85
;84:
;85:    if (idnum < 0 || idnum >= level.maxclients)
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $106
ADDRLP4 1028
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $103
LABELV $106
line 86
;86:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $100
JUMPV
LABELV $103
line 88
;87:
;88:    cl = &level.clients[ idnum ];
ADDRLP4 0
CNSTI4 2148
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 90
;89:
;90:    if (cl->pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $107
line 91
;91:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $100
JUMPV
LABELV $107
line 93
;92:
;93:    return idnum;
ADDRLP4 1028
INDIRI4
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 97
;94:  }
;95:
;96:  // check for a name match
;97:  G_SanitiseString(s, s2, sizeof ( s2));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 99
;98:
;99:  for (idnum = 0, cl = level.clients; idnum < level.maxclients; idnum++, cl++) {
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $109
line 100
;100:    if (cl->pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $114
line 101
;101:      continue;
ADDRGP4 $110
JUMPV
LABELV $114
line 103
;102:
;103:    G_SanitiseString(cl->pers.netname, n2, sizeof ( n2));
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 105
;104:
;105:    if (!strcmp(n2, s2))
ADDRLP4 4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $116
line 106
;106:      return idnum;
ADDRLP4 1028
INDIRI4
RETI4
ADDRGP4 $100
JUMPV
LABELV $116
line 107
;107:  }
LABELV $110
line 99
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2148
ADDP4
ASGNP4
LABELV $112
ADDRLP4 1028
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $109
line 109
;108:
;109:  return -1;
CNSTI4 -1
RETI4
LABELV $100
endproc G_ClientNumberFromString 2068 12
lit
align 1
LABELV $119
byte 1 0
skip 41
export G_MatchOnePlayer
code
proc G_MatchOnePlayer 60 20
line 122
;110:}
;111:
;112:/*
;113:==================
;114:G_MatchOnePlayer
;115:
;116:This is a companion function to G_ClientNumbersFromString()
;117:
;118:returns qtrue if the int array plist only has one client id, false otherwise
;119:In the case of false, err will be populated with an error message.
;120:==================
;121: */
;122:qboolean G_MatchOnePlayer(int *plist, char *err, int len) {
line 125
;123:  gclient_t *cl;
;124:  int *p;
;125:  char line[ MAX_NAME_LENGTH + 10 ] = {""};
ADDRLP4 8
ADDRGP4 $119
INDIRB
ASGNB 42
line 127
;126:
;127:  err[ 0 ] = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 128
;128:  if (plist[ 0 ] == -1) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 -1
NEI4 $120
line 129
;129:    Q_strcat(err, len, "no connected player by that name or slot #");
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $122
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 130
;130:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $118
JUMPV
LABELV $120
line 132
;131:  }
;132:  if (plist[ 1 ] != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $123
line 133
;133:    Q_strcat(err, len, "more than one player name matches. "
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $125
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 135
;134:            "be more specific or use the slot #:\n");
;135:    for (p = plist; *p != -1; p++) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $129
JUMPV
LABELV $126
line 136
;136:      cl = &level.clients[ *p ];
ADDRLP4 4
CNSTI4 2148
ADDRLP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 137
;137:      if (cl->pers.connected == CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $130
line 138
;138:        Com_sprintf(line, sizeof ( line), "%2i - %s^7\n",
ADDRLP4 8
ARGP4
CNSTI4 42
ARGI4
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 140
;139:                *p, cl->pers.netname);
;140:        if (strlen(err) + strlen(line) > len)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
ADDI4
ADDRFP4 8
INDIRI4
LEI4 $133
line 141
;141:          break;
ADDRGP4 $128
JUMPV
LABELV $133
line 142
;142:        Q_strcat(err, len, line);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 143
;143:      }
LABELV $130
line 144
;144:    }
LABELV $127
line 135
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
LABELV $129
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -1
NEI4 $126
LABELV $128
line 145
;145:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $118
JUMPV
LABELV $123
line 147
;146:  }
;147:  return qtrue;
CNSTI4 1
RETI4
LABELV $118
endproc G_MatchOnePlayer 60 20
lit
align 1
LABELV $136
byte 1 0
skip 31
align 1
LABELV $137
byte 1 0
skip 31
export G_ClientNumbersFromString
code
proc G_ClientNumbersFromString 96 12
line 160
;148:}
;149:
;150:/*
;151:==================
;152:G_ClientNumbersFromString
;153:
;154:Sets plist to an array of integers that represent client numbers that have
;155:names that are a partial match for s.
;156:
;157:Returns number of matching clientids up to MAX_CLIENTS.
;158:==================
;159: */
;160:int G_ClientNumbersFromString(char *s, int *plist) {
line 162
;161:  gclient_t *p;
;162:  int i, found = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 163
;163:  char n2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 4
ADDRGP4 $136
INDIRB
ASGNB 32
line 164
;164:  char s2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 44
ADDRGP4 $137
INDIRB
ASGNB 32
line 165
;165:  int max = MAX_CLIENTS;
ADDRLP4 76
CNSTI4 64
ASGNI4
line 168
;166:
;167:  // if a number is provided, it might be a slot #
;168:  for (i = 0; s[ i ] && isdigit(s[ i ]); i++);
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
LABELV $139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 80
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $143
ADDRLP4 80
INDIRI4
CNSTI4 48
LTI4 $143
ADDRLP4 80
INDIRI4
CNSTI4 57
LEI4 $138
LABELV $143
line 169
;169:  if (!s[ i ]) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $144
line 170
;170:    i = atoi(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 84
INDIRI4
ASGNI4
line 171
;171:    if (i >= 0 && i < level.maxclients) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $146
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $146
line 172
;172:      p = &level.clients[ i ];
ADDRLP4 36
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 173
;173:      if (p->pers.connected != CON_DISCONNECTED) {
ADDRLP4 36
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
line 174
;174:        *plist = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 175
;175:        return 1;
CNSTI4 1
RETI4
ADDRGP4 $135
JUMPV
LABELV $149
line 177
;176:      }
;177:    }
LABELV $146
line 179
;178:    // we must assume that if only a number is provided, it is a clientNum
;179:    *plist = -1;
ADDRFP4 4
INDIRP4
CNSTI4 -1
ASGNI4
line 180
;180:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $144
line 184
;181:  }
;182:
;183:  // now look for name matches
;184:  G_SanitiseString(s, s2, sizeof ( s2));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 185
;185:  if (strlen(s2) < 1)
ADDRLP4 44
ARGP4
ADDRLP4 84
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
GEI4 $151
line 186
;186:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $151
line 187
;187:  for (i = 0; i < level.maxclients && found <= max; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 188
;188:    p = &level.clients[ i ];
ADDRLP4 36
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 189
;189:    if (p->pers.connected == CON_DISCONNECTED) {
ADDRLP4 36
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $158
line 190
;190:      continue;
ADDRGP4 $154
JUMPV
LABELV $158
line 192
;191:    }
;192:    G_SanitiseString(p->pers.netname, n2, sizeof ( n2));
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 193
;193:    if (strstr(n2, s2)) {
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 88
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
line 194
;194:      *plist++ = i;
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 92
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 195
;195:      found++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 196
;196:    }
LABELV $160
line 197
;197:  }
LABELV $154
line 187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $162
ADDRLP4 40
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $153
LABELV $162
line 198
;198:  *plist = -1;
ADDRFP4 4
INDIRP4
CNSTI4 -1
ASGNI4
line 199
;199:  return found;
ADDRLP4 40
INDIRI4
RETI4
LABELV $135
endproc G_ClientNumbersFromString 96 12
export ScoreboardMessage
proc ScoreboardMessage 2488 36
line 208
;200:}
;201:
;202:/*
;203:==================
;204:ScoreboardMessage
;205:
;206:==================
;207: */
;208:void ScoreboardMessage(gentity_t *ent) {
line 215
;209:  char entry[ 1024 ];
;210:  char string[ 1400 ];
;211:  int stringlength;
;212:  int i, j;
;213:  gclient_t *cl;
;214:  int numSorted;
;215:  weapon_t weapon = WP_NONE;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 216
;216:  upgrade_t upgrade = UP_NONE;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 219
;217:
;218:  // send the latest information on all clients
;219:  string[ 0 ] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 220
;220:  stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 222
;221:
;222:  numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 224
;223:
;224:  if((ent->r.svFlags & SVF_BOT))
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $165
line 225
;225:  {
line 226
;226:    return;
ADDRGP4 $163
JUMPV
LABELV $165
line 229
;227:  }
;228:
;229:  for (i = 0; i < numSorted; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 232
;230:    int ping;
;231:
;232:    cl = &level.clients[ level.sortedClients[ i ] ];
ADDRLP4 0
CNSTI4 2148
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173952
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 236
;233:
;234:    //FIXME: This shuld check against ent->r.svFlags
;235:    //but this works for now.
;236:    if(cl->pers.teamSelection == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $172
line 237
;237:    {
line 238
;238:      continue;
ADDRGP4 $168
JUMPV
LABELV $172
line 241
;239:    }
;240:
;241:    if (cl->pers.connected == CON_CONNECTING)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $174
line 242
;242:      ping = -1;
ADDRLP4 2452
CNSTI4 -1
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
line 243
;243:    else if (cl->sess.spectatorState == SPECTATOR_FOLLOW)
ADDRLP4 0
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $176
line 244
;244:      ping = cl->pers.ping < 999 ? cl->pers.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRI4
CNSTI4 999
GEI4 $179
ADDRLP4 2456
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $180
JUMPV
LABELV $179
ADDRLP4 2456
CNSTI4 999
ASGNI4
LABELV $180
ADDRLP4 2452
ADDRLP4 2456
INDIRI4
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $176
line 246
;245:    else
;246:      ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $182
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $182
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $183
ADDRLP4 2452
ADDRLP4 2460
INDIRI4
ASGNI4
LABELV $177
LABELV $175
line 250
;247:
;248:    //If (loop) client is a spectator, they have nothing, so indicate such. 
;249:    //Only send the client requesting the scoreboard the weapon/upgrades information for members of their team. If they are not on a team, send it all.
;250:    if (cl->sess.sessionTeam != TEAM_SPECTATOR &&
ADDRLP4 0
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $184
ADDRLP4 2468
CNSTI4 628
ASGNI4
ADDRLP4 2472
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 2468
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2472
INDIRI4
CNSTI4 0
EQI4 $186
ADDRLP4 0
INDIRP4
ADDRLP4 2468
INDIRI4
ADDP4
INDIRI4
ADDRLP4 2472
INDIRI4
NEI4 $184
LABELV $186
line 251
;251:            (ent->client->pers.teamSelection == PTE_NONE || cl->pers.teamSelection == ent->client->pers.teamSelection)) {
line 252
;252:      weapon = cl->ps.weapon;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 257
;253:
;254:     
;255:	/*	if (BG_InventoryContainsUpgrade(UP_JEEP, cl->ps.stats))
;256:		 upgrade = UP_JEEP;	*/
;257:		/*if (BG_InventoryContainsUpgrade(UP_BATTLESUIT, cl->ps.stats))
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2476
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 2476
INDIRI4
CNSTI4 0
EQI4 $187
line 262
;258:        upgrade = UP_BATTLESUIT;
;259:      else if (BG_InventoryContainsUpgrade(UP_JETPACK, cl->ps.stats))
;260:        upgrade = UP_JETPACK;
;261:      else*/ if (BG_InventoryContainsUpgrade(UP_BATTPACK, cl->ps.stats))
;262:        upgrade = UP_BATTPACK;
ADDRLP4 1044
CNSTI4 4
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $187
line 263
;263:      else if (BG_InventoryContainsUpgrade(UP_HELMET, cl->ps.stats))
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2480
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 2480
INDIRI4
CNSTI4 0
EQI4 $189
line 264
;264:        upgrade = UP_HELMET;
ADDRLP4 1044
CNSTI4 2
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $189
line 265
;265:      else if (BG_InventoryContainsUpgrade(UP_LIGHTARMOUR, cl->ps.stats))
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2484
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 2484
INDIRI4
CNSTI4 0
EQI4 $191
line 266
;266:        upgrade = UP_LIGHTARMOUR;
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $191
line 268
;267:      else
;268:        upgrade = UP_NONE;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 269
;269:    } else {
ADDRGP4 $185
JUMPV
LABELV $184
line 270
;270:      weapon = WP_NONE;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 271
;271:      upgrade = UP_NONE;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 272
;272:    }
LABELV $185
line 274
;273:
;274:    Com_sprintf(entry, sizeof ( entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $193
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173952
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
ADDRGP4 level+28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 278
;275:            " %d %d %d %d %d %d", level.sortedClients[ i ], cl->pers.score, ping,
;276:            (level.time - cl->pers.enterTime) / 60000, weapon, upgrade);
;277:
;278:    j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2480
INDIRI4
ASGNI4
line 280
;279:
;280:    if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $196
line 281
;281:      break;
ADDRGP4 $169
JUMPV
LABELV $196
line 283
;282:
;283:    strcpy(string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 284
;284:    stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 285
;285:  }
LABELV $168
line 229
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $167
LABELV $169
line 287
;286:
;287:  trap_SendServerCommand(ent - g_entities, va("scores %i %i %i%s", i,
ADDRGP4 $198
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+189240
INDIRI4
ARGI4
ADDRGP4 level+189244
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 2452
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2452
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 289
;288:          level.alienKills, level.humanKills, string));
;289:}
LABELV $163
endproc ScoreboardMessage 2488 36
bss
align 1
LABELV $202
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 296
;290:
;291:/*
;292:==================
;293:ConcatArgs
;294:==================
;295: */
;296:char *ConcatArgs(int start) {
line 302
;297:  int i, c, tlen;
;298:  static char line[ MAX_STRING_CHARS ];
;299:  int len;
;300:  char arg[ MAX_STRING_CHARS ];
;301:
;302:  len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 303
;303:  c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 305
;304:
;305:  for (i = start; i < c; i++) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 306
;306:    trap_Argv(i, arg, sizeof ( arg));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 307
;307:    tlen = strlen(arg);
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 309
;308:
;309:    if (len + tlen >= MAX_STRING_CHARS - 1)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $207
line 310
;310:      break;
ADDRGP4 $205
JUMPV
LABELV $207
line 312
;311:
;312:    memcpy(line + len, arg, tlen);
ADDRLP4 0
INDIRI4
ADDRGP4 $202
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 313
;313:    len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 315
;314:
;315:    if (len == MAX_STRING_CHARS - 1)
ADDRLP4 0
INDIRI4
CNSTI4 1023
NEI4 $209
line 316
;316:      break;
ADDRGP4 $205
JUMPV
LABELV $209
line 318
;317:
;318:    if (i != c - 1) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $211
line 319
;319:      line[ len ] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $202
ADDP4
CNSTI1 32
ASGNI1
line 320
;320:      len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 321
;321:    }
LABELV $211
line 322
;322:  }
LABELV $204
line 305
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $203
LABELV $205
line 324
;323:
;324:  line[ len ] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $202
ADDP4
CNSTI1 0
ASGNI1
line 326
;325:
;326:  return line;
ADDRGP4 $202
RETP4
LABELV $201
endproc ConcatArgs 1048 12
export G_Flood_Limited
proc G_Flood_Limited 20 8
line 337
;327:}
;328:
;329:/*
;330:==================
;331:G_Flood_Limited
;332:
;333:Determine whether a user is flood limited, and adjust their flood demerits
;334:==================
;335: */
;336:
;337:qboolean G_Flood_Limited(gentity_t *ent) {
line 342
;338:  int millisSinceLastCommand;
;339:  int maximumDemerits;
;340:
;341:  // This shouldn't be called if g_floodMinTime isn't set, but handle it anyway.
;342:  if (!g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
NEI4 $214
line 343
;343:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $213
JUMPV
LABELV $214
line 345
;344:
;345:  if (level.paused) //Doesn't work when game is paused, so disable
ADDRGP4 level+189852
INDIRI4
CNSTI4 0
EQI4 $217
line 346
;346:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $213
JUMPV
LABELV $217
line 349
;347:
;348:  // Do not limit admins with no censor/flood flag
;349:  if (G_admin_permission(ent, ADMF_NOCENSORFLOOD))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 8
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $220
line 350
;350:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $213
JUMPV
LABELV $220
line 352
;351:
;352:  millisSinceLastCommand = level.time - ent->client->pers.lastFloodTime;
ADDRLP4 0
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
SUBI4
ASGNI4
line 353
;353:  if (millisSinceLastCommand < g_floodMinTime.integer)
ADDRLP4 0
INDIRI4
ADDRGP4 g_floodMinTime+12
INDIRI4
GEI4 $224
line 354
;354:    ent->client->pers.floodDemerits += (g_floodMinTime.integer - millisSinceLastCommand);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 672
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 g_floodMinTime+12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDI4
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
line 355
;355:  else {
line 356
;356:    ent->client->pers.floodDemerits -= (millisSinceLastCommand - g_floodMinTime.integer);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 672
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 g_floodMinTime+12
INDIRI4
SUBI4
SUBI4
ASGNI4
line 357
;357:    if (ent->client->pers.floodDemerits < 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 672
ADDP4
INDIRI4
CNSTI4 0
GEI4 $229
line 358
;358:      ent->client->pers.floodDemerits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 0
ASGNI4
LABELV $229
line 359
;359:  }
LABELV $225
line 361
;360:
;361:  ent->client->pers.lastFloodTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 365
;362:
;363:  // If g_floodMaxDemerits == 0, then we go against g_floodMinTime^2.
;364:
;365:  if (!g_floodMaxDemerits.integer)
ADDRGP4 g_floodMaxDemerits+12
INDIRI4
CNSTI4 0
NEI4 $232
line 366
;366:    maximumDemerits = g_floodMinTime.integer * g_floodMinTime.integer / 1000;
ADDRLP4 4
ADDRGP4 g_floodMinTime+12
INDIRI4
ADDRGP4 g_floodMinTime+12
INDIRI4
MULI4
CNSTI4 1000
DIVI4
ASGNI4
ADDRGP4 $233
JUMPV
LABELV $232
line 368
;367:  else
;368:    maximumDemerits = g_floodMaxDemerits.integer;
ADDRLP4 4
ADDRGP4 g_floodMaxDemerits+12
INDIRI4
ASGNI4
LABELV $233
line 370
;369:
;370:  if (ent->client->pers.floodDemerits > maximumDemerits)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 672
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $238
line 371
;371:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $213
JUMPV
LABELV $238
line 373
;372:
;373:  return qfalse;
CNSTI4 0
RETI4
LABELV $213
endproc G_Flood_Limited 20 8
export Cmd_Give_f
proc Cmd_Give_f 68 20
line 383
;374:}
;375:
;376:/*
;377:==================
;378:Cmd_Give_f
;379:
;380:Give items to a client
;381:==================
;382: */
;383:void Cmd_Give_f(gentity_t *ent) {
line 385
;384:  char *name;
;385:  qboolean give_all = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 387
;386:
;387:  name = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 388
;388:  if (Q_stricmp(name, "all") == 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $243
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $241
line 389
;389:    give_all = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $241
line 391
;390:
;391:  if (give_all || Q_stricmp(name, "health") == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $247
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $246
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $244
LABELV $247
line 392
;392:    if (!g_devmapNoGod.integer) {
ADDRGP4 g_devmapNoGod+12
INDIRI4
CNSTI4 0
NEI4 $248
line 393
;393:      ent->health = ent->client->ps.stats[ STAT_MAX_HEALTH ];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 394
;394:      BG_AddUpgradeToInventory(UP_MEDKIT, ent->client->ps.stats);
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
line 395
;395:    }
LABELV $248
line 396
;396:  }
LABELV $244
line 398
;397:
;398:  if (give_all || Q_stricmpn(name, "funds", 5) == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $254
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 20
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $251
LABELV $254
line 399
;399:    int credits = give_all ? HUMAN_MAX_CREDITS : atoi(name + 6);
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $256
ADDRLP4 28
CNSTI4 2000
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
ADDRLP4 0
INDIRP4
CNSTI4 6
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
LABELV $257
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 400
;400:    G_AddCreditToClient(ent->client, credits, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 401
;401:  }
LABELV $251
line 403
;402:
;403:  if (give_all || Q_stricmp(name, "stamina") == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $261
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $258
LABELV $261
line 404
;404:    ent->client->ps.stats[ STAT_STAMINA ] = MAX_STAMINA;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1000
ASGNI4
LABELV $258
line 406
;405:
;406:  if (Q_stricmp(name, "poison") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $262
line 407
;407:    ent->client->ps.stats[ STAT_STATE ] |= SS_BOOSTED;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 408
;408:    ent->client->lastBoostedTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 409
;409:  }
LABELV $262
line 411
;410:
;411:  if (give_all || Q_stricmp(name, "ammo") == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $269
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $266
LABELV $269
line 413
;412:    int maxAmmo, maxClips;
;413:    gclient_t *client = ent->client;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 415
;414:
;415:    if (client->ps.weapon != WP_ALEVEL3_UPG &&
ADDRLP4 48
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 28
EQI4 $270
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindInfinteAmmoForWeapon
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $270
line 417
;416:            BG_FindInfinteAmmoForWeapon(client->ps.weapon))
;417:      return;
ADDRGP4 $240
JUMPV
LABELV $270
line 419
;418:
;419:    BG_FindAmmoForWeapon(client->ps.weapon, &maxAmmo, &maxClips);
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 421
;420:
;421:    if (BG_FindUsesEnergyForWeapon(client->ps.weapon) &&
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $272
CNSTI4 4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $272
line 423
;422:            BG_InventoryContainsUpgrade(UP_BATTPACK, client->ps.stats))
;423:      maxAmmo = (int) ((float) maxAmmo * BATTPACK_MODIFIER);
ADDRLP4 40
CNSTF4 1069547520
ADDRLP4 40
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
LABELV $272
line 425
;424:
;425:    BG_PackAmmoArray(client->ps.weapon, &client->ps.ammo, client->ps.powerups, maxAmmo, maxClips);
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 426
;426:  }
LABELV $266
line 427
;427:}
LABELV $240
endproc Cmd_Give_f 68 20
export Cmd_God_f
proc Cmd_God_f 8 8
line 438
;428:
;429:/*
;430:==================
;431:Cmd_God_f
;432:
;433:Sets client to godmode
;434:
;435:argv(0) god
;436:==================
;437: */
;438:void Cmd_God_f(gentity_t *ent) {
line 441
;439:  char *msg;
;440:
;441:  if (!g_devmapNoGod.integer) {
ADDRGP4 g_devmapNoGod+12
INDIRI4
CNSTI4 0
NEI4 $275
line 442
;442:    ent->flags ^= FL_GODMODE;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 444
;443:
;444:    if (!(ent->flags & FL_GODMODE))
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $278
line 445
;445:      msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $280
ASGNP4
ADDRGP4 $276
JUMPV
LABELV $278
line 447
;446:    else
;447:      msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $281
ASGNP4
line 448
;448:  } else {
ADDRGP4 $276
JUMPV
LABELV $275
line 449
;449:    msg = "Godmode has been disabled.\n";
ADDRLP4 0
ADDRGP4 $282
ASGNP4
line 450
;450:  }
LABELV $276
line 452
;451:
;452:  trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $283
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 453
;453:}
LABELV $274
endproc Cmd_God_f 8 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 8 8
line 464
;454:
;455:/*
;456:==================
;457:Cmd_Notarget_f
;458:
;459:Sets client to notarget
;460:
;461:argv(0) notarget
;462:==================
;463: */
;464:void Cmd_Notarget_f(gentity_t *ent) {
line 467
;465:  char *msg;
;466:
;467:  if (!g_devmapNoGod.integer) {
ADDRGP4 g_devmapNoGod+12
INDIRI4
CNSTI4 0
NEI4 $285
line 468
;468:    ent->flags ^= FL_NOTARGET;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 470
;469:
;470:    if (!(ent->flags & FL_NOTARGET))
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $288
line 471
;471:      msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $290
ASGNP4
ADDRGP4 $286
JUMPV
LABELV $288
line 473
;472:    else
;473:      msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $291
ASGNP4
line 474
;474:  } else {
ADDRGP4 $286
JUMPV
LABELV $285
line 475
;475:    msg = "Godmode has been disabled.\n";
ADDRLP4 0
ADDRGP4 $282
ASGNP4
line 476
;476:  }
LABELV $286
line 478
;477:
;478:  trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $283
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 479
;479:}
LABELV $284
endproc Cmd_Notarget_f 8 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 12 8
line 488
;480:
;481:/*
;482:==================
;483:Cmd_Noclip_f
;484:
;485:argv(0) noclip
;486:==================
;487: */
;488:void Cmd_Noclip_f(gentity_t *ent) {
line 491
;489:  char *msg;
;490:
;491:  if (!g_devmapNoGod.integer) {
ADDRGP4 g_devmapNoGod+12
INDIRI4
CNSTI4 0
NEI4 $293
line 492
;492:    if (ent->client->noclip)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 493
;493:      msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $298
ASGNP4
ADDRGP4 $297
JUMPV
LABELV $296
line 495
;494:    else
;495:      msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $299
ASGNP4
LABELV $297
line 497
;496:
;497:    ent->client->noclip = !ent->client->noclip;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $301
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $302
JUMPV
LABELV $301
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $302
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 498
;498:  }
ADDRGP4 $294
JUMPV
LABELV $293
line 499
;499:  else {
line 500
;500:    msg = "Godmode has been disabled.\n";
ADDRLP4 0
ADDRGP4 $282
ASGNP4
line 501
;501:  }
LABELV $294
line 503
;502:
;503:  trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $283
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 504
;504:}
LABELV $292
endproc Cmd_Noclip_f 12 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 0 8
line 516
;505:
;506:/*
;507:==================
;508:Cmd_LevelShot_f
;509:
;510:This is just to help generate the level pictures
;511:for the menus.  It goes to the intermission immediately
;512:and sends over a command to the client to resize the view,
;513:hide the scoreboard, and take a special screenshot
;514:==================
;515: */
;516:void Cmd_LevelShot_f(gentity_t *ent) {
line 517
;517:  BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 518
;518:  trap_SendServerCommand(ent - g_entities, "clientLevelShot");
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
ADDRGP4 $304
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 519
;519:}
LABELV $303
endproc Cmd_LevelShot_f 0 8
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 526
;520:
;521:/*
;522:=================
;523:Cmd_Kill_f
;524:=================
;525: */
;526:void Cmd_Kill_f(gentity_t *ent) {
line 527
;527:  if (ent->client->ps.stats[ STAT_STATE ] & SS_INFESTING)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $306
line 528
;528:    return;
ADDRGP4 $305
JUMPV
LABELV $306
line 530
;529:
;530:  if (ent->client->ps.stats[ STAT_STATE ] & SS_HOVELING) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $308
line 531
;531:    trap_SendServerCommand(ent - g_entities, "print \"Leave the hovel first (use your destroy key)\n\"");
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
ADDRGP4 $310
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 532
;532:    return;
ADDRGP4 $305
JUMPV
LABELV $308
line 535
;533:  }
;534:
;535:  if (g_cheats.integer) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
EQI4 $311
line 536
;536:    ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 537
;537:    ent->client->ps.stats[ STAT_HEALTH ] = ent->health = 0;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 538
;538:    player_die(ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 539
;539:  } else {
ADDRGP4 $312
JUMPV
LABELV $311
line 540
;540:    if (ent->suicideTime == 0) {
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRI4
CNSTI4 0
NEI4 $314
line 541
;541:      trap_SendServerCommand(ent - g_entities, "print \"You will suicide in 20 seconds\n\"");
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
ADDRGP4 $316
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 542
;542:      ent->suicideTime = level.time + 20000;
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 543
;543:    } else if (ent->suicideTime > level.time) {
ADDRGP4 $315
JUMPV
LABELV $314
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $318
line 544
;544:      trap_SendServerCommand(ent - g_entities, "print \"Suicide canceled\n\"");
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
ADDRGP4 $321
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 545
;545:      ent->suicideTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
CNSTI4 0
ASGNI4
line 546
;546:    }
LABELV $318
LABELV $315
line 547
;547:  }
LABELV $312
line 548
;548:}
LABELV $305
endproc Cmd_Kill_f 16 20
export G_LeaveTeam
proc G_LeaveTeam 48 8
line 555
;549:
;550:/*
;551:==================
;552:G_LeaveTeam
;553:==================
;554: */
;555:void G_LeaveTeam(gentity_t *self) {
line 556
;556:  pTeam_t team = self->client->pers.teamSelection;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 560
;557:  gentity_t *ent;
;558:  int i;
;559:
;560:  if (team == PTE_ALIENS)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $323
line 561
;561:    G_RemoveFromSpawnQueue(&level.alienSpawnQueue, self->client->ps.clientNum);
ADDRGP4 level+189292
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RemoveFromSpawnQueue
CALLI4
pop
ADDRGP4 $324
JUMPV
LABELV $323
line 562
;562:  else if (team == PTE_HUMANS)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $326
line 563
;563:    G_RemoveFromSpawnQueue(&level.humanSpawnQueue, self->client->ps.clientNum);
ADDRGP4 level+189556
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RemoveFromSpawnQueue
CALLI4
pop
ADDRGP4 $327
JUMPV
LABELV $326
line 564
;564:  else {
line 565
;565:    if (self->client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $322
line 566
;566:      G_StopFollowing(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StopFollowing
CALLV
pop
line 567
;567:    }
line 568
;568:    return;
ADDRGP4 $322
JUMPV
LABELV $327
LABELV $324
line 572
;569:  }
;570:
;571:  // Cancel pending suicides
;572:  self->suicideTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
CNSTI4 0
ASGNI4
line 575
;573:
;574:  // stop any following clients
;575:  G_StopFromFollowing(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StopFromFollowing
CALLV
pop
line 577
;576:
;577:  self->ctn_build_count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 579
;578:
;579:  for (i = 0; i < level.num_entities; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $331
line 580
;580:    ent = &g_entities[ i ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 581
;581:    if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $336
line 582
;582:      continue;
ADDRGP4 $332
JUMPV
LABELV $336
line 585
;583:
;584:    // clean up projectiles
;585:    if (ent->s.eType == ET_MISSILE && ent->r.ownerNum == self->s.number)
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $338
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $338
line 586
;586:      G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $338
line 587
;587:    if (g_ctn.integer > 0 && ent->s.eType == ET_BUILDABLE && ent->builder && ent->builder == self)
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $340
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $340
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $340
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $340
line 588
;588:      G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $340
line 589
;589:    if (ent->client && ent->client->pers.connected == CON_CONNECTED) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $343
ADDRLP4 28
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 591
;590:      // cure poison
;591:      if (ent->client->ps.stats[ STAT_STATE ] & SS_POISONCLOUDED &&
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $345
ADDRLP4 32
INDIRP4
CNSTI4 1344
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $345
line 593
;592:              ent->client->lastPoisonCloudedClient == self)
;593:        ent->client->ps.stats[ STAT_STATE ] &= ~SS_POISONCLOUDED;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
LABELV $345
line 594
;594:      if (ent->client->ps.stats[ STAT_STATE ] & SS_POISONED &&
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $347
ADDRLP4 40
INDIRP4
CNSTI4 1332
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $347
line 596
;595:              ent->client->lastPoisonClient == self)
;596:        ent->client->ps.stats[ STAT_STATE ] &= ~SS_POISONED;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
LABELV $347
line 597
;597:    }
LABELV $343
line 598
;598:  }
LABELV $332
line 579
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $334
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $331
line 599
;599:}
LABELV $322
endproc G_LeaveTeam 48 8
export G_ChangeTeam
proc G_ChangeTeam 40 16
line 606
;600:
;601:/*
;602:=================
;603:G_ChangeTeam
;604:=================
;605: */
;606:void G_ChangeTeam(gentity_t *ent, pTeam_t newTeam) {
line 607
;607:  pTeam_t oldTeam = ent->client->pers.teamSelection;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 608
;608:  qboolean isFixingImbalance = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 610
;609:
;610:  if (oldTeam == newTeam)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $350
line 611
;611:    return;
ADDRGP4 $349
JUMPV
LABELV $350
line 613
;612:
;613:  G_LeaveTeam(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LeaveTeam
CALLV
pop
line 615
;614:
;615:   if(ent->client && ent->client->pers.forcespec == qtrue){
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
CNSTI4 1
NEI4 $352
line 616
;616: 	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $349
line 617
;617: 	  	  {
line 618
;618: 	  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 620
;619: 	  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;620: 	  		  return;
ADDRGP4 $349
JUMPV
line 622
;621: 	  	  }
;622: 	  return;
LABELV $352
line 625
;623:   }
;624:
;625:  ent->client->pers.teamSelection = newTeam;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 629
;626:
;627:  // G_LeaveTeam() calls G_StopFollowing() which sets spec mode to free. 
;628:  // Undo that in this case, or else people can freespec while in the spawn queue on their new team
;629:  if (newTeam != PTE_NONE) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $358
line 630
;630:    ent->client->sess.spectatorState = SPECTATOR_LOCKED;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 2
ASGNI4
line 631
;631:  }
LABELV $358
line 634
;632:
;633:
;634:  if ((level.numAlienClients - level.numHumanClients > 2 && oldTeam == PTE_ALIENS && newTeam == PTE_HUMANS && level.numHumanSpawns > 0) ||
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRGP4 level+185096
INDIRI4
ADDRGP4 level+185100
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
LEI4 $371
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $371
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $371
ADDRGP4 level+185092
INDIRI4
CNSTI4 0
GTI4 $368
LABELV $371
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 level+185100
INDIRI4
ADDRGP4 level+185096
INDIRI4
SUBI4
ADDRLP4 16
INDIRI4
LEI4 $360
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $360
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $360
ADDRGP4 level+185088
INDIRI4
CNSTI4 0
LEI4 $360
LABELV $368
line 635
;635:          (level.numHumanClients - level.numAlienClients > 2 && oldTeam == PTE_HUMANS && newTeam == PTE_ALIENS && level.numAlienSpawns > 0)) {
line 636
;636:    isFixingImbalance = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 637
;637:  }
LABELV $360
line 641
;638:
;639:  // under certain circumstances, clients can keep their kills and credits
;640:  // when switching teams
;641:  if (G_admin_permission(ent, ADMF_TEAMCHANGEFREE) ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 20
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $378
ADDRGP4 g_teamImbalanceWarnings+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $379
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $378
LABELV $379
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $380
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $372
LABELV $380
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
LEI4 $372
LABELV $378
line 644
;642:          (g_teamImbalanceWarnings.integer && isFixingImbalance) ||
;643:          ((oldTeam == PTE_HUMANS || oldTeam == PTE_ALIENS)
;644:          && (level.time - ent->client->pers.teamChangeTime) > 60000)) {
line 645
;645:    if (oldTeam == PTE_ALIENS)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $381
line 646
;646:      ent->client->pers.credit *= (float) FREEKILL_HUMAN / FREEKILL_ALIEN;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1065353216
ADDRLP4 32
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $381
line 647
;647:    else if (newTeam == PTE_ALIENS)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $373
line 648
;648:      ent->client->pers.credit *= (float) FREEKILL_ALIEN / FREEKILL_HUMAN;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1065353216
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 649
;649:  } else {
ADDRGP4 $373
JUMPV
LABELV $372
line 650
;650:    ent->client->pers.credit = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
CNSTI4 0
ASGNI4
line 651
;651:    ent->client->pers.score = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 652
;652:  }
LABELV $373
line 654
;653:
;654:  ent->client->ps.persistant[ PERS_KILLED ] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 655
;655:  ent->client->pers.statscounters.kills = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1052
ADDP4
CNSTI2 0
ASGNI2
line 656
;656:  ent->client->pers.statscounters.structskilled = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1080
ADDP4
CNSTI2 0
ASGNI2
line 657
;657:  ent->client->pers.statscounters.assists = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1060
ADDP4
CNSTI2 0
ASGNI2
line 658
;658:  ent->client->pers.statscounters.repairspoisons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1078
ADDP4
CNSTI2 0
ASGNI2
line 659
;659:  ent->client->pers.statscounters.headshots = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
CNSTI2 0
ASGNI2
line 660
;660:  ent->client->pers.statscounters.hits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTI4 0
ASGNI4
line 661
;661:  ent->client->pers.statscounters.hitslocational = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 0
ASGNI4
line 662
;662:  ent->client->pers.statscounters.deaths = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1054
ADDP4
CNSTI2 0
ASGNI2
line 663
;663:  ent->client->pers.statscounters.feeds = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1056
ADDP4
CNSTI2 0
ASGNI2
line 664
;664:  ent->client->pers.statscounters.suicides = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1058
ADDP4
CNSTI2 0
ASGNI2
line 665
;665:  ent->client->pers.statscounters.teamkills = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
CNSTI2 0
ASGNI2
line 666
;666:  ent->client->pers.statscounters.dmgdone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1064
ADDP4
CNSTI4 0
ASGNI4
line 667
;667:  ent->client->pers.statscounters.structdmgdone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 0
ASGNI4
line 668
;668:  ent->client->pers.statscounters.ffdmgdone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 0
ASGNI4
line 669
;669:  ent->client->pers.statscounters.structsbuilt = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1076
ADDP4
CNSTI2 0
ASGNI2
line 670
;670:  ent->client->pers.statscounters.timealive = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1084
ADDP4
CNSTI4 0
ASGNI4
line 671
;671:  ent->client->pers.statscounters.timeinbase = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 672
;672:  ent->client->pers.statscounters.dretchbasytime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 0
ASGNI4
line 673
;673:  ent->client->pers.statscounters.jetpackusewallwalkusetime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 0
ASGNI4
line 675
;674:
;675:  if (G_admin_permission(ent, ADMF_DBUILDER)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 32
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $385
line 676
;676:    if (!ent->client->pers.designatedBuilder) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $386
line 677
;677:      ent->client->pers.designatedBuilder = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 678
;678:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $390
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 680
;679:              "print \"Your designation has been restored\n\"");
;680:    }
line 681
;681:  } else if (ent->client->pers.designatedBuilder) {
ADDRGP4 $386
JUMPV
LABELV $385
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 682
;682:    ent->client->pers.designatedBuilder = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 0
ASGNI4
line 683
;683:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $393
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 685
;684:            "print \"You have lost designation due to teamchange\n\"");
;685:  }
LABELV $391
LABELV $386
line 687
;686:
;687:  ent->client->pers.classSelection = PCL_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 688
;688:  ClientSpawn(ent, NULL, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 690
;689:
;690:  ent->client->pers.joinedATeam = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 1
ASGNI4
line 691
;691:  ent->client->pers.teamChangeTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 694
;692:
;693:  //update ClientInfo
;694:  ClientUserinfoChanged(ent->client->ps.clientNum);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 695
;695:  G_CheckDBProtection();
ADDRGP4 G_CheckDBProtection
CALLV
pop
line 696
;696:}
LABELV $349
endproc G_ChangeTeam 40 16
export Cmd_Team_f
proc Cmd_Team_f 2164 16
line 703
;697:
;698:/*
;699:=================
;700:Cmd_Team_f
;701:=================
;702: */
;703:void Cmd_Team_f(gentity_t *ent) {
line 705
;704:  pTeam_t team;
;705:  pTeam_t oldteam = ent->client->pers.teamSelection;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 708
;706:  char s[ MAX_TOKEN_CHARS ];
;707:  char buf[ MAX_STRING_CHARS ];
;708:  qboolean force = G_admin_permission(ent, ADMF_FORCETEAMCHANGE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 2068
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2056
ADDRLP4 2068
INDIRI4
ASGNI4
line 709
;709:  int aliens = level.numAlienClients;
ADDRLP4 2060
ADDRGP4 level+185096
INDIRI4
ASGNI4
line 710
;710:  int humans = level.numHumanClients;
ADDRLP4 2064
ADDRGP4 level+185100
INDIRI4
ASGNI4
line 713
;711:
;712:  // stop team join spam
;713:  if (level.time - ent->client->pers.teamChangeTime < 1000)
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $399
line 714
;714:    return;
ADDRGP4 $395
JUMPV
LABELV $399
line 716
;715:
;716:  if (oldteam == PTE_ALIENS)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $402
line 717
;717:    aliens--;
ADDRLP4 2060
ADDRLP4 2060
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $402
line 718
;718:  else if (oldteam == PTE_HUMANS)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $404
line 719
;719:    humans--;
ADDRLP4 2064
ADDRLP4 2064
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $404
LABELV $403
line 722
;720:
;721:  // do warm up
;722:  if (g_doWarmup.integer && g_warmupMode.integer == 1 &&
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $406
ADDRGP4 g_warmupMode+12
INDIRI4
CNSTI4 1
NEI4 $406
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_warmup+12
INDIRI4
MULI4
GEI4 $406
line 723
;723:          level.time - level.startTime < g_warmup.integer * 1000) {
line 724
;724:    trap_SendServerCommand(ent - g_entities, va("print \"team: you can't join"
ADDRGP4 $413
ARGP4
ADDRGP4 g_warmup+12
INDIRI4
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
SUBI4
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2072
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 727
;725:            " a team during warm up (%d seconds remaining)\n\"",
;726:            g_warmup.integer - (level.time - level.startTime) / 1000));
;727:    return;
ADDRGP4 $395
JUMPV
LABELV $406
line 730
;728:  }
;729:
;730:  if( ent->client->pers.forcespec == qtrue ){
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
CNSTI4 1
NEI4 $417
line 731
;731:  	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $395
line 732
;732:  	  	  {
line 733
;733:  	  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2072
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 735
;734:  	  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;735:  	  		  return;
ADDRGP4 $395
JUMPV
line 737
;736:  	  	  }
;737:  	  return;
LABELV $417
line 740
;738:    }
;739:
;740:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 742
;741:
;742:  if (!strlen(s)) {
ADDRLP4 8
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $421
line 743
;743:    trap_SendServerCommand(ent - g_entities, va("print \"team: %i\n\"",
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 745
;744:            oldteam));
;745:    return;
ADDRGP4 $395
JUMPV
LABELV $421
line 748
;746:  }
;747:
;748:  if (Q_stricmpn(s, "spec", 4)) {
ADDRLP4 8
ARGP4
ADDRGP4 $426
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 2076
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
EQI4 $424
line 749
;749:    if (G_admin_level(ent) < g_minLevelToJoinTeam.integer) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
ADDRGP4 g_minLevelToJoinTeam+12
INDIRI4
GEI4 $427
line 750
;750:      trap_SendServerCommand(ent - g_entities, "print \"Sorry, but your admin level is only permitted to spectate.\n\"");
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
ADDRGP4 $430
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 751
;751:      return;
ADDRGP4 $395
JUMPV
LABELV $427
line 753
;752:    }
;753:  }
LABELV $424
line 755
;754:
;755:  if (!Q_stricmpn(s, "spec", 4))
ADDRLP4 8
ARGP4
ADDRGP4 $426
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 2080
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $431
line 756
;756:    team = PTE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $432
JUMPV
LABELV $431
line 757
;757:  else if (!force && ent->client->pers.teamSelection == PTE_NONE &&
ADDRLP4 2084
CNSTI4 0
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 2084
INDIRI4
NEI4 $433
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 2084
INDIRI4
NEI4 $433
ADDRGP4 g_maxGameClients+12
INDIRI4
ADDRLP4 2084
INDIRI4
EQI4 $433
ADDRGP4 level+173948
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $433
line 759
;758:          g_maxGameClients.integer && level.numPlayingClients >=
;759:          g_maxGameClients.integer) {
line 760
;760:    trap_SendServerCommand(ent - g_entities, va("print \"The maximum number "
ADDRGP4 $438
ARGP4
ADDRGP4 g_maxGameClients+12
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 763
;761:            "of playing clients has been reached (g_maxGameClients = %i)\n\"",
;762:            g_maxGameClients.integer));
;763:    return;
ADDRGP4 $395
JUMPV
LABELV $433
line 764
;764:  } else if (!Q_stricmpn(s, "alien", 5)) {
ADDRLP4 8
ARGP4
ADDRGP4 $442
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 2088
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $440
line 765
;765:    if (g_forceAutoSelect.integer && !G_admin_permission(ent, ADMF_FORCETEAMCHANGE)) {
ADDRGP4 g_forceAutoSelect+12
INDIRI4
CNSTI4 0
EQI4 $443
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 2092
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $443
line 766
;766:      trap_SendServerCommand(ent - g_entities, "print \"You can only join teams using autoselect\n\"");
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
ADDRGP4 $446
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 767
;767:      return;
ADDRGP4 $395
JUMPV
LABELV $443
line 770
;768:    }
;769:
;770:    if (level.alienTeamLocked && !force) {
ADDRLP4 2096
CNSTI4 0
ASGNI4
ADDRGP4 level+189844
INDIRI4
ADDRLP4 2096
INDIRI4
EQI4 $447
ADDRLP4 2056
INDIRI4
ADDRLP4 2096
INDIRI4
NEI4 $447
line 771
;771:      trap_SendServerCommand(ent - g_entities,
ADDRGP4 $450
ARGP4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 773
;772:              va("print \"Alien team has been ^1LOCKED\n\""));
;773:      return;
ADDRGP4 $395
JUMPV
LABELV $447
line 774
;774:    } else if (level.humanTeamLocked) {
ADDRGP4 level+189848
INDIRI4
CNSTI4 0
EQI4 $451
line 777
;775:      // if only one team has been locked, let people join the other
;776:      // regardless of balance
;777:      force = qtrue;
ADDRLP4 2056
CNSTI4 1
ASGNI4
line 778
;778:    }
LABELV $451
line 780
;779:
;780:    if (!force && g_teamForceBalance.integer && aliens > humans) {
ADDRLP4 2100
CNSTI4 0
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 2100
INDIRI4
NEI4 $454
ADDRGP4 g_teamForceBalance+12
INDIRI4
ADDRLP4 2100
INDIRI4
EQI4 $454
ADDRLP4 2060
INDIRI4
ADDRLP4 2064
INDIRI4
LEI4 $454
line 781
;781:      G_TriggerMenu(ent - g_entities, MN_A_TEAMFULL);
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
CNSTI4 1
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 782
;782:      return;
ADDRGP4 $395
JUMPV
LABELV $454
line 786
;783:    }
;784:
;785:
;786:    team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 787
;787:  } else if (!Q_stricmpn(s, "human", 5)) {
ADDRGP4 $441
JUMPV
LABELV $440
ADDRLP4 8
ARGP4
ADDRGP4 $459
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 2092
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $457
line 788
;788:    if (g_forceAutoSelect.integer && !G_admin_permission(ent, ADMF_FORCETEAMCHANGE)) {
ADDRGP4 g_forceAutoSelect+12
INDIRI4
CNSTI4 0
EQI4 $460
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 2096
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $460
line 789
;789:      trap_SendServerCommand(ent - g_entities, "print \"You can only join teams using autoselect\n\"");
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
ADDRGP4 $446
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 790
;790:      return;
ADDRGP4 $395
JUMPV
LABELV $460
line 793
;791:    }
;792:
;793:    if (level.humanTeamLocked && !force) {
ADDRLP4 2100
CNSTI4 0
ASGNI4
ADDRGP4 level+189848
INDIRI4
ADDRLP4 2100
INDIRI4
EQI4 $463
ADDRLP4 2056
INDIRI4
ADDRLP4 2100
INDIRI4
NEI4 $463
line 794
;794:      trap_SendServerCommand(ent - g_entities,
ADDRGP4 $466
ARGP4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 796
;795:              va("print \"Human team has been ^1LOCKED\n\""));
;796:      return;
ADDRGP4 $395
JUMPV
LABELV $463
line 797
;797:    } else if (level.alienTeamLocked) {
ADDRGP4 level+189844
INDIRI4
CNSTI4 0
EQI4 $467
line 800
;798:      // if only one team has been locked, let people join the other
;799:      // regardless of balance
;800:      force = qtrue;
ADDRLP4 2056
CNSTI4 1
ASGNI4
line 801
;801:    }
LABELV $467
line 803
;802:
;803:    if (!force && g_teamForceBalance.integer && humans > aliens) {
ADDRLP4 2104
CNSTI4 0
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 2104
INDIRI4
NEI4 $470
ADDRGP4 g_teamForceBalance+12
INDIRI4
ADDRLP4 2104
INDIRI4
EQI4 $470
ADDRLP4 2064
INDIRI4
ADDRLP4 2060
INDIRI4
LEI4 $470
line 804
;804:      G_TriggerMenu(ent - g_entities, MN_H_TEAMFULL);
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
CNSTI4 2
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 805
;805:      return;
ADDRGP4 $395
JUMPV
LABELV $470
line 808
;806:    }
;807:
;808:    team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 809
;809:  } else if (!Q_stricmp(s, "auto")) {
ADDRGP4 $458
JUMPV
LABELV $457
ADDRLP4 8
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $473
line 810
;810:    if (level.humanTeamLocked && level.alienTeamLocked)
ADDRLP4 2100
CNSTI4 0
ASGNI4
ADDRGP4 level+189848
INDIRI4
ADDRLP4 2100
INDIRI4
EQI4 $476
ADDRGP4 level+189844
INDIRI4
ADDRLP4 2100
INDIRI4
EQI4 $476
line 811
;811:      team = PTE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $477
JUMPV
LABELV $476
line 812
;812:    else if (humans > aliens)
ADDRLP4 2064
INDIRI4
ADDRLP4 2060
INDIRI4
LEI4 $480
line 813
;813:      team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $480
line 814
;814:    else if (humans < aliens)
ADDRLP4 2064
INDIRI4
ADDRLP4 2060
INDIRI4
GEI4 $482
line 815
;815:      team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $483
JUMPV
LABELV $482
line 817
;816:    else
;817:      team = PTE_ALIENS + (rand() % 2);
ADDRLP4 2104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2104
INDIRI4
CNSTI4 2
MODI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $483
LABELV $481
LABELV $477
line 819
;818:
;819:    if (team == PTE_ALIENS && level.alienTeamLocked)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $484
ADDRGP4 level+189844
INDIRI4
CNSTI4 0
EQI4 $484
line 820
;820:      team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $484
line 821
;821:    else if (team == PTE_HUMANS && level.humanTeamLocked)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $474
ADDRGP4 level+189848
INDIRI4
CNSTI4 0
EQI4 $474
line 822
;822:      team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 823
;823:  } else {
ADDRGP4 $474
JUMPV
LABELV $473
line 824
;824:    trap_SendServerCommand(ent - g_entities, va("print \"Unknown team: %s\n\"", s));
ADDRGP4 $490
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 825
;825:    return;
ADDRGP4 $395
JUMPV
LABELV $474
LABELV $458
LABELV $441
LABELV $432
line 829
;826:  }
;827:
;828:  // stop team join spam
;829:  if (oldteam == team)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $491
line 830
;830:    return;
ADDRGP4 $395
JUMPV
LABELV $491
line 833
;831:
;832:  //guard against build timer exploit
;833:  if (oldteam != PTE_NONE && ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $493
ADDRLP4 2100
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2104
CNSTI4 1
ASGNI4
ADDRLP4 2100
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 2104
INDIRI4
EQI4 $493
ADDRLP4 2108
ADDRLP4 2100
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2108
INDIRI4
ADDRLP4 2104
INDIRI4
EQI4 $497
ADDRLP4 2108
INDIRI4
CNSTI4 2
EQI4 $497
CNSTI4 21
ARGI4
ADDRLP4 2100
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2112
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $497
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
ADDRLP4 2116
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
EQI4 $493
LABELV $497
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $493
line 838
;834:          (ent->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_BUILDER0 ||
;835:          ent->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_BUILDER0_UPG ||
;836:          BG_InventoryContainsWeapon(WP_HBUILD, ent->client->ps.stats) ||
;837:          BG_InventoryContainsWeapon(WP_HBUILD2, ent->client->ps.stats)) &&
;838:          ent->client->ps.stats[ STAT_MISC ] > 0) {
line 839
;839:    trap_SendServerCommand(ent - g_entities,
ADDRGP4 $498
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 841
;840:            va("print \"You cannot change teams until build timer expires\n\""));
;841:    return;
ADDRGP4 $395
JUMPV
LABELV $493
line 844
;842:  }
;843:
;844:  if (team != PTE_NONE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $499
line 847
;845:    char namebuff[32];
;846:
;847:    Q_strncpyz(namebuff, ent->client->pers.netname, sizeof (namebuff));
ADDRLP4 2120
ARGP4
ADDRLP4 2152
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2152
INDIRI4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 848
;848:    Q_CleanStr(namebuff);
ADDRLP4 2120
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 850
;849:
;850:    if (!namebuff[0] || !Q_stricmp(namebuff, "UnnamedPlayer")) {
ADDRLP4 2120
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $504
ADDRLP4 2120
ARGP4
ADDRGP4 $503
ARGP4
ADDRLP4 2156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 0
NEI4 $501
LABELV $504
line 851
;851:      trap_SendServerCommand(ent - g_entities, va("print \"Please set your player name before joining a team. Press ESC and use the Options / Game menu  or use /name in the console\n\""));
ADDRGP4 $505
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 852
;852:      return;
ADDRGP4 $395
JUMPV
LABELV $501
line 854
;853:    }
;854:  }
LABELV $499
line 857
;855:
;856:
;857:  G_ChangeTeam(ent, team);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 861
;858:
;859:
;860:
;861:  if (team == PTE_ALIENS) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $506
line 862
;862:    if (oldteam == PTE_HUMANS)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $508
line 863
;863:      Com_sprintf(buf, sizeof ( buf), "%s^7 abandoned Humans and joined the Zombies.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $510
ARGP4
ADDRLP4 2120
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $507
JUMPV
LABELV $508
line 865
;864:    else
;865:      Com_sprintf(buf, sizeof ( buf), "%s^7 joined the Zombies.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $511
ARGP4
ADDRLP4 2124
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 866
;866:  } else if (team == PTE_HUMANS) {
ADDRGP4 $507
JUMPV
LABELV $506
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $512
line 867
;867:    if (oldteam == PTE_ALIENS)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $514
line 868
;868:      Com_sprintf(buf, sizeof ( buf), "%s^7 abandoned the Zombies and joined the Humans.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $516
ARGP4
ADDRLP4 2120
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $513
JUMPV
LABELV $514
line 870
;869:    else
;870:      Com_sprintf(buf, sizeof ( buf), "%s^7 joined the Humans.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $517
ARGP4
ADDRLP4 2124
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 871
;871:  } else if (team == PTE_NONE) {
ADDRGP4 $513
JUMPV
LABELV $512
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $518
line 872
;872:    if (oldteam == PTE_HUMANS)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $520
line 873
;873:      Com_sprintf(buf, sizeof ( buf), "%s^7 left the Humans.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $522
ARGP4
ADDRLP4 2120
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2120
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $521
JUMPV
LABELV $520
line 875
;874:    else
;875:      Com_sprintf(buf, sizeof ( buf), "%s^7 left the Zombies.", ent->client->pers.netname);
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $523
ARGP4
ADDRLP4 2124
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $521
line 876
;876:  }
LABELV $518
LABELV $513
LABELV $507
line 877
;877:  trap_SendServerCommand(-1, va("print \"%s\n\"", buf));
ADDRGP4 $524
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 878
;878:  G_LogOnlyPrintf("ClientTeam: %s\n", buf);
ADDRGP4 $525
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 879
;879:}
LABELV $395
endproc Cmd_Team_f 2164 16
proc G_SayTo 44 32
line 886
;880:
;881:/*
;882:==================
;883:G_Say
;884:==================
;885: */
;886:static void G_SayTo(gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message, const char *prefix) {
line 887
;887:  qboolean ignore = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 888
;888:  qboolean specAllChat = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 890
;889:
;890:  if (!other)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $527
line 891
;891:    return;
ADDRGP4 $526
JUMPV
LABELV $527
line 893
;892:
;893:  if (!other->inuse)
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $529
line 894
;894:    return;
ADDRGP4 $526
JUMPV
LABELV $529
line 896
;895:
;896:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $531
line 897
;897:    return;
ADDRGP4 $526
JUMPV
LABELV $531
line 899
;898:
;899:  if (other->client->pers.connected != CON_CONNECTED)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $533
line 900
;900:    return;
ADDRGP4 $526
JUMPV
LABELV $533
line 902
;901:
;902:  if ((mode == SAY_TEAM || mode == SAY_ACTION_T) && !OnSameTeam(ent, other)) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $537
ADDRLP4 8
INDIRI4
CNSTI4 4
NEI4 $535
LABELV $537
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $535
line 903
;903:    if (other->client->pers.teamSelection != PTE_NONE)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $538
line 904
;904:      return;
ADDRGP4 $526
JUMPV
LABELV $538
line 906
;905:
;906:    if (other->biteam != ent->biteam)
ADDRLP4 16
CNSTI4 956
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
EQI4 $540
line 907
;907:      return;
ADDRGP4 $526
JUMPV
LABELV $540
line 909
;908:
;909:    specAllChat = G_admin_permission(other, ADMF_SPEC_ALLCHAT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 20
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 910
;910:    if (!specAllChat)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $543
line 911
;911:      return;
ADDRGP4 $526
JUMPV
LABELV $543
line 914
;912:
;913:    // specs with ADMF_SPEC_ALLCHAT flag can see team chat
;914:  }
LABELV $535
line 916
;915:
;916:  if (mode == SAY_ADMINS && !G_admin_permission(other, ADMF_ADMINCHAT))
ADDRFP4 8
INDIRI4
CNSTI4 5
NEI4 $545
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 16
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $545
line 917
;917:    return;
ADDRGP4 $526
JUMPV
LABELV $545
line 919
;918:
;919:  if (BG_ClientListTest(&other->client->sess.ignoreList, ent - g_entities))
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
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
ADDRLP4 20
ADDRGP4 BG_ClientListTest
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $548
line 920
;920:    ignore = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $548
line 922
;921:
;922:  trap_SendServerCommand(other - g_entities, va("%s \"%s%s%s%c%c%s\"",
ADDRGP4 $550
ARGP4
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $560
ADDRLP4 36
INDIRI4
CNSTI4 4
NEI4 $558
LABELV $560
ADDRLP4 24
ADDRGP4 $551
ASGNP4
ADDRGP4 $559
JUMPV
LABELV $558
ADDRLP4 24
ADDRGP4 $552
ASGNP4
LABELV $559
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $561
ADDRLP4 28
ADDRGP4 $554
ASGNP4
ADDRGP4 $562
JUMPV
LABELV $561
ADDRLP4 28
ADDRGP4 $555
ASGNP4
LABELV $562
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $563
ADDRLP4 32
ADDRFP4 24
INDIRP4
ASGNP4
ADDRGP4 $564
JUMPV
LABELV $563
ADDRLP4 32
ADDRGP4 $555
ASGNP4
LABELV $564
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 927
;923:          (mode == SAY_TEAM || mode == SAY_ACTION_T) ? "tchat" : "chat",
;924:          (ignore) ? "[skipnotify]" : "",
;925:          (specAllChat) ? prefix : "",
;926:          name, Q_COLOR_ESCAPE, color, message));
;927:}
LABELV $526
endproc G_SayTo 44 32
export G_Say
proc G_Say 400 32
line 931
;928:
;929:#define EC    "\x19"
;930:
;931:void G_Say(gentity_t *ent, gentity_t *target, int mode, const char *chatText) {
line 942
;932:  int j;
;933:  gentity_t *other;
;934:  int color;
;935:  const char *prefix;
;936:  char name[ 64 ];
;937:  // don't let text be too long for malicious reasons
;938:  char text[ MAX_SAY_TEXT ];
;939:  char location[ 64 ];
;940:
;941:  // Bail if the text is blank.
;942:  if (!chatText[0])
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $566
line 943
;943:    return;
ADDRGP4 $565
JUMPV
LABELV $566
line 946
;944:
;945:  // Flood limit.  If they're talking too fast, determine that and return.
;946:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $568
line 947
;947:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $571
line 948
;948:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $573
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 949
;949:      return;
ADDRGP4 $565
JUMPV
LABELV $571
LABELV $568
line 952
;950:    }
;951:
;952:  if (g_chatTeamPrefix.integer && ent && ent->client) {
ADDRGP4 g_chatTeamPrefix+12
INDIRI4
CNSTI4 0
EQI4 $574
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
CNSTU4 0
ASGNU4
ADDRLP4 300
INDIRP4
CVPU4 4
ADDRLP4 304
INDIRU4
EQU4 $574
ADDRLP4 300
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 304
INDIRU4
EQU4 $574
line 953
;953:    switch (ent->client->pers.teamSelection) {
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $580
ADDRLP4 308
INDIRI4
CNSTI4 1
EQI4 $582
ADDRLP4 308
INDIRI4
CNSTI4 2
EQI4 $584
ADDRGP4 $577
JUMPV
LABELV $577
LABELV $580
line 956
;954:      default:
;955:      case PTE_NONE:
;956:        prefix = "[S] ";
ADDRLP4 224
ADDRGP4 $581
ASGNP4
line 957
;957:        break;
ADDRGP4 $575
JUMPV
LABELV $582
line 960
;958:
;959:      case PTE_ALIENS:
;960:        prefix = "[A] ";
ADDRLP4 224
ADDRGP4 $583
ASGNP4
line 961
;961:        break;
ADDRGP4 $575
JUMPV
LABELV $584
line 964
;962:
;963:      case PTE_HUMANS:
;964:        prefix = "[H] ";
ADDRLP4 224
ADDRGP4 $585
ASGNP4
line 965
;965:    }
line 966
;966:  } else
ADDRGP4 $575
JUMPV
LABELV $574
line 967
;967:    prefix = "";
ADDRLP4 224
ADDRGP4 $555
ASGNP4
LABELV $575
line 969
;968:
;969:  switch (mode) {
ADDRLP4 308
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
LTI4 $586
ADDRLP4 308
INDIRI4
CNSTI4 5
GTI4 $586
ADDRLP4 308
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $630
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $630
address $588
address $591
address $599
address $604
address $608
address $616
code
LABELV $586
LABELV $588
line 972
;970:    default:
;971:    case SAY_ALL:
;972:      G_LogPrintf("say: %s^7: %s^7\n", ent->client->pers.netname, chatText);
ADDRGP4 $589
ARGP4
ADDRLP4 312
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 973
;973:      Com_sprintf(name, sizeof ( name), "%s%s%c%c"EC": ", prefix,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $590
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 316
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 316
INDIRI4
ADDP4
INDIRP4
ADDRLP4 316
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 975
;974:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;975:      color = COLOR_GREEN;
ADDRLP4 228
CNSTI4 50
ASGNI4
line 976
;976:      break;
ADDRGP4 $587
JUMPV
LABELV $591
line 979
;977:
;978:    case SAY_TEAM:
;979:      G_LogPrintf("sayteam: %s%s^7: %s^7\n", prefix, ent->client->pers.netname, chatText);
ADDRGP4 $592
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 320
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 980
;980:      if (Team_GetLocationMsg(ent, location, sizeof ( location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 324
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $593
line 981
;981:        Com_sprintf(name, sizeof ( name), EC"(%s%c%c"EC") (%s)"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $595
ARGP4
ADDRLP4 328
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 328
INDIRI4
ADDP4
INDIRP4
ADDRLP4 328
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 232
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $594
JUMPV
LABELV $593
line 984
;982:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;983:      else
;984:        Com_sprintf(name, sizeof ( name), EC"(%s%c%c"EC")"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $596
ARGP4
ADDRLP4 332
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 332
INDIRI4
ADDP4
INDIRP4
ADDRLP4 332
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $594
line 987
;985:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;986:
;987:      if (ent->client->pers.teamSelection == PTE_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $597
line 988
;988:        color = COLOR_YELLOW;
ADDRLP4 228
CNSTI4 51
ASGNI4
ADDRGP4 $587
JUMPV
LABELV $597
line 990
;989:      else
;990:        color = COLOR_CYAN;
ADDRLP4 228
CNSTI4 53
ASGNI4
line 991
;991:      break;
ADDRGP4 $587
JUMPV
LABELV $599
line 994
;992:
;993:    case SAY_TELL:
;994:      if (target && OnSameTeam(target, ent) &&
ADDRLP4 336
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $600
ADDRLP4 336
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $600
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 344
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $600
line 996
;995:              Team_GetLocationMsg(ent, location, sizeof ( location)))
;996:        Com_sprintf(name, sizeof ( name), EC"[%s%c%c"EC"] (%s)"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $602
ARGP4
ADDRLP4 348
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 348
INDIRI4
ADDP4
INDIRP4
ADDRLP4 348
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 232
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $601
JUMPV
LABELV $600
line 999
;997:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;998:      else
;999:        Com_sprintf(name, sizeof ( name), EC"[%s%c%c"EC"]"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $603
ARGP4
ADDRLP4 352
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 352
INDIRI4
ADDP4
INDIRP4
ADDRLP4 352
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $601
line 1001
;1000:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;1001:      color = COLOR_MAGENTA;
ADDRLP4 228
CNSTI4 54
ASGNI4
line 1002
;1002:      break;
ADDRGP4 $587
JUMPV
LABELV $604
line 1005
;1003:
;1004:    case SAY_ACTION:
;1005:      G_LogPrintf("action: %s^7: %s^7\n", ent->client->pers.netname, chatText);
ADDRGP4 $605
ARGP4
ADDRLP4 356
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 356
INDIRI4
ADDP4
INDIRP4
ADDRLP4 356
INDIRI4
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1006
;1006:      Com_sprintf(name, sizeof ( name), "^2%s^7%s%s%c%c"EC" ", g_actionPrefix.string, prefix,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $606
ARGP4
ADDRGP4 g_actionPrefix+16
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 360
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 360
INDIRI4
ADDP4
INDIRP4
ADDRLP4 360
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1008
;1007:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;1008:      color = COLOR_WHITE;
ADDRLP4 228
CNSTI4 55
ASGNI4
line 1009
;1009:      break;
ADDRGP4 $587
JUMPV
LABELV $608
line 1012
;1010:
;1011:    case SAY_ACTION_T:
;1012:      G_LogPrintf("actionteam: %s%s^7: %s^7\n", prefix, ent->client->pers.netname, chatText);
ADDRGP4 $609
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 364
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 364
INDIRI4
ADDP4
INDIRP4
ADDRLP4 364
INDIRI4
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1013
;1013:      if (Team_GetLocationMsg(ent, location, sizeof ( location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 368
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $610
line 1014
;1014:        Com_sprintf(name, sizeof ( name), EC"^5%s^7%s%c%c"EC"(%s)"EC" ", g_actionPrefix.string,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $612
ARGP4
ADDRGP4 g_actionPrefix+16
ARGP4
ADDRLP4 372
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 372
INDIRI4
ADDP4
INDIRP4
ADDRLP4 372
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 232
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $611
JUMPV
LABELV $610
line 1017
;1015:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1016:      else
;1017:        Com_sprintf(name, sizeof ( name), EC"^5%s^7%s%c%c"EC""EC" ", g_actionPrefix.string,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $614
ARGP4
ADDRGP4 g_actionPrefix+16
ARGP4
ADDRLP4 376
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 376
INDIRI4
ADDP4
INDIRP4
ADDRLP4 376
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $611
line 1019
;1018:              ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;1019:      color = COLOR_WHITE;
ADDRLP4 228
CNSTI4 55
ASGNI4
line 1020
;1020:      break;
ADDRGP4 $587
JUMPV
LABELV $616
line 1023
;1021:
;1022:    case SAY_ADMINS:
;1023:      if (G_admin_permission(ent, ADMF_ADMINCHAT)) //Differentiate between inter-admin chatter and user-admin alerts
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 380
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $617
line 1024
;1024:      {
line 1025
;1025:        G_LogPrintf("say_admins: [ADMIN]%s^7: %s^7\n", (ent) ? ent->client->pers.netname : "console", chatText);
ADDRGP4 $619
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
ADDRLP4 388
CNSTI4 516
ASGNI4
ADDRLP4 384
ADDRFP4 0
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $623
JUMPV
LABELV $622
ADDRLP4 384
ADDRGP4 $620
ASGNP4
LABELV $623
ADDRLP4 384
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1026
;1026:        Com_sprintf(name, sizeof ( name), "%s[ADMIN]%s%c%c"EC": ", prefix,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $624
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $626
ADDRLP4 396
CNSTI4 516
ASGNI4
ADDRLP4 392
ADDRFP4 0
INDIRP4
ADDRLP4 396
INDIRI4
ADDP4
INDIRP4
ADDRLP4 396
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $627
JUMPV
LABELV $626
ADDRLP4 392
ADDRGP4 $620
ASGNP4
LABELV $627
ADDRLP4 392
INDIRP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1028
;1027:                (ent) ? ent->client->pers.netname : "console", Q_COLOR_ESCAPE, COLOR_WHITE);
;1028:        color = COLOR_MAGENTA;
ADDRLP4 228
CNSTI4 54
ASGNI4
line 1029
;1029:      } else {
ADDRGP4 $587
JUMPV
LABELV $617
line 1030
;1030:        G_LogPrintf("say_admins: [PLAYER]%s^7: %s^7\n", ent->client->pers.netname, chatText);
ADDRGP4 $628
ARGP4
ADDRLP4 384
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 384
INDIRI4
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1031
;1031:        Com_sprintf(name, sizeof ( name), "%s[PLAYER]%s%c%c"EC": ", prefix,
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $629
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 388
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1033
;1032:                ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;1033:        color = COLOR_MAGENTA;
ADDRLP4 228
CNSTI4 54
ASGNI4
line 1034
;1034:      }
line 1035
;1035:      break;
LABELV $587
line 1038
;1036:  }
;1037:
;1038:  if (mode != SAY_TEAM && ent && ent->client && ent->client->pers.teamSelection == PTE_NONE && G_admin_level(ent) < g_minLevelToSpecMM1.integer) {
ADDRFP4 8
INDIRI4
CNSTI4 1
EQI4 $631
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
CNSTU4 0
ASGNU4
ADDRLP4 312
INDIRP4
CVPU4 4
ADDRLP4 316
INDIRU4
EQU4 $631
ADDRLP4 320
ADDRLP4 312
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CVPU4 4
ADDRLP4 316
INDIRU4
EQU4 $631
ADDRLP4 320
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $631
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
ADDRGP4 g_minLevelToSpecMM1+12
INDIRI4
GEI4 $631
line 1039
;1039:    trap_SendServerCommand(ent - g_entities, va("print \"Sorry, but your admin level may only use teamchat while spectating.\n\""));
ADDRGP4 $634
ARGP4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 328
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1040
;1040:    return;
ADDRGP4 $565
JUMPV
LABELV $631
line 1043
;1041:  }
;1042:
;1043:  Com_sprintf(text, sizeof ( text), "%s^7", chatText);
ADDRLP4 8
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 $635
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1045
;1044:
;1045:  if (target) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $636
line 1046
;1046:    G_SayTo(ent, target, mode, color, name, text, prefix);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1047
;1047:    return;
ADDRGP4 $565
JUMPV
LABELV $636
line 1053
;1048:  }
;1049:
;1050:
;1051:
;1052:  // Ugly hax: if adminsayfilter is off, do the SAY first to prevent text from going out of order
;1053:  if (!g_adminSayFilter.integer) {
ADDRGP4 g_adminSayFilter+12
INDIRI4
CNSTI4 0
NEI4 $638
line 1055
;1054:    // send it to all the apropriate clients
;1055:    for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $641
line 1056
;1056:      other = &g_entities[ j ];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1057
;1057:      G_SayTo(ent, other, mode, color, name, text, prefix);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1058
;1058:    }
LABELV $642
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $644
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $641
line 1059
;1059:  }
LABELV $638
line 1061
;1060:
;1061:  if (g_adminParseSay.integer && (mode == SAY_ALL || mode == SAY_TEAM)) {
ADDRLP4 328
CNSTI4 0
ASGNI4
ADDRGP4 g_adminParseSay+12
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $646
ADDRLP4 332
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $649
ADDRLP4 332
INDIRI4
CNSTI4 1
NEI4 $646
LABELV $649
line 1062
;1062:    if (G_admin_cmd_check(ent, qtrue) && g_adminSayFilter.integer) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 340
CNSTI4 0
ASGNI4
ADDRLP4 336
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $650
ADDRGP4 g_adminSayFilter+12
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $650
line 1063
;1063:      return;
ADDRGP4 $565
JUMPV
LABELV $650
line 1065
;1064:    }
;1065:  }
LABELV $646
line 1068
;1066:
;1067:  // if it's on, do it here, where it won't happen if it was an admin command
;1068:  if (g_adminSayFilter.integer) {
ADDRGP4 g_adminSayFilter+12
INDIRI4
CNSTI4 0
EQI4 $653
line 1070
;1069:    // send it to all the apropriate clients
;1070:    for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $659
JUMPV
LABELV $656
line 1071
;1071:      other = &g_entities[ j ];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1072
;1072:      G_SayTo(ent, other, mode, color, name, text, prefix);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1073
;1073:    }
LABELV $657
line 1070
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $659
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $656
line 1074
;1074:  }
LABELV $653
line 1077
;1075:
;1076:
;1077:}
LABELV $565
endproc G_Say 400 32
lit
align 4
LABELV $662
byte 4 1148846080
byte 4 1148846080
byte 4 1148846080
code
proc Cmd_SayArea_f 4252 28
line 1079
;1078:
;1079:static void Cmd_SayArea_f(gentity_t *ent) {
line 1082
;1080:  int entityList[ MAX_GENTITIES ];
;1081:  int num, i;
;1082:  int color = COLOR_BLUE;
ADDRLP4 76
CNSTI4 52
ASGNI4
line 1084
;1083:  const char *prefix;
;1084:  vec3_t range = {HELMET_RANGE, HELMET_RANGE, HELMET_RANGE};
ADDRLP4 4180
ADDRGP4 $662
INDIRB
ASGNB 12
line 1086
;1085:  vec3_t mins, maxs;
;1086:  char *msg = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 4216
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4216
INDIRP4
ASGNP4
line 1089
;1087:  char name[ 64 ];
;1088:
;1089:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $663
line 1090
;1090:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 4220
INDIRI4
CNSTI4 0
EQI4 $666
line 1091
;1091:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $573
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1092
;1092:      return;
ADDRGP4 $661
JUMPV
LABELV $666
LABELV $663
line 1095
;1093:    }
;1094:
;1095:  if (g_chatTeamPrefix.integer) {
ADDRGP4 g_chatTeamPrefix+12
INDIRI4
CNSTI4 0
EQI4 $668
line 1096
;1096:    switch (ent->client->pers.teamSelection) {
ADDRLP4 4224
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4224
INDIRI4
CNSTI4 0
EQI4 $674
ADDRLP4 4224
INDIRI4
CNSTI4 1
EQI4 $675
ADDRLP4 4224
INDIRI4
CNSTI4 2
EQI4 $676
ADDRGP4 $671
JUMPV
LABELV $671
LABELV $674
line 1099
;1097:      default:
;1098:      case PTE_NONE:
;1099:        prefix = "[S] ";
ADDRLP4 72
ADDRGP4 $581
ASGNP4
line 1100
;1100:        break;
ADDRGP4 $669
JUMPV
LABELV $675
line 1103
;1101:
;1102:      case PTE_ALIENS:
;1103:        prefix = "[A] ";
ADDRLP4 72
ADDRGP4 $583
ASGNP4
line 1104
;1104:        break;
ADDRGP4 $669
JUMPV
LABELV $676
line 1107
;1105:
;1106:      case PTE_HUMANS:
;1107:        prefix = "[H] ";
ADDRLP4 72
ADDRGP4 $585
ASGNP4
line 1108
;1108:    }
line 1109
;1109:  } else
ADDRGP4 $669
JUMPV
LABELV $668
line 1110
;1110:    prefix = "";
ADDRLP4 72
ADDRGP4 $555
ASGNP4
LABELV $669
line 1112
;1111:
;1112:  G_LogPrintf("sayarea: %s%s^7: %s\n", prefix, ent->client->pers.netname, msg);
ADDRGP4 $677
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4224
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1113
;1113:  Com_sprintf(name, sizeof ( name), EC"<%s%c%c"EC"> ",
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $678
ARGP4
ADDRLP4 4228
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4228
INDIRI4
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1116
;1114:          ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
;1115:
;1116:  VectorAdd(ent->s.origin, range, maxs);
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4204
ADDRLP4 4232
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4180
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4204+4
ADDRLP4 4232
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4180+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4204+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4180+8
INDIRF4
ADDF4
ASGNF4
line 1117
;1117:  VectorSubtract(ent->s.origin, range, mins);
ADDRLP4 4236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4192
ADDRLP4 4236
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4180
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4192+4
ADDRLP4 4236
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 4180+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4192+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 4180+8
INDIRF4
SUBF4
ASGNF4
line 1119
;1118:
;1119:  num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4192
ARGP4
ADDRLP4 4204
ARGP4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4240
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4176
ADDRLP4 4240
INDIRI4
ASGNI4
line 1120
;1120:  for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $690
JUMPV
LABELV $687
line 1121
;1121:    G_SayTo(ent, &g_entities[ entityList[ i ] ], SAY_TEAM, color, name, msg, prefix);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 80
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
LABELV $688
line 1120
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $690
ADDRLP4 0
INDIRI4
ADDRLP4 4176
INDIRI4
LTI4 $687
line 1124
;1122:
;1123:  //Send to ADMF_SPEC_ALLCHAT candidates
;1124:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $694
JUMPV
LABELV $691
line 1125
;1125:    if ((&g_entities[ i ])->client->pers.teamSelection == PTE_NONE &&
ADDRLP4 4244
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4244
INDIRI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $696
ADDRLP4 4244
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 4248
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4248
INDIRI4
CNSTI4 0
EQI4 $696
line 1126
;1126:            G_admin_permission(&g_entities[ i ], ADMF_SPEC_ALLCHAT)) {
line 1127
;1127:      G_SayTo(ent, &g_entities[ i ], SAY_TEAM, color, name, msg, prefix);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1128
;1128:    }
LABELV $696
line 1129
;1129:  }
LABELV $692
line 1124
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $694
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $691
line 1130
;1130:}
LABELV $661
endproc Cmd_SayArea_f 4252 28
proc Cmd_Say_f 104 16
line 1137
;1131:
;1132:/*
;1133:==================
;1134:Cmd_Say_f
;1135:==================
;1136: */
;1137:static void Cmd_Say_f(gentity_t *ent) {
line 1140
;1138:  char *p;
;1139:  char *args;
;1140:  int mode = SAY_ALL;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1141
;1141:  int skipargs = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1143
;1142:
;1143:  args = G_SayConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1144
;1144:  if (Q_stricmpn(args, "say_team ", 9) == 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $702
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 20
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $700
line 1145
;1145:    mode = SAY_TEAM;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $700
line 1146
;1146:  if (Q_stricmpn(args, "say_admins ", 11) == 0 || Q_stricmpn(args, "a ", 2) == 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $707
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $706
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $703
LABELV $707
line 1147
;1147:    mode = SAY_ADMINS;
ADDRLP4 4
CNSTI4 5
ASGNI4
LABELV $703
line 1151
;1148:
;1149:  // support parsing /m out of say text since some people have a hard
;1150:  // time figuring out what the console is.
;1151:  if (!Q_stricmpn(args, "say /m ", 7) ||
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $710
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 32
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $716
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $711
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 36
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $716
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $712
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 40
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $716
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $713
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 44
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $708
LABELV $716
line 1154
;1152:          !Q_stricmpn(args, "say_team /m ", 12) ||
;1153:          !Q_stricmpn(args, "say /mt ", 8) ||
;1154:          !Q_stricmpn(args, "say_team /mt ", 13)) {
line 1155
;1155:    G_PrivateMessage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_PrivateMessage
CALLV
pop
line 1156
;1156:    return;
ADDRGP4 $699
JUMPV
LABELV $708
line 1160
;1157:  }
;1158:
;1159:
;1160:  if (!Q_stricmpn(args, "say /a ", 7) ||
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $719
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 48
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $725
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $720
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 52
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $725
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 56
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $725
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $722
ARGP4
CNSTI4 21
ARGI4
ADDRLP4 60
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $717
LABELV $725
line 1163
;1161:          !Q_stricmpn(args, "say_team /a ", 12) ||
;1162:          !Q_stricmpn(args, "say /say_admins ", 16) ||
;1163:          !Q_stricmpn(args, "say_team /say_admins ", 21)) {
line 1164
;1164:    mode = SAY_ADMINS;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 1165
;1165:    skipargs = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1166
;1166:  }
LABELV $717
line 1168
;1167:
;1168:  if (mode == SAY_ADMINS)
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $726
line 1169
;1169:    if (!G_admin_permission(ent, ADMF_ADMINCHAT)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 64
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $728
line 1170
;1170:      if (!g_publicSayadmins.integer) {
ADDRGP4 g_publicSayadmins+12
INDIRI4
CNSTI4 0
NEI4 $730
line 1171
;1171:        ADMP("Sorry, but public use of say_admins has been disabled.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $733
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1172
;1172:        return;
ADDRGP4 $699
JUMPV
LABELV $730
line 1173
;1173:      } else {
line 1174
;1174:        ADMP("Your message has been sent to any available admins and to the server logs.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $734
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1175
;1175:      }
line 1176
;1176:    }
LABELV $728
LABELV $726
line 1179
;1177:
;1178:
;1179:  if (!Q_stricmpn(args, "say /me ", 8)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $737
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 68
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $735
line 1180
;1180:    if (g_actionPrefix.string[0]) {
ADDRGP4 g_actionPrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $699
line 1181
;1181:      mode = SAY_ACTION;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1182
;1182:      skipargs = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1183
;1183:    } else return;
line 1184
;1184:  } else if (!Q_stricmpn(args, "say_team /me ", 13)) {
ADDRGP4 $736
JUMPV
LABELV $735
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $743
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 72
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $741
line 1185
;1185:    if (g_actionPrefix.string[0]) {
ADDRGP4 g_actionPrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $699
line 1186
;1186:      mode = SAY_ACTION_T;
ADDRLP4 4
CNSTI4 4
ASGNI4
line 1187
;1187:      skipargs = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1188
;1188:    } else return;
line 1189
;1189:  } else if (!Q_stricmpn(args, "me ", 3)) {
ADDRGP4 $742
JUMPV
LABELV $741
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $749
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 76
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $747
line 1190
;1190:    if (g_actionPrefix.string[0]) {
ADDRGP4 g_actionPrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $699
line 1191
;1191:      mode = SAY_ACTION;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1192
;1192:    } else return;
line 1193
;1193:  } else if (!Q_stricmpn(args, "me_team ", 8)) {
ADDRGP4 $748
JUMPV
LABELV $747
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $755
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 80
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $753
line 1194
;1194:    if (g_actionPrefix.string[0]) {
ADDRGP4 g_actionPrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $699
line 1195
;1195:      mode = SAY_ACTION_T;
ADDRLP4 4
CNSTI4 4
ASGNI4
line 1196
;1196:    } else return;
LABELV $757
line 1197
;1197:  }
LABELV $753
LABELV $748
LABELV $742
LABELV $736
line 1200
;1198:
;1199:
;1200:  if (g_allowShare.integer) {
ADDRGP4 g_allowShare+12
INDIRI4
CNSTI4 0
EQI4 $759
line 1201
;1201:    args = G_SayConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 84
INDIRP4
ASGNP4
line 1202
;1202:    if (!Q_stricmpn(args, "say /share", 10) ||
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $764
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 88
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $766
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $765
ARGP4
CNSTI4 15
ARGI4
ADDRLP4 92
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $762
LABELV $766
line 1203
;1203:            !Q_stricmpn(args, "say_team /share", 15)) {
line 1204
;1204:      Cmd_Share_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Share_f
CALLV
pop
line 1205
;1205:      return;
ADDRGP4 $699
JUMPV
LABELV $762
line 1207
;1206:    }
;1207:    if (!Q_stricmpn(args, "say /donate", 11) ||
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $769
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 96
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $771
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $770
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 100
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $767
LABELV $771
line 1208
;1208:            !Q_stricmpn(args, "say_team /donate", 16)) {
line 1209
;1209:      Cmd_Donate_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Donate_f
CALLV
pop
line 1210
;1210:      return;
ADDRGP4 $699
JUMPV
LABELV $767
line 1212
;1211:    }
;1212:  }
LABELV $759
line 1215
;1213:
;1214:
;1215:  if (trap_Argc() < 2)
ADDRLP4 84
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
GEI4 $772
line 1216
;1216:    return;
ADDRGP4 $699
JUMPV
LABELV $772
line 1218
;1217:
;1218:  p = G_SayConcatArgs(1 + skipargs);
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 88
INDIRP4
ASGNP4
line 1220
;1219:
;1220:  G_Say(ent, NULL, mode, p);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1221
;1221:}
LABELV $699
endproc Cmd_Say_f 104 16
proc Cmd_Tell_f 1068 16
line 1228
;1222:
;1223:/*
;1224:==================
;1225:Cmd_Tell_f
;1226:==================
;1227: */
;1228:static void Cmd_Tell_f(gentity_t *ent) {
line 1234
;1229:  int targetNum;
;1230:  gentity_t *target;
;1231:  char *p;
;1232:  char arg[MAX_TOKEN_CHARS];
;1233:
;1234:  if (trap_Argc() < 2)
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $775
line 1235
;1235:    return;
ADDRGP4 $774
JUMPV
LABELV $775
line 1237
;1236:
;1237:  trap_Argv(1, arg, sizeof ( arg));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1238
;1238:  targetNum = atoi(arg);
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1240
;1239:
;1240:  if (targetNum < 0 || targetNum >= level.maxclients)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $780
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $777
LABELV $780
line 1241
;1241:    return;
ADDRGP4 $774
JUMPV
LABELV $777
line 1243
;1242:
;1243:  target = &g_entities[ targetNum ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1244
;1244:  if (!target || !target->inuse || !target->client)
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $784
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $784
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $781
LABELV $784
line 1245
;1245:    return;
ADDRGP4 $774
JUMPV
LABELV $781
line 1247
;1246:
;1247:  p = ConcatArgs(2);
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1249
;1248:
;1249:  G_LogPrintf("tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p);
ADDRGP4 $785
ARGP4
ADDRLP4 1060
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1250
;1250:  G_Say(ent, target, SAY_TELL, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1253
;1251:  // don't tell to the player self if it was already directed to this player
;1252:  // also don't send the chat back to a bot
;1253:  if (ent != target)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $786
line 1254
;1254:    G_Say(ent, ent, SAY_TELL, p);
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
LABELV $786
line 1255
;1255:}
LABELV $774
endproc Cmd_Tell_f 1068 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1262
;1256:
;1257:/*
;1258:==================
;1259:Cmd_Where_f
;1260:==================
;1261: */
;1262:void Cmd_Where_f(gentity_t *ent) {
line 1263
;1263:  trap_SendServerCommand(ent - g_entities, va("print \"%s\n\"", vtos(ent->s.origin)));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $524
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1264
;1264:}
LABELV $788
endproc Cmd_Where_f 8 8
lit
align 1
LABELV $790
byte 1 0
align 1
LABELV $791
byte 1 0
skip 31
align 1
LABELV $792
byte 1 0
skip 1023
align 4
LABELV $873
byte 4 -1
skip 252
align 1
LABELV $874
byte 1 0
skip 1023
align 1
LABELV $897
byte 1 0
skip 1023
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 6604 32
line 1271
;1265:
;1266:/*
;1267:==================
;1268:Cmd_CallVote_f
;1269:==================
;1270: */
;1271:void Cmd_CallVote_f(gentity_t *ent) {
line 1275
;1272:  int i;
;1273:  char arg1[ MAX_STRING_TOKENS ];
;1274:  char arg2[ MAX_STRING_TOKENS ];
;1275:  int clientNum = -1;
ADDRLP4 1032
CNSTI4 -1
ASGNI4
line 1279
;1276:  char name[ MAX_NETNAME ];
;1277:  char *arg1plus;
;1278:  char *arg2plus;
;1279:  char nullstring[] = "";
ADDRLP4 3160
ADDRGP4 $790
INDIRB
ASGNB 1
line 1281
;1280:  char message[ MAX_STRING_CHARS ];
;1281:  char targetname[ MAX_NAME_LENGTH] = "";
ADDRLP4 1036
ADDRGP4 $791
INDIRB
ASGNB 32
line 1282
;1282:  char reason[ MAX_STRING_CHARS ] = "";
ADDRLP4 1068
ADDRGP4 $792
INDIRB
ASGNB 1024
line 1283
;1283:  char *ptr = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1285
;1284:
;1285:  arg1plus = G_SayConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 4188
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 3116
ADDRLP4 4188
INDIRP4
ASGNP4
line 1286
;1286:  arg2plus = G_SayConcatArgs(2);
CNSTI4 2
ARGI4
ADDRLP4 4192
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 3120
ADDRLP4 4192
INDIRP4
ASGNP4
line 1288
;1287:
;1288:  if (!Q_stricmp(arg1, "kick")) {
ADDRLP4 8
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4196
INDIRI4
CNSTI4 0
NEI4 $793
line 1289
;1289:    trap_SendServerCommand(ent - g_entities, "print \"Make a report in blogwtf.com/forum\n\"");
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
ADDRGP4 $796
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1290
;1290:    return;
ADDRGP4 $789
JUMPV
LABELV $793
line 1293
;1291:  }
;1292:  
;1293:  if (!Q_stricmp(arg1, "map") && g_survival.integer) {
ADDRLP4 8
ARGP4
ADDRGP4 $799
ARGP4
ADDRLP4 4200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4204
CNSTI4 0
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4204
INDIRI4
NEI4 $797
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 4204
INDIRI4
EQI4 $797
line 1294
;1294:    trap_SendServerCommand(ent - g_entities, "print \"This is survival mode, wait for the game end\n\"");
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
ADDRGP4 $801
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1295
;1295:    return;
ADDRGP4 $789
JUMPV
LABELV $797
line 1298
;1296:  }
;1297:
;1298:  if (!g_allowVote.integer) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $802
line 1299
;1299:    trap_SendServerCommand(ent - g_entities, "print \"Voting not allowed here\n\"");
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
ADDRGP4 $805
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1300
;1300:    return;
ADDRGP4 $789
JUMPV
LABELV $802
line 1304
;1301:  }
;1302:
;1303:  // Flood limit.  If they're talking too fast, determine that and return.
;1304:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $806
line 1305
;1305:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4208
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 0
EQI4 $809
line 1306
;1306:      trap_SendServerCommand(ent - g_entities, "print \"Your /callvote attempt is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $811
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1307
;1307:      return;
ADDRGP4 $789
JUMPV
LABELV $809
LABELV $806
line 1310
;1308:    }
;1309:
;1310:  if (g_voteMinTime.integer
ADDRLP4 4212
CNSTI4 0
ASGNI4
ADDRGP4 g_voteMinTime+12
INDIRI4
ADDRLP4 4212
INDIRI4
EQI4 $812
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
ADDRLP4 4216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ADDRLP4 4212
INDIRI4
EQI4 $812
ADDRGP4 level+28
INDIRI4
ADDRLP4 4220
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_voteMinTime+12
INDIRI4
MULI4
GEI4 $812
ADDRLP4 4216
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4224
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4228
CNSTI4 0
ASGNI4
ADDRLP4 4224
INDIRI4
ADDRLP4 4228
INDIRI4
NEI4 $812
ADDRGP4 level+173948
INDIRI4
ADDRLP4 4228
INDIRI4
LEI4 $812
ADDRGP4 level+173940
INDIRI4
CNSTI4 1
LEI4 $812
line 1314
;1311:          && ent->client->pers.firstConnect
;1312:          && level.time - ent->client->pers.enterTime < g_voteMinTime.integer * 1000
;1313:          && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)
;1314:          && (level.numPlayingClients > 0 && level.numConnectedClients > 1)) {
line 1315
;1315:    trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $820
ARGP4
ADDRGP4 g_voteMinTime+12
INDIRI4
ARGI4
ADDRLP4 4232
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4232
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1318
;1316:            "print \"You must wait %d seconds after connecting before calling a vote\n\"",
;1317:            g_voteMinTime.integer));
;1318:    return;
ADDRGP4 $789
JUMPV
LABELV $812
line 1321
;1319:  }
;1320:
;1321:  if (level.voteTime) {
ADDRGP4 level+176268
INDIRI4
CNSTI4 0
EQI4 $822
line 1322
;1322:    trap_SendServerCommand(ent - g_entities, "print \"A vote is already in progress\n\"");
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
ADDRGP4 $825
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1323
;1323:    return;
ADDRGP4 $789
JUMPV
LABELV $822
line 1326
;1324:  }
;1325:
;1326:  if (g_voteLimit.integer > 0
ADDRGP4 g_voteLimit+12
INDIRI4
CNSTI4 0
LEI4 $826
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4232
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRGP4 g_voteLimit+12
INDIRI4
LTI4 $826
ADDRLP4 4232
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4236
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4236
INDIRI4
CNSTI4 0
NEI4 $826
line 1328
;1327:          && ent->client->pers.voteCount >= g_voteLimit.integer
;1328:          && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)) {
line 1329
;1329:    trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $830
ARGP4
ADDRGP4 g_voteLimit+12
INDIRI4
ARGI4
ADDRLP4 4240
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4240
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1332
;1330:            "print \"You have already called the maximum number of votes (%d)\n\"",
;1331:            g_voteLimit.integer));
;1332:    return;
ADDRGP4 $789
JUMPV
LABELV $826
line 1335
;1333:  }
;1334:
;1335:  if( ent->client->pers.muted )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $832
line 1336
;1336:   {
line 1337
;1337: 	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $834
line 1338
;1338: 	  	  {
line 1339
;1339: 	  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 4240
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4240
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1341
;1340: 	  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;1341: 	  		  return;
ADDRGP4 $789
JUMPV
LABELV $834
line 1343
;1342: 	  	  }
;1343:     trap_SendServerCommand( ent - g_entities,
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
ADDRGP4 $836
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1345
;1344:       "print \"You are muted and cannot call votes\n\"" );
;1345:     return;
ADDRGP4 $789
JUMPV
LABELV $832
line 1349
;1346:   }
;1347:
;1348:  // make sure it is a valid command to vote on
;1349:  trap_Argv(1, arg1, sizeof ( arg1));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1350
;1350:  trap_Argv(2, arg2, sizeof ( arg2));
CNSTI4 2
ARGI4
ADDRLP4 2092
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1352
;1351:
;1352:  if (strchr(arg1, ';') || strchr(arg2, ';')) {
ADDRLP4 8
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4240
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4240
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $839
ADDRLP4 2092
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4244
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $837
LABELV $839
line 1353
;1353:    trap_SendServerCommand(ent - g_entities, "print \"Invalid vote string\n\"");
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
ADDRGP4 $840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1354
;1354:    return;
ADDRGP4 $789
JUMPV
LABELV $837
line 1358
;1355:  }
;1356:
;1357:  // if there is still a vote to be executed
;1358:  if (level.voteExecuteTime) {
ADDRGP4 level+176272
INDIRI4
CNSTI4 0
EQI4 $841
line 1359
;1359:    if (!Q_stricmp(level.voteString, "map_restart")) {
ADDRGP4 level+174216
ARGP4
ADDRGP4 $847
ARGP4
ADDRLP4 4248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4248
INDIRI4
CNSTI4 0
NEI4 $844
line 1360
;1360:      G_admin_maplog_result("r");
ADDRGP4 $848
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 1361
;1361:    } else if (!Q_stricmpn(level.voteString, "map", 3)) {
ADDRGP4 $845
JUMPV
LABELV $844
ADDRGP4 level+174216
ARGP4
ADDRGP4 $799
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4252
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4252
INDIRI4
CNSTI4 0
NEI4 $849
line 1362
;1362:      G_admin_maplog_result("m");
ADDRGP4 $852
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 1363
;1363:    }
LABELV $849
LABELV $845
line 1365
;1364:
;1365:    level.voteExecuteTime = 0;
ADDRGP4 level+176272
CNSTI4 0
ASGNI4
line 1366
;1366:    trap_SendConsoleCommand(EXEC_APPEND, va("%s\n", level.voteString));
ADDRGP4 $854
ARGP4
ADDRGP4 level+174216
ARGP4
ADDRLP4 4256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4256
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1367
;1367:  }
LABELV $841
line 1369
;1368:
;1369:  level.votePassThreshold = 50;
ADDRGP4 level+176264
CNSTI4 50
ASGNI4
line 1371
;1370:
;1371:  ptr = strstr(arg1plus, " -");
ADDRLP4 3116
INDIRP4
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 4248
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4248
INDIRP4
ASGNP4
line 1372
;1372:  if (ptr) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $858
line 1373
;1373:    *ptr = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1374
;1374:    ptr += 2;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1376
;1375:
;1376:    if (*ptr == 'r' || *ptr == 'R') {
ADDRLP4 4252
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4252
INDIRI4
CNSTI4 114
EQI4 $862
ADDRLP4 4252
INDIRI4
CNSTI4 82
NEI4 $860
LABELV $862
line 1377
;1377:      ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $864
JUMPV
LABELV $863
line 1379
;1378:      while (*ptr == ' ')
;1379:        ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $864
line 1378
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $863
line 1380
;1380:      strcpy(reason, ptr);
ADDRLP4 1068
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1381
;1381:    } else {
ADDRGP4 $861
JUMPV
LABELV $860
line 1382
;1382:      trap_SendServerCommand(ent - g_entities, "print \"callvote: Warning: invalid argument specified \n\"");
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
ADDRGP4 $866
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1383
;1383:    }
LABELV $861
line 1384
;1384:  }
LABELV $858
line 1387
;1385:	
;1386:  // detect clientNum for partial name match votes
;1387:  if (!Q_stricmp(arg1, "kick") ||
ADDRLP4 8
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4252
INDIRI4
CNSTI4 0
EQI4 $872
ADDRLP4 8
ARGP4
ADDRGP4 $869
ARGP4
ADDRLP4 4256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4256
INDIRI4
CNSTI4 0
EQI4 $872
ADDRLP4 8
ARGP4
ADDRGP4 $870
ARGP4
ADDRLP4 4260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4260
INDIRI4
CNSTI4 0
NEI4 $867
LABELV $872
line 1389
;1388:          !Q_stricmp(arg1, "mute") ||
;1389:          !Q_stricmp(arg1, "unmute")) {
line 1390
;1390:    int clientNums[ MAX_CLIENTS ] = {-1};
ADDRLP4 4268
ADDRGP4 $873
INDIRB
ASGNB 256
line 1391
;1391:    int numMatches = 0;
ADDRLP4 4264
CNSTI4 0
ASGNI4
line 1392
;1392:    char err[ MAX_STRING_CHARS ] = "";
ADDRLP4 4524
ADDRGP4 $874
INDIRB
ASGNB 1024
line 1394
;1393:
;1394:    Q_strncpyz(targetname, arg2plus, sizeof (targetname));
ADDRLP4 1036
ARGP4
ADDRLP4 3120
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1395
;1395:    ptr = strstr(targetname, " -");
ADDRLP4 1036
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 5548
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 5548
INDIRP4
ASGNP4
line 1396
;1396:    if (ptr)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $875
line 1397
;1397:      *ptr = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
LABELV $875
line 1399
;1398:
;1399:    if (g_requireVoteReasons.integer && !G_admin_permission(ent, ADMF_UNACCOUNTABLE) && !Q_stricmp(arg1, "kick") && reason[ 0 ] == '\0') {
ADDRGP4 g_requireVoteReasons+12
INDIRI4
CNSTI4 0
EQI4 $877
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $880
ARGP4
ADDRLP4 5552
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 5552
INDIRI4
CNSTI4 0
NEI4 $877
ADDRLP4 8
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 5556
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5560
CNSTI4 0
ASGNI4
ADDRLP4 5556
INDIRI4
ADDRLP4 5560
INDIRI4
NEI4 $877
ADDRLP4 1068
INDIRI1
CVII4 1
ADDRLP4 5560
INDIRI4
NEI4 $877
line 1400
;1400:      trap_SendServerCommand(ent - g_entities, "print \"callvote: You must specify a reason. Use /callvote kick [player] -r [reason] \n\"");
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
ADDRGP4 $881
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1401
;1401:      return;
ADDRGP4 $789
JUMPV
LABELV $877
line 1404
;1402:    }
;1403:
;1404:    if (!targetname[ 0 ]) {
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $882
line 1405
;1405:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $884
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1407
;1406:              "print \"callvote: no target\n\"");
;1407:      return;
ADDRGP4 $789
JUMPV
LABELV $882
line 1410
;1408:    }
;1409:
;1410:    numMatches = G_ClientNumbersFromString(targetname, clientNums);
ADDRLP4 1036
ARGP4
ADDRLP4 4268
ARGP4
ADDRLP4 5564
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 4264
ADDRLP4 5564
INDIRI4
ASGNI4
line 1411
;1411:    if (numMatches == 1) {
ADDRLP4 4264
INDIRI4
CNSTI4 1
NEI4 $885
line 1413
;1412:      // there was only one partial name match
;1413:      clientNum = clientNums[ 0 ];
ADDRLP4 1032
ADDRLP4 4268
INDIRI4
ASGNI4
line 1414
;1414:    } else {
ADDRGP4 $886
JUMPV
LABELV $885
line 1416
;1415:      // look for an exact name match (sets clientNum to -1 if it fails) 
;1416:      clientNum = G_ClientNumberFromString(ent, targetname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 5568
ADDRGP4 G_ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 5568
INDIRI4
ASGNI4
line 1417
;1417:    }
LABELV $886
line 1419
;1418:
;1419:    if (clientNum == -1 && numMatches > 1) {
ADDRLP4 1032
INDIRI4
CNSTI4 -1
NEI4 $887
ADDRLP4 4264
INDIRI4
CNSTI4 1
LEI4 $887
line 1420
;1420:      G_MatchOnePlayer(clientNums, err, sizeof ( err));
ADDRLP4 4268
ARGP4
ADDRLP4 4524
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 1421
;1421:      ADMP(va("^3callvote: ^7%s\n", err));
ADDRGP4 $889
ARGP4
ADDRLP4 4524
ARGP4
ADDRLP4 5568
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5568
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1422
;1422:      return;
ADDRGP4 $789
JUMPV
LABELV $887
line 1425
;1423:    }
;1424:
;1425:    if (clientNum != -1 &&
ADDRLP4 1032
INDIRI4
CNSTI4 -1
EQI4 $890
CNSTI4 2148
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $890
line 1426
;1426:            level.clients[ clientNum ].pers.connected == CON_DISCONNECTED) {
line 1427
;1427:      clientNum = -1;
ADDRLP4 1032
CNSTI4 -1
ASGNI4
line 1428
;1428:    }
LABELV $890
line 1430
;1429:
;1430:    if (clientNum != -1) {
ADDRLP4 1032
INDIRI4
CNSTI4 -1
EQI4 $892
line 1431
;1431:      Q_strncpyz(name, level.clients[ clientNum ].pers.netname,
ADDRLP4 3124
ARGP4
CNSTI4 2148
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1433
;1432:              sizeof ( name));
;1433:      Q_CleanStr(name);
ADDRLP4 3124
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1434
;1434:      if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
CNSTI4 2476
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 5572
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 5572
INDIRI4
CNSTI4 0
EQI4 $893
line 1435
;1435:        char reasonprint[ MAX_STRING_CHARS ] = "";
ADDRLP4 5576
ADDRGP4 $897
INDIRB
ASGNB 1024
line 1437
;1436:
;1437:        if (reason[ 0 ] != '\0')
ADDRLP4 1068
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $898
line 1438
;1438:          Com_sprintf(reasonprint, sizeof (reasonprint), "With reason: %s", reason);
ADDRLP4 5576
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $900
ARGP4
ADDRLP4 1068
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $898
line 1440
;1439:
;1440:        Com_sprintf(message, sizeof ( message), "%s^7 attempted /callvote %s %s on immune admin %s^7 %s^7",
ADDRLP4 3161
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $901
ARGP4
ADDRLP4 6600
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 6600
INDIRI4
ADDP4
INDIRP4
ADDRLP4 6600
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 2476
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
ADDRLP4 6600
INDIRI4
ADDP4
ARGP4
ADDRLP4 5576
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1442
;1441:                ent->client->pers.netname, arg1, targetname, g_entities[ clientNum ].client->pers.netname, reasonprint);
;1442:      }
line 1443
;1443:    } else {
ADDRGP4 $893
JUMPV
LABELV $892
line 1444
;1444:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $903
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1446
;1445:              "print \"callvote: invalid player\n\"");
;1446:      return;
ADDRGP4 $789
JUMPV
LABELV $893
line 1448
;1447:    }
;1448:  }
LABELV $867
line 1450
;1449:
;1450:  if (!Q_stricmp(arg1, "kick")) {
ADDRLP4 8
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4264
INDIRI4
CNSTI4 0
NEI4 $904
line 1451
;1451:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $906
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1453
;1452:            "print \"callvote: Make a report on blogwtf.com/forum \n\"");
;1453:    return;
ADDRGP4 $789
JUMPV
LABELV $904
line 1470
;1454:
;1455:    /*if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
;1456:      trap_SendServerCommand(ent - g_entities,
;1457:              "print \"callvote: admin is immune from vote kick\n\"");
;1458:      G_AdminsPrintf("%s\n", message);
;1459:      return;
;1460:    }
;1461:
;1462:    // use ip in case this player disconnects before the vote ends
;1463:    Com_sprintf(level.voteString, sizeof ( level.voteString),
;1464:            "!ban %s \"%s\" vote kick", level.clients[ clientNum ].pers.ip,
;1465:            g_adminTempBan.string);
;1466:    if (reason[0] != '\0')
;1467:      Q_strcat(level.voteString, sizeof ( level.voteDisplayString), va("(%s^7)", reason));
;1468:    Com_sprintf(level.voteDisplayString, sizeof ( level.voteDisplayString),
;1469:            "Kick player \'%s\'", name);*/
;1470:  } else if (!Q_stricmp(arg1, "mute")) {
ADDRLP4 8
ARGP4
ADDRGP4 $869
ARGP4
ADDRLP4 4268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4268
INDIRI4
CNSTI4 0
NEI4 $907
line 1471
;1471:    if (level.clients[ clientNum ].pers.muted) {
CNSTI4 2148
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $909
line 1472
;1472:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $911
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1474
;1473:              "print \"callvote: player is already muted\n\"");
;1474:      return;
ADDRGP4 $789
JUMPV
LABELV $909
line 1477
;1475:    }
;1476:
;1477:    if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
CNSTI4 2476
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 4272
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4272
INDIRI4
CNSTI4 0
EQI4 $912
line 1478
;1478:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $914
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1480
;1479:              "print \"callvote: admin is immune from vote mute\n\"");
;1480:      G_AdminsPrintf("%s\n", message);
ADDRGP4 $854
ARGP4
ADDRLP4 3161
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 1481
;1481:      return;
ADDRGP4 $789
JUMPV
LABELV $912
line 1483
;1482:    }
;1483:    Com_sprintf(level.voteString, sizeof ( level.voteString),
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $917
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1485
;1484:            "!mute %i", clientNum);
;1485:    Com_sprintf(level.voteDisplayString, sizeof ( level.voteDisplayString),
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $920
ARGP4
ADDRLP4 3124
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1487
;1486:            "Mute player \'%s\'", name);
;1487:  } else if (!Q_stricmp(arg1, "unmute")) {
ADDRGP4 $908
JUMPV
LABELV $907
ADDRLP4 8
ARGP4
ADDRGP4 $870
ARGP4
ADDRLP4 4272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4272
INDIRI4
CNSTI4 0
NEI4 $921
line 1488
;1488:    if (!level.clients[ clientNum ].pers.muted) {
CNSTI4 2148
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $923
line 1489
;1489:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $925
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1491
;1490:              "print \"callvote: player is not currently muted\n\"");
;1491:      return;
ADDRGP4 $789
JUMPV
LABELV $923
line 1493
;1492:    }
;1493:    Com_sprintf(level.voteString, sizeof ( level.voteString),
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $928
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1495
;1494:            "!unmute %i", clientNum);
;1495:    Com_sprintf(level.voteDisplayString, sizeof ( level.voteDisplayString),
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $931
ARGP4
ADDRLP4 3124
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1497
;1496:            "Un-Mute player \'%s\'", name);
;1497:  } else if (!Q_stricmp(arg1, "map_restart")) {
ADDRGP4 $922
JUMPV
LABELV $921
ADDRLP4 8
ARGP4
ADDRGP4 $847
ARGP4
ADDRLP4 4276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4276
INDIRI4
CNSTI4 0
NEI4 $932
line 1498
;1498:    if (g_mapvoteMaxTime.integer
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
CNSTI4 0
EQI4 $934
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
MULI4
LTI4 $934
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4280
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4284
CNSTI4 0
ASGNI4
ADDRLP4 4280
INDIRI4
ADDRLP4 4284
INDIRI4
NEI4 $934
ADDRGP4 level+173948
INDIRI4
ADDRLP4 4284
INDIRI4
LEI4 $934
ADDRGP4 level+173940
INDIRI4
CNSTI4 1
LEI4 $934
line 1501
;1499:            && ((level.time - level.startTime) >= g_mapvoteMaxTime.integer * 1000)
;1500:            && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)
;1501:            && (level.numPlayingClients > 0 && level.numConnectedClients > 1)) {
line 1502
;1502:      trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $942
ARGP4
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
ARGI4
ADDRLP4 4288
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4288
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1505
;1503:              "print \"You cannot call for a restart after %d seconds\n\"",
;1504:              g_mapvoteMaxTime.integer));
;1505:      return;
ADDRGP4 $789
JUMPV
LABELV $934
line 1507
;1506:    }
;1507:    Com_sprintf(level.voteString, sizeof ( level.voteString), "%s", arg1);
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $946
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1508
;1508:    Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $949
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1510
;1509:            sizeof ( level.voteDisplayString), "Restart current map");
;1510:    level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1511
;1511:  } else if (!Q_stricmp(arg1, "map")) {
ADDRGP4 $933
JUMPV
LABELV $932
ADDRLP4 8
ARGP4
ADDRGP4 $799
ARGP4
ADDRLP4 4280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4280
INDIRI4
CNSTI4 0
NEI4 $952
line 1512
;1512:    if (g_mapvoteMaxTime.integer
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
CNSTI4 0
EQI4 $954
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
MULI4
LTI4 $954
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4284
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4288
CNSTI4 0
ASGNI4
ADDRLP4 4284
INDIRI4
ADDRLP4 4288
INDIRI4
NEI4 $954
ADDRGP4 level+173948
INDIRI4
ADDRLP4 4288
INDIRI4
LEI4 $954
ADDRGP4 level+173940
INDIRI4
CNSTI4 1
LEI4 $954
line 1515
;1513:            && ((level.time - level.startTime) >= g_mapvoteMaxTime.integer * 1000)
;1514:            && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)
;1515:            && (level.numPlayingClients > 0 && level.numConnectedClients > 1)) {
line 1516
;1516:      trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $962
ARGP4
ADDRGP4 g_mapvoteMaxTime+12
INDIRI4
ARGI4
ADDRLP4 4292
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4292
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1519
;1517:              "print \"You cannot call for a mapchange after %d seconds\n\"",
;1518:              g_mapvoteMaxTime.integer));
;1519:      return;
ADDRGP4 $789
JUMPV
LABELV $954
line 1522
;1520:    }
;1521:
;1522:    if (!trap_FS_FOpenFile(va("maps/%s.bsp", arg2), NULL, FS_READ)) {
ADDRGP4 $966
ARGP4
ADDRLP4 2092
ARGP4
ADDRLP4 4292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4292
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4296
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4296
INDIRI4
CNSTI4 0
NEI4 $964
line 1523
;1523:      trap_SendServerCommand(ent - g_entities, va("print \"callvote: "
ADDRGP4 $967
ARGP4
ADDRLP4 2092
ARGP4
ADDRLP4 4300
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1525
;1524:              "'maps/%s.bsp' could not be found on the server\n\"", arg2));
;1525:      return;
ADDRGP4 $789
JUMPV
LABELV $964
line 1527
;1526:    }
;1527:    Com_sprintf(level.voteString, sizeof ( level.voteString), "%s %s", arg1, arg2);
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $970
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2092
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1528
;1528:    Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $973
ARGP4
ADDRLP4 2092
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1530
;1529:            sizeof ( level.voteDisplayString), "Change to map '%s'", arg2);
;1530:    level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1531
;1531:  } else if (!Q_stricmp(arg1, "nextmap")) {
ADDRGP4 $953
JUMPV
LABELV $952
ADDRLP4 8
ARGP4
ADDRGP4 $978
ARGP4
ADDRLP4 4284
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4284
INDIRI4
CNSTI4 0
NEI4 $976
line 1532
;1532:    if (G_MapExists(g_nextMap.string)) {
ADDRGP4 g_nextMap+16
ARGP4
ADDRLP4 4288
ADDRGP4 G_MapExists
CALLI4
ASGNI4
ADDRLP4 4288
INDIRI4
CNSTI4 0
EQI4 $979
line 1533
;1533:      trap_SendServerCommand(ent - g_entities, va("print \"callvote: "
ADDRGP4 $982
ARGP4
ADDRGP4 g_nextMap+16
ARGP4
ADDRLP4 4292
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4292
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1535
;1534:              "the next map is already set to '%s^7'\n\"", g_nextMap.string));
;1535:      return;
ADDRGP4 $789
JUMPV
LABELV $979
line 1538
;1536:    }
;1537:
;1538:    if (!arg2[ 0 ]) {
ADDRLP4 2092
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $984
line 1539
;1539:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $986
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1541
;1540:              "print \"callvote: you must specify a map\n\"");
;1541:      return;
ADDRGP4 $789
JUMPV
LABELV $984
line 1544
;1542:    }
;1543:
;1544:    if (!trap_FS_FOpenFile(va("maps/%s.bsp", arg2), NULL, FS_READ)) {
ADDRGP4 $966
ARGP4
ADDRLP4 2092
ARGP4
ADDRLP4 4292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4292
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4296
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4296
INDIRI4
CNSTI4 0
NEI4 $987
line 1545
;1545:      trap_SendServerCommand(ent - g_entities, va("print \"callvote: "
ADDRGP4 $989
ARGP4
ADDRLP4 2092
ARGP4
ADDRLP4 4300
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1547
;1546:              "'maps/%s^7.bsp' could not be found on the server\n\"", arg2));
;1547:      return;
ADDRGP4 $789
JUMPV
LABELV $987
line 1549
;1548:    }
;1549:    Com_sprintf(level.voteString, sizeof ( level.voteString),
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $992
ARGP4
ADDRLP4 2092
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1551
;1550:            "set g_nextMap %s", arg2);
;1551:    Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $995
ARGP4
ADDRLP4 2092
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1553
;1552:            sizeof ( level.voteDisplayString), "Set the next map to '%s^7'", arg2);
;1553:    level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1554
;1554:  } else if (!Q_stricmp(arg1, "draw")) {
ADDRGP4 $977
JUMPV
LABELV $976
ADDRLP4 8
ARGP4
ADDRGP4 $1000
ARGP4
ADDRLP4 4288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4288
INDIRI4
CNSTI4 0
NEI4 $998
line 1555
;1555:    Com_sprintf(level.voteString, sizeof ( level.voteString), "evacuation");
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1003
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1556
;1556:    Com_sprintf(level.voteDisplayString, sizeof ( level.voteDisplayString),
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1006
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1558
;1557:            "End match in a draw");
;1558:    level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1559
;1559:  } else if (!Q_stricmp(arg1, "poll")) {
ADDRGP4 $999
JUMPV
LABELV $998
ADDRLP4 8
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 4292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4292
INDIRI4
CNSTI4 0
NEI4 $1009
line 1560
;1560:    if (arg2plus[ 0 ] == '\0') {
ADDRLP4 3120
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1012
line 1561
;1561:      trap_SendServerCommand(ent - g_entities, "print \"callvote: You forgot to specify what people should vote on.\n\"");
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
ADDRGP4 $1014
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1562
;1562:      return;
ADDRGP4 $789
JUMPV
LABELV $1012
line 1564
;1563:    }
;1564:    Com_sprintf(level.voteString, sizeof ( level.voteString), "%s", nullstring);
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $946
ARGP4
ADDRLP4 3160
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1565
;1565:    Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1019
ARGP4
ADDRLP4 3120
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1567
;1566:            sizeof ( level.voteDisplayString), "[Poll] \'%s\'", arg2plus);
;1567:  } else if (!Q_stricmp(arg1, "sudden_death") ||
ADDRGP4 $1010
JUMPV
LABELV $1009
ADDRLP4 8
ARGP4
ADDRGP4 $1022
ARGP4
ADDRLP4 4296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4296
INDIRI4
CNSTI4 0
EQI4 $1024
ADDRLP4 8
ARGP4
ADDRGP4 $1023
ARGP4
ADDRLP4 4300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4300
INDIRI4
CNSTI4 0
NEI4 $1020
LABELV $1024
line 1568
;1568:          !Q_stricmp(arg1, "suddendeath")) {
line 1569
;1569:    if (!g_suddenDeathVotePercent.integer) {
ADDRGP4 g_suddenDeathVotePercent+12
INDIRI4
CNSTI4 0
NEI4 $1025
line 1570
;1570:      trap_SendServerCommand(ent - g_entities, "print \"Sudden Death votes have been disabled\n\"");
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
ADDRGP4 $1028
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1571
;1571:      return;
ADDRGP4 $789
JUMPV
LABELV $1025
line 1573
;1572:    }
;1573:    else if (g_suddenDeath.integer) {
ADDRGP4 g_suddenDeath+12
INDIRI4
CNSTI4 0
EQI4 $1029
line 1574
;1574:      trap_SendServerCommand(ent - g_entities, va("print \"callvote: Sudden Death has already begun\n\""));
ADDRGP4 $1032
ARGP4
ADDRLP4 4304
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4304
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1575
;1575:      return;
ADDRGP4 $789
JUMPV
LABELV $1029
line 1576
;1576:    } else if (G_TimeTilSuddenDeath() <= g_suddenDeathVoteDelay.integer * 1000) {
ADDRLP4 4304
ADDRGP4 G_TimeTilSuddenDeath
CALLI4
ASGNI4
ADDRLP4 4304
INDIRI4
CNSTI4 1000
ADDRGP4 g_suddenDeathVoteDelay+12
INDIRI4
MULI4
GTI4 $1033
line 1577
;1577:      trap_SendServerCommand(ent - g_entities, va("print \"callvote: Sudden Death is already immenent\n\""));
ADDRGP4 $1036
ARGP4
ADDRLP4 4308
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4308
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1578
;1578:      return;
ADDRGP4 $789
JUMPV
LABELV $1033
line 1579
;1579:    } else {
line 1580
;1580:      level.votePassThreshold = g_suddenDeathVotePercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_suddenDeathVotePercent+12
INDIRI4
ASGNI4
line 1581
;1581:      Com_sprintf(level.voteString, sizeof ( level.voteString), "suddendeath");
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1023
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1582
;1582:      Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1043
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1585
;1583:              sizeof ( level.voteDisplayString), "Begin sudden death");
;1584:
;1585:      if (g_suddenDeathVoteDelay.integer)
ADDRGP4 g_suddenDeathVoteDelay+12
INDIRI4
CNSTI4 0
EQI4 $1021
line 1586
;1586:        Q_strcat(level.voteDisplayString, sizeof ( level.voteDisplayString), va(" in %d seconds", g_suddenDeathVoteDelay.integer));
ADDRGP4 $1049
ARGP4
ADDRGP4 g_suddenDeathVoteDelay+12
INDIRI4
ARGI4
ADDRLP4 4308
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4308
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1588
;1587:
;1588:    }
line 1589
;1589:  }else if (!Q_stricmp(arg1, "survival"))
ADDRGP4 $1021
JUMPV
LABELV $1020
ADDRLP4 8
ARGP4
ADDRGP4 $1053
ARGP4
ADDRLP4 4304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4304
INDIRI4
CNSTI4 0
NEI4 $1051
line 1590
;1590:	{
line 1592
;1591:		char map[MAX_QPATH];			
;1592:		trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1054
ARGP4
ADDRLP4 4308
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1595
;1593:		
;1594:		
;1595:		if(g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1055
line 1596
;1596:		{
line 1597
;1597:			trap_SendServerCommand(ent - g_entities, "print \"callvote: It is already survival mode!.\n\"");
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
ADDRGP4 $1058
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1598
;1598:			return;
ADDRGP4 $789
JUMPV
LABELV $1055
line 1600
;1599:		}
;1600:		if (trap_FS_FOpenFile(va("layouts/%s/%s.dat", map, "survival"), NULL, FS_READ) > 0)
ADDRGP4 $1061
ARGP4
ADDRLP4 4308
ARGP4
ADDRGP4 $1053
ARGP4
ADDRLP4 4372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4372
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4376
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4376
INDIRI4
CNSTI4 0
LEI4 $1059
line 1601
;1601:		{
line 1602
;1602:			Com_sprintf(level.voteString, sizeof ( level.voteString), "map_restart survival");
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1064
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1603
;1603:			Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1067
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1605
;1604:						sizeof ( level.voteDisplayString), "Switch to survival mode.");
;1605:			trap_Cvar_Set("g_layouts", "survival");
ADDRGP4 $1068
ARGP4
ADDRGP4 $1053
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1606
;1606:			level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1607
;1607:		}
ADDRGP4 $1052
JUMPV
LABELV $1059
line 1609
;1608:		else
;1609:		{
line 1610
;1610:			trap_SendServerCommand(ent - g_entities, "print \"callvote: This map does not support survival.\n\"");
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
ADDRGP4 $1071
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1611
;1611:			return;
ADDRGP4 $789
JUMPV
line 1613
;1612:		}
;1613:	} else if (!Q_stricmp(arg1, "ctm"))
LABELV $1051
ADDRLP4 8
ARGP4
ADDRGP4 $1074
ARGP4
ADDRLP4 4308
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
NEI4 $1072
line 1614
;1614:	{
line 1615
;1615:		if(!g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
NEI4 $1075
line 1616
;1616:		{
line 1617
;1617:			trap_SendServerCommand(ent - g_entities, "print \"callvote: It is already clean the map mode!.\n\"");
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
ADDRGP4 $1078
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1618
;1618:			return;
ADDRGP4 $789
JUMPV
LABELV $1075
line 1620
;1619:		}
;1620:		Com_sprintf(level.voteString, sizeof ( level.voteString), "map_restart");
ADDRGP4 level+174216
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $847
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1621
;1621:			Com_sprintf(level.voteDisplayString,
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1083
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1623
;1622:						sizeof ( level.voteDisplayString), "Switch to clean the map mode.");
;1623:			level.votePassThreshold = g_mapVotesPercent.integer;
ADDRGP4 level+176264
ADDRGP4 g_mapVotesPercent+12
INDIRI4
ASGNI4
line 1624
;1624:	}
ADDRGP4 $1073
JUMPV
LABELV $1072
line 1625
;1625:   else {
line 1626
;1626:    trap_SendServerCommand(ent - g_entities, "print \"Invalid vote string\n\"");
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
ADDRGP4 $840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1627
;1627:    trap_SendServerCommand(ent - g_entities, "print \"Valid vote commands are: "
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
ADDRGP4 $1086
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1629
;1628:            "map, survival, ctm, map_restart, draw, nextmap, kick, mute, unmute, poll, and sudden_death\n");
;1629:    return;
ADDRGP4 $789
JUMPV
LABELV $1073
LABELV $1052
LABELV $1021
LABELV $1010
LABELV $999
LABELV $977
LABELV $953
LABELV $933
LABELV $922
LABELV $908
line 1632
;1630:  }
;1631:
;1632:  if (level.votePassThreshold != 50) {
ADDRGP4 level+176264
INDIRI4
CNSTI4 50
EQI4 $1087
line 1633
;1633:    Q_strcat(level.voteDisplayString, sizeof ( level.voteDisplayString), va(" (Needs > %d percent)", level.votePassThreshold));
ADDRGP4 $1092
ARGP4
ADDRGP4 level+176264
INDIRI4
ARGI4
ADDRLP4 4312
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4312
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1634
;1634:  }
LABELV $1087
line 1636
;1635:
;1636:  if (reason[0] != '\0')
ADDRLP4 1068
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1094
line 1637
;1637:    Q_strcat(level.voteDisplayString, sizeof ( level.voteDisplayString), va(" Reason: '%s^7'", reason));
ADDRGP4 $1098
ARGP4
ADDRLP4 1068
ARGP4
ADDRLP4 4312
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4312
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $1094
line 1640
;1638:
;1639:
;1640:  trap_SendServerCommand(-1, va("print \"%s" S_COLOR_WHITE
ADDRGP4 $1099
ARGP4
ADDRLP4 4316
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4316
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4316
INDIRI4
ADDP4
ARGP4
ADDRGP4 level+175240
ARGP4
ADDRLP4 4320
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4320
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1643
;1641:          " called a vote: %s" S_COLOR_WHITE "\n\"", ent->client->pers.netname, level.voteDisplayString));
;1642:
;1643:  G_LogPrintf("Vote: %s^7 called a vote: %s^7\n", ent->client->pers.netname, level.voteDisplayString);
ADDRGP4 $1101
ARGP4
ADDRLP4 4324
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4324
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4324
INDIRI4
ADDP4
ARGP4
ADDRGP4 level+175240
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1645
;1644:
;1645:  Q_strcat(level.voteDisplayString, sizeof ( level.voteDisplayString), va(" Called by: '%s^7'", ent->client->pers.netname));
ADDRGP4 $1105
ARGP4
ADDRLP4 4328
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4328
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4328
INDIRI4
ADDP4
ARGP4
ADDRLP4 4332
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 level+175240
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4332
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1647
;1646:
;1647:  ent->client->pers.voteCount++;
ADDRLP4 4336
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 608
ADDP4
ASGNP4
ADDRLP4 4336
INDIRP4
ADDRLP4 4336
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1650
;1648:
;1649:  // start the voting, the caller autoamtically votes yes
;1650:  level.voteTime = level.time;
ADDRGP4 level+176268
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1651
;1651:  level.voteNo = 0;
ADDRGP4 level+176280
CNSTI4 0
ASGNI4
line 1653
;1652:
;1653:  for (i = 0; i < level.maxclients; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1112
JUMPV
LABELV $1109
line 1654
;1654:    level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 4340
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4340
INDIRP4
ADDRLP4 4340
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
LABELV $1110
line 1653
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1112
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1109
line 1656
;1655:
;1656:  if (!Q_stricmp(arg1, "poll")) {
ADDRLP4 8
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 4344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4344
INDIRI4
CNSTI4 0
NEI4 $1114
line 1657
;1657:    level.voteYes = 0;
ADDRGP4 level+176276
CNSTI4 0
ASGNI4
line 1658
;1658:  } else {
ADDRGP4 $1115
JUMPV
LABELV $1114
line 1659
;1659:    level.voteYes = 1;
ADDRGP4 level+176276
CNSTI4 1
ASGNI4
line 1660
;1660:    ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 4348
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4348
INDIRP4
ADDRLP4 4348
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 1661
;1661:  }
LABELV $1115
line 1663
;1662:
;1663:  trap_SetConfigstring(CS_VOTE_TIME, va("%i", level.voteTime));
ADDRGP4 $1118
ARGP4
ADDRGP4 level+176268
INDIRI4
ARGI4
ADDRLP4 4348
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 4348
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1664
;1664:  trap_SetConfigstring(CS_VOTE_STRING, level.voteDisplayString);
CNSTI4 9
ARGI4
ADDRGP4 level+175240
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1665
;1665:  trap_SetConfigstring(CS_VOTE_YES, va("%i", level.voteYes));
ADDRGP4 $1118
ARGP4
ADDRGP4 level+176276
INDIRI4
ARGI4
ADDRLP4 4352
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 4352
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1666
;1666:  trap_SetConfigstring(CS_VOTE_NO, va("%i", level.voteNo));
ADDRGP4 $1118
ARGP4
ADDRGP4 level+176280
INDIRI4
ARGI4
ADDRLP4 4356
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 4356
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1667
;1667:}
LABELV $789
endproc Cmd_CallVote_f 6604 32
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1674
;1668:
;1669:/*
;1670:==================
;1671:Cmd_Vote_f
;1672:==================
;1673: */
;1674:void Cmd_Vote_f(gentity_t *ent) {
line 1677
;1675:  char msg[ 64 ];
;1676:
;1677:  if (!level.voteTime) {
ADDRGP4 level+176268
INDIRI4
CNSTI4 0
NEI4 $1124
line 1678
;1678:    if (ent->client->pers.teamSelection != PTE_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1127
line 1681
;1679:      // If there is a teamvote going on but no global vote, forward this vote on as a teamvote
;1680:      // (ugly hack for 1.1 cgames + noobs who can't figure out how to use any command that isn't bound by default)
;1681:      int cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 1682
;1682:      if (ent->client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1129
line 1683
;1683:        cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
LABELV $1129
line 1685
;1684:
;1685:      if (level.teamVoteTime[ cs_offset ]) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1131
line 1686
;1686:        if (!(ent->client->ps.eFlags & EF_TEAMVOTED)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
NEI4 $1134
line 1687
;1687:          Cmd_TeamVote_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
line 1688
;1688:          return;
ADDRGP4 $1123
JUMPV
LABELV $1134
line 1690
;1689:        }
;1690:      }
LABELV $1131
line 1691
;1691:    }
LABELV $1127
line 1692
;1692:    trap_SendServerCommand(ent - g_entities, "print \"No vote in progress\n\"");
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
ADDRGP4 $1136
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1693
;1693:    return;
ADDRGP4 $1123
JUMPV
LABELV $1124
line 1696
;1694:  }
;1695:
;1696:  if (ent->client->ps.eFlags & EF_VOTED) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1137
line 1697
;1697:    trap_SendServerCommand(ent - g_entities, "print \"Vote already cast\n\"");
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
ADDRGP4 $1139
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1698
;1698:    return;
ADDRGP4 $1123
JUMPV
LABELV $1137
line 1701
;1699:  }
;1700:
;1701:  trap_SendServerCommand(ent - g_entities, "print \"Vote cast\n\"");
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
ADDRGP4 $1140
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1703
;1702:
;1703:  ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 1705
;1704:
;1705:  trap_Argv(1, msg, sizeof ( msg));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1707
;1706:
;1707:  if (msg[ 0 ] == 'y' || msg[ 1 ] == 'Y' || msg[ 1 ] == '1') {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1146
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1146
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1141
LABELV $1146
line 1708
;1708:    level.voteYes++;
ADDRLP4 68
ADDRGP4 level+176276
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1709
;1709:    trap_SetConfigstring(CS_VOTE_YES, va("%i", level.voteYes));
ADDRGP4 $1118
ARGP4
ADDRGP4 level+176276
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1710
;1710:  } else {
ADDRGP4 $1142
JUMPV
LABELV $1141
line 1711
;1711:    level.voteNo++;
ADDRLP4 68
ADDRGP4 level+176280
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1712
;1712:    trap_SetConfigstring(CS_VOTE_NO, va("%i", level.voteNo));
ADDRGP4 $1118
ARGP4
ADDRGP4 level+176280
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1713
;1713:  }
LABELV $1142
line 1717
;1714:
;1715:  // a majority will be determined in G_CheckVote, which will also account
;1716:  // for players entering or leaving
;1717:}
LABELV $1123
endproc Cmd_Vote_f 76 12
lit
align 1
LABELV $1152
byte 1 0
align 1
LABELV $1153
byte 1 0
skip 31
align 1
LABELV $1154
byte 1 0
skip 1023
align 4
LABELV $1209
byte 4 -1
skip 252
align 1
LABELV $1232
byte 1 0
skip 1023
export Cmd_CallTeamVote_f
code
proc Cmd_CallTeamVote_f 6612 32
line 1724
;1718:
;1719:/*
;1720:==================
;1721:Cmd_CallTeamVote_f
;1722:==================
;1723: */
;1724:void Cmd_CallTeamVote_f(gentity_t *ent) {
line 1725
;1725:  int i, team, cs_offset = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1728
;1726:  char arg1[ MAX_STRING_TOKENS ];
;1727:  char arg2[ MAX_STRING_TOKENS ];
;1728:  int clientNum = -1;
ADDRLP4 1040
CNSTI4 -1
ASGNI4
line 1730
;1729:  char name[ MAX_NETNAME ];
;1730:  char nullstring[] = "";
ADDRLP4 3172
ADDRGP4 $1152
INDIRB
ASGNB 1
line 1732
;1731:  char message[ MAX_STRING_CHARS ];
;1732:  char targetname[ MAX_NAME_LENGTH] = "";
ADDRLP4 3092
ADDRGP4 $1153
INDIRB
ASGNB 32
line 1733
;1733:  char reason[ MAX_STRING_CHARS ] = "";
ADDRLP4 2068
ADDRGP4 $1154
INDIRB
ASGNB 1024
line 1736
;1734:  char *arg1plus;
;1735:  char *arg2plus;
;1736:  char *ptr = NULL;
ADDRLP4 1036
CNSTP4 0
ASGNP4
line 1737
;1737:  int numVoters = 0;
ADDRLP4 3128
CNSTI4 0
ASGNI4
line 1739
;1738:
;1739:  arg1plus = G_SayConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 4200
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 3124
ADDRLP4 4200
INDIRP4
ASGNP4
line 1740
;1740:  arg2plus = G_SayConcatArgs(2);
CNSTI4 2
ARGI4
ADDRLP4 4204
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 3168
ADDRLP4 4204
INDIRP4
ASGNP4
line 1742
;1741:
;1742:  team = ent->client->pers.teamSelection;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 1744
;1743:
;1744:  if (team == PTE_ALIENS)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1155
line 1745
;1745:    cs_offset = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $1155
line 1747
;1746:
;1747:  if (team == PTE_ALIENS)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1157
line 1748
;1748:    numVoters = level.numAlienClients;
ADDRLP4 3128
ADDRGP4 level+185096
INDIRI4
ASGNI4
ADDRGP4 $1158
JUMPV
LABELV $1157
line 1749
;1749:  else if (team == PTE_HUMANS)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $1160
line 1750
;1750:    numVoters = level.numHumanClients;
ADDRLP4 3128
ADDRGP4 level+185100
INDIRI4
ASGNI4
LABELV $1160
LABELV $1158
line 1752
;1751:
;1752:  if (!g_allowVote.integer) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $1163
line 1753
;1753:    trap_SendServerCommand(ent - g_entities, "print \"Voting not allowed here\n\"");
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
ADDRGP4 $805
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1754
;1754:    return;
ADDRGP4 $1151
JUMPV
LABELV $1163
line 1757
;1755:  }
;1756:
;1757:  if (level.teamVoteTime[ cs_offset ]) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1166
line 1758
;1758:    trap_SendServerCommand(ent - g_entities, "print \"A team vote is already in progress\n\"");
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
ADDRGP4 $1169
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1759
;1759:    return;
ADDRGP4 $1151
JUMPV
LABELV $1166
line 1762
;1760:  }
;1761:
;1762:  if (g_voteLimit.integer > 0
ADDRGP4 g_voteLimit+12
INDIRI4
CNSTI4 0
LEI4 $1170
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRGP4 g_voteLimit+12
INDIRI4
LTI4 $1170
ADDRLP4 4208
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4212
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
NEI4 $1170
line 1764
;1763:          && ent->client->pers.voteCount >= g_voteLimit.integer
;1764:          && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)) {
line 1765
;1765:    trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $830
ARGP4
ADDRGP4 g_voteLimit+12
INDIRI4
ARGI4
ADDRLP4 4216
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4216
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1768
;1766:            "print \"You have already called the maximum number of votes (%d)\n\"",
;1767:            g_voteLimit.integer));
;1768:    return;
ADDRGP4 $1151
JUMPV
LABELV $1170
line 1771
;1769:  }
;1770:
;1771:  if (ent->client->pers.muted) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1175
line 1772
;1772:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1177
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1774
;1773:            "print \"You are muted and cannot call teamvotes\n\"");
;1774:    return;
ADDRGP4 $1151
JUMPV
LABELV $1175
line 1777
;1775:  }
;1776:
;1777:  if (g_voteMinTime.integer
ADDRLP4 4216
CNSTI4 0
ASGNI4
ADDRGP4 g_voteMinTime+12
INDIRI4
ADDRLP4 4216
INDIRI4
EQI4 $1178
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
ADDRLP4 4220
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ADDRLP4 4216
INDIRI4
EQI4 $1178
ADDRGP4 level+28
INDIRI4
ADDRLP4 4224
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_voteMinTime+12
INDIRI4
MULI4
GEI4 $1178
ADDRLP4 4220
INDIRP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRLP4 4228
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4232
CNSTI4 0
ASGNI4
ADDRLP4 4228
INDIRI4
ADDRLP4 4232
INDIRI4
NEI4 $1178
ADDRGP4 level+173948
INDIRI4
ADDRLP4 4232
INDIRI4
LEI4 $1178
ADDRGP4 level+173940
INDIRI4
CNSTI4 1
LEI4 $1178
line 1781
;1778:          && ent->client->pers.firstConnect
;1779:          && level.time - ent->client->pers.enterTime < g_voteMinTime.integer * 1000
;1780:          && !G_admin_permission(ent, ADMF_NO_VOTE_LIMIT)
;1781:          && (level.numPlayingClients > 0 && level.numConnectedClients > 1)) {
line 1782
;1782:    trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $820
ARGP4
ADDRGP4 g_voteMinTime+12
INDIRI4
ARGI4
ADDRLP4 4236
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4236
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1785
;1783:            "print \"You must wait %d seconds after connecting before calling a vote\n\"",
;1784:            g_voteMinTime.integer));
;1785:    return;
ADDRGP4 $1151
JUMPV
LABELV $1178
line 1789
;1786:  }
;1787:
;1788:  // make sure it is a valid command to vote on
;1789:  trap_Argv(1, arg1, sizeof ( arg1));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1790
;1790:  trap_Argv(2, arg2, sizeof ( arg2));
CNSTI4 2
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1792
;1791:
;1792:  if (strchr(arg1, ';') || strchr(arg2, ';')) {
ADDRLP4 12
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4236
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4236
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1188
ADDRLP4 1044
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4240
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1186
LABELV $1188
line 1793
;1793:    trap_SendServerCommand(ent - g_entities, "print \"Invalid team vote string\n\"");
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
ADDRGP4 $1189
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1794
;1794:    return;
ADDRGP4 $1151
JUMPV
LABELV $1186
line 1797
;1795:  }
;1796:
;1797:  ptr = strstr(arg1plus, " -");
ADDRLP4 3124
INDIRP4
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 4244
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 4244
INDIRP4
ASGNP4
line 1798
;1798:  if (ptr) {
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1190
line 1799
;1799:    *ptr = '\0';
ADDRLP4 1036
INDIRP4
CNSTI1 0
ASGNI1
line 1800
;1800:    ptr += 2;
ADDRLP4 1036
ADDRLP4 1036
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1802
;1801:
;1802:    if (*ptr == 'r' || *ptr == 'R') {
ADDRLP4 4248
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4248
INDIRI4
CNSTI4 114
EQI4 $1194
ADDRLP4 4248
INDIRI4
CNSTI4 82
NEI4 $1192
LABELV $1194
line 1803
;1803:      ptr++;
ADDRLP4 1036
ADDRLP4 1036
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $1196
JUMPV
LABELV $1195
line 1805
;1804:      while (*ptr == ' ')
;1805:        ptr++;
ADDRLP4 1036
ADDRLP4 1036
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1196
line 1804
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $1195
line 1806
;1806:      strcpy(reason, ptr);
ADDRLP4 2068
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1807
;1807:    } else {
ADDRGP4 $1193
JUMPV
LABELV $1192
line 1808
;1808:      trap_SendServerCommand(ent - g_entities, "print \"callteamvote: Warning: invalid argument specified \n\"");
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
ADDRGP4 $1198
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1809
;1809:    }
LABELV $1193
line 1810
;1810:  }
LABELV $1190
line 1813
;1811:
;1812:  // detect clientNum for partial name match votes
;1813:  if (!Q_stricmp(arg1, "kick") ||
ADDRLP4 12
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4248
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRLP4 12
ARGP4
ADDRGP4 $1201
ARGP4
ADDRLP4 4252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4252
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRLP4 12
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 4256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4256
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRLP4 12
ARGP4
ADDRGP4 $1203
ARGP4
ADDRLP4 4260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4260
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRLP4 12
ARGP4
ADDRGP4 $1204
ARGP4
ADDRLP4 4264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4264
INDIRI4
CNSTI4 0
NEI4 $1199
LABELV $1208
line 1817
;1814:          !Q_stricmp(arg1, "denybuild") ||
;1815:          !Q_stricmp(arg1, "allowbuild") ||
;1816:          !Q_stricmp(arg1, "designate") ||
;1817:          !Q_stricmp(arg1, "undesignate")) {
line 1818
;1818:    int clientNums[ MAX_CLIENTS ] = {-1};
ADDRLP4 4272
ADDRGP4 $1209
INDIRB
ASGNB 256
line 1819
;1819:    int numMatches = 0;
ADDRLP4 4268
CNSTI4 0
ASGNI4
line 1822
;1820:    char err[ MAX_STRING_CHARS ];
;1821:
;1822:    Q_strncpyz(targetname, arg2plus, sizeof (targetname));
ADDRLP4 3092
ARGP4
ADDRLP4 3168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1823
;1823:    ptr = strstr(targetname, " -");
ADDRLP4 3092
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 5552
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 5552
INDIRP4
ASGNP4
line 1824
;1824:    if (ptr)
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1210
line 1825
;1825:      *ptr = '\0';
ADDRLP4 1036
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1210
line 1827
;1826:
;1827:    if (g_requireVoteReasons.integer && !G_admin_permission(ent, ADMF_UNACCOUNTABLE) && !Q_stricmp(arg1, "kick") && reason[ 0 ] == '\0') {
ADDRGP4 g_requireVoteReasons+12
INDIRI4
CNSTI4 0
EQI4 $1212
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $880
ARGP4
ADDRLP4 5556
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 5556
INDIRI4
CNSTI4 0
NEI4 $1212
ADDRLP4 12
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 5560
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5564
CNSTI4 0
ASGNI4
ADDRLP4 5560
INDIRI4
ADDRLP4 5564
INDIRI4
NEI4 $1212
ADDRLP4 2068
INDIRI1
CVII4 1
ADDRLP4 5564
INDIRI4
NEI4 $1212
line 1828
;1828:      trap_SendServerCommand(ent - g_entities, "print \"callvote: You must specify a reason. Use /callteamvote kick [player] -r [reason] \n\"");
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
ADDRGP4 $1215
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1829
;1829:      return;
ADDRGP4 $1151
JUMPV
LABELV $1212
line 1833
;1830:    }
;1831:
;1832:
;1833:    if (!arg2[ 0 ]) {
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1216
line 1834
;1834:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1218
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1836
;1835:              "print \"callteamvote: no target\n\"");
;1836:      return;
ADDRGP4 $1151
JUMPV
LABELV $1216
line 1839
;1837:    }
;1838:
;1839:    numMatches = G_ClientNumbersFromString(targetname, clientNums);
ADDRLP4 3092
ARGP4
ADDRLP4 4272
ARGP4
ADDRLP4 5568
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 4268
ADDRLP4 5568
INDIRI4
ASGNI4
line 1840
;1840:    if (numMatches == 1) {
ADDRLP4 4268
INDIRI4
CNSTI4 1
NEI4 $1219
line 1842
;1841:      // there was only one partial name match
;1842:      clientNum = clientNums[ 0 ];
ADDRLP4 1040
ADDRLP4 4272
INDIRI4
ASGNI4
line 1843
;1843:    } else {
ADDRGP4 $1220
JUMPV
LABELV $1219
line 1845
;1844:      // look for an exact name match (sets clientNum to -1 if it fails) 
;1845:      clientNum = G_ClientNumberFromString(ent, targetname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3092
ARGP4
ADDRLP4 5572
ADDRGP4 G_ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 5572
INDIRI4
ASGNI4
line 1846
;1846:    }
LABELV $1220
line 1848
;1847:
;1848:    if (clientNum == -1 && numMatches > 1) {
ADDRLP4 1040
INDIRI4
CNSTI4 -1
NEI4 $1221
ADDRLP4 4268
INDIRI4
CNSTI4 1
LEI4 $1221
line 1849
;1849:      G_MatchOnePlayer(clientNums, err, sizeof ( err));
ADDRLP4 4272
ARGP4
ADDRLP4 4528
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 1850
;1850:      ADMP(va("^3callteamvote: ^7%s\n", err));
ADDRGP4 $1223
ARGP4
ADDRLP4 4528
ARGP4
ADDRLP4 5572
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5572
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1851
;1851:      return;
ADDRGP4 $1151
JUMPV
LABELV $1221
line 1855
;1852:    }
;1853:
;1854:    // make sure this player is on the same team
;1855:    if (clientNum != -1 && level.clients[ clientNum ].pers.teamSelection !=
ADDRLP4 1040
INDIRI4
CNSTI4 -1
EQI4 $1224
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1224
line 1856
;1856:            team) {
line 1857
;1857:      clientNum = -1;
ADDRLP4 1040
CNSTI4 -1
ASGNI4
line 1858
;1858:    }
LABELV $1224
line 1860
;1859:
;1860:    if (clientNum != -1 &&
ADDRLP4 1040
INDIRI4
CNSTI4 -1
EQI4 $1226
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1226
line 1861
;1861:            level.clients[ clientNum ].pers.connected == CON_DISCONNECTED) {
line 1862
;1862:      clientNum = -1;
ADDRLP4 1040
CNSTI4 -1
ASGNI4
line 1863
;1863:    }
LABELV $1226
line 1865
;1864:
;1865:    if (clientNum != -1) {
ADDRLP4 1040
INDIRI4
CNSTI4 -1
EQI4 $1228
line 1866
;1866:      Q_strncpyz(name, level.clients[ clientNum ].pers.netname,
ADDRLP4 3132
ARGP4
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1868
;1867:              sizeof ( name));
;1868:      Q_CleanStr(name);
ADDRLP4 3132
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1869
;1869:      if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
CNSTI4 2476
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 5580
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 5580
INDIRI4
CNSTI4 0
EQI4 $1229
line 1870
;1870:        char reasonprint[ MAX_STRING_CHARS ] = "";
ADDRLP4 5584
ADDRGP4 $1232
INDIRB
ASGNB 1024
line 1871
;1871:        if (reason[ 0 ] != '\0')
ADDRLP4 2068
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1233
line 1872
;1872:          Com_sprintf(reasonprint, sizeof (reasonprint), "With reason: %s", reason);
ADDRLP4 5584
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $900
ARGP4
ADDRLP4 2068
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $1233
line 1874
;1873:
;1874:        Com_sprintf(message, sizeof ( message), "%s^7 attempted /callteamvote %s %s on immune admin %s^7 %s^7",
ADDRLP4 3173
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1235
ARGP4
ADDRLP4 6608
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 6608
INDIRI4
ADDP4
INDIRP4
ADDRLP4 6608
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1044
ARGP4
CNSTI4 2476
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
ADDRLP4 6608
INDIRI4
ADDP4
ARGP4
ADDRLP4 5584
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1876
;1875:                ent->client->pers.netname, arg1, arg2, g_entities[ clientNum ].client->pers.netname, reasonprint);
;1876:      }
line 1877
;1877:    } else {
ADDRGP4 $1229
JUMPV
LABELV $1228
line 1878
;1878:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1237
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1880
;1879:              "print \"callteamvote: invalid player\n\"");
;1880:      return;
ADDRGP4 $1151
JUMPV
LABELV $1229
line 1882
;1881:    }
;1882:  }
LABELV $1199
line 1884
;1883:
;1884:  if (!Q_stricmp(arg1, "kick")) {
ADDRLP4 12
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4268
INDIRI4
CNSTI4 0
NEI4 $1238
line 1885
;1885:    if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
CNSTI4 2476
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 4272
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4272
INDIRI4
CNSTI4 0
EQI4 $1240
line 1886
;1886:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1242
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1888
;1887:              "print \"callteamvote: admin is immune from vote kick\n\"");
;1888:      G_AdminsPrintf("%s\n", message);
ADDRGP4 $854
ARGP4
ADDRLP4 3173
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 1889
;1889:      return;
ADDRGP4 $1151
JUMPV
LABELV $1240
line 1894
;1890:    }
;1891:
;1892:
;1893:    // use ip in case this player disconnects before the vote ends
;1894:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1245
ARGP4
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 729
ADDP4
ARGP4
ADDRGP4 g_adminTempBan+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1898
;1895:            sizeof ( level.teamVoteString[ cs_offset ]),
;1896:            "!ban %s \"%s\" team vote kick", level.clients[ clientNum ].pers.ip,
;1897:            g_adminTempBan.string);
;1898:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1249
ARGP4
ADDRLP4 3132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1901
;1899:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1900:            "Kick player '%s'", name);
;1901:  } else if (!Q_stricmp(arg1, "denybuild")) {
ADDRGP4 $1239
JUMPV
LABELV $1238
ADDRLP4 12
ARGP4
ADDRGP4 $1201
ARGP4
ADDRLP4 4272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4272
INDIRI4
CNSTI4 0
NEI4 $1250
line 1902
;1902:    if (level.clients[ clientNum ].pers.denyBuild) {
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1252
line 1903
;1903:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1254
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1905
;1904:              "print \"callteamvote: player already lost building rights\n\"");
;1905:      return;
ADDRGP4 $1151
JUMPV
LABELV $1252
line 1908
;1906:    }
;1907:
;1908:    if (G_admin_permission(&g_entities[ clientNum ], ADMF_IMMUNITY)) {
CNSTI4 2476
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 4276
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4276
INDIRI4
CNSTI4 0
EQI4 $1255
line 1909
;1909:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1257
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1911
;1910:              "print \"callteamvote: admin is immune from denybuild\n\"");
;1911:      G_AdminsPrintf("%s\n", message);
ADDRGP4 $854
ARGP4
ADDRLP4 3173
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 1912
;1912:      return;
ADDRGP4 $1151
JUMPV
LABELV $1255
line 1915
;1913:    }
;1914:
;1915:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1260
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1917
;1916:            sizeof ( level.teamVoteString[ cs_offset ]), "!denybuild %i", clientNum);
;1917:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1263
ARGP4
ADDRLP4 3132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1920
;1918:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1919:            "Take away building rights from '%s'", name);
;1920:  } else if (!Q_stricmp(arg1, "allowbuild")) {
ADDRGP4 $1251
JUMPV
LABELV $1250
ADDRLP4 12
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 4276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4276
INDIRI4
CNSTI4 0
NEI4 $1264
line 1921
;1921:    if (!level.clients[ clientNum ].pers.denyBuild) {
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1266
line 1922
;1922:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1268
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1924
;1923:              "print \"callteamvote: player already has building rights\n\"");
;1924:      return;
ADDRGP4 $1151
JUMPV
LABELV $1266
line 1927
;1925:    }
;1926:
;1927:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1271
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1929
;1928:            sizeof ( level.teamVoteString[ cs_offset ]), "!allowbuild %i", clientNum);
;1929:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1274
ARGP4
ADDRLP4 3132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1932
;1930:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1931:            "Allow '%s' to build", name);
;1932:  } else if (!Q_stricmp(arg1, "designate")) {
ADDRGP4 $1265
JUMPV
LABELV $1264
ADDRLP4 12
ARGP4
ADDRGP4 $1203
ARGP4
ADDRLP4 4280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4280
INDIRI4
CNSTI4 0
NEI4 $1275
line 1933
;1933:    if (!g_designateVotes.integer) {
ADDRGP4 g_designateVotes+12
INDIRI4
CNSTI4 0
NEI4 $1277
line 1934
;1934:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1280
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1936
;1935:              "print \"callteamvote: Designate votes have been disabled.\n\"");
;1936:      return;
ADDRGP4 $1151
JUMPV
LABELV $1277
line 1939
;1937:    }
;1938:
;1939:    if (level.clients[ clientNum ].pers.designatedBuilder) {
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1281
line 1940
;1940:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1283
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1942
;1941:              "print \"callteamvote: player is already a designated builder\n\"");
;1942:      return;
ADDRGP4 $1151
JUMPV
LABELV $1281
line 1944
;1943:    }
;1944:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1286
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1946
;1945:            sizeof ( level.teamVoteString[ cs_offset ]), "!designate %i", clientNum);
;1946:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1289
ARGP4
ADDRLP4 3132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1949
;1947:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1948:            "Make '%s' a designated builder", name);
;1949:  } else if (!Q_stricmp(arg1, "undesignate")) {
ADDRGP4 $1276
JUMPV
LABELV $1275
ADDRLP4 12
ARGP4
ADDRGP4 $1204
ARGP4
ADDRLP4 4284
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4284
INDIRI4
CNSTI4 0
NEI4 $1290
line 1951
;1950:
;1951:    if (!g_designateVotes.integer) {
ADDRGP4 g_designateVotes+12
INDIRI4
CNSTI4 0
NEI4 $1292
line 1952
;1952:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1280
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1954
;1953:              "print \"callteamvote: Designate votes have been disabled.\n\"");
;1954:      return;
ADDRGP4 $1151
JUMPV
LABELV $1292
line 1957
;1955:    }
;1956:
;1957:    if (!level.clients[ clientNum ].pers.designatedBuilder) {
CNSTI4 2148
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1295
line 1958
;1958:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1297
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1960
;1959:              "print \"callteamvote: player is not currently a designated builder\n\"");
;1960:      return;
ADDRGP4 $1151
JUMPV
LABELV $1295
line 1962
;1961:    }
;1962:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1300
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1964
;1963:            sizeof ( level.teamVoteString[ cs_offset ]), "!undesignate %i", clientNum);
;1964:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1303
ARGP4
ADDRLP4 3132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1967
;1965:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1966:            "Remove designated builder status from '%s'", name);
;1967:  } else if (!Q_stricmp(arg1, "admitdefeat")) {
ADDRGP4 $1291
JUMPV
LABELV $1290
ADDRLP4 12
ARGP4
ADDRGP4 $1306
ARGP4
ADDRLP4 4288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4288
INDIRI4
CNSTI4 0
NEI4 $1304
line 1968
;1968:    if (numVoters <= 1) {
ADDRLP4 3128
INDIRI4
CNSTI4 1
GTI4 $1307
line 1969
;1969:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1309
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1971
;1970:              "print \"callteamvote: You cannot admitdefeat by yourself. Use /callvote draw.\n\"");
;1971:      return;
ADDRGP4 $1151
JUMPV
LABELV $1307
line 1974
;1972:    }
;1973:
;1974:    Com_sprintf(level.teamVoteString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1312
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1976
;1975:            sizeof ( level.teamVoteString[ cs_offset ]), "admitdefeat %i", team);
;1976:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1315
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1979
;1977:            sizeof ( level.teamVoteDisplayString[ cs_offset ]),
;1978:            "Admit Defeat");
;1979:  } else if (!Q_stricmp(arg1, "poll")) {
ADDRGP4 $1305
JUMPV
LABELV $1304
ADDRLP4 12
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 4292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4292
INDIRI4
CNSTI4 0
NEI4 $1316
line 1980
;1980:    if (arg2plus[ 0 ] == '\0') {
ADDRLP4 3168
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1318
line 1981
;1981:      trap_SendServerCommand(ent - g_entities, "print \"callteamvote: You forgot to specify what people should vote on.\n\"");
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
ADDRGP4 $1320
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1982
;1982:      return;
ADDRGP4 $1151
JUMPV
LABELV $1318
line 1984
;1983:    }
;1984:    Com_sprintf(level.teamVoteString[ cs_offset ], sizeof ( level.teamVoteString[ cs_offset ]), "%s", nullstring);
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+176288
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $946
ARGP4
ADDRLP4 3172
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1985
;1985:    Com_sprintf(level.teamVoteDisplayString[ cs_offset ],
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1019
ARGP4
ADDRLP4 3168
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1987
;1986:            sizeof ( level.voteDisplayString), "[Poll] \'%s\'", arg2plus);
;1987:  } else {
ADDRGP4 $1317
JUMPV
LABELV $1316
line 1988
;1988:    trap_SendServerCommand(ent - g_entities, "print \"Invalid vote string\n\"");
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
ADDRGP4 $840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1989
;1989:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1325
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1992
;1990:            "print \"Valid team vote commands are: "
;1991:            "kick, denybuild, allowbuild, poll, designate, undesignate, and admitdefeat\n\"");
;1992:    return;
ADDRGP4 $1151
JUMPV
LABELV $1317
LABELV $1305
LABELV $1291
LABELV $1276
LABELV $1265
LABELV $1251
LABELV $1239
line 1994
;1993:  }
;1994:  ent->client->pers.voteCount++;
ADDRLP4 4296
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 608
ADDP4
ASGNP4
ADDRLP4 4296
INDIRP4
ADDRLP4 4296
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1996
;1995:
;1996:  if (reason[0] != '\0')
ADDRLP4 2068
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1326
line 1997
;1997:    Q_strcat(level.teamVoteDisplayString[ cs_offset ], sizeof ( level.teamVoteDisplayString[ cs_offset ]), va(" Reason: '%s'^7", reason));
ADDRGP4 $1330
ARGP4
ADDRLP4 2068
ARGP4
ADDRLP4 4300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4300
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $1326
line 1999
;1998:
;1999:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1334
JUMPV
LABELV $1331
line 2000
;2000:    if (level.clients[ i ].pers.connected == CON_DISCONNECTED)
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
CNSTI4 0
NEI4 $1336
line 2001
;2001:      continue;
ADDRGP4 $1332
JUMPV
LABELV $1336
line 2003
;2002:
;2003:    if (level.clients[ i ].ps.stats[ STAT_PTEAM ] == team) {
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1338
line 2004
;2004:      trap_SendServerCommand(i, va("print \"%s " S_COLOR_WHITE
ADDRGP4 $1340
ARGP4
ADDRLP4 4304
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4304
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
ADDRLP4 4308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4308
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2006
;2005:              "called a team vote: %s^7 \n\"", ent->client->pers.netname, level.teamVoteDisplayString[ cs_offset ]));
;2006:    } else if (G_admin_permission(&g_entities[ i ], ADMF_ADMINCHAT) &&
ADDRGP4 $1339
JUMPV
LABELV $1338
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 4304
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4304
INDIRI4
CNSTI4 0
EQI4 $1342
ADDRLP4 12
ARGP4
ADDRGP4 $795
ARGP4
ADDRLP4 4308
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
EQI4 $1344
ADDRLP4 12
ARGP4
ADDRGP4 $1201
ARGP4
ADDRLP4 4312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4316
CNSTI4 0
ASGNI4
ADDRLP4 4312
INDIRI4
ADDRLP4 4316
INDIRI4
EQI4 $1344
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
ADDRLP4 4316
INDIRI4
NEI4 $1342
LABELV $1344
line 2008
;2007:            ((!Q_stricmp(arg1, "kick") || !Q_stricmp(arg1, "denybuild")) ||
;2008:            level.clients[ i ].pers.teamSelection == PTE_NONE)) {
line 2009
;2009:      trap_SendServerCommand(i, va("print \"^6[Admins]^7 %s " S_COLOR_WHITE
ADDRGP4 $1345
ARGP4
ADDRLP4 4320
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4320
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4320
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
ADDRLP4 4324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4324
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2011
;2010:              "called a team vote: %s^7 \n\"", ent->client->pers.netname, level.teamVoteDisplayString[ cs_offset ]));
;2011:    }
LABELV $1342
LABELV $1339
line 2012
;2012:  }
LABELV $1332
line 1999
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1334
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1331
line 2014
;2013:
;2014:  if (team == PTE_ALIENS)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1347
line 2015
;2015:    G_LogPrintf("Teamvote: %s^7 called a teamvote (aliens): %s^7\n", ent->client->pers.netname, level.teamVoteDisplayString[ cs_offset ]);
ADDRGP4 $1349
ARGP4
ADDRLP4 4304
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4304
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
ADDRGP4 $1348
JUMPV
LABELV $1347
line 2016
;2016:  else if (team == PTE_HUMANS)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $1351
line 2017
;2017:    G_LogPrintf("Teamvote: %s^7 called a teamvote (humans): %s^7\n", ent->client->pers.netname, level.teamVoteDisplayString[ cs_offset ]);
ADDRGP4 $1353
ARGP4
ADDRLP4 4308
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4308
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4308
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $1351
LABELV $1348
line 2019
;2018:
;2019:  Q_strcat(level.teamVoteDisplayString[ cs_offset ], sizeof ( level.teamVoteDisplayString[ cs_offset ]), va(" Called by: '%s^7'", ent->client->pers.netname));
ADDRGP4 $1105
ARGP4
ADDRLP4 4312
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4312
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4312
INDIRI4
ADDP4
ARGP4
ADDRLP4 4316
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4316
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 2022
;2020:
;2021:  // start the voting, the caller autoamtically votes yes
;2022:  level.teamVoteTime[ cs_offset ] = level.time;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180384
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2023
;2023:  level.teamVoteNo[ cs_offset ] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180400
ADDP4
CNSTI4 0
ASGNI4
line 2025
;2024:
;2025:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1363
JUMPV
LABELV $1360
line 2026
;2026:    if (level.clients[ i ].ps.stats[ STAT_PTEAM ] == team)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1365
line 2027
;2027:      level.clients[ i ].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 4320
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4320
INDIRP4
ADDRLP4 4320
INDIRP4
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
LABELV $1365
line 2028
;2028:  }
LABELV $1361
line 2025
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1363
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1360
line 2030
;2029:
;2030:  if (!Q_stricmp(arg1, "poll")) {
ADDRLP4 12
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 4320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4320
INDIRI4
CNSTI4 0
NEI4 $1367
line 2031
;2031:    level.teamVoteYes[ cs_offset ] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180392
ADDP4
CNSTI4 0
ASGNI4
line 2032
;2032:  } else {
ADDRGP4 $1368
JUMPV
LABELV $1367
line 2033
;2033:    level.teamVoteYes[ cs_offset ] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180392
ADDP4
CNSTI4 1
ASGNI4
line 2034
;2034:    ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 4324
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4324
INDIRP4
ADDRLP4 4324
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 2035
;2035:  }
LABELV $1368
line 2037
;2036:
;2037:  trap_SetConfigstring(CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[ cs_offset ]));
ADDRGP4 $1118
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180384
ADDP4
INDIRI4
ARGI4
ADDRLP4 4324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 4324
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2038
;2038:  trap_SetConfigstring(CS_TEAMVOTE_STRING + cs_offset, level.teamVoteDisplayString[ cs_offset ]);
ADDRLP4 4
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+178336
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2039
;2039:  trap_SetConfigstring(CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[ cs_offset ]));
ADDRGP4 $1118
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180392
ADDP4
INDIRI4
ARGI4
ADDRLP4 4332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 4332
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2040
;2040:  trap_SetConfigstring(CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[ cs_offset ]));
ADDRGP4 $1118
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180400
ADDP4
INDIRI4
ARGI4
ADDRLP4 4336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 4336
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2041
;2041:}
LABELV $1151
endproc Cmd_CallTeamVote_f 6612 32
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 80 12
line 2048
;2042:
;2043:/*
;2044:==================
;2045:Cmd_TeamVote_f
;2046:==================
;2047: */
;2048:void Cmd_TeamVote_f(gentity_t *ent) {
line 2049
;2049:  int cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2052
;2050:  char msg[ 64 ];
;2051:
;2052:  if (ent->client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1376
line 2053
;2053:    cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1376
line 2055
;2054:
;2055:  if (!level.teamVoteTime[ cs_offset ]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180384
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1378
line 2056
;2056:    trap_SendServerCommand(ent - g_entities, "print \"No team vote in progress\n\"");
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
ADDRGP4 $1381
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2057
;2057:    return;
ADDRGP4 $1375
JUMPV
LABELV $1378
line 2060
;2058:  }
;2059:
;2060:  if (ent->client->ps.eFlags & EF_TEAMVOTED) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1382
line 2061
;2061:    trap_SendServerCommand(ent - g_entities, "print \"Team vote already cast\n\"");
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
ADDRGP4 $1384
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2062
;2062:    return;
ADDRGP4 $1375
JUMPV
LABELV $1382
line 2065
;2063:  }
;2064:
;2065:  trap_SendServerCommand(ent - g_entities, "print \"Team vote cast\n\"");
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
ADDRGP4 $1385
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2067
;2066:
;2067:  ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 2069
;2068:
;2069:  trap_Argv(1, msg, sizeof ( msg));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2071
;2070:
;2071:  if (msg[ 0 ] == 'y' || msg[ 1 ] == 'Y' || msg[ 1 ] == '1') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1391
ADDRLP4 4+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1391
ADDRLP4 4+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1386
LABELV $1391
line 2072
;2072:    level.teamVoteYes[ cs_offset ]++;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180392
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2073
;2073:    trap_SetConfigstring(CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[ cs_offset ]));
ADDRGP4 $1118
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180392
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2074
;2074:  } else {
ADDRGP4 $1387
JUMPV
LABELV $1386
line 2075
;2075:    level.teamVoteNo[ cs_offset ]++;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180400
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2076
;2076:    trap_SetConfigstring(CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[ cs_offset ]));
ADDRGP4 $1118
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+180400
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2077
;2077:  }
LABELV $1387
line 2081
;2078:
;2079:  // a majority will be determined in TeamCheckVote, which will also account
;2080:  // for players entering or leaving
;2081:}
LABELV $1375
endproc Cmd_TeamVote_f 80 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2088
;2082:
;2083:/*
;2084:=================
;2085:Cmd_SetViewpos_f
;2086:=================
;2087: */
;2088:void Cmd_SetViewpos_f(gentity_t *ent) {
line 2093
;2089:  vec3_t origin, angles;
;2090:  char buffer[ MAX_TOKEN_CHARS ];
;2091:  int i;
;2092:
;2093:  if (trap_Argc() != 5) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1397
line 2094
;2094:    trap_SendServerCommand(ent - g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1399
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2095
;2095:    return;
ADDRGP4 $1396
JUMPV
LABELV $1397
line 2098
;2096:  }
;2097:
;2098:  VectorClear(angles);
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 2100
;2099:
;2100:  for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1402
line 2101
;2101:    trap_Argv(i + 1, buffer, sizeof ( buffer));
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2102
;2102:    origin[ i ] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2103
;2103:  }
LABELV $1403
line 2100
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1402
line 2105
;2104:
;2105:  trap_Argv(4, buffer, sizeof ( buffer));
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2106
;2106:  angles[ YAW ] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2108
;2107:
;2108:  TeleportPlayer(ent, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 2109
;2109:}
LABELV $1396
endproc Cmd_SetViewpos_f 1064 12
export Cmd_ViewPosPlayer_f
proc Cmd_ViewPosPlayer_f 8 16
line 2111
;2110:
;2111:void Cmd_ViewPosPlayer_f(gentity_t *ent) {
line 2112
;2112:    trap_SendServerCommand(ent - g_entities,
ADDRGP4 $1408
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2118
;2113:        va("print \"[  %f   %f   %f  ]\n\"",
;2114:            ent->client->ps.origin[0],
;2115:            ent->client->ps.origin[1],
;2116:            ent->client->ps.origin[2]
;2117:            ));
;2118:    return;
LABELV $1407
endproc Cmd_ViewPosPlayer_f 8 16
lit
align 4
LABELV $1410
byte 4 1133532779
byte 4 1133532779
byte 4 1133532779
export Cmd_Class_f
code
proc Cmd_Class_f 5252 16
line 2129
;2119:}
;2120:
;2121:#define AS_OVER_RT3         ((ALIENSENSE_RANGE*0.5f)/M_ROOT3)
;2122:
;2123:
;2124:/*
;2125:=================
;2126:Cmd_Class_f
;2127:=================
;2128: */
;2129:void Cmd_Class_f(gentity_t *ent) {
line 2133
;2130:  char s[ MAX_TOKEN_CHARS ];
;2131:  int clientNum;
;2132:  int i;
;2133:  pClass_t currentClass = ent->client->pers.classSelection;
ADDRLP4 5152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 2137
;2134:  pClass_t newClass;
;2135:  int numLevels;
;2136:  int entityList[ MAX_GENTITIES ];
;2137:  vec3_t range = {AS_OVER_RT3, AS_OVER_RT3, AS_OVER_RT3};
ADDRLP4 5140
ADDRGP4 $1410
INDIRB
ASGNB 12
line 2143
;2138:  vec3_t mins, maxs;
;2139:  int num;
;2140:  gentity_t *other;
;2141:
;2142:
;2143:  clientNum = ent->client - level.clients;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2148
DIVI4
ASGNI4
line 2144
;2144:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2145
;2145:  newClass = BG_FindClassNumForName(s);
ADDRLP4 8
ARGP4
ADDRLP4 5184
ADDRGP4 BG_FindClassNumForName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 5184
INDIRI4
ASGNI4
line 2147
;2146:
;2147:  if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1411
line 2148
;2148:    if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1413
line 2149
;2149:      G_StopFollowing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StopFollowing
CALLV
pop
LABELV $1413
line 2151
;2150:
;2151:    if (ent->client->pers.teamSelection == PTE_ALIENS) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1415
line 2152
;2152:      if (newClass != PCL_ALIEN_BUILDER0 &&
ADDRLP4 1032
INDIRI4
CNSTI4 1
EQI4 $1417
ADDRLP4 1032
INDIRI4
CNSTI4 2
EQI4 $1417
ADDRLP4 1032
INDIRI4
CNSTI4 3
EQI4 $1417
line 2154
;2153:              newClass != PCL_ALIEN_BUILDER0_UPG &&
;2154:              newClass != PCL_ALIEN_LEVEL0) {
line 2155
;2155:        trap_SendServerCommand(ent - g_entities,
ADDRGP4 $1419
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 5192
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 5192
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2157
;2156:                va("print \"You cannot spawn with class %s\n\"", s));
;2157:        return;
ADDRGP4 $1409
JUMPV
LABELV $1417
line 2158
;2158:      } else {
line 2159
;2159:        if (newClass == PCL_ALIEN_BUILDER0) {
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $1420
line 2160
;2160:          ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
line 2161
;2161:        }
LABELV $1420
line 2162
;2162:        if (newClass == PCL_ALIEN_BUILDER0_UPG && BG_FindStagesForWeapon(WP_HBUILD2, g_alienStage.integer)) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
NEI4 $1422
CNSTI4 20
ARGI4
ADDRGP4 g_alienStage+12
INDIRI4
ARGI4
ADDRLP4 5192
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 5192
INDIRI4
CNSTI4 0
EQI4 $1422
line 2163
;2163:          ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
line 2164
;2164:        }
LABELV $1422
line 2165
;2165:        if (newClass == PCL_ALIEN_LEVEL0) {
ADDRLP4 1032
INDIRI4
CNSTI4 3
NEI4 $1425
line 2166
;2166:          ent->client->pers.humanItemSelection = WP_ZOMBIE_BITE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 13
ASGNI4
line 2167
;2167:        }
LABELV $1425
line 2168
;2168:      }
line 2185
;2169:
;2170:      /*if( !BG_ClassIsAllowed( newClass ) )
;2171:      {
;2172:        trap_SendServerCommand( ent-g_entities,
;2173:          va( "print \"Class %s is not allowed\n\"", s ) );
;2174:        return;
;2175:      }*/
;2176:      /*
;2177:      if( !BG_FindStagesForClass( newClass, g_alienStage.integer ) )
;2178:      {
;2179:        trap_SendServerCommand( ent-g_entities,
;2180:          va( "print \"Class %s not allowed at stage %d\n\"",
;2181:              s, g_alienStage.integer ) );
;2182:        return;
;2183:      }*/
;2184:
;2185:      if( ent->client->pers.denyBuild && ( newClass==PCL_ALIEN_BUILDER0 || newClass==PCL_ALIEN_BUILDER0_UPG ) )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1427
ADDRLP4 1032
INDIRI4
CNSTI4 1
EQI4 $1429
ADDRLP4 1032
INDIRI4
CNSTI4 2
NEI4 $1427
LABELV $1429
line 2186
;2186:            {
line 2187
;2187:          	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1430
line 2188
;2188:          	  	  {
line 2189
;2189:          	  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 5196
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 5196
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2191
;2190:          	  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;2191:          	  		  return;
ADDRGP4 $1409
JUMPV
LABELV $1430
line 2193
;2192:          	  	  }
;2193:              trap_SendServerCommand( ent-g_entities, "print \"Your building rights have been revoked\n\"" );
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
ADDRGP4 $1432
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2194
;2194:              return;
ADDRGP4 $1409
JUMPV
LABELV $1427
line 2198
;2195:            }
;2196:
;2197:      // spawn from an egg
;2198:      if (G_PushSpawnQueue(&level.alienSpawnQueue, clientNum)) {
ADDRGP4 level+189292
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 5196
ADDRGP4 G_PushSpawnQueue
CALLI4
ASGNI4
ADDRLP4 5196
INDIRI4
CNSTI4 0
EQI4 $1409
line 2202
;2199:        /*
;2200:        ent->client->pers.classSelection = newClass;
;2201:        ent->client->ps.stats[ STAT_PCLASS ] = newClass;*/
;2202:        ent->client->pers.classSelection = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 11
ASGNI4
line 2203
;2203:        ent->client->ps.stats[ STAT_PCLASS ] = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 11
ASGNI4
line 2204
;2204:      }
line 2205
;2205:    } else if (ent->client->pers.teamSelection == PTE_HUMANS) {
ADDRGP4 $1409
JUMPV
LABELV $1415
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1409
line 2207
;2206:      //set the item to spawn with
;2207:      if (!Q_stricmp(s, BG_FindNameForWeapon(WP_MACHINEGUN)) &&
CNSTI4 3
ARGI4
ADDRLP4 5188
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5188
INDIRP4
ARGP4
ADDRLP4 5192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5192
INDIRI4
CNSTI4 0
NEI4 $1438
CNSTI4 3
ARGI4
ADDRLP4 5196
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5196
INDIRI4
CNSTI4 0
EQI4 $1438
line 2208
;2208:              BG_WeaponIsAllowed(WP_MACHINEGUN)) {
line 2209
;2209:        ent->client->pers.humanItemSelection = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
line 2210
;2210:      } else if (!Q_stricmp(s, BG_FindNameForWeapon(WP_HBUILD)) &&
ADDRGP4 $1439
JUMPV
LABELV $1438
CNSTI4 21
ARGI4
ADDRLP4 5200
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5200
INDIRP4
ARGP4
ADDRLP4 5204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5204
INDIRI4
CNSTI4 0
NEI4 $1440
CNSTI4 21
ARGI4
ADDRLP4 5208
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5208
INDIRI4
CNSTI4 0
EQI4 $1440
line 2211
;2211:              BG_WeaponIsAllowed(WP_HBUILD)) {
line 2212
;2212:        ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
line 2213
;2213:      } else if (!Q_stricmp(s, BG_FindNameForWeapon(WP_HBUILD2)) &&
ADDRGP4 $1441
JUMPV
LABELV $1440
CNSTI4 20
ARGI4
ADDRLP4 5212
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5212
INDIRP4
ARGP4
ADDRLP4 5216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5216
INDIRI4
CNSTI4 0
NEI4 $1442
CNSTI4 20
ARGI4
ADDRLP4 5220
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5220
INDIRI4
CNSTI4 0
EQI4 $1442
CNSTI4 20
ARGI4
ADDRGP4 g_humanStage+12
INDIRI4
ARGI4
ADDRLP4 5224
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 5224
INDIRI4
CNSTI4 0
EQI4 $1442
line 2215
;2214:              BG_WeaponIsAllowed(WP_HBUILD2) &&
;2215:              BG_FindStagesForWeapon(WP_HBUILD2, g_humanStage.integer)) {
line 2216
;2216:        ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
line 2217
;2217:      } else {
ADDRGP4 $1443
JUMPV
LABELV $1442
line 2218
;2218:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1445
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2220
;2219:                "print \"Unknown starting item\n\"");
;2220:        return;
ADDRGP4 $1409
JUMPV
LABELV $1443
LABELV $1441
LABELV $1439
line 2223
;2221:      }
;2222:      // spawn from a telenode
;2223:      G_LogOnlyPrintf("ClientTeamClass: %i human %s\n", clientNum, s);
ADDRGP4 $1446
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 2224
;2224:      if (G_PushSpawnQueue(&level.humanSpawnQueue, clientNum)) {
ADDRGP4 level+189556
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 5228
ADDRGP4 G_PushSpawnQueue
CALLI4
ASGNI4
ADDRLP4 5228
INDIRI4
CNSTI4 0
EQI4 $1409
line 2225
;2225:        ent->client->pers.classSelection = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 11
ASGNI4
line 2226
;2226:        ent->client->ps.stats[ STAT_PCLASS ] = PCL_HUMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 11
ASGNI4
line 2227
;2227:      }
line 2228
;2228:    }
line 2229
;2229:    return;
ADDRGP4 $1409
JUMPV
LABELV $1411
line 2232
;2230:  }
;2231:
;2232:  if (ent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1450
line 2233
;2233:    return;
ADDRGP4 $1409
JUMPV
LABELV $1450
line 2235
;2234:
;2235:  if (ent->client->pers.teamSelection == PTE_ALIENS &&
ADDRLP4 5188
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5188
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1452
ADDRLP4 5192
ADDRLP4 5188
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
ADDRLP4 5196
CNSTI4 0
ASGNI4
ADDRLP4 5192
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 5196
INDIRI4
NEI4 $1452
ADDRLP4 5192
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 5196
INDIRI4
NEI4 $1452
line 2237
;2236:          !(ent->client->ps.stats[ STAT_STATE ] & SS_INFESTING) &&
;2237:          !(ent->client->ps.stats[ STAT_STATE ] & SS_HOVELING)) {
line 2238
;2238:    if (newClass == PCL_NONE) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1454
line 2239
;2239:      trap_SendServerCommand(ent - g_entities, "print \"Unknown class\n\"");
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
ADDRGP4 $1456
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2240
;2240:      return;
ADDRGP4 $1409
JUMPV
LABELV $1454
line 2244
;2241:    }
;2242:
;2243:    //if we are not currently spectating, we are attempting evolution
;2244:    if (ent->client->pers.classSelection != PCL_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1457
line 2245
;2245:      if ((ent->client->ps.stats[ STAT_STATE ] & SS_WALLCLIMBING) ||
ADDRLP4 5200
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
ADDRLP4 5204
CNSTI4 0
ASGNI4
ADDRLP4 5200
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 5204
INDIRI4
NEI4 $1461
ADDRLP4 5200
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 5204
INDIRI4
EQI4 $1459
LABELV $1461
line 2246
;2246:              (ent->client->ps.stats[ STAT_STATE ] & SS_WALLCLIMBINGCEILING)) {
line 2247
;2247:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1462
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2249
;2248:                "print \"You cannot evolve while wallwalking\n\"");
;2249:        return;
ADDRGP4 $1409
JUMPV
LABELV $1459
line 2253
;2250:      }
;2251:
;2252:      //check there are no humans nearby
;2253:      VectorAdd(ent->client->ps.origin, range, maxs);
ADDRLP4 5208
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 5168
ADDRLP4 5208
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5140
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5168+4
ADDRLP4 5208
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5140+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5168+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5140+8
INDIRF4
ADDF4
ASGNF4
line 2254
;2254:      VectorSubtract(ent->client->ps.origin, range, mins);
ADDRLP4 5212
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 5156
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5140
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5156+4
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5140+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5156+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5140+8
INDIRF4
SUBF4
ASGNF4
line 2256
;2255:
;2256:      num = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 5156
ARGP4
ADDRLP4 5168
ARGP4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5216
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 5136
ADDRLP4 5216
INDIRI4
ASGNI4
line 2257
;2257:      for (i = 0; i < num; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1474
JUMPV
LABELV $1471
line 2258
;2258:        other = &g_entities[ entityList[ i ] ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1040
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2260
;2259:
;2260:        if ((other->client && other->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS) ||
ADDRLP4 5220
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1478
ADDRLP4 5220
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1477
LABELV $1478
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1475
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1475
LABELV $1477
line 2261
;2261:                (other->s.eType == ET_BUILDABLE && other->biteam == BIT_HUMANS)) {
line 2262
;2262:          G_TriggerMenu(clientNum, MN_A_TOOCLOSE);
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2263
;2263:          return;
ADDRGP4 $1409
JUMPV
LABELV $1475
line 2265
;2264:        }
;2265:      }
LABELV $1472
line 2257
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1474
ADDRLP4 4
INDIRI4
ADDRLP4 5136
INDIRI4
LTI4 $1471
line 2267
;2266:
;2267:      if (!level.overmindPresent) {
ADDRGP4 level+189252
INDIRI4
CNSTI4 0
NEI4 $1479
line 2268
;2268:        G_TriggerMenu(clientNum, MN_A_NOOVMND_EVOLVE);
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2269
;2269:        return;
ADDRGP4 $1409
JUMPV
LABELV $1479
line 2273
;2270:      }
;2271:
;2272:      //guard against selling the HBUILD weapons exploit
;2273:      if (ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
ADDRLP4 5220
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 5220
INDIRI4
EQI4 $1482
ADDRLP4 5224
ADDRLP4 5152
INDIRI4
ASGNI4
ADDRLP4 5224
INDIRI4
ADDRLP4 5220
INDIRI4
EQI4 $1484
ADDRLP4 5224
INDIRI4
CNSTI4 2
NEI4 $1482
LABELV $1484
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1482
line 2276
;2274:              (currentClass == PCL_ALIEN_BUILDER0 ||
;2275:              currentClass == PCL_ALIEN_BUILDER0_UPG) &&
;2276:              ent->client->ps.stats[ STAT_MISC ] > 0) {
line 2277
;2277:        trap_SendServerCommand(ent - g_entities,
ADDRGP4 $1485
ARGP4
ADDRLP4 5228
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 5228
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2279
;2278:                va("print \"You cannot evolve until build timer expires\n\""));
;2279:        return;
ADDRGP4 $1409
JUMPV
LABELV $1482
line 2282
;2280:      }
;2281:
;2282:      numLevels = BG_ClassCanEvolveFromTo(currentClass,
ADDRLP4 5152
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 5228
ADDRGP4 BG_ClassCanEvolveFromTo
CALLI4
ASGNI4
ADDRLP4 5180
ADDRLP4 5228
INDIRI4
ASGNI4
line 2323
;2283:              newClass,
;2284:              (short) ent->client->ps.persistant[ PERS_CREDIT ], 0);
;2285:
;2286:      /*if( G_RoomForClassChange( ent, newClass, infestOrigin ) )
;2287:      {
;2288:        //...check we can evolve to that class
;2289:        if( numLevels >= 0 &&
;2290:            BG_FindStagesForClass( newClass, g_alienStage.integer ) &&
;2291:            BG_ClassIsAllowed( newClass ) )
;2292:        {
;2293:          G_LogOnlyPrintf("ClientTeamClass: %i alien %s\n", clientNum, s);
;2294:
;2295:          ent->client->pers.evolveHealthFraction = (float)ent->client->ps.stats[ STAT_HEALTH ] /
;2296:            (float)BG_FindHealthForClass( currentClass );
;2297:
;2298:          if( ent->client->pers.evolveHealthFraction < 0.0f )
;2299:            ent->client->pers.evolveHealthFraction = 0.0f;
;2300:          else if( ent->client->pers.evolveHealthFraction > 1.0f )
;2301:            ent->client->pers.evolveHealthFraction = 1.0f;
;2302:
;2303:          //remove credit
;2304:          G_AddCreditToClient( ent->client, -(short)numLevels, qtrue );
;2305:          ent->client->pers.classSelection = newClass;
;2306:          ClientUserinfoChanged( clientNum );
;2307:          VectorCopy( infestOrigin, ent->s.pos.trBase );
;2308:          ClientSpawn( ent, ent, ent->s.pos.trBase, ent->s.apos.trBase );
;2309:          return;
;2310:        }
;2311:        else
;2312:        {
;2313:          trap_SendServerCommand( ent-g_entities,
;2314:               "print \"You cannot evolve from your current class\n\"" );
;2315:          return;
;2316:        }
;2317:      }
;2318:      else
;2319:      {
;2320:        G_TriggerMenu( clientNum, MN_A_NOEROOM );
;2321:        return;
;2322:      }*/
;2323:    } else if (ent->client->pers.teamSelection == PTE_HUMANS) {
ADDRGP4 $1458
JUMPV
LABELV $1457
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1486
line 2325
;2324:      //humans cannot use this command whilst alive
;2325:      if (ent->client->pers.classSelection != PCL_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1488
line 2326
;2326:        trap_SendServerCommand(ent - g_entities, va("print \"You must be dead to use the class command\n\""));
ADDRGP4 $1490
ARGP4
ADDRLP4 5200
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 5200
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2327
;2327:        return;
ADDRGP4 $1409
JUMPV
LABELV $1488
line 2330
;2328:      }
;2329:
;2330:      ent->client->pers.classSelection =
ADDRLP4 5200
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5204
CNSTI4 11
ASGNI4
ADDRLP4 5200
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 5204
INDIRI4
ASGNI4
ADDRLP4 5200
INDIRP4
CNSTI4 616
ADDP4
ADDRLP4 5204
INDIRI4
ASGNI4
line 2334
;2331:              ent->client->ps.stats[ STAT_PCLASS ] = PCL_HUMAN;
;2332:
;2333:      //set the item to spawn with
;2334:      if (!Q_stricmp(s, BG_FindNameForWeapon(WP_MACHINEGUN)) && BG_WeaponIsAllowed(WP_MACHINEGUN))
CNSTI4 3
ARGI4
ADDRLP4 5208
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5208
INDIRP4
ARGP4
ADDRLP4 5212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5212
INDIRI4
CNSTI4 0
NEI4 $1491
CNSTI4 3
ARGI4
ADDRLP4 5216
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5216
INDIRI4
CNSTI4 0
EQI4 $1491
line 2335
;2335:        ent->client->pers.humanItemSelection = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
ADDRGP4 $1492
JUMPV
LABELV $1491
line 2336
;2336:      else if (!Q_stricmp(s, BG_FindNameForWeapon(WP_HBUILD)) && BG_WeaponIsAllowed(WP_HBUILD))
CNSTI4 21
ARGI4
ADDRLP4 5220
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5220
INDIRP4
ARGP4
ADDRLP4 5224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5224
INDIRI4
CNSTI4 0
NEI4 $1493
CNSTI4 21
ARGI4
ADDRLP4 5228
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5228
INDIRI4
CNSTI4 0
EQI4 $1493
line 2337
;2337:        ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
ADDRGP4 $1494
JUMPV
LABELV $1493
line 2338
;2338:      else if (!Q_stricmp(s, BG_FindNameForWeapon(WP_HBUILD2)) && BG_WeaponIsAllowed(WP_HBUILD2) &&
CNSTI4 20
ARGI4
ADDRLP4 5232
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 5232
INDIRP4
ARGP4
ADDRLP4 5236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5236
INDIRI4
CNSTI4 0
NEI4 $1495
CNSTI4 20
ARGI4
ADDRLP4 5240
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 5240
INDIRI4
CNSTI4 0
EQI4 $1495
CNSTI4 20
ARGI4
ADDRGP4 g_humanStage+12
INDIRI4
ARGI4
ADDRLP4 5244
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 5244
INDIRI4
CNSTI4 0
EQI4 $1495
line 2340
;2339:              BG_FindStagesForWeapon(WP_HBUILD2, g_humanStage.integer))
;2340:        ent->client->pers.humanItemSelection = WP_HBUILD2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 20
ASGNI4
ADDRGP4 $1496
JUMPV
LABELV $1495
line 2341
;2341:      else {
line 2342
;2342:        ent->client->pers.classSelection = PCL_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 2343
;2343:        trap_SendServerCommand(ent - g_entities, va("print \"Unknown starting item\n\""));
ADDRGP4 $1445
ARGP4
ADDRLP4 5248
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 5248
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2344
;2344:        return;
ADDRGP4 $1409
JUMPV
LABELV $1496
LABELV $1494
LABELV $1492
line 2347
;2345:      }
;2346:
;2347:      G_LogOnlyPrintf("ClientTeamClass: %i human %s\n", clientNum, s);
ADDRGP4 $1446
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 G_LogOnlyPrintf
CALLV
pop
line 2349
;2348:
;2349:      G_PushSpawnQueue(&level.humanSpawnQueue, clientNum);
ADDRGP4 level+189556
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 G_PushSpawnQueue
CALLI4
pop
line 2350
;2350:    }
LABELV $1486
LABELV $1458
line 2351
;2351:  }
LABELV $1452
line 2352
;2352:}
LABELV $1409
endproc Cmd_Class_f 5252 16
export DBCommand
proc DBCommand 12 8
line 2361
;2353:
;2354:/*
;2355:=================
;2356:DBCommand
;2357:
;2358:Send command to all designated builders of selected team
;2359:=================
;2360: */
;2361:void DBCommand(pTeam_t team, const char *text) {
line 2365
;2362:  int i;
;2363:  gentity_t *ent;
;2364:
;2365:  for (i = 0, ent = g_entities + i; i < level.maxclients; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1503
JUMPV
LABELV $1500
line 2366
;2366:    if (!ent->client || (ent->client->pers.connected != CON_CONNECTED) ||
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1509
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1509
ADDRLP4 8
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1509
ADDRLP4 8
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1505
LABELV $1509
line 2369
;2367:            (ent->client->pers.teamSelection != team) ||
;2368:            !ent->client->pers.designatedBuilder)
;2369:      continue;
ADDRGP4 $1501
JUMPV
LABELV $1505
line 2371
;2370:
;2371:    trap_SendServerCommand(i, text);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2372
;2372:  }
LABELV $1501
line 2365
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
LABELV $1503
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1500
line 2373
;2373:}
LABELV $1499
endproc DBCommand 12 8
export Cmd_Destroy_f
proc Cmd_Destroy_f 224 32
line 2380
;2374:
;2375:/*
;2376:=================
;2377:Cmd_Destroy_f
;2378:=================
;2379: */
;2380:void Cmd_Destroy_f(gentity_t *ent) {
line 2385
;2381:  vec3_t forward, end;
;2382:  trace_t tr;
;2383:  gentity_t *traceEnt;
;2384:  char cmd[ 12 ];
;2385:  qboolean deconstruct = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 2387
;2386:
;2387:  if( ent->client->pers.denyBuild )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1511
line 2388
;2388:  {
line 2389
;2389:	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1513
line 2390
;2390:	  	  {
line 2391
;2391:	  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2393
;2392:	  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;2393:	  		  return;
ADDRGP4 $1510
JUMPV
LABELV $1513
line 2395
;2394:	  	  }
;2395:    trap_SendServerCommand( ent-g_entities,
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
ADDRGP4 $1515
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2397
;2396:      "print \"^1Your building rights have been revoked\n\"" );
;2397:    return;
ADDRGP4 $1510
JUMPV
LABELV $1511
line 2400
;2398:  }
;2399:
;2400:  if (g_survival.integer) {
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1516
line 2401
;2401:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1519
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2403
;2402:            "print \"Cannot decon on survival mode\n\"");
;2403:    return;
ADDRGP4 $1510
JUMPV
LABELV $1516
line 2405
;2404:  }
;2405:  if (ent->client->pers.denyBuild) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1520
line 2406
;2406:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1432
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2408
;2407:            "print \"Your building rights have been revoked\n\"");
;2408:    return;
ADDRGP4 $1510
JUMPV
LABELV $1520
line 2411
;2409:  }
;2410:
;2411:  trap_Argv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2412
;2412:  if (Q_stricmp(cmd, "destroy") == 0)
ADDRLP4 4
ARGP4
ADDRGP4 $1524
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $1522
line 2413
;2413:    deconstruct = qfalse;
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $1522
line 2415
;2414:
;2415:  if (ent->client->ps.stats[ STAT_STATE ] & SS_HOVELING) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1525
line 2416
;2416:    if ((ent->client->hovel->s.eFlags & EF_DBUILDER) &&
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRP4
CNSTI4 1316
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $1527
ADDRLP4 108
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1527
line 2417
;2417:            !ent->client->pers.designatedBuilder) {
line 2418
;2418:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1529
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2420
;2419:              "print \"This structure is protected by designated builder\n\"");
;2420:      DBCommand(ent->client->pers.teamSelection,
ADDRGP4 $1530
ARGP4
ADDRLP4 116
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 DBCommand
CALLV
pop
line 2423
;2421:              va("print \"%s^3 has attempted to decon a protected structure!\n\"",
;2422:              ent->client->pers.netname));
;2423:      return;
ADDRGP4 $1510
JUMPV
LABELV $1527
line 2425
;2424:    }
;2425:    G_Damage(ent->client->hovel, ent, ent, forward, ent->s.origin,
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 92
ADDP4
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
line 2427
;2426:            10000, 0, MOD_SUICIDE);
;2427:  }
LABELV $1525
line 2429
;2428:
;2429:  if (!(ent->client->ps.stats[ STAT_STATE ] & SS_INFESTING)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $1531
line 2430
;2430:    AngleVectors(ent->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 16
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
ADDRGP4 AngleVectors
CALLV
pop
line 2431
;2431:    VectorMA(ent->client->ps.origin, 100, forward, end);
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 116
CNSTF4 1120403456
ASGNF4
ADDRLP4 28
ADDRLP4 112
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1120403456
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2433
;2432:
;2433:    trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, end, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 44
ARGP4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
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
ADDRLP4 28
ARGP4
ADDRLP4 120
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2434
;2434:    traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 44+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2436
;2435:
;2436:    if (tr.fraction < 1.0f &&
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
GEF4 $1538
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1538
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 132
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
NEI4 $1538
ADDRLP4 136
ADDRLP4 132
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 18
LTI4 $1538
ADDRLP4 136
INDIRI4
CNSTI4 21
GTI4 $1538
line 2440
;2437:            (traceEnt->s.eType == ET_BUILDABLE) &&
;2438:            (traceEnt->biteam == ent->client->pers.teamSelection) &&
;2439:            ((ent->client->ps.weapon >= WP_ABUILD) &&
;2440:            (ent->client->ps.weapon <= WP_HBUILD))) {
line 2442
;2441:      // Cancel deconstruction
;2442:      if (g_markDeconstruct.integer && traceEnt->deconstruct) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 g_markDeconstruct+12
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1541
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1541
line 2443
;2443:        traceEnt->deconstruct = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 0
ASGNI4
line 2444
;2444:        return;
ADDRGP4 $1510
JUMPV
LABELV $1541
line 2446
;2445:      }
;2446:      if ((traceEnt->s.eFlags & EF_DBUILDER) &&
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
ADDRLP4 144
INDIRI4
EQI4 $1544
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
NEI4 $1544
line 2447
;2447:              !ent->client->pers.designatedBuilder) {
line 2448
;2448:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1529
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2450
;2449:                "print \"This structure is protected by designated builder\n\"");
;2450:        DBCommand(ent->client->pers.teamSelection,
ADDRGP4 $1530
ARGP4
ADDRLP4 148
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ARGP4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 DBCommand
CALLV
pop
line 2453
;2451:                va("print \"%s^3 has attempted to decon a protected structure!\n\"",
;2452:                ent->client->pers.netname));
;2453:        return;
ADDRGP4 $1510
JUMPV
LABELV $1544
line 2458
;2454:      }
;2455:
;2456:
;2457:      // Prevent destruction of the last spawn
;2458:      if (!g_markDeconstruct.integer && !g_cheats.integer) {
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRGP4 g_markDeconstruct+12
INDIRI4
ADDRLP4 148
INDIRI4
NEI4 $1546
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 148
INDIRI4
NEI4 $1546
line 2459
;2459:        if (ent->client->pers.teamSelection == PTE_ALIENS &&
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1550
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1550
line 2460
;2460:                traceEnt->s.modelindex == BA_H_SPAWN) {
line 2461
;2461:          if (level.numAlienSpawns <= 1)
ADDRGP4 level+185088
INDIRI4
CNSTI4 1
GTI4 $1551
line 2462
;2462:            return;
ADDRGP4 $1510
JUMPV
line 2463
;2463:        } else if (ent->client->pers.teamSelection == PTE_HUMANS &&
LABELV $1550
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1555
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1555
line 2464
;2464:                traceEnt->s.modelindex == BA_H_SPAWN) {
line 2465
;2465:          if (level.numHumanSpawns <= 1)
ADDRGP4 level+185092
INDIRI4
CNSTI4 1
GTI4 $1557
line 2466
;2466:            return;
ADDRGP4 $1510
JUMPV
LABELV $1557
line 2467
;2467:        }
LABELV $1555
LABELV $1551
line 2468
;2468:      }
LABELV $1546
line 2470
;2469:
;2470:      if (g_ctn.integer > 0) {
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $1560
line 2471
;2471:        if (traceEnt->s.modelindex == BA_H_SPAWN || (!traceEnt->builder || traceEnt->builder != ent)) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
EQI4 $1566
ADDRLP4 156
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 156
INDIRU4
CNSTU4 0
EQU4 $1566
ADDRLP4 156
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1563
LABELV $1566
line 2472
;2472:          return;
ADDRGP4 $1510
JUMPV
LABELV $1563
line 2474
;2473:        }
;2474:      }
LABELV $1560
line 2476
;2475:      // Don't allow destruction of hovel with granger inside
;2476:      if (traceEnt->s.modelindex == BA_A_HOVEL && traceEnt->active)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1567
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1567
line 2477
;2477:        return;
ADDRGP4 $1510
JUMPV
LABELV $1567
line 2480
;2478:
;2479:      // Don't allow destruction of buildables that cannot be rebuilt
;2480:      if (g_suddenDeath.integer && traceEnt->health > 0 &&
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRGP4 g_suddenDeath+12
INDIRI4
ADDRLP4 156
INDIRI4
EQI4 $1569
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 156
INDIRI4
LEI4 $1569
ADDRGP4 g_suddenDeathMode+12
INDIRI4
CNSTI4 2
NEI4 $1576
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 BG_FindReplaceableTestForBuildable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $1577
LABELV $1576
ADDRGP4 g_suddenDeathMode+12
INDIRI4
CNSTI4 0
NEI4 $1578
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 BG_FindBuildPointsForBuildable
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $1577
LABELV $1578
ADDRGP4 g_suddenDeathMode+12
INDIRI4
CNSTI4 1
NEI4 $1569
LABELV $1577
line 2485
;2481:              ((g_suddenDeathMode.integer == SDMODE_SELECTIVE &&
;2482:              !BG_FindReplaceableTestForBuildable(traceEnt->s.modelindex)) ||
;2483:              (g_suddenDeathMode.integer == SDMODE_BP &&
;2484:              BG_FindBuildPointsForBuildable(traceEnt->s.modelindex)) ||
;2485:              g_suddenDeathMode.integer == SDMODE_NO_BUILD)) {
line 2486
;2486:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1579
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2489
;2487:                "print \"During Sudden Death you can only decon buildings that "
;2488:                "can be rebuilt\n\"");
;2489:        return;
ADDRGP4 $1510
JUMPV
LABELV $1569
line 2492
;2490:      }
;2491:
;2492:      if (ent->client->ps.stats[ STAT_MISC ] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1580
line 2493
;2493:        G_AddEvent(ent, EV_BUILD_DELAY, ent->client->ps.clientNum);
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 172
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2494
;2494:        return;
ADDRGP4 $1510
JUMPV
LABELV $1580
line 2497
;2495:      }
;2496:
;2497:      if (traceEnt->health > 0 || g_deconDead.integer) {
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
GTI4 $1585
ADDRGP4 g_deconDead+12
INDIRI4
ADDRLP4 172
INDIRI4
EQI4 $1582
LABELV $1585
line 2498
;2498:        if (g_markDeconstruct.integer) {
ADDRGP4 g_markDeconstruct+12
INDIRI4
CNSTI4 0
EQI4 $1586
line 2499
;2499:          traceEnt->deconstruct = qtrue; // Mark buildable for deconstruction
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 1
ASGNI4
line 2500
;2500:          traceEnt->deconstructTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2501
;2501:        } else {
ADDRGP4 $1587
JUMPV
LABELV $1586
line 2502
;2502:          if (traceEnt->health > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1590
line 2505
;2503:            buildHistory_t *new;
;2504:
;2505:            new = G_Alloc(sizeof ( buildHistory_t));
CNSTI4 108
ARGI4
ADDRLP4 180
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 176
ADDRLP4 180
INDIRP4
ASGNP4
line 2506
;2506:            new->ID = (++level.lastBuildID > 1000)
ADDRLP4 188
ADDRGP4 level+189976
ASGNP4
ADDRLP4 192
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 188
INDIRP4
ADDRLP4 192
INDIRI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 1000
LEI4 $1596
ADDRLP4 196
CNSTI4 1
ASGNI4
ADDRGP4 level+189976
ADDRLP4 196
INDIRI4
ASGNI4
ADDRLP4 184
ADDRLP4 196
INDIRI4
ASGNI4
ADDRGP4 $1597
JUMPV
LABELV $1596
ADDRLP4 184
ADDRGP4 level+189976
INDIRI4
ASGNI4
LABELV $1597
ADDRLP4 176
INDIRP4
ADDRLP4 184
INDIRI4
ASGNI4
line 2508
;2507:                    ? (level.lastBuildID = 1) : level.lastBuildID;
;2508:            new->ent = ent;
ADDRLP4 176
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2509
;2509:            new->name[ 0 ] = 0;
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
CNSTI1 0
ASGNI1
line 2510
;2510:            new->buildable = traceEnt->s.modelindex;
ADDRLP4 176
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 2511
;2511:            VectorCopy(traceEnt->s.pos.trBase, new->origin);
ADDRLP4 176
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2512
;2512:            VectorCopy(traceEnt->s.angles, new->angles);
ADDRLP4 176
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2513
;2513:            VectorCopy(traceEnt->s.origin2, new->origin2);
ADDRLP4 176
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2514
;2514:            VectorCopy(traceEnt->s.angles2, new->angles2);
ADDRLP4 176
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 2515
;2515:            new->fate = BF_DECONNED;
ADDRLP4 176
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 2516
;2516:            new->next = NULL;
ADDRLP4 176
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 2517
;2517:            new->marked = NULL;
ADDRLP4 176
INDIRP4
CNSTI4 104
ADDP4
CNSTP4 0
ASGNP4
line 2518
;2518:            G_LogBuild(new);
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 G_LogBuild
CALLI4
pop
line 2520
;2519:
;2520:            G_TeamCommand(ent->client->pers.teamSelection,
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 200
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $1598
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 2525
;2521:                    va("print \"%s ^3DECONSTRUCTED^7 by %s^7\n\"",
;2522:                    BG_FindHumanNameForBuildable(traceEnt->s.modelindex),
;2523:                    ent->client->pers.netname));
;2524:
;2525:            G_LogPrintf("Decon: %i %i 0: %s^7 deconstructed %s\n",
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $1599
ARGP4
ADDRLP4 216
CNSTI4 516
ASGNI4
ADDRLP4 220
ADDRFP4 0
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 220
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
ARGP4
ADDRLP4 212
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2530
;2526:                    ent->client->ps.clientNum,
;2527:                    traceEnt->s.modelindex,
;2528:                    ent->client->pers.netname,
;2529:                    BG_FindNameForBuildable(traceEnt->s.modelindex));
;2530:          }
LABELV $1590
line 2532
;2531:
;2532:          if (!deconstruct)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1600
line 2533
;2533:            G_Damage(traceEnt, ent, ent, forward, tr.endpos, 10000, 0, MOD_SUICIDE);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 44+12
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
ADDRGP4 $1601
JUMPV
LABELV $1600
line 2535
;2534:          else
;2535:            G_FreeEntity(traceEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $1601
line 2537
;2536:
;2537:          if (!g_cheats.integer)
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1603
line 2538
;2538:            ent->client->ps.stats[ STAT_MISC ] +=
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BG_FindBuildDelayForWeapon
CALLI4
ASGNI4
ADDRLP4 188
ADDRLP4 180
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
ADDRLP4 184
INDIRI4
CNSTI4 2
RSHI4
ADDI4
ASGNI4
LABELV $1603
line 2540
;2539:                  BG_FindBuildDelayForWeapon(ent->s.weapon) >> 2;
;2540:        }
LABELV $1587
line 2541
;2541:      }
LABELV $1582
line 2542
;2542:    }
LABELV $1538
line 2543
;2543:  }
LABELV $1531
line 2544
;2544:}
LABELV $1510
endproc Cmd_Destroy_f 224 32
export Cmd_ActivateItem_f
proc Cmd_ActivateItem_f 1060 12
line 2553
;2545:
;2546:/*
;2547:=================
;2548:Cmd_ActivateItem_f
;2549:
;2550:Activate an item
;2551:=================
;2552: */
;2553:void Cmd_ActivateItem_f(gentity_t *ent) {
line 2557
;2554:  char s[ MAX_TOKEN_CHARS ];
;2555:  int upgrade, weapon;
;2556:
;2557:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2558
;2558:  upgrade = BG_FindUpgradeNumForName(s);
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 BG_FindUpgradeNumForName
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1032
INDIRI4
ASGNI4
line 2559
;2559:  weapon = BG_FindWeaponNumForName(s);
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 BG_FindWeaponNumForName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1036
INDIRI4
ASGNI4
line 2561
;2560:
;2561:  if (upgrade != UP_NONE && BG_InventoryContainsUpgrade(upgrade, ent->client->ps.stats))
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $1607
ADDRLP4 1024
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $1607
line 2562
;2562:    BG_ActivateUpgrade(upgrade, ent->client->ps.stats);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_ActivateUpgrade
CALLV
pop
ADDRGP4 $1608
JUMPV
LABELV $1607
line 2563
;2563:  else if (weapon != WP_NONE && BG_InventoryContainsWeapon(weapon, ent->client->ps.stats))
ADDRLP4 1048
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1609
ADDRLP4 1048
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1052
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1609
line 2564
;2564:    G_ForceWeaponChange(ent, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
ADDRGP4 $1610
JUMPV
LABELV $1609
line 2566
;2565:  else
;2566:    trap_SendServerCommand(ent - g_entities, va("print \"You don't have the %s\n\"", s));
ADDRGP4 $1611
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1610
LABELV $1608
line 2567
;2567:}
LABELV $1606
endproc Cmd_ActivateItem_f 1060 12
export Cmd_DeActivateItem_f
proc Cmd_DeActivateItem_f 1040 12
line 2576
;2568:
;2569:/*
;2570:=================
;2571:Cmd_DeActivateItem_f
;2572:
;2573:Deactivate an item
;2574:=================
;2575: */
;2576:void Cmd_DeActivateItem_f(gentity_t *ent) {
line 2580
;2577:  char s[ MAX_TOKEN_CHARS ];
;2578:  int upgrade;
;2579:
;2580:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2581
;2581:  upgrade = BG_FindUpgradeNumForName(s);
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 BG_FindUpgradeNumForName
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
line 2583
;2582:
;2583:  if (BG_InventoryContainsUpgrade(upgrade, ent->client->ps.stats))
ADDRLP4 1024
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $1613
line 2584
;2584:    BG_DeactivateUpgrade(upgrade, ent->client->ps.stats);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_DeactivateUpgrade
CALLV
pop
ADDRGP4 $1614
JUMPV
LABELV $1613
line 2586
;2585:  else
;2586:    trap_SendServerCommand(ent - g_entities, va("print \"You don't have the %s\n\"", s));
ADDRGP4 $1611
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1614
line 2587
;2587:}
LABELV $1612
endproc Cmd_DeActivateItem_f 1040 12
export Cmd_ToggleItem_f
proc Cmd_ToggleItem_f 1052 12
line 2594
;2588:
;2589:/*
;2590:=================
;2591:Cmd_ToggleItem_f
;2592:=================
;2593: */
;2594:void Cmd_ToggleItem_f(gentity_t *ent) {
line 2598
;2595:  char s[ MAX_TOKEN_CHARS ];
;2596:  int upgrade, weapon, i;
;2597:
;2598:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2599
;2599:  upgrade = BG_FindUpgradeNumForName(s);
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 BG_FindUpgradeNumForName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1036
INDIRI4
ASGNI4
line 2600
;2600:  weapon = BG_FindWeaponNumForName(s);
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 BG_FindWeaponNumForName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1040
INDIRI4
ASGNI4
line 2602
;2601:
;2602:  if (weapon != WP_NONE) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $1616
line 2606
;2603:    //special case to allow switching between
;2604:    //the pistol and the primary weapon
;2605:
;2606:    if (ent->client->ps.weapon != WP_PISTOL)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1618
line 2607
;2607:      weapon = WP_PISTOL;
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $1619
JUMPV
LABELV $1618
line 2608
;2608:    else {
line 2610
;2609:      //find a held weapon which isn't the pistol
;2610:      for (i = WP_NONE + 1; i < WP_NUM_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1620
line 2611
;2611:        if (i == WP_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1624
line 2612
;2612:          continue;
ADDRGP4 $1621
JUMPV
LABELV $1624
line 2614
;2613:
;2614:        if (BG_InventoryContainsWeapon(i, ent->client->ps.stats)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $1626
line 2615
;2615:          weapon = i;
ADDRLP4 1028
ADDRLP4 0
INDIRI4
ASGNI4
line 2616
;2616:          break;
ADDRGP4 $1622
JUMPV
LABELV $1626
line 2618
;2617:        }
;2618:      }
LABELV $1621
line 2610
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $1620
LABELV $1622
line 2620
;2619:
;2620:      if (i == WP_NUM_WEAPONS)
ADDRLP4 0
INDIRI4
CNSTI4 30
NEI4 $1628
line 2621
;2621:        weapon = WP_PISTOL;
ADDRLP4 1028
CNSTI4 1
ASGNI4
LABELV $1628
line 2622
;2622:    }
LABELV $1619
line 2624
;2623:
;2624:    G_ForceWeaponChange(ent, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
line 2625
;2625:  } else if (BG_InventoryContainsUpgrade(upgrade, ent->client->ps.stats)) {
ADDRGP4 $1617
JUMPV
LABELV $1616
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $1630
line 2626
;2626:    if (BG_UpgradeIsActive(upgrade, ent->client->ps.stats))
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1048
ADDRGP4 BG_UpgradeIsActive
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1632
line 2627
;2627:      BG_DeactivateUpgrade(upgrade, ent->client->ps.stats);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_DeactivateUpgrade
CALLV
pop
ADDRGP4 $1631
JUMPV
LABELV $1632
line 2629
;2628:    else
;2629:      BG_ActivateUpgrade(upgrade, ent->client->ps.stats);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_ActivateUpgrade
CALLV
pop
line 2630
;2630:  } else
ADDRGP4 $1631
JUMPV
LABELV $1630
line 2631
;2631:    trap_SendServerCommand(ent - g_entities, va("print \"You don't have the %s\n\"", s));
ADDRGP4 $1611
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1631
LABELV $1617
line 2632
;2632:}
LABELV $1615
endproc Cmd_ToggleItem_f 1052 12
export Cmd_Buy_f
proc Cmd_Buy_f 1120 20
line 2639
;2633:
;2634:/*
;2635:=================
;2636:Cmd_Buy_f
;2637:=================
;2638: */
;2639:void Cmd_Buy_f(gentity_t *ent) {
line 2642
;2640:  char s[ MAX_TOKEN_CHARS ];
;2641:  int i;
;2642:  int weapon, upgrade, numItems = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2644
;2643:  int maxAmmo, maxClips;
;2644:  qboolean buyingEnergyAmmo = qfalse;
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 2645
;2645:  qboolean hasEnergyWeapon = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 2649
;2646:  int biteam;
;2647:
;2648:
;2649:  if (ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1635
line 2650
;2650:    biteam = BIT_HUMANS;
ADDRLP4 1044
CNSTI4 2
ASGNI4
line 2651
;2651:  } else {
ADDRGP4 $1636
JUMPV
LABELV $1635
line 2652
;2652:    biteam = BIT_ALIENS;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 2653
;2653:  }
LABELV $1636
line 2655
;2654:
;2655:  for (i = UP_NONE; i < UP_NUM_UPGRADES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1637
line 2656
;2656:    if (BG_InventoryContainsUpgrade(i, ent->client->ps.stats))
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1641
line 2657
;2657:      numItems++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1641
line 2658
;2658:  }
LABELV $1638
line 2655
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1637
line 2660
;2659:
;2660:  for (i = WP_NONE; i < WP_NUM_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1643
line 2661
;2661:    if (BG_InventoryContainsWeapon(i, ent->client->ps.stats)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1647
line 2662
;2662:      if (BG_FindUsesEnergyForWeapon(i))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $1649
line 2663
;2663:        hasEnergyWeapon = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
LABELV $1649
line 2664
;2664:      numItems++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2665
;2665:    }
LABELV $1647
line 2666
;2666:  }
LABELV $1644
line 2660
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $1643
line 2668
;2667:
;2668:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2670
;2669:
;2670:  weapon = BG_FindWeaponNumForName(s);
ADDRLP4 12
ARGP4
ADDRLP4 1060
ADDRGP4 BG_FindWeaponNumForName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1060
INDIRI4
ASGNI4
line 2671
;2671:  upgrade = BG_FindUpgradeNumForName(s);
ADDRLP4 12
ARGP4
ADDRLP4 1064
ADDRGP4 BG_FindUpgradeNumForName
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1064
INDIRI4
ASGNI4
line 2674
;2672:
;2673:  //special case to keep norf happy
;2674:  if (weapon == WP_NONE && upgrade == UP_AMMO) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1651
ADDRLP4 1036
INDIRI4
CNSTI4 7
NEI4 $1651
line 2675
;2675:    buyingEnergyAmmo = hasEnergyWeapon;
ADDRLP4 1048
ADDRLP4 1040
INDIRI4
ASGNI4
line 2676
;2676:  }
LABELV $1651
line 2678
;2677:
;2678:  if(weapon == WP_HBUILD) weapon = WP_HBUILD2;
ADDRLP4 4
INDIRI4
CNSTI4 21
NEI4 $1653
ADDRLP4 4
CNSTI4 20
ASGNI4
LABELV $1653
line 2680
;2679:
;2680:  if (buyingEnergyAmmo) {
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1655
line 2682
;2681:    //no armoury nearby
;2682:    if (!G_ArmoryRange(ent->client->ps.origin, 100, BA_H_REACTOR, biteam) &&
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 15
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 G_ArmoryRange
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1656
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 16
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 G_ArmoryRange
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1656
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 12
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 G_ArmoryRange
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1656
line 2684
;2683:            !G_ArmoryRange(ent->client->ps.origin, 100, BA_H_REPEATER, biteam) &&
;2684:            !G_ArmoryRange(ent->client->ps.origin, 100, BA_H_ARMOURY, biteam)) {
line 2685
;2685:      trap_SendServerCommand(ent - g_entities, va(
ADDRGP4 $1659
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2687
;2686:              "print \"You must be near a reactor, repeater or armoury\n\""));
;2687:      return;
ADDRGP4 $1634
JUMPV
line 2689
;2688:    }
;2689:  } else {
LABELV $1655
line 2691
;2690:    //no armoury nearby
;2691:    if (!G_ArmoryRange(ent->client->ps.origin, 100, BA_H_ARMOURY, biteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 12
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 G_ArmoryRange
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1660
line 2692
;2692:      trap_SendServerCommand(ent - g_entities, va("print \"You must be near a powered armoury\n\""));
ADDRGP4 $1662
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2693
;2693:      return;
ADDRGP4 $1634
JUMPV
LABELV $1660
line 2695
;2694:    }
;2695:  }
LABELV $1656
line 2697
;2696:
;2697:  if (weapon != WP_NONE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1663
line 2699
;2698:    //already got this?
;2699:    if (BG_InventoryContainsWeapon(weapon, ent->client->ps.stats)) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1665
line 2700
;2700:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_ITEMHELD);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2701
;2701:      return;
ADDRGP4 $1634
JUMPV
LABELV $1665
line 2705
;2702:    }
;2703:
;2704:    //can afford this?
;2705:    if (BG_FindPriceForWeapon(weapon) > (short) ent->client->ps.persistant[ PERS_CREDIT ]) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 BG_FindPriceForWeapon
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CVII2 4
CVII4 2
LEI4 $1667
line 2706
;2706:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOFUNDS);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2707
;2707:      return;
ADDRGP4 $1634
JUMPV
LABELV $1667
line 2711
;2708:    }
;2709:
;2710:    //have space to carry this?
;2711:    if (BG_FindSlotsForWeapon(weapon) & ent->client->ps.stats[ STAT_SLOTS ]) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 BG_FindSlotsForWeapon
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1669
line 2712
;2712:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOSLOTS);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2713
;2713:      return;
ADDRGP4 $1634
JUMPV
LABELV $1669
line 2716
;2714:    }
;2715:
;2716:    if (BG_FindTeamForWeapon(weapon) != WUT_HUMANS) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 BG_FindTeamForWeapon
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 2
EQI4 $1671
line 2718
;2717:      //shouldn't need a fancy dialog
;2718:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy alien items\n\""));
ADDRGP4 $1673
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2719
;2719:      return;
ADDRGP4 $1634
JUMPV
LABELV $1671
line 2723
;2720:    }
;2721:
;2722:    //are we /allowed/ to buy this?
;2723:    if (!BG_FindPurchasableForWeapon(weapon)) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 BG_FindPurchasableForWeapon
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1674
line 2724
;2724:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy this item\n\""));
ADDRGP4 $1676
ARGP4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2725
;2725:      return;
ADDRGP4 $1634
JUMPV
LABELV $1674
line 2729
;2726:    }
;2727:
;2728:    //are we /allowed/ to buy this?
;2729:    if (!BG_FindStagesForWeapon(weapon, g_humanStage.integer) || !BG_WeaponIsAllowed(weapon)) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 g_humanStage+12
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $1680
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1677
LABELV $1680
line 2730
;2730:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy this item\n\""));
ADDRGP4 $1676
ARGP4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1096
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2731
;2731:      return;
ADDRGP4 $1634
JUMPV
LABELV $1677
line 2735
;2732:    }
;2733:
;2734:    //add to inventory
;2735:    BG_AddWeaponToInventory(weapon, ent->client->ps.stats);
ADDRLP4 4
INDIRI4
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
line 2736
;2736:    BG_FindAmmoForWeapon(weapon, &maxAmmo, &maxClips);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 1056
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 2738
;2737:
;2738:    if (BG_FindUsesEnergyForWeapon(weapon) &&
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $1681
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
ADDRLP4 1100
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $1681
line 2740
;2739:            BG_InventoryContainsUpgrade(UP_BATTPACK, ent->client->ps.stats))
;2740:      maxAmmo = (int) ((float) maxAmmo * BATTPACK_MODIFIER);
ADDRLP4 1052
CNSTF4 1069547520
ADDRLP4 1052
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
LABELV $1681
line 2742
;2741:
;2742:    BG_PackAmmoArray(weapon, &ent->client->ps.ammo, ent->client->ps.powerups,
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 2745
;2743:            maxAmmo, maxClips);
;2744:
;2745:    G_ForceWeaponChange(ent, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
line 2748
;2746:
;2747:    //set build delay/pounce etc to 0
;2748:    ent->client->ps.stats[ STAT_MISC ] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 0
ASGNI4
line 2751
;2749:
;2750:    //subtract from funds
;2751:    G_AddCreditToClient(ent->client, -(short) BG_FindPriceForWeapon(weapon), qfalse);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 BG_FindPriceForWeapon
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
INDIRI4
CVII2 4
CVII4 2
NEGI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2752
;2752:    if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1664
line 2753
;2753:      level.survivalmoney += BG_FindPriceForWeapon(weapon);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 BG_FindPriceForWeapon
CALLI4
ASGNI4
ADDRLP4 1116
ADDRGP4 level+92
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
ADDRLP4 1112
INDIRI4
ADDI4
ASGNI4
line 2754
;2754:  } else if (upgrade != UP_NONE) {
ADDRGP4 $1664
JUMPV
LABELV $1663
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $1687
line 2763
;2755:
;2756:    //ROTAX  
;2757:    /*if (upgrade == UP_JETPACK) {
;2758:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy jetpack in Zombie mod\n\""));
;2759:      return;
;2760:    }*/
;2761:
;2762:    //already got this?
;2763:    if (BG_InventoryContainsUpgrade(upgrade, ent->client->ps.stats)) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1689
line 2764
;2764:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_ITEMHELD);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2765
;2765:      return;
ADDRGP4 $1634
JUMPV
LABELV $1689
line 2769
;2766:    }
;2767:
;2768:    //can afford this?
;2769:    if (BG_FindPriceForUpgrade(upgrade) > (short) ent->client->ps.persistant[ PERS_CREDIT ]) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 BG_FindPriceForUpgrade
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CVII2 4
CVII4 2
LEI4 $1691
line 2770
;2770:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOFUNDS);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2771
;2771:      return;
ADDRGP4 $1634
JUMPV
LABELV $1691
line 2775
;2772:    }
;2773:
;2774:    //have space to carry this?
;2775:    if (BG_FindSlotsForUpgrade(upgrade) & ent->client->ps.stats[ STAT_SLOTS ]) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 BG_FindSlotsForUpgrade
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1693
line 2776
;2776:      G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOSLOTS);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 2777
;2777:      return;
ADDRGP4 $1634
JUMPV
LABELV $1693
line 2787
;2778:    }
;2779:
;2780:    /*if (BG_FindTeamForUpgrade(upgrade) != WUT_HUMANS || upgrade == UP_BATTLESUIT) {
;2781:      //shouldn't need a fancy dialog
;2782:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy alien items\n\""));
;2783:      return;
;2784:    }*/
;2785:
;2786:    //are we /allowed/ to buy this?
;2787:    if (!BG_FindPurchasableForUpgrade(upgrade)) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 BG_FindPurchasableForUpgrade
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1695
line 2788
;2788:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy this item\n\""));
ADDRGP4 $1676
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2789
;2789:      return;
ADDRGP4 $1634
JUMPV
LABELV $1695
line 2793
;2790:    }
;2791:
;2792:    //are we /allowed/ to buy this?
;2793:    if (!BG_FindStagesForUpgrade(upgrade, g_humanStage.integer) || !BG_UpgradeIsAllowed(upgrade)) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 g_humanStage+12
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 BG_FindStagesForUpgrade
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1700
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 BG_UpgradeIsAllowed
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1697
LABELV $1700
line 2794
;2794:      trap_SendServerCommand(ent - g_entities, va("print \"You can't buy this item\n\""));
ADDRGP4 $1676
ARGP4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2795
;2795:      return;
ADDRGP4 $1634
JUMPV
LABELV $1697
line 2810
;2796:    }
;2797:
;2798:    /*if (upgrade == UP_BATTLESUIT && ent->client->ps.pm_flags & PMF_DUCKED) {
;2799:      trap_SendServerCommand(ent - g_entities,
;2800:              va("print \"You can't buy this item while crouching\n\""));
;2801:      return;
;2802:    }*/
;2803:
;2804:	 /* if (upgrade == UP_JEEP && ent->client->ps.pm_flags & PMF_DUCKED) {
;2805:	   trap_SendServerCommand(ent - g_entities,
;2806:	   va("print \"You can't buy this item while crouching\n\""));
;2807:	   return;
;2808:	   }*/
;2809:	  
;2810:    if (upgrade == UP_AMMO) {
ADDRLP4 1036
INDIRI4
CNSTI4 7
NEI4 $1701
line 2811
;2811:      G_GiveClientMaxAmmo(ent, buyingEnergyAmmo);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
line 2813
;2812:
;2813:      if (g_survival.integer) {
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1702
line 2814
;2814:        G_GiveClientMaxAmmo(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
line 2815
;2815:        G_GiveClientMaxAmmo(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
line 2818
;2816:        //trap_SendServerCommand(ent - g_entities,
;2817:                //va("print \"^1-%d\n\"", MGCLIP_PRICE));
;2818:        G_AddCreditToClient(ent->client, -(short) MGCLIP_PRICE, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 -500
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2819
;2819:        level.survivalmoney += MGCLIP_PRICE;
ADDRLP4 1092
ADDRGP4 level+92
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2820
;2820:      }
line 2821
;2821:    }
ADDRGP4 $1702
JUMPV
LABELV $1701
line 2822
;2822:    else {
line 2824
;2823:      //add to inventory
;2824:      BG_AddUpgradeToInventory(upgrade, ent->client->ps.stats);
ADDRLP4 1036
INDIRI4
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
line 2825
;2825:    }
LABELV $1702
line 2827
;2826:
;2827:    if (upgrade == UP_BATTPACK) {
ADDRLP4 1036
INDIRI4
CNSTI4 4
NEI4 $1707
line 2828
;2828:      G_GiveClientMaxAmmo(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
line 2829
;2829:    }
LABELV $1707
line 2832
;2830:
;2831:    //subtract from funds
;2832:    G_AddCreditToClient(ent->client, -(short) BG_FindPriceForUpgrade(upgrade), qfalse);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 BG_FindPriceForUpgrade
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1092
INDIRI4
CVII2 4
CVII4 2
NEGI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2833
;2833:  } else {
ADDRGP4 $1688
JUMPV
LABELV $1687
line 2834
;2834:    trap_SendServerCommand(ent - g_entities, va("print \"Unknown item\n\""));
ADDRGP4 $1709
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2835
;2835:  }
LABELV $1688
LABELV $1664
line 2837
;2836:
;2837:  if (trap_Argc() >= 2) {
ADDRLP4 1068
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 2
LTI4 $1710
line 2838
;2838:    trap_Argv(2, s, sizeof ( s));
CNSTI4 2
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2841
;2839:
;2840:    //retrigger the armoury menu
;2841:    if (!Q_stricmp(s, "retrigger"))
ADDRLP4 12
ARGP4
ADDRGP4 $1714
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1712
line 2842
;2842:      ent->client->retriggerArmouryMenu = level.framenum + RAM_FRAMES;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1404
ADDP4
ADDRGP4 level+24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1712
line 2843
;2843:  }
LABELV $1710
line 2846
;2844:
;2845:  //update ClientInfo
;2846:  ClientUserinfoChanged(ent->client->ps.clientNum);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2847
;2847:}
LABELV $1634
endproc Cmd_Buy_f 1120 20
export Cmd_Sell_f
proc Cmd_Sell_f 1092 20
line 2854
;2848:
;2849:/*
;2850:=================
;2851:Cmd_Sell_f
;2852:=================
;2853: */
;2854:void Cmd_Sell_f(gentity_t *ent) {
line 2860
;2855:  char s[ MAX_TOKEN_CHARS ];
;2856:  int i;
;2857:  int weapon, upgrade;
;2858:  int biteam;
;2859:
;2860:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2863
;2861:
;2862:  //no armoury nearby
;2863:  if (ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1717
line 2864
;2864:    biteam = BIT_HUMANS;
ADDRLP4 1036
CNSTI4 2
ASGNI4
line 2865
;2865:  } else {
ADDRGP4 $1718
JUMPV
LABELV $1717
line 2866
;2866:    biteam = BIT_ALIENS;
ADDRLP4 1036
CNSTI4 1
ASGNI4
line 2867
;2867:  }
LABELV $1718
line 2868
;2868:  if (!G_ArmoryRange(ent->client->ps.origin, 100, BA_H_ARMOURY, biteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 12
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 G_ArmoryRange
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1719
line 2869
;2869:    trap_SendServerCommand(ent - g_entities, va("print \"You must be near a powered armoury\n\""));
ADDRGP4 $1662
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2870
;2870:    return;
ADDRGP4 $1716
JUMPV
LABELV $1719
line 2873
;2871:  }
;2872:
;2873:  weapon = BG_FindWeaponNumForName(s);
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 BG_FindWeaponNumForName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1044
INDIRI4
ASGNI4
line 2874
;2874:  upgrade = BG_FindUpgradeNumForName(s);
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 BG_FindUpgradeNumForName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1048
INDIRI4
ASGNI4
line 2876
;2875:
;2876:  if (weapon != WP_NONE) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $1721
line 2878
;2877:    //are we /allowed/ to sell this?
;2878:    if (!BG_FindPurchasableForWeapon(weapon)) {
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 BG_FindPurchasableForWeapon
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1723
line 2879
;2879:      trap_SendServerCommand(ent - g_entities, va("print \"You can't sell this weapon\n\""));
ADDRGP4 $1725
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2880
;2880:      return;
ADDRGP4 $1716
JUMPV
LABELV $1723
line 2884
;2881:    }
;2882:
;2883:    //remove weapon if carried
;2884:    if (BG_InventoryContainsWeapon(weapon, ent->client->ps.stats)) {
ADDRLP4 1028
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1056
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $1726
line 2886
;2885:      //guard against selling the HBUILD weapons exploit
;2886:      if ((weapon == WP_HBUILD || weapon == WP_HBUILD2) &&
ADDRLP4 1028
INDIRI4
CNSTI4 21
EQI4 $1730
ADDRLP4 1028
INDIRI4
CNSTI4 20
NEI4 $1728
LABELV $1730
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1728
line 2887
;2887:              ent->client->ps.stats[ STAT_MISC ] > 0) {
line 2888
;2888:        trap_SendServerCommand(ent - g_entities, va("print \"Cannot sell until build timer expires\n\""));
ADDRGP4 $1731
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2889
;2889:        return;
ADDRGP4 $1716
JUMPV
LABELV $1728
line 2892
;2890:      }
;2891:
;2892:      BG_RemoveWeaponFromInventory(weapon, ent->client->ps.stats);
ADDRLP4 1028
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveWeaponFromInventory
CALLV
pop
line 2895
;2893:
;2894:      //add to funds
;2895:      G_AddCreditToClient(ent->client, (short) BG_FindPriceForWeapon(weapon), qfalse);
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 BG_FindPriceForWeapon
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2896
;2896:    }
LABELV $1726
line 2899
;2897:
;2898:    //if we have this weapon selected, force a new selection
;2899:    if (weapon == ent->client->ps.weapon)
ADDRLP4 1028
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $1722
line 2900
;2900:      G_ForceWeaponChange(ent, WP_NONE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
line 2901
;2901:  } else if (upgrade != UP_NONE) {
ADDRGP4 $1722
JUMPV
LABELV $1721
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $1734
line 2903
;2902:    //are we /allowed/ to sell this?
;2903:    if (!BG_FindPurchasableForUpgrade(upgrade)) {
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 BG_FindPurchasableForUpgrade
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1736
line 2904
;2904:      trap_SendServerCommand(ent - g_entities, va("print \"You can't sell this item\n\""));
ADDRGP4 $1738
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2905
;2905:      return;
ADDRGP4 $1716
JUMPV
LABELV $1736
line 2908
;2906:    }
;2907:    //remove upgrade if carried
;2908:    if (BG_InventoryContainsUpgrade(upgrade, ent->client->ps.stats)) {
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1056
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $1735
line 2909
;2909:      BG_RemoveUpgradeFromInventory(upgrade, ent->client->ps.stats);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveUpgradeFromInventory
CALLV
pop
line 2911
;2910:
;2911:      if (upgrade == UP_BATTPACK)
ADDRLP4 1032
INDIRI4
CNSTI4 4
NEI4 $1741
line 2912
;2912:        G_GiveClientMaxAmmo(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_GiveClientMaxAmmo
CALLV
pop
LABELV $1741
line 2915
;2913:
;2914:      //add to funds
;2915:      G_AddCreditToClient(ent->client, (short) BG_FindPriceForUpgrade(upgrade), qfalse);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 BG_FindPriceForUpgrade
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1060
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2916
;2916:    }
line 2917
;2917:  } else if (!Q_stricmp(s, "weapons")) {
ADDRGP4 $1735
JUMPV
LABELV $1734
ADDRLP4 4
ARGP4
ADDRGP4 $1745
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1743
line 2918
;2918:    for (i = WP_NONE + 1; i < WP_NUM_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1746
line 2920
;2919:      //guard against selling the HBUILD weapons exploit
;2920:      if ((i == WP_HBUILD || i == WP_HBUILD2) &&
ADDRLP4 0
INDIRI4
CNSTI4 21
EQI4 $1752
ADDRLP4 0
INDIRI4
CNSTI4 20
NEI4 $1750
LABELV $1752
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1750
line 2921
;2921:              ent->client->ps.stats[ STAT_MISC ] > 0) {
line 2922
;2922:        trap_SendServerCommand(ent - g_entities, va("print \"Cannot sell until build timer expires\n\""));
ADDRGP4 $1731
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2923
;2923:        continue;
ADDRGP4 $1747
JUMPV
LABELV $1750
line 2926
;2924:      }
;2925:
;2926:      if (BG_InventoryContainsWeapon(i, ent->client->ps.stats) &&
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1753
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 BG_FindPurchasableForWeapon
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $1753
line 2927
;2927:              BG_FindPurchasableForWeapon(i)) {
line 2928
;2928:        BG_RemoveWeaponFromInventory(i, ent->client->ps.stats);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveWeaponFromInventory
CALLV
pop
line 2931
;2929:
;2930:        //add to funds
;2931:        G_AddCreditToClient(ent->client, (short) BG_FindPriceForWeapon(i), qfalse);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 BG_FindPriceForWeapon
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2932
;2932:      }
LABELV $1753
line 2935
;2933:
;2934:      //if we have this weapon selected, force a new selection
;2935:      if (i == ent->client->ps.weapon)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $1755
line 2936
;2936:        G_ForceWeaponChange(ent, WP_NONE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
LABELV $1755
line 2937
;2937:    }
LABELV $1747
line 2918
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $1746
line 2938
;2938:  } else if (!Q_stricmp(s, "upgrades")) {
ADDRGP4 $1744
JUMPV
LABELV $1743
ADDRLP4 4
ARGP4
ADDRGP4 $1759
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1757
line 2939
;2939:    for (i = UP_NONE + 1; i < UP_NUM_UPGRADES; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1760
line 2941
;2940:      //remove upgrade if carried
;2941:      if (BG_InventoryContainsUpgrade(i, ent->client->ps.stats) &&
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1764
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 BG_FindPurchasableForUpgrade
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $1764
line 2942
;2942:              BG_FindPurchasableForUpgrade(i)) {
line 2943
;2943:        BG_RemoveUpgradeFromInventory(i, ent->client->ps.stats);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveUpgradeFromInventory
CALLV
pop
line 2945
;2944:
;2945:        if (i == UP_BATTPACK) {
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1766
line 2949
;2946:          int j;
;2947:
;2948:          //remove energy
;2949:          for (j = WP_NONE; j < WP_NUM_WEAPONS; j++) {
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1768
line 2950
;2950:            if (BG_InventoryContainsWeapon(j, ent->client->ps.stats) &&
ADDRLP4 1068
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 1072
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1772
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $1772
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 BG_FindInfinteAmmoForWeapon
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1772
line 2952
;2951:                    BG_FindUsesEnergyForWeapon(j) &&
;2952:                    !BG_FindInfinteAmmoForWeapon(j)) {
line 2953
;2953:              BG_PackAmmoArray(j, &ent->client->ps.ammo, ent->client->ps.powerups, 0, 0);
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 2954
;2954:            }
LABELV $1772
line 2955
;2955:          }
LABELV $1769
line 2949
ADDRLP4 1068
ADDRLP4 1068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 30
LTI4 $1768
line 2956
;2956:        }
LABELV $1766
line 2959
;2957:
;2958:        //add to funds
;2959:        G_AddCreditToClient(ent->client, (short) BG_FindPriceForUpgrade(i), qfalse);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 BG_FindPriceForUpgrade
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 2960
;2960:      }
LABELV $1764
line 2961
;2961:    }
LABELV $1761
line 2939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1760
line 2962
;2962:  } else
ADDRGP4 $1758
JUMPV
LABELV $1757
line 2963
;2963:    trap_SendServerCommand(ent - g_entities, va("print \"Unknown item\n\""));
ADDRGP4 $1709
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1758
LABELV $1744
LABELV $1735
LABELV $1722
line 2965
;2964:
;2965:  if (trap_Argc() >= 2) {
ADDRLP4 1064
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 2
LTI4 $1774
line 2966
;2966:    trap_Argv(2, s, sizeof ( s));
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2969
;2967:
;2968:    //retrigger the armoury menu
;2969:    if (!Q_stricmp(s, "retrigger"))
ADDRLP4 4
ARGP4
ADDRGP4 $1714
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1776
line 2970
;2970:      ent->client->retriggerArmouryMenu = level.framenum + RAM_FRAMES;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1404
ADDP4
ADDRGP4 level+24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1776
line 2971
;2971:  }
LABELV $1774
line 2974
;2972:
;2973:  //update ClientInfo
;2974:  ClientUserinfoChanged(ent->client->ps.clientNum);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2975
;2975:}
LABELV $1716
endproc Cmd_Sell_f 1092 20
export Cmd_Build_f
proc Cmd_Build_f 1100 16
line 2982
;2976:
;2977:/*
;2978:=================
;2979:Cmd_Build_f
;2980:=================
;2981: */
;2982:void Cmd_Build_f(gentity_t *ent) {
line 2989
;2983:  char s[ MAX_TOKEN_CHARS ];
;2984:  buildable_t buildable;
;2985:  float dist;
;2986:  vec3_t origin;
;2987:  pTeam_t team;
;2988:
;2989:  if( ent->client->pers.denyBuild )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1780
line 2990
;2990:    {
line 2991
;2991:  	  if(ent->client->pers.globalID)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1782
line 2992
;2992:  	  {
line 2993
;2993:  		  trap_SendServerCommand( ent-g_entities,
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2995
;2994:  		        va("print \"Caught by global ID: %d Appeal: %s\n\"", ent->client->pers.globalID , GLOBALS_URL));
;2995:  		  return;
ADDRGP4 $1779
JUMPV
LABELV $1782
line 2997
;2996:  	  }
;2997:      trap_SendServerCommand( ent-g_entities,
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
ADDRGP4 $1432
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2999
;2998:        "print \"Your building rights have been revoked\n\"" );
;2999:      return;
ADDRGP4 $1779
JUMPV
LABELV $1780
line 3002
;3000:    }
;3001:
;3002:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3004
;3003:
;3004:  buildable = BG_FindBuildNumForName(s);
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 BG_FindBuildNumForName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1048
INDIRI4
ASGNI4
line 3007
;3005:
;3006:
;3007:  if (g_suddenDeath.integer) {
ADDRGP4 g_suddenDeath+12
INDIRI4
CNSTI4 0
EQI4 $1784
line 3008
;3008:    if (g_suddenDeathMode.integer == SDMODE_SELECTIVE) {
ADDRGP4 g_suddenDeathMode+12
INDIRI4
CNSTI4 2
NEI4 $1787
line 3009
;3009:      if (!BG_FindReplaceableTestForBuildable(buildable)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 BG_FindReplaceableTestForBuildable
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1790
line 3010
;3010:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1792
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3012
;3011:                "print \"This building type cannot be rebuilt during Sudden Death\n\"");
;3012:        return;
ADDRGP4 $1779
JUMPV
LABELV $1790
line 3014
;3013:      }
;3014:      if (G_BuildingExists(buildable)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 G_BuildingExists
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $1788
line 3015
;3015:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1795
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3017
;3016:                "print \"You can only rebuild one of each type of rebuildable building during Sudden Death.\n\"");
;3017:        return;
ADDRGP4 $1779
JUMPV
line 3019
;3018:      }
;3019:    } else if (g_suddenDeathMode.integer == SDMODE_NO_BUILD) {
LABELV $1787
ADDRGP4 g_suddenDeathMode+12
INDIRI4
CNSTI4 1
NEI4 $1796
line 3020
;3020:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1799
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3022
;3021:              "print \"Building is not allowed during Sudden Death\n\"");
;3022:      return;
ADDRGP4 $1779
JUMPV
LABELV $1796
LABELV $1788
line 3024
;3023:    }
;3024:  }
LABELV $1784
line 3026
;3025:
;3026:  team = ent->client->ps.stats[ STAT_PTEAM ];
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 3028
;3027:
;3028:  if (buildable != BA_NONE && buildable != BA_A_SPAWN &&
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1800
ADDRLP4 1056
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1056
INDIRI4
EQI4 $1800
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 BG_FindBuildWeaponForBuildable
CALLI4
ASGNI4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
LSHI4
ADDRLP4 1060
INDIRI4
BANDI4
ADDRLP4 1064
INDIRI4
EQI4 $1800
ADDRLP4 1068
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 1064
INDIRI4
NEI4 $1800
ADDRLP4 1068
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1064
INDIRI4
NEI4 $1800
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 BG_BuildableIsAllowed
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1800
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $1805
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 g_alienStage+12
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 BG_FindStagesForBuildable
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1804
LABELV $1805
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $1800
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 g_humanStage+12
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 BG_FindStagesForBuildable
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $1800
LABELV $1804
line 3034
;3029:          ((1 << ent->client->ps.weapon) & BG_FindBuildWeaponForBuildable(buildable)) &&
;3030:          !(ent->client->ps.stats[ STAT_STATE ] & SS_INFESTING) &&
;3031:          !(ent->client->ps.stats[ STAT_STATE ] & SS_HOVELING) &&
;3032:          BG_BuildableIsAllowed(buildable) &&
;3033:          ((team == PTE_ALIENS && BG_FindStagesForBuildable(buildable, g_alienStage.integer)) ||
;3034:          (team == PTE_HUMANS && BG_FindStagesForBuildable(buildable, g_humanStage.integer)))) {
line 3035
;3035:    dist = BG_FindBuildDistForClass(ent->client->ps.stats[ STAT_PCLASS ]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 BG_FindBuildDistForClass
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1084
INDIRF4
ASGNF4
line 3038
;3036:
;3037:    //these are the errors displayed when the builder first selects something to use
;3038:    switch (G_CanBuild(ent, buildable, dist, origin)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1032
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1092
ADDRGP4 G_CanBuild
CALLI4
ASGNI4
ADDRLP4 1088
ADDRLP4 1092
INDIRI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
LTI4 $1801
ADDRLP4 1088
INDIRI4
CNSTI4 16
GTI4 $1801
ADDRLP4 1088
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1818
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1818
address $1809
address $1811
address $1812
address $1810
address $1809
address $1816
address $1801
address $1809
address $1813
address $1814
address $1809
address $1809
address $1809
address $1815
address $1817
address $1809
address $1809
code
LABELV $1809
line 3047
;3039:      case IBE_NONE:
;3040:      case IBE_TNODEWARN:
;3041:      case IBE_RPTWARN:
;3042:      case IBE_RPTWARN2:
;3043:      case IBE_SPWNWARN:
;3044:      case IBE_NOROOM:
;3045:      case IBE_NORMAL:
;3046:      case IBE_HOVELEXIT:
;3047:        ent->client->ps.stats[ STAT_BUILDABLE ] = (buildable | SB_VALID_TOGGLEBIT);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 3048
;3048:        break;
ADDRGP4 $1801
JUMPV
LABELV $1810
line 3051
;3049:
;3050:      case IBE_NOASSERT:
;3051:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOASSERT);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3052
;3052:        break;
ADDRGP4 $1801
JUMPV
LABELV $1811
line 3055
;3053:
;3054:      case IBE_NOOVERMIND:
;3055:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOOVMND);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3056
;3056:        break;
ADDRGP4 $1801
JUMPV
LABELV $1812
line 3059
;3057:
;3058:      case IBE_OVERMIND:
;3059:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_OVERMIND);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3060
;3060:        break;
ADDRGP4 $1801
JUMPV
LABELV $1813
line 3063
;3061:
;3062:      case IBE_REACTOR:
;3063:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_REACTOR);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3064
;3064:        break;
ADDRGP4 $1801
JUMPV
LABELV $1814
line 3067
;3065:
;3066:      case IBE_REPEATER:
;3067:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_REPEATER);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3068
;3068:        break;
ADDRGP4 $1801
JUMPV
LABELV $1815
line 3071
;3069:
;3070:      case IBE_NOPOWER:
;3071:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_NOPOWER);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3072
;3072:        break;
ADDRGP4 $1801
JUMPV
LABELV $1816
line 3075
;3073:
;3074:      case IBE_NOCREEP:
;3075:        G_TriggerMenu(ent->client->ps.clientNum, MN_A_NOCREEP);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3076
;3076:        break;
ADDRGP4 $1801
JUMPV
LABELV $1817
line 3079
;3077:
;3078:      case IBE_NODCC:
;3079:        G_TriggerMenu(ent->client->ps.clientNum, MN_H_NODCC);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_TriggerMenu
CALLV
pop
line 3080
;3080:        break;
line 3083
;3081:
;3082:      default:
;3083:        break;
line 3085
;3084:    }
;3085:  } else
ADDRGP4 $1801
JUMPV
LABELV $1800
line 3086
;3086:    trap_SendServerCommand(ent - g_entities, va("print \"Cannot build this item\n\""));
ADDRGP4 $1819
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1801
line 3087
;3087:}
LABELV $1779
endproc Cmd_Build_f 1100 16
export Cmd_Boost_f
proc Cmd_Boost_f 8 0
line 3094
;3088:
;3089:/*
;3090:=================
;3091:Cmd_Boost_f
;3092:=================
;3093: */
;3094:void Cmd_Boost_f(gentity_t *ent) {
line 3099
;3095:  /*if (BG_InventoryContainsUpgrade(UP_JETPACK, ent->client->ps.stats) &&
;3096:          BG_UpgradeIsActive(UP_JETPACK, ent->client->ps.stats))
;3097:    return;*/
;3098:
;3099:  if (ent->client->pers.cmd.buttons & BUTTON_WALKING)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1821
line 3100
;3100:    return;
ADDRGP4 $1820
JUMPV
LABELV $1821
line 3102
;3101:
;3102:  if ((ent->client->ps.stats[ STAT_PTEAM ] == PTE_HUMANS || ent->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS) &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1825
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1823
LABELV $1825
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1823
line 3104
;3103:          (ent->client->ps.stats[ STAT_STAMINA ] > 0))
;3104:    ent->client->ps.stats[ STAT_STATE ] |= SS_SPEEDBOOST;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $1823
line 3105
;3105:}
LABELV $1820
endproc Cmd_Boost_f 8 0
export Cmd_Protect_f
proc Cmd_Protect_f 116 28
line 3112
;3106:
;3107:/*
;3108:=================
;3109:Cmd_Protect_f
;3110:=================
;3111: */
;3112:void Cmd_Protect_f(gentity_t *ent) {
line 3117
;3113:  vec3_t forward, end;
;3114:  trace_t tr;
;3115:  gentity_t *traceEnt;
;3116:
;3117:  if (!ent->client->pers.designatedBuilder) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1827
line 3118
;3118:    trap_SendServerCommand(ent - g_entities, "print \"Only designated"
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
ADDRGP4 $1829
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3120
;3119:            " builders can toggle structure protection.\n\"");
;3120:    return;
ADDRGP4 $1826
JUMPV
LABELV $1827
line 3123
;3121:  }
;3122:
;3123:  AngleVectors(ent->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 88
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3124
;3124:  VectorMA(ent->client->ps.origin, 100, forward, end);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 96
CNSTF4 1120403456
ASGNF4
ADDRLP4 12
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1120403456
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3126
;3125:
;3126:  trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, end, ent->s.number,
ADDRLP4 28
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 104
CNSTP4 0
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3128
;3127:          MASK_PLAYERSOLID);
;3128:  traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 24
CNSTI4 2476
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3130
;3129:
;3130:  if (tr.fraction < 1.0f && (traceEnt->s.eType == ET_BUILDABLE) &&
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
GEF4 $1835
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1835
ADDRLP4 24
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
NEI4 $1835
line 3131
;3131:          (traceEnt->biteam == ent->client->pers.teamSelection)) {
line 3132
;3132:    if (traceEnt->s.eFlags & EF_DBUILDER) {
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $1838
line 3133
;3133:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3135
;3134:              "print \"Structure protection removed\n\"");
;3135:      traceEnt->s.eFlags &= ~EF_DBUILDER;
ADDRLP4 112
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 3136
;3136:    } else {
ADDRGP4 $1839
JUMPV
LABELV $1838
line 3137
;3137:      trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1841
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3139
;3138:              "print \"Structure protection applied\n\"");
;3139:      traceEnt->s.eFlags |= EF_DBUILDER;
ADDRLP4 112
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 3140
;3140:    }
LABELV $1839
line 3141
;3141:  }
LABELV $1835
line 3142
;3142:}
LABELV $1826
endproc Cmd_Protect_f 116 28
export Cmd_Resign_f
proc Cmd_Resign_f 8 8
line 3149
;3143:
;3144:/*
;3145:=================
;3146:Cmd_Resign_f
;3147:=================
;3148: */
;3149:void Cmd_Resign_f(gentity_t *ent) {
line 3150
;3150:  if (!ent->client->pers.designatedBuilder) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1843
line 3151
;3151:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1845
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3153
;3152:            "print \"You are not a designated builder\n\"");
;3153:    return;
ADDRGP4 $1842
JUMPV
LABELV $1843
line 3156
;3154:  }
;3155:
;3156:  ent->client->pers.designatedBuilder = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 0
ASGNI4
line 3157
;3157:  trap_SendServerCommand(-1, va(
ADDRGP4 $1846
ARGP4
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3160
;3158:          "print \"%s" S_COLOR_WHITE " has resigned\n\"",
;3159:          ent->client->pers.netname));
;3160:  G_CheckDBProtection();
ADDRGP4 G_CheckDBProtection
CALLV
pop
line 3161
;3161:}
LABELV $1842
endproc Cmd_Resign_f 8 8
export Cmd_Reload_f
proc Cmd_Reload_f 8 4
line 3168
;3162:
;3163:/*
;3164:=================
;3165:Cmd_Reload_f
;3166:=================
;3167: */
;3168:void Cmd_Reload_f(gentity_t *ent) {
line 3169
;3169:  if ((ent->client->ps.weapon >= WP_ABUILD) &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1848
ADDRLP4 0
INDIRI4
CNSTI4 21
GTI4 $1848
line 3170
;3170:          (ent->client->ps.weapon <= WP_HBUILD)) {
line 3171
;3171:    Cmd_Protect_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Protect_f
CALLV
pop
line 3172
;3172:  } else if (ent->client->ps.weaponstate != WEAPON_RELOADING)
ADDRGP4 $1849
JUMPV
LABELV $1848
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1850
line 3173
;3173:    ent->client->ps.pm_flags |= PMF_WEAPON_RELOAD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $1850
LABELV $1849
line 3174
;3174:}
LABELV $1847
endproc Cmd_Reload_f 8 4
export Cmd_MyStats_f
proc Cmd_MyStats_f 16 8
line 3181
;3175:
;3176:/*
;3177:=================
;3178:Cmd_MyStats_f
;3179:=================
;3180: */
;3181:void Cmd_MyStats_f(gentity_t *ent) {
line 3183
;3182:
;3183:  if (!ent) return;
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1853
ADDRGP4 $1852
JUMPV
LABELV $1853
line 3186
;3184:
;3185:
;3186:  if (!level.intermissiontime && ent->client->pers.statscounters.timeLastViewed && (level.time - ent->client->pers.statscounters.timeLastViewed) < 60000) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+185040
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1855
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1855
ADDRGP4 level+28
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 60000
GEI4 $1855
line 3187
;3187:    ADMP("You may only check your stats once per minute and during intermission.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1859
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3188
;3188:    return;
ADDRGP4 $1852
JUMPV
LABELV $1855
line 3191
;3189:  }
;3190:
;3191:  if (!g_myStats.integer) {
ADDRGP4 g_myStats+12
INDIRI4
CNSTI4 0
NEI4 $1860
line 3192
;3192:    ADMP("myStats has been disabled\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1863
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3193
;3193:    return;
ADDRGP4 $1852
JUMPV
LABELV $1860
line 3196
;3194:  }
;3195:
;3196:  ADMP(G_statsString(&ent->client->pers.statscounters, &ent->client->pers.teamSelection));
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 628
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 G_statsString
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3197
;3197:  ent->client->pers.statscounters.timeLastViewed = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 3199
;3198:
;3199:  return;
LABELV $1852
endproc Cmd_MyStats_f 16 8
export G_statsString
proc G_statsString 56 76
line 3202
;3200:}
;3201:
;3202:char *G_statsString(statsCounters_t *sc, pTeam_t *pt) {
line 3205
;3203:  char *s;
;3204:
;3205:  int percentNearBase = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3206
;3206:  int percentJetpackWallwalk = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3207
;3207:  int percentHeadshots = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3208
;3208:  double avgTimeAlive = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 3209
;3209:  int avgTimeAliveMins = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3210
;3210:  int avgTimeAliveSecs = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3212
;3211:
;3212:  if (sc->timealive)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1866
line 3213
;3213:    percentNearBase = (int) (100 * (float) sc->timeinbase / ((float) (sc->timealive)));
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 1120403456
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
DIVF4
CVFI4 4
ASGNI4
LABELV $1866
line 3215
;3214:
;3215:  if (sc->timealive && sc->deaths) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1868
ADDRLP4 32
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
ADDRLP4 36
INDIRI4
EQI4 $1868
line 3216
;3216:    avgTimeAlive = sc->timealive / sc->deaths;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
DIVI4
CVIF4 4
ASGNF4
line 3217
;3217:  }
LABELV $1868
line 3219
;3218:
;3219:  avgTimeAliveMins = (int) (avgTimeAlive / 60.0f);
ADDRLP4 0
ADDRLP4 4
INDIRF4
CNSTF4 1114636288
DIVF4
CVFI4 4
ASGNI4
line 3220
;3220:  avgTimeAliveSecs = (int) (avgTimeAlive - (60.0f * avgTimeAliveMins));
ADDRLP4 8
ADDRLP4 4
INDIRF4
CNSTF4 1114636288
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3222
;3221:
;3222:  if (*pt == PTE_ALIENS) {
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1
NEI4 $1870
line 3223
;3223:    if (sc->dretchbasytime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1872
line 3224
;3224:      percentJetpackWallwalk = (int) (100 * (float) sc->jetpackusewallwalkusetime / ((float) (sc->dretchbasytime)));
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 1120403456
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
DIVF4
CVFI4 4
ASGNI4
LABELV $1872
line 3226
;3225:
;3226:    if (sc->hitslocational)
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1874
line 3227
;3227:      percentHeadshots = (int) (100 * (float) sc->headshots / ((float) (sc->hitslocational)));
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 1120403456
ADDRLP4 44
INDIRP4
CNSTI4 40
ADDP4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ADDRLP4 44
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
DIVF4
CVFI4 4
ASGNI4
LABELV $1874
line 3229
;3228:
;3229:    s = va("^3Kills:^7 %3i ^3StructKills:^7 %3i ^3Assists:^7 %3i^7 ^3Poisons:^7 %3i ^3Headshots:^7 %3i (%3i)\n^3Deaths:^7 %3i ^3Feeds:^7 %3i ^3Suicides:^7 %3i ^3TKs:^7 %3i ^3Avg Lifespan:^7 %4d:%02d\n^3Damage to:^7 ^3Enemies:^7 %5i ^3Structs:^7 %5i ^3Friendlies:^7 %3i \n^3Structs Built:^7 %3i ^3Time Near Base:^7 %3i ^3Time wallwalking:^7 %3i\n",
ADDRGP4 $1876
ARGP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 28
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 40
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 6
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 52
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 52
INDIRP4
ASGNP4
line 3249
;3230:            sc->kills,
;3231:            sc->structskilled,
;3232:            sc->assists,
;3233:            sc->repairspoisons,
;3234:            sc->headshots,
;3235:            percentHeadshots,
;3236:            sc->deaths,
;3237:            sc->feeds,
;3238:            sc->suicides,
;3239:            sc->teamkills,
;3240:            avgTimeAliveMins,
;3241:            avgTimeAliveSecs,
;3242:            sc->dmgdone,
;3243:            sc->structdmgdone,
;3244:            sc->ffdmgdone,
;3245:            sc->structsbuilt,
;3246:            percentNearBase,
;3247:            percentJetpackWallwalk
;3248:            );
;3249:  } else if (*pt == PTE_HUMANS) {
ADDRGP4 $1871
JUMPV
LABELV $1870
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
NEI4 $1877
line 3250
;3250:    if (sc->timealive)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1879
line 3251
;3251:      percentJetpackWallwalk = (int) (100 * (float) sc->jetpackusewallwalkusetime / ((float) (sc->timealive)));
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 1120403456
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
DIVF4
CVFI4 4
ASGNI4
LABELV $1879
line 3252
;3252:    s = va("^3Kills:^7 %3i ^3StructKills:^7 %3i ^3Assists:^7 %3i \n^3Deaths:^7 %3i ^3Feeds:^7 %3i ^3Suicides:^7 %3i ^3TKs:^7 %3i ^3Avg Lifespan:^7 %4d:%02d\n^3Damage to:^7 ^3Enemies:^7 %5i ^3Structs:^7 %5i ^3Friendlies:^7 %3i \n^3Structs Built:^7 %3i ^3Repairs:^7 %4i ^3Time Near Base:^7 %3i ^3Time Jetpacking:^7 %3i\n",
ADDRGP4 $1881
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 28
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 6
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 52
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 26
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 48
INDIRP4
ASGNP4
line 3270
;3253:            sc->kills,
;3254:            sc->structskilled,
;3255:            sc->assists,
;3256:            sc->deaths,
;3257:            sc->feeds,
;3258:            sc->suicides,
;3259:            sc->teamkills,
;3260:            avgTimeAliveMins,
;3261:            avgTimeAliveSecs,
;3262:            sc->dmgdone,
;3263:            sc->structdmgdone,
;3264:            sc->ffdmgdone,
;3265:            sc->structsbuilt,
;3266:            sc->repairspoisons,
;3267:            percentNearBase,
;3268:            percentJetpackWallwalk
;3269:            );
;3270:  } else s = "No stats available\n";
ADDRGP4 $1878
JUMPV
LABELV $1877
ADDRLP4 20
ADDRGP4 $1882
ASGNP4
LABELV $1878
LABELV $1871
line 3272
;3271:
;3272:  return s;
ADDRLP4 20
INDIRP4
RETP4
LABELV $1865
endproc G_statsString 56 76
export G_StopFromFollowing
proc G_StopFromFollowing 12 8
line 3283
;3273:}
;3274:
;3275:/*
;3276:=================
;3277:G_StopFromFollowing
;3278:
;3279:stops any other clients from following this one
;3280:called when a player leaves a team or dies
;3281:=================
;3282: */
;3283:void G_StopFromFollowing(gentity_t *ent) {
line 3286
;3284:  int i;
;3285:
;3286:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1887
JUMPV
LABELV $1884
line 3287
;3287:    if (level.clients[ i ].sess.spectatorState == SPECTATOR_FOLLOW &&
ADDRLP4 4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1889
ADDRLP4 4
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
NEI4 $1889
line 3288
;3288:            level.clients[ i ].sess.spectatorClient == ent - g_entities) {
line 3289
;3289:      if (!G_FollowNewClient(&g_entities[ i ], 1))
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 G_FollowNewClient
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1891
line 3290
;3290:        G_StopFollowing(&g_entities[ i ]);
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_StopFollowing
CALLV
pop
LABELV $1891
line 3291
;3291:    }
LABELV $1889
line 3292
;3292:  }
LABELV $1885
line 3286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1887
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1884
line 3293
;3293:}
LABELV $1883
endproc G_StopFromFollowing 12 8
export G_StopFollowing
proc G_StopFollowing 28 8
line 3303
;3294:
;3295:/*
;3296:=================
;3297:G_StopFollowing
;3298:
;3299:If the client being followed leaves the game, or you just want to drop
;3300:to free floating spectator mode
;3301:=================
;3302: */
;3303:void G_StopFollowing(gentity_t *ent) {
line 3304
;3304:  ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 1
ASGNI4
line 3305
;3305:  ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 1
ASGNI4
line 3306
;3306:  ent->client->ps.stats[ STAT_PTEAM ] = ent->client->pers.teamSelection;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 3308
;3307:
;3308:  if (ent->client->pers.teamSelection == PTE_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1894
line 3309
;3309:    ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 1
ASGNI4
line 3310
;3310:    ent->client->ps.pm_type = PM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 3311
;3311:    ent->client->ps.stats[ STAT_HEALTH ] = 100; // hacky server-side fix to prevent cgame from viewlocking a freespec
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 100
ASGNI4
line 3312
;3312:  } else {
ADDRGP4 $1895
JUMPV
LABELV $1894
line 3315
;3313:    vec3_t spawn_origin, spawn_angles;
;3314:
;3315:    ent->client->sess.spectatorState = SPECTATOR_LOCKED;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 2
ASGNI4
line 3316
;3316:    if (ent->client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1896
line 3317
;3317:      G_SelectAlienLockSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SelectAlienLockSpawnPoint
CALLP4
pop
ADDRGP4 $1897
JUMPV
LABELV $1896
line 3318
;3318:    else if (ent->client->pers.teamSelection == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1898
line 3319
;3319:      G_SelectHumanLockSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SelectHumanLockSpawnPoint
CALLP4
pop
LABELV $1898
LABELV $1897
line 3320
;3320:    G_SetOrigin(ent, spawn_origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3321
;3321:    VectorCopy(spawn_origin, ent->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3322
;3322:    G_SetClientViewAngle(ent, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 3323
;3323:  }
LABELV $1895
line 3324
;3324:  ent->client->sess.spectatorClient = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTI4 -1
ASGNI4
line 3325
;3325:  ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 3331
;3326:
;3327:  // Prevent spawning with bsuit in rare case
;3328:  /*if (BG_InventoryContainsUpgrade(UP_BATTLESUIT, ent->client->ps.stats))
;3329:    BG_RemoveUpgradeFromInventory(UP_BATTLESUIT, ent->client->ps.stats);*/
;3330:
;3331:  ent->client->ps.stats[ STAT_STATE ] &= ~SS_WALLCLIMBING;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3332
;3332:  ent->client->ps.stats[ STAT_STATE ] &= ~SS_WALLCLIMBINGCEILING;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 3333
;3333:  ent->client->ps.eFlags &= ~EF_WALLCLIMB;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 3334
;3334:  ent->client->ps.viewangles[ PITCH ] = 0.0f;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTF4 0
ASGNF4
line 3336
;3335:
;3336:  ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
line 3338
;3337:
;3338:  CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 3339
;3339:}
LABELV $1893
endproc G_StopFollowing 28 8
export G_FollowNewClient
proc G_FollowNewClient 28 0
line 3348
;3340:
;3341:/*
;3342:=================
;3343:G_FollowNewClient
;3344:
;3345:This was a really nice, elegant function. Then I fucked it up.
;3346:=================
;3347: */
;3348:qboolean G_FollowNewClient(gentity_t *ent, int dir) {
line 3349
;3349:  int clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
ASGNI4
line 3350
;3350:  int original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 3351
;3351:  qboolean selectAny = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3353
;3352:
;3353:  if (dir > 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
LEI4 $1901
line 3354
;3354:    dir = 1;
ADDRFP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1902
JUMPV
LABELV $1901
line 3355
;3355:  else if (dir < -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
GEI4 $1903
line 3356
;3356:    dir = -1;
ADDRFP4 4
CNSTI4 -1
ASGNI4
ADDRGP4 $1904
JUMPV
LABELV $1903
line 3357
;3357:  else if (dir == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1905
line 3358
;3358:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1905
LABELV $1904
LABELV $1902
line 3360
;3359:
;3360:  if (ent->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1907
line 3361
;3361:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1907
line 3364
;3362:
;3363:  // select any if no target exists
;3364:  if (clientnum < 0 || clientnum >= level.maxclients) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1912
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1909
LABELV $1912
line 3365
;3365:    clientnum = original = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 3366
;3366:    selectAny = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3367
;3367:  }
LABELV $1909
LABELV $1913
line 3369
;3368:
;3369:  do {
line 3370
;3370:    clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 3372
;3371:
;3372:    if (clientnum >= level.maxclients)
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1916
line 3373
;3373:      clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1916
line 3375
;3374:
;3375:    if (clientnum < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1919
line 3376
;3376:      clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1919
line 3379
;3377:
;3378:    // avoid selecting existing follow target
;3379:    if (clientnum == original && !selectAny)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1922
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1922
line 3380
;3380:      continue; //effectively break;
ADDRGP4 $1914
JUMPV
LABELV $1922
line 3383
;3381:
;3382:    // can't follow self
;3383:    if (&level.clients[ clientnum ] == ent->client)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $1924
line 3384
;3384:      continue;
ADDRGP4 $1914
JUMPV
LABELV $1924
line 3387
;3385:
;3386:    // can only follow connected clients
;3387:    if (level.clients[ clientnum ].pers.connected != CON_CONNECTED)
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
EQI4 $1926
line 3388
;3388:      continue;
ADDRGP4 $1914
JUMPV
LABELV $1926
line 3391
;3389:
;3390:    // can't follow another spectator
;3391:    if (level.clients[ clientnum ].pers.teamSelection == PTE_NONE)
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
CNSTI4 0
NEI4 $1928
line 3392
;3392:      continue;
ADDRGP4 $1914
JUMPV
LABELV $1928
line 3395
;3393:
;3394:    // can only follow teammates when dead and on a team
;3395:    if (ent->client->pers.teamSelection != PTE_NONE &&
ADDRLP4 16
CNSTI4 628
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1930
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1930
line 3398
;3396:            (level.clients[ clientnum ].pers.teamSelection !=
;3397:            ent->client->pers.teamSelection))
;3398:      continue;
ADDRGP4 $1914
JUMPV
LABELV $1930
line 3401
;3399:
;3400:    // cannot follow a teammate who is following you
;3401:    if (level.clients[ clientnum ].sess.spectatorState == SPECTATOR_FOLLOW &&
ADDRLP4 24
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1932
ADDRLP4 24
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1932
line 3403
;3402:            (level.clients[ clientnum ].sess.spectatorClient == ent->s.number))
;3403:      continue;
ADDRGP4 $1914
JUMPV
LABELV $1932
line 3406
;3404:
;3405:    // this is good, we can use it
;3406:    ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3407
;3407:    ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 3
ASGNI4
line 3408
;3408:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1914
line 3410
;3409:
;3410:  } while (clientnum != original);
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1913
line 3412
;3411:
;3412:  return qfalse;
CNSTI4 0
RETI4
LABELV $1900
endproc G_FollowNewClient 28 0
export G_ToggleFollow
proc G_ToggleFollow 0 8
line 3420
;3413:}
;3414:
;3415:/*
;3416:=================
;3417:G_ToggleFollow
;3418:=================
;3419: */
;3420:void G_ToggleFollow(gentity_t *ent) {
line 3421
;3421:  if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1935
line 3422
;3422:    G_StopFollowing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StopFollowing
CALLV
pop
ADDRGP4 $1936
JUMPV
LABELV $1935
line 3424
;3423:  else
;3424:    G_FollowNewClient(ent, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_FollowNewClient
CALLI4
pop
LABELV $1936
line 3425
;3425:}
LABELV $1934
endproc G_ToggleFollow 0 8
export Cmd_Follow_f
proc Cmd_Follow_f 1300 12
line 3432
;3426:
;3427:/*
;3428:=================
;3429:Cmd_Follow_f
;3430:=================
;3431: */
;3432:void Cmd_Follow_f(gentity_t *ent) {
line 3437
;3433:  int i;
;3434:  int pids[ MAX_CLIENTS ];
;3435:  char arg[ MAX_TOKEN_CHARS ];
;3436:
;3437:  if (ent->client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1938
line 3438
;3438:    trap_SendServerCommand(ent - g_entities, "print \"follow: You cannot follow unless you are dead or on the spectators.\n\"");
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
ADDRGP4 $1940
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3439
;3439:    return;
ADDRGP4 $1937
JUMPV
LABELV $1938
line 3442
;3440:  }
;3441:
;3442:  if (trap_Argc() != 2) {
ADDRLP4 1284
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 2
EQI4 $1941
line 3443
;3443:    G_ToggleFollow(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ToggleFollow
CALLV
pop
line 3444
;3444:  } else {
ADDRGP4 $1942
JUMPV
LABELV $1941
line 3445
;3445:    trap_Argv(1, arg, sizeof ( arg));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3446
;3446:    if (G_ClientNumbersFromString(arg, pids) == 1) {
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1288
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 1
NEI4 $1943
line 3447
;3447:      i = pids[ 0 ];
ADDRLP4 0
ADDRLP4 1028
INDIRI4
ASGNI4
line 3448
;3448:    } else {
ADDRGP4 $1944
JUMPV
LABELV $1943
line 3449
;3449:      i = G_ClientNumberFromString(ent, arg);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1292
ADDRGP4 G_ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1292
INDIRI4
ASGNI4
line 3451
;3450:
;3451:      if (i == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1945
line 3452
;3452:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1947
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3454
;3453:                "print \"follow: invalid player\n\"");
;3454:        return;
ADDRGP4 $1937
JUMPV
LABELV $1945
line 3456
;3455:      }
;3456:    }
LABELV $1944
line 3459
;3457:
;3458:    // can't follow self
;3459:    if (&level.clients[ i ] == ent->client) {
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $1948
line 3460
;3460:      trap_SendServerCommand(ent - g_entities, "print \"follow: You cannot follow yourself.\n\"");
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
ADDRGP4 $1950
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3461
;3461:      return;
ADDRGP4 $1937
JUMPV
LABELV $1948
line 3465
;3462:    }
;3463:
;3464:    // can't follow another spectator
;3465:    if (level.clients[ i ].pers.teamSelection == PTE_NONE) {
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
CNSTI4 0
NEI4 $1951
line 3466
;3466:      trap_SendServerCommand(ent - g_entities, "print \"follow: You cannot follow another spectator.\n\"");
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
ADDRGP4 $1953
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3467
;3467:      return;
ADDRGP4 $1937
JUMPV
LABELV $1951
line 3471
;3468:    }
;3469:
;3470:    // can only follow teammates when dead and on a team
;3471:    if (ent->client->pers.teamSelection != PTE_NONE &&
ADDRLP4 1292
CNSTI4 628
ASGNI4
ADDRLP4 1296
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 1292
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $1954
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 1292
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1296
INDIRI4
EQI4 $1954
line 3473
;3472:            (level.clients[ i ].pers.teamSelection !=
;3473:            ent->client->pers.teamSelection)) {
line 3474
;3474:      trap_SendServerCommand(ent - g_entities, "print \"follow: You can only follow teammates, and only when you are dead.\n\"");
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
ADDRGP4 $1956
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3475
;3475:      return;
ADDRGP4 $1937
JUMPV
LABELV $1954
line 3478
;3476:    }
;3477:
;3478:    ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTI4 3
ASGNI4
line 3479
;3479:    ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3480
;3480:  }
LABELV $1942
line 3481
;3481:}
LABELV $1937
endproc Cmd_Follow_f 1300 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 20 12
line 3488
;3482:
;3483:/*
;3484:=================
;3485:Cmd_FollowCycle_f
;3486:=================
;3487: */
;3488:void Cmd_FollowCycle_f(gentity_t *ent) {
line 3490
;3489:  char args[ 11 ];
;3490:  int dir = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 3492
;3491:
;3492:  trap_Argv(0, args, sizeof ( args));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3493
;3493:  if (Q_stricmp(args, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1960
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1958
line 3494
;3494:    dir = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $1958
line 3497
;3495:
;3496:  // won't work unless spectating
;3497:  if (ent->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1961
line 3498
;3498:    return;
ADDRGP4 $1957
JUMPV
LABELV $1961
line 3499
;3499:  if (ent->client->sess.spectatorState == SPECTATOR_NOT)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1963
line 3500
;3500:    return;
ADDRGP4 $1957
JUMPV
LABELV $1963
line 3501
;3501:  G_FollowNewClient(ent, dir);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_FollowNewClient
CALLI4
pop
line 3502
;3502:}
LABELV $1957
endproc Cmd_FollowCycle_f 20 12
lit
align 1
LABELV $1966
byte 1 0
skip 1023
export Cmd_PTRCVerify_f
code
proc Cmd_PTRCVerify_f 1056 12
line 3511
;3503:
;3504:/*
;3505:=================
;3506:Cmd_PTRCVerify_f
;3507:
;3508:Check a PTR code is valid
;3509:=================
;3510: */
;3511:void Cmd_PTRCVerify_f(gentity_t *ent) {
line 3513
;3512:  connectionRecord_t *connection;
;3513:  char s[ MAX_TOKEN_CHARS ] = {0};
ADDRLP4 4
ADDRGP4 $1966
INDIRB
ASGNB 1024
line 3516
;3514:  int code;
;3515:
;3516:  if (ent->client->pers.connection)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1967
line 3517
;3517:    return;
ADDRGP4 $1965
JUMPV
LABELV $1967
line 3519
;3518:
;3519:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3521
;3520:
;3521:  if (!strlen(s))
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1969
line 3522
;3522:    return;
ADDRGP4 $1965
JUMPV
LABELV $1969
line 3524
;3523:
;3524:  code = atoi(s);
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1036
INDIRI4
ASGNI4
line 3526
;3525:
;3526:  connection = G_FindConnectionForCode(code);
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 G_FindConnectionForCode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1040
INDIRP4
ASGNP4
line 3527
;3527:  if (connection && connection->clientNum == -1) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1971
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -1
NEI4 $1971
line 3529
;3528:    // valid code
;3529:    if (connection->clientTeam != PTE_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1973
line 3530
;3530:      trap_SendServerCommand(ent->client->ps.clientNum, "ptrcconfirm");
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1975
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1973
line 3533
;3531:
;3532:    // restore mapping
;3533:    ent->client->pers.connection = connection;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3534
;3534:    connection->clientNum = ent->client->ps.clientNum;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 3535
;3535:  } else {
ADDRGP4 $1972
JUMPV
LABELV $1971
line 3537
;3536:    // invalid code -- generate a new one
;3537:    connection = G_GenerateNewConnection(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 G_GenerateNewConnection
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
ASGNP4
line 3539
;3538:
;3539:    if (connection) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1976
line 3540
;3540:      trap_SendServerCommand(ent->client->ps.clientNum,
ADDRGP4 $1978
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3542
;3541:              va("ptrcissue %d", connection->ptrCode));
;3542:    }
LABELV $1976
line 3543
;3543:  }
LABELV $1972
line 3544
;3544:}
LABELV $1965
endproc Cmd_PTRCVerify_f 1056 12
lit
align 1
LABELV $1980
byte 1 0
skip 1023
export Cmd_PTRCRestore_f
code
proc Cmd_PTRCRestore_f 1048 12
line 3553
;3545:
;3546:/*
;3547:=================
;3548:Cmd_PTRCRestore_f
;3549:
;3550:Restore against a PTR code
;3551:=================
;3552: */
;3553:void Cmd_PTRCRestore_f(gentity_t *ent) {
line 3554
;3554:  char s[ MAX_TOKEN_CHARS ] = {0};
ADDRLP4 0
ADDRGP4 $1980
INDIRB
ASGNB 1024
line 3558
;3555:  int code;
;3556:  connectionRecord_t *connection;
;3557:
;3558:  if (ent->client->pers.joinedATeam) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1981
line 3559
;3559:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $1983
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3561
;3560:            "print \"You cannot use a PTR code after joining a team\n\"");
;3561:    return;
ADDRGP4 $1979
JUMPV
LABELV $1981
line 3564
;3562:  }
;3563:
;3564:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3566
;3565:
;3566:  if (!strlen(s))
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1984
line 3567
;3567:    return;
ADDRGP4 $1979
JUMPV
LABELV $1984
line 3569
;3568:
;3569:  code = atoi(s);
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1036
INDIRI4
ASGNI4
line 3571
;3570:
;3571:  connection = ent->client->pers.connection;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ASGNP4
line 3572
;3572:  if (connection && connection->ptrCode == code) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1986
ADDRLP4 1024
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1986
line 3574
;3573:    // set the correct team
;3574:    G_ChangeTeam(ent, connection->clientTeam);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 3577
;3575:
;3576:    // set the correct credit etc.
;3577:    ent->client->ps.persistant[ PERS_CREDIT ] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 3578
;3578:    G_AddCreditToClient(ent->client, connection->clientCredit, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 3579
;3579:    ent->client->pers.score = connection->clientScore;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 3580
;3580:    ent->client->pers.enterTime = connection->clientEnterTime;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 3581
;3581:  } else {
ADDRGP4 $1987
JUMPV
LABELV $1986
line 3582
;3582:    trap_SendServerCommand(ent - g_entities,
ADDRGP4 $1988
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3584
;3583:            va("print \"\"%d\" is not a valid PTR code\n\"", code));
;3584:  }
LABELV $1987
line 3585
;3585:}
LABELV $1979
endproc Cmd_PTRCRestore_f 1048 12
proc Cmd_Ignore_f 336 12
line 3587
;3586:
;3587:static void Cmd_Ignore_f(gentity_t *ent) {
line 3591
;3588:  int pids[ MAX_CLIENTS ];
;3589:  char name[ MAX_NAME_LENGTH ];
;3590:  char cmd[ 9 ];
;3591:  int matches = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 3593
;3592:  int i;
;3593:  qboolean ignore = qfalse;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 3595
;3594:
;3595:  trap_Argv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 268
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3596
;3596:  if (Q_stricmp(cmd, "ignore") == 0)
ADDRLP4 268
ARGP4
ADDRGP4 $1992
ARGP4
ADDRLP4 312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
NEI4 $1990
line 3597
;3597:    ignore = qtrue;
ADDRLP4 264
CNSTI4 1
ASGNI4
LABELV $1990
line 3599
;3598:
;3599:  if (trap_Argc() < 2) {
ADDRLP4 316
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 2
GEI4 $1993
line 3600
;3600:    trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $1995
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 320
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 320
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3602
;3601:            "%s: usage \\%s [clientNum | partial name match]\n\"", cmd, cmd));
;3602:    return;
ADDRGP4 $1989
JUMPV
LABELV $1993
line 3605
;3603:  }
;3604:
;3605:  Q_strncpyz(name, ConcatArgs(1), sizeof ( name));
CNSTI4 1
ARGI4
ADDRLP4 320
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 277
ARGP4
ADDRLP4 320
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3606
;3606:  matches = G_ClientNumbersFromString(name, pids);
ADDRLP4 277
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 324
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 324
INDIRI4
ASGNI4
line 3607
;3607:  if (matches < 1) {
ADDRLP4 260
INDIRI4
CNSTI4 1
GEI4 $1996
line 3608
;3608:    trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $1998
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 277
ARGP4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 328
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3610
;3609:            "%s: no clients match the name '%s'\n\"", cmd, name));
;3610:    return;
ADDRGP4 $1989
JUMPV
LABELV $1996
line 3613
;3611:  }
;3612:
;3613:  for (i = 0; i < matches; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2002
JUMPV
LABELV $1999
line 3614
;3614:    if (ignore) {
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $2003
line 3615
;3615:      if (!BG_ClientListTest(&ent->client->sess.ignoreList, pids[ i ])) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 BG_ClientListTest
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $2005
line 3616
;3616:        BG_ClientListAdd(&ent->client->sess.ignoreList, pids[ i ]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BG_ClientListAdd
CALLV
pop
line 3617
;3617:        ClientUserinfoChanged(ent->client->ps.clientNum);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 3618
;3618:        trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $2007
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3621
;3619:                "ignore: added %s^7 to your ignore list\n\"",
;3620:                level.clients[ pids[ i ] ].pers.netname));
;3621:      } else {
ADDRGP4 $2004
JUMPV
LABELV $2005
line 3622
;3622:        trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $2008
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3625
;3623:                "ignore: %s^7 is already on your ignore list\n\"",
;3624:                level.clients[ pids[ i ] ].pers.netname));
;3625:      }
line 3626
;3626:    } else {
ADDRGP4 $2004
JUMPV
LABELV $2003
line 3627
;3627:      if (BG_ClientListTest(&ent->client->sess.ignoreList, pids[ i ])) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 BG_ClientListTest
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $2009
line 3628
;3628:        BG_ClientListRemove(&ent->client->sess.ignoreList, pids[ i ]);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BG_ClientListRemove
CALLV
pop
line 3629
;3629:        ClientUserinfoChanged(ent->client->ps.clientNum);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 3630
;3630:        trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $2011
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3633
;3631:                "unignore: removed %s^7 from your ignore list\n\"",
;3632:                level.clients[ pids[ i ] ].pers.netname));
;3633:      } else {
ADDRGP4 $2010
JUMPV
LABELV $2009
line 3634
;3634:        trap_SendServerCommand(ent - g_entities, va("print \"[skipnotify]"
ADDRGP4 $2012
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3637
;3635:                "unignore: %s^7 is not on your ignore list\n\"",
;3636:                level.clients[ pids[ i ] ].pers.netname));
;3637:      }
LABELV $2010
line 3638
;3638:    }
LABELV $2004
line 3639
;3639:  }
LABELV $2000
line 3613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2002
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
LTI4 $1999
line 3640
;3640:}
LABELV $1989
endproc Cmd_Ignore_f 336 12
lit
align 4
LABELV $2014
byte 4 -1
skip 252
export Cmd_Share_f
code
proc Cmd_Share_f 2488 36
line 3647
;3641:
;3642:/*
;3643:=================
;3644:Cmd_Share_f
;3645:=================
;3646: */
;3647:void Cmd_Share_f(gentity_t *ent) {
line 3648
;3648:  int i, clientNum = 0, creds = 0, skipargs = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRLP4 2056
CNSTI4 0
ASGNI4
ADDRLP4 2076
CNSTI4 0
ASGNI4
line 3649
;3649:  int clientNums[ MAX_CLIENTS ] = {-1};
ADDRLP4 2080
ADDRGP4 $2014
INDIRB
ASGNB 256
line 3655
;3650:  char cmd[ 12 ];
;3651:  char arg1[ MAX_STRING_TOKENS ];
;3652:  char arg2[ MAX_STRING_TOKENS ];
;3653:  pTeam_t team;
;3654:
;3655:  if (!ent || !ent->client || (ent->client->pers.teamSelection == PTE_NONE)) {
ADDRLP4 2336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2340
CNSTU4 0
ASGNU4
ADDRLP4 2336
INDIRP4
CVPU4 4
ADDRLP4 2340
INDIRU4
EQU4 $2018
ADDRLP4 2344
ADDRLP4 2336
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2344
INDIRP4
CVPU4 4
ADDRLP4 2340
INDIRU4
EQU4 $2018
ADDRLP4 2344
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2015
LABELV $2018
line 3656
;3656:    return;
ADDRGP4 $2013
JUMPV
LABELV $2015
line 3659
;3657:  }
;3658:
;3659:  if (!g_allowShare.integer) {
ADDRGP4 g_allowShare+12
INDIRI4
CNSTI4 0
NEI4 $2019
line 3660
;3660:    trap_SendServerCommand(ent - g_entities, "print \"Share has been disabled.\n\"");
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
ADDRGP4 $2022
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3661
;3661:    return;
ADDRGP4 $2013
JUMPV
LABELV $2019
line 3664
;3662:  }
;3663:
;3664:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $2023
line 3665
;3665:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2348
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 2348
INDIRI4
CNSTI4 0
EQI4 $2026
line 3666
;3666:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $573
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3667
;3667:      return;
ADDRGP4 $2013
JUMPV
LABELV $2026
LABELV $2023
line 3670
;3668:    }
;3669:
;3670:  team = ent->client->pers.teamSelection;
ADDRLP4 2060
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 3672
;3671:
;3672:  G_SayArgv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 2064
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3673
;3673:  if (!Q_stricmp(cmd, "say") || !Q_stricmp(cmd, "say_team")) {
ADDRLP4 2064
ARGP4
ADDRGP4 $2030
ARGP4
ADDRLP4 2352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2352
INDIRI4
CNSTI4 0
EQI4 $2032
ADDRLP4 2064
ARGP4
ADDRGP4 $2031
ARGP4
ADDRLP4 2356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2356
INDIRI4
CNSTI4 0
NEI4 $2028
LABELV $2032
line 3674
;3674:    skipargs = 1;
ADDRLP4 2076
CNSTI4 1
ASGNI4
line 3675
;3675:    G_SayArgv(1, cmd, sizeof ( cmd));
CNSTI4 1
ARGI4
ADDRLP4 2064
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3676
;3676:  }
LABELV $2028
line 3679
;3677:
;3678:  // target player name is in arg1
;3679:  G_SayArgv(1 + skipargs, arg1, sizeof ( arg1));
ADDRLP4 2076
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3681
;3680:  // amount to be shared is in arg2
;3681:  G_SayArgv(2 + skipargs, arg2, sizeof ( arg2));
ADDRLP4 2076
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3683
;3682:
;3683:  if (arg1[0] && !strchr(arg1, ';') && Q_stricmp(arg1, "target_in_aim")) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2033
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2360
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2360
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2033
ADDRLP4 4
ARGP4
ADDRGP4 $2035
ARGP4
ADDRLP4 2364
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2364
INDIRI4
CNSTI4 0
EQI4 $2033
line 3685
;3684:    //check arg1 is a number
;3685:    for (i = 0; arg1[ i ]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2039
JUMPV
LABELV $2036
line 3686
;3686:      if (arg1[ i ] < '0' || arg1[ i ] > '9') {
ADDRLP4 2368
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2368
INDIRI4
CNSTI4 48
LTI4 $2042
ADDRLP4 2368
INDIRI4
CNSTI4 57
LEI4 $2040
LABELV $2042
line 3687
;3687:        clientNum = -1;
ADDRLP4 2052
CNSTI4 -1
ASGNI4
line 3688
;3688:        break;
ADDRGP4 $2038
JUMPV
LABELV $2040
line 3690
;3689:      }
;3690:    }
LABELV $2037
line 3685
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2039
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2036
LABELV $2038
line 3692
;3691:
;3692:    if (clientNum >= 0) {
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $2043
line 3693
;3693:      clientNum = atoi(arg1);
ADDRLP4 4
ARGP4
ADDRLP4 2368
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2368
INDIRI4
ASGNI4
line 3694
;3694:    } else if (G_ClientNumbersFromString(arg1, clientNums) == 1) {
ADDRGP4 $2034
JUMPV
LABELV $2043
ADDRLP4 4
ARGP4
ADDRLP4 2080
ARGP4
ADDRLP4 2368
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 2368
INDIRI4
CNSTI4 1
NEI4 $2045
line 3696
;3695:      // there was one partial name match
;3696:      clientNum = clientNums[ 0 ];
ADDRLP4 2052
ADDRLP4 2080
INDIRI4
ASGNI4
line 3697
;3697:    } else {
ADDRGP4 $2034
JUMPV
LABELV $2045
line 3699
;3698:      // look for an exact name match before bailing out
;3699:      clientNum = G_ClientNumberFromString(ent, arg1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2372
ADDRGP4 G_ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2372
INDIRI4
ASGNI4
line 3700
;3700:      if (clientNum == -1) {
ADDRLP4 2052
INDIRI4
CNSTI4 -1
NEI4 $2034
line 3701
;3701:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2049
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3703
;3702:                "print \"share: invalid player name specified.\n\"");
;3703:        return;
ADDRGP4 $2013
JUMPV
line 3705
;3704:      }
;3705:    }
line 3706
;3706:  } else // arg1 not set
LABELV $2033
line 3707
;3707:  {
line 3714
;3708:    vec3_t forward, end;
;3709:    trace_t tr;
;3710:    gentity_t *traceEnt;
;3711:
;3712:
;3713:    // trace a teammate
;3714:    AngleVectors(ent->client->ps.viewangles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 2368
ARGP4
ADDRLP4 2456
CNSTP4 0
ASGNP4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3715
;3715:    VectorMA(ent->client->ps.origin, 8192 * 16, forward, end);
ADDRLP4 2460
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 2464
CNSTF4 1207959552
ASGNF4
ADDRLP4 2380
ADDRLP4 2460
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 2464
INDIRF4
ADDRLP4 2368
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 2380+4
ADDRLP4 2460
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 2464
INDIRF4
ADDRLP4 2368+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 2380+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1207959552
ADDRLP4 2368+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3717
;3716:
;3717:    trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, end, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 2396
ARGP4
ADDRLP4 2468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2468
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 2472
CNSTP4 0
ASGNP4
ADDRLP4 2472
INDIRP4
ARGP4
ADDRLP4 2472
INDIRP4
ARGP4
ADDRLP4 2380
ARGP4
ADDRLP4 2468
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3718
;3718:    traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 2392
CNSTI4 2476
ADDRLP4 2396+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3720
;3719:
;3720:    if (tr.fraction < 1.0f && traceEnt->client &&
ADDRLP4 2396+8
INDIRF4
CNSTF4 1065353216
GEF4 $2055
ADDRLP4 2476
ADDRLP4 2392
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2476
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2055
ADDRLP4 2476
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
NEI4 $2055
line 3721
;3721:            (traceEnt->client->pers.teamSelection == team)) {
line 3722
;3722:      clientNum = traceEnt - g_entities;
ADDRLP4 2052
ADDRLP4 2392
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
line 3723
;3723:    } else {
ADDRGP4 $2056
JUMPV
LABELV $2055
line 3724
;3724:      trap_SendServerCommand(ent - g_entities,
ADDRGP4 $2058
ARGP4
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2062
ADDRLP4 2480
ADDRGP4 $2059
ASGNP4
ADDRGP4 $2063
JUMPV
LABELV $2062
ADDRLP4 2480
ADDRGP4 $2060
ASGNP4
LABELV $2063
ADDRLP4 2480
INDIRP4
ARGP4
ADDRLP4 2484
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2484
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3727
;3725:              va("print \"share: aim at a teammate to share %s.\n\"",
;3726:              (team == PTE_HUMANS) ? "credits" : "evolvepoints"));
;3727:      return;
ADDRGP4 $2013
JUMPV
LABELV $2056
line 3729
;3728:    }
;3729:  }
LABELV $2034
line 3732
;3730:
;3731:  // verify target player team
;3732:  if ((clientNum < 0) || (clientNum >= level.maxclients) ||
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $2068
ADDRLP4 2052
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $2068
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
EQI4 $2064
LABELV $2068
line 3733
;3733:          (level.clients[ clientNum ].pers.teamSelection != team)) {
line 3734
;3734:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2069
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3736
;3735:            "print \"share: not a valid player of your team.\n\"");
;3736:    return;
ADDRGP4 $2013
JUMPV
LABELV $2064
line 3739
;3737:  }
;3738:
;3739:  if (!arg2[0] || strchr(arg2, ';')) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2072
ADDRLP4 1028
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2372
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2372
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2070
LABELV $2072
line 3741
;3740:    // default credit count
;3741:    if (team == PTE_HUMANS) {
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2073
line 3742
;3742:      creds = FREEKILL_HUMAN;
ADDRLP4 2056
CNSTI4 175
ASGNI4
line 3743
;3743:    } else if (team == PTE_ALIENS) {
ADDRGP4 $2071
JUMPV
LABELV $2073
ADDRLP4 2060
INDIRI4
CNSTI4 1
NEI4 $2071
line 3744
;3744:      creds = FREEKILL_ALIEN;
ADDRLP4 2056
CNSTI4 175
ASGNI4
line 3745
;3745:    }
line 3746
;3746:  } else {
ADDRGP4 $2071
JUMPV
LABELV $2070
line 3748
;3747:    //check arg2 is a number
;3748:    for (i = 0; arg2[ i ]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2080
JUMPV
LABELV $2077
line 3749
;3749:      if (arg2[ i ] < '0' || arg2[ i ] > '9') {
ADDRLP4 2376
ADDRLP4 0
INDIRI4
ADDRLP4 1028
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 48
LTI4 $2083
ADDRLP4 2376
INDIRI4
CNSTI4 57
LEI4 $2081
LABELV $2083
line 3750
;3750:        trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2084
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3752
;3751:                "print \"usage: share [name|slot#] [amount]\n\"");
;3752:        return;
ADDRGP4 $2013
JUMPV
LABELV $2081
line 3754
;3753:      }
;3754:    }
LABELV $2078
line 3748
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2080
ADDRLP4 0
INDIRI4
ADDRLP4 1028
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2077
line 3757
;3755:
;3756:    // credit count from parameter
;3757:    creds = atoi(arg2);
ADDRLP4 1028
ARGP4
ADDRLP4 2376
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2056
ADDRLP4 2376
INDIRI4
ASGNI4
line 3758
;3758:  }
LABELV $2071
line 3761
;3759:
;3760:  // player specified "0" to transfer
;3761:  if (creds <= 0) {
ADDRLP4 2056
INDIRI4
CNSTI4 0
GTI4 $2085
line 3762
;3762:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2087
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3764
;3763:            "print \"Ooh, you are a generous one, indeed!\n\"");
;3764:    return;
ADDRGP4 $2013
JUMPV
LABELV $2085
line 3768
;3765:  }
;3766:
;3767:  // transfer only credits the player really has
;3768:  if (creds > ent->client->pers.credit) {
ADDRLP4 2056
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
LEI4 $2088
line 3769
;3769:    creds = ent->client->pers.credit;
ADDRLP4 2056
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ASGNI4
line 3770
;3770:  }
LABELV $2088
line 3773
;3771:
;3772:  // player has no credits
;3773:  if (creds <= 0) {
ADDRLP4 2056
INDIRI4
CNSTI4 0
GTI4 $2090
line 3774
;3774:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2092
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3776
;3775:            "print \"Earn some first, lazy gal!\n\"");
;3776:    return;
ADDRGP4 $2013
JUMPV
LABELV $2090
line 3780
;3777:  }
;3778:
;3779:  // allow transfers only up to the credit/evo limit
;3780:  if ((team == PTE_HUMANS) &&
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2093
ADDRLP4 2056
INDIRI4
CNSTI4 2000
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 656
ADDP4
INDIRI4
SUBI4
LEI4 $2093
line 3781
;3781:          (creds > HUMAN_MAX_CREDITS - level.clients[ clientNum ].pers.credit)) {
line 3782
;3782:    creds = HUMAN_MAX_CREDITS - level.clients[ clientNum ].pers.credit;
ADDRLP4 2056
CNSTI4 2000
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 656
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3783
;3783:  } else if ((team == PTE_ALIENS) &&
ADDRGP4 $2094
JUMPV
LABELV $2093
ADDRLP4 2060
INDIRI4
CNSTI4 1
NEI4 $2095
ADDRLP4 2056
INDIRI4
CNSTI4 2000
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 656
ADDP4
INDIRI4
SUBI4
LEI4 $2095
line 3784
;3784:          (creds > ALIEN_MAX_KILLS - level.clients[ clientNum ].pers.credit)) {
line 3785
;3785:    creds = ALIEN_MAX_KILLS - level.clients[ clientNum ].pers.credit;
ADDRLP4 2056
CNSTI4 2000
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 656
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3786
;3786:  }
LABELV $2095
LABELV $2094
line 3789
;3787:
;3788:  // target cannot take any more credits
;3789:  if (creds <= 0) {
ADDRLP4 2056
INDIRI4
CNSTI4 0
GTI4 $2097
line 3790
;3790:    trap_SendServerCommand(ent - g_entities,
ADDRGP4 $2099
ARGP4
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2101
ADDRLP4 2376
ADDRGP4 $2059
ASGNP4
ADDRGP4 $2102
JUMPV
LABELV $2101
ADDRLP4 2376
ADDRGP4 $2060
ASGNP4
LABELV $2102
ADDRLP4 2376
INDIRP4
ARGP4
ADDRLP4 2380
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3793
;3791:            va("print \"share: player cannot receive any more %s.\n\"",
;3792:            (team == PTE_HUMANS) ? "credits" : "evolvepoints"));
;3793:    return;
ADDRGP4 $2013
JUMPV
LABELV $2097
line 3797
;3794:  }
;3795:
;3796:  // transfer credits
;3797:  G_AddCreditToClient(ent->client, -creds, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 2056
INDIRI4
NEGI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 3798
;3798:  trap_SendServerCommand(ent - g_entities,
ADDRGP4 $2103
ARGP4
ADDRLP4 2056
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2105
ADDRLP4 2376
ADDRGP4 $2059
ASGNP4
ADDRGP4 $2106
JUMPV
LABELV $2105
ADDRLP4 2376
ADDRGP4 $2060
ASGNP4
LABELV $2106
ADDRLP4 2376
INDIRP4
ARGP4
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2380
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3802
;3799:          va("print \"share: transferred %d %s to %s^7.\n\"", creds,
;3800:          (team == PTE_HUMANS) ? "credits" : "evolvepoints",
;3801:          level.clients[ clientNum ].pers.netname));
;3802:  G_AddCreditToClient(&(level.clients[ clientNum ]), creds, qtrue);
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 2056
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 3803
;3803:  trap_SendServerCommand(clientNum,
ADDRGP4 $2107
ARGP4
ADDRLP4 2056
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2109
ADDRLP4 2384
ADDRGP4 $2059
ASGNP4
ADDRGP4 $2110
JUMPV
LABELV $2109
ADDRLP4 2384
ADDRGP4 $2060
ASGNP4
LABELV $2110
ADDRLP4 2384
INDIRP4
ARGP4
ADDRLP4 2388
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 2388
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2388
INDIRI4
ADDP4
ARGP4
ADDRLP4 2392
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2392
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3808
;3804:          va("print \"You have received %d %s from %s^7.\n\"", creds,
;3805:          (team == PTE_HUMANS) ? "credits" : "evolvepoints",
;3806:          ent->client->pers.netname));
;3807:
;3808:  G_LogPrintf("Share: %i %i %i %d: %s^7 transferred %d%s to %s^7\n",
ADDRGP4 $2111
ARGP4
ADDRLP4 2400
CNSTI4 516
ASGNI4
ADDRLP4 2404
ADDRFP4 0
INDIRP4
ADDRLP4 2400
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2404
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ARGI4
ADDRLP4 2056
INDIRI4
ARGI4
ADDRLP4 2404
INDIRP4
ADDRLP4 2400
INDIRI4
ADDP4
ARGP4
ADDRLP4 2056
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
CNSTI4 2
NEI4 $2115
ADDRLP4 2396
ADDRGP4 $2112
ASGNP4
ADDRGP4 $2116
JUMPV
LABELV $2115
ADDRLP4 2396
ADDRGP4 $2113
ASGNP4
LABELV $2116
ADDRLP4 2396
INDIRP4
ARGP4
CNSTI4 2148
ADDRLP4 2052
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3817
;3809:          ent->client->ps.clientNum,
;3810:          clientNum,
;3811:          team,
;3812:          creds,
;3813:          ent->client->pers.netname,
;3814:          creds,
;3815:          (team == PTE_HUMANS) ? "c" : "e",
;3816:          level.clients[ clientNum ].pers.netname);
;3817:}
LABELV $2013
endproc Cmd_Share_f 2488 36
lit
align 1
LABELV $2118
byte 1 0
skip 1023
export Cmd_Donate_f
code
proc Cmd_Donate_f 1092 16
line 3826
;3818:
;3819:/*
;3820:=================
;3821:Cmd_Donate_f
;3822: 
;3823:Alms for the poor
;3824:=================
;3825: */
;3826:void Cmd_Donate_f(gentity_t *ent) {
line 3827
;3827:  char s[ MAX_TOKEN_CHARS ] = "", *type = "evo(s)";
ADDRLP4 36
ADDRGP4 $2118
INDIRB
ASGNB 1024
ADDRLP4 32
ADDRGP4 $2119
ASGNP4
line 3828
;3828:  int i, value, divisor, portion, new_credits, total = 0,
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 3829
;3829:          max = ALIEN_MAX_KILLS, *amounts;
ADDRLP4 16
CNSTI4 2000
ASGNI4
line 3830
;3830:  qboolean donated = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 3832
;3831:
;3832:  if (!ent->client) return;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2120
ADDRGP4 $2117
JUMPV
LABELV $2120
line 3834
;3833:
;3834:  if (!g_allowShare.integer) {
ADDRGP4 g_allowShare+12
INDIRI4
CNSTI4 0
NEI4 $2122
line 3835
;3835:    trap_SendServerCommand(ent - g_entities, "print \"Donate has been disabled.\n\"");
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
ADDRGP4 $2125
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3836
;3836:    return;
ADDRGP4 $2117
JUMPV
LABELV $2122
line 3839
;3837:  }
;3838:
;3839:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $2126
line 3840
;3840:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $2129
line 3841
;3841:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $573
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3842
;3842:      return;
ADDRGP4 $2117
JUMPV
LABELV $2129
LABELV $2126
line 3846
;3843:    }
;3844:
;3845:
;3846:  if (ent->client->pers.teamSelection == PTE_ALIENS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2131
line 3847
;3847:    divisor = level.numAlienClients - 1;
ADDRLP4 28
ADDRGP4 level+185096
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2132
JUMPV
LABELV $2131
line 3848
;3848:  else if (ent->client->pers.teamSelection == PTE_HUMANS) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2134
line 3849
;3849:    divisor = level.numHumanClients - 1;
ADDRLP4 28
ADDRGP4 level+185100
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3850
;3850:    max = HUMAN_MAX_CREDITS;
ADDRLP4 16
CNSTI4 2000
ASGNI4
line 3851
;3851:    type = "credit(s)";
ADDRLP4 32
ADDRGP4 $2137
ASGNP4
line 3852
;3852:  } else {
ADDRGP4 $2135
JUMPV
LABELV $2134
line 3853
;3853:    trap_SendServerCommand(ent - g_entities,
ADDRGP4 $2138
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3855
;3854:            va("print \"donate: spectators cannot be so gracious\n\""));
;3855:    return;
ADDRGP4 $2117
JUMPV
LABELV $2135
LABELV $2132
line 3858
;3856:  }
;3857:
;3858:  if (divisor < 1) {
ADDRLP4 28
INDIRI4
CNSTI4 1
GEI4 $2139
line 3859
;3859:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2141
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3861
;3860:            "print \"donate: get yourself some teammates first\n\"");
;3861:    return;
ADDRGP4 $2117
JUMPV
LABELV $2139
line 3864
;3862:  }
;3863:
;3864:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3865
;3865:  value = atoi(s);
ADDRLP4 36
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 1068
INDIRI4
ASGNI4
line 3866
;3866:  if (value <= 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $2142
line 3867
;3867:    trap_SendServerCommand(ent - g_entities,
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
ADDRGP4 $2144
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3869
;3868:            "print \"donate: very funny\n\"");
;3869:    return;
ADDRGP4 $2117
JUMPV
LABELV $2142
line 3871
;3870:  }
;3871:  if (value > ent->client->pers.credit)
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
LEI4 $2145
line 3872
;3872:    value = ent->client->pers.credit;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ASGNI4
LABELV $2145
line 3875
;3873:
;3874:  // allocate memory for distribution amounts
;3875:  amounts = G_Alloc(level.maxclients * sizeof ( int));
ADDRGP4 level+20
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRLP4 1072
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1072
INDIRP4
ASGNP4
line 3876
;3876:  for (i = 0; i < level.maxclients; i++) amounts[ i ] = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2151
JUMPV
LABELV $2148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 0
ASGNI4
LABELV $2149
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2151
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $2148
line 3879
;3877:
;3878:  // determine donation amounts for each client
;3879:  total = value;
ADDRLP4 1060
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $2154
JUMPV
LABELV $2153
line 3880
;3880:  while (donated && value) {
line 3881
;3881:    donated = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3882
;3882:    portion = value / divisor;
ADDRLP4 8
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
DIVI4
ASGNI4
line 3883
;3883:    if (portion < 1) portion = 1;
ADDRLP4 8
INDIRI4
CNSTI4 1
GEI4 $2156
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $2156
line 3884
;3884:    for (i = 0; i < level.maxclients; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2161
JUMPV
LABELV $2158
line 3885
;3885:      if (level.clients[ i ].pers.connected == CON_CONNECTED &&
ADDRLP4 1076
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2163
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CVPU4 4
ADDRLP4 1076
INDIRP4
CVPU4 4
EQU4 $2163
ADDRLP4 1084
CNSTI4 628
ASGNI4
ADDRLP4 1076
INDIRP4
ADDRLP4 1084
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1080
INDIRP4
ADDRLP4 1084
INDIRI4
ADDP4
INDIRI4
NEI4 $2163
line 3888
;3886:              ent->client != level.clients + i &&
;3887:              level.clients[ i ].pers.teamSelection ==
;3888:              ent->client->pers.teamSelection) {
line 3889
;3889:        new_credits = level.clients[ i ].pers.credit + portion;
ADDRLP4 12
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 3890
;3890:        amounts[ i ] = portion;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 3891
;3891:        if (new_credits > max) {
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $2165
line 3892
;3892:          amounts[ i ] -= new_credits - max;
ADDRLP4 1088
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
SUBI4
ASGNI4
line 3893
;3893:          new_credits = max;
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 3894
;3894:        }
LABELV $2165
line 3895
;3895:        if (amounts[ i ]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2167
line 3896
;3896:          G_AddCreditToClient(&(level.clients[ i ]), amounts[ i ], qtrue);
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 3897
;3897:          donated = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 3898
;3898:          value -= amounts[ i ];
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3899
;3899:          if (value < portion) break;
ADDRLP4 20
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $2169
ADDRGP4 $2160
JUMPV
LABELV $2169
line 3900
;3900:        }
LABELV $2167
line 3901
;3901:      }
LABELV $2163
LABELV $2159
line 3884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2161
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $2158
LABELV $2160
line 3902
;3902:  }
LABELV $2154
line 3880
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $2171
ADDRLP4 20
INDIRI4
ADDRLP4 1076
INDIRI4
NEI4 $2153
LABELV $2171
line 3905
;3903:
;3904:  // transfer funds
;3905:  G_AddCreditToClient(ent->client, value - total, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRLP4 1060
INDIRI4
SUBI4
CVII2 4
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddCreditToClient
CALLV
pop
line 3906
;3906:  for (i = 0; i < level.maxclients; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2175
JUMPV
LABELV $2172
line 3907
;3907:    if (amounts[ i ]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2177
line 3908
;3908:      trap_SendServerCommand(i,
ADDRGP4 $2179
ARGP4
ADDRLP4 1080
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3911
;3909:              va("print \"%s^7 donated %d %s to you, don't forget to say 'thank you'!\n\"",
;3910:              ent->client->pers.netname, amounts[ i ], type));
;3911:    }
LABELV $2177
LABELV $2173
line 3906
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2175
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $2172
line 3913
;3912:
;3913:  G_Free(amounts);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 3915
;3914:
;3915:  trap_SendServerCommand(ent - g_entities,
ADDRGP4 $2180
ARGP4
ADDRLP4 1060
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3918
;3916:          va("print \"Donated %d %s to the cause.\n\"",
;3917:          total - value, type));
;3918:}
LABELV $2117
endproc Cmd_Donate_f 1092 16
export Cmd_Biteam_f
proc Cmd_Biteam_f 156 28
line 3920
;3919:
;3920:void Cmd_Biteam_f(gentity_t *ent) {
line 3924
;3921:  trace_t tr;
;3922:  vec3_t muzzle, forward, right, up, end;
;3923:  gentity_t *trace_ent;
;3924:  if (g_ctn.integer > 0) {
ADDRGP4 g_ctn+12
INDIRI4
CNSTI4 0
LEI4 $2182
line 3925
;3925:    return;
ADDRGP4 $2181
JUMPV
LABELV $2182
line 3927
;3926:  }
;3927:  AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3928
;3928:  CalcMuzzlePoint(ent, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 3929
;3929:  VectorMA(muzzle, 10000, forward, end);
ADDRLP4 124
CNSTF4 1176256512
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1176256512
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3930
;3930:  trap_Trace(&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 128
CNSTP4 0
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3931
;3931:  if (tr.surfaceFlags & SURF_NOIMPACT)
ADDRLP4 40+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2191
line 3932
;3932:    return;
ADDRGP4 $2181
JUMPV
LABELV $2191
line 3933
;3933:  trace_ent = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 40+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3934
;3934:  if (trace_ent->health > 0 && trace_ent->s.eType == ET_BUILDABLE) {
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2195
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2195
line 3935
;3935:    trace_ent->biteam = (trace_ent->biteam + 1) % BIT_NUM_TEAMS;
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 3936
;3936:    trap_SendServerCommand(ent - g_entities, va("print \"^7Set biteam to %s\n",
ADDRGP4 $2197
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2205
ADDRLP4 140
ADDRGP4 $2198
ASGNP4
ADDRGP4 $2206
JUMPV
LABELV $2205
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2207
ADDRLP4 144
ADDRGP4 $2199
ASGNP4
ADDRGP4 $2208
JUMPV
LABELV $2207
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2209
ADDRLP4 148
ADDRGP4 $2200
ASGNP4
ADDRGP4 $2210
JUMPV
LABELV $2209
ADDRLP4 148
ADDRGP4 $2201
ASGNP4
LABELV $2210
ADDRLP4 144
ADDRLP4 148
INDIRP4
ASGNP4
LABELV $2208
ADDRLP4 140
ADDRLP4 144
INDIRP4
ASGNP4
LABELV $2206
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3938
;3937:            (trace_ent->biteam == BIT_NONE) ? "NONE" : (trace_ent->biteam == BIT_ALIENS) ? "ALIENS" : (trace_ent->biteam == BIT_HUMANS) ? "HUMANS" : "ERROR"));
;3938:  }
LABELV $2195
line 3939
;3939:}
LABELV $2181
endproc Cmd_Biteam_f 156 28
export Cmd_Pitch_f
proc Cmd_Pitch_f 1044 12
line 3942
;3940:
;3941:void Cmd_Pitch_f(gentity_t *ent)
;3942:{
line 3946
;3943:  char s[MAX_STRING_CHARS];
;3944:  float newPitch;
;3945:
;3946:  trap_Argv(1, s, sizeof ( s));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3947
;3947:  newPitch = (float)atoi(s);
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
CVIF4 4
ASGNF4
line 3949
;3948:
;3949:  trap_SendServerCommand(ent - g_entities, va("print \"New pitch %f\"", newPitch));
ADDRGP4 $2212
ARGP4
ADDRLP4 1024
INDIRF4
ARGF4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3951
;3950:
;3951:  ent->client->ps.viewangles[PITCH] = AngleNormalize360(newPitch);
ADDRLP4 1024
INDIRF4
ARGF4
ADDRLP4 1036
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 1036
INDIRF4
ASGNF4
line 3952
;3952:  G_SetClientViewAngle(ent, ent->client->ps.viewangles);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 3953
;3953:}
LABELV $2211
endproc Cmd_Pitch_f 1044 12
data
export cmds
align 4
LABELV cmds
address $2213
byte 4 0
address Cmd_Team_f
address $2214
byte 4 0
address Cmd_Vote_f
address $1992
byte 4 0
address Cmd_Ignore_f
address $2215
byte 4 0
address Cmd_Ignore_f
address $2216
byte 4 0
address Cmd_Pitch_f
address $2217
byte 4 2
address Cmd_Tell_f
address $2218
byte 4 2
address Cmd_CallVote_f
address $2219
byte 4 6
address Cmd_CallTeamVote_f
address $2220
byte 4 6
address Cmd_SayArea_f
address $2030
byte 4 130
address Cmd_Say_f
address $2031
byte 4 130
address Cmd_Say_f
address $2221
byte 4 130
address Cmd_Say_f
address $2222
byte 4 130
address Cmd_Say_f
address $852
byte 4 130
address G_PrivateMessage
address $2223
byte 4 130
address G_PrivateMessage
address $2224
byte 4 130
address Cmd_Say_f
address $2225
byte 4 130
address Cmd_Say_f
address $2226
byte 4 128
address ScoreboardMessage
address $2227
byte 4 132
address Cmd_MyStats_f
address $2228
byte 4 69
address Cmd_Give_f
address $2229
byte 4 69
address Cmd_God_f
address $2230
byte 4 69
address Cmd_Notarget_f
address $2231
byte 4 69
address Cmd_Noclip_f
address $2232
byte 4 1
address Cmd_LevelShot_f
address $2233
byte 4 1
address Cmd_SetViewpos_f
address $2234
byte 4 1
address Cmd_ViewPosPlayer_f
address $1524
byte 4 69
address Cmd_Destroy_f
address $2235
byte 4 68
address Cmd_Kill_f
address $2236
byte 4 8
address Cmd_PTRCVerify_f
address $2237
byte 4 8
address Cmd_PTRCRestore_f
address $2238
byte 4 0
address Cmd_Follow_f
address $2239
byte 4 0
address Cmd_FollowCycle_f
address $1960
byte 4 0
address Cmd_FollowCycle_f
address $2240
byte 4 4
address Cmd_Where_f
address $2241
byte 4 4
address Cmd_TeamVote_f
address $2242
byte 4 4
address Cmd_Class_f
address $2243
byte 4 68
address Cmd_Build_f
address $2244
byte 4 68
address Cmd_Destroy_f
address $2245
byte 4 96
address Cmd_Buy_f
address $2246
byte 4 96
address Cmd_Sell_f
address $2247
byte 4 96
address Cmd_ActivateItem_f
address $2248
byte 4 96
address Cmd_DeActivateItem_f
address $2249
byte 4 96
address Cmd_ToggleItem_f
address $2250
byte 4 96
address Cmd_Reload_f
address $2251
byte 4 0
address Cmd_Boost_f
address $2252
byte 4 4
address Cmd_Share_f
address $2253
byte 4 4
address Cmd_Donate_f
address $2254
byte 4 68
address Cmd_Protect_f
address $2255
byte 4 4
address Cmd_Resign_f
address $2256
byte 4 0
address Cmd_Builder_f
address $2257
byte 4 0
address Cmd_Biteam_f
align 4
LABELV numCmds
byte 4 51
export ClientCommand
code
proc ClientCommand 1060 12
line 4029
;3954:
;3955:commands_t cmds[ ] = {
;3956:  // normal commands
;3957:  { "team", 0, Cmd_Team_f},
;3958:  { "vote", 0, Cmd_Vote_f},
;3959:  { "ignore", 0, Cmd_Ignore_f},
;3960:  { "unignore", 0, Cmd_Ignore_f},
;3961:  { "pitch", 0, Cmd_Pitch_f},
;3962:
;3963:  // communication commands
;3964:  { "tell", CMD_MESSAGE, Cmd_Tell_f},
;3965:  { "callvote", CMD_MESSAGE, Cmd_CallVote_f},
;3966:  { "callteamvote", CMD_MESSAGE | CMD_TEAM, Cmd_CallTeamVote_f},
;3967:  { "say_area", CMD_MESSAGE | CMD_TEAM, Cmd_SayArea_f},
;3968:  // can be used even during intermission
;3969:  { "say", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3970:  { "say_team", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3971:  { "say_admins", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3972:  { "a", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3973:  { "m", CMD_MESSAGE | CMD_INTERMISSION, G_PrivateMessage},
;3974:  { "mt", CMD_MESSAGE | CMD_INTERMISSION, G_PrivateMessage},
;3975:  { "me", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3976:  { "me_team", CMD_MESSAGE | CMD_INTERMISSION, Cmd_Say_f},
;3977:
;3978:  { "score", CMD_INTERMISSION, ScoreboardMessage},
;3979:  { "mystats", CMD_TEAM | CMD_INTERMISSION, Cmd_MyStats_f},
;3980:
;3981:  // cheats
;3982:  { "give", CMD_CHEAT | CMD_TEAM | CMD_LIVING, Cmd_Give_f},
;3983:  { "god", CMD_CHEAT | CMD_TEAM | CMD_LIVING, Cmd_God_f},
;3984:  { "notarget", CMD_CHEAT | CMD_TEAM | CMD_LIVING, Cmd_Notarget_f},
;3985:  { "noclip", CMD_CHEAT | CMD_TEAM | CMD_LIVING, Cmd_Noclip_f},
;3986:  { "levelshot", CMD_CHEAT, Cmd_LevelShot_f},
;3987:  { "setviewpos", CMD_CHEAT, Cmd_SetViewpos_f},
;3988:  { "viewposplayer", CMD_CHEAT, Cmd_ViewPosPlayer_f},
;3989:  { "destroy", CMD_CHEAT | CMD_TEAM | CMD_LIVING, Cmd_Destroy_f},
;3990:
;3991:  { "kill", CMD_TEAM | CMD_LIVING, Cmd_Kill_f},
;3992:
;3993:  // game commands
;3994:  { "ptrcverify", CMD_NOTEAM, Cmd_PTRCVerify_f},
;3995:  { "ptrcrestore", CMD_NOTEAM, Cmd_PTRCRestore_f},
;3996:
;3997:  { "follow", 0, Cmd_Follow_f},
;3998:  { "follownext", 0, Cmd_FollowCycle_f},
;3999:  { "followprev", 0, Cmd_FollowCycle_f},
;4000:
;4001:  { "where", CMD_TEAM, Cmd_Where_f},
;4002:  { "teamvote", CMD_TEAM, Cmd_TeamVote_f},
;4003:  { "class", CMD_TEAM, Cmd_Class_f},
;4004:
;4005:  { "build", CMD_TEAM | CMD_LIVING, Cmd_Build_f},
;4006:  { "deconstruct", CMD_TEAM | CMD_LIVING, Cmd_Destroy_f},
;4007:
;4008:  { "buy", CMD_HUMAN | CMD_LIVING, Cmd_Buy_f},
;4009:  { "sell", CMD_HUMAN | CMD_LIVING, Cmd_Sell_f},
;4010:  { "itemact", CMD_HUMAN | CMD_LIVING, Cmd_ActivateItem_f},
;4011:  { "itemdeact", CMD_HUMAN | CMD_LIVING, Cmd_DeActivateItem_f},
;4012:  { "itemtoggle", CMD_HUMAN | CMD_LIVING, Cmd_ToggleItem_f},
;4013:  { "reload", CMD_HUMAN | CMD_LIVING, Cmd_Reload_f},
;4014:  { "boost", 0, Cmd_Boost_f},
;4015:  { "share", CMD_TEAM, Cmd_Share_f},
;4016:  { "donate", CMD_TEAM, Cmd_Donate_f},
;4017:  { "protect", CMD_TEAM | CMD_LIVING, Cmd_Protect_f},
;4018:  { "resign", CMD_TEAM, Cmd_Resign_f},
;4019:  { "builder", 0, Cmd_Builder_f},
;4020:  { "biteam", 0, Cmd_Biteam_f}
;4021:};
;4022:static int numCmds = sizeof ( cmds) / sizeof ( cmds[ 0 ]);
;4023:
;4024:/*
;4025:=================
;4026:ClientCommand
;4027:=================
;4028: */
;4029:void ClientCommand(int clientNum) {
line 4034
;4030:  gentity_t *ent;
;4031:  char cmd[ MAX_TOKEN_CHARS ];
;4032:  int i;
;4033:
;4034:  ent = g_entities + clientNum;
ADDRLP4 1028
CNSTI4 2476
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4035
;4035:  if (!ent->client)
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2259
line 4036
;4036:    return; // not fully in game yet
ADDRGP4 $2258
JUMPV
LABELV $2259
line 4038
;4037:
;4038:  trap_Argv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 4040
;4039:
;4040:  for (i = 0; i < numCmds; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2264
JUMPV
LABELV $2261
line 4041
;4041:    if (Q_stricmp(cmd, cmds[ i ].cmdName) == 0)
ADDRLP4 4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $2265
line 4042
;4042:      break;
ADDRGP4 $2263
JUMPV
LABELV $2265
line 4043
;4043:  }
LABELV $2262
line 4040
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2264
ADDRLP4 0
INDIRI4
ADDRGP4 numCmds
INDIRI4
LTI4 $2261
LABELV $2263
line 4045
;4044:
;4045:  if (i == numCmds) {
ADDRLP4 0
INDIRI4
ADDRGP4 numCmds
INDIRI4
NEI4 $2267
line 4046
;4046:    if (!G_admin_cmd_check(ent, qfalse))
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1032
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $2258
line 4047
;4047:      trap_SendServerCommand(clientNum,
ADDRGP4 $2271
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4049
;4048:            va("print \"Unknown command %s\n\"", cmd));
;4049:    return;
ADDRGP4 $2258
JUMPV
LABELV $2267
line 4054
;4050:  }
;4051:
;4052:  // do tests here to reduce the amount of repeated code
;4053:
;4054:  if (!(cmds[ i ].cmdFlags & CMD_INTERMISSION) && (level.intermissiontime || level.paused))
ADDRLP4 1032
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 1032
INDIRI4
NEI4 $2272
ADDRGP4 level+185040
INDIRI4
ADDRLP4 1032
INDIRI4
NEI4 $2277
ADDRGP4 level+189852
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $2272
LABELV $2277
line 4055
;4055:    return;
ADDRGP4 $2258
JUMPV
LABELV $2272
line 4057
;4056:
;4057:  if (cmds[ i ].cmdFlags & CMD_CHEAT && !g_cheats.integer) {
ADDRLP4 1036
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1036
INDIRI4
EQI4 $2278
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $2278
line 4058
;4058:    trap_SendServerCommand(clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2282
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4060
;4059:            "print \"Cheats are not enabled on this server\n\"");
;4060:    return;
ADDRGP4 $2258
JUMPV
LABELV $2278
line 4063
;4061:  }
;4062:
;4063:  if (cmds[ i ].cmdFlags & CMD_MESSAGE && ent->client->pers.muted) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 1040
INDIRI4
EQI4 $2283
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 1040
INDIRI4
EQI4 $2283
line 4064
;4064:    trap_SendServerCommand(clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2286
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4066
;4065:            "print \"You are muted and cannot use message commands.\n\"");
;4066:    return;
ADDRGP4 $2258
JUMPV
LABELV $2283
line 4069
;4067:  }
;4068:
;4069:  if (cmds[ i ].cmdFlags & CMD_TEAM &&
ADDRLP4 1044
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 1044
INDIRI4
EQI4 $2287
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $2287
line 4070
;4070:          ent->client->pers.teamSelection == PTE_NONE) {
line 4071
;4071:    trap_SendServerCommand(clientNum, "print \"Join a team first\n\"");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2290
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4072
;4072:    return;
ADDRGP4 $2258
JUMPV
LABELV $2287
line 4075
;4073:  }
;4074:
;4075:  if (cmds[ i ].cmdFlags & CMD_NOTEAM &&
ADDRLP4 1048
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1048
INDIRI4
EQI4 $2291
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $2291
line 4076
;4076:          ent->client->pers.teamSelection != PTE_NONE) {
line 4077
;4077:    trap_SendServerCommand(clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2294
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4079
;4078:            "print \"Cannot use this command when on a team\n\"");
;4079:    return;
ADDRGP4 $2258
JUMPV
LABELV $2291
line 4082
;4080:  }
;4081:
;4082:  if (cmds[ i ].cmdFlags & CMD_ALIEN &&
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2295
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2295
line 4083
;4083:          ent->client->pers.teamSelection != PTE_ALIENS) {
line 4084
;4084:    trap_SendServerCommand(clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2298
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4086
;4085:            "print \"Must be alien to use this command\n\"");
;4086:    return;
ADDRGP4 $2258
JUMPV
LABELV $2295
line 4097
;4087:  }
;4088:
;4089:  /* if( cmds[ i ].cmdFlags & CMD_HUMAN &&
;4090:       ent->client->pers.teamSelection != PTE_HUMANS )
;4091:   {
;4092:     trap_SendServerCommand( clientNum,
;4093:       "print \"Must be human to use this command\n\"" );
;4094:     return;
;4095:   }*/
;4096:
;4097:  if (cmds[ i ].cmdFlags & CMD_LIVING &&
ADDRLP4 1052
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 1052
INDIRI4
EQI4 $2299
ADDRLP4 1056
ADDRLP4 1028
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $2302
ADDRLP4 1056
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2299
LABELV $2302
line 4099
;4098:          (ent->client->ps.stats[ STAT_HEALTH ] <= 0 ||
;4099:          ent->client->sess.sessionTeam == TEAM_SPECTATOR)) {
line 4100
;4100:    trap_SendServerCommand(clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2303
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4102
;4101:            "print \"Must be living to use this command\n\"");
;4102:    return;
ADDRGP4 $2258
JUMPV
LABELV $2299
line 4105
;4103:  }
;4104:
;4105:  cmds[ i ].cmdHandler(ent);
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+8
ADDP4
INDIRP4
CALLV
pop
line 4106
;4106:}
LABELV $2258
endproc ClientCommand 1060 12
export G_SayArgc
proc G_SayArgc 16 4
line 4108
;4107:
;4108:int G_SayArgc(void) {
line 4109
;4109:  int c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4112
;4110:  char *s;
;4111:
;4112:  s = ConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2307
JUMPV
line 4113
;4113:  while (1) {
LABELV $2309
line 4115
;4114:    while (*s == ' ')
;4115:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2310
line 4114
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2309
line 4116
;4116:    if (!*s)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2312
line 4117
;4117:      break;
ADDRGP4 $2308
JUMPV
LABELV $2312
line 4118
;4118:    c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2315
JUMPV
LABELV $2314
line 4120
;4119:    while (*s && *s != ' ')
;4120:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2315
line 4119
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2317
ADDRLP4 12
INDIRI4
CNSTI4 32
NEI4 $2314
LABELV $2317
line 4121
;4121:  }
LABELV $2307
line 4113
ADDRGP4 $2310
JUMPV
LABELV $2308
line 4122
;4122:  return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $2305
endproc G_SayArgc 16 4
export G_SayArgv
proc G_SayArgv 32 4
line 4125
;4123:}
;4124:
;4125:qboolean G_SayArgv(int n, char *buffer, int bufferLength) {
line 4126
;4126:  int bc = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4127
;4127:  int c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4130
;4128:  char *s;
;4129:
;4130:  if (bufferLength < 1)
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $2319
line 4131
;4131:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2319
line 4132
;4132:  if (n < 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $2321
line 4133
;4133:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2321
line 4134
;4134:  s = ConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $2324
JUMPV
line 4135
;4135:  while (c < n) {
LABELV $2326
line 4137
;4136:    while (*s == ' ')
;4137:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2327
line 4136
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2326
line 4138
;4138:    if (!*s)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2329
line 4139
;4139:      break;
ADDRGP4 $2325
JUMPV
LABELV $2329
line 4140
;4140:    c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2332
JUMPV
LABELV $2331
line 4142
;4141:    while (*s && *s != ' ')
;4142:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2332
line 4141
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2334
ADDRLP4 16
INDIRI4
CNSTI4 32
NEI4 $2331
LABELV $2334
line 4143
;4143:  }
LABELV $2324
line 4135
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2327
LABELV $2325
line 4144
;4144:  if (c < n)
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
GEI4 $2338
line 4145
;4145:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2337
line 4147
;4146:  while (*s == ' ')
;4147:    s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2338
line 4146
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2337
line 4148
;4148:  if (!*s)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2343
line 4149
;4149:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2342
line 4152
;4150:  //memccpy( buffer, s, ' ', bufferLength );
;4151:  while (bc < bufferLength - 1 && *s && *s != ' ')
;4152:    buffer[ bc++ ] = *s++;
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
LABELV $2343
line 4151
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
GEI4 $2346
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2346
ADDRLP4 28
INDIRI4
CNSTI4 32
NEI4 $2342
LABELV $2346
line 4153
;4153:  buffer[ bc ] = 0;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4154
;4154:  return qtrue;
CNSTI4 1
RETI4
LABELV $2318
endproc G_SayArgv 32 4
export G_SayConcatArgs
proc G_SayConcatArgs 16 4
line 4157
;4155:}
;4156:
;4157:char *G_SayConcatArgs(int start) {
line 4159
;4158:  char *s;
;4159:  int c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4161
;4160:
;4161:  s = ConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2349
JUMPV
line 4162
;4162:  while (c < start) {
LABELV $2351
line 4164
;4163:    while (*s == ' ')
;4164:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2352
line 4163
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2351
line 4165
;4165:    if (!*s)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2354
line 4166
;4166:      break;
ADDRGP4 $2361
JUMPV
LABELV $2354
line 4167
;4167:    c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2357
JUMPV
LABELV $2356
line 4169
;4168:    while (*s && *s != ' ')
;4169:      s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2357
line 4168
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2359
ADDRLP4 12
INDIRI4
CNSTI4 32
NEI4 $2356
LABELV $2359
line 4170
;4170:  }
LABELV $2349
line 4162
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2352
ADDRGP4 $2361
JUMPV
LABELV $2360
line 4172
;4171:  while (*s == ' ')
;4172:    s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2361
line 4171
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2360
line 4173
;4173:  return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $2347
endproc G_SayConcatArgs 16 4
export G_DecolorString
proc G_DecolorString 16 0
line 4176
;4174:}
;4175:
;4176:void G_DecolorString(char *in, char *out) {
ADDRGP4 $2365
JUMPV
LABELV $2364
line 4177
;4177:  while (*in) {
line 4178
;4178:    if (*in == 27 || *in == '^') {
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
EQI4 $2369
ADDRLP4 0
INDIRI4
CNSTI4 94
NEI4 $2367
LABELV $2369
line 4179
;4179:      in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 4180
;4180:      if (*in)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2365
line 4181
;4181:        in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 4182
;4182:      continue;
ADDRGP4 $2365
JUMPV
LABELV $2367
line 4184
;4183:    }
;4184:    *out++ = *in++;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 4185
;4185:  }
LABELV $2365
line 4177
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2364
line 4186
;4186:  *out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 4187
;4187:}
LABELV $2363
endproc G_DecolorString 16 0
export G_ParseEscapedString
proc G_ParseEscapedString 20 0
line 4189
;4188:
;4189:void G_ParseEscapedString(char *buffer) {
line 4190
;4190:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4191
;4191:  int j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2374
JUMPV
LABELV $2373
line 4193
;4192:
;4193:  while (buffer[i]) {
line 4194
;4194:    if (!buffer[i]) break;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2376
ADDRGP4 $2375
JUMPV
LABELV $2376
line 4196
;4195:
;4196:    if (buffer[i] == '\\') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $2378
line 4197
;4197:      if (buffer[i + 1] == '\\')
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $2380
line 4198
;4198:        buffer[j] = buffer[++i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRI1
ASGNI1
ADDRGP4 $2379
JUMPV
LABELV $2380
line 4199
;4199:      else if (buffer[i + 1] == 'n') {
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $2382
line 4200
;4200:        buffer[j] = '\n';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 10
ASGNI1
line 4201
;4201:        i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4202
;4202:      } else
ADDRGP4 $2379
JUMPV
LABELV $2382
line 4203
;4203:        buffer[j] = buffer[i];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 4204
;4204:    } else
ADDRGP4 $2379
JUMPV
LABELV $2378
line 4205
;4205:      buffer[j] = buffer[i];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
LABELV $2379
line 4207
;4206:
;4207:    i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4208
;4208:    j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4209
;4209:  }
LABELV $2374
line 4193
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2373
LABELV $2375
line 4210
;4210:  buffer[j] = 0;
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4211
;4211:}
LABELV $2372
endproc G_ParseEscapedString 20 0
export G_WordWrap
proc G_WordWrap 1076 8
line 4213
;4212:
;4213:void G_WordWrap(char *buffer, int maxwidth) {
line 4215
;4214:  char out[ MAX_STRING_CHARS ];
;4215:  int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4216
;4216:  int j = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 4218
;4217:  int k;
;4218:  int linecount = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4219
;4219:  int currentcolor = 7;
ADDRLP4 1040
CNSTI4 7
ASGNI4
ADDRGP4 $2386
JUMPV
LABELV $2385
line 4221
;4220:
;4221:  while (buffer[ j ] != '\0') {
line 4222
;4222:    if (i == (MAX_STRING_CHARS - 1))
ADDRLP4 4
INDIRI4
CNSTI4 1023
NEI4 $2388
line 4223
;4223:      break;
ADDRGP4 $2387
JUMPV
LABELV $2388
line 4227
;4224:
;4225:    //If it's the start of a new line, copy over the color code,
;4226:    //but not if we already did it, or if the text at the start of the next line is also a color code
;4227:    if (linecount == 0 && i > 2 && out[ i - 2 ] != Q_COLOR_ESCAPE && out[ i - 1 ] != Q_COLOR_ESCAPE) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2390
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $2390
ADDRLP4 1048
CNSTI4 94
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8-2
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1048
INDIRI4
EQI4 $2390
ADDRLP4 4
INDIRI4
ADDRLP4 8-1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1048
INDIRI4
EQI4 $2390
line 4228
;4228:      out[ i ] = Q_COLOR_ESCAPE;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 94
ASGNI1
line 4229
;4229:      out[ i + 1 ] = '0' + currentcolor;
ADDRLP4 4
INDIRI4
ADDRLP4 8+1
ADDP4
ADDRLP4 1040
INDIRI4
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 4230
;4230:      i += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 4231
;4231:      continue;
ADDRGP4 $2386
JUMPV
LABELV $2390
line 4234
;4232:    }
;4233:
;4234:    if (linecount < maxwidth) {
ADDRLP4 1036
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $2395
line 4235
;4235:      out[ i ] = buffer[ j ];
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 1032
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 4236
;4236:      if (out[ i ] == '\n') {
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $2397
line 4237
;4237:        linecount = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4238
;4238:      } else if (Q_IsColorString(&buffer[j])) {
ADDRGP4 $2398
JUMPV
LABELV $2397
ADDRLP4 1052
ADDRLP4 1032
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2399
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $2399
ADDRLP4 1056
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $2399
ADDRLP4 1056
INDIRI4
CNSTI4 65
LTI4 $2402
ADDRLP4 1056
INDIRI4
CNSTI4 90
LEI4 $2401
LABELV $2402
ADDRLP4 1060
ADDRLP4 1032
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 97
LTI4 $2403
ADDRLP4 1060
INDIRI4
CNSTI4 122
LEI4 $2401
LABELV $2403
ADDRLP4 1064
ADDRLP4 1032
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 48
LTI4 $2399
ADDRLP4 1064
INDIRI4
CNSTI4 57
GTI4 $2399
LABELV $2401
line 4239
;4239:        currentcolor = buffer[j + 1] - '0';
ADDRLP4 1040
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 4240
;4240:      } else
ADDRGP4 $2400
JUMPV
LABELV $2399
line 4241
;4241:        linecount++;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2400
LABELV $2398
line 4244
;4242:
;4243:      //If we're at a space and getting close to a line break, look ahead and make sure that there isn't already a \n or a closer space coming. If not, break here.
;4244:      if (out[ i ] == ' ' && linecount >= (maxwidth - 10)) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $2404
ADDRLP4 1036
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 10
SUBI4
LTI4 $2404
line 4245
;4245:        qboolean foundbreak = qfalse;
ADDRLP4 1068
CNSTI4 0
ASGNI4
line 4246
;4246:        for (k = i + 1; k < maxwidth; k++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2409
JUMPV
LABELV $2406
line 4247
;4247:          if (!buffer[ k ])
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2410
line 4248
;4248:            continue;
ADDRGP4 $2407
JUMPV
LABELV $2410
line 4249
;4249:          if (buffer[ k ] == '\n' || buffer[ k ] == ' ')
ADDRLP4 1072
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 10
EQI4 $2414
ADDRLP4 1072
INDIRI4
CNSTI4 32
NEI4 $2412
LABELV $2414
line 4250
;4250:            foundbreak = qtrue;
ADDRLP4 1068
CNSTI4 1
ASGNI4
LABELV $2412
line 4251
;4251:        }
LABELV $2407
line 4246
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2409
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $2406
line 4252
;4252:        if (!foundbreak) {
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2415
line 4253
;4253:          out [ i ] = '\n';
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 10
ASGNI1
line 4254
;4254:          linecount = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4255
;4255:        }
LABELV $2415
line 4256
;4256:      }
LABELV $2404
line 4258
;4257:
;4258:      i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4259
;4259:      j++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4260
;4260:    } else {
ADDRGP4 $2396
JUMPV
LABELV $2395
line 4261
;4261:      out[ i ] = '\n';
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 10
ASGNI1
line 4262
;4262:      i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4263
;4263:      linecount = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4264
;4264:    }
LABELV $2396
line 4265
;4265:  }
LABELV $2386
line 4221
ADDRLP4 1032
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2385
LABELV $2387
line 4266
;4266:  out[ i ] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 4269
;4267:
;4268:
;4269:  strcpy(buffer, out);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4270
;4270:}
LABELV $2384
endproc G_WordWrap 1076 8
export G_PrivateMessage
proc G_PrivateMessage 1704 32
line 4272
;4271:
;4272:void G_PrivateMessage(gentity_t *ent) {
line 4280
;4273:  int pids[ MAX_CLIENTS ];
;4274:  int ignoreids[ MAX_CLIENTS ];
;4275:  char name[ MAX_NAME_LENGTH ];
;4276:  char cmd[ 12 ];
;4277:  char str[ MAX_STRING_CHARS ];
;4278:  char *msg;
;4279:  char color;
;4280:  int pcount, matches, ignored = 0;
ADDRLP4 1332
CNSTI4 0
ASGNI4
line 4282
;4281:  int i;
;4282:  int skipargs = 0;
ADDRLP4 1612
CNSTI4 0
ASGNI4
line 4283
;4283:  qboolean teamonly = qfalse;
ADDRLP4 1336
CNSTI4 0
ASGNI4
line 4286
;4284:  gentity_t *tmpent;
;4285:
;4286:  if (!g_privateMessages.integer && ent) {
ADDRGP4 g_privateMessages+12
INDIRI4
CNSTI4 0
NEI4 $2418
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2418
line 4287
;4287:    ADMP("Sorry, but private messages have been disabled\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2421
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4288
;4288:    return;
ADDRGP4 $2417
JUMPV
LABELV $2418
line 4291
;4289:  }
;4290:
;4291:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $2422
line 4292
;4292:    if (G_Flood_Limited(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1616
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 1616
INDIRI4
CNSTI4 0
EQI4 $2425
line 4293
;4293:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
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
ADDRGP4 $573
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4294
;4294:      return;
ADDRGP4 $2417
JUMPV
LABELV $2425
LABELV $2422
line 4297
;4295:    }
;4296:
;4297:  G_SayArgv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 1596
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4298
;4298:  if (!Q_stricmp(cmd, "say") || !Q_stricmp(cmd, "say_team")) {
ADDRLP4 1596
ARGP4
ADDRGP4 $2030
ARGP4
ADDRLP4 1620
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1620
INDIRI4
CNSTI4 0
EQI4 $2429
ADDRLP4 1596
ARGP4
ADDRGP4 $2031
ARGP4
ADDRLP4 1624
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1624
INDIRI4
CNSTI4 0
NEI4 $2427
LABELV $2429
line 4299
;4299:    skipargs = 1;
ADDRLP4 1612
CNSTI4 1
ASGNI4
line 4300
;4300:    G_SayArgv(1, cmd, sizeof ( cmd));
CNSTI4 1
ARGI4
ADDRLP4 1596
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4301
;4301:  }
LABELV $2427
line 4302
;4302:  if (G_SayArgc() < 3 + skipargs) {
ADDRLP4 1628
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1628
INDIRI4
ADDRLP4 1612
INDIRI4
CNSTI4 3
ADDI4
GEI4 $2430
line 4303
;4303:    ADMP(va("usage: %s [name|slot#] [message]\n", cmd));
ADDRGP4 $2432
ARGP4
ADDRLP4 1596
ARGP4
ADDRLP4 1632
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1632
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4304
;4304:    return;
ADDRGP4 $2417
JUMPV
LABELV $2430
line 4307
;4305:  }
;4306:
;4307:  if (!Q_stricmp(cmd, "mt") || !Q_stricmp(cmd, "/mt"))
ADDRLP4 1596
ARGP4
ADDRGP4 $2223
ARGP4
ADDRLP4 1632
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1632
INDIRI4
CNSTI4 0
EQI4 $2436
ADDRLP4 1596
ARGP4
ADDRGP4 $2435
ARGP4
ADDRLP4 1636
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1636
INDIRI4
CNSTI4 0
NEI4 $2433
LABELV $2436
line 4308
;4308:    teamonly = qtrue;
ADDRLP4 1336
CNSTI4 1
ASGNI4
LABELV $2433
line 4310
;4309:
;4310:  G_SayArgv(1 + skipargs, name, sizeof ( name));
ADDRLP4 1612
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1296
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4311
;4311:  msg = G_SayConcatArgs(2 + skipargs);
ADDRLP4 1612
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1640
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 1328
ADDRLP4 1640
INDIRP4
ASGNP4
line 4312
;4312:  pcount = G_ClientNumbersFromString(name, pids);
ADDRLP4 1296
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1644
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1608
ADDRLP4 1644
INDIRI4
ASGNI4
line 4314
;4313:
;4314:  if (ent) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2437
line 4315
;4315:    int count = 0;
ADDRLP4 1648
CNSTI4 0
ASGNI4
line 4317
;4316:
;4317:    for (i = 0; i < pcount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2442
JUMPV
LABELV $2439
line 4318
;4318:      tmpent = &g_entities[ pids[ i ] ];
ADDRLP4 1284
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4320
;4319:
;4320:      if (teamonly && !OnSameTeam(ent, tmpent))
ADDRLP4 1336
INDIRI4
CNSTI4 0
EQI4 $2443
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1652
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1652
INDIRI4
CNSTI4 0
NEI4 $2443
line 4321
;4321:        continue;
ADDRGP4 $2440
JUMPV
LABELV $2443
line 4323
;4322:
;4323:      if (BG_ClientListTest(&tmpent->client->sess.ignoreList,
ADDRLP4 1284
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ARGP4
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
ADDRLP4 1656
ADDRGP4 BG_ClientListTest
CALLI4
ASGNI4
ADDRLP4 1656
INDIRI4
CNSTI4 0
EQI4 $2445
line 4324
;4324:              ent - g_entities)) {
line 4325
;4325:        ignoreids[ ignored++ ] = pids[ i ];
ADDRLP4 1660
ADDRLP4 1332
INDIRI4
ASGNI4
ADDRLP4 1332
ADDRLP4 1660
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1664
CNSTI4 2
ASGNI4
ADDRLP4 1660
INDIRI4
ADDRLP4 1664
INDIRI4
LSHI4
ADDRLP4 1340
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 1664
INDIRI4
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
ASGNI4
line 4326
;4326:        continue;
ADDRGP4 $2440
JUMPV
LABELV $2445
line 4329
;4327:      }
;4328:
;4329:      pids[ count ] = pids[ i ];
ADDRLP4 1660
CNSTI4 2
ASGNI4
ADDRLP4 1648
INDIRI4
ADDRLP4 1660
INDIRI4
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 1660
INDIRI4
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
ASGNI4
line 4330
;4330:      count++;
ADDRLP4 1648
ADDRLP4 1648
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4331
;4331:    }
LABELV $2440
line 4317
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2442
ADDRLP4 0
INDIRI4
ADDRLP4 1608
INDIRI4
LTI4 $2439
line 4332
;4332:    matches = count;
ADDRLP4 1292
ADDRLP4 1648
INDIRI4
ASGNI4
line 4333
;4333:  } else {
ADDRGP4 $2438
JUMPV
LABELV $2437
line 4334
;4334:    matches = pcount;
ADDRLP4 1292
ADDRLP4 1608
INDIRI4
ASGNI4
line 4335
;4335:  }
LABELV $2438
line 4337
;4336:
;4337:  color = teamonly ? COLOR_CYAN : COLOR_YELLOW;
ADDRLP4 1336
INDIRI4
CNSTI4 0
EQI4 $2448
ADDRLP4 1648
CNSTI4 53
ASGNI4
ADDRGP4 $2449
JUMPV
LABELV $2448
ADDRLP4 1648
CNSTI4 51
ASGNI4
LABELV $2449
ADDRLP4 1288
ADDRLP4 1648
INDIRI4
CVII1 4
ASGNI1
line 4339
;4338:
;4339:  if (!Q_stricmp(name, "console")) {
ADDRLP4 1296
ARGP4
ADDRGP4 $620
ARGP4
ADDRLP4 1652
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1652
INDIRI4
CNSTI4 0
NEI4 $2450
line 4340
;4340:    ADMP(va("^%cPrivate message: ^7%s\n", color, msg));
ADDRGP4 $2452
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRLP4 1656
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4341
;4341:    ADMP(va("^%csent to Console.\n", color));
ADDRGP4 $2453
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1660
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1660
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4343
;4342:
;4343:    G_LogPrintf("privmsg: %s^7: Console: ^6%s^7\n",
ADDRGP4 $2454
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2457
ADDRLP4 1668
CNSTI4 516
ASGNI4
ADDRLP4 1664
ADDRFP4 0
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $2458
JUMPV
LABELV $2457
ADDRLP4 1664
ADDRGP4 $2455
ASGNP4
LABELV $2458
ADDRLP4 1664
INDIRP4
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 4346
;4344:            (ent) ? ent->client->pers.netname : "Console", msg);
;4345:
;4346:    return;
ADDRGP4 $2417
JUMPV
LABELV $2450
line 4349
;4347:  }
;4348:
;4349:  Q_strncpyz(str,
ADDRGP4 $2459
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1292
INDIRI4
ARGI4
ADDRLP4 1292
INDIRI4
CNSTI4 1
NEI4 $2462
ADDRLP4 1656
ADDRGP4 $555
ASGNP4
ADDRGP4 $2463
JUMPV
LABELV $2462
ADDRLP4 1656
ADDRGP4 $2460
ASGNP4
LABELV $2463
ADDRLP4 1656
INDIRP4
ARGP4
ADDRLP4 1664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1664
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4354
;4350:          va("^%csent to %i player%s: ^7", color, matches,
;4351:          (matches == 1) ? "" : "s"),
;4352:          sizeof ( str));
;4353:
;4354:  for (i = 0; i < matches; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2467
JUMPV
LABELV $2464
line 4355
;4355:    tmpent = &g_entities[ pids[ i ] ];
ADDRLP4 1284
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4357
;4356:
;4357:    if (i > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $2468
line 4358
;4358:      Q_strcat(str, sizeof ( str), "^7, ");
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2470
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $2468
line 4359
;4359:    Q_strcat(str, sizeof ( str), tmpent->client->pers.netname);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1668
CNSTI4 516
ASGNI4
ADDRLP4 1284
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4360
;4360:    trap_SendServerCommand(pids[ i ], va(
ADDRGP4 $2471
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2474
ADDRLP4 1680
CNSTI4 516
ASGNI4
ADDRLP4 1672
ADDRFP4 0
INDIRP4
ADDRLP4 1680
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1680
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $2475
JUMPV
LABELV $2474
ADDRLP4 1672
ADDRGP4 $620
ASGNP4
LABELV $2475
ADDRLP4 1672
INDIRP4
ARGP4
ADDRLP4 1684
ADDRLP4 1288
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1684
INDIRI4
ARGI4
ADDRLP4 1296
ARGP4
ADDRLP4 1292
INDIRI4
ARGI4
ADDRLP4 1684
INDIRI4
ARGI4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2476
ADDRLP4 1676
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
ADDRGP4 $2477
JUMPV
LABELV $2476
ADDRLP4 1676
CNSTI4 -1
ASGNI4
LABELV $2477
ADDRLP4 1676
INDIRI4
ARGI4
ADDRLP4 1688
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
ARGI4
ADDRLP4 1688
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4370
;4361:            "chat \"%s^%c -> ^7%s^7: (%d recipients): ^%c%s^7\" %i",
;4362:            (ent) ? ent->client->pers.netname : "console",
;4363:            color,
;4364:            name,
;4365:            matches,
;4366:            color,
;4367:            msg,
;4368:            ent ? ent - g_entities : -1));
;4369:
;4370:    trap_SendServerCommand(pids[ i ], va(
ADDRGP4 $2478
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2480
ADDRLP4 1696
CNSTI4 516
ASGNI4
ADDRLP4 1692
ADDRFP4 0
INDIRP4
ADDRLP4 1696
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1696
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $2481
JUMPV
LABELV $2480
ADDRLP4 1692
ADDRGP4 $620
ASGNP4
LABELV $2481
ADDRLP4 1692
INDIRP4
ARGP4
ADDRLP4 1700
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
INDIRI4
ARGI4
ADDRLP4 1700
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4373
;4371:            "cp \"^%cprivate message from ^7%s^7\"", color,
;4372:            (ent) ? ent->client->pers.netname : "console"));
;4373:  }
LABELV $2465
line 4354
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2467
ADDRLP4 0
INDIRI4
ADDRLP4 1292
INDIRI4
LTI4 $2464
line 4375
;4374:
;4375:  if (!matches)
ADDRLP4 1292
INDIRI4
CNSTI4 0
NEI4 $2482
line 4376
;4376:    ADMP(va("^3No player matching ^7\'%s^7\' ^3to send message to.\n",
ADDRGP4 $2484
ARGP4
ADDRLP4 1296
ARGP4
ADDRLP4 1668
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $2483
JUMPV
LABELV $2482
line 4378
;4377:          name));
;4378:  else {
line 4379
;4379:    if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2485
line 4380
;4380:      ADMP(va("^%cPrivate message: ^7%s\n", color, msg));
ADDRGP4 $2452
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRLP4 1672
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1672
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
LABELV $2485
line 4382
;4381:
;4382:    ADMP(va("%s\n", str));
ADDRGP4 $854
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1676
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1676
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4384
;4383:
;4384:    G_LogPrintf("%s: %s^7: %s^7: %s\n",
ADDRGP4 $2487
ARGP4
ADDRLP4 1336
INDIRI4
CNSTI4 0
EQI4 $2492
ADDRLP4 1680
ADDRGP4 $2488
ASGNP4
ADDRGP4 $2493
JUMPV
LABELV $2492
ADDRLP4 1680
ADDRGP4 $2489
ASGNP4
LABELV $2493
ADDRLP4 1680
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2494
ADDRLP4 1688
CNSTI4 516
ASGNI4
ADDRLP4 1684
ADDRFP4 0
INDIRP4
ADDRLP4 1688
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1688
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $2495
JUMPV
LABELV $2494
ADDRLP4 1684
ADDRGP4 $620
ASGNP4
LABELV $2495
ADDRLP4 1684
INDIRP4
ARGP4
ADDRLP4 1296
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 4388
;4385:            (teamonly) ? "tprivmsg" : "privmsg",
;4386:            (ent) ? ent->client->pers.netname : "console",
;4387:            name, msg);
;4388:  }
LABELV $2483
line 4390
;4389:
;4390:  if (ignored) {
ADDRLP4 1332
INDIRI4
CNSTI4 0
EQI4 $2496
line 4391
;4391:    Q_strncpyz(str, va("^%cignored by %i player%s: ^7", color, ignored,
ADDRGP4 $2498
ARGP4
ADDRLP4 1288
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1332
INDIRI4
ARGI4
ADDRLP4 1332
INDIRI4
CNSTI4 1
NEI4 $2500
ADDRLP4 1672
ADDRGP4 $555
ASGNP4
ADDRGP4 $2501
JUMPV
LABELV $2500
ADDRLP4 1672
ADDRGP4 $2460
ASGNP4
LABELV $2501
ADDRLP4 1672
INDIRP4
ARGP4
ADDRLP4 1680
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1680
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4393
;4392:            (ignored == 1) ? "" : "s"), sizeof ( str));
;4393:    for (i = 0; i < ignored; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2505
JUMPV
LABELV $2502
line 4394
;4394:      tmpent = &g_entities[ ignoreids[ i ] ];
ADDRLP4 1284
CNSTI4 2476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1340
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4395
;4395:      if (i > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $2506
line 4396
;4396:        Q_strcat(str, sizeof ( str), "^7, ");
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2470
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $2506
line 4397
;4397:      Q_strcat(str, sizeof ( str), tmpent->client->pers.netname);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1684
CNSTI4 516
ASGNI4
ADDRLP4 1284
INDIRP4
ADDRLP4 1684
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1684
INDIRI4
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4398
;4398:    }
LABELV $2503
line 4393
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2505
ADDRLP4 0
INDIRI4
ADDRLP4 1332
INDIRI4
LTI4 $2502
line 4399
;4399:    ADMP(va("%s\n", str));
ADDRGP4 $854
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1684
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4400
;4400:  }
LABELV $2496
line 4401
;4401:}
LABELV $2417
endproc G_PrivateMessage 1704 32
export Cmd_Builder_f
proc Cmd_Builder_f 180 28
line 4408
;4402:
;4403:/*
;4404:=================
;4405:Cmd_Builder_f
;4406:=================
;4407: */
;4408:void Cmd_Builder_f(gentity_t *ent) {
line 4415
;4409:  vec3_t forward, right, up;
;4410:  vec3_t start, end;
;4411:  trace_t tr;
;4412:  gentity_t *traceEnt;
;4413:  char bdnumbchr[21];
;4414:
;4415:  AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4416
;4416:  if (ent->client->pers.teamSelection != PTE_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2509
line 4417
;4417:    CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
ADDRGP4 $2510
JUMPV
LABELV $2509
line 4419
;4418:  else
;4419:    VectorCopy(ent->client->ps.origin, start);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
LABELV $2510
line 4420
;4420:  VectorMA(start, 1000, forward, end);
ADDRLP4 148
CNSTF4 1148846080
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4422
;4421:
;4422:  trap_Trace(&tr, start, NULL, NULL, end, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 152
CNSTP4 0
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4423
;4423:  traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 40+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4425
;4424:
;4425:  Com_sprintf(bdnumbchr, sizeof (bdnumbchr), "%i", traceEnt->bdnumb);
ADDRLP4 100
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 $1118
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4427
;4426:
;4427:  if (tr.fraction < 1.0f && (traceEnt->s.eType == ET_BUILDABLE)) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $2518
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2518
line 4428
;4428:    if (G_admin_permission(ent, "buildlog")) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2523
ARGP4
ADDRLP4 156
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $2521
line 4429
;4429:      trap_SendServerCommand(ent - g_entities, va(
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2529
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 G_FindBuildLogName
CALLP4
ASGNP4
ADDRLP4 160
ADDRLP4 172
INDIRP4
ASGNP4
ADDRGP4 $2530
JUMPV
LABELV $2529
ADDRLP4 160
ADDRGP4 $2525
ASGNP4
LABELV $2530
ADDRGP4 $2524
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2531
ADDRLP4 164
ADDRLP4 100
ASGNP4
ADDRGP4 $2532
JUMPV
LABELV $2531
ADDRLP4 164
ADDRGP4 $2527
ASGNP4
LABELV $2532
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4434
;4430:              "print \"^5/builder:^7 ^3Building:^7 %s ^3Built By:^7 %s^7 ^3Buildlog Number:^7 %s^7 ^3SurvivalStage:^7 %d\n\"",
;4431:              BG_FindHumanNameForBuildable(traceEnt->s.modelindex),
;4432:              (traceEnt->bdnumb != -1) ? G_FindBuildLogName(traceEnt->bdnumb) : "<world>",
;4433:              (traceEnt->bdnumb != -1) ? bdnumbchr : "none", traceEnt->survivalStage));
;4434:    } else {
ADDRGP4 $2519
JUMPV
LABELV $2521
line 4435
;4435:      trap_SendServerCommand(ent - g_entities, va(
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2535
ADDRLP4 0
INDIRP4
CNSTI4 1928
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 G_FindBuildLogName
CALLP4
ASGNP4
ADDRLP4 160
ADDRLP4 168
INDIRP4
ASGNP4
ADDRGP4 $2536
JUMPV
LABELV $2535
ADDRLP4 160
ADDRGP4 $2525
ASGNP4
LABELV $2536
ADDRGP4 $2533
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4439
;4436:              "print \"^5/builder:^7 ^3Building:^7 %s ^3Built By:^7 %s^7\n\"",
;4437:              BG_FindHumanNameForBuildable(traceEnt->s.modelindex),
;4438:              (traceEnt->bdnumb != -1) ? G_FindBuildLogName(traceEnt->bdnumb) : "<world>"));
;4439:    }
line 4440
;4440:  }/*else if(traceEnt->client)
ADDRGP4 $2519
JUMPV
LABELV $2518
line 4445
;4441:    {
;4442:          trap_SendServerCommand(ent - g_entities, 
;4443:          va("print \"^5%d\n\"",traceEnt->client.pers.netname));
;4444:    }*/
;4445:   else {
line 4446
;4446:    trap_SendServerCommand(ent - g_entities, "print \"^5/builder:^7 No structure found in your crosshair. Please face a structure and try again.\n\"");
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
ADDRGP4 $2537
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4447
;4447:  }
LABELV $2519
line 4448
;4448:  if(tr.fraction < 1.0f )
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $2538
line 4449
;4449:  {
line 4450
;4450:    trap_SendServerCommand(ent - g_entities, va("print \"^5/builder:^7 ID: %d.\n\"", traceEnt->s.number));
ADDRGP4 $2541
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4451
;4451:  }
LABELV $2538
line 4452
;4452:}
LABELV $2508
endproc Cmd_Builder_f 180 28
lit
align 1
LABELV $2543
byte 1 0
skip 1023
align 1
LABELV $2544
byte 1 0
skip 1023
export G_CP
code
proc G_CP 3124 16
line 4454
;4453:
;4454:void G_CP(gentity_t *ent) {
line 4457
;4455:  int i;
;4456:  char buffer[MAX_STRING_CHARS];
;4457:  char prefixes[MAX_STRING_CHARS] = "";
ADDRLP4 8
ADDRGP4 $2543
INDIRB
ASGNB 1024
line 4458
;4458:  char wrappedtext[ MAX_STRING_CHARS ] = "";
ADDRLP4 1048
ADDRGP4 $2544
INDIRB
ASGNB 1024
line 4461
;4459:  char *ptr;
;4460:  char *text;
;4461:  qboolean sendAliens = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
line 4462
;4462:  qboolean sendHumans = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 4463
;4463:  qboolean sendSpecs = qtrue;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 4464
;4464:  Q_strncpyz(buffer, ConcatArgs(1), sizeof ( buffer));
CNSTI4 1
ARGI4
ADDRLP4 3096
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 2072
ARGP4
ADDRLP4 3096
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4465
;4465:  G_ParseEscapedString(buffer);
ADDRLP4 2072
ARGP4
ADDRGP4 G_ParseEscapedString
CALLV
pop
line 4467
;4466:
;4467:  if (strstr(buffer, "!cp")) {
ADDRLP4 2072
ARGP4
ADDRGP4 $2547
ARGP4
ADDRLP4 3100
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 3100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2545
line 4468
;4468:    ptr = buffer;
ADDRLP4 4
ADDRLP4 2072
ASGNP4
ADDRGP4 $2549
JUMPV
LABELV $2548
line 4470
;4469:    while (*ptr != '!')
;4470:      ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2549
line 4469
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $2548
line 4471
;4471:    ptr += 4;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 4473
;4472:
;4473:    Q_strncpyz(buffer, ptr, sizeof (buffer));
ADDRLP4 2072
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4474
;4474:  }
LABELV $2545
line 4476
;4475:
;4476:  text = buffer;
ADDRLP4 1032
ADDRLP4 2072
ASGNP4
line 4478
;4477:
;4478:  ptr = buffer;
ADDRLP4 4
ADDRLP4 2072
ASGNP4
ADDRGP4 $2552
JUMPV
LABELV $2551
line 4480
;4479:  while (*ptr == ' ')
;4480:    ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2552
line 4479
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $2551
line 4481
;4481:  if (*ptr == '-') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $2554
line 4482
;4482:    sendAliens = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4483
;4483:    sendHumans = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 4484
;4484:    sendSpecs = qfalse;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 4485
;4485:    Q_strcat(prefixes, sizeof ( prefixes), " ");
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2556
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4486
;4486:    ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $2558
JUMPV
LABELV $2557
line 4488
;4487:
;4488:    while (*ptr != ' ') {
line 4489
;4489:      if (*ptr == 'a' || *ptr == 'A') {
ADDRLP4 3104
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3104
INDIRI4
CNSTI4 97
EQI4 $2562
ADDRLP4 3104
INDIRI4
CNSTI4 65
NEI4 $2560
LABELV $2562
line 4490
;4490:        sendAliens = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
line 4491
;4491:        Q_strcat(prefixes, sizeof ( prefixes), "[A]");
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2563
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4492
;4492:      }
LABELV $2560
line 4493
;4493:      if (*ptr == 'h' || *ptr == 'H') {
ADDRLP4 3108
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3108
INDIRI4
CNSTI4 104
EQI4 $2566
ADDRLP4 3108
INDIRI4
CNSTI4 72
NEI4 $2564
LABELV $2566
line 4494
;4494:        sendHumans = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 4495
;4495:        Q_strcat(prefixes, sizeof ( prefixes), "[H]");
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2567
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4496
;4496:      }
LABELV $2564
line 4497
;4497:      if (*ptr == 's' || *ptr == 'S') {
ADDRLP4 3112
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3112
INDIRI4
CNSTI4 115
EQI4 $2570
ADDRLP4 3112
INDIRI4
CNSTI4 83
NEI4 $2568
LABELV $2570
line 4498
;4498:        sendSpecs = qtrue;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 4499
;4499:        Q_strcat(prefixes, sizeof ( prefixes), "[S]");
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2571
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 4500
;4500:      }
LABELV $2568
line 4501
;4501:      ptr++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 4502
;4502:    }
LABELV $2558
line 4488
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $2557
line 4503
;4503:    text = ptr + 1;
ADDRLP4 1032
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 4504
;4504:  }
LABELV $2554
line 4506
;4505:
;4506:  strcpy(wrappedtext, text);
ADDRLP4 1048
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4507
;4507:  G_WordWrap(wrappedtext, 50);
ADDRLP4 1048
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 G_WordWrap
CALLV
pop
line 4509
;4508:
;4509:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2575
JUMPV
LABELV $2572
line 4510
;4510:    if (level.clients[ i ].pers.connected == CON_DISCONNECTED)
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
CNSTI4 0
NEI4 $2577
line 4511
;4511:      continue;
ADDRGP4 $2573
JUMPV
LABELV $2577
line 4513
;4512:
;4513:    if ((!sendAliens && level.clients[ i ].pers.teamSelection == PTE_ALIENS) ||
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2582
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
CNSTI4 1
EQI4 $2583
LABELV $2582
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2584
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
CNSTI4 2
EQI4 $2583
LABELV $2584
ADDRLP4 3104
CNSTI4 0
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRLP4 3104
INDIRI4
NEI4 $2579
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
ADDRLP4 3104
INDIRI4
NEI4 $2579
LABELV $2583
line 4515
;4514:            (!sendHumans && level.clients[ i ].pers.teamSelection == PTE_HUMANS) ||
;4515:            (!sendSpecs && level.clients[ i ].pers.teamSelection == PTE_NONE)) {
line 4516
;4516:      if (G_admin_permission(&g_entities[ i ], ADMF_ADMINCHAT)) {
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 3108
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 3108
INDIRI4
CNSTI4 0
EQI4 $2573
line 4517
;4517:        trap_SendServerCommand(i, va("print \"^6[Admins]^7 CP to other team%s: %s \n\"", prefixes, text));
ADDRGP4 $2587
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 3112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4518
;4518:      }
line 4519
;4519:      continue;
ADDRGP4 $2573
JUMPV
LABELV $2579
line 4522
;4520:    }
;4521:
;4522:    trap_SendServerCommand(i, va("cp \"%s\"", wrappedtext));
ADDRGP4 $2588
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 3108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4523
;4523:    trap_SendServerCommand(i, va("print \"%s^7 CP%s: %s\n\"", (ent ? G_admin_adminPrintName(ent) : "console"), prefixes, text));
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2591
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3116
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 3112
ADDRLP4 3116
INDIRP4
ASGNP4
ADDRGP4 $2592
JUMPV
LABELV $2591
ADDRLP4 3112
ADDRGP4 $620
ASGNP4
LABELV $2592
ADDRGP4 $2589
ARGP4
ADDRLP4 3112
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 3120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4524
;4524:  }
LABELV $2573
line 4509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2575
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $2572
line 4526
;4525:
;4526:  G_Printf("cp: %s\n", ConcatArgs(1));
CNSTI4 1
ARGI4
ADDRLP4 3104
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $2593
ARGP4
ADDRLP4 3104
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 4527
;4527:}
LABELV $2542
endproc G_CP 3124 16
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
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
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
LABELV $2593
byte 1 99
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2589
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 67
byte 1 80
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2588
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $2587
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 54
byte 1 91
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 93
byte 1 94
byte 1 55
byte 1 32
byte 1 67
byte 1 80
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2571
byte 1 91
byte 1 83
byte 1 93
byte 1 0
align 1
LABELV $2567
byte 1 91
byte 1 72
byte 1 93
byte 1 0
align 1
LABELV $2563
byte 1 91
byte 1 65
byte 1 93
byte 1 0
align 1
LABELV $2556
byte 1 32
byte 1 0
align 1
LABELV $2547
byte 1 33
byte 1 99
byte 1 112
byte 1 0
align 1
LABELV $2541
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2537
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2533
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2527
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2525
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $2524
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 53
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2523
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $2498
byte 1 94
byte 1 37
byte 1 99
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $2489
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 109
byte 1 115
byte 1 103
byte 1 0
align 1
LABELV $2488
byte 1 116
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 109
byte 1 115
byte 1 103
byte 1 0
align 1
LABELV $2487
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2484
byte 1 94
byte 1 51
byte 1 78
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 94
byte 1 51
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2478
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 0
align 1
LABELV $2471
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 105
byte 1 112
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2470
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $2460
byte 1 115
byte 1 0
align 1
LABELV $2459
byte 1 94
byte 1 37
byte 1 99
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $2455
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2454
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 109
byte 1 115
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 54
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $2453
byte 1 94
byte 1 37
byte 1 99
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2452
byte 1 94
byte 1 37
byte 1 99
byte 1 80
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2435
byte 1 47
byte 1 109
byte 1 116
byte 1 0
align 1
LABELV $2432
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2421
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2303
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2298
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2294
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2290
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2286
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2282
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2271
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2257
byte 1 98
byte 1 105
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2256
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2255
byte 1 114
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2254
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2253
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2252
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2251
byte 1 98
byte 1 111
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2250
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $2249
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2248
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 100
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2247
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 97
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2246
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2245
byte 1 98
byte 1 117
byte 1 121
byte 1 0
align 1
LABELV $2244
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2243
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $2242
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2241
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2240
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2239
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2238
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $2237
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2236
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 0
align 1
LABELV $2235
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2234
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2233
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2232
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $2231
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2230
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $2229
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $2228
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2227
byte 1 109
byte 1 121
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2226
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2225
byte 1 109
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2224
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2223
byte 1 109
byte 1 116
byte 1 0
align 1
LABELV $2222
byte 1 97
byte 1 0
align 1
LABELV $2221
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2220
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $2219
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2218
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2217
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2216
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2215
byte 1 117
byte 1 110
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2214
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2213
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2212
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 37
byte 1 102
byte 1 34
byte 1 0
align 1
LABELV $2201
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $2200
byte 1 72
byte 1 85
byte 1 77
byte 1 65
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $2199
byte 1 65
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $2198
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $2197
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2180
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2179
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 44
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 39
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 39
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2144
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 121
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2141
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2138
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 97
byte 1 99
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2137
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 40
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $2125
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2119
byte 1 101
byte 1 118
byte 1 111
byte 1 40
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $2113
byte 1 101
byte 1 0
align 1
LABELV $2112
byte 1 99
byte 1 0
align 1
LABELV $2111
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $2107
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 105
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2103
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2099
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2092
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 69
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 122
byte 1 121
byte 1 32
byte 1 103
byte 1 97
byte 1 108
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2087
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 79
byte 1 111
byte 1 104
byte 1 44
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2084
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 93
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2069
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2060
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2059
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2058
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 97
byte 1 105
byte 1 109
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2049
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2035
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 95
byte 1 97
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $2031
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2030
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2022
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2012
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 117
byte 1 110
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2011
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 117
byte 1 110
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2008
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
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
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2007
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1998
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1995
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 92
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 124
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 93
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1992
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1988
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 80
byte 1 84
byte 1 82
byte 1 32
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1983
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 80
byte 1 84
byte 1 82
byte 1 32
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1978
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 105
byte 1 115
byte 1 115
byte 1 117
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1975
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $1960
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $1956
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1953
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1950
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1947
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1940
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1882
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1881
byte 1 94
byte 1 51
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 10
byte 1 94
byte 1 51
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 75
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 65
byte 1 118
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 102
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 110
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 52
byte 1 100
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 10
byte 1 94
byte 1 51
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 53
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 53
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 10
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 82
byte 1 101
byte 1 112
byte 1 97
byte 1 105
byte 1 114
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 78
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 74
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1876
byte 1 94
byte 1 51
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 80
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 51
byte 1 105
byte 1 41
byte 1 10
byte 1 94
byte 1 51
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 75
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 65
byte 1 118
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 102
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 110
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 52
byte 1 100
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 10
byte 1 94
byte 1 51
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 53
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 53
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 10
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 78
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 94
byte 1 51
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 119
byte 1 97
byte 1 108
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1863
byte 1 109
byte 1 121
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1859
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1846
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1845
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1841
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1840
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1829
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1819
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1799
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1795
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1792
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
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1759
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1745
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1738
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1731
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1725
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1714
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1709
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1676
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1673
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1662
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1659
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1611
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1599
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 48
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1598
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 69
byte 1 67
byte 1 79
byte 1 78
byte 1 83
byte 1 84
byte 1 82
byte 1 85
byte 1 67
byte 1 84
byte 1 69
byte 1 68
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1579
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1530
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 51
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1529
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
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1524
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $1519
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1515
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1490
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1485
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1462
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 119
byte 1 97
byte 1 108
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1456
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1446
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1445
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1432
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1419
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1408
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 91
byte 1 32
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 32
byte 1 93
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1399
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1385
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1384
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1381
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1353
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1349
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1345
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 54
byte 1 91
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 93
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1340
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1330
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1325
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 111
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1320
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 112
byte 1 101
byte 1 111
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1315
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1312
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1309
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1306
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1303
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $1300
byte 1 33
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1297
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1289
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1286
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1283
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
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
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1280
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1274
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $1271
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1268
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1263
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $1260
byte 1 33
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1257
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1254
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1249
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $1245
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1242
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1237
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1235
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1223
byte 1 94
byte 1 51
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1218
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1215
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 45
byte 1 114
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1204
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1203
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1202
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $1201
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $1198
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
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
byte 1 97
byte 1 114
byte 1 103
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1189
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1177
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1169
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1140
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1139
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1136
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1118
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1105
byte 1 32
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $1101
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1099
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1098
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $1092
byte 1 32
byte 1 40
byte 1 78
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 41
byte 1 0
align 1
LABELV $1086
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 44
byte 1 32
byte 1 99
byte 1 116
byte 1 109
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 44
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 112
byte 1 111
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 10
byte 1 0
align 1
LABELV $1083
byte 1 83
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $1078
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 73
byte 1 116
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
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1074
byte 1 99
byte 1 116
byte 1 109
byte 1 0
align 1
LABELV $1071
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1068
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
LABELV $1067
byte 1 83
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $1064
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1061
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1058
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 73
byte 1 116
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
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1054
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1053
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1049
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1043
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1036
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
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
byte 1 105
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1032
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 104
byte 1 97
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
byte 1 98
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1028
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1023
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1022
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1019
byte 1 91
byte 1 80
byte 1 111
byte 1 108
byte 1 108
byte 1 93
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $1014
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 112
byte 1 101
byte 1 111
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1011
byte 1 112
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1006
byte 1 69
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $1003
byte 1 101
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1000
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $995
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $992
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $989
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 39
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
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $986
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $982
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
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
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $978
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $973
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $970
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $967
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 39
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
byte 1 39
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
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $966
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
align 1
LABELV $962
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $949
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $946
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $942
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $931
byte 1 85
byte 1 110
byte 1 45
byte 1 77
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $928
byte 1 33
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $925
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $920
byte 1 77
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $917
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $914
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $911
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
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
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $906
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 117
byte 1 109
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $903
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $901
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $900
byte 1 87
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $896
byte 1 73
byte 1 77
byte 1 77
byte 1 85
byte 1 78
byte 1 73
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $889
byte 1 94
byte 1 51
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $884
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $881
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 45
byte 1 114
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $880
byte 1 85
byte 1 78
byte 1 65
byte 1 67
byte 1 67
byte 1 79
byte 1 85
byte 1 78
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $870
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $869
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $866
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
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
byte 1 97
byte 1 114
byte 1 103
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $857
byte 1 32
byte 1 45
byte 1 0
align 1
LABELV $854
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $852
byte 1 109
byte 1 0
align 1
LABELV $848
byte 1 114
byte 1 0
align 1
LABELV $847
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $840
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $836
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $830
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $825
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $820
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $817
byte 1 78
byte 1 79
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $811
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 47
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 45
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $805
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $801
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
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 44
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $799
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $796
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 117
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $795
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $785
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $770
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $769
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $765
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $764
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $755
byte 1 109
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 0
align 1
LABELV $749
byte 1 109
byte 1 101
byte 1 32
byte 1 0
align 1
LABELV $743
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 109
byte 1 101
byte 1 32
byte 1 0
align 1
LABELV $737
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 109
byte 1 101
byte 1 32
byte 1 0
align 1
LABELV $734
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $733
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 112
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $722
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $721
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $720
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 97
byte 1 32
byte 1 0
align 1
LABELV $719
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 97
byte 1 32
byte 1 0
align 1
LABELV $713
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 109
byte 1 116
byte 1 32
byte 1 0
align 1
LABELV $712
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 109
byte 1 116
byte 1 32
byte 1 0
align 1
LABELV $711
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 47
byte 1 109
byte 1 32
byte 1 0
align 1
LABELV $710
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 47
byte 1 109
byte 1 32
byte 1 0
align 1
LABELV $706
byte 1 97
byte 1 32
byte 1 0
align 1
LABELV $705
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $702
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 0
align 1
LABELV $678
byte 1 25
byte 1 60
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 62
byte 1 32
byte 1 0
align 1
LABELV $677
byte 1 115
byte 1 97
byte 1 121
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $635
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $634
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $629
byte 1 37
byte 1 115
byte 1 91
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 93
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $628
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 91
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 93
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $624
byte 1 37
byte 1 115
byte 1 91
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 93
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $620
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $619
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 91
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 93
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 25
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 25
byte 1 32
byte 1 0
align 1
LABELV $612
byte 1 25
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 32
byte 1 0
align 1
LABELV $609
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $606
byte 1 94
byte 1 50
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 32
byte 1 0
align 1
LABELV $605
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $603
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $602
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $596
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $595
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $592
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $590
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $589
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $585
byte 1 91
byte 1 72
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $583
byte 1 91
byte 1 65
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $581
byte 1 91
byte 1 83
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $573
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 45
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $555
byte 1 0
align 1
LABELV $554
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 93
byte 1 0
align 1
LABELV $552
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $551
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $550
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $547
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $542
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
LABELV $525
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $524
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $523
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $522
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $517
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $516
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 98
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $511
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $510
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 98
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $505
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 79
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 47
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $503
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $498
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $490
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $475
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $466
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 94
byte 1 49
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 68
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $459
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $450
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 94
byte 1 49
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 68
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $446
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $442
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $438
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $430
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $426
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $423
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $413
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 117
byte 1 112
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $396
byte 1 70
byte 1 79
byte 1 82
byte 1 67
byte 1 69
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 0
align 1
LABELV $393
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $390
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $387
byte 1 68
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $374
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $357
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $356
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $321
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $316
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $310
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 76
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 104
byte 1 111
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $304
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $299
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $298
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $291
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $290
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $283
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $282
byte 1 71
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $281
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $264
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $260
byte 1 115
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $253
byte 1 102
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $246
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $243
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $222
byte 1 78
byte 1 79
byte 1 67
byte 1 69
byte 1 78
byte 1 83
byte 1 79
byte 1 82
byte 1 70
byte 1 76
byte 1 79
byte 1 79
byte 1 68
byte 1 0
align 1
LABELV $198
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $193
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $132
byte 1 37
byte 1 50
byte 1 105
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $125
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 46
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 35
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $122
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 35
byte 1 0
