export voidFunction
code
proc voidFunction 0 0
file "..\..\..\..\src/ui/ui_shared.c"
line 45
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
;24:#include "ui_shared.h"
;25:
;26:#define SCROLL_TIME_START         500
;27:#define SCROLL_TIME_ADJUST        150
;28:#define SCROLL_TIME_ADJUSTOFFSET  40
;29:#define SCROLL_TIME_FLOOR         20
;30:
;31:typedef struct scrollInfo_s {
;32:  int nextScrollTime;
;33:  int nextAdjustTime;
;34:  int adjustValue;
;35:  int scrollKey;
;36:  float xStart;
;37:  float yStart;
;38:  itemDef_t *item;
;39:  qboolean scrollDir;
;40:} scrollInfo_t;
;41:
;42:static scrollInfo_t scrollInfo;
;43:
;44://TA: hack to prevent compiler warnings
;45:void voidFunction( void *var ) { return; }
LABELV $42
endproc voidFunction 0 0
export voidFunction2
proc voidFunction2 0 0
line 46
;46:qboolean voidFunction2( itemDef_t *var1, int var2 ) { return qfalse; }
CNSTI4 0
RETI4
LABELV $43
endproc voidFunction2 0 0
data
align 4
LABELV captureFunc
address voidFunction
align 4
LABELV captureData
byte 4 0
align 4
LABELV itemCapture
byte 4 0
export DC
align 4
LABELV DC
byte 4 0
align 4
LABELV g_waitingForKey
byte 4 0
align 4
LABELV g_editingField
byte 4 0
align 4
LABELV g_bindItem
byte 4 0
align 4
LABELV g_editItem
byte 4 0
export menuCount
align 4
LABELV menuCount
byte 4 0
export openMenuCount
align 4
LABELV openMenuCount
byte 4 0
align 4
LABELV debugMode
byte 4 0
align 4
LABELV lastListBoxClickTime
byte 4 0
export UI_Alloc
code
proc UI_Alloc 8 4
line 96
;47:
;48:static void (*captureFunc) (void *p) = voidFunction;
;49:static void *captureData = NULL;
;50:static itemDef_t *itemCapture = NULL;   // item that has the mouse captured ( if any )
;51:
;52:displayContextDef_t *DC = NULL;
;53:
;54:static qboolean g_waitingForKey = qfalse;
;55:static qboolean g_editingField = qfalse;
;56:
;57:static itemDef_t *g_bindItem = NULL;
;58:static itemDef_t *g_editItem = NULL;
;59:
;60:menuDef_t Menus[MAX_MENUS];      // defined menus
;61:int menuCount = 0;               // how many
;62:
;63:menuDef_t *menuStack[MAX_OPEN_MENUS];
;64:int openMenuCount = 0;
;65:
;66:static qboolean debugMode = qfalse;
;67:
;68:#define DOUBLE_CLICK_DELAY 300
;69:static int lastListBoxClickTime = 0;
;70:
;71:void Item_RunScript(itemDef_t *item, const char *s);
;72:void Item_SetupKeywordHash(void);
;73:void Menu_SetupKeywordHash(void);
;74:int BindingIDFromName(const char *name);
;75:qboolean Item_Bind_HandleKey(itemDef_t *item, int key, qboolean down);
;76:itemDef_t *Menu_SetPrevCursorItem(menuDef_t *menu);
;77:itemDef_t *Menu_SetNextCursorItem(menuDef_t *menu);
;78:static qboolean Menu_OverActiveItem(menuDef_t *menu, float x, float y);
;79:
;80:#ifdef CGAME
;81:#define MEM_POOL_SIZE  128 * 1024
;82:#else
;83:#define MEM_POOL_SIZE  1024 * 1024
;84:#endif
;85:
;86://TA: hacked variable name to avoid conflict with new cgame Alloc
;87:static char   UI_memoryPool[MEM_POOL_SIZE];
;88:static int    allocPoint, outOfMemory;
;89:
;90:/*
;91:===============
;92:UI_Alloc
;93:===============
;94:*/
;95:void *UI_Alloc( int size )
;96:{
line 99
;97:  char  *p;
;98:
;99:  if( allocPoint + size > MEM_POOL_SIZE )
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 1048576
LEI4 $45
line 100
;100:  {
line 101
;101:    outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 103
;102:
;103:    if( DC->Print )
ADDRGP4 DC
INDIRP4
CNSTI4 156
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $47
line 104
;104:      DC->Print( "UI_Alloc: Failure. Out of memory!\n" );
ADDRGP4 $49
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 156
ADDP4
INDIRP4
CALLV
pop
LABELV $47
line 106
;105:    //DC->trap_Print(S_COLOR_YELLOW"WARNING: UI Out of Memory!\n");
;106:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $44
JUMPV
LABELV $45
line 109
;107:  }
;108:
;109:  p = &UI_memoryPool[ allocPoint ];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 UI_memoryPool
ADDP4
ASGNP4
line 111
;110:
;111:  allocPoint += ( size + 15 ) & ~15;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 15
ADDI4
CNSTI4 -16
BANDI4
ADDI4
ASGNI4
line 113
;112:
;113:  return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $44
endproc UI_Alloc 8 4
export UI_InitMemory
proc UI_InitMemory 0 0
line 122
;114:}
;115:
;116:/*
;117:===============
;118:UI_InitMemory
;119:===============
;120:*/
;121:void UI_InitMemory( void )
;122:{
line 123
;123:  allocPoint = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 124
;124:  outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 125
;125:}
LABELV $50
endproc UI_InitMemory 0 0
export UI_OutOfMemory
proc UI_OutOfMemory 0 0
line 128
;126:
;127:qboolean UI_OutOfMemory( )
;128:{
line 129
;129:  return outOfMemory;
ADDRGP4 outOfMemory
INDIRI4
RETI4
LABELV $51
endproc UI_OutOfMemory 0 0
proc hashForString 16 4
line 142
;130:}
;131:
;132:
;133:
;134:
;135:
;136:#define HASH_TABLE_SIZE 2048
;137:/*
;138:================
;139:return a hash value for the string
;140:================
;141:*/
;142:static long hashForString(const char *str) {
line 147
;143:  int   i;
;144:  long  hash;
;145:  char  letter;
;146:
;147:  hash = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 148
;148:  i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $54
JUMPV
LABELV $53
line 149
;149:  while (str[i] != '\0') {
line 150
;150:    letter = tolower(str[i]);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 151
;151:    hash+=(long)(letter)*(i+119);
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
line 152
;152:    i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 153
;153:  }
LABELV $54
line 149
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $53
line 154
;154:  hash &= (HASH_TABLE_SIZE-1);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2047
BANDI4
ASGNI4
line 155
;155:  return hash;
ADDRLP4 8
INDIRI4
RETI4
LABELV $52
endproc hashForString 16 4
data
align 4
LABELV strPoolIndex
byte 4 0
align 4
LABELV strHandleCount
byte 4 0
align 4
LABELV $57
address $58
export String_Alloc
code
proc String_Alloc 44 8
line 170
;156:}
;157:
;158:typedef struct stringDef_s {
;159:  struct stringDef_s *next;
;160:  const char *str;
;161:} stringDef_t;
;162:
;163:static int strPoolIndex = 0;
;164:static char strPool[STRING_POOL_SIZE];
;165:
;166:static int strHandleCount = 0;
;167:static stringDef_t *strHandle[HASH_TABLE_SIZE];
;168:
;169:
;170:const char *String_Alloc(const char *p) {
line 176
;171:  int len;
;172:  long hash;
;173:  stringDef_t *str, *last;
;174:  static const char *staticNULL = "";
;175:
;176:  if (p == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $59
line 177
;177:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $56
JUMPV
LABELV $59
line 180
;178:  }
;179:
;180:  if (*p == 0) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $61
line 181
;181:    return staticNULL;
ADDRGP4 $57
INDIRP4
RETP4
ADDRGP4 $56
JUMPV
LABELV $61
line 184
;182:  }
;183:
;184:  hash = hashForString(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 hashForString
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 186
;185:
;186:  str = strHandle[hash];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $64
JUMPV
LABELV $63
line 187
;187:  while (str) {
line 188
;188:    if (strcmp(p, str->str) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $66
line 189
;189:      return str->str;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
RETP4
ADDRGP4 $56
JUMPV
LABELV $66
line 191
;190:    }
;191:    str = str->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 192
;192:  }
LABELV $64
line 187
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $63
line 194
;193:
;194:  len = strlen(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 195
;195:  if (len + strPoolIndex + 1 < STRING_POOL_SIZE) {
ADDRLP4 12
INDIRI4
ADDRGP4 strPoolIndex
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 393216
GEI4 $68
line 196
;196:    int ph = strPoolIndex;
ADDRLP4 24
ADDRGP4 strPoolIndex
INDIRI4
ASGNI4
line 197
;197:    strcpy(&strPool[strPoolIndex], p);
ADDRGP4 strPoolIndex
INDIRI4
ADDRGP4 strPool
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 198
;198:    strPoolIndex += len + 1;
ADDRLP4 28
ADDRGP4 strPoolIndex
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 200
;199:
;200:    str = strHandle[hash];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
INDIRP4
ASGNP4
line 201
;201:    last = str;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $71
JUMPV
LABELV $70
line 202
;202:    while (str && str->next) {
line 203
;203:      last = str;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 204
;204:      str = str->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 205
;205:    }
LABELV $71
line 202
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $73
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
NEU4 $70
LABELV $73
line 207
;206:
;207:    str  = UI_Alloc(sizeof(stringDef_t));
CNSTI4 8
ARGI4
ADDRLP4 40
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 208
;208:    str->next = NULL;
ADDRLP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 209
;209:    str->str = &strPool[ph];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRI4
ADDRGP4 strPool
ADDP4
ASGNP4
line 210
;210:    if (last) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $74
line 211
;211:      last->next = str;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 212
;212:    } else {
ADDRGP4 $75
JUMPV
LABELV $74
line 213
;213:      strHandle[hash] = str;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 214
;214:    }
LABELV $75
line 215
;215:    return &strPool[ph];
ADDRLP4 24
INDIRI4
ADDRGP4 strPool
ADDP4
RETP4
ADDRGP4 $56
JUMPV
LABELV $68
line 217
;216:  }
;217:  return NULL;
CNSTP4 0
RETP4
LABELV $56
endproc String_Alloc 44 8
export String_Report
proc String_Report 4 16
line 220
;218:}
;219:
;220:void String_Report( void ) {
line 222
;221:  float f;
;222:  Com_Printf("Memory/String Pool Info\n");
ADDRGP4 $77
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 223
;223:  Com_Printf("----------------\n");
ADDRGP4 $78
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 224
;224:  f = strPoolIndex;
ADDRLP4 0
ADDRGP4 strPoolIndex
INDIRI4
CVIF4 4
ASGNF4
line 225
;225:  f /= STRING_POOL_SIZE;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1220542464
DIVF4
ASGNF4
line 226
;226:  f *= 100;
ADDRLP4 0
CNSTF4 1120403456
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 227
;227:  Com_Printf("String Pool is %.1f%% full, %i bytes out of %i used.\n", f, strPoolIndex, STRING_POOL_SIZE);
ADDRGP4 $79
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 strPoolIndex
INDIRI4
ARGI4
CNSTI4 393216
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 228
;228:  f = allocPoint;
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
CVIF4 4
ASGNF4
line 229
;229:  f /= MEM_POOL_SIZE;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1233125376
DIVF4
ASGNF4
line 230
;230:  f *= 100;
ADDRLP4 0
CNSTF4 1120403456
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 231
;231:  Com_Printf("Memory Pool is %.1f%% full, %i bytes out of %i used.\n", f, allocPoint, MEM_POOL_SIZE);
ADDRGP4 $80
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 allocPoint
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 232
;232:}
LABELV $76
endproc String_Report 4 16
export String_Init
proc String_Init 12 0
line 240
;233:
;234:/*
;235:=================
;236:String_Init
;237:=================
;238:*/
;239:void String_Init( void )
;240:{
line 242
;241:  int i;
;242:  for( i = 0; i < HASH_TABLE_SIZE; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $82
line 243
;243:    strHandle[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
CNSTP4 0
ASGNP4
LABELV $83
line 242
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2048
LTI4 $82
line 245
;244:
;245:  strHandleCount = 0;
ADDRGP4 strHandleCount
CNSTI4 0
ASGNI4
line 246
;246:  strPoolIndex = 0;
ADDRGP4 strPoolIndex
CNSTI4 0
ASGNI4
line 247
;247:  menuCount = 0;
ADDRGP4 menuCount
CNSTI4 0
ASGNI4
line 248
;248:  openMenuCount = 0;
ADDRGP4 openMenuCount
CNSTI4 0
ASGNI4
line 249
;249:  UI_InitMemory( );
ADDRGP4 UI_InitMemory
CALLV
pop
line 250
;250:  Item_SetupKeywordHash( );
ADDRGP4 Item_SetupKeywordHash
CALLV
pop
line 251
;251:  Menu_SetupKeywordHash( );
ADDRGP4 Menu_SetupKeywordHash
CALLV
pop
line 253
;252:
;253:  if( DC && DC->getBindingBuf )
ADDRLP4 4
ADDRGP4 DC
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
EQU4 $86
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $86
line 254
;254:    Controls_GetConfig( );
ADDRGP4 Controls_GetConfig
CALLV
pop
LABELV $86
line 255
;255:}
LABELV $81
endproc String_Init 12 0
bss
align 1
LABELV $89
skip 4096
export PC_SourceWarning
code
proc PC_SourceWarning 136 16
line 262
;256:
;257:/*
;258:=================
;259:PC_SourceWarning
;260:=================
;261:*/
;262:void PC_SourceWarning(int handle, char *format, ...) {
line 268
;263:  int line;
;264:  char filename[128];
;265:  va_list argptr;
;266:  static char string[4096];
;267:
;268:  va_start (argptr, format);
ADDRLP4 132
ADDRFP4 4+4
ASGNP4
line 269
;269:  vsprintf (string, format, argptr);
ADDRGP4 $89
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 270
;270:  va_end (argptr);
ADDRLP4 132
CNSTP4 0
ASGNP4
line 272
;271:
;272:  filename[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 273
;273:  line = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 274
;274:  trap_PC_SourceFileAndLine(handle, filename, &line);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_PC_SourceFileAndLine
CALLI4
pop
line 276
;275:
;276:  Com_Printf(S_COLOR_YELLOW "WARNING: %s, line %d: %s\n", filename, line, string);
ADDRGP4 $91
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $89
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 277
;277:}
LABELV $88
endproc PC_SourceWarning 136 16
bss
align 1
LABELV $93
skip 4096
export PC_SourceError
code
proc PC_SourceError 136 16
line 284
;278:
;279:/*
;280:=================
;281:PC_SourceError
;282:=================
;283:*/
;284:void PC_SourceError(int handle, char *format, ...) {
line 290
;285:  int line;
;286:  char filename[128];
;287:  va_list argptr;
;288:  static char string[4096];
;289:
;290:  va_start (argptr, format);
ADDRLP4 132
ADDRFP4 4+4
ASGNP4
line 291
;291:  vsprintf (string, format, argptr);
ADDRGP4 $93
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 292
;292:  va_end (argptr);
ADDRLP4 132
CNSTP4 0
ASGNP4
line 294
;293:
;294:  filename[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 295
;295:  line = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 296
;296:  trap_PC_SourceFileAndLine(handle, filename, &line);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_PC_SourceFileAndLine
CALLI4
pop
line 298
;297:
;298:  Com_Printf(S_COLOR_RED "ERROR: %s, line %d: %s\n", filename, line, string);
ADDRGP4 $95
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 299
;299:}
LABELV $92
endproc PC_SourceError 136 16
export LerpColor
proc LerpColor 12 0
line 307
;300:
;301:/*
;302:=================
;303:LerpColor
;304:=================
;305:*/
;306:void LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;307:{
line 311
;308:  int i;
;309:
;310:  // lerp and clamp each component
;311:  for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
line 312
;312:  {
line 313
;313:    c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 314
;314:    if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $101
line 315
;315:      c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $102
JUMPV
LABELV $101
line 316
;316:    else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $103
line 317
;317:      c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $103
LABELV $102
line 318
;318:  }
LABELV $98
line 311
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $97
line 319
;319:}
LABELV $96
endproc LerpColor 12 0
export Float_Parse
proc Float_Parse 16 8
line 326
;320:
;321:/*
;322:=================
;323:Float_Parse
;324:=================
;325:*/
;326:qboolean Float_Parse(char **p, float *f) {
line 328
;327:  char  *token;
;328:  token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 329
;329:  if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $106
line 330
;330:    *f = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 331
;331:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $105
JUMPV
LABELV $106
line 332
;332:  } else {
line 333
;333:    return qfalse;
CNSTI4 0
RETI4
LABELV $105
endproc Float_Parse 16 8
export PC_Float_Parse
proc PC_Float_Parse 1052 12
line 342
;334:  }
;335:}
;336:
;337:/*
;338:=================
;339:PC_Float_Parse
;340:=================
;341:*/
;342:qboolean PC_Float_Parse(int handle, float *f) {
line 344
;343:  pc_token_t token;
;344:  int negative = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 346
;345:
;346:  if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $109
line 347
;347:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $108
JUMPV
LABELV $109
line 348
;348:  if (token.string[0] == '-') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $111
line 349
;349:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
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
NEI4 $114
line 350
;350:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $108
JUMPV
LABELV $114
line 351
;351:    negative = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 352
;352:  }
LABELV $111
line 353
;353:  if (token.type != TT_NUMBER) {
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $116
line 354
;354:    PC_SourceError(handle, "expected float but found %s\n", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $118
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 355
;355:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $108
JUMPV
LABELV $116
line 357
;356:  }
;357:  if (negative)
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $120
line 358
;358:    *f = -token.floatvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $121
JUMPV
LABELV $120
line 360
;359:  else
;360:    *f = token.floatvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRF4
ASGNF4
LABELV $121
line 361
;361:  return qtrue;
CNSTI4 1
RETI4
LABELV $108
endproc PC_Float_Parse 1052 12
export Color_Parse
proc Color_Parse 12 8
line 369
;362:}
;363:
;364:/*
;365:=================
;366:Color_Parse
;367:=================
;368:*/
;369:qboolean Color_Parse(char **p, vec4_t *c) {
line 373
;370:  int i;
;371:  float f;
;372:
;373:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $125
line 374
;374:    if (!Float_Parse(p, &f)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $129
line 375
;375:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $124
JUMPV
LABELV $129
line 377
;376:    }
;377:    (*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 378
;378:  }
LABELV $126
line 373
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $125
line 379
;379:  return qtrue;
CNSTI4 1
RETI4
LABELV $124
endproc Color_Parse 12 8
export PC_Color_Parse
proc PC_Color_Parse 12 8
line 387
;380:}
;381:
;382:/*
;383:=================
;384:PC_Color_Parse
;385:=================
;386:*/
;387:qboolean PC_Color_Parse(int handle, vec4_t *c) {
line 391
;388:  int i;
;389:  float f;
;390:
;391:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $132
line 392
;392:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $136
line 393
;393:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $136
line 395
;394:    }
;395:    (*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 396
;396:  }
LABELV $133
line 391
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $132
line 397
;397:  return qtrue;
CNSTI4 1
RETI4
LABELV $131
endproc PC_Color_Parse 12 8
export Int_Parse
proc Int_Parse 16 8
line 405
;398:}
;399:
;400:/*
;401:=================
;402:Int_Parse
;403:=================
;404:*/
;405:qboolean Int_Parse(char **p, int *i) {
line 407
;406:  char  *token;
;407:  token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 409
;408:
;409:  if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $139
line 410
;410:    *i = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 411
;411:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $138
JUMPV
LABELV $139
line 412
;412:  } else {
line 413
;413:    return qfalse;
CNSTI4 0
RETI4
LABELV $138
endproc Int_Parse 16 8
export PC_Int_Parse
proc PC_Int_Parse 1052 12
line 422
;414:  }
;415:}
;416:
;417:/*
;418:=================
;419:PC_Int_Parse
;420:=================
;421:*/
;422:qboolean PC_Int_Parse(int handle, int *i) {
line 424
;423:  pc_token_t token;
;424:  int negative = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 426
;425:
;426:  if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $142
line 427
;427:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $142
line 428
;428:  if (token.string[0] == '-') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $144
line 429
;429:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
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
NEI4 $147
line 430
;430:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $147
line 431
;431:    negative = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 432
;432:  }
LABELV $144
line 433
;433:  if (token.type != TT_NUMBER) {
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $149
line 434
;434:    PC_SourceError(handle, "expected integer but found %s\n", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 435
;435:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $149
line 437
;436:  }
;437:  *i = token.intvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+8
INDIRI4
ASGNI4
line 438
;438:  if (negative)
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $154
line 439
;439:    *i = - *i;
ADDRLP4 1048
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
NEGI4
ASGNI4
LABELV $154
line 440
;440:  return qtrue;
CNSTI4 1
RETI4
LABELV $141
endproc PC_Int_Parse 1052 12
export Rect_Parse
proc Rect_Parse 16 8
line 448
;441:}
;442:
;443:/*
;444:=================
;445:Rect_Parse
;446:=================
;447:*/
;448:qboolean Rect_Parse(char **p, rectDef_t *r) {
line 449
;449:  if (Float_Parse(p, &r->x)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $157
line 450
;450:    if (Float_Parse(p, &r->y)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $159
line 451
;451:      if (Float_Parse(p, &r->w)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $161
line 452
;452:        if (Float_Parse(p, &r->h)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $163
line 453
;453:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $156
JUMPV
LABELV $163
line 455
;454:        }
;455:      }
LABELV $161
line 456
;456:    }
LABELV $159
line 457
;457:  }
LABELV $157
line 458
;458:  return qfalse;
CNSTI4 0
RETI4
LABELV $156
endproc Rect_Parse 16 8
export PC_Rect_Parse
proc PC_Rect_Parse 16 8
line 466
;459:}
;460:
;461:/*
;462:=================
;463:PC_Rect_Parse
;464:=================
;465:*/
;466:qboolean PC_Rect_Parse(int handle, rectDef_t *r) {
line 467
;467:  if (PC_Float_Parse(handle, &r->x)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $166
line 468
;468:    if (PC_Float_Parse(handle, &r->y)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $168
line 469
;469:      if (PC_Float_Parse(handle, &r->w)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $170
line 470
;470:        if (PC_Float_Parse(handle, &r->h)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $172
line 471
;471:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $165
JUMPV
LABELV $172
line 473
;472:        }
;473:      }
LABELV $170
line 474
;474:    }
LABELV $168
line 475
;475:  }
LABELV $166
line 476
;476:  return qfalse;
CNSTI4 0
RETI4
LABELV $165
endproc PC_Rect_Parse 16 8
export String_Parse
proc String_Parse 16 8
line 484
;477:}
;478:
;479:/*
;480:=================
;481:String_Parse
;482:=================
;483:*/
;484:qboolean String_Parse(char **p, const char **out) {
line 487
;485:  char *token;
;486:
;487:  token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 488
;488:  if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $175
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $175
line 489
;489:    *(out) = String_Alloc(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRP4
ASGNP4
line 490
;490:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $174
JUMPV
LABELV $175
line 492
;491:  }
;492:  return qfalse;
CNSTI4 0
RETI4
LABELV $174
endproc String_Parse 16 8
export PC_String_Parse
proc PC_String_Parse 1048 8
line 500
;493:}
;494:
;495:/*
;496:=================
;497:PC_String_Parse
;498:=================
;499:*/
;500:qboolean PC_String_Parse(int handle, const char **out) {
line 503
;501:  pc_token_t token;
;502:
;503:  if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $178
line 504
;504:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $177
JUMPV
LABELV $178
line 506
;505:
;506:  *(out) = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1044
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 1044
INDIRP4
ASGNP4
line 507
;507:    return qtrue;
CNSTI4 1
RETI4
LABELV $177
endproc PC_String_Parse 1048 8
export PC_Script_Parse
proc PC_Script_Parse 2084 12
line 515
;508:}
;509:
;510:/*
;511:=================
;512:PC_Script_Parse
;513:=================
;514:*/
;515:qboolean PC_Script_Parse(int handle, const char **out) {
line 519
;516:  char script[1024];
;517:  pc_token_t token;
;518:
;519:  memset(script, 0, sizeof(script));
ADDRLP4 1040
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 523
;520:  // scripts start with { and have ; separated command lists.. commands are command, arg..
;521:  // basically we want everything between the { } as it will be interpreted at run time
;522:
;523:  if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $182
line 524
;524:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $181
JUMPV
LABELV $182
line 525
;525:  if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
EQI4 $189
line 526
;526:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $181
JUMPV
LABELV $188
line 529
;527:  }
;528:
;529:  while ( 1 ) {
line 530
;530:    if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2072
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $191
line 531
;531:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $181
JUMPV
LABELV $191
line 533
;532:
;533:    if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $193
line 534
;534:      *out = String_Alloc(script);
ADDRLP4 1040
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 535
;535:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $181
JUMPV
LABELV $193
line 538
;536:    }
;537:
;538:    if (token.string[1] != '\0') {
ADDRLP4 0+16+1
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $197
line 539
;539:      Q_strcat(script, 1024, va("\"%s\"", token.string));
ADDRGP4 $201
ARGP4
ADDRLP4 0+16
ARGP4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 540
;540:    } else {
ADDRGP4 $198
JUMPV
LABELV $197
line 541
;541:      Q_strcat(script, 1024, token.string);
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0+16
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 542
;542:    }
LABELV $198
line 543
;543:    Q_strcat(script, 1024, " ");
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $204
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 544
;544:  }
LABELV $189
line 529
ADDRGP4 $188
JUMPV
line 545
;545:  return qfalse;  // bk001105 - LCC   missing return value
CNSTI4 0
RETI4
LABELV $181
endproc PC_Script_Parse 2084 12
export Init_Display
proc Init_Display 0 0
line 559
;546:}
;547:
;548:// display, window, menu, item code
;549://
;550:
;551:/*
;552:==================
;553:Init_Display
;554:
;555:Initializes the display with a structure to all the drawing routines
;556:==================
;557:*/
;558:void Init_Display( displayContextDef_t *dc )
;559:{
line 560
;560:  DC = dc;
ADDRGP4 DC
ADDRFP4 0
INDIRP4
ASGNP4
line 561
;561:}
LABELV $205
endproc Init_Display 0 0
export GradientBar_Paint
proc GradientBar_Paint 12 20
line 568
;562:
;563:
;564:
;565:// type and style painting
;566:
;567:void GradientBar_Paint( rectDef_t *rect, vec4_t color )
;568:{
line 570
;569:  // gradient bar takes two paints
;570:  DC->setColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 571
;571:  DC->drawHandlePic( rect->x, rect->y, rect->w, rect->h, DC->Assets.gradientBar );
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
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 61888
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 572
;572:  DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 573
;573:}
LABELV $206
endproc GradientBar_Paint 12 20
export Window_Init
proc Window_Init 8 12
line 584
;574:
;575:
;576:/*
;577:==================
;578:Window_Init
;579:
;580:Initializes a window structure ( windowDef_t ) with defaults
;581:
;582:==================
;583:*/
;584:void Window_Init(Window *w) {
line 585
;585:  memset(w, 0, sizeof(windowDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 180
ARGI4
ADDRGP4 memset
CALLP4
pop
line 586
;586:  w->borderSize = 1;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1065353216
ASGNF4
line 587
;587:  w->foreColor[0] = w->foreColor[1] = w->foreColor[2] = w->foreColor[3] = 1.0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 588
;588:  w->cinematic = -1;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 -1
ASGNI4
line 589
;589:}
LABELV $207
endproc Window_Init 8 12
export Fade
proc Fade 8 0
line 591
;590:
;591:void Fade(int *flags, float *f, float clamp, int *nextTime, int offsetTime, qboolean bFlags, float fadeAmount) {
line 592
;592:  if (*flags & (WINDOW_FADINGOUT | WINDOW_FADINGIN)) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 96
BANDI4
CNSTI4 0
EQI4 $209
line 593
;593:    if (DC->realTime > *nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 12
INDIRP4
INDIRI4
LEI4 $211
line 594
;594:      *nextTime = DC->realTime + offsetTime;
ADDRFP4 12
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 16
INDIRI4
ADDI4
ASGNI4
line 595
;595:      if (*flags & WINDOW_FADINGOUT) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $213
line 596
;596:        *f -= fadeAmount;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 24
INDIRF4
SUBF4
ASGNF4
line 597
;597:        if (bFlags && *f <= 0.0) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $214
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 0
GTF4 $214
line 598
;598:          *flags &= ~(WINDOW_FADINGOUT | WINDOW_VISIBLE);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -37
BANDI4
ASGNI4
line 599
;599:        }
line 600
;600:      } else {
ADDRGP4 $214
JUMPV
LABELV $213
line 601
;601:        *f += fadeAmount;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 24
INDIRF4
ADDF4
ASGNF4
line 602
;602:        if (*f >= clamp) {
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
LTF4 $217
line 603
;603:          *f = clamp;
ADDRFP4 4
INDIRP4
ADDRFP4 8
INDIRF4
ASGNF4
line 604
;604:          if (bFlags) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $219
line 605
;605:            *flags &= ~WINDOW_FADINGIN;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 606
;606:          }
LABELV $219
line 607
;607:        }
LABELV $217
line 608
;608:      }
LABELV $214
line 609
;609:    }
LABELV $211
line 610
;610:  }
LABELV $209
line 611
;611:}
LABELV $208
endproc Fade 8 0
export Window_Paint
proc Window_Paint 60 28
line 615
;612:
;613:
;614:
;615:void Window_Paint(Window *w, float fadeAmount, float fadeClamp, float fadeCycle) {
line 618
;616:  //float bordersize = 0;
;617:  vec4_t color;
;618:  rectDef_t fillRect = w->rect;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 16
line 621
;619:
;620:
;621:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $222
line 622
;622:    color[0] = color[1] = color[2] = color[3] = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+12
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ASGNF4
line 623
;623:    DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, 1, color);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 624
;624:  }
LABELV $222
line 626
;625:
;626:  if (w == NULL || (w->style == 0 && w->border == 0)) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $227
ADDRLP4 32
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $227
LABELV $229
line 627
;627:    return;
ADDRGP4 $221
JUMPV
LABELV $227
line 630
;628:  }
;629:
;630:  if (w->border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
line 631
;631:    fillRect.x += w->borderSize;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 632
;632:    fillRect.y += w->borderSize;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 633
;633:    fillRect.w -= w->borderSize + 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
SUBF4
ASGNF4
line 634
;634:    fillRect.h -= w->borderSize + 1;
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
SUBF4
ASGNF4
line 635
;635:  }
LABELV $230
line 637
;636:
;637:  if (w->style == WINDOW_STYLE_FILLED) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
NEI4 $235
line 639
;638:    // box, but possible a shader that needs filled
;639:    if (w->background) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
EQI4 $237
line 640
;640:      Fade(&w->flags, &w->backColor[3], fadeClamp, &w->nextTime, fadeCycle, qtrue, fadeAmount);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 140
ADDP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 108
ADDP4
ARGP4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 641
;641:      DC->setColor(w->backColor);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 642
;642:      DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 643
;643:      DC->setColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 644
;644:    } else {
ADDRGP4 $236
JUMPV
LABELV $237
line 645
;645:      DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->backColor);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 646
;646:    }
line 647
;647:  } else if (w->style == WINDOW_STYLE_GRADIENT) {
ADDRGP4 $236
JUMPV
LABELV $235
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
NEI4 $245
line 648
;648:    GradientBar_Paint(&fillRect, w->backColor);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 650
;649:    // gradient bar
;650:  } else if (w->style == WINDOW_STYLE_SHADER) {
ADDRGP4 $246
JUMPV
LABELV $245
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 3
NEI4 $247
line 651
;651:    if (w->flags & WINDOW_FORECOLORSET) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $249
line 652
;652:      DC->setColor(w->foreColor);
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 653
;653:    }
LABELV $249
line 654
;654:    DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 655
;655:    DC->setColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 656
;656:  } else if (w->style == WINDOW_STYLE_TEAMCOLOR) {
ADDRGP4 $248
JUMPV
LABELV $247
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
NEI4 $254
line 657
;657:    if (DC->getTeamColor) {
ADDRGP4 DC
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
line 658
;658:      DC->getTeamColor(&color);
ADDRLP4 16
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CALLV
pop
line 659
;659:      DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, color);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 660
;660:    }
line 661
;661:  } else if (w->style == WINDOW_STYLE_CINEMATIC) {
ADDRGP4 $255
JUMPV
LABELV $254
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $261
line 662
;662:    if (w->cinematic == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $263
line 663
;663:      w->cinematic = DC->playCinematic(w->cinematicName, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
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
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 180
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 664
;664:      if (w->cinematic == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $268
line 665
;665:        w->cinematic = -2;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 -2
ASGNI4
line 666
;666:      }
LABELV $268
line 667
;667:    }
LABELV $263
line 668
;668:    if (w->cinematic >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LTI4 $270
line 669
;669:      DC->runCinematicFrame(w->cinematic);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 192
ADDP4
INDIRP4
CALLV
pop
line 670
;670:      DC->drawCinematic(w->cinematic, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 188
ADDP4
INDIRP4
CALLV
pop
line 671
;671:    }
LABELV $270
line 672
;672:  }
LABELV $261
LABELV $255
LABELV $248
LABELV $246
LABELV $236
line 674
;673:
;674:  if (w->border == WINDOW_BORDER_FULL) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 1
NEI4 $275
line 677
;675:    // full
;676:    // HACK HACK HACK
;677:    if (w->style == WINDOW_STYLE_TEAMCOLOR) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
NEI4 $277
line 678
;678:      if (color[0] > 0) {
ADDRLP4 16
INDIRF4
CNSTF4 0
LEF4 $279
line 680
;679:        // red
;680:        color[0] = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 681
;681:        color[1] = color[2] = .5;
ADDRLP4 40
CNSTF4 1056964608
ASGNF4
ADDRLP4 16+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRF4
ASGNF4
line 683
;682:
;683:      } else {
ADDRGP4 $280
JUMPV
LABELV $279
line 684
;684:        color[2] = 1;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 685
;685:        color[0] = color[1] = .5;
ADDRLP4 40
CNSTF4 1056964608
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 686
;686:      }
LABELV $280
line 687
;687:      color[3] = 1;
ADDRLP4 16+12
CNSTF4 1065353216
ASGNF4
line 688
;688:      DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, color);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 689
;689:    } else {
ADDRGP4 $276
JUMPV
LABELV $277
line 690
;690:      DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, w->borderColor);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 691
;691:    }
line 692
;692:  } else if (w->border == WINDOW_BORDER_HORZ) {
ADDRGP4 $276
JUMPV
LABELV $275
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 2
NEI4 $286
line 694
;693:    // top/bottom
;694:    DC->setColor(w->borderColor);
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 695
;695:    DC->drawTopBottom(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 696
;696:    DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 697
;697:  } else if (w->border == WINDOW_BORDER_VERT) {
ADDRGP4 $287
JUMPV
LABELV $286
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 3
NEI4 $288
line 699
;698:    // left right
;699:    DC->setColor(w->borderColor);
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 700
;700:    DC->drawSides(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CALLV
pop
line 701
;701:    DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 702
;702:  } else if (w->border == WINDOW_BORDER_KCGRADIENT) {
ADDRGP4 $289
JUMPV
LABELV $288
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 4
NEI4 $290
line 704
;703:    // this is just two gradient bars along each horz edge
;704:    rectDef_t r = w->rect;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 16
line 705
;705:    r.h = w->borderSize;
ADDRLP4 40+12
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
line 706
;706:    GradientBar_Paint(&r, w->borderColor);
ADDRLP4 40
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 707
;707:    r.y = w->rect.y + w->rect.h - 1;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40+4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 708
;708:    GradientBar_Paint(&r, w->borderColor);
ADDRLP4 40
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 709
;709:  }
LABELV $290
LABELV $289
LABELV $287
LABELV $276
line 711
;710:
;711:}
LABELV $221
endproc Window_Paint 60 28
export Item_SetScreenCoords
proc Item_SetScreenCoords 16 0
line 714
;712:
;713:
;714:void Item_SetScreenCoords(itemDef_t *item, float x, float y) {
line 716
;715:
;716:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $295
line 717
;717:    return;
ADDRGP4 $294
JUMPV
LABELV $295
line 720
;718:  }
;719:
;720:  if (item->window.border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $297
line 721
;721:    x += item->window.borderSize;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 722
;722:    y += item->window.borderSize;
ADDRFP4 8
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 723
;723:  }
LABELV $297
line 725
;724:
;725:  item->window.rect.x = x + item->window.rectClient.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
ASGNF4
line 726
;726:  item->window.rect.y = y + item->window.rectClient.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 727
;727:  item->window.rect.w = item->window.rectClient.w;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 728
;728:  item->window.rect.h = item->window.rectClient.h;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 731
;729:
;730:  // force the text rects to recompute
;731:  item->textRect.w = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 0
ASGNF4
line 732
;732:  item->textRect.h = 0;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 0
ASGNF4
line 733
;733:}
LABELV $294
endproc Item_SetScreenCoords 16 0
export Item_UpdatePosition
proc Item_UpdatePosition 20 12
line 736
;734:
;735:// FIXME: consolidate this with nearby stuff
;736:void Item_UpdatePosition(itemDef_t *item) {
line 740
;737:  float x, y;
;738:  menuDef_t *menu;
;739:
;740:  if (item == NULL || item->parent == NULL) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $302
ADDRLP4 12
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $300
LABELV $302
line 741
;741:    return;
ADDRGP4 $299
JUMPV
LABELV $300
line 744
;742:  }
;743:
;744:  menu = item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 746
;745:
;746:  x = menu->window.rect.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
line 747
;747:  y = menu->window.rect.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 749
;748:
;749:  if (menu->window.border != 0) {
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
line 750
;750:    x += menu->window.borderSize;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 751
;751:    y += menu->window.borderSize;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 752
;752:  }
LABELV $303
line 754
;753:
;754:  Item_SetScreenCoords(item, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 Item_SetScreenCoords
CALLV
pop
line 756
;755:
;756:}
LABELV $299
endproc Item_UpdatePosition 20 12
export Menu_UpdatePosition
proc Menu_UpdatePosition 12 12
line 759
;757:
;758:// menus
;759:void Menu_UpdatePosition(menuDef_t *menu) {
line 763
;760:  int i;
;761:  float x, y;
;762:
;763:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $306
line 764
;764:    return;
ADDRGP4 $305
JUMPV
LABELV $306
line 767
;765:  }
;766:
;767:  x = menu->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 768
;768:  y = menu->window.rect.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 769
;769:  if (menu->window.border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $308
line 770
;770:    x += menu->window.borderSize;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 771
;771:    y += menu->window.borderSize;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 772
;772:  }
LABELV $308
line 774
;773:
;774:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 775
;775:    Item_SetScreenCoords(menu->items[i], x, y);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 Item_SetScreenCoords
CALLV
pop
line 776
;776:  }
LABELV $311
line 774
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $310
line 777
;777:}
LABELV $305
endproc Menu_UpdatePosition 12 12
export Menu_PostParse
proc Menu_PostParse 0 4
line 779
;778:
;779:void Menu_PostParse(menuDef_t *menu) {
line 780
;780:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 781
;781:    return;
ADDRGP4 $314
JUMPV
LABELV $315
line 783
;782:  }
;783:  if (menu->fullScreen) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $317
line 784
;784:    menu->window.rect.x = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 785
;785:    menu->window.rect.y = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 786
;786:    menu->window.rect.w = 640;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1142947840
ASGNF4
line 787
;787:    menu->window.rect.h = 480;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1139802112
ASGNF4
line 788
;788:  }
LABELV $317
line 789
;789:  Menu_UpdatePosition(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_UpdatePosition
CALLV
pop
line 790
;790:}
LABELV $314
endproc Menu_PostParse 0 4
export Menu_ClearFocus
proc Menu_ClearFocus 28 8
line 792
;791:
;792:itemDef_t *Menu_ClearFocus(menuDef_t *menu) {
line 794
;793:  int i;
;794:  itemDef_t *ret = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 796
;795:
;796:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $320
line 797
;797:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $319
JUMPV
LABELV $320
line 800
;798:  }
;799:
;800:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 801
;801:    if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $326
line 802
;802:      ret = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
line 803
;803:    }
LABELV $326
line 804
;804:    menu->items[i]->window.flags &= ~WINDOW_HASFOCUS;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
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
line 805
;805:    if (menu->items[i]->leaveFocus) {
ADDRLP4 16
CNSTI4 260
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
line 806
;806:      Item_RunScript(menu->items[i], menu->items[i]->leaveFocus);
ADDRLP4 20
CNSTI4 260
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 807
;807:    }
LABELV $328
line 808
;808:  }
LABELV $323
line 800
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $322
line 810
;809:
;810:  return ret;
ADDRLP4 4
INDIRP4
RETP4
LABELV $319
endproc Menu_ClearFocus 28 8
export IsVisible
proc IsVisible 12 0
line 813
;811:}
;812:
;813:qboolean IsVisible(int flags) {
line 814
;814:  return (flags & WINDOW_VISIBLE && !(flags & WINDOW_FADINGOUT));
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $332
ADDRLP4 4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $332
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $333
ADDRLP4 0
INDIRI4
RETI4
LABELV $330
endproc IsVisible 12 0
export Rect_ContainsPoint
proc Rect_ContainsPoint 20 0
line 817
;815:}
;816:
;817:qboolean Rect_ContainsPoint(rectDef_t *rect, float x, float y) {
line 818
;818:  if (rect) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
line 819
;819:    if (x > rect->x && x < rect->x + rect->w && y > rect->y && y < rect->y + rect->h) {
ADDRLP4 0
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $337
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
GEF4 $337
ADDRLP4 12
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $337
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $337
line 820
;820:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $334
JUMPV
LABELV $337
line 822
;821:    }
;822:  }
LABELV $335
line 823
;823:  return qfalse;
CNSTI4 0
RETI4
LABELV $334
endproc Rect_ContainsPoint 20 0
export Menu_ItemsMatchingGroup
proc Menu_ItemsMatchingGroup 20 8
line 826
;824:}
;825:
;826:int Menu_ItemsMatchingGroup(menuDef_t *menu, const char *name) {
line 828
;827:  int i;
;828:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 829
;829:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $340
line 830
;830:    if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $344
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $344
LABELV $346
line 831
;831:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 832
;832:    }
LABELV $344
line 833
;833:  }
LABELV $341
line 829
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $343
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $340
line 834
;834:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $339
endproc Menu_ItemsMatchingGroup 20 8
export Menu_GetMatchingItemByNumber
proc Menu_GetMatchingItemByNumber 20 8
line 837
;835:}
;836:
;837:itemDef_t *Menu_GetMatchingItemByNumber(menuDef_t *menu, int index, const char *name) {
line 839
;838:  int i;
;839:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 840
;840:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $348
line 841
;841:    if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $354
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $354
line 842
;842:      if (count == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $355
line 843
;843:        return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $347
JUMPV
LABELV $355
line 845
;844:      }
;845:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 846
;846:    }
LABELV $352
line 847
;847:  }
LABELV $349
line 840
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $348
line 848
;848:  return NULL;
CNSTP4 0
RETP4
LABELV $347
endproc Menu_GetMatchingItemByNumber 20 8
export Script_SetColor
proc Script_SetColor 36 8
line 853
;849:}
;850:
;851:
;852:
;853:void Script_SetColor(itemDef_t *item, char **args) {
line 859
;854:  const char *name;
;855:  int i;
;856:  float f;
;857:  vec4_t *out;
;858:  // expecting type of color to set and 4 args for the color
;859:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $358
line 860
;860:      out = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 861
;861:      if (Q_stricmp(name, "backcolor") == 0) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $360
line 862
;862:        out = &item->window.backColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 863
;863:        item->window.flags |= WINDOW_BACKCOLORSET;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 4194304
BORI4
ASGNI4
line 864
;864:      } else if (Q_stricmp(name, "forecolor") == 0) {
ADDRGP4 $361
JUMPV
LABELV $360
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $363
line 865
;865:        out = &item->window.foreColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
line 866
;866:        item->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 867
;867:      } else if (Q_stricmp(name, "bordercolor") == 0) {
ADDRGP4 $364
JUMPV
LABELV $363
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $366
line 868
;868:        out = &item->window.borderColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
line 869
;869:      }
LABELV $366
LABELV $364
LABELV $361
line 871
;870:
;871:      if (out) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $369
line 872
;872:        for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $371
line 873
;873:          if (!Float_Parse(args, &f)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $375
line 874
;874:            return;
ADDRGP4 $357
JUMPV
LABELV $375
line 876
;875:          }
;876:          (*out)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 877
;877:        }
LABELV $372
line 872
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $371
line 878
;878:      }
LABELV $369
line 879
;879:  }
LABELV $358
line 880
;880:}
LABELV $357
endproc Script_SetColor 36 8
export Script_SetAsset
proc Script_SetAsset 8 8
line 882
;881:
;882:void Script_SetAsset(itemDef_t *item, char **args) {
line 885
;883:  const char *name;
;884:  // expecting name to set asset to
;885:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $378
line 887
;886:    // check for a model
;887:    if (item->type == ITEM_TYPE_MODEL) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 7
NEI4 $380
line 888
;888:    }
LABELV $380
line 889
;889:  }
LABELV $378
line 890
;890:}
LABELV $377
endproc Script_SetAsset 8 8
export Script_SetBackground
proc Script_SetBackground 12 8
line 892
;891:
;892:void Script_SetBackground(itemDef_t *item, char **args) {
line 895
;893:  const char *name;
;894:  // expecting name to set asset to
;895:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $383
line 896
;896:    item->window.background = DC->registerShaderNoMip(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 897
;897:  }
LABELV $383
line 898
;898:}
LABELV $382
endproc Script_SetBackground 12 8
export Menu_FindItemByName
proc Menu_FindItemByName 12 8
line 903
;899:
;900:
;901:
;902:
;903:itemDef_t *Menu_FindItemByName(menuDef_t *menu, const char *p) {
line 905
;904:  int i;
;905:  if (menu == NULL || p == NULL) {
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $388
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $386
LABELV $388
line 906
;906:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $385
JUMPV
LABELV $386
line 909
;907:  }
;908:
;909:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 910
;910:    if (Q_stricmp(p, menu->items[i]->window.name) == 0) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 32
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
NEI4 $393
line 911
;911:      return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $385
JUMPV
LABELV $393
line 913
;912:    }
;913:  }
LABELV $390
line 909
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $389
line 915
;914:
;915:  return NULL;
CNSTP4 0
RETP4
LABELV $385
endproc Menu_FindItemByName 12 8
export Script_SetTeamColor
proc Script_SetTeamColor 24 4
line 918
;916:}
;917:
;918:void Script_SetTeamColor(itemDef_t *item, char **args) {
line 919
;919:  if (DC->getTeamColor) {
ADDRGP4 DC
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
line 922
;920:    int i;
;921:    vec4_t color;
;922:    DC->getTeamColor(&color);
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CALLV
pop
line 923
;923:    for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $398
line 924
;924:      item->window.backColor[i] = color[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ASGNF4
line 925
;925:    }
LABELV $399
line 923
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $398
line 926
;926:  }
LABELV $396
line 927
;927:}
LABELV $395
endproc Script_SetTeamColor 24 4
export Script_SetItemColor
proc Script_SetItemColor 80 12
line 929
;928:
;929:void Script_SetItemColor(itemDef_t *item, char **args) {
line 936
;930:  const char *itemname;
;931:  const char *name;
;932:  vec4_t color;
;933:  int i;
;934:  vec4_t *out;
;935:  // expecting type of color to set and 4 args for the color
;936:  if (String_Parse(args, &itemname) && String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $403
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 36
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $403
line 939
;937:    itemDef_t *item2;
;938:    int j;
;939:    int count = Menu_ItemsMatchingGroup(item->parent, itemname);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
line 941
;940:
;941:    if (!Color_Parse(args, &color)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 Color_Parse
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $405
line 942
;942:      return;
ADDRGP4 $402
JUMPV
LABELV $405
line 945
;943:    }
;944:
;945:    for (j = 0; j < count; j++) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $407
line 946
;946:      item2 = Menu_GetMatchingItemByNumber(item->parent, j, itemname);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 60
INDIRP4
ASGNP4
line 947
;947:      if (item2 != NULL) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $411
line 948
;948:        out = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 949
;949:        if (Q_stricmp(name, "backcolor") == 0) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $413
line 950
;950:          out = &item2->window.backColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 951
;951:        } else if (Q_stricmp(name, "forecolor") == 0) {
ADDRGP4 $414
JUMPV
LABELV $413
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $415
line 952
;952:          out = &item2->window.foreColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
line 953
;953:          item2->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 72
ADDRLP4 44
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 954
;954:        } else if (Q_stricmp(name, "bordercolor") == 0) {
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $417
line 955
;955:          out = &item2->window.borderColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
line 956
;956:        }
LABELV $417
LABELV $416
LABELV $414
line 958
;957:
;958:        if (out) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $419
line 959
;959:          for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $421
line 960
;960:            (*out)[i] = color[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ASGNF4
line 961
;961:          }
LABELV $422
line 959
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $421
line 962
;962:        }
LABELV $419
line 963
;963:      }
LABELV $411
line 964
;964:    }
LABELV $408
line 945
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $410
ADDRLP4 40
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $407
line 965
;965:  }
LABELV $403
line 966
;966:}
LABELV $402
endproc Script_SetItemColor 80 12
export Menu_ShowItemByName
proc Menu_ShowItemByName 24 12
line 969
;967:
;968:
;969:void Menu_ShowItemByName(menuDef_t *menu, const char *p, qboolean bShow) {
line 972
;970:  itemDef_t *item;
;971:  int i;
;972:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 973
;973:  for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $429
JUMPV
LABELV $426
line 974
;974:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 975
;975:    if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $430
line 976
;976:      if (bShow) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $432
line 977
;977:        item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 978
;978:      } else {
ADDRGP4 $433
JUMPV
LABELV $432
line 979
;979:        item->window.flags &= ~WINDOW_VISIBLE;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 981
;980:        // stop cinematics playing in the window
;981:        if (item->window.cinematic >= 0) {
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LTI4 $434
line 982
;982:          DC->stopCinematic(item->window.cinematic);
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLV
pop
line 983
;983:          item->window.cinematic = -1;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 -1
ASGNI4
line 984
;984:        }
LABELV $434
line 985
;985:      }
LABELV $433
line 986
;986:    }
LABELV $430
line 987
;987:  }
LABELV $427
line 973
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $429
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $426
line 988
;988:}
LABELV $425
endproc Menu_ShowItemByName 24 12
export Menu_FadeItemByName
proc Menu_FadeItemByName 32 12
line 990
;989:
;990:void Menu_FadeItemByName(menuDef_t *menu, const char *p, qboolean fadeOut) {
line 993
;991:  itemDef_t *item;
;992:  int i;
;993:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 994
;994:  for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $437
line 995
;995:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 996
;996:    if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $441
line 997
;997:      if (fadeOut) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $443
line 998
;998:        item->window.flags |= (WINDOW_FADINGOUT | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 36
BORI4
ASGNI4
line 999
;999:        item->window.flags &= ~WINDOW_FADINGIN;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1000
;1000:      } else {
ADDRGP4 $444
JUMPV
LABELV $443
line 1001
;1001:        item->window.flags |= (WINDOW_VISIBLE | WINDOW_FADINGIN);
ADDRLP4 20
CNSTI4 68
ASGNI4
ADDRLP4 24
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
BORI4
ASGNI4
line 1002
;1002:        item->window.flags &= ~WINDOW_FADINGOUT;
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 1003
;1003:      }
LABELV $444
line 1004
;1004:    }
LABELV $441
line 1005
;1005:  }
LABELV $438
line 994
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $440
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $437
line 1006
;1006:}
LABELV $436
endproc Menu_FadeItemByName 32 12
export Menus_FindByName
proc Menus_FindByName 8 8
line 1008
;1007:
;1008:menuDef_t *Menus_FindByName(const char *p) {
line 1010
;1009:  int i;
;1010:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $446
line 1011
;1011:    if (Q_stricmp(Menus[i].window.name, p) == 0) {
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+32
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
NEI4 $450
line 1012
;1012:      return &Menus[i];
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $445
JUMPV
LABELV $450
line 1014
;1013:    }
;1014:  }
LABELV $447
line 1010
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $449
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $446
line 1015
;1015:  return NULL;
CNSTP4 0
RETP4
LABELV $445
endproc Menus_FindByName 8 8
export Menus_ShowByName
proc Menus_ShowByName 8 4
line 1018
;1016:}
;1017:
;1018:void Menus_ShowByName(const char *p) {
line 1019
;1019:  menuDef_t *menu = Menus_FindByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1020
;1020:  if (menu) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $454
line 1021
;1021:    Menus_Activate(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 1022
;1022:  }
LABELV $454
line 1023
;1023:}
LABELV $453
endproc Menus_ShowByName 8 4
export Menus_OpenByName
proc Menus_OpenByName 0 4
line 1025
;1024:
;1025:void Menus_OpenByName(const char *p) {
line 1026
;1026:  Menus_ActivateByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 1027
;1027:}
LABELV $456
endproc Menus_OpenByName 0 4
proc Menu_RunCloseScript 548 8
line 1029
;1028:
;1029:static void Menu_RunCloseScript(menuDef_t *menu) {
line 1030
;1030:  if (menu && menu->window.flags & WINDOW_VISIBLE && menu->onClose) {
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
EQU4 $458
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $458
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $458
line 1032
;1031:    itemDef_t item;
;1032:    item.parent = menu;
ADDRLP4 8+228
ADDRFP4 0
INDIRP4
ASGNP4
line 1033
;1033:    Item_RunScript(&item, menu->onClose);
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1034
;1034:  }
LABELV $458
line 1035
;1035:}
LABELV $457
endproc Menu_RunCloseScript 548 8
export Menus_CloseByName
proc Menus_CloseByName 12 4
line 1037
;1036:
;1037:void Menus_CloseByName(const char *p) {
line 1038
;1038:  menuDef_t *menu = Menus_FindByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1039
;1039:  if (menu != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
line 1040
;1040:    Menu_RunCloseScript(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 1041
;1041:    menu->window.flags &= ~(WINDOW_VISIBLE | WINDOW_HASFOCUS);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 1042
;1042:  }
LABELV $462
line 1043
;1043:}
LABELV $461
endproc Menus_CloseByName 12 4
export Menus_CloseAll
proc Menus_CloseAll 8 4
line 1045
;1044:
;1045:void Menus_CloseAll( void ) {
line 1047
;1046:  int i;
;1047:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $465
line 1048
;1048:    Menu_RunCloseScript(&Menus[i]);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 1049
;1049:    Menus[i].window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 4
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+68
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 1050
;1050:  }
LABELV $466
line 1047
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $468
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $465
line 1051
;1051:}
LABELV $464
endproc Menus_CloseAll 8 4
export Script_Show
proc Script_Show 8 12
line 1054
;1052:
;1053:
;1054:void Script_Show(itemDef_t *item, char **args) {
line 1056
;1055:  const char *name;
;1056:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $471
line 1057
;1057:    Menu_ShowItemByName(item->parent, name, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1058
;1058:  }
LABELV $471
line 1059
;1059:}
LABELV $470
endproc Script_Show 8 12
export Script_Hide
proc Script_Hide 8 12
line 1061
;1060:
;1061:void Script_Hide(itemDef_t *item, char **args) {
line 1063
;1062:  const char *name;
;1063:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $474
line 1064
;1064:    Menu_ShowItemByName(item->parent, name, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1065
;1065:  }
LABELV $474
line 1066
;1066:}
LABELV $473
endproc Script_Hide 8 12
export Script_FadeIn
proc Script_FadeIn 8 12
line 1068
;1067:
;1068:void Script_FadeIn(itemDef_t *item, char **args) {
line 1070
;1069:  const char *name;
;1070:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $477
line 1071
;1071:    Menu_FadeItemByName(item->parent, name, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_FadeItemByName
CALLV
pop
line 1072
;1072:  }
LABELV $477
line 1073
;1073:}
LABELV $476
endproc Script_FadeIn 8 12
export Script_FadeOut
proc Script_FadeOut 8 12
line 1075
;1074:
;1075:void Script_FadeOut(itemDef_t *item, char **args) {
line 1077
;1076:  const char *name;
;1077:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $480
line 1078
;1078:    Menu_FadeItemByName(item->parent, name, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_FadeItemByName
CALLV
pop
line 1079
;1079:  }
LABELV $480
line 1080
;1080:}
LABELV $479
endproc Script_FadeOut 8 12
export Script_Open
proc Script_Open 8 8
line 1084
;1081:
;1082:
;1083:
;1084:void Script_Open(itemDef_t *item, char **args) {
line 1086
;1085:  const char *name;
;1086:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $483
line 1087
;1087:    Menus_OpenByName(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1088
;1088:  }
LABELV $483
line 1089
;1089:}
LABELV $482
endproc Script_Open 8 8
export Script_ConditionalOpen
proc Script_ConditionalOpen 32 8
line 1091
;1090:
;1091:void Script_ConditionalOpen(itemDef_t *item, char **args) {
line 1097
;1092:  const char *cvar;
;1093:  const char *name1;
;1094:  const char *name2;
;1095:  float           val;
;1096:
;1097:  if ( String_Parse(args, &cvar) && String_Parse(args, &name1) && String_Parse(args, &name2) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $486
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $486
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $486
line 1098
;1098:    val = DC->getCVarValue( cvar );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 1099
;1099:    if ( val == 0.f ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $488
line 1100
;1100:      Menus_OpenByName(name2);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1101
;1101:    } else {
ADDRGP4 $489
JUMPV
LABELV $488
line 1102
;1102:      Menus_OpenByName(name1);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1103
;1103:    }
LABELV $489
line 1104
;1104:  }
LABELV $486
line 1105
;1105:}
LABELV $485
endproc Script_ConditionalOpen 32 8
export Script_Close
proc Script_Close 8 8
line 1107
;1106:
;1107:void Script_Close(itemDef_t *item, char **args) {
line 1109
;1108:  const char *name;
;1109:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $491
line 1110
;1110:    Menus_CloseByName(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1111
;1111:  }
LABELV $491
line 1112
;1112:}
LABELV $490
endproc Script_Close 8 8
export Menu_TransitionItemByName
proc Menu_TransitionItemByName 56 12
line 1114
;1113:
;1114:void Menu_TransitionItemByName(menuDef_t *menu, const char *p, rectDef_t rectFrom, rectDef_t rectTo, int time, float amt) {
line 1117
;1115:  itemDef_t *item;
;1116:  int i;
;1117:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1118
;1118:  for (i = 0; i < count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $494
line 1119
;1119:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1120
;1120:    if (item != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 1121
;1121:      item->window.flags |= (WINDOW_INTRANSITION | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 260
BORI4
ASGNI4
line 1122
;1122:      item->window.offsetTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 1123
;1123:      memcpy(&item->window.rectClient, &rectFrom, sizeof(rectDef_t));
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1124
;1124:      memcpy(&item->window.rectEffects, &rectTo, sizeof(rectDef_t));
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1125
;1125:      item->window.rectEffects2.x = abs(rectTo.x - rectFrom.x) / amt;
ADDRFP4 12
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1126
;1126:      item->window.rectEffects2.y = abs(rectTo.y - rectFrom.y) / amt;
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 36
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1127
;1127:      item->window.rectEffects2.w = abs(rectTo.w - rectFrom.w) / amt;
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 44
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1128
;1128:      item->window.rectEffects2.h = abs(rectTo.h - rectFrom.h) / amt;
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 52
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 52
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1129
;1129:      Item_UpdatePosition(item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 1130
;1130:    }
LABELV $498
line 1131
;1131:  }
LABELV $495
line 1118
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $497
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $494
line 1132
;1132:}
LABELV $493
endproc Menu_TransitionItemByName 56 12
export Script_Transition
proc Script_Transition 96 24
line 1135
;1133:
;1134:
;1135:void Script_Transition(itemDef_t *item, char **args) {
line 1141
;1136:  const char *name;
;1137:  rectDef_t rectFrom, rectTo;
;1138:  int time;
;1139:  float amt;
;1140:
;1141:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $501
line 1142
;1142:    if ( Rect_Parse(args, &rectFrom) && Rect_Parse(args, &rectTo) && Int_Parse(args, &time) && Float_Parse(args, &amt)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 Rect_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $503
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 52
ADDRGP4 Rect_Parse
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $503
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 56
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $503
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 60
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $503
line 1143
;1143:      Menu_TransitionItemByName(item->parent, name, rectFrom, rectTo, time, amt);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRLP4 4
INDIRB
ASGNB 16
ADDRLP4 64
ARGP4
ADDRLP4 80
ADDRLP4 20
INDIRB
ASGNB 16
ADDRLP4 80
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 Menu_TransitionItemByName
CALLV
pop
line 1144
;1144:    }
LABELV $503
line 1145
;1145:  }
LABELV $501
line 1146
;1146:}
LABELV $500
endproc Script_Transition 96 24
export Menu_OrbitItemByName
proc Menu_OrbitItemByName 24 12
line 1149
;1147:
;1148:
;1149:void Menu_OrbitItemByName(menuDef_t *menu, const char *p, float x, float y, float cx, float cy, int time) {
line 1152
;1150:  itemDef_t *item;
;1151:  int i;
;1152:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1153
;1153:  for (i = 0; i < count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $506
line 1154
;1154:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1155
;1155:    if (item != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $510
line 1156
;1156:      item->window.flags |= (WINDOW_ORBITING | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 65540
BORI4
ASGNI4
line 1157
;1157:      item->window.offsetTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 1158
;1158:      item->window.rectEffects.x = cx;
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1159
;1159:      item->window.rectEffects.y = cy;
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 1160
;1160:      item->window.rectClient.x = x;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 1161
;1161:      item->window.rectClient.y = y;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 1162
;1162:      Item_UpdatePosition(item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 1163
;1163:    }
LABELV $510
line 1164
;1164:  }
LABELV $507
line 1153
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $509
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $506
line 1165
;1165:}
LABELV $505
endproc Menu_OrbitItemByName 24 12
export Script_Orbit
proc Script_Orbit 48 28
line 1168
;1166:
;1167:
;1168:void Script_Orbit(itemDef_t *item, char **args) {
line 1173
;1169:  const char *name;
;1170:  float cx, cy, x, y;
;1171:  int time;
;1172:
;1173:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $513
line 1174
;1174:    if ( Float_Parse(args, &x) && Float_Parse(args, &y) && Float_Parse(args, &cx) && Float_Parse(args, &cy) && Int_Parse(args, &time) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 44
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $515
line 1175
;1175:      Menu_OrbitItemByName(item->parent, name, x, y, cx, cy, time);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 Menu_OrbitItemByName
CALLV
pop
line 1176
;1176:    }
LABELV $515
line 1177
;1177:  }
LABELV $513
line 1178
;1178:}
LABELV $512
endproc Script_Orbit 48 28
export Script_SetFocus
proc Script_SetFocus 36 8
line 1182
;1179:
;1180:
;1181:
;1182:void Script_SetFocus(itemDef_t *item, char **args) {
line 1186
;1183:  const char *name;
;1184:  itemDef_t *focusItem;
;1185:
;1186:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $518
line 1187
;1187:    focusItem = Menu_FindItemByName(item->parent, name);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_FindItemByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1188
;1188:    if (focusItem && !(focusItem->window.flags & WINDOW_DECORATION) && !(focusItem->window.flags & WINDOW_HASFOCUS)) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $520
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $520
ADDRLP4 20
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $520
line 1189
;1189:      Menu_ClearFocus(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRGP4 Menu_ClearFocus
CALLP4
pop
line 1190
;1190:      focusItem->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1191
;1191:      if (focusItem->onFocus) {
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $522
line 1192
;1192:        Item_RunScript(focusItem, focusItem->onFocus);
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1193
;1193:      }
LABELV $522
line 1194
;1194:      if (DC->Assets.itemFocusSound) {
ADDRGP4 DC
INDIRP4
CNSTI4 61948
ADDP4
INDIRI4
CNSTI4 0
EQI4 $524
line 1195
;1195:        DC->startLocalSound( DC->Assets.itemFocusSound, CHAN_LOCAL_SOUND );
ADDRLP4 32
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 61948
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLV
pop
line 1196
;1196:      }
LABELV $524
line 1197
;1197:    }
LABELV $520
line 1198
;1198:  }
LABELV $518
line 1199
;1199:}
LABELV $517
endproc Script_SetFocus 36 8
export Script_SetPlayerModel
proc Script_SetPlayerModel 8 8
line 1201
;1200:
;1201:void Script_SetPlayerModel(itemDef_t *item, char **args) {
line 1203
;1202:  const char *name;
;1203:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $527
line 1204
;1204:    DC->setCVar("team_model", name);
ADDRGP4 $529
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 1205
;1205:  }
LABELV $527
line 1206
;1206:}
LABELV $526
endproc Script_SetPlayerModel 8 8
export Script_SetPlayerHead
proc Script_SetPlayerHead 8 8
line 1208
;1207:
;1208:void Script_SetPlayerHead(itemDef_t *item, char **args) {
line 1210
;1209:  const char *name;
;1210:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $531
line 1211
;1211:    DC->setCVar("team_headmodel", name);
ADDRGP4 $533
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 1212
;1212:  }
LABELV $531
line 1213
;1213:}
LABELV $530
endproc Script_SetPlayerHead 8 8
export Script_SetCvar
proc Script_SetCvar 16 8
line 1215
;1214:
;1215:void Script_SetCvar(itemDef_t *item, char **args) {
line 1217
;1216:  const char *cvar, *val;
;1217:  if (String_Parse(args, &cvar) && String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $535
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $535
line 1218
;1218:    DC->setCVar(cvar, val);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 1219
;1219:  }
LABELV $535
line 1221
;1220:
;1221:}
LABELV $534
endproc Script_SetCvar 16 8
export Script_Exec
proc Script_Exec 12 8
line 1223
;1222:
;1223:void Script_Exec(itemDef_t *item, char **args) {
line 1225
;1224:  const char *val;
;1225:  if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $538
line 1226
;1226:    DC->executeText(EXEC_APPEND, va("%s ; ", val));
ADDRGP4 $540
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 1227
;1227:  }
LABELV $538
line 1228
;1228:}
LABELV $537
endproc Script_Exec 12 8
export Script_Play
proc Script_Play 12 8
line 1230
;1229:
;1230:void Script_Play(itemDef_t *item, char **args) {
line 1232
;1231:  const char *val;
;1232:  if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $542
line 1233
;1233:    DC->startLocalSound(DC->registerSound(val, qfalse), CHAN_LOCAL_SOUND);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLV
pop
line 1234
;1234:  }
LABELV $542
line 1235
;1235:}
LABELV $541
endproc Script_Play 12 8
export Script_playLooped
proc Script_playLooped 12 8
line 1237
;1236:
;1237:void Script_playLooped(itemDef_t *item, char **args) {
line 1239
;1238:  const char *val;
;1239:  if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $545
line 1240
;1240:    DC->stopBackgroundTrack();
ADDRGP4 DC
INDIRP4
CNSTI4 176
ADDP4
INDIRP4
CALLV
pop
line 1241
;1241:    DC->startBackgroundTrack(val, val);
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 172
ADDP4
INDIRP4
CALLV
pop
line 1242
;1242:  }
LABELV $545
line 1243
;1243:}
LABELV $544
endproc Script_playLooped 12 8
data
export commandList
align 4
LABELV commandList
address $547
address Script_FadeIn
address $548
address Script_FadeOut
address $549
address Script_Show
address $550
address Script_Hide
address $551
address Script_SetColor
address $552
address Script_Open
address $553
address Script_ConditionalOpen
address $554
address Script_Close
address $555
address Script_SetAsset
address $556
address Script_SetBackground
address $557
address Script_SetItemColor
address $558
address Script_SetTeamColor
address $559
address Script_SetFocus
address $560
address Script_SetPlayerModel
address $561
address Script_SetPlayerHead
address $562
address Script_Transition
address $563
address Script_SetCvar
address $564
address Script_Exec
address $565
address Script_Play
address $566
address Script_playLooped
address $567
address Script_Orbit
export scriptCommandCount
align 4
LABELV scriptCommandCount
byte 4 21
export Item_RunScript
code
proc Item_RunScript 1060 12
line 1274
;1244:
;1245:
;1246:commandDef_t commandList[] =
;1247:{
;1248:  {"fadein", &Script_FadeIn},                   // group/name
;1249:  {"fadeout", &Script_FadeOut},                 // group/name
;1250:  {"show", &Script_Show},                       // group/name
;1251:  {"hide", &Script_Hide},                       // group/name
;1252:  {"setcolor", &Script_SetColor},               // works on this
;1253:  {"open", &Script_Open},                       // menu
;1254:  {"conditionalopen", &Script_ConditionalOpen}, // menu
;1255:  {"close", &Script_Close},                     // menu
;1256:  {"setasset", &Script_SetAsset},               // works on this
;1257:  {"setbackground", &Script_SetBackground},     // works on this
;1258:  {"setitemcolor", &Script_SetItemColor},       // group/name
;1259:  {"setteamcolor", &Script_SetTeamColor},       // sets this background color to team color
;1260:  {"setfocus", &Script_SetFocus},               // sets this background color to team color
;1261:  {"setplayermodel", &Script_SetPlayerModel},   // sets this background color to team color
;1262:  {"setplayerhead", &Script_SetPlayerHead},     // sets this background color to team color
;1263:  {"transition", &Script_Transition},           // group/name
;1264:  {"setcvar", &Script_SetCvar},           // group/name
;1265:  {"exec", &Script_Exec},           // group/name
;1266:  {"play", &Script_Play},           // group/name
;1267:  {"playlooped", &Script_playLooped},           // group/name
;1268:  {"orbit", &Script_Orbit}                      // group/name
;1269:};
;1270:
;1271:int scriptCommandCount = sizeof(commandList) / sizeof(commandDef_t);
;1272:
;1273:
;1274:void Item_RunScript(itemDef_t *item, const char *s) {
line 1278
;1275:  char script[1024], *p;
;1276:  int i;
;1277:  qboolean bRan;
;1278:  memset(script, 0, sizeof(script));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1279
;1279:  if (item && s && s[0]) {
ADDRLP4 1036
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $569
ADDRLP4 1040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $569
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $569
line 1280
;1280:    Q_strcat(script, 1024, s);
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1281
;1281:    p = script;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $572
JUMPV
LABELV $571
line 1282
;1282:    while (1) {
line 1285
;1283:      const char *command;
;1284:      // expect command then arguments, ; ends command, NULL ends script
;1285:      if (!String_Parse(&p, &command)) {
ADDRLP4 8
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1048
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $574
line 1286
;1286:        return;
ADDRGP4 $568
JUMPV
LABELV $574
line 1289
;1287:      }
;1288:
;1289:      if (command[0] == ';' && command[1] == '\0') {
ADDRLP4 1052
ADDRLP4 1044
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $576
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $576
line 1290
;1290:        continue;
ADDRGP4 $572
JUMPV
LABELV $576
line 1293
;1291:      }
;1292:
;1293:      bRan = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1294
;1294:      for (i = 0; i < scriptCommandCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $581
JUMPV
LABELV $578
line 1295
;1295:        if (Q_stricmp(command, commandList[i].name) == 0) {
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $582
line 1296
;1296:          (commandList[i].handler(item, &p));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList+4
ADDP4
INDIRP4
CALLV
pop
line 1297
;1297:          bRan = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1298
;1298:          break;
ADDRGP4 $580
JUMPV
LABELV $582
line 1300
;1299:        }
;1300:      }
LABELV $579
line 1294
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $581
ADDRLP4 0
INDIRI4
ADDRGP4 scriptCommandCount
INDIRI4
LTI4 $578
LABELV $580
line 1302
;1301:      // not in our auto list, pass to handler
;1302:      if (!bRan) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $585
line 1303
;1303:        DC->runScript(&p);
ADDRLP4 8
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 80
ADDP4
INDIRP4
CALLV
pop
line 1304
;1304:      }
LABELV $585
line 1305
;1305:    }
LABELV $572
line 1282
ADDRGP4 $571
JUMPV
line 1306
;1306:  }
LABELV $569
line 1307
;1307:}
LABELV $568
endproc Item_RunScript 1060 12
export Item_EnableShowViaCvar
proc Item_EnableShowViaCvar 2088 12
line 1310
;1308:
;1309:
;1310:qboolean Item_EnableShowViaCvar(itemDef_t *item, int flag) {
line 1312
;1311:  char script[1024], *p;
;1312:  memset(script, 0, sizeof(script));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1313
;1313:  if (item && item->enableCvar && *item->enableCvar && item->cvarTest && *item->cvarTest) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
CNSTU4 0
ASGNU4
ADDRLP4 1028
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $588
ADDRLP4 1036
ADDRLP4 1028
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $588
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1040
INDIRI4
EQI4 $588
ADDRLP4 1044
ADDRLP4 1028
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $588
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1040
INDIRI4
EQI4 $588
line 1315
;1314:    char buff[1024];
;1315:    DC->getCVarString(item->cvarTest, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 1317
;1316:
;1317:    Q_strcat(script, 1024, item->enableCvar);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1318
;1318:    p = script;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $591
JUMPV
LABELV $590
line 1319
;1319:    while (1) {
line 1322
;1320:      const char *val;
;1321:      // expect value then ; or NULL, NULL ends list
;1322:      if (!String_Parse(&p, &val)) {
ADDRLP4 0
ARGP4
ADDRLP4 2072
ARGP4
ADDRLP4 2076
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $593
line 1323
;1323:        return (item->cvarFlags & flag) ? qfalse : qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $596
ADDRLP4 2080
CNSTI4 0
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $596
ADDRLP4 2080
CNSTI4 1
ASGNI4
LABELV $597
ADDRLP4 2080
INDIRI4
RETI4
ADDRGP4 $587
JUMPV
LABELV $593
line 1326
;1324:      }
;1325:
;1326:      if (val[0] == ';' && val[1] == '\0') {
ADDRLP4 2080
ADDRLP4 2072
INDIRP4
ASGNP4
ADDRLP4 2080
INDIRP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $598
ADDRLP4 2080
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $598
line 1327
;1327:        continue;
ADDRGP4 $591
JUMPV
LABELV $598
line 1331
;1328:      }
;1329:
;1330:      // enable it if any of the values are true
;1331:      if (item->cvarFlags & flag) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $600
line 1332
;1332:        if (Q_stricmp(buff, val) == 0) {
ADDRLP4 1048
ARGP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $601
line 1333
;1333:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $587
JUMPV
line 1335
;1334:        }
;1335:      } else {
LABELV $600
line 1337
;1336:        // disable it if any of the values are true
;1337:        if (Q_stricmp(buff, val) == 0) {
ADDRLP4 1048
ARGP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $604
line 1338
;1338:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $587
JUMPV
LABELV $604
line 1340
;1339:        }
;1340:      }
LABELV $601
line 1342
;1341:
;1342:    }
LABELV $591
line 1319
ADDRGP4 $590
JUMPV
line 1343
;1343:    return (item->cvarFlags & flag) ? qfalse : qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $607
ADDRLP4 2072
CNSTI4 0
ASGNI4
ADDRGP4 $608
JUMPV
LABELV $607
ADDRLP4 2072
CNSTI4 1
ASGNI4
LABELV $608
ADDRLP4 2072
INDIRI4
RETI4
ADDRGP4 $587
JUMPV
LABELV $588
line 1345
;1344:  }
;1345:  return qtrue;
CNSTI4 1
RETI4
LABELV $587
endproc Item_EnableShowViaCvar 2088 12
export Item_SetFocus
proc Item_SetFocus 80 12
line 1350
;1346:}
;1347:
;1348:
;1349:// will optionaly set focus to this item
;1350:qboolean Item_SetFocus(itemDef_t *item, float x, float y) {
line 1353
;1351:  int i;
;1352:  itemDef_t *oldFocus;
;1353:  sfxHandle_t *sfx = &DC->Assets.itemFocusSound;
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 61948
ADDP4
ASGNP4
line 1354
;1354:  qboolean playSound = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1357
;1355:  menuDef_t *parent; // bk001206: = (menuDef_t*)item->parent;
;1356:  // sanity check, non-null, not a decoration and does not already have the focus
;1357:  if (item == NULL || item->window.flags & WINDOW_DECORATION || item->window.flags & WINDOW_HASFOCUS || !(item->window.flags & WINDOW_VISIBLE)) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $614
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $614
ADDRLP4 24
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $614
ADDRLP4 24
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $610
LABELV $614
line 1358
;1358:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $610
line 1362
;1359:  }
;1360:
;1361:  // bk001206 - this can be NULL.
;1362:  parent = (menuDef_t*)item->parent;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 1365
;1363:
;1364:  // items can be enabled and disabled based on cvars
;1365:  if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $615
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $615
line 1366
;1366:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $615
line 1369
;1367:  }
;1368:
;1369:  if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $617
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 44
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $617
line 1370
;1370:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $617
line 1373
;1371:  }
;1372:
;1373:  oldFocus = Menu_ClearFocus(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Menu_ClearFocus
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 48
INDIRP4
ASGNP4
line 1375
;1374:
;1375:  if (item->type == ITEM_TYPE_TEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $619
line 1377
;1376:    rectDef_t r;
;1377:    r = item->textRect;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRB
ASGNB 16
line 1378
;1378:    r.y -= r.h;
ADDRLP4 52+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 52+12
INDIRF4
SUBF4
ASGNF4
line 1379
;1379:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 52
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $623
line 1380
;1380:      item->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1381
;1381:      if (item->focusSound) {
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $625
line 1382
;1382:        sfx = &item->focusSound;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
line 1383
;1383:      }
LABELV $625
line 1384
;1384:      playSound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1385
;1385:    } else {
ADDRGP4 $620
JUMPV
LABELV $623
line 1386
;1386:      if (oldFocus) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $620
line 1387
;1387:        oldFocus->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 72
ADDRLP4 16
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1388
;1388:        if (oldFocus->onFocus) {
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $620
line 1389
;1389:          Item_RunScript(oldFocus, oldFocus->onFocus);
ADDRLP4 76
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1390
;1390:        }
line 1391
;1391:      }
line 1392
;1392:    }
line 1393
;1393:  } else {
ADDRGP4 $620
JUMPV
LABELV $619
line 1394
;1394:      item->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1395
;1395:    if (item->onFocus) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
line 1396
;1396:      Item_RunScript(item, item->onFocus);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1397
;1397:    }
LABELV $631
line 1398
;1398:    if (item->focusSound) {
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $633
line 1399
;1399:      sfx = &item->focusSound;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
line 1400
;1400:    }
LABELV $633
line 1401
;1401:    playSound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1402
;1402:  }
LABELV $620
line 1404
;1403:
;1404:  if (playSound && sfx) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $635
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $635
line 1405
;1405:    DC->startLocalSound( *sfx, CHAN_LOCAL_SOUND );
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLV
pop
line 1406
;1406:  }
LABELV $635
line 1408
;1407:
;1408:  for (i = 0; i < parent->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $637
line 1409
;1409:    if (parent->items[i] == item) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $641
line 1410
;1410:      parent->cursorItem = i;
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1411
;1411:      break;
ADDRGP4 $639
JUMPV
LABELV $641
line 1413
;1412:    }
;1413:  }
LABELV $638
line 1408
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $640
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $637
LABELV $639
line 1415
;1414:
;1415:  return qtrue;
CNSTI4 1
RETI4
LABELV $609
endproc Item_SetFocus 80 12
export Item_ListBox_MaxScroll
proc Item_ListBox_MaxScroll 16 4
line 1418
;1416:}
;1417:
;1418:int Item_ListBox_MaxScroll(itemDef_t *item) {
line 1419
;1419:  listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1420
;1420:  int count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1423
;1421:  int max;
;1422:
;1423:  if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $644
line 1424
;1424:    max = count - (item->window.rect.w / listPtr->elementWidth) + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1425
;1425:  }
ADDRGP4 $645
JUMPV
LABELV $644
line 1426
;1426:  else {
line 1427
;1427:    max = count - (item->window.rect.h / listPtr->elementHeight) + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1428
;1428:  }
LABELV $645
line 1429
;1429:  if (max < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $646
line 1430
;1430:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $646
line 1432
;1431:  }
;1432:  return max;
ADDRLP4 0
INDIRI4
RETI4
LABELV $643
endproc Item_ListBox_MaxScroll 16 4
export Item_ListBox_ThumbPosition
proc Item_ListBox_ThumbPosition 20 4
line 1435
;1433:}
;1434:
;1435:int Item_ListBox_ThumbPosition(itemDef_t *item) {
line 1437
;1436:  float max, pos, size;
;1437:  listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1439
;1438:
;1439:  max = Item_ListBox_MaxScroll(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CVIF4 4
ASGNF4
line 1440
;1440:  if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $649
line 1441
;1441:    size = item->window.rect.w - (SCROLLBAR_SIZE * 2) - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1442
;1442:    if (max > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $651
line 1443
;1443:      pos = (size-SCROLLBAR_SIZE) / (float) max;
ADDRLP4 0
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 1444
;1444:    } else {
ADDRGP4 $652
JUMPV
LABELV $651
line 1445
;1445:      pos = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1446
;1446:    }
LABELV $652
line 1447
;1447:    pos *= listPtr->startPos;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1448
;1448:    return item->window.rect.x + 1 + SCROLLBAR_SIZE + pos;
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1098907648
ADDF4
ADDRLP4 0
INDIRF4
ADDF4
CVFI4 4
RETI4
ADDRGP4 $648
JUMPV
LABELV $649
line 1450
;1449:  }
;1450:  else {
line 1451
;1451:    size = item->window.rect.h - (SCROLLBAR_SIZE * 2) - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1452
;1452:    if (max > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $653
line 1453
;1453:      pos = (size-SCROLLBAR_SIZE) / (float) max;
ADDRLP4 0
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 1454
;1454:    } else {
ADDRGP4 $654
JUMPV
LABELV $653
line 1455
;1455:      pos = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1456
;1456:    }
LABELV $654
line 1457
;1457:    pos *= listPtr->startPos;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1458
;1458:    return item->window.rect.y + 1 + SCROLLBAR_SIZE + pos;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1098907648
ADDF4
ADDRLP4 0
INDIRF4
ADDF4
CVFI4 4
RETI4
LABELV $648
endproc Item_ListBox_ThumbPosition 20 4
export Item_ListBox_ThumbDrawPosition
proc Item_ListBox_ThumbDrawPosition 24 4
line 1462
;1459:  }
;1460:}
;1461:
;1462:int Item_ListBox_ThumbDrawPosition(itemDef_t *item) {
line 1465
;1463:  int min, max;
;1464:
;1465:  if (itemCapture == item) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $656
line 1466
;1466:    if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $658
line 1467
;1467:      min = item->window.rect.x + SCROLLBAR_SIZE + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1468
;1468:      max = item->window.rect.x + item->window.rect.w - 2*SCROLLBAR_SIZE - 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1107296256
SUBF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 1469
;1469:      if (DC->cursorx >= min + SCROLLBAR_SIZE/2 && DC->cursorx <= max + SCROLLBAR_SIZE/2) {
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 16
CNSTF4 1090519040
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
LTF4 $660
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
GTF4 $660
line 1470
;1470:        return DC->cursorx - SCROLLBAR_SIZE/2;
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
SUBF4
CVFI4 4
RETI4
ADDRGP4 $655
JUMPV
LABELV $660
line 1472
;1471:      }
;1472:      else {
line 1473
;1473:        return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $655
JUMPV
LABELV $658
line 1476
;1474:      }
;1475:    }
;1476:    else {
line 1477
;1477:      min = item->window.rect.y + SCROLLBAR_SIZE + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1478
;1478:      max = item->window.rect.y + item->window.rect.h - 2*SCROLLBAR_SIZE - 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
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
CNSTF4 1107296256
SUBF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 1479
;1479:      if (DC->cursory >= min + SCROLLBAR_SIZE/2 && DC->cursory <= max + SCROLLBAR_SIZE/2) {
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 16
CNSTF4 1090519040
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
LTF4 $662
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
GTF4 $662
line 1480
;1480:        return DC->cursory - SCROLLBAR_SIZE/2;
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
SUBF4
CVFI4 4
RETI4
ADDRGP4 $655
JUMPV
LABELV $662
line 1482
;1481:      }
;1482:      else {
line 1483
;1483:        return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $655
JUMPV
LABELV $656
line 1487
;1484:      }
;1485:    }
;1486:  }
;1487:  else {
line 1488
;1488:    return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $655
endproc Item_ListBox_ThumbDrawPosition 24 4
export Item_Slider_ThumbPosition
proc Item_Slider_ThumbPosition 28 4
line 1492
;1489:  }
;1490:}
;1491:
;1492:float Item_Slider_ThumbPosition(itemDef_t *item) {
line 1494
;1493:  float value, range, x;
;1494:  editFieldDef_t *editDef = item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1496
;1495:
;1496:  if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $665
line 1497
;1497:    x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1498
;1498:  } else {
ADDRGP4 $666
JUMPV
LABELV $665
line 1499
;1499:    x = item->window.rect.x;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1500
;1500:  }
LABELV $666
line 1502
;1501:
;1502:  if (editDef == NULL && item->cvar) {
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $667
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $667
line 1503
;1503:    return x;
ADDRLP4 8
INDIRF4
RETF4
ADDRGP4 $664
JUMPV
LABELV $667
line 1506
;1504:  }
;1505:
;1506:  value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1508
;1507:
;1508:  if (value < editDef->minVal) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
GEF4 $669
line 1509
;1509:    value = editDef->minVal;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
line 1510
;1510:  } else if (value > editDef->maxVal) {
ADDRGP4 $670
JUMPV
LABELV $669
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
LEF4 $671
line 1511
;1511:    value = editDef->maxVal;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1512
;1512:  }
LABELV $671
LABELV $670
line 1514
;1513:
;1514:  range = editDef->maxVal - editDef->minVal;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1515
;1515:  value -= editDef->minVal;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1516
;1516:  value /= range;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
DIVF4
ASGNF4
line 1518
;1517:  //value /= (editDef->maxVal - editDef->minVal);
;1518:  value *= SLIDER_WIDTH;
ADDRLP4 0
CNSTF4 1119879168
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1519
;1519:  x += value;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 1522
;1520:  // vm fuckage
;1521:  //x = x + (((float)value / editDef->maxVal) * SLIDER_WIDTH);
;1522:  return x;
ADDRLP4 8
INDIRF4
RETF4
LABELV $664
endproc Item_Slider_ThumbPosition 28 4
export Item_Slider_OverSlider
proc Item_Slider_OverSlider 24 12
line 1525
;1523:}
;1524:
;1525:int Item_Slider_OverSlider(itemDef_t *item, float x, float y) {
line 1528
;1526:  rectDef_t r;
;1527:
;1528:  r.x = Item_Slider_ThumbPosition(item) - (SLIDER_THUMB_WIDTH / 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Item_Slider_ThumbPosition
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CNSTF4 1086324736
SUBF4
ASGNF4
line 1529
;1529:  r.y = item->window.rect.y - 2;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1530
;1530:  r.w = SLIDER_THUMB_WIDTH;
ADDRLP4 0+8
CNSTF4 1094713344
ASGNF4
line 1531
;1531:  r.h = SLIDER_THUMB_HEIGHT;
ADDRLP4 0+12
CNSTF4 1101004800
ASGNF4
line 1533
;1532:
;1533:  if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $677
line 1534
;1534:    return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $673
JUMPV
LABELV $677
line 1536
;1535:  }
;1536:  return 0;
CNSTI4 0
RETI4
LABELV $673
endproc Item_Slider_OverSlider 24 12
export Item_ListBox_OverLB
proc Item_ListBox_OverLB 72 12
line 1539
;1537:}
;1538:
;1539:int Item_ListBox_OverLB(itemDef_t *item, float x, float y) {
line 1545
;1540:  rectDef_t r;
;1541:  listBoxDef_t *listPtr;
;1542:  int thumbstart;
;1543:  int count;
;1544:
;1545:  count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 1546
;1546:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1547
;1547:  if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $680
line 1549
;1548:    // check if on left arrow
;1549:    r.x = item->window.rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1550
;1550:    r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1551
;1551:    r.h = r.w = SCROLLBAR_SIZE;
ADDRLP4 36
CNSTF4 1098907648
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
ASGNF4
line 1552
;1552:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $685
line 1553
;1553:      return WINDOW_LB_LEFTARROW;
CNSTI4 2048
RETI4
ADDRGP4 $679
JUMPV
LABELV $685
line 1556
;1554:    }
;1555:    // check if on right arrow
;1556:    r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1557
;1557:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $687
line 1558
;1558:      return WINDOW_LB_RIGHTARROW;
CNSTI4 4096
RETI4
ADDRGP4 $679
JUMPV
LABELV $687
line 1561
;1559:    }
;1560:    // check if on thumb
;1561:    thumbstart = Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 52
INDIRI4
ASGNI4
line 1562
;1562:    r.x = thumbstart;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CVIF4 4
ASGNF4
line 1563
;1563:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $689
line 1564
;1564:      return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $679
JUMPV
LABELV $689
line 1566
;1565:    }
;1566:    r.x = item->window.rect.x + SCROLLBAR_SIZE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1567
;1567:    r.w = thumbstart - r.x;
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 1568
;1568:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $692
line 1569
;1569:      return WINDOW_LB_PGUP;
CNSTI4 16384
RETI4
ADDRGP4 $679
JUMPV
LABELV $692
line 1571
;1570:    }
;1571:    r.x = thumbstart + SCROLLBAR_SIZE;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1572
;1572:    r.w = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1573
;1573:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $681
line 1574
;1574:      return WINDOW_LB_PGDN;
CNSTI4 32768
RETI4
ADDRGP4 $679
JUMPV
line 1576
;1575:    }
;1576:  } else {
LABELV $680
line 1577
;1577:    r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1578
;1578:    r.y = item->window.rect.y;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1579
;1579:    r.h = r.w = SCROLLBAR_SIZE;
ADDRLP4 36
CNSTF4 1098907648
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
ASGNF4
line 1580
;1580:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $700
line 1581
;1581:      return WINDOW_LB_LEFTARROW;
CNSTI4 2048
RETI4
ADDRGP4 $679
JUMPV
LABELV $700
line 1583
;1582:    }
;1583:    r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1584
;1584:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $703
line 1585
;1585:      return WINDOW_LB_RIGHTARROW;
CNSTI4 4096
RETI4
ADDRGP4 $679
JUMPV
LABELV $703
line 1587
;1586:    }
;1587:    thumbstart = Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 52
INDIRI4
ASGNI4
line 1588
;1588:    r.y = thumbstart;
ADDRLP4 0+4
ADDRLP4 16
INDIRI4
CVIF4 4
ASGNF4
line 1589
;1589:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $706
line 1590
;1590:      return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $679
JUMPV
LABELV $706
line 1592
;1591:    }
;1592:    r.y = item->window.rect.y + SCROLLBAR_SIZE;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1593
;1593:    r.h = thumbstart - r.y;
ADDRLP4 0+12
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
line 1594
;1594:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $711
line 1595
;1595:      return WINDOW_LB_PGUP;
CNSTI4 16384
RETI4
ADDRGP4 $679
JUMPV
LABELV $711
line 1597
;1596:    }
;1597:    r.y = thumbstart + SCROLLBAR_SIZE;
ADDRLP4 0+4
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1598
;1598:    r.h = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+12
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1599
;1599:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $715
line 1600
;1600:      return WINDOW_LB_PGDN;
CNSTI4 32768
RETI4
ADDRGP4 $679
JUMPV
LABELV $715
line 1602
;1601:    }
;1602:  }
LABELV $681
line 1603
;1603:  return 0;
CNSTI4 0
RETI4
LABELV $679
endproc Item_ListBox_OverLB 72 12
export Item_ListBox_MouseEnter
proc Item_ListBox_MouseEnter 56 12
line 1608
;1604:}
;1605:
;1606:
;1607:void Item_ListBox_MouseEnter(itemDef_t *item, float x, float y)
;1608:{
line 1610
;1609:  rectDef_t r;
;1610:  listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1612
;1611:
;1612:  item->window.flags &= ~(WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -63489
BANDI4
ASGNI4
line 1613
;1613:  item->window.flags |= Item_ListBox_OverLB(item, x, y);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Item_ListBox_OverLB
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
BORI4
ASGNI4
line 1615
;1614:
;1615:  if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $718
line 1616
;1616:    if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 63488
BANDI4
CNSTI4 0
NEI4 $719
line 1618
;1617:      // check for selection hit as we have exausted buttons and thumb
;1618:      if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $719
line 1619
;1619:        r.x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1620
;1620:        r.y = item->window.rect.y;
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1621
;1621:        r.h = item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 4+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1622
;1622:        r.w = item->window.rect.w - listPtr->drawPadding;
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1623
;1623:        if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $719
line 1624
;1624:          listPtr->cursorPos =  (int)((x - r.x) / listPtr->elementWidth)  + listPtr->startPos;
ADDRLP4 44
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
CVFI4 4
ADDRLP4 44
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 1625
;1625:          if (listPtr->cursorPos >= listPtr->endPos) {
ADDRLP4 48
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $719
line 1626
;1626:            listPtr->cursorPos = listPtr->endPos;
ADDRLP4 52
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1627
;1627:          }
line 1628
;1628:        }
line 1629
;1629:      } else {
line 1631
;1630:        // text hit..
;1631:      }
line 1632
;1632:    }
line 1633
;1633:  } else if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
ADDRGP4 $719
JUMPV
LABELV $718
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 63488
BANDI4
CNSTI4 0
NEI4 $731
line 1634
;1634:    r.x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1635
;1635:    r.y = item->window.rect.y;
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1636
;1636:    r.w = item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1637
;1637:    r.h = item->window.rect.h - listPtr->drawPadding;
ADDRLP4 4+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1638
;1638:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $736
line 1639
;1639:      listPtr->cursorPos =  (int)((y - 2 - r.y) / listPtr->elementHeight)  + listPtr->startPos;
ADDRLP4 40
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
SUBF4
ADDRLP4 4+4
INDIRF4
SUBF4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
CVFI4 4
ADDRLP4 40
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 1640
;1640:      if (listPtr->cursorPos > listPtr->endPos) {
ADDRLP4 44
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $739
line 1641
;1641:        listPtr->cursorPos = listPtr->endPos;
ADDRLP4 48
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1642
;1642:      }
LABELV $739
line 1643
;1643:    }
LABELV $736
line 1644
;1644:  }
LABELV $731
LABELV $719
line 1645
;1645:}
LABELV $717
endproc Item_ListBox_MouseEnter 56 12
export Item_MouseEnter
proc Item_MouseEnter 44 12
line 1647
;1646:
;1647:void Item_MouseEnter(itemDef_t *item, float x, float y) {
line 1649
;1648:  rectDef_t r;
;1649:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $742
line 1650
;1650:    r = item->textRect;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRB
ASGNB 16
line 1651
;1651:    r.y -= r.h;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
line 1655
;1652:    // in the text rect?
;1653:
;1654:    // items can be enabled and disabled based on cvars
;1655:    if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $746
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $746
line 1656
;1656:      return;
ADDRGP4 $741
JUMPV
LABELV $746
line 1659
;1657:    }
;1658:
;1659:    if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $748
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 28
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $748
line 1660
;1660:      return;
ADDRGP4 $741
JUMPV
LABELV $748
line 1663
;1661:    }
;1662:
;1663:    if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $750
line 1664
;1664:      if (!(item->window.flags & WINDOW_MOUSEOVERTEXT)) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $752
line 1665
;1665:        Item_RunScript(item, item->mouseEnterText);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 236
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1666
;1666:        item->window.flags |= WINDOW_MOUSEOVERTEXT;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1667
;1667:      }
LABELV $752
line 1668
;1668:      if (!(item->window.flags & WINDOW_MOUSEOVER)) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $751
line 1669
;1669:        Item_RunScript(item, item->mouseEnter);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1670
;1670:        item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1671
;1671:      }
line 1673
;1672:
;1673:    } else {
ADDRGP4 $751
JUMPV
LABELV $750
line 1675
;1674:      // not in the text rect
;1675:      if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $756
line 1677
;1676:        // if we were
;1677:        Item_RunScript(item, item->mouseExitText);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1678
;1678:        item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1679
;1679:      }
LABELV $756
line 1680
;1680:      if (!(item->window.flags & WINDOW_MOUSEOVER)) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $758
line 1681
;1681:        Item_RunScript(item, item->mouseEnter);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1682
;1682:        item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1683
;1683:      }
LABELV $758
line 1685
;1684:
;1685:      if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 6
NEI4 $760
line 1686
;1686:        Item_ListBox_MouseEnter(item, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 Item_ListBox_MouseEnter
CALLV
pop
line 1687
;1687:      }
LABELV $760
line 1688
;1688:    }
LABELV $751
line 1689
;1689:  }
LABELV $742
line 1690
;1690:}
LABELV $741
endproc Item_MouseEnter 44 12
export Item_MouseLeave
proc Item_MouseLeave 8 8
line 1692
;1691:
;1692:void Item_MouseLeave(itemDef_t *item) {
line 1693
;1693:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $763
line 1694
;1694:    if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $765
line 1695
;1695:      Item_RunScript(item, item->mouseExitText);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1696
;1696:      item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1697
;1697:    }
LABELV $765
line 1698
;1698:    Item_RunScript(item, item->mouseExit);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1699
;1699:    item->window.flags &= ~(WINDOW_LB_RIGHTARROW | WINDOW_LB_LEFTARROW);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -6145
BANDI4
ASGNI4
line 1700
;1700:  }
LABELV $763
line 1701
;1701:}
LABELV $762
endproc Item_MouseLeave 8 8
export Menu_HitTest
proc Menu_HitTest 8 12
line 1703
;1702:
;1703:itemDef_t *Menu_HitTest(menuDef_t *menu, float x, float y) {
line 1705
;1704:  int i;
;1705:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $771
JUMPV
LABELV $768
line 1706
;1706:    if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $772
line 1707
;1707:      return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $767
JUMPV
LABELV $772
line 1709
;1708:    }
;1709:  }
LABELV $769
line 1705
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $771
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $768
line 1710
;1710:  return NULL;
CNSTP4 0
RETP4
LABELV $767
endproc Menu_HitTest 8 12
export Item_SetMouseOver
proc Item_SetMouseOver 4 0
line 1713
;1711:}
;1712:
;1713:void Item_SetMouseOver(itemDef_t *item, qboolean focus) {
line 1714
;1714:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $775
line 1715
;1715:    if (focus) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $777
line 1716
;1716:      item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1717
;1717:    } else {
ADDRGP4 $778
JUMPV
LABELV $777
line 1718
;1718:      item->window.flags &= ~WINDOW_MOUSEOVER;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1719
;1719:    }
LABELV $778
line 1720
;1720:  }
LABELV $775
line 1721
;1721:}
LABELV $774
endproc Item_SetMouseOver 4 0
export Item_OwnerDraw_HandleKey
proc Item_OwnerDraw_HandleKey 12 16
line 1724
;1722:
;1723:
;1724:qboolean Item_OwnerDraw_HandleKey(itemDef_t *item, int key) {
line 1725
;1725:  if (item && DC->ownerDrawHandleKey) {
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $780
ADDRGP4 DC
INDIRP4
CNSTI4 116
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $780
line 1726
;1726:    return DC->ownerDrawHandleKey(item->window.ownerDraw, item->window.ownerDrawFlags, &item->special, key);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 116
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $779
JUMPV
LABELV $780
line 1728
;1727:  }
;1728:  return qfalse;
CNSTI4 0
RETI4
LABELV $779
endproc Item_OwnerDraw_HandleKey 12 16
export Item_ListBox_HandleKey
proc Item_ListBox_HandleKey 72 12
line 1731
;1729:}
;1730:
;1731:qboolean Item_ListBox_HandleKey(itemDef_t *item, int key, qboolean down, qboolean force) {
line 1732
;1732:  listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1733
;1733:  int count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 1736
;1734:  int max, viewmax;
;1735:
;1736:  if (force || (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $785
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $783
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $783
LABELV $785
line 1737
;1737:    max = Item_ListBox_MaxScroll(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 1738
;1738:    if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $786
line 1739
;1739:      viewmax = (item->window.rect.w / listPtr->elementWidth);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1740
;1740:      if ( key == K_LEFTARROW || key == K_KP_LEFTARROW )
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 134
EQI4 $790
ADDRLP4 36
INDIRI4
CNSTI4 163
NEI4 $788
LABELV $790
line 1741
;1741:      {
line 1742
;1742:        if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $791
line 1743
;1743:          listPtr->cursorPos--;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1744
;1744:          if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $793
line 1745
;1745:            listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1746
;1746:          }
LABELV $793
line 1747
;1747:          if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $795
line 1748
;1748:            listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1749
;1749:          }
LABELV $795
line 1750
;1750:          if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $797
line 1751
;1751:            listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1752
;1752:          }
LABELV $797
line 1753
;1753:          item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1754
;1754:          DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1755
;1755:        }
ADDRGP4 $792
JUMPV
LABELV $791
line 1756
;1756:        else {
line 1757
;1757:          listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1758
;1758:          if (listPtr->startPos < 0)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $799
line 1759
;1759:            listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $799
line 1760
;1760:        }
LABELV $792
line 1761
;1761:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $788
line 1763
;1762:      }
;1763:      if ( key == K_RIGHTARROW || key == K_KP_RIGHTARROW )
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 135
EQI4 $803
ADDRLP4 40
INDIRI4
CNSTI4 165
NEI4 $787
LABELV $803
line 1764
;1764:      {
line 1765
;1765:        if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $804
line 1766
;1766:          listPtr->cursorPos++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 12
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
line 1767
;1767:          if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $806
line 1768
;1768:            listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1769
;1769:          }
LABELV $806
line 1770
;1770:          if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $808
line 1771
;1771:            listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1772
;1772:          }
LABELV $808
line 1773
;1773:          if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $810
line 1774
;1774:            listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1775
;1775:          }
LABELV $810
line 1776
;1776:          item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1777
;1777:          DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1778
;1778:        }
ADDRGP4 $805
JUMPV
LABELV $804
line 1779
;1779:        else {
line 1780
;1780:          listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1781
;1781:          if (listPtr->startPos >= count)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $812
line 1782
;1782:            listPtr->startPos = count-1;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $812
line 1783
;1783:        }
LABELV $805
line 1784
;1784:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
line 1786
;1785:      }
;1786:    }
LABELV $786
line 1787
;1787:    else {
line 1788
;1788:      viewmax = (item->window.rect.h / listPtr->elementHeight);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1789
;1789:      if ( key == K_UPARROW || key == K_KP_UPARROW )
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 132
EQI4 $816
ADDRLP4 36
INDIRI4
CNSTI4 161
NEI4 $814
LABELV $816
line 1790
;1790:      {
line 1791
;1791:        if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $817
line 1792
;1792:          listPtr->cursorPos--;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1793
;1793:          if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $819
line 1794
;1794:            listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1795
;1795:          }
LABELV $819
line 1796
;1796:          if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $821
line 1797
;1797:            listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1798
;1798:          }
LABELV $821
line 1799
;1799:          if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $823
line 1800
;1800:            listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1801
;1801:          }
LABELV $823
line 1802
;1802:          item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1803
;1803:          DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1804
;1804:        }
ADDRGP4 $818
JUMPV
LABELV $817
line 1805
;1805:        else {
line 1806
;1806:          listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1807
;1807:          if (listPtr->startPos < 0)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $825
line 1808
;1808:            listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $825
line 1809
;1809:        }
LABELV $818
line 1810
;1810:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $814
line 1812
;1811:      }
;1812:      if ( key == K_DOWNARROW || key == K_KP_DOWNARROW )
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 133
EQI4 $829
ADDRLP4 40
INDIRI4
CNSTI4 167
NEI4 $827
LABELV $829
line 1813
;1813:      {
line 1814
;1814:        if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $830
line 1815
;1815:          listPtr->cursorPos++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 12
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
line 1816
;1816:          if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $832
line 1817
;1817:            listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1818
;1818:          }
LABELV $832
line 1819
;1819:          if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $834
line 1820
;1820:            listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1821
;1821:          }
LABELV $834
line 1822
;1822:          if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $836
line 1823
;1823:            listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1824
;1824:          }
LABELV $836
line 1825
;1825:          item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1826
;1826:          DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1827
;1827:        }
ADDRGP4 $831
JUMPV
LABELV $830
line 1828
;1828:        else {
line 1829
;1829:          listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1830
;1830:          if (listPtr->startPos > max)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $838
line 1831
;1831:            listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $838
line 1832
;1832:        }
LABELV $831
line 1833
;1833:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $827
line 1835
;1834:      }
;1835:    }
LABELV $787
line 1837
;1836:    // mouse hit
;1837:    if (key == K_MOUSE1 || key == K_MOUSE2) {
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 178
EQI4 $842
ADDRLP4 36
INDIRI4
CNSTI4 179
NEI4 $840
LABELV $842
line 1838
;1838:      if (item->window.flags & WINDOW_LB_LEFTARROW) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $843
line 1839
;1839:        listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1840
;1840:        if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $844
line 1841
;1841:          listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1842
;1842:        }
line 1843
;1843:      } else if (item->window.flags & WINDOW_LB_RIGHTARROW) {
ADDRGP4 $844
JUMPV
LABELV $843
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $847
line 1845
;1844:        // one down
;1845:        listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1846
;1846:        if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $848
line 1847
;1847:          listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1848
;1848:        }
line 1849
;1849:      } else if (item->window.flags & WINDOW_LB_PGUP) {
ADDRGP4 $848
JUMPV
LABELV $847
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $851
line 1851
;1850:        // page up
;1851:        listPtr->startPos -= viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1852
;1852:        if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $852
line 1853
;1853:          listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1854
;1854:        }
line 1855
;1855:      } else if (item->window.flags & WINDOW_LB_PGDN) {
ADDRGP4 $852
JUMPV
LABELV $851
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $855
line 1857
;1856:        // page down
;1857:        listPtr->startPos += viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1858
;1858:        if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $856
line 1859
;1859:          listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1860
;1860:        }
line 1861
;1861:      } else if (item->window.flags & WINDOW_LB_THUMB) {
ADDRGP4 $856
JUMPV
LABELV $855
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $859
line 1863
;1862:        // Display_SetCaptureItem(item);
;1863:      } else {
ADDRGP4 $860
JUMPV
LABELV $859
line 1865
;1864:        // select an item
;1865:        if (DC->realTime < lastListBoxClickTime && listPtr->doubleClick) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRGP4 lastListBoxClickTime
INDIRI4
GEI4 $861
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $861
line 1866
;1866:          Item_RunScript(item, listPtr->doubleClick);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1867
;1867:        }
LABELV $861
line 1868
;1868:        lastListBoxClickTime = DC->realTime + DOUBLE_CLICK_DELAY;
ADDRGP4 lastListBoxClickTime
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1869
;1869:        if (item->cursorPos != listPtr->cursorPos) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
EQI4 $863
line 1870
;1870:          item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1871
;1871:          DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1872
;1872:        }
LABELV $863
line 1873
;1873:      }
LABELV $860
LABELV $856
LABELV $852
LABELV $848
LABELV $844
line 1874
;1874:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $840
line 1878
;1875:    }
;1876:
;1877:    //TA: invoke the doubleClick handler when enter is pressed
;1878:    if( key == K_ENTER )
ADDRFP4 4
INDIRI4
CNSTI4 13
NEI4 $865
line 1879
;1879:    {
line 1880
;1880:      if( listPtr->doubleClick )
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $867
line 1881
;1881:        Item_RunScript( item, listPtr->doubleClick );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
LABELV $867
line 1883
;1882:
;1883:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $865
line 1886
;1884:    }
;1885:
;1886:    if ( key == K_HOME || key == K_KP_HOME) {
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 143
EQI4 $871
ADDRLP4 40
INDIRI4
CNSTI4 160
NEI4 $869
LABELV $871
line 1888
;1887:      // home
;1888:      listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1889
;1889:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $869
line 1891
;1890:    }
;1891:    if ( key == K_END || key == K_KP_END) {
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 144
EQI4 $874
ADDRLP4 44
INDIRI4
CNSTI4 166
NEI4 $872
LABELV $874
line 1893
;1892:      // end
;1893:      listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1894
;1894:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $872
line 1896
;1895:    }
;1896:    if (key == K_PGUP || key == K_KP_PGUP ) {
ADDRLP4 48
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 142
EQI4 $877
ADDRLP4 48
INDIRI4
CNSTI4 162
NEI4 $875
LABELV $877
line 1898
;1897:      // page up
;1898:      if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $878
line 1899
;1899:        listPtr->cursorPos -= viewmax;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1900
;1900:        if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $880
line 1901
;1901:          listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1902
;1902:        }
LABELV $880
line 1903
;1903:        if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $882
line 1904
;1904:          listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1905
;1905:        }
LABELV $882
line 1906
;1906:        if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $884
line 1907
;1907:          listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1908
;1908:        }
LABELV $884
line 1909
;1909:        item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1910
;1910:        DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1911
;1911:      }
ADDRGP4 $879
JUMPV
LABELV $878
line 1912
;1912:      else {
line 1913
;1913:        listPtr->startPos -= viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1914
;1914:        if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $886
line 1915
;1915:          listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1916
;1916:        }
LABELV $886
line 1917
;1917:      }
LABELV $879
line 1918
;1918:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $875
line 1920
;1919:    }
;1920:    if ( key == K_PGDN || key == K_KP_PGDN ) {
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 141
EQI4 $890
ADDRLP4 52
INDIRI4
CNSTI4 168
NEI4 $888
LABELV $890
line 1922
;1921:      // page down
;1922:      if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $891
line 1923
;1923:        listPtr->cursorPos += viewmax;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1924
;1924:        if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $893
line 1925
;1925:          listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1926
;1926:        }
LABELV $893
line 1927
;1927:        if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $895
line 1928
;1928:          listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1929
;1929:        }
LABELV $895
line 1930
;1930:        if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $897
line 1931
;1931:          listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1932
;1932:        }
LABELV $897
line 1933
;1933:        item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1934
;1934:        DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 1935
;1935:      }
ADDRGP4 $892
JUMPV
LABELV $891
line 1936
;1936:      else {
line 1937
;1937:        listPtr->startPos += viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1938
;1938:        if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $899
line 1939
;1939:          listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1940
;1940:        }
LABELV $899
line 1941
;1941:      }
LABELV $892
line 1942
;1942:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $782
JUMPV
LABELV $888
line 1944
;1943:    }
;1944:  }
LABELV $783
line 1945
;1945:  return qfalse;
CNSTI4 0
RETI4
LABELV $782
endproc Item_ListBox_HandleKey 72 12
export Item_YesNo_HandleKey
proc Item_YesNo_HandleKey 32 12
line 1948
;1946:}
;1947:
;1948:qboolean Item_YesNo_HandleKey(itemDef_t *item, int key) {
line 1950
;1949:
;1950:  if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS && item->cvar) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $902
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $902
ADDRLP4 12
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $902
line 1951
;1951:    if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 178
EQI4 $908
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $908
ADDRLP4 16
INDIRI4
CNSTI4 179
EQI4 $908
ADDRLP4 16
INDIRI4
CNSTI4 180
NEI4 $904
LABELV $908
line 1952
;1952:      DC->setCVar(item->cvar, va("%i", !DC->getCVarValue(item->cvar)));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $911
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $912
JUMPV
LABELV $911
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $912
ADDRGP4 $909
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 1953
;1953:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $901
JUMPV
LABELV $904
line 1955
;1954:    }
;1955:  }
LABELV $902
line 1957
;1956:
;1957:  return qfalse;
CNSTI4 0
RETI4
LABELV $901
endproc Item_YesNo_HandleKey 32 12
export Item_Multi_CountSettings
proc Item_Multi_CountSettings 4 0
line 1961
;1958:
;1959:}
;1960:
;1961:int Item_Multi_CountSettings(itemDef_t *item) {
line 1962
;1962:  multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1963
;1963:  if (multiPtr == NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $914
line 1964
;1964:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $913
JUMPV
LABELV $914
line 1966
;1965:  }
;1966:  return multiPtr->count;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
RETI4
LABELV $913
endproc Item_Multi_CountSettings 4 0
export Item_Multi_FindCvarByValue
proc Item_Multi_FindCvarByValue 1040 12
line 1969
;1967:}
;1968:
;1969:int Item_Multi_FindCvarByValue(itemDef_t *item) {
line 1971
;1970:  char buff[1024];
;1971:  float value = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1973
;1972:  int i;
;1973:  multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 1974
;1974:  if (multiPtr) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $917
line 1975
;1975:    if (multiPtr->strDef) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $919
line 1976
;1976:      DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 1977
;1977:    } else {
ADDRGP4 $920
JUMPV
LABELV $919
line 1978
;1978:      value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1036
INDIRF4
ASGNF4
line 1979
;1979:    }
LABELV $920
line 1980
;1980:    for (i = 0; i < multiPtr->count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $924
JUMPV
LABELV $921
line 1981
;1981:      if (multiPtr->strDef) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $925
line 1982
;1982:        if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $926
line 1983
;1983:          return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $916
JUMPV
line 1985
;1984:        }
;1985:      } else {
LABELV $925
line 1986
;1986:        if (multiPtr->cvarValue[i] == value) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $929
line 1987
;1987:          return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $916
JUMPV
LABELV $929
line 1989
;1988:        }
;1989:      }
LABELV $926
line 1990
;1990:    }
LABELV $922
line 1980
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $924
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
LTI4 $921
line 1991
;1991:  }
LABELV $917
line 1992
;1992:  return 0;
CNSTI4 0
RETI4
LABELV $916
endproc Item_Multi_FindCvarByValue 1040 12
export Item_Multi_Setting
proc Item_Multi_Setting 1040 12
line 1995
;1993:}
;1994:
;1995:const char *Item_Multi_Setting(itemDef_t *item) {
line 1997
;1996:  char buff[1024];
;1997:  float value = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1999
;1998:  int i;
;1999:  multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2000
;2000:  if (multiPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $932
line 2001
;2001:    if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $934
line 2002
;2002:      DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 2003
;2003:    } else {
ADDRGP4 $935
JUMPV
LABELV $934
line 2004
;2004:      value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1036
INDIRF4
ASGNF4
line 2005
;2005:    }
LABELV $935
line 2006
;2006:    for (i = 0; i < multiPtr->count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $939
JUMPV
LABELV $936
line 2007
;2007:      if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $940
line 2008
;2008:        if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $941
line 2009
;2009:          return multiPtr->cvarList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $931
JUMPV
line 2011
;2010:        }
;2011:      } else {
LABELV $940
line 2012
;2012:        if (multiPtr->cvarValue[i] == value) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $944
line 2013
;2013:          return multiPtr->cvarList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $931
JUMPV
LABELV $944
line 2015
;2014:        }
;2015:      }
LABELV $941
line 2016
;2016:    }
LABELV $937
line 2006
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $939
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
LTI4 $936
line 2017
;2017:  }
LABELV $932
line 2018
;2018:  return "";
ADDRGP4 $58
RETP4
LABELV $931
endproc Item_Multi_Setting 1040 12
export Item_Multi_HandleKey
proc Item_Multi_HandleKey 56 12
line 2021
;2019:}
;2020:
;2021:qboolean Item_Multi_HandleKey(itemDef_t *item, int key) {
line 2022
;2022:  multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2023
;2023:  if (multiPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $947
line 2024
;2024:    if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS && item->cvar) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $949
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $949
ADDRLP4 16
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $949
line 2025
;2025:      if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 178
EQI4 $955
ADDRLP4 20
INDIRI4
CNSTI4 13
EQI4 $955
ADDRLP4 20
INDIRI4
CNSTI4 179
EQI4 $955
ADDRLP4 20
INDIRI4
CNSTI4 180
NEI4 $951
LABELV $955
line 2026
;2026:        int current = Item_Multi_FindCvarByValue(item) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Item_Multi_FindCvarByValue
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2027
;2027:        int max = Item_Multi_CountSettings(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Item_Multi_CountSettings
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 2028
;2028:        if ( current < 0 || current >= max ) {
ADDRLP4 40
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $958
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $956
LABELV $958
line 2029
;2029:          current = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2030
;2030:        }
LABELV $956
line 2031
;2031:        if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $959
line 2032
;2032:          DC->setCVar(item->cvar, multiPtr->cvarStr[current]);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2033
;2033:        } else {
ADDRGP4 $960
JUMPV
LABELV $959
line 2034
;2034:          float value = multiPtr->cvarValue[current];
ADDRLP4 44
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ASGNF4
line 2035
;2035:          if (((float)((int) value)) == value) {
ADDRLP4 48
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 48
INDIRF4
CVFI4 4
CVIF4 4
ADDRLP4 48
INDIRF4
NEF4 $961
line 2036
;2036:            DC->setCVar(item->cvar, va("%i", (int) value ));
ADDRGP4 $909
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2037
;2037:          }
ADDRGP4 $962
JUMPV
LABELV $961
line 2038
;2038:          else {
line 2039
;2039:            DC->setCVar(item->cvar, va("%f", value ));
ADDRGP4 $963
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2040
;2040:          }
LABELV $962
line 2041
;2041:        }
LABELV $960
line 2042
;2042:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $946
JUMPV
LABELV $951
line 2044
;2043:      }
;2044:    }
LABELV $949
line 2045
;2045:  }
LABELV $947
line 2046
;2046:  return qfalse;
CNSTI4 0
RETI4
LABELV $946
endproc Item_Multi_HandleKey 56 12
export Item_TextField_HandleKey
proc Item_TextField_HandleKey 1076 12
line 2049
;2047:}
;2048:
;2049:qboolean Item_TextField_HandleKey(itemDef_t *item, int key) {
line 2052
;2050:  char buff[1024];
;2051:  int len;
;2052:  itemDef_t *newItem = NULL;
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 2053
;2053:  editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2055
;2054:
;2055:  if (item->cvar) {
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $965
line 2057
;2056:
;2057:    memset(buff, 0, sizeof(buff));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2058
;2058:    DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 2059
;2059:    len = strlen(buff);
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1036
INDIRI4
ASGNI4
line 2060
;2060:    if (editPtr->maxChars && len > editPtr->maxChars) {
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $967
ADDRLP4 1032
INDIRI4
ADDRLP4 1040
INDIRI4
LEI4 $967
line 2061
;2061:      len = editPtr->maxChars;
ADDRLP4 1032
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 2062
;2062:    }
LABELV $967
line 2063
;2063:    if ( key & K_CHAR_FLAG ) {
ADDRFP4 4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $969
line 2064
;2064:      key &= ~K_CHAR_FLAG;
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2067
;2065:
;2066:
;2067:      if (key == 'h' - 'a' + 1 )  { // ctrl-h is backspace
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $971
line 2068
;2068:        if ( item->cursorPos > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
LEI4 $973
line 2069
;2069:          memmove( &buff[item->cursorPos - 1], &buff[item->cursorPos], len + 1 - item->cursorPos);
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRLP4 4-1
ADDP4
ARGP4
ADDRLP4 1044
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2070
;2070:          item->cursorPos--;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2071
;2071:          if (item->cursorPos < editPtr->paintOffset) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
GEI4 $976
line 2072
;2072:            editPtr->paintOffset--;
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2073
;2073:          }
LABELV $976
line 2074
;2074:        }
LABELV $973
line 2075
;2075:        DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2076
;2076:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $971
line 2083
;2077:      }
;2078:
;2079:
;2080:      //
;2081:      // ignore any non printable chars
;2082:      //
;2083:      if ( key < 32 || !item->cvar) {
ADDRFP4 4
INDIRI4
CNSTI4 32
LTI4 $980
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $978
LABELV $980
line 2084
;2084:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $978
line 2087
;2085:        }
;2086:
;2087:      if (item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 9
NEI4 $981
line 2088
;2088:        if (key < '0' || key > '9') {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 48
LTI4 $985
ADDRLP4 1044
INDIRI4
CNSTI4 57
LEI4 $983
LABELV $985
line 2089
;2089:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $964
JUMPV
LABELV $983
line 2091
;2090:        }
;2091:      }
LABELV $981
line 2093
;2092:
;2093:      if (!DC->getOverstrikeMode()) {
ADDRLP4 1044
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $986
line 2094
;2094:        if (( len == MAX_EDITFIELD - 1 ) || (editPtr->maxChars && len >= editPtr->maxChars)) {
ADDRLP4 1048
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 255
EQI4 $990
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $988
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $988
LABELV $990
line 2095
;2095:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $988
line 2097
;2096:        }
;2097:        memmove( &buff[item->cursorPos + 1], &buff[item->cursorPos], len + 1 - item->cursorPos );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRLP4 4+1
ADDP4
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 1056
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2098
;2098:      } else {
ADDRGP4 $987
JUMPV
LABELV $986
line 2099
;2099:        if (editPtr->maxChars && item->cursorPos >= editPtr->maxChars) {
ADDRLP4 1048
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $992
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $992
line 2100
;2100:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $992
line 2102
;2101:        }
;2102:      }
LABELV $987
line 2104
;2103:
;2104:      buff[item->cursorPos] = key;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 4
ADDP4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 2106
;2105:
;2106:      DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2108
;2107:
;2108:      if (item->cursorPos < len + 1) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
GEI4 $970
line 2109
;2109:        item->cursorPos++;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2110
;2110:        if (editPtr->maxPaintChars && item->cursorPos > editPtr->maxPaintChars) {
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $970
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $970
line 2111
;2111:          editPtr->paintOffset++;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2112
;2112:        }
line 2113
;2113:      }
line 2115
;2114:
;2115:    } else {
ADDRGP4 $970
JUMPV
LABELV $969
line 2117
;2116:
;2117:      if ( key == K_DEL || key == K_KP_DEL ) {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 140
EQI4 $1000
ADDRLP4 1044
INDIRI4
CNSTI4 171
NEI4 $998
LABELV $1000
line 2118
;2118:        if ( item->cursorPos < len ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1001
line 2119
;2119:          memmove( buff + item->cursorPos, buff + item->cursorPos + 1, len - item->cursorPos);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1048
INDIRI4
ADDRLP4 4+1
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2120
;2120:          DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2121
;2121:        }
LABELV $1001
line 2122
;2122:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $998
line 2125
;2123:      }
;2124:
;2125:      if ( key == K_RIGHTARROW || key == K_KP_RIGHTARROW )
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 135
EQI4 $1006
ADDRLP4 1048
INDIRI4
CNSTI4 165
NEI4 $1004
LABELV $1006
line 2126
;2126:      {
line 2127
;2127:        if (editPtr->maxPaintChars && item->cursorPos >= editPtr->maxPaintChars && item->cursorPos < len) {
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1007
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $1007
ADDRLP4 1056
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1007
line 2128
;2128:          item->cursorPos++;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2129
;2129:          editPtr->paintOffset++;
ADDRLP4 1064
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
ADDRLP4 1064
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2130
;2130:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1007
line 2132
;2131:        }
;2132:        if (item->cursorPos < len) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1009
line 2133
;2133:          item->cursorPos++;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2134
;2134:        }
LABELV $1009
line 2135
;2135:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1004
line 2138
;2136:      }
;2137:
;2138:      if ( key == K_LEFTARROW || key == K_KP_LEFTARROW )
ADDRLP4 1052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 134
EQI4 $1013
ADDRLP4 1052
INDIRI4
CNSTI4 163
NEI4 $1011
LABELV $1013
line 2139
;2139:      {
line 2140
;2140:        if ( item->cursorPos > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1014
line 2141
;2141:          item->cursorPos--;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2142
;2142:        }
LABELV $1014
line 2143
;2143:        if (item->cursorPos < editPtr->paintOffset) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
GEI4 $1016
line 2144
;2144:          editPtr->paintOffset--;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2145
;2145:        }
LABELV $1016
line 2146
;2146:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1011
line 2149
;2147:      }
;2148:
;2149:      if ( key == K_HOME || key == K_KP_HOME) {// || ( tolower(key) == 'a' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 1056
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 143
EQI4 $1020
ADDRLP4 1056
INDIRI4
CNSTI4 160
NEI4 $1018
LABELV $1020
line 2150
;2150:        item->cursorPos = 0;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2151
;2151:        editPtr->paintOffset = 0;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 2152
;2152:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1018
line 2155
;2153:      }
;2154:
;2155:      if ( key == K_END || key == K_KP_END)  {// ( tolower(key) == 'e' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 1060
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 144
EQI4 $1023
ADDRLP4 1060
INDIRI4
CNSTI4 166
NEI4 $1021
LABELV $1023
line 2156
;2156:        item->cursorPos = len;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 2157
;2157:        if(item->cursorPos > editPtr->maxPaintChars) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LEI4 $1024
line 2158
;2158:          editPtr->paintOffset = len - editPtr->maxPaintChars;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1032
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2159
;2159:        }
LABELV $1024
line 2160
;2160:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1021
line 2163
;2161:      }
;2162:
;2163:      if ( key == K_INS || key == K_KP_INS ) {
ADDRLP4 1064
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 139
EQI4 $1028
ADDRLP4 1064
INDIRI4
CNSTI4 170
NEI4 $1026
LABELV $1028
line 2164
;2164:        DC->setOverstrikeMode(!DC->getOverstrikeMode());
ADDRLP4 1072
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1030
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $1031
JUMPV
LABELV $1030
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1031
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CALLV
pop
line 2165
;2165:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $1026
line 2167
;2166:      }
;2167:    }
LABELV $970
line 2169
;2168:
;2169:    if (key == K_TAB || key == K_DOWNARROW || key == K_KP_DOWNARROW) {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 9
EQI4 $1035
ADDRLP4 1044
INDIRI4
CNSTI4 133
EQI4 $1035
ADDRLP4 1044
INDIRI4
CNSTI4 167
NEI4 $1032
LABELV $1035
line 2170
;2170:      newItem = Menu_SetNextCursorItem(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Menu_SetNextCursorItem
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1048
INDIRP4
ASGNP4
line 2171
;2171:      if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1036
ADDRLP4 1056
ADDRLP4 1028
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 4
EQI4 $1038
ADDRLP4 1056
INDIRI4
CNSTI4 9
NEI4 $1036
LABELV $1038
line 2172
;2172:        g_editItem = newItem;
ADDRGP4 g_editItem
ADDRLP4 1028
INDIRP4
ASGNP4
line 2173
;2173:      }
LABELV $1036
line 2174
;2174:    }
LABELV $1032
line 2176
;2175:
;2176:    if (key == K_UPARROW || key == K_KP_UPARROW) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 132
EQI4 $1041
ADDRLP4 1048
INDIRI4
CNSTI4 161
NEI4 $1039
LABELV $1041
line 2177
;2177:      newItem = Menu_SetPrevCursorItem(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 Menu_SetPrevCursorItem
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1052
INDIRP4
ASGNP4
line 2178
;2178:      if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1042
ADDRLP4 1060
ADDRLP4 1028
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 4
EQI4 $1044
ADDRLP4 1060
INDIRI4
CNSTI4 9
NEI4 $1042
LABELV $1044
line 2179
;2179:        g_editItem = newItem;
ADDRGP4 g_editItem
ADDRLP4 1028
INDIRP4
ASGNP4
line 2180
;2180:      }
LABELV $1042
line 2181
;2181:    }
LABELV $1039
line 2183
;2182:
;2183:    if ( key == K_ENTER || key == K_KP_ENTER || key == K_ESCAPE)  {
ADDRLP4 1052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 13
EQI4 $1048
ADDRLP4 1052
INDIRI4
CNSTI4 169
EQI4 $1048
ADDRLP4 1052
INDIRI4
CNSTI4 27
NEI4 $1045
LABELV $1048
line 2184
;2184:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $964
JUMPV
LABELV $1045
line 2187
;2185:    }
;2186:
;2187:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $964
JUMPV
LABELV $965
line 2189
;2188:  }
;2189:  return qfalse;
CNSTI4 0
RETI4
LABELV $964
endproc Item_TextField_HandleKey 1076 12
proc Scroll_ListBox_AutoFunc 12 16
line 2193
;2190:
;2191:}
;2192:
;2193:static void Scroll_ListBox_AutoFunc(void *p) {
line 2194
;2194:  scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2195
;2195:  if (DC->realTime > si->nextScrollTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
LEI4 $1050
line 2199
;2196:    // need to scroll which is done by simulating a click to the item
;2197:    // this is done a bit sideways as the autoscroll "knows" that the item is a listbox
;2198:    // so it calls it directly
;2199:    Item_ListBox_HandleKey(si->item, si->scrollKey, qtrue, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 2200
;2200:    si->nextScrollTime = DC->realTime + si->adjustValue;
ADDRLP4 0
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2201
;2201:  }
LABELV $1050
line 2203
;2202:
;2203:  if (DC->realTime > si->nextAdjustTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1052
line 2204
;2204:    si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2205
;2205:    if (si->adjustValue > SCROLL_TIME_FLOOR) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1054
line 2206
;2206:      si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 40
SUBI4
ASGNI4
line 2207
;2207:    }
LABELV $1054
line 2208
;2208:  }
LABELV $1052
line 2209
;2209:}
LABELV $1049
endproc Scroll_ListBox_AutoFunc 12 16
proc Scroll_ListBox_ThumbFunc 40 16
line 2211
;2210:
;2211:static void Scroll_ListBox_ThumbFunc(void *p) {
line 2212
;2212:  scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2216
;2213:  rectDef_t r;
;2214:  int pos, max;
;2215:
;2216:  listBoxDef_t *listPtr = (listBoxDef_t*)si->item->typeData;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2217
;2217:  if (si->item->window.flags & WINDOW_HORIZONTAL) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1057
line 2218
;2218:    if (DC->cursorx == si->xStart) {
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
NEF4 $1059
line 2219
;2219:      return;
ADDRGP4 $1056
JUMPV
LABELV $1059
line 2221
;2220:    }
;2221:    r.x = si->item->window.rect.x + SCROLLBAR_SIZE + 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2222
;2222:    r.y = si->item->window.rect.y + si->item->window.rect.h - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 2223
;2223:    r.h = SCROLLBAR_SIZE;
ADDRLP4 4+12
CNSTF4 1098907648
ASGNF4
line 2224
;2224:    r.w = si->item->window.rect.w - (SCROLLBAR_SIZE*2) - 2;
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2225
;2225:    max = Item_ListBox_MaxScroll(si->item);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 36
INDIRI4
ASGNI4
line 2227
;2226:    //
;2227:    pos = (DC->cursorx - r.x - SCROLLBAR_SIZE/2) * max / (r.w - SCROLLBAR_SIZE);
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ADDRLP4 24
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4+8
INDIRF4
CNSTF4 1098907648
SUBF4
DIVF4
CVFI4 4
ASGNI4
line 2228
;2228:    if (pos < 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $1065
line 2229
;2229:      pos = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2230
;2230:    }
ADDRGP4 $1066
JUMPV
LABELV $1065
line 2231
;2231:    else if (pos > max) {
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $1067
line 2232
;2232:      pos = max;
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 2233
;2233:    }
LABELV $1067
LABELV $1066
line 2234
;2234:    listPtr->startPos = pos;
ADDRLP4 28
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 2235
;2235:    si->xStart = DC->cursorx;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2236
;2236:  }
ADDRGP4 $1058
JUMPV
LABELV $1057
line 2237
;2237:  else if (DC->cursory != si->yStart) {
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
EQF4 $1069
line 2239
;2238:
;2239:    r.x = si->item->window.rect.x + si->item->window.rect.w - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 2240
;2240:    r.y = si->item->window.rect.y + SCROLLBAR_SIZE + 1;
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2241
;2241:    r.h = si->item->window.rect.h - (SCROLLBAR_SIZE*2) - 2;
ADDRLP4 4+12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2242
;2242:    r.w = SCROLLBAR_SIZE;
ADDRLP4 4+8
CNSTF4 1098907648
ASGNF4
line 2243
;2243:    max = Item_ListBox_MaxScroll(si->item);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 36
INDIRI4
ASGNI4
line 2245
;2244:    //
;2245:    pos = (DC->cursory - r.y - SCROLLBAR_SIZE/2) * max / (r.h - SCROLLBAR_SIZE);
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4+4
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ADDRLP4 24
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4+12
INDIRF4
CNSTF4 1098907648
SUBF4
DIVF4
CVFI4 4
ASGNI4
line 2246
;2246:    if (pos < 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $1076
line 2247
;2247:      pos = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2248
;2248:    }
ADDRGP4 $1077
JUMPV
LABELV $1076
line 2249
;2249:    else if (pos > max) {
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $1078
line 2250
;2250:      pos = max;
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 2251
;2251:    }
LABELV $1078
LABELV $1077
line 2252
;2252:    listPtr->startPos = pos;
ADDRLP4 28
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 2253
;2253:    si->yStart = DC->cursory;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2254
;2254:  }
LABELV $1069
LABELV $1058
line 2256
;2255:
;2256:  if (DC->realTime > si->nextScrollTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
LEI4 $1080
line 2260
;2257:    // need to scroll which is done by simulating a click to the item
;2258:    // this is done a bit sideways as the autoscroll "knows" that the item is a listbox
;2259:    // so it calls it directly
;2260:    Item_ListBox_HandleKey(si->item, si->scrollKey, qtrue, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 2261
;2261:    si->nextScrollTime = DC->realTime + si->adjustValue;
ADDRLP4 0
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2262
;2262:  }
LABELV $1080
line 2264
;2263:
;2264:  if (DC->realTime > si->nextAdjustTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1082
line 2265
;2265:    si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2266
;2266:    if (si->adjustValue > SCROLL_TIME_FLOOR) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1084
line 2267
;2267:      si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 40
SUBI4
ASGNI4
line 2268
;2268:    }
LABELV $1084
line 2269
;2269:  }
LABELV $1082
line 2270
;2270:}
LABELV $1056
endproc Scroll_ListBox_ThumbFunc 40 16
proc Scroll_Slider_ThumbFunc 28 8
line 2272
;2271:
;2272:static void Scroll_Slider_ThumbFunc(void *p) {
line 2274
;2273:  float x, value, cursorx;
;2274:  scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2275
;2275:  editFieldDef_t *editDef = si->item->typeData;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2277
;2276:
;2277:  if (si->item->text) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
line 2278
;2278:    x = si->item->textRect.x + si->item->textRect.w + 8;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2279
;2279:  } else {
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2280
;2280:    x = si->item->window.rect.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 2281
;2281:  }
LABELV $1088
line 2283
;2282:
;2283:  cursorx = DC->cursorx;
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2285
;2284:
;2285:  if (cursorx < x) {
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $1089
line 2286
;2286:    cursorx = x;
ADDRLP4 12
ADDRLP4 8
INDIRF4
ASGNF4
line 2287
;2287:  } else if (cursorx > x + SLIDER_WIDTH) {
ADDRGP4 $1090
JUMPV
LABELV $1089
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1119879168
ADDF4
LEF4 $1091
line 2288
;2288:    cursorx = x + SLIDER_WIDTH;
ADDRLP4 12
ADDRLP4 8
INDIRF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 2289
;2289:  }
LABELV $1091
LABELV $1090
line 2290
;2290:  value = cursorx - x;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2291
;2291:  value /= SLIDER_WIDTH;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1119879168
DIVF4
ASGNF4
line 2292
;2292:  value *= (editDef->maxVal - editDef->minVal);
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
MULF4
ASGNF4
line 2293
;2293:  value += editDef->minVal;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 2294
;2294:  DC->setCVar(si->item->cvar, va("%f", value));
ADDRGP4 $963
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2295
;2295:}
LABELV $1086
endproc Scroll_Slider_ThumbFunc 28 8
export Item_StartCapture
proc Item_StartCapture 24 12
line 2297
;2296:
;2297:void Item_StartCapture(itemDef_t *item, int key) {
line 2299
;2298:  int flags;
;2299:  switch (item->type) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $1094
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $1094
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1121-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1121
address $1097
address $1094
address $1097
address $1094
address $1094
address $1097
address $1114
code
LABELV $1097
line 2304
;2300:    case ITEM_TYPE_EDITFIELD:
;2301:    case ITEM_TYPE_NUMERICFIELD:
;2302:
;2303:    case ITEM_TYPE_LISTBOX:
;2304:    {
line 2305
;2305:      flags = Item_ListBox_OverLB(item, DC->cursorx, DC->cursory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Item_ListBox_OverLB
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2306
;2306:      if (flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW)) {
ADDRLP4 0
INDIRI4
CNSTI4 6144
BANDI4
CNSTI4 0
EQI4 $1098
line 2307
;2307:        scrollInfo.nextScrollTime = DC->realTime + SCROLL_TIME_START;
ADDRGP4 scrollInfo
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2308
;2308:        scrollInfo.nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRGP4 scrollInfo+4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2309
;2309:        scrollInfo.adjustValue = SCROLL_TIME_START;
ADDRGP4 scrollInfo+8
CNSTI4 500
ASGNI4
line 2310
;2310:        scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2311
;2311:        scrollInfo.scrollDir = (flags & WINDOW_LB_LEFTARROW) ? qtrue : qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1105
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $1106
JUMPV
LABELV $1105
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1106
ADDRGP4 scrollInfo+28
ADDRLP4 20
INDIRI4
ASGNI4
line 2312
;2312:        scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2313
;2313:        captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2314
;2314:        captureFunc = &Scroll_ListBox_AutoFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_ListBox_AutoFunc
ASGNP4
line 2315
;2315:        itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2316
;2316:      } else if (flags & WINDOW_LB_THUMB) {
ADDRGP4 $1095
JUMPV
LABELV $1098
ADDRLP4 0
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1095
line 2317
;2317:        scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2318
;2318:        scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2319
;2319:        scrollInfo.xStart = DC->cursorx;
ADDRGP4 scrollInfo+16
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2320
;2320:        scrollInfo.yStart = DC->cursory;
ADDRGP4 scrollInfo+20
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2321
;2321:        captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2322
;2322:        captureFunc = &Scroll_ListBox_ThumbFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_ListBox_ThumbFunc
ASGNP4
line 2323
;2323:        itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2324
;2324:      }
line 2325
;2325:      break;
ADDRGP4 $1095
JUMPV
LABELV $1114
line 2328
;2326:    }
;2327:    case ITEM_TYPE_SLIDER:
;2328:    {
line 2329
;2329:      flags = Item_Slider_OverSlider(item, DC->cursorx, DC->cursory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Item_Slider_OverSlider
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2330
;2330:      if (flags & WINDOW_LB_THUMB) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1095
line 2331
;2331:        scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2332
;2332:        scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2333
;2333:        scrollInfo.xStart = DC->cursorx;
ADDRGP4 scrollInfo+16
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2334
;2334:        scrollInfo.yStart = DC->cursory;
ADDRGP4 scrollInfo+20
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2335
;2335:        captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2336
;2336:        captureFunc = &Scroll_Slider_ThumbFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_Slider_ThumbFunc
ASGNP4
line 2337
;2337:        itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2338
;2338:      }
line 2339
;2339:      break;
LABELV $1094
LABELV $1095
line 2342
;2340:    }
;2341:  }
;2342:}
LABELV $1093
endproc Item_StartCapture 24 12
export Item_StopCapture
proc Item_StopCapture 0 0
line 2344
;2343:
;2344:void Item_StopCapture(itemDef_t *item) {
line 2346
;2345:
;2346:}
LABELV $1123
endproc Item_StopCapture 0 0
export Item_Slider_HandleKey
proc Item_Slider_HandleKey 68 12
line 2348
;2347:
;2348:qboolean Item_Slider_HandleKey(itemDef_t *item, int key, qboolean down) {
line 2352
;2349:  float x, value, width, work;
;2350:
;2351:  //DC->Print("slider handle key\n");
;2352:  if (item->window.flags & WINDOW_HASFOCUS && item->cvar && Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1125
ADDRLP4 16
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1125
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1125
line 2353
;2353:    if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 178
EQI4 $1131
ADDRLP4 28
INDIRI4
CNSTI4 13
EQI4 $1131
ADDRLP4 28
INDIRI4
CNSTI4 179
EQI4 $1131
ADDRLP4 28
INDIRI4
CNSTI4 180
NEI4 $1127
LABELV $1131
line 2354
;2354:      editFieldDef_t *editDef = item->typeData;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 2355
;2355:      if (editDef) {
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1132
line 2357
;2356:        rectDef_t testRect;
;2357:        width = SLIDER_WIDTH;
ADDRLP4 8
CNSTF4 1119879168
ASGNF4
line 2358
;2358:        if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1134
line 2359
;2359:          x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2360
;2360:        } else {
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2361
;2361:          x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 2362
;2362:        }
LABELV $1135
line 2364
;2363:
;2364:        testRect = item->window.rect;
ADDRLP4 36
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 16
line 2365
;2365:        testRect.x = x;
ADDRLP4 36
ADDRLP4 4
INDIRF4
ASGNF4
line 2366
;2366:        value = (float)SLIDER_THUMB_WIDTH / 2;
ADDRLP4 0
CNSTF4 1086324736
ASGNF4
line 2367
;2367:        testRect.x -= value;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 2369
;2368:        //DC->Print("slider x: %f\n", testRect.x);
;2369:        testRect.w = (SLIDER_WIDTH + (float)SLIDER_THUMB_WIDTH / 2);
ADDRLP4 36+8
CNSTF4 1120665600
ASGNF4
line 2371
;2370:        //DC->Print("slider w: %f\n", testRect.w);
;2371:        if (Rect_ContainsPoint(&testRect, DC->cursorx, DC->cursory)) {
ADDRLP4 36
ARGP4
ADDRLP4 52
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1137
line 2372
;2372:          work = DC->cursorx - x;
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 2373
;2373:          value = work / width;
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 2374
;2374:          value *= (editDef->maxVal - editDef->minVal);
ADDRLP4 60
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
SUBF4
MULF4
ASGNF4
line 2377
;2375:          // vm fuckage
;2376:          // value = (((float)(DC->cursorx - x)/ SLIDER_WIDTH) * (editDef->maxVal - editDef->minVal));
;2377:          value += editDef->minVal;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 2378
;2378:          DC->setCVar(item->cvar, va("%f", value));
ADDRGP4 $963
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLV
pop
line 2379
;2379:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1124
JUMPV
LABELV $1137
line 2381
;2380:        }
;2381:      }
LABELV $1132
line 2382
;2382:    }
LABELV $1127
line 2383
;2383:  }
LABELV $1125
line 2384
;2384:  DC->Print("slider handle key exit\n");
ADDRGP4 $1139
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 156
ADDP4
INDIRP4
CALLV
pop
line 2385
;2385:  return qfalse;
CNSTI4 0
RETI4
LABELV $1124
endproc Item_Slider_HandleKey 68 12
export Item_HandleKey
proc Item_HandleKey 32 16
line 2389
;2386:}
;2387:
;2388:
;2389:qboolean Item_HandleKey(itemDef_t *item, int key, qboolean down) {
line 2391
;2390:
;2391:  if (itemCapture) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1141
line 2392
;2392:    Item_StopCapture(itemCapture);
ADDRGP4 itemCapture
INDIRP4
ARGP4
ADDRGP4 Item_StopCapture
CALLV
pop
line 2393
;2393:    itemCapture = NULL;
ADDRGP4 itemCapture
CNSTP4 0
ASGNP4
line 2394
;2394:    captureFunc = voidFunction;
ADDRGP4 captureFunc
ADDRGP4 voidFunction
ASGNP4
line 2395
;2395:    captureData = NULL;
ADDRGP4 captureData
CNSTP4 0
ASGNP4
line 2396
;2396:  } else {
ADDRGP4 $1142
JUMPV
LABELV $1141
line 2398
;2397:    // bk001206 - parentheses
;2398:    if ( down && ( key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3 ) ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1143
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1146
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1146
ADDRLP4 0
INDIRI4
CNSTI4 180
NEI4 $1143
LABELV $1146
line 2399
;2399:      Item_StartCapture(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Item_StartCapture
CALLV
pop
line 2400
;2400:    }
LABELV $1143
line 2401
;2401:  }
LABELV $1142
line 2403
;2402:
;2403:  if (!down) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1147
line 2404
;2404:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
LABELV $1147
line 2407
;2405:  }
;2406:
;2407:  switch (item->type) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1149
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $1149
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1163-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1163
address $1152
address $1153
address $1154
address $1155
address $1156
address $1157
address $1149
address $1160
address $1155
address $1162
address $1158
address $1159
address $1161
code
LABELV $1152
line 2409
;2408:    case ITEM_TYPE_BUTTON:
;2409:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
line 2410
;2410:      break;
LABELV $1153
line 2412
;2411:    case ITEM_TYPE_RADIOBUTTON:
;2412:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
line 2413
;2413:      break;
LABELV $1154
line 2415
;2414:    case ITEM_TYPE_CHECKBOX:
;2415:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
line 2416
;2416:      break;
LABELV $1155
line 2420
;2417:    case ITEM_TYPE_EDITFIELD:
;2418:    case ITEM_TYPE_NUMERICFIELD:
;2419:      //return Item_TextField_HandleKey(item, key);
;2420:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
line 2421
;2421:      break;
LABELV $1156
line 2423
;2422:    case ITEM_TYPE_COMBO:
;2423:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1140
JUMPV
line 2424
;2424:      break;
LABELV $1157
line 2426
;2425:    case ITEM_TYPE_LISTBOX:
;2426:      return Item_ListBox_HandleKey(item, key, down, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 Item_ListBox_HandleKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2427
;2427:      break;
LABELV $1158
line 2429
;2428:    case ITEM_TYPE_YESNO:
;2429:      return Item_YesNo_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Item_YesNo_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2430
;2430:      break;
LABELV $1159
line 2432
;2431:    case ITEM_TYPE_MULTI:
;2432:      return Item_Multi_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Item_Multi_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2433
;2433:      break;
LABELV $1160
line 2435
;2434:    case ITEM_TYPE_OWNERDRAW:
;2435:      return Item_OwnerDraw_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Item_OwnerDraw_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2436
;2436:      break;
LABELV $1161
line 2438
;2437:    case ITEM_TYPE_BIND:
;2438:      return Item_Bind_HandleKey(item, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Item_Bind_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2439
;2439:      break;
LABELV $1162
line 2441
;2440:    case ITEM_TYPE_SLIDER:
;2441:      return Item_Slider_HandleKey(item, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Item_Slider_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $1140
JUMPV
line 2442
;2442:      break;
LABELV $1149
line 2447
;2443:    //case ITEM_TYPE_IMAGE:
;2444:    //  Item_Image_Paint(item);
;2445:    //  break;
;2446:    default:
;2447:      return qfalse;
CNSTI4 0
RETI4
line 2448
;2448:      break;
LABELV $1140
endproc Item_HandleKey 32 16
export Item_Action
proc Item_Action 4 8
line 2454
;2449:  }
;2450:
;2451:  //return qfalse;
;2452:}
;2453:
;2454:void Item_Action(itemDef_t *item) {
line 2455
;2455:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1166
line 2456
;2456:    Item_RunScript(item, item->action);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2457
;2457:  }
LABELV $1166
line 2458
;2458:}
LABELV $1165
endproc Item_Action 4 8
export Menu_SetPrevCursorItem
proc Menu_SetPrevCursorItem 44 12
line 2460
;2459:
;2460:itemDef_t *Menu_SetPrevCursorItem(menuDef_t *menu) {
line 2461
;2461:  qboolean wrapped = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2462
;2462:  int oldCursor = menu->cursorItem;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 2464
;2463:
;2464:  if (menu->cursorItem < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1172
line 2465
;2465:    menu->cursorItem = menu->itemCount-1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2466
;2466:    wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2467
;2467:  }
ADDRGP4 $1172
JUMPV
LABELV $1171
line 2469
;2468:
;2469:  while (menu->cursorItem > -1) {
line 2471
;2470:
;2471:    menu->cursorItem--;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2472
;2472:    if (menu->cursorItem < 0 && !wrapped) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1174
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1174
line 2473
;2473:      wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2474
;2474:      menu->cursorItem = menu->itemCount -1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2475
;2475:    }
LABELV $1174
line 2477
;2476:
;2477:    if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1176
line 2478
;2478:      Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2479
;2479:      return menu->items[menu->cursorItem];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1168
JUMPV
LABELV $1176
line 2481
;2480:    }
;2481:  }
LABELV $1172
line 2469
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -1
GTI4 $1171
line 2482
;2482:  menu->cursorItem = oldCursor;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2483
;2483:  return NULL;
CNSTP4 0
RETP4
LABELV $1168
endproc Menu_SetPrevCursorItem 44 12
export Menu_SetNextCursorItem
proc Menu_SetNextCursorItem 44 12
line 2487
;2484:
;2485:}
;2486:
;2487:itemDef_t *Menu_SetNextCursorItem(menuDef_t *menu) {
line 2489
;2488:
;2489:  qboolean wrapped = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2490
;2490:  int oldCursor = menu->cursorItem;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 2493
;2491:
;2492:
;2493:  if (menu->cursorItem == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1182
line 2494
;2494:    menu->cursorItem = 0;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 2495
;2495:    wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2496
;2496:  }
ADDRGP4 $1182
JUMPV
LABELV $1181
line 2498
;2497:
;2498:  while (menu->cursorItem < menu->itemCount) {
line 2500
;2499:
;2500:    menu->cursorItem++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 196
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
line 2501
;2501:    if (menu->cursorItem >= menu->itemCount && !wrapped) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $1184
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1184
line 2502
;2502:      wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2503
;2503:      menu->cursorItem = 0;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 2504
;2504:    }
LABELV $1184
line 2505
;2505:    if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1186
line 2506
;2506:      Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2507
;2507:      return menu->items[menu->cursorItem];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1178
JUMPV
LABELV $1186
line 2510
;2508:    }
;2509:
;2510:  }
LABELV $1182
line 2498
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $1181
line 2512
;2511:
;2512:  menu->cursorItem = oldCursor;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2513
;2513:  return NULL;
CNSTP4 0
RETP4
LABELV $1178
endproc Menu_SetNextCursorItem 44 12
proc Window_CloseCinematic 4 4
line 2516
;2514:}
;2515:
;2516:static void Window_CloseCinematic(windowDef_t *window) {
line 2517
;2517:  if (window->style == WINDOW_STYLE_CINEMATIC && window->cinematic >= 0) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1189
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1189
line 2518
;2518:    DC->stopCinematic(window->cinematic);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLV
pop
line 2519
;2519:    window->cinematic = -1;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 -1
ASGNI4
line 2520
;2520:  }
LABELV $1189
line 2521
;2521:}
LABELV $1188
endproc Window_CloseCinematic 4 4
proc Menu_CloseCinematics 4 4
line 2523
;2522:
;2523:static void Menu_CloseCinematics(menuDef_t *menu) {
line 2524
;2524:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1192
line 2526
;2525:    int i;
;2526:    Window_CloseCinematic(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CloseCinematic
CALLV
pop
line 2527
;2527:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1197
JUMPV
LABELV $1194
line 2528
;2528:      Window_CloseCinematic(&menu->items[i]->window);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Window_CloseCinematic
CALLV
pop
line 2529
;2529:      if (menu->items[i]->type == ITEM_TYPE_OWNERDRAW) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1198
line 2530
;2530:        DC->stopCinematic(0-menu->items[i]->window.ownerDraw);
CNSTI4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLV
pop
line 2531
;2531:      }
LABELV $1198
line 2532
;2532:    }
LABELV $1195
line 2527
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1197
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $1194
line 2533
;2533:  }
LABELV $1192
line 2534
;2534:}
LABELV $1191
endproc Menu_CloseCinematics 4 4
proc Display_CloseCinematics 4 4
line 2536
;2535:
;2536:static void Display_CloseCinematics( void ) {
line 2538
;2537:  int i;
;2538:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1204
JUMPV
LABELV $1201
line 2539
;2539:    Menu_CloseCinematics(&Menus[i]);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_CloseCinematics
CALLV
pop
line 2540
;2540:  }
LABELV $1202
line 2538
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1204
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1201
line 2541
;2541:}
LABELV $1200
endproc Display_CloseCinematics 4 4
export Menus_Activate
proc Menus_Activate 544 8
line 2543
;2542:
;2543:void  Menus_Activate(menuDef_t *menu) {
line 2544
;2544:  menu->window.flags |= (WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 6
BORI4
ASGNI4
line 2545
;2545:  if (menu->onOpen) {
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1206
line 2547
;2546:    itemDef_t item;
;2547:    item.parent = menu;
ADDRLP4 4+228
ADDRFP4 0
INDIRP4
ASGNP4
line 2548
;2548:    Item_RunScript(&item, menu->onOpen);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2549
;2549:  }
LABELV $1206
line 2551
;2550:
;2551:  if (menu->soundName && *menu->soundName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1209
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1209
line 2553
;2552://    DC->stopBackgroundTrack();          // you don't want to do this since it will reset s_rawend
;2553:    DC->startBackgroundTrack(menu->soundName, menu->soundName);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 172
ADDP4
INDIRP4
CALLV
pop
line 2554
;2554:  }
LABELV $1209
line 2556
;2555:
;2556:  Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 2558
;2557:
;2558:}
LABELV $1205
endproc Menus_Activate 544 8
export Display_VisibleMenuCount
proc Display_VisibleMenuCount 8 0
line 2560
;2559:
;2560:int Display_VisibleMenuCount( void ) {
line 2562
;2561:  int i, count;
;2562:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2563
;2563:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1215
JUMPV
LABELV $1212
line 2564
;2564:    if (Menus[i].window.flags & (WINDOW_FORCED | WINDOW_VISIBLE)) {
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+68
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
EQI4 $1216
line 2565
;2565:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2566
;2566:    }
LABELV $1216
line 2567
;2567:  }
LABELV $1213
line 2563
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1215
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1212
line 2568
;2568:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1211
endproc Display_VisibleMenuCount 8 0
export Menus_HandleOOBClick
proc Menus_HandleOOBClick 24 12
line 2571
;2569:}
;2570:
;2571:void Menus_HandleOOBClick(menuDef_t *menu, int key, qboolean down) {
line 2572
;2572:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1220
line 2577
;2573:    int i;
;2574:    // basically the behaviour we are looking for is if there are windows in the stack.. see if
;2575:    // the cursor is within any of them.. if not close them otherwise activate them and pass the
;2576:    // key on.. force a mouse move to activate focus and script stuff
;2577:    if (down && menu->window.flags & WINDOW_OOB_CLICK) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1222
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $1222
line 2578
;2578:      Menu_RunCloseScript(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 2579
;2579:      menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 2580
;2580:    }
LABELV $1222
line 2582
;2581:
;2582:    for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1227
JUMPV
LABELV $1224
line 2583
;2583:      if (Menu_OverActiveItem(&Menus[i], DC->cursorx, DC->cursory)) {
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Menu_OverActiveItem
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1228
line 2584
;2584:        Menu_RunCloseScript(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 2585
;2585:        menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 2586
;2586:        Menus_Activate(&Menus[i]);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 2587
;2587:        Menu_HandleMouseMove(&Menus[i], DC->cursorx, DC->cursory);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2588
;2588:        Menu_HandleKey(&Menus[i], key, down);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 2589
;2589:      }
LABELV $1228
line 2590
;2590:    }
LABELV $1225
line 2582
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1227
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1224
line 2592
;2591:
;2592:    if (Display_VisibleMenuCount() == 0) {
ADDRLP4 8
ADDRGP4 Display_VisibleMenuCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1230
line 2593
;2593:      if (DC->Pause) {
ADDRGP4 DC
INDIRP4
CNSTI4 160
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1232
line 2594
;2594:        DC->Pause(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 160
ADDP4
INDIRP4
CALLV
pop
line 2595
;2595:      }
LABELV $1232
line 2596
;2596:    }
LABELV $1230
line 2597
;2597:    Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 2598
;2598:  }
LABELV $1220
line 2599
;2599:}
LABELV $1219
endproc Menus_HandleOOBClick 24 12
bss
align 4
LABELV $1235
skip 16
code
proc Item_CorrectedTextRect 4 12
line 2601
;2600:
;2601:static rectDef_t *Item_CorrectedTextRect(itemDef_t *item) {
line 2603
;2602:  static rectDef_t rect;
;2603:  memset(&rect, 0, sizeof(rectDef_t));
ADDRGP4 $1235
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2604
;2604:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1236
line 2605
;2605:    rect = item->textRect;
ADDRGP4 $1235
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRB
ASGNB 16
line 2606
;2606:    if (rect.w) {
ADDRGP4 $1235+8
INDIRF4
CNSTF4 0
EQF4 $1238
line 2607
;2607:      rect.y -= rect.h;
ADDRLP4 0
ADDRGP4 $1235+4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 $1235+12
INDIRF4
SUBF4
ASGNF4
line 2608
;2608:    }
LABELV $1238
line 2609
;2609:  }
LABELV $1236
line 2610
;2610:  return &rect;
ADDRGP4 $1235
RETP4
LABELV $1234
endproc Item_CorrectedTextRect 4 12
data
align 4
LABELV $1264
byte 4 0
export Menu_HandleKey
code
proc Menu_HandleKey 628 12
line 2613
;2611:}
;2612:
;2613:void Menu_HandleKey(menuDef_t *menu, int key, qboolean down) {
line 2615
;2614:  int i;
;2615:  itemDef_t *item = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2616
;2616:  qboolean inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2618
;2617:
;2618:  if (inHandler) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1244
line 2619
;2619:    return;
ADDRGP4 $1243
JUMPV
LABELV $1244
line 2622
;2620:  }
;2621:
;2622:  inHandler = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2623
;2623:  if (g_waitingForKey && down) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1246
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1246
line 2624
;2624:    Item_Bind_HandleKey(g_bindItem, key, down);
ADDRGP4 g_bindItem
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Item_Bind_HandleKey
CALLI4
pop
line 2625
;2625:    inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2626
;2626:    return;
ADDRGP4 $1243
JUMPV
LABELV $1246
line 2629
;2627:  }
;2628:
;2629:  if (g_editingField && down) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1248
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1248
line 2630
;2630:    if (!Item_TextField_HandleKey(g_editItem, key)) {
ADDRGP4 g_editItem
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Item_TextField_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1250
line 2631
;2631:      g_editingField = qfalse;
ADDRGP4 g_editingField
CNSTI4 0
ASGNI4
line 2632
;2632:      g_editItem = NULL;
ADDRGP4 g_editItem
CNSTP4 0
ASGNP4
line 2633
;2633:      inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2634
;2634:      return;
ADDRGP4 $1243
JUMPV
LABELV $1250
line 2635
;2635:    } else if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 178
EQI4 $1255
ADDRLP4 24
INDIRI4
CNSTI4 179
EQI4 $1255
ADDRLP4 24
INDIRI4
CNSTI4 180
NEI4 $1252
LABELV $1255
line 2636
;2636:      g_editingField = qfalse;
ADDRGP4 g_editingField
CNSTI4 0
ASGNI4
line 2637
;2637:      g_editItem = NULL;
ADDRGP4 g_editItem
CNSTP4 0
ASGNP4
line 2638
;2638:      Display_MouseMove(NULL, DC->cursorx, DC->cursory);
CNSTP4 0
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 2639
;2639:    } else if (key == K_TAB || key == K_UPARROW || key == K_DOWNARROW) {
ADDRGP4 $1253
JUMPV
LABELV $1252
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 9
EQI4 $1259
ADDRLP4 28
INDIRI4
CNSTI4 132
EQI4 $1259
ADDRLP4 28
INDIRI4
CNSTI4 133
NEI4 $1256
LABELV $1259
line 2640
;2640:      return;
ADDRGP4 $1243
JUMPV
LABELV $1256
LABELV $1253
line 2642
;2641:    }
;2642:  }
LABELV $1248
line 2644
;2643:
;2644:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1260
line 2645
;2645:    inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2646
;2646:    return;
ADDRGP4 $1243
JUMPV
LABELV $1260
line 2650
;2647:  }
;2648:
;2649:    // see if the mouse is within the window bounds and if so is this a mouse click
;2650:  if (down && !(menu->window.flags & WINDOW_POPUP) && !Rect_ContainsPoint(&menu->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1262
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $1262
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1262
line 2653
;2651:    static qboolean inHandleKey = qfalse;
;2652:    // bk001206 - parentheses
;2653:    if (!inHandleKey && ( key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3 ) ) {
ADDRGP4 $1264
INDIRI4
CNSTI4 0
NEI4 $1265
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 178
EQI4 $1268
ADDRLP4 36
INDIRI4
CNSTI4 179
EQI4 $1268
ADDRLP4 36
INDIRI4
CNSTI4 180
NEI4 $1265
LABELV $1268
line 2654
;2654:      inHandleKey = qtrue;
ADDRGP4 $1264
CNSTI4 1
ASGNI4
line 2655
;2655:      Menus_HandleOOBClick(menu, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Menus_HandleOOBClick
CALLV
pop
line 2656
;2656:      inHandleKey = qfalse;
ADDRGP4 $1264
CNSTI4 0
ASGNI4
line 2657
;2657:      inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2658
;2658:      return;
ADDRGP4 $1243
JUMPV
LABELV $1265
line 2660
;2659:    }
;2660:  }
LABELV $1262
line 2663
;2661:
;2662:  // get the item with focus
;2663:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1272
JUMPV
LABELV $1269
line 2664
;2664:    if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1273
line 2665
;2665:      item = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
line 2666
;2666:    }
LABELV $1273
line 2667
;2667:  }
LABELV $1270
line 2663
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1272
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $1269
line 2669
;2668:
;2669:  if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1275
line 2670
;2670:    if (Item_HandleKey(item, key, down)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 Item_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1277
line 2671
;2671:      Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 2672
;2672:      inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2673
;2673:      return;
ADDRGP4 $1243
JUMPV
LABELV $1277
line 2675
;2674:    }
;2675:  }
LABELV $1275
line 2677
;2676:
;2677:  if (!down) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1279
line 2678
;2678:    inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2679
;2679:    return;
ADDRGP4 $1243
JUMPV
LABELV $1279
line 2683
;2680:  }
;2681:
;2682:  // default handling
;2683:  switch ( key ) {
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 155
EQI4 $1283
ADDRLP4 40
CNSTI4 156
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1287
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
GTI4 $1319
LABELV $1318
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $1312
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $1321
LABELV $1320
ADDRFP4 4
INDIRI4
CNSTI4 9
EQI4 $1296
ADDRGP4 $1281
JUMPV
LABELV $1321
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 56
CNSTI4 27
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $1292
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $1281
LABELV $1322
ADDRLP4 60
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 132
EQI4 $1291
ADDRLP4 60
INDIRI4
CNSTI4 133
EQI4 $1296
ADDRGP4 $1281
JUMPV
LABELV $1319
ADDRLP4 64
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 167
EQI4 $1296
ADDRLP4 68
CNSTI4 169
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $1312
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
GTI4 $1324
LABELV $1323
ADDRFP4 4
INDIRI4
CNSTI4 161
EQI4 $1291
ADDRGP4 $1281
JUMPV
LABELV $1324
ADDRLP4 72
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 178
LTI4 $1281
ADDRLP4 72
INDIRI4
CNSTI4 188
GTI4 $1325
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1326-712
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1326
address $1297
address $1297
address $1281
address $1281
address $1281
address $1281
address $1281
address $1282
address $1282
address $1282
address $1282
code
LABELV $1325
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 217
LTI4 $1281
ADDRLP4 76
INDIRI4
CNSTI4 232
GTI4 $1281
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1328-868
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1328
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
address $1282
code
LABELV $1283
line 2686
;2684:
;2685:    case K_F11:
;2686:      if (DC->getCVarValue("developer")) {
ADDRGP4 $1286
ARGP4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 0
EQF4 $1282
line 2687
;2687:        debugMode ^= 1;
ADDRLP4 84
ADDRGP4 debugMode
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2688
;2688:      }
line 2689
;2689:      break;
ADDRGP4 $1282
JUMPV
LABELV $1287
line 2692
;2690:
;2691:    case K_F12:
;2692:      if (DC->getCVarValue("developer")) {
ADDRGP4 $1286
ARGP4
ADDRLP4 84
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $1282
line 2693
;2693:        DC->executeText(EXEC_APPEND, "screenshot\n");
CNSTI4 2
ARGI4
ADDRGP4 $1290
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 2694
;2694:      }
line 2695
;2695:      break;
ADDRGP4 $1282
JUMPV
LABELV $1291
line 2698
;2696:    case K_KP_UPARROW:
;2697:    case K_UPARROW:
;2698:      Menu_SetPrevCursorItem(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_SetPrevCursorItem
CALLP4
pop
line 2699
;2699:      break;
ADDRGP4 $1282
JUMPV
LABELV $1292
line 2702
;2700:
;2701:    case K_ESCAPE:
;2702:      if (!g_waitingForKey && menu->onESC) {
ADDRGP4 g_waitingForKey
INDIRI4
CNSTI4 0
NEI4 $1282
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1282
line 2704
;2703:        itemDef_t it;
;2704:        it.parent = menu;
ADDRLP4 88+228
ADDRFP4 0
INDIRP4
ASGNP4
line 2705
;2705:        Item_RunScript(&it, menu->onESC);
ADDRLP4 88
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2706
;2706:      }
line 2707
;2707:      break;
ADDRGP4 $1282
JUMPV
LABELV $1296
line 2711
;2708:    case K_TAB:
;2709:    case K_KP_DOWNARROW:
;2710:    case K_DOWNARROW:
;2711:      Menu_SetNextCursorItem(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_SetNextCursorItem
CALLP4
pop
line 2712
;2712:      break;
ADDRGP4 $1282
JUMPV
LABELV $1297
line 2716
;2713:
;2714:    case K_MOUSE1:
;2715:    case K_MOUSE2:
;2716:      if (item) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1282
line 2717
;2717:        if (item->type == ITEM_TYPE_TEXT) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1300
line 2718
;2718:          if (Rect_ContainsPoint(Item_CorrectedTextRect(item), DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1282
line 2719
;2719:            Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 2720
;2720:          }
line 2721
;2721:        } else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRGP4 $1282
JUMPV
LABELV $1300
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 4
EQI4 $1306
ADDRLP4 88
INDIRI4
CNSTI4 9
NEI4 $1304
LABELV $1306
line 2722
;2722:          if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1282
line 2723
;2723:            item->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2724
;2724:            g_editingField = qtrue;
ADDRGP4 g_editingField
CNSTI4 1
ASGNI4
line 2725
;2725:            g_editItem = item;
ADDRGP4 g_editItem
ADDRLP4 4
INDIRP4
ASGNP4
line 2726
;2726:            DC->setOverstrikeMode(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CALLV
pop
line 2727
;2727:          }
line 2728
;2728:        } else {
ADDRGP4 $1282
JUMPV
LABELV $1304
line 2729
;2729:          if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1282
line 2730
;2730:            Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 2731
;2731:          }
line 2732
;2732:        }
line 2733
;2733:      }
line 2734
;2734:      break;
ADDRGP4 $1282
JUMPV
line 2756
;2735:
;2736:    case K_JOY1:
;2737:    case K_JOY2:
;2738:    case K_JOY3:
;2739:    case K_JOY4:
;2740:    case K_AUX1:
;2741:    case K_AUX2:
;2742:    case K_AUX3:
;2743:    case K_AUX4:
;2744:    case K_AUX5:
;2745:    case K_AUX6:
;2746:    case K_AUX7:
;2747:    case K_AUX8:
;2748:    case K_AUX9:
;2749:    case K_AUX10:
;2750:    case K_AUX11:
;2751:    case K_AUX12:
;2752:    case K_AUX13:
;2753:    case K_AUX14:
;2754:    case K_AUX15:
;2755:    case K_AUX16:
;2756:      break;
LABELV $1312
line 2759
;2757:    case K_KP_ENTER:
;2758:    case K_ENTER:
;2759:      if (item) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1282
line 2760
;2760:        if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 4
EQI4 $1317
ADDRLP4 88
INDIRI4
CNSTI4 9
NEI4 $1315
LABELV $1317
line 2761
;2761:          item->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2762
;2762:          g_editingField = qtrue;
ADDRGP4 g_editingField
CNSTI4 1
ASGNI4
line 2763
;2763:          g_editItem = item;
ADDRGP4 g_editItem
ADDRLP4 4
INDIRP4
ASGNP4
line 2764
;2764:          DC->setOverstrikeMode(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CALLV
pop
line 2765
;2765:        } else {
ADDRGP4 $1282
JUMPV
LABELV $1315
line 2766
;2766:            Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 2767
;2767:        }
line 2768
;2768:      }
line 2769
;2769:      break;
LABELV $1281
LABELV $1282
line 2771
;2770:  }
;2771:  inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2772
;2772:}
LABELV $1243
endproc Menu_HandleKey 628 12
export ToWindowCoords
proc ToWindowCoords 8 0
line 2774
;2773:
;2774:void ToWindowCoords(float *x, float *y, windowDef_t *window) {
line 2775
;2775:  if (window->border != 0) {
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1331
line 2776
;2776:    *x += window->borderSize;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2777
;2777:    *y += window->borderSize;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2778
;2778:  }
LABELV $1331
line 2779
;2779:  *x += window->rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 2780
;2780:  *y += window->rect.y;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2781
;2781:}
LABELV $1330
endproc ToWindowCoords 8 0
export Rect_ToWindowCoords
proc Rect_ToWindowCoords 4 12
line 2783
;2782:
;2783:void Rect_ToWindowCoords(rectDef_t *rect, windowDef_t *window) {
line 2784
;2784:  ToWindowCoords(&rect->x, &rect->y, window);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 2785
;2785:}
LABELV $1333
endproc Rect_ToWindowCoords 4 12
export Item_SetTextExtents
proc Item_SetTextExtents 296 12
line 2787
;2786:
;2787:void Item_SetTextExtents(itemDef_t *item, int *width, int *height, const char *text) {
line 2788
;2788:  const char *textPtr = (text) ? text : item->text;
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1336
ADDRLP4 4
ADDRFP4 12
INDIRP4
ASGNP4
ADDRGP4 $1337
JUMPV
LABELV $1336
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
LABELV $1337
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2790
;2789:
;2790:  if (textPtr == NULL ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1338
line 2791
;2791:    return;
ADDRGP4 $1334
JUMPV
LABELV $1338
line 2794
;2792:  }
;2793:
;2794:  *width = item->textRect.w;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2795
;2795:  *height = item->textRect.h;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2798
;2796:
;2797:  // keeps us from computing the widths and heights more than once
;2798:  if (*width == 0 || (item->type == ITEM_TYPE_OWNERDRAW && item->textalignment == ITEM_ALIGN_CENTER)) {
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1342
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1340
ADDRLP4 8
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1340
LABELV $1342
line 2799
;2799:    int originalWidth = DC->textWidth(item->text, item->textscale, 0);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 2801
;2800:
;2801:    if (item->type == ITEM_TYPE_OWNERDRAW && (item->textalignment == ITEM_ALIGN_CENTER || item->textalignment == ITEM_ALIGN_RIGHT)) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1343
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $1345
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $1343
LABELV $1345
line 2802
;2802:      originalWidth += DC->ownerDrawWidth(item->window.ownerDraw, item->textscale);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 164
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 2803
;2803:    } else if (item->type == ITEM_TYPE_EDITFIELD && item->textalignment == ITEM_ALIGN_CENTER && item->cvar) {
ADDRGP4 $1344
JUMPV
LABELV $1343
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1346
ADDRLP4 32
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1346
ADDRLP4 32
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1346
line 2805
;2804:      char buff[256];
;2805:      DC->getCVarString(item->cvar, buff, 256);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 2806
;2806:      originalWidth += DC->textWidth(buff, item->textscale, 0);
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 292
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 292
INDIRI4
ADDI4
ASGNI4
line 2807
;2807:    }
LABELV $1346
LABELV $1344
line 2809
;2808:
;2809:    *width = DC->textWidth(textPtr, item->textscale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2810
;2810:    *height = DC->textHeight(textPtr, item->textscale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 DC
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2811
;2811:    item->textRect.w = *width;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 2812
;2812:    item->textRect.h = *height;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 2813
;2813:    item->textRect.x = item->textalignx;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ASGNF4
line 2814
;2814:    item->textRect.y = item->textaligny;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
ASGNF4
line 2815
;2815:    if (item->textalignment == ITEM_ALIGN_RIGHT) {
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1348
line 2816
;2816:      item->textRect.x = item->textalignx - originalWidth;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 2817
;2817:    } else if (item->textalignment == ITEM_ALIGN_CENTER) {
ADDRGP4 $1349
JUMPV
LABELV $1348
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1350
line 2818
;2818:      item->textRect.x = item->textalignx - originalWidth / 2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
line 2819
;2819:    }
LABELV $1350
LABELV $1349
line 2821
;2820:
;2821:    ToWindowCoords(&item->textRect.x, &item->textRect.y, &item->window);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 2822
;2822:  }
LABELV $1340
line 2823
;2823:}
LABELV $1334
endproc Item_SetTextExtents 296 12
export Item_TextColor
proc Item_TextColor 60 28
line 2825
;2824:
;2825:void Item_TextColor(itemDef_t *item, vec4_t *newColor) {
line 2827
;2826:  vec4_t lowLight;
;2827:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 2829
;2828:
;2829:  Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, qtrue, parent->fadeAmount);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 2831
;2830:
;2831:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1353
line 2838
;2832:/*    lowLight[0] = 0.8 * parent->focusColor[0];
;2833:    lowLight[1] = 0.8 * parent->focusColor[1];
;2834:    lowLight[2] = 0.8 * parent->focusColor[2];
;2835:    lowLight[3] = 0.8 * parent->focusColor[3];
;2836:    LerpColor(parent->focusColor,lowLight,*newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;2837:    //TA:
;2838:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2839
;2839:  } else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime/BLINK_DIVISOR) & 1)) {
ADDRGP4 $1354
JUMPV
LABELV $1353
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1355
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 200
DIVI4
ADDRLP4 28
INDIRI4
BANDI4
CNSTI4 0
NEI4 $1355
line 2840
;2840:    lowLight[0] = 0.8 * item->window.foreColor[0];
ADDRLP4 4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
line 2841
;2841:    lowLight[1] = 0.8 * item->window.foreColor[1];
ADDRLP4 4+4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
MULF4
ASGNF4
line 2842
;2842:    lowLight[2] = 0.8 * item->window.foreColor[2];
ADDRLP4 4+8
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
MULF4
ASGNF4
line 2843
;2843:    lowLight[3] = 0.8 * item->window.foreColor[3];
ADDRLP4 4+12
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
MULF4
ASGNF4
line 2844
;2844:    LerpColor(item->window.foreColor,lowLight,*newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
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
line 2845
;2845:  } else {
ADDRGP4 $1356
JUMPV
LABELV $1355
line 2846
;2846:    memcpy(newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2848
;2847:    // items can be enabled and disabled based on cvars
;2848:  }
LABELV $1356
LABELV $1354
line 2850
;2849:
;2850:  if (item->enableCvar != NULL && *item->enableCvar && item->cvarTest != NULL && *item->cvarTest) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1360
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
EQI4 $1360
ADDRLP4 48
ADDRLP4 32
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1360
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
EQI4 $1360
line 2851
;2851:    if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1362
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1362
line 2852
;2852:      memcpy(newColor, &parent->disableColor, sizeof(vec4_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2853
;2853:    }
LABELV $1362
line 2854
;2854:  }
LABELV $1360
line 2855
;2855:}
LABELV $1352
endproc Item_TextColor 60 28
export Item_Text_AutoWrapped_Lines
proc Item_Text_AutoWrapped_Lines 2100 12
line 2858
;2856:
;2857:int Item_Text_AutoWrapped_Lines( itemDef_t *item )
;2858:{
line 2863
;2859:  char        text[ 1024 ];
;2860:  const char  *p, *textPtr, *newLinePtr;
;2861:  char        buff[ 1024 ];
;2862:  int         len, textWidth, newLine;
;2863:  int         lines = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 2865
;2864:
;2865:  textWidth = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 2866
;2866:  newLinePtr = NULL;
ADDRLP4 1040
CNSTP4 0
ASGNP4
line 2868
;2867:
;2868:  if( item->text == NULL )
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1365
line 2869
;2869:  {
line 2870
;2870:    if( item->cvar == NULL )
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1367
line 2871
;2871:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1367
line 2873
;2872:    else
;2873:    {
line 2874
;2874:      DC->getCVarString( item->cvar, text, sizeof( text ) );
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 2875
;2875:      textPtr = text;
ADDRLP4 1048
ADDRLP4 1052
ASGNP4
line 2876
;2876:    }
line 2877
;2877:  }
ADDRGP4 $1366
JUMPV
LABELV $1365
line 2879
;2878:  else
;2879:    textPtr = item->text;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
LABELV $1366
line 2881
;2880:
;2881:  if( *textPtr == '\0' )
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1369
line 2882
;2882:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $1364
JUMPV
LABELV $1369
line 2884
;2883:
;2884:  len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2885
;2885:  buff[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 2886
;2886:  newLine = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2887
;2887:  p = textPtr;
ADDRLP4 0
ADDRLP4 1048
INDIRP4
ASGNP4
ADDRGP4 $1372
JUMPV
LABELV $1371
line 2890
;2888:
;2889:  while( p )
;2890:  {
line 2891
;2891:    textWidth = DC->textWidth( buff, item->textscale, 0 );
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2076
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2076
INDIRI4
ASGNI4
line 2893
;2892:
;2893:    if( *p == ' ' || *p == '\t' || *p == '\n' || *p == '\0' )
ADDRLP4 2080
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 32
EQI4 $1378
ADDRLP4 2080
INDIRI4
CNSTI4 9
EQI4 $1378
ADDRLP4 2080
INDIRI4
CNSTI4 10
EQI4 $1378
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $1374
LABELV $1378
line 2894
;2894:    {
line 2895
;2895:      newLine = len;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 2896
;2896:      newLinePtr = p + 1;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2897
;2897:    }
LABELV $1374
line 2900
;2898:
;2899:    //TA: forceably split lines that are too long (where normal splitage has failed)
;2900:    if( textWidth > item->window.rect.w && newLine == 0 && *p != '\n' )
ADDRLP4 1036
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LEF4 $1379
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1379
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
EQI4 $1379
line 2901
;2901:    {
line 2902
;2902:      newLine = len;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 2903
;2903:      newLinePtr = p;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
ASGNP4
line 2904
;2904:    }
LABELV $1379
line 2906
;2905:
;2906:    if( ( newLine && textWidth > item->window.rect.w ) || *p == '\n' || *p == '\0' )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1384
ADDRLP4 1036
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GTF4 $1385
LABELV $1384
ADDRLP4 2084
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 10
EQI4 $1385
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $1381
LABELV $1385
line 2907
;2907:    {
line 2908
;2908:      if( len )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1386
line 2909
;2909:        buff[ newLine ] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
LABELV $1386
line 2911
;2910:
;2911:      if( !( *p == '\n' && !*( p + 1 ) ) )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1390
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1388
LABELV $1390
line 2912
;2912:        lines++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1388
line 2914
;2913:
;2914:      if( *p == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1391
line 2915
;2915:        break;
ADDRGP4 $1373
JUMPV
LABELV $1391
line 2918
;2916:
;2917:      //
;2918:      p = newLinePtr;
ADDRLP4 0
ADDRLP4 1040
INDIRP4
ASGNP4
line 2919
;2919:      len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2920
;2920:      newLine = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2922
;2921:
;2922:      continue;
ADDRGP4 $1372
JUMPV
LABELV $1381
line 2925
;2923:    }
;2924:
;2925:    buff[ len++ ] = *p++;
ADDRLP4 2088
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 2096
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 2088
INDIRI4
ADDRLP4 2096
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2092
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 2092
INDIRP4
ADDRLP4 2096
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2088
INDIRI4
ADDRLP4 12
ADDP4
ADDRLP4 2092
INDIRP4
INDIRI1
ASGNI1
line 2926
;2926:    buff[ len ] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 2927
;2927:  }
LABELV $1372
line 2889
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1371
LABELV $1373
line 2929
;2928:
;2929:  return lines;
ADDRLP4 1044
INDIRI4
RETI4
LABELV $1364
endproc Item_Text_AutoWrapped_Lines 2100 12
data
align 4
LABELV cacheIndex
byte 4 0
code
proc checkCache 20 8
line 2951
;2930:}
;2931:
;2932:#define MAX_AUTOWRAP_CACHE  16
;2933:#define MAX_AUTOWRAP_LINES  32
;2934:#define MAX_AUTOWRAP_TEXT   512
;2935:
;2936:typedef struct
;2937:{
;2938:  //this is used purely for checking for cache hits
;2939:  char      text[ MAX_AUTOWRAP_TEXT * MAX_AUTOWRAP_LINES ];
;2940:  rectDef_t rect;
;2941:  int       textWidth, textHeight;
;2942:  char      lines[ MAX_AUTOWRAP_LINES ][ MAX_AUTOWRAP_TEXT ];
;2943:  int       lineOffsets[ MAX_AUTOWRAP_LINES ][ 2 ];
;2944:  int       numLines;
;2945:} autoWrapCache_t;
;2946:
;2947:static int              cacheIndex = 0;
;2948:static autoWrapCache_t  awc[ MAX_AUTOWRAP_CACHE ];
;2949:
;2950:static int checkCache( const char *text, rectDef_t *rect, int width, int height )
;2951:{
line 2954
;2952:  int i;
;2953:
;2954:  for( i = 0; i < MAX_AUTOWRAP_CACHE; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1395
line 2955
;2955:  {
line 2956
;2956:    if( Q_stricmp( text, awc[ i ].text ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 33052
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 awc
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1399
line 2957
;2957:      continue;
ADDRGP4 $1396
JUMPV
LABELV $1399
line 2959
;2958:
;2959:    if( rect->x != awc[ i ].rect.x ||
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 33052
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRI4
ADDRGP4 awc+16384
ADDP4
INDIRF4
NEF4 $1412
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
ADDRGP4 awc+16384+4
ADDP4
INDIRF4
NEF4 $1412
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
ADDRGP4 awc+16384+8
ADDP4
INDIRF4
NEF4 $1412
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
ADDRGP4 awc+16384+12
ADDP4
INDIRF4
EQF4 $1401
LABELV $1412
line 2963
;2960:        rect->y != awc[ i ].rect.y ||
;2961:        rect->w != awc[ i ].rect.w ||
;2962:        rect->h != awc[ i ].rect.h )
;2963:      continue;
ADDRGP4 $1396
JUMPV
LABELV $1401
line 2965
;2964:
;2965:    if( awc[ i ].textWidth != width || awc[ i ].textHeight != height )
ADDRLP4 16
CNSTI4 33052
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 awc+16400
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $1417
ADDRLP4 16
INDIRI4
ADDRGP4 awc+16404
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
EQI4 $1413
LABELV $1417
line 2966
;2966:      continue;
ADDRGP4 $1396
JUMPV
LABELV $1413
line 2969
;2967:
;2968:    //this is a match
;2969:    return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1394
JUMPV
LABELV $1396
line 2954
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1395
line 2973
;2970:  }
;2971:
;2972:  //no match - autowrap isn't cached
;2973:  return -1;
CNSTI4 -1
RETI4
LABELV $1394
endproc checkCache 20 8
lit
align 1
LABELV $1419
byte 1 0
byte 1 0
export Item_Text_AutoWrapped_Paint
code
proc Item_Text_AutoWrapped_Paint 2180 32
line 2977
;2974:}
;2975:
;2976:void Item_Text_AutoWrapped_Paint( itemDef_t *item )
;2977:{
line 2981
;2978:  char        text[ 1024 ];
;2979:  const char  *p, *textPtr, *newLinePtr;
;2980:  char        buff[ 1024 ];
;2981:  char        lastCMod[ 2 ] = { 0, 0 };
ADDRLP4 1048
ADDRGP4 $1419
INDIRB
ASGNB 2
line 2982
;2982:  qboolean    forwardColor = qfalse;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 2984
;2983:  int         width, height, len, textWidth, newLine, newLineWidth;
;2984:  int         skipLines, totalLines, lineNum = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 2989
;2985:  float       y, totalY, diffY;
;2986:  vec4_t      color;
;2987:  int         cache, i;
;2988:
;2989:  textWidth = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 2990
;2990:  newLinePtr = NULL;
ADDRLP4 1056
CNSTP4 0
ASGNP4
line 2992
;2991:
;2992:  if( item->text == NULL )
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1420
line 2993
;2993:  {
line 2994
;2994:    if( item->cvar == NULL )
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1422
line 2995
;2995:      return;
ADDRGP4 $1418
JUMPV
LABELV $1422
line 2997
;2996:    else
;2997:    {
line 2998
;2998:      DC->getCVarString( item->cvar, text, sizeof( text ) );
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 2999
;2999:      textPtr = text;
ADDRLP4 1088
ADDRLP4 1116
ASGNP4
line 3000
;3000:    }
line 3001
;3001:  }
ADDRGP4 $1421
JUMPV
LABELV $1420
line 3003
;3002:  else
;3003:    textPtr = item->text;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
LABELV $1421
line 3005
;3004:
;3005:  if( *textPtr == '\0' )
ADDRLP4 1088
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1424
line 3006
;3006:    return;
ADDRGP4 $1418
JUMPV
LABELV $1424
line 3008
;3007:
;3008:  Item_TextColor( item, &color );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1072
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3009
;3009:  Item_SetTextExtents( item, &width, &height, textPtr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3012
;3010:
;3011:  //check if this block is cached
;3012:  cache = checkCache( textPtr, &item->window.rect, width, height );
ADDRLP4 1088
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 2140
ADDRGP4 checkCache
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 2140
INDIRI4
ASGNI4
line 3013
;3013:  if( cache >= 0 )
ADDRLP4 1044
INDIRI4
CNSTI4 0
LTI4 $1426
line 3014
;3014:  {
line 3015
;3015:    lineNum = awc[ cache ].numLines;
ADDRLP4 1052
CNSTI4 33052
ADDRLP4 1044
INDIRI4
MULI4
ADDRGP4 awc+33048
ADDP4
INDIRI4
ASGNI4
line 3017
;3016:
;3017:    for( i = 0; i < lineNum; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1432
JUMPV
LABELV $1429
line 3018
;3018:    {
line 3019
;3019:      item->textRect.x = awc[ cache ].lineOffsets[ i ][ 0 ];
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 33052
ADDRLP4 1044
INDIRI4
MULI4
ADDRGP4 awc+32792
ADDP4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 3020
;3020:      item->textRect.y = awc[ cache ].lineOffsets[ i ][ 1 ];
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 33052
ADDRLP4 1044
INDIRI4
MULI4
ADDRGP4 awc+32792
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 3022
;3021:
;3022:      DC->drawText( item->textRect.x, item->textRect.y, item->textscale, color,
ADDRLP4 2144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2144
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 2144
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 2144
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 9
LSHI4
CNSTI4 33052
ADDRLP4 1044
INDIRI4
MULI4
ADDRGP4 awc+16408
ADDP4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2144
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3024
;3023:                    awc[ cache ].lines[ i ], 0, 0, item->textStyle );
;3024:    }
LABELV $1430
line 3017
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1432
ADDRLP4 4
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $1429
line 3025
;3025:  }
ADDRGP4 $1427
JUMPV
LABELV $1426
line 3027
;3026:  else
;3027:  {
line 3028
;3028:    y = item->textaligny;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
ASGNF4
line 3029
;3029:    len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3030
;3030:    buff[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 3031
;3031:    newLine = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3032
;3032:    newLineWidth = 0;
ADDRLP4 1064
CNSTI4 0
ASGNI4
line 3033
;3033:    p = textPtr;
ADDRLP4 0
ADDRLP4 1088
INDIRP4
ASGNP4
line 3035
;3034:
;3035:    totalLines = Item_Text_AutoWrapped_Lines( item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2144
ADDRGP4 Item_Text_AutoWrapped_Lines
CALLI4
ASGNI4
ADDRLP4 1108
ADDRLP4 2144
INDIRI4
ASGNI4
line 3037
;3036:
;3037:    totalY = totalLines * ( height + 5 );
ADDRLP4 1112
ADDRLP4 1108
INDIRI4
ADDRLP4 1092
INDIRI4
CNSTI4 5
ADDI4
MULI4
CVIF4 4
ASGNF4
line 3038
;3038:    diffY = totalY - item->window.rect.h;
ADDRLP4 1104
ADDRLP4 1112
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3040
;3039:
;3040:    if( diffY > 0.0f )
ADDRLP4 1104
INDIRF4
CNSTF4 0
LEF4 $1436
line 3041
;3041:      skipLines = (int)( diffY / ( (float)height + 5.0f ) );
ADDRLP4 1068
ADDRLP4 1104
INDIRF4
ADDRLP4 1092
INDIRI4
CVIF4 4
CNSTF4 1084227584
ADDF4
DIVF4
CVFI4 4
ASGNI4
ADDRGP4 $1437
JUMPV
LABELV $1436
line 3043
;3042:    else
;3043:      skipLines = 0;
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1437
line 3046
;3044:
;3045:    //set up a cache entry
;3046:    strcpy( awc[ cacheIndex ].text, textPtr );
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3047
;3047:    awc[ cacheIndex ].rect.x = item->window.rect.x;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16384
ADDP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 3048
;3048:    awc[ cacheIndex ].rect.y = item->window.rect.y;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16384+4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 3049
;3049:    awc[ cacheIndex ].rect.w = item->window.rect.w;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16384+8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 3050
;3050:    awc[ cacheIndex ].rect.h = item->window.rect.h;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16384+12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 3051
;3051:    awc[ cacheIndex ].textWidth = width;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16400
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 3052
;3052:    awc[ cacheIndex ].textHeight = height;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16404
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
ADDRGP4 $1448
JUMPV
LABELV $1447
line 3055
;3053:
;3054:    while( p )
;3055:    {
line 3056
;3056:      textWidth = DC->textWidth( buff, item->textscale, 0 );
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2148
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2148
INDIRI4
ASGNI4
line 3058
;3057:
;3058:      if( *p == '^' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1450
line 3059
;3059:      {
line 3060
;3060:        lastCMod[ 0 ] = p[ 0 ];
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 3061
;3061:        lastCMod[ 1 ] = p[ 1 ];
ADDRLP4 1048+1
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
ASGNI1
line 3062
;3062:      }
LABELV $1450
line 3064
;3063:
;3064:      if( *p == ' ' || *p == '\t' || *p == '\n' || *p == '\0' )
ADDRLP4 2152
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 32
EQI4 $1457
ADDRLP4 2152
INDIRI4
CNSTI4 9
EQI4 $1457
ADDRLP4 2152
INDIRI4
CNSTI4 10
EQI4 $1457
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $1453
LABELV $1457
line 3065
;3065:      {
line 3066
;3066:        newLine = len;
ADDRLP4 1040
ADDRLP4 8
INDIRI4
ASGNI4
line 3067
;3067:        newLinePtr = p+1;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3068
;3068:        newLineWidth = textWidth;
ADDRLP4 1064
ADDRLP4 1036
INDIRI4
ASGNI4
line 3070
;3069:
;3070:        if( *p == '\n' ) //don't forward colours past deilberate \n's
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1458
line 3071
;3071:          lastCMod[ 0 ] = lastCMod[ 1 ] = 0;
ADDRLP4 2156
CNSTI1 0
ASGNI1
ADDRLP4 1048+1
ADDRLP4 2156
INDIRI1
ASGNI1
ADDRLP4 1048
ADDRLP4 2156
INDIRI1
ASGNI1
ADDRGP4 $1459
JUMPV
LABELV $1458
line 3073
;3072:        else
;3073:          forwardColor = qtrue;
ADDRLP4 1060
CNSTI4 1
ASGNI4
LABELV $1459
line 3074
;3074:      }
LABELV $1453
line 3077
;3075:
;3076:      //TA: forceably split lines that are too long (where normal splitage has failed)
;3077:      if( textWidth > item->window.rect.w && newLine == 0 && *p != '\n' )
ADDRLP4 1036
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LEF4 $1461
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1461
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
EQI4 $1461
line 3078
;3078:      {
line 3079
;3079:        newLine = len;
ADDRLP4 1040
ADDRLP4 8
INDIRI4
ASGNI4
line 3080
;3080:        newLinePtr = p;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
ASGNP4
line 3081
;3081:        newLineWidth = textWidth;
ADDRLP4 1064
ADDRLP4 1036
INDIRI4
ASGNI4
line 3083
;3082:
;3083:        forwardColor = qtrue;
ADDRLP4 1060
CNSTI4 1
ASGNI4
line 3084
;3084:      }
LABELV $1461
line 3086
;3085:
;3086:      if( ( newLine && textWidth > item->window.rect.w ) || *p == '\n' || *p == '\0' )
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $1466
ADDRLP4 1036
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GTF4 $1467
LABELV $1466
ADDRLP4 2156
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 10
EQI4 $1467
ADDRLP4 2156
INDIRI4
CNSTI4 0
NEI4 $1463
LABELV $1467
line 3087
;3087:      {
line 3088
;3088:        if( len )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1468
line 3089
;3089:        {
line 3090
;3090:          if( item->textalignment == ITEM_ALIGN_LEFT )
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1470
line 3091
;3091:            item->textRect.x = item->textalignx;
ADDRLP4 2160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2160
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 2160
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $1471
JUMPV
LABELV $1470
line 3092
;3092:          else if( item->textalignment == ITEM_ALIGN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1472
line 3093
;3093:            item->textRect.x = item->textalignx - newLineWidth;
ADDRLP4 2164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2164
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 2164
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
SUBF4
ASGNF4
ADDRGP4 $1473
JUMPV
LABELV $1472
line 3094
;3094:          else if( item->textalignment == ITEM_ALIGN_CENTER )
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1474
line 3095
;3095:            item->textRect.x = item->textalignx - newLineWidth / 2;
ADDRLP4 2168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2168
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 2168
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ADDRLP4 1064
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
LABELV $1474
LABELV $1473
LABELV $1471
line 3097
;3096:
;3097:          item->textRect.y = y;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1096
INDIRF4
ASGNF4
line 3098
;3098:          ToWindowCoords( &item->textRect.x, &item->textRect.y, &item->window );
ADDRLP4 2172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2172
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 2172
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2172
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 3100
;3099:          //
;3100:          buff[ newLine ] = '\0';
ADDRLP4 1040
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 3102
;3101:
;3102:          if( !skipLines )
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1476
line 3103
;3103:          {
line 3104
;3104:            DC->drawText( item->textRect.x, item->textRect.y, item->textscale, color, buff, 0, 0, item->textStyle );
ADDRLP4 2176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2176
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 2176
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 2176
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2176
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3106
;3105:
;3106:            strcpy( awc[ cacheIndex ].lines[ lineNum ], buff );
ADDRLP4 1052
INDIRI4
CNSTI4 9
LSHI4
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+16408
ADDP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3107
;3107:            awc[ cacheIndex ].lineOffsets[ lineNum ][ 0 ] = item->textRect.x;
ADDRLP4 1052
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+32792
ADDP4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 3108
;3108:            awc[ cacheIndex ].lineOffsets[ lineNum ][ 1 ] = item->textRect.y;
ADDRLP4 1052
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+32792
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 3110
;3109:
;3110:            lineNum++;
ADDRLP4 1052
ADDRLP4 1052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3111
;3111:          }
LABELV $1476
line 3112
;3112:        }
LABELV $1468
line 3113
;3113:        if( *p == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1481
line 3114
;3114:          break;
ADDRGP4 $1449
JUMPV
LABELV $1481
line 3117
;3115:
;3116:        //
;3117:        if( !skipLines )
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1483
line 3118
;3118:          y += height + 5;
ADDRLP4 1096
ADDRLP4 1096
INDIRF4
ADDRLP4 1092
INDIRI4
CNSTI4 5
ADDI4
CVIF4 4
ADDF4
ASGNF4
LABELV $1483
line 3120
;3119:
;3120:        if( skipLines )
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1485
line 3121
;3121:          skipLines--;
ADDRLP4 1068
ADDRLP4 1068
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1485
line 3123
;3122:
;3123:        p = newLinePtr;
ADDRLP4 0
ADDRLP4 1056
INDIRP4
ASGNP4
line 3124
;3124:        len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3125
;3125:        newLine = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3126
;3126:        newLineWidth = 0;
ADDRLP4 1064
CNSTI4 0
ASGNI4
line 3128
;3127:
;3128:        if( forwardColor && lastCMod[ 0 ] != 0 )
ADDRLP4 2160
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 2160
INDIRI4
EQI4 $1448
ADDRLP4 1048
INDIRI1
CVII4 1
ADDRLP4 2160
INDIRI4
EQI4 $1448
line 3129
;3129:        {
line 3130
;3130:          buff[ len++ ] = lastCMod[ 0 ];
ADDRLP4 2164
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 2164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2164
INDIRI4
ADDRLP4 12
ADDP4
ADDRLP4 1048
INDIRI1
ASGNI1
line 3131
;3131:          buff[ len++ ] = lastCMod[ 1 ];
ADDRLP4 2168
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 2168
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2168
INDIRI4
ADDRLP4 12
ADDP4
ADDRLP4 1048+1
INDIRI1
ASGNI1
line 3132
;3132:          buff[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 3134
;3133:
;3134:          forwardColor = qfalse;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 3135
;3135:        }
line 3137
;3136:
;3137:        continue;
ADDRGP4 $1448
JUMPV
LABELV $1463
line 3140
;3138:      }
;3139:
;3140:      buff[ len++ ] = *p++;
ADDRLP4 2160
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 2168
CNSTI4 1
ASGNI4
ADDRLP4 8
ADDRLP4 2160
INDIRI4
ADDRLP4 2168
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 2164
INDIRP4
ADDRLP4 2168
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2160
INDIRI4
ADDRLP4 12
ADDP4
ADDRLP4 2164
INDIRP4
INDIRI1
ASGNI1
line 3141
;3141:      buff[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 3142
;3142:    }
LABELV $1448
line 3054
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1447
LABELV $1449
line 3145
;3143:
;3144:    //mark the end of the lines list
;3145:    awc[ cacheIndex ].numLines = lineNum;
CNSTI4 33052
ADDRGP4 cacheIndex
INDIRI4
MULI4
ADDRGP4 awc+33048
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 3148
;3146:
;3147:    //increment cacheIndex
;3148:    cacheIndex = ( cacheIndex + 1 ) % MAX_AUTOWRAP_CACHE;
ADDRLP4 2148
ADDRGP4 cacheIndex
ASGNP4
ADDRLP4 2148
INDIRP4
ADDRLP4 2148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 16
MODI4
ASGNI4
line 3149
;3149:  }
LABELV $1427
line 3150
;3150:}
LABELV $1418
endproc Item_Text_AutoWrapped_Paint 2180 32
export Item_Text_Wrapped_Paint
proc Item_Text_Wrapped_Paint 2112 32
line 3152
;3151:
;3152:void Item_Text_Wrapped_Paint(itemDef_t *item) {
line 3163
;3153:  char text[1024];
;3154:  const char *p, *start, *textPtr;
;3155:  char buff[1024];
;3156:  int width, height;
;3157:  float x, y;
;3158:  vec4_t color;
;3159:
;3160:  // now paint the text and/or any optional images
;3161:  // default to left
;3162:
;3163:  if (item->text == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1492
line 3164
;3164:    if (item->cvar == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1494
line 3165
;3165:      return;
ADDRGP4 $1491
JUMPV
LABELV $1494
line 3167
;3166:    }
;3167:    else {
line 3168
;3168:      DC->getCVarString(item->cvar, text, sizeof(text));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 3169
;3169:      textPtr = text;
ADDRLP4 1060
ADDRLP4 1068
ASGNP4
line 3170
;3170:    }
line 3171
;3171:  }
ADDRGP4 $1493
JUMPV
LABELV $1492
line 3172
;3172:  else {
line 3173
;3173:    textPtr = item->text;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
line 3174
;3174:  }
LABELV $1493
line 3175
;3175:  if (*textPtr == '\0') {
ADDRLP4 1060
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1496
line 3176
;3176:    return;
ADDRGP4 $1491
JUMPV
LABELV $1496
line 3179
;3177:  }
;3178:
;3179:  Item_TextColor(item, &color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3180
;3180:  Item_SetTextExtents(item, &width, &height, textPtr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3182
;3181:
;3182:  x = item->textRect.x;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ASGNF4
line 3183
;3183:  y = item->textRect.y;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ASGNF4
line 3184
;3184:  start = textPtr;
ADDRLP4 4
ADDRLP4 1060
INDIRP4
ASGNP4
line 3185
;3185:  p = strchr(textPtr, '\r');
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2092
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2092
INDIRP4
ASGNP4
ADDRGP4 $1499
JUMPV
LABELV $1498
line 3186
;3186:  while (p && *p) {
line 3187
;3187:    strncpy(buff, start, p-start+1);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 3188
;3188:    buff[p-start] = '\0';
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 3189
;3189:    DC->drawText(x, y, item->textscale, color, buff, 0, 0, item->textStyle);
ADDRLP4 1036
INDIRF4
ARGF4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 2100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2100
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2100
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3190
;3190:    y += height + 5;
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 1056
INDIRI4
CNSTI4 5
ADDI4
CVIF4 4
ADDF4
ASGNF4
line 3191
;3191:    start += p - start + 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 3192
;3192:    p = strchr(p+1, '\r');
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2108
INDIRP4
ASGNP4
line 3193
;3193:  }
LABELV $1499
line 3186
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1501
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1498
LABELV $1501
line 3194
;3194:  DC->drawText(x, y, item->textscale, color, start, 0, 0, item->textStyle);
ADDRLP4 1036
INDIRF4
ARGF4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 2100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2100
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2100
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3195
;3195:}
LABELV $1491
endproc Item_Text_Wrapped_Paint 2112 32
export Item_Text_Paint
proc Item_Text_Paint 1056 32
line 3197
;3196:
;3197:void Item_Text_Paint(itemDef_t *item) {
line 3203
;3198:  char text[1024];
;3199:  const char *textPtr;
;3200:  int height, width;
;3201:  vec4_t color;
;3202:
;3203:  if (item->window.flags & WINDOW_WRAPPED) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $1503
line 3204
;3204:    Item_Text_Wrapped_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Wrapped_Paint
CALLV
pop
line 3205
;3205:    return;
ADDRGP4 $1502
JUMPV
LABELV $1503
line 3207
;3206:  }
;3207:  if (item->window.flags & WINDOW_AUTOWRAPPED) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $1505
line 3208
;3208:    Item_Text_AutoWrapped_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_AutoWrapped_Paint
CALLV
pop
line 3209
;3209:    return;
ADDRGP4 $1502
JUMPV
LABELV $1505
line 3212
;3210:  }
;3211:
;3212:  if (item->text == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1507
line 3213
;3213:    if (item->cvar == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1509
line 3214
;3214:      return;
ADDRGP4 $1502
JUMPV
LABELV $1509
line 3216
;3215:    }
;3216:    else {
line 3217
;3217:      DC->getCVarString(item->cvar, text, sizeof(text));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 3218
;3218:      textPtr = text;
ADDRLP4 0
ADDRLP4 28
ASGNP4
line 3219
;3219:    }
line 3220
;3220:  }
ADDRGP4 $1508
JUMPV
LABELV $1507
line 3221
;3221:  else {
line 3222
;3222:    textPtr = item->text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
line 3223
;3223:  }
LABELV $1508
line 3226
;3224:
;3225:  // this needs to go here as it sets extents for cvar types as well
;3226:  Item_SetTextExtents(item, &width, &height, textPtr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3228
;3227:
;3228:  if (*textPtr == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1511
line 3229
;3229:    return;
ADDRGP4 $1502
JUMPV
LABELV $1511
line 3233
;3230:  }
;3231:
;3232:
;3233:  Item_TextColor(item, &color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3264
;3234:
;3235:  //FIXME: this is a fucking mess
;3236:/*
;3237:  adjust = 0;
;3238:  if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3239:    adjust = 0.5;
;3240:  }
;3241:
;3242:  if (item->textStyle == ITEM_TEXTSTYLE_SHADOWED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3243:    Fade(&item->window.flags, &DC->Assets.shadowColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, qfalse);
;3244:    DC->drawText(item->textRect.x + DC->Assets.shadowX, item->textRect.y + DC->Assets.shadowY, item->textscale, DC->Assets.shadowColor, textPtr, adjust);
;3245:  }
;3246:*/
;3247:
;3248:
;3249://  if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3250://    Fade(&item->window.flags, &item->window.outlineColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, qfalse);
;3251://    /*
;3252://    Text_Paint(item->textRect.x-1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3253://    Text_Paint(item->textRect.x, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3254://    Text_Paint(item->textRect.x+1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3255://    Text_Paint(item->textRect.x-1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
;3256://    Text_Paint(item->textRect.x+1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
;3257://    Text_Paint(item->textRect.x-1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3258://    Text_Paint(item->textRect.x, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3259://    Text_Paint(item->textRect.x+1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3260://    */
;3261://    DC->drawText(item->textRect.x - 1, item->textRect.y + 1, item->textscale * 1.02, item->window.outlineColor, textPtr, adjust);
;3262://  }
;3263:
;3264:  DC->drawText(item->textRect.x, item->textRect.y, item->textscale, color, textPtr, 0, 0, item->textStyle);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 1052
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 1052
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1052
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3265
;3265:}
LABELV $1502
endproc Item_Text_Paint 1056 32
export Item_TextField_Paint
proc Item_TextField_Paint 1088 36
line 3272
;3266:
;3267:
;3268:
;3269://float     trap_Cvar_VariableValue( const char *var_name );
;3270://void      trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;3271:
;3272:void Item_TextField_Paint(itemDef_t *item) {
line 3276
;3273:  char buff[1024];
;3274:  vec4_t newColor;
;3275:  int offset;
;3276:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3277
;3277:  editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 3279
;3278:
;3279:  Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3281
;3280:
;3281:  buff[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 3283
;3282:
;3283:  if (item->cvar) {
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1514
line 3284
;3284:    DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 3285
;3285:  }
LABELV $1514
line 3287
;3286:
;3287:  parent = (menuDef_t*)item->parent;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3289
;3288:
;3289:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1516
line 3296
;3290:/*    lowLight[0] = 0.8 * parent->focusColor[0];
;3291:    lowLight[1] = 0.8 * parent->focusColor[1];
;3292:    lowLight[2] = 0.8 * parent->focusColor[2];
;3293:    lowLight[3] = 0.8 * parent->focusColor[3];
;3294:    LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;3295:    //TA:
;3296:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 1032
ARGP4
ADDRLP4 1028
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3297
;3297:  } else {
ADDRGP4 $1517
JUMPV
LABELV $1516
line 3298
;3298:    memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 1032
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3299
;3299:  }
LABELV $1517
line 3301
;3300:
;3301:  offset = (item->text && *item->text) ? 8 : 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1519
ADDRLP4 1056
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1519
ADDRLP4 1052
CNSTI4 8
ASGNI4
ADDRGP4 $1520
JUMPV
LABELV $1519
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $1520
ADDRLP4 1048
ADDRLP4 1052
INDIRI4
ASGNI4
line 3302
;3302:  if (item->window.flags & WINDOW_HASFOCUS && g_editingField) {
ADDRLP4 1060
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 1060
INDIRI4
EQI4 $1521
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 1060
INDIRI4
EQI4 $1521
line 3303
;3303:    char cursor = DC->getOverstrikeMode() ? '_' : '|';
ADDRLP4 1072
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1524
ADDRLP4 1068
CNSTI4 95
ASGNI4
ADDRGP4 $1525
JUMPV
LABELV $1524
ADDRLP4 1068
CNSTI4 124
ASGNI4
LABELV $1525
ADDRLP4 1064
ADDRLP4 1068
INDIRI4
CVII1 4
ASGNI1
line 3304
;3304:    DC->drawTextWithCursor(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, item->cursorPos - editPtr->paintOffset , cursor, editPtr->maxPaintChars, item->textStyle);
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 1076
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
ADDRLP4 1048
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 1076
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 1076
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1032
ARGP4
ADDRLP4 1084
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1084
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1076
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 1084
INDIRI4
SUBI4
ARGI4
ADDRLP4 1064
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1076
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 3305
;3305:  } else {
ADDRGP4 $1522
JUMPV
LABELV $1521
line 3306
;3306:    DC->drawText(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, 0, editPtr->maxPaintChars, item->textStyle);
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 1064
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
ADDRLP4 1048
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 1064
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 1064
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 1032
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1064
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3307
;3307:  }
LABELV $1522
line 3309
;3308:
;3309:}
LABELV $1513
endproc Item_TextField_Paint 1088 36
export Item_YesNo_Paint
proc Item_YesNo_Paint 40 32
line 3311
;3310:
;3311:void Item_YesNo_Paint(itemDef_t *item) {
line 3314
;3312:  vec4_t newColor;
;3313:  float value;
;3314:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3316
;3315:
;3316:  value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1528
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 28
INDIRF4
ASGNF4
ADDRGP4 $1529
JUMPV
LABELV $1528
ADDRLP4 24
CNSTF4 0
ASGNF4
LABELV $1529
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 3318
;3317:
;3318:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1530
line 3325
;3319:/*    lowLight[0] = 0.8 * parent->focusColor[0];
;3320:    lowLight[1] = 0.8 * parent->focusColor[1];
;3321:    lowLight[2] = 0.8 * parent->focusColor[2];
;3322:    lowLight[3] = 0.8 * parent->focusColor[3];
;3323:    LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;3324:    //TA:
;3325:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3326
;3326:  } else {
ADDRGP4 $1531
JUMPV
LABELV $1530
line 3327
;3327:    memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3328
;3328:  }
LABELV $1531
line 3330
;3329:
;3330:  if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1532
line 3331
;3331:    Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3332
;3332:    DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $1537
ADDRLP4 32
ADDRGP4 $1534
ASGNP4
ADDRGP4 $1538
JUMPV
LABELV $1537
ADDRLP4 32
ADDRGP4 $1535
ASGNP4
LABELV $1538
ADDRLP4 32
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3333
;3333:  } else {
ADDRGP4 $1533
JUMPV
LABELV $1532
line 3334
;3334:    DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $1540
ADDRLP4 32
ADDRGP4 $1534
ASGNP4
ADDRGP4 $1541
JUMPV
LABELV $1540
ADDRLP4 32
ADDRGP4 $1535
ASGNP4
LABELV $1541
ADDRLP4 32
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3335
;3335:  }
LABELV $1533
line 3336
;3336:}
LABELV $1526
endproc Item_YesNo_Paint 40 32
export Item_Multi_Paint
proc Item_Multi_Paint 32 32
line 3338
;3337:
;3338:void Item_Multi_Paint(itemDef_t *item) {
line 3340
;3339:  vec4_t newColor;
;3340:  const char *text = "";
ADDRLP4 0
ADDRGP4 $58
ASGNP4
line 3341
;3341:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3343
;3342:
;3343:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1543
line 3350
;3344:/*    lowLight[0] = 0.8 * parent->focusColor[0];
;3345:    lowLight[1] = 0.8 * parent->focusColor[1];
;3346:    lowLight[2] = 0.8 * parent->focusColor[2];
;3347:    lowLight[3] = 0.8 * parent->focusColor[3];
;3348:    LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;3349:    //TA:
;3350:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3351
;3351:  } else {
ADDRGP4 $1544
JUMPV
LABELV $1543
line 3352
;3352:    memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3353
;3353:  }
LABELV $1544
line 3355
;3354:
;3355:  text = Item_Multi_Setting(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Item_Multi_Setting
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 3357
;3356:
;3357:  if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1545
line 3358
;3358:    Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3359
;3359:    DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3360
;3360:  } else {
ADDRGP4 $1546
JUMPV
LABELV $1545
line 3361
;3361:    DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3362
;3362:  }
LABELV $1546
line 3363
;3363:}
LABELV $1542
endproc Item_Multi_Paint 32 32
data
align 4
LABELV g_bindings
address $1549
byte 4 9
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1550
byte 4 13
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1551
byte 4 138
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1552
byte 4 120
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1553
byte 4 132
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1554
byte 4 133
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1555
byte 4 44
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1556
byte 4 46
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1557
byte 4 32
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1558
byte 4 99
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1559
byte 4 134
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1560
byte 4 135
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1561
byte 4 136
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1562
byte 4 141
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1563
byte 4 140
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1564
byte 4 47
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1565
byte 4 144
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1566
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1567
byte 4 49
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1568
byte 4 50
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1569
byte 4 51
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1570
byte 4 52
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1571
byte 4 53
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1572
byte 4 54
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1573
byte 4 55
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1574
byte 4 56
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1575
byte 4 57
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1576
byte 4 48
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1577
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1578
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1579
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1580
byte 4 178
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1581
byte 4 179
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1582
byte 4 114
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1583
byte 4 98
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1584
byte 4 109
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1585
byte 4 113
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1586
byte 4 101
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1587
byte 4 91
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1588
byte 4 93
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1589
byte 4 180
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1590
byte 4 181
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1591
byte 4 119
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1592
byte 4 114
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1593
byte 4 116
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1594
byte 4 121
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1595
byte 4 110
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1596
byte 4 111
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1597
byte 4 100
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1598
byte 4 112
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1599
byte 4 99
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1600
byte 4 102
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1601
byte 4 118
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1602
byte 4 108
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1603
byte 4 105
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1604
byte 4 107
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1605
byte 4 145
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1606
byte 4 146
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1607
byte 4 147
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1608
byte 4 148
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1609
byte 4 149
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1610
byte 4 162
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1611
byte 4 168
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1612
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1613
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1614
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1615
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
lit
align 4
LABELV g_bindCount
byte 4 67
code
proc Controls_GetKeyAssignment 276 12
line 3464
;3364:
;3365:
;3366:typedef struct {
;3367:  char  *command;
;3368:  int   id;
;3369:  int   defaultbind1;
;3370:  int   defaultbind2;
;3371:  int   bind1;
;3372:  int   bind2;
;3373:} bind_t;
;3374:
;3375:typedef struct
;3376:{
;3377:  char* name;
;3378:  float defaultvalue;
;3379:  float value;
;3380:} configcvar_t;
;3381:
;3382:
;3383:static bind_t g_bindings[] =
;3384:{
;3385:  { "+scores",      K_TAB,         -1, -1, -1 },
;3386:  { "+button2",     K_ENTER,       -1, -1, -1 },
;3387:  { "+speed",       K_SHIFT,       -1, -1, -1 },
;3388:  { "boost",        'x',           -1, -1, -1 }, //TA: human sprinting
;3389:  { "+forward",     K_UPARROW,     -1, -1, -1 },
;3390:  { "+back",        K_DOWNARROW,   -1, -1, -1 },
;3391:  { "+moveleft",    ',',           -1, -1, -1 },
;3392:  { "+moveright",   '.',           -1, -1, -1 },
;3393:  { "+moveup",      K_SPACE,       -1, -1, -1 },
;3394:  { "+movedown",    'c',           -1, -1, -1 },
;3395:  { "+left",        K_LEFTARROW,   -1, -1, -1 },
;3396:  { "+right",       K_RIGHTARROW,  -1, -1, -1 },
;3397:  { "+strafe",      K_ALT,         -1, -1, -1 },
;3398:  { "+lookup",      K_PGDN,        -1, -1, -1 },
;3399:  { "+lookdown",    K_DEL,         -1, -1, -1 },
;3400:  { "+mlook",       '/',           -1, -1, -1 },
;3401:  { "centerview",   K_END,         -1, -1, -1 },
;3402:  { "+zoom",        -1,            -1, -1, -1 },
;3403:  { "weapon 1",     '1',           -1, -1, -1 },
;3404:  { "weapon 2",     '2',           -1, -1, -1 },
;3405:  { "weapon 3",     '3',           -1, -1, -1 },
;3406:  { "weapon 4",     '4',           -1, -1, -1 },
;3407:  { "weapon 5",     '5',           -1, -1, -1 },
;3408:  { "weapon 6",     '6',           -1, -1, -1 },
;3409:  { "weapon 7",     '7',           -1, -1, -1 },
;3410:  { "weapon 8",     '8',           -1, -1, -1 },
;3411:  { "weapon 9",     '9',           -1, -1, -1 },
;3412:  { "weapon 10",    '0',           -1, -1, -1 },
;3413:  { "weapon 11",    -1,            -1, -1, -1 },
;3414:  { "weapon 12",    -1,            -1, -1, -1 },
;3415:  { "weapon 13",    -1,            -1, -1, -1 },
;3416:  { "+attack",      K_MOUSE1,      -1, -1, -1 },
;3417:  { "+button5",     K_MOUSE2,      -1, -1, -1 }, //TA: secondary attack
;3418:  { "reload",       'r',           -1, -1, -1 }, //TA: reload
;3419:  { "buy ammo",     'b',           -1, -1, -1 }, //TA: buy ammo
;3420:  { "itemact medkit", 'm',         -1, -1, -1 }, //TA: use medkit
;3421:  { "+button7",     'q',           -1, -1, -1 }, //TA: buildable use
;3422:  { "deconstruct",  'e',           -1, -1, -1 }, //TA: buildable destroy
;3423:  { "weapprev",     '[',           -1, -1, -1 },
;3424:  { "weapnext",     ']',           -1, -1, -1 },
;3425:  { "+button3",     K_MOUSE3,      -1, -1, -1 },
;3426:  { "+button4",     K_MOUSE4,      -1, -1, -1 },
;3427:  { "prevTeamMember", 'w',         -1, -1, -1 },
;3428:  { "nextTeamMember", 'r',         -1, -1, -1 },
;3429:  { "nextOrder",    't',           -1, -1, -1 },
;3430:  { "confirmOrder", 'y',           -1, -1, -1 },
;3431:  { "denyOrder",    'n',           -1, -1, -1 },
;3432:  { "taskOffense",  'o',           -1, -1, -1 },
;3433:  { "taskDefense",  'd',           -1, -1, -1 },
;3434:  { "taskPatrol",   'p',           -1, -1, -1 },
;3435:  { "taskCamp",     'c',           -1, -1, -1 },
;3436:  { "taskFollow",   'f',           -1, -1, -1 },
;3437:  { "taskRetrieve", 'v',           -1, -1, -1 },
;3438:  { "taskEscort",   'l',           -1, -1, -1 },
;3439:  { "taskOwnFlag",  'i',           -1, -1, -1 },
;3440:  { "taskSuicide",  'k',           -1, -1, -1 },
;3441:  { "tauntKillInsult", K_F1,       -1, -1, -1 },
;3442:  { "tauntPraise",   K_F2,         -1, -1, -1 },
;3443:  { "tauntTaunt",    K_F3,         -1, -1, -1 },
;3444:  { "tauntDeathInsult", K_F4,      -1, -1, -1 },
;3445:  { "tauntGauntlet", K_F5,         -1, -1, -1 },
;3446:  { "scoresUp",      K_KP_PGUP,    -1, -1, -1 },
;3447:  { "scoresDown",    K_KP_PGDN,    -1, -1, -1 },
;3448:  // bk001205 - this one below was:  '-1'
;3449:  { "messagemode",  -1,            -1, -1, -1 },
;3450:  { "messagemode2", -1,            -1, -1, -1 },
;3451:  { "messagemode3", -1,            -1, -1, -1 },
;3452:  { "messagemode4", -1,            -1, -1, -1 }
;3453:};
;3454:
;3455:
;3456:static const int g_bindCount = sizeof(g_bindings) / sizeof(bind_t);
;3457:
;3458:/*
;3459:=================
;3460:Controls_GetKeyAssignment
;3461:=================
;3462:*/
;3463:static void Controls_GetKeyAssignment (char *command, int *twokeys)
;3464:{
line 3469
;3465:  int   count;
;3466:  int   j;
;3467:  char  b[256];
;3468:
;3469:  twokeys[0] = twokeys[1] = -1;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 268
CNSTI4 -1
ASGNI4
ADDRLP4 264
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 264
INDIRP4
ADDRLP4 268
INDIRI4
ASGNI4
line 3470
;3470:  count = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 3472
;3471:
;3472:  for ( j = 0; j < 256; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1617
line 3473
;3473:  {
line 3474
;3474:    DC->getBindingBuf( j, b, 256 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 140
ADDP4
INDIRP4
CALLV
pop
line 3475
;3475:    if ( *b == 0 ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1621
line 3476
;3476:      continue;
ADDRGP4 $1618
JUMPV
LABELV $1621
line 3478
;3477:    }
;3478:    if ( !Q_stricmp( b, command ) ) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $1623
line 3479
;3479:      twokeys[count] = j;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3480
;3480:      count++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3481
;3481:      if (count == 2) {
ADDRLP4 260
INDIRI4
CNSTI4 2
NEI4 $1625
line 3482
;3482:        break;
ADDRGP4 $1619
JUMPV
LABELV $1625
line 3484
;3483:      }
;3484:    }
LABELV $1623
line 3485
;3485:  }
LABELV $1618
line 3472
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1617
LABELV $1619
line 3486
;3486:}
LABELV $1616
endproc Controls_GetKeyAssignment 276 12
export Controls_GetConfig
proc Controls_GetConfig 12 8
line 3494
;3487:
;3488:/*
;3489:=================
;3490:Controls_GetConfig
;3491:=================
;3492:*/
;3493:void Controls_GetConfig( void )
;3494:{
line 3499
;3495:  int   i;
;3496:  int   twokeys[ 2 ];
;3497:
;3498:  // iterate each command, get its numeric binding
;3499:  for( i = 0; i < g_bindCount; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1631
JUMPV
LABELV $1628
line 3500
;3500:  {
line 3501
;3501:    Controls_GetKeyAssignment( g_bindings[ i ].command, twokeys );
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Controls_GetKeyAssignment
CALLV
pop
line 3503
;3502:
;3503:    g_bindings[ i ].bind1 = twokeys[ 0 ];
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 3504
;3504:    g_bindings[ i ].bind2 = twokeys[ 1 ];
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 3505
;3505:  }
LABELV $1629
line 3499
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1631
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1628
line 3515
;3506:
;3507:  //s_controls.invertmouse.curvalue  = DC->getCVarValue( "m_pitch" ) < 0;
;3508:  //s_controls.smoothmouse.curvalue  = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "m_filter" ) );
;3509:  //s_controls.alwaysrun.curvalue    = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cl_run" ) );
;3510:  //s_controls.autoswitch.curvalue   = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cg_autoswitch" ) );
;3511:  //s_controls.sensitivity.curvalue  = UI_ClampCvar( 2, 30, Controls_GetCvarValue( "sensitivity" ) );
;3512:  //s_controls.joyenable.curvalue    = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "in_joystick" ) );
;3513:  //s_controls.joythreshold.curvalue = UI_ClampCvar( 0.05, 0.75, Controls_GetCvarValue( "joy_threshold" ) );
;3514:  //s_controls.freelook.curvalue     = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cl_freelook" ) );
;3515:}
LABELV $1627
endproc Controls_GetConfig 12 8
export Controls_SetConfig
proc Controls_SetConfig 12 8
line 3523
;3516:
;3517:/*
;3518:=================
;3519:Controls_SetConfig
;3520:=================
;3521:*/
;3522:void Controls_SetConfig(qboolean restart)
;3523:{
line 3527
;3524:  int   i;
;3525:
;3526:  // iterate each command, get its numeric binding
;3527:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1639
JUMPV
LABELV $1636
line 3528
;3528:  {
line 3530
;3529:
;3530:    if (g_bindings[i].bind1 != -1)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1640
line 3531
;3531:    {
line 3532
;3532:      DC->setBinding( g_bindings[i].bind1, g_bindings[i].command );
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3534
;3533:
;3534:      if (g_bindings[i].bind2 != -1)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1644
line 3535
;3535:        DC->setBinding( g_bindings[i].bind2, g_bindings[i].command );
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
LABELV $1644
line 3536
;3536:    }
LABELV $1640
line 3537
;3537:  }
LABELV $1637
line 3527
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1639
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1636
line 3551
;3538:
;3539:  //if ( s_controls.invertmouse.curvalue )
;3540:  //  DC->setCVar("m_pitch", va("%f),-fabs( DC->getCVarValue( "m_pitch" ) ) );
;3541:  //else
;3542:  //  trap_Cvar_SetValue( "m_pitch", fabs( trap_Cvar_VariableValue( "m_pitch" ) ) );
;3543:
;3544:  //trap_Cvar_SetValue( "m_filter", s_controls.smoothmouse.curvalue );
;3545:  //trap_Cvar_SetValue( "cl_run", s_controls.alwaysrun.curvalue );
;3546:  //trap_Cvar_SetValue( "cg_autoswitch", s_controls.autoswitch.curvalue );
;3547:  //trap_Cvar_SetValue( "sensitivity", s_controls.sensitivity.curvalue );
;3548:  //trap_Cvar_SetValue( "in_joystick", s_controls.joyenable.curvalue );
;3549:  //trap_Cvar_SetValue( "joy_threshold", s_controls.joythreshold.curvalue );
;3550:  //trap_Cvar_SetValue( "cl_freelook", s_controls.freelook.curvalue );
;3551:  DC->executeText(EXEC_APPEND, "in_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $1648
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3553
;3552:  //trap_Cmd_ExecuteText( EXEC_APPEND, "in_restart\n" );
;3553:}
LABELV $1635
endproc Controls_SetConfig 12 8
export Controls_SetDefaults
proc Controls_SetDefaults 12 0
line 3561
;3554:
;3555:/*
;3556:=================
;3557:Controls_SetDefaults
;3558:=================
;3559:*/
;3560:void Controls_SetDefaults( void )
;3561:{
line 3565
;3562:  int i;
;3563:
;3564:  // iterate each command, set its default binding
;3565:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1653
JUMPV
LABELV $1650
line 3566
;3566:  {
line 3567
;3567:    g_bindings[i].bind1 = g_bindings[i].defaultbind1;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+8
ADDP4
INDIRI4
ASGNI4
line 3568
;3568:    g_bindings[i].bind2 = g_bindings[i].defaultbind2;
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+12
ADDP4
INDIRI4
ASGNI4
line 3569
;3569:  }
LABELV $1651
line 3565
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1653
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1650
line 3579
;3570:
;3571:  //s_controls.invertmouse.curvalue  = Controls_GetCvarDefault( "m_pitch" ) < 0;
;3572:  //s_controls.smoothmouse.curvalue  = Controls_GetCvarDefault( "m_filter" );
;3573:  //s_controls.alwaysrun.curvalue    = Controls_GetCvarDefault( "cl_run" );
;3574:  //s_controls.autoswitch.curvalue   = Controls_GetCvarDefault( "cg_autoswitch" );
;3575:  //s_controls.sensitivity.curvalue  = Controls_GetCvarDefault( "sensitivity" );
;3576:  //s_controls.joyenable.curvalue    = Controls_GetCvarDefault( "in_joystick" );
;3577:  //s_controls.joythreshold.curvalue = Controls_GetCvarDefault( "joy_threshold" );
;3578:  //s_controls.freelook.curvalue     = Controls_GetCvarDefault( "cl_freelook" );
;3579:}
LABELV $1649
endproc Controls_SetDefaults 12 0
export BindingIDFromName
proc BindingIDFromName 8 8
line 3581
;3580:
;3581:int BindingIDFromName(const char *name) {
line 3583
;3582:  int i;
;3583:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1662
JUMPV
LABELV $1659
line 3584
;3584:  {
line 3585
;3585:    if (Q_stricmp(name, g_bindings[i].command) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
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
NEI4 $1663
line 3586
;3586:      return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1658
JUMPV
LABELV $1663
line 3588
;3587:    }
;3588:  }
LABELV $1660
line 3583
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1662
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1659
line 3589
;3589:  return -1;
CNSTI4 -1
RETI4
LABELV $1658
endproc BindingIDFromName 8 8
export BindingFromName
proc BindingFromName 16 12
line 3595
;3590:}
;3591:
;3592:char g_nameBind1[32];
;3593:char g_nameBind2[32];
;3594:
;3595:void BindingFromName(const char *cvar) {
line 3599
;3596:  int i, b1, b2;
;3597:
;3598:  // iterate each command, set its default binding
;3599:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1669
JUMPV
LABELV $1666
line 3600
;3600:  {
line 3601
;3601:    if (Q_stricmp(cvar, g_bindings[i].command) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1670
line 3602
;3602:      b1 = g_bindings[i].bind1;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ASGNI4
line 3603
;3603:      if (b1 == -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $1673
line 3604
;3604:        break;
ADDRGP4 $1668
JUMPV
LABELV $1673
line 3606
;3605:      }
;3606:        DC->keynumToStringBuf( b1, g_nameBind1, 32 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 g_nameBind1
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 3607
;3607:        Q_strupr(g_nameBind1);
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3609
;3608:
;3609:        b2 = g_bindings[i].bind2;
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ASGNI4
line 3610
;3610:        if (b2 != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1665
line 3611
;3611:        {
line 3612
;3612:          DC->keynumToStringBuf( b2, g_nameBind2, 32 );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 g_nameBind2
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 3613
;3613:          Q_strupr(g_nameBind2);
ADDRGP4 g_nameBind2
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3614
;3614:          strcat( g_nameBind1, " or " );
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 $1678
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 3615
;3615:          strcat( g_nameBind1, g_nameBind2 );
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 g_nameBind2
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 3616
;3616:        }
line 3617
;3617:      return;
ADDRGP4 $1665
JUMPV
LABELV $1670
line 3619
;3618:    }
;3619:  }
LABELV $1667
line 3599
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1669
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1666
LABELV $1668
line 3620
;3620:  strcpy(g_nameBind1, "???");
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 $1679
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3621
;3621:}
LABELV $1665
endproc BindingFromName 16 12
export Item_Slider_Paint
proc Item_Slider_Paint 52 20
line 3623
;3622:
;3623:void Item_Slider_Paint(itemDef_t *item) {
line 3626
;3624:  vec4_t newColor;
;3625:  float x, y, value;
;3626:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3628
;3627:
;3628:  value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1682
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ASGNF4
ADDRGP4 $1683
JUMPV
LABELV $1682
ADDRLP4 32
CNSTF4 0
ASGNF4
LABELV $1683
ADDRLP4 28
ADDRLP4 32
INDIRF4
ASGNF4
line 3630
;3629:
;3630:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1684
line 3637
;3631:/*    lowLight[0] = 0.8 * parent->focusColor[0];
;3632:    lowLight[1] = 0.8 * parent->focusColor[1];
;3633:    lowLight[2] = 0.8 * parent->focusColor[2];
;3634:    lowLight[3] = 0.8 * parent->focusColor[3];
;3635:    LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;3636:    //TA:
;3637:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3638
;3638:  } else {
ADDRGP4 $1685
JUMPV
LABELV $1684
line 3639
;3639:    memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3640
;3640:  }
LABELV $1685
line 3642
;3641:
;3642:  y = item->window.rect.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 3643
;3643:  if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1686
line 3644
;3644:    Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3645
;3645:    x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3646
;3646:  } else {
ADDRGP4 $1687
JUMPV
LABELV $1686
line 3647
;3647:    x = item->window.rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 3648
;3648:  }
LABELV $1687
line 3649
;3649:  DC->setColor(newColor);
ADDRLP4 8
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 3650
;3650:  DC->drawHandlePic( x, y, SLIDER_WIDTH, SLIDER_HEIGHT, DC->Assets.sliderBar );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTF4 1119879168
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 40
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 61928
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3652
;3651:
;3652:  x = Item_Slider_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Item_Slider_ThumbPosition
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ASGNF4
line 3653
;3653:  DC->drawHandlePic( x - (SLIDER_THUMB_WIDTH / 2), y - 2, SLIDER_THUMB_WIDTH, SLIDER_THUMB_HEIGHT, DC->Assets.sliderThumb );
ADDRLP4 0
INDIRF4
CNSTF4 1086324736
SUBF4
ARGF4
ADDRLP4 4
INDIRF4
CNSTF4 1073741824
SUBF4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 61932
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3655
;3654:
;3655:}
LABELV $1680
endproc Item_Slider_Paint 52 20
export Item_Bind_Paint
proc Item_Bind_Paint 64 32
line 3657
;3656:
;3657:void Item_Bind_Paint(itemDef_t *item) {
line 3660
;3658:  vec4_t newColor, lowLight;
;3659:  float value;
;3660:  int maxChars = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3661
;3661:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 3662
;3662:  editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 3663
;3663:  if (editPtr) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1689
line 3664
;3664:    maxChars = editPtr->maxPaintChars;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 3665
;3665:  }
LABELV $1689
line 3667
;3666:
;3667:  value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1692
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
ASGNF4
ADDRGP4 $1693
JUMPV
LABELV $1692
ADDRLP4 48
CNSTF4 0
ASGNF4
LABELV $1693
ADDRLP4 44
ADDRLP4 48
INDIRF4
ASGNF4
line 3669
;3668:
;3669:  if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1694
line 3670
;3670:    if (g_bindItem == item) {
ADDRGP4 g_bindItem
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $1696
line 3671
;3671:      lowLight[0] = 0.8f * 1.0f;
ADDRLP4 28
CNSTF4 1061997773
ASGNF4
line 3672
;3672:      lowLight[1] = 0.8f * 0.0f;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 3673
;3673:      lowLight[2] = 0.8f * 0.0f;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 3674
;3674:      lowLight[3] = 0.8f * 1.0f;
ADDRLP4 28+12
CNSTF4 1061997773
ASGNF4
line 3675
;3675:    } else {
ADDRGP4 $1697
JUMPV
LABELV $1696
line 3676
;3676:      lowLight[0] = 0.8f * parent->focusColor[0];
ADDRLP4 28
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
MULF4
ASGNF4
line 3677
;3677:      lowLight[1] = 0.8f * parent->focusColor[1];
ADDRLP4 28+4
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
MULF4
ASGNF4
line 3678
;3678:      lowLight[2] = 0.8f * parent->focusColor[2];
ADDRLP4 28+8
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
MULF4
ASGNF4
line 3679
;3679:      lowLight[3] = 0.8f * parent->focusColor[3];
ADDRLP4 28+12
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
INDIRF4
MULF4
ASGNF4
line 3680
;3680:    }
LABELV $1697
line 3683
;3681:    /*LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;3682:    //TA:
;3683:    memcpy(newColor, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3684
;3684:  } else {
ADDRGP4 $1695
JUMPV
LABELV $1694
line 3685
;3685:    memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3686
;3686:  }
LABELV $1695
line 3688
;3687:
;3688:  if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1704
line 3689
;3689:    Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3690
;3690:    BindingFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRGP4 BindingFromName
CALLV
pop
line 3691
;3691:    DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, g_nameBind1, 0, maxChars, item->textStyle);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ARGP4
ADDRGP4 g_nameBind1
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3692
;3692:  } else {
ADDRGP4 $1705
JUMPV
LABELV $1704
line 3693
;3693:    DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, (value != 0) ? "FIXME" : "FIXME", 0, maxChars, item->textStyle);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ARGP4
ADDRLP4 44
INDIRF4
CNSTF4 0
EQF4 $1708
ADDRLP4 56
ADDRGP4 $1706
ASGNP4
ADDRGP4 $1709
JUMPV
LABELV $1708
ADDRLP4 56
ADDRGP4 $1706
ASGNP4
LABELV $1709
ADDRLP4 56
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3694
;3694:  }
LABELV $1705
line 3695
;3695:}
LABELV $1688
endproc Item_Bind_Paint 64 32
export Display_KeyBindPending
proc Display_KeyBindPending 0 0
line 3697
;3696:
;3697:qboolean Display_KeyBindPending( void ) {
line 3698
;3698:  return g_waitingForKey;
ADDRGP4 g_waitingForKey
INDIRI4
RETI4
LABELV $1710
endproc Display_KeyBindPending 0 0
export Item_Bind_HandleKey
proc Item_Bind_HandleKey 32 12
line 3701
;3699:}
;3700:
;3701:qboolean Item_Bind_HandleKey(itemDef_t *item, int key, qboolean down) {
line 3705
;3702:  int     id;
;3703:  int     i;
;3704:
;3705:  if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && !g_waitingForKey)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1712
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1712
line 3706
;3706:  {
line 3707
;3707:    if (down && (key == K_MOUSE1 || key == K_ENTER)) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1714
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 178
EQI4 $1716
ADDRLP4 20
INDIRI4
CNSTI4 13
NEI4 $1714
LABELV $1716
line 3708
;3708:      g_waitingForKey = qtrue;
ADDRGP4 g_waitingForKey
CNSTI4 1
ASGNI4
line 3709
;3709:      g_bindItem = item;
ADDRGP4 g_bindItem
ADDRFP4 0
INDIRP4
ASGNP4
line 3710
;3710:    }
LABELV $1714
line 3711
;3711:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1712
line 3714
;3712:  }
;3713:  else
;3714:  {
line 3715
;3715:    if (!g_waitingForKey || g_bindItem == NULL) {
ADDRGP4 g_waitingForKey
INDIRI4
CNSTI4 0
EQI4 $1719
ADDRGP4 g_bindItem
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1717
LABELV $1719
line 3716
;3716:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1717
line 3719
;3717:    }
;3718:
;3719:    if (key & K_CHAR_FLAG) {
ADDRFP4 4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1720
line 3720
;3720:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1720
line 3723
;3721:    }
;3722:
;3723:    switch (key)
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 96
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1730
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $1732
LABELV $1731
ADDRFP4 4
INDIRI4
CNSTI4 27
EQI4 $1724
ADDRGP4 $1722
JUMPV
LABELV $1732
ADDRFP4 4
INDIRI4
CNSTI4 127
EQI4 $1725
ADDRGP4 $1722
JUMPV
line 3724
;3724:    {
LABELV $1724
line 3726
;3725:      case K_ESCAPE:
;3726:        g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3727
;3727:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1725
line 3730
;3728:
;3729:      case K_BACKSPACE:
;3730:        id = BindingIDFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BindingIDFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 3731
;3731:        if (id != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1726
line 3732
;3732:          g_bindings[id].bind1 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
CNSTI4 -1
ASGNI4
line 3733
;3733:          g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3734
;3734:        }
LABELV $1726
line 3735
;3735:        Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3736
;3736:        g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3737
;3737:        g_bindItem = NULL;
ADDRGP4 g_bindItem
CNSTP4 0
ASGNP4
line 3738
;3738:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1730
line 3741
;3739:
;3740:      case '`':
;3741:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1711
JUMPV
LABELV $1722
line 3743
;3742:    }
;3743:  }
line 3745
;3744:
;3745:  if (key != -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
EQI4 $1733
line 3746
;3746:  {
line 3748
;3747:
;3748:    for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1738
JUMPV
LABELV $1735
line 3749
;3749:    {
line 3751
;3750:
;3751:      if (g_bindings[i].bind2 == key) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1739
line 3752
;3752:        g_bindings[i].bind2 = -1;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3753
;3753:      }
LABELV $1739
line 3755
;3754:
;3755:      if (g_bindings[i].bind1 == key)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1743
line 3756
;3756:      {
line 3757
;3757:        g_bindings[i].bind1 = g_bindings[i].bind2;
ADDRLP4 20
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ASGNI4
line 3758
;3758:        g_bindings[i].bind2 = -1;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3759
;3759:      }
LABELV $1743
line 3760
;3760:    }
LABELV $1736
line 3748
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1738
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1735
line 3761
;3761:  }
LABELV $1733
line 3764
;3762:
;3763:
;3764:  id = BindingIDFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BindingIDFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 3766
;3765:
;3766:  if (id != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1749
line 3767
;3767:    if (key == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $1751
line 3768
;3768:      if( g_bindings[id].bind1 != -1 ) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1753
line 3769
;3769:        DC->setBinding( g_bindings[id].bind1, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $58
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3770
;3770:        g_bindings[id].bind1 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
CNSTI4 -1
ASGNI4
line 3771
;3771:      }
LABELV $1753
line 3772
;3772:      if( g_bindings[id].bind2 != -1 ) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1752
line 3773
;3773:        DC->setBinding( g_bindings[id].bind2, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 $58
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3774
;3774:        g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3775
;3775:      }
line 3776
;3776:    }
ADDRGP4 $1752
JUMPV
LABELV $1751
line 3777
;3777:    else if (g_bindings[id].bind1 == -1) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1763
line 3778
;3778:      g_bindings[id].bind1 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3779
;3779:    }
ADDRGP4 $1764
JUMPV
LABELV $1763
line 3780
;3780:    else if (g_bindings[id].bind1 != key && g_bindings[id].bind2 == -1) {
ADDRLP4 24
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $1767
ADDRLP4 24
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1767
line 3781
;3781:      g_bindings[id].bind2 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3782
;3782:    }
ADDRGP4 $1768
JUMPV
LABELV $1767
line 3783
;3783:    else {
line 3784
;3784:      DC->setBinding( g_bindings[id].bind1, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $58
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3785
;3785:      DC->setBinding( g_bindings[id].bind2, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 $58
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3786
;3786:      g_bindings[id].bind1 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3787
;3787:      g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3788
;3788:    }
LABELV $1768
LABELV $1764
LABELV $1752
line 3789
;3789:  }
LABELV $1749
line 3791
;3790:
;3791:  Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3792
;3792:  g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3794
;3793:
;3794:  return qtrue;
CNSTI4 1
RETI4
LABELV $1711
endproc Item_Bind_HandleKey 32 12
export AdjustFrom640
proc AdjustFrom640 16 0
line 3799
;3795:}
;3796:
;3797:
;3798:
;3799:void AdjustFrom640(float *x, float *y, float *w, float *h) {
line 3801
;3800:  //*x = *x * DC->scale + DC->bias;
;3801:  *x *= DC->xscale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
line 3802
;3802:  *y *= DC->yscale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
MULF4
ASGNF4
line 3803
;3803:  *w *= DC->xscale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
line 3804
;3804:  *h *= DC->yscale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
MULF4
ASGNF4
line 3805
;3805:}
LABELV $1776
endproc AdjustFrom640 16 0
export Item_Model_Paint
proc Item_Model_Paint 588 16
line 3807
;3806:
;3807:void Item_Model_Paint(itemDef_t *item) {
line 3813
;3808:  float x, y, w, h;
;3809:  refdef_t refdef;
;3810:  refEntity_t   ent;
;3811:  vec3_t      mins, maxs, origin;
;3812:  vec3_t      angles;
;3813:  modelDef_t *modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 508
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 3815
;3814:
;3815:  if (modelPtr == NULL) {
ADDRLP4 508
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1778
line 3816
;3816:    return;
ADDRGP4 $1777
JUMPV
LABELV $1778
line 3820
;3817:  }
;3818:
;3819:  // setup the refdef
;3820:  memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3821
;3821:  refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 3822
;3822:  AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 3823
;3823:  x = item->window.rect.x+1;
ADDRLP4 568
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3824
;3824:  y = item->window.rect.y+1;
ADDRLP4 572
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3825
;3825:  w = item->window.rect.w-2;
ADDRLP4 524
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3826
;3826:  h = item->window.rect.h-2;
ADDRLP4 528
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3828
;3827:
;3828:  AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 568
ARGP4
ADDRLP4 572
ARGP4
ADDRLP4 524
ARGP4
ADDRLP4 528
ARGP4
ADDRGP4 AdjustFrom640
CALLV
pop
line 3830
;3829:
;3830:  refdef.x = x;
ADDRLP4 0
ADDRLP4 568
INDIRF4
CVFI4 4
ASGNI4
line 3831
;3831:  refdef.y = y;
ADDRLP4 0+4
ADDRLP4 572
INDIRF4
CVFI4 4
ASGNI4
line 3832
;3832:  refdef.width = w;
ADDRLP4 0+8
ADDRLP4 524
INDIRF4
CVFI4 4
ASGNI4
line 3833
;3833:  refdef.height = h;
ADDRLP4 0+12
ADDRLP4 528
INDIRF4
CVFI4 4
ASGNI4
line 3835
;3834:
;3835:  DC->modelBounds( item->asset, mins, maxs );
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ARGI4
ADDRLP4 544
ARGP4
ADDRLP4 556
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CALLV
pop
line 3837
;3836:
;3837:  origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 512+8
CNSTF4 3204448256
ADDRLP4 544+8
INDIRF4
ADDRLP4 556+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 3838
;3838:  origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 512+4
CNSTF4 1056964608
ADDRLP4 544+4
INDIRF4
ADDRLP4 556+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 3841
;3839:
;3840:  // calculate distance so the model nearly fills the box
;3841:  if (qtrue) {
line 3842
;3842:    float len = 0.5 * ( maxs[2] - mins[2] );
ADDRLP4 576
CNSTF4 1056964608
ADDRLP4 556+8
INDIRF4
ADDRLP4 544+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 3843
;3843:    origin[0] = len / 0.268;  // len / tan( fov/2 )
ADDRLP4 512
ADDRLP4 576
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 3845
;3844:    //origin[0] = len / tan(w/2);
;3845:  } else {
ADDRGP4 $1792
JUMPV
LABELV $1791
line 3846
;3846:    origin[0] = item->textscale;
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ASGNF4
line 3847
;3847:  }
LABELV $1792
line 3848
;3848:  refdef.fov_x = (modelPtr->fov_x) ? modelPtr->fov_x : w;
ADDRLP4 508
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1797
ADDRLP4 576
ADDRLP4 508
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $1798
JUMPV
LABELV $1797
ADDRLP4 576
ADDRLP4 524
INDIRF4
ASGNF4
LABELV $1798
ADDRLP4 0+16
ADDRLP4 576
INDIRF4
ASGNF4
line 3849
;3849:  refdef.fov_y = (modelPtr->fov_y) ? modelPtr->fov_y : h;
ADDRLP4 508
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1801
ADDRLP4 580
ADDRLP4 508
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $1802
JUMPV
LABELV $1801
ADDRLP4 580
ADDRLP4 528
INDIRF4
ASGNF4
LABELV $1802
ADDRLP4 0+20
ADDRLP4 580
INDIRF4
ASGNF4
line 3856
;3850:
;3851:  //refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
;3852:  //xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
;3853:  //refdef.fov_y = atan2( refdef.height, xx );
;3854:  //refdef.fov_y *= ( 360 / M_PI );
;3855:
;3856:  DC->clearScene();
ADDRGP4 DC
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
CALLV
pop
line 3858
;3857:
;3858:  refdef.time = DC->realTime;
ADDRLP4 0+72
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 3862
;3859:
;3860:  // add the model
;3861:
;3862:  memset( &ent, 0, sizeof(ent) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3869
;3863:
;3864:  //adjust = 5.0 * sin( (float)uis.realtime / 500 );
;3865:  //adjust = 360 % (int)((float)uis.realtime / 1000);
;3866:  //VectorSet( angles, 0, 0, 1 );
;3867:
;3868:  // use item storage to track
;3869:  if (modelPtr->rotationSpeed) {
ADDRLP4 508
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1804
line 3870
;3870:    if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LEI4 $1806
line 3871
;3871:      item->window.nextTime = DC->realTime + modelPtr->rotationSpeed;
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 508
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3872
;3872:      modelPtr->angle = (int)(modelPtr->angle + 1) % 360;
ADDRLP4 508
INDIRP4
ADDRLP4 508
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 360
MODI4
ASGNI4
line 3873
;3873:    }
LABELV $1806
line 3874
;3874:  }
LABELV $1804
line 3875
;3875:  VectorSet( angles, 0, modelPtr->angle, 0 );
ADDRLP4 532
CNSTF4 0
ASGNF4
ADDRLP4 532+4
ADDRLP4 508
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 532+8
CNSTF4 0
ASGNF4
line 3876
;3876:  AnglesToAxis( angles, ent.axis );
ADDRLP4 532
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3878
;3877:
;3878:  ent.hModel = item->asset;
ADDRLP4 368+8
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 3879
;3879:  VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRLP4 512
INDIRB
ASGNB 12
line 3880
;3880:  VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 368+12
ADDRLP4 512
INDIRB
ASGNB 12
line 3881
;3881:  ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 368+4
CNSTI4 192
ASGNI4
line 3882
;3882:  VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
line 3884
;3883:
;3884:  DC->addRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 56
ADDP4
INDIRP4
CALLV
pop
line 3885
;3885:  DC->renderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CALLV
pop
line 3887
;3886:
;3887:}
LABELV $1777
endproc Item_Model_Paint 588 16
export Item_Image_Paint
proc Item_Image_Paint 16 20
line 3890
;3888:
;3889:
;3890:void Item_Image_Paint(itemDef_t *item) {
line 3891
;3891:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1818
line 3892
;3892:    return;
ADDRGP4 $1817
JUMPV
LABELV $1818
line 3894
;3893:  }
;3894:  DC->drawHandlePic(item->window.rect.x+1, item->window.rect.y+1, item->window.rect.w-2, item->window.rect.h-2, item->asset);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 3895
;3895:}
LABELV $1817
endproc Item_Image_Paint 16 20
export Item_ListBox_Paint
proc Item_ListBox_Paint 124 32
line 3897
;3896:
;3897:void Item_ListBox_Paint(itemDef_t *item) {
line 3902
;3898:  float x, y, size, thumb;
;3899:  int i, count;
;3900:  qhandle_t image;
;3901:  qhandle_t optionalImage;
;3902:  listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 3908
;3903:
;3904:  // the listbox is horizontal or vertical and has a fixed size scroll bar going either direction
;3905:  // elements are enumerated from the DC and either text or image handles are acquired from the DC as well
;3906:  // textscale is used to size the text, textalignx and textaligny are used to size image elements
;3907:  // there is no clipping available so only the last completely visible item is painted
;3908:  count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 3910
;3909:  // default is vertical if horizontal flag is not here
;3910:  if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1821
line 3913
;3911:    // draw scrollbar in bottom of the window
;3912:    // bar
;3913:    x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3914
;3914:    y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE - 1;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 3915
;3915:    DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowLeft);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 61900
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3916
;3916:    x += SCROLLBAR_SIZE - 1;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3917
;3917:    size = item->window.rect.w - (SCROLLBAR_SIZE * 2);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3918
;3918:    DC->drawHandlePic(x, y, size+1, SCROLLBAR_SIZE, DC->Assets.scrollBar);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 52
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 61908
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3919
;3919:    x += size - 1;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ASGNF4
line 3920
;3920:    DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowRight);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1098907648
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 61904
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3922
;3921:    // thumb
;3922:    thumb = Item_ListBox_ThumbDrawPosition(item);//Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 Item_ListBox_ThumbDrawPosition
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 64
INDIRI4
CVIF4 4
ASGNF4
line 3923
;3923:    if (thumb > x - SCROLLBAR_SIZE - 1) {
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
LEF4 $1823
line 3924
;3924:      thumb = x - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 16
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 3925
;3925:    }
LABELV $1823
line 3926
;3926:    DC->drawHandlePic(thumb, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1098907648
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 61912
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3928
;3927:    //
;3928:    listPtr->endPos = listPtr->startPos;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 3929
;3929:    size = item->window.rect.w - 2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3932
;3930:    // items
;3931:    // size contains max available space
;3932:    if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1822
line 3934
;3933:      // fit = 0;
;3934:      x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3935
;3935:      y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3936
;3936:      for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $1830
JUMPV
LABELV $1827
line 3939
;3937:        // always draw at least one
;3938:        // which may overdraw the box if it is too small for the element
;3939:        image = DC->feederItemImage(item->special, i);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 128
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 80
INDIRI4
ASGNI4
line 3940
;3940:        if (image) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1831
line 3941
;3941:          DC->drawHandlePic(x+1, y+1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 92
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3942
;3942:        }
LABELV $1831
line 3944
;3943:
;3944:        if (i == item->cursorPos) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
NEI4 $1833
line 3945
;3945:          DC->drawRect(x, y, listPtr->elementWidth-1, listPtr->elementHeight-1, item->window.borderSize, item->window.borderColor);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 3946
;3946:        }
LABELV $1833
line 3948
;3947:
;3948:        listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3949
;3949:        size -= listPtr->elementWidth;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3950
;3950:        if (size < listPtr->elementWidth) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
GEF4 $1835
line 3951
;3951:          listPtr->drawPadding = size; //listPtr->elementWidth - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 3952
;3952:          break;
ADDRGP4 $1822
JUMPV
LABELV $1835
line 3954
;3953:        }
;3954:        x += listPtr->elementWidth;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3956
;3955:        // fit++;
;3956:      }
LABELV $1828
line 3936
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1830
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $1827
line 3957
;3957:    } else {
line 3959
;3958:      //
;3959:    }
line 3960
;3960:  } else {
ADDRGP4 $1822
JUMPV
LABELV $1821
line 3962
;3961:    // draw scrollbar to right side of the window
;3962:    x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE - 1;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 3963
;3963:    y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3964
;3964:    DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowUp);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 61892
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3965
;3965:    y += SCROLLBAR_SIZE - 1;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3967
;3966:
;3967:    listPtr->endPos = listPtr->startPos;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 3968
;3968:    size = item->window.rect.h - (SCROLLBAR_SIZE * 2);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3969
;3969:    DC->drawHandlePic(x, y, SCROLLBAR_SIZE, size+1, DC->Assets.scrollBar);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 61908
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3970
;3970:    y += size - 1;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ASGNF4
line 3971
;3971:    DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowDown);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 1098907648
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 61896
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3973
;3972:    // thumb
;3973:    thumb = Item_ListBox_ThumbDrawPosition(item);//Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 Item_ListBox_ThumbDrawPosition
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
line 3974
;3974:    if (thumb > y - SCROLLBAR_SIZE - 1) {
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
LEF4 $1837
line 3975
;3975:      thumb = y - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 3976
;3976:    }
LABELV $1837
line 3977
;3977:    DC->drawHandlePic(x, thumb, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 72
CNSTF4 1098907648
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 61912
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3980
;3978:
;3979:    // adjust size for item painting
;3980:    size = item->window.rect.h - 2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3981
;3981:    if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1839
line 3983
;3982:      // fit = 0;
;3983:      x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3984
;3984:      y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3985
;3985:      for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $1844
JUMPV
LABELV $1841
line 3988
;3986:        // always draw at least one
;3987:        // which may overdraw the box if it is too small for the element
;3988:        image = DC->feederItemImage(item->special, i);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 128
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 80
INDIRI4
ASGNI4
line 3989
;3989:        if (image) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1845
line 3990
;3990:          DC->drawHandlePic(x+1, y+1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 92
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 3991
;3991:        }
LABELV $1845
line 3993
;3992:
;3993:        if (i == item->cursorPos) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
NEI4 $1847
line 3994
;3994:          DC->drawRect(x, y, listPtr->elementWidth - 1, listPtr->elementHeight - 1, item->window.borderSize, item->window.borderColor);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 3995
;3995:        }
LABELV $1847
line 3997
;3996:
;3997:        listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3998
;3998:        size -= listPtr->elementWidth;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3999
;3999:        if (size < listPtr->elementHeight) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GEF4 $1849
line 4000
;4000:          listPtr->drawPadding = listPtr->elementHeight - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 4001
;4001:          break;
ADDRGP4 $1840
JUMPV
LABELV $1849
line 4003
;4002:        }
;4003:        y += listPtr->elementHeight;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4005
;4004:        // fit++;
;4005:      }
LABELV $1842
line 3985
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1844
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $1841
line 4006
;4006:    } else {
ADDRGP4 $1840
JUMPV
LABELV $1839
line 4007
;4007:      x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4008
;4008:      y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4009
;4009:      for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $1854
JUMPV
LABELV $1851
line 4014
;4010:        const char *text;
;4011:        // always draw at least one
;4012:        // which may overdraw the box if it is too small for the element
;4013:
;4014:        if (listPtr->numColumns > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1855
line 4016
;4015:          int j;
;4016:          for (j = 0; j < listPtr->numColumns; j++) {
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 $1860
JUMPV
LABELV $1857
line 4017
;4017:            text = DC->feederItemText(item->special, i, j, &optionalImage);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 88
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 88
INDIRP4
ASGNP4
line 4018
;4018:            if (optionalImage >= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1861
line 4019
;4019:              DC->drawHandlePic(x + 4 + listPtr->columnInfo[j].pos, y - 1 + listPtr->elementHeight / 2, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 100
ADDRLP4 84
INDIRI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 100
INDIRP4
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 104
ADDRLP4 100
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 104
INDIRF4
ARGF4
ADDRLP4 104
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4020
;4020:            } else if (text) {
ADDRGP4 $1862
JUMPV
LABELV $1861
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1863
line 4022
;4021:              //TA:
;4022:              int alignOffset = 0.0f, tw;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 4024
;4023:
;4024:              tw = DC->textWidth( text, item->textscale, 0 );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
line 4026
;4025:
;4026:              switch( listPtr->columnInfo[ j ].align )
ADDRLP4 104
ADDRLP4 84
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $1868
ADDRLP4 104
INDIRI4
CNSTI4 1
EQI4 $1870
ADDRLP4 104
INDIRI4
CNSTI4 2
EQI4 $1869
ADDRGP4 $1865
JUMPV
line 4027
;4027:              {
LABELV $1868
line 4029
;4028:                case ITEM_ALIGN_LEFT:
;4029:                  alignOffset = 0.0f;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 4030
;4030:                  break;
ADDRGP4 $1866
JUMPV
LABELV $1869
line 4033
;4031:
;4032:                case ITEM_ALIGN_RIGHT:
;4033:                  alignOffset = listPtr->columnInfo[ j ].width - tw;
ADDRLP4 112
CNSTI4 4
ASGNI4
ADDRLP4 92
ADDRLP4 84
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
SUBI4
ASGNI4
line 4034
;4034:                  break;
ADDRGP4 $1866
JUMPV
LABELV $1870
line 4037
;4035:
;4036:                case ITEM_ALIGN_CENTER:
;4037:                  alignOffset = ( listPtr->columnInfo[ j ].width / 2.0f ) - ( tw / 2.0f );
ADDRLP4 116
CNSTI4 4
ASGNI4
ADDRLP4 120
CNSTF4 1073741824
ASGNF4
ADDRLP4 92
ADDRLP4 84
INDIRI4
ADDRLP4 116
INDIRI4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 120
INDIRF4
DIVF4
ADDRLP4 96
INDIRI4
CVIF4 4
ADDRLP4 120
INDIRF4
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 4038
;4038:                  break;
ADDRGP4 $1866
JUMPV
LABELV $1865
line 4041
;4039:
;4040:                default:
;4041:                  alignOffset = 0.0f;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 4042
;4042:              }
LABELV $1866
line 4044
;4043:
;4044:              DC->drawText( x + 4 + listPtr->columnInfo[j].pos + alignOffset, y + listPtr->elementHeight,
ADDRLP4 116
ADDRLP4 84
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 116
INDIRP4
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 92
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 120
INDIRP4
CNSTI4 112
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 4047
;4045:                            item->textscale, item->window.foreColor, text, 0,
;4046:                            listPtr->columnInfo[j].maxChars, item->textStyle );
;4047:            }
LABELV $1863
LABELV $1862
line 4048
;4048:          }
LABELV $1858
line 4016
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1860
ADDRLP4 84
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
LTI4 $1857
line 4049
;4049:        } else {
ADDRGP4 $1856
JUMPV
LABELV $1855
line 4050
;4050:          text = DC->feederItemText(item->special, i, 0, &optionalImage);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 84
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 84
INDIRP4
ASGNP4
line 4051
;4051:          if (optionalImage >= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1871
line 4053
;4052:            //DC->drawHandlePic(x + 4 + listPtr->elementHeight, y, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
;4053:          } else if (text) {
ADDRGP4 $1872
JUMPV
LABELV $1871
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1873
line 4054
;4054:            DC->drawText(x + 4, y + listPtr->elementHeight, item->textscale, item->window.foreColor, text, 0, 0, item->textStyle);
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
INDIRP4
CNSTI4 112
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 4055
;4055:          }
LABELV $1873
LABELV $1872
line 4056
;4056:        }
LABELV $1856
line 4058
;4057:
;4058:        if (i == item->cursorPos) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
NEI4 $1875
line 4059
;4059:          DC->fillRect(x + 2, y + 2, item->window.rect.w - SCROLLBAR_SIZE - 4, listPtr->elementHeight, item->window.outlineColor);
ADDRLP4 84
CNSTF4 1073741824
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 4060
;4060:        }
LABELV $1875
line 4062
;4061:
;4062:        listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4063
;4063:        size -= listPtr->elementHeight;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4064
;4064:        if (size < listPtr->elementHeight) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GEF4 $1877
line 4065
;4065:          listPtr->drawPadding = listPtr->elementHeight - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 4066
;4066:          break;
ADDRGP4 $1853
JUMPV
LABELV $1877
line 4068
;4067:        }
;4068:        y += listPtr->elementHeight;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4070
;4069:        // fit++;
;4070:      }
LABELV $1852
line 4009
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1854
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $1851
LABELV $1853
line 4071
;4071:    }
LABELV $1840
line 4072
;4072:  }
LABELV $1822
line 4075
;4073:
;4074:  //TA: FIXME: hacky fix to off-by-one bug
;4075:  listPtr->endPos--;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4076
;4076:}
LABELV $1820
endproc Item_ListBox_Paint 124 32
export Item_OwnerDraw_Paint
proc Item_OwnerDraw_Paint 68 56
line 4079
;4077:
;4078:
;4079:void Item_OwnerDraw_Paint(itemDef_t *item) {
line 4082
;4080:  menuDef_t *parent;
;4081:
;4082:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1880
line 4083
;4083:    return;
ADDRGP4 $1879
JUMPV
LABELV $1880
line 4085
;4084:  }
;4085:  parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 4087
;4086:
;4087:  if (DC->ownerDrawItem) {
ADDRGP4 DC
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1882
line 4089
;4088:    vec4_t color, lowLight;
;4089:    menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 4090
;4090:    Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, qtrue, parent->fadeAmount);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 108
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 4091
;4091:    memcpy(&color, &item->window.foreColor, sizeof(color));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4092
;4092:    if (item->numColors > 0 && DC->getValue) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1884
ADDRGP4 DC
INDIRP4
CNSTI4 72
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1884
line 4095
;4093:      // if the value is within one of the ranges then set color to that, otherwise leave at default
;4094:      int i;
;4095:      float f = DC->getValue(item->window.ownerDraw);
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
CNSTI4 72
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 56
INDIRF4
ASGNF4
line 4096
;4096:      for (i = 0; i < item->numColors; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 $1889
JUMPV
LABELV $1886
line 4097
;4097:        if (f >= item->colorRanges[i].low && f <= item->colorRanges[i].high) {
ADDRLP4 64
CNSTI4 24
ADDRLP4 48
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
LTF4 $1890
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GTF4 $1890
line 4098
;4098:          memcpy(&color, &item->colorRanges[i].color, sizeof(color));
ADDRLP4 4
ARGP4
CNSTI4 24
ADDRLP4 48
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4099
;4099:          break;
ADDRGP4 $1888
JUMPV
LABELV $1890
line 4101
;4100:        }
;4101:      }
LABELV $1887
line 4096
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1889
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
LTI4 $1886
LABELV $1888
line 4102
;4102:    }
LABELV $1884
line 4104
;4103:
;4104:    if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1892
line 4111
;4105:/*      lowLight[0] = 0.8 * parent->focusColor[0];
;4106:      lowLight[1] = 0.8 * parent->focusColor[1];
;4107:      lowLight[2] = 0.8 * parent->focusColor[2];
;4108:      lowLight[3] = 0.8 * parent->focusColor[3];
;4109:      LerpColor(parent->focusColor,lowLight,color,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));*/
;4110:      //TA:
;4111:      memcpy(color, &parent->focusColor, sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 228
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4112
;4112:    } else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime/BLINK_DIVISOR) & 1)) {
ADDRGP4 $1893
JUMPV
LABELV $1892
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $1894
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 200
DIVI4
ADDRLP4 48
INDIRI4
BANDI4
CNSTI4 0
NEI4 $1894
line 4113
;4113:      lowLight[0] = 0.8 * item->window.foreColor[0];
ADDRLP4 24
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ASGNF4
line 4114
;4114:      lowLight[1] = 0.8 * item->window.foreColor[1];
ADDRLP4 24+4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
MULF4
ASGNF4
line 4115
;4115:      lowLight[2] = 0.8 * item->window.foreColor[2];
ADDRLP4 24+8
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
MULF4
ASGNF4
line 4116
;4116:      lowLight[3] = 0.8 * item->window.foreColor[3];
ADDRLP4 24+12
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
MULF4
ASGNF4
line 4117
;4117:      LerpColor(item->window.foreColor,lowLight,color,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1056964608
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 4118
;4118:    }
LABELV $1894
LABELV $1893
line 4120
;4119:
;4120:    if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1899
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1899
line 4121
;4121:      memcpy(color, parent->disableColor, sizeof(vec4_t)); // bk001207 - FIXME: Com_Memcpy
ADDRLP4 4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 244
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4122
;4122:    }
LABELV $1899
line 4124
;4123:
;4124:    if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1901
line 4125
;4125:      Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 4126
;4126:        if (item->text[0]) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1903
line 4128
;4127:          // +8 is an offset kludge to properly align owner draw items that have text combined with them
;4128:          DC->ownerDrawItem(item->textRect.x + item->textRect.w + 8, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CALLV
pop
line 4129
;4129:        } else {
ADDRGP4 $1902
JUMPV
LABELV $1903
line 4130
;4130:          DC->ownerDrawItem(item->textRect.x + item->textRect.w, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CALLV
pop
line 4131
;4131:        }
line 4132
;4132:      } else {
ADDRGP4 $1902
JUMPV
LABELV $1901
line 4133
;4133:      DC->ownerDrawItem(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, item->textalignx, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 216
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CALLV
pop
line 4134
;4134:    }
LABELV $1902
line 4135
;4135:  }
LABELV $1882
line 4136
;4136:}
LABELV $1879
endproc Item_OwnerDraw_Paint 68 56
export Item_Paint
proc Item_Paint 84 24
line 4139
;4137:
;4138:
;4139:void Item_Paint(itemDef_t *item) {
line 4141
;4140:  vec4_t red;
;4141:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ASGNP4
line 4142
;4142:  red[0] = red[3] = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+12
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 4143
;4143:  red[1] = red[2] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 4145
;4144:
;4145:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1909
line 4146
;4146:    return;
ADDRGP4 $1905
JUMPV
LABELV $1909
line 4149
;4147:  }
;4148:
;4149:  if (item->window.flags & WINDOW_ORBITING) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1911
line 4150
;4150:    if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LEI4 $1913
line 4153
;4151:      float rx, ry, a, c, s, w, h;
;4152:
;4153:      item->window.nextTime = DC->realTime + item->window.offsetTime;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4155
;4154:      // translate
;4155:      w = item->window.rectClient.w / 2;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4156
;4156:      h = item->window.rectClient.h / 2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4157
;4157:      rx = item->window.rectClient.x + w - item->window.rectEffects.x;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 60
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ADDRLP4 60
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4158
;4158:      ry = item->window.rectClient.y + h - item->window.rectEffects.y;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ADDRLP4 64
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4159
;4159:      a = 3 * M_PI / 180;
ADDRLP4 36
CNSTF4 1029076816
ASGNF4
line 4160
;4160:      c = cos(a);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 4161
;4161:      s = sin(a);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 72
INDIRF4
ASGNF4
line 4162
;4162:      item->window.rectClient.x = (rx * c - ry * s) + item->window.rectEffects.x - w;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
SUBF4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ADDRLP4 48
INDIRF4
SUBF4
ASGNF4
line 4163
;4163:      item->window.rectClient.y = (rx * s + ry * c) + item->window.rectEffects.y - h;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 4164
;4164:      Item_UpdatePosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 4166
;4165:
;4166:    }
LABELV $1913
line 4167
;4167:  }
LABELV $1911
line 4170
;4168:
;4169:
;4170:  if (item->window.flags & WINDOW_INTRANSITION) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1915
line 4171
;4171:    if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LEI4 $1917
line 4172
;4172:      int done = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 4173
;4173:      item->window.nextTime = DC->realTime + item->window.offsetTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4175
;4174:      // transition the x,y
;4175:      if (item->window.rectClient.x == item->window.rectEffects.x) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
NEF4 $1919
line 4176
;4176:        done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4177
;4177:      } else {
ADDRGP4 $1920
JUMPV
LABELV $1919
line 4178
;4178:        if (item->window.rectClient.x < item->window.rectEffects.x) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
GEF4 $1921
line 4179
;4179:          item->window.rectClient.x += item->window.rectEffects2.x;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4180
;4180:          if (item->window.rectClient.x > item->window.rectEffects.x) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
LEF4 $1922
line 4181
;4181:            item->window.rectClient.x = item->window.rectEffects.x;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ASGNF4
line 4182
;4182:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4183
;4183:          }
line 4184
;4184:        } else {
ADDRGP4 $1922
JUMPV
LABELV $1921
line 4185
;4185:          item->window.rectClient.x -= item->window.rectEffects2.x;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4186
;4186:          if (item->window.rectClient.x < item->window.rectEffects.x) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
GEF4 $1925
line 4187
;4187:            item->window.rectClient.x = item->window.rectEffects.x;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ASGNF4
line 4188
;4188:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4189
;4189:          }
LABELV $1925
line 4190
;4190:        }
LABELV $1922
line 4191
;4191:      }
LABELV $1920
line 4192
;4192:      if (item->window.rectClient.y == item->window.rectEffects.y) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
NEF4 $1927
line 4193
;4193:        done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4194
;4194:      } else {
ADDRGP4 $1928
JUMPV
LABELV $1927
line 4195
;4195:        if (item->window.rectClient.y < item->window.rectEffects.y) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
GEF4 $1929
line 4196
;4196:          item->window.rectClient.y += item->window.rectEffects2.y;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4197
;4197:          if (item->window.rectClient.y > item->window.rectEffects.y) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
LEF4 $1930
line 4198
;4198:            item->window.rectClient.y = item->window.rectEffects.y;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ASGNF4
line 4199
;4199:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4200
;4200:          }
line 4201
;4201:        } else {
ADDRGP4 $1930
JUMPV
LABELV $1929
line 4202
;4202:          item->window.rectClient.y -= item->window.rectEffects2.y;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4203
;4203:          if (item->window.rectClient.y < item->window.rectEffects.y) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
GEF4 $1933
line 4204
;4204:            item->window.rectClient.y = item->window.rectEffects.y;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ASGNF4
line 4205
;4205:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4206
;4206:          }
LABELV $1933
line 4207
;4207:        }
LABELV $1930
line 4208
;4208:      }
LABELV $1928
line 4209
;4209:      if (item->window.rectClient.w == item->window.rectEffects.w) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
NEF4 $1935
line 4210
;4210:        done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4211
;4211:      } else {
ADDRGP4 $1936
JUMPV
LABELV $1935
line 4212
;4212:        if (item->window.rectClient.w < item->window.rectEffects.w) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
GEF4 $1937
line 4213
;4213:          item->window.rectClient.w += item->window.rectEffects2.w;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4214
;4214:          if (item->window.rectClient.w > item->window.rectEffects.w) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
LEF4 $1938
line 4215
;4215:            item->window.rectClient.w = item->window.rectEffects.w;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 4216
;4216:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4217
;4217:          }
line 4218
;4218:        } else {
ADDRGP4 $1938
JUMPV
LABELV $1937
line 4219
;4219:          item->window.rectClient.w -= item->window.rectEffects2.w;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4220
;4220:          if (item->window.rectClient.w < item->window.rectEffects.w) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
GEF4 $1941
line 4221
;4221:            item->window.rectClient.w = item->window.rectEffects.w;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 4222
;4222:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4223
;4223:          }
LABELV $1941
line 4224
;4224:        }
LABELV $1938
line 4225
;4225:      }
LABELV $1936
line 4226
;4226:      if (item->window.rectClient.h == item->window.rectEffects.h) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
NEF4 $1943
line 4227
;4227:        done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4228
;4228:      } else {
ADDRGP4 $1944
JUMPV
LABELV $1943
line 4229
;4229:        if (item->window.rectClient.h < item->window.rectEffects.h) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
GEF4 $1945
line 4230
;4230:          item->window.rectClient.h += item->window.rectEffects2.h;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4231
;4231:          if (item->window.rectClient.h > item->window.rectEffects.h) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
LEF4 $1946
line 4232
;4232:            item->window.rectClient.h = item->window.rectEffects.h;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 4233
;4233:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4234
;4234:          }
line 4235
;4235:        } else {
ADDRGP4 $1946
JUMPV
LABELV $1945
line 4236
;4236:          item->window.rectClient.h -= item->window.rectEffects2.h;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4237
;4237:          if (item->window.rectClient.h < item->window.rectEffects.h) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
GEF4 $1949
line 4238
;4238:            item->window.rectClient.h = item->window.rectEffects.h;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 4239
;4239:            done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4240
;4240:          }
LABELV $1949
line 4241
;4241:        }
LABELV $1946
line 4242
;4242:      }
LABELV $1944
line 4244
;4243:
;4244:      Item_UpdatePosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 4246
;4245:
;4246:      if (done == 4) {
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $1951
line 4247
;4247:        item->window.flags &= ~WINDOW_INTRANSITION;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 4248
;4248:      }
LABELV $1951
line 4250
;4249:
;4250:    }
LABELV $1917
line 4251
;4251:  }
LABELV $1915
line 4253
;4252:
;4253:  if (item->window.ownerDrawFlags && DC->ownerDrawVisible) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1953
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1953
line 4254
;4254:    if (!DC->ownerDrawVisible(item->window.ownerDrawFlags)) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1955
line 4255
;4255:      item->window.flags &= ~WINDOW_VISIBLE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 4256
;4256:    } else {
ADDRGP4 $1956
JUMPV
LABELV $1955
line 4257
;4257:      item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 4258
;4258:    }
LABELV $1956
line 4259
;4259:  }
LABELV $1953
line 4261
;4260:
;4261:  if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE)) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $1957
line 4262
;4262:    if (!Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 28
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1959
line 4263
;4263:      return;
ADDRGP4 $1905
JUMPV
LABELV $1959
line 4265
;4264:    }
;4265:  }
LABELV $1957
line 4267
;4266:
;4267:  if (item->window.flags & WINDOW_TIMEDVISIBLE) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $1961
line 4269
;4268:
;4269:  }
LABELV $1961
line 4271
;4270:
;4271:  if (!(item->window.flags & WINDOW_VISIBLE)) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $1963
line 4272
;4272:    return;
ADDRGP4 $1905
JUMPV
LABELV $1963
line 4276
;4273:  }
;4274:
;4275:  // paint the rect first..
;4276:  Window_Paint(&item->window, parent->fadeAmount , parent->fadeClamp, parent->fadeCycle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Window_Paint
CALLV
pop
line 4278
;4277:
;4278:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $1965
line 4280
;4279:    vec4_t color;
;4280:    rectDef_t *r = Item_CorrectedTextRect(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 52
INDIRP4
ASGNP4
line 4281
;4281:    color[1] = color[3] = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
ADDRLP4 36+12
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 56
INDIRF4
ASGNF4
line 4282
;4282:    color[0] = color[2] = 0;
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 36+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 60
INDIRF4
ASGNF4
line 4283
;4283:    DC->drawRect(r->x, r->y, r->w, r->h, 1, color);
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4284
;4284:  }
LABELV $1965
line 4288
;4285:
;4286:  //DC->drawRect(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, 1, red);
;4287:
;4288:  switch (item->type) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $1971
ADDRLP4 32
INDIRI4
CNSTI4 13
GTI4 $1971
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1985
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1985
address $1974
address $1974
address $1971
address $1971
address $1977
address $1971
address $1979
address $1980
address $1973
address $1977
address $1984
address $1981
address $1982
address $1983
code
LABELV $1973
line 4290
;4289:    case ITEM_TYPE_OWNERDRAW:
;4290:      Item_OwnerDraw_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_OwnerDraw_Paint
CALLV
pop
line 4291
;4291:      break;
ADDRGP4 $1971
JUMPV
LABELV $1974
line 4294
;4292:    case ITEM_TYPE_TEXT:
;4293:    case ITEM_TYPE_BUTTON:
;4294:      Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 4295
;4295:      break;
ADDRGP4 $1971
JUMPV
line 4297
;4296:    case ITEM_TYPE_RADIOBUTTON:
;4297:      break;
line 4299
;4298:    case ITEM_TYPE_CHECKBOX:
;4299:      break;
LABELV $1977
line 4302
;4300:    case ITEM_TYPE_EDITFIELD:
;4301:    case ITEM_TYPE_NUMERICFIELD:
;4302:      Item_TextField_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_TextField_Paint
CALLV
pop
line 4303
;4303:      break;
ADDRGP4 $1971
JUMPV
line 4305
;4304:    case ITEM_TYPE_COMBO:
;4305:      break;
LABELV $1979
line 4307
;4306:    case ITEM_TYPE_LISTBOX:
;4307:      Item_ListBox_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ListBox_Paint
CALLV
pop
line 4308
;4308:      break;
ADDRGP4 $1971
JUMPV
LABELV $1980
line 4313
;4309:    //case ITEM_TYPE_IMAGE:
;4310:    //  Item_Image_Paint(item);
;4311:    //  break;
;4312:    case ITEM_TYPE_MODEL:
;4313:      Item_Model_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Model_Paint
CALLV
pop
line 4314
;4314:      break;
ADDRGP4 $1971
JUMPV
LABELV $1981
line 4316
;4315:    case ITEM_TYPE_YESNO:
;4316:      Item_YesNo_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_YesNo_Paint
CALLV
pop
line 4317
;4317:      break;
ADDRGP4 $1971
JUMPV
LABELV $1982
line 4319
;4318:    case ITEM_TYPE_MULTI:
;4319:      Item_Multi_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Multi_Paint
CALLV
pop
line 4320
;4320:      break;
ADDRGP4 $1971
JUMPV
LABELV $1983
line 4322
;4321:    case ITEM_TYPE_BIND:
;4322:      Item_Bind_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Bind_Paint
CALLV
pop
line 4323
;4323:      break;
ADDRGP4 $1971
JUMPV
LABELV $1984
line 4325
;4324:    case ITEM_TYPE_SLIDER:
;4325:      Item_Slider_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Slider_Paint
CALLV
pop
line 4326
;4326:      break;
line 4328
;4327:    default:
;4328:      break;
LABELV $1971
line 4331
;4329:  }
;4330:
;4331:}
LABELV $1905
endproc Item_Paint 84 24
export Menu_Init
proc Menu_Init 0 12
line 4333
;4332:
;4333:void Menu_Init(menuDef_t *menu) {
line 4334
;4334:  memset(menu, 0, sizeof(menuDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 644
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4335
;4335:  menu->cursorItem = -1;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 -1
ASGNI4
line 4336
;4336:  menu->fadeAmount = DC->Assets.fadeAmount;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61960
ADDP4
INDIRF4
ASGNF4
line 4337
;4337:  menu->fadeClamp = DC->Assets.fadeClamp;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61952
ADDP4
INDIRF4
ASGNF4
line 4338
;4338:  menu->fadeCycle = DC->Assets.fadeCycle;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61956
ADDP4
INDIRI4
ASGNI4
line 4339
;4339:  Window_Init(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_Init
CALLV
pop
line 4340
;4340:}
LABELV $1986
endproc Menu_Init 0 12
export Menu_GetFocusedItem
proc Menu_GetFocusedItem 8 0
line 4342
;4341:
;4342:itemDef_t *Menu_GetFocusedItem(menuDef_t *menu) {
line 4344
;4343:  int i;
;4344:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1988
line 4345
;4345:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1993
JUMPV
LABELV $1990
line 4346
;4346:      if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1994
line 4347
;4347:        return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1987
JUMPV
LABELV $1994
line 4349
;4348:      }
;4349:    }
LABELV $1991
line 4345
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1993
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $1990
line 4350
;4350:  }
LABELV $1988
line 4351
;4351:  return NULL;
CNSTP4 0
RETP4
LABELV $1987
endproc Menu_GetFocusedItem 8 0
export Menu_GetFocused
proc Menu_GetFocused 12 0
line 4354
;4352:}
;4353:
;4354:menuDef_t *Menu_GetFocused( void ) {
line 4356
;4355:  int i;
;4356:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2000
JUMPV
LABELV $1997
line 4357
;4357:    if (Menus[i].window.flags & WINDOW_HASFOCUS && Menus[i].window.flags & WINDOW_VISIBLE) {
ADDRLP4 4
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+68
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2001
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+68
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2001
line 4358
;4358:      return &Menus[i];
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $1996
JUMPV
LABELV $2001
line 4360
;4359:    }
;4360:  }
LABELV $1998
line 4356
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2000
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1997
line 4361
;4361:  return NULL;
CNSTP4 0
RETP4
LABELV $1996
endproc Menu_GetFocused 12 0
export Menu_ScrollFeeder
proc Menu_ScrollFeeder 12 16
line 4364
;4362:}
;4363:
;4364:void Menu_ScrollFeeder(menuDef_t *menu, int feeder, qboolean down) {
line 4365
;4365:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2006
line 4367
;4366:    int i;
;4367:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2011
JUMPV
LABELV $2008
line 4368
;4368:      if (menu->items[i]->special == feeder) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
NEF4 $2012
line 4369
;4369:        Item_ListBox_HandleKey(menu->items[i], (down) ? K_DOWNARROW : K_UPARROW, qtrue, qtrue);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $2015
ADDRLP4 4
CNSTI4 133
ASGNI4
ADDRGP4 $2016
JUMPV
LABELV $2015
ADDRLP4 4
CNSTI4 132
ASGNI4
LABELV $2016
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 4370
;4370:        return;
ADDRGP4 $2005
JUMPV
LABELV $2012
line 4372
;4371:      }
;4372:    }
LABELV $2009
line 4367
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2011
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2008
line 4373
;4373:  }
LABELV $2006
line 4374
;4374:}
LABELV $2005
endproc Menu_ScrollFeeder 12 16
export Menu_SetFeederSelection
proc Menu_SetFeederSelection 8 8
line 4378
;4375:
;4376:
;4377:
;4378:void Menu_SetFeederSelection(menuDef_t *menu, int feeder, int index, const char *name) {
line 4379
;4379:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2018
line 4380
;4380:    if (name == NULL) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2020
line 4381
;4381:      menu = Menu_GetFocused();
ADDRLP4 0
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
line 4382
;4382:    } else {
ADDRGP4 $2021
JUMPV
LABELV $2020
line 4383
;4383:      menu = Menus_FindByName(name);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
line 4384
;4384:    }
LABELV $2021
line 4385
;4385:  }
LABELV $2018
line 4387
;4386:
;4387:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2022
line 4389
;4388:    int i;
;4389:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2027
JUMPV
LABELV $2024
line 4390
;4390:      if (menu->items[i]->special == feeder) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
NEF4 $2028
line 4391
;4391:        if (index == 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $2030
line 4392
;4392:          listBoxDef_t *listPtr = (listBoxDef_t*)menu->items[i]->typeData;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4393
;4393:          listPtr->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 4394
;4394:          listPtr->startPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4395
;4395:        }
LABELV $2030
line 4396
;4396:        menu->items[i]->cursorPos = index;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4397
;4397:        DC->feederSelection(menu->items[i]->special, menu->items[i]->cursorPos);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 4398
;4398:        return;
ADDRGP4 $2017
JUMPV
LABELV $2028
line 4400
;4399:      }
;4400:    }
LABELV $2025
line 4389
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2027
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2024
line 4401
;4401:  }
LABELV $2022
line 4402
;4402:}
LABELV $2017
endproc Menu_SetFeederSelection 8 8
export Menus_AnyFullScreenVisible
proc Menus_AnyFullScreenVisible 12 0
line 4404
;4403:
;4404:qboolean Menus_AnyFullScreenVisible( void ) {
line 4406
;4405:  int i;
;4406:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2036
JUMPV
LABELV $2033
line 4407
;4407:    if (Menus[i].window.flags & WINDOW_VISIBLE && Menus[i].fullScreen) {
ADDRLP4 4
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+68
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2037
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+184
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2037
line 4408
;4408:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2032
JUMPV
LABELV $2037
line 4410
;4409:    }
;4410:  }
LABELV $2034
line 4406
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2036
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2033
line 4411
;4411:  return qfalse;
CNSTI4 0
RETI4
LABELV $2032
endproc Menus_AnyFullScreenVisible 12 0
export Menus_ActivateByName
proc Menus_ActivateByName 36 12
line 4414
;4412:}
;4413:
;4414:menuDef_t *Menus_ActivateByName(const char *p) {
line 4416
;4415:  int i, j;
;4416:  menuDef_t *m = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 4417
;4417:  menuDef_t *focus = Menu_GetFocused();
ADDRLP4 16
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 4419
;4418:
;4419:  for (i = 0; i < menuCount; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2045
JUMPV
LABELV $2042
line 4420
;4420:    if (Q_stricmp(Menus[i].window.name, p) == 0) {
CNSTI4 644
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 Menus+32
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2046
line 4421
;4421:      m = &Menus[i];
ADDRLP4 4
CNSTI4 644
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ASGNP4
line 4422
;4422:      Menus_Activate(m);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 4423
;4423:      Menu_HandleMouseMove( m, DC->cursorx, DC->cursory ); //TA: force the item under the cursor to focus
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 4425
;4424:
;4425:      for( j = 0; j < m->itemCount; j++ ) //TA: reset selection in listboxes when opened
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2052
JUMPV
LABELV $2049
line 4426
;4426:      {
line 4427
;4427:        if( m->items[ j ]->type == ITEM_TYPE_LISTBOX )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2053
line 4428
;4428:        {
line 4429
;4429:          listBoxDef_t *listPtr = (listBoxDef_t*)m->items[ j ]->typeData;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4430
;4430:          m->items[ j ]->cursorPos = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 4431
;4431:          listPtr->startPos = 0;
ADDRLP4 28
INDIRP4
CNSTI4 0
ASGNI4
line 4432
;4432:          DC->feederSelection( m->items[ j ]->special, 0 );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLV
pop
line 4433
;4433:        }
LABELV $2053
line 4434
;4434:      }
LABELV $2050
line 4425
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2052
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2049
line 4436
;4435:
;4436:      if (openMenuCount < MAX_OPEN_MENUS && focus != NULL) {
ADDRGP4 openMenuCount
INDIRI4
CNSTI4 16
GEI4 $2047
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2047
line 4437
;4437:        menuStack[openMenuCount++] = focus;
ADDRLP4 32
ADDRGP4 openMenuCount
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 menuStack
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 4438
;4438:      }
line 4439
;4439:    } else {
ADDRGP4 $2047
JUMPV
LABELV $2046
line 4440
;4440:      Menus[i].window.flags &= ~WINDOW_HASFOCUS;
ADDRLP4 24
CNSTI4 644
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 Menus+68
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 4441
;4441:    }
LABELV $2047
line 4442
;4442:  }
LABELV $2043
line 4419
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2045
ADDRLP4 8
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2042
line 4443
;4443:  Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 4444
;4444:  return m;
ADDRLP4 4
INDIRP4
RETP4
LABELV $2041
endproc Menus_ActivateByName 36 12
export Item_Init
proc Item_Init 0 12
line 4448
;4445:}
;4446:
;4447:
;4448:void Item_Init(itemDef_t *item) {
line 4449
;4449:  memset(item, 0, sizeof(itemDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 540
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4450
;4450:  item->textscale = 0.55f;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTF4 1057803469
ASGNF4
line 4451
;4451:  Window_Init(&item->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_Init
CALLV
pop
line 4452
;4452:}
LABELV $2058
endproc Item_Init 0 12
export Menu_HandleMouseMove
proc Menu_HandleMouseMove 52 12
line 4454
;4453:
;4454:void Menu_HandleMouseMove(menuDef_t *menu, float x, float y) {
line 4456
;4455:  int i, pass;
;4456:  qboolean focusSet = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 4459
;4457:
;4458:  itemDef_t *overItem;
;4459:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2060
line 4460
;4460:    return;
ADDRGP4 $2059
JUMPV
LABELV $2060
line 4463
;4461:  }
;4462:
;4463:  if (!(menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2062
line 4464
;4464:    return;
ADDRGP4 $2059
JUMPV
LABELV $2062
line 4467
;4465:  }
;4466:
;4467:  if (itemCapture) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2064
line 4469
;4468:    //Item_MouseMove(itemCapture, x, y);
;4469:    return;
ADDRGP4 $2059
JUMPV
LABELV $2064
line 4472
;4470:  }
;4471:
;4472:  if (g_waitingForKey || g_editingField) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2068
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2066
LABELV $2068
line 4473
;4473:    return;
ADDRGP4 $2059
JUMPV
LABELV $2066
line 4478
;4474:  }
;4475:
;4476:  // FIXME: this is the whole issue of focus vs. mouse over..
;4477:  // need a better overall solution as i don't like going through everything twice
;4478:  for (pass = 0; pass < 2; pass++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2069
line 4479
;4479:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2076
JUMPV
LABELV $2073
line 4483
;4480:      // turn off focus each item
;4481:      // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;4482:
;4483:      if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2077
line 4484
;4484:        continue;
ADDRGP4 $2074
JUMPV
LABELV $2077
line 4488
;4485:      }
;4486:
;4487:      // items can be enabled and disabled based on cvars
;4488:      if (menu->items[i]->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_ENABLE)) {
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $2079
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2079
line 4489
;4489:        continue;
ADDRGP4 $2074
JUMPV
LABELV $2079
line 4492
;4490:      }
;4491:
;4492:      if (menu->items[i]->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_SHOW)) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $2081
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 32
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2081
line 4493
;4493:        continue;
ADDRGP4 $2074
JUMPV
LABELV $2081
line 4498
;4494:      }
;4495:
;4496:
;4497:
;4498:      if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2083
line 4499
;4499:        if (pass == 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $2084
line 4500
;4500:          overItem = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
line 4501
;4501:          if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2087
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2087
line 4502
;4502:            if (!Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $2089
line 4503
;4503:              continue;
ADDRGP4 $2074
JUMPV
LABELV $2089
line 4505
;4504:            }
;4505:          }
LABELV $2087
line 4507
;4506:          // if we are over an item
;4507:          if (IsVisible(overItem->window.flags)) {
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 IsVisible
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2084
line 4509
;4508:            // different one
;4509:            Item_MouseEnter(overItem, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 Item_MouseEnter
CALLV
pop
line 4513
;4510:            // Item_SetMouseOver(overItem, qtrue);
;4511:
;4512:            // if item is not a decoration see if it can take focus
;4513:            if (!focusSet) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2084
line 4514
;4514:              focusSet = Item_SetFocus(overItem, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 4515
;4515:            }
line 4516
;4516:          }
line 4517
;4517:        }
line 4518
;4518:      } else if (menu->items[i]->window.flags & WINDOW_MOUSEOVER) {
ADDRGP4 $2084
JUMPV
LABELV $2083
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2095
line 4519
;4519:          Item_MouseLeave(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_MouseLeave
CALLV
pop
line 4520
;4520:          Item_SetMouseOver(menu->items[i], qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Item_SetMouseOver
CALLV
pop
line 4521
;4521:      }
LABELV $2095
LABELV $2084
line 4522
;4522:    }
LABELV $2074
line 4479
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2076
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2073
line 4523
;4523:  }
LABELV $2070
line 4478
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $2069
line 4525
;4524:
;4525:}
LABELV $2059
endproc Menu_HandleMouseMove 52 12
export Menu_Paint
proc Menu_Paint 48 24
line 4527
;4526:
;4527:void Menu_Paint(menuDef_t *menu, qboolean forcePaint) {
line 4530
;4528:  int i;
;4529:
;4530:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2098
line 4531
;4531:    return;
ADDRGP4 $2097
JUMPV
LABELV $2098
line 4534
;4532:  }
;4533:
;4534:  if (!(menu->window.flags & WINDOW_VISIBLE) &&  !forcePaint) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $2100
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2100
line 4535
;4535:    return;
ADDRGP4 $2097
JUMPV
LABELV $2100
line 4538
;4536:  }
;4537:
;4538:  if (menu->window.ownerDrawFlags && DC->ownerDrawVisible && !DC->ownerDrawVisible(menu->window.ownerDrawFlags)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2102
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2102
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2102
line 4539
;4539:    return;
ADDRGP4 $2097
JUMPV
LABELV $2102
line 4542
;4540:  }
;4541:
;4542:  if (forcePaint) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $2104
line 4543
;4543:    menu->window.flags |= WINDOW_FORCED;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 4544
;4544:  }
LABELV $2104
line 4547
;4545:
;4546:  // draw the background if necessary
;4547:  if (menu->fullScreen) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2106
line 4550
;4548:    // implies a background shader
;4549:    // FIXME: make sure we have a default shader if fullscreen is set with no background
;4550:    DC->drawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, menu->window.background );
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4551
;4551:  } else if (menu->window.background) {
ADDRGP4 $2107
JUMPV
LABELV $2106
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2108
line 4554
;4552:    // this allows a background shader without being full screen
;4553:    //UI_DrawHandlePic(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, menu->backgroundShader);
;4554:  }
LABELV $2108
LABELV $2107
line 4557
;4555:
;4556:  // paint the background and or border
;4557:  Window_Paint(&menu->window, menu->fadeAmount, menu->fadeClamp, menu->fadeCycle );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Window_Paint
CALLV
pop
line 4559
;4558:
;4559:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2113
JUMPV
LABELV $2110
line 4560
;4560:    Item_Paint(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_Paint
CALLV
pop
line 4561
;4561:  }
LABELV $2111
line 4559
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2113
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2110
line 4563
;4562:
;4563:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $2114
line 4565
;4564:    vec4_t color;
;4565:    color[0] = color[2] = color[3] = 1;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRF4
ASGNF4
line 4566
;4566:    color[1] = 0;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 4567
;4567:    DC->drawRect(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, 1, color);
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
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 24
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4568
;4568:  }
LABELV $2114
line 4569
;4569:}
LABELV $2097
endproc Menu_Paint 48 24
export Item_ValidateTypeData
proc Item_ValidateTypeData 8 12
line 4576
;4570:
;4571:/*
;4572:===============
;4573:Item_ValidateTypeData
;4574:===============
;4575:*/
;4576:void Item_ValidateTypeData(itemDef_t *item) {
line 4577
;4577:  if (item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2120
line 4578
;4578:    return;
ADDRGP4 $2119
JUMPV
LABELV $2120
line 4581
;4579:  }
;4580:
;4581:  if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2122
line 4582
;4582:    item->typeData = UI_Alloc(sizeof(listBoxDef_t));
CNSTI4 296
ARGI4
ADDRLP4 0
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4583
;4583:    memset(item->typeData, 0, sizeof(listBoxDef_t));
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4584
;4584:  } else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD || item->type == ITEM_TYPE_YESNO || item->type == ITEM_TYPE_BIND || item->type == ITEM_TYPE_SLIDER || item->type == ITEM_TYPE_TEXT) {
ADDRGP4 $2123
JUMPV
LABELV $2122
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $2130
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $2130
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $2130
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2130
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2130
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2124
LABELV $2130
line 4585
;4585:    item->typeData = UI_Alloc(sizeof(editFieldDef_t));
CNSTI4 28
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4586
;4586:    memset(item->typeData, 0, sizeof(editFieldDef_t));
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4587
;4587:    if (item->type == ITEM_TYPE_EDITFIELD) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2125
line 4588
;4588:      if (!((editFieldDef_t *) item->typeData)->maxPaintChars) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2125
line 4589
;4589:        ((editFieldDef_t *) item->typeData)->maxPaintChars = MAX_EDITFIELD;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 256
ASGNI4
line 4590
;4590:      }
line 4591
;4591:    }
line 4592
;4592:  } else if (item->type == ITEM_TYPE_MULTI) {
ADDRGP4 $2125
JUMPV
LABELV $2124
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 12
NEI4 $2135
line 4593
;4593:    item->typeData = UI_Alloc(sizeof(multiDef_t));
CNSTI4 392
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4594
;4594:  } else if (item->type == ITEM_TYPE_MODEL) {
ADDRGP4 $2136
JUMPV
LABELV $2135
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2137
line 4595
;4595:    item->typeData = UI_Alloc(sizeof(modelDef_t));
CNSTI4 28
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4596
;4596:  }
LABELV $2137
LABELV $2136
LABELV $2125
LABELV $2123
line 4597
;4597:}
LABELV $2119
endproc Item_ValidateTypeData 8 12
export KeywordHash_Key
proc KeywordHash_Key 20 0
line 4614
;4598:
;4599:/*
;4600:===============
;4601:Keyword Hash
;4602:===============
;4603:*/
;4604:
;4605:#define KEYWORDHASH_SIZE  512
;4606:
;4607:typedef struct keywordHash_s
;4608:{
;4609:  char *keyword;
;4610:  qboolean (*func)(itemDef_t *item, int handle);
;4611:  struct keywordHash_s *next;
;4612:} keywordHash_t;
;4613:
;4614:int KeywordHash_Key(char *keyword) {
line 4617
;4615:  int register hash, i;
;4616:
;4617:  hash = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4618
;4618:  for (i = 0; keyword[i] != '\0'; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2143
JUMPV
LABELV $2140
line 4619
;4619:    if (keyword[i] >= 'A' && keyword[i] <= 'Z')
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 65
LTI4 $2144
ADDRLP4 8
INDIRI4
CNSTI4 90
GTI4 $2144
line 4620
;4620:      hash += (keyword[i] + ('a' - 'A')) * (119 + i);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
ADDRLP4 4
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $2145
JUMPV
LABELV $2144
line 4622
;4621:    else
;4622:      hash += keyword[i] * (119 + i);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
LABELV $2145
line 4623
;4623:  }
LABELV $2141
line 4618
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2143
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2140
line 4624
;4624:  hash = (hash ^ (hash >> 10) ^ (hash >> 20)) & (KEYWORDHASH_SIZE-1);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 10
RSHI4
BXORI4
ADDRLP4 0
INDIRI4
CNSTI4 20
RSHI4
BXORI4
CNSTI4 511
BANDI4
ASGNI4
line 4625
;4625:  return hash;
ADDRLP4 0
INDIRI4
RETI4
LABELV $2139
endproc KeywordHash_Key 20 0
export KeywordHash_Add
proc KeywordHash_Add 8 4
line 4628
;4626:}
;4627:
;4628:void KeywordHash_Add(keywordHash_t *table[], keywordHash_t *key) {
line 4631
;4629:  int hash;
;4630:
;4631:  hash = KeywordHash_Key(key->keyword);
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 KeywordHash_Key
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 4637
;4632:/*
;4633:  if (table[hash]) {
;4634:    int collision = qtrue;
;4635:  }
;4636:*/
;4637:  key->next = table[hash];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 4638
;4638:  table[hash] = key;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 4639
;4639:}
LABELV $2146
endproc KeywordHash_Add 8 4
export KeywordHash_Find
proc KeywordHash_Find 16 8
line 4642
;4640:
;4641:keywordHash_t *KeywordHash_Find(keywordHash_t *table[], char *keyword)
;4642:{
line 4646
;4643:  keywordHash_t *key;
;4644:  int hash;
;4645:
;4646:  hash = KeywordHash_Key(keyword);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 KeywordHash_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 4647
;4647:  for (key = table[hash]; key; key = key->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2151
JUMPV
LABELV $2148
line 4648
;4648:    if (!Q_stricmp(key->keyword, keyword))
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2152
line 4649
;4649:      return key;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $2147
JUMPV
LABELV $2152
line 4650
;4650:  }
LABELV $2149
line 4647
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $2151
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2148
line 4651
;4651:  return NULL;
CNSTP4 0
RETP4
LABELV $2147
endproc KeywordHash_Find 16 8
export ItemParse_name
proc ItemParse_name 4 8
line 4661
;4652:}
;4653:
;4654:/*
;4655:===============
;4656:Item Keyword Parse functions
;4657:===============
;4658:*/
;4659:
;4660:// name <string>
;4661:qboolean ItemParse_name( itemDef_t *item, int handle ) {
line 4662
;4662:  if (!PC_String_Parse(handle, &item->window.name)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2155
line 4663
;4663:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2154
JUMPV
LABELV $2155
line 4665
;4664:  }
;4665:  return qtrue;
CNSTI4 1
RETI4
LABELV $2154
endproc ItemParse_name 4 8
export ItemParse_focusSound
proc ItemParse_focusSound 12 8
line 4669
;4666:}
;4667:
;4668:// name <string>
;4669:qboolean ItemParse_focusSound( itemDef_t *item, int handle ) {
line 4671
;4670:  const char *temp;
;4671:  if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2158
line 4672
;4672:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2157
JUMPV
LABELV $2158
line 4674
;4673:  }
;4674:  item->focusSound = DC->registerSound(temp, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4675
;4675:  return qtrue;
CNSTI4 1
RETI4
LABELV $2157
endproc ItemParse_focusSound 12 8
export ItemParse_text
proc ItemParse_text 4 8
line 4680
;4676:}
;4677:
;4678:
;4679:// text <string>
;4680:qboolean ItemParse_text( itemDef_t *item, int handle ) {
line 4681
;4681:  if (!PC_String_Parse(handle, &item->text)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2161
line 4682
;4682:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2160
JUMPV
LABELV $2161
line 4684
;4683:  }
;4684:  return qtrue;
CNSTI4 1
RETI4
LABELV $2160
endproc ItemParse_text 4 8
export ItemParse_group
proc ItemParse_group 4 8
line 4688
;4685:}
;4686:
;4687:// group <string>
;4688:qboolean ItemParse_group( itemDef_t *item, int handle ) {
line 4689
;4689:  if (!PC_String_Parse(handle, &item->window.group)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2164
line 4690
;4690:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2163
JUMPV
LABELV $2164
line 4692
;4691:  }
;4692:  return qtrue;
CNSTI4 1
RETI4
LABELV $2163
endproc ItemParse_group 4 8
export ItemParse_asset_model
proc ItemParse_asset_model 20 8
line 4696
;4693:}
;4694:
;4695:// asset_model <string>
;4696:qboolean ItemParse_asset_model( itemDef_t *item, int handle ) {
line 4699
;4697:  const char *temp;
;4698:  modelDef_t *modelPtr;
;4699:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4700
;4700:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4702
;4701:
;4702:  if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2167
line 4703
;4703:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2166
JUMPV
LABELV $2167
line 4705
;4704:  }
;4705:  item->asset = DC->registerModel(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4706
;4706:  modelPtr->angle = rand() % 360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
ASGNI4
line 4707
;4707:  return qtrue;
CNSTI4 1
RETI4
LABELV $2166
endproc ItemParse_asset_model 20 8
export ItemParse_asset_shader
proc ItemParse_asset_shader 12 8
line 4711
;4708:}
;4709:
;4710:// asset_shader <string>
;4711:qboolean ItemParse_asset_shader( itemDef_t *item, int handle ) {
line 4714
;4712:  const char *temp;
;4713:
;4714:  if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2170
line 4715
;4715:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2169
JUMPV
LABELV $2170
line 4717
;4716:  }
;4717:  item->asset = DC->registerShaderNoMip(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4718
;4718:  return qtrue;
CNSTI4 1
RETI4
LABELV $2169
endproc ItemParse_asset_shader 12 8
export ItemParse_model_origin
proc ItemParse_model_origin 16 8
line 4722
;4719:}
;4720:
;4721:// model_origin <number> <number> <number>
;4722:qboolean ItemParse_model_origin( itemDef_t *item, int handle ) {
line 4724
;4723:  modelDef_t *modelPtr;
;4724:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4725
;4725:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4727
;4726:
;4727:  if (PC_Float_Parse(handle, &modelPtr->origin[0])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2173
line 4728
;4728:    if (PC_Float_Parse(handle, &modelPtr->origin[1])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2175
line 4729
;4729:      if (PC_Float_Parse(handle, &modelPtr->origin[2])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2177
line 4730
;4730:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2172
JUMPV
LABELV $2177
line 4732
;4731:      }
;4732:    }
LABELV $2175
line 4733
;4733:  }
LABELV $2173
line 4734
;4734:  return qfalse;
CNSTI4 0
RETI4
LABELV $2172
endproc ItemParse_model_origin 16 8
export ItemParse_model_fovx
proc ItemParse_model_fovx 8 8
line 4738
;4735:}
;4736:
;4737:// model_fovx <number>
;4738:qboolean ItemParse_model_fovx( itemDef_t *item, int handle ) {
line 4740
;4739:  modelDef_t *modelPtr;
;4740:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4741
;4741:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4743
;4742:
;4743:  if (!PC_Float_Parse(handle, &modelPtr->fov_x)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2180
line 4744
;4744:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2179
JUMPV
LABELV $2180
line 4746
;4745:  }
;4746:  return qtrue;
CNSTI4 1
RETI4
LABELV $2179
endproc ItemParse_model_fovx 8 8
export ItemParse_model_fovy
proc ItemParse_model_fovy 8 8
line 4750
;4747:}
;4748:
;4749:// model_fovy <number>
;4750:qboolean ItemParse_model_fovy( itemDef_t *item, int handle ) {
line 4752
;4751:  modelDef_t *modelPtr;
;4752:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4753
;4753:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4755
;4754:
;4755:  if (!PC_Float_Parse(handle, &modelPtr->fov_y)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2183
line 4756
;4756:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2182
JUMPV
LABELV $2183
line 4758
;4757:  }
;4758:  return qtrue;
CNSTI4 1
RETI4
LABELV $2182
endproc ItemParse_model_fovy 8 8
export ItemParse_model_rotation
proc ItemParse_model_rotation 8 8
line 4762
;4759:}
;4760:
;4761:// model_rotation <integer>
;4762:qboolean ItemParse_model_rotation( itemDef_t *item, int handle ) {
line 4764
;4763:  modelDef_t *modelPtr;
;4764:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4765
;4765:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4767
;4766:
;4767:  if (!PC_Int_Parse(handle, &modelPtr->rotationSpeed)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2186
line 4768
;4768:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2185
JUMPV
LABELV $2186
line 4770
;4769:  }
;4770:  return qtrue;
CNSTI4 1
RETI4
LABELV $2185
endproc ItemParse_model_rotation 8 8
export ItemParse_model_angle
proc ItemParse_model_angle 8 8
line 4774
;4771:}
;4772:
;4773:// model_angle <integer>
;4774:qboolean ItemParse_model_angle( itemDef_t *item, int handle ) {
line 4776
;4775:  modelDef_t *modelPtr;
;4776:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4777
;4777:  modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4779
;4778:
;4779:  if (!PC_Int_Parse(handle, &modelPtr->angle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2189
line 4780
;4780:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2188
JUMPV
LABELV $2189
line 4782
;4781:  }
;4782:  return qtrue;
CNSTI4 1
RETI4
LABELV $2188
endproc ItemParse_model_angle 8 8
export ItemParse_rect
proc ItemParse_rect 4 8
line 4786
;4783:}
;4784:
;4785:// rect <rectangle>
;4786:qboolean ItemParse_rect( itemDef_t *item, int handle ) {
line 4787
;4787:  if (!PC_Rect_Parse(handle, &item->window.rectClient)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Rect_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2192
line 4788
;4788:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2191
JUMPV
LABELV $2192
line 4790
;4789:  }
;4790:  return qtrue;
CNSTI4 1
RETI4
LABELV $2191
endproc ItemParse_rect 4 8
export ItemParse_style
proc ItemParse_style 4 8
line 4794
;4791:}
;4792:
;4793:// style <integer>
;4794:qboolean ItemParse_style( itemDef_t *item, int handle ) {
line 4795
;4795:  if (!PC_Int_Parse(handle, &item->window.style)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2195
line 4796
;4796:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2194
JUMPV
LABELV $2195
line 4798
;4797:  }
;4798:  return qtrue;
CNSTI4 1
RETI4
LABELV $2194
endproc ItemParse_style 4 8
export ItemParse_decoration
proc ItemParse_decoration 4 0
line 4802
;4799:}
;4800:
;4801:// decoration
;4802:qboolean ItemParse_decoration( itemDef_t *item, int handle ) {
line 4803
;4803:  item->window.flags |= WINDOW_DECORATION;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 4804
;4804:  return qtrue;
CNSTI4 1
RETI4
LABELV $2197
endproc ItemParse_decoration 4 0
export ItemParse_notselectable
proc ItemParse_notselectable 4 4
line 4808
;4805:}
;4806:
;4807:// notselectable
;4808:qboolean ItemParse_notselectable( itemDef_t *item, int handle ) {
line 4810
;4809:  listBoxDef_t *listPtr;
;4810:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4811
;4811:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4812
;4812:  if (item->type == ITEM_TYPE_LISTBOX && listPtr) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2199
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2199
line 4813
;4813:    listPtr->notselectable = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 1
ASGNI4
line 4814
;4814:  }
LABELV $2199
line 4815
;4815:  return qtrue;
CNSTI4 1
RETI4
LABELV $2198
endproc ItemParse_notselectable 4 4
export ItemParse_wrapped
proc ItemParse_wrapped 4 0
line 4819
;4816:}
;4817:
;4818:// manually wrapped
;4819:qboolean ItemParse_wrapped( itemDef_t *item, int handle ) {
line 4820
;4820:  item->window.flags |= WINDOW_WRAPPED;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 262144
BORI4
ASGNI4
line 4821
;4821:  return qtrue;
CNSTI4 1
RETI4
LABELV $2201
endproc ItemParse_wrapped 4 0
export ItemParse_autowrapped
proc ItemParse_autowrapped 4 0
line 4825
;4822:}
;4823:
;4824:// auto wrapped
;4825:qboolean ItemParse_autowrapped( itemDef_t *item, int handle ) {
line 4826
;4826:  item->window.flags |= WINDOW_AUTOWRAPPED;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 4827
;4827:  return qtrue;
CNSTI4 1
RETI4
LABELV $2202
endproc ItemParse_autowrapped 4 0
export ItemParse_horizontalscroll
proc ItemParse_horizontalscroll 4 0
line 4832
;4828:}
;4829:
;4830:
;4831:// horizontalscroll
;4832:qboolean ItemParse_horizontalscroll( itemDef_t *item, int handle ) {
line 4833
;4833:  item->window.flags |= WINDOW_HORIZONTAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 4834
;4834:  return qtrue;
CNSTI4 1
RETI4
LABELV $2203
endproc ItemParse_horizontalscroll 4 0
export ItemParse_type
proc ItemParse_type 4 8
line 4838
;4835:}
;4836:
;4837:// type <integer>
;4838:qboolean ItemParse_type( itemDef_t *item, int handle ) {
line 4839
;4839:  if (!PC_Int_Parse(handle, &item->type)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2205
line 4840
;4840:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2204
JUMPV
LABELV $2205
line 4842
;4841:  }
;4842:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4843
;4843:  return qtrue;
CNSTI4 1
RETI4
LABELV $2204
endproc ItemParse_type 4 8
export ItemParse_elementwidth
proc ItemParse_elementwidth 8 8
line 4848
;4844:}
;4845:
;4846:// elementwidth, used for listbox image elements
;4847:// uses textalignx for storage
;4848:qboolean ItemParse_elementwidth( itemDef_t *item, int handle ) {
line 4851
;4849:  listBoxDef_t *listPtr;
;4850:
;4851:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4852
;4852:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4853
;4853:  if (!PC_Float_Parse(handle, &listPtr->elementWidth)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2208
line 4854
;4854:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2207
JUMPV
LABELV $2208
line 4856
;4855:  }
;4856:  return qtrue;
CNSTI4 1
RETI4
LABELV $2207
endproc ItemParse_elementwidth 8 8
export ItemParse_elementheight
proc ItemParse_elementheight 8 8
line 4861
;4857:}
;4858:
;4859:// elementheight, used for listbox image elements
;4860:// uses textaligny for storage
;4861:qboolean ItemParse_elementheight( itemDef_t *item, int handle ) {
line 4864
;4862:  listBoxDef_t *listPtr;
;4863:
;4864:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4865
;4865:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4866
;4866:  if (!PC_Float_Parse(handle, &listPtr->elementHeight)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2211
line 4867
;4867:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2210
JUMPV
LABELV $2211
line 4869
;4868:  }
;4869:  return qtrue;
CNSTI4 1
RETI4
LABELV $2210
endproc ItemParse_elementheight 8 8
export ItemParse_feeder
proc ItemParse_feeder 4 8
line 4873
;4870:}
;4871:
;4872:// feeder <float>
;4873:qboolean ItemParse_feeder( itemDef_t *item, int handle ) {
line 4874
;4874:  if (!PC_Float_Parse(handle, &item->special)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2214
line 4875
;4875:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2213
JUMPV
LABELV $2214
line 4877
;4876:  }
;4877:  return qtrue;
CNSTI4 1
RETI4
LABELV $2213
endproc ItemParse_feeder 4 8
export ItemParse_elementtype
proc ItemParse_elementtype 8 8
line 4882
;4878:}
;4879:
;4880:// elementtype, used to specify what type of elements a listbox contains
;4881:// uses textstyle for storage
;4882:qboolean ItemParse_elementtype( itemDef_t *item, int handle ) {
line 4885
;4883:  listBoxDef_t *listPtr;
;4884:
;4885:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4886
;4886:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2217
line 4887
;4887:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2216
JUMPV
LABELV $2217
line 4888
;4888:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4889
;4889:  if (!PC_Int_Parse(handle, &listPtr->elementStyle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2219
line 4890
;4890:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2216
JUMPV
LABELV $2219
line 4892
;4891:  }
;4892:  return qtrue;
CNSTI4 1
RETI4
LABELV $2216
endproc ItemParse_elementtype 8 8
export ItemParse_columns
proc ItemParse_columns 52 8
line 4896
;4893:}
;4894:
;4895:// columns sets a number of columns and an x pos and width per..
;4896:qboolean ItemParse_columns( itemDef_t *item, int handle ) {
line 4900
;4897:  int num, i;
;4898:  listBoxDef_t *listPtr;
;4899:
;4900:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4901
;4901:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2222
line 4902
;4902:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2221
JUMPV
LABELV $2222
line 4903
;4903:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 4904
;4904:  if (PC_Int_Parse(handle, &num)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2224
line 4905
;4905:    if (num > MAX_LB_COLUMNS) {
ADDRLP4 8
INDIRI4
CNSTI4 16
LEI4 $2226
line 4906
;4906:      num = MAX_LB_COLUMNS;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 4907
;4907:    }
LABELV $2226
line 4908
;4908:    listPtr->numColumns = num;
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4909
;4909:    for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2231
JUMPV
LABELV $2228
line 4912
;4910:      int pos, width, maxChars, align;
;4911:
;4912:      if( PC_Int_Parse( handle, &pos ) &&
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2232
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 36
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2232
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 40
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2232
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 44
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2232
line 4916
;4913:          PC_Int_Parse( handle, &width ) &&
;4914:          PC_Int_Parse( handle, &maxChars ) &&
;4915:          PC_Int_Parse( handle, &align ) )
;4916:      {
line 4917
;4917:        listPtr->columnInfo[i].pos = pos;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 4918
;4918:        listPtr->columnInfo[i].width = width;
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 4919
;4919:        listPtr->columnInfo[i].maxChars = maxChars;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 4920
;4920:        listPtr->columnInfo[i].align = align;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 4921
;4921:      } else {
ADDRGP4 $2233
JUMPV
LABELV $2232
line 4922
;4922:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2221
JUMPV
LABELV $2233
line 4924
;4923:      }
;4924:    }
LABELV $2229
line 4909
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2231
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2228
line 4925
;4925:  } else {
ADDRGP4 $2225
JUMPV
LABELV $2224
line 4926
;4926:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2221
JUMPV
LABELV $2225
line 4928
;4927:  }
;4928:  return qtrue;
CNSTI4 1
RETI4
LABELV $2221
endproc ItemParse_columns 52 8
export ItemParse_border
proc ItemParse_border 4 8
line 4931
;4929:}
;4930:
;4931:qboolean ItemParse_border( itemDef_t *item, int handle ) {
line 4932
;4932:  if (!PC_Int_Parse(handle, &item->window.border)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2235
line 4933
;4933:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2234
JUMPV
LABELV $2235
line 4935
;4934:  }
;4935:  return qtrue;
CNSTI4 1
RETI4
LABELV $2234
endproc ItemParse_border 4 8
export ItemParse_bordersize
proc ItemParse_bordersize 4 8
line 4938
;4936:}
;4937:
;4938:qboolean ItemParse_bordersize( itemDef_t *item, int handle ) {
line 4939
;4939:  if (!PC_Float_Parse(handle, &item->window.borderSize)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2238
line 4940
;4940:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2237
JUMPV
LABELV $2238
line 4942
;4941:  }
;4942:  return qtrue;
CNSTI4 1
RETI4
LABELV $2237
endproc ItemParse_bordersize 4 8
export ItemParse_visible
proc ItemParse_visible 12 8
line 4945
;4943:}
;4944:
;4945:qboolean ItemParse_visible( itemDef_t *item, int handle ) {
line 4948
;4946:  int i;
;4947:
;4948:  if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2241
line 4949
;4949:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2240
JUMPV
LABELV $2241
line 4951
;4950:  }
;4951:  if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2243
line 4952
;4952:    item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 4953
;4953:  }
LABELV $2243
line 4954
;4954:  return qtrue;
CNSTI4 1
RETI4
LABELV $2240
endproc ItemParse_visible 12 8
export ItemParse_ownerdraw
proc ItemParse_ownerdraw 4 8
line 4957
;4955:}
;4956:
;4957:qboolean ItemParse_ownerdraw( itemDef_t *item, int handle ) {
line 4958
;4958:  if (!PC_Int_Parse(handle, &item->window.ownerDraw)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2246
line 4959
;4959:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2245
JUMPV
LABELV $2246
line 4961
;4960:  }
;4961:  item->type = ITEM_TYPE_OWNERDRAW;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 8
ASGNI4
line 4962
;4962:  return qtrue;
CNSTI4 1
RETI4
LABELV $2245
endproc ItemParse_ownerdraw 4 8
export ItemParse_align
proc ItemParse_align 4 8
line 4965
;4963:}
;4964:
;4965:qboolean ItemParse_align( itemDef_t *item, int handle ) {
line 4966
;4966:  if (!PC_Int_Parse(handle, &item->alignment)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2249
line 4967
;4967:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2248
JUMPV
LABELV $2249
line 4969
;4968:  }
;4969:  return qtrue;
CNSTI4 1
RETI4
LABELV $2248
endproc ItemParse_align 4 8
export ItemParse_textalign
proc ItemParse_textalign 4 8
line 4972
;4970:}
;4971:
;4972:qboolean ItemParse_textalign( itemDef_t *item, int handle ) {
line 4973
;4973:  if (!PC_Int_Parse(handle, &item->textalignment)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2252
line 4974
;4974:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2251
JUMPV
LABELV $2252
line 4976
;4975:  }
;4976:  return qtrue;
CNSTI4 1
RETI4
LABELV $2251
endproc ItemParse_textalign 4 8
export ItemParse_textalignx
proc ItemParse_textalignx 4 8
line 4979
;4977:}
;4978:
;4979:qboolean ItemParse_textalignx( itemDef_t *item, int handle ) {
line 4980
;4980:  if (!PC_Float_Parse(handle, &item->textalignx)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2255
line 4981
;4981:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2254
JUMPV
LABELV $2255
line 4983
;4982:  }
;4983:  return qtrue;
CNSTI4 1
RETI4
LABELV $2254
endproc ItemParse_textalignx 4 8
export ItemParse_textaligny
proc ItemParse_textaligny 4 8
line 4986
;4984:}
;4985:
;4986:qboolean ItemParse_textaligny( itemDef_t *item, int handle ) {
line 4987
;4987:  if (!PC_Float_Parse(handle, &item->textaligny)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2258
line 4988
;4988:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2257
JUMPV
LABELV $2258
line 4990
;4989:  }
;4990:  return qtrue;
CNSTI4 1
RETI4
LABELV $2257
endproc ItemParse_textaligny 4 8
export ItemParse_textscale
proc ItemParse_textscale 4 8
line 4993
;4991:}
;4992:
;4993:qboolean ItemParse_textscale( itemDef_t *item, int handle ) {
line 4994
;4994:  if (!PC_Float_Parse(handle, &item->textscale)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2261
line 4995
;4995:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2260
JUMPV
LABELV $2261
line 4997
;4996:  }
;4997:  return qtrue;
CNSTI4 1
RETI4
LABELV $2260
endproc ItemParse_textscale 4 8
export ItemParse_textstyle
proc ItemParse_textstyle 4 8
line 5000
;4998:}
;4999:
;5000:qboolean ItemParse_textstyle( itemDef_t *item, int handle ) {
line 5001
;5001:  if (!PC_Int_Parse(handle, &item->textStyle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2264
line 5002
;5002:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2263
JUMPV
LABELV $2264
line 5004
;5003:  }
;5004:  return qtrue;
CNSTI4 1
RETI4
LABELV $2263
endproc ItemParse_textstyle 4 8
export ItemParse_backcolor
proc ItemParse_backcolor 12 8
line 5007
;5005:}
;5006:
;5007:qboolean ItemParse_backcolor( itemDef_t *item, int handle ) {
line 5011
;5008:  int i;
;5009:  float f;
;5010:
;5011:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2267
line 5012
;5012:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2271
line 5013
;5013:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2266
JUMPV
LABELV $2271
line 5015
;5014:    }
;5015:    item->window.backColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5016
;5016:  }
LABELV $2268
line 5011
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2267
line 5017
;5017:  return qtrue;
CNSTI4 1
RETI4
LABELV $2266
endproc ItemParse_backcolor 12 8
export ItemParse_forecolor
proc ItemParse_forecolor 16 8
line 5020
;5018:}
;5019:
;5020:qboolean ItemParse_forecolor( itemDef_t *item, int handle ) {
line 5024
;5021:  int i;
;5022:  float f;
;5023:
;5024:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2274
line 5025
;5025:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2278
line 5026
;5026:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2273
JUMPV
LABELV $2278
line 5028
;5027:    }
;5028:    item->window.foreColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5029
;5029:    item->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5030
;5030:  }
LABELV $2275
line 5024
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2274
line 5031
;5031:  return qtrue;
CNSTI4 1
RETI4
LABELV $2273
endproc ItemParse_forecolor 16 8
export ItemParse_bordercolor
proc ItemParse_bordercolor 12 8
line 5034
;5032:}
;5033:
;5034:qboolean ItemParse_bordercolor( itemDef_t *item, int handle ) {
line 5038
;5035:  int i;
;5036:  float f;
;5037:
;5038:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2281
line 5039
;5039:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2285
line 5040
;5040:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2280
JUMPV
LABELV $2285
line 5042
;5041:    }
;5042:    item->window.borderColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5043
;5043:  }
LABELV $2282
line 5038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2281
line 5044
;5044:  return qtrue;
CNSTI4 1
RETI4
LABELV $2280
endproc ItemParse_bordercolor 12 8
export ItemParse_outlinecolor
proc ItemParse_outlinecolor 4 8
line 5047
;5045:}
;5046:
;5047:qboolean ItemParse_outlinecolor( itemDef_t *item, int handle ) {
line 5048
;5048:  if (!PC_Color_Parse(handle, &item->window.outlineColor)){
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2288
line 5049
;5049:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2287
JUMPV
LABELV $2288
line 5051
;5050:  }
;5051:  return qtrue;
CNSTI4 1
RETI4
LABELV $2287
endproc ItemParse_outlinecolor 4 8
export ItemParse_background
proc ItemParse_background 12 8
line 5054
;5052:}
;5053:
;5054:qboolean ItemParse_background( itemDef_t *item, int handle ) {
line 5057
;5055:  const char *temp;
;5056:
;5057:  if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2291
line 5058
;5058:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2290
JUMPV
LABELV $2291
line 5060
;5059:  }
;5060:  item->window.background = DC->registerShaderNoMip(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5061
;5061:  return qtrue;
CNSTI4 1
RETI4
LABELV $2290
endproc ItemParse_background 12 8
export ItemParse_cinematic
proc ItemParse_cinematic 4 8
line 5064
;5062:}
;5063:
;5064:qboolean ItemParse_cinematic( itemDef_t *item, int handle ) {
line 5065
;5065:  if (!PC_String_Parse(handle, &item->window.cinematicName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2294
line 5066
;5066:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2293
JUMPV
LABELV $2294
line 5068
;5067:  }
;5068:  return qtrue;
CNSTI4 1
RETI4
LABELV $2293
endproc ItemParse_cinematic 4 8
export ItemParse_doubleClick
proc ItemParse_doubleClick 8 8
line 5071
;5069:}
;5070:
;5071:qboolean ItemParse_doubleClick( itemDef_t *item, int handle ) {
line 5074
;5072:  listBoxDef_t *listPtr;
;5073:
;5074:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5075
;5075:  if (!item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2297
line 5076
;5076:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2296
JUMPV
LABELV $2297
line 5079
;5077:  }
;5078:
;5079:  listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5081
;5080:
;5081:  if (!PC_Script_Parse(handle, &listPtr->doubleClick)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2299
line 5082
;5082:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2296
JUMPV
LABELV $2299
line 5084
;5083:  }
;5084:  return qtrue;
CNSTI4 1
RETI4
LABELV $2296
endproc ItemParse_doubleClick 8 8
export ItemParse_onFocus
proc ItemParse_onFocus 4 8
line 5087
;5085:}
;5086:
;5087:qboolean ItemParse_onFocus( itemDef_t *item, int handle ) {
line 5088
;5088:  if (!PC_Script_Parse(handle, &item->onFocus)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2302
line 5089
;5089:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2301
JUMPV
LABELV $2302
line 5091
;5090:  }
;5091:  return qtrue;
CNSTI4 1
RETI4
LABELV $2301
endproc ItemParse_onFocus 4 8
export ItemParse_leaveFocus
proc ItemParse_leaveFocus 4 8
line 5094
;5092:}
;5093:
;5094:qboolean ItemParse_leaveFocus( itemDef_t *item, int handle ) {
line 5095
;5095:  if (!PC_Script_Parse(handle, &item->leaveFocus)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2305
line 5096
;5096:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2304
JUMPV
LABELV $2305
line 5098
;5097:  }
;5098:  return qtrue;
CNSTI4 1
RETI4
LABELV $2304
endproc ItemParse_leaveFocus 4 8
export ItemParse_mouseEnter
proc ItemParse_mouseEnter 4 8
line 5101
;5099:}
;5100:
;5101:qboolean ItemParse_mouseEnter( itemDef_t *item, int handle ) {
line 5102
;5102:  if (!PC_Script_Parse(handle, &item->mouseEnter)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2308
line 5103
;5103:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2307
JUMPV
LABELV $2308
line 5105
;5104:  }
;5105:  return qtrue;
CNSTI4 1
RETI4
LABELV $2307
endproc ItemParse_mouseEnter 4 8
export ItemParse_mouseExit
proc ItemParse_mouseExit 4 8
line 5108
;5106:}
;5107:
;5108:qboolean ItemParse_mouseExit( itemDef_t *item, int handle ) {
line 5109
;5109:  if (!PC_Script_Parse(handle, &item->mouseExit)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2311
line 5110
;5110:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2310
JUMPV
LABELV $2311
line 5112
;5111:  }
;5112:  return qtrue;
CNSTI4 1
RETI4
LABELV $2310
endproc ItemParse_mouseExit 4 8
export ItemParse_mouseEnterText
proc ItemParse_mouseEnterText 4 8
line 5115
;5113:}
;5114:
;5115:qboolean ItemParse_mouseEnterText( itemDef_t *item, int handle ) {
line 5116
;5116:  if (!PC_Script_Parse(handle, &item->mouseEnterText)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2314
line 5117
;5117:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2313
JUMPV
LABELV $2314
line 5119
;5118:  }
;5119:  return qtrue;
CNSTI4 1
RETI4
LABELV $2313
endproc ItemParse_mouseEnterText 4 8
export ItemParse_mouseExitText
proc ItemParse_mouseExitText 4 8
line 5122
;5120:}
;5121:
;5122:qboolean ItemParse_mouseExitText( itemDef_t *item, int handle ) {
line 5123
;5123:  if (!PC_Script_Parse(handle, &item->mouseExitText)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2317
line 5124
;5124:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2316
JUMPV
LABELV $2317
line 5126
;5125:  }
;5126:  return qtrue;
CNSTI4 1
RETI4
LABELV $2316
endproc ItemParse_mouseExitText 4 8
export ItemParse_action
proc ItemParse_action 4 8
line 5129
;5127:}
;5128:
;5129:qboolean ItemParse_action( itemDef_t *item, int handle ) {
line 5130
;5130:  if (!PC_Script_Parse(handle, &item->action)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2320
line 5131
;5131:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2319
JUMPV
LABELV $2320
line 5133
;5132:  }
;5133:  return qtrue;
CNSTI4 1
RETI4
LABELV $2319
endproc ItemParse_action 4 8
export ItemParse_special
proc ItemParse_special 4 8
line 5136
;5134:}
;5135:
;5136:qboolean ItemParse_special( itemDef_t *item, int handle ) {
line 5137
;5137:  if (!PC_Float_Parse(handle, &item->special)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2323
line 5138
;5138:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2322
JUMPV
LABELV $2323
line 5140
;5139:  }
;5140:  return qtrue;
CNSTI4 1
RETI4
LABELV $2322
endproc ItemParse_special 4 8
export ItemParse_cvarTest
proc ItemParse_cvarTest 4 8
line 5143
;5141:}
;5142:
;5143:qboolean ItemParse_cvarTest( itemDef_t *item, int handle ) {
line 5144
;5144:  if (!PC_String_Parse(handle, &item->cvarTest)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2326
line 5145
;5145:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2325
JUMPV
LABELV $2326
line 5147
;5146:  }
;5147:  return qtrue;
CNSTI4 1
RETI4
LABELV $2325
endproc ItemParse_cvarTest 4 8
export ItemParse_cvar
proc ItemParse_cvar 8 8
line 5150
;5148:}
;5149:
;5150:qboolean ItemParse_cvar( itemDef_t *item, int handle ) {
line 5153
;5151:  editFieldDef_t *editPtr;
;5152:
;5153:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5154
;5154:  if (!PC_String_Parse(handle, &item->cvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2329
line 5155
;5155:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2328
JUMPV
LABELV $2329
line 5157
;5156:  }
;5157:  if (item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2331
line 5158
;5158:    editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5159
;5159:    editPtr->minVal = -1;
ADDRLP4 0
INDIRP4
CNSTF4 3212836864
ASGNF4
line 5160
;5160:    editPtr->maxVal = -1;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 5161
;5161:    editPtr->defVal = -1;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3212836864
ASGNF4
line 5162
;5162:  }
LABELV $2331
line 5163
;5163:  return qtrue;
CNSTI4 1
RETI4
LABELV $2328
endproc ItemParse_cvar 8 8
export ItemParse_maxChars
proc ItemParse_maxChars 12 8
line 5166
;5164:}
;5165:
;5166:qboolean ItemParse_maxChars( itemDef_t *item, int handle ) {
line 5170
;5167:  editFieldDef_t *editPtr;
;5168:  int maxChars;
;5169:
;5170:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5171
;5171:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2334
line 5172
;5172:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2333
JUMPV
LABELV $2334
line 5174
;5173:
;5174:  if (!PC_Int_Parse(handle, &maxChars)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2336
line 5175
;5175:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2333
JUMPV
LABELV $2336
line 5177
;5176:  }
;5177:  editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5178
;5178:  editPtr->maxChars = maxChars;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5179
;5179:  return qtrue;
CNSTI4 1
RETI4
LABELV $2333
endproc ItemParse_maxChars 12 8
export ItemParse_maxPaintChars
proc ItemParse_maxPaintChars 12 8
line 5182
;5180:}
;5181:
;5182:qboolean ItemParse_maxPaintChars( itemDef_t *item, int handle ) {
line 5186
;5183:  editFieldDef_t *editPtr;
;5184:  int maxChars;
;5185:
;5186:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5187
;5187:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2339
line 5188
;5188:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2338
JUMPV
LABELV $2339
line 5190
;5189:
;5190:  if (!PC_Int_Parse(handle, &maxChars)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2341
line 5191
;5191:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2338
JUMPV
LABELV $2341
line 5193
;5192:  }
;5193:  editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5194
;5194:  editPtr->maxPaintChars = maxChars;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5195
;5195:  return qtrue;
CNSTI4 1
RETI4
LABELV $2338
endproc ItemParse_maxPaintChars 12 8
export ItemParse_cvarFloat
proc ItemParse_cvarFloat 20 8
line 5200
;5196:}
;5197:
;5198:
;5199:
;5200:qboolean ItemParse_cvarFloat( itemDef_t *item, int handle ) {
line 5203
;5201:  editFieldDef_t *editPtr;
;5202:
;5203:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5204
;5204:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2344
line 5205
;5205:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2343
JUMPV
LABELV $2344
line 5206
;5206:  editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5207
;5207:  if (PC_String_Parse(handle, &item->cvar) &&
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2346
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2346
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2346
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2346
line 5210
;5208:    PC_Float_Parse(handle, &editPtr->defVal) &&
;5209:    PC_Float_Parse(handle, &editPtr->minVal) &&
;5210:    PC_Float_Parse(handle, &editPtr->maxVal)) {
line 5211
;5211:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2343
JUMPV
LABELV $2346
line 5213
;5212:  }
;5213:  return qfalse;
CNSTI4 0
RETI4
LABELV $2343
endproc ItemParse_cvarFloat 20 8
export ItemParse_cvarStrList
proc ItemParse_cvarStrList 1068 8
line 5216
;5214:}
;5215:
;5216:qboolean ItemParse_cvarStrList( itemDef_t *item, int handle ) {
line 5221
;5217:  pc_token_t token;
;5218:  multiDef_t *multiPtr;
;5219:  int pass;
;5220:
;5221:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5222
;5222:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2349
line 5223
;5223:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2349
line 5224
;5224:  multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5225
;5225:  multiPtr->count = 0;
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 5226
;5226:  multiPtr->strDef = qtrue;
ADDRLP4 1040
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 5228
;5227:
;5228:  if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 4
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
NEI4 $2351
line 5229
;5229:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2351
line 5230
;5230:  if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2353
line 5231
;5231:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2353
line 5234
;5232:  }
;5233:
;5234:  pass = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRGP4 $2357
JUMPV
LABELV $2356
line 5235
;5235:  while ( 1 ) {
line 5236
;5236:    if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 4
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
NEI4 $2359
line 5237
;5237:      PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2361
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5238
;5238:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2359
line 5241
;5239:    }
;5240:
;5241:    if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2362
line 5242
;5242:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2362
line 5245
;5243:    }
;5244:
;5245:    if (*token.string == ',' || *token.string == ';') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 44
EQI4 $2369
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $2365
LABELV $2369
line 5246
;5246:      continue;
ADDRGP4 $2357
JUMPV
LABELV $2365
line 5249
;5247:    }
;5248:
;5249:    if (pass == 0) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2370
line 5250
;5250:      multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1056
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1040
INDIRP4
ADDP4
ADDRLP4 1056
INDIRP4
ASGNP4
line 5251
;5251:      pass = 1;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 5252
;5252:    } else {
ADDRGP4 $2371
JUMPV
LABELV $2370
line 5253
;5253:      multiPtr->cvarStr[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1056
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1040
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 1056
INDIRP4
ASGNP4
line 5254
;5254:      pass = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 5255
;5255:      multiPtr->count++;
ADDRLP4 1064
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
ADDRLP4 1064
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5256
;5256:      if (multiPtr->count >= MAX_MULTI_CVARS) {
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2374
line 5257
;5257:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2374
line 5259
;5258:      }
;5259:    }
LABELV $2371
line 5261
;5260:
;5261:  }
LABELV $2357
line 5235
ADDRGP4 $2356
JUMPV
line 5262
;5262:  return qfalse;  // bk001205 - LCC missing return value
CNSTI4 0
RETI4
LABELV $2348
endproc ItemParse_cvarStrList 1068 8
export ItemParse_cvarFloatList
proc ItemParse_cvarFloatList 1072 8
line 5265
;5263:}
;5264:
;5265:qboolean ItemParse_cvarFloatList( itemDef_t *item, int handle ) {
line 5269
;5266:  pc_token_t token;
;5267:  multiDef_t *multiPtr;
;5268:
;5269:  Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5270
;5270:  if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2377
line 5271
;5271:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2377
line 5272
;5272:  multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5273
;5273:  multiPtr->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 5274
;5274:  multiPtr->strDef = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 5276
;5275:
;5276:  if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2379
line 5277
;5277:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2379
line 5278
;5278:  if (*token.string != '{') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2385
line 5279
;5279:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2384
line 5282
;5280:  }
;5281:
;5282:  while ( 1 ) {
line 5283
;5283:    if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2387
line 5284
;5284:      PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2361
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5285
;5285:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2387
line 5288
;5286:    }
;5287:
;5288:    if (*token.string == '}') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2389
line 5289
;5289:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2389
line 5292
;5290:    }
;5291:
;5292:    if (*token.string == ',' || *token.string == ';') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 44
EQI4 $2396
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $2392
LABELV $2396
line 5293
;5293:      continue;
ADDRGP4 $2385
JUMPV
LABELV $2392
line 5296
;5294:    }
;5295:
;5296:    multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 4+16
ARGP4
ADDRLP4 1052
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 1052
INDIRP4
ASGNP4
line 5297
;5297:    if (!PC_Float_Parse(handle, &multiPtr->cvarValue[multiPtr->count])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
ARGP4
ADDRLP4 1064
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2398
line 5298
;5298:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2398
line 5301
;5299:    }
;5300:
;5301:    multiPtr->count++;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5302
;5302:    if (multiPtr->count >= MAX_MULTI_CVARS) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2400
line 5303
;5303:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2400
line 5306
;5304:    }
;5305:
;5306:  }
LABELV $2385
line 5282
ADDRGP4 $2384
JUMPV
line 5307
;5307:  return qfalse;  // bk001205 - LCC missing return value
CNSTI4 0
RETI4
LABELV $2376
endproc ItemParse_cvarFloatList 1072 8
export ItemParse_addColorRange
proc ItemParse_addColorRange 48 12
line 5312
;5308:}
;5309:
;5310:
;5311:
;5312:qboolean ItemParse_addColorRange( itemDef_t *item, int handle ) {
line 5315
;5313:  colorRangeDef_t color;
;5314:
;5315:  if (PC_Float_Parse(handle, &color.low) &&
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0+16
ARGP4
ADDRLP4 24
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2403
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRLP4 28
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2403
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2403
line 5317
;5316:    PC_Float_Parse(handle, &color.high) &&
;5317:    PC_Color_Parse(handle, &color.color) ) {
line 5318
;5318:    if (item->numColors < MAX_COLOR_RANGES) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 10
GEI4 $2407
line 5319
;5319:      memcpy(&item->colorRanges[item->numColors], &color, sizeof(color));
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
CNSTI4 288
ADDP4
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5320
;5320:      item->numColors++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 284
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
line 5321
;5321:    }
LABELV $2407
line 5322
;5322:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2402
JUMPV
LABELV $2403
line 5324
;5323:  }
;5324:  return qfalse;
CNSTI4 0
RETI4
LABELV $2402
endproc ItemParse_addColorRange 48 12
export ItemParse_ownerdrawFlag
proc ItemParse_ownerdrawFlag 12 8
line 5327
;5325:}
;5326:
;5327:qboolean ItemParse_ownerdrawFlag( itemDef_t *item, int handle ) {
line 5329
;5328:  int i;
;5329:  if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2410
line 5330
;5330:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2409
JUMPV
LABELV $2410
line 5332
;5331:  }
;5332:  item->window.ownerDrawFlags |= i;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 5333
;5333:  return qtrue;
CNSTI4 1
RETI4
LABELV $2409
endproc ItemParse_ownerdrawFlag 12 8
export ItemParse_enableCvar
proc ItemParse_enableCvar 4 8
line 5336
;5334:}
;5335:
;5336:qboolean ItemParse_enableCvar( itemDef_t *item, int handle ) {
line 5337
;5337:  if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2413
line 5338
;5338:    item->cvarFlags = CVAR_ENABLE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 5339
;5339:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2412
JUMPV
LABELV $2413
line 5341
;5340:  }
;5341:  return qfalse;
CNSTI4 0
RETI4
LABELV $2412
endproc ItemParse_enableCvar 4 8
export ItemParse_disableCvar
proc ItemParse_disableCvar 4 8
line 5344
;5342:}
;5343:
;5344:qboolean ItemParse_disableCvar( itemDef_t *item, int handle ) {
line 5345
;5345:  if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2416
line 5346
;5346:    item->cvarFlags = CVAR_DISABLE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 5347
;5347:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2415
JUMPV
LABELV $2416
line 5349
;5348:  }
;5349:  return qfalse;
CNSTI4 0
RETI4
LABELV $2415
endproc ItemParse_disableCvar 4 8
export ItemParse_showCvar
proc ItemParse_showCvar 4 8
line 5352
;5350:}
;5351:
;5352:qboolean ItemParse_showCvar( itemDef_t *item, int handle ) {
line 5353
;5353:  if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2419
line 5354
;5354:    item->cvarFlags = CVAR_SHOW;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 5355
;5355:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2418
JUMPV
LABELV $2419
line 5357
;5356:  }
;5357:  return qfalse;
CNSTI4 0
RETI4
LABELV $2418
endproc ItemParse_showCvar 4 8
export ItemParse_hideCvar
proc ItemParse_hideCvar 4 8
line 5360
;5358:}
;5359:
;5360:qboolean ItemParse_hideCvar( itemDef_t *item, int handle ) {
line 5361
;5361:  if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2422
line 5362
;5362:    item->cvarFlags = CVAR_HIDE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 5363
;5363:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2421
JUMPV
LABELV $2422
line 5365
;5364:  }
;5365:  return qfalse;
CNSTI4 0
RETI4
LABELV $2421
endproc ItemParse_hideCvar 4 8
data
export itemParseKeywords
align 4
LABELV itemParseKeywords
address $2424
address ItemParse_name
byte 4 0
address $2425
address ItemParse_text
byte 4 0
address $2426
address ItemParse_group
byte 4 0
address $2427
address ItemParse_asset_model
byte 4 0
address $2428
address ItemParse_asset_shader
byte 4 0
address $2429
address ItemParse_model_origin
byte 4 0
address $2430
address ItemParse_model_fovx
byte 4 0
address $2431
address ItemParse_model_fovy
byte 4 0
address $2432
address ItemParse_model_rotation
byte 4 0
address $2433
address ItemParse_model_angle
byte 4 0
address $2434
address ItemParse_rect
byte 4 0
address $2435
address ItemParse_style
byte 4 0
address $2436
address ItemParse_decoration
byte 4 0
address $2437
address ItemParse_notselectable
byte 4 0
address $2438
address ItemParse_wrapped
byte 4 0
address $2439
address ItemParse_autowrapped
byte 4 0
address $2440
address ItemParse_horizontalscroll
byte 4 0
address $2441
address ItemParse_type
byte 4 0
address $2442
address ItemParse_elementwidth
byte 4 0
address $2443
address ItemParse_elementheight
byte 4 0
address $2444
address ItemParse_feeder
byte 4 0
address $2445
address ItemParse_elementtype
byte 4 0
address $2446
address ItemParse_columns
byte 4 0
address $2447
address ItemParse_border
byte 4 0
address $2448
address ItemParse_bordersize
byte 4 0
address $2449
address ItemParse_visible
byte 4 0
address $2450
address ItemParse_ownerdraw
byte 4 0
address $2451
address ItemParse_align
byte 4 0
address $2452
address ItemParse_textalign
byte 4 0
address $2453
address ItemParse_textalignx
byte 4 0
address $2454
address ItemParse_textaligny
byte 4 0
address $2455
address ItemParse_textscale
byte 4 0
address $2456
address ItemParse_textstyle
byte 4 0
address $362
address ItemParse_backcolor
byte 4 0
address $365
address ItemParse_forecolor
byte 4 0
address $368
address ItemParse_bordercolor
byte 4 0
address $2457
address ItemParse_outlinecolor
byte 4 0
address $2458
address ItemParse_background
byte 4 0
address $2459
address ItemParse_onFocus
byte 4 0
address $2460
address ItemParse_leaveFocus
byte 4 0
address $2461
address ItemParse_mouseEnter
byte 4 0
address $2462
address ItemParse_mouseExit
byte 4 0
address $2463
address ItemParse_mouseEnterText
byte 4 0
address $2464
address ItemParse_mouseExitText
byte 4 0
address $2465
address ItemParse_action
byte 4 0
address $2466
address ItemParse_special
byte 4 0
address $2467
address ItemParse_cvar
byte 4 0
address $2468
address ItemParse_maxChars
byte 4 0
address $2469
address ItemParse_maxPaintChars
byte 4 0
address $2470
address ItemParse_focusSound
byte 4 0
address $2471
address ItemParse_cvarFloat
byte 4 0
address $2472
address ItemParse_cvarStrList
byte 4 0
address $2473
address ItemParse_cvarFloatList
byte 4 0
address $2474
address ItemParse_addColorRange
byte 4 0
address $2475
address ItemParse_ownerdrawFlag
byte 4 0
address $2476
address ItemParse_enableCvar
byte 4 0
address $2477
address ItemParse_cvarTest
byte 4 0
address $2478
address ItemParse_disableCvar
byte 4 0
address $2479
address ItemParse_showCvar
byte 4 0
address $2480
address ItemParse_hideCvar
byte 4 0
address $2481
address ItemParse_cinematic
byte 4 0
address $2482
address ItemParse_doubleClick
byte 4 0
byte 4 0
address voidFunction2
byte 4 0
export Item_SetupKeywordHash
code
proc Item_SetupKeywordHash 4 12
line 5443
;5366:}
;5367:
;5368:
;5369:keywordHash_t itemParseKeywords[] = {
;5370:  {"name", ItemParse_name, NULL},
;5371:  {"text", ItemParse_text, NULL},
;5372:  {"group", ItemParse_group, NULL},
;5373:  {"asset_model", ItemParse_asset_model, NULL},
;5374:  {"asset_shader", ItemParse_asset_shader, NULL},
;5375:  {"model_origin", ItemParse_model_origin, NULL},
;5376:  {"model_fovx", ItemParse_model_fovx, NULL},
;5377:  {"model_fovy", ItemParse_model_fovy, NULL},
;5378:  {"model_rotation", ItemParse_model_rotation, NULL},
;5379:  {"model_angle", ItemParse_model_angle, NULL},
;5380:  {"rect", ItemParse_rect, NULL},
;5381:  {"style", ItemParse_style, NULL},
;5382:  {"decoration", ItemParse_decoration, NULL},
;5383:  {"notselectable", ItemParse_notselectable, NULL},
;5384:  {"wrapped", ItemParse_wrapped, NULL},
;5385:  {"autowrapped", ItemParse_autowrapped, NULL},
;5386:  {"horizontalscroll", ItemParse_horizontalscroll, NULL},
;5387:  {"type", ItemParse_type, NULL},
;5388:  {"elementwidth", ItemParse_elementwidth, NULL},
;5389:  {"elementheight", ItemParse_elementheight, NULL},
;5390:  {"feeder", ItemParse_feeder, NULL},
;5391:  {"elementtype", ItemParse_elementtype, NULL},
;5392:  {"columns", ItemParse_columns, NULL},
;5393:  {"border", ItemParse_border, NULL},
;5394:  {"bordersize", ItemParse_bordersize, NULL},
;5395:  {"visible", ItemParse_visible, NULL},
;5396:  {"ownerdraw", ItemParse_ownerdraw, NULL},
;5397:  {"align", ItemParse_align, NULL},
;5398:  {"textalign", ItemParse_textalign, NULL},
;5399:  {"textalignx", ItemParse_textalignx, NULL},
;5400:  {"textaligny", ItemParse_textaligny, NULL},
;5401:  {"textscale", ItemParse_textscale, NULL},
;5402:  {"textstyle", ItemParse_textstyle, NULL},
;5403:  {"backcolor", ItemParse_backcolor, NULL},
;5404:  {"forecolor", ItemParse_forecolor, NULL},
;5405:  {"bordercolor", ItemParse_bordercolor, NULL},
;5406:  {"outlinecolor", ItemParse_outlinecolor, NULL},
;5407:  {"background", ItemParse_background, NULL},
;5408:  {"onFocus", ItemParse_onFocus, NULL},
;5409:  {"leaveFocus", ItemParse_leaveFocus, NULL},
;5410:  {"mouseEnter", ItemParse_mouseEnter, NULL},
;5411:  {"mouseExit", ItemParse_mouseExit, NULL},
;5412:  {"mouseEnterText", ItemParse_mouseEnterText, NULL},
;5413:  {"mouseExitText", ItemParse_mouseExitText, NULL},
;5414:  {"action", ItemParse_action, NULL},
;5415:  {"special", ItemParse_special, NULL},
;5416:  {"cvar", ItemParse_cvar, NULL},
;5417:  {"maxChars", ItemParse_maxChars, NULL},
;5418:  {"maxPaintChars", ItemParse_maxPaintChars, NULL},
;5419:  {"focusSound", ItemParse_focusSound, NULL},
;5420:  {"cvarFloat", ItemParse_cvarFloat, NULL},
;5421:  {"cvarStrList", ItemParse_cvarStrList, NULL},
;5422:  {"cvarFloatList", ItemParse_cvarFloatList, NULL},
;5423:  {"addColorRange", ItemParse_addColorRange, NULL},
;5424:  {"ownerdrawFlag", ItemParse_ownerdrawFlag, NULL},
;5425:  {"enableCvar", ItemParse_enableCvar, NULL},
;5426:  {"cvarTest", ItemParse_cvarTest, NULL},
;5427:  {"disableCvar", ItemParse_disableCvar, NULL},
;5428:  {"showCvar", ItemParse_showCvar, NULL},
;5429:  {"hideCvar", ItemParse_hideCvar, NULL},
;5430:  {"cinematic", ItemParse_cinematic, NULL},
;5431:  {"doubleclick", ItemParse_doubleClick, NULL},
;5432:  {NULL, voidFunction2, NULL}
;5433:};
;5434:
;5435:keywordHash_t *itemParseKeywordHash[KEYWORDHASH_SIZE];
;5436:
;5437:/*
;5438:===============
;5439:Item_SetupKeywordHash
;5440:===============
;5441:*/
;5442:void Item_SetupKeywordHash( void )
;5443:{
line 5446
;5444:  int i;
;5445:
;5446:  memset( itemParseKeywordHash, 0, sizeof( itemParseKeywordHash ) );
ADDRGP4 itemParseKeywordHash
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2048
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5448
;5447:
;5448:  for( i = 0; itemParseKeywords[ i ].keyword; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2487
JUMPV
LABELV $2484
line 5449
;5449:    KeywordHash_Add( itemParseKeywordHash, &itemParseKeywords[ i ] );
ADDRGP4 itemParseKeywordHash
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 itemParseKeywords
ADDP4
ARGP4
ADDRGP4 KeywordHash_Add
CALLV
pop
LABELV $2485
line 5448
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2487
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 itemParseKeywords
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2484
line 5450
;5450:}
LABELV $2483
endproc Item_SetupKeywordHash 4 12
export Item_Parse
proc Item_Parse 1060 12
line 5457
;5451:
;5452:/*
;5453:===============
;5454:Item_Parse
;5455:===============
;5456:*/
;5457:qboolean Item_Parse(int handle, itemDef_t *item) {
line 5462
;5458:  pc_token_t token;
;5459:  keywordHash_t *key;
;5460:
;5461:
;5462:  if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $2489
line 5463
;5463:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2488
JUMPV
LABELV $2489
line 5464
;5464:  if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2495
line 5465
;5465:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2488
JUMPV
LABELV $2494
line 5467
;5466:  }
;5467:  while ( 1 ) {
line 5468
;5468:    if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 0
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
NEI4 $2497
line 5469
;5469:      PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2361
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5470
;5470:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2488
JUMPV
LABELV $2497
line 5473
;5471:    }
;5472:
;5473:    if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2499
line 5474
;5474:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2488
JUMPV
LABELV $2499
line 5477
;5475:    }
;5476:
;5477:    key = KeywordHash_Find(itemParseKeywordHash, token.string);
ADDRGP4 itemParseKeywordHash
ARGP4
ADDRLP4 0+16
ARGP4
ADDRLP4 1052
ADDRGP4 KeywordHash_Find
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1052
INDIRP4
ASGNP4
line 5478
;5478:    if (!key) {
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2503
line 5479
;5479:      PC_SourceError(handle, "unknown menu item keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2505
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5480
;5480:      continue;
ADDRGP4 $2495
JUMPV
LABELV $2503
line 5482
;5481:    }
;5482:    if ( !key->func(item, handle) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRLP4 1040
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2507
line 5483
;5483:      PC_SourceError(handle, "couldn't parse menu item keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2509
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5484
;5484:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2488
JUMPV
LABELV $2507
line 5486
;5485:    }
;5486:  }
LABELV $2495
line 5467
ADDRGP4 $2494
JUMPV
line 5487
;5487:  return qfalse;  // bk001205 - LCC missing return value
CNSTI4 0
RETI4
LABELV $2488
endproc Item_Parse 1060 12
export Item_InitControls
proc Item_InitControls 4 0
line 5493
;5488:}
;5489:
;5490:
;5491:// Item_InitControls
;5492:// init's special control types
;5493:void Item_InitControls(itemDef_t *item) {
line 5494
;5494:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2512
line 5495
;5495:    return;
ADDRGP4 $2511
JUMPV
LABELV $2512
line 5497
;5496:  }
;5497:  if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2514
line 5498
;5498:    listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 5499
;5499:    item->cursorPos = 0;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 5500
;5500:    if (listPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2516
line 5501
;5501:      listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 5502
;5502:      listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 5503
;5503:      listPtr->endPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 5504
;5504:      listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 5505
;5505:    }
LABELV $2516
line 5506
;5506:  }
LABELV $2514
line 5507
;5507:}
LABELV $2511
endproc Item_InitControls 4 0
export MenuParse_font
proc MenuParse_font 12 12
line 5515
;5508:
;5509:/*
;5510:===============
;5511:Menu Keyword Parse functions
;5512:===============
;5513:*/
;5514:
;5515:qboolean MenuParse_font( itemDef_t *item, int handle ) {
line 5516
;5516:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5517
;5517:  if (!PC_String_Parse(handle, &menu->font)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2519
line 5518
;5518:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2518
JUMPV
LABELV $2519
line 5520
;5519:  }
;5520:  if (!DC->Assets.fontRegistered) {
ADDRGP4 DC
INDIRP4
CNSTI4 61992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2521
line 5521
;5521:    DC->registerFont(menu->font, 48, &DC->Assets.textFont);
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CALLV
pop
line 5522
;5522:    DC->Assets.fontRegistered = qtrue;
ADDRGP4 DC
INDIRP4
CNSTI4 61992
ADDP4
CNSTI4 1
ASGNI4
line 5523
;5523:  }
LABELV $2521
line 5524
;5524:  return qtrue;
CNSTI4 1
RETI4
LABELV $2518
endproc MenuParse_font 12 12
export MenuParse_name
proc MenuParse_name 12 8
line 5527
;5525:}
;5526:
;5527:qboolean MenuParse_name( itemDef_t *item, int handle ) {
line 5528
;5528:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5529
;5529:  if (!PC_String_Parse(handle, &menu->window.name)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2524
line 5530
;5530:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2523
JUMPV
LABELV $2524
line 5532
;5531:  }
;5532:  if (Q_stricmp(menu->window.name, "main") == 0) {
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 $2528
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2526
line 5535
;5533:    // default main as having focus
;5534:    //menu->window.flags |= WINDOW_HASFOCUS;
;5535:  }
LABELV $2526
line 5536
;5536:  return qtrue;
CNSTI4 1
RETI4
LABELV $2523
endproc MenuParse_name 12 8
export MenuParse_fullscreen
proc MenuParse_fullscreen 8 8
line 5539
;5537:}
;5538:
;5539:qboolean MenuParse_fullscreen( itemDef_t *item, int handle ) {
line 5540
;5540:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5541
;5541:  if (!PC_Int_Parse(handle, (int*) &menu->fullScreen)) { // bk001206 - cast qboolean
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2530
line 5542
;5542:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2529
JUMPV
LABELV $2530
line 5544
;5543:  }
;5544:  return qtrue;
CNSTI4 1
RETI4
LABELV $2529
endproc MenuParse_fullscreen 8 8
export MenuParse_rect
proc MenuParse_rect 8 8
line 5547
;5545:}
;5546:
;5547:qboolean MenuParse_rect( itemDef_t *item, int handle ) {
line 5548
;5548:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5549
;5549:  if (!PC_Rect_Parse(handle, &menu->window.rect)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Rect_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2533
line 5550
;5550:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2532
JUMPV
LABELV $2533
line 5552
;5551:  }
;5552:  return qtrue;
CNSTI4 1
RETI4
LABELV $2532
endproc MenuParse_rect 8 8
export MenuParse_style
proc MenuParse_style 8 8
line 5555
;5553:}
;5554:
;5555:qboolean MenuParse_style( itemDef_t *item, int handle ) {
line 5556
;5556:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5557
;5557:  if (!PC_Int_Parse(handle, &menu->window.style)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2536
line 5558
;5558:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2535
JUMPV
LABELV $2536
line 5560
;5559:  }
;5560:  return qtrue;
CNSTI4 1
RETI4
LABELV $2535
endproc MenuParse_style 8 8
export MenuParse_visible
proc MenuParse_visible 16 8
line 5563
;5561:}
;5562:
;5563:qboolean MenuParse_visible( itemDef_t *item, int handle ) {
line 5565
;5564:  int i;
;5565:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5567
;5566:
;5567:  if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2539
line 5568
;5568:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2538
JUMPV
LABELV $2539
line 5570
;5569:  }
;5570:  if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2541
line 5571
;5571:    menu->window.flags |= WINDOW_VISIBLE;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 5572
;5572:  }
LABELV $2541
line 5573
;5573:  return qtrue;
CNSTI4 1
RETI4
LABELV $2538
endproc MenuParse_visible 16 8
export MenuParse_onOpen
proc MenuParse_onOpen 8 8
line 5576
;5574:}
;5575:
;5576:qboolean MenuParse_onOpen( itemDef_t *item, int handle ) {
line 5577
;5577:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5578
;5578:  if (!PC_Script_Parse(handle, &menu->onOpen)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2544
line 5579
;5579:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2544
line 5581
;5580:  }
;5581:  return qtrue;
CNSTI4 1
RETI4
LABELV $2543
endproc MenuParse_onOpen 8 8
export MenuParse_onClose
proc MenuParse_onClose 8 8
line 5584
;5582:}
;5583:
;5584:qboolean MenuParse_onClose( itemDef_t *item, int handle ) {
line 5585
;5585:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5586
;5586:  if (!PC_Script_Parse(handle, &menu->onClose)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2547
line 5587
;5587:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2546
JUMPV
LABELV $2547
line 5589
;5588:  }
;5589:  return qtrue;
CNSTI4 1
RETI4
LABELV $2546
endproc MenuParse_onClose 8 8
export MenuParse_onESC
proc MenuParse_onESC 8 8
line 5592
;5590:}
;5591:
;5592:qboolean MenuParse_onESC( itemDef_t *item, int handle ) {
line 5593
;5593:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5594
;5594:  if (!PC_Script_Parse(handle, &menu->onESC)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2550
line 5595
;5595:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2549
JUMPV
LABELV $2550
line 5597
;5596:  }
;5597:  return qtrue;
CNSTI4 1
RETI4
LABELV $2549
endproc MenuParse_onESC 8 8
export MenuParse_border
proc MenuParse_border 8 8
line 5602
;5598:}
;5599:
;5600:
;5601:
;5602:qboolean MenuParse_border( itemDef_t *item, int handle ) {
line 5603
;5603:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5604
;5604:  if (!PC_Int_Parse(handle, &menu->window.border)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2553
line 5605
;5605:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2552
JUMPV
LABELV $2553
line 5607
;5606:  }
;5607:  return qtrue;
CNSTI4 1
RETI4
LABELV $2552
endproc MenuParse_border 8 8
export MenuParse_borderSize
proc MenuParse_borderSize 8 8
line 5610
;5608:}
;5609:
;5610:qboolean MenuParse_borderSize( itemDef_t *item, int handle ) {
line 5611
;5611:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5612
;5612:  if (!PC_Float_Parse(handle, &menu->window.borderSize)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2556
line 5613
;5613:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2555
JUMPV
LABELV $2556
line 5615
;5614:  }
;5615:  return qtrue;
CNSTI4 1
RETI4
LABELV $2555
endproc MenuParse_borderSize 8 8
export MenuParse_backcolor
proc MenuParse_backcolor 16 8
line 5618
;5616:}
;5617:
;5618:qboolean MenuParse_backcolor( itemDef_t *item, int handle ) {
line 5621
;5619:  int i;
;5620:  float f;
;5621:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5623
;5622:
;5623:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2559
line 5624
;5624:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2563
line 5625
;5625:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2563
line 5627
;5626:    }
;5627:    menu->window.backColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5628
;5628:  }
LABELV $2560
line 5623
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2559
line 5629
;5629:  return qtrue;
CNSTI4 1
RETI4
LABELV $2558
endproc MenuParse_backcolor 16 8
export MenuParse_forecolor
proc MenuParse_forecolor 20 8
line 5632
;5630:}
;5631:
;5632:qboolean MenuParse_forecolor( itemDef_t *item, int handle ) {
line 5635
;5633:  int i;
;5634:  float f;
;5635:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5637
;5636:
;5637:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2566
line 5638
;5638:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2570
line 5639
;5639:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2565
JUMPV
LABELV $2570
line 5641
;5640:    }
;5641:    menu->window.foreColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 5642
;5642:    menu->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5643
;5643:  }
LABELV $2567
line 5637
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2566
line 5644
;5644:  return qtrue;
CNSTI4 1
RETI4
LABELV $2565
endproc MenuParse_forecolor 20 8
export MenuParse_bordercolor
proc MenuParse_bordercolor 16 8
line 5647
;5645:}
;5646:
;5647:qboolean MenuParse_bordercolor( itemDef_t *item, int handle ) {
line 5650
;5648:  int i;
;5649:  float f;
;5650:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5652
;5651:
;5652:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2573
line 5653
;5653:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2577
line 5654
;5654:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2572
JUMPV
LABELV $2577
line 5656
;5655:    }
;5656:    menu->window.borderColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5657
;5657:  }
LABELV $2574
line 5652
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2573
line 5658
;5658:  return qtrue;
CNSTI4 1
RETI4
LABELV $2572
endproc MenuParse_bordercolor 16 8
export MenuParse_focuscolor
proc MenuParse_focuscolor 16 8
line 5661
;5659:}
;5660:
;5661:qboolean MenuParse_focuscolor( itemDef_t *item, int handle ) {
line 5664
;5662:  int i;
;5663:  float f;
;5664:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5666
;5665:
;5666:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2580
line 5667
;5667:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2584
line 5668
;5668:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2579
JUMPV
LABELV $2584
line 5670
;5669:    }
;5670:    menu->focusColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 228
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5671
;5671:  }
LABELV $2581
line 5666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2580
line 5672
;5672:  return qtrue;
CNSTI4 1
RETI4
LABELV $2579
endproc MenuParse_focuscolor 16 8
export MenuParse_disablecolor
proc MenuParse_disablecolor 16 8
line 5675
;5673:}
;5674:
;5675:qboolean MenuParse_disablecolor( itemDef_t *item, int handle ) {
line 5678
;5676:  int i;
;5677:  float f;
;5678:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5679
;5679:  for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2587
line 5680
;5680:    if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2591
line 5681
;5681:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2586
JUMPV
LABELV $2591
line 5683
;5682:    }
;5683:    menu->disableColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 244
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5684
;5684:  }
LABELV $2588
line 5679
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2587
line 5685
;5685:  return qtrue;
CNSTI4 1
RETI4
LABELV $2586
endproc MenuParse_disablecolor 16 8
export MenuParse_outlinecolor
proc MenuParse_outlinecolor 8 8
line 5689
;5686:}
;5687:
;5688:
;5689:qboolean MenuParse_outlinecolor( itemDef_t *item, int handle ) {
line 5690
;5690:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5691
;5691:  if (!PC_Color_Parse(handle, &menu->window.outlineColor)){
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2594
line 5692
;5692:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2593
JUMPV
LABELV $2594
line 5694
;5693:  }
;5694:  return qtrue;
CNSTI4 1
RETI4
LABELV $2593
endproc MenuParse_outlinecolor 8 8
export MenuParse_background
proc MenuParse_background 16 8
line 5697
;5695:}
;5696:
;5697:qboolean MenuParse_background( itemDef_t *item, int handle ) {
line 5699
;5698:  const char *buff;
;5699:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5701
;5700:
;5701:  if (!PC_String_Parse(handle, &buff)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2597
line 5702
;5702:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2597
line 5704
;5703:  }
;5704:  menu->window.background = DC->registerShaderNoMip(buff);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5705
;5705:  return qtrue;
CNSTI4 1
RETI4
LABELV $2596
endproc MenuParse_background 16 8
export MenuParse_cinematic
proc MenuParse_cinematic 8 8
line 5708
;5706:}
;5707:
;5708:qboolean MenuParse_cinematic( itemDef_t *item, int handle ) {
line 5709
;5709:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5711
;5710:
;5711:  if (!PC_String_Parse(handle, &menu->window.cinematicName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2600
line 5712
;5712:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2599
JUMPV
LABELV $2600
line 5714
;5713:  }
;5714:  return qtrue;
CNSTI4 1
RETI4
LABELV $2599
endproc MenuParse_cinematic 8 8
export MenuParse_ownerdrawFlag
proc MenuParse_ownerdrawFlag 16 8
line 5717
;5715:}
;5716:
;5717:qboolean MenuParse_ownerdrawFlag( itemDef_t *item, int handle ) {
line 5719
;5718:  int i;
;5719:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5721
;5720:
;5721:  if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2603
line 5722
;5722:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2602
JUMPV
LABELV $2603
line 5724
;5723:  }
;5724:  menu->window.ownerDrawFlags |= i;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 5725
;5725:  return qtrue;
CNSTI4 1
RETI4
LABELV $2602
endproc MenuParse_ownerdrawFlag 16 8
export MenuParse_ownerdraw
proc MenuParse_ownerdraw 8 8
line 5728
;5726:}
;5727:
;5728:qboolean MenuParse_ownerdraw( itemDef_t *item, int handle ) {
line 5729
;5729:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5731
;5730:
;5731:  if (!PC_Int_Parse(handle, &menu->window.ownerDraw)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2606
line 5732
;5732:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2605
JUMPV
LABELV $2606
line 5734
;5733:  }
;5734:  return qtrue;
CNSTI4 1
RETI4
LABELV $2605
endproc MenuParse_ownerdraw 8 8
export MenuParse_popup
proc MenuParse_popup 8 0
line 5739
;5735:}
;5736:
;5737:
;5738:// decoration
;5739:qboolean MenuParse_popup( itemDef_t *item, int handle ) {
line 5740
;5740:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5741
;5741:  menu->window.flags |= WINDOW_POPUP;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 5742
;5742:  return qtrue;
CNSTI4 1
RETI4
LABELV $2608
endproc MenuParse_popup 8 0
export MenuParse_outOfBounds
proc MenuParse_outOfBounds 8 0
line 5746
;5743:}
;5744:
;5745:
;5746:qboolean MenuParse_outOfBounds( itemDef_t *item, int handle ) {
line 5747
;5747:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5749
;5748:
;5749:  menu->window.flags |= WINDOW_OOB_CLICK;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 5750
;5750:  return qtrue;
CNSTI4 1
RETI4
LABELV $2609
endproc MenuParse_outOfBounds 8 0
export MenuParse_soundLoop
proc MenuParse_soundLoop 8 8
line 5753
;5751:}
;5752:
;5753:qboolean MenuParse_soundLoop( itemDef_t *item, int handle ) {
line 5754
;5754:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5756
;5755:
;5756:  if (!PC_String_Parse(handle, &menu->soundName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2611
line 5757
;5757:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2610
JUMPV
LABELV $2611
line 5759
;5758:  }
;5759:  return qtrue;
CNSTI4 1
RETI4
LABELV $2610
endproc MenuParse_soundLoop 8 8
export MenuParse_fadeClamp
proc MenuParse_fadeClamp 8 8
line 5762
;5760:}
;5761:
;5762:qboolean MenuParse_fadeClamp( itemDef_t *item, int handle ) {
line 5763
;5763:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5765
;5764:
;5765:  if (!PC_Float_Parse(handle, &menu->fadeClamp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2614
line 5766
;5766:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2613
JUMPV
LABELV $2614
line 5768
;5767:  }
;5768:  return qtrue;
CNSTI4 1
RETI4
LABELV $2613
endproc MenuParse_fadeClamp 8 8
export MenuParse_fadeAmount
proc MenuParse_fadeAmount 8 8
line 5771
;5769:}
;5770:
;5771:qboolean MenuParse_fadeAmount( itemDef_t *item, int handle ) {
line 5772
;5772:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5774
;5773:
;5774:  if (!PC_Float_Parse(handle, &menu->fadeAmount)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2617
line 5775
;5775:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2616
JUMPV
LABELV $2617
line 5777
;5776:  }
;5777:  return qtrue;
CNSTI4 1
RETI4
LABELV $2616
endproc MenuParse_fadeAmount 8 8
export MenuParse_fadeCycle
proc MenuParse_fadeCycle 8 8
line 5781
;5778:}
;5779:
;5780:
;5781:qboolean MenuParse_fadeCycle( itemDef_t *item, int handle ) {
line 5782
;5782:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5784
;5783:
;5784:  if (!PC_Int_Parse(handle, &menu->fadeCycle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2620
line 5785
;5785:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2619
JUMPV
LABELV $2620
line 5787
;5786:  }
;5787:  return qtrue;
CNSTI4 1
RETI4
LABELV $2619
endproc MenuParse_fadeCycle 8 8
export MenuParse_itemDef
proc MenuParse_itemDef 40 8
line 5791
;5788:}
;5789:
;5790:
;5791:qboolean MenuParse_itemDef( itemDef_t *item, int handle ) {
line 5792
;5792:  menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5793
;5793:  if (menu->itemCount < MAX_MENUITEMS) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 96
GEI4 $2623
line 5794
;5794:    menu->items[menu->itemCount] = UI_Alloc(sizeof(itemDef_t));
CNSTI4 540
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5795
;5795:    Item_Init(menu->items[menu->itemCount]);
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_Init
CALLV
pop
line 5796
;5796:    if (!Item_Parse(handle, menu->items[menu->itemCount])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2625
line 5797
;5797:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2622
JUMPV
LABELV $2625
line 5799
;5798:    }
;5799:    Item_InitControls(menu->items[menu->itemCount]);
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_InitControls
CALLV
pop
line 5800
;5800:    menu->items[menu->itemCount++]->parent = menu;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 228
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5801
;5801:  }
LABELV $2623
line 5802
;5802:  return qtrue;
CNSTI4 1
RETI4
LABELV $2622
endproc MenuParse_itemDef 40 8
data
export menuParseKeywords
align 4
LABELV menuParseKeywords
address $2627
address MenuParse_font
byte 4 0
address $2424
address MenuParse_name
byte 4 0
address $2628
address MenuParse_fullscreen
byte 4 0
address $2434
address MenuParse_rect
byte 4 0
address $2435
address MenuParse_style
byte 4 0
address $2449
address MenuParse_visible
byte 4 0
address $2629
address MenuParse_onOpen
byte 4 0
address $2630
address MenuParse_onClose
byte 4 0
address $2631
address MenuParse_onESC
byte 4 0
address $2447
address MenuParse_border
byte 4 0
address $2632
address MenuParse_borderSize
byte 4 0
address $362
address MenuParse_backcolor
byte 4 0
address $365
address MenuParse_forecolor
byte 4 0
address $368
address MenuParse_bordercolor
byte 4 0
address $2633
address MenuParse_focuscolor
byte 4 0
address $2634
address MenuParse_disablecolor
byte 4 0
address $2457
address MenuParse_outlinecolor
byte 4 0
address $2458
address MenuParse_background
byte 4 0
address $2450
address MenuParse_ownerdraw
byte 4 0
address $2475
address MenuParse_ownerdrawFlag
byte 4 0
address $2635
address MenuParse_outOfBounds
byte 4 0
address $2636
address MenuParse_soundLoop
byte 4 0
address $2637
address MenuParse_itemDef
byte 4 0
address $2481
address MenuParse_cinematic
byte 4 0
address $2638
address MenuParse_popup
byte 4 0
address $2639
address MenuParse_fadeClamp
byte 4 0
address $2640
address MenuParse_fadeCycle
byte 4 0
address $2641
address MenuParse_fadeAmount
byte 4 0
byte 4 0
address voidFunction2
byte 4 0
export Menu_SetupKeywordHash
code
proc Menu_SetupKeywordHash 4 12
line 5845
;5803:}
;5804:
;5805:keywordHash_t menuParseKeywords[] = {
;5806:  {"font", MenuParse_font, NULL},
;5807:  {"name", MenuParse_name, NULL},
;5808:  {"fullscreen", MenuParse_fullscreen, NULL},
;5809:  {"rect", MenuParse_rect, NULL},
;5810:  {"style", MenuParse_style, NULL},
;5811:  {"visible", MenuParse_visible, NULL},
;5812:  {"onOpen", MenuParse_onOpen, NULL},
;5813:  {"onClose", MenuParse_onClose, NULL},
;5814:  {"onESC", MenuParse_onESC, NULL},
;5815:  {"border", MenuParse_border, NULL},
;5816:  {"borderSize", MenuParse_borderSize, NULL},
;5817:  {"backcolor", MenuParse_backcolor, NULL},
;5818:  {"forecolor", MenuParse_forecolor, NULL},
;5819:  {"bordercolor", MenuParse_bordercolor, NULL},
;5820:  {"focuscolor", MenuParse_focuscolor, NULL},
;5821:  {"disablecolor", MenuParse_disablecolor, NULL},
;5822:  {"outlinecolor", MenuParse_outlinecolor, NULL},
;5823:  {"background", MenuParse_background, NULL},
;5824:  {"ownerdraw", MenuParse_ownerdraw, NULL},
;5825:  {"ownerdrawFlag", MenuParse_ownerdrawFlag, NULL},
;5826:  {"outOfBoundsClick", MenuParse_outOfBounds, NULL},
;5827:  {"soundLoop", MenuParse_soundLoop, NULL},
;5828:  {"itemDef", MenuParse_itemDef, NULL},
;5829:  {"cinematic", MenuParse_cinematic, NULL},
;5830:  {"popup", MenuParse_popup, NULL},
;5831:  {"fadeClamp", MenuParse_fadeClamp, NULL},
;5832:  {"fadeCycle", MenuParse_fadeCycle, NULL},
;5833:  {"fadeAmount", MenuParse_fadeAmount, NULL},
;5834:  {NULL, voidFunction2, NULL}
;5835:};
;5836:
;5837:keywordHash_t *menuParseKeywordHash[KEYWORDHASH_SIZE];
;5838:
;5839:/*
;5840:===============
;5841:Menu_SetupKeywordHash
;5842:===============
;5843:*/
;5844:void Menu_SetupKeywordHash( void )
;5845:{
line 5848
;5846:  int i;
;5847:
;5848:  memset( menuParseKeywordHash, 0, sizeof( menuParseKeywordHash ) );
ADDRGP4 menuParseKeywordHash
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2048
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5850
;5849:
;5850:  for(i = 0; menuParseKeywords[ i ].keyword; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2646
JUMPV
LABELV $2643
line 5851
;5851:    KeywordHash_Add( menuParseKeywordHash, &menuParseKeywords[ i ] );
ADDRGP4 menuParseKeywordHash
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 menuParseKeywords
ADDP4
ARGP4
ADDRGP4 KeywordHash_Add
CALLV
pop
LABELV $2644
line 5850
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2646
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 menuParseKeywords
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2643
line 5852
;5852:}
LABELV $2642
endproc Menu_SetupKeywordHash 4 12
export Menu_Parse
proc Menu_Parse 1060 12
line 5859
;5853:
;5854:/*
;5855:===============
;5856:Menu_Parse
;5857:===============
;5858:*/
;5859:qboolean Menu_Parse(int handle, menuDef_t *menu) {
line 5863
;5860:  pc_token_t token;
;5861:  keywordHash_t *key;
;5862:
;5863:  if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $2648
line 5864
;5864:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2647
JUMPV
LABELV $2648
line 5865
;5865:  if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2654
line 5866
;5866:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2647
JUMPV
LABELV $2653
line 5869
;5867:  }
;5868:
;5869:  while ( 1 ) {
line 5871
;5870:
;5871:    memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5872
;5872:    if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 0
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
NEI4 $2656
line 5873
;5873:      PC_SourceError(handle, "end of file inside menu\n");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2658
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5874
;5874:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2647
JUMPV
LABELV $2656
line 5877
;5875:    }
;5876:
;5877:    if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2659
line 5878
;5878:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2647
JUMPV
LABELV $2659
line 5881
;5879:    }
;5880:
;5881:    key = KeywordHash_Find(menuParseKeywordHash, token.string);
ADDRGP4 menuParseKeywordHash
ARGP4
ADDRLP4 0+16
ARGP4
ADDRLP4 1052
ADDRGP4 KeywordHash_Find
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1052
INDIRP4
ASGNP4
line 5882
;5882:    if (!key) {
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2663
line 5883
;5883:      PC_SourceError(handle, "unknown menu keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2665
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5884
;5884:      continue;
ADDRGP4 $2654
JUMPV
LABELV $2663
line 5886
;5885:    }
;5886:    if ( !key->func((itemDef_t*)menu, handle) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRLP4 1040
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2667
line 5887
;5887:      PC_SourceError(handle, "couldn't parse menu keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2669
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5888
;5888:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2647
JUMPV
LABELV $2667
line 5890
;5889:    }
;5890:  }
LABELV $2654
line 5869
ADDRGP4 $2653
JUMPV
line 5891
;5891:  return qfalse;  // bk001205 - LCC missing return value
CNSTI4 0
RETI4
LABELV $2647
endproc Menu_Parse 1060 12
export Menu_New
proc Menu_New 12 8
line 5899
;5892:}
;5893:
;5894:/*
;5895:===============
;5896:Menu_New
;5897:===============
;5898:*/
;5899:void Menu_New(int handle) {
line 5900
;5900:  menuDef_t *menu = &Menus[menuCount];
ADDRLP4 0
CNSTI4 644
ADDRGP4 menuCount
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ASGNP4
line 5902
;5901:
;5902:  if (menuCount < MAX_MENUS) {
ADDRGP4 menuCount
INDIRI4
CNSTI4 256
GEI4 $2672
line 5903
;5903:    Menu_Init(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_Init
CALLV
pop
line 5904
;5904:    if (Menu_Parse(handle, menu)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menu_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2674
line 5905
;5905:      Menu_PostParse(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_PostParse
CALLV
pop
line 5906
;5906:      menuCount++;
ADDRLP4 8
ADDRGP4 menuCount
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5907
;5907:    }
LABELV $2674
line 5908
;5908:  }
LABELV $2672
line 5909
;5909:}
LABELV $2671
endproc Menu_New 12 8
export Menu_Count
proc Menu_Count 0 0
line 5911
;5910:
;5911:int Menu_Count( void ) {
line 5912
;5912:  return menuCount;
ADDRGP4 menuCount
INDIRI4
RETI4
LABELV $2676
endproc Menu_Count 0 0
lit
align 4
LABELV $2686
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export Menu_PaintAll
code
proc Menu_PaintAll 32 32
line 5915
;5913:}
;5914:
;5915:void Menu_PaintAll( void ) {
line 5917
;5916:  int i;
;5917:  if (captureFunc) {
ADDRGP4 captureFunc
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2678
line 5918
;5918:    captureFunc(captureData);
ADDRGP4 captureData
INDIRP4
ARGP4
ADDRGP4 captureFunc
INDIRP4
CALLV
pop
line 5919
;5919:  }
LABELV $2678
line 5921
;5920:
;5921:  for (i = 0; i < Menu_Count(); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2683
JUMPV
LABELV $2680
line 5922
;5922:    Menu_Paint(&Menus[i], qfalse);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 5923
;5923:  }
LABELV $2681
line 5921
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2683
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2680
line 5925
;5924:
;5925:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $2684
line 5926
;5926:    vec4_t v = {1, 1, 1, 1};
ADDRLP4 8
ADDRGP4 $2686
INDIRB
ASGNB 16
line 5927
;5927:    DC->drawText(5, 25, .5, v, va("fps: %f", DC->FPS), 0, 0, 0);
ADDRGP4 $2687
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 73352
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1084227584
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1056964608
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 5928
;5928:  }
LABELV $2684
line 5929
;5929:}
LABELV $2677
endproc Menu_PaintAll 32 32
export Menu_Reset
proc Menu_Reset 0 0
line 5932
;5930:
;5931:void Menu_Reset( void )
;5932:{
line 5933
;5933:  menuCount = 0;
ADDRGP4 menuCount
CNSTI4 0
ASGNI4
line 5934
;5934:}
LABELV $2688
endproc Menu_Reset 0 0
export Display_GetContext
proc Display_GetContext 0 0
line 5936
;5935:
;5936:displayContextDef_t *Display_GetContext( void ) {
line 5937
;5937:  return DC;
ADDRGP4 DC
INDIRP4
RETP4
LABELV $2689
endproc Display_GetContext 0 0
export Display_CaptureItem
proc Display_CaptureItem 8 12
line 5940
;5938:}
;5939:
;5940:void *Display_CaptureItem(int x, int y) {
line 5943
;5941:  int i;
;5942:
;5943:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2694
JUMPV
LABELV $2691
line 5946
;5944:    // turn off focus each item
;5945:    // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;5946:    if (Rect_ContainsPoint(&Menus[i].window.rect, x, y)) {
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2695
line 5947
;5947:      return &Menus[i];
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $2690
JUMPV
LABELV $2695
line 5949
;5948:    }
;5949:  }
LABELV $2692
line 5943
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2694
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2691
line 5950
;5950:  return NULL;
CNSTP4 0
RETP4
LABELV $2690
endproc Display_CaptureItem 8 12
export Display_MouseMove
proc Display_MouseMove 16 12
line 5955
;5951:}
;5952:
;5953:
;5954:// FIXME:
;5955:qboolean Display_MouseMove(void *p, int x, int y) {
line 5957
;5956:  int i;
;5957:  menuDef_t *menu = p;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5959
;5958:
;5959:  if (menu == NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2698
line 5960
;5960:    menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 5961
;5961:    if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2700
line 5962
;5962:      if (menu->window.flags & WINDOW_POPUP) {
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $2702
line 5963
;5963:        Menu_HandleMouseMove(menu, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 5964
;5964:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2697
JUMPV
LABELV $2702
line 5966
;5965:      }
;5966:    }
LABELV $2700
line 5967
;5967:    for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2707
JUMPV
LABELV $2704
line 5968
;5968:      Menu_HandleMouseMove(&Menus[i], x, y);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 5969
;5969:    }
LABELV $2705
line 5967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2707
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2704
line 5970
;5970:  } else {
ADDRGP4 $2699
JUMPV
LABELV $2698
line 5971
;5971:    menu->window.rect.x += x;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 5972
;5972:    menu->window.rect.y += y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 5973
;5973:    Menu_UpdatePosition(menu);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menu_UpdatePosition
CALLV
pop
line 5974
;5974:  }
LABELV $2699
line 5975
;5975:  return qtrue;
CNSTI4 1
RETI4
LABELV $2697
endproc Display_MouseMove 16 12
export Display_CursorType
proc Display_CursorType 28 12
line 5979
;5976:
;5977:}
;5978:
;5979:int Display_CursorType(int x, int y) {
line 5981
;5980:  int i;
;5981:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2712
JUMPV
LABELV $2709
line 5983
;5982:    rectDef_t r2;
;5983:    r2.x = Menus[i].window.rect.x - 3;
ADDRLP4 4
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
INDIRF4
CNSTF4 1077936128
SUBF4
ASGNF4
line 5984
;5984:    r2.y = Menus[i].window.rect.y - 3;
ADDRLP4 4+4
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+4
ADDP4
INDIRF4
CNSTF4 1077936128
SUBF4
ASGNF4
line 5985
;5985:    r2.w = r2.h = 7;
ADDRLP4 20
CNSTF4 1088421888
ASGNF4
ADDRLP4 4+12
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 20
INDIRF4
ASGNF4
line 5986
;5986:    if (Rect_ContainsPoint(&r2, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2717
line 5987
;5987:      return CURSOR_SIZER;
CNSTI4 4
RETI4
ADDRGP4 $2708
JUMPV
LABELV $2717
line 5989
;5988:    }
;5989:  }
LABELV $2710
line 5981
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2712
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2709
line 5990
;5990:  return CURSOR_ARROW;
CNSTI4 2
RETI4
LABELV $2708
endproc Display_CursorType 28 12
export Display_HandleKey
proc Display_HandleKey 12 12
line 5994
;5991:}
;5992:
;5993:
;5994:void Display_HandleKey(int key, qboolean down, int x, int y) {
line 5995
;5995:  menuDef_t *menu = Display_CaptureItem(x, y);
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Display_CaptureItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 5996
;5996:  if (menu == NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2720
line 5997
;5997:    menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 5998
;5998:  }
LABELV $2720
line 5999
;5999:  if (menu) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2722
line 6000
;6000:    Menu_HandleKey(menu, key, down );
ADDRLP4 0
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
line 6001
;6001:  }
LABELV $2722
line 6002
;6002:}
LABELV $2719
endproc Display_HandleKey 12 12
proc Window_CacheContents 12 20
line 6004
;6003:
;6004:static void Window_CacheContents(windowDef_t *window) {
line 6005
;6005:  if (window) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2725
line 6006
;6006:    if (window->cinematicName) {
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2727
line 6007
;6007:      int cin = DC->playCinematic(window->cinematicName, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 180
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 6008
;6008:      DC->stopCinematic(cin);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLV
pop
line 6009
;6009:    }
LABELV $2727
line 6010
;6010:  }
LABELV $2725
line 6011
;6011:}
LABELV $2724
endproc Window_CacheContents 12 20
proc Item_CacheContents 0 4
line 6014
;6012:
;6013:
;6014:static void Item_CacheContents(itemDef_t *item) {
line 6015
;6015:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2730
line 6016
;6016:    Window_CacheContents(&item->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CacheContents
CALLV
pop
line 6017
;6017:  }
LABELV $2730
line 6019
;6018:
;6019:}
LABELV $2729
endproc Item_CacheContents 0 4
proc Menu_CacheContents 8 8
line 6021
;6020:
;6021:static void Menu_CacheContents(menuDef_t *menu) {
line 6022
;6022:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2733
line 6024
;6023:    int i;
;6024:    Window_CacheContents(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CacheContents
CALLV
pop
line 6025
;6025:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2738
JUMPV
LABELV $2735
line 6026
;6026:      Item_CacheContents(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_CacheContents
CALLV
pop
line 6027
;6027:    }
LABELV $2736
line 6025
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2738
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2735
line 6029
;6028:
;6029:    if (menu->soundName && *menu->soundName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2739
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2739
line 6030
;6030:      DC->registerSound(menu->soundName, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CALLI4
pop
line 6031
;6031:    }
LABELV $2739
line 6032
;6032:  }
LABELV $2733
line 6034
;6033:
;6034:}
LABELV $2732
endproc Menu_CacheContents 8 8
export Display_CacheAll
proc Display_CacheAll 4 4
line 6036
;6035:
;6036:void Display_CacheAll( void ) {
line 6038
;6037:  int i;
;6038:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2745
JUMPV
LABELV $2742
line 6039
;6039:    Menu_CacheContents(&Menus[i]);
CNSTI4 644
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_CacheContents
CALLV
pop
line 6040
;6040:  }
LABELV $2743
line 6038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2745
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2742
line 6041
;6041:}
LABELV $2741
endproc Display_CacheAll 4 4
proc Menu_OverActiveItem 32 12
line 6044
;6042:
;6043:
;6044:static qboolean Menu_OverActiveItem(menuDef_t *menu, float x, float y) {
line 6045
;6045:  if (menu && menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED)) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2747
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
EQI4 $2747
line 6046
;6046:    if (Rect_ContainsPoint(&menu->window.rect, x, y)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2749
line 6048
;6047:      int i;
;6048:      for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2754
JUMPV
LABELV $2751
line 6052
;6049:        // turn off focus each item
;6050:        // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;6051:
;6052:        if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2755
line 6053
;6053:          continue;
ADDRGP4 $2752
JUMPV
LABELV $2755
line 6056
;6054:        }
;6055:
;6056:        if (menu->items[i]->window.flags & WINDOW_DECORATION) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2757
line 6057
;6057:          continue;
ADDRGP4 $2752
JUMPV
LABELV $2757
line 6060
;6058:        }
;6059:
;6060:        if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2759
line 6061
;6061:          itemDef_t *overItem = menu->items[i];
ADDRLP4 16
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDP4
INDIRP4
ASGNP4
line 6062
;6062:          if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2761
ADDRLP4 16
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2761
line 6063
;6063:            if (Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2752
line 6064
;6064:              return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2746
JUMPV
line 6065
;6065:            } else {
line 6066
;6066:              continue;
LABELV $2761
line 6068
;6067:            }
;6068:          } else {
line 6069
;6069:            return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2746
JUMPV
LABELV $2759
line 6072
;6070:          }
;6071:        }
;6072:      }
LABELV $2752
line 6048
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2754
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
LTI4 $2751
line 6074
;6073:
;6074:    }
LABELV $2749
line 6075
;6075:  }
LABELV $2747
line 6076
;6076:  return qfalse;
CNSTI4 0
RETI4
LABELV $2746
endproc Menu_OverActiveItem 32 12
bss
export menuParseKeywordHash
align 4
LABELV menuParseKeywordHash
skip 2048
export itemParseKeywordHash
align 4
LABELV itemParseKeywordHash
skip 2048
align 4
LABELV awc
skip 528832
align 4
LABELV strHandle
skip 8192
align 1
LABELV strPool
skip 393216
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV UI_memoryPool
skip 1048576
export menuStack
align 4
LABELV menuStack
skip 64
export Menus
align 4
LABELV Menus
skip 164864
align 4
LABELV scrollInfo
skip 32
export g_nameBind2
align 1
LABELV g_nameBind2
skip 32
export g_nameBind1
align 1
LABELV g_nameBind1
skip 32
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Script_Parse
import Display_ExpandMacros
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
LABELV $2687
byte 1 102
byte 1 112
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $2669
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2665
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2658
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $2641
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
LABELV $2640
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
LABELV $2639
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
LABELV $2638
byte 1 112
byte 1 111
byte 1 112
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2637
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $2636
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $2635
byte 1 111
byte 1 117
byte 1 116
byte 1 79
byte 1 102
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2634
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2633
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2632
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2631
byte 1 111
byte 1 110
byte 1 69
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $2630
byte 1 111
byte 1 110
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $2629
byte 1 111
byte 1 110
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2628
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2627
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $2528
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2509
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2505
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2482
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 99
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2481
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $2480
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2479
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2478
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2477
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2476
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2475
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2474
byte 1 97
byte 1 100
byte 1 100
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2473
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 70
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2472
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 83
byte 1 116
byte 1 114
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2471
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 70
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2470
byte 1 102
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
LABELV $2469
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2468
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2467
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2466
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2465
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2464
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2463
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2462
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2461
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2460
byte 1 108
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2459
byte 1 111
byte 1 110
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2458
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $2457
byte 1 111
byte 1 117
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2456
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2455
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2454
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $2453
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $2452
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2451
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2450
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $2449
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2448
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2447
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2446
byte 1 99
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2445
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2444
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2443
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2442
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $2441
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2440
byte 1 104
byte 1 111
byte 1 114
byte 1 105
byte 1 122
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2439
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 119
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2438
byte 1 119
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2437
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2436
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2435
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2434
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2433
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2432
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2431
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 121
byte 1 0
align 1
LABELV $2430
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 120
byte 1 0
align 1
LABELV $2429
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2428
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2427
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $2426
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2425
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2424
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2361
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $1706
byte 1 70
byte 1 73
byte 1 88
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $1679
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $1678
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $1648
byte 1 105
byte 1 110
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
LABELV $1615
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $1614
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $1613
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $1612
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1611
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1610
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $1609
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1608
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1607
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1606
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 80
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1605
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1604
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1603
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 119
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1602
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 69
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1601
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1600
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1599
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $1598
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $1597
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1596
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1595
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1594
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1593
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1592
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1591
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1590
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 52
byte 1 0
align 1
LABELV $1589
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $1588
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $1587
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $1586
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
LABELV $1585
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 0
align 1
LABELV $1584
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 97
byte 1 99
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1583
byte 1 98
byte 1 117
byte 1 121
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1582
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1581
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $1580
byte 1 43
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1579
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $1578
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $1577
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $1576
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $1575
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 57
byte 1 0
align 1
LABELV $1574
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $1573
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $1572
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $1571
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $1570
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $1569
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $1568
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $1567
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $1566
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $1565
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $1564
byte 1 43
byte 1 109
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $1563
byte 1 43
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1562
byte 1 43
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1561
byte 1 43
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 0
align 1
LABELV $1560
byte 1 43
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1559
byte 1 43
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $1558
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1557
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1556
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1555
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $1554
byte 1 43
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1553
byte 1 43
byte 1 102
byte 1 111
byte 1 114
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $1552
byte 1 98
byte 1 111
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1551
byte 1 43
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1550
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $1549
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1535
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $1534
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1290
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1286
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1139
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $963
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $909
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $567
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $566
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $565
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $564
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $563
byte 1 115
byte 1 101
byte 1 116
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $562
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $561
byte 1 115
byte 1 101
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $560
byte 1 115
byte 1 101
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $559
byte 1 115
byte 1 101
byte 1 116
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $558
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $557
byte 1 115
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $556
byte 1 115
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $555
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $554
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $553
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
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $552
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $551
byte 1 115
byte 1 101
byte 1 116
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $550
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $549
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $548
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $547
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $540
byte 1 37
byte 1 115
byte 1 32
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $533
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
LABELV $529
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
LABELV $368
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $365
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $362
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $204
byte 1 32
byte 1 0
align 1
LABELV $201
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $196
byte 1 125
byte 1 0
align 1
LABELV $187
byte 1 123
byte 1 0
align 1
LABELV $151
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $118
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $95
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
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $91
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
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $80
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 37
byte 1 37
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 37
byte 1 37
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $78
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $77
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 47
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $58
byte 1 0
align 1
LABELV $49
byte 1 85
byte 1 73
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 46
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 33
byte 1 10
byte 1 0
