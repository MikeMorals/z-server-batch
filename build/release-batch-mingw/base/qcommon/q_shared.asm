export Com_Clamp
code
proc Com_Clamp 0 0
file "../../../../src/qcommon/q_shared.c"
line 27
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
;23://
;24:// q_shared.c -- stateless support routines that are included in each code dll
;25:#include "q_shared.h"
;26:
;27:float Com_Clamp( float min, float max, float value ) {
line 28
;28:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $25
line 29
;29:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $24
JUMPV
LABELV $25
line 31
;30:	}
;31:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $27
line 32
;32:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $24
JUMPV
LABELV $27
line 34
;33:	}
;34:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $24
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 44
;35:}
;36:
;37:
;38:/*
;39:============
;40:COM_SkipPath
;41:============
;42:*/
;43:char *COM_SkipPath (char *pathname)
;44:{
line 47
;45:	char	*last;
;46:	
;47:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $31
JUMPV
LABELV $30
line 49
;48:	while (*pathname)
;49:	{
line 50
;50:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $33
line 51
;51:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $33
line 52
;52:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 53
;53:	}
LABELV $31
line 48
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $30
line 54
;54:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $29
endproc COM_SkipPath 4 0
export COM_GetExtension
proc COM_GetExtension 16 4
line 62
;55:}
;56:
;57:/*
;58:============
;59:COM_GetExtension
;60:============
;61:*/
;62:const char *COM_GetExtension( const char *name ) {
line 65
;63:	int length, i;
;64:
;65:	length = strlen(name)-1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 66
;66:	i = length;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $37
JUMPV
LABELV $36
line 69
;67:
;68:	while (name[i] != '.')
;69:	{
line 70
;70:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 71
;71:		if (name[i] == '/' || i == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $41
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $39
LABELV $41
line 72
;72:			return ""; // no extension
ADDRGP4 $42
RETP4
ADDRGP4 $35
JUMPV
LABELV $39
line 73
;73:	}
LABELV $37
line 68
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $36
line 75
;74:
;75:	return &name[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
RETP4
LABELV $35
endproc COM_GetExtension 16 4
export COM_StripExtension
proc COM_StripExtension 12 12
line 84
;76:}
;77:
;78:
;79:/*
;80:============
;81:COM_StripExtension
;82:============
;83:*/
;84:void COM_StripExtension( const char *in, char *out, int destsize ) {
line 87
;85:	int             length;
;86:
;87:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 89
;88:
;89:	length = strlen(out)-1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $45
JUMPV
LABELV $44
line 91
;90:	while (length > 0 && out[length] != '.')
;91:	{
line 92
;92:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 93
;93:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $47
line 94
;94:			return;		// no extension
ADDRGP4 $43
JUMPV
LABELV $47
line 95
;95:	}
LABELV $45
line 90
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $49
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $44
LABELV $49
line 96
;96:	if (length)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $50
line 97
;97:		out[length] = 0;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $50
line 98
;98:}
LABELV $43
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 106
;99:
;100:
;101:/*
;102:==================
;103:COM_DefaultExtension
;104:==================
;105:*/
;106:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 114
;107:	char	oldPath[MAX_QPATH];
;108:	char    *src;
;109:
;110://
;111:// if path doesn't have a .EXT, append extension
;112:// (extension should include the .)
;113://
;114:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $54
JUMPV
LABELV $53
line 116
;115:
;116:	while (*src != '/' && src != path) {
line 117
;117:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $56
line 118
;118:			return;                 // it has an extension
ADDRGP4 $52
JUMPV
LABELV $56
line 120
;119:		}
;120:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 121
;121:	}
LABELV $54
line 116
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $58
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $53
LABELV $58
line 123
;122:
;123:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 124
;124:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $59
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 125
;125:}
LABELV $52
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 157
;126:
;127:/*
;128:============================================================================
;129:
;130:					BYTE ORDER FUNCTIONS
;131:
;132:============================================================================
;133:*/
;134:/*
;135:// can't just use function pointers, or dll linkage can
;136:// mess up when qcommon is included in multiple places
;137:static short	(*_BigShort) (short l);
;138:static short	(*_LittleShort) (short l);
;139:static int		(*_BigLong) (int l);
;140:static int		(*_LittleLong) (int l);
;141:static qint64	(*_BigLong64) (qint64 l);
;142:static qint64	(*_LittleLong64) (qint64 l);
;143:static float	(*_BigFloat) (const float *l);
;144:static float	(*_LittleFloat) (const float *l);
;145:
;146:short	BigShort(short l){return _BigShort(l);}
;147:short	LittleShort(short l) {return _LittleShort(l);}
;148:int		BigLong (int l) {return _BigLong(l);}
;149:int		LittleLong (int l) {return _LittleLong(l);}
;150:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;151:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;152:float	BigFloat (const float *l) {return _BigFloat(l);}
;153:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;154:*/
;155:
;156:short   ShortSwap (short l)
;157:{
line 160
;158:	byte    b1,b2;
;159:
;160:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 161
;161:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 163
;162:
;163:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $60
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 167
;164:}
;165:
;166:short	ShortNoSwap (short l)
;167:{
line 168
;168:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $61
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 172
;169:}
;170:
;171:int    LongSwap (int l)
;172:{
line 175
;173:	byte    b1,b2,b3,b4;
;174:
;175:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 176
;176:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 177
;177:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 178
;178:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 180
;179:
;180:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $62
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 184
;181:}
;182:
;183:int	LongNoSwap (int l)
;184:{
line 185
;185:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $63
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 189
;186:}
;187:
;188:qint64 Long64Swap (qint64 ll)
;189:{
line 192
;190:	qint64	result;
;191:
;192:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 193
;193:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 194
;194:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 195
;195:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 196
;196:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 197
;197:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 198
;198:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 199
;199:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 201
;200:
;201:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $64
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 205
;202:}
;203:
;204:qint64 Long64NoSwap (qint64 ll)
;205:{
line 206
;206:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $73
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 8 4
line 214
;207:}
;208:
;209:typedef union {
;210:    float	f;
;211:    unsigned int i;
;212:} _FloatByteUnion;
;213:
;214:float FloatSwap (const float *f) {
line 217
;215:	_FloatByteUnion out;
;216:
;217:	out.f = *f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 218
;218:	out.i = LongSwap(out.i);
ADDRLP4 0
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 4
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 220
;219:
;220:	return out.f;
ADDRLP4 0
INDIRF4
RETF4
LABELV $76
endproc FloatSwap 8 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 224
;221:}
;222:
;223:float FloatNoSwap (const float *f)
;224:{
line 225
;225:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $77
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 278
;226:}
;227:
;228:/*
;229:================
;230:Swap_Init
;231:================
;232:*/
;233:/*
;234:void Swap_Init (void)
;235:{
;236:	byte	swaptest[2] = {1,0};
;237:
;238:// set the byte swapping variables in a portable manner	
;239:	if ( *(short *)swaptest == 1)
;240:	{
;241:		_BigShort = ShortSwap;
;242:		_LittleShort = ShortNoSwap;
;243:		_BigLong = LongSwap;
;244:		_LittleLong = LongNoSwap;
;245:		_BigLong64 = Long64Swap;
;246:		_LittleLong64 = Long64NoSwap;
;247:		_BigFloat = FloatSwap;
;248:		_LittleFloat = FloatNoSwap;
;249:	}
;250:	else
;251:	{
;252:		_BigShort = ShortNoSwap;
;253:		_LittleShort = ShortSwap;
;254:		_BigLong = LongNoSwap;
;255:		_LittleLong = LongSwap;
;256:		_BigLong64 = Long64NoSwap;
;257:		_LittleLong64 = Long64Swap;
;258:		_BigFloat = FloatNoSwap;
;259:		_LittleFloat = FloatSwap;
;260:	}
;261:
;262:}
;263:*/
;264:
;265:/*
;266:============================================================================
;267:
;268:PARSING
;269:
;270:============================================================================
;271:*/
;272:
;273:static	char	com_token[MAX_TOKEN_CHARS];
;274:static	char	com_parsename[MAX_TOKEN_CHARS];
;275:static	int		com_lines;
;276:
;277:void COM_BeginParseSession( const char *name )
;278:{
line 279
;279:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 280
;280:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $79
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 281
;281:}
LABELV $78
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 284
;282:
;283:int COM_GetCurrentParseLine( void )
;284:{
line 285
;285:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $80
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 289
;286:}
;287:
;288:char *COM_Parse( char **data_p )
;289:{
line 290
;290:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $81
endproc COM_Parse 4 8
bss
align 1
LABELV $83
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 294
;291:}
;292:
;293:void COM_ParseError( char *format, ... )
;294:{
line 298
;295:	va_list argptr;
;296:	static char string[4096];
;297:
;298:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 299
;299:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $83
ARGP4
CNSTU4 4096
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 300
;300:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 302
;301:
;302:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $85
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $83
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 303
;303:}
LABELV $82
endproc COM_ParseError 4 16
bss
align 1
LABELV $87
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 306
;304:
;305:void COM_ParseWarning( char *format, ... )
;306:{
line 310
;307:	va_list argptr;
;308:	static char string[4096];
;309:
;310:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 311
;311:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $87
ARGP4
CNSTU4 4096
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 312
;312:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 314
;313:
;314:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $89
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $87
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 315
;315:}
LABELV $86
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 329
;316:
;317:/*
;318:==============
;319:COM_Parse
;320:
;321:Parse a token out of a string
;322:Will never return NULL, just empty strings
;323:
;324:If "allowLineBreaks" is qtrue then an empty
;325:string will be returned if the next token is
;326:a newline.
;327:==============
;328:*/
;329:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $92
JUMPV
LABELV $91
line 332
;330:	int c;
;331:
;332:	while( (c = *data) <= ' ') {
line 333
;333:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $94
line 334
;334:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $90
JUMPV
LABELV $94
line 336
;335:		}
;336:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $96
line 337
;337:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 338
;338:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 339
;339:		}
LABELV $96
line 340
;340:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 341
;341:	}
LABELV $92
line 332
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $91
line 343
;342:
;343:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $90
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 346
;344:}
;345:
;346:int COM_Compress( char *data_p ) {
line 349
;347:	char *in, *out;
;348:	int c;
;349:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 351
;350:
;351:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 352
;352:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
ADDRGP4 $102
JUMPV
LABELV $101
line 353
;353:		while ((c = *in) != 0) {
line 355
;354:			// skip double slash comments
;355:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $104
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $104
ADDRGP4 $107
JUMPV
LABELV $106
line 356
;356:				while (*in && *in != '\n') {
line 357
;357:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 358
;358:				}
LABELV $107
line 356
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $109
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $106
LABELV $109
line 360
;359:			// skip /* */ comments
;360:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $105
JUMPV
LABELV $104
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $110
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $110
ADDRGP4 $113
JUMPV
LABELV $112
line 362
;361:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;362:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $113
line 361
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $112
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $112
LABELV $115
line 363
;363:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $111
line 364
;364:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 366
;365:                        // record when we hit a newline
;366:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $111
JUMPV
LABELV $110
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $120
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $118
LABELV $120
line 367
;367:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 368
;368:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 370
;369:                        // record when we hit whitespace
;370:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $123
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $121
LABELV $123
line 371
;371:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 372
;372:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 374
;373:                        // an actual token
;374:			} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 376
;375:                            // if we have a pending newline, emit it (and it counts as whitespace)
;376:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $124
line 377
;377:                                *out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 378
;378:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 379
;379:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 380
;380:                            } if (whitespace) {
LABELV $124
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $126
line 381
;381:                                *out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 382
;382:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 383
;383:                            }
LABELV $126
line 386
;384:                            
;385:                            // copy quoted strings unmolested
;386:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $128
line 387
;387:                                    *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 388
;388:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $131
JUMPV
LABELV $130
line 389
;389:                                    while (1) {
line 390
;390:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 391
;391:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $132
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $132
line 392
;392:                                            *out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 393
;393:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 394
;394:                                        } else {
line 395
;395:                                            break;
LABELV $134
line 397
;396:                                        }
;397:                                    }
LABELV $131
line 389
ADDRGP4 $130
JUMPV
LABELV $132
line 398
;398:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $129
line 399
;399:                                        *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 400
;400:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 401
;401:                                    }
line 402
;402:                            } else {
ADDRGP4 $129
JUMPV
LABELV $128
line 403
;403:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 404
;404:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 405
;405:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 406
;406:                            }
LABELV $129
line 407
;407:			}
LABELV $122
LABELV $119
LABELV $111
LABELV $105
line 408
;408:		}
LABELV $102
line 353
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $101
line 409
;409:	}
LABELV $99
line 410
;410:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 411
;411:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $98
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 415
;412:}
;413:
;414:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;415:{
line 416
;416:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 417
;417:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 420
;418:	char *data;
;419:
;420:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 421
;421:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 422
;422:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 425
;423:
;424:	// make sure incoming data is valid
;425:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $141
line 426
;426:	{
line 427
;427:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 428
;428:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $137
JUMPV
LABELV $140
line 432
;429:	}
;430:
;431:	while ( 1 )
;432:	{
line 434
;433:		// skip whitespace
;434:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 435
;435:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 436
;436:		{
line 437
;437:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 438
;438:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $137
JUMPV
LABELV $143
line 440
;439:		}
;440:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $145
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $145
line 441
;441:		{
line 442
;442:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 443
;443:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $137
JUMPV
LABELV $145
line 446
;444:		}
;445:
;446:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 449
;447:
;448:		// skip double slash comments
;449:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $147
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $147
line 450
;450:		{
line 451
;451:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $150
JUMPV
LABELV $149
line 452
;452:			while (*data && *data != '\n') {
line 453
;453:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 454
;454:			}
LABELV $150
line 452
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $152
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $149
LABELV $152
line 455
;455:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 457
;456:		// skip /* */ comments
;457:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $142
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $142
line 458
;458:		{
line 459
;459:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $156
JUMPV
LABELV $155
line 461
;460:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;461:			{
line 462
;462:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 463
;463:			}
LABELV $156
line 460
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $158
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $155
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $155
LABELV $158
line 464
;464:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $154
line 465
;465:			{
line 466
;466:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 467
;467:			}
line 468
;468:		}
line 470
;469:		else
;470:		{
line 471
;471:			break;
LABELV $154
LABELV $148
line 473
;472:		}
;473:	}
LABELV $141
line 431
ADDRGP4 $140
JUMPV
LABELV $142
line 476
;474:
;475:	// handle quoted strings
;476:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $161
line 477
;477:	{
line 478
;478:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $164
JUMPV
LABELV $163
line 480
;479:		while (1)
;480:		{
line 481
;481:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 482
;482:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $168
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $166
LABELV $168
line 483
;483:			{
line 484
;484:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 485
;485:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 486
;486:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $137
JUMPV
LABELV $166
line 488
;487:			}
;488:			if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $169
line 489
;489:			{
line 490
;490:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 491
;491:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 492
;492:			}
LABELV $169
line 493
;493:		}
LABELV $164
line 479
ADDRGP4 $163
JUMPV
line 494
;494:	}
LABELV $161
LABELV $171
line 498
;495:
;496:	// parse a regular word
;497:	do
;498:	{
line 499
;499:		if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $174
line 500
;500:		{
line 501
;501:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 502
;502:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 503
;503:		}
LABELV $174
line 504
;504:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 505
;505:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 506
;506:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $176
line 507
;507:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
line 508
;508:	} while (c>32);
LABELV $172
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $171
line 510
;509:
;510:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 512
;511:
;512:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 513
;513:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $137
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 577
;514:}
;515:
;516:
;517:#if 0
;518:// no longer used
;519:/*
;520:===============
;521:COM_ParseInfos
;522:===============
;523:*/
;524:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;525:	char	*token;
;526:	int		count;
;527:	char	key[MAX_TOKEN_CHARS];
;528:
;529:	count = 0;
;530:
;531:	while ( 1 ) {
;532:		token = COM_Parse( &buf );
;533:		if ( !token[0] ) {
;534:			break;
;535:		}
;536:		if ( strcmp( token, "{" ) ) {
;537:			Com_Printf( "Missing { in info file\n" );
;538:			break;
;539:		}
;540:
;541:		if ( count == max ) {
;542:			Com_Printf( "Max infos exceeded\n" );
;543:			break;
;544:		}
;545:
;546:		infos[count][0] = 0;
;547:		while ( 1 ) {
;548:			token = COM_ParseExt( &buf, qtrue );
;549:			if ( !token[0] ) {
;550:				Com_Printf( "Unexpected end of info file\n" );
;551:				break;
;552:			}
;553:			if ( !strcmp( token, "}" ) ) {
;554:				break;
;555:			}
;556:			Q_strncpyz( key, token, sizeof( key ) );
;557:
;558:			token = COM_ParseExt( &buf, qfalse );
;559:			if ( !token[0] ) {
;560:				strcpy( token, "<NULL>" );
;561:			}
;562:			Info_SetValueForKey( infos[count], key, token );
;563:		}
;564:		count++;
;565:	}
;566:
;567:	return count;
;568:}
;569:#endif
;570:
;571:
;572:/*
;573:==================
;574:COM_MatchToken
;575:==================
;576:*/
;577:void COM_MatchToken( char **buf_p, char *match ) {
line 580
;578:	char	*token;
;579:
;580:	token = COM_Parse( buf_p );
ADDRFP4 0
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
line 581
;581:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $179
line 582
;582:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $181
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 583
;583:	}
LABELV $179
line 584
;584:}
LABELV $178
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 596
;585:
;586:
;587:/*
;588:=================
;589:SkipBracedSection
;590:
;591:The next token should be an open brace.
;592:Skips until a matching close brace is found.
;593:Internal brace depths are properly skipped.
;594:=================
;595:*/
;596:void SkipBracedSection (char **program) {
line 600
;597:	char			*token;
;598:	int				depth;
;599:
;600:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $183
line 601
;601:	do {
line 602
;602:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 603
;603:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $186
line 604
;604:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $188
line 605
;605:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 606
;606:			}
ADDRGP4 $189
JUMPV
LABELV $188
line 607
;607:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $190
line 608
;608:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 609
;609:			}
LABELV $190
LABELV $189
line 610
;610:		}
LABELV $186
line 611
;611:	} while( depth && *program );
LABELV $184
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $192
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $183
LABELV $192
line 612
;612:}
LABELV $182
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 619
;613:
;614:/*
;615:=================
;616:SkipRestOfLine
;617:=================
;618:*/
;619:void SkipRestOfLine ( char **data ) {
line 623
;620:	char	*p;
;621:	int		c;
;622:
;623:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 624
;624:	while ( (c = *p++) != 0 ) {
line 625
;625:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $197
line 626
;626:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 627
;627:			break;
ADDRGP4 $196
JUMPV
LABELV $197
line 629
;628:		}
;629:	}
LABELV $195
line 624
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $194
LABELV $196
line 631
;630:
;631:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 632
;632:}
LABELV $193
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 635
;633:
;634:
;635:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 639
;636:	char	*token;
;637:	int		i;
;638:
;639:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $200
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 641
;640:
;641:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $201
line 642
;642:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 643
;643:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 644
;644:	}
LABELV $202
line 641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $204
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $201
line 646
;645:
;646:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $205
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 647
;647:}
LABELV $199
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 649
;648:
;649:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 652
;650:	int		i;
;651:
;652:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $200
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 654
;653:
;654:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $210
JUMPV
LABELV $207
line 655
;655:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 656
;656:	}
LABELV $208
line 654
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $210
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $207
line 658
;657:
;658:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $205
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 659
;659:}
LABELV $206
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 661
;660:
;661:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 664
;662:	int		i;
;663:
;664:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $200
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 666
;665:
;666:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 667
;667:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 668
;668:	}
LABELV $213
line 666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $215
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $212
line 670
;669:
;670:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $205
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 671
;671:}
LABELV $211
endproc Parse3DMatrix 12 16
export Com_HexStrToInt
proc Com_HexStrToInt 32 4
line 679
;672:
;673:/*
;674:===================
;675:Com_HexStrToInt
;676:===================
;677:*/
;678:int Com_HexStrToInt( const char *str )
;679:{
line 680
;680:	if ( !str || !str[ 0 ] )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $219
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $217
LABELV $219
line 681
;681:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $216
JUMPV
LABELV $217
line 684
;682:
;683:	// check for hex code
;684:	if( str[ 0 ] == '0' && str[ 1 ] == 'x' )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
NEI4 $220
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 120
NEI4 $220
line 685
;685:	{
line 686
;686:		int i, n = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 688
;687:
;688:		for( i = 2; i < strlen( str ); i++ )
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $222
line 689
;689:		{
line 692
;690:			char digit;
;691:
;692:			n *= 16;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 694
;693:
;694:			digit = tolower( str[ i ] );
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
CVII1 4
ASGNI1
line 696
;695:
;696:			if( digit >= '0' && digit <= '9' )
ADDRLP4 24
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 48
LTI4 $226
ADDRLP4 24
INDIRI4
CNSTI4 57
GTI4 $226
line 697
;697:				digit -= '0';
ADDRLP4 16
ADDRLP4 16
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CVII1 4
ASGNI1
ADDRGP4 $227
JUMPV
LABELV $226
line 698
;698:			else if( digit >= 'a' && digit <= 'f' )
ADDRLP4 28
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 97
LTI4 $228
ADDRLP4 28
INDIRI4
CNSTI4 102
GTI4 $228
line 699
;699:				digit = digit - 'a' + 10;
ADDRLP4 16
ADDRLP4 16
INDIRI1
CVII4 1
CNSTI4 97
SUBI4
CNSTI4 10
ADDI4
CVII1 4
ASGNI1
ADDRGP4 $229
JUMPV
LABELV $228
line 701
;700:			else
;701:				return -1;
CNSTI4 -1
RETI4
ADDRGP4 $216
JUMPV
LABELV $229
LABELV $227
line 703
;702:
;703:			n += digit;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI1
CVII4 1
ADDI4
ASGNI4
line 704
;704:		}
LABELV $223
line 688
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $225
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $222
line 706
;705:
;706:		return n;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $216
JUMPV
LABELV $220
line 709
;707:	}
;708:
;709:	return -1;
CNSTI4 -1
RETI4
LABELV $216
endproc Com_HexStrToInt 32 4
export Q_isprint
proc Q_isprint 4 0
line 721
;710:}
;711:
;712:/*
;713:============================================================================
;714:
;715:					LIBRARY REPLACEMENT FUNCTIONS
;716:
;717:============================================================================
;718:*/
;719:
;720:int Q_isprint( int c )
;721:{
line 722
;722:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $231
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $231
line 723
;723:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $230
JUMPV
LABELV $231
line 724
;724:	return ( 0 );
CNSTI4 0
RETI4
LABELV $230
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 728
;725:}
;726:
;727:int Q_islower( int c )
;728:{
line 729
;729:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $234
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $234
line 730
;730:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $233
JUMPV
LABELV $234
line 731
;731:	return ( 0 );
CNSTI4 0
RETI4
LABELV $233
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 735
;732:}
;733:
;734:int Q_isupper( int c )
;735:{
line 736
;736:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $237
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $237
line 737
;737:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $236
JUMPV
LABELV $237
line 738
;738:	return ( 0 );
CNSTI4 0
RETI4
LABELV $236
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 742
;739:}
;740:
;741:int Q_isalpha( int c )
;742:{
line 743
;743:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $243
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $242
LABELV $243
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $240
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $240
LABELV $242
line 744
;744:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $239
JUMPV
LABELV $240
line 745
;745:	return ( 0 );
CNSTI4 0
RETI4
LABELV $239
endproc Q_isalpha 8 0
export Q_isdigit
proc Q_isdigit 4 0
line 748
;746:}
;747:int Q_isdigit( int c )
;748:{
line 749
;749:        if ((c >= '0' && c <= '9'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 48
LTI4 $245
ADDRLP4 0
INDIRI4
CNSTI4 57
GTI4 $245
line 750
;750:                return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $244
JUMPV
LABELV $245
line 751
;751:        return ( 0 );
CNSTI4 0
RETI4
LABELV $244
endproc Q_isdigit 4 0
export Q_strrchr
proc Q_strrchr 12 0
line 754
;752:}
;753:char* Q_strrchr( const char* string, int c )
;754:{
line 755
;755:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 757
;756:	char *s;
;757:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 759
;758:
;759:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $249
JUMPV
LABELV $248
line 762
;760:
;761:	while (*s)
;762:	{
line 763
;763:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $251
line 764
;764:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $251
line 765
;765:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 766
;766:	}
LABELV $249
line 761
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
line 767
;767:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $253
line 768
;768:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $253
line 770
;769:
;770:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $247
endproc Q_strrchr 12 0
export Q_isanumber
proc Q_isanumber 4 0
line 774
;771:}
;772:
;773:qboolean Q_isanumber( const char *s )
;774:{
line 778
;775:	int i;
;776:#ifdef Q3_VM
;777:	//FIXME: implement
;778:	return qfalse;
CNSTI4 0
RETI4
LABELV $255
endproc Q_isanumber 4 0
export Q_isintegral
proc Q_isintegral 8 0
line 792
;779:#else
;780:	char *p;
;781:
;782:	if( *s == '\0' )
;783:		return qfalse;
;784:
;785:	i = strtod( s, &p );
;786:
;787:	return *p == '\0';
;788:#endif
;789:}
;790:
;791:qboolean Q_isintegral( float f )
;792:{
line 793
;793:	return (int)f == f;
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ADDRLP4 4
INDIRF4
NEF4 $258
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $259
ADDRLP4 0
INDIRI4
RETI4
LABELV $256
endproc Q_isintegral 8 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 803
;794:}
;795:
;796:/*
;797:=============
;798:Q_strncpyz
;799: 
;800:Safe strncpy that ensures a trailing zero
;801:=============
;802:*/
;803:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 804
;804:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $261
line 805
;805:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $263
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 806
;806:  }
LABELV $261
line 807
;807:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 808
;808:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 809
;809:	}
LABELV $264
line 810
;810:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $267
line 811
;811:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $269
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 812
;812:	}
LABELV $267
line 814
;813:
;814:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 815
;815:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 816
;816:}
LABELV $260
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 818
;817:                 
;818:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 821
;819:	int		c1, c2;
;820:
;821:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $271
line 822
;822:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $273
line 823
;823:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $270
JUMPV
LABELV $273
line 825
;824:           else
;825:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $270
JUMPV
LABELV $271
line 827
;826:        }
;827:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $275
line 828
;828:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $270
JUMPV
LABELV $275
LABELV $277
line 832
;829:
;830:
;831:	
;832:	do {
line 833
;833:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 834
;834:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 836
;835:
;836:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $280
line 837
;837:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $270
JUMPV
LABELV $280
line 840
;838:		}
;839:		
;840:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $282
line 841
;841:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $284
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $284
line 842
;842:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 843
;843:			}
LABELV $284
line 844
;844:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $286
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $286
line 845
;845:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 846
;846:			}
LABELV $286
line 847
;847:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $288
line 848
;848:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $291
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $292
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $270
JUMPV
LABELV $288
line 850
;849:			}
;850:		}
LABELV $282
line 851
;851:	} while (c1);
LABELV $278
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $277
line 853
;852:	
;853:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $270
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 856
;854:}
;855:
;856:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $294
line 859
;857:	int		c1, c2;
;858:	
;859:	do {
line 860
;860:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 861
;861:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 863
;862:
;863:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $297
line 864
;864:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $297
line 867
;865:		}
;866:		
;867:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $299
line 868
;868:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $302
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $303
JUMPV
LABELV $302
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $303
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $299
line 870
;869:		}
;870:	} while (c1);
LABELV $295
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $294
line 872
;871:	
;872:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $293
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 875
;873:}
;874:
;875:int Q_stricmp (const char *s1, const char *s2) {
line 876
;876:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $306
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $306
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $306
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $307
ADDRLP4 0
INDIRI4
RETI4
LABELV $304
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 880
;877:}
;878:
;879:
;880:char *Q_strlwr( char *s1 ) {
line 883
;881:    char	*s;
;882:
;883:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $310
JUMPV
LABELV $309
line 884
;884:	while ( *s ) {
line 885
;885:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 886
;886:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 887
;887:	}
LABELV $310
line 884
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $309
line 888
;888:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $308
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 891
;889:}
;890:
;891:char *Q_strupr( char *s1 ) {
line 894
;892:    char	*s;
;893:
;894:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $314
JUMPV
LABELV $313
line 895
;895:	while ( *s ) {
line 896
;896:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 897
;897:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 898
;898:	}
LABELV $314
line 895
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $313
line 899
;899:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $312
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 904
;900:}
;901:
;902:
;903:// never goes past bounds or leaves without a terminating 0
;904:void Q_strcat( char *dest, int size, const char *src ) {
line 907
;905:	int		l1;
;906:
;907:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 908
;908:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $317
line 909
;909:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $319
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 910
;910:	}
LABELV $317
line 911
;911:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 912
;912:}
LABELV $316
endproc Q_strcat 12 12
export Q_stristr
proc Q_stristr 36 12
line 918
;913:
;914:/*
;915:* Find the first occurrence of find in s.
;916:*/
;917:const char *Q_stristr( const char *s, const char *find)
;918:{
line 922
;919:  char c, sc;
;920:  size_t len;
;921:
;922:  if ((c = *find++) != 0)
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 1
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $321
line 923
;923:  {
line 924
;924:    if (c >= 'a' && c <= 'z')
ADDRLP4 16
ADDRLP4 1
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $323
ADDRLP4 16
INDIRI4
CNSTI4 122
GTI4 $323
line 925
;925:    {
line 926
;926:      c -= ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 927
;927:    }
LABELV $323
line 928
;928:    len = strlen(find);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $325
line 930
;929:    do
;930:    {
LABELV $328
line 932
;931:      do
;932:      {
line 933
;933:        if ((sc = *s++) == 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 28
INDIRI1
ASGNI1
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $331
line 934
;934:          return NULL;
CNSTP4 0
RETP4
ADDRGP4 $320
JUMPV
LABELV $331
line 935
;935:        if (sc >= 'a' && sc <= 'z')
ADDRLP4 32
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
LTI4 $333
ADDRLP4 32
INDIRI4
CNSTI4 122
GTI4 $333
line 936
;936:        {
line 937
;937:          sc -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 938
;938:        }
LABELV $333
line 939
;939:      } while (sc != c);
LABELV $329
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 1
INDIRI1
CVII4 1
NEI4 $328
line 940
;940:    } while (Q_stricmpn(s, find, len) != 0);
LABELV $326
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $325
line 941
;941:    s--;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 942
;942:  }
LABELV $321
line 943
;943:  return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $320
endproc Q_stristr 36 12
export Q_PrintStrlen
proc Q_PrintStrlen 24 0
line 947
;944:}
;945:
;946:
;947:int Q_PrintStrlen( const char *string ) {
line 951
;948:	int			len;
;949:	const char	*p;
;950:
;951:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 952
;952:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $335
JUMPV
LABELV $336
line 955
;953:	}
;954:
;955:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 956
;956:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $339
JUMPV
LABELV $338
line 957
;957:	while( *p ) {
line 958
;958:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $341
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $341
ADDRLP4 12
INDIRI4
CNSTI4 65
LTI4 $344
ADDRLP4 12
INDIRI4
CNSTI4 90
LEI4 $343
LABELV $344
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $345
ADDRLP4 16
INDIRI4
CNSTI4 122
LEI4 $343
LABELV $345
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $341
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $341
LABELV $343
line 959
;959:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 960
;960:			continue;
ADDRGP4 $339
JUMPV
LABELV $341
line 962
;961:		}
;962:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 963
;963:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 964
;964:	}
LABELV $339
line 957
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $338
line 966
;965:
;966:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $335
endproc Q_PrintStrlen 24 0
export Q_CleanStr
proc Q_CleanStr 36 0
line 970
;967:}
;968:
;969:
;970:char *Q_CleanStr( char *string ) {
line 975
;971:	char*	d;
;972:	char*	s;
;973:	int		c;
;974:
;975:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 976
;976:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $348
JUMPV
LABELV $347
line 977
;977:	while ((c = *s) != 0 ) {
line 978
;978:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $350
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $350
ADDRLP4 16
INDIRI4
CNSTI4 65
LTI4 $353
ADDRLP4 16
INDIRI4
CNSTI4 90
LEI4 $352
LABELV $353
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 97
LTI4 $354
ADDRLP4 20
INDIRI4
CNSTI4 122
LEI4 $352
LABELV $354
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 48
LTI4 $350
ADDRLP4 24
INDIRI4
CNSTI4 57
GTI4 $350
LABELV $352
line 979
;979:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 980
;980:		}		
ADDRGP4 $351
JUMPV
LABELV $350
line 981
;981:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $355
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $355
line 982
;982:			*d++ = c;
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 983
;983:		}
LABELV $355
LABELV $351
line 984
;984:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 985
;985:	}
LABELV $348
line 977
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $347
line 986
;986:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 988
;987:
;988:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $346
endproc Q_CleanStr 36 0
export Q_CountChar
proc Q_CountChar 4 0
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 992
;989:}
;990:
;991:int Q_CountChar(const char *string, char tocount)
;992:{
line 995
;993:	int count;
;994:	
;995:	for(count = 0; *string; string++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $361
JUMPV
LABELV $358
line 996
;996:	{
line 997
;997:		if(*string == tocount)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $362
line 998
;998:			count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $362
line 999
;999:	}
LABELV $359
line 995
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $361
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $358
line 1001
;1000:	
;1001:	return count;
ADDRLP4 0
INDIRI4
RETI4
LABELV $357
endproc Q_CountChar 4 0
export Com_sprintf
proc Com_sprintf 32012 16
line 1004
;1002:}
;1003:
;1004:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 1009
;1005:	int		len;
;1006:	va_list		argptr;
;1007:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;1008:
;1009:	va_start (argptr,fmt);
ADDRLP4 32004
ADDRFP4 8+4
ASGNP4
line 1010
;1010:	len = Q_vsnprintf (bigbuffer, sizeof(bigbuffer), fmt,argptr);
ADDRLP4 0
ARGP4
CNSTU4 32000
ARGU4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32004
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 Q_vsnprintf
CALLI4
ASGNI4
ADDRLP4 32000
ADDRLP4 32008
INDIRI4
ASGNI4
line 1011
;1011:	va_end (argptr);
ADDRLP4 32004
CNSTP4 0
ASGNP4
line 1012
;1012:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 32000
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $366
line 1013
;1013:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $368
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1014
;1014:	}
LABELV $366
line 1015
;1015:	if (len >= size) {
ADDRLP4 32000
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $369
line 1016
;1016:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $371
ARGP4
ADDRLP4 32000
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1022
;1017:#ifdef	_DEBUG
;1018:		__asm {
;1019:			int 3;
;1020:		}
;1021:#endif
;1022:	}
LABELV $369
line 1023
;1023:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1024
;1024:}
LABELV $364
endproc Com_sprintf 32012 16
bss
align 1
LABELV $373
skip 64000
data
align 4
LABELV $374
byte 4 0
export va
code
proc va 12 16
line 1035
;1025:
;1026:
;1027:/*
;1028:============
;1029:va
;1030:
;1031:does a varargs printf into a temp buffer, so I don't need to have
;1032:varargs versions of all text functions.
;1033:============
;1034:*/
;1035:char	* QDECL va( char *format, ... ) {
line 1041
;1036:	va_list		argptr;
;1037:	static char string[2][32000]; // in case va is called by nested functions
;1038:	static int	index = 0;
;1039:	char		*buf;
;1040:
;1041:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $374
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $373
ADDP4
ASGNP4
line 1042
;1042:	index++;
ADDRLP4 8
ADDRGP4 $374
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1044
;1043:
;1044:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1045
;1045:	Q_vsnprintf (buf, sizeof(*string), format, argptr);
ADDRLP4 4
INDIRP4
ARGP4
CNSTU4 32000
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 1046
;1046:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1048
;1047:
;1048:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $372
endproc va 12 16
export Com_TruncateLongString
proc Com_TruncateLongString 8 12
line 1059
;1049:}
;1050:
;1051:/*
;1052:============
;1053:Com_TruncateLongString
;1054:
;1055:Assumes buffer is atleast TRUNCATE_LENGTH big
;1056:============
;1057:*/
;1058:void Com_TruncateLongString( char *buffer, const char *s )
;1059:{
line 1060
;1060:	int length = strlen( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1062
;1061:
;1062:	if( length <= TRUNCATE_LENGTH )
ADDRLP4 0
INDIRI4
CNSTI4 64
GTI4 $377
line 1063
;1063:		Q_strncpyz( buffer, s, TRUNCATE_LENGTH );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $378
JUMPV
LABELV $377
line 1065
;1064:	else
;1065:	{
line 1066
;1066:		Q_strncpyz( buffer, s, ( TRUNCATE_LENGTH / 2 ) - 3 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 29
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1067
;1067:		Q_strcat( buffer, TRUNCATE_LENGTH, " ... " );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $379
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1068
;1068:		Q_strcat( buffer, TRUNCATE_LENGTH, s + length - ( TRUNCATE_LENGTH / 2 ) + 3 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 -29
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1069
;1069:	}
LABELV $378
line 1070
;1070:}
LABELV $376
endproc Com_TruncateLongString 8 12
bss
align 1
LABELV $381
skip 16384
data
align 4
LABELV $382
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1089
;1071:
;1072:/*
;1073:=====================================================================
;1074:
;1075:  INFO STRINGS
;1076:
;1077:=====================================================================
;1078:*/
;1079:
;1080:/*
;1081:===============
;1082:Info_ValueForKey
;1083:
;1084:Searches the string for the given
;1085:key and returns the associated value, or an empty string.
;1086:FIXME: overflow check?
;1087:===============
;1088:*/
;1089:char *Info_ValueForKey( const char *s, const char *key ) {
line 1096
;1090:	char	pkey[BIG_INFO_KEY];
;1091:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1092:											// work without stomping on each other
;1093:	static	int	valueindex = 0;
;1094:	char	*o;
;1095:	
;1096:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $385
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $383
LABELV $385
line 1097
;1097:		return "";
ADDRGP4 $42
RETP4
ADDRGP4 $380
JUMPV
LABELV $383
line 1100
;1098:	}
;1099:
;1100:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $386
line 1101
;1101:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $388
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1102
;1102:	}
LABELV $386
line 1104
;1103:
;1104:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $382
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1105
;1105:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $392
line 1106
;1106:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $392
JUMPV
LABELV $391
line 1108
;1107:	while (1)
;1108:	{
line 1109
;1109:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $395
JUMPV
LABELV $394
line 1111
;1110:		while (*s != '\\')
;1111:		{
line 1112
;1112:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $397
line 1113
;1113:				return "";
ADDRGP4 $42
RETP4
ADDRGP4 $380
JUMPV
LABELV $397
line 1114
;1114:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1115
;1115:		}
LABELV $395
line 1110
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $394
line 1116
;1116:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1117
;1117:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1119
;1118:
;1119:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $382
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $381
ADDP4
ASGNP4
ADDRGP4 $400
JUMPV
LABELV $399
line 1122
;1120:
;1121:		while (*s != '\\' && *s)
;1122:		{
line 1123
;1123:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1124
;1124:		}
LABELV $400
line 1121
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $402
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $399
LABELV $402
line 1125
;1125:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1127
;1126:
;1127:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $403
line 1128
;1128:			return value[valueindex];
ADDRGP4 $382
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $381
ADDP4
RETP4
ADDRGP4 $380
JUMPV
LABELV $403
line 1130
;1129:
;1130:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $405
line 1131
;1131:			break;
ADDRGP4 $393
JUMPV
LABELV $405
line 1132
;1132:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1133
;1133:	}
LABELV $392
line 1107
ADDRGP4 $391
JUMPV
LABELV $393
line 1135
;1134:
;1135:	return "";
ADDRGP4 $42
RETP4
LABELV $380
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1146
;1136:}
;1137:
;1138:
;1139:/*
;1140:===================
;1141:Info_NextPair
;1142:
;1143:Used to itterate through all the key/value pairs in an info string
;1144:===================
;1145:*/
;1146:void Info_NextPair( const char **head, char *key, char *value ) {
line 1150
;1147:	char	*o;
;1148:	const char	*s;
;1149:
;1150:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1152
;1151:
;1152:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $408
line 1153
;1153:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1154
;1154:	}
LABELV $408
line 1155
;1155:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1156
;1156:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1158
;1157:
;1158:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $411
JUMPV
LABELV $410
line 1159
;1159:	while ( *s != '\\' ) {
line 1160
;1160:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $413
line 1161
;1161:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1162
;1162:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1163
;1163:			return;
ADDRGP4 $407
JUMPV
LABELV $413
line 1165
;1164:		}
;1165:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1166
;1166:	}
LABELV $411
line 1159
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $410
line 1167
;1167:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1168
;1168:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1170
;1169:
;1170:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $416
JUMPV
LABELV $415
line 1171
;1171:	while ( *s != '\\' && *s ) {
line 1172
;1172:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1173
;1173:	}
LABELV $416
line 1171
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $418
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $415
LABELV $418
line 1174
;1174:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1176
;1175:
;1176:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1177
;1177:}
LABELV $407
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 12
line 1185
;1178:
;1179:
;1180:/*
;1181:===================
;1182:Info_RemoveKey
;1183:===================
;1184:*/
;1185:void Info_RemoveKey( char *s, const char *key ) {
line 1191
;1186:	char	*start;
;1187:	char	pkey[MAX_INFO_KEY];
;1188:	char	value[MAX_INFO_VALUE];
;1189:	char	*o;
;1190:
;1191:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $420
line 1192
;1192:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $422
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1193
;1193:	}
LABELV $420
line 1195
;1194:
;1195:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $426
line 1196
;1196:		return;
ADDRGP4 $419
JUMPV
LABELV $425
line 1200
;1197:	}
;1198:
;1199:	while (1)
;1200:	{
line 1201
;1201:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1202
;1202:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $428
line 1203
;1203:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $428
line 1204
;1204:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $431
JUMPV
LABELV $430
line 1206
;1205:		while (*s != '\\')
;1206:		{
line 1207
;1207:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $433
line 1208
;1208:				return;
ADDRGP4 $419
JUMPV
LABELV $433
line 1209
;1209:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1210
;1210:		}
LABELV $431
line 1205
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $430
line 1211
;1211:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1212
;1212:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1214
;1213:
;1214:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $436
JUMPV
LABELV $435
line 1216
;1215:		while (*s != '\\' && *s)
;1216:		{
line 1217
;1217:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $438
line 1218
;1218:				return;
ADDRGP4 $419
JUMPV
LABELV $438
line 1219
;1219:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1220
;1220:		}
LABELV $436
line 1215
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $440
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $435
LABELV $440
line 1221
;1221:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1223
;1222:
;1223:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $441
line 1224
;1224:		{
line 1225
;1225:			memmove(start, s, strlen(s) + 1); // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1227
;1226:			
;1227:			return;
ADDRGP4 $419
JUMPV
LABELV $441
line 1230
;1228:		}
;1229:
;1230:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $443
line 1231
;1231:			return;
ADDRGP4 $419
JUMPV
LABELV $443
line 1232
;1232:	}
LABELV $426
line 1199
ADDRGP4 $425
JUMPV
line 1234
;1233:
;1234:}
LABELV $419
endproc Info_RemoveKey 2076 12
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1241
;1235:
;1236:/*
;1237:===================
;1238:Info_RemoveKey_Big
;1239:===================
;1240:*/
;1241:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1247
;1242:	char	*start;
;1243:	char	pkey[BIG_INFO_KEY];
;1244:	char	value[BIG_INFO_VALUE];
;1245:	char	*o;
;1246:
;1247:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $446
line 1248
;1248:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $448
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1249
;1249:	}
LABELV $446
line 1251
;1250:
;1251:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $452
line 1252
;1252:		return;
ADDRGP4 $445
JUMPV
LABELV $451
line 1256
;1253:	}
;1254:
;1255:	while (1)
;1256:	{
line 1257
;1257:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1258
;1258:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $454
line 1259
;1259:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $454
line 1260
;1260:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
line 1262
;1261:		while (*s != '\\')
;1262:		{
line 1263
;1263:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 1264
;1264:				return;
ADDRGP4 $445
JUMPV
LABELV $459
line 1265
;1265:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1266
;1266:		}
LABELV $457
line 1261
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $456
line 1267
;1267:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1268
;1268:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1270
;1269:
;1270:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $462
JUMPV
LABELV $461
line 1272
;1271:		while (*s != '\\' && *s)
;1272:		{
line 1273
;1273:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $464
line 1274
;1274:				return;
ADDRGP4 $445
JUMPV
LABELV $464
line 1275
;1275:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1276
;1276:		}
LABELV $462
line 1271
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $466
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $461
LABELV $466
line 1277
;1277:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1279
;1278:
;1279:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $467
line 1280
;1280:		{
line 1281
;1281:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1282
;1282:			return;
ADDRGP4 $445
JUMPV
LABELV $467
line 1285
;1283:		}
;1284:
;1285:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $469
line 1286
;1286:			return;
ADDRGP4 $445
JUMPV
LABELV $469
line 1287
;1287:	}
LABELV $452
line 1255
ADDRGP4 $451
JUMPV
line 1289
;1288:
;1289:}
LABELV $445
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1302
;1290:
;1291:
;1292:
;1293:
;1294:/*
;1295:==================
;1296:Info_Validate
;1297:
;1298:Some characters are illegal in info strings because they
;1299:can mess up the server's parsing
;1300:==================
;1301:*/
;1302:qboolean Info_Validate( const char *s ) {
line 1303
;1303:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $472
line 1304
;1304:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $471
JUMPV
LABELV $472
line 1306
;1305:	}
;1306:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $474
line 1307
;1307:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $471
JUMPV
LABELV $474
line 1309
;1308:	}
;1309:	return qtrue;
CNSTI4 1
RETI4
LABELV $471
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1048 20
line 1319
;1310:}
;1311:
;1312:/*
;1313:==================
;1314:Info_SetValueForKey
;1315:
;1316:Changes or adds a key/value pair
;1317:==================
;1318:*/
;1319:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1321
;1320:	char	newi[MAX_INFO_STRING];
;1321:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $477
ASGNP4
line 1323
;1322:
;1323:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1024
LTI4 $484
line 1324
;1324:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $480
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1325
;1325:	}
line 1327
;1326:
;1327:	for(; *blacklist; ++blacklist)
ADDRGP4 $484
JUMPV
LABELV $481
line 1328
;1328:	{
line 1329
;1329:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $487
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
LABELV $487
line 1330
;1330:		{
line 1331
;1331:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $488
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1332
;1332:			return;
ADDRGP4 $476
JUMPV
LABELV $485
line 1334
;1333:		}
;1334:	}
LABELV $482
line 1327
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $484
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $481
line 1336
;1335:	
;1336:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1337
;1337:	if (!value || !strlen(value))
ADDRLP4 1032
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $491
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $489
LABELV $491
line 1338
;1338:		return;
ADDRGP4 $476
JUMPV
LABELV $489
line 1340
;1339:
;1340:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $492
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1342
;1341:
;1342:	if (strlen(newi) + strlen(s) >= MAX_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $493
line 1343
;1343:	{
line 1344
;1344:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $495
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1345
;1345:		return;
ADDRGP4 $476
JUMPV
LABELV $493
line 1348
;1346:	}
;1347:
;1348:	strcat (newi, s);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1349
;1349:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1350
;1350:}
LABELV $476
endproc Info_SetValueForKey 1048 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8216 20
line 1359
;1351:
;1352:/*
;1353:==================
;1354:Info_SetValueForKey_Big
;1355:
;1356:Changes or adds a key/value pair
;1357:==================
;1358:*/
;1359:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1361
;1360:	char	newi[BIG_INFO_STRING];
;1361:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $477
ASGNP4
line 1363
;1362:
;1363:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8196
INDIRI4
CNSTI4 8192
LTI4 $502
line 1364
;1364:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $480
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1365
;1365:	}
line 1367
;1366:
;1367:	for(; *blacklist; ++blacklist)
ADDRGP4 $502
JUMPV
LABELV $499
line 1368
;1368:	{
line 1369
;1369:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $505
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
LABELV $505
line 1370
;1370:		{
line 1371
;1371:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $488
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1372
;1372:			return;
ADDRGP4 $496
JUMPV
LABELV $503
line 1374
;1373:		}
;1374:	}
LABELV $500
line 1367
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $502
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $499
line 1376
;1375:
;1376:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1377
;1377:	if (!value || !strlen(value))
ADDRLP4 8200
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
ADDRLP4 8200
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8204
INDIRI4
CNSTI4 0
NEI4 $506
LABELV $508
line 1378
;1378:		return;
ADDRGP4 $496
JUMPV
LABELV $506
line 1380
;1379:
;1380:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $492
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1382
;1381:
;1382:	if (strlen(newi) + strlen(s) >= BIG_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 8208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $509
line 1383
;1383:	{
line 1384
;1384:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $511
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1385
;1385:		return;
ADDRGP4 $496
JUMPV
LABELV $509
line 1388
;1386:	}
;1387:
;1388:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1389
;1389:}
LABELV $496
endproc Info_SetValueForKey_Big 8216 20
proc Com_CharIsOneOfCharset 8 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 1402
;1390:
;1391:
;1392:
;1393:
;1394://====================================================================
;1395:
;1396:/*
;1397:==================
;1398:Com_CharIsOneOfCharset
;1399:==================
;1400:*/
;1401:static qboolean Com_CharIsOneOfCharset( char c, char *set )
;1402:{
line 1405
;1403:	int i;
;1404:
;1405:	for( i = 0; i < strlen( set ); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $516
JUMPV
LABELV $513
line 1406
;1406:	{
line 1407
;1407:		if( set[ i ] == c )
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRI1
CVII4 1
NEI4 $517
line 1408
;1408:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $512
JUMPV
LABELV $517
line 1409
;1409:	}
LABELV $514
line 1405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $516
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $513
line 1411
;1410:
;1411:	return qfalse;
CNSTI4 0
RETI4
LABELV $512
endproc Com_CharIsOneOfCharset 8 4
export Com_SkipCharset
proc Com_SkipCharset 8 8
line 1420
;1412:}
;1413:
;1414:/*
;1415:==================
;1416:Com_SkipCharset
;1417:==================
;1418:*/
;1419:char *Com_SkipCharset( char *s, char *sep )
;1420:{
line 1421
;1421:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $521
JUMPV
LABELV $520
line 1424
;1422:
;1423:	while( p )
;1424:	{
line 1425
;1425:		if( Com_CharIsOneOfCharset( *p, sep ) )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $522
line 1426
;1426:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1428
;1427:		else
;1428:			break;
LABELV $524
line 1429
;1429:	}
LABELV $521
line 1423
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
LABELV $522
line 1431
;1430:
;1431:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $519
endproc Com_SkipCharset 8 8
export Com_SkipTokens
proc Com_SkipTokens 20 8
line 1440
;1432:}
;1433:
;1434:/*
;1435:==================
;1436:Com_SkipTokens
;1437:==================
;1438:*/
;1439:char *Com_SkipTokens( char *s, int numTokens, char *sep )
;1440:{
line 1441
;1441:	int		sepCount = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1442
;1442:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $527
JUMPV
LABELV $526
line 1445
;1443:
;1444:	while( sepCount < numTokens )
;1445:	{
line 1446
;1446:		if( Com_CharIsOneOfCharset( *p++, sep ) )
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $529
line 1447
;1447:		{
line 1448
;1448:			sepCount++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $532
JUMPV
LABELV $531
line 1450
;1449:			while( Com_CharIsOneOfCharset( *p, sep ) )
;1450:				p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $532
line 1449
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $531
line 1451
;1451:		}
ADDRGP4 $530
JUMPV
LABELV $529
line 1452
;1452:		else if( *p == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $534
line 1453
;1453:			break;
ADDRGP4 $528
JUMPV
LABELV $534
LABELV $530
line 1454
;1454:	}
LABELV $527
line 1444
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $526
LABELV $528
line 1456
;1455:
;1456:	if( sepCount == numTokens )
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $536
line 1457
;1457:		return p;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $525
JUMPV
LABELV $536
line 1459
;1458:	else
;1459:		return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $525
endproc Com_SkipTokens 20 8
import Q_vsnprintf
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
import Info_RemoveKey_big
import Com_RandomBytes
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
LABELV $511
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $495
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $492
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $488
byte 1 94
byte 1 51
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 39
byte 1 37
byte 1 99
byte 1 39
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $480
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $477
byte 1 92
byte 1 59
byte 1 34
byte 1 0
align 1
LABELV $448
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $422
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $388
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $379
byte 1 32
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 0
align 1
LABELV $371
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
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
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $368
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
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
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $319
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
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
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $269
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $266
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $263
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $205
byte 1 41
byte 1 0
align 1
LABELV $200
byte 1 40
byte 1 0
align 1
LABELV $181
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $89
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
LABELV $85
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
LABELV $79
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $59
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $42
byte 1 0
