code
proc StringToFilter 168 8
file "..\..\..\..\src/game/g_svcmds.c"
line 80
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
;24:// this file holds commands that can be executed by the server console, but not remote clients
;25:
;26:#include "g_local.h"
;27:
;28:
;29:/*
;30:==============================================================================
;31:
;32:PACKET FILTERING
;33:
;34:
;35:You can add or remove addresses from the filter list with:
;36:
;37:addip <ip>
;38:removeip <ip>
;39:
;40:The ip address is specified in dot format, and you can use '*' to match any value
;41:so you can specify an entire class C network with "addip 192.246.40.*"
;42:
;43:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;44:
;45:listip
;46:Prints the current list of filters.
;47:
;48:g_filterban <0 or 1>
;49:
;50:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;51:
;52:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;53:
;54:TTimo NOTE: for persistence, bans are stored in g_banIPs cvar MAX_CVAR_VALUE_STRING
;55:The size of the cvar string buffer is limiting the banning to around 20 masks
;56:this could be improved by putting some g_banIPs2 g_banIps3 etc. maybe
;57:still, you should rely on PB for banning instead
;58:
;59:==============================================================================
;60: */
;61:
;62:// extern vmCvar_t  g_banIPs;
;63:// extern vmCvar_t  g_filterBan;
;64:
;65:typedef struct ipFilter_s {
;66:  unsigned mask;
;67:  unsigned compare;
;68:} ipFilter_t;
;69:
;70:#define MAX_IPFILTERS 1024
;71:
;72:static ipFilter_t ipFilters[ MAX_IPFILTERS ];
;73:static int numIPFilters;
;74:
;75:/*
;76:=================
;77:StringToFilter
;78:=================
;79: */
;80:static qboolean StringToFilter(char *s, ipFilter_t *f) {
line 86
;81:  char num[ 128 ];
;82:  int i, j;
;83:  byte b[ 4 ];
;84:  byte m[ 4 ];
;85:
;86:  for (i = 0; i < 4; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $85
line 87
;87:    b[ i ] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 88
;88:    m[ i ] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 89
;89:  }
LABELV $86
line 86
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $85
line 91
;90:
;91:  for (i = 0; i < 4; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $89
line 92
;92:    if (*s < '0' || *s > '9') {
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $95
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $93
LABELV $95
line 93
;93:      if (*s == '*') // 'match any'
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $96
line 94
;94:      {
line 96
;95:        //b[ i ] and m[ i ] to 0
;96:        s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 97
;97:        if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $98
line 98
;98:          break;
ADDRGP4 $91
JUMPV
LABELV $98
line 100
;99:
;100:        s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 101
;101:        continue;
ADDRGP4 $90
JUMPV
LABELV $96
line 104
;102:      }
;103:
;104:      G_Printf("Bad filter address: %s\n", s);
ADDRGP4 $100
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 105
;105:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $84
JUMPV
LABELV $93
line 108
;106:    }
;107:
;108:    j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $101
line 110
;109:    while (*s >= '0' && *s <= '9')
;110:      num[ j++ ] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
LABELV $102
line 109
ADDRLP4 160
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 48
LTI4 $104
ADDRLP4 160
INDIRI4
CNSTI4 57
LEI4 $101
LABELV $104
line 112
;111:
;112:    num[ j ] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 113
;113:    b[ i ] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 164
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 115
;114:
;115:    m[ i ] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
line 117
;116:
;117:    if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $105
line 118
;118:      break;
ADDRGP4 $91
JUMPV
LABELV $105
line 120
;119:
;120:    s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 121
;121:  }
LABELV $90
line 91
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $89
LABELV $91
line 123
;122:
;123:  f->mask = *(unsigned *) m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 124
;124:  f->compare = *(unsigned *) b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 126
;125:
;126:  return qtrue;
CNSTI4 1
RETI4
LABELV $84
endproc StringToFilter 168 8
proc UpdateIPBans 344 12
line 134
;127:}
;128:
;129:/*
;130:=================
;131:UpdateIPBans
;132:=================
;133: */
;134:static void UpdateIPBans(void) {
line 141
;135:  byte b[ 4 ];
;136:  byte m[ 4 ];
;137:  int i, j;
;138:  char iplist_final[ MAX_CVAR_VALUE_STRING ];
;139:  char ip[ 64 ];
;140:
;141:  *iplist_final = 0;
ADDRLP4 80
CNSTI1 0
ASGNI1
line 143
;142:
;143:  for (i = 0; i < numIPFilters; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 144
;144:    if (ipFilters[ i ].compare == 0xffffffff)
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $112
line 145
;145:      continue;
ADDRGP4 $109
JUMPV
LABELV $112
line 147
;146:
;147:    *(unsigned *) b = ipFilters[ i ].compare;
ADDRLP4 72
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 148
;148:    *(unsigned *) m = ipFilters[ i ].mask;
ADDRLP4 68
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ASGNU4
line 149
;149:    *ip = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 151
;150:
;151:    for (j = 0; j < 4; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $116
line 152
;152:      if (m[ j ] != 255)
ADDRLP4 0
INDIRI4
ADDRLP4 68
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
EQI4 $120
line 153
;153:        Q_strcat(ip, sizeof ( ip), "*");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $122
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $121
JUMPV
LABELV $120
line 155
;154:      else
;155:        Q_strcat(ip, sizeof ( ip), va("%i", b[ j ]));
ADDRGP4 $123
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 72
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $121
line 157
;156:
;157:      Q_strcat(ip, sizeof ( ip), (j < 3) ? "." : " ");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $127
ADDRLP4 340
ADDRGP4 $124
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $127
ADDRLP4 340
ADDRGP4 $125
ASGNP4
LABELV $128
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 158
;158:    }
LABELV $117
line 151
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $116
line 160
;159:
;160:    if (strlen(iplist_final) + strlen(ip) < MAX_CVAR_VALUE_STRING)
ADDRLP4 80
ARGP4
ADDRLP4 336
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 340
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
ADDRLP4 340
INDIRI4
ADDI4
CNSTI4 256
GEI4 $129
line 161
;161:      Q_strcat(iplist_final, sizeof ( iplist_final), ip);
ADDRLP4 80
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $130
JUMPV
LABELV $129
line 162
;162:    else {
line 163
;163:      Com_Printf("g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n");
ADDRGP4 $131
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 164
;164:      break;
ADDRGP4 $110
JUMPV
LABELV $130
line 166
;165:    }
;166:  }
LABELV $109
line 143
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $111
ADDRLP4 76
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $108
LABELV $110
line 168
;167:
;168:  trap_Cvar_Set("g_banIPs", iplist_final);
ADDRGP4 $132
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 169
;169:}
LABELV $107
endproc UpdateIPBans 344 12
export G_FilterPacket
proc G_FilterPacket 28 0
line 176
;170:
;171:/*
;172:=================
;173:G_FilterPacket
;174:=================
;175: */
;176:qboolean G_FilterPacket(char *from) {
line 182
;177:  int i;
;178:  unsigned in;
;179:  byte m[ 4 ];
;180:  char *p;
;181:
;182:  i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 183
;183:  p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $135
JUMPV
LABELV $134
line 184
;184:  while (*p && i < 4) {
line 185
;185:    m[ i ] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $138
JUMPV
LABELV $137
line 186
;186:    while (*p >= '0' && *p <= '9') {
line 187
;187:      m[ i ] = m[ i ] * 10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 188
;188:      p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 189
;189:    }
LABELV $138
line 186
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $140
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $137
LABELV $140
line 191
;190:
;191:    if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $143
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $141
LABELV $143
line 192
;192:      break;
ADDRGP4 $136
JUMPV
LABELV $141
line 194
;193:
;194:    i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 195
;195:  }
LABELV $135
line 184
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $144
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $134
LABELV $144
LABELV $136
line 197
;196:
;197:  in = *(unsigned *) m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 199
;198:
;199:  for (i = 0; i < numIPFilters; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 200
;200:    if ((in & ipFilters[ i ].mask) == ipFilters[ i ].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $149
line 201
;201:      return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $155
JUMPV
LABELV $154
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $155
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $149
LABELV $146
line 199
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $145
line 203
;202:
;203:  return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $158
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $158
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $159
ADDRLP4 24
INDIRI4
RETI4
LABELV $133
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 211
;204:}
;205:
;206:/*
;207:=================
;208:AddIP
;209:=================
;210: */
;211:static void AddIP(char *str) {
line 214
;212:  int i;
;213:
;214:  for (i = 0; i < numIPFilters; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $161
line 215
;215:    if (ipFilters[ i ].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $165
line 216
;216:      break; // free spot
ADDRGP4 $163
JUMPV
LABELV $165
LABELV $162
line 214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $161
LABELV $163
line 218
;217:
;218:  if (i == numIPFilters) {
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $168
line 219
;219:    if (numIPFilters == MAX_IPFILTERS) {
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $170
line 220
;220:      G_Printf("IP filter list is full\n");
ADDRGP4 $172
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 221
;221:      return;
ADDRGP4 $160
JUMPV
LABELV $170
line 224
;222:    }
;223:
;224:    numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 225
;225:  }
LABELV $168
line 227
;226:
;227:  if (!StringToFilter(str, &ipFilters[ i ]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $173
line 228
;228:    ipFilters[ i ].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $173
line 230
;229:
;230:  UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 231
;231:}
LABELV $160
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 276 12
line 238
;232:
;233:/*
;234:=================
;235:G_ProcessIPBans
;236:=================
;237: */
;238:void G_ProcessIPBans(void) {
line 242
;239:  char *s, *t;
;240:  char str[ MAX_CVAR_VALUE_STRING ];
;241:
;242:  Q_strncpyz(str, g_banIPs.string, sizeof ( str));
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 244
;243:
;244:  for (t = s = g_banIPs.string; *t; /* */) {
ADDRLP4 264
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 264
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
ADDRGP4 $181
JUMPV
LABELV $178
line 245
;245:    s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 268
INDIRP4
ASGNP4
line 247
;246:
;247:    if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 248
;248:      break;
ADDRGP4 $180
JUMPV
LABELV $185
line 251
;249:
;250:    while (*s == ' ')
;251:      *s++ = 0;
ADDRLP4 272
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI1 0
ASGNI1
LABELV $186
line 250
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $185
line 253
;252:
;253:    if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $188
line 254
;254:      AddIP(t);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $188
line 256
;255:
;256:    t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 257
;257:  }
LABELV $179
line 244
LABELV $181
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $178
LABELV $180
line 258
;258:}
LABELV $176
endproc G_ProcessIPBans 276 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 265
;259:
;260:/*
;261:=================
;262:Svcmd_AddIP_f
;263:=================
;264: */
;265:void Svcmd_AddIP_f(void) {
line 268
;266:  char str[ MAX_TOKEN_CHARS ];
;267:
;268:  if (trap_Argc() < 2) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $191
line 269
;269:    G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $193
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:    return;
ADDRGP4 $190
JUMPV
LABELV $191
line 273
;271:  }
;272:
;273:  trap_Argv(1, str, sizeof ( str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 275
;274:
;275:  AddIP(str);
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 276
;276:}
LABELV $190
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 283
;277:
;278:/*
;279:=================
;280:Svcmd_RemoveIP_f
;281:=================
;282: */
;283:void Svcmd_RemoveIP_f(void) {
line 288
;284:  ipFilter_t f;
;285:  int i;
;286:  char str[ MAX_TOKEN_CHARS ];
;287:
;288:  if (trap_Argc() < 2) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $195
line 289
;289:    G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $197
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 290
;290:    return;
ADDRGP4 $194
JUMPV
LABELV $195
line 293
;291:  }
;292:
;293:  trap_Argv(1, str, sizeof ( str));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 295
;294:
;295:  if (!StringToFilter(str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $198
line 296
;296:    return;
ADDRGP4 $194
JUMPV
LABELV $198
line 298
;297:
;298:  for (i = 0; i < numIPFilters; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $200
line 299
;299:    if (ipFilters[ i ].mask == f.mask &&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $204
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $204
line 300
;300:            ipFilters[ i ].compare == f.compare) {
line 301
;301:      ipFilters[ i ].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 302
;302:      G_Printf("Removed.\n");
ADDRGP4 $209
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 304
;303:
;304:      UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 305
;305:      return;
ADDRGP4 $194
JUMPV
LABELV $204
line 307
;306:    }
;307:  }
LABELV $201
line 298
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $203
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $200
line 309
;308:
;309:  G_Printf("Didn't find %s.\n", str);
ADDRGP4 $210
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 310
;310:}
LABELV $194
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 317
;311:
;312:/*
;313:===================
;314:Svcmd_EntityList_f
;315:===================
;316: */
;317:void Svcmd_EntityList_f(void) {
line 321
;318:  int e;
;319:  gentity_t *check;
;320:
;321:  check = g_entities;
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 323
;322:
;323:  for (e = 0; e < level.num_entities; e++, check++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 324
;324:    if (!check->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
line 325
;325:      continue;
ADDRGP4 $213
JUMPV
LABELV $217
line 327
;326:
;327:    G_Printf("%3i:", e);
ADDRGP4 $219
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 329
;328:
;329:    switch (check->s.eType) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $220
ADDRLP4 8
INDIRI4
CNSTI4 12
GTI4 $220
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $250
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $250
address $223
address $225
address $227
address $229
address $231
address $233
address $235
address $237
address $239
address $241
address $243
address $245
address $247
code
LABELV $223
line 331
;330:      case ET_GENERAL:
;331:        G_Printf("ET_GENERAL          ");
ADDRGP4 $224
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 332
;332:        break;
ADDRGP4 $221
JUMPV
LABELV $225
line 334
;333:      case ET_PLAYER:
;334:        G_Printf("ET_PLAYER           ");
ADDRGP4 $226
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 335
;335:        break;
ADDRGP4 $221
JUMPV
LABELV $227
line 337
;336:      case ET_ITEM:
;337:        G_Printf("ET_ITEM             ");
ADDRGP4 $228
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 338
;338:        break;
ADDRGP4 $221
JUMPV
LABELV $229
line 340
;339:      case ET_BUILDABLE:
;340:        G_Printf("ET_BUILDABLE        ");
ADDRGP4 $230
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 341
;341:        break;
ADDRGP4 $221
JUMPV
LABELV $231
line 343
;342:      case ET_MISSILE:
;343:        G_Printf("ET_MISSILE          ");
ADDRGP4 $232
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 344
;344:        break;
ADDRGP4 $221
JUMPV
LABELV $233
line 346
;345:      case ET_MOVER:
;346:        G_Printf("ET_MOVER            ");
ADDRGP4 $234
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 347
;347:        break;
ADDRGP4 $221
JUMPV
LABELV $235
line 349
;348:      case ET_BEAM:
;349:        G_Printf("ET_BEAM             ");
ADDRGP4 $236
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 350
;350:        break;
ADDRGP4 $221
JUMPV
LABELV $237
line 352
;351:      case ET_PORTAL:
;352:        G_Printf("ET_PORTAL           ");
ADDRGP4 $238
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 353
;353:        break;
ADDRGP4 $221
JUMPV
LABELV $239
line 355
;354:      case ET_SPEAKER:
;355:        G_Printf("ET_SPEAKER          ");
ADDRGP4 $240
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 356
;356:        break;
ADDRGP4 $221
JUMPV
LABELV $241
line 358
;357:      case ET_PUSH_TRIGGER:
;358:        G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $242
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 359
;359:        break;
ADDRGP4 $221
JUMPV
LABELV $243
line 361
;360:      case ET_TELEPORT_TRIGGER:
;361:        G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $244
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 362
;362:        break;
ADDRGP4 $221
JUMPV
LABELV $245
line 364
;363:      case ET_INVISIBLE:
;364:        G_Printf("ET_INVISIBLE        ");
ADDRGP4 $246
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 365
;365:        break;
ADDRGP4 $221
JUMPV
LABELV $247
line 367
;366:      case ET_GRAPPLE:
;367:        G_Printf("ET_GRAPPLE          ");
ADDRGP4 $248
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 368
;368:        break;
ADDRGP4 $221
JUMPV
LABELV $220
line 370
;369:      default:
;370:        G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $249
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 371
;371:        break;
LABELV $221
line 374
;372:    }
;373:
;374:    if (check->classname)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 375
;375:      G_Printf("%s", check->classname);
ADDRGP4 $253
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $251
line 377
;376:
;377:    G_Printf("\n");
ADDRGP4 $254
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 378
;378:  }
LABELV $213
line 323
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
LABELV $215
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $212
line 379
;379:}
LABELV $211
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 381
;380:
;381:gclient_t *ClientForString(const char *s) {
line 387
;382:  gclient_t *cl;
;383:  int i;
;384:  int idnum;
;385:
;386:  // numeric values are just slot numbers
;387:  if (s[ 0 ] >= '0' && s[ 0 ] <= '9') {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $256
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $256
line 388
;388:    idnum = atoi(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 390
;389:
;390:    if (idnum < 0 || idnum >= level.maxclients) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $261
ADDRLP4 20
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $258
LABELV $261
line 391
;391:      Com_Printf("Bad client slot: %i\n", idnum);
ADDRGP4 $262
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 392
;392:      return NULL;
CNSTP4 0
RETP4
ADDRGP4 $255
JUMPV
LABELV $258
line 395
;393:    }
;394:
;395:    cl = &level.clients[ idnum ];
ADDRLP4 0
CNSTI4 2148
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 397
;396:
;397:    if (cl->pers.connected == CON_DISCONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $263
line 398
;398:      G_Printf("Client %i is not connected\n", idnum);
ADDRGP4 $265
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 399
;399:      return NULL;
CNSTP4 0
RETP4
ADDRGP4 $255
JUMPV
LABELV $263
line 402
;400:    }
;401:
;402:    return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $255
JUMPV
LABELV $256
line 406
;403:  }
;404:
;405:  // check for a name match
;406:  for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $266
line 407
;407:    cl = &level.clients[ i ];
ADDRLP4 0
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 408
;408:    if (cl->pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $271
line 409
;409:      continue;
ADDRGP4 $267
JUMPV
LABELV $271
line 411
;410:
;411:    if (!Q_stricmp(cl->pers.netname, s))
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $273
line 412
;412:      return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $255
JUMPV
LABELV $273
line 413
;413:  }
LABELV $267
line 406
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $269
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $266
line 415
;414:
;415:  G_Printf("User %s is not on the server\n", s);
ADDRGP4 $275
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 417
;416:
;417:  return NULL;
CNSTP4 0
RETP4
LABELV $255
endproc ClientForString 24 8
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 427
;418:}
;419:
;420:/*
;421:===================
;422:Svcmd_ForceTeam_f
;423:
;424:forceteam <player> <team>
;425:===================
;426: */
;427:void Svcmd_ForceTeam_f(void) {
line 432
;428:  gclient_t *cl;
;429:  char str[ MAX_TOKEN_CHARS ];
;430:
;431:  // find the player
;432:  trap_Argv(1, str, sizeof ( str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 433
;433:  cl = ClientForString(str);
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 435
;434:
;435:  if (!cl)
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 436
;436:    return;
ADDRGP4 $276
JUMPV
LABELV $277
line 439
;437:
;438:  // set the team
;439:  trap_Argv(2, str, sizeof ( str));
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 442
;440:  /*SetTeam( &g_entities[cl - level.clients], str );*/
;441:  //FIXME: tremulise this
;442:}
LABELV $276
endproc Svcmd_ForceTeam_f 1032 12
export Svcmd_LayoutSave_f
proc Svcmd_LayoutSave_f 156 12
line 451
;443:
;444:/*
;445:===================
;446:Svcmd_LayoutSave_f
;447:
;448:layoutsave <name>
;449:===================
;450: */
;451:void Svcmd_LayoutSave_f(void) {
line 455
;452:  char str[ MAX_QPATH ];
;453:  char str2[ MAX_QPATH - 4 ];
;454:  char *s;
;455:  int i = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 457
;456:
;457:  if (trap_Argc() != 2) {
ADDRLP4 132
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $280
line 458
;458:    G_Printf("usage: layoutsave LAYOUTNAME\n");
ADDRGP4 $282
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 459
;459:    return;
ADDRGP4 $279
JUMPV
LABELV $280
line 461
;460:  }
;461:  trap_Argv(1, str, sizeof ( str));
CNSTI4 1
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 464
;462:
;463:  // sanitize name
;464:  s = &str[ 0 ];
ADDRLP4 0
ADDRLP4 68
ASGNP4
ADDRGP4 $284
JUMPV
LABELV $283
line 465
;465:  while (*s && i < sizeof ( str2) - 1) {
line 466
;466:    if ((*s >= '0' && *s <= '9') ||
ADDRLP4 136
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 48
LTI4 $289
ADDRLP4 136
INDIRI4
CNSTI4 57
LEI4 $294
LABELV $289
ADDRLP4 140
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 97
LTI4 $291
ADDRLP4 140
INDIRI4
CNSTI4 122
LEI4 $294
LABELV $291
ADDRLP4 144
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 65
LTI4 $293
ADDRLP4 144
INDIRI4
CNSTI4 90
LEI4 $294
LABELV $293
ADDRLP4 148
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 45
EQI4 $294
ADDRLP4 148
INDIRI4
CNSTI4 95
NEI4 $286
LABELV $294
line 468
;467:            (*s >= 'a' && *s <= 'z') ||
;468:            (*s >= 'A' && *s <= 'Z') || *s == '-' || *s == '_') {
line 469
;469:      str2[ i++ ] = *s;
ADDRLP4 152
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 470
;470:      str2[ i ] = '\0';
ADDRLP4 64
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 471
;471:    }
LABELV $286
line 472
;472:    s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 473
;473:  }
LABELV $284
line 465
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $295
ADDRLP4 64
INDIRI4
CVIU4 4
CNSTU4 59
LTU4 $283
LABELV $295
line 475
;474:
;475:  if (!str2[ 0 ]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $296
line 476
;476:    G_Printf("layoutsave: invalid name \"%s\"\n", str);
ADDRGP4 $298
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 477
;477:    return;
ADDRGP4 $279
JUMPV
LABELV $296
line 480
;478:  }
;479:
;480:  G_LayoutSave(str2);
ADDRLP4 4
ARGP4
ADDRGP4 G_LayoutSave
CALLV
pop
line 481
;481:}
LABELV $279
endproc Svcmd_LayoutSave_f 156 12
export Svcmd_LayoutLoad_f
proc Svcmd_LayoutLoad_f 264 12
line 496
;482:
;483:char *ConcatArgs(int start);
;484:
;485:/*
;486:===================
;487:Svcmd_LayoutLoad_f
;488:
;489:layoutload [<name> [<name2> [<name3 [...]]]]
;490:
;491:This is just a silly alias for doing:
;492: set g_layouts "name name2 name3"
;493: map_restart
;494:===================
;495: */
;496:void Svcmd_LayoutLoad_f(void) {
line 500
;497:  char layouts[ MAX_CVAR_VALUE_STRING ];
;498:  char *s;
;499:
;500:  s = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 260
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 260
INDIRP4
ASGNP4
line 501
;501:  Q_strncpyz(layouts, s, sizeof ( layouts));
ADDRLP4 0
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 502
;502:  trap_Cvar_Set("g_layouts", layouts);
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 503
;503:  trap_SendConsoleCommand(EXEC_APPEND, "map_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $301
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 504
;504:  level.restarted = qtrue;
ADDRGP4 level+173936
CNSTI4 1
ASGNI4
line 505
;505:}
LABELV $299
endproc Svcmd_LayoutLoad_f 264 12
proc Svcmd_AdmitDefeat_f 16 12
line 507
;506:
;507:static void Svcmd_AdmitDefeat_f(void) {
line 511
;508:  int team;
;509:  char teamNum[ 2 ];
;510:
;511:  if (trap_Argc() != 2) {
ADDRLP4 8
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $304
line 512
;512:    G_Printf("admitdefeat: must provide a team\n");
ADDRGP4 $306
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 513
;513:    return;
ADDRGP4 $303
JUMPV
LABELV $304
line 515
;514:  }
;515:  trap_Argv(1, teamNum, sizeof ( teamNum));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 516
;516:  team = atoi(teamNum);
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 517
;517:  if (team == PTE_ALIENS || teamNum[ 0 ] == 'a') {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $309
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $307
LABELV $309
line 518
;518:    level.surrenderTeam = PTE_ALIENS;
ADDRGP4 level+189968
CNSTI4 1
ASGNI4
line 519
;519:    G_BaseSelfDestruct(PTE_ALIENS);
CNSTI4 1
ARGI4
ADDRGP4 G_BaseSelfDestruct
CALLV
pop
line 520
;520:    G_TeamCommand(PTE_ALIENS, "cp \"Hivemind Link Broken\" 1");
CNSTI4 1
ARGI4
ADDRGP4 $311
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 521
;521:    trap_SendServerCommand(-1, "print \"Alien team has admitted defeat\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 522
;522:  } else if (team == PTE_HUMANS || teamNum[ 0 ] == 'h') {
ADDRGP4 $308
JUMPV
LABELV $307
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $315
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 104
NEI4 $313
LABELV $315
line 523
;523:    level.surrenderTeam = PTE_HUMANS;
ADDRGP4 level+189968
CNSTI4 2
ASGNI4
line 524
;524:    G_BaseSelfDestruct(PTE_HUMANS);
CNSTI4 2
ARGI4
ADDRGP4 G_BaseSelfDestruct
CALLV
pop
line 525
;525:    G_TeamCommand(PTE_HUMANS, "cp \"Life Support Terminated\" 1");
CNSTI4 2
ARGI4
ADDRGP4 $317
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 526
;526:    trap_SendServerCommand(-1, "print \"Human team has admitted defeat\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $318
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 527
;527:  } else {
ADDRGP4 $314
JUMPV
LABELV $313
line 528
;528:    G_Printf("admitdefeat: invalid team\n");
ADDRGP4 $319
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 529
;529:  }
LABELV $314
LABELV $308
line 530
;530:}
LABELV $303
endproc Svcmd_AdmitDefeat_f 16 12
export ConsoleCommand
proc ConsoleCommand 1120 32
line 538
;531:
;532:/*
;533:=================
;534:ConsoleCommand
;535:
;536:=================
;537: */
;538:qboolean ConsoleCommand(void) {
line 541
;539:  char cmd[ MAX_TOKEN_CHARS ];
;540:
;541:  trap_Argv(0, cmd, sizeof ( cmd));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 543
;542:
;543:  if (Q_stricmp(cmd, "entitylist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $321
line 544
;544:    Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 545
;545:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $321
line 548
;546:  }
;547:
;548:  if (Q_stricmp(cmd, "forceteam") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $324
line 549
;549:    Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 550
;550:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $324
line 553
;551:  }
;552:
;553:  if (Q_stricmp(cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $327
line 554
;554:    Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 555
;555:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $327
line 558
;556:  }
;557:
;558:  if (Q_stricmp(cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $332
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $330
line 559
;559:    Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 560
;560:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $330
line 563
;561:  }
;562:
;563:  if (Q_stricmp(cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $335
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $333
line 564
;564:    Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 565
;565:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $333
line 568
;566:  }
;567:
;568:  if (Q_stricmp(cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $336
line 569
;569:    trap_SendConsoleCommand(EXEC_NOW, "g_banIPs\n");
CNSTI4 0
ARGI4
ADDRGP4 $339
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 570
;570:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $336
line 573
;571:  }
;572:
;573:  if (Q_stricmp(cmd, "mapRotation") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $340
line 574
;574:    char *rotationName = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 1052
ADDRLP4 1056
INDIRP4
ASGNP4
line 576
;575:
;576:    if (!G_StartMapRotation(rotationName, qfalse))
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1060
ADDRGP4 G_StartMapRotation
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $343
line 577
;577:      G_Printf("Can't find map rotation %s\n", rotationName);
ADDRGP4 $345
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $343
line 579
;578:
;579:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $340
line 582
;580:  }
;581:
;582:  if (Q_stricmp(cmd, "stopMapRotation") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $346
line 583
;583:    G_StopMapRotation();
ADDRGP4 G_StopMapRotation
CALLV
pop
line 585
;584:
;585:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $346
line 588
;586:  }
;587:
;588:  if (Q_stricmp(cmd, "advanceMapRotation") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $349
line 589
;589:    G_AdvanceMapRotation();
ADDRGP4 G_AdvanceMapRotation
CALLI4
pop
line 591
;590:
;591:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $349
line 594
;592:  }
;593:
;594:  if (Q_stricmp(cmd, "alienWin") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $352
line 598
;595:    int i;
;596:    gentity_t *e;
;597:
;598:    for (i = 1, e = g_entities + i; i < level.num_entities; i++, e++) {
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRLP4 1064
CNSTI4 2476
ADDRLP4 1068
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $358
JUMPV
LABELV $355
line 599
;599:      if (e->s.modelindex == BA_H_SPAWN)
ADDRLP4 1064
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
NEI4 $360
line 600
;600:        G_Damage(e, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1072
CNSTP4 0
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
CNSTP4 0
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1076
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
LABELV $360
line 601
;601:    }
LABELV $356
line 598
ADDRLP4 1068
ADDRLP4 1068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1064
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $358
ADDRLP4 1068
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $355
line 603
;602:
;603:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $352
line 606
;604:  }
;605:
;606:  if (Q_stricmp(cmd, "humanWin") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $362
line 610
;607:    int i;
;608:    gentity_t *e;
;609:
;610:    for (i = 1, e = g_entities + i; i < level.num_entities; i++, e++) {
ADDRLP4 1072
CNSTI4 1
ASGNI4
ADDRLP4 1068
CNSTI4 2476
ADDRLP4 1072
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $365
line 611
;611:      if (e->s.modelindex == BA_A_SPAWN)
ADDRLP4 1068
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $370
line 612
;612:        G_Damage(e, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1076
CNSTP4 0
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
CNSTP4 0
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1080
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
LABELV $370
line 613
;613:    }
LABELV $366
line 610
ADDRLP4 1072
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1068
ADDRLP4 1068
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $368
ADDRLP4 1072
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $365
line 615
;614:
;615:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $362
line 618
;616:  }
;617:
;618:  if (!Q_stricmp(cmd, "layoutsave")) {
ADDRLP4 0
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $372
line 619
;619:    Svcmd_LayoutSave_f();
ADDRGP4 Svcmd_LayoutSave_f
CALLV
pop
line 620
;620:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $372
line 623
;621:  }
;622:
;623:  if (!Q_stricmp(cmd, "layoutload")) {
ADDRLP4 0
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $375
line 624
;624:    Svcmd_LayoutLoad_f();
ADDRGP4 Svcmd_LayoutLoad_f
CALLV
pop
line 625
;625:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $375
line 628
;626:  }
;627:
;628:  if (!Q_stricmp(cmd, "admitdefeat")) {
ADDRLP4 0
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $378
line 629
;629:    Svcmd_AdmitDefeat_f();
ADDRGP4 Svcmd_AdmitDefeat_f
CALLV
pop
line 630
;630:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $378
line 633
;631:  }
;632:
;633:  if (!Q_stricmp(cmd, "evacuation")) {
ADDRLP4 0
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $381
line 634
;634:    trap_SendServerCommand(-1, "print \"Evacuation ordered\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $384
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 635
;635:    level.lastWin = PTE_NONE;
ADDRGP4 level+189264
CNSTI4 0
ASGNI4
line 636
;636:    trap_SetConfigstring(CS_WINNER, "Evacuation");
CNSTI4 27
ARGI4
ADDRGP4 $386
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 637
;637:    LogExit("Evacuation.");
ADDRGP4 $387
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 638
;638:    G_admin_maplog_result("d");
ADDRGP4 $388
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 639
;639:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $381
line 643
;640:  }
;641:
;642:  // see if this is a a admin command
;643:  if (G_admin_cmd_check(NULL, qfalse))
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $389
line 644
;644:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $389
line 646
;645:
;646:  if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $391
line 647
;647:    if (Q_stricmp(cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $394
line 648
;648:      trap_SendServerCommand(-1, va("print \"server: %s\n\"", ConcatArgs(1)));
CNSTI4 1
ARGI4
ADDRLP4 1092
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $397
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 649
;649:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $394
line 650
;650:    } else if (!Q_stricmp(cmd, "chat")) {
ADDRLP4 0
ARGP4
ADDRGP4 $400
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $398
line 651
;651:      trap_SendServerCommand(-1, va("chat \"%s\" -1 0", ConcatArgs(1)));
CNSTI4 1
ARGI4
ADDRLP4 1096
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $401
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 652
;652:      G_Printf("chat: %s\n", ConcatArgs(1));
CNSTI4 1
ARGI4
ADDRLP4 1104
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $402
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 653
;653:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $398
line 654
;654:    } else if (!Q_stricmp(cmd, "cp")) {
ADDRLP4 0
ARGP4
ADDRGP4 $405
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $403
line 655
;655:      G_CP(NULL);
CNSTP4 0
ARGP4
ADDRGP4 G_CP
CALLV
pop
line 656
;656:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $403
line 657
;657:    } else if (!Q_stricmp(cmd, "m")) {
ADDRLP4 0
ARGP4
ADDRGP4 $408
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $406
line 658
;658:      G_PrivateMessage(NULL);
CNSTP4 0
ARGP4
ADDRGP4 G_PrivateMessage
CALLV
pop
line 659
;659:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $406
line 660
;660:    } else if (!Q_stricmp(cmd, "a") || !Q_stricmp(cmd, "say_admins")) {
ADDRLP4 0
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $413
ADDRLP4 0
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $409
LABELV $413
line 661
;661:      G_Say(NULL, NULL, SAY_ADMINS, ConcatArgs(1));
CNSTI4 1
ARGI4
ADDRLP4 1112
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 1116
CNSTP4 0
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 662
;662:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $409
line 665
;663:    }
;664:
;665:    G_Printf("unknown command: %s\n", cmd);
ADDRGP4 $414
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 666
;666:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $320
JUMPV
LABELV $391
line 669
;667:  }
;668:
;669:  return qfalse;
CNSTI4 0
RETI4
LABELV $320
endproc ConsoleCommand 1120 32
import ConcatArgs
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $414
byte 1 117
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $412
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
LABELV $411
byte 1 97
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 0
align 1
LABELV $405
byte 1 99
byte 1 112
byte 1 0
align 1
LABELV $402
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $401
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $400
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $397
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $388
byte 1 100
byte 1 0
align 1
LABELV $387
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $386
byte 1 69
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
LABELV $384
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $383
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
LABELV $380
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
LABELV $377
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $374
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $364
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $354
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $351
byte 1 97
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
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
LABELV $348
byte 1 115
byte 1 116
byte 1 111
byte 1 112
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
LABELV $345
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
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
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 109
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
LABELV $339
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $335
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $332
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $329
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $326
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $323
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $319
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $318
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
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
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
LABELV $317
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 76
byte 1 105
byte 1 102
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $312
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
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
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
LABELV $311
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 72
byte 1 105
byte 1 118
byte 1 101
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 76
byte 1 105
byte 1 110
byte 1 107
byte 1 32
byte 1 66
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 34
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $306
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
byte 1 58
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $301
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
byte 1 10
byte 1 0
align 1
LABELV $300
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
LABELV $298
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
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
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 76
byte 1 65
byte 1 89
byte 1 79
byte 1 85
byte 1 84
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $275
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
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
byte 1 0
align 1
LABELV $265
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $262
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $254
byte 1 10
byte 1 0
align 1
LABELV $253
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $248
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $246
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $244
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $242
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $240
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $238
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $236
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $234
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $232
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $230
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $228
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $226
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $224
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $219
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $210
byte 1 68
byte 1 105
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $209
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $193
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $172
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 95
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $125
byte 1 32
byte 1 0
align 1
LABELV $124
byte 1 46
byte 1 0
align 1
LABELV $123
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $122
byte 1 42
byte 1 0
align 1
LABELV $100
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
