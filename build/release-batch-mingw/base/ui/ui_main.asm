data
align 4
LABELV MonthAbbrev
address $109
address $110
address $111
address $112
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
align 4
LABELV skillLevels
address $121
address $122
address $123
address $124
address $125
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV netSources
address $126
address $127
address $128
address $129
lit
align 4
LABELV numNetSources
byte 4 4
align 4
LABELV serverFilters
address $130
address $131
address $132
address $131
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
address $141
address $142
data
align 4
LABELV teamArenaGameTypes
address $143
address $144
address $145
address $146
address $147
address $148
address $149
address $150
address $151
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 9
data
align 4
LABELV teamArenaGameNames
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
lit
align 4
LABELV numTeamArenaGameNames
byte 4 9
align 4
LABELV numServerFilters
byte 4 7
data
align 4
LABELV sortKeys
address $161
address $162
address $163
address $164
address $165
lit
align 4
LABELV numSortKeys
byte 4 5
data
align 4
LABELV netnames
address $166
address $167
address $168
byte 4 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
export vmMain
code
proc vmMain 12 8
file "..\..\..\..\src/ui/ui_main.c"
line 142
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
;24:/*
;25: =======================================================================
;26:
;27: USER INTERFACE MAIN
;28:
;29: =======================================================================
;30: */
;31:
;32:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;33://#define PRE_RELEASE_TADEMO
;34:
;35:#include "ui_local.h"
;36:
;37:uiInfo_t uiInfo;
;38:
;39:static const char *MonthAbbrev[] =
;40:{ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
;41:
;42:static const char *skillLevels[] =
;43:{ "I Can Win", "Bring It On", "Hurt Me Plenty", "Hardcore", "Nightmare" };
;44:
;45:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;46:
;47:static const char *netSources[] =
;48:{ "Local", "Mplayer", "Internet", "Favorites" };
;49:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;50:
;51:static const serverFilter_t serverFilters[] =
;52:{
;53:{ "All", "" },
;54:{ "Quake 3 Arena", "" },
;55:{ "Team Arena", "missionpack" },
;56:{ "Rocket Arena", "arena" },
;57:{ "Alliance", "alliance20" },
;58:{ "Weapons Factory Arena", "wfa" },
;59:{ "OSP", "osp" }, };
;60:
;61:static const char *teamArenaGameTypes[] =
;62:{ "FFA", "TOURNAMENT", "SP", "TEAM DM", "CTF", "1FCTF", "OVERLOAD", "HARVESTER", "TEAMTOURNAMENT" };
;63:
;64:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;65:
;66:static const char *teamArenaGameNames[] =
;67:{ "Free For All", "Tournament", "Single Player", "Team Deathmatch", "Capture the Flag",
;68:    "One Flag CTF", "Overload", "Harvester", "Team Tournament", };
;69:
;70:static int const numTeamArenaGameNames = sizeof(teamArenaGameNames) / sizeof(const char*);
;71:
;72:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;73:
;74:static const char *sortKeys[] =
;75:{ "Server Name", "Map Name", "Open Player Spots", "Game Type", "Ping Time" };
;76:static const int numSortKeys = sizeof(sortKeys) / sizeof(const char*);
;77:
;78:static char* netnames[] =
;79:{ "???", "UDP", "IPX", NULL };
;80:
;81:static int gamecodetoui[] =
;82:{ 4, 2, 3, 0, 5, 1, 6 };
;83:
;84:static void
;85:UI_StartServerRefresh(qboolean full);
;86:static void
;87:UI_StopServerRefresh(void);
;88:static void
;89:UI_DoServerRefresh(void);
;90:static void
;91:UI_FeederSelection(float feederID, int index);
;92:static void
;93:UI_BuildServerDisplayList(qboolean force);
;94:static void
;95:UI_BuildServerStatus(qboolean force);
;96:static void
;97:UI_BuildFindPlayerList(qboolean force);
;98:static int QDECL
;99:UI_ServersQsortCompare(const void *arg1, const void *arg2);
;100:static int
;101:UI_MapCountByGameType(qboolean singlePlayer);
;102:static int
;103:UI_HeadCountByTeam(void);
;104:static const char *
;105:UI_SelectedMap(int index, int *actual);
;106:static const char *
;107:UI_SelectedHead(int index, int *actual);
;108:static int
;109:UI_GetIndexFromSelection(int actual);
;110:
;111:int
;112:ProcessNewUI(int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);
;113:
;114:/*
;115: ================
;116: vmMain
;117:
;118: This is the only way control passes into the module.
;119: This must be the very first function compiled into the .qvm file
;120: ================
;121: */
;122:vmCvar_t ui_new;
;123:vmCvar_t ui_debug;
;124:vmCvar_t ui_initialized;
;125:vmCvar_t ui_teamArenaFirstRun;
;126:
;127:void
;128:_UI_Init(qboolean);
;129:void
;130:_UI_Shutdown(void);
;131:void
;132:_UI_KeyEvent(int key, qboolean down);
;133:void
;134:_UI_MouseEvent(int dx, int dy);
;135:void
;136:_UI_Refresh(int realtime);
;137:qboolean
;138:_UI_IsFullscreen(void);
;139:intptr_t
;140:vmMain(int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7,
;141:  int arg8, int arg9, int arg10, int arg11)
;142:{
line 143
;143:  switch(command)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $170
ADDRLP4 0
INDIRI4
CNSTI4 9
GTI4 $170
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $182
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $182
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
address $181
code
line 144
;144:  {
LABELV $172
line 146
;145:    case UI_GETAPIVERSION:
;146:      return UI_API_VERSION;
CNSTI4 6
RETI4
ADDRGP4 $169
JUMPV
LABELV $173
line 149
;147:
;148:    case UI_INIT:
;149:      _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 150
;150:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $174
line 153
;151:
;152:    case UI_SHUTDOWN:
;153:      _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 154
;154:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $175
line 157
;155:
;156:    case UI_KEY_EVENT:
;157:      _UI_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 158
;158:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $176
line 161
;159:
;160:    case UI_MOUSE_EVENT:
;161:      _UI_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 162
;162:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $177
line 165
;163:
;164:    case UI_REFRESH:
;165:      _UI_Refresh(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 166
;166:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $178
line 169
;167:
;168:    case UI_IS_FULLSCREEN:
;169:      return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $179
line 172
;170:
;171:    case UI_SET_ACTIVE_MENU:
;172:      _UI_SetActiveMenu(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 173
;173:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $180
line 176
;174:
;175:    case UI_CONSOLE_COMMAND:
;176:      return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $181
line 179
;177:
;178:    case UI_DRAW_CONNECT_SCREEN:
;179:      UI_DrawConnectScreen(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 180
;180:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $170
line 183
;181:  }
;182:
;183:  return -1;
CNSTI4 -1
RETI4
LABELV $169
endproc vmMain 12 8
export AssetCache
proc AssetCache 36 4
line 188
;184:}
;185:
;186:void
;187:AssetCache(void)
;188:{
line 189
;189:  uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(ASSET_GRADIENTBAR);
ADDRGP4 $186
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 0
INDIRI4
ASGNI4
line 190
;190:  uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR);
ADDRGP4 $189
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61680
ADDRLP4 4
INDIRI4
ASGNI4
line 191
;191:  uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWDOWN);
ADDRGP4 $192
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61668
ADDRLP4 8
INDIRI4
ASGNI4
line 192
;192:  uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWUP);
ADDRGP4 $195
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61664
ADDRLP4 12
INDIRI4
ASGNI4
line 193
;193:  uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWLEFT);
ADDRGP4 $198
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61672
ADDRLP4 16
INDIRI4
ASGNI4
line 194
;194:  uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWRIGHT);
ADDRGP4 $201
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61676
ADDRLP4 20
INDIRI4
ASGNI4
line 195
;195:  uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip(ASSET_SCROLL_THUMB);
ADDRGP4 $204
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61684
ADDRLP4 24
INDIRI4
ASGNI4
line 196
;196:  uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip(ASSET_SLIDER_BAR);
ADDRGP4 $207
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61700
ADDRLP4 28
INDIRI4
ASGNI4
line 197
;197:  uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip(ASSET_SLIDER_THUMB);
ADDRGP4 $210
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61704
ADDRLP4 32
INDIRI4
ASGNI4
line 198
;198:}
LABELV $183
endproc AssetCache 36 4
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 202
;199:
;200:void
;201:_UI_DrawSides(float x, float y, float w, float h, float size)
;202:{
line 203
;203:  UI_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 204
;204:  size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 205
;205:  trap_R_DrawStretchPic(x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader);
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
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 206
;206:  trap_R_DrawStretchPic(x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader);
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
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 207
;207:}
LABELV $211
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 211
;208:
;209:void
;210:_UI_DrawTopBottom(float x, float y, float w, float h, float size)
;211:{
line 212
;212:  UI_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 213
;213:  size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+196
INDIRF4
MULF4
ASGNF4
line 214
;214:  trap_R_DrawStretchPic(x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader);
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
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 215
;215:  trap_R_DrawStretchPic(x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader);
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
ADDRGP4 uiInfo+73340
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 216
;216:}
LABELV $215
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 226
;217:/*
;218: ================
;219: UI_DrawRect
;220:
;221: Coordinates are 640*480 virtual values
;222: =================
;223: */
;224:void
;225:_UI_DrawRect(float x, float y, float width, float height, float size, const float *color)
;226:{
line 227
;227:  trap_R_SetColor(color);
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 229
;228:
;229:  _UI_DrawTopBottom(x, y, width, height, size);
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
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 230
;230:  _UI_DrawSides(x, y, width, height, size);
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
ADDRGP4 _UI_DrawSides
CALLV
pop
line 232
;231:
;232:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 233
;233:}
LABELV $219
endproc _UI_DrawRect 0 20
export Text_Width
proc Text_Width 52 4
line 237
;234:
;235:int
;236:Text_Width(const char *text, float scale, int limit)
;237:{
line 242
;238:  int count, len;
;239:  float out;
;240:  glyphInfo_t *glyph;
;241:  float useScale;
;242:  const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 243
;243:  fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+12
ASGNP4
line 244
;244:  if (scale <= ui_smallFont.value)
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $223
line 245
;245:  {
line 246
;246:    font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+20560
ASGNP4
line 247
;247:  }
ADDRGP4 $224
JUMPV
LABELV $223
line 248
;248:  else if (scale >= ui_bigFont.value)
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $228
line 249
;249:  {
line 250
;250:    font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+41108
ASGNP4
line 251
;251:  }
LABELV $228
LABELV $224
line 252
;252:  useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 253
;253:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 254
;254:  if (text)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
line 255
;255:  {
line 256
;256:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 257
;257:    if (limit > 0 && len > limit)
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $235
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $235
line 258
;258:    {
line 259
;259:      len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 260
;260:    }
LABELV $235
line 261
;261:    count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $238
JUMPV
LABELV $237
line 263
;262:    while(s && *s && count < len)
;263:    {
line 264
;264:      if (Q_IsColorString(s))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $240
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $240
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $243
ADDRLP4 40
INDIRI4
CNSTI4 90
LEI4 $242
LABELV $243
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 97
LTI4 $244
ADDRLP4 44
INDIRI4
CNSTI4 122
LEI4 $242
LABELV $244
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 48
LTI4 $240
ADDRLP4 48
INDIRI4
CNSTI4 57
GTI4 $240
LABELV $242
line 265
;265:      {
line 266
;266:        s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 267
;267:        continue;
ADDRGP4 $238
JUMPV
LABELV $240
line 270
;268:      }
;269:      else
;270:      {
line 271
;271:        glyph = &font->glyphs[(int) *s];
ADDRLP4 16
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
line 272
;272:        out += glyph->xSkip;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 273
;273:        s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 274
;274:        count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 275
;275:      }
line 276
;276:    }
LABELV $238
line 262
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $246
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $246
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $237
LABELV $246
line 277
;277:  }
LABELV $233
line 278
;278:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $220
endproc Text_Width 52 4
export Text_Height
proc Text_Height 52 4
line 283
;279:}
;280:
;281:int
;282:Text_Height(const char *text, float scale, int limit)
;283:{
line 288
;284:  int len, count;
;285:  float max;
;286:  glyphInfo_t *glyph;
;287:  float useScale;
;288:  const char *s = text; // bk001206 - unsigned
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 289
;289:  fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+12
ASGNP4
line 290
;290:  if (scale <= ui_smallFont.value)
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $250
line 291
;291:  {
line 292
;292:    font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+20560
ASGNP4
line 293
;293:  }
ADDRGP4 $251
JUMPV
LABELV $250
line 294
;294:  else if (scale >= ui_bigFont.value)
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $255
line 295
;295:  {
line 296
;296:    font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+41108
ASGNP4
line 297
;297:  }
LABELV $255
LABELV $251
line 298
;298:  useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 299
;299:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 300
;300:  if (text)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
line 301
;301:  {
line 302
;302:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 303
;303:    if (limit > 0 && len > limit)
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $262
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $262
line 304
;304:    {
line 305
;305:      len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 306
;306:    }
LABELV $262
line 307
;307:    count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $265
JUMPV
LABELV $264
line 309
;308:    while(s && *s && count < len)
;309:    {
line 310
;310:      if (Q_IsColorString(s))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $267
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $267
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $270
ADDRLP4 40
INDIRI4
CNSTI4 90
LEI4 $269
LABELV $270
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 97
LTI4 $271
ADDRLP4 44
INDIRI4
CNSTI4 122
LEI4 $269
LABELV $271
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 48
LTI4 $267
ADDRLP4 48
INDIRI4
CNSTI4 57
GTI4 $267
LABELV $269
line 311
;311:      {
line 312
;312:        s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 313
;313:        continue;
ADDRGP4 $265
JUMPV
LABELV $267
line 316
;314:      }
;315:      else
;316:      {
line 317
;317:        glyph = &font->glyphs[(int) *s];
ADDRLP4 12
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 318
;318:        if (max < glyph->height)
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $272
line 319
;319:        {
line 320
;320:          max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 321
;321:        }
LABELV $272
line 322
;322:        s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 323
;323:        count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 324
;324:      }
line 325
;325:    }
LABELV $265
line 308
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $275
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $275
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $264
LABELV $275
line 326
;326:  }
LABELV $260
line 327
;327:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $247
endproc Text_Height 52 4
export Text_PaintChar
proc Text_PaintChar 8 36
line 333
;328:}
;329:
;330:void
;331:Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t,
;332:  float s2, float t2, qhandle_t hShader)
;333:{
line 335
;334:  float w, h;
;335:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 336
;336:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 337
;337:  UI_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 338
;338:  trap_R_DrawStretchPic(x, y, w, h, s, t, s2, t2, hShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 339
;339:}
LABELV $276
endproc Text_PaintChar 8 36
export Text_Paint
proc Text_Paint 188 40
line 344
;340:
;341:void
;342:Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit,
;343:  int style)
;344:{
line 349
;345:  int len, count;
;346:  vec4_t newColor;
;347:  glyphInfo_t *glyph;
;348:  float useScale;
;349:  fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+12
ASGNP4
line 350
;350:  if (scale <= ui_smallFont.value)
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $280
line 351
;351:  {
line 352
;352:    font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+20560
ASGNP4
line 353
;353:  }
ADDRGP4 $281
JUMPV
LABELV $280
line 354
;354:  else if (scale >= ui_bigFont.value)
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $285
line 355
;355:  {
line 356
;356:    font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+41108
ASGNP4
line 357
;357:  }
LABELV $285
LABELV $281
line 358
;358:  useScale = scale * font->glyphScale;
ADDRLP4 20
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 359
;359:  if (text)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $290
line 360
;360:  {
line 361
;361:    const char *s = text; // bk001206 - unsigned
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 362
;362:    trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 363
;363:    memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 364
;364:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 365
;365:    if (limit > 0 && len > limit)
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $292
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $292
line 366
;366:    {
line 367
;367:      len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 368
;368:    }
LABELV $292
line 369
;369:    count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $294
line 371
;370:    while(s && *s && count < len)
;371:    {
line 372
;372:      glyph = &font->glyphs[(int) *s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 375
;373:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;374:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;375:      if (Q_IsColorString( s ))
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $297
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $297
ADDRLP4 52
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $297
ADDRLP4 52
INDIRI4
CNSTI4 65
LTI4 $300
ADDRLP4 52
INDIRI4
CNSTI4 90
LEI4 $299
LABELV $300
ADDRLP4 56
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 97
LTI4 $301
ADDRLP4 56
INDIRI4
CNSTI4 122
LEI4 $299
LABELV $301
ADDRLP4 60
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 48
LTI4 $297
ADDRLP4 60
INDIRI4
CNSTI4 57
GTI4 $297
LABELV $299
line 376
;376:      {
line 377
;377:        memcpy(newColor, g_color_table[ColorIndex(*(s+1))], sizeof(newColor));
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 378
;378:        newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 379
;379:        trap_R_SetColor(newColor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 380
;380:        s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 381
;381:        continue;
ADDRGP4 $295
JUMPV
LABELV $297
line 384
;382:      }
;383:      else
;384:      {
line 385
;385:        float yadj = useScale * glyph->top;
ADDRLP4 64
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 386
;386:        if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE)
ADDRLP4 68
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 3
EQI4 $305
ADDRLP4 68
INDIRI4
CNSTI4 6
NEI4 $303
LABELV $305
line 387
;387:        {
line 388
;388:          int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $307
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $307
ADDRLP4 76
CNSTI4 2
ASGNI4
LABELV $308
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 389
;389:          colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 390
;390:          trap_R_SetColor(colorBlack);
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 391
;391:          Text_PaintChar(
ADDRLP4 80
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 394
;392:            x + ofs, y - yadj + ofs, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s,
;393:            glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;394:          trap_R_SetColor(newColor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 395
;395:          colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 396
;396:        }
ADDRGP4 $304
JUMPV
LABELV $303
line 397
;397:        else if (style == ITEM_TEXTSTYLE_NEON)
ADDRFP4 28
INDIRI4
CNSTI4 7
NEI4 $312
line 398
;398:        {
line 401
;399:          vec4_t glow, outer, inner, white;
;400:
;401:          glow[0] = newColor[0] * 0.5;
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 402
;402:          glow[1] = newColor[1] * 0.5;
ADDRLP4 72+4
CNSTF4 1056964608
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 403
;403:          glow[2] = newColor[2] * 0.5;
ADDRLP4 72+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 404
;404:          glow[3] = newColor[3] * 0.2;
ADDRLP4 72+12
CNSTF4 1045220557
ADDRLP4 4+12
INDIRF4
MULF4
ASGNF4
line 406
;405:
;406:          outer[0] = newColor[0];
ADDRLP4 88
ADDRLP4 4
INDIRF4
ASGNF4
line 407
;407:          outer[1] = newColor[1];
ADDRLP4 88+4
ADDRLP4 4+4
INDIRF4
ASGNF4
line 408
;408:          outer[2] = newColor[2];
ADDRLP4 88+8
ADDRLP4 4+8
INDIRF4
ASGNF4
line 409
;409:          outer[3] = newColor[3];
ADDRLP4 88+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 411
;410:
;411:          inner[0] = newColor[0] * 1.5 > 1.0f ? 1.0f : newColor[0] * 1.5;
CNSTF4 1069547520
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $327
ADDRLP4 136
CNSTF4 1065353216
ASGNF4
ADDRGP4 $328
JUMPV
LABELV $327
ADDRLP4 136
CNSTF4 1069547520
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
LABELV $328
ADDRLP4 104
ADDRLP4 136
INDIRF4
ASGNF4
line 412
;412:          inner[1] = newColor[1] * 1.5 > 1.0f ? 1.0f : newColor[1] * 1.5;
CNSTF4 1069547520
ADDRLP4 4+4
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $333
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
ADDRGP4 $334
JUMPV
LABELV $333
ADDRLP4 140
CNSTF4 1069547520
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
LABELV $334
ADDRLP4 104+4
ADDRLP4 140
INDIRF4
ASGNF4
line 413
;413:          inner[2] = newColor[2] * 1.5 > 1.0f ? 1.0f : newColor[2] * 1.5;
CNSTF4 1069547520
ADDRLP4 4+8
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $339
ADDRLP4 144
CNSTF4 1065353216
ASGNF4
ADDRGP4 $340
JUMPV
LABELV $339
ADDRLP4 144
CNSTF4 1069547520
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
LABELV $340
ADDRLP4 104+8
ADDRLP4 144
INDIRF4
ASGNF4
line 414
;414:          inner[3] = newColor[3];
ADDRLP4 104+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 416
;415:
;416:          white[0] = white[1] = white[2] = white[3] = 1.0f;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
ADDRLP4 120+12
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 120
ADDRLP4 148
INDIRF4
ASGNF4
line 418
;417:
;418:          trap_R_SetColor(glow);
ADDRLP4 72
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 419
;419:          Text_PaintChar(
ADDRLP4 152
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 152
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ADDRLP4 152
INDIRF4
SUBF4
ARGF4
ADDRLP4 160
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 160
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 160
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 423
;420:            x - 1.5, y - yadj - 1.5, glyph->imageWidth + 3, glyph->imageHeight + 3, useScale,
;421:            glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;422:
;423:          trap_R_SetColor(outer);
ADDRLP4 88
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 424
;424:          Text_PaintChar(
ADDRLP4 164
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ADDRLP4 164
INDIRF4
SUBF4
ARGF4
ADDRLP4 172
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 428
;425:            x - 1, y - yadj - 1, glyph->imageWidth + 2, glyph->imageHeight + 2, useScale, glyph->s,
;426:            glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;427:
;428:          trap_R_SetColor(inner);
ADDRLP4 104
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 429
;429:          Text_PaintChar(
ADDRLP4 176
CNSTF4 1056964608
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 176
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ADDRLP4 176
INDIRF4
SUBF4
ARGF4
ADDRLP4 184
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 184
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 184
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 433
;430:            x - 0.5, y - yadj - 0.5, glyph->imageWidth + 1, glyph->imageHeight + 1, useScale,
;431:            glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;432:
;433:          trap_R_SetColor(white);
ADDRLP4 120
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 434
;434:        }
LABELV $312
LABELV $304
line 436
;435:
;436:        Text_PaintChar(
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 440
;437:          x, y - yadj, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s, glyph->t,
;438:          glyph->s2, glyph->t2, glyph->glyph);
;439:
;440:        x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 441
;441:        s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 442
;442:        count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 443
;443:      }
line 444
;444:    }
LABELV $295
line 370
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $347
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $347
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $294
LABELV $347
line 445
;445:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 446
;446:  }
LABELV $290
line 447
;447:}
LABELV $277
endproc Text_Paint 188 40
export Text_PaintWithCursor
proc Text_PaintWithCursor 192 40
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 452
;448:
;449:void
;450:Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos,
;451:  char cursor, int limit, int style)
;452:{
line 458
;453:  int len, count;
;454:  vec4_t newColor;
;455:  glyphInfo_t *glyph, *glyph2;
;456:  float yadj;
;457:  float useScale;
;458:  fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 459
;459:  if (scale <= ui_smallFont.value)
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $351
line 460
;460:  {
line 461
;461:    font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 462
;462:  }
ADDRGP4 $352
JUMPV
LABELV $351
line 463
;463:  else if (scale >= ui_bigFont.value)
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $356
line 464
;464:  {
line 465
;465:    font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 466
;466:  }
LABELV $356
LABELV $352
line 467
;467:  useScale = scale * font->glyphScale;
ADDRLP4 20
ADDRFP4 8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 468
;468:  if (text)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
line 469
;469:  {
line 470
;470:    const char *s = text; // bk001206 - unsigned
ADDRLP4 44
ADDRFP4 16
INDIRP4
ASGNP4
line 471
;471:    trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 472
;472:    memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 473
;473:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 48
INDIRI4
ASGNI4
line 474
;474:    if (limit > 0 && len > limit)
ADDRLP4 52
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LEI4 $363
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $363
line 475
;475:    {
line 476
;476:      len = limit;
ADDRLP4 40
ADDRFP4 28
INDIRI4
ASGNI4
line 477
;477:    }
LABELV $363
line 478
;478:    count = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 479
;479:    glyph2 = &font->glyphs[(int) cursor]; // bk001206 - possible signed char
ADDRLP4 24
CNSTI4 80
ADDRFP4 24
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $366
JUMPV
LABELV $365
line 481
;480:    while(s && *s && count < len)
;481:    {
line 482
;482:      glyph = &font->glyphs[(int) *s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 483
;483:      if (Q_IsColorString( s ))
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $368
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $368
ADDRLP4 60
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $368
ADDRLP4 60
INDIRI4
CNSTI4 65
LTI4 $371
ADDRLP4 60
INDIRI4
CNSTI4 90
LEI4 $370
LABELV $371
ADDRLP4 64
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 97
LTI4 $372
ADDRLP4 64
INDIRI4
CNSTI4 122
LEI4 $370
LABELV $372
ADDRLP4 68
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 48
LTI4 $368
ADDRLP4 68
INDIRI4
CNSTI4 57
GTI4 $368
LABELV $370
line 484
;484:      {
line 485
;485:        memcpy(newColor, g_color_table[ColorIndex(*(s+1))], sizeof(newColor));
ADDRLP4 4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 486
;486:        newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 487
;487:        trap_R_SetColor(newColor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 488
;488:        s += 2;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 489
;489:        continue;
ADDRGP4 $366
JUMPV
LABELV $368
line 492
;490:      }
;491:      else
;492:      {
line 493
;493:        yadj = useScale * glyph->top;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 494
;494:        if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE)
ADDRLP4 72
ADDRFP4 32
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 3
EQI4 $376
ADDRLP4 72
INDIRI4
CNSTI4 6
NEI4 $374
LABELV $376
line 495
;495:        {
line 496
;496:          int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 32
INDIRI4
CNSTI4 3
NEI4 $378
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 80
CNSTI4 2
ASGNI4
LABELV $379
ADDRLP4 76
ADDRLP4 80
INDIRI4
ASGNI4
line 497
;497:          colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 498
;498:          trap_R_SetColor(colorBlack);
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 499
;499:          Text_PaintChar(
ADDRLP4 84
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 502
;500:            x + ofs, y - yadj + ofs, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s,
;501:            glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;502:          colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 503
;503:          trap_R_SetColor(newColor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 504
;504:        }
ADDRGP4 $375
JUMPV
LABELV $374
line 505
;505:        else if (style == ITEM_TEXTSTYLE_NEON)
ADDRFP4 32
INDIRI4
CNSTI4 7
NEI4 $383
line 506
;506:        {
line 509
;507:          vec4_t glow, outer, inner, white;
;508:
;509:          glow[0] = newColor[0] * 0.5;
ADDRLP4 76
CNSTF4 1056964608
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 510
;510:          glow[1] = newColor[1] * 0.5;
ADDRLP4 76+4
CNSTF4 1056964608
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 511
;511:          glow[2] = newColor[2] * 0.5;
ADDRLP4 76+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 512
;512:          glow[3] = newColor[3] * 0.2;
ADDRLP4 76+12
CNSTF4 1045220557
ADDRLP4 4+12
INDIRF4
MULF4
ASGNF4
line 514
;513:
;514:          outer[0] = newColor[0];
ADDRLP4 92
ADDRLP4 4
INDIRF4
ASGNF4
line 515
;515:          outer[1] = newColor[1];
ADDRLP4 92+4
ADDRLP4 4+4
INDIRF4
ASGNF4
line 516
;516:          outer[2] = newColor[2];
ADDRLP4 92+8
ADDRLP4 4+8
INDIRF4
ASGNF4
line 517
;517:          outer[3] = newColor[3];
ADDRLP4 92+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 519
;518:
;519:          inner[0] = newColor[0] * 1.5 > 1.0f ? 1.0f : newColor[0] * 1.5;
CNSTF4 1069547520
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $398
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
ADDRGP4 $399
JUMPV
LABELV $398
ADDRLP4 140
CNSTF4 1069547520
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
LABELV $399
ADDRLP4 108
ADDRLP4 140
INDIRF4
ASGNF4
line 520
;520:          inner[1] = newColor[1] * 1.5 > 1.0f ? 1.0f : newColor[1] * 1.5;
CNSTF4 1069547520
ADDRLP4 4+4
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $404
ADDRLP4 144
CNSTF4 1065353216
ASGNF4
ADDRGP4 $405
JUMPV
LABELV $404
ADDRLP4 144
CNSTF4 1069547520
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
LABELV $405
ADDRLP4 108+4
ADDRLP4 144
INDIRF4
ASGNF4
line 521
;521:          inner[2] = newColor[2] * 1.5 > 1.0f ? 1.0f : newColor[2] * 1.5;
CNSTF4 1069547520
ADDRLP4 4+8
INDIRF4
MULF4
CNSTF4 1065353216
LEF4 $410
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
ADDRGP4 $411
JUMPV
LABELV $410
ADDRLP4 148
CNSTF4 1069547520
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
LABELV $411
ADDRLP4 108+8
ADDRLP4 148
INDIRF4
ASGNF4
line 522
;522:          inner[3] = newColor[3];
ADDRLP4 108+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 524
;523:
;524:          white[0] = white[1] = white[2] = white[3] = 1.0f;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
ADDRLP4 124+12
ADDRLP4 152
INDIRF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 152
INDIRF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 152
INDIRF4
ASGNF4
ADDRLP4 124
ADDRLP4 152
INDIRF4
ASGNF4
line 526
;525:
;526:          trap_R_SetColor(glow);
ADDRLP4 76
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 527
;527:          Text_PaintChar(
ADDRLP4 156
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRLP4 164
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 531
;528:            x - 1.5, y - yadj - 1.5, glyph->imageWidth + 3, glyph->imageHeight + 3, useScale,
;529:            glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;530:
;531:          trap_R_SetColor(outer);
ADDRLP4 92
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 532
;532:          Text_PaintChar(
ADDRLP4 168
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 168
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ADDRLP4 168
INDIRF4
SUBF4
ARGF4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 536
;533:            x - 1, y - yadj - 1, glyph->imageWidth + 2, glyph->imageHeight + 2, useScale, glyph->s,
;534:            glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;535:
;536:          trap_R_SetColor(inner);
ADDRLP4 108
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 537
;537:          Text_PaintChar(
ADDRLP4 180
CNSTF4 1056964608
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 180
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ADDRLP4 180
INDIRF4
SUBF4
ARGF4
ADDRLP4 188
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 188
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 188
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 541
;538:            x - 0.5, y - yadj - 0.5, glyph->imageWidth + 1, glyph->imageHeight + 1, useScale,
;539:            glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;540:
;541:          trap_R_SetColor(white);
ADDRLP4 124
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 542
;542:        }
LABELV $383
LABELV $375
line 544
;543:
;544:        Text_PaintChar(
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 549
;545:          x, y - yadj, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s, glyph->t,
;546:          glyph->s2, glyph->t2, glyph->glyph);
;547:
;548:        // CG_DrawPic(x, y - yadj, scale * uiDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * uiDC.Assets.textFont.glyphs[text[i]].imageHeight, uiDC.Assets.textFont.glyphs[text[i]].glyph);
;549:        yadj = useScale * glyph2->top;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 550
;550:        if (count == cursorPos && !((uiInfo.uiDC.realTime / BLINK_DIVISOR) & 1))
ADDRLP4 32
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $417
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $417
line 551
;551:        {
line 552
;552:          Text_PaintChar(
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 555
;553:            x, y - yadj, glyph2->imageWidth, glyph2->imageHeight, useScale, glyph2->s, glyph2->t,
;554:            glyph2->s2, glyph2->t2, glyph2->glyph);
;555:        }
LABELV $417
line 557
;556:
;557:        x += (glyph->xSkip * useScale);
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 558
;558:        s++;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 559
;559:        count++;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 560
;560:      }
line 561
;561:    }
LABELV $366
line 480
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $421
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $365
LABELV $421
line 563
;562:    // need to paint cursor at end of text
;563:    if (cursorPos == len && !((uiInfo.uiDC.realTime / BLINK_DIVISOR) & 1))
ADDRFP4 20
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $422
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $422
line 564
;564:    {
line 565
;565:      yadj = useScale * glyph2->top;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 566
;566:      Text_PaintChar(
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 570
;567:        x, y - yadj, glyph2->imageWidth, glyph2->imageHeight, useScale, glyph2->s, glyph2->t,
;568:        glyph2->s2, glyph2->t2, glyph2->glyph);
;569:
;570:    }
LABELV $422
line 572
;571:
;572:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 573
;573:  }
LABELV $361
line 574
;574:}
LABELV $348
endproc Text_PaintWithCursor 192 40
proc Text_Paint_Limit 80 40
line 579
;575:
;576:static void
;577:Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text,
;578:  float adjust, int limit)
;579:{
line 583
;580:  int len, count;
;581:  vec4_t newColor;
;582:  glyphInfo_t *glyph;
;583:  if (text)
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $426
line 584
;584:  {
line 585
;585:    const char *s = text; // bk001206 - unsigned
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 586
;586:    float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 588
;587:    float useScale;
;588:    fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 589
;589:    if (scale <= ui_smallFont.value)
ADDRFP4 12
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $430
line 590
;590:    {
line 591
;591:      font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 592
;592:    }
ADDRGP4 $431
JUMPV
LABELV $430
line 593
;593:    else if (scale > ui_bigFont.value)
ADDRFP4 12
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LEF4 $435
line 594
;594:    {
line 595
;595:      font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 596
;596:    }
LABELV $435
LABELV $431
line 597
;597:    useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 598
;598:    trap_R_SetColor(color);
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 599
;599:    len = strlen(text);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 600
;600:    if (limit > 0 && len > limit)
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $440
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $440
line 601
;601:    {
line 602
;602:      len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 603
;603:    }
LABELV $440
line 604
;604:    count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $442
line 606
;605:    while(s && *s && count < len)
;606:    {
line 607
;607:      glyph = &font->glyphs[(int) *s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 608
;608:      if (Q_IsColorString( s ))
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $445
ADDRLP4 56
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $445
ADDRLP4 56
INDIRI4
CNSTI4 65
LTI4 $448
ADDRLP4 56
INDIRI4
CNSTI4 90
LEI4 $447
LABELV $448
ADDRLP4 60
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 97
LTI4 $449
ADDRLP4 60
INDIRI4
CNSTI4 122
LEI4 $447
LABELV $449
ADDRLP4 64
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 48
LTI4 $445
ADDRLP4 64
INDIRI4
CNSTI4 57
GTI4 $445
LABELV $447
line 609
;609:      {
line 610
;610:        memcpy(newColor, g_color_table[ColorIndex(*(s+1))], sizeof(newColor));
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 611
;611:        newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 612
;612:        trap_R_SetColor(newColor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 613
;613:        s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 614
;614:        continue;
ADDRGP4 $443
JUMPV
LABELV $445
line 617
;615:      }
;616:      else
;617:      {
line 618
;618:        float yadj = useScale * glyph->top;
ADDRLP4 68
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 619
;619:        if (Text_Width(s, useScale, 1) + x > max)
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $451
line 620
;620:        {
line 621
;621:          *maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 622
;622:          break;
ADDRGP4 $444
JUMPV
LABELV $451
line 624
;623:        }
;624:        Text_PaintChar(
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 627
;625:          x, y - yadj, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s, glyph->t,
;626:          glyph->s2, glyph->t2, glyph->glyph);
;627:        x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 628
;628:        *maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 629
;629:        count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 630
;630:        s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 631
;631:      }
line 632
;632:    }
LABELV $443
line 605
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $454
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $454
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $442
LABELV $454
LABELV $444
line 633
;633:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 634
;634:  }
LABELV $426
line 636
;635:
;636:}
LABELV $425
endproc Text_Paint_Limit 80 40
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 640
;637:
;638:void
;639:UI_ShowPostGame(qboolean newHigh)
;640:{
line 641
;641:  trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 642
;642:  trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $458
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 643
;643:  trap_Cvar_Set("sv_killserver", "1");
ADDRGP4 $459
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 644
;644:  uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+73376
ADDRFP4 0
INDIRI4
ASGNI4
line 645
;645:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 646
;646:}
LABELV $455
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 655
;647:/*
;648: =================
;649: _UI_Refresh
;650: =================
;651: */
;652:
;653:void
;654:UI_DrawCenteredPic(qhandle_t image, int w, int h)
;655:{
line 657
;656:  int x, y;
;657:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 658
;658:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 659
;659:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
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
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 660
;660:}
LABELV $462
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
bss
align 4
LABELV $464
skip 4
align 4
LABELV $465
skip 16
export _UI_Refresh
code
proc _UI_Refresh 24 20
line 668
;661:
;662:int frameCount = 0;
;663:int startTime;
;664:
;665:#define UI_FPS_FRAMES 4
;666:void
;667:_UI_Refresh(int realtime)
;668:{
line 676
;669:  static int index;
;670:  static int previousTimes[UI_FPS_FRAMES];
;671:
;672:  //if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;673:  //  return;
;674:  //}
;675:
;676:  uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+212
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
SUBI4
ASGNI4
line 677
;677:  uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+208
ADDRFP4 0
INDIRI4
ASGNI4
line 679
;678:
;679:  previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $464
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $465
ADDP4
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 680
;680:  index++;
ADDRLP4 0
ADDRGP4 $464
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 681
;681:  if (index > UI_FPS_FRAMES)
ADDRGP4 $464
INDIRI4
CNSTI4 4
LEI4 $470
line 682
;682:  {
line 685
;683:    int i, total;
;684:    // average multiple frames together to smooth changes out a bit
;685:    total = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 686
;686:    for(i = 0;i < UI_FPS_FRAMES;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $472
line 687
;687:    {
line 688
;688:      total += previousTimes[i];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $465
ADDP4
INDIRI4
ADDI4
ASGNI4
line 689
;689:    }
LABELV $473
line 686
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $472
line 690
;690:    if (!total)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $476
line 691
;691:    {
line 692
;692:      total = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 693
;693:    }
LABELV $476
line 694
;694:    uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+73352
CNSTI4 4000
ADDRLP4 8
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 695
;695:  }
LABELV $470
line 697
;696:
;697:  UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 699
;698:
;699:  if (Menu_Count() > 0)
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $479
line 700
;700:  {
line 702
;701:    // paint all the menus
;702:    Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 704
;703:    // refresh server browser list
;704:    UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 706
;705:    // refresh server status
;706:    UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 708
;707:    // refresh find player list
;708:    UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 709
;709:  }
LABELV $479
line 712
;710:
;711:  // draw cursor
;712:  UI_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 715
;713:
;714:  //TA: don't draw the cursor whilst loading
;715:  if (Menu_Count() > 0 && !trap_Cvar_VariableValue("ui_loading"))
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $481
ADDRGP4 $483
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $481
line 716
;716:    UI_DrawHandlePic(
ADDRLP4 16
CNSTI4 16
ASGNI4
ADDRGP4 uiInfo+216
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 uiInfo+228+61656
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
LABELV $481
line 720
;717:      uiInfo.uiDC.cursorx - 16, uiInfo.uiDC.cursory - 16, 32, 32, uiInfo.uiDC.Assets.cursor);
;718:
;719:#ifndef NDEBUG
;720:  if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 0
EQI4 $488
line 721
;721:  {
line 725
;722:    // cursor coordinates
;723:    //FIXME
;724:    //UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
;725:  }
LABELV $488
line 728
;726:#endif
;727:
;728:}
LABELV $463
endproc _UI_Refresh 24 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 737
;729:
;730:/*
;731: =================
;732: _UI_Shutdown
;733: =================
;734: */
;735:void
;736:_UI_Shutdown(void)
;737:{
line 738
;738:  trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 739
;739:}
LABELV $491
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $493
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 745
;740:
;741:char *defaultMenu = NULL;
;742:
;743:char *
;744:GetMenuBuffer(const char *filename)
;745:{
line 750
;746:  int len;
;747:  fileHandle_t f;
;748:  static char buf[MAX_MENUFILE];
;749:
;750:  len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 751
;751:  if (!f)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $494
line 752
;752:  {
line 753
;753:    trap_Print(va(S_COLOR_RED "menu file not found: %s, using default\n", filename));
ADDRGP4 $496
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 754
;754:    return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $492
JUMPV
LABELV $494
line 756
;755:  }
;756:  if (len >= MAX_MENUFILE)
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $497
line 757
;757:  {
line 758
;758:    trap_Print(va(
ADDRGP4 $499
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 760
;759:      S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE));
;760:    trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 761
;761:    return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $492
JUMPV
LABELV $497
line 764
;762:  }
;763:
;764:  trap_FS_Read(buf, len, f);
ADDRGP4 $493
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
line 765
;765:  buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $493
ADDP4
CNSTI1 0
ASGNI1
line 766
;766:  trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 768
;767:  //COM_Compress(buf);
;768:  return buf;
ADDRGP4 $493
RETP4
LABELV $492
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 1124 12
line 774
;769:
;770:}
;771:
;772:qboolean
;773:Asset_Parse(int handle)
;774:{
line 778
;775:  pc_token_t token;
;776:  const char *tempStr;
;777:
;778:  if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $501
line 779
;779:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $501
line 780
;780:  if (Q_stricmp(token.string, "{") != 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $508
line 781
;781:  {
line 782
;782:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $507
line 786
;783:  }
;784:
;785:  while(1)
;786:  {
line 788
;787:
;788:    memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 790
;789:
;790:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $510
line 791
;791:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $510
line 793
;792:
;793:    if (Q_stricmp(token.string, "}") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $512
line 794
;794:    {
line 795
;795:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $500
JUMPV
LABELV $512
line 799
;796:    }
;797:
;798:    // font
;799:    if (Q_stricmp(token.string, "font") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $519
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $516
line 800
;800:    {
line 802
;801:      int pointSize;
;802:      if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $522
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $520
LABELV $522
line 803
;803:      {
line 804
;804:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $520
line 806
;805:      }
;806:      trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+12
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 807
;807:      uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+228+61764
CNSTI4 1
ASGNI4
line 808
;808:      continue;
ADDRGP4 $508
JUMPV
LABELV $516
line 811
;809:    }
;810:
;811:    if (Q_stricmp(token.string, "smallFont") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $527
line 812
;812:    {
line 814
;813:      int pointSize;
;814:      if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $533
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $531
LABELV $533
line 815
;815:      {
line 816
;816:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $531
line 818
;817:      }
;818:      trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+20560
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 819
;819:      continue;
ADDRGP4 $508
JUMPV
LABELV $527
line 822
;820:    }
;821:
;822:    if (Q_stricmp(token.string, "bigFont") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $539
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $536
line 823
;823:    {
line 825
;824:      int pointSize;
;825:      if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $542
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $540
LABELV $542
line 826
;826:      {
line 827
;827:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $540
line 829
;828:      }
;829:      trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+41108
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 830
;830:      continue;
ADDRGP4 $508
JUMPV
LABELV $536
line 834
;831:    }
;832:
;833:    // gradientbar
;834:    if (Q_stricmp(token.string, "gradientbar") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $548
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $545
line 835
;835:    {
line 836
;836:      if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $549
line 837
;837:      {
line 838
;838:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $549
line 840
;839:      }
;840:      uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 841
;841:      continue;
ADDRGP4 $508
JUMPV
LABELV $545
line 845
;842:    }
;843:
;844:    // enterMenuSound
;845:    if (Q_stricmp(token.string, "menuEnterSound") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $556
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $553
line 846
;846:    {
line 847
;847:      if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $557
line 848
;848:      {
line 849
;849:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $557
line 851
;850:      }
;851:      uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound(tempStr, qfalse);
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 852
;852:      continue;
ADDRGP4 $508
JUMPV
LABELV $553
line 856
;853:    }
;854:
;855:    // exitMenuSound
;856:    if (Q_stricmp(token.string, "menuExitSound") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $564
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $561
line 857
;857:    {
line 858
;858:      if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $565
line 859
;859:      {
line 860
;860:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $565
line 862
;861:      }
;862:      uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound(tempStr, qfalse);
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 863
;863:      continue;
ADDRGP4 $508
JUMPV
LABELV $561
line 867
;864:    }
;865:
;866:    // itemFocusSound
;867:    if (Q_stricmp(token.string, "itemFocusSound") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $569
line 868
;868:    {
line 869
;869:      if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $573
line 870
;870:      {
line 871
;871:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $573
line 873
;872:      }
;873:      uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound(tempStr, qfalse);
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 874
;874:      continue;
ADDRGP4 $508
JUMPV
LABELV $569
line 878
;875:    }
;876:
;877:    // menuBuzzSound
;878:    if (Q_stricmp(token.string, "menuBuzzSound") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $580
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $577
line 879
;879:    {
line 880
;880:      if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $581
line 881
;881:      {
line 882
;882:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $581
line 884
;883:      }
;884:      uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound(tempStr, qfalse);
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 885
;885:      continue;
ADDRGP4 $508
JUMPV
LABELV $577
line 888
;886:    }
;887:
;888:    if (Q_stricmp(token.string, "cursor") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $585
line 889
;889:    {
line 890
;890:      if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $589
line 891
;891:      {
line 892
;892:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $589
line 894
;893:      }
;894:      uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip(uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+228+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 895
;895:      continue;
ADDRGP4 $508
JUMPV
LABELV $585
line 898
;896:    }
;897:
;898:    if (Q_stricmp(token.string, "fadeClamp") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $600
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $597
line 899
;899:    {
line 900
;900:      if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $508
line 901
;901:      {
line 902
;902:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
line 904
;903:      }
;904:      continue;
LABELV $597
line 907
;905:    }
;906:
;907:    if (Q_stricmp(token.string, "fadeCycle") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $608
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $605
line 908
;908:    {
line 909
;909:      if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $508
line 910
;910:      {
line 911
;911:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
line 913
;912:      }
;913:      continue;
LABELV $605
line 916
;914:    }
;915:
;916:    if (Q_stricmp(token.string, "fadeAmount") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $616
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $613
line 917
;917:    {
line 918
;918:      if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $508
line 919
;919:      {
line 920
;920:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
line 922
;921:      }
;922:      continue;
LABELV $613
line 925
;923:    }
;924:
;925:    if (Q_stricmp(token.string, "shadowX") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $624
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $621
line 926
;926:    {
line 927
;927:      if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $508
line 928
;928:      {
line 929
;929:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
line 931
;930:      }
;931:      continue;
LABELV $621
line 934
;932:    }
;933:
;934:    if (Q_stricmp(token.string, "shadowY") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $632
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $629
line 935
;935:    {
line 936
;936:      if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $508
line 937
;937:      {
line 938
;938:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
line 940
;939:      }
;940:      continue;
LABELV $629
line 943
;941:    }
;942:
;943:    if (Q_stricmp(token.string, "shadowColor") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $640
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $637
line 944
;944:    {
line 945
;945:      if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $641
line 946
;946:      {
line 947
;947:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $641
line 949
;948:      }
;949:      uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+228+61760
ADDRGP4 uiInfo+228+61744+12
INDIRF4
ASGNF4
line 950
;950:      continue;
LABELV $637
line 953
;951:    }
;952:
;953:  }
LABELV $508
line 785
ADDRGP4 $507
JUMPV
line 954
;954:  return qfalse;
CNSTI4 0
RETI4
LABELV $500
endproc Asset_Parse 1124 12
export Font_Report
proc Font_Report 8 12
line 959
;955:}
;956:
;957:void
;958:Font_Report(void)
;959:{
line 961
;960:  int i;
;961:  Com_Printf("Font Info\n");
ADDRGP4 $651
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 962
;962:  Com_Printf("=========\n");
ADDRGP4 $652
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 963
;963:  for(i = 32;i < 96;i++)
ADDRLP4 0
CNSTI4 32
ASGNI4
LABELV $653
line 964
;964:  {
line 965
;965:    Com_Printf("Glyph handle %i: %i\n", i, uiInfo.uiDC.Assets.textFont.glyphs[i].glyph);
ADDRGP4 $657
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 80
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+228+12+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 966
;966:  }
LABELV $654
line 963
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 96
LTI4 $653
line 967
;967:}
LABELV $650
endproc Font_Report 8 12
export UI_Report
proc UI_Report 0 0
line 971
;968:
;969:void
;970:UI_Report(void)
;971:{
line 972
;972:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 975
;973:  //Font_Report();
;974:
;975:}
LABELV $661
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 979
;976:
;977:void
;978:UI_ParseMenu(const char *menuFile)
;979:{
line 985
;980:  int handle;
;981:  pc_token_t token;
;982:
;983:  /*Com_Printf("Parsing menu file:%s\n", menuFile);*/
;984:
;985:  handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 986
;986:  if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $666
line 987
;987:  {
line 988
;988:    return;
ADDRGP4 $662
JUMPV
LABELV $665
line 992
;989:  }
;990:
;991:  while(1)
;992:  {
line 993
;993:    memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 994
;994:    if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $668
line 995
;995:    {
line 996
;996:      break;
ADDRGP4 $667
JUMPV
LABELV $668
line 1009
;997:    }
;998:
;999:    //if ( Q_stricmp( token, "{" ) ) {
;1000:    //  Com_Printf( "Missing { in menu file\n" );
;1001:    //  break;
;1002:    //}
;1003:
;1004:    //if ( menuCount == MAX_MENUS ) {
;1005:    //  Com_Printf( "Too many menus!\n" );
;1006:    //  break;
;1007:    //}
;1008:
;1009:    if (token.string[0] == '}')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $670
line 1010
;1010:    {
line 1011
;1011:      break;
ADDRGP4 $667
JUMPV
LABELV $670
line 1014
;1012:    }
;1013:
;1014:    if (Q_stricmp(token.string, "assetGlobalDef") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $673
line 1015
;1015:    {
line 1016
;1016:      if (Asset_Parse(handle))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $667
line 1017
;1017:      {
line 1018
;1018:        continue;
ADDRGP4 $666
JUMPV
line 1021
;1019:      }
;1020:      else
;1021:      {
line 1022
;1022:        break;
LABELV $673
line 1026
;1023:      }
;1024:    }
;1025:
;1026:    if (Q_stricmp(token.string, "menudef") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $682
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $679
line 1027
;1027:    {
line 1029
;1028:      // start a new menu
;1029:      Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 1030
;1030:    }
LABELV $679
line 1031
;1031:  }
LABELV $666
line 991
ADDRGP4 $665
JUMPV
LABELV $667
line 1032
;1032:  trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1033
;1033:}
LABELV $662
endproc UI_ParseMenu 1060 12
export UI_FindInfoPaneByName
proc UI_FindInfoPaneByName 16 12
line 1042
;1034:
;1035:/*
;1036: ===============
;1037: UI_FindInfoPaneByName
;1038: ===============
;1039: */
;1040:tremInfoPane_t *
;1041:UI_FindInfoPaneByName(const char *name)
;1042:{
line 1045
;1043:  int i;
;1044:
;1045:  for(i = 0;i < uiInfo.tremInfoPaneCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $687
JUMPV
LABELV $684
line 1046
;1046:  {
line 1047
;1047:    if (!Q_stricmp(uiInfo.tremInfoPanes[i].name, name))
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
INDIRP4
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
NEI4 $689
line 1048
;1048:      return &uiInfo.tremInfoPanes[i];
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
RETP4
ADDRGP4 $683
JUMPV
LABELV $689
line 1049
;1049:  }
LABELV $685
line 1045
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $687
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+665988
INDIRI4
LTI4 $684
line 1052
;1050:
;1051:  //create a dummy infopane demanding the user write the infopane
;1052:  uiInfo.tremInfoPanes[i].name = String_Alloc(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1053
;1053:  strncpy(uiInfo.tremInfoPanes[i].text, "Not implemented.\n\nui/infopanes.def\n", MAX_INFOPANE_TEXT);
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4
ADDP4
ARGP4
ADDRGP4 $696
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1054
;1054:  Q_strcat(uiInfo.tremInfoPanes[i].text, MAX_INFOPANE_TEXT, String_Alloc(name));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4
ADDP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1056
;1055:
;1056:  uiInfo.tremInfoPaneCount++;
ADDRLP4 12
ADDRGP4 uiInfo+665988
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1058
;1057:
;1058:  return &uiInfo.tremInfoPanes[i];
CNSTI4 4428
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
RETP4
LABELV $683
endproc UI_FindInfoPaneByName 16 12
export UI_LoadInfoPane
proc UI_LoadInfoPane 1108 12
line 1068
;1059:}
;1060:
;1061:/*
;1062: ===============
;1063: UI_LoadInfoPane
;1064: ===============
;1065: */
;1066:qboolean
;1067:UI_LoadInfoPane(int handle)
;1068:{
line 1070
;1069:  pc_token_t token;
;1070:  qboolean valid = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $702
line 1073
;1071:
;1072:  while(1)
;1073:  {
line 1074
;1074:    memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1076
;1075:
;1076:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $705
line 1077
;1077:      break;
ADDRGP4 $704
JUMPV
LABELV $705
line 1079
;1078:
;1079:    if (!Q_stricmp(token.string, "name"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $710
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $707
line 1080
;1080:    {
line 1081
;1081:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1083
;1082:
;1083:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $711
line 1084
;1084:        break;
ADDRGP4 $704
JUMPV
LABELV $711
line 1086
;1085:
;1086:      uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].name = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1056
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
ADDRLP4 1056
INDIRP4
ASGNP4
line 1087
;1087:      valid = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 1088
;1088:    }
ADDRGP4 $708
JUMPV
LABELV $707
line 1089
;1089:    else if (!Q_stricmp(token.string, "graphic"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $716
line 1090
;1090:    {
line 1093
;1091:      int *graphic;
;1092:
;1093:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1095
;1094:
;1095:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $720
line 1096
;1096:        break;
ADDRGP4 $704
JUMPV
LABELV $720
line 1098
;1097:
;1098:      graphic = &uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].numGraphics;
ADDRLP4 1056
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4424
ADDP4
ASGNP4
line 1100
;1099:
;1100:      if (!Q_stricmp(token.string, "top"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $728
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $725
line 1101
;1101:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].side = INFOPANE_TOP;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $726
JUMPV
LABELV $725
line 1102
;1102:      else if (!Q_stricmp(token.string, "bottom"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $732
line 1103
;1103:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].side = INFOPANE_BOTTOM;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $733
JUMPV
LABELV $732
line 1104
;1104:      else if (!Q_stricmp(token.string, "left"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $742
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $739
line 1105
;1105:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].side = INFOPANE_LEFT;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $740
JUMPV
LABELV $739
line 1106
;1106:      else if (!Q_stricmp(token.string, "right"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $704
line 1107
;1107:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].side = INFOPANE_RIGHT;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1109
;1108:      else
;1109:        break;
LABELV $747
LABELV $740
LABELV $733
LABELV $726
line 1111
;1110:
;1111:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1113
;1112:
;1113:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1080
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $753
line 1114
;1114:        break;
ADDRGP4 $704
JUMPV
LABELV $753
line 1116
;1115:
;1116:      if (!Q_stricmp(token.string, "center"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $758
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $755
line 1117
;1117:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].offset = -1;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
CNSTI4 -1
ASGNI4
ADDRGP4 $756
JUMPV
LABELV $755
line 1119
;1118:      else
;1119:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].offset = token.intvalue;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 0+8
INDIRI4
ASGNI4
LABELV $756
line 1121
;1120:
;1121:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1123
;1122:
;1123:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1088
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $766
line 1124
;1124:        break;
ADDRGP4 $704
JUMPV
LABELV $766
line 1126
;1125:
;1126:      uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].graphic
ADDRLP4 0+16
ARGP4
ADDRLP4 1092
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1129
;1127:          = trap_R_RegisterShaderNoMip(token.string);
;1128:
;1129:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1131
;1130:
;1131:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $772
line 1132
;1132:        break;
ADDRGP4 $704
JUMPV
LABELV $772
line 1134
;1133:
;1134:      uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].width = token.intvalue;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0+8
INDIRI4
ASGNI4
line 1136
;1135:
;1136:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1138
;1137:
;1138:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1100
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $778
line 1139
;1139:        break;
ADDRGP4 $704
JUMPV
LABELV $778
line 1141
;1140:
;1141:      uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].graphics[*graphic].height = token.intvalue;
CNSTI4 20
ADDRLP4 1056
INDIRP4
INDIRI4
MULI4
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 0+8
INDIRI4
ASGNI4
line 1144
;1142:
;1143:      //increment graphics
;1144:      (*graphic)++;
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1146
;1145:
;1146:      if (*graphic == MAX_INFOPANE_GRAPHICS)
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 16
NEI4 $717
line 1147
;1147:        break;
ADDRGP4 $704
JUMPV
line 1148
;1148:    }
LABELV $716
line 1149
;1149:    else if (!Q_stricmp(token.string, "text"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $789
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $786
line 1150
;1150:    {
line 1151
;1151:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1153
;1152:
;1153:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $790
line 1154
;1154:        break;
ADDRGP4 $704
JUMPV
LABELV $790
line 1156
;1155:
;1156:      Q_strcat(uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].text, MAX_INFOPANE_TEXT, token.string);
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4
ADDP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 0+16
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1157
;1157:    }
ADDRGP4 $787
JUMPV
LABELV $786
line 1158
;1158:    else if (!Q_stricmp(token.string, "align"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $799
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $796
line 1159
;1159:    {
line 1160
;1160:      memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1162
;1161:
;1162:      if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1064
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $800
line 1163
;1163:        break;
ADDRGP4 $704
JUMPV
LABELV $800
line 1165
;1164:
;1165:      if (!Q_stricmp(token.string, "left"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $742
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $802
line 1166
;1166:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].align = ITEM_ALIGN_LEFT;
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4100
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $802
line 1167
;1167:      else if (!Q_stricmp(token.string, "right"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $808
line 1168
;1168:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].align = ITEM_ALIGN_RIGHT;
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4100
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $808
line 1169
;1169:      else if (!Q_stricmp(token.string, "center"))
ADDRLP4 0+16
ARGP4
ADDRGP4 $758
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $797
line 1170
;1170:        uiInfo.tremInfoPanes[uiInfo.tremInfoPaneCount].align = ITEM_ALIGN_CENTER;
CNSTI4 4428
ADDRGP4 uiInfo+665988
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4100
ADDP4
CNSTI4 1
ASGNI4
line 1171
;1171:    }
ADDRGP4 $797
JUMPV
LABELV $796
line 1172
;1172:    else if (token.string[0] == '}')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $704
line 1173
;1173:    {
line 1175
;1174:      //reached the end, break
;1175:      break;
ADDRGP4 $704
JUMPV
line 1178
;1176:    }
;1177:    else
;1178:      break;
LABELV $797
LABELV $787
LABELV $717
LABELV $708
line 1179
;1179:  }
LABELV $703
line 1072
ADDRGP4 $702
JUMPV
LABELV $704
line 1181
;1180:
;1181:  if (valid)
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $823
line 1182
;1182:  {
line 1183
;1183:    uiInfo.tremInfoPaneCount++;
ADDRLP4 1044
ADDRGP4 uiInfo+665988
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1184
;1184:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $701
JUMPV
LABELV $823
line 1187
;1185:  }
;1186:  else
;1187:  {
line 1188
;1188:    return qfalse;
CNSTI4 0
RETI4
LABELV $701
endproc UI_LoadInfoPane 1108 12
export UI_LoadInfoPanes
proc UI_LoadInfoPanes 1064 8
line 1199
;1189:  }
;1190:}
;1191:
;1192:/*
;1193: ===============
;1194: UI_LoadInfoPanes
;1195: ===============
;1196: */
;1197:void
;1198:UI_LoadInfoPanes(const char *file)
;1199:{
line 1204
;1200:  pc_token_t token;
;1201:  int handle;
;1202:  int count;
;1203:
;1204:  uiInfo.tremInfoPaneCount = count = 0;
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
ADDRGP4 uiInfo+665988
ADDRLP4 1048
INDIRI4
ASGNI4
line 1206
;1205:
;1206:  handle = trap_PC_LoadSource(file);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 1208
;1207:
;1208:  if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $832
line 1209
;1209:  {
line 1210
;1210:    trap_Error(va(S_COLOR_YELLOW "infopane file not found: %s\n", file));
ADDRGP4 $830
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1211
;1211:    return;
ADDRGP4 $826
JUMPV
LABELV $831
line 1215
;1212:  }
;1213:
;1214:  while(1)
;1215:  {
line 1216
;1216:    if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $834
line 1217
;1217:      break;
ADDRGP4 $833
JUMPV
LABELV $834
line 1219
;1218:
;1219:    if (token.string[0] == 0)
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $836
line 1220
;1220:      break;
ADDRGP4 $833
JUMPV
LABELV $836
line 1222
;1221:
;1222:    if (token.string[0] == '{')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $839
line 1223
;1223:    {
line 1224
;1224:      if (UI_LoadInfoPane(handle))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 UI_LoadInfoPane
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $842
line 1225
;1225:        count++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $842
line 1227
;1226:
;1227:      if (count == MAX_INFOPANES)
ADDRLP4 1044
INDIRI4
CNSTI4 128
NEI4 $844
line 1228
;1228:        break;
ADDRGP4 $833
JUMPV
LABELV $844
line 1229
;1229:    }
LABELV $839
line 1230
;1230:  }
LABELV $832
line 1214
ADDRGP4 $831
JUMPV
LABELV $833
line 1232
;1231:
;1232:  trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1233
;1233:}
LABELV $826
endproc UI_LoadInfoPanes 1064 8
export Load_Menu
proc Load_Menu 1048 8
line 1237
;1234:
;1235:qboolean
;1236:Load_Menu(int handle)
;1237:{
line 1240
;1238:  pc_token_t token;
;1239:
;1240:  if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $847
line 1241
;1241:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $846
JUMPV
LABELV $847
line 1242
;1242:  if (token.string[0] != '{')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $853
line 1243
;1243:  {
line 1244
;1244:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $846
JUMPV
LABELV $852
line 1248
;1245:  }
;1246:
;1247:  while(1)
;1248:  {
line 1250
;1249:
;1250:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $855
line 1251
;1251:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $846
JUMPV
LABELV $855
line 1253
;1252:
;1253:    if (token.string[0] == 0)
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $857
line 1254
;1254:    {
line 1255
;1255:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $846
JUMPV
LABELV $857
line 1258
;1256:    }
;1257:
;1258:    if (token.string[0] == '}')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $860
line 1259
;1259:    {
line 1260
;1260:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $846
JUMPV
LABELV $860
line 1263
;1261:    }
;1262:
;1263:    UI_ParseMenu(token.string);
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 1264
;1264:  }
LABELV $853
line 1247
ADDRGP4 $852
JUMPV
line 1265
;1265:  return qfalse;
CNSTI4 0
RETI4
LABELV $846
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 1270
;1266:}
;1267:
;1268:void
;1269:UI_LoadMenus(const char *menuFile, qboolean reset)
;1270:{
line 1275
;1271:  pc_token_t token;
;1272:  int handle;
;1273:  int start;
;1274:
;1275:  start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 1277
;1276:
;1277:  handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 1278
;1278:  if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $865
line 1279
;1279:  {
line 1280
;1280:    trap_Error(va(S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile));
ADDRGP4 $867
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1281
;1281:    handle = trap_PC_LoadSource("ui/menus.txt");
ADDRGP4 $868
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1060
INDIRI4
ASGNI4
line 1282
;1282:    if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $869
line 1283
;1283:    {
line 1284
;1284:      trap_Error(va(
ADDRGP4 $871
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1286
;1285:        S_COLOR_RED "default menu file not found: ui/menus.txt %s, unable to continue!\n", menuFile));
;1286:    }
LABELV $869
line 1287
;1287:  }
LABELV $865
line 1289
;1288:
;1289:  ui_new.integer = 1;
ADDRGP4 ui_new+12
CNSTI4 1
ASGNI4
line 1291
;1290:
;1291:  if (reset)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $876
line 1292
;1292:  {
line 1293
;1293:    Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 1294
;1294:  }
ADDRGP4 $876
JUMPV
LABELV $875
line 1297
;1295:
;1296:  while(1)
;1297:  {
line 1298
;1298:    if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $878
line 1299
;1299:      break;
ADDRGP4 $877
JUMPV
LABELV $878
line 1300
;1300:    if (token.string[0] == 0 || token.string[0] == '}')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $884
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $880
LABELV $884
line 1301
;1301:    {
line 1302
;1302:      break;
ADDRGP4 $877
JUMPV
LABELV $880
line 1305
;1303:    }
;1304:
;1305:    if (token.string[0] == '}')
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $885
line 1306
;1306:    {
line 1307
;1307:      break;
ADDRGP4 $877
JUMPV
LABELV $885
line 1310
;1308:    }
;1309:
;1310:    if (Q_stricmp(token.string, "loadmenu") == 0)
ADDRLP4 0+16
ARGP4
ADDRGP4 $891
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $888
line 1311
;1311:    {
line 1312
;1312:      if (Load_Menu(handle))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $877
line 1313
;1313:      {
line 1314
;1314:        continue;
line 1317
;1315:      }
;1316:      else
;1317:      {
line 1318
;1318:        break;
LABELV $888
line 1321
;1319:      }
;1320:    }
;1321:  }
LABELV $876
line 1296
ADDRGP4 $875
JUMPV
LABELV $877
line 1323
;1322:
;1323:  Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 1056
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $894
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1325
;1324:
;1325:  trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1326
;1326:}
LABELV $864
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1052 8
line 1330
;1327:
;1328:void
;1329:UI_Load(void)
;1330:{
line 1332
;1331:  char lastName[1024];
;1332:  menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 1333
;1333:  char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $896
ARGP4
ADDRLP4 1036
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 1334
;1334:  if (menu && menu->window.name)
ADDRLP4 1044
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $897
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $897
line 1335
;1335:  {
line 1336
;1336:    strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1337
;1337:  }
LABELV $897
line 1338
;1338:  if (menuSet == NULL || menuSet[0] == '\0')
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $901
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $899
LABELV $901
line 1339
;1339:  {
line 1340
;1340:    menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $868
ASGNP4
line 1341
;1341:  }
LABELV $899
line 1343
;1342:
;1343:  String_Init();
ADDRGP4 String_Init
CALLV
pop
line 1348
;1344:
;1345:  /*  UI_ParseGameInfo("gameinfo.txt");
;1346:   UI_LoadArenas();*/
;1347:
;1348:  UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 1349
;1349:  Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 1350
;1350:  Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 1352
;1351:
;1352:}
LABELV $895
endproc UI_Load 1052 8
data
align 4
LABELV handicapValues
address $902
address $903
address $904
address $905
address $906
address $907
address $908
address $909
address $910
address $911
address $912
address $913
address $914
address $915
address $916
address $917
address $918
address $919
address $920
address $921
byte 4 0
code
proc UI_DrawHandicap 20 32
line 1360
;1353:
;1354:static const char *handicapValues[] =
;1355:{ "None", "95", "90", "85", "80", "75", "70", "65", "60", "55", "50", "45", "40", "35", "30", "25",
;1356:    "20", "15", "10", "5", NULL };
;1357:
;1358:static void
;1359:UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1360:{
line 1363
;1361:  int i, h;
;1362:
;1363:  h = Com_Clamp(5, 100, trap_Cvar_VariableValue("handicap"));
ADDRGP4 $923
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1364
;1364:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1366
;1365:
;1366:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1367
;1367:}
LABELV $922
endproc UI_DrawHandicap 20 32
proc UI_DrawClanName 8 32
line 1371
;1368:
;1369:static void
;1370:UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1371:{
line 1372
;1372:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle);
ADDRGP4 $925
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1373
;1373:}
LABELV $924
endproc UI_DrawClanName 8 32
proc UI_SetCapFragLimits 16 8
line 1377
;1374:
;1375:static void
;1376:UI_SetCapFragLimits(qboolean uiVars)
;1377:{
line 1378
;1378:  int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1379
;1379:  int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1380
;1380:  if (uiVars)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $927
line 1381
;1381:  {
line 1382
;1382:    trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $930
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $929
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1383
;1383:    trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $930
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $931
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1384
;1384:  }
ADDRGP4 $928
JUMPV
LABELV $927
line 1386
;1385:  else
;1386:  {
line 1387
;1387:    trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $930
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $932
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1388
;1388:    trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $930
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $933
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1389
;1389:  }
LABELV $928
line 1390
;1390:}
LABELV $926
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 32
line 1394
;1391:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1392:static void
;1393:UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1394:{
line 1395
;1395:  Text_Paint(
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1397
;1396:    rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle);
;1397:}
LABELV $934
endproc UI_DrawGameType 4 32
proc UI_DrawNetGameType 4 32
line 1401
;1398:
;1399:static void
;1400:UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1401:{
line 1402
;1402:  if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes)
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $943
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78516
INDIRI4
LEI4 $938
LABELV $943
line 1403
;1403:  {
line 1404
;1404:    trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $944
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1405
;1405:    trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $945
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1406
;1406:  }
LABELV $938
line 1407
;1407:  Text_Paint(
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1410
;1408:    rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType, 0, 0,
;1409:    textStyle);
;1410:}
LABELV $937
endproc UI_DrawNetGameType 4 32
proc UI_DrawJoinGameType 4 32
line 1414
;1411:
;1412:static void
;1413:UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1414:{
line 1415
;1415:  if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes)
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $954
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78648
INDIRI4
LEI4 $949
LABELV $954
line 1416
;1416:  {
line 1417
;1417:    trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $955
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1418
;1418:  }
LABELV $949
line 1419
;1419:  Text_Paint(
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78652
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1422
;1420:    rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType, 0, 0,
;1421:    textStyle);
;1422:}
LABELV $948
endproc UI_DrawJoinGameType 4 32
proc UI_TeamIndexFromName 12 8
line 1426
;1423:
;1424:static int
;1425:UI_TeamIndexFromName(const char *name)
;1426:{
line 1429
;1427:  int i;
;1428:
;1429:  if (name && *name)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $959
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $959
line 1430
;1430:  {
line 1431
;1431:    for(i = 0;i < uiInfo.teamCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $964
JUMPV
LABELV $961
line 1432
;1432:    {
line 1433
;1433:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0)
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $966
line 1434
;1434:      {
line 1435
;1435:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $958
JUMPV
LABELV $966
line 1437
;1436:      }
;1437:    }
LABELV $962
line 1431
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $964
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $961
line 1438
;1438:  }
LABELV $959
line 1440
;1439:
;1440:  return 0;
CNSTI4 0
RETI4
LABELV $958
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1446
;1441:
;1442:}
;1443:
;1444:static void
;1445:UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color)
;1446:{
line 1448
;1447:  int i;
;1448:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1449
;1449:  if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $970
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $970
line 1450
;1450:  {
line 1451
;1451:    trap_R_SetColor(color);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1453
;1452:
;1453:    if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $973
line 1454
;1454:    {
line 1455
;1455:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1456
;1456:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 24
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1458
;1457:        "%s_metal", uiInfo.teamList[i].imageName));
;1458:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 36
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1460
;1459:        "%s_name", uiInfo.teamList[i].imageName));
;1460:    }
LABELV $973
line 1462
;1461:
;1462:    UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1463
;1463:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1464
;1464:  }
LABELV $970
line 1465
;1465:}
LABELV $969
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1469
;1466:
;1467:static void
;1468:UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color)
;1469:{
line 1471
;1470:  int i;
;1471:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1472
;1472:  if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $994
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $994
line 1473
;1473:  {
line 1475
;1474:
;1475:    if (uiInfo.teamList[i].cinematic >= -2)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $997
line 1476
;1476:    {
line 1477
;1477:      if (uiInfo.teamList[i].cinematic == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1001
line 1478
;1478:      {
line 1479
;1479:        uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va(
ADDRGP4 $1007
ARGP4
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75700+40
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1481
;1480:          "%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent));
;1481:      }
LABELV $1001
line 1482
;1482:      if (uiInfo.teamList[i].cinematic >= 0)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1010
line 1483
;1483:      {
line 1484
;1484:        trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1485
;1485:        trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1486
;1486:        trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1487
;1487:      }
ADDRGP4 $998
JUMPV
LABELV $1010
line 1489
;1488:      else
;1489:      {
line 1490
;1490:        trap_R_SetColor(color);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1491
;1491:        UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1492
;1492:        trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1493
;1493:        uiInfo.teamList[i].cinematic = -2;
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
CNSTI4 -2
ASGNI4
line 1494
;1494:      }
line 1495
;1495:    }
ADDRGP4 $998
JUMPV
LABELV $997
line 1497
;1496:    else
;1497:    {
line 1498
;1498:      trap_R_SetColor(color);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1499
;1499:      UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1500
;1500:      trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1501
;1501:    }
LABELV $998
line 1502
;1502:  }
LABELV $994
line 1504
;1503:
;1504:}
LABELV $993
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1508
;1505:
;1506:static void
;1507:UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color)
;1508:{
line 1509
;1509:  if (uiInfo.previewMovie > -2)
ADDRGP4 uiInfo+99200
INDIRI4
CNSTI4 -2
LEI4 $1027
line 1510
;1510:  {
line 1511
;1511:    uiInfo.previewMovie = trap_CIN_PlayCinematic(
ADDRGP4 $1007
ARGP4
ADDRGP4 uiInfo+99196
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98168
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99200
ADDRLP4 8
INDIRI4
ASGNI4
line 1513
;1512:      va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent));
;1513:    if (uiInfo.previewMovie >= 0)
ADDRGP4 uiInfo+99200
INDIRI4
CNSTI4 0
LTI4 $1033
line 1514
;1514:    {
line 1515
;1515:      trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99200
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1516
;1516:      trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99200
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1517
;1517:      trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99200
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1518
;1518:    }
ADDRGP4 $1034
JUMPV
LABELV $1033
line 1520
;1519:    else
;1520:    {
line 1521
;1521:      uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+99200
CNSTI4 -2
ASGNI4
line 1522
;1522:    }
LABELV $1034
line 1523
;1523:  }
LABELV $1027
line 1525
;1524:
;1525:}
LABELV $1026
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawInfoPane 1248 20
line 1536
;1526:
;1527:#define GRAPHIC_BWIDTH  8.0f
;1528:/*
;1529: ===============
;1530: UI_DrawInfoPane
;1531: ===============
;1532: */
;1533:static void
;1534:UI_DrawInfoPane(tremInfoPane_t *pane, rectDef_t *rect, float text_x, float text_y, float scale,
;1535:  vec4_t color, int textStyle)
;1536:{
line 1538
;1537:  int i;
;1538:  float maxLeft = 0, maxTop = 0;
ADDRLP4 560
CNSTF4 0
ASGNF4
ADDRLP4 568
CNSTF4 0
ASGNF4
line 1539
;1539:  float maxRight = 0, maxBottom = 0;
ADDRLP4 564
CNSTF4 0
ASGNF4
ADDRLP4 572
CNSTF4 0
ASGNF4
line 1540
;1540:  float x = rect->x - text_x, y = rect->y - text_y, w, h;
ADDRLP4 556
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 552
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1541
;1541:  float xoffset = 0, yoffset = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 548
CNSTF4 0
ASGNF4
line 1546
;1542:  menuDef_t dummyParent;
;1543:  itemDef_t textItem;
;1544:
;1545:  //iterate through graphics
;1546:  for(i = 0;i < pane->numGraphics;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1044
JUMPV
LABELV $1041
line 1547
;1547:  {
line 1548
;1548:    float width = pane->graphics[i].width;
ADDRLP4 1228
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1549
;1549:    float height = pane->graphics[i].height;
ADDRLP4 1232
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1550
;1550:    qhandle_t graphic = pane->graphics[i].graphic;
ADDRLP4 1236
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1552
;1551:
;1552:    if (pane->graphics[i].side == INFOPANE_TOP || pane->graphics[i].side == INFOPANE_BOTTOM)
ADDRLP4 1240
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
EQI4 $1047
ADDRLP4 1240
INDIRI4
CNSTI4 1
NEI4 $1045
LABELV $1047
line 1553
;1553:    {
line 1555
;1554:      //set horizontal offset of graphic
;1555:      if (pane->graphics[i].offset < 0)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1048
line 1556
;1556:        xoffset = (rect->w / 2) - (pane->graphics[i].width / 2);
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
ADDRGP4 $1046
JUMPV
LABELV $1048
line 1558
;1557:      else
;1558:        xoffset = pane->graphics[i].offset + GRAPHIC_BWIDTH;
ADDRLP4 4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1559
;1559:    }
ADDRGP4 $1046
JUMPV
LABELV $1045
line 1560
;1560:    else if (pane->graphics[i].side == INFOPANE_LEFT || pane->graphics[i].side == INFOPANE_RIGHT)
ADDRLP4 1244
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 2
EQI4 $1052
ADDRLP4 1244
INDIRI4
CNSTI4 3
NEI4 $1050
LABELV $1052
line 1561
;1561:    {
line 1563
;1562:      //set vertical offset of graphic
;1563:      if (pane->graphics[i].offset < 0)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1053
line 1564
;1564:        yoffset = (rect->h / 2) - (pane->graphics[i].height / 2);
ADDRLP4 548
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
ADDRGP4 $1054
JUMPV
LABELV $1053
line 1566
;1565:      else
;1566:        yoffset = pane->graphics[i].offset + GRAPHIC_BWIDTH;
ADDRLP4 548
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
LABELV $1054
line 1567
;1567:    }
LABELV $1050
LABELV $1046
line 1569
;1568:
;1569:    if (pane->graphics[i].side == INFOPANE_LEFT)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1055
line 1570
;1570:    {
line 1572
;1571:      //set the horizontal offset of the text
;1572:      if (pane->graphics[i].width > maxLeft)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 560
INDIRF4
LEF4 $1057
line 1573
;1573:        maxLeft = pane->graphics[i].width + GRAPHIC_BWIDTH;
ADDRLP4 560
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
LABELV $1057
line 1575
;1574:
;1575:      xoffset = GRAPHIC_BWIDTH;
ADDRLP4 4
CNSTF4 1090519040
ASGNF4
line 1576
;1576:    }
ADDRGP4 $1056
JUMPV
LABELV $1055
line 1577
;1577:    else if (pane->graphics[i].side == INFOPANE_RIGHT)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1059
line 1578
;1578:    {
line 1579
;1579:      if (pane->graphics[i].width > maxRight)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 564
INDIRF4
LEF4 $1061
line 1580
;1580:        maxRight = pane->graphics[i].width + GRAPHIC_BWIDTH;
ADDRLP4 564
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
LABELV $1061
line 1582
;1581:
;1582:      xoffset = rect->w - width - GRAPHIC_BWIDTH;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1583
;1583:    }
ADDRGP4 $1060
JUMPV
LABELV $1059
line 1584
;1584:    else if (pane->graphics[i].side == INFOPANE_TOP)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1063
line 1585
;1585:    {
line 1587
;1586:      //set the vertical offset of the text
;1587:      if (pane->graphics[i].height > maxTop)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 568
INDIRF4
LEF4 $1065
line 1588
;1588:        maxTop = pane->graphics[i].height + GRAPHIC_BWIDTH;
ADDRLP4 568
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
LABELV $1065
line 1590
;1589:
;1590:      yoffset = GRAPHIC_BWIDTH;
ADDRLP4 548
CNSTF4 1090519040
ASGNF4
line 1591
;1591:    }
ADDRGP4 $1064
JUMPV
LABELV $1063
line 1592
;1592:    else if (pane->graphics[i].side == INFOPANE_BOTTOM)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1067
line 1593
;1593:    {
line 1594
;1594:      if (pane->graphics[i].height > maxBottom)
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 572
INDIRF4
LEF4 $1069
line 1595
;1595:        maxBottom = pane->graphics[i].height + GRAPHIC_BWIDTH;
ADDRLP4 572
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
ADDF4
ASGNF4
LABELV $1069
line 1597
;1596:
;1597:      yoffset = rect->h - height - GRAPHIC_BWIDTH;
ADDRLP4 548
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 1232
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1598
;1598:    }
LABELV $1067
LABELV $1064
LABELV $1060
LABELV $1056
line 1601
;1599:
;1600:    //draw the graphic
;1601:    UI_DrawHandlePic(x + xoffset, y + yoffset, width, height, graphic);
ADDRLP4 556
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ARGF4
ADDRLP4 552
INDIRF4
ADDRLP4 548
INDIRF4
ADDF4
ARGF4
ADDRLP4 1228
INDIRF4
ARGF4
ADDRLP4 1232
INDIRF4
ARGF4
ADDRLP4 1236
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1602
;1602:  }
LABELV $1042
line 1546
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1044
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4424
ADDP4
INDIRI4
LTI4 $1041
line 1605
;1603:
;1604:  //offset the text
;1605:  x = rect->x + maxLeft;
ADDRLP4 556
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 560
INDIRF4
ADDF4
ASGNF4
line 1606
;1606:  y = rect->y + maxTop;
ADDRLP4 552
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 568
INDIRF4
ADDF4
ASGNF4
line 1607
;1607:  w = rect->w - (maxLeft + maxRight + 16 + (2 * text_x)); //16 to ensure text within frame
ADDRLP4 576
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 560
INDIRF4
ADDRLP4 564
INDIRF4
ADDF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 1608
;1608:  h = rect->h - (maxTop + maxBottom);
ADDRLP4 580
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 568
INDIRF4
ADDRLP4 572
INDIRF4
ADDF4
SUBF4
ASGNF4
line 1610
;1609:
;1610:  textItem.text = pane->text;
ADDRLP4 8+224
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 1612
;1611:
;1612:  textItem.parent = &dummyParent;
ADDRLP4 8+228
ADDRLP4 584
ASGNP4
line 1613
;1613:  memcpy(textItem.window.foreColor, color, sizeof(vec4_t));
ADDRLP4 8+112
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1614
;1614:  textItem.window.flags = 0;
ADDRLP4 8+68
CNSTI4 0
ASGNI4
line 1616
;1615:
;1616:  switch(pane->align)
ADDRLP4 1228
ADDRFP4 0
INDIRP4
CNSTI4 4100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $1078
ADDRLP4 1228
INDIRI4
CNSTI4 1
EQI4 $1080
ADDRLP4 1228
INDIRI4
CNSTI4 2
EQI4 $1079
ADDRGP4 $1075
JUMPV
line 1617
;1617:  {
LABELV $1078
line 1619
;1618:    case ITEM_ALIGN_LEFT:
;1619:      textItem.window.rect.x = x;
ADDRLP4 8
ADDRLP4 556
INDIRF4
ASGNF4
line 1620
;1620:      break;
ADDRGP4 $1076
JUMPV
LABELV $1079
line 1623
;1621:
;1622:    case ITEM_ALIGN_RIGHT:
;1623:      textItem.window.rect.x = x + w;
ADDRLP4 8
ADDRLP4 556
INDIRF4
ADDRLP4 576
INDIRF4
ADDF4
ASGNF4
line 1624
;1624:      break;
ADDRGP4 $1076
JUMPV
LABELV $1080
line 1627
;1625:
;1626:    case ITEM_ALIGN_CENTER:
;1627:      textItem.window.rect.x = x + (w / 2);
ADDRLP4 8
ADDRLP4 556
INDIRF4
ADDRLP4 576
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 1628
;1628:      break;
ADDRGP4 $1076
JUMPV
LABELV $1075
line 1631
;1629:
;1630:    default:
;1631:      textItem.window.rect.x = x;
ADDRLP4 8
ADDRLP4 556
INDIRF4
ASGNF4
line 1632
;1632:      break;
LABELV $1076
line 1635
;1633:  }
;1634:
;1635:  textItem.window.rect.y = y;
ADDRLP4 8+4
ADDRLP4 552
INDIRF4
ASGNF4
line 1636
;1636:  textItem.window.rect.w = w;
ADDRLP4 8+8
ADDRLP4 576
INDIRF4
ASGNF4
line 1637
;1637:  textItem.window.rect.h = h;
ADDRLP4 8+12
ADDRLP4 580
INDIRF4
ASGNF4
line 1638
;1638:  textItem.window.borderSize = 0;
ADDRLP4 8+64
CNSTF4 0
ASGNF4
line 1639
;1639:  textItem.textRect.x = 0;
ADDRLP4 8+180
CNSTF4 0
ASGNF4
line 1640
;1640:  textItem.textRect.y = 0;
ADDRLP4 8+180+4
CNSTF4 0
ASGNF4
line 1641
;1641:  textItem.textRect.w = 0;
ADDRLP4 8+180+8
CNSTF4 0
ASGNF4
line 1642
;1642:  textItem.textRect.h = 0;
ADDRLP4 8+180+12
CNSTF4 0
ASGNF4
line 1643
;1643:  textItem.textalignment = pane->align;
ADDRLP4 8+204
ADDRFP4 0
INDIRP4
CNSTI4 4100
ADDP4
INDIRI4
ASGNI4
line 1644
;1644:  textItem.textalignx = text_x;
ADDRLP4 8+208
ADDRFP4 8
INDIRF4
ASGNF4
line 1645
;1645:  textItem.textaligny = text_y;
ADDRLP4 8+212
ADDRFP4 12
INDIRF4
ASGNF4
line 1646
;1646:  textItem.textscale = scale;
ADDRLP4 8+216
ADDRFP4 16
INDIRF4
ASGNF4
line 1647
;1647:  textItem.textStyle = textStyle;
ADDRLP4 8+220
ADDRFP4 24
INDIRI4
ASGNI4
line 1649
;1648:
;1649:  textItem.enableCvar = NULL;
ADDRLP4 8+272
CNSTP4 0
ASGNP4
line 1650
;1650:  textItem.cvarTest = NULL;
ADDRLP4 8+268
CNSTP4 0
ASGNP4
line 1653
;1651:
;1652:  //hack to utilise existing autowrap code
;1653:  Item_Text_AutoWrapped_Paint(&textItem);
ADDRLP4 8
ARGP4
ADDRGP4 Item_Text_AutoWrapped_Paint
CALLV
pop
line 1654
;1654:}
LABELV $1040
endproc UI_DrawInfoPane 1248 20
proc UI_DrawSkill 16 32
line 1658
;1655:
;1656:static void
;1657:UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1658:{
line 1660
;1659:  int i;
;1660:  i = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $1100
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1661
;1661:  if (i < 1 || i > numSkillLevels)
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1103
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1101
LABELV $1103
line 1662
;1662:  {
line 1663
;1663:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1664
;1664:  }
LABELV $1101
line 1665
;1665:  Text_Paint(rect->x, rect->y, scale, color, skillLevels[i - 1], 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1666
;1666:}
LABELV $1099
endproc UI_DrawSkill 16 32
proc UI_DrawTeamName 32 32
line 1670
;1667:
;1668:static void
;1669:UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle)
;1670:{
line 1672
;1671:  int i;
;1672:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1109
ADDRLP4 4
ADDRGP4 $1106
ASGNP4
ADDRGP4 $1110
JUMPV
LABELV $1109
ADDRLP4 4
ADDRGP4 $1107
ASGNP4
LABELV $1110
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1673
;1673:  if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1111
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $1111
line 1674
;1674:  {
line 1675
;1675:    Text_Paint(rect->x, rect->y, scale, color, va(
ADDRGP4 $1114
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1119
ADDRLP4 20
ADDRGP4 $1115
ASGNP4
ADDRGP4 $1120
JUMPV
LABELV $1119
ADDRLP4 20
ADDRGP4 $1116
ASGNP4
LABELV $1120
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1677
;1676:      "%s: %s", (blue) ? "Blue" : "Red", uiInfo.teamList[i].teamName), 0, 0, textStyle);
;1677:  }
LABELV $1111
line 1678
;1678:}
LABELV $1105
endproc UI_DrawTeamName 32 32
proc UI_DrawTeamMember 28 32
line 1682
;1679:
;1680:static void
;1681:UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle)
;1682:{
line 1686
;1683:  // 0 - None
;1684:  // 1 - Human
;1685:  // 2..NumCharacters - Bot
;1686:  int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1125
ADDRLP4 8
ADDRGP4 $1122
ASGNP4
ADDRGP4 $1126
JUMPV
LABELV $1125
ADDRLP4 8
ADDRGP4 $1123
ASGNP4
LABELV $1126
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1688
;1687:  const char *text;
;1688:  if (value <= 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1127
line 1689
;1689:  {
line 1690
;1690:    text = "Closed";
ADDRLP4 4
ADDRGP4 $1129
ASGNP4
line 1691
;1691:  }
ADDRGP4 $1128
JUMPV
LABELV $1127
line 1692
;1692:  else if (value == 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1130
line 1693
;1693:  {
line 1694
;1694:    text = "Human";
ADDRLP4 4
ADDRGP4 $1132
ASGNP4
line 1695
;1695:  }
ADDRGP4 $1131
JUMPV
LABELV $1130
line 1697
;1696:  else
;1697:  {
line 1698
;1698:    value -= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1700
;1699:
;1700:    if (value >= UI_GetNumBots())
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $1133
line 1701
;1701:      value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1133
line 1703
;1702:
;1703:    text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1704
;1704:  }
LABELV $1131
LABELV $1128
line 1705
;1705:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1706
;1706:}
LABELV $1121
endproc UI_DrawTeamMember 28 32
proc UI_DrawMapPreview 20 20
line 1710
;1707:
;1708:static void
;1709:UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net)
;1710:{
line 1711
;1711:  int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1139
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1140
JUMPV
LABELV $1139
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1140
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1712
;1712:  if (map < 0 || map > uiInfo.mapCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1144
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LEI4 $1141
LABELV $1144
line 1713
;1713:  {
line 1714
;1714:    if (net)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1145
line 1715
;1715:    {
line 1716
;1716:      ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1717
;1717:      trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $1148
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1718
;1718:    }
ADDRGP4 $1146
JUMPV
LABELV $1145
line 1720
;1719:    else
;1720:    {
line 1721
;1721:      ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1722
;1722:      trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $1150
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1723
;1723:    }
LABELV $1146
line 1724
;1724:    map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1725
;1725:  }
LABELV $1141
line 1727
;1726:
;1727:  if (uiInfo.mapList[map].levelShot == -1)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1151
line 1728
;1728:  {
line 1729
;1729:    uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1730
;1730:  }
LABELV $1151
line 1732
;1731:
;1732:  if (uiInfo.mapList[map].levelShot > 0)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1159
line 1733
;1733:  {
line 1734
;1734:    UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1735
;1735:  }
ADDRGP4 $1160
JUMPV
LABELV $1159
line 1737
;1736:  else
;1737:  {
line 1738
;1738:    UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip(
ADDRGP4 $1165
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1740
;1739:      "gfx/2d/load_screen"));
;1740:  }
LABELV $1160
line 1741
;1741:}
LABELV $1135
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 32
line 1745
;1742:
;1743:static void
;1744:UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1745:{
line 1747
;1746:  int minutes, seconds, time;
;1747:  if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount)
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $1172
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LEI4 $1167
LABELV $1172
line 1748
;1748:  {
line 1749
;1749:    ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1750
;1750:    trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $1150
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1751
;1751:  }
LABELV $1167
line 1753
;1752:
;1753:  time
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1756
;1754:      = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
;1755:
;1756:  minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1757
;1757:  seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1759
;1758:
;1759:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle);
ADDRGP4 $1180
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1760
;1760:}
LABELV $1166
endproc UI_DrawMapTimeToBeat 20 32
proc UI_DrawMapCinematic 28 24
line 1764
;1761:
;1762:static void
;1763:UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net)
;1764:{
line 1766
;1765:
;1766:  int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1185
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1186
JUMPV
LABELV $1185
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1186
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1767
;1767:  if (map < 0 || map > uiInfo.mapCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1190
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LEI4 $1187
LABELV $1190
line 1768
;1768:  {
line 1769
;1769:    if (net)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1191
line 1770
;1770:    {
line 1771
;1771:      ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1772
;1772:      trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $1148
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1773
;1773:    }
ADDRGP4 $1192
JUMPV
LABELV $1191
line 1775
;1774:    else
;1775:    {
line 1776
;1776:      ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1777
;1777:      trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $1150
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1778
;1778:    }
LABELV $1192
line 1779
;1779:    map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1780
;1780:  }
LABELV $1187
line 1782
;1781:
;1782:  if (uiInfo.mapList[map].cinematic >= -1)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $1195
line 1783
;1783:  {
line 1784
;1784:    if (uiInfo.mapList[map].cinematic == -1)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1199
line 1785
;1785:    {
line 1786
;1786:      uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va(
ADDRGP4 $1007
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1788
;1787:        "%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent));
;1788:    }
LABELV $1199
line 1789
;1789:    if (uiInfo.mapList[map].cinematic >= 0)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1207
line 1790
;1790:    {
line 1791
;1791:      trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1792
;1792:      trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1793
;1793:      trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1794
;1794:    }
ADDRGP4 $1196
JUMPV
LABELV $1207
line 1796
;1795:    else
;1796:    {
line 1797
;1797:      uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
CNSTI4 -2
ASGNI4
line 1798
;1798:    }
line 1799
;1799:  }
ADDRGP4 $1196
JUMPV
LABELV $1195
line 1801
;1800:  else
;1801:  {
line 1802
;1802:    UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1803
;1803:  }
LABELV $1196
line 1804
;1804:}
LABELV $1181
endproc UI_DrawMapCinematic 28 24
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
bss
align 4
LABELV $1220
skip 1276
code
proc UI_DrawPlayerModel 616 28
line 1811
;1805:
;1806:static qboolean updateModel = qtrue;
;1807:static qboolean q3Model = qfalse;
;1808:
;1809:static void
;1810:UI_DrawPlayerModel(rectDef_t *rect)
;1811:{
line 1819
;1812:  static playerInfo_t info;
;1813:  char model[MAX_QPATH];
;1814:  char team[256];
;1815:  char head[256];
;1816:  vec3_t viewangles;
;1817:  vec3_t moveangles;
;1818:
;1819:  if (trap_Cvar_VariableValue("ui_Q3Model"))
ADDRGP4 $1223
ARGP4
ADDRLP4 600
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 600
INDIRF4
CNSTF4 0
EQF4 $1221
line 1820
;1820:  {
line 1821
;1821:    strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $1224
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1822
;1822:    strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $1225
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1823
;1823:    if (!q3Model)
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
NEI4 $1226
line 1824
;1824:    {
line 1825
;1825:      q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 1826
;1826:      updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1827
;1827:    }
LABELV $1226
line 1828
;1828:    team[0] = '\0';
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1829
;1829:  }
ADDRGP4 $1222
JUMPV
LABELV $1221
line 1831
;1830:  else
;1831:  {
line 1833
;1832:
;1833:    strcpy(team, UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1834
;1834:    strcpy(model, UI_Cvar_VariableString("team_model"));
ADDRGP4 $1228
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1835
;1835:    strcpy(head, UI_Cvar_VariableString("team_headmodel"));
ADDRGP4 $1229
ARGP4
ADDRLP4 612
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1836
;1836:    if (q3Model)
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
EQI4 $1230
line 1837
;1837:    {
line 1838
;1838:      q3Model = qfalse;
ADDRGP4 q3Model
CNSTI4 0
ASGNI4
line 1839
;1839:      updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1840
;1840:    }
LABELV $1230
line 1841
;1841:  }
LABELV $1222
line 1842
;1842:  if (updateModel)
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $1232
line 1843
;1843:  {
line 1844
;1844:    memset(&info, 0, sizeof(playerInfo_t));
ADDRGP4 $1220
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1845
;1845:    viewangles[YAW] = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1846
;1846:    viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1847
;1847:    viewangles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1848
;1848:    VectorClear( moveangles );
ADDRLP4 604
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 604
INDIRF4
ASGNF4
line 1849
;1849:    UI_PlayerInfo_SetModel(&info, model, head, team);
ADDRGP4 $1220
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 1850
;1850:    UI_PlayerInfo_SetInfo(
ADDRGP4 $1220
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1853
;1851:      &info, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse);
;1852:    //    UI_RegisterClientModelname( &info, model, head, team);
;1853:    updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 1854
;1854:  }
LABELV $1232
line 1856
;1855:
;1856:  UI_DrawPlayer(rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
ADDRLP4 604
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 604
INDIRP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1220
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 1858
;1857:
;1858:}
LABELV $1219
endproc UI_DrawPlayerModel 616 28
proc UI_DrawNetSource 8 32
line 1862
;1859:
;1860:static void
;1861:UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1862:{
line 1863
;1863:  if (ui_netSource.integer < 0 || ui_netSource.integer > numNetSources)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1244
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LEI4 $1240
LABELV $1244
line 1864
;1864:  {
line 1865
;1865:    ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1866
;1866:  }
LABELV $1240
line 1867
;1867:  Text_Paint(
ADDRGP4 $1246
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1870
;1868:    rect->x, rect->y, scale, color, va("Source: %s", netSources[ui_netSource.integer]), 0, 0,
;1869:    textStyle);
;1870:}
LABELV $1239
endproc UI_DrawNetSource 8 32
proc UI_DrawNetMapPreview 8 20
line 1874
;1871:
;1872:static void
;1873:UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color)
;1874:{
line 1876
;1875:
;1876:  if (uiInfo.serverStatus.currentServerPreview > 0)
ADDRGP4 uiInfo+667904+10428
INDIRI4
CNSTI4 0
LEI4 $1249
line 1877
;1877:  {
line 1878
;1878:    UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
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
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+667904+10428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1879
;1879:  }
ADDRGP4 $1250
JUMPV
LABELV $1249
line 1881
;1880:  else
;1881:  {
line 1882
;1882:    UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip(
ADDRGP4 $1165
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1884
;1883:      "gfx/2d/load_screen"));
;1884:  }
LABELV $1250
line 1885
;1885:}
LABELV $1248
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 1889
;1886:
;1887:static void
;1888:UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color)
;1889:{
line 1890
;1890:  if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount)
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $1261
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LEI4 $1256
LABELV $1261
line 1891
;1891:  {
line 1892
;1892:    ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1893
;1893:    trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $1148
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1894
;1894:  }
LABELV $1256
line 1896
;1895:
;1896:  if (uiInfo.serverStatus.currentServerCinematic >= 0)
ADDRGP4 uiInfo+667904+10432
INDIRI4
CNSTI4 0
LTI4 $1263
line 1897
;1897:  {
line 1898
;1898:    trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+667904+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1899
;1899:    trap_CIN_SetExtents(
ADDRGP4 uiInfo+667904+10432
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1901
;1900:      uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
;1901:    trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+667904+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1902
;1902:  }
ADDRGP4 $1264
JUMPV
LABELV $1263
line 1904
;1903:  else
;1904:  {
line 1905
;1905:    UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 1906
;1906:  }
LABELV $1264
line 1907
;1907:}
LABELV $1255
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 32
line 1911
;1908:
;1909:static void
;1910:UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1911:{
line 1912
;1912:  if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters)
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1278
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1274
LABELV $1278
line 1913
;1913:  {
line 1914
;1914:    ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1915
;1915:  }
LABELV $1274
line 1916
;1916:  Text_Paint(rect->x, rect->y, scale, color, va(
ADDRGP4 $1280
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1918
;1917:    "Filter: %s", serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle);
;1918:}
LABELV $1273
endproc UI_DrawNetFilter 8 32
proc UI_DrawTier 20 32
line 1922
;1919:
;1920:static void
;1921:UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1922:{
line 1924
;1923:  int i;
;1924:  i = trap_Cvar_VariableValue("ui_currentTier");
ADDRGP4 $1283
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1925
;1925:  if (i < 0 || i >= uiInfo.tierCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1287
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95968
INDIRI4
LTI4 $1284
LABELV $1287
line 1926
;1926:  {
line 1927
;1927:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1928
;1928:  }
LABELV $1284
line 1929
;1929:  Text_Paint(
ADDRGP4 $1288
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95972
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1931
;1930:    rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName), 0, 0, textStyle);
;1931:}
LABELV $1282
endproc UI_DrawTier 20 32
proc UI_DrawTierMap 28 20
line 1935
;1932:
;1933:static void
;1934:UI_DrawTierMap(rectDef_t *rect, int index)
;1935:{
line 1937
;1936:  int i;
;1937:  i = trap_Cvar_VariableValue("ui_currentTier");
ADDRGP4 $1283
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1938
;1938:  if (i < 0 || i >= uiInfo.tierCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1294
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95968
INDIRI4
LTI4 $1291
LABELV $1294
line 1939
;1939:  {
line 1940
;1940:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1941
;1941:  }
LABELV $1291
line 1943
;1942:
;1943:  if (uiInfo.tierList[i].mapHandles[index] == -1)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95972+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1295
line 1944
;1944:  {
line 1945
;1945:    uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $1301
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+95972+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+95972+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1947
;1946:      "levelshots/%s", uiInfo.tierList[i].maps[index]));
;1947:  }
LABELV $1295
line 1949
;1948:
;1949:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95972+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1950
;1950:}
LABELV $1290
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 1954
;1951:
;1952:static const char *
;1953:UI_EnglishMapName(const char *map)
;1954:{
line 1956
;1955:  int i;
;1956:  for(i = 0;i < uiInfo.mapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1310
JUMPV
LABELV $1307
line 1957
;1957:  {
line 1958
;1958:    if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0)
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1312
line 1959
;1959:    {
line 1960
;1960:      return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168
ADDP4
INDIRP4
RETP4
ADDRGP4 $1306
JUMPV
LABELV $1312
line 1962
;1961:    }
;1962:  }
LABELV $1308
line 1956
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1310
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LTI4 $1307
line 1963
;1963:  return "";
ADDRGP4 $131
RETP4
LABELV $1306
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 32
line 1968
;1964:}
;1965:
;1966:static void
;1967:UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1968:{
line 1970
;1969:  int i, j;
;1970:  i = trap_Cvar_VariableValue("ui_currentTier");
ADDRGP4 $1283
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1971
;1971:  if (i < 0 || i >= uiInfo.tierCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1321
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95968
INDIRI4
LTI4 $1318
LABELV $1321
line 1972
;1972:  {
line 1973
;1973:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1974
;1974:  }
LABELV $1318
line 1975
;1975:  j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $1150
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1976
;1976:  if (j < 0 || j > MAPS_PER_TIER)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1324
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1322
LABELV $1324
line 1977
;1977:  {
line 1978
;1978:    j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1979
;1979:  }
LABELV $1322
line 1981
;1980:
;1981:  Text_Paint(
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95972+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1983
;1982:    rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle);
;1983:}
LABELV $1317
endproc UI_DrawTierMapName 32 32
proc UI_DrawTierGameType 28 32
line 1987
;1984:
;1985:static void
;1986:UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;1987:{
line 1989
;1988:  int i, j;
;1989:  i = trap_Cvar_VariableValue("ui_currentTier");
ADDRGP4 $1283
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1990
;1990:  if (i < 0 || i >= uiInfo.tierCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1331
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95968
INDIRI4
LTI4 $1328
LABELV $1331
line 1991
;1991:  {
line 1992
;1992:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1993
;1993:  }
LABELV $1328
line 1994
;1994:  j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $1150
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1995
;1995:  if (j < 0 || j > MAPS_PER_TIER)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1334
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1332
LABELV $1334
line 1996
;1996:  {
line 1997
;1997:    j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1998
;1998:  }
LABELV $1332
line 2000
;1999:
;2000:  Text_Paint(
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95972+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2003
;2001:    rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType, 0,
;2002:    0, textStyle);
;2003:}
LABELV $1327
endproc UI_DrawTierGameType 28 32
proc UI_AIFromName 8 8
line 2007
;2004:
;2005:static const char *
;2006:UI_AIFromName(const char *name)
;2007:{
line 2009
;2008:  int j;
;2009:  for(j = 0;j < uiInfo.aliasCount;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1342
JUMPV
LABELV $1339
line 2010
;2010:  {
line 2011
;2011:    if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0)
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74928
ADDP4
INDIRP4
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
NEI4 $1344
line 2012
;2012:    {
line 2013
;2013:      return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74928+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1338
JUMPV
LABELV $1344
line 2015
;2014:    }
;2015:  }
LABELV $1340
line 2009
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1342
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+74924
INDIRI4
LTI4 $1339
line 2016
;2016:  return "James";
ADDRGP4 $1349
RETP4
LABELV $1338
endproc UI_AIFromName 8 8
data
align 4
LABELV updateOpponentModel
byte 4 1
bss
align 4
LABELV $1351
skip 1276
code
proc UI_DrawOpponent 420 28
line 2022
;2017:}
;2018:
;2019:static qboolean updateOpponentModel = qtrue;
;2020:static void
;2021:UI_DrawOpponent(rectDef_t *rect)
;2022:{
line 2030
;2023:  static playerInfo_t info2;
;2024:  char model[MAX_QPATH];
;2025:  char headmodel[MAX_QPATH];
;2026:  char team[256];
;2027:  vec3_t viewangles;
;2028:  vec3_t moveangles;
;2029:
;2030:  if (updateOpponentModel)
ADDRGP4 updateOpponentModel
INDIRI4
CNSTI4 0
EQI4 $1352
line 2031
;2031:  {
line 2033
;2032:
;2033:    strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1354
ARGP4
ADDRLP4 408
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2034
;2034:    strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1354
ARGP4
ADDRLP4 412
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2035
;2035:    team[0] = '\0';
ADDRLP4 152
CNSTI1 0
ASGNI1
line 2037
;2036:
;2037:    memset(&info2, 0, sizeof(playerInfo_t));
ADDRGP4 $1351
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2038
;2038:    viewangles[YAW] = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 2039
;2039:    viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2040
;2040:    viewangles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2041
;2041:    VectorClear( moveangles );
ADDRLP4 416
CNSTF4 0
ASGNF4
ADDRLP4 140+8
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140
ADDRLP4 416
INDIRF4
ASGNF4
line 2042
;2042:    UI_PlayerInfo_SetModel(&info2, model, headmodel, "");
ADDRGP4 $1351
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2043
;2043:    UI_PlayerInfo_SetInfo(
ADDRGP4 $1351
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2045
;2044:      &info2, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse);
;2045:    UI_RegisterClientModelname(&info2, model, headmodel, team);
ADDRGP4 $1351
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2046
;2046:    updateOpponentModel = qfalse;
ADDRGP4 updateOpponentModel
CNSTI4 0
ASGNI4
line 2047
;2047:  }
LABELV $1352
line 2049
;2048:
;2049:  UI_DrawPlayer(rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
ADDRLP4 408
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1351
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 2051
;2050:
;2051:}
LABELV $1350
endproc UI_DrawOpponent 420 28
proc UI_NextOpponent 24 8
line 2055
;2052:
;2053:static void
;2054:UI_NextOpponent(void)
;2055:{
line 2056
;2056:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2057
;2057:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 2058
;2058:  i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2059
;2059:  if (i >= uiInfo.teamCount)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $1362
line 2060
;2060:  {
line 2061
;2061:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2062
;2062:  }
LABELV $1362
line 2063
;2063:  if (i == j)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1365
line 2064
;2064:  {
line 2065
;2065:    i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2066
;2066:    if (i >= uiInfo.teamCount)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $1367
line 2067
;2067:    {
line 2068
;2068:      i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2069
;2069:    }
LABELV $1367
line 2070
;2070:  }
LABELV $1365
line 2071
;2071:  trap_Cvar_Set("ui_opponentName", uiInfo.teamList[i].teamName);
ADDRGP4 $1361
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2072
;2072:}
LABELV $1360
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 2076
;2073:
;2074:static void
;2075:UI_PriorOpponent(void)
;2076:{
line 2077
;2077:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2078
;2078:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 2079
;2079:  i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2080
;2080:  if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1372
line 2081
;2081:  {
line 2082
;2082:    i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75696
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2083
;2083:  }
LABELV $1372
line 2084
;2084:  if (i == j)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1375
line 2085
;2085:  {
line 2086
;2086:    i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2087
;2087:    if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1377
line 2088
;2088:    {
line 2089
;2089:      i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75696
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2090
;2090:    }
LABELV $1377
line 2091
;2091:  }
LABELV $1375
line 2092
;2092:  trap_Cvar_Set("ui_opponentName", uiInfo.teamList[i].teamName);
ADDRGP4 $1361
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2093
;2093:}
LABELV $1371
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 2097
;2094:
;2095:static void
;2096:UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color)
;2097:{
line 2098
;2098:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2100
;2099:
;2100:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1382
line 2101
;2101:  {
line 2102
;2102:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2103
;2103:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2105
;2104:      "%s_metal", uiInfo.teamList[i].imageName));
;2105:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2107
;2106:      "%s_name", uiInfo.teamList[i].imageName));
;2107:  }
LABELV $1382
line 2109
;2108:
;2109:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2110
;2110:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2111
;2111:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2112
;2112:}
LABELV $1381
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 2116
;2113:
;2114:static void
;2115:UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color)
;2116:{
line 2117
;2117:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2118
;2118:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1401
line 2119
;2119:  {
line 2120
;2120:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2121
;2121:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2123
;2122:      "%s_metal", uiInfo.teamList[i].imageName));
;2123:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2125
;2124:      "%s_name", uiInfo.teamList[i].imageName));
;2125:  }
LABELV $1401
line 2127
;2126:
;2127:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2128
;2128:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2129
;2129:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2130
;2130:}
LABELV $1400
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 2134
;2131:
;2132:static void
;2133:UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color)
;2134:{
line 2135
;2135:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2136
;2136:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1420
line 2137
;2137:  {
line 2138
;2138:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2139
;2139:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2141
;2140:      "%s_metal", uiInfo.teamList[i].imageName));
;2141:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2143
;2142:      "%s_name", uiInfo.teamList[i].imageName));
;2143:  }
LABELV $1420
line 2145
;2144:
;2145:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2146
;2146:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2147
;2147:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2148
;2148:}
LABELV $1419
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 2152
;2149:
;2150:static void
;2151:UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color)
;2152:{
line 2153
;2153:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2154
;2154:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1439
line 2155
;2155:  {
line 2156
;2156:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2157
;2157:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2159
;2158:      "%s_metal", uiInfo.teamList[i].imageName));
;2159:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2161
;2160:      "%s_name", uiInfo.teamList[i].imageName));
;2161:  }
LABELV $1439
line 2163
;2162:
;2163:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2164
;2164:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2165
;2165:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2166
;2166:}
LABELV $1438
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 2170
;2167:
;2168:static void
;2169:UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color)
;2170:{
line 2171
;2171:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2172
;2172:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1458
line 2173
;2173:  {
line 2174
;2174:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2175
;2175:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2177
;2176:      "%s_metal", uiInfo.teamList[i].imageName));
;2177:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2179
;2178:      "%s_name", uiInfo.teamList[i].imageName));
;2179:  }
LABELV $1458
line 2181
;2180:
;2181:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2182
;2182:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2183
;2183:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2184
;2184:}
LABELV $1457
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 2188
;2185:
;2186:static void
;2187:UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color)
;2188:{
line 2189
;2189:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2190
;2190:  if (uiInfo.teamList[i].teamIcon == -1)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1477
line 2191
;2191:  {
line 2192
;2192:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75700+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2193
;2193:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $983
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75700+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2195
;2194:      "%s_metal", uiInfo.teamList[i].imageName));
;2195:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $988
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75700+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2197
;2196:      "%s_name", uiInfo.teamList[i].imageName));
;2197:  }
LABELV $1477
line 2199
;2198:
;2199:  trap_R_SetColor(color);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2200
;2200:  UI_DrawHandlePic(rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2201
;2201:  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2202
;2202:}
LABELV $1476
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 32
line 2206
;2203:
;2204:static void
;2205:UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net)
;2206:{
line 2207
;2207:  int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1499
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1500
JUMPV
LABELV $1499
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1500
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2208
;2208:  if (map >= 0 && map < uiInfo.mapCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1501
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
GEI4 $1501
line 2209
;2209:  {
line 2210
;2210:    Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2211
;2211:  }
LABELV $1501
line 2212
;2212:}
LABELV $1495
endproc UI_DrawAllMapsSelection 16 32
proc UI_DrawOpponentName 8 32
line 2216
;2213:
;2214:static void
;2215:UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2216:{
line 2217
;2217:  Text_Paint(
ADDRGP4 $1361
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2219
;2218:    rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle);
;2219:}
LABELV $1505
endproc UI_DrawOpponentName 8 32
proc UI_OwnerDrawWidth 112 12
line 2223
;2220:
;2221:static int
;2222:UI_OwnerDrawWidth(int ownerDraw, float scale)
;2223:{
line 2226
;2224:  int i, h, value;
;2225:  const char *text;
;2226:  const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2228
;2227:
;2228:  switch(ownerDraw)
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 200
LTI4 $1508
ADDRLP4 20
INDIRI4
CNSTI4 247
GTI4 $1578
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1579-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1579
address $1509
address $1508
address $1508
address $1510
address $1508
address $1511
address $1508
address $1514
address $1519
address $1524
address $1529
address $1529
address $1529
address $1529
address $1529
address $1539
address $1539
address $1539
address $1539
address $1539
address $1548
address $1508
address $1557
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1508
address $1575
code
LABELV $1578
ADDRFP4 0
INDIRI4
CNSTI4 250
EQI4 $1570
ADDRGP4 $1508
JUMPV
line 2229
;2229:  {
LABELV $1509
line 2231
;2230:    case UI_HANDICAP:
;2231:      h = Com_Clamp(5, 100, trap_Cvar_VariableValue("handicap"));
ADDRGP4 $923
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 2232
;2232:      i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 2233
;2233:      s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 2234
;2234:      break;
ADDRGP4 $1508
JUMPV
LABELV $1510
line 2236
;2235:    case UI_CLANNAME:
;2236:      s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $925
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 2237
;2237:      break;
ADDRGP4 $1508
JUMPV
LABELV $1511
line 2239
;2238:    case UI_GAMETYPE:
;2239:      s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520
ADDP4
INDIRP4
ASGNP4
line 2240
;2240:      break;
ADDRGP4 $1508
JUMPV
LABELV $1514
line 2242
;2241:    case UI_SKILL:
;2242:      i = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $1100
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 2243
;2243:      if (i < 1 || i > numSkillLevels)
ADDRLP4 40
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $1517
ADDRLP4 40
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1515
LABELV $1517
line 2244
;2244:      {
line 2245
;2245:        i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2246
;2246:      }
LABELV $1515
line 2247
;2247:      s = skillLevels[i - 1];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ASGNP4
line 2248
;2248:      break;
ADDRGP4 $1508
JUMPV
LABELV $1519
line 2250
;2249:    case UI_BLUETEAMNAME:
;2250:      i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $1106
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 2251
;2251:      if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $1508
ADDRLP4 52
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $1508
line 2252
;2252:      {
line 2253
;2253:        s = va("%s: %s", "Blue", uiInfo.teamList[i].teamName);
ADDRGP4 $1114
ARGP4
ADDRGP4 $1115
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 2254
;2254:      }
line 2255
;2255:      break;
ADDRGP4 $1508
JUMPV
LABELV $1524
line 2257
;2256:    case UI_REDTEAMNAME:
;2257:      i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $1107
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 2258
;2258:      if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $1508
ADDRLP4 64
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $1508
line 2259
;2259:      {
line 2260
;2260:        s = va("%s: %s", "Red", uiInfo.teamList[i].teamName);
ADDRGP4 $1114
ARGP4
ADDRGP4 $1116
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 2261
;2261:      }
line 2262
;2262:      break;
ADDRGP4 $1508
JUMPV
LABELV $1529
line 2268
;2263:    case UI_BLUETEAM1:
;2264:    case UI_BLUETEAM2:
;2265:    case UI_BLUETEAM3:
;2266:    case UI_BLUETEAM4:
;2267:    case UI_BLUETEAM5:
;2268:      value = trap_Cvar_VariableValue(va("ui_blueteam%i", ownerDraw - UI_BLUETEAM1 + 1));
ADDRGP4 $1122
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 2269
;2269:      if (value <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1530
line 2270
;2270:      {
line 2271
;2271:        text = "Closed";
ADDRLP4 12
ADDRGP4 $1129
ASGNP4
line 2272
;2272:      }
ADDRGP4 $1531
JUMPV
LABELV $1530
line 2273
;2273:      else if (value == 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1532
line 2274
;2274:      {
line 2275
;2275:        text = "Human";
ADDRLP4 12
ADDRGP4 $1132
ASGNP4
line 2276
;2276:      }
ADDRGP4 $1533
JUMPV
LABELV $1532
line 2278
;2277:      else
;2278:      {
line 2279
;2279:        value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2280
;2280:        if (value >= uiInfo.aliasCount)
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74924
INDIRI4
LTI4 $1534
line 2281
;2281:        {
line 2282
;2282:          value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2283
;2283:        }
LABELV $1534
line 2284
;2284:        text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74928
ADDP4
INDIRP4
ASGNP4
line 2285
;2285:      }
LABELV $1533
LABELV $1531
line 2286
;2286:      s = va("%i. %s", ownerDraw - UI_BLUETEAM1 + 1, text);
ADDRGP4 $1538
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 2287
;2287:      break;
ADDRGP4 $1508
JUMPV
LABELV $1539
line 2293
;2288:    case UI_REDTEAM1:
;2289:    case UI_REDTEAM2:
;2290:    case UI_REDTEAM3:
;2291:    case UI_REDTEAM4:
;2292:    case UI_REDTEAM5:
;2293:      value = trap_Cvar_VariableValue(va("ui_redteam%i", ownerDraw - UI_REDTEAM1 + 1));
ADDRGP4 $1123
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 2294
;2294:      if (value <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1540
line 2295
;2295:      {
line 2296
;2296:        text = "Closed";
ADDRLP4 12
ADDRGP4 $1129
ASGNP4
line 2297
;2297:      }
ADDRGP4 $1541
JUMPV
LABELV $1540
line 2298
;2298:      else if (value == 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1542
line 2299
;2299:      {
line 2300
;2300:        text = "Human";
ADDRLP4 12
ADDRGP4 $1132
ASGNP4
line 2301
;2301:      }
ADDRGP4 $1543
JUMPV
LABELV $1542
line 2303
;2302:      else
;2303:      {
line 2304
;2304:        value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2305
;2305:        if (value >= uiInfo.aliasCount)
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74924
INDIRI4
LTI4 $1544
line 2306
;2306:        {
line 2307
;2307:          value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2308
;2308:        }
LABELV $1544
line 2309
;2309:        text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74928
ADDP4
INDIRP4
ASGNP4
line 2310
;2310:      }
LABELV $1543
LABELV $1541
line 2311
;2311:      s = va("%i. %s", ownerDraw - UI_REDTEAM1 + 1, text);
ADDRGP4 $1538
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 2312
;2312:      break;
ADDRGP4 $1508
JUMPV
LABELV $1548
line 2314
;2313:    case UI_NETSOURCE:
;2314:      if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numJoinGameTypes)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1554
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+78648
INDIRI4
LEI4 $1549
LABELV $1554
line 2315
;2315:      {
line 2316
;2316:        ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2317
;2317:      }
LABELV $1549
line 2318
;2318:      s = va("Source: %s", netSources[ui_netSource.integer]);
ADDRGP4 $1246
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
ASGNP4
line 2319
;2319:      break;
ADDRGP4 $1508
JUMPV
LABELV $1557
line 2321
;2320:    case UI_NETFILTER:
;2321:      if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters)
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1562
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1558
LABELV $1562
line 2322
;2322:      {
line 2323
;2323:        ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2324
;2324:      }
LABELV $1558
line 2325
;2325:      s = va("Filter: %s", serverFilters[ui_serverFilterType.integer].description);
ADDRGP4 $1280
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 2326
;2326:      break;
ADDRGP4 $1508
JUMPV
line 2328
;2327:    case UI_TIER:
;2328:      break;
line 2330
;2329:    case UI_TIER_MAPNAME:
;2330:      break;
line 2332
;2331:    case UI_TIER_GAMETYPE:
;2332:      break;
line 2334
;2333:    case UI_ALLMAPS_SELECTION:
;2334:      break;
line 2336
;2335:    case UI_OPPONENT_NAME:
;2336:      break;
LABELV $1570
line 2338
;2337:    case UI_KEYBINDSTATUS:
;2338:      if (Display_KeyBindPending())
ADDRLP4 100
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1571
line 2339
;2339:      {
line 2340
;2340:        s = "Waiting for new key... Press ESCAPE to cancel";
ADDRLP4 0
ADDRGP4 $1573
ASGNP4
line 2341
;2341:      }
ADDRGP4 $1508
JUMPV
LABELV $1571
line 2343
;2342:      else
;2343:      {
line 2344
;2344:        s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
ADDRLP4 0
ADDRGP4 $1574
ASGNP4
line 2345
;2345:      }
line 2346
;2346:      break;
ADDRGP4 $1508
JUMPV
LABELV $1575
line 2348
;2347:    case UI_SERVERREFRESHDATE:
;2348:      s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1576
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 2349
;2349:      break;
line 2351
;2350:    default:
;2351:      break;
LABELV $1508
line 2354
;2352:  }
;2353:
;2354:  if (s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1581
line 2355
;2355:  {
line 2356
;2356:    return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1506
JUMPV
LABELV $1581
line 2358
;2357:  }
;2358:  return 0;
CNSTI4 0
RETI4
LABELV $1506
endproc UI_OwnerDrawWidth 112 12
proc UI_DrawBotName 20 32
line 2363
;2359:}
;2360:
;2361:static void
;2362:UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2363:{
line 2364
;2364:  int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+73384
INDIRI4
ASGNI4
line 2365
;2365:  const char *text = "";
ADDRLP4 4
ADDRGP4 $131
ASGNP4
line 2367
;2366:
;2367:  if (value >= UI_GetNumBots())
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1585
line 2368
;2368:    value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1585
line 2370
;2369:
;2370:  text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 2372
;2371:
;2372:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2373
;2373:}
LABELV $1583
endproc UI_DrawBotName 20 32
proc UI_DrawBotSkill 4 32
line 2377
;2374:
;2375:static void
;2376:UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2377:{
line 2378
;2378:  if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels)
ADDRGP4 uiInfo+96612
INDIRI4
CNSTI4 0
LTI4 $1588
ADDRGP4 uiInfo+96612
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1588
line 2379
;2379:  {
line 2380
;2380:    Text_Paint(rect->x, rect->y, scale, color, skillLevels[uiInfo.skillIndex], 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+96612
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2381
;2381:  }
LABELV $1588
line 2382
;2382:}
LABELV $1587
endproc UI_DrawBotSkill 4 32
proc UI_DrawRedBlue 8 32
line 2386
;2383:
;2384:static void
;2385:UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2386:{
line 2387
;2387:  Text_Paint(
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+78780
INDIRI4
CNSTI4 0
NEI4 $1596
ADDRLP4 0
ADDRGP4 $1116
ASGNP4
ADDRGP4 $1597
JUMPV
LABELV $1596
ADDRLP4 0
ADDRGP4 $1115
ASGNP4
LABELV $1597
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2389
;2388:    rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Red" : "Blue", 0, 0, textStyle);
;2389:}
LABELV $1593
endproc UI_DrawRedBlue 8 32
proc UI_BuildPlayerList 4176 12
line 2398
;2390:
;2391:/*
;2392: ===============
;2393: UI_BuildPlayerList
;2394: ===============
;2395: */
;2396:static void
;2397:UI_BuildPlayerList(void)
;2398:{
line 2403
;2399:  uiClientState_t cs;
;2400:  int n, count, team, team2, playerTeamNumber;
;2401:  char info[MAX_INFO_STRING];
;2402:
;2403:  trap_GetClientState(&cs);
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 2404
;2404:  trap_GetConfigString(CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING);
ADDRLP4 1040+8
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2405
;2405:  uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+78804
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 2406
;2406:  uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1603
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+78808
ADDRLP4 4132
INDIRI4
ASGNI4
line 2407
;2407:  team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1604
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 2408
;2408:  trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2409
;2409:  count = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 4
ARGP4
ADDRGP4 $1605
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 2410
;2410:  uiInfo.playerCount = 0;
ADDRGP4 uiInfo+78784
CNSTI4 0
ASGNI4
line 2411
;2411:  uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+78788
CNSTI4 0
ASGNI4
line 2412
;2412:  playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 2413
;2413:  for(n = 0;n < count;n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1611
JUMPV
LABELV $1608
line 2414
;2414:  {
line 2415
;2415:    trap_GetConfigString(CS_PLAYERS + n, info, MAX_INFO_STRING);
ADDRLP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2417
;2416:
;2417:    if (info[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1612
line 2418
;2418:    {
line 2419
;2419:      Q_strncpyz(
ADDRLP4 4
ARGP4
ADDRGP4 $1616
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78784
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78812
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2421
;2420:        uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey(info, "n"), MAX_NAME_LENGTH);
;2421:      Q_CleanStr(uiInfo.playerNames[uiInfo.playerCount]);
ADDRGP4 uiInfo+78784
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78812
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2422
;2422:      uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+78784
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2423
;2423:      team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1604
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 2424
;2424:      if (team2 == team)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1620
line 2425
;2425:      {
line 2426
;2426:        Q_strncpyz(
ADDRLP4 4
ARGP4
ADDRGP4 $1616
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78788
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2428
;2427:          uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey(info, "n"), MAX_NAME_LENGTH);
;2428:        Q_CleanStr(uiInfo.teamNames[uiInfo.myTeamCount]);
ADDRGP4 uiInfo+78788
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2429
;2429:        uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+78788
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82908
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2430
;2430:        if (uiInfo.playerNumber == n)
ADDRGP4 uiInfo+78804
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1628
line 2431
;2431:        {
line 2432
;2432:          playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+78788
INDIRI4
ASGNI4
line 2433
;2433:        }
LABELV $1628
line 2434
;2434:        uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+78788
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2435
;2435:      }
LABELV $1620
line 2436
;2436:    }
LABELV $1612
line 2437
;2437:  }
LABELV $1609
line 2413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1611
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1608
line 2439
;2438:
;2439:  if (!uiInfo.teamLeader)
ADDRGP4 uiInfo+78808
INDIRI4
CNSTI4 0
NEI4 $1633
line 2440
;2440:  {
line 2441
;2441:    trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $930
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1636
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2442
;2442:  }
LABELV $1633
line 2444
;2443:
;2444:  n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1636
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 2445
;2445:  if (n < 0 || n > uiInfo.myTeamCount)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1640
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
LEI4 $1637
LABELV $1640
line 2446
;2446:  {
line 2447
;2447:    n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2448
;2448:  }
LABELV $1637
line 2449
;2449:  if (n < uiInfo.myTeamCount)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $1641
line 2450
;2450:  {
line 2451
;2451:    trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $1644
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2452
;2452:  }
LABELV $1641
line 2453
;2453:}
LABELV $1598
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 16 32
line 2457
;2454:
;2455:static void
;2456:UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2457:{
line 2458
;2458:  if (uiInfo.uiDC.realTime > uiInfo.playerRefresh)
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78796
INDIRI4
LEI4 $1647
line 2459
;2459:  {
line 2460
;2460:    uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78796
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2461
;2461:    UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2462
;2462:  }
LABELV $1647
line 2463
;2463:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.teamLeader) ? UI_Cvar_VariableString(
ADDRGP4 uiInfo+78808
INDIRI4
CNSTI4 0
EQI4 $1655
ADDRGP4 $1644
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $1656
JUMPV
LABELV $1655
ADDRGP4 $710
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $1656
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2465
;2464:    "cg_selectedPlayerName") : UI_Cvar_VariableString("name"), 0, 0, textStyle);
;2465:}
LABELV $1646
endproc UI_DrawSelectedPlayer 16 32
proc UI_DrawServerRefreshDate 80 32
line 2469
;2466:
;2467:static void
;2468:UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2469:{
line 2470
;2470:  if (uiInfo.serverStatus.refreshActive)
ADDRGP4 uiInfo+667904+2212
INDIRI4
CNSTI4 0
EQI4 $1658
line 2471
;2471:  {
line 2473
;2472:    vec4_t lowLight, newColor;
;2473:    lowLight[0] = 0.8 * color[0];
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2474
;2474:    lowLight[1] = 0.8 * color[1];
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2475
;2475:    lowLight[2] = 0.8 * color[2];
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2476
;2476:    lowLight[3] = 0.8 * color[3];
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 2477
;2477:    LerpColor(color, lowLight, newColor, 0.5 + 0.5 * sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 2478
;2478:    Text_Paint(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 $1666
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2482
;2479:      rect->x, rect->y, scale, newColor, va(
;2480:        "Getting info for %d servers (ESC to cancel)",
;2481:        trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
;2482:  }
ADDRGP4 $1659
JUMPV
LABELV $1658
line 2484
;2483:  else
;2484:  {
line 2486
;2485:    char buff[64];
;2486:    Q_strncpyz(
ADDRGP4 $1576
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2488
;2487:      buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
;2488:    Text_Paint(rect->x, rect->y, scale, color, va("Refresh Time: %s", buff), 0, 0, textStyle);
ADDRGP4 $1669
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2489
;2489:  }
LABELV $1659
line 2490
;2490:}
LABELV $1657
endproc UI_DrawServerRefreshDate 80 32
proc UI_DrawServerMOTD 24 32
line 2494
;2491:
;2492:static void
;2493:UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color)
;2494:{
line 2495
;2495:  if (uiInfo.serverStatus.motdLen)
ADDRGP4 uiInfo+667904+10436
INDIRI4
CNSTI4 0
EQI4 $1671
line 2496
;2496:  {
line 2499
;2497:    float maxX;
;2498:
;2499:    if (uiInfo.serverStatus.motdWidth == -1)
ADDRGP4 uiInfo+667904+10440
INDIRI4
CNSTI4 -1
NEI4 $1675
line 2500
;2500:    {
line 2501
;2501:      uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+667904+10440
CNSTI4 0
ASGNI4
line 2502
;2502:      uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+667904+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2503
;2503:      uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+667904+10448
CNSTI4 -1
ASGNI4
line 2504
;2504:    }
LABELV $1675
line 2506
;2505:
;2506:    if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen)
ADDRGP4 uiInfo+667904+10452
INDIRI4
ADDRGP4 uiInfo+667904+10436
INDIRI4
LEI4 $1685
line 2507
;2507:    {
line 2508
;2508:      uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+667904+10452
CNSTI4 0
ASGNI4
line 2509
;2509:      uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+667904+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2510
;2510:      uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+667904+10448
CNSTI4 -1
ASGNI4
line 2511
;2511:    }
LABELV $1685
line 2513
;2512:
;2513:    if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime)
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+667904+10456
INDIRI4
LEI4 $1697
line 2514
;2514:    {
line 2515
;2515:      uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+667904+10456
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2516
;2516:      if (uiInfo.serverStatus.motdPaintX <= rect->x + 2)
ADDRGP4 uiInfo+667904+10444
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1705
line 2517
;2517:      {
line 2518
;2518:        if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen)
ADDRGP4 uiInfo+667904+10452
INDIRI4
ADDRGP4 uiInfo+667904+10436
INDIRI4
GEI4 $1709
line 2519
;2519:        {
line 2520
;2520:          uiInfo.serverStatus.motdPaintX += Text_Width(
ADDRGP4 uiInfo+667904+10452
INDIRI4
ADDRGP4 uiInfo+667904+10460
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+667904+10444
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 2522
;2521:            &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
;2522:          uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+667904+10452
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2523
;2523:        }
ADDRGP4 $1706
JUMPV
LABELV $1709
line 2525
;2524:        else
;2525:        {
line 2526
;2526:          uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+667904+10452
CNSTI4 0
ASGNI4
line 2527
;2527:          if (uiInfo.serverStatus.motdPaintX2 >= 0)
ADDRGP4 uiInfo+667904+10448
INDIRI4
CNSTI4 0
LTI4 $1725
line 2528
;2528:          {
line 2529
;2529:            uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+667904+10444
ADDRGP4 uiInfo+667904+10448
INDIRI4
ASGNI4
line 2530
;2530:          }
ADDRGP4 $1726
JUMPV
LABELV $1725
line 2532
;2531:          else
;2532:          {
line 2533
;2533:            uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+667904+10444
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2534
;2534:          }
LABELV $1726
line 2535
;2535:          uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+667904+10448
CNSTI4 -1
ASGNI4
line 2536
;2536:        }
line 2537
;2537:      }
ADDRGP4 $1706
JUMPV
LABELV $1705
line 2539
;2538:      else
;2539:      {
line 2541
;2540:        //serverStatus.motdPaintX--;
;2541:        uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+667904+10444
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2542
;2542:        if (uiInfo.serverStatus.motdPaintX2 >= 0)
ADDRGP4 uiInfo+667904+10448
INDIRI4
CNSTI4 0
LTI4 $1739
line 2543
;2543:        {
line 2545
;2544:          //serverStatus.motdPaintX2--;
;2545:          uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+667904+10448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2546
;2546:        }
LABELV $1739
line 2547
;2547:      }
LABELV $1706
line 2548
;2548:    }
LABELV $1697
line 2550
;2549:
;2550:    maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2551
;2551:    Text_Paint_Limit(
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+667904+10444
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+667904+10452
INDIRI4
ADDRGP4 uiInfo+667904+10460
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2554
;2552:      &maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color,
;2553:      &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0);
;2554:    if (uiInfo.serverStatus.motdPaintX2 >= 0)
ADDRGP4 uiInfo+667904+10448
INDIRI4
CNSTI4 0
LTI4 $1751
line 2555
;2555:    {
line 2556
;2556:      float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2557
;2557:      Text_Paint_Limit(
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+667904+10448
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+667904+10460
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+667904+10452
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2560
;2558:        &maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color,
;2559:        uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset);
;2560:    }
LABELV $1751
line 2561
;2561:    if (uiInfo.serverStatus.motdOffset && maxX > 0)
ADDRGP4 uiInfo+667904+10452
INDIRI4
CNSTI4 0
EQI4 $1761
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1761
line 2562
;2562:    {
line 2564
;2563:      // if we have an offset ( we are skipping the first part of the string ) and we fit the string
;2564:      if (uiInfo.serverStatus.motdPaintX2 == -1)
ADDRGP4 uiInfo+667904+10448
INDIRI4
CNSTI4 -1
NEI4 $1762
line 2565
;2565:      {
line 2566
;2566:        uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+667904+10448
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2567
;2567:      }
line 2568
;2568:    }
ADDRGP4 $1762
JUMPV
LABELV $1761
line 2570
;2569:    else
;2570:    {
line 2571
;2571:      uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+667904+10448
CNSTI4 -1
ASGNI4
line 2572
;2572:    }
LABELV $1762
line 2574
;2573:
;2574:  }
LABELV $1671
line 2575
;2575:}
LABELV $1670
endproc UI_DrawServerMOTD 24 32
proc UI_DrawKeyBindStatus 8 32
line 2579
;2576:
;2577:static void
;2578:UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2579:{
line 2581
;2580:  //  int ofs = 0; TTimo: unused
;2581:  if (Display_KeyBindPending())
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1774
line 2582
;2582:  {
line 2583
;2583:    Text_Paint(
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1573
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2586
;2584:      rect->x, rect->y, scale, color, "Waiting for new key... Press ESCAPE to cancel", 0, 0,
;2585:      textStyle);
;2586:  }
ADDRGP4 $1775
JUMPV
LABELV $1774
line 2588
;2587:  else
;2588:  {
line 2589
;2589:    Text_Paint(
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1574
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2592
;2590:      rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear",
;2591:      0, 0, textStyle);
;2592:  }
LABELV $1775
line 2593
;2593:}
LABELV $1773
endproc UI_DrawKeyBindStatus 8 32
proc UI_DrawGLInfo 1336 32
line 2597
;2594:
;2595:static void
;2596:UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle)
;2597:{
line 2603
;2598:  char * eptr;
;2599:  char buff[1024];
;2600:  const char *lines[64];
;2601:  int y, numLines, i;
;2602:
;2603:  Text_Paint(rect->x + 2, rect->y, scale, color, va(
ADDRGP4 $1777
ARGP4
ADDRGP4 uiInfo+61996+1024
ARGP4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2605
;2604:    "VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle);
;2605:  Text_Paint(
ADDRGP4 $1780
ARGP4
ADDRGP4 uiInfo+61996+2048
ARGP4
ADDRGP4 uiInfo+61996
ARGP4
ADDRLP4 1304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1308
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1308
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2612
;2606:    rect->x + 2,
;2607:    rect->y + 15,
;2608:    scale,
;2609:    color,
;2610:    va("VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string, uiInfo.uiDC.glconfig.renderer_string),
;2611:    0, 30, textStyle);
;2612:  Text_Paint(rect->x + 2, rect->y + 30, scale, color, va(
ADDRGP4 $1784
ARGP4
ADDRGP4 uiInfo+61996+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+61996+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+61996+11280
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1316
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1316
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1312
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2620
;2613:    "PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits,
;2614:    uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle);
;2615:
;2616:  // build null terminated extension strings
;2617:  // TTimo: https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;2618:  // in TA this was not directly crashing, but displaying a nasty broken shader right in the middle
;2619:  // brought down the string size to 1024, there's not much that can be shown on the screen anyway
;2620:  Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 1024);
ADDRLP4 272
ARGP4
ADDRGP4 uiInfo+61996+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2621
;2621:  eptr = buff;
ADDRLP4 0
ADDRLP4 272
ASGNP4
line 2622
;2622:  y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 2623
;2623:  numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1794
JUMPV
line 2625
;2624:  while(y < rect->y + rect->h && *eptr)
;2625:  {
LABELV $1796
line 2627
;2626:    while(*eptr && *eptr == ' ')
;2627:      *eptr++ = '\0';
ADDRLP4 1320
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1320
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1797
line 2626
ADDRLP4 1324
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
EQI4 $1799
ADDRLP4 1324
INDIRI4
CNSTI4 32
EQI4 $1796
LABELV $1799
line 2630
;2628:
;2629:    // track start of valid string
;2630:    if (*eptr && *eptr != ' ')
ADDRLP4 1328
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
EQI4 $1803
ADDRLP4 1328
INDIRI4
CNSTI4 32
EQI4 $1803
line 2631
;2631:    {
line 2632
;2632:      lines[numLines++] = eptr;
ADDRLP4 1332
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 1332
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2633
;2633:    }
ADDRGP4 $1803
JUMPV
LABELV $1802
line 2636
;2634:
;2635:    while(*eptr && *eptr != ' ')
;2636:      eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1803
line 2635
ADDRLP4 1332
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
EQI4 $1805
ADDRLP4 1332
INDIRI4
CNSTI4 32
NEI4 $1802
LABELV $1805
line 2637
;2637:  }
LABELV $1794
line 2624
ADDRLP4 1320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1320
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1320
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1806
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1797
LABELV $1806
line 2639
;2638:
;2639:  i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1808
JUMPV
LABELV $1807
line 2641
;2640:  while(i < numLines)
;2641:  {
line 2642
;2642:    Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1324
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1324
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2643
;2643:    if (i < numLines)
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1810
line 2644
;2644:    {
line 2645
;2645:      Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRLP4 1332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1332
INDIRP4
INDIRF4
ADDRLP4 1332
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1328
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1328
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2646
;2646:    }
LABELV $1810
line 2647
;2647:    y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2648
;2648:    if (y > rect->y + rect->h - 11)
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1328
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1328
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1812
line 2649
;2649:    {
line 2650
;2650:      break;
ADDRGP4 $1809
JUMPV
LABELV $1812
line 2652
;2651:    }
;2652:  }
LABELV $1808
line 2640
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1807
LABELV $1809
line 2654
;2653:
;2654:}
LABELV $1776
endproc UI_DrawGLInfo 1336 32
proc UI_OwnerDraw 60 28
line 2662
;2655:
;2656:// FIXME: table drive
;2657://
;2658:static void
;2659:UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw,
;2660:  int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader,
;2661:  int textStyle)
;2662:{
line 2664
;2663:  rectDef_t rect;
;2664:  tremInfoPane_t *pane = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 2666
;2665:
;2666:  rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 2667
;2667:  rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 2668
;2668:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 2669
;2669:  rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 2671
;2670:
;2671:  switch(ownerDraw)
ADDRLP4 20
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 200
LTI4 $1819
ADDRLP4 20
INDIRI4
CNSTI4 265
GTI4 $1819
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1914-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1914
address $1868
address $1819
address $1869
address $1870
address $1871
address $1874
address $1877
address $1881
address $1882
address $1883
address $1884
address $1884
address $1884
address $1884
address $1884
address $1885
address $1885
address $1885
address $1885
address $1885
address $1886
address $1887
address $1889
address $1890
address $1891
address $1892
address $1893
address $1894
address $1895
address $1898
address $1896
address $1899
address $1897
address $1900
address $1901
address $1902
address $1903
address $1905
address $1819
address $1906
address $1907
address $1908
address $1819
address $1909
address $1879
address $1875
address $1888
address $1910
address $1911
address $1912
address $1913
address $1872
address $1878
address $1876
address $1873
address $1880
address $1904
address $1819
address $1820
address $1826
address $1832
address $1838
address $1844
address $1850
address $1856
address $1862
code
line 2672
;2672:  {
LABELV $1820
line 2674
;2673:    case UI_TEAMINFOPANE:
;2674:      if ((pane = uiInfo.tremTeamList[uiInfo.tremTeamIndex].infopane))
ADDRLP4 24
CNSTI4 12
ADDRGP4 uiInfo+666044
INDIRI4
MULI4
ADDRGP4 uiInfo+665992+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2675
;2675:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2676
;2676:      break;
ADDRGP4 $1819
JUMPV
LABELV $1826
line 2679
;2677:
;2678:    case UI_ACLASSINFOPANE:
;2679:      if ((pane = uiInfo.tremAlienClassList[uiInfo.tremAlienClassIndex].infopane))
ADDRLP4 28
CNSTI4 12
ADDRGP4 uiInfo+666088
INDIRI4
MULI4
ADDRGP4 uiInfo+666048+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2680
;2680:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2681
;2681:      break;
ADDRGP4 $1819
JUMPV
LABELV $1832
line 2684
;2682:
;2683:    case UI_AUPGRADEINFOPANE:
;2684:      if ((pane = uiInfo.tremAlienUpgradeList[uiInfo.tremAlienUpgradeIndex].infopane))
ADDRLP4 32
CNSTI4 12
ADDRGP4 uiInfo+667116
INDIRI4
MULI4
ADDRGP4 uiInfo+666920+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2685
;2685:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2686
;2686:      break;
ADDRGP4 $1819
JUMPV
LABELV $1838
line 2689
;2687:
;2688:    case UI_HITEMINFOPANE:
;2689:      if ((pane = uiInfo.tremHumanItemList[uiInfo.tremHumanItemIndex].infopane))
ADDRLP4 36
CNSTI4 12
ADDRGP4 uiInfo+666132
INDIRI4
MULI4
ADDRGP4 uiInfo+666092+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2690
;2690:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2691
;2691:      break;
ADDRGP4 $1819
JUMPV
LABELV $1844
line 2694
;2692:
;2693:    case UI_HBUYINFOPANE:
;2694:      if ((pane = uiInfo.tremHumanArmouryBuyList[uiInfo.tremHumanArmouryBuyIndex].infopane))
ADDRLP4 40
CNSTI4 12
ADDRGP4 uiInfo+666524
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2695
;2695:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2696
;2696:      break;
ADDRGP4 $1819
JUMPV
LABELV $1850
line 2699
;2697:
;2698:    case UI_HSELLINFOPANE:
;2699:      if ((pane = uiInfo.tremHumanArmourySellList[uiInfo.tremHumanArmourySellIndex].infopane))
ADDRLP4 44
CNSTI4 12
ADDRGP4 uiInfo+666916
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2700
;2700:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2701
;2701:      break;
ADDRGP4 $1819
JUMPV
LABELV $1856
line 2704
;2702:
;2703:    case UI_ABUILDINFOPANE:
;2704:      if ((pane = uiInfo.tremAlienBuildList[uiInfo.tremAlienBuildIndex].infopane))
ADDRLP4 48
CNSTI4 12
ADDRGP4 uiInfo+667508
INDIRI4
MULI4
ADDRGP4 uiInfo+667120+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2705
;2705:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2706
;2706:      break;
ADDRGP4 $1819
JUMPV
LABELV $1862
line 2709
;2707:
;2708:    case UI_HBUILDINFOPANE:
;2709:      if ((pane = uiInfo.tremHumanBuildList[uiInfo.tremHumanBuildIndex].infopane))
ADDRLP4 52
CNSTI4 12
ADDRGP4 uiInfo+667900
INDIRI4
MULI4
ADDRGP4 uiInfo+667512+8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
line 2710
;2710:        UI_DrawInfoPane(pane, &rect, text_x, text_y, scale, color, textStyle);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawInfoPane
CALLV
pop
line 2711
;2711:      break;
ADDRGP4 $1819
JUMPV
LABELV $1868
line 2714
;2712:
;2713:    case UI_HANDICAP:
;2714:      UI_DrawHandicap(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 2715
;2715:      break;
ADDRGP4 $1819
JUMPV
LABELV $1869
line 2717
;2716:    case UI_PLAYERMODEL:
;2717:      UI_DrawPlayerModel(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawPlayerModel
CALLV
pop
line 2718
;2718:      break;
ADDRGP4 $1819
JUMPV
LABELV $1870
line 2720
;2719:    case UI_CLANNAME:
;2720:      UI_DrawClanName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 2721
;2721:      break;
ADDRGP4 $1819
JUMPV
LABELV $1871
line 2723
;2722:    case UI_CLANLOGO:
;2723:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 2724
;2724:      break;
ADDRGP4 $1819
JUMPV
LABELV $1872
line 2726
;2725:    case UI_CLANCINEMATIC:
;2726:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 2727
;2727:      break;
ADDRGP4 $1819
JUMPV
LABELV $1873
line 2729
;2728:    case UI_PREVIEWCINEMATIC:
;2729:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 2730
;2730:      break;
ADDRGP4 $1819
JUMPV
LABELV $1874
line 2732
;2731:    case UI_GAMETYPE:
;2732:      UI_DrawGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 2733
;2733:      break;
ADDRGP4 $1819
JUMPV
LABELV $1875
line 2735
;2734:    case UI_NETGAMETYPE:
;2735:      UI_DrawNetGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 2736
;2736:      break;
ADDRGP4 $1819
JUMPV
LABELV $1876
line 2738
;2737:    case UI_JOINGAMETYPE:
;2738:      UI_DrawJoinGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 2739
;2739:      break;
ADDRGP4 $1819
JUMPV
LABELV $1877
line 2741
;2740:    case UI_MAPPREVIEW:
;2741:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 2742
;2742:      break;
ADDRGP4 $1819
JUMPV
LABELV $1878
line 2744
;2743:    case UI_MAP_TIMETOBEAT:
;2744:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 2745
;2745:      break;
ADDRGP4 $1819
JUMPV
LABELV $1879
line 2747
;2746:    case UI_MAPCINEMATIC:
;2747:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2748
;2748:      break;
ADDRGP4 $1819
JUMPV
LABELV $1880
line 2750
;2749:    case UI_STARTMAPCINEMATIC:
;2750:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2751
;2751:      break;
ADDRGP4 $1819
JUMPV
LABELV $1881
line 2753
;2752:    case UI_SKILL:
;2753:      UI_DrawSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 2754
;2754:      break;
ADDRGP4 $1819
JUMPV
LABELV $1882
line 2756
;2755:    case UI_BLUETEAMNAME:
;2756:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2757
;2757:      break;
ADDRGP4 $1819
JUMPV
LABELV $1883
line 2759
;2758:    case UI_REDTEAMNAME:
;2759:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2760
;2760:      break;
ADDRGP4 $1819
JUMPV
LABELV $1884
line 2766
;2761:    case UI_BLUETEAM1:
;2762:    case UI_BLUETEAM2:
;2763:    case UI_BLUETEAM3:
;2764:    case UI_BLUETEAM4:
;2765:    case UI_BLUETEAM5:
;2766:      UI_DrawTeamMember(&rect, scale, color, qtrue, ownerDraw - UI_BLUETEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 56
INDIRI4
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2767
;2767:      break;
ADDRGP4 $1819
JUMPV
LABELV $1885
line 2773
;2768:    case UI_REDTEAM1:
;2769:    case UI_REDTEAM2:
;2770:    case UI_REDTEAM3:
;2771:    case UI_REDTEAM4:
;2772:    case UI_REDTEAM5:
;2773:      UI_DrawTeamMember(&rect, scale, color, qfalse, ownerDraw - UI_REDTEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2774
;2774:      break;
ADDRGP4 $1819
JUMPV
LABELV $1886
line 2776
;2775:    case UI_NETSOURCE:
;2776:      UI_DrawNetSource(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 2777
;2777:      break;
ADDRGP4 $1819
JUMPV
LABELV $1887
line 2779
;2778:    case UI_NETMAPPREVIEW:
;2779:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2780
;2780:      break;
ADDRGP4 $1819
JUMPV
LABELV $1888
line 2782
;2781:    case UI_NETMAPCINEMATIC:
;2782:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 2783
;2783:      break;
ADDRGP4 $1819
JUMPV
LABELV $1889
line 2785
;2784:    case UI_NETFILTER:
;2785:      UI_DrawNetFilter(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 2786
;2786:      break;
ADDRGP4 $1819
JUMPV
LABELV $1890
line 2788
;2787:    case UI_TIER:
;2788:      UI_DrawTier(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 2789
;2789:      break;
ADDRGP4 $1819
JUMPV
LABELV $1891
line 2791
;2790:    case UI_OPPONENTMODEL:
;2791:      UI_DrawOpponent(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawOpponent
CALLV
pop
line 2792
;2792:      break;
ADDRGP4 $1819
JUMPV
LABELV $1892
line 2794
;2793:    case UI_TIERMAP1:
;2794:      UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2795
;2795:      break;
ADDRGP4 $1819
JUMPV
LABELV $1893
line 2797
;2796:    case UI_TIERMAP2:
;2797:      UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2798
;2798:      break;
ADDRGP4 $1819
JUMPV
LABELV $1894
line 2800
;2799:    case UI_TIERMAP3:
;2800:      UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2801
;2801:      break;
ADDRGP4 $1819
JUMPV
LABELV $1895
line 2803
;2802:    case UI_PLAYERLOGO:
;2803:      UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 2804
;2804:      break;
ADDRGP4 $1819
JUMPV
LABELV $1896
line 2806
;2805:    case UI_PLAYERLOGO_METAL:
;2806:      UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 2807
;2807:      break;
ADDRGP4 $1819
JUMPV
LABELV $1897
line 2809
;2808:    case UI_PLAYERLOGO_NAME:
;2809:      UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 2810
;2810:      break;
ADDRGP4 $1819
JUMPV
LABELV $1898
line 2812
;2811:    case UI_OPPONENTLOGO:
;2812:      UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 2813
;2813:      break;
ADDRGP4 $1819
JUMPV
LABELV $1899
line 2815
;2814:    case UI_OPPONENTLOGO_METAL:
;2815:      UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 2816
;2816:      break;
ADDRGP4 $1819
JUMPV
LABELV $1900
line 2818
;2817:    case UI_OPPONENTLOGO_NAME:
;2818:      UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 2819
;2819:      break;
ADDRGP4 $1819
JUMPV
LABELV $1901
line 2821
;2820:    case UI_TIER_MAPNAME:
;2821:      UI_DrawTierMapName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 2822
;2822:      break;
ADDRGP4 $1819
JUMPV
LABELV $1902
line 2824
;2823:    case UI_TIER_GAMETYPE:
;2824:      UI_DrawTierGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 2825
;2825:      break;
ADDRGP4 $1819
JUMPV
LABELV $1903
line 2827
;2826:    case UI_ALLMAPS_SELECTION:
;2827:      UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2828
;2828:      break;
ADDRGP4 $1819
JUMPV
LABELV $1904
line 2830
;2829:    case UI_MAPS_SELECTION:
;2830:      UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2831
;2831:      break;
ADDRGP4 $1819
JUMPV
LABELV $1905
line 2833
;2832:    case UI_OPPONENT_NAME:
;2833:      UI_DrawOpponentName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 2834
;2834:      break;
ADDRGP4 $1819
JUMPV
LABELV $1906
line 2836
;2835:    case UI_BOTNAME:
;2836:      UI_DrawBotName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 2837
;2837:      break;
ADDRGP4 $1819
JUMPV
LABELV $1907
line 2839
;2838:    case UI_BOTSKILL:
;2839:      UI_DrawBotSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 2840
;2840:      break;
ADDRGP4 $1819
JUMPV
LABELV $1908
line 2842
;2841:    case UI_REDBLUE:
;2842:      UI_DrawRedBlue(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 2843
;2843:      break;
ADDRGP4 $1819
JUMPV
LABELV $1909
line 2845
;2844:    case UI_SELECTEDPLAYER:
;2845:      UI_DrawSelectedPlayer(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 2846
;2846:      break;
ADDRGP4 $1819
JUMPV
LABELV $1910
line 2848
;2847:    case UI_SERVERREFRESHDATE:
;2848:      UI_DrawServerRefreshDate(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 2849
;2849:      break;
ADDRGP4 $1819
JUMPV
LABELV $1911
line 2851
;2850:    case UI_SERVERMOTD:
;2851:      UI_DrawServerMOTD(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 2852
;2852:      break;
ADDRGP4 $1819
JUMPV
LABELV $1912
line 2854
;2853:    case UI_GLINFO:
;2854:      UI_DrawGLInfo(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 2855
;2855:      break;
ADDRGP4 $1819
JUMPV
LABELV $1913
line 2857
;2856:    case UI_KEYBINDSTATUS:
;2857:      UI_DrawKeyBindStatus(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 2858
;2858:      break;
line 2860
;2859:    default:
;2860:      break;
LABELV $1819
line 2863
;2861:  }
;2862:
;2863:}
LABELV $1814
endproc UI_OwnerDraw 60 28
proc UI_OwnerDrawVisible 4128 12
line 2867
;2864:
;2865:static qboolean
;2866:UI_OwnerDrawVisible(int flags)
;2867:{
line 2868
;2868:  qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2873
;2869:  uiClientState_t cs;
;2870:  pTeam_t team;
;2871:  char info[MAX_INFO_STRING];
;2872:
;2873:  trap_GetClientState(&cs);
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 2874
;2874:  trap_GetConfigString(CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING);
ADDRLP4 8+8
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 3092
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2875
;2875:  team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 3092
ARGP4
ADDRGP4 $1604
ARGP4
ADDRLP4 4116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4120
INDIRI4
ASGNI4
ADDRGP4 $1919
JUMPV
LABELV $1918
line 2878
;2876:
;2877:  while(flags)
;2878:  {
line 2880
;2879:
;2880:    if (flags & UI_SHOW_NOTSPECTATING)
ADDRFP4 0
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1921
line 2881
;2881:    {
line 2882
;2882:      if (team == PTE_NONE)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1923
line 2883
;2883:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1923
line 2885
;2884:
;2885:      flags &= ~UI_SHOW_NOTSPECTATING;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -131073
BANDI4
ASGNI4
line 2886
;2886:    }
LABELV $1921
line 2888
;2887:
;2888:    if (flags & UI_SHOW_VOTEACTIVE)
ADDRFP4 0
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1925
line 2889
;2889:    {
line 2890
;2890:      if (!trap_Cvar_VariableValue("ui_voteActive"))
ADDRGP4 $1929
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
NEF4 $1927
line 2891
;2891:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1927
line 2893
;2892:
;2893:      flags &= ~UI_SHOW_VOTEACTIVE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 2894
;2894:    }
LABELV $1925
line 2896
;2895:
;2896:    if (flags & UI_SHOW_CANVOTE)
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1930
line 2897
;2897:    {
line 2898
;2898:      if (trap_Cvar_VariableValue("ui_voteActive"))
ADDRGP4 $1929
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
EQF4 $1932
line 2899
;2899:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1932
line 2901
;2900:
;2901:      flags &= ~UI_SHOW_CANVOTE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 2902
;2902:    }
LABELV $1930
line 2904
;2903:
;2904:    if (flags & UI_SHOW_TEAMVOTEACTIVE)
ADDRFP4 0
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1934
line 2905
;2905:    {
line 2906
;2906:      if (team == PTE_ALIENS)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1936
line 2907
;2907:      {
line 2908
;2908:        if (!trap_Cvar_VariableValue("ui_alienTeamVoteActive"))
ADDRGP4 $1940
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
NEF4 $1937
line 2909
;2909:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2910
;2910:      }
ADDRGP4 $1937
JUMPV
LABELV $1936
line 2911
;2911:      else if (team == PTE_HUMANS)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1941
line 2912
;2912:      {
line 2913
;2913:        if (!trap_Cvar_VariableValue("ui_humanTeamVoteActive"))
ADDRGP4 $1945
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
NEF4 $1943
line 2914
;2914:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1943
line 2915
;2915:      }
LABELV $1941
LABELV $1937
line 2917
;2916:
;2917:      flags &= ~UI_SHOW_TEAMVOTEACTIVE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 2918
;2918:    }
LABELV $1934
line 2920
;2919:
;2920:    if (flags & UI_SHOW_CANTEAMVOTE)
ADDRFP4 0
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1946
line 2921
;2921:    {
line 2922
;2922:      if (team == PTE_ALIENS)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1948
line 2923
;2923:      {
line 2924
;2924:        if (trap_Cvar_VariableValue("ui_alienTeamVoteActive"))
ADDRGP4 $1940
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
EQF4 $1949
line 2925
;2925:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2926
;2926:      }
ADDRGP4 $1949
JUMPV
LABELV $1948
line 2927
;2927:      else if (team == PTE_HUMANS)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1952
line 2928
;2928:      {
line 2929
;2929:        if (trap_Cvar_VariableValue("ui_humanTeamVoteActive"))
ADDRGP4 $1945
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
EQF4 $1954
line 2930
;2930:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1954
line 2931
;2931:      }
LABELV $1952
LABELV $1949
line 2933
;2932:
;2933:      flags &= ~UI_SHOW_CANTEAMVOTE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
line 2934
;2934:    }
LABELV $1946
line 2936
;2935:
;2936:    if (flags & UI_SHOW_LEADER)
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1956
line 2937
;2937:    {
line 2939
;2938:      // these need to show when this client can give orders to a player or a group
;2939:      if (!uiInfo.teamLeader)
ADDRGP4 uiInfo+78808
INDIRI4
CNSTI4 0
NEI4 $1958
line 2940
;2940:      {
line 2941
;2941:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2942
;2942:      }
ADDRGP4 $1959
JUMPV
LABELV $1958
line 2944
;2943:      else
;2944:      {
line 2946
;2945:        // if showing yourself
;2946:        if (ui_selectedPlayer.integer < uiInfo.myTeamCount
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $1961
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82908
ADDP4
INDIRI4
ADDRGP4 uiInfo+78804
INDIRI4
NEI4 $1961
line 2948
;2947:            && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)
;2948:        {
line 2949
;2949:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2950
;2950:        }
LABELV $1961
line 2951
;2951:      }
LABELV $1959
line 2952
;2952:      flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2953
;2953:    }
LABELV $1956
line 2954
;2954:    if (flags & UI_SHOW_NOTLEADER)
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1968
line 2955
;2955:    {
line 2957
;2956:      // these need to show when this client is assigning their own status or they are NOT the leader
;2957:      if (uiInfo.teamLeader)
ADDRGP4 uiInfo+78808
INDIRI4
CNSTI4 0
EQI4 $1970
line 2958
;2958:      {
line 2960
;2959:        // if not showing yourself
;2960:        if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $1980
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82908
ADDP4
INDIRI4
ADDRGP4 uiInfo+78804
INDIRI4
EQI4 $1973
LABELV $1980
line 2962
;2961:            && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber))
;2962:        {
line 2963
;2963:          vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2964
;2964:        }
LABELV $1973
line 2966
;2965:        // these need to show when this client can give orders to a player or a group
;2966:      }
LABELV $1970
line 2967
;2967:      flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2968
;2968:    }
LABELV $1968
line 2969
;2969:    if (flags & UI_SHOW_FAVORITESERVERS)
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1981
line 2970
;2970:    {
line 2972
;2971:      // this assumes you only put this type of display flag on something showing in the proper context
;2972:      if (ui_netSource.integer != AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $1983
line 2973
;2973:      {
line 2974
;2974:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2975
;2975:      }
LABELV $1983
line 2976
;2976:      flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2977
;2977:    }
LABELV $1981
line 2978
;2978:    if (flags & UI_SHOW_NOTFAVORITESERVERS)
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1986
line 2979
;2979:    {
line 2981
;2980:      // this assumes you only put this type of display flag on something showing in the proper context
;2981:      if (ui_netSource.integer == AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $1988
line 2982
;2982:      {
line 2983
;2983:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2984
;2984:      }
LABELV $1988
line 2985
;2985:      flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2986
;2986:    }
LABELV $1986
line 2987
;2987:    if (flags & UI_SHOW_NEWHIGHSCORE)
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1991
line 2988
;2988:    {
line 2989
;2989:      if (uiInfo.newHighScoreTime < uiInfo.uiDC.realTime)
ADDRGP4 uiInfo+73356
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $1993
line 2990
;2990:      {
line 2991
;2991:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2992
;2992:      }
ADDRGP4 $1994
JUMPV
LABELV $1993
line 2994
;2993:      else
;2994:      {
line 2995
;2995:        if (uiInfo.soundHighScore)
ADDRGP4 uiInfo+73376
INDIRI4
CNSTI4 0
EQI4 $1997
line 2996
;2996:        {
line 2997
;2997:          if (trap_Cvar_VariableValue("sv_killserver") == 0)
ADDRGP4 $459
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
NEF4 $2000
line 2998
;2998:          {
line 3000
;2999:            // wait on server to go down before playing sound
;3000:            trap_S_StartLocalSound(uiInfo.newHighScoreSound, CHAN_ANNOUNCER);
ADDRGP4 uiInfo+688124
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3001
;3001:            uiInfo.soundHighScore = qfalse;
ADDRGP4 uiInfo+73376
CNSTI4 0
ASGNI4
line 3002
;3002:          }
LABELV $2000
line 3003
;3003:        }
LABELV $1997
line 3004
;3004:      }
LABELV $1994
line 3005
;3005:      flags &= ~UI_SHOW_NEWHIGHSCORE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 3006
;3006:    }
LABELV $1991
line 3007
;3007:    if (flags & UI_SHOW_NEWBESTTIME)
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2004
line 3008
;3008:    {
line 3009
;3009:      if (uiInfo.newBestTime < uiInfo.uiDC.realTime)
ADDRGP4 uiInfo+73360
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $2006
line 3010
;3010:      {
line 3011
;3011:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3012
;3012:      }
LABELV $2006
line 3013
;3013:      flags &= ~UI_SHOW_NEWBESTTIME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 3014
;3014:    }
LABELV $2004
line 3015
;3015:    if (flags & UI_SHOW_DEMOAVAILABLE)
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2010
line 3016
;3016:    {
line 3017
;3017:      if (!uiInfo.demoAvailable)
ADDRGP4 uiInfo+73372
INDIRI4
CNSTI4 0
NEI4 $2012
line 3018
;3018:      {
line 3019
;3019:        vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3020
;3020:      }
LABELV $2012
line 3021
;3021:      flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 3022
;3022:    }
ADDRGP4 $2011
JUMPV
LABELV $2010
line 3024
;3023:    else
;3024:    {
line 3025
;3025:      flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 3026
;3026:    }
LABELV $2011
line 3027
;3027:  }
LABELV $1919
line 2877
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1918
line 3028
;3028:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1916
endproc UI_OwnerDrawVisible 4128 12
proc UI_Handicap_HandleKey 20 12
line 3033
;3029:}
;3030:
;3031:static qboolean
;3032:UI_Handicap_HandleKey(int flags, float *special, int key)
;3033:{
line 3034
;3034:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2020
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2020
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2020
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2016
LABELV $2020
line 3035
;3035:  {
line 3037
;3036:    int h;
;3037:    h = Com_Clamp(5, 100, trap_Cvar_VariableValue("handicap"));
ADDRGP4 $923
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 3038
;3038:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2021
line 3039
;3039:    {
line 3040
;3040:      h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 3041
;3041:    }
ADDRGP4 $2022
JUMPV
LABELV $2021
line 3043
;3042:    else
;3043:    {
line 3044
;3044:      h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 3045
;3045:    }
LABELV $2022
line 3046
;3046:    if (h > 100)
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $2023
line 3047
;3047:    {
line 3048
;3048:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 3049
;3049:    }
ADDRGP4 $2024
JUMPV
LABELV $2023
line 3050
;3050:    else if (h < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2025
line 3051
;3051:    {
line 3052
;3052:      h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 3053
;3053:    }
LABELV $2025
LABELV $2024
line 3054
;3054:    trap_Cvar_Set("handicap", va("%i", h));
ADDRGP4 $2027
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $923
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3055
;3055:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2015
JUMPV
LABELV $2016
line 3057
;3056:  }
;3057:  return qfalse;
CNSTI4 0
RETI4
LABELV $2015
endproc UI_Handicap_HandleKey 20 12
proc UI_ClanName_HandleKey 16 8
line 3062
;3058:}
;3059:
;3060:static qboolean
;3061:UI_ClanName_HandleKey(int flags, float *special, int key)
;3062:{
line 3063
;3063:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2033
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2033
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2033
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2029
LABELV $2033
line 3064
;3064:  {
line 3066
;3065:    int i;
;3066:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3067
;3067:    if (uiInfo.teamList[i].cinematic >= 0)
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2034
line 3068
;3068:    {
line 3069
;3069:      trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 3070
;3070:      uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
CNSTI4 -1
ASGNI4
line 3071
;3071:    }
LABELV $2034
line 3072
;3072:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2042
line 3073
;3073:    {
line 3074
;3074:      i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3075
;3075:    }
ADDRGP4 $2043
JUMPV
LABELV $2042
line 3077
;3076:    else
;3077:    {
line 3078
;3078:      i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3079
;3079:    }
LABELV $2043
line 3080
;3080:    if (i >= uiInfo.teamCount)
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $2044
line 3081
;3081:    {
line 3082
;3082:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3083
;3083:    }
ADDRGP4 $2045
JUMPV
LABELV $2044
line 3084
;3084:    else if (i < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2047
line 3085
;3085:    {
line 3086
;3086:      i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75696
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3087
;3087:    }
LABELV $2047
LABELV $2045
line 3088
;3088:    trap_Cvar_Set("ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $925
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3089
;3089:    UI_HeadCountByTeam();
ADDRGP4 UI_HeadCountByTeam
CALLI4
pop
line 3090
;3090:    UI_FeederSelection(FEEDER_HEADS, 0);
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 3091
;3091:    updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 3092
;3092:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2028
JUMPV
LABELV $2029
line 3094
;3093:  }
;3094:  return qfalse;
CNSTI4 0
RETI4
LABELV $2028
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 20 16
line 3099
;3095:}
;3096:
;3097:static qboolean
;3098:UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap)
;3099:{
line 3100
;3100:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2056
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2056
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2056
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2052
LABELV $2056
line 3101
;3101:  {
line 3102
;3102:    int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3105
;3103:
;3104:    // hard coded mess here
;3105:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2057
line 3106
;3106:    {
line 3107
;3107:      ui_gameType.integer--;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3108
;3108:      if (ui_gameType.integer == 2)
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $2060
line 3109
;3109:      {
line 3110
;3110:        ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3111
;3111:      }
ADDRGP4 $2058
JUMPV
LABELV $2060
line 3112
;3112:      else if (ui_gameType.integer < 2)
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
GEI4 $2058
line 3113
;3113:      {
line 3114
;3114:        ui_gameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_gameType+12
ADDRGP4 uiInfo+78516
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3115
;3115:      }
line 3116
;3116:    }
ADDRGP4 $2058
JUMPV
LABELV $2057
line 3118
;3117:    else
;3118:    {
line 3119
;3119:      ui_gameType.integer++;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3120
;3120:      if (ui_gameType.integer >= uiInfo.numGameTypes)
ADDRGP4 ui_gameType+12
INDIRI4
ADDRGP4 uiInfo+78516
INDIRI4
LTI4 $2070
line 3121
;3121:      {
line 3122
;3122:        ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3123
;3123:      }
ADDRGP4 $2071
JUMPV
LABELV $2070
line 3124
;3124:      else if (ui_gameType.integer == 2)
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $2075
line 3125
;3125:      {
line 3126
;3126:        ui_gameType.integer = 3;
ADDRGP4 ui_gameType+12
CNSTI4 3
ASGNI4
line 3127
;3127:      }
LABELV $2075
LABELV $2071
line 3128
;3128:    }
LABELV $2058
line 3130
;3129:
;3130:    trap_Cvar_Set("ui_Q3Model", "0");
ADDRGP4 $1223
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3132
;3131:
;3132:    trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2079
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3133
;3133:    UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3134
;3134:    UI_LoadBestScores(
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 3137
;3135:      uiInfo.mapList[ui_currentMap.integer].mapLoadName,
;3136:      uiInfo.gameTypes[ui_gameType.integer].gtEnum);
;3137:    if (resetMap && oldCount != UI_MapCountByGameType(qtrue))
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2087
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2087
line 3138
;3138:    {
line 3139
;3139:      trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $1150
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3140
;3140:      Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3141
;3141:    }
LABELV $2087
line 3142
;3142:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2051
JUMPV
LABELV $2052
line 3144
;3143:  }
;3144:  return qfalse;
CNSTI4 0
RETI4
LABELV $2051
endproc UI_GameType_HandleKey 20 16
proc UI_NetGameType_HandleKey 12 16
line 3149
;3145:}
;3146:
;3147:static qboolean
;3148:UI_NetGameType_HandleKey(int flags, float *special, int key)
;3149:{
line 3150
;3150:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2094
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2094
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2094
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2090
LABELV $2094
line 3151
;3151:  {
line 3153
;3152:
;3153:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2095
line 3154
;3154:    {
line 3155
;3155:      ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3156
;3156:    }
ADDRGP4 $2096
JUMPV
LABELV $2095
line 3158
;3157:    else
;3158:    {
line 3159
;3159:      ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3160
;3160:    }
LABELV $2096
line 3162
;3161:
;3162:    if (ui_netGameType.integer < 0)
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $2099
line 3163
;3163:    {
line 3164
;3164:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+78516
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3165
;3165:    }
ADDRGP4 $2100
JUMPV
LABELV $2099
line 3166
;3166:    else if (ui_netGameType.integer >= uiInfo.numGameTypes)
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78516
INDIRI4
LTI4 $2104
line 3167
;3167:    {
line 3168
;3168:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 3169
;3169:    }
LABELV $2104
LABELV $2100
line 3171
;3170:
;3171:    trap_Cvar_Set("ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $944
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3172
;3172:    trap_Cvar_Set("ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2110
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3173
;3173:    trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $1148
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3174
;3174:    UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3175
;3175:    Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3176
;3176:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2089
JUMPV
LABELV $2090
line 3178
;3177:  }
;3178:  return qfalse;
CNSTI4 0
RETI4
LABELV $2089
endproc UI_NetGameType_HandleKey 12 16
proc UI_JoinGameType_HandleKey 8 8
line 3183
;3179:}
;3180:
;3181:static qboolean
;3182:UI_JoinGameType_HandleKey(int flags, float *special, int key)
;3183:{
line 3184
;3184:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2119
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2119
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2119
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2115
LABELV $2119
line 3185
;3185:  {
line 3187
;3186:
;3187:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2120
line 3188
;3188:    {
line 3189
;3189:      ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3190
;3190:    }
ADDRGP4 $2121
JUMPV
LABELV $2120
line 3192
;3191:    else
;3192:    {
line 3193
;3193:      ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3194
;3194:    }
LABELV $2121
line 3196
;3195:
;3196:    if (ui_joinGameType.integer < 0)
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $2124
line 3197
;3197:    {
line 3198
;3198:      ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+78648
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3199
;3199:    }
ADDRGP4 $2125
JUMPV
LABELV $2124
line 3200
;3200:    else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes)
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78648
INDIRI4
LTI4 $2129
line 3201
;3201:    {
line 3202
;3202:      ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 3203
;3203:    }
LABELV $2129
LABELV $2125
line 3205
;3204:
;3205:    trap_Cvar_Set("ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $955
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3206
;3206:    UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3207
;3207:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2114
JUMPV
LABELV $2115
line 3209
;3208:  }
;3209:  return qfalse;
CNSTI4 0
RETI4
LABELV $2114
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 3214
;3210:}
;3211:
;3212:static qboolean
;3213:UI_Skill_HandleKey(int flags, float *special, int key)
;3214:{
line 3215
;3215:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2140
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2140
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2140
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2136
LABELV $2140
line 3216
;3216:  {
line 3217
;3217:    int i = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $1100
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3219
;3218:
;3219:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2141
line 3220
;3220:    {
line 3221
;3221:      i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3222
;3222:    }
ADDRGP4 $2142
JUMPV
LABELV $2141
line 3224
;3223:    else
;3224:    {
line 3225
;3225:      i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3226
;3226:    }
LABELV $2142
line 3228
;3227:
;3228:    if (i < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2143
line 3229
;3229:    {
line 3230
;3230:      i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 3231
;3231:    }
ADDRGP4 $2144
JUMPV
LABELV $2143
line 3232
;3232:    else if (i > numSkillLevels)
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $2145
line 3233
;3233:    {
line 3234
;3234:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3235
;3235:    }
LABELV $2145
LABELV $2144
line 3237
;3236:
;3237:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $2027
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1100
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3238
;3238:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2135
JUMPV
LABELV $2136
line 3240
;3239:  }
;3240:  return qfalse;
CNSTI4 0
RETI4
LABELV $2135
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 3245
;3241:}
;3242:
;3243:static qboolean
;3244:UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue)
;3245:{
line 3246
;3246:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2152
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2152
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2152
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2148
LABELV $2152
line 3247
;3247:  {
line 3249
;3248:    int i;
;3249:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2154
ADDRLP4 8
ADDRGP4 $1106
ASGNP4
ADDRGP4 $2155
JUMPV
LABELV $2154
ADDRLP4 8
ADDRGP4 $1107
ASGNP4
LABELV $2155
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3251
;3250:
;3251:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2156
line 3252
;3252:    {
line 3253
;3253:      i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3254
;3254:    }
ADDRGP4 $2157
JUMPV
LABELV $2156
line 3256
;3255:    else
;3256:    {
line 3257
;3257:      i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3258
;3258:    }
LABELV $2157
line 3260
;3259:
;3260:    if (i >= uiInfo.teamCount)
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $2158
line 3261
;3261:    {
line 3262
;3262:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3263
;3263:    }
ADDRGP4 $2159
JUMPV
LABELV $2158
line 3264
;3264:    else if (i < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2161
line 3265
;3265:    {
line 3266
;3266:      i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75696
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3267
;3267:    }
LABELV $2161
LABELV $2159
line 3269
;3268:
;3269:    trap_Cvar_Set((blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2166
ADDRLP4 20
ADDRGP4 $1106
ASGNP4
ADDRGP4 $2167
JUMPV
LABELV $2166
ADDRLP4 20
ADDRGP4 $1107
ASGNP4
LABELV $2167
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3271
;3270:
;3271:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2147
JUMPV
LABELV $2148
line 3273
;3272:  }
;3273:  return qfalse;
CNSTI4 0
RETI4
LABELV $2147
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 36 8
line 3278
;3274:}
;3275:
;3276:static qboolean
;3277:UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num)
;3278:{
line 3279
;3279:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2169
LABELV $2173
line 3280
;3280:  {
line 3284
;3281:    // 0 - None
;3282:    // 1 - Human
;3283:    // 2..NumCharacters - Bot
;3284:    char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2175
ADDRLP4 12
ADDRGP4 $1122
ASGNP4
ADDRGP4 $2176
JUMPV
LABELV $2175
ADDRLP4 12
ADDRGP4 $1123
ASGNP4
LABELV $2176
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 3285
;3285:    int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 3287
;3286:
;3287:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2177
line 3288
;3288:    {
line 3289
;3289:      value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3290
;3290:    }
ADDRGP4 $2178
JUMPV
LABELV $2177
line 3292
;3291:    else
;3292:    {
line 3293
;3293:      value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3294
;3294:    }
LABELV $2178
line 3296
;3295:
;3296:    if (value >= UI_GetNumBots() + 2)
ADDRLP4 24
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2179
line 3297
;3297:      value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2180
JUMPV
LABELV $2179
line 3298
;3298:    else if (value < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2181
line 3299
;3299:      value = UI_GetNumBots() + 2 - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2181
LABELV $2180
line 3301
;3300:
;3301:    trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $2027
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3302
;3302:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2169
line 3304
;3303:  }
;3304:  return qfalse;
CNSTI4 0
RETI4
LABELV $2168
endproc UI_TeamMember_HandleKey 36 8
proc UI_NetSource_HandleKey 12 8
line 3309
;3305:}
;3306:
;3307:static qboolean
;3308:UI_NetSource_HandleKey(int flags, float *special, int key)
;3309:{
line 3310
;3310:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2188
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2188
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2188
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2184
LABELV $2188
line 3311
;3311:  {
line 3313
;3312:
;3313:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2189
line 3314
;3314:    {
line 3315
;3315:      ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3316
;3316:      if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $2190
line 3317
;3317:        ui_netSource.integer--;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3318
;3318:    }
ADDRGP4 $2190
JUMPV
LABELV $2189
line 3320
;3319:    else
;3320:    {
line 3321
;3321:      ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3322
;3322:      if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $2197
line 3323
;3323:        ui_netSource.integer++;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2197
line 3324
;3324:    }
LABELV $2190
line 3326
;3325:
;3326:    if (ui_netSource.integer >= numNetSources)
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $2201
line 3327
;3327:    {
line 3328
;3328:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 3329
;3329:    }
ADDRGP4 $2202
JUMPV
LABELV $2201
line 3330
;3330:    else if (ui_netSource.integer < 0)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $2205
line 3331
;3331:    {
line 3332
;3332:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3333
;3333:    }
LABELV $2205
LABELV $2202
line 3335
;3334:
;3335:    UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3336
;3336:    if (ui_netSource.integer != AS_GLOBAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
EQI4 $2209
line 3337
;3337:    {
line 3338
;3338:      UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3339
;3339:    }
LABELV $2209
line 3340
;3340:    trap_Cvar_Set("ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2212
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3341
;3341:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2183
JUMPV
LABELV $2184
line 3343
;3342:  }
;3343:  return qfalse;
CNSTI4 0
RETI4
LABELV $2183
endproc UI_NetSource_HandleKey 12 8
proc UI_NetFilter_HandleKey 8 4
line 3348
;3344:}
;3345:
;3346:static qboolean
;3347:UI_NetFilter_HandleKey(int flags, float *special, int key)
;3348:{
line 3349
;3349:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2219
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2219
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2219
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2215
LABELV $2219
line 3350
;3350:  {
line 3352
;3351:
;3352:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2220
line 3353
;3353:    {
line 3354
;3354:      ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3355
;3355:    }
ADDRGP4 $2221
JUMPV
LABELV $2220
line 3357
;3356:    else
;3357:    {
line 3358
;3358:      ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3359
;3359:    }
LABELV $2221
line 3361
;3360:
;3361:    if (ui_serverFilterType.integer >= numServerFilters)
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $2224
line 3362
;3362:    {
line 3363
;3363:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 3364
;3364:    }
ADDRGP4 $2225
JUMPV
LABELV $2224
line 3365
;3365:    else if (ui_serverFilterType.integer < 0)
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $2228
line 3366
;3366:    {
line 3367
;3367:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3368
;3368:    }
LABELV $2228
LABELV $2225
line 3369
;3369:    UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3370
;3370:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2214
JUMPV
LABELV $2215
line 3372
;3371:  }
;3372:  return qfalse;
CNSTI4 0
RETI4
LABELV $2214
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 3377
;3373:}
;3374:
;3375:static qboolean
;3376:UI_OpponentName_HandleKey(int flags, float *special, int key)
;3377:{
line 3378
;3378:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2237
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2237
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2237
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2233
LABELV $2237
line 3379
;3379:  {
line 3380
;3380:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2238
line 3381
;3381:    {
line 3382
;3382:      UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 3383
;3383:    }
ADDRGP4 $2239
JUMPV
LABELV $2238
line 3385
;3384:    else
;3385:    {
line 3386
;3386:      UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 3387
;3387:    }
LABELV $2239
line 3388
;3388:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2233
line 3390
;3389:  }
;3390:  return qfalse;
CNSTI4 0
RETI4
LABELV $2232
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 16 0
line 3395
;3391:}
;3392:
;3393:static qboolean
;3394:UI_BotName_HandleKey(int flags, float *special, int key)
;3395:{
line 3396
;3396:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2245
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2245
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2245
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2241
LABELV $2245
line 3397
;3397:  {
line 3398
;3398:    int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+73384
INDIRI4
ASGNI4
line 3400
;3399:
;3400:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2247
line 3401
;3401:    {
line 3402
;3402:      value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3403
;3403:    }
ADDRGP4 $2248
JUMPV
LABELV $2247
line 3405
;3404:    else
;3405:    {
line 3406
;3406:      value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3407
;3407:    }
LABELV $2248
line 3409
;3408:
;3409:    if (value >= UI_GetNumBots() + 2)
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2249
line 3410
;3410:      value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2250
JUMPV
LABELV $2249
line 3411
;3411:    else if (value < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2251
line 3412
;3412:      value = UI_GetNumBots() + 2 - 1;
ADDRLP4 12
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2251
LABELV $2250
line 3414
;3413:
;3414:    uiInfo.botIndex = value;
ADDRGP4 uiInfo+73384
ADDRLP4 4
INDIRI4
ASGNI4
line 3415
;3415:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2240
JUMPV
LABELV $2241
line 3417
;3416:  }
;3417:  return qfalse;
CNSTI4 0
RETI4
LABELV $2240
endproc UI_BotName_HandleKey 16 0
proc UI_BotSkill_HandleKey 8 0
line 3422
;3418:}
;3419:
;3420:static qboolean
;3421:UI_BotSkill_HandleKey(int flags, float *special, int key)
;3422:{
line 3423
;3423:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2259
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2259
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2259
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2255
LABELV $2259
line 3424
;3424:  {
line 3425
;3425:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2260
line 3426
;3426:    {
line 3427
;3427:      uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+96612
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3428
;3428:    }
ADDRGP4 $2261
JUMPV
LABELV $2260
line 3430
;3429:    else
;3430:    {
line 3431
;3431:      uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+96612
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3432
;3432:    }
LABELV $2261
line 3433
;3433:    if (uiInfo.skillIndex >= numSkillLevels)
ADDRGP4 uiInfo+96612
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $2264
line 3434
;3434:    {
line 3435
;3435:      uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+96612
CNSTI4 0
ASGNI4
line 3436
;3436:    }
ADDRGP4 $2265
JUMPV
LABELV $2264
line 3437
;3437:    else if (uiInfo.skillIndex < 0)
ADDRGP4 uiInfo+96612
INDIRI4
CNSTI4 0
GEI4 $2268
line 3438
;3438:    {
line 3439
;3439:      uiInfo.skillIndex = numSkillLevels - 1;
ADDRGP4 uiInfo+96612
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3440
;3440:    }
LABELV $2268
LABELV $2265
line 3441
;3441:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2254
JUMPV
LABELV $2255
line 3443
;3442:  }
;3443:  return qfalse;
CNSTI4 0
RETI4
LABELV $2254
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 3448
;3444:}
;3445:
;3446:static qboolean
;3447:UI_RedBlue_HandleKey(int flags, float *special, int key)
;3448:{
line 3449
;3449:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2277
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2277
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2277
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2273
LABELV $2277
line 3450
;3450:  {
line 3451
;3451:    uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+78780
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 3452
;3452:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2272
JUMPV
LABELV $2273
line 3454
;3453:  }
;3454:  return qfalse;
CNSTI4 0
RETI4
LABELV $2272
endproc UI_RedBlue_HandleKey 8 0
proc UI_SelectedPlayer_HandleKey 16 8
line 3459
;3455:}
;3456:
;3457:static qboolean
;3458:UI_SelectedPlayer_HandleKey(int flags, float *special, int key)
;3459:{
line 3460
;3460:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER)
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2284
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2284
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2284
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2280
LABELV $2284
line 3461
;3461:  {
line 3464
;3462:    int selected;
;3463:
;3464:    UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 3465
;3465:    if (!uiInfo.teamLeader)
ADDRGP4 uiInfo+78808
INDIRI4
CNSTI4 0
NEI4 $2285
line 3466
;3466:    {
line 3467
;3467:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2279
JUMPV
LABELV $2285
line 3469
;3468:    }
;3469:    selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1636
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3471
;3470:
;3471:    if (key == K_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2288
line 3472
;3472:    {
line 3473
;3473:      selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3474
;3474:    }
ADDRGP4 $2289
JUMPV
LABELV $2288
line 3476
;3475:    else
;3476:    {
line 3477
;3477:      selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3478
;3478:    }
LABELV $2289
line 3480
;3479:
;3480:    if (selected > uiInfo.myTeamCount)
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
LEI4 $2290
line 3481
;3481:    {
line 3482
;3482:      selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3483
;3483:    }
ADDRGP4 $2291
JUMPV
LABELV $2290
line 3484
;3484:    else if (selected < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2293
line 3485
;3485:    {
line 3486
;3486:      selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+78788
INDIRI4
ASGNI4
line 3487
;3487:    }
LABELV $2293
LABELV $2291
line 3489
;3488:
;3489:    if (selected == uiInfo.myTeamCount)
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
NEI4 $2296
line 3490
;3490:    {
line 3491
;3491:      trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $1644
ARGP4
ADDRGP4 $2299
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3492
;3492:    }
ADDRGP4 $2297
JUMPV
LABELV $2296
line 3494
;3493:    else
;3494:    {
line 3495
;3495:      trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $1644
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3496
;3496:    }
LABELV $2297
line 3497
;3497:    trap_Cvar_Set("cg_selectedPlayer", va("%d", selected));
ADDRGP4 $930
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1636
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3498
;3498:  }
LABELV $2280
line 3499
;3499:  return qfalse;
CNSTI4 0
RETI4
LABELV $2279
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 48 20
line 3504
;3500:}
;3501:
;3502:static qboolean
;3503:UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key)
;3504:{
line 3505
;3505:  switch(ownerDraw)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $2303
ADDRLP4 0
INDIRI4
CNSTI4 245
GTI4 $2321
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2322-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2322
address $2304
address $2303
address $2303
address $2305
address $2303
address $2306
address $2303
address $2309
address $2310
address $2311
address $2312
address $2312
address $2312
address $2312
address $2312
address $2313
address $2313
address $2313
address $2313
address $2313
address $2314
address $2303
address $2315
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2303
address $2316
address $2303
address $2317
address $2318
address $2319
address $2303
address $2320
address $2303
address $2307
code
LABELV $2321
ADDRFP4 0
INDIRI4
CNSTI4 253
EQI4 $2308
ADDRGP4 $2303
JUMPV
line 3506
;3506:  {
LABELV $2304
line 3508
;3507:    case UI_HANDICAP:
;3508:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3509
;3509:      break;
LABELV $2305
line 3511
;3510:    case UI_CLANNAME:
;3511:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3512
;3512:      break;
LABELV $2306
line 3514
;3513:    case UI_GAMETYPE:
;3514:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3515
;3515:      break;
LABELV $2307
line 3517
;3516:    case UI_NETGAMETYPE:
;3517:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3518
;3518:      break;
LABELV $2308
line 3520
;3519:    case UI_JOINGAMETYPE:
;3520:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3521
;3521:      break;
LABELV $2309
line 3523
;3522:    case UI_SKILL:
;3523:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3524
;3524:      break;
LABELV $2310
line 3526
;3525:    case UI_BLUETEAMNAME:
;3526:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3527
;3527:      break;
LABELV $2311
line 3529
;3528:    case UI_REDTEAMNAME:
;3529:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3530
;3530:      break;
LABELV $2312
line 3536
;3531:    case UI_BLUETEAM1:
;3532:    case UI_BLUETEAM2:
;3533:    case UI_BLUETEAM3:
;3534:    case UI_BLUETEAM4:
;3535:    case UI_BLUETEAM5:
;3536:      UI_TeamMember_HandleKey(flags, special, key, qtrue, ownerDraw - UI_BLUETEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 36
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3537
;3537:      break;
ADDRGP4 $2303
JUMPV
LABELV $2313
line 3543
;3538:    case UI_REDTEAM1:
;3539:    case UI_REDTEAM2:
;3540:    case UI_REDTEAM3:
;3541:    case UI_REDTEAM4:
;3542:    case UI_REDTEAM5:
;3543:      UI_TeamMember_HandleKey(flags, special, key, qfalse, ownerDraw - UI_REDTEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3544
;3544:      break;
ADDRGP4 $2303
JUMPV
LABELV $2314
line 3546
;3545:    case UI_NETSOURCE:
;3546:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 3547
;3547:      break;
ADDRGP4 $2303
JUMPV
LABELV $2315
line 3549
;3548:    case UI_NETFILTER:
;3549:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 3550
;3550:      break;
ADDRGP4 $2303
JUMPV
LABELV $2316
line 3552
;3551:    case UI_OPPONENT_NAME:
;3552:      UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 3553
;3553:      break;
ADDRGP4 $2303
JUMPV
LABELV $2317
line 3555
;3554:    case UI_BOTNAME:
;3555:      return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3556
;3556:      break;
LABELV $2318
line 3558
;3557:    case UI_BOTSKILL:
;3558:      return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2301
JUMPV
line 3559
;3559:      break;
LABELV $2319
line 3561
;3560:    case UI_REDBLUE:
;3561:      UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 3562
;3562:      break;
ADDRGP4 $2303
JUMPV
LABELV $2320
line 3564
;3563:    case UI_SELECTEDPLAYER:
;3564:      UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 3565
;3565:      break;
line 3567
;3566:    default:
;3567:      break;
LABELV $2303
line 3570
;3568:  }
;3569:
;3570:  return qfalse;
CNSTI4 0
RETI4
LABELV $2301
endproc UI_OwnerDrawHandleKey 48 20
proc UI_GetValue 0 0
line 3575
;3571:}
;3572:
;3573:static float
;3574:UI_GetValue(int ownerDraw)
;3575:{
line 3576
;3576:  return 0;
CNSTF4 0
RETF4
LABELV $2324
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 3586
;3577:}
;3578:
;3579:/*
;3580: =================
;3581: UI_ServersQsortCompare
;3582: =================
;3583: */
;3584:static int QDECL
;3585:UI_ServersQsortCompare(const void *arg1, const void *arg2)
;3586:{
line 3587
;3587:  return trap_LAN_CompareServers(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2325
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 3599
;3588:    ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*) arg1,
;3589:    *(int*) arg2);
;3590:}
;3591:
;3592:/*
;3593: =================
;3594: UI_ServersSort
;3595: =================
;3596: */
;3597:void
;3598:UI_ServersSort(int column, qboolean force)
;3599:{
line 3601
;3600:
;3601:  if (!force)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2332
line 3602
;3602:  {
line 3603
;3603:    if (uiInfo.serverStatus.sortKey == column)
ADDRGP4 uiInfo+667904+2200
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2334
line 3604
;3604:    {
line 3605
;3605:      return;
ADDRGP4 $2331
JUMPV
LABELV $2334
line 3607
;3606:    }
;3607:  }
LABELV $2332
line 3609
;3608:
;3609:  uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+667904+2200
ADDRFP4 0
INDIRI4
ASGNI4
line 3610
;3610:  qsort(
ADDRGP4 uiInfo+667904+2220
ARGP4
ADDRGP4 uiInfo+667904+10412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 3613
;3611:    &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int),
;3612:    UI_ServersQsortCompare);
;3613:}
LABELV $2331
endproc UI_ServersSort 0 16
proc UI_GetCurrentAlienStage 1032 16
line 3622
;3614:
;3615:/*
;3616: ===============
;3617: UI_GetCurrentAlienStage
;3618: ===============
;3619: */
;3620:static stage_t
;3621:UI_GetCurrentAlienStage(void)
;3622:{
line 3626
;3623:  char buffer[MAX_TOKEN_CHARS];
;3624:  stage_t stage, dummy;
;3625:
;3626:  trap_Cvar_VariableStringBuffer("ui_stages", buffer, sizeof(buffer));
ADDRGP4 $2345
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3627
;3627:  sscanf(buffer, "%d %d", (int *) &stage, (int *) &dummy);
ADDRLP4 0
ARGP4
ADDRGP4 $2346
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 3629
;3628:
;3629:  return stage;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $2344
endproc UI_GetCurrentAlienStage 1032 16
proc UI_GetCurrentHumanStage 1032 16
line 3639
;3630:}
;3631:
;3632:/*
;3633: ===============
;3634: UI_GetCurrentHumanStage
;3635: ===============
;3636: */
;3637:static stage_t
;3638:UI_GetCurrentHumanStage(void)
;3639:{
line 3643
;3640:  char buffer[MAX_TOKEN_CHARS];
;3641:  stage_t stage, dummy;
;3642:
;3643:  trap_Cvar_VariableStringBuffer("ui_stages", buffer, sizeof(buffer));
ADDRGP4 $2345
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3644
;3644:  sscanf(buffer, "%d %d", (int *) &dummy, (int *) &stage);
ADDRLP4 0
ARGP4
ADDRGP4 $2346
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 3646
;3645:
;3646:  return stage;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $2347
endproc UI_GetCurrentHumanStage 1032 16
proc UI_LoadTremTeams 36 4
line 3656
;3647:}
;3648:
;3649:/*
;3650: ===============
;3651: UI_LoadTremTeams
;3652: ===============
;3653: */
;3654:static void
;3655:UI_LoadTremTeams(void)
;3656:{
line 3657
;3657:  uiInfo.tremTeamCount = 3;
ADDRGP4 uiInfo+666040
CNSTI4 3
ASGNI4
line 3663
;3658:
;3659:  //uiInfo.tremTeamList[0].text = String_Alloc("The Rebels");
;3660:  //uiInfo.tremTeamList[0].cmd = String_Alloc("cmd team aliens\n");
;3661:  //uiInfo.tremTeamList[0].infopane = UI_FindInfoPaneByName("alienteam");
;3662:
;3663:  uiInfo.tremTeamList[0].text = String_Alloc("Survivors");
ADDRGP4 $2351
ARGP4
ADDRLP4 0
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992
ADDRLP4 0
INDIRP4
ASGNP4
line 3664
;3664:  uiInfo.tremTeamList[0].cmd = String_Alloc("cmd team humans\n");
ADDRGP4 $2354
ARGP4
ADDRLP4 4
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+4
ADDRLP4 4
INDIRP4
ASGNP4
line 3665
;3665:  uiInfo.tremTeamList[0].infopane = UI_FindInfoPaneByName("humanteam");
ADDRGP4 $2357
ARGP4
ADDRLP4 8
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+8
ADDRLP4 8
INDIRP4
ASGNP4
line 3667
;3666:
;3667:  uiInfo.tremTeamList[1].text = String_Alloc("Spectate");
ADDRGP4 $2360
ARGP4
ADDRLP4 12
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+12
ADDRLP4 12
INDIRP4
ASGNP4
line 3668
;3668:  uiInfo.tremTeamList[1].cmd = String_Alloc("cmd team spectate\n");
ADDRGP4 $2364
ARGP4
ADDRLP4 16
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+12+4
ADDRLP4 16
INDIRP4
ASGNP4
line 3669
;3669:  uiInfo.tremTeamList[1].infopane = UI_FindInfoPaneByName("spectateteam");
ADDRGP4 $2368
ARGP4
ADDRLP4 20
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+12+8
ADDRLP4 20
INDIRP4
ASGNP4
line 3671
;3670:
;3671:  uiInfo.tremTeamList[2].text = String_Alloc("Auto select");
ADDRGP4 $2371
ARGP4
ADDRLP4 24
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+24
ADDRLP4 24
INDIRP4
ASGNP4
line 3672
;3672:  uiInfo.tremTeamList[2].cmd = String_Alloc("cmd team auto\n");
ADDRGP4 $2375
ARGP4
ADDRLP4 28
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+24+4
ADDRLP4 28
INDIRP4
ASGNP4
line 3673
;3673:  uiInfo.tremTeamList[2].infopane = UI_FindInfoPaneByName("autoteam");
ADDRGP4 $2379
ARGP4
ADDRLP4 32
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
ADDRGP4 uiInfo+665992+24+8
ADDRLP4 32
INDIRP4
ASGNP4
line 3674
;3674:}
LABELV $2348
endproc UI_LoadTremTeams 36 4
proc UI_AddClass 36 8
line 3683
;3675:
;3676:/*
;3677: ===============
;3678: UI_AddClass
;3679: ===============
;3680: */
;3681:static void
;3682:UI_AddClass(pClass_t class)
;3683:{
line 3684
;3684:  uiInfo.tremAlienClassList[uiInfo.tremAlienClassCount].text = String_Alloc(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindHumanNameForClassNum
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666084
INDIRI4
MULI4
ADDRGP4 uiInfo+666048
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3686
;3685:    BG_FindHumanNameForClassNum(class));
;3686:  uiInfo.tremAlienClassList[uiInfo.tremAlienClassCount].cmd = String_Alloc(va(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindNameForClassNum
CALLP4
ASGNP4
ADDRGP4 $2386
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666084
INDIRI4
MULI4
ADDRGP4 uiInfo+666048+4
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3688
;3687:    "cmd class %s\n", BG_FindNameForClassNum(class)));
;3688:  uiInfo.tremAlienClassList[uiInfo.tremAlienClassCount].infopane = UI_FindInfoPaneByName(va(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindNameForClassNum
CALLP4
ASGNP4
ADDRGP4 $2390
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666084
INDIRI4
MULI4
ADDRGP4 uiInfo+666048+8
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
line 3691
;3689:    "%sclass", BG_FindNameForClassNum(class)));
;3690:
;3691:  uiInfo.tremAlienClassCount++;
ADDRLP4 32
ADDRGP4 uiInfo+666084
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3692
;3692:}
LABELV $2380
endproc UI_AddClass 36 8
proc UI_LoadTremAlienClasses 20 8
line 3701
;3693:
;3694:/*
;3695: ===============
;3696: UI_LoadTremAlienClasses
;3697: ===============
;3698: */
;3699:static void
;3700:UI_LoadTremAlienClasses(void)
;3701:{
line 3702
;3702:  uiInfo.tremAlienClassCount = 0;
ADDRGP4 uiInfo+666084
CNSTI4 0
ASGNI4
line 3704
;3703:
;3704:  if (BG_ClassIsAllowed(PCL_ALIEN_LEVEL0))
CNSTI4 3
ARGI4
ADDRLP4 0
ADDRGP4 BG_ClassIsAllowed
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2394
line 3705
;3705:    UI_AddClass(PCL_ALIEN_LEVEL0);
CNSTI4 3
ARGI4
ADDRGP4 UI_AddClass
CALLV
pop
LABELV $2394
line 3707
;3706:
;3707:  if (BG_ClassIsAllowed(PCL_ALIEN_BUILDER0_UPG) && BG_FindStagesForClass(
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 BG_ClassIsAllowed
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2396
ADDRLP4 8
ADDRGP4 UI_GetCurrentAlienStage
CALLI4
ASGNI4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindStagesForClass
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2396
line 3709
;3708:    PCL_ALIEN_BUILDER0_UPG, UI_GetCurrentAlienStage()))
;3709:    UI_AddClass(PCL_ALIEN_BUILDER0_UPG);
CNSTI4 2
ARGI4
ADDRGP4 UI_AddClass
CALLV
pop
ADDRGP4 $2397
JUMPV
LABELV $2396
line 3710
;3710:  else if (BG_ClassIsAllowed(PCL_ALIEN_BUILDER0))
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 BG_ClassIsAllowed
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2398
line 3711
;3711:    UI_AddClass(PCL_ALIEN_BUILDER0);
CNSTI4 1
ARGI4
ADDRGP4 UI_AddClass
CALLV
pop
LABELV $2398
LABELV $2397
line 3712
;3712:}
LABELV $2392
endproc UI_LoadTremAlienClasses 20 8
proc UI_AddItem 36 8
line 3721
;3713:
;3714:/*
;3715: ===============
;3716: UI_AddItem
;3717: ===============
;3718: */
;3719:static void
;3720:UI_AddItem(weapon_t weapon)
;3721:{
line 3722
;3722:  uiInfo.tremHumanItemList[uiInfo.tremHumanItemCount].text = String_Alloc(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666128
INDIRI4
MULI4
ADDRGP4 uiInfo+666092
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3724
;3723:    BG_FindHumanNameForWeapon(weapon));
;3724:  uiInfo.tremHumanItemList[uiInfo.tremHumanItemCount].cmd = String_Alloc(va(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2386
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666128
INDIRI4
MULI4
ADDRGP4 uiInfo+666092+4
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3726
;3725:    "cmd class %s\n", BG_FindNameForWeapon(weapon)));
;3726:  uiInfo.tremHumanItemList[uiInfo.tremHumanItemCount].infopane = UI_FindInfoPaneByName(va(
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2409
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRGP4 uiInfo+666128
INDIRI4
MULI4
ADDRGP4 uiInfo+666092+8
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
line 3729
;3727:    "%sitem", BG_FindNameForWeapon(weapon)));
;3728:
;3729:  uiInfo.tremHumanItemCount++;
ADDRLP4 32
ADDRGP4 uiInfo+666128
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3730
;3730:}
LABELV $2400
endproc UI_AddItem 36 8
proc UI_LoadTremHumanItems 20 8
line 3739
;3731:
;3732:/*
;3733: ===============
;3734: UI_LoadTremHumanItems
;3735: ===============
;3736: */
;3737:static void
;3738:UI_LoadTremHumanItems(void)
;3739:{
line 3740
;3740:  uiInfo.tremHumanItemCount = 0;
ADDRGP4 uiInfo+666128
CNSTI4 0
ASGNI4
line 3742
;3741:
;3742:  if (BG_WeaponIsAllowed(WP_MACHINEGUN))
CNSTI4 3
ARGI4
ADDRLP4 0
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2413
line 3743
;3743:    UI_AddItem(WP_MACHINEGUN);
CNSTI4 3
ARGI4
ADDRGP4 UI_AddItem
CALLV
pop
LABELV $2413
line 3745
;3744:
;3745:  if (BG_WeaponIsAllowed(WP_HBUILD2) && BG_FindStagesForWeapon(
CNSTI4 20
ARGI4
ADDRLP4 4
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2415
ADDRLP4 8
ADDRGP4 UI_GetCurrentHumanStage
CALLI4
ASGNI4
CNSTI4 20
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2415
line 3747
;3746:    WP_HBUILD2, UI_GetCurrentHumanStage()))
;3747:    UI_AddItem(WP_HBUILD2);
CNSTI4 20
ARGI4
ADDRGP4 UI_AddItem
CALLV
pop
ADDRGP4 $2416
JUMPV
LABELV $2415
line 3748
;3748:  else if (BG_WeaponIsAllowed(WP_HBUILD))
CNSTI4 21
ARGI4
ADDRLP4 16
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2417
line 3749
;3749:    UI_AddItem(WP_HBUILD);
CNSTI4 21
ARGI4
ADDRGP4 UI_AddItem
CALLV
pop
LABELV $2417
LABELV $2416
line 3750
;3750:}
LABELV $2411
endproc UI_LoadTremHumanItems 20 8
proc UI_ParseCarriageList 2084 12
line 3759
;3751:
;3752:/*
;3753: ===============
;3754: UI_ParseCarriageList
;3755: ===============
;3756: */
;3757:static void
;3758:UI_ParseCarriageList(int *weapons, int *upgrades)
;3759:{
line 3766
;3760:  int i;
;3761:  char carriageCvar[MAX_TOKEN_CHARS];
;3762:  char *iterator;
;3763:  char buffer[MAX_TOKEN_CHARS];
;3764:  char *bufPointer;
;3765:
;3766:  trap_Cvar_VariableStringBuffer("ui_carriage", carriageCvar, sizeof(carriageCvar));
ADDRGP4 $2420
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3767
;3767:  iterator = carriageCvar;
ADDRLP4 0
ADDRLP4 1036
ASGNP4
line 3769
;3768:
;3769:  if (weapons)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2421
line 3770
;3770:    *weapons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $2421
line 3772
;3771:
;3772:  if (upgrades)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2426
line 3773
;3773:    *upgrades = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
ADDRGP4 $2426
JUMPV
LABELV $2425
line 3777
;3774:
;3775:  //simple parser to give rise to weapon/upgrade list
;3776:  while(iterator && iterator[0] != '$')
;3777:  {
line 3778
;3778:    bufPointer = buffer;
ADDRLP4 4
ADDRLP4 8
ASGNP4
line 3780
;3779:
;3780:    if (iterator[0] == 'W')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 87
NEI4 $2428
line 3781
;3781:    {
line 3782
;3782:      iterator++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $2431
JUMPV
LABELV $2430
line 3785
;3783:
;3784:      while(iterator[0] != ' ')
;3785:        *bufPointer++ = *iterator++;
ADDRLP4 2060
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 2068
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2060
INDIRP4
ADDRLP4 2064
INDIRP4
INDIRI1
ASGNI1
LABELV $2431
line 3784
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $2430
line 3787
;3786:
;3787:      *bufPointer++ = '\n';
ADDRLP4 2072
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 2072
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 2072
INDIRP4
CNSTI1 10
ASGNI1
line 3789
;3788:
;3789:      i = atoi(buffer);
ADDRLP4 8
ARGP4
ADDRLP4 2076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 2076
INDIRI4
ASGNI4
line 3791
;3790:
;3791:      if (weapons)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2429
line 3792
;3792:        *weapons |= (1 << i);
ADDRLP4 2080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2080
INDIRP4
ADDRLP4 2080
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 1032
INDIRI4
LSHI4
BORI4
ASGNI4
line 3793
;3793:    }
ADDRGP4 $2429
JUMPV
LABELV $2428
line 3794
;3794:    else if (iterator[0] == 'U')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 85
NEI4 $2435
line 3795
;3795:    {
line 3796
;3796:      iterator++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $2438
JUMPV
LABELV $2437
line 3799
;3797:
;3798:      while(iterator[0] != ' ')
;3799:        *bufPointer++ = *iterator++;
ADDRLP4 2060
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 2068
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2060
INDIRP4
ADDRLP4 2064
INDIRP4
INDIRI1
ASGNI1
LABELV $2438
line 3798
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $2437
line 3801
;3800:
;3801:      *bufPointer++ = '\n';
ADDRLP4 2072
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 2072
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 2072
INDIRP4
CNSTI1 10
ASGNI1
line 3803
;3802:
;3803:      i = atoi(buffer);
ADDRLP4 8
ARGP4
ADDRLP4 2076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 2076
INDIRI4
ASGNI4
line 3805
;3804:
;3805:      if (upgrades)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2440
line 3806
;3806:        *upgrades |= (1 << i);
ADDRLP4 2080
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 2080
INDIRP4
ADDRLP4 2080
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 1032
INDIRI4
LSHI4
BORI4
ASGNI4
LABELV $2440
line 3807
;3807:    }
LABELV $2435
LABELV $2429
line 3809
;3808:
;3809:    iterator++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3810
;3810:  }
LABELV $2426
line 3776
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2442
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $2425
LABELV $2442
line 3811
;3811:}
LABELV $2419
endproc UI_ParseCarriageList 2084 12
proc UI_LoadTremHumanArmouryBuys 88 8
line 3820
;3812:
;3813:/*
;3814: ===============
;3815: UI_LoadTremHumanArmouryBuys
;3816: ===============
;3817: */
;3818:static void
;3819:UI_LoadTremHumanArmouryBuys(void)
;3820:{
line 3821
;3821:  int i, j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3822
;3822:  stage_t stage = UI_GetCurrentHumanStage();
ADDRLP4 24
ADDRGP4 UI_GetCurrentHumanStage
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3824
;3823:  int weapons, upgrades;
;3824:  int slots = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3826
;3825:
;3826:  UI_ParseCarriageList(&weapons, &upgrades);
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 UI_ParseCarriageList
CALLV
pop
line 3828
;3827:
;3828:  for(i = WP_NONE + 1;i < WP_NUM_WEAPONS;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2444
line 3829
;3829:  {
line 3830
;3830:    if (weapons & (1 << i))
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2448
line 3831
;3831:      slots |= BG_FindSlotsForWeapon(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindSlotsForWeapon
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
BORI4
ASGNI4
LABELV $2448
line 3832
;3832:  }
LABELV $2445
line 3828
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $2444
line 3834
;3833:
;3834:  for(i = UP_NONE + 1;i < UP_NUM_UPGRADES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2450
line 3835
;3835:  {
line 3836
;3836:    if (upgrades & (1 << i))
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2454
line 3837
;3837:      slots |= BG_FindSlotsForUpgrade(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindSlotsForUpgrade
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
BORI4
ASGNI4
LABELV $2454
line 3838
;3838:  }
LABELV $2451
line 3834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2450
line 3840
;3839:
;3840:  uiInfo.tremHumanArmouryBuyCount = 0;
ADDRGP4 uiInfo+666520
CNSTI4 0
ASGNI4
line 3842
;3841:
;3842:  for(i = WP_NONE + 1;i < WP_NUM_WEAPONS;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2457
line 3843
;3843:  {
line 3844
;3844:    if (BG_FindTeamForWeapon(i) == WUT_HUMANS && BG_FindPurchasableForWeapon(i)
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindTeamForWeapon
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $2461
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindPurchasableForWeapon
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2461
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindStagesForWeapon
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2461
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_WeaponIsAllowed
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2461
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindSlotsForWeapon
CALLI4
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $2461
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $2461
line 3847
;3845:        && BG_FindStagesForWeapon(i, stage) && BG_WeaponIsAllowed(i) && !(BG_FindSlotsForWeapon(i)
;3846:        & slots) && !(weapons & (1 << i)))
;3847:    {
line 3848
;3848:      uiInfo.tremHumanArmouryBuyList[j].text = String_Alloc(BG_FindHumanNameForWeapon(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 3849
;3849:      uiInfo.tremHumanArmouryBuyList[j].cmd = String_Alloc(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2466
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+4
ADDP4
ADDRLP4 68
INDIRP4
ASGNP4
line 3851
;3850:        "cmd buy %s retrigger\n", BG_FindNameForWeapon(i)));
;3851:      uiInfo.tremHumanArmouryBuyList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2409
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+8
ADDP4
ADDRLP4 80
INDIRP4
ASGNP4
line 3854
;3852:        "%sitem", BG_FindNameForWeapon(i)));
;3853:
;3854:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3856
;3855:
;3856:      uiInfo.tremHumanArmouryBuyCount++;
ADDRLP4 84
ADDRGP4 uiInfo+666520
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3857
;3857:    }
LABELV $2461
line 3858
;3858:  }
LABELV $2458
line 3842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $2457
line 3860
;3859:
;3860:  for(i = UP_NONE + 1;i < UP_NUM_UPGRADES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2470
line 3861
;3861:  {
line 3862
;3862:    if (BG_FindTeamForUpgrade(i) == WUT_HUMANS && BG_FindPurchasableForUpgrade(i)
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindTeamForUpgrade
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $2474
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindPurchasableForUpgrade
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2474
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindStagesForUpgrade
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2474
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_UpgradeIsAllowed
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2474
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindSlotsForUpgrade
CALLI4
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $2474
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $2474
line 3865
;3863:        && BG_FindStagesForUpgrade(i, stage) && BG_UpgradeIsAllowed(i) && !(BG_FindSlotsForUpgrade(
;3864:      i) & slots) && !(upgrades & (1 << i)))
;3865:    {
line 3866
;3866:      uiInfo.tremHumanArmouryBuyList[j].text = String_Alloc(BG_FindHumanNameForUpgrade(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindHumanNameForUpgrade
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 3867
;3867:      uiInfo.tremHumanArmouryBuyList[j].cmd = String_Alloc(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $2466
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+4
ADDP4
ADDRLP4 68
INDIRP4
ASGNP4
line 3869
;3868:        "cmd buy %s retrigger\n", BG_FindNameForUpgrade(i)));
;3869:      uiInfo.tremHumanArmouryBuyList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $2409
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+8
ADDP4
ADDRLP4 80
INDIRP4
ASGNP4
line 3872
;3870:        "%sitem", BG_FindNameForUpgrade(i)));
;3871:
;3872:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3874
;3873:
;3874:      uiInfo.tremHumanArmouryBuyCount++;
ADDRLP4 84
ADDRGP4 uiInfo+666520
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3875
;3875:    }
LABELV $2474
line 3876
;3876:  }
LABELV $2471
line 3860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2470
line 3877
;3877:}
LABELV $2443
endproc UI_LoadTremHumanArmouryBuys 88 8
proc UI_LoadTremHumanArmourySells 52 8
line 3886
;3878:
;3879:/*
;3880: ===============
;3881: UI_LoadTremHumanArmourySells
;3882: ===============
;3883: */
;3884:static void
;3885:UI_LoadTremHumanArmourySells(void)
;3886:{
line 3888
;3887:  int weapons, upgrades;
;3888:  int i, j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3890
;3889:
;3890:  uiInfo.tremHumanArmourySellCount = 0;
ADDRGP4 uiInfo+666912
CNSTI4 0
ASGNI4
line 3891
;3891:  UI_ParseCarriageList(&weapons, &upgrades);
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_ParseCarriageList
CALLV
pop
line 3893
;3892:
;3893:  for(i = WP_NONE + 1;i < WP_NUM_WEAPONS;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2484
line 3894
;3894:  {
line 3895
;3895:    if (weapons & (1 << i))
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2488
line 3896
;3896:    {
line 3897
;3897:      uiInfo.tremHumanArmourySellList[j].text = String_Alloc(BG_FindHumanNameForWeapon(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3898
;3898:      uiInfo.tremHumanArmourySellList[j].cmd = String_Alloc(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2493
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+4
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
line 3900
;3899:        "cmd sell %s retrigger\n", BG_FindNameForWeapon(i)));
;3900:      uiInfo.tremHumanArmourySellList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $2409
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+8
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 3903
;3901:        "%sitem", BG_FindNameForWeapon(i)));
;3902:
;3903:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3905
;3904:
;3905:      uiInfo.tremHumanArmourySellCount++;
ADDRLP4 48
ADDRGP4 uiInfo+666912
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3906
;3906:    }
LABELV $2488
line 3907
;3907:  }
LABELV $2485
line 3893
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $2484
line 3909
;3908:
;3909:  for(i = UP_NONE + 1;i < UP_NUM_UPGRADES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2497
line 3910
;3910:  {
line 3911
;3911:    if (upgrades & (1 << i))
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2501
line 3912
;3912:    {
line 3913
;3913:      uiInfo.tremHumanArmourySellList[j].text = String_Alloc(BG_FindHumanNameForUpgrade(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindHumanNameForUpgrade
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3914
;3914:      uiInfo.tremHumanArmourySellList[j].cmd = String_Alloc(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $2493
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+4
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
line 3916
;3915:        "cmd sell %s retrigger\n", BG_FindNameForUpgrade(i)));
;3916:      uiInfo.tremHumanArmourySellList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $2409
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+8
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 3919
;3917:        "%sitem", BG_FindNameForUpgrade(i)));
;3918:
;3919:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3921
;3920:
;3921:      uiInfo.tremHumanArmourySellCount++;
ADDRLP4 48
ADDRGP4 uiInfo+666912
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3922
;3922:    }
LABELV $2501
line 3923
;3923:  }
LABELV $2498
line 3909
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2497
line 3924
;3924:}
LABELV $2482
endproc UI_LoadTremHumanArmourySells 52 8
proc UI_LoadTremAlienUpgrades 1096 16
line 3933
;3925:
;3926:/*
;3927: ===============
;3928: UI_LoadTremAlienUpgrades
;3929: ===============
;3930: */
;3931:static void
;3932:UI_LoadTremAlienUpgrades(void)
;3933:{
line 3934
;3934:  int i, j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3937
;3935:  int class, credits;
;3936:  char ui_currentClass[MAX_STRING_CHARS];
;3937:  stage_t stage = UI_GetCurrentAlienStage();
ADDRLP4 1044
ADDRGP4 UI_GetCurrentAlienStage
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1044
INDIRI4
ASGNI4
line 3939
;3938:
;3939:  trap_Cvar_VariableStringBuffer("ui_currentClass", ui_currentClass, MAX_STRING_CHARS);
ADDRGP4 $2510
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3940
;3940:  sscanf(ui_currentClass, "%d %d", &class, &credits);
ADDRLP4 20
ARGP4
ADDRGP4 $2346
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 3942
;3941:
;3942:  uiInfo.tremAlienUpgradeCount = 0;
ADDRGP4 uiInfo+667112
CNSTI4 0
ASGNI4
line 3944
;3943:
;3944:  for(i = PCL_NONE + 1;i < PCL_NUM_CLASSES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2512
line 3945
;3945:  {
line 3946
;3946:    if (BG_ClassCanEvolveFromTo(class, i, credits, 0) >= 0 && BG_FindStagesForClass(i, stage)
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1048
ADDRGP4 BG_ClassCanEvolveFromTo
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
LTI4 $2516
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 BG_FindStagesForClass
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $2516
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 BG_ClassIsAllowed
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $2516
line 3948
;3947:        && BG_ClassIsAllowed(i))
;3948:    {
line 3949
;3949:      uiInfo.tremAlienUpgradeList[j].text = String_Alloc(BG_FindHumanNameForClassNum(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 BG_FindHumanNameForClassNum
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666920
ADDP4
ADDRLP4 1064
INDIRP4
ASGNP4
line 3950
;3950:      uiInfo.tremAlienUpgradeList[j].cmd = String_Alloc(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 BG_FindNameForClassNum
CALLP4
ASGNP4
ADDRGP4 $2386
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666920+4
ADDP4
ADDRLP4 1076
INDIRP4
ASGNP4
line 3952
;3951:        "cmd class %s\n", BG_FindNameForClassNum(i)));
;3952:      uiInfo.tremAlienUpgradeList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 BG_FindNameForClassNum
CALLP4
ASGNP4
ADDRGP4 $2390
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666920+8
ADDP4
ADDRLP4 1088
INDIRP4
ASGNP4
line 3955
;3953:        "%sclass", BG_FindNameForClassNum(i)));
;3954:
;3955:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3957
;3956:
;3957:      uiInfo.tremAlienUpgradeCount++;
ADDRLP4 1092
ADDRGP4 uiInfo+667112
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3958
;3958:    }
LABELV $2516
line 3959
;3959:  }
LABELV $2513
line 3944
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $2512
line 3960
;3960:}
LABELV $2509
endproc UI_LoadTremAlienUpgrades 1096 16
proc UI_LoadTremAlienBuilds 72 8
line 3969
;3961:
;3962:/*
;3963: ===============
;3964: UI_LoadTremAlienBuilds
;3965: ===============
;3966: */
;3967:static void
;3968:UI_LoadTremAlienBuilds(void)
;3969:{
line 3971
;3970:  int weapons;
;3971:  int i, j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3974
;3972:  stage_t stage;
;3973:
;3974:  UI_ParseCarriageList(&weapons, NULL);
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_ParseCarriageList
CALLV
pop
line 3975
;3975:  stage = UI_GetCurrentAlienStage();
ADDRLP4 16
ADDRGP4 UI_GetCurrentAlienStage
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 3977
;3976:
;3977:  uiInfo.tremAlienBuildCount = 0;
ADDRGP4 uiInfo+667504
CNSTI4 0
ASGNI4
line 3979
;3978:
;3979:  for(i = BA_NONE + 1;i < BA_NUM_BUILDABLES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2526
line 3980
;3980:  {
line 3981
;3981:    if (BG_FindTeamForBuildable(i) == BIT_ALIENS && BG_FindBuildWeaponForBuildable(i) & weapons
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $2530
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindBuildWeaponForBuildable
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2530
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindStagesForBuildable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2530
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_BuildableIsAllowed
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2530
line 3983
;3982:        && BG_FindStagesForBuildable(i, stage) && BG_BuildableIsAllowed(i))
;3983:    {
line 3984
;3984:      uiInfo.tremAlienBuildList[j].text = String_Alloc(BG_FindHumanNameForBuildable(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667120
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 3985
;3985:      uiInfo.tremAlienBuildList[j].cmd = String_Alloc(va("cmd build %s\n", BG_FindNameForBuildable(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $2535
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667120+4
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 3987
;3986:        i)));
;3987:      uiInfo.tremAlienBuildList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $2538
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667120+8
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 3990
;3988:        "%sbuild", BG_FindNameForBuildable(i)));
;3989:
;3990:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3992
;3991:
;3992:      uiInfo.tremAlienBuildCount++;
ADDRLP4 68
ADDRGP4 uiInfo+667504
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3993
;3993:    }
LABELV $2530
line 3994
;3994:  }
LABELV $2527
line 3979
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
LTI4 $2526
line 3995
;3995:}
LABELV $2524
endproc UI_LoadTremAlienBuilds 72 8
proc UI_LoadTremHumanBuilds 72 8
line 4004
;3996:
;3997:/*
;3998: ===============
;3999: UI_LoadTremHumanBuilds
;4000: ===============
;4001: */
;4002:static void
;4003:UI_LoadTremHumanBuilds(void)
;4004:{
line 4006
;4005:  int weapons;
;4006:  int i, j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4009
;4007:  stage_t stage;
;4008:
;4009:  UI_ParseCarriageList(&weapons, NULL);
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_ParseCarriageList
CALLV
pop
line 4010
;4010:  stage = UI_GetCurrentHumanStage();
ADDRLP4 16
ADDRGP4 UI_GetCurrentHumanStage
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 4012
;4011:
;4012:  uiInfo.tremHumanBuildCount = 0;
ADDRGP4 uiInfo+667896
CNSTI4 0
ASGNI4
line 4014
;4013:
;4014:  for(i = BA_NONE + 1;i < BA_NUM_BUILDABLES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2542
line 4015
;4015:  {
line 4016
;4016:    if (BG_FindTeamForBuildable(i) == BIT_HUMANS && BG_FindBuildWeaponForBuildable(i) & weapons
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $2546
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindBuildWeaponForBuildable
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2546
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindStagesForBuildable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2546
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_BuildableIsAllowed
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2546
line 4018
;4017:        && BG_FindStagesForBuildable(i, stage) && BG_BuildableIsAllowed(i))
;4018:    {
line 4019
;4019:      uiInfo.tremHumanBuildList[j].text = String_Alloc(BG_FindHumanNameForBuildable(i));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667512
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 4020
;4020:      uiInfo.tremHumanBuildList[j].cmd = String_Alloc(va("cmd build %s\n", BG_FindNameForBuildable(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $2535
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667512+4
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 4022
;4021:        i)));
;4022:      uiInfo.tremHumanBuildList[j].infopane = UI_FindInfoPaneByName(va(
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $2538
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_FindInfoPaneByName
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667512+8
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 4025
;4023:        "%sbuild", BG_FindNameForBuildable(i)));
;4024:
;4025:      j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4027
;4026:
;4027:      uiInfo.tremHumanBuildCount++;
ADDRLP4 68
ADDRGP4 uiInfo+667896
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4028
;4028:    }
LABELV $2546
line 4029
;4029:  }
LABELV $2543
line 4014
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
LTI4 $2542
line 4030
;4030:}
LABELV $2540
endproc UI_LoadTremHumanBuilds 72 8
proc UI_LoadMods 2092 16
line 4039
;4031:
;4032:/*
;4033: ===============
;4034: UI_LoadMods
;4035: ===============
;4036: */
;4037:static void
;4038:UI_LoadMods(void)
;4039:{
line 4047
;4040:  int numdirs;
;4041:  char dirlist[2048];
;4042:  char *dirptr;
;4043:  char *descptr;
;4044:  int i;
;4045:  int dirlen;
;4046:
;4047:  uiInfo.modCount = 0;
ADDRGP4 uiInfo+97128
CNSTI4 0
ASGNI4
line 4048
;4048:  numdirs = trap_FS_GetFileList("$modlist", "", dirlist, sizeof(dirlist));
ADDRGP4 $2556
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 4049
;4049:  dirptr = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 4050
;4050:  for(i = 0;i < numdirs;i++)
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2560
JUMPV
LABELV $2557
line 4051
;4051:  {
line 4052
;4052:    dirlen = strlen(dirptr) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4053
;4053:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4054
;4054:    uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97128
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96616
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 4055
;4055:    uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97128
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96616+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 4056
;4056:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4057
;4057:    uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+97128
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4058
;4058:    if (uiInfo.modCount >= MAX_MODS)
ADDRGP4 uiInfo+97128
INDIRI4
CNSTI4 64
LTI4 $2567
line 4059
;4059:    {
line 4060
;4060:      break;
ADDRGP4 $2559
JUMPV
LABELV $2567
line 4062
;4061:    }
;4062:  }
LABELV $2558
line 4050
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2560
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2557
LABELV $2559
line 4064
;4063:
;4064:}
LABELV $2554
endproc UI_LoadMods 2092 16
proc UI_LoadMovies 4124 16
line 4073
;4065:
;4066:/*
;4067: ===============
;4068: UI_LoadMovies
;4069: ===============
;4070: */
;4071:static void
;4072:UI_LoadMovies(void)
;4073:{
line 4078
;4074:  char movielist[4096];
;4075:  char *moviename;
;4076:  int i, len;
;4077:
;4078:  uiInfo.movieCount = trap_FS_GetFileList("video", "roq", movielist, 4096);
ADDRGP4 $2572
ARGP4
ADDRGP4 $2573
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+99192
ADDRLP4 4108
INDIRI4
ASGNI4
line 4080
;4079:
;4080:  if (uiInfo.movieCount)
ADDRGP4 uiInfo+99192
INDIRI4
CNSTI4 0
EQI4 $2574
line 4081
;4081:  {
line 4082
;4082:    if (uiInfo.movieCount > MAX_MOVIES)
ADDRGP4 uiInfo+99192
INDIRI4
CNSTI4 256
LEI4 $2577
line 4083
;4083:    {
line 4084
;4084:      uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+99192
CNSTI4 256
ASGNI4
line 4085
;4085:    }
LABELV $2577
line 4086
;4086:    moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 4087
;4087:    for(i = 0;i < uiInfo.movieCount;i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2584
JUMPV
LABELV $2581
line 4088
;4088:    {
line 4089
;4089:      len = strlen(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 4090
;4090:      if (!Q_stricmp(moviename + len - 4, ".roq"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2588
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2586
line 4091
;4091:      {
line 4092
;4092:        moviename[len - 4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4093
;4093:      }
LABELV $2586
line 4094
;4094:      Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 4095
;4095:      uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98168
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 4096
;4096:      moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4097
;4097:    }
LABELV $2582
line 4087
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2584
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+99192
INDIRI4
LTI4 $2581
line 4098
;4098:  }
LABELV $2574
line 4100
;4099:
;4100:}
LABELV $2570
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 4109
;4101:
;4102:/*
;4103: ===============
;4104: UI_LoadDemos
;4105: ===============
;4106: */
;4107:static void
;4108:UI_LoadDemos(void)
;4109:{
line 4115
;4110:  char demolist[4096];
;4111:  char demoExt[32];
;4112:  char *demoname;
;4113:  int i, len;
;4114:
;4115:  Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int) trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2592
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2591
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4117
;4116:
;4117:  uiInfo.demoCount = trap_FS_GetFileList("demos", demoExt, demolist, 4096);
ADDRGP4 $2594
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+98160
ADDRLP4 4144
INDIRI4
ASGNI4
line 4119
;4118:
;4119:  Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int) trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2592
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2595
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4121
;4120:
;4121:  if (uiInfo.demoCount)
ADDRGP4 uiInfo+98160
INDIRI4
CNSTI4 0
EQI4 $2596
line 4122
;4122:  {
line 4123
;4123:    if (uiInfo.demoCount > MAX_DEMOS)
ADDRGP4 uiInfo+98160
INDIRI4
CNSTI4 256
LEI4 $2599
line 4124
;4124:    {
line 4125
;4125:      uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+98160
CNSTI4 256
ASGNI4
line 4126
;4126:    }
LABELV $2599
line 4127
;4127:    demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 4128
;4128:    for(i = 0;i < uiInfo.demoCount;i++)
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2606
JUMPV
LABELV $2603
line 4129
;4129:    {
line 4130
;4130:      len = strlen(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 4131
;4131:      if (!Q_stricmp(demoname + len - strlen(demoExt), demoExt))
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2608
line 4132
;4132:      {
line 4133
;4133:        demoname[len - strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4134
;4134:      }
LABELV $2608
line 4135
;4135:      Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 4136
;4136:      uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97136
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 4137
;4137:      demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4138
;4138:    }
LABELV $2604
line 4128
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2606
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+98160
INDIRI4
LTI4 $2603
line 4139
;4139:  }
LABELV $2596
line 4141
;4140:
;4141:}
LABELV $2590
endproc UI_LoadDemos 4168 16
proc UI_SetNextMap 8 16
line 4145
;4142:
;4143:static qboolean
;4144:UI_SetNextMap(int actual, int index)
;4145:{
line 4147
;4146:  int i;
;4147:  for(i = actual + 1;i < uiInfo.mapCount;i++)
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2615
JUMPV
LABELV $2612
line 4148
;4148:  {
line 4149
;4149:    if (uiInfo.mapList[i].active)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2617
line 4150
;4150:    {
line 4151
;4151:      Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2621
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4152
;4152:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2611
JUMPV
LABELV $2617
line 4154
;4153:    }
;4154:  }
LABELV $2613
line 4147
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2615
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LTI4 $2612
line 4155
;4155:  return qfalse;
CNSTI4 0
RETI4
LABELV $2611
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1156 32
line 4160
;4156:}
;4157:
;4158:static void
;4159:UI_StartSkirmish(qboolean next)
;4160:{
line 4165
;4161:  int i, k, g, delay, temp;
;4162:  float skill;
;4163:  char buff[MAX_STRING_CHARS];
;4164:
;4165:  if (next)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2623
line 4166
;4166:  {
line 4168
;4167:    int actual;
;4168:    int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $2625
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1056
INDIRF4
CVFI4 4
ASGNI4
line 4169
;4169:    UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4170
;4170:    UI_SelectedMap(index, &actual);
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 4171
;4171:    if (UI_SetNextMap(actual, index))
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $2626
line 4172
;4172:    {
line 4173
;4173:    }
ADDRGP4 $2627
JUMPV
LABELV $2626
line 4175
;4174:    else
;4175:    {
line 4176
;4176:      UI_GameType_HandleKey(0, NULL, K_MOUSE1, qfalse);
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4177
;4177:      UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4178
;4178:      Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2621
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4179
;4179:    }
LABELV $2627
line 4180
;4180:  }
LABELV $2623
line 4182
;4181:
;4182:  g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1044
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ASGNI4
line 4183
;4183:  trap_Cvar_SetValue("g_gametype", g);
ADDRGP4 $2631
ARGP4
ADDRLP4 1044
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4184
;4184:  trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $2632
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4186
;4185:    "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName));
;4186:  skill = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $1100
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1052
INDIRF4
ASGNF4
line 4187
;4187:  trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2636
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4189
;4188:
;4189:  k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1060
INDIRI4
ASGNI4
line 4191
;4190:
;4191:  trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $2639
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4194
;4192:
;4193:  // set up sp overrides, will be replaced on postgame
;4194:  temp = trap_Cvar_VariableValue("capturelimit");
ADDRGP4 $932
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 4195
;4195:  trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2640
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4196
;4196:  temp = trap_Cvar_VariableValue("fraglimit");
ADDRGP4 $933
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 4197
;4197:  trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2641
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4199
;4198:
;4199:  UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 4201
;4200:
;4201:  temp = trap_Cvar_VariableValue("cg_drawTimer");
ADDRGP4 $2642
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 4202
;4202:  trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2643
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4203
;4203:  temp = trap_Cvar_VariableValue("g_doWarmup");
ADDRGP4 $2644
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 4204
;4204:  trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2645
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4205
;4205:  temp = trap_Cvar_VariableValue("g_friendlyFire");
ADDRGP4 $2646
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 4206
;4206:  trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2647
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4207
;4207:  temp = trap_Cvar_VariableValue("sv_maxClients");
ADDRGP4 $2648
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 4208
;4208:  trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2649
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4209
;4209:  temp = trap_Cvar_VariableValue("g_warmup");
ADDRGP4 $2650
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 4210
;4210:  trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2651
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4211
;4211:  temp = trap_Cvar_VariableValue("sv_pure");
ADDRGP4 $2652
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 4212
;4212:  trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $2027
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2653
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4214
;4213:
;4214:  trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4215
;4215:  trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $458
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4216
;4216:  trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2642
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4217
;4217:  trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2644
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4218
;4218:  trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $2650
ARGP4
ADDRGP4 $919
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4219
;4219:  trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2652
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4220
;4220:  trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2646
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4221
;4221:  trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 1128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2654
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4222
;4222:  trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 1132
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2655
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4224
;4223:
;4224:  if (trap_Cvar_VariableValue("ui_recordSPDemo"))
ADDRGP4 $2658
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1136
INDIRF4
CNSTF4 0
EQF4 $2656
line 4225
;4225:  {
line 4226
;4226:    Com_sprintf(
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2659
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4228
;4227:      buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
;4228:    trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2663
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4229
;4229:  }
LABELV $2656
line 4231
;4230:
;4231:  delay = 500;
ADDRLP4 1032
CNSTI4 500
ASGNI4
line 4233
;4232:
;4233:  {
line 4234
;4234:    temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1040
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4235
;4235:    trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $930
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2648
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4236
;4236:    for(i = 0;i < uiInfo.mapList[ui_currentMap.integer].teamMembers;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2670
JUMPV
LABELV $2667
line 4237
;4237:    {
line 4238
;4238:      Com_sprintf(buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2674
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1036
INDIRF4
ARGF4
ADDRGP4 $131
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4240
;4239:        uiInfo.teamList[k].teamMembers[i]), skill, "", delay, uiInfo.teamList[k].teamMembers[i]);
;4240:      trap_Cmd_ExecuteText(EXEC_APPEND, buff);
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4241
;4241:      delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4242
;4242:    }
LABELV $2668
line 4236
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2670
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+16
ADDP4
INDIRI4
LTI4 $2667
line 4243
;4243:    k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1148
INDIRI4
ASGNI4
line 4244
;4244:    for(i = 0;i < uiInfo.mapList[ui_currentMap.integer].teamMembers - 1;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2682
JUMPV
LABELV $2679
line 4245
;4245:    {
line 4246
;4246:      Com_sprintf(buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1152
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2674
ARGP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1036
INDIRF4
ARGF4
ADDRGP4 $131
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4248
;4247:        uiInfo.teamList[k].teamMembers[i]), skill, "", delay, uiInfo.teamList[k].teamMembers[i]);
;4248:      trap_Cmd_ExecuteText(EXEC_APPEND, buff);
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4249
;4249:      delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4250
;4250:    }
LABELV $2680
line 4244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2682
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2679
line 4251
;4251:  }
line 4252
;4252:}
LABELV $2622
endproc UI_StartSkirmish 1156 32
proc UI_Update 36 8
line 4256
;4253:
;4254:static void
;4255:UI_Update(const char *name)
;4256:{
line 4257
;4257:  int val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 4259
;4258:
;4259:  if (Q_stricmp(name, "ui_SetName") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2693
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2691
line 4260
;4260:  {
line 4261
;4261:    trap_Cvar_Set("name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $2694
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $710
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4262
;4262:  }
ADDRGP4 $2692
JUMPV
LABELV $2691
line 4263
;4263:  else if (Q_stricmp(name, "ui_setRate") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2697
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2695
line 4264
;4264:  {
line 4265
;4265:    float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $2698
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20
INDIRF4
ASGNF4
line 4266
;4266:    if (rate >= 5000)
ADDRLP4 16
INDIRF4
CNSTF4 1167867904
LTF4 $2699
line 4267
;4267:    {
line 4268
;4268:      trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $2701
ARGP4
ADDRGP4 $916
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4269
;4269:      trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $2702
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4270
;4270:    }
ADDRGP4 $2696
JUMPV
LABELV $2699
line 4271
;4271:    else if (rate >= 4000)
ADDRLP4 16
INDIRF4
CNSTF4 1165623296
LTF4 $2703
line 4272
;4272:    {
line 4273
;4273:      trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2701
ARGP4
ADDRGP4 $919
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4274
;4274:      trap_Cvar_Set("cl_packetdup", "2"); // favor less prediction errors when there's packet loss
ADDRGP4 $2702
ARGP4
ADDRGP4 $2705
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4275
;4275:    }
ADDRGP4 $2696
JUMPV
LABELV $2703
line 4277
;4276:    else
;4277:    {
line 4278
;4278:      trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2701
ARGP4
ADDRGP4 $919
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4279
;4279:      trap_Cvar_Set("cl_packetdup", "1"); // favor lower bandwidth
ADDRGP4 $2702
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4280
;4280:    }
line 4281
;4281:  }
ADDRGP4 $2696
JUMPV
LABELV $2695
line 4282
;4282:  else if (Q_stricmp(name, "ui_GetName") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2708
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2706
line 4283
;4283:  {
line 4284
;4284:    trap_Cvar_Set("ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $710
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2694
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4285
;4285:  }
ADDRGP4 $2707
JUMPV
LABELV $2706
line 4286
;4286:  else if (Q_stricmp(name, "r_colorbits") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2711
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2709
line 4287
;4287:  {
line 4288
;4288:    switch(val)
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2717
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $2720
LABELV $2719
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2714
ADDRGP4 $2710
JUMPV
LABELV $2720
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $2718
ADDRGP4 $2710
JUMPV
line 4289
;4289:    {
LABELV $2714
line 4291
;4290:      case 0:
;4291:        trap_Cvar_SetValue("r_depthbits", 0);
ADDRGP4 $2715
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4292
;4292:        trap_Cvar_SetValue("r_stencilbits", 0);
ADDRGP4 $2716
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4293
;4293:        break;
ADDRGP4 $2710
JUMPV
LABELV $2717
line 4295
;4294:      case 16:
;4295:        trap_Cvar_SetValue("r_depthbits", 16);
ADDRGP4 $2715
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4296
;4296:        trap_Cvar_SetValue("r_stencilbits", 0);
ADDRGP4 $2716
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4297
;4297:        break;
ADDRGP4 $2710
JUMPV
LABELV $2718
line 4299
;4298:      case 32:
;4299:        trap_Cvar_SetValue("r_depthbits", 24);
ADDRGP4 $2715
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4300
;4300:        break;
line 4302
;4301:    }
;4302:  }
ADDRGP4 $2710
JUMPV
LABELV $2709
line 4303
;4303:  else if (Q_stricmp(name, "r_lodbias") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2723
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2721
line 4304
;4304:  {
line 4305
;4305:    switch(val)
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2726
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $2728
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $2729
ADDRGP4 $2722
JUMPV
line 4306
;4306:    {
LABELV $2726
line 4308
;4307:      case 0:
;4308:        trap_Cvar_SetValue("r_subdivisions", 4);
ADDRGP4 $2727
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4309
;4309:        break;
ADDRGP4 $2722
JUMPV
LABELV $2728
line 4311
;4310:      case 1:
;4311:        trap_Cvar_SetValue("r_subdivisions", 12);
ADDRGP4 $2727
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4312
;4312:        break;
ADDRGP4 $2722
JUMPV
LABELV $2729
line 4314
;4313:      case 2:
;4314:        trap_Cvar_SetValue("r_subdivisions", 20);
ADDRGP4 $2727
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4315
;4315:        break;
line 4317
;4316:    }
;4317:  }
ADDRGP4 $2722
JUMPV
LABELV $2721
line 4318
;4318:  else if (Q_stricmp(name, "ui_glCustom") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2732
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2730
line 4319
;4319:  {
line 4320
;4320:    switch(val)
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $2731
ADDRLP4 32
INDIRI4
CNSTI4 3
GTI4 $2731
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2751
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2751
address $2735
address $2747
address $2748
address $2750
code
line 4321
;4321:    {
LABELV $2735
line 4323
;4322:      case 0: // high quality
;4323:        trap_Cvar_SetValue("r_fullScreen", 1);
ADDRGP4 $2736
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4324
;4324:        trap_Cvar_SetValue("r_subdivisions", 4);
ADDRGP4 $2727
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4325
;4325:        trap_Cvar_SetValue("r_vertexlight", 0);
ADDRGP4 $2737
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4326
;4326:        trap_Cvar_SetValue("r_lodbias", 0);
ADDRGP4 $2723
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4327
;4327:        trap_Cvar_SetValue("r_colorbits", 32);
ADDRGP4 $2711
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4328
;4328:        trap_Cvar_SetValue("r_depthbits", 24);
ADDRGP4 $2715
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4329
;4329:        trap_Cvar_SetValue("r_picmip", 0);
ADDRGP4 $2738
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4330
;4330:        trap_Cvar_SetValue("r_mode", 4);
ADDRGP4 $2739
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4331
;4331:        trap_Cvar_SetValue("r_texturebits", 32);
ADDRGP4 $2740
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4332
;4332:        trap_Cvar_SetValue("r_fastSky", 0);
ADDRGP4 $2741
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4333
;4333:        trap_Cvar_SetValue("r_inGameVideo", 1);
ADDRGP4 $2742
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4334
;4334:        trap_Cvar_SetValue("cg_shadows", 1);
ADDRGP4 $2743
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4335
;4335:        trap_Cvar_SetValue("cg_brassTime", 2500);
ADDRGP4 $2744
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4336
;4336:        trap_Cvar_Set("r_texturemode", "GL_LINEAR_MIPMAP_LINEAR");
ADDRGP4 $2745
ARGP4
ADDRGP4 $2746
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4337
;4337:        break;
ADDRGP4 $2731
JUMPV
LABELV $2747
line 4339
;4338:      case 1: // normal
;4339:        trap_Cvar_SetValue("r_fullScreen", 1);
ADDRGP4 $2736
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4340
;4340:        trap_Cvar_SetValue("r_subdivisions", 12);
ADDRGP4 $2727
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4341
;4341:        trap_Cvar_SetValue("r_vertexlight", 0);
ADDRGP4 $2737
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4342
;4342:        trap_Cvar_SetValue("r_lodbias", 0);
ADDRGP4 $2723
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4343
;4343:        trap_Cvar_SetValue("r_colorbits", 0);
ADDRGP4 $2711
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4344
;4344:        trap_Cvar_SetValue("r_depthbits", 24);
ADDRGP4 $2715
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4345
;4345:        trap_Cvar_SetValue("r_picmip", 1);
ADDRGP4 $2738
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4346
;4346:        trap_Cvar_SetValue("r_mode", 3);
ADDRGP4 $2739
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4347
;4347:        trap_Cvar_SetValue("r_texturebits", 0);
ADDRGP4 $2740
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4348
;4348:        trap_Cvar_SetValue("r_fastSky", 0);
ADDRGP4 $2741
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4349
;4349:        trap_Cvar_SetValue("r_inGameVideo", 1);
ADDRGP4 $2742
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4350
;4350:        trap_Cvar_SetValue("cg_brassTime", 2500);
ADDRGP4 $2744
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4351
;4351:        trap_Cvar_Set("r_texturemode", "GL_LINEAR_MIPMAP_LINEAR");
ADDRGP4 $2745
ARGP4
ADDRGP4 $2746
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4352
;4352:        trap_Cvar_SetValue("cg_shadows", 0);
ADDRGP4 $2743
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4353
;4353:        break;
ADDRGP4 $2731
JUMPV
LABELV $2748
line 4355
;4354:      case 2: // fast
;4355:        trap_Cvar_SetValue("r_fullScreen", 1);
ADDRGP4 $2736
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4356
;4356:        trap_Cvar_SetValue("r_subdivisions", 8);
ADDRGP4 $2727
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4357
;4357:        trap_Cvar_SetValue("r_vertexlight", 0);
ADDRGP4 $2737
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4358
;4358:        trap_Cvar_SetValue("r_lodbias", 1);
ADDRGP4 $2723
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4359
;4359:        trap_Cvar_SetValue("r_colorbits", 0);
ADDRGP4 $2711
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4360
;4360:        trap_Cvar_SetValue("r_depthbits", 0);
ADDRGP4 $2715
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4361
;4361:        trap_Cvar_SetValue("r_picmip", 1);
ADDRGP4 $2738
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4362
;4362:        trap_Cvar_SetValue("r_mode", 3);
ADDRGP4 $2739
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4363
;4363:        trap_Cvar_SetValue("r_texturebits", 0);
ADDRGP4 $2740
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4364
;4364:        trap_Cvar_SetValue("cg_shadows", 0);
ADDRGP4 $2743
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4365
;4365:        trap_Cvar_SetValue("r_fastSky", 1);
ADDRGP4 $2741
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4366
;4366:        trap_Cvar_SetValue("r_inGameVideo", 0);
ADDRGP4 $2742
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4367
;4367:        trap_Cvar_SetValue("cg_brassTime", 0);
ADDRGP4 $2744
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4368
;4368:        trap_Cvar_Set("r_texturemode", "GL_LINEAR_MIPMAP_NEAREST");
ADDRGP4 $2745
ARGP4
ADDRGP4 $2749
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4369
;4369:        break;
ADDRGP4 $2731
JUMPV
LABELV $2750
line 4371
;4370:      case 3: // fastest
;4371:        trap_Cvar_SetValue("r_fullScreen", 1);
ADDRGP4 $2736
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4372
;4372:        trap_Cvar_SetValue("r_subdivisions", 20);
ADDRGP4 $2727
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4373
;4373:        trap_Cvar_SetValue("r_vertexlight", 1);
ADDRGP4 $2737
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4374
;4374:        trap_Cvar_SetValue("r_lodbias", 2);
ADDRGP4 $2723
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4375
;4375:        trap_Cvar_SetValue("r_colorbits", 16);
ADDRGP4 $2711
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4376
;4376:        trap_Cvar_SetValue("r_depthbits", 16);
ADDRGP4 $2715
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4377
;4377:        trap_Cvar_SetValue("r_mode", 3);
ADDRGP4 $2739
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4378
;4378:        trap_Cvar_SetValue("r_picmip", 2);
ADDRGP4 $2738
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4379
;4379:        trap_Cvar_SetValue("r_texturebits", 16);
ADDRGP4 $2740
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4380
;4380:        trap_Cvar_SetValue("cg_shadows", 0);
ADDRGP4 $2743
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4381
;4381:        trap_Cvar_SetValue("cg_brassTime", 0);
ADDRGP4 $2744
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4382
;4382:        trap_Cvar_SetValue("r_fastSky", 1);
ADDRGP4 $2741
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4383
;4383:        trap_Cvar_SetValue("r_inGameVideo", 0);
ADDRGP4 $2742
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4384
;4384:        trap_Cvar_Set("r_texturemode", "GL_LINEAR_MIPMAP_NEAREST");
ADDRGP4 $2745
ARGP4
ADDRGP4 $2749
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4385
;4385:        break;
line 4387
;4386:    }
;4387:  }
ADDRGP4 $2731
JUMPV
LABELV $2730
line 4388
;4388:  else if (Q_stricmp(name, "ui_mousePitch") == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2754
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2752
line 4389
;4389:  {
line 4390
;4390:    if (val == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2755
line 4391
;4391:    {
line 4392
;4392:      trap_Cvar_SetValue("m_pitch", 0.022f);
ADDRGP4 $2757
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4393
;4393:    }
ADDRGP4 $2756
JUMPV
LABELV $2755
line 4395
;4394:    else
;4395:    {
line 4396
;4396:      trap_Cvar_SetValue("m_pitch", -0.022f);
ADDRGP4 $2757
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4397
;4397:    }
LABELV $2756
line 4398
;4398:  }
LABELV $2752
LABELV $2731
LABELV $2722
LABELV $2710
LABELV $2707
LABELV $2696
LABELV $2692
line 4399
;4399:}
LABELV $2690
endproc UI_Update 36 8
proc UI_RunMenuScript 1372 20
line 4403
;4400:
;4401:static void
;4402:UI_RunMenuScript(char **args)
;4403:{
line 4408
;4404:  const char *name, *name2;
;4405:  char buff[1024];
;4406:  const char *cmd;
;4407:
;4408:  if (String_Parse(args, &name))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1036
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2759
line 4409
;4409:  {
line 4410
;4410:    if (Q_stricmp(name, "StartServer") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2763
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2761
line 4411
;4411:    {
line 4414
;4412:      int i, clients, oldclients;
;4413:      float skill;
;4414:      trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $458
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4415
;4415:      trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4416
;4416:      trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2639
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4417
;4417:      trap_Cvar_SetValue("dedicated", Com_Clamp(0, 2, ui_dedicated.integer));
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2764
ARGP4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4418
;4418:      trap_Cvar_SetValue("g_gametype", Com_Clamp(
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1064
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2631
ARGP4
ADDRLP4 1064
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4420
;4419:        0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
;4420:      trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2654
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4421
;4421:      trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1361
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2655
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4422
;4422:      trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $2632
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4424
;4423:        "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName));
;4424:      skill = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $1100
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1052
ADDRLP4 1080
INDIRF4
ASGNF4
line 4426
;4425:      // set max clients based on spots
;4426:      oldclients = trap_Cvar_VariableValue("sv_maxClients");
ADDRGP4 $2648
ARGP4
ADDRLP4 1084
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1056
ADDRLP4 1084
INDIRF4
CVFI4 4
ASGNI4
line 4427
;4427:      clients = 0;
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 4428
;4428:      for(i = 0;i < PLAYERS_PER_TEAM;i++)
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $2772
line 4429
;4429:      {
line 4430
;4430:        int bot = trap_Cvar_VariableValue(va("ui_blueteam%i", i + 1));
ADDRGP4 $1122
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 4431
;4431:        if (bot >= 0)
ADDRLP4 1088
INDIRI4
CNSTI4 0
LTI4 $2776
line 4432
;4432:        {
line 4433
;4433:          clients++;
ADDRLP4 1048
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4434
;4434:        }
LABELV $2776
line 4435
;4435:        bot = trap_Cvar_VariableValue(va("ui_redteam%i", i + 1));
ADDRGP4 $1123
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 4436
;4436:        if (bot >= 0)
ADDRLP4 1088
INDIRI4
CNSTI4 0
LTI4 $2778
line 4437
;4437:        {
line 4438
;4438:          clients++;
ADDRLP4 1048
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4439
;4439:        }
LABELV $2778
line 4440
;4440:      }
LABELV $2773
line 4428
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 5
LTI4 $2772
line 4441
;4441:      if (clients == 0)
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2780
line 4442
;4442:      {
line 4443
;4443:        clients = 8;
ADDRLP4 1048
CNSTI4 8
ASGNI4
line 4444
;4444:      }
LABELV $2780
line 4446
;4445:
;4446:      if (oldclients > clients)
ADDRLP4 1056
INDIRI4
ADDRLP4 1048
INDIRI4
LEI4 $2782
line 4447
;4447:      {
line 4448
;4448:        clients = oldclients;
ADDRLP4 1048
ADDRLP4 1056
INDIRI4
ASGNI4
line 4449
;4449:      }
LABELV $2782
line 4451
;4450:
;4451:      trap_Cvar_Set("sv_maxClients", va("%d", clients));
ADDRGP4 $930
ARGP4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2648
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4453
;4452:
;4453:      for(i = 0;i < PLAYERS_PER_TEAM;i++)
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $2784
line 4454
;4454:      {
line 4455
;4455:        int bot = trap_Cvar_VariableValue(va("ui_blueteam%i", i + 1));
ADDRGP4 $1122
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1100
INDIRF4
CVFI4 4
ASGNI4
line 4456
;4456:        if (bot > 1)
ADDRLP4 1092
INDIRI4
CNSTI4 1
LEI4 $2788
line 4457
;4457:        {
line 4458
;4458:          Com_sprintf(buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot - 2), skill);
ADDRLP4 1092
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1104
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2790
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4459
;4459:          trap_Cmd_ExecuteText(EXEC_APPEND, buff);
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4460
;4460:        }
LABELV $2788
line 4461
;4461:        bot = trap_Cvar_VariableValue(va("ui_redteam%i", i + 1));
ADDRGP4 $1123
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1108
INDIRF4
CVFI4 4
ASGNI4
line 4462
;4462:        if (bot > 1)
ADDRLP4 1092
INDIRI4
CNSTI4 1
LEI4 $2791
line 4463
;4463:        {
line 4464
;4464:          Com_sprintf(buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot - 2), skill);
ADDRLP4 1092
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1112
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2790
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4465
;4465:          trap_Cmd_ExecuteText(EXEC_APPEND, buff);
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4466
;4466:        }
LABELV $2791
line 4467
;4467:      }
LABELV $2785
line 4453
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 5
LTI4 $2784
line 4468
;4468:    }
ADDRGP4 $2762
JUMPV
LABELV $2761
line 4469
;4469:    else if (Q_stricmp(name, "updateSPMenu") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2795
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2793
line 4470
;4470:    {
line 4471
;4471:      UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 4472
;4472:      UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4473
;4473:      ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1048
INDIRI4
ASGNI4
line 4474
;4474:      trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2625
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4475
;4475:      Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2621
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4476
;4476:      UI_GameType_HandleKey(0, NULL, K_MOUSE1, qfalse);
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4477
;4477:      UI_GameType_HandleKey(0, NULL, K_MOUSE2, qfalse);
ADDRLP4 1060
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 179
ARGI4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4478
;4478:    }
ADDRGP4 $2794
JUMPV
LABELV $2793
line 4479
;4479:    else if (Q_stricmp(name, "resetDefaults") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2802
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2800
line 4480
;4480:    {
line 4481
;4481:      trap_Cmd_ExecuteText(EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $2803
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4482
;4482:      trap_Cmd_ExecuteText(EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2804
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4483
;4483:      Controls_SetDefaults();
ADDRGP4 Controls_SetDefaults
CALLV
pop
line 4484
;4484:      trap_Cvar_Set("com_introPlayed", "1");
ADDRGP4 $2805
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4485
;4485:      trap_Cmd_ExecuteText(EXEC_APPEND, "vid_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2806
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4486
;4486:    }
ADDRGP4 $2801
JUMPV
LABELV $2800
line 4487
;4487:    else if (Q_stricmp(name, "loadArenas") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2809
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2807
line 4488
;4488:    {
line 4489
;4489:      UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 4490
;4490:      UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4491
;4491:      Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2810
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4492
;4492:    }
ADDRGP4 $2808
JUMPV
LABELV $2807
line 4493
;4493:    else if (Q_stricmp(name, "saveControls") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2813
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2811
line 4494
;4494:    {
line 4495
;4495:      Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 4496
;4496:    }
ADDRGP4 $2812
JUMPV
LABELV $2811
line 4497
;4497:    else if (Q_stricmp(name, "loadControls") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2816
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2814
line 4498
;4498:    {
line 4499
;4499:      Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 4500
;4500:    }
ADDRGP4 $2815
JUMPV
LABELV $2814
line 4501
;4501:    else if (Q_stricmp(name, "clearError") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2819
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2817
line 4502
;4502:    {
line 4503
;4503:      trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2820
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4504
;4504:    }
ADDRGP4 $2818
JUMPV
LABELV $2817
line 4505
;4505:    else if (Q_stricmp(name, "loadGameInfo") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2823
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2821
line 4506
;4506:    {
line 4509
;4507:      /*      UI_ParseGameInfo("gameinfo.txt");
;4508:       UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);*/
;4509:    }
ADDRGP4 $2822
JUMPV
LABELV $2821
line 4510
;4510:    else if (Q_stricmp(name, "resetScores") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2826
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2824
line 4511
;4511:    {
line 4512
;4512:      UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 4513
;4513:    }
ADDRGP4 $2825
JUMPV
LABELV $2824
line 4514
;4514:    else if (Q_stricmp(name, "RefreshServers") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2829
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $2827
line 4515
;4515:    {
line 4516
;4516:      UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4517
;4517:      UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4518
;4518:    }
ADDRGP4 $2828
JUMPV
LABELV $2827
line 4519
;4519:    else if (Q_stricmp(name, "RefreshFilter") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2832
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $2830
line 4520
;4520:    {
line 4521
;4521:      UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4522
;4522:      UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4523
;4523:    }
ADDRGP4 $2831
JUMPV
LABELV $2830
line 4524
;4524:    else if (Q_stricmp(name, "RunSPDemo") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2835
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $2833
line 4525
;4525:    {
line 4526
;4526:      if (uiInfo.demoAvailable)
ADDRGP4 uiInfo+73372
INDIRI4
CNSTI4 0
EQI4 $2834
line 4527
;4527:      {
line 4528
;4528:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $2839
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4531
;4529:          "demo %s_%i\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName,
;4530:          uiInfo.gameTypes[ui_gameType.integer].gtEnum));
;4531:      }
line 4532
;4532:    }
ADDRGP4 $2834
JUMPV
LABELV $2833
line 4533
;4533:    else if (Q_stricmp(name, "LoadDemos") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2848
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $2846
line 4534
;4534:    {
line 4535
;4535:      UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 4536
;4536:    }
ADDRGP4 $2847
JUMPV
LABELV $2846
line 4537
;4537:    else if (Q_stricmp(name, "LoadMovies") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2851
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $2849
line 4538
;4538:    {
line 4539
;4539:      UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 4540
;4540:    }
ADDRGP4 $2850
JUMPV
LABELV $2849
line 4541
;4541:    else if (Q_stricmp(name, "LoadMods") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2854
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2852
line 4542
;4542:    {
line 4543
;4543:      UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 4544
;4544:    }
ADDRGP4 $2853
JUMPV
LABELV $2852
line 4547
;4545:
;4546:    //TA: tremulous menus
;4547:    else if (Q_stricmp(name, "LoadTeams") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2857
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2855
line 4548
;4548:      UI_LoadTremTeams();
ADDRGP4 UI_LoadTremTeams
CALLV
pop
ADDRGP4 $2856
JUMPV
LABELV $2855
line 4549
;4549:    else if (Q_stricmp(name, "JoinTeam") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2860
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2858
line 4550
;4550:    {
line 4551
;4551:      if ((cmd = uiInfo.tremTeamList[uiInfo.tremTeamIndex].cmd))
ADDRLP4 1108
CNSTI4 12
ADDRGP4 uiInfo+666044
INDIRI4
MULI4
ADDRGP4 uiInfo+665992+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1108
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2859
line 4552
;4552:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4553
;4553:    }
ADDRGP4 $2859
JUMPV
LABELV $2858
line 4554
;4554:    else if (Q_stricmp(name, "LoadHumanItems") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2868
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2866
line 4555
;4555:      UI_LoadTremHumanItems();
ADDRGP4 UI_LoadTremHumanItems
CALLV
pop
ADDRGP4 $2867
JUMPV
LABELV $2866
line 4556
;4556:    else if (Q_stricmp(name, "SpawnWithHumanItem") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2871
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2869
line 4557
;4557:    {
line 4558
;4558:      if ((cmd = uiInfo.tremHumanItemList[uiInfo.tremHumanItemIndex].cmd))
ADDRLP4 1116
CNSTI4 12
ADDRGP4 uiInfo+666132
INDIRI4
MULI4
ADDRGP4 uiInfo+666092+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1116
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2870
line 4559
;4559:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4560
;4560:    }
ADDRGP4 $2870
JUMPV
LABELV $2869
line 4561
;4561:    else if (Q_stricmp(name, "LoadAlienClasses") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2879
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2877
line 4562
;4562:      UI_LoadTremAlienClasses();
ADDRGP4 UI_LoadTremAlienClasses
CALLV
pop
ADDRGP4 $2878
JUMPV
LABELV $2877
line 4563
;4563:    else if (Q_stricmp(name, "SpawnAsAlienClass") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2882
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2880
line 4564
;4564:    {
line 4565
;4565:      if ((cmd = uiInfo.tremAlienClassList[uiInfo.tremAlienClassIndex].cmd))
ADDRLP4 1124
CNSTI4 12
ADDRGP4 uiInfo+666088
INDIRI4
MULI4
ADDRGP4 uiInfo+666048+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1124
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2881
line 4566
;4566:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4567
;4567:    }
ADDRGP4 $2881
JUMPV
LABELV $2880
line 4568
;4568:    else if (Q_stricmp(name, "LoadHumanArmouryBuys") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2890
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $2888
line 4569
;4569:      UI_LoadTremHumanArmouryBuys();
ADDRGP4 UI_LoadTremHumanArmouryBuys
CALLV
pop
ADDRGP4 $2889
JUMPV
LABELV $2888
line 4570
;4570:    else if (Q_stricmp(name, "BuyFromArmoury") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2893
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $2891
line 4571
;4571:    {
line 4572
;4572:      if ((cmd = uiInfo.tremHumanArmouryBuyList[uiInfo.tremHumanArmouryBuyIndex].cmd))
ADDRLP4 1132
CNSTI4 12
ADDRGP4 uiInfo+666524
INDIRI4
MULI4
ADDRGP4 uiInfo+666136+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1132
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2892
line 4573
;4573:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4574
;4574:    }
ADDRGP4 $2892
JUMPV
LABELV $2891
line 4575
;4575:    else if (Q_stricmp(name, "LoadHumanArmourySells") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2901
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $2899
line 4576
;4576:      UI_LoadTremHumanArmourySells();
ADDRGP4 UI_LoadTremHumanArmourySells
CALLV
pop
ADDRGP4 $2900
JUMPV
LABELV $2899
line 4577
;4577:    else if (Q_stricmp(name, "SellToArmoury") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2904
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $2902
line 4578
;4578:    {
line 4579
;4579:      if ((cmd = uiInfo.tremHumanArmourySellList[uiInfo.tremHumanArmourySellIndex].cmd))
ADDRLP4 1140
CNSTI4 12
ADDRGP4 uiInfo+666916
INDIRI4
MULI4
ADDRGP4 uiInfo+666528+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1140
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2903
line 4580
;4580:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4581
;4581:    }
ADDRGP4 $2903
JUMPV
LABELV $2902
line 4582
;4582:    else if (Q_stricmp(name, "LoadAlienUpgrades") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2912
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $2910
line 4583
;4583:    {
line 4584
;4584:      UI_LoadTremAlienUpgrades();
ADDRGP4 UI_LoadTremAlienUpgrades
CALLV
pop
line 4587
;4585:
;4586:      //disallow the menu if it would be empty
;4587:      if (uiInfo.tremAlienUpgradeCount <= 0)
ADDRGP4 uiInfo+667112
INDIRI4
CNSTI4 0
GTI4 $2911
line 4588
;4588:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4589
;4589:    }
ADDRGP4 $2911
JUMPV
LABELV $2910
line 4590
;4590:    else if (Q_stricmp(name, "UpgradeToNewClass") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2918
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $2916
line 4591
;4591:    {
line 4592
;4592:      if ((cmd = uiInfo.tremAlienUpgradeList[uiInfo.tremAlienUpgradeIndex].cmd))
ADDRLP4 1148
CNSTI4 12
ADDRGP4 uiInfo+667116
INDIRI4
MULI4
ADDRGP4 uiInfo+666920+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1148
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2917
line 4593
;4593:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4594
;4594:    }
ADDRGP4 $2917
JUMPV
LABELV $2916
line 4595
;4595:    else if (Q_stricmp(name, "LoadAlienBuilds") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2926
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $2924
line 4596
;4596:      UI_LoadTremAlienBuilds();
ADDRGP4 UI_LoadTremAlienBuilds
CALLV
pop
ADDRGP4 $2925
JUMPV
LABELV $2924
line 4597
;4597:    else if (Q_stricmp(name, "BuildAlienBuildable") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2929
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $2927
line 4598
;4598:    {
line 4599
;4599:      if ((cmd = uiInfo.tremAlienBuildList[uiInfo.tremAlienBuildIndex].cmd))
ADDRLP4 1156
CNSTI4 12
ADDRGP4 uiInfo+667508
INDIRI4
MULI4
ADDRGP4 uiInfo+667120+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1156
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2928
line 4600
;4600:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4601
;4601:    }
ADDRGP4 $2928
JUMPV
LABELV $2927
line 4602
;4602:    else if (Q_stricmp(name, "LoadHumanBuilds") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2937
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2935
line 4603
;4603:      UI_LoadTremHumanBuilds();
ADDRGP4 UI_LoadTremHumanBuilds
CALLV
pop
ADDRGP4 $2936
JUMPV
LABELV $2935
line 4604
;4604:    else if (Q_stricmp(name, "BuildHumanBuildable") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2940
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $2938
line 4605
;4605:    {
line 4606
;4606:      if ((cmd = uiInfo.tremHumanBuildList[uiInfo.tremHumanBuildIndex].cmd))
ADDRLP4 1164
CNSTI4 12
ADDRGP4 uiInfo+667900
INDIRI4
MULI4
ADDRGP4 uiInfo+667512+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1164
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2939
line 4607
;4607:        trap_Cmd_ExecuteText(EXEC_APPEND, cmd);
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4608
;4608:    }
ADDRGP4 $2939
JUMPV
LABELV $2938
line 4609
;4609:    else if (Q_stricmp(name, "PTRCRestore") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2948
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $2946
line 4610
;4610:    {
line 4617
;4611:      int len;
;4612:      char text[16];
;4613:      fileHandle_t f;
;4614:      char command[32];
;4615:
;4616:      // load the file
;4617:      len = trap_FS_FOpenFile("ptrc.cfg", &f, FS_READ);
ADDRGP4 $2949
ARGP4
ADDRLP4 1188
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1224
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1168
ADDRLP4 1224
INDIRI4
ASGNI4
line 4619
;4618:
;4619:      if (len > 0 && (len < sizeof(text) - 1))
ADDRLP4 1228
ADDRLP4 1168
INDIRI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
LEI4 $2947
ADDRLP4 1228
INDIRI4
CVIU4 4
CNSTU4 15
GEU4 $2947
line 4620
;4620:      {
line 4621
;4621:        trap_FS_Read(text, len, f);
ADDRLP4 1172
ARGP4
ADDRLP4 1168
INDIRI4
ARGI4
ADDRLP4 1188
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 4622
;4622:        text[len] = 0;
ADDRLP4 1168
INDIRI4
ADDRLP4 1172
ADDP4
CNSTI1 0
ASGNI1
line 4623
;4623:        trap_FS_FCloseFile(f);
ADDRLP4 1188
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4625
;4624:
;4625:        Com_sprintf(command, 32, "ptrcrestore %s", text);
ADDRLP4 1192
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2952
ARGP4
ADDRLP4 1172
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4627
;4626:
;4627:        trap_Cmd_ExecuteText(EXEC_APPEND, command);
CNSTI4 2
ARGI4
ADDRLP4 1192
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4628
;4628:      }
line 4629
;4629:    }
ADDRGP4 $2947
JUMPV
LABELV $2946
line 4632
;4630:    //TA: tremulous menus
;4631:
;4632:    else if (Q_stricmp(name, "playMovie") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2955
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $2953
line 4633
;4633:    {
line 4634
;4634:      if (uiInfo.previewMovie >= 0)
ADDRGP4 uiInfo+99200
INDIRI4
CNSTI4 0
LTI4 $2956
line 4635
;4635:      {
line 4636
;4636:        trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99200
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4637
;4637:      }
LABELV $2956
line 4638
;4638:      trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $2960
ARGP4
ADDRGP4 uiInfo+99196
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98168
ADDP4
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4640
;4639:        "cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
;4640:    }
ADDRGP4 $2954
JUMPV
LABELV $2953
line 4641
;4641:    else if (Q_stricmp(name, "RunMod") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2965
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $2963
line 4642
;4642:    {
line 4643
;4643:      trap_Cvar_Set("fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $2966
ARGP4
ADDRGP4 uiInfo+97132
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96616
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4644
;4644:      trap_Cmd_ExecuteText(EXEC_APPEND, "vid_restart;");
CNSTI4 2
ARGI4
ADDRGP4 $2969
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4645
;4645:    }
ADDRGP4 $2964
JUMPV
LABELV $2963
line 4646
;4646:    else if (Q_stricmp(name, "RunDemo") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2972
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $2970
line 4647
;4647:    {
line 4648
;4648:      trap_Cmd_ExecuteText(EXEC_APPEND, va("demo %s\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $2973
ARGP4
ADDRGP4 uiInfo+98164
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97136
ADDP4
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4649
;4649:    }
ADDRGP4 $2971
JUMPV
LABELV $2970
line 4650
;4650:    else if (Q_stricmp(name, "Tremulous") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2978
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $2976
line 4651
;4651:    {
line 4652
;4652:      trap_Cvar_Set("fs_game", "");
ADDRGP4 $2966
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4653
;4653:      trap_Cmd_ExecuteText(EXEC_APPEND, "vid_restart;");
CNSTI4 2
ARGI4
ADDRGP4 $2969
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4654
;4654:    }
ADDRGP4 $2977
JUMPV
LABELV $2976
line 4655
;4655:    else if (Q_stricmp(name, "closeJoin") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2981
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $2979
line 4656
;4656:    {
line 4657
;4657:      if (uiInfo.serverStatus.refreshActive)
ADDRGP4 uiInfo+667904+2212
INDIRI4
CNSTI4 0
EQI4 $2982
line 4658
;4658:      {
line 4659
;4659:        UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4660
;4660:        uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+667904+10420
CNSTI4 0
ASGNI4
line 4661
;4661:        uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+682784
CNSTI4 0
ASGNI4
line 4662
;4662:        uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+688112
CNSTI4 0
ASGNI4
line 4663
;4663:        UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4664
;4664:      }
ADDRGP4 $2980
JUMPV
LABELV $2982
line 4666
;4665:      else
;4666:      {
line 4667
;4667:        Menus_CloseByName("joinserver");
ADDRGP4 $2990
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 4668
;4668:        Menus_OpenByName("main");
ADDRGP4 $2991
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 4669
;4669:      }
line 4670
;4670:    }
ADDRGP4 $2980
JUMPV
LABELV $2979
line 4671
;4671:    else if (Q_stricmp(name, "StopRefresh") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2994
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $2992
line 4672
;4672:    {
line 4673
;4673:      UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4674
;4674:      uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+667904+10420
CNSTI4 0
ASGNI4
line 4675
;4675:      uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+682784
CNSTI4 0
ASGNI4
line 4676
;4676:      uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+688112
CNSTI4 0
ASGNI4
line 4677
;4677:    }
ADDRGP4 $2993
JUMPV
LABELV $2992
line 4678
;4678:    else if (Q_stricmp(name, "UpdateFilter") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3001
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $2999
line 4679
;4679:    {
line 4680
;4680:      if (ui_netSource.integer == AS_LOCAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3002
line 4681
;4681:      {
line 4682
;4682:        UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4683
;4683:      }
LABELV $3002
line 4684
;4684:      UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4685
;4685:      UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 4686
;4686:    }
ADDRGP4 $3000
JUMPV
LABELV $2999
line 4687
;4687:    else if (Q_stricmp(name, "ServerStatus") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3007
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $3005
line 4688
;4688:    {
line 4689
;4689:      trap_LAN_GetServerAddressString(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+679388
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4693
;4690:        ui_netSource.integer,
;4691:        uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer],
;4692:        uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
;4693:      UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4694
;4694:    }
ADDRGP4 $3006
JUMPV
LABELV $3005
line 4695
;4695:    else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3017
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $3015
line 4696
;4696:    {
line 4697
;4697:      Q_strncpyz(
ADDRGP4 uiInfo+679388
ARGP4
ADDRGP4 uiInfo+688104
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+686056
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4701
;4698:        uiInfo.serverStatusAddress,
;4699:        uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer],
;4700:        sizeof(uiInfo.serverStatusAddress));
;4701:      UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4702
;4702:      Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4703
;4703:    }
ADDRGP4 $3016
JUMPV
LABELV $3015
line 4704
;4704:    else if (Q_stricmp(name, "FindPlayer") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3024
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $3022
line 4705
;4705:    {
line 4706
;4706:      UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 4708
;4707:      // clear the displayed server status info
;4708:      uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+679452+3328
CNSTI4 0
ASGNI4
line 4709
;4709:      Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4710
;4710:    }
ADDRGP4 $3023
JUMPV
LABELV $3022
line 4711
;4711:    else if (Q_stricmp(name, "JoinServer") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3029
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $3027
line 4712
;4712:    {
line 4713
;4713:      trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $458
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4714
;4714:      trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4715
;4715:      trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2639
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4716
;4716:      if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer
ADDRGP4 uiInfo+667904+2216
INDIRI4
CNSTI4 0
LTI4 $3028
ADDRGP4 uiInfo+667904+2216
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
GEI4 $3028
line 4718
;4717:          < uiInfo.serverStatus.numDisplayServers)
;4718:      {
line 4719
;4719:        trap_LAN_GetServerAddressString(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4722
;4720:          ui_netSource.integer,
;4721:          uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
;4722:        trap_Cmd_ExecuteText(EXEC_APPEND, va("connect %s\n", buff));
ADDRGP4 $3043
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4723
;4723:      }
line 4724
;4724:    }
ADDRGP4 $3028
JUMPV
LABELV $3027
line 4725
;4725:    else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3046
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $3044
line 4726
;4726:    {
line 4727
;4727:      trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2639
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4728
;4728:      if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer
ADDRGP4 uiInfo+688104
INDIRI4
CNSTI4 0
LTI4 $3045
ADDRGP4 uiInfo+688104
INDIRI4
ADDRGP4 uiInfo+688108
INDIRI4
GEI4 $3045
line 4730
;4729:          < uiInfo.numFoundPlayerServers)
;4730:      {
line 4731
;4731:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3043
ARGP4
ADDRGP4 uiInfo+688104
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+686056
ADDP4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4733
;4732:          "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer]));
;4733:      }
line 4734
;4734:    }
ADDRGP4 $3045
JUMPV
LABELV $3044
line 4735
;4735:    else if (Q_stricmp(name, "Quit") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3056
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $3054
line 4736
;4736:    {
line 4737
;4737:      trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2639
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4738
;4738:      trap_Cmd_ExecuteText(EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $3057
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4739
;4739:    }
ADDRGP4 $3055
JUMPV
LABELV $3054
line 4740
;4740:    else if (Q_stricmp(name, "Controls") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3060
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $3058
line 4741
;4741:    {
line 4742
;4742:      trap_Cvar_Set("cl_paused", "1");
ADDRGP4 $3061
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4743
;4743:      trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4744
;4744:      Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4745
;4745:      Menus_ActivateByName("setup_menu2");
ADDRGP4 $3062
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4746
;4746:    }
ADDRGP4 $3059
JUMPV
LABELV $3058
line 4747
;4747:    else if (Q_stricmp(name, "Leave") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3065
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $3063
line 4748
;4748:    {
line 4749
;4749:      trap_Cmd_ExecuteText(EXEC_APPEND, "disconnect\n");
CNSTI4 2
ARGI4
ADDRGP4 $3066
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4750
;4750:      trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4751
;4751:      Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4752
;4752:      Menus_ActivateByName("main");
ADDRGP4 $2991
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4753
;4753:    }
ADDRGP4 $3064
JUMPV
LABELV $3063
line 4754
;4754:    else if (Q_stricmp(name, "ServerSort") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3069
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $3067
line 4755
;4755:    {
line 4757
;4756:      int sortColumn;
;4757:      if (Int_Parse(args, &sortColumn))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1236
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
EQI4 $3068
line 4758
;4758:      {
line 4760
;4759:        // if same column we're already sorting on then flip the direction
;4760:        if (sortColumn == uiInfo.serverStatus.sortKey)
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+667904+2200
INDIRI4
NEI4 $3072
line 4761
;4761:        {
line 4762
;4762:          uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+667904+2204
INDIRI4
CNSTI4 0
NEI4 $3081
ADDRLP4 1240
CNSTI4 1
ASGNI4
ADDRGP4 $3082
JUMPV
LABELV $3081
ADDRLP4 1240
CNSTI4 0
ASGNI4
LABELV $3082
ADDRGP4 uiInfo+667904+2204
ADDRLP4 1240
INDIRI4
ASGNI4
line 4763
;4763:        }
LABELV $3072
line 4765
;4764:        // make sure we sort again
;4765:        UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1232
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 4766
;4766:      }
line 4767
;4767:    }
ADDRGP4 $3068
JUMPV
LABELV $3067
line 4768
;4768:    else if (Q_stricmp(name, "nextSkirmish") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3085
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $3083
line 4769
;4769:    {
line 4770
;4770:      UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4771
;4771:    }
ADDRGP4 $3084
JUMPV
LABELV $3083
line 4772
;4772:    else if (Q_stricmp(name, "SkirmishStart") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3088
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3086
line 4773
;4773:    {
line 4774
;4774:      UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4775
;4775:    }
ADDRGP4 $3087
JUMPV
LABELV $3086
line 4776
;4776:    else if (Q_stricmp(name, "closeingame") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3091
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3089
line 4777
;4777:    {
line 4778
;4778:      trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 1244
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4779
;4779:      trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4780
;4780:      trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4781
;4781:      Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4782
;4782:    }
ADDRGP4 $3090
JUMPV
LABELV $3089
line 4783
;4783:    else if (Q_stricmp(name, "voteMap") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3094
ARGP4
ADDRLP4 1244
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $3092
line 4784
;4784:    {
line 4785
;4785:      if (ui_currentNetMap.integer >= 0 && ui_currentNetMap.integer < uiInfo.mapCount)
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $3093
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
GEI4 $3093
line 4786
;4786:      {
line 4787
;4787:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3100
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1248
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4789
;4788:          "callvote map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName));
;4789:      }
line 4790
;4790:    }
ADDRGP4 $3093
JUMPV
LABELV $3092
line 4791
;4791:    else if (Q_stricmp(name, "voteKick") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3106
ARGP4
ADDRLP4 1248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $3104
line 4792
;4792:    {
line 4793
;4793:      if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount)
ADDRGP4 uiInfo+78800
INDIRI4
CNSTI4 0
LTI4 $3105
ADDRGP4 uiInfo+78800
INDIRI4
ADDRGP4 uiInfo+78784
INDIRI4
GEI4 $3105
line 4794
;4794:      {
line 4795
;4795:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3112
ARGP4
ADDRGP4 uiInfo+78800
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78812
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4797
;4796:          "callvote kick %s\n", uiInfo.playerNames[uiInfo.playerIndex]));
;4797:      }
line 4798
;4798:    }
ADDRGP4 $3105
JUMPV
LABELV $3104
line 4799
;4799:    else if (Q_stricmp(name, "voteTeamKick") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3117
ARGP4
ADDRLP4 1252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $3115
line 4800
;4800:    {
line 4801
;4801:      if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount)
ADDRGP4 uiInfo+78800
INDIRI4
CNSTI4 0
LTI4 $3116
ADDRGP4 uiInfo+78800
INDIRI4
ADDRGP4 uiInfo+78784
INDIRI4
GEI4 $3116
line 4802
;4802:      {
line 4803
;4803:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3123
ARGP4
ADDRGP4 uiInfo+78792
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78812
ADDP4
ARGP4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4805
;4804:          "callteamvote teamkick %s\n", uiInfo.playerNames[uiInfo.teamIndex]));
;4805:      }
line 4806
;4806:    }
ADDRGP4 $3116
JUMPV
LABELV $3115
line 4807
;4807:    else if (Q_stricmp(name, "voteGame") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3128
ARGP4
ADDRLP4 1256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
NEI4 $3126
line 4808
;4808:    {
line 4809
;4809:      if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes)
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $3127
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78516
INDIRI4
GEI4 $3127
line 4810
;4810:      {
line 4811
;4811:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3134
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1260
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4813
;4812:          "callvote g_gametype %i\n", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
;4813:      }
line 4814
;4814:    }
ADDRGP4 $3127
JUMPV
LABELV $3126
line 4815
;4815:    else if (Q_stricmp(name, "voteLeader") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3140
ARGP4
ADDRLP4 1260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 0
NEI4 $3138
line 4816
;4816:    {
line 4817
;4817:      if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount)
ADDRGP4 uiInfo+78792
INDIRI4
CNSTI4 0
LTI4 $3139
ADDRGP4 uiInfo+78792
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $3139
line 4818
;4818:      {
line 4819
;4819:        trap_Cmd_ExecuteText(EXEC_APPEND, va(
ADDRGP4 $3146
ARGP4
ADDRGP4 uiInfo+78792
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4821
;4820:          "callteamvote leader %s\n", uiInfo.teamNames[uiInfo.teamIndex]));
;4821:      }
line 4822
;4822:    }
ADDRGP4 $3139
JUMPV
LABELV $3138
line 4823
;4823:    else if (Q_stricmp(name, "addBot") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3151
ARGP4
ADDRLP4 1264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $3149
line 4824
;4824:    {
line 4825
;4825:      trap_Cmd_ExecuteText(EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(
ADDRGP4 uiInfo+73384
INDIRI4
ARGI4
ADDRLP4 1272
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $3152
ARGP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRGP4 uiInfo+96612
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78780
INDIRI4
CNSTI4 0
NEI4 $3157
ADDRLP4 1268
ADDRGP4 $1116
ASGNP4
ADDRGP4 $3158
JUMPV
LABELV $3157
ADDRLP4 1268
ADDRGP4 $1115
ASGNP4
LABELV $3158
ADDRLP4 1268
INDIRP4
ARGP4
ADDRLP4 1276
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4827
;4826:        uiInfo.botIndex), uiInfo.skillIndex + 1, (uiInfo.redBlue == 0) ? "Red" : "Blue"));
;4827:    }
ADDRGP4 $3150
JUMPV
LABELV $3149
line 4828
;4828:    else if (Q_stricmp(name, "addFavorite") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3161
ARGP4
ADDRLP4 1268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $3159
line 4829
;4829:    {
line 4830
;4830:      if (ui_netSource.integer != AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $3160
line 4831
;4831:      {
line 4836
;4832:        char name[MAX_NAME_LENGTH];
;4833:        char addr[MAX_NAME_LENGTH];
;4834:        int res;
;4835:
;4836:        trap_LAN_GetServerInfo(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4840
;4837:          ui_netSource.integer,
;4838:          uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff,
;4839:          MAX_STRING_CHARS);
;4840:        name[0] = addr[0] = '\0';
ADDRLP4 1340
CNSTI1 0
ASGNI1
ADDRLP4 1272
ADDRLP4 1340
INDIRI1
ASGNI1
ADDRLP4 1304
ADDRLP4 1340
INDIRI1
ASGNI1
line 4841
;4841:        Q_strncpyz(name, Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $3170
ARGP4
ADDRLP4 1344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1304
ARGP4
ADDRLP4 1344
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4842
;4842:        Q_strncpyz(addr, Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $3171
ARGP4
ADDRLP4 1348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1272
ARGP4
ADDRLP4 1348
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4843
;4843:        if (strlen(name) > 0 && strlen(addr) > 0)
ADDRLP4 1304
ARGP4
ADDRLP4 1352
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 0
LEI4 $3160
ADDRLP4 1272
ARGP4
ADDRLP4 1356
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
LEI4 $3160
line 4844
;4844:        {
line 4845
;4845:          res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1304
ARGP4
ADDRLP4 1272
ARGP4
ADDRLP4 1360
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1336
ADDRLP4 1360
INDIRI4
ASGNI4
line 4846
;4846:          if (res == 0)
ADDRLP4 1336
INDIRI4
CNSTI4 0
NEI4 $3174
line 4847
;4847:          {
line 4849
;4848:            // server already in the list
;4849:            Com_Printf("Favorite already in list\n");
ADDRGP4 $3176
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4850
;4850:          }
ADDRGP4 $3160
JUMPV
LABELV $3174
line 4851
;4851:          else if (res == -1)
ADDRLP4 1336
INDIRI4
CNSTI4 -1
NEI4 $3177
line 4852
;4852:          {
line 4854
;4853:            // list full
;4854:            Com_Printf("Favorite list full\n");
ADDRGP4 $3179
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4855
;4855:          }
ADDRGP4 $3160
JUMPV
LABELV $3177
line 4857
;4856:          else
;4857:          {
line 4859
;4858:            // successfully added
;4859:            Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $3180
ARGP4
ADDRLP4 1272
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4860
;4860:          }
line 4861
;4861:        }
line 4862
;4862:      }
line 4863
;4863:    }
ADDRGP4 $3160
JUMPV
LABELV $3159
line 4864
;4864:    else if (Q_stricmp(name, "deleteFavorite") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3183
ARGP4
ADDRLP4 1272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1272
INDIRI4
CNSTI4 0
NEI4 $3181
line 4865
;4865:    {
line 4866
;4866:      if (ui_netSource.integer == AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3182
line 4867
;4867:      {
line 4869
;4868:        char addr[MAX_NAME_LENGTH];
;4869:        trap_LAN_GetServerInfo(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4873
;4870:          ui_netSource.integer,
;4871:          uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff,
;4872:          MAX_STRING_CHARS);
;4873:        addr[0] = '\0';
ADDRLP4 1276
CNSTI1 0
ASGNI1
line 4874
;4874:        Q_strncpyz(addr, Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $3171
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1276
ARGP4
ADDRLP4 1308
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4875
;4875:        if (strlen(addr) > 0)
ADDRLP4 1276
ARGP4
ADDRLP4 1312
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
LEI4 $3182
line 4876
;4876:        {
line 4877
;4877:          trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 3
ARGI4
ADDRLP4 1276
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 4878
;4878:        }
line 4879
;4879:      }
line 4880
;4880:    }
ADDRGP4 $3182
JUMPV
LABELV $3181
line 4881
;4881:    else if (Q_stricmp(name, "createFavorite") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3196
ARGP4
ADDRLP4 1276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $3194
line 4882
;4882:    {
line 4883
;4883:      if (ui_netSource.integer == AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3195
line 4884
;4884:      {
line 4889
;4885:        char name[MAX_NAME_LENGTH];
;4886:        char addr[MAX_NAME_LENGTH];
;4887:        int res;
;4888:
;4889:        name[0] = addr[0] = '\0';
ADDRLP4 1348
CNSTI1 0
ASGNI1
ADDRLP4 1280
ADDRLP4 1348
INDIRI1
ASGNI1
ADDRLP4 1312
ADDRLP4 1348
INDIRI1
ASGNI1
line 4890
;4890:        Q_strncpyz(name, UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $3200
ARGP4
ADDRLP4 1352
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1312
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4891
;4891:        Q_strncpyz(addr, UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $3201
ARGP4
ADDRLP4 1356
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1280
ARGP4
ADDRLP4 1356
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4892
;4892:        if (strlen(name) > 0 && strlen(addr) > 0)
ADDRLP4 1312
ARGP4
ADDRLP4 1360
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
LEI4 $3195
ADDRLP4 1280
ARGP4
ADDRLP4 1364
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 0
LEI4 $3195
line 4893
;4893:        {
line 4894
;4894:          res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1312
ARGP4
ADDRLP4 1280
ARGP4
ADDRLP4 1368
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1344
ADDRLP4 1368
INDIRI4
ASGNI4
line 4895
;4895:          if (res == 0)
ADDRLP4 1344
INDIRI4
CNSTI4 0
NEI4 $3204
line 4896
;4896:          {
line 4898
;4897:            // server already in the list
;4898:            Com_Printf("Favorite already in list\n");
ADDRGP4 $3176
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4899
;4899:          }
ADDRGP4 $3195
JUMPV
LABELV $3204
line 4900
;4900:          else if (res == -1)
ADDRLP4 1344
INDIRI4
CNSTI4 -1
NEI4 $3206
line 4901
;4901:          {
line 4903
;4902:            // list full
;4903:            Com_Printf("Favorite list full\n");
ADDRGP4 $3179
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4904
;4904:          }
ADDRGP4 $3195
JUMPV
LABELV $3206
line 4906
;4905:          else
;4906:          {
line 4908
;4907:            // successfully added
;4908:            Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $3180
ARGP4
ADDRLP4 1280
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4909
;4909:          }
line 4910
;4910:        }
line 4911
;4911:      }
line 4912
;4912:    }
ADDRGP4 $3195
JUMPV
LABELV $3194
line 4913
;4913:    else if (Q_stricmp(name, "orders") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3210
ARGP4
ADDRLP4 1280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 0
NEI4 $3208
line 4914
;4914:    {
line 4916
;4915:      const char *orders;
;4916:      if (String_Parse(args, &orders))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1284
ARGP4
ADDRLP4 1288
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
EQI4 $3209
line 4917
;4917:      {
line 4918
;4918:        int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1636
ARGP4
ADDRLP4 1296
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1292
ADDRLP4 1296
INDIRF4
CVFI4 4
ASGNI4
line 4919
;4919:        if (selectedPlayer < uiInfo.myTeamCount)
ADDRLP4 1292
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $3213
line 4920
;4920:        {
line 4921
;4921:          strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4922
;4922:          trap_Cmd_ExecuteText(EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]));
ADDRLP4 0
ARGP4
ADDRLP4 1292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82908
ADDP4
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4923
;4923:          trap_Cmd_ExecuteText(EXEC_APPEND, "\n");
CNSTI4 2
ARGI4
ADDRGP4 $3217
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4924
;4924:        }
ADDRGP4 $3214
JUMPV
LABELV $3213
line 4926
;4925:        else
;4926:        {
line 4928
;4927:          int i;
;4928:          for(i = 0;i < uiInfo.myTeamCount;i++)
ADDRLP4 1300
CNSTI4 0
ASGNI4
ADDRGP4 $3221
JUMPV
LABELV $3218
line 4929
;4929:          {
line 4930
;4930:            if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0)
ADDRGP4 $710
ARGP4
ADDRLP4 1304
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1300
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRLP4 1308
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 0
NEI4 $3223
line 4931
;4931:            {
line 4932
;4932:              continue;
ADDRGP4 $3219
JUMPV
LABELV $3223
line 4934
;4933:            }
;4934:            strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4935
;4935:            trap_Cmd_ExecuteText(EXEC_APPEND, va(buff, uiInfo.teamNames[i]));
ADDRLP4 0
ARGP4
ADDRLP4 1300
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
ARGP4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1312
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4936
;4936:            trap_Cmd_ExecuteText(EXEC_APPEND, "\n");
CNSTI4 2
ARGI4
ADDRGP4 $3217
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4937
;4937:          }
LABELV $3219
line 4928
ADDRLP4 1300
ADDRLP4 1300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3221
ADDRLP4 1300
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
LTI4 $3218
line 4938
;4938:        }
LABELV $3214
line 4939
;4939:        trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 1300
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4940
;4940:        trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4941
;4941:        trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4942
;4942:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4943
;4943:      }
line 4944
;4944:    }
ADDRGP4 $3209
JUMPV
LABELV $3208
line 4945
;4945:    else if (Q_stricmp(name, "voiceOrdersTeam") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3229
ARGP4
ADDRLP4 1284
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
NEI4 $3227
line 4946
;4946:    {
line 4948
;4947:      const char *orders;
;4948:      if (String_Parse(args, &orders))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1288
ARGP4
ADDRLP4 1292
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
EQI4 $3228
line 4949
;4949:      {
line 4950
;4950:        int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1636
ARGP4
ADDRLP4 1300
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1296
ADDRLP4 1300
INDIRF4
CVFI4 4
ASGNI4
line 4951
;4951:        if (selectedPlayer == uiInfo.myTeamCount)
ADDRLP4 1296
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
NEI4 $3232
line 4952
;4952:        {
line 4953
;4953:          trap_Cmd_ExecuteText(EXEC_APPEND, orders);
CNSTI4 2
ARGI4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4954
;4954:          trap_Cmd_ExecuteText(EXEC_APPEND, "\n");
CNSTI4 2
ARGI4
ADDRGP4 $3217
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4955
;4955:        }
LABELV $3232
line 4956
;4956:        trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 1304
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4957
;4957:        trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4958
;4958:        trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4959
;4959:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4960
;4960:      }
line 4961
;4961:    }
ADDRGP4 $3228
JUMPV
LABELV $3227
line 4962
;4962:    else if (Q_stricmp(name, "voiceOrders") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3237
ARGP4
ADDRLP4 1288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
NEI4 $3235
line 4963
;4963:    {
line 4965
;4964:      const char *orders;
;4965:      if (String_Parse(args, &orders))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1292
ARGP4
ADDRLP4 1296
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $3236
line 4966
;4966:      {
line 4967
;4967:        int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1636
ARGP4
ADDRLP4 1304
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1300
ADDRLP4 1304
INDIRF4
CVFI4 4
ASGNI4
line 4968
;4968:        if (selectedPlayer < uiInfo.myTeamCount)
ADDRLP4 1300
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $3240
line 4969
;4969:        {
line 4970
;4970:          strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4971
;4971:          trap_Cmd_ExecuteText(EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]));
ADDRLP4 0
ARGP4
ADDRLP4 1300
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82908
ADDP4
INDIRI4
ARGI4
ADDRLP4 1308
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4972
;4972:          trap_Cmd_ExecuteText(EXEC_APPEND, "\n");
CNSTI4 2
ARGI4
ADDRGP4 $3217
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4973
;4973:        }
LABELV $3240
line 4974
;4974:        trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 1308
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4975
;4975:        trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4976
;4976:        trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4977
;4977:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4978
;4978:      }
line 4979
;4979:    }
ADDRGP4 $3236
JUMPV
LABELV $3235
line 4980
;4980:    else if (Q_stricmp(name, "glCustom") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3246
ARGP4
ADDRLP4 1292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
NEI4 $3244
line 4981
;4981:    {
line 4982
;4982:      trap_Cvar_Set("ui_glCustom", "4");
ADDRGP4 $2732
ARGP4
ADDRGP4 $3247
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4983
;4983:    }
ADDRGP4 $3245
JUMPV
LABELV $3244
line 4984
;4984:    else if (Q_stricmp(name, "update") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3250
ARGP4
ADDRLP4 1296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
NEI4 $3248
line 4985
;4985:    {
line 4986
;4986:      if (String_Parse(args, &name2))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1300
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
EQI4 $3249
line 4987
;4987:        UI_Update(name2);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 4988
;4988:    }
ADDRGP4 $3249
JUMPV
LABELV $3248
line 4989
;4989:    else if (Q_stricmp(name, "setPbClStatus") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3255
ARGP4
ADDRLP4 1300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
NEI4 $3253
line 4990
;4990:    {
line 4992
;4991:      int stat;
;4992:      if (Int_Parse(args, &stat))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1304
ARGP4
ADDRLP4 1308
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 0
EQI4 $3254
line 4993
;4993:        trap_SetPbClStatus(stat);
ADDRLP4 1304
INDIRI4
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 4994
;4994:    }
ADDRGP4 $3254
JUMPV
LABELV $3253
line 4996
;4995:    else
;4996:    {
line 4997
;4997:      Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $3258
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4998
;4998:    }
LABELV $3254
LABELV $3249
LABELV $3245
LABELV $3236
LABELV $3228
LABELV $3209
LABELV $3195
LABELV $3182
LABELV $3160
LABELV $3150
LABELV $3139
LABELV $3127
LABELV $3116
LABELV $3105
LABELV $3093
LABELV $3090
LABELV $3087
LABELV $3084
LABELV $3068
LABELV $3064
LABELV $3059
LABELV $3055
LABELV $3045
LABELV $3028
LABELV $3023
LABELV $3016
LABELV $3006
LABELV $3000
LABELV $2993
LABELV $2980
LABELV $2977
LABELV $2971
LABELV $2964
LABELV $2954
LABELV $2947
LABELV $2939
LABELV $2936
LABELV $2928
LABELV $2925
LABELV $2917
LABELV $2911
LABELV $2903
LABELV $2900
LABELV $2892
LABELV $2889
LABELV $2881
LABELV $2878
LABELV $2870
LABELV $2867
LABELV $2859
LABELV $2856
LABELV $2853
LABELV $2850
LABELV $2847
LABELV $2834
LABELV $2831
LABELV $2828
LABELV $2825
LABELV $2822
LABELV $2818
LABELV $2815
LABELV $2812
LABELV $2808
LABELV $2801
LABELV $2794
LABELV $2762
line 4999
;4999:  }
LABELV $2759
line 5000
;5000:}
LABELV $2758
endproc UI_RunMenuScript 1372 20
proc UI_GetTeamColor 0 0
line 5004
;5001:
;5002:static void
;5003:UI_GetTeamColor(vec4_t *color)
;5004:{
line 5005
;5005:}
LABELV $3259
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 16 0
line 5014
;5006:
;5007:/*
;5008: ==================
;5009: UI_MapCountByGameType
;5010: ==================
;5011: */
;5012:static int
;5013:UI_MapCountByGameType(qboolean singlePlayer)
;5014:{
line 5016
;5015:  int i, c, game;
;5016:  c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5017
;5017:  game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3268
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $3269
JUMPV
LABELV $3268
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ASGNI4
LABELV $3269
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 5020
;5018:      : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
;5019:
;5020:  for(i = 0;i < uiInfo.mapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3273
JUMPV
LABELV $3270
line 5021
;5021:  {
line 5022
;5022:    uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+96
ADDP4
CNSTI4 0
ASGNI4
line 5023
;5023:    if (uiInfo.mapList[i].typeBits & (1 << game))
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3277
line 5024
;5024:    {
line 5025
;5025:      if (singlePlayer)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3281
line 5026
;5026:      {
line 5027
;5027:        if (!(uiInfo.mapList[i].typeBits & (1 << 2)))
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $3283
line 5028
;5028:        {
line 5029
;5029:          continue;
ADDRGP4 $3271
JUMPV
LABELV $3283
line 5031
;5030:        }
;5031:      }
LABELV $3281
line 5032
;5032:      c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5033
;5033:      uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+96
ADDP4
CNSTI4 1
ASGNI4
line 5034
;5034:    }
LABELV $3277
line 5035
;5035:  }
LABELV $3271
line 5020
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3273
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LTI4 $3270
line 5036
;5036:  return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3260
endproc UI_MapCountByGameType 16 0
export UI_hasSkinForBase
proc UI_hasSkinForBase 1032 20
line 5041
;5037:}
;5038:
;5039:qboolean
;5040:UI_hasSkinForBase(const char *base, const char *team)
;5041:{
line 5044
;5042:  char test[1024];
;5043:
;5044:  Com_sprintf(test, sizeof(test), "models/players/%s/%s/lower_default.skin", base, team);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3290
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5046
;5045:
;5046:  if (trap_FS_FOpenFile(test, NULL, FS_READ))
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1024
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $3291
line 5047
;5047:  {
line 5048
;5048:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3289
JUMPV
LABELV $3291
line 5050
;5049:  }
;5050:  Com_sprintf(test, sizeof(test), "models/players/characters/%s/%s/lower_default.skin", base, team);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3293
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5052
;5051:
;5052:  if (trap_FS_FOpenFile(test, NULL, FS_READ))
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1028
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $3294
line 5053
;5053:  {
line 5054
;5054:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3289
JUMPV
LABELV $3294
line 5056
;5055:  }
;5056:  return qfalse;
CNSTI4 0
RETI4
LABELV $3289
endproc UI_hasSkinForBase 1032 20
data
align 4
LABELV $3297
byte 4 0
code
proc UI_HeadCountByTeam 40 8
line 5066
;5057:}
;5058:
;5059:/*
;5060: ==================
;5061: UI_MapCountByTeam
;5062: ==================
;5063: */
;5064:static int
;5065:UI_HeadCountByTeam(void)
;5066:{
line 5070
;5067:  static int init = 0;
;5068:  int i, j, k, c, tIndex;
;5069:
;5070:  c = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5071
;5071:  if (!init)
ADDRGP4 $3297
INDIRI4
CNSTI4 0
NEI4 $3298
line 5072
;5072:  {
line 5073
;5073:    for(i = 0;i < uiInfo.characterCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3303
JUMPV
LABELV $3300
line 5074
;5074:    {
line 5075
;5075:      uiInfo.characterList[i].reference = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+20
ADDP4
CNSTI4 0
ASGNI4
line 5076
;5076:      for(j = 0;j < uiInfo.teamCount;j++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3310
JUMPV
LABELV $3307
line 5077
;5077:      {
line 5078
;5078:        if (UI_hasSkinForBase(uiInfo.characterList[i].base, uiInfo.teamList[j].teamName))
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+12
ADDP4
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+75700
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_hasSkinForBase
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3312
line 5079
;5079:        {
line 5080
;5080:          uiInfo.characterList[i].reference |= (1 << j);
ADDRLP4 24
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
BORI4
ASGNI4
line 5081
;5081:        }
LABELV $3312
line 5082
;5082:      }
LABELV $3308
line 5076
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3310
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
LTI4 $3307
line 5083
;5083:    }
LABELV $3301
line 5073
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3303
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
LTI4 $3300
line 5084
;5084:    init = 1;
ADDRGP4 $3297
CNSTI4 1
ASGNI4
line 5085
;5085:  }
LABELV $3298
line 5087
;5086:
;5087:  tIndex = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 5090
;5088:
;5089:  // do names
;5090:  for(i = 0;i < uiInfo.characterCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3322
JUMPV
LABELV $3319
line 5091
;5091:  {
line 5092
;5092:    uiInfo.characterList[i].active = qfalse;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+16
ADDP4
CNSTI4 0
ASGNI4
line 5093
;5093:    for(j = 0;j < TEAM_MEMBERS;j++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3326
line 5094
;5094:    {
line 5095
;5095:      if (uiInfo.teamList[tIndex].teamMembers[j] != NULL)
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3330
line 5096
;5096:      {
line 5097
;5097:        if (uiInfo.characterList[i].reference & (1 << tIndex))
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3334
line 5098
;5098:        {// && Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.characterList[i].name)==0) {
line 5099
;5099:          uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+16
ADDP4
CNSTI4 1
ASGNI4
line 5100
;5100:          c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5101
;5101:          break;
ADDRGP4 $3328
JUMPV
LABELV $3334
line 5103
;5102:        }
;5103:      }
LABELV $3330
line 5104
;5104:    }
LABELV $3327
line 5093
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $3326
LABELV $3328
line 5105
;5105:  }
LABELV $3320
line 5090
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3322
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
LTI4 $3319
line 5108
;5106:
;5107:  // and then aliases
;5108:  for(j = 0;j < TEAM_MEMBERS;j++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3340
line 5109
;5109:  {
line 5110
;5110:    for(k = 0;k < uiInfo.aliasCount;k++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3347
JUMPV
LABELV $3344
line 5111
;5111:    {
line 5112
;5112:      if (uiInfo.aliasList[k].name != NULL)
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74928
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3349
line 5113
;5113:      {
line 5114
;5114:        if (Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.aliasList[k].name) == 0)
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74928
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3352
line 5115
;5115:        {
line 5116
;5116:          for(i = 0;i < uiInfo.characterCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3360
JUMPV
LABELV $3357
line 5117
;5117:          {
line 5118
;5118:            if (uiInfo.characterList[i].headImage != -1 && uiInfo.characterList[i].reference & (1
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73388+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3362
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73388+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3362
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74928+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73388
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $3362
line 5120
;5119:                << tIndex) && Q_stricmp(uiInfo.aliasList[k].ai, uiInfo.characterList[i].name) == 0)
;5120:            {
line 5121
;5121:              if (uiInfo.characterList[i].active == qfalse)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3359
line 5122
;5122:              {
line 5123
;5123:                uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+16
ADDP4
CNSTI4 1
ASGNI4
line 5124
;5124:                c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5125
;5125:              }
line 5126
;5126:              break;
ADDRGP4 $3359
JUMPV
LABELV $3362
line 5128
;5127:            }
;5128:          }
LABELV $3358
line 5116
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3360
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
LTI4 $3357
LABELV $3359
line 5129
;5129:        }
LABELV $3352
line 5130
;5130:      }
LABELV $3349
line 5131
;5131:    }
LABELV $3345
line 5110
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3347
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+74924
INDIRI4
LTI4 $3344
line 5132
;5132:  }
LABELV $3341
line 5108
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $3340
line 5133
;5133:  return c;
ADDRLP4 16
INDIRI4
RETI4
LABELV $3296
endproc UI_HeadCountByTeam 40 8
proc UI_InsertServerIntoDisplayList 16 0
line 5143
;5134:}
;5135:
;5136:/*
;5137: ==================
;5138: UI_InsertServerIntoDisplayList
;5139: ==================
;5140: */
;5141:static void
;5142:UI_InsertServerIntoDisplayList(int num, int position)
;5143:{
line 5146
;5144:  int i;
;5145:
;5146:  if (position < 0 || position > uiInfo.serverStatus.numDisplayServers)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3382
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
LEI4 $3378
LABELV $3382
line 5147
;5147:  {
line 5148
;5148:    return;
ADDRGP4 $3377
JUMPV
LABELV $3378
line 5151
;5149:  }
;5150:  //
;5151:  uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+667904+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5152
;5152:  for(i = uiInfo.serverStatus.numDisplayServers;i > position;i--)
ADDRLP4 0
ADDRGP4 uiInfo+667904+10412
INDIRI4
ASGNI4
ADDRGP4 $3388
JUMPV
LABELV $3385
line 5153
;5153:  {
line 5154
;5154:    uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i - 1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+667904+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+667904+2220-4
ADDP4
INDIRI4
ASGNI4
line 5155
;5155:  }
LABELV $3386
line 5152
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $3388
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $3385
line 5156
;5156:  uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 5157
;5157:}
LABELV $3377
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 5166
;5158:
;5159:/*
;5160: ==================
;5161: UI_RemoveServerFromDisplayList
;5162: ==================
;5163: */
;5164:static void
;5165:UI_RemoveServerFromDisplayList(int num)
;5166:{
line 5169
;5167:  int i, j;
;5168:
;5169:  for(i = 0;i < uiInfo.serverStatus.numDisplayServers;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3402
JUMPV
LABELV $3399
line 5170
;5170:  {
line 5171
;5171:    if (uiInfo.serverStatus.displayServers[i] == num)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3405
line 5172
;5172:    {
line 5173
;5173:      uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+667904+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5174
;5174:      for(j = i;j < uiInfo.serverStatus.numDisplayServers;j++)
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $3414
JUMPV
LABELV $3411
line 5175
;5175:      {
line 5176
;5176:        uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j + 1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+667904+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+667904+2220+4
ADDP4
INDIRI4
ASGNI4
line 5177
;5177:      }
LABELV $3412
line 5174
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3414
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
LTI4 $3411
line 5178
;5178:      return;
ADDRGP4 $3398
JUMPV
LABELV $3405
line 5180
;5179:    }
;5180:  }
LABELV $3400
line 5169
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3402
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
LTI4 $3399
line 5181
;5181:}
LABELV $3398
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 5190
;5182:
;5183:/*
;5184: ==================
;5185: UI_BinaryServerInsertion
;5186: ==================
;5187: */
;5188:static void
;5189:UI_BinaryServerInsertion(int num)
;5190:{
line 5194
;5191:  int mid, offset, res, len;
;5192:
;5193:  // use binary search to insert server
;5194:  len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+667904+10412
INDIRI4
ASGNI4
line 5195
;5195:  mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 5196
;5196:  offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5197
;5197:  res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3426
JUMPV
LABELV $3425
line 5199
;5198:  while(mid > 0)
;5199:  {
line 5200
;5200:    mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 5202
;5201:    //
;5202:    res = trap_LAN_CompareServers(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 5206
;5203:      ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, num,
;5204:      uiInfo.serverStatus.displayServers[offset + mid]);
;5205:    // if equal
;5206:    if (res == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3435
line 5207
;5207:    {
line 5208
;5208:      UI_InsertServerIntoDisplayList(num, offset + mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 5209
;5209:      return;
ADDRGP4 $3422
JUMPV
LABELV $3435
line 5212
;5210:    }
;5211:    // if larger
;5212:    else if (res == 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3437
line 5213
;5213:    {
line 5214
;5214:      offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 5215
;5215:      len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 5216
;5216:    }
ADDRGP4 $3438
JUMPV
LABELV $3437
line 5219
;5217:    // if smaller
;5218:    else
;5219:    {
line 5220
;5220:      len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 5221
;5221:    }
LABELV $3438
line 5222
;5222:  }
LABELV $3426
line 5198
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $3425
line 5223
;5223:  if (res == 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3439
line 5224
;5224:  {
line 5225
;5225:    offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5226
;5226:  }
LABELV $3439
line 5227
;5227:  UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 5228
;5228:}
LABELV $3422
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $3442
skip 4
code
proc UI_BuildServerDisplayList 1096 16
line 5237
;5229:
;5230:/*
;5231: ==================
;5232: UI_BuildServerDisplayList
;5233: ==================
;5234: */
;5235:static void
;5236:UI_BuildServerDisplayList(qboolean force)
;5237:{
line 5243
;5238:  int i, count, clients, maxClients, ping, game, len, visible;
;5239:  char info[MAX_STRING_CHARS];
;5240:  //  qboolean startRefresh = qtrue; TTimo: unused
;5241:  static int numinvisible;
;5242:
;5243:  if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh))
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3443
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+667904+10420
INDIRI4
GTI4 $3443
line 5244
;5244:  {
line 5245
;5245:    return;
ADDRGP4 $3441
JUMPV
LABELV $3443
line 5248
;5246:  }
;5247:  // if we shouldn't reset
;5248:  if (force == 2)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $3448
line 5249
;5249:  {
line 5250
;5250:    force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 5251
;5251:  }
LABELV $3448
line 5254
;5252:
;5253:  // do motd updates here too
;5254:  trap_Cvar_VariableStringBuffer(
ADDRGP4 $3450
ARGP4
ADDRGP4 uiInfo+667904+10460
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5256
;5255:    "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd));
;5256:  len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+667904+10460
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 5257
;5257:  if (len != uiInfo.serverStatus.motdLen)
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+667904+10436
INDIRI4
EQI4 $3457
line 5258
;5258:  {
line 5259
;5259:    uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+667904+10436
ADDRLP4 1052
INDIRI4
ASGNI4
line 5260
;5260:    uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+667904+10440
CNSTI4 -1
ASGNI4
line 5261
;5261:  }
LABELV $3457
line 5263
;5262:
;5263:  if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3465
line 5264
;5264:  {
line 5265
;5265:    numinvisible = 0;
ADDRGP4 $3442
CNSTI4 0
ASGNI4
line 5267
;5266:    // clear number of displayed servers
;5267:    uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+667904+10412
CNSTI4 0
ASGNI4
line 5268
;5268:    uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+667904+10416
CNSTI4 0
ASGNI4
line 5270
;5269:    // set list box index to zero
;5270:    Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5272
;5271:    // mark all servers as visible so we store ping updates for them
;5272:    trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5273
;5273:  }
LABELV $3465
line 5276
;5274:
;5275:  // get the server count (comes from the master)
;5276:  count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 5277
;5277:  if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0))
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $3476
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3473
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $3473
LABELV $3476
line 5278
;5278:  {
line 5280
;5279:    // still waiting on a response from the master
;5280:    uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+667904+10412
CNSTI4 0
ASGNI4
line 5281
;5281:    uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+667904+10416
CNSTI4 0
ASGNI4
line 5282
;5282:    uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+667904+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5283
;5283:    return;
ADDRGP4 $3441
JUMPV
LABELV $3473
line 5286
;5284:  }
;5285:
;5286:  visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 5287
;5287:  for(i = 0;i < count;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3487
JUMPV
LABELV $3484
line 5288
;5288:  {
line 5290
;5289:    // if we already got info for this server
;5290:    if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i))
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $3488
line 5291
;5291:    {
line 5292
;5292:      continue;
ADDRGP4 $3485
JUMPV
LABELV $3488
line 5294
;5293:    }
;5294:    visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 5296
;5295:    // get the ping for this server
;5296:    ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1072
INDIRI4
ASGNI4
line 5297
;5297:    if (ping > 0 || ui_netSource.integer == AS_FAVORITES)
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3495
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3492
LABELV $3495
line 5298
;5298:    {
line 5300
;5299:
;5300:      trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5302
;5301:
;5302:      clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 12
ARGP4
ADDRGP4 $3497
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1080
INDIRI4
ASGNI4
line 5303
;5303:      uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1084
ADDRGP4 uiInfo+667904+10416
ASGNP4
ADDRLP4 1084
INDIRP4
ADDRLP4 1084
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 5305
;5304:
;5305:      if (ui_browserShowEmpty.integer == 0)
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3500
line 5306
;5306:      {
line 5307
;5307:        if (clients == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $3503
line 5308
;5308:        {
line 5309
;5309:          trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5310
;5310:          continue;
ADDRGP4 $3485
JUMPV
LABELV $3503
line 5312
;5311:        }
;5312:      }
LABELV $3500
line 5314
;5313:
;5314:      if (ui_browserShowFull.integer == 0)
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3506
line 5315
;5315:      {
line 5316
;5316:        maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 12
ARGP4
ADDRGP4 $1605
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1092
INDIRI4
ASGNI4
line 5317
;5317:        if (clients == maxClients)
ADDRLP4 8
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3509
line 5318
;5318:        {
line 5319
;5319:          trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5320
;5320:          continue;
ADDRGP4 $3485
JUMPV
LABELV $3509
line 5322
;5321:        }
;5322:      }
LABELV $3506
line 5324
;5323:
;5324:      if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1)
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78652+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3512
line 5325
;5325:      {
line 5326
;5326:        game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 12
ARGP4
ADDRGP4 $3517
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1092
INDIRI4
ASGNI4
line 5327
;5327:        if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum)
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78652+4
ADDP4
INDIRI4
EQI4 $3518
line 5328
;5328:        {
line 5329
;5329:          trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5330
;5330:          continue;
ADDRGP4 $3485
JUMPV
LABELV $3518
line 5332
;5331:        }
;5332:      }
LABELV $3512
line 5335
;5333:
;5334:      // make sure we never add a favorite server twice
;5335:      if (ui_netSource.integer == AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3524
line 5336
;5336:      {
line 5337
;5337:        UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 5338
;5338:      }
LABELV $3524
line 5340
;5339:      // insert the server into the list
;5340:      UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 5342
;5341:      // done with this server
;5342:      if (ping > 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3527
line 5343
;5343:      {
line 5344
;5344:        trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5345
;5345:        numinvisible++;
ADDRLP4 1088
ADDRGP4 $3442
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5346
;5346:      }
LABELV $3527
line 5347
;5347:    }
LABELV $3492
line 5348
;5348:  }
LABELV $3485
line 5287
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3487
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $3484
line 5350
;5349:
;5350:  uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+667904+2192
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 5353
;5351:
;5352:  // if there were no servers visible for ping updates
;5353:  if (!visible)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3533
line 5354
;5354:  {
line 5357
;5355:    //    UI_StopServerRefresh();
;5356:    //    uiInfo.serverStatus.nextDisplayRefresh = 0;
;5357:  }
LABELV $3533
line 5358
;5358:}
LABELV $3441
endproc UI_BuildServerDisplayList 1096 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3536
address $3537
address $3538
address $131
address $3539
address $3540
address $2631
address $3541
address $3542
address $3543
address $3544
address $131
address $2592
address $131
address $3545
address $131
address $933
address $131
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 5385
;5359:
;5360:typedef struct
;5361:{
;5362:  char *name, *altName;
;5363:} serverStatusCvar_t;
;5364:
;5365:serverStatusCvar_t serverStatusCvars[] =
;5366:{
;5367:{ "sv_hostname", "Name" },
;5368:{ "Address", "" },
;5369:{ "gamename", "Game name" },
;5370:{ "g_gametype", "Game type" },
;5371:{ "mapname", "Map" },
;5372:{ "version", "" },
;5373:{ "protocol", "" },
;5374:{ "timelimit", "" },
;5375:{ "fraglimit", "" },
;5376:{ NULL, NULL } };
;5377:
;5378:/*
;5379: ==================
;5380: UI_SortServerStatusInfo
;5381: ==================
;5382: */
;5383:static void
;5384:UI_SortServerStatusInfo(serverStatusInfo_t *info)
;5385:{
line 5392
;5386:  int i, j, index;
;5387:  char *tmp1, *tmp2;
;5388:
;5389:  // FIXME: if "gamename" == "baseq3" or "missionpack" then
;5390:  // replace the gametype number by FFA, CTF etc.
;5391:  //
;5392:  index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5393
;5393:  for(i = 0;serverStatusCvars[i].name;i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3550
JUMPV
LABELV $3547
line 5394
;5394:  {
line 5395
;5395:    for(j = 0;j < info->numLines;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3554
JUMPV
LABELV $3551
line 5396
;5396:    {
line 5397
;5397:      if (!info->lines[j][1] || info->lines[j][1][0])
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3557
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3555
LABELV $3557
line 5398
;5398:      {
line 5399
;5399:        continue;
ADDRGP4 $3552
JUMPV
LABELV $3555
line 5401
;5400:      }
;5401:      if (!Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]))
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3558
line 5402
;5402:      {
line 5404
;5403:        // swap lines
;5404:        tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 5405
;5405:        tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 5406
;5406:        info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 5407
;5407:        info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 5408
;5408:        info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5409
;5409:        info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5411
;5410:        //
;5411:        if (strlen(serverStatusCvars[i].altName))
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3560
line 5412
;5412:        {
line 5413
;5413:          info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 5414
;5414:        }
LABELV $3560
line 5415
;5415:        index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5416
;5416:      }
LABELV $3558
line 5417
;5417:    }
LABELV $3552
line 5395
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3554
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
LTI4 $3551
line 5418
;5418:  }
LABELV $3548
line 5393
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3550
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3547
line 5419
;5419:}
LABELV $3546
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 5428
;5420:
;5421:/*
;5422: ==================
;5423: UI_GetServerStatusInfo
;5424: ==================
;5425: */
;5426:static int
;5427:UI_GetServerStatusInfo(const char *serverAddress, serverStatusInfo_t *info)
;5428:{
line 5432
;5429:  char *p, *score, *ping, *name;
;5430:  int i, len;
;5431:
;5432:  if (!info)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3565
line 5433
;5433:  {
line 5434
;5434:    trap_LAN_ServerStatus(serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5435
;5435:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3564
JUMPV
LABELV $3565
line 5437
;5436:  }
;5437:  memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3332
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5438
;5438:  if (trap_LAN_ServerStatus(serverAddress, info->text, sizeof(info->text)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3567
line 5439
;5439:  {
line 5440
;5440:    Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5441
;5441:    p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 5442
;5442:    info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
CNSTI4 0
ASGNI4
line 5443
;5443:    info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3538
ASGNP4
line 5444
;5444:    info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $131
ASGNP4
line 5445
;5445:    info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $131
ASGNP4
line 5446
;5446:    info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 5447
;5447:    info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3570
JUMPV
LABELV $3569
line 5450
;5448:    // get the cvars
;5449:    while(p && *p)
;5450:    {
line 5451
;5451:      p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 5452
;5452:      if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3572
line 5453
;5453:        break;
ADDRGP4 $3571
JUMPV
LABELV $3572
line 5454
;5454:      *p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 5455
;5455:      if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3574
line 5456
;5456:        break;
ADDRGP4 $3571
JUMPV
LABELV $3574
line 5457
;5457:      info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5458
;5458:      info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $131
ASGNP4
line 5459
;5459:      info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $131
ASGNP4
line 5460
;5460:      p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 5461
;5461:      if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3576
line 5462
;5462:        break;
ADDRGP4 $3571
JUMPV
LABELV $3576
line 5463
;5463:      *p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 5464
;5464:      info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5466
;5465:
;5466:      info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5467
;5467:      if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3578
line 5468
;5468:        break;
ADDRGP4 $3571
JUMPV
LABELV $3578
line 5469
;5469:    }
LABELV $3570
line 5449
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3580
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3569
LABELV $3580
LABELV $3571
line 5471
;5470:    // get the player list
;5471:    if (info->numLines < MAX_SERVERSTATUS_LINES - 3)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3581
line 5472
;5472:    {
line 5474
;5473:      // empty line
;5474:      info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $131
ASGNP4
line 5475
;5475:      info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $131
ASGNP4
line 5476
;5476:      info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $131
ASGNP4
line 5477
;5477:      info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $131
ASGNP4
line 5478
;5478:      info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5480
;5479:      // header
;5480:      info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3583
ASGNP4
line 5481
;5481:      info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3584
ASGNP4
line 5482
;5482:      info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3585
ASGNP4
line 5483
;5483:      info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $710
ASGNP4
line 5484
;5484:      info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5486
;5485:      // parse players
;5486:      i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5487
;5487:      len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3587
JUMPV
LABELV $3586
line 5489
;5488:      while(p && *p)
;5489:      {
line 5490
;5490:        if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3589
line 5491
;5491:          *p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3589
line 5492
;5492:        if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3591
line 5493
;5493:          break;
ADDRGP4 $3588
JUMPV
LABELV $3591
line 5494
;5494:        score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 5495
;5495:        p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 5496
;5496:        if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3593
line 5497
;5497:          break;
ADDRGP4 $3588
JUMPV
LABELV $3593
line 5498
;5498:        *p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 5499
;5499:        ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 5500
;5500:        p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 5501
;5501:        if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3595
line 5502
;5502:          break;
ADDRGP4 $3588
JUMPV
LABELV $3595
line 5503
;5503:        *p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 5504
;5504:        name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 5505
;5505:        Com_sprintf(&info->pings[len], sizeof(info->pings) - len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 192
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $930
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5506
;5506:        info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 5507
;5507:        len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 5508
;5508:        info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5509
;5509:        info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5510
;5510:        info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 5511
;5511:        info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5512
;5512:        if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3597
line 5513
;5513:          break;
ADDRGP4 $3588
JUMPV
LABELV $3597
line 5514
;5514:        p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 5515
;5515:        if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3599
line 5516
;5516:          break;
ADDRGP4 $3588
JUMPV
LABELV $3599
line 5517
;5517:        *p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 5519
;5518:        //
;5519:        i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5520
;5520:      }
LABELV $3587
line 5488
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3601
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3586
LABELV $3601
LABELV $3588
line 5521
;5521:    }
LABELV $3581
line 5522
;5522:    UI_SortServerStatusInfo(info);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 5523
;5523:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3564
JUMPV
LABELV $3567
line 5525
;5524:  }
;5525:  return qfalse;
CNSTI4 0
RETI4
LABELV $3564
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 5535
;5526:}
;5527:
;5528:/*
;5529: ==================
;5530: stristr
;5531: ==================
;5532: */
;5533:static char *
;5534:stristr(char *str, char *charset)
;5535:{
ADDRGP4 $3604
JUMPV
LABELV $3603
line 5539
;5536:  int i;
;5537:
;5538:  while(*str)
;5539:  {
line 5540
;5540:    for(i = 0;charset[i] && str[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3609
JUMPV
LABELV $3606
line 5541
;5541:    {
line 5542
;5542:      if (toupper(charset[i]) != toupper(str[i]))
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3610
line 5543
;5543:        break;
ADDRGP4 $3608
JUMPV
LABELV $3610
line 5544
;5544:    }
LABELV $3607
line 5540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3609
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $3612
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3606
LABELV $3612
LABELV $3608
line 5545
;5545:    if (!charset[i])
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3613
line 5546
;5546:      return str;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3602
JUMPV
LABELV $3613
line 5547
;5547:    str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5548
;5548:  }
LABELV $3604
line 5538
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3603
line 5549
;5549:  return NULL;
CNSTP4 0
RETP4
LABELV $3602
endproc stristr 12 4
bss
align 4
LABELV $3616
skip 4
align 4
LABELV $3617
skip 4
code
proc UI_BuildFindPlayerList 4424 24
line 5559
;5550:}
;5551:
;5552:/*
;5553: ==================
;5554: UI_BuildFindPlayerList
;5555: ==================
;5556: */
;5557:static void
;5558:UI_BuildFindPlayerList(qboolean force)
;5559:{
line 5566
;5560:  static int numFound, numTimeOuts;
;5561:  int i, j, resend;
;5562:  serverStatusInfo_t info;
;5563:  char name[MAX_NAME_LENGTH + 2];
;5564:  char infoString[MAX_STRING_CHARS];
;5565:
;5566:  if (!force)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3618
line 5567
;5567:  {
line 5568
;5568:    if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime)
ADDRGP4 uiInfo+688112
INDIRI4
CNSTI4 0
EQI4 $3625
ADDRGP4 uiInfo+688112
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3619
LABELV $3625
line 5569
;5569:    {
line 5570
;5570:      return;
ADDRGP4 $3615
JUMPV
line 5572
;5571:    }
;5572:  }
LABELV $3618
line 5574
;5573:  else
;5574:  {
line 5575
;5575:    memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+682788
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5576
;5576:    uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+688108
CNSTI4 0
ASGNI4
line 5577
;5577:    uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+688104
CNSTI4 0
ASGNI4
line 5578
;5578:    trap_Cvar_VariableStringBuffer(
ADDRGP4 $3630
ARGP4
ADDRGP4 uiInfo+685032
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5580
;5579:      "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
;5580:    Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+685032
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5582
;5581:    // should have a string of some length
;5582:    if (!strlen(uiInfo.findPlayerName))
ADDRGP4 uiInfo+685032
ARGP4
ADDRLP4 4404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
NEI4 $3634
line 5583
;5583:    {
line 5584
;5584:      uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+688112
CNSTI4 0
ASGNI4
line 5585
;5585:      return;
ADDRGP4 $3615
JUMPV
LABELV $3634
line 5588
;5586:    }
;5587:    // set resend time
;5588:    resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4400
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 5589
;5589:    if (resend < 50)
ADDRLP4 4400
INDIRI4
CNSTI4 50
GEI4 $3639
line 5590
;5590:    {
line 5591
;5591:      resend = 50;
ADDRLP4 4400
CNSTI4 50
ASGNI4
line 5592
;5592:    }
LABELV $3639
line 5593
;5593:    trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $930
ARGP4
ADDRLP4 4400
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3641
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5595
;5594:    // reset all server status requests
;5595:    trap_LAN_ServerStatus(NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5597
;5596:    //
;5597:    uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+688108
CNSTI4 1
ASGNI4
line 5598
;5598:    Com_sprintf(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3649
ARGP4
ADDRGP4 uiInfo+682788
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5602
;5599:      uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5600:      sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1]), "searching %d...",
;5601:      uiInfo.pendingServerStatus.num);
;5602:    numFound = 0;
ADDRGP4 $3616
CNSTI4 0
ASGNI4
line 5603
;5603:    numTimeOuts++;
ADDRLP4 4412
ADDRGP4 $3617
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5604
;5604:  }
LABELV $3619
line 5605
;5605:  for(i = 0;i < MAX_SERVERSTATUSREQUESTS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3651
line 5606
;5606:  {
line 5608
;5607:    // if this pending server is valid
;5608:    if (uiInfo.pendingServerStatus.server[i].valid)
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3655
line 5609
;5609:    {
line 5611
;5610:      // try to get the server status for this server
;5611:      if (UI_GetServerStatusInfo(uiInfo.pendingServerStatus.server[i].adrstr, &info))
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4404
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
EQI4 $3660
line 5612
;5612:      {
line 5614
;5613:        //
;5614:        numFound++;
ADDRLP4 4408
ADDRGP4 $3616
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5616
;5615:        // parse through the server status lines
;5616:        for(j = 0;j < info.numLines;j++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3667
JUMPV
LABELV $3664
line 5617
;5617:        {
line 5619
;5618:          // should have ping info
;5619:          if (!info.lines[j][2] || !info.lines[j][2][0])
ADDRLP4 4412
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3675
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3669
LABELV $3675
line 5620
;5620:          {
line 5621
;5621:            continue;
ADDRGP4 $3665
JUMPV
LABELV $3669
line 5624
;5622:          }
;5623:          // clean string first
;5624:          Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3340
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5625
;5625:          Q_CleanStr(name);
ADDRLP4 3340
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5627
;5626:          // if the player name is a substring
;5627:          if (stristr(name, uiInfo.findPlayerName))
ADDRLP4 3340
ARGP4
ADDRGP4 uiInfo+685032
ARGP4
ADDRLP4 4416
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4416
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3678
line 5628
;5628:          {
line 5630
;5629:            // add to found server list if we have space (always leave space for a line with the number found)
;5630:            if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS - 1)
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 15
GEI4 $3681
line 5631
;5631:            {
line 5633
;5632:              //
;5633:              Q_strncpyz(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+686056-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5637
;5634:                uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers - 1],
;5635:                uiInfo.pendingServerStatus.server[i].adrstr,
;5636:                sizeof(uiInfo.foundPlayerServerAddresses[0]));
;5637:              Q_strncpyz(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5640
;5638:                uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5639:                uiInfo.pendingServerStatus.server[i].name, sizeof(uiInfo.foundPlayerServerNames[0]));
;5640:              uiInfo.numFoundPlayerServers++;
ADDRLP4 4420
ADDRGP4 uiInfo+688108
ASGNP4
ADDRLP4 4420
INDIRP4
ADDRLP4 4420
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5641
;5641:            }
ADDRGP4 $3682
JUMPV
LABELV $3681
line 5643
;5642:            else
;5643:            {
line 5645
;5644:              // can't add any more so we're done
;5645:              uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+682788
ADDRGP4 uiInfo+667904+10412
INDIRI4
ASGNI4
line 5646
;5646:            }
LABELV $3682
line 5647
;5647:          }
LABELV $3678
line 5648
;5648:        }
LABELV $3665
line 5616
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3667
ADDRLP4 4
INDIRI4
ADDRLP4 8+3328
INDIRI4
LTI4 $3664
line 5649
;5649:        Com_sprintf(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3707
ARGP4
ADDRGP4 uiInfo+682788
INDIRI4
ARGI4
ADDRGP4 $3616
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5654
;5650:          uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5651:          sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1]),
;5652:          "searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5653:        // retrieved the server status so reuse this spot
;5654:        uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5655
;5655:      }
LABELV $3660
line 5656
;5656:    }
LABELV $3655
line 5658
;5657:    // if empty pending slot or timed out
;5658:    if (!uiInfo.pendingServerStatus.server[i].valid
ADDRLP4 4404
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3722
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+682788+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3712
LABELV $3722
line 5661
;5659:        || uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime
;5660:            - ui_serverStatusTimeOut.integer)
;5661:    {
line 5662
;5662:      if (uiInfo.pendingServerStatus.server[i].valid)
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3723
line 5663
;5663:      {
line 5664
;5664:        numTimeOuts++;
ADDRLP4 4408
ADDRGP4 $3617
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5665
;5665:      }
LABELV $3723
line 5667
;5666:      // reset server status request for this address
;5667:      UI_GetServerStatusInfo(uiInfo.pendingServerStatus.server[i].adrstr, NULL);
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5669
;5668:      // reuse pending slot
;5669:      uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5671
;5670:      // if we didn't try to get the status of all servers in the main browser yet
;5671:      if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers)
ADDRGP4 uiInfo+682788
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
GEI4 $3733
line 5672
;5672:      {
line 5673
;5673:        uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+128
ADDP4
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 5674
;5674:        trap_LAN_GetServerAddressString(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+682788
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 5678
;5675:          ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
;5676:          uiInfo.pendingServerStatus.server[i].adrstr,
;5677:          sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;5678:        trap_LAN_GetServerInfo(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+682788
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 3374
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5681
;5679:          ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
;5680:          infoString, sizeof(infoString));
;5681:        Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(
ADDRLP4 3374
ARGP4
ADDRGP4 $3170
ARGP4
ADDRLP4 4408
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+64
ADDP4
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5683
;5682:          infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
;5683:        uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
CNSTI4 1
ASGNI4
line 5684
;5684:        uiInfo.pendingServerStatus.num++;
ADDRLP4 4412
ADDRGP4 uiInfo+682788
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5685
;5685:        Com_sprintf(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3707
ARGP4
ADDRGP4 uiInfo+682788
INDIRI4
ARGI4
ADDRGP4 $3616
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5689
;5686:          uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5687:          sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1]),
;5688:          "searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5689:      }
LABELV $3733
line 5690
;5690:    }
LABELV $3712
line 5691
;5691:  }
LABELV $3652
line 5605
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3651
line 5692
;5692:  for(i = 0;i < MAX_SERVERSTATUSREQUESTS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3771
line 5693
;5693:  {
line 5694
;5694:    if (uiInfo.pendingServerStatus.server[i].valid)
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+682788+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3775
line 5695
;5695:    {
line 5696
;5696:      break;
ADDRGP4 $3773
JUMPV
LABELV $3775
line 5698
;5697:    }
;5698:  }
LABELV $3772
line 5692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3771
LABELV $3773
line 5700
;5699:  // if still trying to retrieve server status info
;5700:  if (i < MAX_SERVERSTATUSREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $3780
line 5701
;5701:  {
line 5702
;5702:    uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+688112
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 5703
;5703:  }
ADDRGP4 $3781
JUMPV
LABELV $3780
line 5705
;5704:  else
;5705:  {
line 5707
;5706:    // add a line that shows the number of servers found
;5707:    if (!uiInfo.numFoundPlayerServers)
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 0
NEI4 $3784
line 5708
;5708:    {
line 5709
;5709:      Com_sprintf(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3791
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5712
;5710:        uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5711:        sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
;5712:    }
ADDRGP4 $3785
JUMPV
LABELV $3784
line 5714
;5713:    else
;5714:    {
line 5715
;5715:      Com_sprintf(
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3796
ARGP4
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 2
NEI4 $3802
ADDRLP4 4404
ADDRGP4 $131
ASGNP4
ADDRGP4 $3803
JUMPV
LABELV $3802
ADDRLP4 4404
ADDRGP4 $3799
ASGNP4
LABELV $3803
ADDRLP4 4404
INDIRP4
ARGP4
ADDRGP4 uiInfo+685032
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5720
;5716:        uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers - 1],
;5717:        sizeof(uiInfo.foundPlayerServerAddresses[0]), "%d server%s found with player %s",
;5718:        uiInfo.numFoundPlayerServers - 1, uiInfo.numFoundPlayerServers == 2 ? "" : "s",
;5719:        uiInfo.findPlayerName);
;5720:    }
LABELV $3785
line 5721
;5721:    uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+688112
CNSTI4 0
ASGNI4
line 5723
;5722:    // show the server status info for the selected server
;5723:    UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+688104
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 5724
;5724:  }
LABELV $3781
line 5725
;5725:}
LABELV $3615
endproc UI_BuildFindPlayerList 4424 24
proc UI_BuildServerStatus 8 16
line 5734
;5726:
;5727:/*
;5728: ==================
;5729: UI_BuildServerStatus
;5730: ==================
;5731: */
;5732:static void
;5733:UI_BuildServerStatus(qboolean force)
;5734:{
line 5736
;5735:
;5736:  if (uiInfo.nextFindPlayerRefresh)
ADDRGP4 uiInfo+688112
INDIRI4
CNSTI4 0
EQI4 $3807
line 5737
;5737:  {
line 5738
;5738:    return;
ADDRGP4 $3806
JUMPV
LABELV $3807
line 5740
;5739:  }
;5740:  if (!force)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3810
line 5741
;5741:  {
line 5742
;5742:    if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime)
ADDRGP4 uiInfo+682784
INDIRI4
CNSTI4 0
EQI4 $3817
ADDRGP4 uiInfo+682784
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3811
LABELV $3817
line 5743
;5743:    {
line 5744
;5744:      return;
ADDRGP4 $3806
JUMPV
line 5746
;5745:    }
;5746:  }
LABELV $3810
line 5748
;5747:  else
;5748:  {
line 5749
;5749:    Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5750
;5750:    uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+679452+3328
CNSTI4 0
ASGNI4
line 5752
;5751:    // reset all server status requests
;5752:    trap_LAN_ServerStatus(NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5753
;5753:  }
LABELV $3811
line 5754
;5754:  if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+667904+2216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $3831
ADDRGP4 uiInfo+667904+2216
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
GTI4 $3831
ADDRGP4 uiInfo+667904+10412
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $3820
LABELV $3831
line 5756
;5755:      > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0)
;5756:  {
line 5757
;5757:    return;
ADDRGP4 $3806
JUMPV
LABELV $3820
line 5759
;5758:  }
;5759:  if (UI_GetServerStatusInfo(uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo))
ADDRGP4 uiInfo+679388
ARGP4
ADDRGP4 uiInfo+679452
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $3832
line 5760
;5760:  {
line 5761
;5761:    uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+682784
CNSTI4 0
ASGNI4
line 5762
;5762:    UI_GetServerStatusInfo(uiInfo.serverStatusAddress, NULL);
ADDRGP4 uiInfo+679388
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5763
;5763:  }
ADDRGP4 $3833
JUMPV
LABELV $3832
line 5765
;5764:  else
;5765:  {
line 5766
;5766:    uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+682784
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5767
;5767:  }
LABELV $3833
line 5768
;5768:}
LABELV $3806
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 12 4
line 5777
;5769:
;5770:/*
;5771: ==================
;5772: UI_FeederCount
;5773: ==================
;5774: */
;5775:static int
;5776:UI_FeederCount(float feederID)
;5777:{
line 5778
;5778:  if (feederID == FEEDER_HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3841
line 5779
;5779:  {
line 5780
;5780:    return UI_HeadCountByTeam();
ADDRLP4 0
ADDRGP4 UI_HeadCountByTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3841
line 5782
;5781:  }
;5782:  else if (feederID == FEEDER_Q3HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3843
line 5783
;5783:  {
line 5784
;5784:    return uiInfo.q3HeadCount;
ADDRGP4 uiInfo+688128
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3843
line 5786
;5785:  }
;5786:  else if (feederID == FEEDER_CINEMATICS)
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3846
line 5787
;5787:  {
line 5788
;5788:    return uiInfo.movieCount;
ADDRGP4 uiInfo+99192
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3846
line 5790
;5789:  }
;5790:  else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS)
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3851
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3849
LABELV $3851
line 5791
;5791:  {
line 5792
;5792:    return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3853
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $3854
JUMPV
LABELV $3853
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $3854
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3849
line 5794
;5793:  }
;5794:  else if (feederID == FEEDER_SERVERS)
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3855
line 5795
;5795:  {
line 5796
;5796:    return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+667904+10412
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3855
line 5798
;5797:  }
;5798:  else if (feederID == FEEDER_SERVERSTATUS)
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3859
line 5799
;5799:  {
line 5800
;5800:    return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+679452+3328
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3859
line 5802
;5801:  }
;5802:  else if (feederID == FEEDER_FINDPLAYER)
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3863
line 5803
;5803:  {
line 5804
;5804:    return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+688108
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3863
line 5806
;5805:  }
;5806:  else if (feederID == FEEDER_PLAYER_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3866
line 5807
;5807:  {
line 5808
;5808:    if (uiInfo.uiDC.realTime > uiInfo.playerRefresh)
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78796
INDIRI4
LEI4 $3868
line 5809
;5809:    {
line 5810
;5810:      uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78796
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5811
;5811:      UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5812
;5812:    }
LABELV $3868
line 5813
;5813:    return uiInfo.playerCount;
ADDRGP4 uiInfo+78784
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3866
line 5815
;5814:  }
;5815:  else if (feederID == FEEDER_TEAM_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3875
line 5816
;5816:  {
line 5817
;5817:    if (uiInfo.uiDC.realTime > uiInfo.playerRefresh)
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78796
INDIRI4
LEI4 $3877
line 5818
;5818:    {
line 5819
;5819:      uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78796
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5820
;5820:      UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5821
;5821:    }
LABELV $3877
line 5822
;5822:    return uiInfo.myTeamCount;
ADDRGP4 uiInfo+78788
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3875
line 5824
;5823:  }
;5824:  else if (feederID == FEEDER_MODS)
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3884
line 5825
;5825:  {
line 5826
;5826:    return uiInfo.modCount;
ADDRGP4 uiInfo+97128
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3884
line 5828
;5827:  }
;5828:  else if (feederID == FEEDER_DEMOS)
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3887
line 5829
;5829:  {
line 5830
;5830:    return uiInfo.demoCount;
ADDRGP4 uiInfo+98160
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3887
line 5834
;5831:  }
;5832:
;5833:  //TA: tremulous menus
;5834:  else if (feederID == FEEDER_TREMTEAMS)
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $3890
line 5835
;5835:    return uiInfo.tremTeamCount;
ADDRGP4 uiInfo+666040
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3890
line 5836
;5836:  else if (feederID == FEEDER_TREMHUMANITEMS)
ADDRFP4 0
INDIRF4
CNSTF4 1099956224
NEF4 $3893
line 5837
;5837:    return uiInfo.tremHumanItemCount;
ADDRGP4 uiInfo+666128
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3893
line 5838
;5838:  else if (feederID == FEEDER_TREMALIENCLASSES)
ADDRFP4 0
INDIRF4
CNSTF4 1099431936
NEF4 $3896
line 5839
;5839:    return uiInfo.tremAlienClassCount;
ADDRGP4 uiInfo+666084
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3896
line 5840
;5840:  else if (feederID == FEEDER_TREMHUMANARMOURYBUY)
ADDRFP4 0
INDIRF4
CNSTF4 1100480512
NEF4 $3899
line 5841
;5841:    return uiInfo.tremHumanArmouryBuyCount;
ADDRGP4 uiInfo+666520
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3899
line 5842
;5842:  else if (feederID == FEEDER_TREMHUMANARMOURYSELL)
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
NEF4 $3902
line 5843
;5843:    return uiInfo.tremHumanArmourySellCount;
ADDRGP4 uiInfo+666912
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3902
line 5844
;5844:  else if (feederID == FEEDER_TREMALIENUPGRADE)
ADDRFP4 0
INDIRF4
CNSTF4 1101529088
NEF4 $3905
line 5845
;5845:    return uiInfo.tremAlienUpgradeCount;
ADDRGP4 uiInfo+667112
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3905
line 5846
;5846:  else if (feederID == FEEDER_TREMALIENBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102053376
NEF4 $3908
line 5847
;5847:    return uiInfo.tremAlienBuildCount;
ADDRGP4 uiInfo+667504
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3908
line 5848
;5848:  else if (feederID == FEEDER_TREMHUMANBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102577664
NEF4 $3911
line 5849
;5849:    return uiInfo.tremHumanBuildCount;
ADDRGP4 uiInfo+667896
INDIRI4
RETI4
ADDRGP4 $3840
JUMPV
LABELV $3911
line 5852
;5850:  //TA: tremulous menus
;5851:
;5852:  return 0;
CNSTI4 0
RETI4
LABELV $3840
endproc UI_FeederCount 12 4
proc UI_SelectedMap 8 0
line 5857
;5853:}
;5854:
;5855:static const char *
;5856:UI_SelectedMap(int index, int *actual)
;5857:{
line 5859
;5858:  int i, c;
;5859:  c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5860
;5860:  *actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5861
;5861:  for(i = 0;i < uiInfo.mapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3918
JUMPV
LABELV $3915
line 5862
;5862:  {
line 5863
;5863:    if (uiInfo.mapList[i].active)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3920
line 5864
;5864:    {
line 5865
;5865:      if (c == index)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3924
line 5866
;5866:      {
line 5867
;5867:        *actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5868
;5868:        return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168
ADDP4
INDIRP4
RETP4
ADDRGP4 $3914
JUMPV
LABELV $3924
line 5871
;5869:      }
;5870:      else
;5871:      {
line 5872
;5872:        c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5873
;5873:      }
line 5874
;5874:    }
LABELV $3920
line 5875
;5875:  }
LABELV $3916
line 5861
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3918
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LTI4 $3915
line 5876
;5876:  return "";
ADDRGP4 $131
RETP4
LABELV $3914
endproc UI_SelectedMap 8 0
proc UI_SelectedHead 8 0
line 5881
;5877:}
;5878:
;5879:static const char *
;5880:UI_SelectedHead(int index, int *actual)
;5881:{
line 5883
;5882:  int i, c;
;5883:  c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5884
;5884:  *actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5885
;5885:  for(i = 0;i < uiInfo.characterCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3931
JUMPV
LABELV $3928
line 5886
;5886:  {
line 5887
;5887:    if (uiInfo.characterList[i].active)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3933
line 5888
;5888:    {
line 5889
;5889:      if (c == index)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3937
line 5890
;5890:      {
line 5891
;5891:        *actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5892
;5892:        return uiInfo.characterList[i].name;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73388
ADDP4
INDIRP4
RETP4
ADDRGP4 $3927
JUMPV
LABELV $3937
line 5895
;5893:      }
;5894:      else
;5895:      {
line 5896
;5896:        c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5897
;5897:      }
line 5898
;5898:    }
LABELV $3933
line 5899
;5899:  }
LABELV $3929
line 5885
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3931
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
LTI4 $3928
line 5900
;5900:  return "";
ADDRGP4 $131
RETP4
LABELV $3927
endproc UI_SelectedHead 8 0
proc UI_GetIndexFromSelection 8 0
line 5905
;5901:}
;5902:
;5903:static int
;5904:UI_GetIndexFromSelection(int actual)
;5905:{
line 5907
;5906:  int i, c;
;5907:  c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5908
;5908:  for(i = 0;i < uiInfo.mapCount;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3944
JUMPV
LABELV $3941
line 5909
;5909:  {
line 5910
;5910:    if (uiInfo.mapList[i].active)
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3946
line 5911
;5911:    {
line 5912
;5912:      if (i == actual)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3950
line 5913
;5913:      {
line 5914
;5914:        return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $3940
JUMPV
LABELV $3950
line 5916
;5915:      }
;5916:      c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5917
;5917:    }
LABELV $3946
line 5918
;5918:  }
LABELV $3942
line 5908
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3944
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
LTI4 $3941
line 5919
;5919:  return 0;
CNSTI4 0
RETI4
LABELV $3940
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 5924
;5920:}
;5921:
;5922:static void
;5923:UI_UpdatePendingPings(void)
;5924:{
line 5925
;5925:  trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 5926
;5926:  uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+667904+2212
CNSTI4 1
ASGNI4
line 5927
;5927:  uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+667904+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5929
;5928:
;5929:}
LABELV $3952
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $3960
skip 1024
align 1
LABELV $3961
skip 1024
align 1
LABELV $3962
skip 32
data
align 4
LABELV $3963
byte 4 -1
align 4
LABELV $3964
byte 4 0
code
proc UI_FeederItemText 40 20
line 5933
;5930:
;5931:static const char *
;5932:UI_FeederItemText(float feederID, int index, int column, qhandle_t *handle)
;5933:{
line 5939
;5934:  static char info[MAX_STRING_CHARS];
;5935:  static char hostname[1024];
;5936:  static char clientBuff[32];
;5937:  static int lastColumn = -1;
;5938:  static int lastTime = 0;
;5939:  *handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 5940
;5940:  if (feederID == FEEDER_HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3965
line 5941
;5941:  {
line 5943
;5942:    int actual;
;5943:    return UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 UI_SelectedHead
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $3965
line 5945
;5944:  }
;5945:  else if (feederID == FEEDER_Q3HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3967
line 5946
;5946:  {
line 5947
;5947:    if (index >= 0 && index < uiInfo.q3HeadCount)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3968
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+688128
INDIRI4
GEI4 $3968
line 5948
;5948:    {
line 5949
;5949:      return uiInfo.q3HeadNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+688132
ADDP4
RETP4
ADDRGP4 $3959
JUMPV
line 5951
;5950:    }
;5951:  }
LABELV $3967
line 5952
;5952:  else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS)
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3975
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3973
LABELV $3975
line 5953
;5953:  {
line 5955
;5954:    int actual;
;5955:    return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $3973
line 5957
;5956:  }
;5957:  else if (feederID == FEEDER_SERVERS)
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3976
line 5958
;5958:  {
line 5959
;5959:    if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3977
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
GEI4 $3977
line 5960
;5960:    {
line 5962
;5961:      int ping;
;5962:      if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000)
ADDRGP4 $3963
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $3985
ADDRGP4 $3964
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $3982
LABELV $3985
line 5963
;5963:      {
line 5964
;5964:        trap_LAN_GetServerInfo(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3960
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5966
;5965:          ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
;5966:        lastColumn = column;
ADDRGP4 $3963
ADDRFP4 8
INDIRI4
ASGNI4
line 5967
;5967:        lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $3964
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 5968
;5968:      }
LABELV $3982
line 5970
;5969:
;5970:      ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $3960
ARGP4
ADDRGP4 $3585
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
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
line 5971
;5971:      if (ping == -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $3990
line 5972
;5972:      {
line 5975
;5973:        // if we ever see a ping that is out of date, do a server refresh
;5974:        // UI_UpdatePendingPings();
;5975:      }
LABELV $3990
line 5976
;5976:      switch(column)
ADDRLP4 20
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $3977
ADDRLP4 20
INDIRI4
CNSTI4 3
GTI4 $3977
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4010
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4010
address $3994
address $4003
address $4004
address $4006
code
line 5977
;5977:      {
LABELV $3994
line 5979
;5978:        case SORT_HOST:
;5979:          if (ping <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $3995
line 5980
;5980:          {
line 5981
;5981:            return Info_ValueForKey(info, "addr");
ADDRGP4 $3960
ARGP4
ADDRGP4 $3171
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $3995
line 5984
;5982:          }
;5983:          else
;5984:          {
line 5985
;5985:            if (ui_netSource.integer == AS_LOCAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3997
line 5986
;5986:            {
line 5987
;5987:              Com_sprintf(
ADDRGP4 $3960
ARGP4
ADDRGP4 $3170
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3960
ARGP4
ADDRGP4 $4001
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $3961
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $4000
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5990
;5988:                hostname, sizeof(hostname), "%s [%s]", Info_ValueForKey(info, "hostname"),
;5989:                netnames[atoi(Info_ValueForKey(info, "nettype"))]);
;5990:              return hostname;
ADDRGP4 $3961
RETP4
ADDRGP4 $3959
JUMPV
LABELV $3997
line 5993
;5991:            }
;5992:            else
;5993:            {
line 5994
;5994:              Com_sprintf(hostname, sizeof(hostname), "%s", Info_ValueForKey(info, "hostname"));
ADDRGP4 $3960
ARGP4
ADDRGP4 $3170
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3961
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $4002
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5996
;5995:
;5996:              return hostname;
ADDRGP4 $3961
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4003
line 6000
;5997:            }
;5998:          }
;5999:        case SORT_MAP:
;6000:          return Info_ValueForKey(info, "mapname");
ADDRGP4 $3960
ARGP4
ADDRGP4 $3542
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4004
line 6002
;6001:        case SORT_CLIENTS:
;6002:          Com_sprintf(
ADDRGP4 $3960
ARGP4
ADDRGP4 $3497
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3960
ARGP4
ADDRGP4 $1605
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3962
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $4005
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6005
;6003:            clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"),
;6004:            Info_ValueForKey(info, "sv_maxclients"));
;6005:          return clientBuff;
ADDRGP4 $3962
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4006
line 6007
;6006:        case SORT_PING:
;6007:          if (ping <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $4007
line 6008
;6008:          {
line 6009
;6009:            return "...";
ADDRGP4 $4009
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4007
line 6012
;6010:          }
;6011:          else
;6012:          {
line 6013
;6013:            return Info_ValueForKey(info, "ping");
ADDRGP4 $3960
ARGP4
ADDRGP4 $3585
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6016
;6014:          }
;6015:      }
;6016:    }
line 6017
;6017:  }
LABELV $3976
line 6018
;6018:  else if (feederID == FEEDER_SERVERSTATUS)
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4011
line 6019
;6019:  {
line 6020
;6020:    if (index >= 0 && index < uiInfo.serverStatusInfo.numLines)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4012
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+679452+3328
INDIRI4
GEI4 $4012
line 6021
;6021:    {
line 6022
;6022:      if (column >= 0 && column < 4)
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4012
ADDRLP4 8
INDIRI4
CNSTI4 4
GEI4 $4012
line 6023
;6023:      {
line 6024
;6024:        return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+679452+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6026
;6025:      }
;6026:    }
line 6027
;6027:  }
LABELV $4011
line 6028
;6028:  else if (feederID == FEEDER_FINDPLAYER)
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4021
line 6029
;6029:  {
line 6030
;6030:    if (index >= 0 && index < uiInfo.numFoundPlayerServers)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4022
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+688108
INDIRI4
GEI4 $4022
line 6031
;6031:    {
line 6033
;6032:      //return uiInfo.foundPlayerServerAddresses[index];
;6033:      return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+687080
ADDP4
RETP4
ADDRGP4 $3959
JUMPV
line 6035
;6034:    }
;6035:  }
LABELV $4021
line 6036
;6036:  else if (feederID == FEEDER_PLAYER_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4027
line 6037
;6037:  {
line 6038
;6038:    if (index >= 0 && index < uiInfo.playerCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4028
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78784
INDIRI4
GEI4 $4028
line 6039
;6039:    {
line 6040
;6040:      return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78812
ADDP4
RETP4
ADDRGP4 $3959
JUMPV
line 6042
;6041:    }
;6042:  }
LABELV $4027
line 6043
;6043:  else if (feederID == FEEDER_TEAM_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4033
line 6044
;6044:  {
line 6045
;6045:    if (index >= 0 && index < uiInfo.myTeamCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4034
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78788
INDIRI4
GEI4 $4034
line 6046
;6046:    {
line 6047
;6047:      return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80860
ADDP4
RETP4
ADDRGP4 $3959
JUMPV
line 6049
;6048:    }
;6049:  }
LABELV $4033
line 6050
;6050:  else if (feederID == FEEDER_MODS)
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4039
line 6051
;6051:  {
line 6052
;6052:    if (index >= 0 && index < uiInfo.modCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4040
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+97128
INDIRI4
GEI4 $4040
line 6053
;6053:    {
line 6054
;6054:      if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr)
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96616+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4044
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96616+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4044
line 6055
;6055:      {
line 6056
;6056:        return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96616+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4044
line 6059
;6057:      }
;6058:      else
;6059:      {
line 6060
;6060:        return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96616
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6063
;6061:      }
;6062:    }
;6063:  }
LABELV $4039
line 6064
;6064:  else if (feederID == FEEDER_CINEMATICS)
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4053
line 6065
;6065:  {
line 6066
;6066:    if (index >= 0 && index < uiInfo.movieCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4054
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99192
INDIRI4
GEI4 $4054
line 6067
;6067:    {
line 6068
;6068:      return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98168
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6070
;6069:    }
;6070:  }
LABELV $4053
line 6071
;6071:  else if (feederID == FEEDER_DEMOS)
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4059
line 6072
;6072:  {
line 6073
;6073:    if (index >= 0 && index < uiInfo.demoCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4060
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+98160
INDIRI4
GEI4 $4060
line 6074
;6074:    {
line 6075
;6075:      return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97136
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6077
;6076:    }
;6077:  }
LABELV $4059
line 6080
;6078:
;6079:  //TA: tremulous menus
;6080:  else if (feederID == FEEDER_TREMTEAMS)
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4065
line 6081
;6081:  {
line 6082
;6082:    if (index >= 0 && index < uiInfo.tremTeamCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4066
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+666040
INDIRI4
GEI4 $4066
line 6083
;6083:      return uiInfo.tremTeamList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+665992
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6084
;6084:  }
LABELV $4065
line 6085
;6085:  else if (feederID == FEEDER_TREMHUMANITEMS)
ADDRFP4 0
INDIRF4
CNSTF4 1099956224
NEF4 $4071
line 6086
;6086:  {
line 6087
;6087:    if (index >= 0 && index < uiInfo.tremHumanItemCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4072
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+666128
INDIRI4
GEI4 $4072
line 6088
;6088:      return uiInfo.tremHumanItemList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666092
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6089
;6089:  }
LABELV $4071
line 6090
;6090:  else if (feederID == FEEDER_TREMALIENCLASSES)
ADDRFP4 0
INDIRF4
CNSTF4 1099431936
NEF4 $4077
line 6091
;6091:  {
line 6092
;6092:    if (index >= 0 && index < uiInfo.tremAlienClassCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4078
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+666084
INDIRI4
GEI4 $4078
line 6093
;6093:      return uiInfo.tremAlienClassList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666048
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6094
;6094:  }
LABELV $4077
line 6095
;6095:  else if (feederID == FEEDER_TREMHUMANARMOURYBUY)
ADDRFP4 0
INDIRF4
CNSTF4 1100480512
NEF4 $4083
line 6096
;6096:  {
line 6097
;6097:    if (index >= 0 && index < uiInfo.tremHumanArmouryBuyCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4084
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+666520
INDIRI4
GEI4 $4084
line 6098
;6098:      return uiInfo.tremHumanArmouryBuyList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666136
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6099
;6099:  }
LABELV $4083
line 6100
;6100:  else if (feederID == FEEDER_TREMHUMANARMOURYSELL)
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
NEF4 $4089
line 6101
;6101:  {
line 6102
;6102:    if (index >= 0 && index < uiInfo.tremHumanArmourySellCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4090
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+666912
INDIRI4
GEI4 $4090
line 6103
;6103:      return uiInfo.tremHumanArmourySellList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666528
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6104
;6104:  }
LABELV $4089
line 6105
;6105:  else if (feederID == FEEDER_TREMALIENUPGRADE)
ADDRFP4 0
INDIRF4
CNSTF4 1101529088
NEF4 $4095
line 6106
;6106:  {
line 6107
;6107:    if (index >= 0 && index < uiInfo.tremAlienUpgradeCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4096
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667112
INDIRI4
GEI4 $4096
line 6108
;6108:      return uiInfo.tremAlienUpgradeList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+666920
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6109
;6109:  }
LABELV $4095
line 6110
;6110:  else if (feederID == FEEDER_TREMALIENBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102053376
NEF4 $4101
line 6111
;6111:  {
line 6112
;6112:    if (index >= 0 && index < uiInfo.tremAlienBuildCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4102
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667504
INDIRI4
GEI4 $4102
line 6113
;6113:      return uiInfo.tremAlienBuildList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667120
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
line 6114
;6114:  }
LABELV $4101
line 6115
;6115:  else if (feederID == FEEDER_TREMHUMANBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102577664
NEF4 $4107
line 6116
;6116:  {
line 6117
;6117:    if (index >= 0 && index < uiInfo.tremHumanBuildCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4109
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+667896
INDIRI4
GEI4 $4109
line 6118
;6118:      return uiInfo.tremHumanBuildList[index].text;
CNSTI4 12
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+667512
ADDP4
INDIRP4
RETP4
ADDRGP4 $3959
JUMPV
LABELV $4109
line 6119
;6119:  }
LABELV $4107
LABELV $4102
LABELV $4096
LABELV $4090
LABELV $4084
LABELV $4078
LABELV $4072
LABELV $4066
LABELV $4060
LABELV $4054
LABELV $4040
LABELV $4034
LABELV $4028
LABELV $4022
LABELV $4012
LABELV $3977
LABELV $3968
line 6122
;6120:  //TA: tremulous menus
;6121:
;6122:  return "";
ADDRGP4 $131
RETP4
LABELV $3959
endproc UI_FeederItemText 40 20
proc UI_FeederItemImage 20 8
line 6127
;6123:}
;6124:
;6125:static qhandle_t
;6126:UI_FeederItemImage(float feederID, int index)
;6127:{
line 6128
;6128:  if (feederID == FEEDER_HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4114
line 6129
;6129:  {
line 6131
;6130:    int actual;
;6131:    UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 6132
;6132:    index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 6133
;6133:    if (index >= 0 && index < uiInfo.characterCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4115
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
GEI4 $4115
line 6134
;6134:    {
line 6135
;6135:      if (uiInfo.characterList[index].headImage == -1)
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4119
line 6136
;6136:      {
line 6137
;6137:        uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(
ADDRLP4 8
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73388+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73388+8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 6139
;6138:          uiInfo.characterList[index].imageName);
;6139:      }
LABELV $4119
line 6140
;6140:      return uiInfo.characterList[index].headImage;
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $4113
JUMPV
line 6142
;6141:    }
;6142:  }
LABELV $4114
line 6143
;6143:  else if (feederID == FEEDER_Q3HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4129
line 6144
;6144:  {
line 6145
;6145:    if (index >= 0 && index < uiInfo.q3HeadCount)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4130
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+688128
INDIRI4
GEI4 $4130
line 6146
;6146:    {
line 6147
;6147:      return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+704516
ADDP4
INDIRI4
RETI4
ADDRGP4 $4113
JUMPV
line 6149
;6148:    }
;6149:  }
LABELV $4129
line 6150
;6150:  else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS)
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $4137
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4135
LABELV $4137
line 6151
;6151:  {
line 6153
;6152:    int actual;
;6153:    UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 6154
;6154:    index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 6155
;6155:    if (index >= 0 && index < uiInfo.mapCount)
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4138
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+83164
INDIRI4
GEI4 $4138
line 6156
;6156:    {
line 6157
;6157:      if (uiInfo.mapList[index].levelShot == -1)
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4141
line 6158
;6158:      {
line 6159
;6159:        uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83168+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 6161
;6160:          uiInfo.mapList[index].imageName);
;6161:      }
LABELV $4141
line 6162
;6162:      return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $4113
JUMPV
LABELV $4138
line 6164
;6163:    }
;6164:  }
LABELV $4135
LABELV $4130
LABELV $4115
line 6165
;6165:  return 0;
CNSTI4 0
RETI4
LABELV $4113
endproc UI_FeederItemImage 20 8
bss
align 1
LABELV $4152
skip 1024
code
proc UI_FeederSelection 40 24
line 6170
;6166:}
;6167:
;6168:static void
;6169:UI_FeederSelection(float feederID, int index)
;6170:{
line 6172
;6171:  static char info[MAX_STRING_CHARS];
;6172:  if (feederID == FEEDER_HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4153
line 6173
;6173:  {
line 6175
;6174:    int actual;
;6175:    UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 6176
;6176:    index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 6177
;6177:    if (index >= 0 && index < uiInfo.characterCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4154
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73380
INDIRI4
GEI4 $4154
line 6178
;6178:    {
line 6179
;6179:      trap_Cvar_Set("team_model", va("%s", uiInfo.characterList[index].base));
ADDRGP4 $4002
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73388+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1228
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6180
;6180:      trap_Cvar_Set("team_headmodel", va("*%s", uiInfo.characterList[index].name));
ADDRGP4 $4160
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73388
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1229
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6181
;6181:      updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 6182
;6182:    }
line 6183
;6183:  }
ADDRGP4 $4154
JUMPV
LABELV $4153
line 6184
;6184:  else if (feederID == FEEDER_Q3HEADS)
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4162
line 6185
;6185:  {
line 6186
;6186:    if (index >= 0 && index < uiInfo.q3HeadCount)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4163
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+688128
INDIRI4
GEI4 $4163
line 6187
;6187:    {
line 6188
;6188:      trap_Cvar_Set("model", uiInfo.q3HeadNames[index]);
ADDRGP4 $1224
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+688132
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6189
;6189:      trap_Cvar_Set("headmodel", uiInfo.q3HeadNames[index]);
ADDRGP4 $1225
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+688132
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6190
;6190:      updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 6191
;6191:    }
line 6192
;6192:  }
ADDRGP4 $4163
JUMPV
LABELV $4162
line 6193
;6193:  else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS)
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4171
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4169
LABELV $4171
line 6194
;6194:  {
line 6196
;6195:    int actual, map;
;6196:    map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4175
ADDRLP4 12
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $4176
JUMPV
LABELV $4175
ADDRLP4 12
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $4176
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 6197
;6197:    if (uiInfo.mapList[map].cinematic >= 0)
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4177
line 6198
;6198:    {
line 6199
;6199:      trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6200
;6200:      uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
CNSTI4 -1
ASGNI4
line 6201
;6201:    }
LABELV $4177
line 6202
;6202:    UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 6203
;6203:    trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $930
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2625
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6204
;6204:    ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 6206
;6205:
;6206:    if (feederID == FEEDER_MAPS)
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4186
line 6207
;6207:    {
line 6208
;6208:      ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 6209
;6209:      trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $930
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1150
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6210
;6210:      uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va(
ADDRGP4 $1007
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6213
;6211:        "%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop
;6212:          | CIN_silent));
;6213:      UI_LoadBestScores(
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 6216
;6214:        uiInfo.mapList[ui_currentMap.integer].mapLoadName,
;6215:        uiInfo.gameTypes[ui_gameType.integer].gtEnum);
;6216:      trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
ADDRGP4 $1354
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+12
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6217
;6217:      updateOpponentModel = qtrue;
ADDRGP4 updateOpponentModel
CNSTI4 1
ASGNI4
line 6218
;6218:    }
ADDRGP4 $4170
JUMPV
LABELV $4186
line 6220
;6219:    else
;6220:    {
line 6221
;6221:      ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 6222
;6222:      trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $930
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1148
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6223
;6223:      uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va(
ADDRGP4 $1007
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6226
;6224:        "%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop
;6225:          | CIN_silent));
;6226:    }
line 6228
;6227:
;6228:  }
ADDRGP4 $4170
JUMPV
LABELV $4169
line 6229
;6229:  else if (feederID == FEEDER_SERVERS)
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4211
line 6230
;6230:  {
line 6231
;6231:    const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 6232
;6232:    uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+667904+2216
ADDRFP4 4
INDIRI4
ASGNI4
line 6233
;6233:    trap_LAN_GetServerInfo(
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+667904+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $4152
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 6235
;6234:      ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
;6235:    uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va(
ADDRGP4 $4152
ARGP4
ADDRGP4 $3542
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1301
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+667904+10428
ADDRLP4 16
INDIRI4
ASGNI4
line 6237
;6236:      "levelshots/%s", Info_ValueForKey(info, "mapname")));
;6237:    if (uiInfo.serverStatus.currentServerCinematic >= 0)
ADDRGP4 uiInfo+667904+10432
INDIRI4
CNSTI4 0
LTI4 $4220
line 6238
;6238:    {
line 6239
;6239:      trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+667904+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6240
;6240:      uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+667904+10432
CNSTI4 -1
ASGNI4
line 6241
;6241:    }
LABELV $4220
line 6242
;6242:    mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $4152
ARGP4
ADDRGP4 $3542
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 6243
;6243:    if (mapName && *mapName)
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4212
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4212
line 6244
;6244:    {
line 6245
;6245:      uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(
ADDRGP4 $1007
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+667904+10432
ADDRLP4 36
INDIRI4
ASGNI4
line 6247
;6246:        va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent));
;6247:    }
line 6248
;6248:  }
ADDRGP4 $4212
JUMPV
LABELV $4211
line 6249
;6249:  else if (feederID == FEEDER_SERVERSTATUS)
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4232
line 6250
;6250:  {
line 6252
;6251:    //
;6252:  }
ADDRGP4 $4233
JUMPV
LABELV $4232
line 6253
;6253:  else if (feederID == FEEDER_FINDPLAYER)
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4234
line 6254
;6254:  {
line 6255
;6255:    uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+688104
ADDRFP4 4
INDIRI4
ASGNI4
line 6257
;6256:    //
;6257:    if (index < uiInfo.numFoundPlayerServers - 1)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+688108
INDIRI4
CNSTI4 1
SUBI4
GEI4 $4235
line 6258
;6258:    {
line 6260
;6259:      // build a new server status for this server
;6260:      Q_strncpyz(
ADDRGP4 uiInfo+679388
ARGP4
ADDRGP4 uiInfo+688104
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+686056
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6264
;6261:        uiInfo.serverStatusAddress,
;6262:        uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer],
;6263:        sizeof(uiInfo.serverStatusAddress));
;6264:      Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 6265
;6265:      UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 6266
;6266:    }
line 6267
;6267:  }
ADDRGP4 $4235
JUMPV
LABELV $4234
line 6268
;6268:  else if (feederID == FEEDER_PLAYER_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4244
line 6269
;6269:  {
line 6270
;6270:    uiInfo.playerIndex = index;
ADDRGP4 uiInfo+78800
ADDRFP4 4
INDIRI4
ASGNI4
line 6271
;6271:  }
ADDRGP4 $4245
JUMPV
LABELV $4244
line 6272
;6272:  else if (feederID == FEEDER_TEAM_LIST)
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4247
line 6273
;6273:  {
line 6274
;6274:    uiInfo.teamIndex = index;
ADDRGP4 uiInfo+78792
ADDRFP4 4
INDIRI4
ASGNI4
line 6275
;6275:  }
ADDRGP4 $4248
JUMPV
LABELV $4247
line 6276
;6276:  else if (feederID == FEEDER_MODS)
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4250
line 6277
;6277:  {
line 6278
;6278:    uiInfo.modIndex = index;
ADDRGP4 uiInfo+97132
ADDRFP4 4
INDIRI4
ASGNI4
line 6279
;6279:  }
ADDRGP4 $4251
JUMPV
LABELV $4250
line 6280
;6280:  else if (feederID == FEEDER_CINEMATICS)
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4253
line 6281
;6281:  {
line 6282
;6282:    uiInfo.movieIndex = index;
ADDRGP4 uiInfo+99196
ADDRFP4 4
INDIRI4
ASGNI4
line 6283
;6283:    if (uiInfo.previewMovie >= 0)
ADDRGP4 uiInfo+99200
INDIRI4
CNSTI4 0
LTI4 $4256
line 6284
;6284:    {
line 6285
;6285:      trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99200
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6286
;6286:    }
LABELV $4256
line 6287
;6287:    uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99200
CNSTI4 -1
ASGNI4
line 6288
;6288:  }
ADDRGP4 $4254
JUMPV
LABELV $4253
line 6289
;6289:  else if (feederID == FEEDER_DEMOS)
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4261
line 6290
;6290:  {
line 6291
;6291:    uiInfo.demoIndex = index;
ADDRGP4 uiInfo+98164
ADDRFP4 4
INDIRI4
ASGNI4
line 6292
;6292:  }
ADDRGP4 $4262
JUMPV
LABELV $4261
line 6295
;6293:
;6294:  //TA: tremulous menus
;6295:  else if (feederID == FEEDER_TREMTEAMS)
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4264
line 6296
;6296:    uiInfo.tremTeamIndex = index;
ADDRGP4 uiInfo+666044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4265
JUMPV
LABELV $4264
line 6297
;6297:  else if (feederID == FEEDER_TREMHUMANITEMS)
ADDRFP4 0
INDIRF4
CNSTF4 1099956224
NEF4 $4267
line 6298
;6298:    uiInfo.tremHumanItemIndex = index;
ADDRGP4 uiInfo+666132
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4268
JUMPV
LABELV $4267
line 6299
;6299:  else if (feederID == FEEDER_TREMALIENCLASSES)
ADDRFP4 0
INDIRF4
CNSTF4 1099431936
NEF4 $4270
line 6300
;6300:    uiInfo.tremAlienClassIndex = index;
ADDRGP4 uiInfo+666088
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4271
JUMPV
LABELV $4270
line 6301
;6301:  else if (feederID == FEEDER_TREMHUMANARMOURYBUY)
ADDRFP4 0
INDIRF4
CNSTF4 1100480512
NEF4 $4273
line 6302
;6302:    uiInfo.tremHumanArmouryBuyIndex = index;
ADDRGP4 uiInfo+666524
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4274
JUMPV
LABELV $4273
line 6303
;6303:  else if (feederID == FEEDER_TREMHUMANARMOURYSELL)
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
NEF4 $4276
line 6304
;6304:    uiInfo.tremHumanArmourySellIndex = index;
ADDRGP4 uiInfo+666916
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4277
JUMPV
LABELV $4276
line 6305
;6305:  else if (feederID == FEEDER_TREMALIENUPGRADE)
ADDRFP4 0
INDIRF4
CNSTF4 1101529088
NEF4 $4279
line 6306
;6306:    uiInfo.tremAlienUpgradeIndex = index;
ADDRGP4 uiInfo+667116
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4280
JUMPV
LABELV $4279
line 6307
;6307:  else if (feederID == FEEDER_TREMALIENBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102053376
NEF4 $4282
line 6308
;6308:    uiInfo.tremAlienBuildIndex = index;
ADDRGP4 uiInfo+667508
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $4283
JUMPV
LABELV $4282
line 6309
;6309:  else if (feederID == FEEDER_TREMHUMANBUILD)
ADDRFP4 0
INDIRF4
CNSTF4 1102577664
NEF4 $4285
line 6310
;6310:    uiInfo.tremHumanBuildIndex = index;
ADDRGP4 uiInfo+667900
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $4285
LABELV $4283
LABELV $4280
LABELV $4277
LABELV $4274
LABELV $4271
LABELV $4268
LABELV $4265
LABELV $4262
LABELV $4254
LABELV $4251
LABELV $4248
LABELV $4245
LABELV $4235
LABELV $4233
LABELV $4212
LABELV $4170
LABELV $4163
LABELV $4154
line 6312
;6311:  //TA: tremulous menus
;6312:}
LABELV $4151
endproc UI_FeederSelection 40 24
proc UI_Pause 4 8
line 6316
;6313:
;6314:static void
;6315:UI_Pause(qboolean b)
;6316:{
line 6317
;6317:  if (b)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4289
line 6318
;6318:  {
line 6320
;6319:    // pause the game and set the ui keycatcher
;6320:    trap_Cvar_Set("cl_paused", "1");
ADDRGP4 $3061
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6321
;6321:    trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6322
;6322:  }
ADDRGP4 $4290
JUMPV
LABELV $4289
line 6324
;6323:  else
;6324:  {
line 6326
;6325:    // unpause the game and clear the ui keycatcher
;6326:    trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6327
;6327:    trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6328
;6328:    trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6329
;6329:  }
LABELV $4290
line 6330
;6330:}
LABELV $4288
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 6334
;6331:
;6332:static int
;6333:UI_PlayCinematic(const char *name, float x, float y, float w, float h)
;6334:{
line 6335
;6335:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4291
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 6340
;6336:}
;6337:
;6338:static void
;6339:UI_StopCinematic(int handle)
;6340:{
line 6341
;6341:  if (handle >= 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4293
line 6342
;6342:  {
line 6343
;6343:    trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6344
;6344:  }
ADDRGP4 $4294
JUMPV
LABELV $4293
line 6346
;6345:  else
;6346:  {
line 6347
;6347:    handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 6348
;6348:    if (handle == UI_MAPCINEMATIC)
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4295
line 6349
;6349:    {
line 6350
;6350:      if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0)
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4296
line 6351
;6351:      {
line 6352
;6352:        trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6353
;6353:        uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+24
ADDP4
CNSTI4 -1
ASGNI4
line 6354
;6354:      }
line 6355
;6355:    }
ADDRGP4 $4296
JUMPV
LABELV $4295
line 6356
;6356:    else if (handle == UI_NETMAPCINEMATIC)
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4308
line 6357
;6357:    {
line 6358
;6358:      if (uiInfo.serverStatus.currentServerCinematic >= 0)
ADDRGP4 uiInfo+667904+10432
INDIRI4
CNSTI4 0
LTI4 $4309
line 6359
;6359:      {
line 6360
;6360:        trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+667904+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6361
;6361:        uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+667904+10432
CNSTI4 -1
ASGNI4
line 6362
;6362:      }
line 6363
;6363:    }
ADDRGP4 $4309
JUMPV
LABELV $4308
line 6364
;6364:    else if (handle == UI_CLANCINEMATIC)
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4318
line 6365
;6365:    {
line 6366
;6366:      int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $925
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 6367
;6367:      if (i >= 0 && i < uiInfo.teamCount)
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4320
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75696
INDIRI4
GEI4 $4320
line 6368
;6368:      {
line 6369
;6369:        if (uiInfo.teamList[i].cinematic >= 0)
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4323
line 6370
;6370:        {
line 6371
;6371:          trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6372
;6372:          uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75700+40
ADDP4
CNSTI4 -1
ASGNI4
line 6373
;6373:        }
LABELV $4323
line 6374
;6374:      }
LABELV $4320
line 6375
;6375:    }
LABELV $4318
LABELV $4309
LABELV $4296
line 6376
;6376:  }
LABELV $4294
line 6377
;6377:}
LABELV $4292
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 6381
;6378:
;6379:static void
;6380:UI_DrawCinematic(int handle, float x, float y, float w, float h)
;6381:{
line 6382
;6382:  trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 6383
;6383:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 6384
;6384:}
LABELV $4331
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 6388
;6385:
;6386:static void
;6387:UI_RunCinematicFrame(int handle)
;6388:{
line 6389
;6389:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 6390
;6390:}
LABELV $4332
endproc UI_RunCinematicFrame 0 4
proc UI_BuildQ3Model_List 4520 20
line 6399
;6391:
;6392:/*
;6393: =================
;6394: PlayerModel_BuildList
;6395: =================
;6396: */
;6397:static void
;6398:UI_BuildQ3Model_List(void)
;6399:{
line 6413
;6400:  int numdirs;
;6401:  int numfiles;
;6402:  char dirlist[2048];
;6403:  char filelist[2048];
;6404:  char skinname[64];
;6405:  char scratch[256];
;6406:  char* dirptr;
;6407:  char* fileptr;
;6408:  int i;
;6409:  int j, k, dirty;
;6410:  int dirlen;
;6411:  int filelen;
;6412:
;6413:  uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+688128
CNSTI4 0
ASGNI4
line 6416
;6414:
;6415:  // iterate directory of all player models
;6416:  numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048);
ADDRGP4 $4335
ARGP4
ADDRGP4 $4336
ARGP4
ADDRLP4 2408
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4456
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2404
ADDRLP4 4456
INDIRI4
ASGNI4
line 6417
;6417:  dirptr = dirlist;
ADDRLP4 340
ADDRLP4 2408
ASGNP4
line 6418
;6418:  for(i = 0;i < numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS;i++, dirptr += dirlen + 1)
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $4340
JUMPV
LABELV $4337
line 6419
;6419:  {
line 6420
;6420:    dirlen = strlen(dirptr);
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4460
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 4460
INDIRI4
ASGNI4
line 6422
;6421:
;6422:    if (dirlen && dirptr[dirlen - 1] == '/')
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $4342
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4342
line 6423
;6423:      dirptr[dirlen - 1] = '\0';
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4342
line 6425
;6424:
;6425:    if (!strcmp(dirptr, ".") || !strcmp(dirptr, ".."))
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4346
ARGP4
ADDRLP4 4468
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4468
INDIRI4
CNSTI4 0
EQI4 $4348
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4347
ARGP4
ADDRLP4 4472
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4472
INDIRI4
CNSTI4 0
NEI4 $4344
LABELV $4348
line 6426
;6426:      continue;
ADDRGP4 $4338
JUMPV
LABELV $4344
line 6429
;6427:
;6428:    // iterate all skin files in directory
;6429:    numfiles = trap_FS_GetFileList(va("models/players/%s", dirptr), "tga", filelist, 2048);
ADDRGP4 $4349
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4476
INDIRP4
ARGP4
ADDRGP4 $4350
ARGP4
ADDRLP4 356
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4480
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 4480
INDIRI4
ASGNI4
line 6430
;6430:    fileptr = filelist;
ADDRLP4 328
ADDRLP4 356
ASGNP4
line 6431
;6431:    for(j = 0;j < numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++, fileptr += filelen + 1)
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRGP4 $4354
JUMPV
LABELV $4351
line 6432
;6432:    {
line 6433
;6433:      filelen = strlen(fileptr);
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 4484
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 4484
INDIRI4
ASGNI4
line 6435
;6434:
;6435:      COM_StripExtension(fileptr, skinname, sizeof(skinname));
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 6438
;6436:
;6437:      // look for icon_????
;6438:      if (Q_stricmpn(skinname, "icon_", 5) == 0 && !(Q_stricmp(skinname, "icon_blue") == 0
ADDRLP4 260
ARGP4
ADDRGP4 $4358
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4488
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4488
INDIRI4
CNSTI4 0
NEI4 $4356
ADDRLP4 260
ARGP4
ADDRGP4 $4359
ARGP4
ADDRLP4 4492
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4492
INDIRI4
CNSTI4 0
EQI4 $4356
ADDRLP4 260
ARGP4
ADDRGP4 $4360
ARGP4
ADDRLP4 4496
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4496
INDIRI4
CNSTI4 0
EQI4 $4356
line 6440
;6439:          || Q_stricmp(skinname, "icon_red") == 0))
;6440:      {
line 6441
;6441:        if (Q_stricmp(skinname, "icon_default") == 0)
ADDRLP4 260
ARGP4
ADDRGP4 $4363
ARGP4
ADDRLP4 4500
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4500
INDIRI4
CNSTI4 0
NEI4 $4361
line 6442
;6442:        {
line 6443
;6443:          Com_sprintf(scratch, sizeof(scratch), "%s", dirptr);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4002
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6444
;6444:        }
ADDRGP4 $4362
JUMPV
LABELV $4361
line 6446
;6445:        else
;6446:        {
line 6447
;6447:          Com_sprintf(scratch, sizeof(scratch), "%s/%s", dirptr, skinname + 5);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4364
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260+5
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6448
;6448:        }
LABELV $4362
line 6449
;6449:        dirty = 0;
ADDRLP4 324
CNSTI4 0
ASGNI4
line 6450
;6450:        for(k = 0;k < uiInfo.q3HeadCount;k++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4369
JUMPV
LABELV $4366
line 6451
;6451:        {
line 6452
;6452:          if (!Q_stricmp(scratch, uiInfo.q3HeadNames[uiInfo.q3HeadCount]))
ADDRLP4 4
ARGP4
ADDRGP4 uiInfo+688128
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+688132
ADDP4
ARGP4
ADDRLP4 4504
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 0
NEI4 $4371
line 6453
;6453:          {
line 6454
;6454:            dirty = 1;
ADDRLP4 324
CNSTI4 1
ASGNI4
line 6455
;6455:            break;
ADDRGP4 $4368
JUMPV
LABELV $4371
line 6457
;6456:          }
;6457:        }
LABELV $4367
line 6450
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4369
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+688128
INDIRI4
LTI4 $4366
LABELV $4368
line 6458
;6458:        if (!dirty)
ADDRLP4 324
INDIRI4
CNSTI4 0
NEI4 $4375
line 6459
;6459:        {
line 6460
;6460:          Com_sprintf(
ADDRGP4 uiInfo+688128
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+688132
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $4002
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6463
;6461:            uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]),
;6462:            "%s", scratch);
;6463:          uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = trap_R_RegisterShaderNoMip(va(
ADDRLP4 4508
ADDRGP4 uiInfo+688128
ASGNP4
ADDRLP4 4504
ADDRLP4 4508
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4508
INDIRP4
ADDRLP4 4504
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $4383
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 4512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4512
INDIRP4
ARGP4
ADDRLP4 4516
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+704516
ADDP4
ADDRLP4 4516
INDIRI4
ASGNI4
line 6465
;6464:            "models/players/%s/%s", dirptr, skinname));
;6465:        }
LABELV $4375
line 6466
;6466:      }
LABELV $4356
line 6468
;6467:
;6468:    }
LABELV $4352
line 6431
ADDRLP4 4484
CNSTI4 1
ASGNI4
ADDRLP4 332
ADDRLP4 332
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ASGNI4
ADDRLP4 328
ADDRLP4 336
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ADDRLP4 328
INDIRP4
ADDP4
ASGNP4
LABELV $4354
ADDRLP4 332
INDIRI4
ADDRLP4 344
INDIRI4
GEI4 $4384
ADDRGP4 uiInfo+688128
INDIRI4
CNSTI4 256
LTI4 $4351
LABELV $4384
line 6469
;6469:  }
LABELV $4338
line 6418
ADDRLP4 4460
CNSTI4 1
ASGNI4
ADDRLP4 352
ADDRLP4 352
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ASGNI4
ADDRLP4 340
ADDRLP4 348
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ADDRLP4 340
INDIRP4
ADDP4
ASGNP4
LABELV $4340
ADDRLP4 352
INDIRI4
ADDRLP4 2404
INDIRI4
GEI4 $4385
ADDRGP4 uiInfo+688128
INDIRI4
CNSTI4 256
LTI4 $4337
LABELV $4385
line 6471
;6470:
;6471:}
LABELV $4333
endproc UI_BuildQ3Model_List 4520 20
export _UI_Init
proc _UI_Init 48 24
line 6480
;6472:
;6473:/*
;6474: =================
;6475: UI_Init
;6476: =================
;6477: */
;6478:void
;6479:_UI_Init(qboolean inGameLoad)
;6480:{
line 6484
;6481:  const char *menuSet;
;6482:  int start;
;6483:
;6484:  BG_InitClassOverrides();
ADDRGP4 BG_InitClassOverrides
CALLV
pop
line 6485
;6485:  BG_InitAllowedGameElements();
ADDRGP4 BG_InitAllowedGameElements
CALLV
pop
line 6489
;6486:
;6487:  //uiInfo.inGameLoad = inGameLoad;
;6488:
;6489:  UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 6490
;6490:  UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 6493
;6491:
;6492:  // cache redundant calulations
;6493:  trap_GetGlconfig(&uiInfo.uiDC.glconfig);
ADDRGP4 uiInfo+61996
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 6496
;6494:
;6495:  // for 640x480 virtualized screen
;6496:  uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0 / 480.0);
ADDRGP4 uiInfo+196
CNSTF4 990414985
ADDRGP4 uiInfo+61996+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6497
;6497:  uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0 / 640.0);
ADDRGP4 uiInfo+200
CNSTF4 986500301
ADDRGP4 uiInfo+61996+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6498
;6498:  if (uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640)
CNSTI4 480
ADDRGP4 uiInfo+61996+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+61996+11308
INDIRI4
MULI4
LEI4 $4394
line 6499
;6499:  {
line 6501
;6500:    // wide screen
;6501:    uiInfo.uiDC.bias = 0.5 * (uiInfo.uiDC.glconfig.vidWidth - (uiInfo.uiDC.glconfig.vidHeight
ADDRGP4 uiInfo+204
CNSTF4 1056964608
ADDRGP4 uiInfo+61996+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+61996+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 6503
;6502:        * (640.0 / 480.0)));
;6503:  }
ADDRGP4 $4395
JUMPV
LABELV $4394
line 6505
;6504:  else
;6505:  {
line 6507
;6506:    // no wide screen
;6507:    uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+204
CNSTF4 0
ASGNF4
line 6508
;6508:  }
LABELV $4395
line 6511
;6509:
;6510:  //UI_Load();
;6511:  uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 6512
;6512:  uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 6513
;6513:  uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 6514
;6514:  uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 6515
;6515:  uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 6516
;6516:  uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 6517
;6517:  uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 6518
;6518:  uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 6519
;6519:  uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 6520
;6520:  uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 6521
;6521:  uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 6522
;6522:  uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6523
;6523:  uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 6524
;6524:  uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 6525
;6525:  uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6526
;6526:  uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 6527
;6527:  uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 6528
;6528:  uiInfo.uiDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 6529
;6529:  uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+68
ADDRGP4 UI_OwnerDraw
ASGNP4
line 6530
;6530:  uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+72
ADDRGP4 UI_GetValue
ASGNP4
line 6531
;6531:  uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+76
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 6532
;6532:  uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+80
ADDRGP4 UI_RunMenuScript
ASGNP4
line 6533
;6533:  uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+84
ADDRGP4 UI_GetTeamColor
ASGNP4
line 6534
;6534:  uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+96
ADDRGP4 trap_Cvar_Set
ASGNP4
line 6535
;6535:  uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+88
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 6536
;6536:  uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+92
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 6537
;6537:  uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+100
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 6538
;6538:  uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+104
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 6539
;6539:  uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+108
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 6540
;6540:  uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+112
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 6541
;6541:  uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+116
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 6542
;6542:  uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+120
ADDRGP4 UI_FeederCount
ASGNP4
line 6543
;6543:  uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+128
ADDRGP4 UI_FeederItemImage
ASGNP4
line 6544
;6544:  uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+124
ADDRGP4 UI_FeederItemText
ASGNP4
line 6545
;6545:  uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+132
ADDRGP4 UI_FeederSelection
ASGNP4
line 6546
;6546:  uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+144
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 6547
;6547:  uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 6548
;6548:  uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+136
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 6549
;6549:  uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+148
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 6550
;6550:  uiInfo.uiDC.Error = &Com_Error;
ADDRGP4 uiInfo+152
ADDRGP4 Com_Error
ASGNP4
line 6551
;6551:  uiInfo.uiDC.Print = &Com_Printf;
ADDRGP4 uiInfo+156
ADDRGP4 Com_Printf
ASGNP4
line 6552
;6552:  uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+160
ADDRGP4 UI_Pause
ASGNP4
line 6553
;6553:  uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+164
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 6554
;6554:  uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+168
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 6555
;6555:  uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+172
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 6556
;6556:  uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+176
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 6557
;6557:  uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+180
ADDRGP4 UI_PlayCinematic
ASGNP4
line 6558
;6558:  uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+184
ADDRGP4 UI_StopCinematic
ASGNP4
line 6559
;6559:  uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+188
ADDRGP4 UI_DrawCinematic
ASGNP4
line 6560
;6560:  uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+192
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 6562
;6561:
;6562:  Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 6564
;6563:
;6564:  String_Init();
ADDRGP4 String_Init
CALLV
pop
line 6566
;6565:
;6566:  uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip("white");
ADDRGP4 $4456
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73340
ADDRLP4 8
INDIRI4
ASGNI4
line 6568
;6567:
;6568:  AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 6570
;6569:
;6570:  start = trap_Milliseconds();
ADDRLP4 12
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 6572
;6571:
;6572:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+75696
CNSTI4 0
ASGNI4
line 6573
;6573:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+73380
CNSTI4 0
ASGNI4
line 6574
;6574:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+74924
CNSTI4 0
ASGNI4
line 6580
;6575:
;6576:  /*  UI_ParseTeamInfo("teaminfo.txt");
;6577:   UI_LoadTeams();
;6578:   UI_ParseGameInfo("gameinfo.txt");*/
;6579:
;6580:  menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $896
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 6581
;6581:  if (menuSet == NULL || menuSet[0] == '\0')
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4462
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4460
LABELV $4462
line 6582
;6582:  {
line 6583
;6583:    menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $868
ASGNP4
line 6584
;6584:  }
LABELV $4460
line 6595
;6585:
;6586:#if 0
;6587:  if (uiInfo.inGameLoad)
;6588:  {
;6589:    UI_LoadMenus("ui/ingame.txt", qtrue);
;6590:  }
;6591:  else
;6592:  { // bk010222: left this: UI_LoadMenus(menuSet, qtrue);
;6593:  }
;6594:#else
;6595:  UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6596
;6596:  UI_LoadMenus("ui/ingame.txt", qfalse);
ADDRGP4 $4463
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6597
;6597:  UI_LoadMenus("ui/tremulous.txt", qfalse);
ADDRGP4 $4464
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6599
;6598:
;6599:  UI_LoadInfoPanes("ui/infopanes.def");
ADDRGP4 $4465
ARGP4
ADDRGP4 UI_LoadInfoPanes
CALLV
pop
line 6601
;6600:
;6601:  if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 0
EQI4 $4466
line 6602
;6602:  {
line 6605
;6603:    int i, j;
;6604:
;6605:    for(i = 0;i < uiInfo.tremInfoPaneCount;i++)
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $4472
JUMPV
LABELV $4469
line 6606
;6606:    {
line 6607
;6607:      Com_Printf("name: %s\n", uiInfo.tremInfoPanes[i].name);
ADDRGP4 $4474
ARGP4
CNSTI4 4428
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 uiInfo+99204
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6609
;6608:
;6609:      Com_Printf("text: %s\n", uiInfo.tremInfoPanes[i].text);
ADDRGP4 $4476
ARGP4
CNSTI4 4428
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4
ADDP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6611
;6610:
;6611:      for(j = 0;j < uiInfo.tremInfoPanes[i].numGraphics;j++)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $4482
JUMPV
LABELV $4479
line 6612
;6612:        Com_Printf(
ADDRGP4 $4485
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 36
CNSTI4 20
ADDRLP4 24
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
CNSTI4 4428
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+99204+4104
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $4480
line 6611
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4482
ADDRLP4 24
INDIRI4
CNSTI4 4428
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 uiInfo+99204+4424
ADDP4
INDIRI4
LTI4 $4479
line 6616
;6613:          "graphic %d: %d %d %d %d\n", j, uiInfo.tremInfoPanes[i].graphics[j].side,
;6614:          uiInfo.tremInfoPanes[i].graphics[j].offset, uiInfo.tremInfoPanes[i].graphics[j].width,
;6615:          uiInfo.tremInfoPanes[i].graphics[j].height);
;6616:    }
LABELV $4470
line 6605
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4472
ADDRLP4 28
INDIRI4
ADDRGP4 uiInfo+665988
INDIRI4
LTI4 $4469
line 6617
;6617:  }
LABELV $4466
line 6620
;6618:#endif
;6619:
;6620:  Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6622
;6621:
;6622:  trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 6623
;6623:  UI_LoadBestScores(
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83168+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78520+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 6626
;6624:    uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
;6625:
;6626:  UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 6630
;6627:  /*UI_LoadBots();*/
;6628:
;6629:  // sets defaults for ui temp cvars
;6630:  uiInfo.effectsColor = gamecodetoui[(int) trap_Cvar_VariableValue("color1") - 1];
ADDRGP4 $4501
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+705544
ADDRLP4 24
INDIRF4
CVFI4 4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui-4
ADDP4
INDIRI4
ASGNI4
line 6631
;6631:  uiInfo.currentCrosshair = (int) trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $4504
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+688116
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 6632
;6632:  trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $2757
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
LTF4 $4506
ADDRLP4 32
ADDRGP4 $457
ASGNP4
ADDRGP4 $4507
JUMPV
LABELV $4506
ADDRLP4 32
ADDRGP4 $460
ASGNP4
LABELV $4507
ADDRGP4 $2754
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6634
;6633:
;6634:  uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+667904+10432
CNSTI4 -1
ASGNI4
line 6635
;6635:  uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99200
CNSTI4 -1
ASGNI4
line 6637
;6636:
;6637:  if (trap_Cvar_VariableValue("ui_TeamArenaFirstRun") == 0)
ADDRGP4 $4513
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
NEF4 $4511
line 6638
;6638:  {
line 6639
;6639:    trap_Cvar_Set("s_volume", "0.8");
ADDRGP4 $4514
ARGP4
ADDRGP4 $4515
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6640
;6640:    trap_Cvar_Set("s_musicvolume", "0.5");
ADDRGP4 $4516
ARGP4
ADDRGP4 $4517
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6641
;6641:    trap_Cvar_Set("ui_TeamArenaFirstRun", "1");
ADDRGP4 $4513
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6642
;6642:  }
LABELV $4511
line 6644
;6643:
;6644:  trap_Cvar_Register(NULL, "debug_protocol", "", 0);
CNSTP4 0
ARGP4
ADDRGP4 $4518
ARGP4
ADDRGP4 $131
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 6646
;6645:
;6646:  trap_Cvar_Set("ui_actualNetGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $930
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $945
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6647
;6647:}
LABELV $4386
endproc _UI_Init 48 24
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 6656
;6648:
;6649:/*
;6650: =================
;6651: UI_KeyEvent
;6652: =================
;6653: */
;6654:void
;6655:_UI_KeyEvent(int key, qboolean down)
;6656:{
line 6658
;6657:
;6658:  if (Menu_Count() > 0)
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4521
line 6659
;6659:  {
line 6660
;6660:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 6661
;6661:    if (menu)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4523
line 6662
;6662:    {
line 6663
;6663:      if (key == K_ESCAPE && down && !Menus_AnyFullScreenVisible())
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4525
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4525
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4525
line 6664
;6664:      {
line 6665
;6665:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6666
;6666:      }
ADDRGP4 $4524
JUMPV
LABELV $4525
line 6668
;6667:      else
;6668:      {
line 6669
;6669:        Menu_HandleKey(menu, key, down);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 6670
;6670:      }
line 6671
;6671:    }
ADDRGP4 $4524
JUMPV
LABELV $4523
line 6673
;6672:    else
;6673:    {
line 6674
;6674:      trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6675
;6675:      trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6676
;6676:      trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6677
;6677:    }
LABELV $4524
line 6678
;6678:  }
LABELV $4521
line 6683
;6679:
;6680:  //if ((s > 0) && (s != menu_null_sound)) {
;6681:  //  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;6682:  //}
;6683:}
LABELV $4520
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 6692
;6684:
;6685:/*
;6686: =================
;6687: UI_MouseEvent
;6688: =================
;6689: */
;6690:void
;6691:_UI_MouseEvent(int dx, int dy)
;6692:{
line 6694
;6693:  // update mouse screen position
;6694:  uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+216
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 6695
;6695:  if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 0
GEI4 $4529
line 6696
;6696:    uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+216
CNSTI4 0
ASGNI4
ADDRGP4 $4530
JUMPV
LABELV $4529
line 6697
;6697:  else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 640
LEI4 $4533
line 6698
;6698:    uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+216
CNSTI4 640
ASGNI4
LABELV $4533
LABELV $4530
line 6700
;6699:
;6700:  uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+220
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 6701
;6701:  if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 0
GEI4 $4538
line 6702
;6702:    uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+220
CNSTI4 0
ASGNI4
ADDRGP4 $4539
JUMPV
LABELV $4538
line 6703
;6703:  else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 480
LEI4 $4542
line 6704
;6704:    uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+220
CNSTI4 480
ASGNI4
LABELV $4542
LABELV $4539
line 6706
;6705:
;6706:  if (Menu_Count() > 0)
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $4546
line 6707
;6707:  {
line 6710
;6708:    //menuDef_t *menu = Menu_GetFocused();
;6709:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;6710:    Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+216
INDIRI4
ARGI4
ADDRGP4 uiInfo+220
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 6711
;6711:  }
LABELV $4546
line 6713
;6712:
;6713:}
LABELV $4527
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 6717
;6714:
;6715:void
;6716:UI_LoadNonIngame(void)
;6717:{
line 6718
;6718:  const char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $896
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6719
;6719:  if (menuSet == NULL || menuSet[0] == '\0')
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4553
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4551
LABELV $4553
line 6720
;6720:  {
line 6721
;6721:    menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $868
ASGNP4
line 6722
;6722:  }
LABELV $4551
line 6723
;6723:  UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6724
;6724:  uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+705548
CNSTI4 0
ASGNI4
line 6725
;6725:}
LABELV $4550
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 292 12
line 6729
;6726:
;6727:void
;6728:_UI_SetActiveMenu(uiMenuCommand_t menu)
;6729:{
line 6734
;6730:  char buf[256];
;6731:
;6732:  // this should be the ONLY way the menu system is brought up
;6733:  // enusure minumum menu data is cached
;6734:  if (Menu_Count() > 0)
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $4556
line 6735
;6735:  {
line 6737
;6736:    vec3_t v;
;6737:    v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 6738
;6738:    switch(menu)
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $4560
ADDRLP4 276
INDIRI4
CNSTI4 4
GTI4 $4560
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4583
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4583
address $4563
address $4564
address $4581
address $4574
address $4576
code
line 6739
;6739:    {
LABELV $4563
line 6741
;6740:      case UIMENU_NONE:
;6741:        trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6742
;6742:        trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6743
;6743:        trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $3061
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6744
;6744:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6746
;6745:
;6746:        return;
ADDRGP4 $4555
JUMPV
LABELV $4564
line 6749
;6747:      case UIMENU_MAIN:
;6748:        //trap_Cvar_Set( "sv_killserver", "1" );
;6749:        trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6752
;6750:        //trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;6751:        //trap_S_StartBackgroundTrack("sound/misc/menu_background.wav", NULL);
;6752:        if (uiInfo.inGameLoad)
ADDRGP4 uiInfo+705548
INDIRI4
CNSTI4 0
EQI4 $4565
line 6753
;6753:        {
line 6754
;6754:          UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 6755
;6755:        }
LABELV $4565
line 6756
;6756:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6757
;6757:        Menus_ActivateByName("main");
ADDRGP4 $2991
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6758
;6758:        trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $2820
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6759
;6759:        if (strlen(buf))
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $4555
line 6760
;6760:        {
line 6761
;6761:          if (!ui_singlePlayerActive.integer)
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $4570
line 6762
;6762:          {
line 6763
;6763:            Menus_ActivateByName("error_popmenu");
ADDRGP4 $4573
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6764
;6764:          }
ADDRGP4 $4555
JUMPV
LABELV $4570
line 6766
;6765:          else
;6766:          {
line 6767
;6767:            trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2820
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6768
;6768:          }
line 6769
;6769:        }
line 6770
;6770:        return;
ADDRGP4 $4555
JUMPV
LABELV $4574
line 6772
;6771:      case UIMENU_TEAM:
;6772:        trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6773
;6773:        Menus_ActivateByName("team");
ADDRGP4 $4575
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6774
;6774:        return;
ADDRGP4 $4555
JUMPV
LABELV $4576
line 6777
;6775:      case UIMENU_POSTGAME:
;6776:        //trap_Cvar_Set( "sv_killserver", "1" );
;6777:        trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6778
;6778:        if (uiInfo.inGameLoad)
ADDRGP4 uiInfo+705548
INDIRI4
CNSTI4 0
EQI4 $4577
line 6779
;6779:        {
line 6780
;6780:          UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 6781
;6781:        }
LABELV $4577
line 6782
;6782:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6783
;6783:        Menus_ActivateByName("endofgame");
ADDRGP4 $4580
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6784
;6784:        return;
ADDRGP4 $4555
JUMPV
LABELV $4581
line 6786
;6785:      case UIMENU_INGAME:
;6786:        trap_Cvar_Set("cl_paused", "1");
ADDRGP4 $3061
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6787
;6787:        trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6788
;6788:        UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6789
;6789:        Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6790
;6790:        Menus_ActivateByName("ingame");
ADDRGP4 $4582
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6791
;6791:        return;
LABELV $4560
line 6793
;6792:    }
;6793:  }
LABELV $4556
line 6794
;6794:}
LABELV $4555
endproc _UI_SetActiveMenu 292 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 6798
;6795:
;6796:qboolean
;6797:_UI_IsFullscreen(void)
;6798:{
line 6799
;6799:  return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4584
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 6807
;6800:}
;6801:
;6802:static connstate_t lastConnState;
;6803:static char lastLoadingText[MAX_INFO_VALUE];
;6804:
;6805:static void
;6806:UI_ReadableSize(char *buf, int bufsize, int value)
;6807:{
line 6808
;6808:  if (value > 1024 * 1024 * 1024)
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $4586
line 6809
;6809:  { // gigs
line 6810
;6810:    Com_sprintf(buf, bufsize, "%d", value / (1024 * 1024 * 1024));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $930
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6811
;6811:    Com_sprintf(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4588
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6814
;6812:      buf + strlen(buf), bufsize - strlen(buf), ".%02d GB", (value % (1024 * 1024 * 1024)) * 100
;6813:          / (1024 * 1024 * 1024));
;6814:  }
ADDRGP4 $4587
JUMPV
LABELV $4586
line 6815
;6815:  else if (value > 1024 * 1024)
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $4589
line 6816
;6816:  { // megs
line 6817
;6817:    Com_sprintf(buf, bufsize, "%d", value / (1024 * 1024));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $930
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6818
;6818:    Com_sprintf(buf + strlen(buf), bufsize - strlen(buf), ".%02d MB", (value % (1024 * 1024)) * 100
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4591
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6820
;6819:        / (1024 * 1024));
;6820:  }
ADDRGP4 $4590
JUMPV
LABELV $4589
line 6821
;6821:  else if (value > 1024)
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $4592
line 6822
;6822:  { // kilos
line 6823
;6823:    Com_sprintf(buf, bufsize, "%d KB", value / 1024);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4594
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6824
;6824:  }
ADDRGP4 $4593
JUMPV
LABELV $4592
line 6826
;6825:  else
;6826:  { // bytes
line 6827
;6827:    Com_sprintf(buf, bufsize, "%d bytes", value);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4595
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6828
;6828:  }
LABELV $4593
LABELV $4590
LABELV $4587
line 6829
;6829:}
LABELV $4585
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 6834
;6830:
;6831:// Assumes time is in msec
;6832:static void
;6833:UI_PrintTime(char *buf, int bufsize, int time)
;6834:{
line 6835
;6835:  time /= 1000; // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 6837
;6836:
;6837:  if (time > 3600)
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $4597
line 6838
;6838:  { // in the hours range
line 6839
;6839:    Com_sprintf(buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4599
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6840
;6840:  }
ADDRGP4 $4598
JUMPV
LABELV $4597
line 6841
;6841:  else if (time > 60)
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $4600
line 6842
;6842:  { // mins
line 6843
;6843:    Com_sprintf(buf, bufsize, "%d min %d sec", time / 60, time % 60);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4602
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6844
;6844:  }
ADDRGP4 $4601
JUMPV
LABELV $4600
line 6846
;6845:  else
;6846:  { // secs
line 6847
;6847:    Com_sprintf(buf, bufsize, "%d sec", time);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4603
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6848
;6848:  }
LABELV $4601
LABELV $4598
line 6849
;6849:}
LABELV $4596
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 32
line 6853
;6850:
;6851:void
;6852:Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust)
;6853:{
line 6854
;6854:  int len = Text_Width(text, scale, 0);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 6855
;6855:  Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 6856
;6856:}
LABELV $4604
endproc Text_PaintCenter 8 32
export Text_PaintCenter_AutoWrapped
proc Text_PaintCenter_AutoWrapped 1056 24
line 6861
;6857:
;6858:void
;6859:Text_PaintCenter_AutoWrapped(float x, float y, float xmax, float ystep, float scale, vec4_t color,
;6860:  const char *str, float adjust)
;6861:{
line 6867
;6862:  int width;
;6863:  char *s1, *s2, *s3;
;6864:  char c_bcp;
;6865:  char buf[1024];
;6866:
;6867:  if (!str || str[0] == '\0')
ADDRLP4 1044
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4608
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4606
LABELV $4608
line 6868
;6868:    return;
ADDRGP4 $4605
JUMPV
LABELV $4606
line 6870
;6869:
;6870:  Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 20
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6871
;6871:  s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRLP4 4
ADDRLP4 20
ASGNP4
ADDRLP4 12
ADDRLP4 20
ASGNP4
ADDRGP4 $4610
JUMPV
LABELV $4609
line 6874
;6872:
;6873:  while(1)
;6874:  {
LABELV $4612
line 6876
;6875:    do
;6876:    {
line 6877
;6877:      s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 6878
;6878:    }
LABELV $4613
line 6879
;6879:    while(*s3 != ' ' && *s3 != '\0');
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 32
EQI4 $4615
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $4612
LABELV $4615
line 6880
;6880:    c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 6881
;6881:    *s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 6882
;6882:    width = Text_Width(s1, scale, 0);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1052
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1052
INDIRI4
ASGNI4
line 6883
;6883:    *s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 6884
;6884:    if (width > xmax)
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRFP4 8
INDIRF4
LEF4 $4616
line 6885
;6885:    {
line 6886
;6886:      if (s1 == s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $4618
line 6887
;6887:      {
line 6889
;6888:        // fuck, don't have a clean cut, we'll overflow
;6889:        s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 6890
;6890:      }
LABELV $4618
line 6891
;6891:      *s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 6892
;6892:      Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6893
;6893:      y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 6894
;6894:      if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4620
line 6895
;6895:      {
line 6900
;6896:        // that was the last word
;6897:        // we could start a new loop, but that wouldn't be much use
;6898:        // even if the word is too long, we would overflow it (see above)
;6899:        // so just print it now if needed
;6900:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 6901
;6901:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4611
line 6902
;6902:          Text_PaintCenter(x, y, scale, color, s2, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6903
;6903:        break;
ADDRGP4 $4611
JUMPV
LABELV $4620
line 6905
;6904:      }
;6905:      s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 6906
;6906:      s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 6907
;6907:      s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6908
;6908:    }
ADDRGP4 $4617
JUMPV
LABELV $4616
line 6910
;6909:    else
;6910:    {
line 6911
;6911:      s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 6912
;6912:      if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4624
line 6913
;6913:      {
line 6914
;6914:        Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6915
;6915:        break;
ADDRGP4 $4611
JUMPV
LABELV $4624
line 6917
;6916:      }
;6917:    }
LABELV $4617
line 6918
;6918:  }
LABELV $4610
line 6873
ADDRGP4 $4609
JUMPV
LABELV $4611
line 6919
;6919:}
LABELV $4605
endproc Text_PaintCenter_AutoWrapped 1056 24
data
align 1
LABELV $4627
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $4628
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $4629
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 312 24
line 6923
;6920:
;6921:static void
;6922:UI_DisplayDownloadInfo(const char *downloadName, float centerPoint, float yStart, float scale)
;6923:{
line 6934
;6924:  static char dlText[] = "Downloading:";
;6925:  static char etaText[] = "Estimated time left:";
;6926:  static char xferText[] = "Transfer rate:";
;6927:
;6928:  int downloadSize, downloadCount, downloadTime;
;6929:  char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;6930:  int xferRate;
;6931:  int leftWidth;
;6932:  const char *s;
;6933:
;6934:  downloadSize = trap_Cvar_VariableValue("cl_downloadSize");
ADDRGP4 $4630
ARGP4
ADDRLP4 280
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 280
INDIRF4
CVFI4 4
ASGNI4
line 6935
;6935:  downloadCount = trap_Cvar_VariableValue("cl_downloadCount");
ADDRGP4 $4631
ARGP4
ADDRLP4 284
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 284
INDIRF4
CVFI4 4
ASGNI4
line 6936
;6936:  downloadTime = trap_Cvar_VariableValue("cl_downloadTime");
ADDRGP4 $4632
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 140
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
line 6938
;6937:
;6938:  leftWidth = 320;
ADDRLP4 8
CNSTI4 320
ASGNI4
line 6940
;6939:
;6940:  UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 6941
;6941:  Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, dlText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4627
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6942
;6942:  Text_PaintCenter(centerPoint, yStart + 192, scale, colorWhite, etaText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1128267776
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4628
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6943
;6943:  Text_PaintCenter(centerPoint, yStart + 248, scale, colorWhite, xferText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131937792
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4629
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6945
;6944:
;6945:  if (downloadSize > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4633
line 6946
;6946:  {
line 6947
;6947:    s = va("%s (%d%%)", downloadName, downloadCount * 100 / downloadSize);
ADDRGP4 $4635
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
DIVI4
ARGI4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 292
INDIRP4
ASGNP4
line 6948
;6948:  }
ADDRGP4 $4634
JUMPV
LABELV $4633
line 6950
;6949:  else
;6950:  {
line 6951
;6951:    s = downloadName;
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
line 6952
;6952:  }
LABELV $4634
line 6954
;6953:
;6954:  Text_PaintCenter(centerPoint, yStart + 136, scale, colorWhite, s, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1124597760
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6956
;6955:
;6956:  UI_ReadableSize(dlSizeBuf, sizeof dlSizeBuf, downloadCount);
ADDRLP4 12
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6957
;6957:  UI_ReadableSize(totalSizeBuf, sizeof totalSizeBuf, downloadSize);
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6959
;6958:
;6959:  if (downloadCount < 4096 || !downloadTime)
ADDRLP4 4
INDIRI4
CNSTI4 4096
LTI4 $4638
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $4636
LABELV $4638
line 6960
;6960:  {
line 6961
;6961:    Text_PaintCenter(leftWidth, yStart + 216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4639
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6962
;6962:    Text_PaintCenter(leftWidth, yStart + 160, scale, colorWhite, va(
ADDRGP4 $4640
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6964
;6963:      "(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
;6964:  }
ADDRGP4 $4637
JUMPV
LABELV $4636
line 6966
;6965:  else
;6966:  {
line 6967
;6967:    if ((uiInfo.uiDC.realTime - downloadTime) / 1000)
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $4641
line 6968
;6968:    {
line 6969
;6969:      xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 144
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 6970
;6970:    }
ADDRGP4 $4642
JUMPV
LABELV $4641
line 6972
;6971:    else
;6972:    {
line 6973
;6973:      xferRate = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 6974
;6974:    }
LABELV $4642
line 6975
;6975:    UI_ReadableSize(xferRateBuf, sizeof xferRateBuf, xferRate);
ADDRLP4 152
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6978
;6976:
;6977:    // Extrapolate estimated completion time
;6978:    if (downloadSize && xferRate)
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4645
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4645
line 6979
;6979:    {
line 6980
;6980:      int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 296
ADDRLP4 0
INDIRI4
ADDRLP4 144
INDIRI4
DIVI4
ASGNI4
line 6983
;6981:
;6982:      // We do it in K (/1024) because we'd overflow around 4MB
;6983:      UI_PrintTime(dlTimeBuf, sizeof dlTimeBuf, (n - (((downloadCount / 1024) * n) / (downloadSize
ADDRLP4 216
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 300
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 304
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 300
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
ADDRLP4 300
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 6986
;6984:          / 1024))) * 1000);
;6985:
;6986:      Text_PaintCenter(leftWidth, yStart + 216, scale, colorWhite, dlTimeBuf, 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 216
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6987
;6987:      Text_PaintCenter(leftWidth, yStart + 160, scale, colorWhite, va(
ADDRGP4 $4640
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6989
;6988:        "(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
;6989:    }
ADDRGP4 $4646
JUMPV
LABELV $4645
line 6991
;6990:    else
;6991:    {
line 6992
;6992:      Text_PaintCenter(leftWidth, yStart + 216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4639
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6993
;6993:      if (downloadSize)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4647
line 6994
;6994:      {
line 6995
;6995:        Text_PaintCenter(leftWidth, yStart + 160, scale, colorWhite, va(
ADDRGP4 $4640
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6997
;6996:          "(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
;6997:      }
ADDRGP4 $4648
JUMPV
LABELV $4647
line 6999
;6998:      else
;6999:      {
line 7000
;7000:        Text_PaintCenter(
ADDRGP4 $4649
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7002
;7001:          leftWidth, yStart + 160, scale, colorWhite, va("(%s copied)", dlSizeBuf), 0);
;7002:      }
LABELV $4648
line 7003
;7003:    }
LABELV $4646
line 7005
;7004:
;7005:    if (xferRate)
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $4650
line 7006
;7006:    {
line 7007
;7007:      Text_PaintCenter(leftWidth, yStart + 272, scale, colorWhite, va("%s/Sec", xferRateBuf), 0);
ADDRGP4 $4652
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1132986368
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7008
;7008:    }
LABELV $4650
line 7009
;7009:  }
LABELV $4637
line 7010
;7010:}
LABELV $4626
endproc UI_DisplayDownloadInfo 312 24
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5440 32
line 7022
;7011:
;7012:/*
;7013: ========================
;7014: UI_DrawConnectScreen
;7015:
;7016: This will also be overlaid on the cgame info screen during loading
;7017: to prevent it from blinking away too rapidly on local or lan games.
;7018: ========================
;7019: */
;7020:void
;7021:UI_DrawConnectScreen(qboolean overlay)
;7022:{
line 7029
;7023:  char *s;
;7024:  uiClientState_t cstate;
;7025:  char info[MAX_INFO_VALUE];
;7026:  char text[256];
;7027:  float centerPoint, yStart, scale;
;7028:
;7029:  menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $4654
ARGP4
ADDRLP4 4384
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4384
INDIRP4
ASGNP4
line 7031
;7030:
;7031:  if (!overlay && menu)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4655
ADDRLP4 4120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4655
line 7032
;7032:  {
line 7033
;7033:    Menu_Paint(menu, qtrue);
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 7034
;7034:  }
LABELV $4655
line 7036
;7035:
;7036:  if (!overlay)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4657
line 7037
;7037:  {
line 7038
;7038:    centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 7039
;7039:    yStart = 130;
ADDRLP4 3092
CNSTF4 1124204544
ASGNF4
line 7040
;7040:    scale = 0.5f;
ADDRLP4 3088
CNSTF4 1056964608
ASGNF4
line 7041
;7041:  }
ADDRGP4 $4658
JUMPV
LABELV $4657
line 7043
;7042:  else
;7043:  {
line 7044
;7044:    centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 7045
;7045:    yStart = 32;
ADDRLP4 3092
CNSTF4 1107296256
ASGNF4
line 7046
;7046:    scale = 0.6f;
ADDRLP4 3088
CNSTF4 1058642330
ASGNF4
line 7047
;7047:    return;
ADDRGP4 $4653
JUMPV
LABELV $4658
line 7051
;7048:  }
;7049:
;7050:  // see what information we should display
;7051:  trap_GetClientState(&cstate);
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 7053
;7052:
;7053:  info[0] = '\0';
ADDRLP4 3096
CNSTI1 0
ASGNI1
line 7054
;7054:  if (trap_GetConfigString(CS_SERVERINFO, info, sizeof(info)))
CNSTI4 0
ARGI4
ADDRLP4 3096
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4388
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4388
INDIRI4
CNSTI4 0
EQI4 $4659
line 7055
;7055:  {
line 7056
;7056:    Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va("Loading %s", Info_ValueForKey(
ADDRLP4 3096
ARGP4
ADDRGP4 $3542
ARGP4
ADDRLP4 4392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4661
ARGP4
ADDRLP4 4392
INDIRP4
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7058
;7057:      info, "mapname")), 0);
;7058:  }
LABELV $4659
line 7060
;7059:
;7060:  if (!Q_stricmp(cstate.servername, "localhost"))
ADDRLP4 0+12
ARGP4
ADDRGP4 $4665
ARGP4
ADDRLP4 4392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4392
INDIRI4
CNSTI4 0
NEI4 $4662
line 7061
;7061:  {
line 7062
;7062:    Text_PaintCenter(
ADDRGP4 $4666
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7065
;7063:      centerPoint, yStart + 48, scale, colorWhite, va("Starting up..."),
;7064:      ITEM_TEXTSTYLE_SHADOWEDMORE);
;7065:  }
ADDRGP4 $4663
JUMPV
LABELV $4662
line 7067
;7066:  else
;7067:  {
line 7068
;7068:    strcpy(text, va("Connecting to %s", cstate.servername));
ADDRGP4 $4667
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4124
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 7069
;7069:    Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, text, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4124
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7070
;7070:  }
LABELV $4663
line 7073
;7071:
;7072:  // display global MOTD at bottom
;7073:  Text_PaintCenter(centerPoint, 600, scale, colorWhite, Info_ValueForKey(
ADDRLP4 0+1036
ARGP4
ADDRGP4 $4670
ARGP4
ADDRLP4 4396
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
CNSTF4 1142292480
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7076
;7074:    cstate.updateInfoString, "motd"), 0);
;7075:  // print any server info (server full, bad version, etc)
;7076:  if (cstate.connState < CA_CONNECTED)
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $4671
line 7077
;7077:  {
line 7078
;7078:    Text_PaintCenter_AutoWrapped(
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
CNSTF4 1142784000
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter_AutoWrapped
CALLV
pop
line 7080
;7079:      centerPoint, yStart + 176, 630, 20, scale, colorWhite, cstate.messageString, 0);
;7080:  }
LABELV $4671
line 7082
;7081:
;7082:  if (lastConnState > cstate.connState)
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $4674
line 7083
;7083:  {
line 7084
;7084:    lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 7085
;7085:  }
LABELV $4674
line 7086
;7086:  lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 7088
;7087:
;7088:  switch(cstate.connState)
ADDRLP4 4400
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 3
LTI4 $4653
ADDRLP4 4400
INDIRI4
CNSTI4 7
GTI4 $4653
ADDRLP4 4400
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4692-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4692
address $4679
address $4682
address $4685
address $4653
address $4653
code
line 7089
;7089:  {
LABELV $4679
line 7091
;7090:    case CA_CONNECTING:
;7091:      s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $4680
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4408
INDIRP4
ASGNP4
line 7092
;7092:      break;
ADDRGP4 $4677
JUMPV
LABELV $4682
line 7094
;7093:    case CA_CHALLENGING:
;7094:      s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $4683
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4412
INDIRP4
ASGNP4
line 7095
;7095:      break;
ADDRGP4 $4677
JUMPV
LABELV $4685
line 7097
;7096:    case CA_CONNECTED:
;7097:      {
line 7100
;7098:        char downloadName[MAX_INFO_VALUE];
;7099:
;7100:        trap_Cvar_VariableStringBuffer("cl_downloadName", downloadName, sizeof(downloadName));
ADDRGP4 $4686
ARGP4
ADDRLP4 4416
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7101
;7101:        if (*downloadName)
ADDRLP4 4416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4687
line 7102
;7102:        {
line 7103
;7103:          UI_DisplayDownloadInfo(downloadName, centerPoint, yStart, scale);
ADDRLP4 4416
ARGP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 7104
;7104:          return;
ADDRGP4 $4653
JUMPV
LABELV $4687
line 7106
;7105:        }
;7106:      }
line 7107
;7107:      s = "Awaiting gamestate...";
ADDRLP4 4380
ADDRGP4 $4689
ASGNP4
line 7108
;7108:      break;
line 7110
;7109:    case CA_LOADING:
;7110:      return;
line 7112
;7111:    case CA_PRIMED:
;7112:      return;
line 7114
;7113:    default:
;7114:      return;
LABELV $4677
line 7117
;7115:  }
;7116:
;7117:  if (Q_stricmp(cstate.servername, "localhost"))
ADDRLP4 0+12
ARGP4
ADDRGP4 $4665
ARGP4
ADDRLP4 4408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4408
INDIRI4
CNSTI4 0
EQI4 $4694
line 7118
;7118:  {
line 7119
;7119:    Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7120
;7120:  }
LABELV $4694
line 7123
;7121:
;7122:  // password required / connection rejected information goes here
;7123:}
LABELV $4653
endproc UI_DrawConnectScreen 5440 32
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $4698
address $918
byte 4 1
address ui_ffa_timelimit
address $4699
address $457
byte 4 1
address ui_tourney_fraglimit
address $4700
address $457
byte 4 1
address ui_tourney_timelimit
address $4701
address $919
byte 4 1
address ui_team_fraglimit
address $4702
address $457
byte 4 1
address ui_team_timelimit
address $4703
address $918
byte 4 1
address ui_team_friendly
address $4704
address $460
byte 4 1
address ui_ctf_capturelimit
address $4705
address $4706
byte 4 1
address ui_ctf_timelimit
address $4707
address $916
byte 4 1
address ui_ctf_friendly
address $4708
address $457
byte 4 1
address ui_arenasFile
address $4709
address $131
byte 4 80
address ui_botsFile
address $4710
address $131
byte 4 80
address ui_spScores1
address $4711
address $131
byte 4 65
address ui_spScores2
address $4712
address $131
byte 4 65
address ui_spScores3
address $4713
address $131
byte 4 65
address ui_spScores4
address $4714
address $131
byte 4 65
address ui_spScores5
address $4715
address $131
byte 4 65
address ui_spAwards
address $4716
address $131
byte 4 65
address ui_spVideos
address $4717
address $131
byte 4 65
address ui_spSkill
address $1100
address $2705
byte 4 1
address ui_spSelection
address $4718
address $131
byte 4 64
address ui_browserMaster
address $4719
address $457
byte 4 1
address ui_browserGameType
address $4720
address $457
byte 4 1
address ui_browserSortKey
address $4721
address $3247
byte 4 1
address ui_browserShowFull
address $4722
address $460
byte 4 1
address ui_browserShowEmpty
address $4723
address $460
byte 4 1
address ui_brassTime
address $2744
address $4724
byte 4 1
address ui_drawCrosshair
address $4504
address $3247
byte 4 1
address ui_drawCrosshairNames
address $4725
address $460
byte 4 1
address ui_marks
address $4726
address $460
byte 4 1
address ui_server1
address $4727
address $131
byte 4 1
address ui_server2
address $4728
address $131
byte 4 1
address ui_server3
address $4729
address $131
byte 4 1
address ui_server4
address $4730
address $131
byte 4 1
address ui_server5
address $4731
address $131
byte 4 1
address ui_server6
address $4732
address $131
byte 4 1
address ui_server7
address $4733
address $131
byte 4 1
address ui_server8
address $4734
address $131
byte 4 1
address ui_server9
address $4735
address $131
byte 4 1
address ui_server10
address $4736
address $131
byte 4 1
address ui_server11
address $4737
address $131
byte 4 1
address ui_server12
address $4738
address $131
byte 4 1
address ui_server13
address $4739
address $131
byte 4 1
address ui_server14
address $4740
address $131
byte 4 1
address ui_server15
address $4741
address $131
byte 4 1
address ui_server16
address $4742
address $131
byte 4 1
address ui_new
address $4743
address $457
byte 4 256
address ui_debug
address $4744
address $457
byte 4 256
address ui_initialized
address $4745
address $457
byte 4 256
address ui_teamName
address $925
address $4746
byte 4 1
address ui_opponentName
address $1361
address $4747
byte 4 1
address ui_redteam
address $4748
address $4746
byte 4 1
address ui_blueteam
address $4749
address $4747
byte 4 1
address ui_dedicated
address $4750
address $457
byte 4 1
address ui_gameType
address $4751
address $4752
byte 4 1
address ui_joinGameType
address $4753
address $457
byte 4 1
address ui_netGameType
address $4754
address $4752
byte 4 1
address ui_actualNetGameType
address $4755
address $4752
byte 4 1
address ui_redteam1
address $4756
address $457
byte 4 1
address ui_redteam2
address $4757
address $457
byte 4 1
address ui_redteam3
address $4758
address $457
byte 4 1
address ui_redteam4
address $4759
address $457
byte 4 1
address ui_redteam5
address $4760
address $457
byte 4 1
address ui_blueteam1
address $4761
address $457
byte 4 1
address ui_blueteam2
address $4762
address $457
byte 4 1
address ui_blueteam3
address $4763
address $457
byte 4 1
address ui_blueteam4
address $4764
address $457
byte 4 1
address ui_blueteam5
address $4765
address $457
byte 4 1
address ui_netSource
address $2212
address $457
byte 4 1
address ui_menuFiles
address $896
address $868
byte 4 1
address ui_currentTier
address $1283
address $457
byte 4 1
address ui_currentMap
address $1150
address $457
byte 4 1
address ui_currentNetMap
address $1148
address $457
byte 4 1
address ui_mapIndex
address $2625
address $457
byte 4 1
address ui_currentOpponent
address $4766
address $457
byte 4 1
address ui_selectedPlayer
address $1636
address $457
byte 4 1
address ui_selectedPlayerName
address $1644
address $131
byte 4 1
address ui_lastServerRefresh_0
address $4767
address $131
byte 4 1
address ui_lastServerRefresh_1
address $4768
address $131
byte 4 1
address ui_lastServerRefresh_2
address $4769
address $131
byte 4 1
address ui_lastServerRefresh_3
address $4770
address $131
byte 4 1
address ui_singlePlayerActive
address $2639
address $457
byte 4 0
address ui_scoreAccuracy
address $4771
address $457
byte 4 1
address ui_scoreImpressives
address $4772
address $457
byte 4 1
address ui_scoreExcellents
address $4773
address $457
byte 4 1
address ui_scoreCaptures
address $4774
address $457
byte 4 1
address ui_scoreDefends
address $4775
address $457
byte 4 1
address ui_scoreAssists
address $4776
address $457
byte 4 1
address ui_scoreGauntlets
address $4777
address $457
byte 4 1
address ui_scoreScore
address $4778
address $457
byte 4 1
address ui_scorePerfect
address $4779
address $457
byte 4 1
address ui_scoreTeam
address $4780
address $4781
byte 4 1
address ui_scoreBase
address $4782
address $457
byte 4 1
address ui_scoreTime
address $4783
address $4784
byte 4 1
address ui_scoreTimeBonus
address $4785
address $457
byte 4 1
address ui_scoreSkillBonus
address $4786
address $457
byte 4 1
address ui_scoreShutoutBonus
address $4787
address $457
byte 4 1
address ui_fragLimit
address $931
address $920
byte 4 0
address ui_captureLimit
address $929
address $921
byte 4 0
address ui_smallFont
address $4788
address $4789
byte 4 1
address ui_bigFont
address $4790
address $4517
byte 4 1
address ui_findPlayer
address $3630
address $4791
byte 4 1
address ui_Q3Model
address $4792
address $457
byte 4 1
address ui_hudFiles
address $4793
address $4794
byte 4 1
address ui_recordSPDemo
address $2658
address $457
byte 4 1
address ui_teamArenaFirstRun
address $4795
address $457
byte 4 1
address ui_realWarmUp
address $2650
address $918
byte 4 1
address ui_realCaptureLimit
address $932
address $4706
byte 4 1029
address ui_serverStatusTimeOut
address $4796
address $4797
byte 4 1
address ui_bank
address $4798
address $457
byte 4 0
align 4
LABELV cvarTableSize
byte 4 110
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 7393
;7124:
;7125:/*
;7126: ================
;7127: cvars
;7128: ================
;7129: */
;7130:
;7131:typedef struct
;7132:{
;7133:  vmCvar_t *vmCvar;
;7134:  char *cvarName;
;7135:  char *defaultString;
;7136:  int cvarFlags;
;7137:} cvarTable_t;
;7138:
;7139:vmCvar_t ui_ffa_fraglimit;
;7140:vmCvar_t ui_ffa_timelimit;
;7141:
;7142:vmCvar_t ui_tourney_fraglimit;
;7143:vmCvar_t ui_tourney_timelimit;
;7144:
;7145:vmCvar_t ui_team_fraglimit;
;7146:vmCvar_t ui_team_timelimit;
;7147:vmCvar_t ui_team_friendly;
;7148:
;7149:vmCvar_t ui_ctf_capturelimit;
;7150:vmCvar_t ui_ctf_timelimit;
;7151:vmCvar_t ui_ctf_friendly;
;7152:
;7153:vmCvar_t ui_arenasFile;
;7154:vmCvar_t ui_botsFile;
;7155:vmCvar_t ui_spScores1;
;7156:vmCvar_t ui_spScores2;
;7157:vmCvar_t ui_spScores3;
;7158:vmCvar_t ui_spScores4;
;7159:vmCvar_t ui_spScores5;
;7160:vmCvar_t ui_spAwards;
;7161:vmCvar_t ui_spVideos;
;7162:vmCvar_t ui_spSkill;
;7163:
;7164:vmCvar_t ui_spSelection;
;7165:
;7166:vmCvar_t ui_browserMaster;
;7167:vmCvar_t ui_browserGameType;
;7168:vmCvar_t ui_browserSortKey;
;7169:vmCvar_t ui_browserShowFull;
;7170:vmCvar_t ui_browserShowEmpty;
;7171:
;7172:vmCvar_t ui_brassTime;
;7173:vmCvar_t ui_drawCrosshair;
;7174:vmCvar_t ui_drawCrosshairNames;
;7175:vmCvar_t ui_marks;
;7176:
;7177:vmCvar_t ui_server1;
;7178:vmCvar_t ui_server2;
;7179:vmCvar_t ui_server3;
;7180:vmCvar_t ui_server4;
;7181:vmCvar_t ui_server5;
;7182:vmCvar_t ui_server6;
;7183:vmCvar_t ui_server7;
;7184:vmCvar_t ui_server8;
;7185:vmCvar_t ui_server9;
;7186:vmCvar_t ui_server10;
;7187:vmCvar_t ui_server11;
;7188:vmCvar_t ui_server12;
;7189:vmCvar_t ui_server13;
;7190:vmCvar_t ui_server14;
;7191:vmCvar_t ui_server15;
;7192:vmCvar_t ui_server16;
;7193:
;7194:vmCvar_t ui_redteam;
;7195:vmCvar_t ui_redteam1;
;7196:vmCvar_t ui_redteam2;
;7197:vmCvar_t ui_redteam3;
;7198:vmCvar_t ui_redteam4;
;7199:vmCvar_t ui_redteam5;
;7200:vmCvar_t ui_blueteam;
;7201:vmCvar_t ui_blueteam1;
;7202:vmCvar_t ui_blueteam2;
;7203:vmCvar_t ui_blueteam3;
;7204:vmCvar_t ui_blueteam4;
;7205:vmCvar_t ui_blueteam5;
;7206:vmCvar_t ui_teamName;
;7207:vmCvar_t ui_dedicated;
;7208:vmCvar_t ui_gameType;
;7209:vmCvar_t ui_netGameType;
;7210:vmCvar_t ui_actualNetGameType;
;7211:vmCvar_t ui_joinGameType;
;7212:vmCvar_t ui_netSource;
;7213:vmCvar_t ui_serverFilterType;
;7214:vmCvar_t ui_opponentName;
;7215:vmCvar_t ui_menuFiles;
;7216:vmCvar_t ui_currentTier;
;7217:vmCvar_t ui_currentMap;
;7218:vmCvar_t ui_currentNetMap;
;7219:vmCvar_t ui_mapIndex;
;7220:vmCvar_t ui_currentOpponent;
;7221:vmCvar_t ui_selectedPlayer;
;7222:vmCvar_t ui_selectedPlayerName;
;7223:vmCvar_t ui_lastServerRefresh_0;
;7224:vmCvar_t ui_lastServerRefresh_1;
;7225:vmCvar_t ui_lastServerRefresh_2;
;7226:vmCvar_t ui_lastServerRefresh_3;
;7227:vmCvar_t ui_singlePlayerActive;
;7228:vmCvar_t ui_scoreAccuracy;
;7229:vmCvar_t ui_scoreImpressives;
;7230:vmCvar_t ui_scoreExcellents;
;7231:vmCvar_t ui_scoreCaptures;
;7232:vmCvar_t ui_scoreDefends;
;7233:vmCvar_t ui_scoreAssists;
;7234:vmCvar_t ui_scoreGauntlets;
;7235:vmCvar_t ui_scoreScore;
;7236:vmCvar_t ui_scorePerfect;
;7237:vmCvar_t ui_scoreTeam;
;7238:vmCvar_t ui_scoreBase;
;7239:vmCvar_t ui_scoreTimeBonus;
;7240:vmCvar_t ui_scoreSkillBonus;
;7241:vmCvar_t ui_scoreShutoutBonus;
;7242:vmCvar_t ui_scoreTime;
;7243:vmCvar_t ui_captureLimit;
;7244:vmCvar_t ui_fragLimit;
;7245:vmCvar_t ui_smallFont;
;7246:vmCvar_t ui_bigFont;
;7247:vmCvar_t ui_findPlayer;
;7248:vmCvar_t ui_Q3Model;
;7249:vmCvar_t ui_hudFiles;
;7250:vmCvar_t ui_recordSPDemo;
;7251:vmCvar_t ui_realCaptureLimit;
;7252:vmCvar_t ui_realWarmUp;
;7253:vmCvar_t ui_serverStatusTimeOut;
;7254:
;7255://TA: bank values
;7256:vmCvar_t ui_bank;
;7257:
;7258:// bk001129 - made static to avoid aliasing
;7259:static cvarTable_t cvarTable[] =
;7260:{
;7261:{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;7262:{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;7263:
;7264:{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;7265:{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;7266:
;7267:{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;7268:{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;7269:{ &ui_team_friendly, "ui_team_friendly", "1", CVAR_ARCHIVE },
;7270:
;7271:{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;7272:{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;7273:{ &ui_ctf_friendly, "ui_ctf_friendly", "0", CVAR_ARCHIVE },
;7274:
;7275:{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT | CVAR_ROM },
;7276:{ &ui_botsFile, "g_botsFile", "", CVAR_INIT | CVAR_ROM },
;7277:{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;7278:{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;7279:{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;7280:{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;7281:{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;7282:{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;7283:{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;7284:{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;7285:
;7286:{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;7287:
;7288:{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;7289:{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;7290:{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;7291:{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;7292:{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;7293:
;7294:{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;7295:{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;7296:{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;7297:{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;7298:
;7299:{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;7300:{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;7301:{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;7302:{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;7303:{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;7304:{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;7305:{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;7306:{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;7307:{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;7308:{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;7309:{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;7310:{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;7311:{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;7312:{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;7313:{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;7314:{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;7315:{ &ui_new, "ui_new", "0", CVAR_TEMP },
;7316:{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;7317:{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;7318:{ &ui_teamName, "ui_teamName", "Pagans", CVAR_ARCHIVE },
;7319:{ &ui_opponentName, "ui_opponentName", "Stroggs", CVAR_ARCHIVE },
;7320:{ &ui_redteam, "ui_redteam", "Pagans", CVAR_ARCHIVE },
;7321:{ &ui_blueteam, "ui_blueteam", "Stroggs", CVAR_ARCHIVE },
;7322:{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;7323:{ &ui_gameType, "ui_gametype", "3", CVAR_ARCHIVE },
;7324:{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;7325:{ &ui_netGameType, "ui_netGametype", "3", CVAR_ARCHIVE },
;7326:{ &ui_actualNetGameType, "ui_actualNetGametype", "3", CVAR_ARCHIVE },
;7327:{ &ui_redteam1, "ui_redteam1", "0", CVAR_ARCHIVE },
;7328:{ &ui_redteam2, "ui_redteam2", "0", CVAR_ARCHIVE },
;7329:{ &ui_redteam3, "ui_redteam3", "0", CVAR_ARCHIVE },
;7330:{ &ui_redteam4, "ui_redteam4", "0", CVAR_ARCHIVE },
;7331:{ &ui_redteam5, "ui_redteam5", "0", CVAR_ARCHIVE },
;7332:{ &ui_blueteam1, "ui_blueteam1", "0", CVAR_ARCHIVE },
;7333:{ &ui_blueteam2, "ui_blueteam2", "0", CVAR_ARCHIVE },
;7334:{ &ui_blueteam3, "ui_blueteam3", "0", CVAR_ARCHIVE },
;7335:{ &ui_blueteam4, "ui_blueteam4", "0", CVAR_ARCHIVE },
;7336:{ &ui_blueteam5, "ui_blueteam5", "0", CVAR_ARCHIVE },
;7337:{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;7338:{ &ui_menuFiles, "ui_menuFiles", "ui/menus.txt", CVAR_ARCHIVE },
;7339:{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;7340:{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;7341:{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;7342:{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;7343:{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;7344:{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE },
;7345:{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE },
;7346:{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE },
;7347:{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE },
;7348:{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE },
;7349:{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE },
;7350:{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0 },
;7351:{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE },
;7352:{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE },
;7353:{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE },
;7354:{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE },
;7355:{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE },
;7356:{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE },
;7357:{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0", CVAR_ARCHIVE },
;7358:{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE },
;7359:{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE },
;7360:{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE },
;7361:{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE },
;7362:{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE },
;7363:{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE },
;7364:{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE },
;7365:{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE },
;7366:{ &ui_fragLimit, "ui_fragLimit", "10", 0 },
;7367:{ &ui_captureLimit, "ui_captureLimit", "5", 0 },
;7368:{ &ui_smallFont, "ui_smallFont", "0.2", CVAR_ARCHIVE },
;7369:{ &ui_bigFont, "ui_bigFont", "0.5", CVAR_ARCHIVE },
;7370:{ &ui_findPlayer, "ui_findPlayer", "Sarge", CVAR_ARCHIVE },
;7371:{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE },
;7372:{ &ui_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE },
;7373:{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE },
;7374:{ &ui_teamArenaFirstRun, "ui_teamArenaFirstRun", "0", CVAR_ARCHIVE },
;7375:{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE },
;7376:{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART },
;7377:{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE },
;7378:
;7379:{ &ui_bank, "ui_bank", "0", 0 },
;7380:
;7381:};
;7382:
;7383:// bk001129 - made static to avoid aliasing
;7384:static int cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;7385:
;7386:/*
;7387: =================
;7388: UI_RegisterCvars
;7389: =================
;7390: */
;7391:void
;7392:UI_RegisterCvars(void)
;7393:{
line 7397
;7394:  int i;
;7395:  cvarTable_t *cv;
;7396:
;7397:  for(i = 0, cv = cvarTable;i < cvarTableSize;i++, cv++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4803
JUMPV
LABELV $4800
line 7398
;7398:  {
line 7399
;7399:    trap_Cvar_Register(cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7400
;7400:  }
LABELV $4801
line 7397
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4803
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4800
line 7401
;7401:}
LABELV $4799
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 7410
;7402:
;7403:/*
;7404: =================
;7405: UI_UpdateCvars
;7406: =================
;7407: */
;7408:void
;7409:UI_UpdateCvars(void)
;7410:{
line 7414
;7411:  int i;
;7412:  cvarTable_t *cv;
;7413:
;7414:  for(i = 0, cv = cvarTable;i < cvarTableSize;i++, cv++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4808
JUMPV
LABELV $4805
line 7415
;7415:  {
line 7416
;7416:    trap_Cvar_Update(cv->vmCvar);
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7417
;7417:  }
LABELV $4806
line 7414
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4808
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4805
line 7418
;7418:}
LABELV $4804
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 7427
;7419:
;7420:/*
;7421: =================
;7422: ArenaServers_StopRefresh
;7423: =================
;7424: */
;7425:static void
;7426:UI_StopServerRefresh(void)
;7427:{
line 7430
;7428:  int count;
;7429:
;7430:  if (!uiInfo.serverStatus.refreshActive)
ADDRGP4 uiInfo+667904+2212
INDIRI4
CNSTI4 0
NEI4 $4810
line 7431
;7431:  {
line 7433
;7432:    // not currently refreshing
;7433:    return;
ADDRGP4 $4809
JUMPV
LABELV $4810
line 7435
;7434:  }
;7435:  uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+667904+2212
CNSTI4 0
ASGNI4
line 7436
;7436:  Com_Printf(
ADDRGP4 $4816
ARGP4
ADDRGP4 uiInfo+667904+10412
INDIRI4
ARGI4
ADDRGP4 uiInfo+667904+10416
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7439
;7437:    "%d servers listed in browser with %d players.\n", uiInfo.serverStatus.numDisplayServers,
;7438:    uiInfo.serverStatus.numPlayersOnServers);
;7439:  count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 7440
;7440:  if (count - uiInfo.serverStatus.numDisplayServers > 0)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
SUBI4
CNSTI4 0
LEI4 $4822
line 7441
;7441:  {
line 7442
;7442:    Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n", count
ADDRGP4 $4829
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4826
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+667904+10412
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7444
;7443:        - uiInfo.serverStatus.numDisplayServers, (int) trap_Cvar_VariableValue("cl_maxPing"));
;7444:  }
LABELV $4822
line 7446
;7445:
;7446:}
LABELV $4809
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 7455
;7447:
;7448:/*
;7449: =================
;7450: UI_DoServerRefresh
;7451: =================
;7452: */
;7453:static void
;7454:UI_DoServerRefresh(void)
;7455:{
line 7456
;7456:  qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 7458
;7457:
;7458:  if (!uiInfo.serverStatus.refreshActive)
ADDRGP4 uiInfo+667904+2212
INDIRI4
CNSTI4 0
NEI4 $4831
line 7459
;7459:  {
line 7460
;7460:    return;
ADDRGP4 $4830
JUMPV
LABELV $4831
line 7462
;7461:  }
;7462:  if (ui_netSource.integer != AS_FAVORITES)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $4835
line 7463
;7463:  {
line 7464
;7464:    if (ui_netSource.integer == AS_LOCAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $4838
line 7465
;7465:    {
line 7466
;7466:      if (!trap_LAN_GetServerCount(ui_netSource.integer))
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $4839
line 7467
;7467:      {
line 7468
;7468:        wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7469
;7469:      }
line 7470
;7470:    }
ADDRGP4 $4839
JUMPV
LABELV $4838
line 7472
;7471:    else
;7472:    {
line 7473
;7473:      if (trap_LAN_GetServerCount(ui_netSource.integer) < 0)
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $4844
line 7474
;7474:      {
line 7475
;7475:        wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7476
;7476:      }
LABELV $4844
line 7477
;7477:    }
LABELV $4839
line 7478
;7478:  }
LABELV $4835
line 7480
;7479:
;7480:  if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime)
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+667904+2192
INDIRI4
GEI4 $4847
line 7481
;7481:  {
line 7482
;7482:    if (wait)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4852
line 7483
;7483:    {
line 7484
;7484:      return;
ADDRGP4 $4830
JUMPV
LABELV $4852
line 7486
;7485:    }
;7486:  }
LABELV $4847
line 7489
;7487:
;7488:  // if still trying to retrieve pings
;7489:  if (trap_LAN_UpdateVisiblePings(ui_netSource.integer))
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4854
line 7490
;7490:  {
line 7491
;7491:    uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+667904+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7492
;7492:  }
ADDRGP4 $4855
JUMPV
LABELV $4854
line 7493
;7493:  else if (!wait)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4860
line 7494
;7494:  {
line 7496
;7495:    // get the last servers in the list
;7496:    UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7498
;7497:    // stop the refresh
;7498:    UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 7499
;7499:  }
LABELV $4860
LABELV $4855
line 7501
;7500:  //
;7501:  UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7502
;7502:}
LABELV $4830
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 68 24
line 7511
;7503:
;7504:/*
;7505: =================
;7506: UI_StartServerRefresh
;7507: =================
;7508: */
;7509:static void
;7510:UI_StartServerRefresh(qboolean full)
;7511:{
line 7516
;7512:  int i;
;7513:  char *ptr;
;7514:
;7515:  qtime_t q;
;7516:  trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 7517
;7517:  trap_Cvar_Set(
ADDRGP4 $1576
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4864
ARGP4
ADDRLP4 0+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MonthAbbrev
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7522
;7518:    va("ui_lastServerRefresh_%i", ui_netSource.integer), va(
;7519:      "%s-%i, %i at %i:%02i", MonthAbbrev[q.tm_mon], q.tm_mday, 1900 + q.tm_year, q.tm_hour,
;7520:      q.tm_min));
;7521:
;7522:  if (!full)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4870
line 7523
;7523:  {
line 7524
;7524:    UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 7525
;7525:    return;
ADDRGP4 $4862
JUMPV
LABELV $4870
line 7528
;7526:  }
;7527:
;7528:  uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+667904+2212
CNSTI4 1
ASGNI4
line 7529
;7529:  uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+667904+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7531
;7530:  // clear number of displayed servers
;7531:  uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+667904+10412
CNSTI4 0
ASGNI4
line 7532
;7532:  uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+667904+10416
CNSTI4 0
ASGNI4
line 7534
;7533:  // mark all servers as visible so we store ping updates for them
;7534:  trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 7536
;7535:  // reset all the pings
;7536:  trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 7538
;7537:  //
;7538:  if (ui_netSource.integer == AS_LOCAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $4883
line 7539
;7539:  {
line 7540
;7540:    trap_Cmd_ExecuteText(EXEC_NOW, "localservers\n");
CNSTI4 0
ARGI4
ADDRGP4 $4886
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7541
;7541:    uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+667904+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7542
;7542:    return;
ADDRGP4 $4862
JUMPV
LABELV $4883
line 7545
;7543:  }
;7544:
;7545:  uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+667904+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 7546
;7546:  if (ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
EQI4 $4897
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $4893
LABELV $4897
line 7547
;7547:  {
line 7548
;7548:    if (ui_netSource.integer == AS_GLOBAL)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4898
line 7549
;7549:    {
line 7550
;7550:      i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 7551
;7551:    }
ADDRGP4 $4899
JUMPV
LABELV $4898
line 7553
;7552:    else
;7553:    {
line 7554
;7554:      i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 7555
;7555:    }
LABELV $4899
line 7557
;7556:
;7557:    ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4518
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 52
INDIRP4
ASGNP4
line 7558
;7558:    if (strlen(ptr))
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $4901
line 7559
;7559:    {
line 7560
;7560:      trap_Cmd_ExecuteText(EXEC_NOW, va("globalservers %d %s full empty\n", i, ptr));
ADDRGP4 $4903
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7561
;7561:    }
ADDRGP4 $4902
JUMPV
LABELV $4901
line 7563
;7562:    else
;7563:    {
line 7564
;7564:      trap_Cmd_ExecuteText(EXEC_NOW, va(
ADDRGP4 $2592
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4904
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7566
;7565:        "globalservers %d %d full empty\n", i, (int) trap_Cvar_VariableValue("protocol")));
;7566:    }
LABELV $4902
line 7567
;7567:  }
LABELV $4893
line 7568
;7568:}
LABELV $4862
endproc UI_StartServerRefresh 68 24
bss
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export startTime
align 4
LABELV startTime
skip 4
export ui_teamArenaFirstRun
align 4
LABELV ui_teamArenaFirstRun
skip 272
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
export ui_new
align 4
LABELV ui_new
skip 272
import ProcessNewUI
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
export uiInfo
align 4
LABELV uiInfo
skip 705552
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
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
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
export ui_bank
align 4
LABELV ui_bank
skip 272
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $4904
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4903
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4886
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $4864
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $4829
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4826
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $4816
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $4798
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $4797
byte 1 55
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4796
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $4795
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4794
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4793
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4792
byte 1 117
byte 1 105
byte 1 95
byte 1 113
byte 1 51
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $4791
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $4790
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4789
byte 1 48
byte 1 46
byte 1 50
byte 1 0
align 1
LABELV $4788
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4787
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4786
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4785
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4784
byte 1 48
byte 1 48
byte 1 58
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4783
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4782
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $4781
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $4780
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4779
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4778
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $4777
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4776
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4775
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4774
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4773
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4772
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4771
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $4770
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $4769
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $4768
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $4767
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $4766
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 79
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4765
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4764
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4763
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4762
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4761
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4760
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4759
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4758
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4757
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4756
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4755
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4754
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4753
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4752
byte 1 51
byte 1 0
align 1
LABELV $4751
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4750
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4749
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4748
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4747
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $4746
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $4745
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4744
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $4743
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $4742
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $4741
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $4740
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $4739
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $4738
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $4737
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $4736
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $4735
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $4734
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $4733
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $4732
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $4731
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $4730
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $4729
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $4728
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4727
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $4726
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $4725
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4724
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4723
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $4722
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $4721
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $4720
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4719
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $4718
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $4717
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $4716
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4715
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $4714
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $4713
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $4712
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $4711
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $4710
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
LABELV $4709
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $4708
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4707
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4706
byte 1 56
byte 1 0
align 1
LABELV $4705
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4704
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4703
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4702
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4701
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4700
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4699
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4698
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4689
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4686
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4683
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4680
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4670
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $4667
byte 1 67
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
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4666
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4665
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $4661
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4654
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4652
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4649
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4640
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4639
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4635
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $4632
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4631
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4630
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $4603
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4602
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4599
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $4595
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4594
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $4591
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $4588
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $4582
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4580
byte 1 101
byte 1 110
byte 1 100
byte 1 111
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4575
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4573
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 95
byte 1 112
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $4518
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $4517
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $4516
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4515
byte 1 48
byte 1 46
byte 1 56
byte 1 0
align 1
LABELV $4514
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4513
byte 1 117
byte 1 105
byte 1 95
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4504
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $4501
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $4485
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 32
byte 1 37
byte 1 100
byte 1 58
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
byte 1 10
byte 1 0
align 1
LABELV $4476
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $4474
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $4465
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 112
byte 1 97
byte 1 110
byte 1 101
byte 1 115
byte 1 46
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $4464
byte 1 117
byte 1 105
byte 1 47
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 117
byte 1 108
byte 1 111
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4463
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4456
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $4383
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4364
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4363
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $4360
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4359
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $4358
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $4350
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $4349
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4347
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4346
byte 1 46
byte 1 0
align 1
LABELV $4336
byte 1 47
byte 1 0
align 1
LABELV $4335
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $4160
byte 1 42
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4009
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4005
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $4002
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4001
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4000
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $3799
byte 1 115
byte 1 0
align 1
LABELV $3796
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3791
byte 1 110
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3707
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3649
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3641
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3630
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3585
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3584
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $3583
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $3545
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3544
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3543
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3542
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3541
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3540
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3539
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3538
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3537
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3536
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3517
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3497
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3450
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3293
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $3290
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $3258
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3255
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 98
byte 1 67
byte 1 108
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $3250
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3247
byte 1 52
byte 1 0
align 1
LABELV $3246
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $3237
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3229
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $3217
byte 1 10
byte 1 0
align 1
LABELV $3210
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3201
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3200
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3196
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3183
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3180
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3179
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $3176
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
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
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $3171
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $3170
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3161
byte 1 97
byte 1 100
byte 1 100
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3152
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3151
byte 1 97
byte 1 100
byte 1 100
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $3146
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
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3140
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3134
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $3128
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3123
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3117
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $3112
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3106
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $3100
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3094
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3091
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3088
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $3085
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $3069
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $3066
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $3065
byte 1 76
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $3062
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $3061
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $3060
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3057
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3056
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3046
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3043
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3029
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3024
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3017
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $3007
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $3001
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2994
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2991
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2990
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2981
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2978
byte 1 84
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
LABELV $2973
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2972
byte 1 82
byte 1 117
byte 1 110
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2969
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $2966
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2965
byte 1 82
byte 1 117
byte 1 110
byte 1 77
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $2960
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 32
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $2955
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $2952
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
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2949
byte 1 112
byte 1 116
byte 1 114
byte 1 99
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2948
byte 1 80
byte 1 84
byte 1 82
byte 1 67
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2940
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2937
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2929
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2926
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2918
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 84
byte 1 111
byte 1 78
byte 1 101
byte 1 119
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2912
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2904
byte 1 83
byte 1 101
byte 1 108
byte 1 108
byte 1 84
byte 1 111
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $2901
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 83
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2893
byte 1 66
byte 1 117
byte 1 121
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $2890
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 66
byte 1 117
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $2882
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 65
byte 1 115
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2879
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2871
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 87
byte 1 105
byte 1 116
byte 1 104
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $2868
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $2860
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2857
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $2854
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2851
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2848
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2839
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2835
byte 1 82
byte 1 117
byte 1 110
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2832
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2829
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2826
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2823
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $2820
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2819
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2816
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2813
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2810
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2809
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2806
byte 1 118
byte 1 105
byte 1 100
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
LABELV $2805
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2804
byte 1 99
byte 1 118
byte 1 97
byte 1 114
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
LABELV $2803
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2802
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2795
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 83
byte 1 80
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2790
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $2764
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2763
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2757
byte 1 109
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2754
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 80
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2749
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $2746
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $2745
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2744
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2743
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $2742
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2741
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $2740
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2739
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2738
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2737
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2736
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2732
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $2727
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2723
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 98
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2716
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2715
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2711
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2708
byte 1 117
byte 1 105
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2705
byte 1 50
byte 1 0
align 1
LABELV $2702
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 100
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2701
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2698
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2697
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2694
byte 1 117
byte 1 105
byte 1 95
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2693
byte 1 117
byte 1 105
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2674
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2663
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2659
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2658
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2655
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2654
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2653
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2652
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2651
byte 1 117
byte 1 105
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2650
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2649
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2648
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2647
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2646
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2645
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2644
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2643
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2642
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2641
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2640
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2639
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2636
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2632
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2631
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2625
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2621
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2595
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2594
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2592
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $2591
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2588
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2573
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2572
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2556
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2538
byte 1 37
byte 1 115
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $2535
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2510
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2493
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $2466
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $2420
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2409
byte 1 37
byte 1 115
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $2390
byte 1 37
byte 1 115
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2386
byte 1 99
byte 1 109
byte 1 100
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
byte 1 0
align 1
LABELV $2379
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2375
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $2371
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2368
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2364
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2360
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2357
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2354
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2351
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2346
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2345
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2299
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2212
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $2110
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2079
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2027
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1945
byte 1 117
byte 1 105
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1940
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1929
byte 1 117
byte 1 105
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1784
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $1780
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1777
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1669
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1666
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $1644
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1636
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
LABELV $1616
byte 1 110
byte 1 0
align 1
LABELV $1605
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1604
byte 1 116
byte 1 0
align 1
LABELV $1603
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $1576
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1574
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 67
byte 1 76
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1573
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 46
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
byte 1 65
byte 1 80
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1538
byte 1 37
byte 1 105
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1361
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1354
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1349
byte 1 74
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1301
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
LABELV $1288
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1283
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1280
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1246
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1229
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1228
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1225
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1224
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1223
byte 1 117
byte 1 105
byte 1 95
byte 1 81
byte 1 51
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1180
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $1165
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1150
byte 1 117
byte 1 105
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
LABELV $1148
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 101
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1132
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $1129
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1123
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1122
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1116
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1115
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1114
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1107
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1106
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1100
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1007
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $988
byte 1 37
byte 1 115
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $983
byte 1 37
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $955
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $945
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $944
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $933
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $932
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $931
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $930
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $929
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $925
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $923
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $921
byte 1 53
byte 1 0
align 1
LABELV $920
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $919
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $918
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $917
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $916
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $915
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $914
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $913
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $912
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $911
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $910
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $909
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $908
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $907
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $906
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $905
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $904
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $903
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $902
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $896
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $894
byte 1 85
byte 1 73
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $891
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $871
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
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
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $868
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $867
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $830
byte 1 94
byte 1 51
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 112
byte 1 97
byte 1 110
byte 1 101
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $789
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $758
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $749
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $742
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $735
byte 1 98
byte 1 111
byte 1 116
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $728
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $719
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $710
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $696
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 10
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 112
byte 1 97
byte 1 110
byte 1 101
byte 1 115
byte 1 46
byte 1 100
byte 1 101
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $682
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $676
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $657
byte 1 71
byte 1 108
byte 1 121
byte 1 112
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $652
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $651
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $640
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $632
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $624
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $616
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $608
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $600
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $588
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $580
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $572
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $564
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $556
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $548
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $539
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $530
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $519
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $515
byte 1 125
byte 1 0
align 1
LABELV $506
byte 1 123
byte 1 0
align 1
LABELV $499
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
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
LABELV $496
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $483
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $460
byte 1 49
byte 1 0
align 1
LABELV $459
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $458
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $457
byte 1 48
byte 1 0
align 1
LABELV $456
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $207
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $201
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $195
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $192
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $189
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $186
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $168
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $167
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $166
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $165
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $163
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $162
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $160
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $159
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $158
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $157
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $156
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $155
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $154
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $153
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $152
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $151
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $150
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $149
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $148
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $147
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $146
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $145
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $144
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $143
byte 1 70
byte 1 70
byte 1 65
byte 1 0
align 1
LABELV $142
byte 1 111
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $141
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $140
byte 1 119
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $139
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 70
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $138
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $137
byte 1 65
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $135
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $133
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $132
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $131
byte 1 0
align 1
LABELV $130
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $129
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $128
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 77
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $126
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $125
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $123
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $122
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $121
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $120
byte 1 68
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $119
byte 1 78
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $118
byte 1 79
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 83
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $116
byte 1 65
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $115
byte 1 74
byte 1 117
byte 1 108
byte 1 0
align 1
LABELV $114
byte 1 74
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $113
byte 1 77
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $112
byte 1 65
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $111
byte 1 77
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $110
byte 1 70
byte 1 101
byte 1 98
byte 1 0
align 1
LABELV $109
byte 1 74
byte 1 97
byte 1 110
byte 1 0
