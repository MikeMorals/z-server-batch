export UI_ParseInfos
code
proc UI_ParseInfos 2084 12
file "..\..\..\..\src/ui/ui_gameinfo.c"
line 47
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
;24://
;25:// gameinfo.c
;26://
;27:
;28:#include "ui_local.h"
;29:
;30:
;31://
;32:// arena and bot info
;33://
;34:
;35:
;36:int       ui_numBots;
;37:static char   *ui_botInfos[MAX_BOTS];
;38:
;39:static int    ui_numArenas;
;40:static char   *ui_arenaInfos[MAX_ARENAS];
;41:
;42:/*
;43:===============
;44:UI_ParseInfos
;45:===============
;46:*/
;47:int UI_ParseInfos( char *buf, int max, char *infos[] ) {
line 53
;48:  char  *token;
;49:  int   count;
;50:  char  key[MAX_TOKEN_CHARS];
;51:  char  info[MAX_INFO_STRING];
;52:
;53:  count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $110
line 55
;54:
;55:  while ( 1 ) {
line 56
;56:    token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 57
;57:    if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $113
line 58
;58:      break;
ADDRGP4 $112
JUMPV
LABELV $113
line 60
;59:    }
;60:    if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $115
line 61
;61:      Com_Printf( "Missing { in info file\n" );
ADDRGP4 $118
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 62
;62:      break;
ADDRGP4 $112
JUMPV
LABELV $115
line 65
;63:    }
;64:
;65:    if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $119
line 66
;66:      Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $121
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 67
;67:      break;
ADDRGP4 $112
JUMPV
LABELV $119
line 70
;68:    }
;69:
;70:    info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $123
JUMPV
LABELV $122
line 71
;71:    while ( 1 ) {
line 72
;72:      token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 73
;73:      if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $125
line 74
;74:        Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $127
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 75
;75:        break;
ADDRGP4 $124
JUMPV
LABELV $125
line 77
;76:      }
;77:      if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $128
line 78
;78:        break;
ADDRGP4 $124
JUMPV
LABELV $128
line 80
;79:      }
;80:      Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 82
;81:
;82:      token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 83
;83:      if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $131
line 84
;84:        strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 85
;85:      }
LABELV $131
line 86
;86:      Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 87
;87:    }
LABELV $123
line 71
ADDRGP4 $122
JUMPV
LABELV $124
line 89
;88:    //NOTE: extra space for arena number
;89:    infos[count] = UI_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $134
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $135
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 90
;90:    if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $136
line 91
;91:      strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 92
;92:      count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 93
;93:    }
LABELV $136
line 94
;94:  }
LABELV $111
line 55
ADDRGP4 $110
JUMPV
LABELV $112
line 95
;95:  return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $109
endproc UI_ParseInfos 2084 12
proc UI_LoadArenasFromFile 8216 16
line 103
;96:}
;97:
;98:/*
;99:===============
;100:UI_LoadArenasFromFile
;101:===============
;102:*/
;103:static void UI_LoadArenasFromFile( char *filename ) {
line 108
;104:  int       len;
;105:  fileHandle_t  f;
;106:  char      buf[MAX_ARENAS_TEXT];
;107:
;108:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 109
;109:  if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $139
line 110
;110:    trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $141
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 111
;111:    return;
ADDRGP4 $138
JUMPV
LABELV $139
line 113
;112:  }
;113:  if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $142
line 114
;114:    trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 115
;115:    trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 116
;116:    return;
ADDRGP4 $138
JUMPV
LABELV $142
line 119
;117:  }
;118:
;119:  trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 120
;120:  buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 121
;121:  trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 123
;122:
;123:  ui_numArenas += UI_ParseInfos( buf, MAX_ARENAS - ui_numArenas, &ui_arenaInfos[ui_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 124
;124:}
LABELV $138
endproc UI_LoadArenasFromFile 8216 16
proc UI_MapNameCompare 12 8
line 132
;125:
;126:/*
;127:=================
;128:UI_MapNameCompare
;129:=================
;130:*/
;131:static int UI_MapNameCompare( const void *a, const void *b )
;132:{
line 133
;133:  mapInfo *A = (mapInfo *)a;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 134
;134:  mapInfo *B = (mapInfo *)b;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 136
;135:
;136:  return Q_stricmp( A->mapName, B->mapName );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $145
endproc UI_MapNameCompare 12 8
export UI_LoadArenas
proc UI_LoadArenas 1240 16
line 144
;137:}
;138:
;139:/*
;140:===============
;141:UI_LoadArenas
;142:===============
;143:*/
;144:void UI_LoadArenas( void ) {
line 153
;145:  int     numdirs;
;146:  char    filename[128];
;147:  char    dirlist[1024];
;148:  char*   dirptr;
;149:  int     i, n;
;150:  int     dirlen;
;151:  char    *type;
;152:
;153:  ui_numArenas = 0;
ADDRGP4 ui_numArenas
CNSTI4 0
ASGNI4
line 154
;154:  uiInfo.mapCount = 0;
ADDRGP4 uiInfo+83164
CNSTI4 0
ASGNI4
line 157
;155:
;156:  // get all arenas from .arena files
;157:  numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, 1024 );
ADDRGP4 $148
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 152
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1176
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 1176
INDIRI4
ASGNI4
line 158
;158:  dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 152
ASGNP4
line 159
;159:  for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $153
JUMPV
LABELV $150
line 160
;160:    dirlen = strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1180
INDIRI4
ASGNI4
line 161
;161:    strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $154
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 162
;162:    strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 163
;163:    UI_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 164
;164:  }
LABELV $151
line 159
ADDRLP4 1180
CNSTI4 1
ASGNI4
ADDRLP4 140
ADDRLP4 140
INDIRI4
ADDRLP4 1180
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 144
INDIRI4
ADDRLP4 1180
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $153
ADDRLP4 140
INDIRI4
ADDRLP4 148
INDIRI4
LTI4 $150
line 165
;165:  trap_Print( va( "%i arenas parsed\n", ui_numArenas ) );
ADDRGP4 $155
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
ARGI4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 166
;166:  if (UI_OutOfMemory()) {
ADDRLP4 1188
ADDRGP4 UI_OutOfMemory
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
EQI4 $156
line 167
;167:    trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all arenas\n");
ADDRGP4 $158
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 168
;168:  }
LABELV $156
line 170
;169:
;170:  for( n = 0; n < ui_numArenas; n++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $159
line 171
;171:  {
line 173
;172:      // determine type
;173:    type = Info_ValueForKey( ui_arenaInfos[ n ], "type" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 1192
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 136
ADDRLP4 1192
INDIRP4
ASGNP4
line 176
;174:    // if no type specified, it will be treated as "ffa"
;175:
;176:    if( *type && strstr( type, "tremulous" ) )
ADDRLP4 136
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $160
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 1200
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
line 177
;177:      uiInfo.mapList[ uiInfo.mapCount ].typeBits |= ( 1 << 0 );
ADDRLP4 1204
CNSTI4 100
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+20
ADDP4
ASGNP4
ADDRLP4 1204
INDIRP4
ADDRLP4 1204
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 179
;178:    else
;179:      continue; //not a trem map
LABELV $165
line 181
;180:
;181:    uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
CNSTI4 -1
ASGNI4
line 182
;182:    uiInfo.mapList[uiInfo.mapCount].mapLoadName = String_Alloc(Info_ValueForKey(ui_arenaInfos[n], "map"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 1208
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 100
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
ADDRLP4 1212
INDIRP4
ASGNP4
line 183
;183:    uiInfo.mapList[uiInfo.mapCount].mapName = String_Alloc(Info_ValueForKey(ui_arenaInfos[n], "longname"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 1216
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 100
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168
ADDP4
ADDRLP4 1220
INDIRP4
ASGNP4
line 184
;184:    uiInfo.mapList[uiInfo.mapCount].levelShot = -1;
CNSTI4 100
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
CNSTI4 -1
ASGNI4
line 185
;185:    uiInfo.mapList[uiInfo.mapCount].imageName = String_Alloc(va("levelshots/%s", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $186
ARGP4
ADDRLP4 1224
CNSTI4 100
ASGNI4
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1232
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+8
ADDP4
ADDRLP4 1232
INDIRP4
ASGNP4
line 187
;186:
;187:    uiInfo.mapCount++;
ADDRLP4 1236
ADDRGP4 uiInfo+83164
ASGNP4
ADDRLP4 1236
INDIRP4
ADDRLP4 1236
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 188
;188:    if( uiInfo.mapCount >= MAX_MAPS )
ADDRGP4 uiInfo+83164
INDIRI4
CNSTI4 128
LTI4 $191
line 189
;189:      break;
ADDRGP4 $161
JUMPV
LABELV $191
line 190
;190:  }
LABELV $160
line 170
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $162
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $159
LABELV $161
line 192
;191:
;192:  qsort( uiInfo.mapList, uiInfo.mapCount, sizeof( mapInfo ), UI_MapNameCompare );
ADDRGP4 uiInfo+83168
ARGP4
ADDRGP4 uiInfo+83164
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 UI_MapNameCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 193
;193:}
LABELV $146
endproc UI_LoadArenas 1240 16
proc UI_LoadBotsFromFile 8216 16
line 201
;194:
;195:
;196:/*
;197:===============
;198:UI_LoadBotsFromFile
;199:===============
;200:*/
;201:static void UI_LoadBotsFromFile( char *filename ) {
line 206
;202:  int       len;
;203:  fileHandle_t  f;
;204:  char      buf[MAX_BOTS_TEXT];
;205:
;206:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 207
;207:  if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $197
line 208
;208:    trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $141
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 209
;209:    return;
ADDRGP4 $196
JUMPV
LABELV $197
line 211
;210:  }
;211:  if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $199
line 212
;212:    trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 213
;213:    trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 214
;214:    return;
ADDRGP4 $196
JUMPV
LABELV $199
line 217
;215:  }
;216:
;217:  trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 218
;218:  buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 219
;219:  trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 221
;220:
;221:  COM_Compress(buf);
ADDRLP4 8
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 223
;222:
;223:  ui_numBots += UI_ParseInfos( buf, MAX_BOTS - ui_numBots, &ui_botInfos[ui_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 224
;224:}
LABELV $196
endproc UI_LoadBotsFromFile 8216 16
export UI_LoadBots
proc UI_LoadBots 1452 16
line 231
;225:
;226:/*
;227:===============
;228:UI_LoadBots
;229:===============
;230:*/
;231:void UI_LoadBots( void ) {
line 240
;232:  vmCvar_t  botsFile;
;233:  int     numdirs;
;234:  char    filename[128];
;235:  char    dirlist[1024];
;236:  char*   dirptr;
;237:  int     i;
;238:  int     dirlen;
;239:
;240:  ui_numBots = 0;
ADDRGP4 ui_numBots
CNSTI4 0
ASGNI4
line 242
;241:
;242:  trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $202
ARGP4
ADDRGP4 $203
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 243
;243:  if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $204
line 244
;244:    UI_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 245
;245:  }
ADDRGP4 $205
JUMPV
LABELV $204
line 246
;246:  else {
line 247
;247:    UI_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $208
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 248
;248:  }
LABELV $205
line 251
;249:
;250:  // get all bots from .bot files
;251:  numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $148
ARGP4
ADDRGP4 $209
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1440
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1440
INDIRI4
ASGNI4
line 252
;252:  dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 253
;253:  for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $210
line 254
;254:    dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1444
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1444
INDIRI4
ASGNI4
line 255
;255:    strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $154
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 256
;256:    strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 257
;257:    UI_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 258
;258:  }
LABELV $211
line 253
ADDRLP4 1444
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1444
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 1444
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $213
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $210
line 259
;259:  trap_Print( va( "%i bots parsed\n", ui_numBots ) );
ADDRGP4 $214
ARGP4
ADDRGP4 ui_numBots
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 260
;260:}
LABELV $201
endproc UI_LoadBots 1452 16
export UI_GetBotInfoByNumber
proc UI_GetBotInfoByNumber 8 8
line 268
;261:
;262:
;263:/*
;264:===============
;265:UI_GetBotInfoByNumber
;266:===============
;267:*/
;268:char *UI_GetBotInfoByNumber( int num ) {
line 269
;269:  if( num < 0 || num >= ui_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $218
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $216
LABELV $218
line 270
;270:    trap_Print( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $219
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 271
;271:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $215
JUMPV
LABELV $216
line 273
;272:  }
;273:  return ui_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
LABELV $215
endproc UI_GetBotInfoByNumber 8 8
export UI_GetBotInfoByName
proc UI_GetBotInfoByName 16 8
line 282
;274:}
;275:
;276:
;277:/*
;278:===============
;279:UI_GetBotInfoByName
;280:===============
;281:*/
;282:char *UI_GetBotInfoByName( const char *name ) {
line 286
;283:  int   n;
;284:  char  *value;
;285:
;286:  for ( n = 0; n < ui_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $221
line 287
;287:    value = Info_ValueForKey( ui_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $225
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 288
;288:    if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $226
line 289
;289:      return ui_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $220
JUMPV
LABELV $226
line 291
;290:    }
;291:  }
LABELV $222
line 286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $224
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $221
line 293
;292:
;293:  return NULL;
CNSTP4 0
RETP4
LABELV $220
endproc UI_GetBotInfoByName 16 8
export UI_GetNumBots
proc UI_GetNumBots 0 0
line 296
;294:}
;295:
;296:int UI_GetNumBots() {
line 297
;297:  return ui_numBots;
ADDRGP4 ui_numBots
INDIRI4
RETI4
LABELV $228
endproc UI_GetNumBots 0 0
export UI_GetBotNameByNumber
proc UI_GetBotNameByNumber 12 8
line 301
;298:}
;299:
;300:
;301:char *UI_GetBotNameByNumber( int num ) {
line 302
;302:  char *info = UI_GetBotInfoByNumber(num);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 303
;303:  if (info) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 304
;304:    return Info_ValueForKey( info, "name" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $225
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $229
JUMPV
LABELV $230
line 306
;305:  }
;306:  return "Sarge";
ADDRGP4 $232
RETP4
LABELV $229
endproc UI_GetBotNameByNumber 12 8
bss
align 4
LABELV ui_arenaInfos
skip 4096
align 4
LABELV ui_numArenas
skip 4
align 4
LABELV ui_botInfos
skip 4096
export ui_numBots
align 4
LABELV ui_numBots
skip 4
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
import trap_SetPbClStatus
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
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
LABELV $232
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $225
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $219
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $214
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $209
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $203
byte 1 0
align 1
LABELV $202
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $176
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $166
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 117
byte 1 108
byte 1 111
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $158
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
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $155
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $154
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $149
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $148
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $141
byte 1 94
byte 1 49
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $135
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $134
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $133
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $130
byte 1 125
byte 1 0
align 1
LABELV $127
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $121
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $118
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $117
byte 1 123
byte 1 0
