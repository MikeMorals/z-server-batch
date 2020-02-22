code
proc VectorCompare 16 0
file "../../../../src/qcommon/q_shared.h"
line 484
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
;24:#ifndef __Q_SHARED_H
;25:#define __Q_SHARED_H
;26:
;27:// q_shared.h -- included first by ALL program modules.
;28:// A user mod should never modify this file
;29:
;30:#define PRODUCT_NAME            "tremulous"
;31:
;32:#ifdef _MSC_VER
;33:# define PRODUCT_VERSION          "1.1.0"
;34:#endif
;35:
;36:#define CLIENT_WINDOW_TITLE       "Tremulous " PRODUCT_VERSION
;37:#define CLIENT_WINDOW_MIN_TITLE   "Tremulous"
;38:#define Q3_VERSION                 PRODUCT_NAME " " //PRODUCT_VERSION
;39:
;40:#define MAX_TEAMNAME 32
;41:
;42:#ifdef _MSC_VER
;43:
;44:#pragma warning(disable : 4018)     // signed/unsigned mismatch
;45:#pragma warning(disable : 4032)
;46:#pragma warning(disable : 4051)
;47:#pragma warning(disable : 4057)		// slightly different base types
;48:#pragma warning(disable : 4100)		// unreferenced formal parameter
;49:#pragma warning(disable : 4115)
;50:#pragma warning(disable : 4125)		// decimal digit terminates octal escape sequence
;51:#pragma warning(disable : 4127)		// conditional expression is constant
;52:#pragma warning(disable : 4136)
;53:#pragma warning(disable : 4152)		// nonstandard extension, function/data pointer conversion in expression
;54://#pragma warning(disable : 4201)
;55://#pragma warning(disable : 4214)
;56:#pragma warning(disable : 4244)
;57:#pragma warning(disable : 4142)		// benign redefinition
;58://#pragma warning(disable : 4305)		// truncation from const double to float
;59://#pragma warning(disable : 4310)		// cast truncates constant value
;60://#pragma warning(disable:  4505) 	// unreferenced local function has been removed
;61:#pragma warning(disable : 4514)
;62:#pragma warning(disable : 4702)		// unreachable code
;63:#pragma warning(disable : 4711)		// selected for automatic inline expansion
;64:#pragma warning(disable : 4220)		// varargs matches remaining parameters
;65://#pragma intrinsic( memset, memcpy )
;66:#endif
;67:
;68://Ignore __attribute__ on non-gcc platforms
;69:#ifndef __GNUC__
;70:#ifndef __attribute__
;71:#define __attribute__(x)
;72:#endif
;73:#endif
;74:
;75:/**********************************************************************
;76:  VM Considerations
;77:
;78:  The VM can not use the standard system headers because we aren't really
;79:  using the compiler they were meant for.  We use bg_lib.h which contains
;80:  prototypes for the functions we define for our own use in bg_lib.c.
;81:
;82:  When writing mods, please add needed headers HERE, do not start including
;83:  stuff like <stdio.h> in the various .c files that make up each of the VMs
;84:  since you will be including system headers files can will have issues.
;85:
;86:  Remember, if you use a C library function that is not defined in bg_lib.c,
;87:  you will have to add your own version for support in the VM.
;88:
;89: **********************************************************************/
;90:
;91:#ifdef Q3_VM
;92:
;93:#include "../game/bg_lib.h"
;94:
;95:typedef int intptr_t;
;96:
;97:#else
;98:
;99:#include <assert.h>
;100:#include <math.h>
;101:#include <stdio.h>
;102:#include <stdarg.h>
;103:#include <string.h>
;104:#include <stdlib.h>
;105:#include <time.h>
;106:#include <ctype.h>
;107:#include <limits.h>
;108:
;109:// vsnprintf is ISO/IEC 9899:1999
;110:// abstracting this to make it portable
;111:#ifdef _WIN32
;112:  #define Q_vsnprintf _vsnprintf
;113:  #define Q_snprintf _snprintf
;114:#else
;115:  #define Q_vsnprintf vsnprintf
;116:  #define Q_snprintf snprintf
;117:#endif
;118:
;119:#ifdef _MSC_VER
;120:  #include <io.h>
;121:
;122:  typedef __int64 int64_t;
;123:  typedef __int32 int32_t;
;124:  typedef __int16 int16_t;
;125:  typedef __int8 int8_t;
;126:  typedef unsigned __int64 uint64_t;
;127:  typedef unsigned __int32 uint32_t;
;128:  typedef unsigned __int16 uint16_t;
;129:  typedef unsigned __int8 uint8_t;
;130:#else
;131:  #include <stdint.h>
;132:#endif
;133:
;134:#endif
;135:
;136:
;137:#include "q_platform.h"
;138:
;139://=============================================================
;140:
;141:typedef unsigned char 		byte;
;142:
;143:typedef enum {qfalse, qtrue}	qboolean;
;144:
;145:typedef int		qhandle_t;
;146:typedef int		sfxHandle_t;
;147:typedef int		fileHandle_t;
;148:typedef int		clipHandle_t;
;149:
;150:#define PAD(x,y) (((x)+(y)-1) & ~((y)-1))
;151:
;152:#ifdef __GNUC__
;153:#define ALIGN(x) __attribute__((aligned(x)))
;154:#else
;155:#define ALIGN(x)
;156:#endif
;157:
;158:#ifndef NULL
;159:#define NULL ((void *)0)
;160:#endif
;161:
;162:#define	MAX_QINT			0x7fffffff
;163:#define	MIN_QINT			(-MAX_QINT-1)
;164:
;165:
;166:// angle indexes
;167:#define	PITCH				0		// up / down
;168:#define	YAW					1		// left / right
;169:#define	ROLL				2		// fall over
;170:
;171:// the game guarantees that no string from the network will ever
;172:// exceed MAX_STRING_CHARS
;173:#define	MAX_STRING_CHARS	1024	// max length of a string passed to Cmd_TokenizeString
;174:#define	MAX_STRING_TOKENS	1024	// max tokens resulting from Cmd_TokenizeString
;175:#define	MAX_TOKEN_CHARS		1024	// max length of an individual token
;176:
;177:#define	MAX_INFO_STRING		1024
;178:#define	MAX_INFO_KEY		  1024
;179:#define	MAX_INFO_VALUE		1024
;180:
;181:#define	BIG_INFO_STRING		8192  // used for system info key only
;182:#define	BIG_INFO_KEY		  8192
;183:#define	BIG_INFO_VALUE		8192
;184:
;185:
;186:#define	MAX_QPATH			64		// max length of a quake game pathname
;187:#ifdef PATH_MAX
;188:#define MAX_OSPATH			PATH_MAX
;189:#else
;190:#define	MAX_OSPATH			256		// max length of a filesystem pathname
;191:#endif
;192:
;193:#define	MAX_NAME_LENGTH			32		// max length of a client name
;194:#define	MAX_HOSTNAME_LENGTH	80		// max length of a host name
;195:
;196:#define	MAX_SAY_TEXT	150
;197:
;198:// paramters for command buffer stuffing
;199:typedef enum {
;200:	EXEC_NOW,			// don't return until completed, a VM should NEVER use this,
;201:						// because some commands might cause the VM to be unloaded...
;202:	EXEC_INSERT,		// insert at current position, but don't run yet
;203:	EXEC_APPEND			// add to end of the command buffer (normal case)
;204:} cbufExec_t;
;205:
;206:
;207://
;208:// these aren't needed by any of the VMs.  put in another header?
;209://
;210:#define	MAX_MAP_AREA_BYTES		32		// bit vector of area visibility
;211:
;212:
;213:// print levels from renderer (FIXME: set up for game / cgame?)
;214:typedef enum {
;215:	PRINT_ALL,
;216:	PRINT_DEVELOPER,		// only print when "developer 1"
;217:	PRINT_WARNING,
;218:	PRINT_ERROR
;219:} printParm_t;
;220:
;221:
;222:#ifdef ERR_FATAL
;223:#undef ERR_FATAL			// this is be defined in malloc.h
;224:#endif
;225:
;226:// parameters to the main Error routine
;227:typedef enum {
;228:	ERR_FATAL,					// exit the entire game with a popup window
;229:	ERR_DROP,					// print to console and disconnect from game
;230:	ERR_SERVERDISCONNECT,		// don't kill server
;231:	ERR_DISCONNECT,				// client disconnected from the server
;232:	ERR_NEED_CD					// pop up the need-cd dialog
;233:} errorParm_t;
;234:
;235:
;236:// font rendering values used by ui and cgame
;237:
;238:#define PROP_GAP_WIDTH			3
;239:#define PROP_SPACE_WIDTH		8
;240:#define PROP_HEIGHT				27
;241:#define PROP_SMALL_SIZE_SCALE	0.75
;242:
;243:#define BLINK_DIVISOR			200
;244:#define PULSE_DIVISOR			75
;245:
;246:#define UI_LEFT			0x00000000	// default
;247:#define UI_CENTER		0x00000001
;248:#define UI_RIGHT		0x00000002
;249:#define UI_FORMATMASK	0x00000007
;250:#define UI_SMALLFONT	0x00000010
;251:#define UI_BIGFONT		0x00000020	// default
;252:#define UI_GIANTFONT	0x00000040
;253:#define UI_DROPSHADOW	0x00000800
;254:#define UI_BLINK		0x00001000
;255:#define UI_INVERSE		0x00002000
;256:#define UI_PULSE		0x00004000
;257:
;258:#if defined(_DEBUG) && !defined(BSPC)
;259:	#define HUNK_DEBUG
;260:#endif
;261:
;262:typedef enum {
;263:	h_high,
;264:	h_low,
;265:	h_dontcare
;266:} ha_pref;
;267:
;268:#ifdef HUNK_DEBUG
;269:#define Hunk_Alloc( size, preference )				Hunk_AllocDebug(size, preference, #size, __FILE__, __LINE__)
;270:void *Hunk_AllocDebug( int size, ha_pref preference, char *label, char *file, int line );
;271:#else
;272:void *Hunk_Alloc( int size, ha_pref preference );
;273:#endif
;274:
;275:#define Com_Memset memset
;276:#define Com_Memcpy memcpy
;277:
;278:#define CIN_system	1
;279:#define CIN_loop	2
;280:#define	CIN_hold	4
;281:#define CIN_silent	8
;282:#define CIN_shader	16
;283:
;284:/*
;285:==============================================================
;286:
;287:MATHLIB
;288:
;289:==============================================================
;290:*/
;291:
;292:
;293:typedef float vec_t;
;294:typedef vec_t vec2_t[2];
;295:typedef vec_t vec3_t[3];
;296:typedef vec_t vec4_t[4];
;297:typedef vec_t vec5_t[5];
;298:
;299:typedef	int	fixed4_t;
;300:typedef	int	fixed8_t;
;301:typedef	int	fixed16_t;
;302:
;303:#ifndef M_PI
;304:#define M_PI		3.14159265358979323846f	// matches value in gcc v2 math.h
;305:#endif
;306:
;307:#ifndef M_SQRT2
;308:#define M_SQRT2 1.414213562f
;309:#endif
;310:
;311:#ifndef M_ROOT3
;312:#define M_ROOT3 1.732050808f
;313:#endif
;314:
;315:#define NUMVERTEXNORMALS	162
;316:extern	vec3_t	bytedirs[NUMVERTEXNORMALS];
;317:
;318:// all drawing is done to a 640*480 virtual screen size
;319:// and will be automatically scaled to the real resolution
;320:#define	SCREEN_WIDTH		640
;321:#define	SCREEN_HEIGHT		480
;322:
;323:#define TINYCHAR_WIDTH		(SMALLCHAR_WIDTH)
;324:#define TINYCHAR_HEIGHT		(SMALLCHAR_HEIGHT/2)
;325:
;326:#define SMALLCHAR_WIDTH		8
;327:#define SMALLCHAR_HEIGHT	16
;328:
;329:#define BIGCHAR_WIDTH		16
;330:#define BIGCHAR_HEIGHT		16
;331:
;332:#define	GIANTCHAR_WIDTH		32
;333:#define	GIANTCHAR_HEIGHT	48
;334:
;335:extern	vec4_t		colorBlack;
;336:extern	vec4_t		colorRed;
;337:extern	vec4_t		colorGreen;
;338:extern	vec4_t		colorBlue;
;339:extern	vec4_t		colorYellow;
;340:extern	vec4_t		colorMagenta;
;341:extern	vec4_t		colorCyan;
;342:extern	vec4_t		colorWhite;
;343:extern	vec4_t		colorLtGrey;
;344:extern	vec4_t		colorMdGrey;
;345:extern	vec4_t		colorDkGrey;
;346:
;347:#define Q_COLOR_ESCAPE	'^'
;348:#define Q_IsColorString(p)	( p && *(p) == Q_COLOR_ESCAPE && *((p)+1) && isalnum(*((p)+1)) ) // ^[0-9a-zA-Z]
;349:
;350:#define COLOR_BLACK		'0'
;351:#define COLOR_RED		'1'
;352:#define COLOR_GREEN		'2'
;353:#define COLOR_YELLOW	'3'
;354:#define COLOR_BLUE		'4'
;355:#define COLOR_CYAN		'5'
;356:#define COLOR_MAGENTA	'6'
;357:#define COLOR_WHITE		'7'
;358:#define ColorIndex(c)	( ( (c) - '0' ) & 7 )
;359:
;360:#define S_COLOR_BLACK	"^0"
;361:#define S_COLOR_RED		"^1"
;362:#define S_COLOR_GREEN	"^2"
;363:#define S_COLOR_YELLOW	"^3"
;364:#define S_COLOR_BLUE	"^4"
;365:#define S_COLOR_CYAN	"^5"
;366:#define S_COLOR_MAGENTA	"^6"
;367:#define S_COLOR_WHITE	"^7"
;368:
;369:extern vec4_t	g_color_table[8];
;370:
;371:#define	MAKERGB( v, r, g, b ) v[0]=r;v[1]=g;v[2]=b
;372:#define	MAKERGBA( v, r, g, b, a ) v[0]=r;v[1]=g;v[2]=b;v[3]=a
;373:
;374:#define DEG2RAD( a ) ( ( (a) * M_PI ) / 180.0F )
;375:#define RAD2DEG( a ) ( ( (a) * 180.0f ) / M_PI )
;376:
;377:struct cplane_s;
;378:
;379:extern	vec3_t	vec3_origin;
;380:extern	vec3_t	axisDefault[3];
;381:
;382:#define	nanmask (255<<23)
;383:
;384:#define	IS_NAN(x) (((*(int *)&x)&nanmask)==nanmask)
;385:
;386:#if idppc
;387:
;388:static ID_INLINE float Q_rsqrt( float number ) {
;389:		float x = 0.5f * number;
;390:                float y;
;391:#ifdef __GNUC__            
;392:                asm("frsqrte %0,%1" : "=f" (y) : "f" (number));
;393:#else
;394:		y = __frsqrte( number );
;395:#endif
;396:		return y * (1.5f - (x * y * y));
;397:	}
;398:
;399:#ifdef __GNUC__            
;400:static ID_INLINE float Q_fabs(float x) {
;401:    float abs_x;
;402:    
;403:    asm("fabs %0,%1" : "=f" (abs_x) : "f" (x));
;404:    return abs_x;
;405:}
;406:#else
;407:#define Q_fabs __fabsf
;408:#endif
;409:
;410:#else
;411:float Q_fabs( float f );
;412:float Q_rsqrt( float f );		// reciprocal square root
;413:#endif
;414:
;415:#define SQRTFAST( x ) ( (x) * Q_rsqrt( x ) )
;416:
;417:signed char ClampChar( int i );
;418:signed short ClampShort( int i );
;419:
;420:// this isn't a real cheap function to call!
;421:int DirToByte( vec3_t dir );
;422:void ByteToDir( int b, vec3_t dir );
;423:
;424:#if	1
;425:
;426:#define DotProduct(x,y)			((x)[0]*(y)[0]+(x)[1]*(y)[1]+(x)[2]*(y)[2])
;427:#define VectorSubtract(a,b,c)	((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2])
;428:#define VectorAdd(a,b,c)		((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2])
;429:#define VectorCopy(a,b)			((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
;430:#define	VectorScale(v, s, o)	((o)[0]=(v)[0]*(s),(o)[1]=(v)[1]*(s),(o)[2]=(v)[2]*(s))
;431:#define	VectorMA(v, s, b, o)	((o)[0]=(v)[0]+(b)[0]*(s),(o)[1]=(v)[1]+(b)[1]*(s),(o)[2]=(v)[2]+(b)[2]*(s))
;432:#define VectorLerp( f, s, e, r ) ((r)[0]=(s)[0]+(f)*((e)[0]-(s)[0]),\
;433:  (r)[1]=(s)[1]+(f)*((e)[1]-(s)[1]),\
;434:  (r)[2]=(s)[2]+(f)*((e)[2]-(s)[2])) 
;435:
;436:#else
;437:
;438:#define DotProduct(x,y)			_DotProduct(x,y)
;439:#define VectorSubtract(a,b,c)	_VectorSubtract(a,b,c)
;440:#define VectorAdd(a,b,c)		_VectorAdd(a,b,c)
;441:#define VectorCopy(a,b)			_VectorCopy(a,b)
;442:#define	VectorScale(v, s, o)	_VectorScale(v,s,o)
;443:#define	VectorMA(v, s, b, o)	_VectorMA(v,s,b,o)
;444:
;445:#endif
;446:
;447:#ifdef Q3_VM
;448:#ifdef VectorCopy
;449:#undef VectorCopy
;450:// this is a little hack to get more efficient copies in our interpreter
;451:typedef struct {
;452:	float	v[3];
;453:} vec3struct_t;
;454:#define VectorCopy(a,b)	(*(vec3struct_t *)b=*(vec3struct_t *)a)
;455:#endif
;456:#endif
;457:
;458:#define Vector2Set(v, x, y) ((v)[0]=(x), (v)[1]=(y))
;459:#define VectorClear(a)			((a)[0]=(a)[1]=(a)[2]=0)
;460:#define VectorNegate(a,b)		((b)[0]=-(a)[0],(b)[1]=-(a)[1],(b)[2]=-(a)[2])
;461:#define VectorSet(v, x, y, z)	((v)[0]=(x), (v)[1]=(y), (v)[2]=(z))
;462:#define Vector4Copy(a,b)		((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2],(b)[3]=(a)[3])
;463:#define Vector4Add(a,b,c)    ((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2],(c)[3]=(a)[3]+(b)[3])
;464:
;465:#define	SnapVector(v) {v[0]=((int)(v[0]));v[1]=((int)(v[1]));v[2]=((int)(v[2]));}
;466:// just in case you do't want to use the macros
;467:vec_t _DotProduct( const vec3_t v1, const vec3_t v2 );
;468:void _VectorSubtract( const vec3_t veca, const vec3_t vecb, vec3_t out );
;469:void _VectorAdd( const vec3_t veca, const vec3_t vecb, vec3_t out );
;470:void _VectorCopy( const vec3_t in, vec3_t out );
;471:void _VectorScale( const vec3_t in, float scale, vec3_t out );
;472:void _VectorMA( const vec3_t veca, float scale, const vec3_t vecb, vec3_t vecc );
;473:
;474:unsigned ColorBytes3 (float r, float g, float b);
;475:unsigned ColorBytes4 (float r, float g, float b, float a);
;476:
;477:float NormalizeColor( const vec3_t in, vec3_t out );
;478:
;479:float RadiusFromBounds( const vec3_t mins, const vec3_t maxs );
;480:void ClearBounds( vec3_t mins, vec3_t maxs );
;481:void AddPointToBounds( const vec3_t v, vec3_t mins, vec3_t maxs );
;482:
;483:#if !defined( Q3_VM ) || ( defined( Q3_VM ) && defined( __Q3_VM_MATH ) )
;484:static ID_INLINE int VectorCompare( const vec3_t v1, const vec3_t v2 ) {
line 485
;485:	if (v1[0] != v2[0] || v1[1] != v2[1] || v1[2] != v2[2]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
NEF4 $11
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
NEF4 $11
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
EQF4 $8
LABELV $11
line 486
;486:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $7
JUMPV
LABELV $8
line 488
;487:	}			
;488:	return 1;
CNSTI4 1
RETI4
LABELV $7
endproc VectorCompare 16 0
proc VectorCompareEpsilon 44 4
line 493
;489:}
;490:
;491:static ID_INLINE int VectorCompareEpsilon(
;492:		const vec3_t v1, const vec3_t v2, float epsilon )
;493:{
line 496
;494:	vec3_t d;
;495:
;496:	VectorSubtract( v1, v2, d );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 497
;497:	d[ 0 ] = fabs( d[ 0 ] );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 498
;498:	d[ 1 ] = fabs( d[ 1 ] );
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRF4
ASGNF4
line 499
;499:	d[ 2 ] = fabs( d[ 2 ] );
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
line 501
;500:
;501:	if( d[ 0 ] > epsilon || d[ 1 ] > epsilon || d[ 2 ] > epsilon )
ADDRLP4 40
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $24
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $24
ADDRLP4 0+8
INDIRF4
ADDRLP4 40
INDIRF4
LEF4 $19
LABELV $24
line 502
;502:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $12
JUMPV
LABELV $19
line 504
;503:
;504:	return 1;
CNSTI4 1
RETI4
LABELV $12
endproc VectorCompareEpsilon 44 4
proc VectorLength 20 4
line 507
;505:}
;506:
;507:static ID_INLINE vec_t VectorLength( const vec3_t v ) {
line 508
;508:	return (vec_t)sqrt (v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
RETF4
LABELV $25
endproc VectorLength 20 4
proc VectorLengthSquared 16 0
line 511
;509:}
;510:
;511:static ID_INLINE vec_t VectorLengthSquared( const vec3_t v ) {
line 512
;512:	return (v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
RETF4
LABELV $26
endproc VectorLengthSquared 16 0
proc Distance 32 4
line 515
;513:}
;514:
;515:static ID_INLINE vec_t Distance( const vec3_t p1, const vec3_t p2 ) {
line 518
;516:	vec3_t	v;
;517:
;518:	VectorSubtract (p2, p1, v);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 519
;519:	return VectorLength( v );
ADDRLP4 0
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
RETF4
LABELV $27
endproc Distance 32 4
proc DistanceSquared 32 0
line 522
;520:}
;521:
;522:static ID_INLINE vec_t DistanceSquared( const vec3_t p1, const vec3_t p2 ) {
line 525
;523:	vec3_t	v;
;524:
;525:	VectorSubtract (p2, p1, v);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 526
;526:	return v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
RETF4
LABELV $30
endproc DistanceSquared 32 0
proc VectorNormalizeFast 36 4
line 532
;527:}
;528:
;529:// fast vector normalize routine that does not check to make sure
;530:// that length != 0, nor does it return length, uses rsqrt approximation
;531:static ID_INLINE void VectorNormalizeFast( vec3_t v )
;532:{
line 535
;533:	float ilength;
;534:
;535:	ilength = Q_rsqrt( DotProduct( v, v ) );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 20
ADDRGP4 Q_rsqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 537
;536:
;537:	v[0] *= ilength;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 538
;538:	v[1] *= ilength;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 539
;539:	v[2] *= ilength;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 540
;540:}
LABELV $37
endproc VectorNormalizeFast 36 4
proc VectorInverse 12 0
line 542
;541:
;542:static ID_INLINE void VectorInverse( vec3_t v ){
line 543
;543:	v[0] = -v[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 544
;544:	v[1] = -v[1];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 545
;545:	v[2] = -v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 546
;546:}
LABELV $38
endproc VectorInverse 12 0
proc CrossProduct 40 0
line 548
;547:
;548:static ID_INLINE void CrossProduct( const vec3_t v1, const vec3_t v2, vec3_t cross ) {
line 549
;549:	cross[0] = v1[1]*v2[2] - v1[2]*v2[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
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
SUBF4
ASGNF4
line 550
;550:	cross[1] = v1[2]*v2[0] - v1[0]*v2[2];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 8
ASGNI4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 551
;551:	cross[2] = v1[0]*v2[1] - v1[1]*v2[0];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 552
;552:}
LABELV $39
endproc CrossProduct 40 0
data
export vec3_origin
align 4
LABELV vec3_origin
byte 4 0
byte 4 0
byte 4 0
export axisDefault
align 4
LABELV axisDefault
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
export colorBlack
align 4
LABELV colorBlack
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
export colorRed
align 4
LABELV colorRed
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
export colorGreen
align 4
LABELV colorGreen
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
export colorBlue
align 4
LABELV colorBlue
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
export colorYellow
align 4
LABELV colorYellow
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
export colorMagenta
align 4
LABELV colorMagenta
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
export colorCyan
align 4
LABELV colorCyan
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export colorWhite
align 4
LABELV colorWhite
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export colorLtGrey
align 4
LABELV colorLtGrey
byte 4 1061158912
byte 4 1061158912
byte 4 1061158912
byte 4 1065353216
export colorMdGrey
align 4
LABELV colorMdGrey
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
export colorDkGrey
align 4
LABELV colorDkGrey
byte 4 1048576000
byte 4 1048576000
byte 4 1048576000
byte 4 1065353216
export g_color_table
align 4
LABELV g_color_table
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export bytedirs
align 4
LABELV bytedirs
byte 4 3204879951
byte 4 0
byte 4 1062847556
byte 4 3202531056
byte 4 1047828139
byte 4 1063074669
byte 4 3197577718
byte 4 0
byte 4 1064605338
byte 4 3198039930
byte 4 1056964608
byte 4 1062149053
byte 4 3190184938
byte 4 1049007711
byte 4 1064532072
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1062847556
byte 4 1057396303
byte 4 3189189110
byte 4 1060597999
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1060013330
byte 4 0
byte 4 1057396303
byte 4 1062847556
byte 4 1050556282
byte 4 1056964608
byte 4 1062149053
byte 4 1057396303
byte 4 0
byte 4 1062847556
byte 4 1050094070
byte 4 0
byte 4 1064605338
byte 4 1055047408
byte 4 1047828139
byte 4 1063074669
byte 4 1042701290
byte 4 1049007711
byte 4 1064532072
byte 4 3207496978
byte 4 1041705462
byte 4 1060597999
byte 4 3209632701
byte 4 1050556282
byte 4 1056964608
byte 4 3205921044
byte 4 1054458931
byte 4 1060121929
byte 4 3210331204
byte 4 1057396303
byte 4 0
byte 4 3210558317
byte 4 1055047408
byte 4 1047828139
byte 4 3208081647
byte 4 1060013330
byte 4 1041705462
byte 4 3207605577
byte 4 1058437396
byte 4 1054458931
byte 4 3204448256
byte 4 1062149053
byte 4 1050556282
byte 4 3195311787
byte 4 1063074669
byte 4 1055047408
byte 4 3201942579
byte 4 1060121929
byte 4 1058437396
byte 4 3208081647
byte 4 1060013330
byte 4 3189189110
byte 4 3204448256
byte 4 1062149053
byte 4 3198039930
byte 4 3204879951
byte 4 1062847556
byte 4 0
byte 4 0
byte 4 1062847556
byte 4 3204879951
byte 4 3195311787
byte 4 1063074669
byte 4 3202531056
byte 4 0
byte 4 1064605338
byte 4 3197577718
byte 4 3196491359
byte 4 1064532072
byte 4 3190184938
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1064605338
byte 4 1050094070
byte 4 3196491359
byte 4 1064532072
byte 4 1042701290
byte 4 1047828139
byte 4 1063074669
byte 4 1055047408
byte 4 1049007711
byte 4 1064532072
byte 4 1042701290
byte 4 1056964608
byte 4 1062149053
byte 4 1050556282
byte 4 1047828139
byte 4 1063074669
byte 4 3202531056
byte 4 1049007711
byte 4 1064532072
byte 4 3190184938
byte 4 1056964608
byte 4 1062149053
byte 4 3198039930
byte 4 1062847556
byte 4 1057396303
byte 4 0
byte 4 1060597999
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1060013330
byte 4 3189189110
byte 4 1057396303
byte 4 1062847556
byte 4 0
byte 4 1054458931
byte 4 1060121929
byte 4 1058437396
byte 4 1063074669
byte 4 1055047408
byte 4 1047828139
byte 4 1060121929
byte 4 1058437396
byte 4 1054458931
byte 4 1062149053
byte 4 1050556282
byte 4 1056964608
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1058437396
byte 4 1054458931
byte 4 1060121929
byte 4 1064605338
byte 4 1050094070
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1064532072
byte 4 1042701290
byte 4 1049007711
byte 4 1062847556
byte 4 3204879951
byte 4 0
byte 4 1064605338
byte 4 3197577718
byte 4 0
byte 4 1063074669
byte 4 3202531056
byte 4 1047828139
byte 4 1064532072
byte 4 3190184938
byte 4 1049007711
byte 4 1062149053
byte 4 3198039930
byte 4 1056964608
byte 4 1060013330
byte 4 3189189110
byte 4 1060597999
byte 4 1062847556
byte 4 0
byte 4 1057396303
byte 4 1063074669
byte 4 1055047408
byte 4 3195311787
byte 4 1062149053
byte 4 1050556282
byte 4 3204448256
byte 4 1064532072
byte 4 1042701290
byte 4 3196491359
byte 4 1057396303
byte 4 0
byte 4 3210331204
byte 4 1060013330
byte 4 1041705462
byte 4 3208081647
byte 4 1060013330
byte 4 3189189110
byte 4 3208081647
byte 4 1062847556
byte 4 0
byte 4 3204879951
byte 4 1062149053
byte 4 3198039930
byte 4 3204448256
byte 4 1063074669
byte 4 3202531056
byte 4 3195311787
byte 4 1064532072
byte 4 3190184938
byte 4 3196491359
byte 4 1041705462
byte 4 1060597999
byte 4 3207496978
byte 4 1050556282
byte 4 1056964608
byte 4 3209632701
byte 4 1054458931
byte 4 1060121929
byte 4 3205921044
byte 4 1055047408
byte 4 1047828139
byte 4 3210558317
byte 4 1058437396
byte 4 1054458931
byte 4 3207605577
byte 4 1060121929
byte 4 1058437396
byte 4 3201942579
byte 4 3189189110
byte 4 1060597999
byte 4 3207496978
byte 4 3198039930
byte 4 1056964608
byte 4 3209632701
byte 4 0
byte 4 1057396303
byte 4 3210331204
byte 4 3204879951
byte 4 0
byte 4 3210331204
byte 4 3202531056
byte 4 1047828139
byte 4 3210558317
byte 4 3197577718
byte 4 0
byte 4 3212088986
byte 4 3190184938
byte 4 1049007711
byte 4 3212015720
byte 4 0
byte 4 0
byte 4 3212836864
byte 4 1050094070
byte 4 0
byte 4 3212088986
byte 4 1042701290
byte 4 1049007711
byte 4 3212015720
byte 4 3202531056
byte 4 3195311787
byte 4 3210558317
byte 4 3198039930
byte 4 3204448256
byte 4 3209632701
byte 4 3190184938
byte 4 3196491359
byte 4 3212015720
byte 4 0
byte 4 3210331204
byte 4 3204879951
byte 4 3189189110
byte 4 3208081647
byte 4 3207496978
byte 4 1041705462
byte 4 3208081647
byte 4 3207496978
byte 4 0
byte 4 3204879951
byte 4 3210331204
byte 4 1050556282
byte 4 3204448256
byte 4 3209632701
byte 4 1055047408
byte 4 3195311787
byte 4 3210558317
byte 4 1042701290
byte 4 3196491359
byte 4 3212015720
byte 4 1047828139
byte 4 3210558317
byte 4 3202531056
byte 4 1056964608
byte 4 3209632701
byte 4 3198039930
byte 4 1054458931
byte 4 3207605577
byte 4 3205921044
byte 4 1060597999
byte 4 3207496978
byte 4 3189189110
byte 4 1060121929
byte 4 3205921044
byte 4 3201942579
byte 4 1058437396
byte 4 3201942579
byte 4 3207605577
byte 4 0
byte 4 3212088986
byte 4 3197577718
byte 4 0
byte 4 3212836864
byte 4 0
byte 4 1049007711
byte 4 3212015720
byte 4 3190184938
byte 4 0
byte 4 3210331204
byte 4 1057396303
byte 4 0
byte 4 3212088986
byte 4 1050094070
byte 4 1047828139
byte 4 3210558317
byte 4 1055047408
byte 4 1049007711
byte 4 3212015720
byte 4 1042701290
byte 4 1056964608
byte 4 3209632701
byte 4 1050556282
byte 4 1060597999
byte 4 3207496978
byte 4 1041705462
byte 4 1057396303
byte 4 3210331204
byte 4 0
byte 4 3195311787
byte 4 3210558317
byte 4 3202531056
byte 4 3204448256
byte 4 3209632701
byte 4 3198039930
byte 4 3196491359
byte 4 3212015720
byte 4 3190184938
byte 4 3210331204
byte 4 3204879951
byte 4 0
byte 4 3208081647
byte 4 3207496978
byte 4 3189189110
byte 4 3208081647
byte 4 3207496978
byte 4 1041705462
byte 4 3204879951
byte 4 3210331204
byte 4 0
byte 4 3204448256
byte 4 3209632701
byte 4 1050556282
byte 4 3195311787
byte 4 3210558317
byte 4 1055047408
byte 4 3196491359
byte 4 3212015720
byte 4 1042701290
byte 4 3210558317
byte 4 3202531056
byte 4 1047828139
byte 4 3209632701
byte 4 3198039930
byte 4 1056964608
byte 4 3207605577
byte 4 3205921044
byte 4 1054458931
byte 4 3207496978
byte 4 3189189110
byte 4 1060597999
byte 4 3202531056
byte 4 3195311787
byte 4 1063074669
byte 4 3205921044
byte 4 3201942579
byte 4 1060121929
byte 4 3198039930
byte 4 3204448256
byte 4 1062149053
byte 4 3189189110
byte 4 3208081647
byte 4 1060013330
byte 4 3201942579
byte 4 3207605577
byte 4 1058437396
byte 4 3190184938
byte 4 3196491359
byte 4 1064532072
byte 4 1055047408
byte 4 3195311787
byte 4 1063074669
byte 4 1042701290
byte 4 3196491359
byte 4 1064532072
byte 4 1050556282
byte 4 3204448256
byte 4 1062149053
byte 4 1041705462
byte 4 3208081647
byte 4 1060013330
byte 4 0
byte 4 3204879951
byte 4 1062847556
byte 4 1054458931
byte 4 3207605577
byte 4 1058437396
byte 4 1058437396
byte 4 3201942579
byte 4 1060121929
byte 4 1060121929
byte 4 3205921044
byte 4 1054458931
byte 4 3212088986
byte 4 1050094070
byte 4 0
byte 4 3212015720
byte 4 1042701290
byte 4 1049007711
byte 4 3212836864
byte 4 0
byte 4 0
byte 4 3210331204
byte 4 0
byte 4 1057396303
byte 4 3212088986
byte 4 3197577718
byte 4 0
byte 4 3212015720
byte 4 3190184938
byte 4 1049007711
byte 4 3210558317
byte 4 1055047408
byte 4 3195311787
byte 4 3212015720
byte 4 1042701290
byte 4 3196491359
byte 4 3209632701
byte 4 1050556282
byte 4 3204448256
byte 4 3210558317
byte 4 3202531056
byte 4 3195311787
byte 4 3212015720
byte 4 3190184938
byte 4 3196491359
byte 4 3209632701
byte 4 3198039930
byte 4 3204448256
byte 4 3207496978
byte 4 1041705462
byte 4 3208081647
byte 4 3207496978
byte 4 3189189110
byte 4 3208081647
byte 4 3210331204
byte 4 0
byte 4 3204879951
byte 4 3207605577
byte 4 1058437396
byte 4 3201942579
byte 4 3205921044
byte 4 1054458931
byte 4 3207605577
byte 4 3201942579
byte 4 1060121929
byte 4 3205921044
byte 4 3201942579
byte 4 3207605577
byte 4 3205921044
byte 4 3205921044
byte 4 3201942579
byte 4 3207605577
byte 4 3207605577
byte 4 3205921044
byte 4 3201942579
export Q_rand
code
proc Q_rand 4 0
file "../../../../src/qcommon/q_math.c"
line 151
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
;24:// q_math.c -- stateless support routines that are included in each code module
;25:
;26:// Some of the vector functions are static inline in q_shared.h. q3asm
;27:// doesn't understand static functions though, so we only want them in
;28:// one file. That's what this is about.
;29:#ifdef Q3_VM
;30:#define __Q3_VM_MATH
;31:#endif
;32:
;33:#include "q_shared.h"
;34:
;35:vec3_t	vec3_origin = {0,0,0};
;36:vec3_t	axisDefault[3] = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } };
;37:
;38:
;39:vec4_t		colorBlack	= {0, 0, 0, 1};
;40:vec4_t		colorRed	= {1, 0, 0, 1};
;41:vec4_t		colorGreen	= {0, 1, 0, 1};
;42:vec4_t		colorBlue	= {0, 0, 1, 1};
;43:vec4_t		colorYellow	= {1, 1, 0, 1};
;44:vec4_t		colorMagenta= {1, 0, 1, 1};
;45:vec4_t		colorCyan	= {0, 1, 1, 1};
;46:vec4_t		colorWhite	= {1, 1, 1, 1};
;47:vec4_t		colorLtGrey	= {0.75, 0.75, 0.75, 1};
;48:vec4_t		colorMdGrey	= {0.5, 0.5, 0.5, 1};
;49:vec4_t		colorDkGrey	= {0.25, 0.25, 0.25, 1};
;50:
;51:vec4_t	g_color_table[8] =
;52:	{
;53:	{0.0, 0.0, 0.0, 1.0},
;54:	{1.0, 0.0, 0.0, 1.0},
;55:	{0.0, 1.0, 0.0, 1.0},
;56:	{1.0, 1.0, 0.0, 1.0},
;57:	{0.0, 0.0, 1.0, 1.0},
;58:	{0.0, 1.0, 1.0, 1.0},
;59:	{1.0, 0.0, 1.0, 1.0},
;60:	{1.0, 1.0, 1.0, 1.0},
;61:	};
;62:
;63:
;64:vec3_t	bytedirs[NUMVERTEXNORMALS] =
;65:{
;66:{-0.525731f, 0.000000f, 0.850651f}, {-0.442863f, 0.238856f, 0.864188f}, 
;67:{-0.295242f, 0.000000f, 0.955423f}, {-0.309017f, 0.500000f, 0.809017f}, 
;68:{-0.162460f, 0.262866f, 0.951056f}, {0.000000f, 0.000000f, 1.000000f}, 
;69:{0.000000f, 0.850651f, 0.525731f}, {-0.147621f, 0.716567f, 0.681718f}, 
;70:{0.147621f, 0.716567f, 0.681718f}, {0.000000f, 0.525731f, 0.850651f}, 
;71:{0.309017f, 0.500000f, 0.809017f}, {0.525731f, 0.000000f, 0.850651f}, 
;72:{0.295242f, 0.000000f, 0.955423f}, {0.442863f, 0.238856f, 0.864188f}, 
;73:{0.162460f, 0.262866f, 0.951056f}, {-0.681718f, 0.147621f, 0.716567f}, 
;74:{-0.809017f, 0.309017f, 0.500000f},{-0.587785f, 0.425325f, 0.688191f}, 
;75:{-0.850651f, 0.525731f, 0.000000f},{-0.864188f, 0.442863f, 0.238856f}, 
;76:{-0.716567f, 0.681718f, 0.147621f},{-0.688191f, 0.587785f, 0.425325f}, 
;77:{-0.500000f, 0.809017f, 0.309017f}, {-0.238856f, 0.864188f, 0.442863f}, 
;78:{-0.425325f, 0.688191f, 0.587785f}, {-0.716567f, 0.681718f, -0.147621f}, 
;79:{-0.500000f, 0.809017f, -0.309017f}, {-0.525731f, 0.850651f, 0.000000f}, 
;80:{0.000000f, 0.850651f, -0.525731f}, {-0.238856f, 0.864188f, -0.442863f}, 
;81:{0.000000f, 0.955423f, -0.295242f}, {-0.262866f, 0.951056f, -0.162460f}, 
;82:{0.000000f, 1.000000f, 0.000000f}, {0.000000f, 0.955423f, 0.295242f}, 
;83:{-0.262866f, 0.951056f, 0.162460f}, {0.238856f, 0.864188f, 0.442863f}, 
;84:{0.262866f, 0.951056f, 0.162460f}, {0.500000f, 0.809017f, 0.309017f}, 
;85:{0.238856f, 0.864188f, -0.442863f},{0.262866f, 0.951056f, -0.162460f}, 
;86:{0.500000f, 0.809017f, -0.309017f},{0.850651f, 0.525731f, 0.000000f}, 
;87:{0.716567f, 0.681718f, 0.147621f}, {0.716567f, 0.681718f, -0.147621f}, 
;88:{0.525731f, 0.850651f, 0.000000f}, {0.425325f, 0.688191f, 0.587785f}, 
;89:{0.864188f, 0.442863f, 0.238856f}, {0.688191f, 0.587785f, 0.425325f}, 
;90:{0.809017f, 0.309017f, 0.500000f}, {0.681718f, 0.147621f, 0.716567f}, 
;91:{0.587785f, 0.425325f, 0.688191f}, {0.955423f, 0.295242f, 0.000000f}, 
;92:{1.000000f, 0.000000f, 0.000000f}, {0.951056f, 0.162460f, 0.262866f}, 
;93:{0.850651f, -0.525731f, 0.000000f},{0.955423f, -0.295242f, 0.000000f}, 
;94:{0.864188f, -0.442863f, 0.238856f}, {0.951056f, -0.162460f, 0.262866f}, 
;95:{0.809017f, -0.309017f, 0.500000f}, {0.681718f, -0.147621f, 0.716567f}, 
;96:{0.850651f, 0.000000f, 0.525731f}, {0.864188f, 0.442863f, -0.238856f}, 
;97:{0.809017f, 0.309017f, -0.500000f}, {0.951056f, 0.162460f, -0.262866f}, 
;98:{0.525731f, 0.000000f, -0.850651f}, {0.681718f, 0.147621f, -0.716567f}, 
;99:{0.681718f, -0.147621f, -0.716567f},{0.850651f, 0.000000f, -0.525731f}, 
;100:{0.809017f, -0.309017f, -0.500000f}, {0.864188f, -0.442863f, -0.238856f}, 
;101:{0.951056f, -0.162460f, -0.262866f}, {0.147621f, 0.716567f, -0.681718f}, 
;102:{0.309017f, 0.500000f, -0.809017f}, {0.425325f, 0.688191f, -0.587785f}, 
;103:{0.442863f, 0.238856f, -0.864188f}, {0.587785f, 0.425325f, -0.688191f}, 
;104:{0.688191f, 0.587785f, -0.425325f}, {-0.147621f, 0.716567f, -0.681718f}, 
;105:{-0.309017f, 0.500000f, -0.809017f}, {0.000000f, 0.525731f, -0.850651f}, 
;106:{-0.525731f, 0.000000f, -0.850651f}, {-0.442863f, 0.238856f, -0.864188f}, 
;107:{-0.295242f, 0.000000f, -0.955423f}, {-0.162460f, 0.262866f, -0.951056f}, 
;108:{0.000000f, 0.000000f, -1.000000f}, {0.295242f, 0.000000f, -0.955423f}, 
;109:{0.162460f, 0.262866f, -0.951056f}, {-0.442863f, -0.238856f, -0.864188f}, 
;110:{-0.309017f, -0.500000f, -0.809017f}, {-0.162460f, -0.262866f, -0.951056f}, 
;111:{0.000000f, -0.850651f, -0.525731f}, {-0.147621f, -0.716567f, -0.681718f}, 
;112:{0.147621f, -0.716567f, -0.681718f}, {0.000000f, -0.525731f, -0.850651f}, 
;113:{0.309017f, -0.500000f, -0.809017f}, {0.442863f, -0.238856f, -0.864188f}, 
;114:{0.162460f, -0.262866f, -0.951056f}, {0.238856f, -0.864188f, -0.442863f}, 
;115:{0.500000f, -0.809017f, -0.309017f}, {0.425325f, -0.688191f, -0.587785f}, 
;116:{0.716567f, -0.681718f, -0.147621f}, {0.688191f, -0.587785f, -0.425325f}, 
;117:{0.587785f, -0.425325f, -0.688191f}, {0.000000f, -0.955423f, -0.295242f}, 
;118:{0.000000f, -1.000000f, 0.000000f}, {0.262866f, -0.951056f, -0.162460f}, 
;119:{0.000000f, -0.850651f, 0.525731f}, {0.000000f, -0.955423f, 0.295242f}, 
;120:{0.238856f, -0.864188f, 0.442863f}, {0.262866f, -0.951056f, 0.162460f}, 
;121:{0.500000f, -0.809017f, 0.309017f}, {0.716567f, -0.681718f, 0.147621f}, 
;122:{0.525731f, -0.850651f, 0.000000f}, {-0.238856f, -0.864188f, -0.442863f}, 
;123:{-0.500000f, -0.809017f, -0.309017f}, {-0.262866f, -0.951056f, -0.162460f}, 
;124:{-0.850651f, -0.525731f, 0.000000f}, {-0.716567f, -0.681718f, -0.147621f}, 
;125:{-0.716567f, -0.681718f, 0.147621f}, {-0.525731f, -0.850651f, 0.000000f}, 
;126:{-0.500000f, -0.809017f, 0.309017f}, {-0.238856f, -0.864188f, 0.442863f}, 
;127:{-0.262866f, -0.951056f, 0.162460f}, {-0.864188f, -0.442863f, 0.238856f}, 
;128:{-0.809017f, -0.309017f, 0.500000f}, {-0.688191f, -0.587785f, 0.425325f}, 
;129:{-0.681718f, -0.147621f, 0.716567f}, {-0.442863f, -0.238856f, 0.864188f}, 
;130:{-0.587785f, -0.425325f, 0.688191f}, {-0.309017f, -0.500000f, 0.809017f}, 
;131:{-0.147621f, -0.716567f, 0.681718f}, {-0.425325f, -0.688191f, 0.587785f}, 
;132:{-0.162460f, -0.262866f, 0.951056f}, {0.442863f, -0.238856f, 0.864188f}, 
;133:{0.162460f, -0.262866f, 0.951056f}, {0.309017f, -0.500000f, 0.809017f}, 
;134:{0.147621f, -0.716567f, 0.681718f}, {0.000000f, -0.525731f, 0.850651f}, 
;135:{0.425325f, -0.688191f, 0.587785f}, {0.587785f, -0.425325f, 0.688191f}, 
;136:{0.688191f, -0.587785f, 0.425325f}, {-0.955423f, 0.295242f, 0.000000f}, 
;137:{-0.951056f, 0.162460f, 0.262866f}, {-1.000000f, 0.000000f, 0.000000f}, 
;138:{-0.850651f, 0.000000f, 0.525731f}, {-0.955423f, -0.295242f, 0.000000f}, 
;139:{-0.951056f, -0.162460f, 0.262866f}, {-0.864188f, 0.442863f, -0.238856f}, 
;140:{-0.951056f, 0.162460f, -0.262866f}, {-0.809017f, 0.309017f, -0.500000f}, 
;141:{-0.864188f, -0.442863f, -0.238856f}, {-0.951056f, -0.162460f, -0.262866f}, 
;142:{-0.809017f, -0.309017f, -0.500000f}, {-0.681718f, 0.147621f, -0.716567f}, 
;143:{-0.681718f, -0.147621f, -0.716567f}, {-0.850651f, 0.000000f, -0.525731f}, 
;144:{-0.688191f, 0.587785f, -0.425325f}, {-0.587785f, 0.425325f, -0.688191f}, 
;145:{-0.425325f, 0.688191f, -0.587785f}, {-0.425325f, -0.688191f, -0.587785f}, 
;146:{-0.587785f, -0.425325f, -0.688191f}, {-0.688191f, -0.587785f, -0.425325f}
;147:};
;148:
;149://==============================================================
;150:
;151:int		Q_rand( int *seed ) {
line 152
;152:	*seed = (69069 * *seed + 1);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 69069
ADDRLP4 0
INDIRP4
INDIRI4
MULI4
CNSTI4 1
ADDI4
ASGNI4
line 153
;153:	return *seed;
ADDRFP4 0
INDIRP4
INDIRI4
RETI4
LABELV $57
endproc Q_rand 4 0
export Q_random
proc Q_random 4 4
line 156
;154:}
;155:
;156:float	Q_random( int *seed ) {
line 157
;157:	return ( Q_rand( seed ) & 0xffff ) / (float)0x10000;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65535
BANDI4
CVIF4 4
CNSTF4 1199570944
DIVF4
RETF4
LABELV $58
endproc Q_random 4 4
export Q_crandom
proc Q_crandom 4 4
line 160
;158:}
;159:
;160:float	Q_crandom( int *seed ) {
line 161
;161:	return 2.0 * ( Q_random( seed ) - 0.5 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_random
CALLF4
ASGNF4
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
RETF4
LABELV $59
endproc Q_crandom 4 4
export ClampChar
proc ClampChar 0 0
line 166
;162:}
;163:
;164://=======================================================
;165:
;166:signed char ClampChar( int i ) {
line 167
;167:	if ( i < -128 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -128
GEI4 $61
line 168
;168:		return -128;
CNSTI4 -128
RETI4
ADDRGP4 $60
JUMPV
LABELV $61
line 170
;169:	}
;170:	if ( i > 127 ) {
ADDRFP4 0
INDIRI4
CNSTI4 127
LEI4 $63
line 171
;171:		return 127;
CNSTI4 127
RETI4
ADDRGP4 $60
JUMPV
LABELV $63
line 173
;172:	}
;173:	return i;
ADDRFP4 0
INDIRI4
CVII1 4
CVII4 1
RETI4
LABELV $60
endproc ClampChar 0 0
export ClampShort
proc ClampShort 0 0
line 176
;174:}
;175:
;176:signed short ClampShort( int i ) {
line 177
;177:	if ( i < -32768 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -32768
GEI4 $66
line 178
;178:		return -32768;
CNSTI4 -32768
RETI4
ADDRGP4 $65
JUMPV
LABELV $66
line 180
;179:	}
;180:	if ( i > 0x7fff ) {
ADDRFP4 0
INDIRI4
CNSTI4 32767
LEI4 $68
line 181
;181:		return 0x7fff;
CNSTI4 32767
RETI4
ADDRGP4 $65
JUMPV
LABELV $68
line 183
;182:	}
;183:	return i;
ADDRFP4 0
INDIRI4
CVII2 4
CVII4 2
RETI4
LABELV $65
endproc ClampShort 0 0
export DirToByte
proc DirToByte 24 0
line 188
;184:}
;185:
;186:
;187:// this isn't a real cheap function to call!
;188:int DirToByte( vec3_t dir ) {
line 192
;189:	int		i, best;
;190:	float	d, bestd;
;191:
;192:	if ( !dir ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $71
line 193
;193:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $70
JUMPV
LABELV $71
line 196
;194:	}
;195:
;196:	bestd = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 197
;197:	best = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 198
;198:	for (i=0 ; i<NUMVERTEXNORMALS ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $73
line 199
;199:	{
line 200
;200:		d = DotProduct (dir, bytedirs[i]);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs
ADDP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 201
;201:		if (d > bestd)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $79
line 202
;202:		{
line 203
;203:			bestd = d;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 204
;204:			best = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 205
;205:		}
LABELV $79
line 206
;206:	}
LABELV $74
line 198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 162
LTI4 $73
line 208
;207:
;208:	return best;
ADDRLP4 12
INDIRI4
RETI4
LABELV $70
endproc DirToByte 24 0
export ByteToDir
proc ByteToDir 4 0
line 211
;209:}
;210:
;211:void ByteToDir( int b, vec3_t dir ) {
line 212
;212:	if ( b < 0 || b >= NUMVERTEXNORMALS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 162
LTI4 $82
LABELV $84
line 213
;213:		VectorCopy( vec3_origin, dir );
ADDRFP4 4
INDIRP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 214
;214:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 216
;215:	}
;216:	VectorCopy (bytedirs[b], dir);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bytedirs
ADDP4
INDIRB
ASGNB 12
line 217
;217:}
LABELV $81
endproc ByteToDir 4 0
export ColorBytes3
proc ColorBytes3 40 0
line 220
;218:
;219:
;220:unsigned ColorBytes3 (float r, float g, float b) {
line 223
;221:	unsigned	i;
;222:
;223:	( (byte *)&i )[0] = r * 255;
ADDRLP4 8
CNSTF4 1132396544
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
CNSTF4 1325400064
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
LTF4 $87
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $88
JUMPV
LABELV $87
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $88
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUU1 4
ASGNU1
line 224
;224:	( (byte *)&i )[1] = g * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
CNSTF4 1325400064
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $91
ADDRLP4 16
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 16
ADDRLP4 20
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $92
ADDRLP4 0+1
ADDRLP4 16
INDIRU4
CVUU1 4
ASGNU1
line 225
;225:	( (byte *)&i )[2] = b * 255;
ADDRLP4 32
CNSTF4 1132396544
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $95
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $96
ADDRLP4 0+2
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 227
;226:
;227:	return i;
ADDRLP4 0
INDIRU4
RETU4
LABELV $85
endproc ColorBytes3 40 0
export ColorBytes4
proc ColorBytes4 52 0
line 230
;228:}
;229:
;230:unsigned ColorBytes4 (float r, float g, float b, float a) {
line 233
;231:	unsigned	i;
;232:
;233:	( (byte *)&i )[0] = r * 255;
ADDRLP4 8
CNSTF4 1132396544
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
CNSTF4 1325400064
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
LTF4 $99
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $100
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUU1 4
ASGNU1
line 234
;234:	( (byte *)&i )[1] = g * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
CNSTF4 1325400064
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $103
ADDRLP4 16
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 16
ADDRLP4 20
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $104
ADDRLP4 0+1
ADDRLP4 16
INDIRU4
CVUU1 4
ASGNU1
line 235
;235:	( (byte *)&i )[2] = b * 255;
ADDRLP4 32
CNSTF4 1132396544
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $107
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $108
ADDRLP4 0+2
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 236
;236:	( (byte *)&i )[3] = a * 255;
ADDRLP4 44
CNSTF4 1132396544
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 48
CNSTF4 1325400064
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
LTF4 $111
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $112
JUMPV
LABELV $111
ADDRLP4 40
ADDRLP4 44
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $112
ADDRLP4 0+3
ADDRLP4 40
INDIRU4
CVUU1 4
ASGNU1
line 238
;237:
;238:	return i;
ADDRLP4 0
INDIRU4
RETU4
LABELV $97
endproc ColorBytes4 52 0
export NormalizeColor
proc NormalizeColor 12 0
line 241
;239:}
;240:
;241:float NormalizeColor( const vec3_t in, vec3_t out ) {
line 244
;242:	float	max;
;243:	
;244:	max = in[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 245
;245:	if ( in[1] > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $114
line 246
;246:		max = in[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 247
;247:	}
LABELV $114
line 248
;248:	if ( in[2] > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $116
line 249
;249:		max = in[2];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 250
;250:	}
LABELV $116
line 252
;251:
;252:	if ( !max ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
NEF4 $118
line 253
;253:		VectorClear( out );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 254
;254:	} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 255
;255:		out[0] = in[0] / max;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 256
;256:		out[1] = in[1] / max;
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 4
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
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 257
;257:		out[2] = in[2] / max;
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 258
;258:	}
LABELV $119
line 259
;259:	return max;
ADDRLP4 0
INDIRF4
RETF4
LABELV $113
endproc NormalizeColor 12 0
export PlaneFromPoints
proc PlaneFromPoints 76 12
line 271
;260:}
;261:
;262:
;263:/*
;264:=====================
;265:PlaneFromPoints
;266:
;267:Returns false if the triangle is degenrate.
;268:The normal will point out of the clock for clockwise ordered points
;269:=====================
;270:*/
;271:qboolean PlaneFromPoints( vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c ) {
line 274
;272:	vec3_t	d1, d2;
;273:
;274:	VectorSubtract( b, a, d1 );
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 275
;275:	VectorSubtract( c, a, d2 );
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 12
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 276
;276:	CrossProduct( d2, d1, plane );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 277
;277:	if ( VectorNormalize( plane ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
NEF4 $125
line 278
;278:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $120
JUMPV
LABELV $125
line 281
;279:	}
;280:
;281:	plane[3] = DotProduct( a, plane );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 282
;282:	return qtrue;
CNSTI4 1
RETI4
LABELV $120
endproc PlaneFromPoints 76 12
export RotatePointAroundVector
proc RotatePointAroundVector 136 4
line 293
;283:}
;284:
;285:/*
;286:===============
;287:RotatePointAroundVector
;288:
;289:This is not implemented very well...
;290:===============
;291:*/
;292:void RotatePointAroundVector( vec3_t dst, const vec3_t dir, const vec3_t point,
;293:							 float degrees ) {
line 308
;294:	float sin_a;
;295:	float cos_a;
;296:	float cos_ia;
;297:	float i_i_ia;
;298:	float j_j_ia;
;299:	float k_k_ia;
;300:	float i_j_ia;
;301:	float i_k_ia;
;302:	float j_k_ia;
;303:	float a_sin;
;304:	float b_sin;
;305:	float c_sin;
;306:	float rot[3][3];
;307:
;308:	cos_ia = DEG2RAD(degrees);
ADDRLP4 36
CNSTF4 1078530011
ADDRFP4 12
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ASGNF4
line 309
;309:	sin_a = sin(cos_ia);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 84
INDIRF4
ASGNF4
line 310
;310:	cos_a = cos(cos_ia);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 88
INDIRF4
ASGNF4
line 311
;311:	cos_ia = 1.0F - cos_a;
ADDRLP4 36
CNSTF4 1065353216
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
line 313
;312:
;313:	i_i_ia = dir[0] * dir[0] * cos_ia;
ADDRLP4 92
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 92
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 314
;314:	j_j_ia = dir[1] * dir[1] * cos_ia;
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 96
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 315
;315:	k_k_ia = dir[2] * dir[2] * cos_ia;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 80
ADDRLP4 100
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 316
;316:	i_j_ia = dir[0] * dir[1] * cos_ia;
ADDRLP4 104
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 317
;317:	i_k_ia = dir[0] * dir[2] * cos_ia;
ADDRLP4 108
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 318
;318:	j_k_ia = dir[1] * dir[2] * cos_ia;
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 320
;319:
;320:	a_sin = dir[0] * sin_a;
ADDRLP4 60
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 321
;321:	b_sin = dir[1] * sin_a;
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 322
;322:	c_sin = dir[2] * sin_a;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 324
;323:
;324:	rot[0][0] = i_i_ia + cos_a;
ADDRLP4 0
ADDRLP4 72
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ASGNF4
line 325
;325:	rot[0][1] = i_j_ia - c_sin;
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 326
;326:	rot[0][2] = i_k_ia + b_sin;
ADDRLP4 0+8
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
ASGNF4
line 327
;327:	rot[1][0] = i_j_ia + c_sin;
ADDRLP4 0+12
ADDRLP4 48
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 328
;328:	rot[1][1] = j_j_ia + cos_a;
ADDRLP4 0+12+4
ADDRLP4 76
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ASGNF4
line 329
;329:	rot[1][2] = j_k_ia - a_sin;
ADDRLP4 0+12+8
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ASGNF4
line 330
;330:	rot[2][0] = i_k_ia - b_sin;
ADDRLP4 0+24
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ASGNF4
line 331
;331:	rot[2][1] = j_k_ia + a_sin;
ADDRLP4 0+24+4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
ADDF4
ASGNF4
line 332
;332:	rot[2][2] = k_k_ia + cos_a;
ADDRLP4 0+24+8
ADDRLP4 80
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ASGNF4
line 334
;333:
;334:	dst[0] = point[0] * rot[0][0] + point[1] * rot[0][1] + point[2] * rot[0][2];
ADDRLP4 116
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 335
;335:	dst[1] = point[0] * rot[1][0] + point[1] * rot[1][1] + point[2] * rot[1][2];
ADDRLP4 120
CNSTI4 4
ASGNI4
ADDRLP4 124
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
MULF4
ADDRLP4 124
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 124
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 336
;336:	dst[2] = point[0] * rot[2][0] + point[1] * rot[2][1] + point[2] * rot[2][2];
ADDRLP4 128
CNSTI4 8
ASGNI4
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 132
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 132
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 337
;337:}
LABELV $127
endproc RotatePointAroundVector 136 4
export RotateAroundDirection
proc RotateAroundDirection 60 12
line 344
;338:
;339:/*
;340:===============
;341:RotateAroundDirection
;342:===============
;343:*/
;344:void RotateAroundDirection( vec3_t axis[3], vec_t angle ) {
line 347
;345:	vec_t scale;
;346:
;347:	angle = DEG2RAD( angle );
ADDRFP4 4
CNSTF4 1078530011
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ASGNF4
line 350
;348:
;349:	// create an arbitrary axis[1]
;350:	PerpendicularVector( axis[ 1 ], axis[ 0 ] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 353
;351:
;352:	// cross to get axis[2]
;353:	CrossProduct( axis[ 0 ], axis[ 1 ], axis[ 2 ] );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 356
;354:
;355:	// rotate
;356:	scale = cos( angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 357
;357:	VectorScale( axis[ 1 ], scale, axis[ 1 ] );
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 359
;358:
;359:	scale = sin( angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 360
;360:	VectorMA( axis[ 1 ], scale, axis[ 2 ], axis[ 1 ] );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
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
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 363
;361:
;362:	// recalculate axis[2]
;363:	CrossProduct( axis[ 0 ], axis[ 1 ], axis[ 2 ] );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 364
;364:}
LABELV $152
endproc RotateAroundDirection 60 12
export RotateAroundAxe
proc RotateAroundAxe 20 16
line 368
;365:
;366:void
;367:RotateAroundAxe(vec3_t axis[3], vec_t angle)
;368:{
line 371
;369:     // create an arbitrary axis[1]
;370:
;371:     PerpendicularVector( axis[1], axis[0] );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 374
;372:
;373:     // rotate it around axis[0] by yaw
;374:     if ( angle ) {
ADDRFP4 4
INDIRF4
CNSTF4 0
EQF4 $154
line 379
;375:       vec3_t  temp;
;376:
;377:       //VectorCopy( axis[1], temp );
;378:
;379:       VectorCopy( axis[1], temp);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 381
;380:
;381:       RotatePointAroundVector( axis[1], axis[0], temp, angle );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 382
;382:     }
LABELV $154
line 385
;383:
;384:     // cross to get axis[2]
;385:     CrossProduct( axis[0], axis[1], axis[2] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 413
;386:
;387:
;388://  vec_t scale;
;389://
;390://  angle = DEG2RAD( angle );
;391://
;392://
;393://  //Sooooo 1 and 2 are all based on on 0...
;394://  VectorClear(axis[1]);
;395://  VectorClear(axis[2]);
;396://
;397://
;398://  // create an arbitrary axis[1]
;399://  PerpendicularVector( axis[ 1 ], axis[ 0 ] );
;400://
;401://  // cross to get axis[2]
;402://  CrossProduct( axis[ 0 ], axis[ 1 ], axis[ 2 ] );
;403://
;404://  // rotate
;405://  scale = cos( angle );
;406://  VectorScale( axis[ 1 ], scale, axis[ 1 ] );
;407://
;408://  scale = sin( angle );
;409://  VectorMA( axis[ 1 ], scale, axis[ 2 ], axis[ 1 ] );
;410://
;411://  // recalculate axis[2]
;412://  CrossProduct( axis[ 0 ], axis[ 1 ], axis[ 2 ] );
;413:}
LABELV $153
endproc RotateAroundAxe 20 16
export vectoangles
proc vectoangles 40 8
line 417
;414:
;415:
;416:
;417:void vectoangles( const vec3_t value1, vec3_t angles ) {
line 421
;418:	float	forward;
;419:	float	yaw, pitch;
;420:	
;421:	if ( value1[1] == 0 && value1[0] == 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $157
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $157
line 422
;422:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 423
;423:		if ( value1[2] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
LEF4 $159
line 424
;424:			pitch = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 425
;425:		}
ADDRGP4 $158
JUMPV
LABELV $159
line 426
;426:		else {
line 427
;427:			pitch = 270;
ADDRLP4 4
CNSTF4 1132920832
ASGNF4
line 428
;428:		}
line 429
;429:	}
ADDRGP4 $158
JUMPV
LABELV $157
line 430
;430:	else {
line 431
;431:		if ( value1[0] ) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $161
line 432
;432:			yaw = ( atan2 ( value1[1], value1[0] ) * 180 / M_PI );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 433
;433:		}
ADDRGP4 $162
JUMPV
LABELV $161
line 434
;434:		else if ( value1[1] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $163
line 435
;435:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 436
;436:		}
ADDRGP4 $164
JUMPV
LABELV $163
line 437
;437:		else {
line 438
;438:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 439
;439:		}
LABELV $164
LABELV $162
line 440
;440:		if ( yaw < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $165
line 441
;441:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 442
;442:		}
LABELV $165
line 444
;443:
;444:		forward = sqrt ( value1[0]*value1[0] + value1[1]*value1[1] );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 445
;445:		pitch = ( atan2(value1[2], forward) * 180 / M_PI );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1127481344
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 446
;446:		if ( pitch < 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $167
line 447
;447:			pitch += 360;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 448
;448:		}
LABELV $167
line 449
;449:	}
LABELV $158
line 451
;450:
;451:	angles[PITCH] = -pitch;
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRF4
NEGF4
ASGNF4
line 452
;452:	angles[YAW] = yaw;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 453
;453:	angles[ROLL] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 454
;454:}
LABELV $156
endproc vectoangles 40 8
export AxisToAngles
proc AxisToAngles 52 8
line 465
;455:
;456:
;457:/*
;458:=================
;459:AxisToAngles
;460:
;461:Takes an axis (forward + right + up)
;462:and returns angles -- including a roll
;463:=================
;464:*/
;465:void AxisToAngles( vec3_t axis[3], vec3_t angles ) {
line 467
;466:	float length1;
;467:	float yaw, pitch, roll = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 469
;468:
;469:	if ( axis[0][1] == 0 && axis[0][0] == 0 ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
NEF4 $170
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
NEF4 $170
line 470
;470:		yaw = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 471
;471:		if ( axis[0][2] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
LEF4 $172
line 472
;472:			pitch = 90;
ADDRLP4 8
CNSTF4 1119092736
ASGNF4
line 473
;473:		}
ADDRGP4 $171
JUMPV
LABELV $172
line 474
;474:		else {
line 475
;475:			pitch = 270;
ADDRLP4 8
CNSTF4 1132920832
ASGNF4
line 476
;476:		}
line 477
;477:	}
ADDRGP4 $171
JUMPV
LABELV $170
line 478
;478:	else {
line 479
;479:		if ( axis[0][0] ) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $174
line 480
;480:			yaw = ( atan2 ( axis[0][1], axis[0][0] ) * 180 / M_PI );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1127481344
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 481
;481:		}
ADDRGP4 $175
JUMPV
LABELV $174
line 482
;482:		else if ( axis[0][1] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $176
line 483
;483:			yaw = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 484
;484:		}
ADDRGP4 $177
JUMPV
LABELV $176
line 485
;485:		else {
line 486
;486:			yaw = 270;
ADDRLP4 4
CNSTF4 1132920832
ASGNF4
line 487
;487:		}
LABELV $177
LABELV $175
line 488
;488:		if ( yaw < 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $178
line 489
;489:			yaw += 360;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 490
;490:		}
LABELV $178
line 492
;491:
;492:		length1 = sqrt ( axis[0][0]*axis[0][0] + axis[0][1]*axis[0][1] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 36
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 493
;493:		pitch = ( atan2(axis[0][2], length1) * 180 / M_PI );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 8
CNSTF4 1127481344
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 494
;494:		if ( pitch < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $180
line 495
;495:			pitch += 360;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 496
;496:		}
LABELV $180
line 498
;497:
;498:		roll = ( atan2( axis[1][2], axis[2][2] ) * 180 / M_PI );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 499
;499:		if ( roll < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $182
line 500
;500:			roll += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 501
;501:		}
LABELV $182
line 502
;502:	}
LABELV $171
line 504
;503:
;504:	angles[PITCH] = -pitch;
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
line 505
;505:	angles[YAW] = yaw;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 506
;506:	angles[ROLL] = roll;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 507
;507:}
LABELV $169
endproc AxisToAngles 52 8
export AnglesToAxis
proc AnglesToAxis 16 16
line 514
;508:
;509:/*
;510:=================
;511:AnglesToAxis
;512:=================
;513:*/
;514:void AnglesToAxis( const vec3_t angles, vec3_t axis[3] ) {
line 518
;515:	vec3_t	right;
;516:
;517:	// angle vectors returns "right" instead of "y axis"
;518:	AngleVectors( angles, axis[0], right, axis[2] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 519
;519:	VectorSubtract( vec3_origin, right, axis[1] );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 520
;520:}
LABELV $184
endproc AnglesToAxis 16 16
export AxisClear
proc AxisClear 0 0
line 522
;521:
;522:void AxisClear( vec3_t axis[3] ) {
line 523
;523:	axis[0][0] = 1;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 524
;524:	axis[0][1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 525
;525:	axis[0][2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 526
;526:	axis[1][0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 0
ASGNF4
line 527
;527:	axis[1][1] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ASGNF4
line 528
;528:	axis[1][2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 0
ASGNF4
line 529
;529:	axis[2][0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 0
ASGNF4
line 530
;530:	axis[2][1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 0
ASGNF4
line 531
;531:	axis[2][2] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1065353216
ASGNF4
line 532
;532:}
LABELV $189
endproc AxisClear 0 0
export AxisCopy
proc AxisCopy 8 0
line 534
;533:
;534:void AxisCopy( vec3_t in[3], vec3_t out[3] ) {
line 535
;535:	VectorCopy( in[0], out[0] );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 536
;536:	VectorCopy( in[1], out[1] );
ADDRLP4 0
CNSTI4 12
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 537
;537:	VectorCopy( in[2], out[2] );
ADDRLP4 4
CNSTI4 24
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 538
;538:}
LABELV $190
endproc AxisCopy 8 0
export ProjectPointOnPlane
proc ProjectPointOnPlane 60 0
line 541
;539:
;540:void ProjectPointOnPlane( vec3_t dst, const vec3_t p, const vec3_t normal )
;541:{
line 546
;542:	float d;
;543:	vec3_t n;
;544:	float inv_denom;
;545:
;546:	inv_denom = 1.0f / DotProduct( normal, normal );
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
DIVF4
ASGNF4
line 550
;547:#ifndef Q3_VM
;548:	assert( Q_fabs(inv_denom) != 0.0f ); // bk010122 - zero vectors get here
;549:#endif
;550:	inv_denom = 1.0f / inv_denom;
ADDRLP4 0
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 552
;551:
;552:	d = DotProduct( normal, p ) * inv_denom;
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 554
;553:
;554:	n[0] = normal[0] * inv_denom;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 555
;555:	n[1] = normal[1] * inv_denom;
ADDRLP4 4+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 556
;556:	n[2] = normal[2] * inv_denom;
ADDRLP4 4+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 558
;557:
;558:	dst[0] = p[0] - d * n[0];
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 559
;559:	dst[1] = p[1] - d * n[1];
ADDRLP4 52
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 560
;560:	dst[2] = p[2] - d * n[2];
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 561
;561:}
LABELV $191
endproc ProjectPointOnPlane 60 0
export MakeNormalVectors
proc MakeNormalVectors 40 12
line 571
;562:
;563:/*
;564:================
;565:MakeNormalVectors
;566:
;567:Given a normalized forward vector, create two
;568:other perpendicular vectors
;569:================
;570:*/
;571:void MakeNormalVectors( const vec3_t forward, vec3_t right, vec3_t up) {
line 576
;572:	float		d;
;573:
;574:	// this rotate and negate guarantees a vector
;575:	// not colinear with the original
;576:	right[1] = -forward[0];
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 577
;577:	right[2] = forward[1];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 578
;578:	right[0] = forward[2];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 580
;579:
;580:	d = DotProduct (right, forward);
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 581
;581:	VectorMA (right, -d, forward, right);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 582
;582:	VectorNormalize (right);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 583
;583:	CrossProduct (right, forward, up);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 584
;584:}
LABELV $196
endproc MakeNormalVectors 40 12
export VectorRotate
proc VectorRotate 40 0
line 588
;585:
;586:
;587:void VectorRotate( vec3_t in, vec3_t matrix[3], vec3_t out )
;588:{
line 589
;589:	out[0] = DotProduct( in, matrix[0] );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 590
;590:	out[1] = DotProduct( in, matrix[1] );
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 591
;591:	out[2] = DotProduct( in, matrix[2] );
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 592
;592:}
LABELV $197
endproc VectorRotate 40 0
export Q_rsqrt
proc Q_rsqrt 20 0
line 601
;593:
;594://============================================================================
;595:
;596:#if !idppc
;597:/*
;598:** float q_rsqrt( float number )
;599:*/
;600:float Q_rsqrt( float number )
;601:{
line 607
;602:	union {
;603:		float f;
;604:		int i;
;605:	} t;
;606:	float x2, y;
;607:	const float threehalfs = 1.5F;
ADDRLP4 12
CNSTF4 1069547520
ASGNF4
line 609
;608:
;609:	x2 = number * 0.5F;
ADDRLP4 8
CNSTF4 1056964608
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
line 610
;610:	t.f  = number;
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
line 611
;611:	t.i  = 0x5f3759df - ( t.i >> 1 );               // what the fuck?
ADDRLP4 4
CNSTI4 1597463007
ADDRLP4 4
INDIRI4
CNSTI4 1
RSHI4
SUBI4
ASGNI4
line 612
;612:	y  = t.f;
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 613
;613:	y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 617
;614://	y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
;615:
;616:	//assert( !isnan(y) ); // bk010122 - FPE?
;617:	return y;
ADDRLP4 0
INDIRF4
RETF4
LABELV $198
endproc Q_rsqrt 20 0
export Q_fabs
proc Q_fabs 4 0
line 620
;618:}
;619:
;620:float Q_fabs( float f ) {
line 621
;621:	int tmp = * ( int * ) &f;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 622
;622:	tmp &= 0x7FFFFFFF;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2147483647
BANDI4
ASGNI4
line 623
;623:	return * ( float * ) &tmp;
ADDRLP4 0
INDIRF4
RETF4
LABELV $200
endproc Q_fabs 4 0
export LerpAngle
proc LerpAngle 8 0
line 635
;624:}
;625:#endif
;626:
;627://============================================================
;628:
;629:/*
;630:===============
;631:LerpAngle
;632:
;633:===============
;634:*/
;635:float LerpAngle (float from, float to, float frac) {
line 638
;636:	float	a;
;637:
;638:	if ( to - from > 180 ) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
CNSTF4 1127481344
LEF4 $202
line 639
;639:		to -= 360;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 640
;640:	}
LABELV $202
line 641
;641:	if ( to - from < -180 ) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
CNSTF4 3274964992
GEF4 $204
line 642
;642:		to += 360;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 643
;643:	}
LABELV $204
line 644
;644:	a = from + frac * (to - from);
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 646
;645:
;646:	return a;
ADDRLP4 0
INDIRF4
RETF4
LABELV $201
endproc LerpAngle 8 0
export AngleSubtract
proc AngleSubtract 4 0
line 657
;647:}
;648:
;649:
;650:/*
;651:=================
;652:AngleSubtract
;653:
;654:Always returns a value from -180 to 180
;655:=================
;656:*/
;657:float	AngleSubtract( float a1, float a2 ) {
line 660
;658:	float	a;
;659:
;660:	a = a1 - a2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $208
JUMPV
LABELV $207
line 661
;661:	while ( a > 180 ) {
line 662
;662:		a -= 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 663
;663:	}
LABELV $208
line 661
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
GTF4 $207
ADDRGP4 $211
JUMPV
LABELV $210
line 664
;664:	while ( a < -180 ) {
line 665
;665:		a += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 666
;666:	}
LABELV $211
line 664
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
LTF4 $210
line 667
;667:	return a;
ADDRLP4 0
INDIRF4
RETF4
LABELV $206
endproc AngleSubtract 4 0
export AnglesSubtract
proc AnglesSubtract 20 8
line 671
;668:}
;669:
;670:
;671:void AnglesSubtract( vec3_t v1, vec3_t v2, vec3_t v3 ) {
line 672
;672:	v3[0] = AngleSubtract( v1[0], v2[0] );
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRF4
ASGNF4
line 673
;673:	v3[1] = AngleSubtract( v1[1], v2[1] );
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 674
;674:	v3[2] = AngleSubtract( v1[2], v2[2] );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 675
;675:}
LABELV $213
endproc AnglesSubtract 20 8
export AngleMod
proc AngleMod 0 0
line 678
;676:
;677:
;678:float	AngleMod(float a) {
line 679
;679:	a = (360.0/65536) * ((int)(a*(65536/360.0)) & 65535);
ADDRFP4 0
CNSTF4 1001652224
CNSTF4 1127615329
ADDRFP4 0
INDIRF4
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
MULF4
ASGNF4
line 680
;680:	return a;
ADDRFP4 0
INDIRF4
RETF4
LABELV $214
endproc AngleMod 0 0
export AngleNormalize360
proc AngleNormalize360 0 0
line 691
;681:}
;682:
;683:
;684:/*
;685:=================
;686:AngleNormalize360
;687:
;688:returns angle normalized to the range [0 <= angle < 360]
;689:=================
;690:*/
;691:float AngleNormalize360 ( float angle ) {
line 692
;692:	return (360.0 / 65536) * ((int)(angle * (65536 / 360.0)) & 65535);
CNSTF4 1001652224
CNSTF4 1127615329
ADDRFP4 0
INDIRF4
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
MULF4
RETF4
LABELV $215
endproc AngleNormalize360 0 0
export AngleNormalize180
proc AngleNormalize180 4 4
line 703
;693:}
;694:
;695:
;696:/*
;697:=================
;698:AngleNormalize180
;699:
;700:returns angle normalized to the range [-180 < angle <= 180]
;701:=================
;702:*/
;703:float AngleNormalize180 ( float angle ) {
line 704
;704:	angle = AngleNormalize360( angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 705
;705:	if ( angle > 180.0 ) {
ADDRFP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $217
line 706
;706:		angle -= 360.0;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 707
;707:	}
LABELV $217
line 708
;708:	return angle;
ADDRFP4 0
INDIRF4
RETF4
LABELV $216
endproc AngleNormalize180 4 4
export AngleDelta
proc AngleDelta 4 4
line 719
;709:}
;710:
;711:
;712:/*
;713:=================
;714:AngleDelta
;715:
;716:returns the normalized delta from angle1 to angle2
;717:=================
;718:*/
;719:float AngleDelta ( float angle1, float angle2 ) {
line 720
;720:	return AngleNormalize180( angle1 - angle2 );
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $219
endproc AngleDelta 4 4
export SetPlaneSignbits
proc SetPlaneSignbits 8 0
line 732
;721:}
;722:
;723:
;724://============================================================
;725:
;726:
;727:/*
;728:=================
;729:SetPlaneSignbits
;730:=================
;731:*/
;732:void SetPlaneSignbits (cplane_t *out) {
line 736
;733:	int	bits, j;
;734:
;735:	// for fast box on planeside test
;736:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 737
;737:	for (j=0 ; j<3 ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $221
line 738
;738:		if (out->normal[j] < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $225
line 739
;739:			bits |= 1<<j;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 740
;740:		}
LABELV $225
line 741
;741:	}
LABELV $222
line 737
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $221
line 742
;742:	out->signbits = bits;
ADDRFP4 0
INDIRP4
CNSTI4 17
ADDP4
ADDRLP4 4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 743
;743:}
LABELV $220
endproc SetPlaneSignbits 8 0
export BoxOnPlaneSide
proc BoxOnPlaneSide 280 0
line 790
;744:
;745:
;746:/*
;747:==================
;748:BoxOnPlaneSide
;749:
;750:Returns 1, 2, or 1 + 2
;751:
;752:// this is the slow, general version
;753:int BoxOnPlaneSide2 (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;754:{
;755:	int		i;
;756:	float	dist1, dist2;
;757:	int		sides;
;758:	vec3_t	corners[2];
;759:
;760:	for (i=0 ; i<3 ; i++)
;761:	{
;762:		if (p->normal[i] < 0)
;763:		{
;764:			corners[0][i] = emins[i];
;765:			corners[1][i] = emaxs[i];
;766:		}
;767:		else
;768:		{
;769:			corners[1][i] = emins[i];
;770:			corners[0][i] = emaxs[i];
;771:		}
;772:	}
;773:	dist1 = DotProduct (p->normal, corners[0]) - p->dist;
;774:	dist2 = DotProduct (p->normal, corners[1]) - p->dist;
;775:	sides = 0;
;776:	if (dist1 >= 0)
;777:		sides = 1;
;778:	if (dist2 < 0)
;779:		sides |= 2;
;780:
;781:	return sides;
;782:}
;783:
;784:==================
;785:*/
;786:
;787:#if !id386
;788:
;789:int BoxOnPlaneSide (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;790:{
line 795
;791:	float	dist1, dist2;
;792:	int		sides;
;793:
;794:// fast axial cases
;795:	if (p->type < 3)
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 3
GEI4 $228
line 796
;796:	{
line 797
;797:		if (p->dist <= emins[p->type])
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $230
line 798
;798:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $227
JUMPV
LABELV $230
line 799
;799:		if (p->dist >= emaxs[p->type])
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
LTF4 $232
line 800
;800:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $227
JUMPV
LABELV $232
line 801
;801:		return 3;
CNSTI4 3
RETI4
ADDRGP4 $227
JUMPV
LABELV $228
line 805
;802:	}
;803:
;804:// general case
;805:	switch (p->signbits)
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 17
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $234
ADDRLP4 12
INDIRI4
CNSTI4 7
GTI4 $234
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $245
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $245
address $237
address $238
address $239
address $240
address $241
address $242
address $243
address $244
code
line 806
;806:	{
LABELV $237
line 808
;807:	case 0:
;808:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 20
ADDRFP4 8
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
ADDRLP4 4
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
ASGNF4
line 809
;809:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 810
;810:		break;
ADDRGP4 $235
JUMPV
LABELV $238
line 812
;811:	case 1:
;812:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 813
;813:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 68
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 68
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 68
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 814
;814:		break;
ADDRGP4 $235
JUMPV
LABELV $239
line 816
;815:	case 2:
;816:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 96
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRF4
MULF4
ADDRLP4 84
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 817
;817:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 100
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 4
ASGNI4
ADDRLP4 112
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDRLP4 100
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 100
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 818
;818:		break;
ADDRGP4 $235
JUMPV
LABELV $240
line 820
;819:	case 3:
;820:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 116
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 4
ASGNI4
ADDRLP4 128
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 120
INDIRP4
INDIRF4
MULF4
ADDRLP4 116
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 116
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 821
;821:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 140
CNSTI4 4
ASGNI4
ADDRLP4 144
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 136
INDIRP4
INDIRF4
MULF4
ADDRLP4 132
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
ADDRLP4 136
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 822
;822:		break;
ADDRGP4 $235
JUMPV
LABELV $241
line 824
;823:	case 4:
;824:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 148
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTI4 4
ASGNI4
ADDRLP4 160
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ADDRLP4 148
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 148
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 825
;825:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 4
ASGNI4
ADDRLP4 176
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 168
INDIRP4
INDIRF4
MULF4
ADDRLP4 164
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRF4
ADDRLP4 168
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 164
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 826
;826:		break;
ADDRGP4 $235
JUMPV
LABELV $242
line 828
;827:	case 5:
;828:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 180
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
CNSTI4 4
ASGNI4
ADDRLP4 192
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 184
INDIRP4
INDIRF4
MULF4
ADDRLP4 180
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 180
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 184
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 829
;829:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 196
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 200
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 204
CNSTI4 4
ASGNI4
ADDRLP4 208
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 200
INDIRP4
INDIRF4
MULF4
ADDRLP4 196
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 196
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 200
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 830
;830:		break;
ADDRGP4 $235
JUMPV
LABELV $243
line 832
;831:	case 6:
;832:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 212
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 216
CNSTI4 4
ASGNI4
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 212
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 212
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 212
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 833
;833:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 232
CNSTI4 4
ASGNI4
ADDRLP4 236
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 240
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 228
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ADDRLP4 228
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 228
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 834
;834:		break;
ADDRGP4 $235
JUMPV
LABELV $244
line 836
;835:	case 7:
;836:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 244
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 4
ASGNI4
ADDRLP4 256
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 244
INDIRP4
INDIRF4
ADDRLP4 248
INDIRP4
INDIRF4
MULF4
ADDRLP4 244
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
ADDRLP4 248
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 244
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
ADDRLP4 248
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 837
;837:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 260
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 268
CNSTI4 4
ASGNI4
ADDRLP4 272
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 260
INDIRP4
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
MULF4
ADDRLP4 260
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 260
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 838
;838:		break;
ADDRGP4 $235
JUMPV
LABELV $234
line 840
;839:	default:
;840:		dist1 = dist2 = 0;		// shut up compiler
ADDRLP4 276
CNSTF4 0
ASGNF4
ADDRLP4 8
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 276
INDIRF4
ASGNF4
line 841
;841:		break;
LABELV $235
line 844
;842:	}
;843:
;844:	sides = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 845
;845:	if (dist1 >= p->dist)
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
LTF4 $246
line 846
;846:		sides = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $246
line 847
;847:	if (dist2 < p->dist)
ADDRLP4 8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
GEF4 $248
line 848
;848:		sides |= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $248
line 850
;849:
;850:	return sides;
ADDRLP4 0
INDIRI4
RETI4
LABELV $227
endproc BoxOnPlaneSide 280 0
export RadiusFromBounds
proc RadiusFromBounds 36 4
line 1095
;851:}
;852:#elif __GNUC__
;853:// use matha.s
;854:#else
;855:#pragma warning( disable: 4035 )
;856:
;857:__declspec( naked ) int BoxOnPlaneSide (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;858:{
;859:	static int bops_initialized;
;860:	static int Ljmptab[8];
;861:
;862:	__asm {
;863:
;864:		push ebx
;865:			
;866:		cmp bops_initialized, 1
;867:		je  initialized
;868:		mov bops_initialized, 1
;869:		
;870:		mov Ljmptab[0*4], offset Lcase0
;871:		mov Ljmptab[1*4], offset Lcase1
;872:		mov Ljmptab[2*4], offset Lcase2
;873:		mov Ljmptab[3*4], offset Lcase3
;874:		mov Ljmptab[4*4], offset Lcase4
;875:		mov Ljmptab[5*4], offset Lcase5
;876:		mov Ljmptab[6*4], offset Lcase6
;877:		mov Ljmptab[7*4], offset Lcase7
;878:			
;879:initialized:
;880:
;881:		mov edx,dword ptr[4+12+esp]
;882:		mov ecx,dword ptr[4+4+esp]
;883:		xor eax,eax
;884:		mov ebx,dword ptr[4+8+esp]
;885:		mov al,byte ptr[17+edx]
;886:		cmp al,8
;887:		jge Lerror
;888:		fld dword ptr[0+edx]
;889:		fld st(0)
;890:		jmp dword ptr[Ljmptab+eax*4]
;891:Lcase0:
;892:		fmul dword ptr[ebx]
;893:		fld dword ptr[0+4+edx]
;894:		fxch st(2)
;895:		fmul dword ptr[ecx]
;896:		fxch st(2)
;897:		fld st(0)
;898:		fmul dword ptr[4+ebx]
;899:		fld dword ptr[0+8+edx]
;900:		fxch st(2)
;901:		fmul dword ptr[4+ecx]
;902:		fxch st(2)
;903:		fld st(0)
;904:		fmul dword ptr[8+ebx]
;905:		fxch st(5)
;906:		faddp st(3),st(0)
;907:		fmul dword ptr[8+ecx]
;908:		fxch st(1)
;909:		faddp st(3),st(0)
;910:		fxch st(3)
;911:		faddp st(2),st(0)
;912:		jmp LSetSides
;913:Lcase1:
;914:		fmul dword ptr[ecx]
;915:		fld dword ptr[0+4+edx]
;916:		fxch st(2)
;917:		fmul dword ptr[ebx]
;918:		fxch st(2)
;919:		fld st(0)
;920:		fmul dword ptr[4+ebx]
;921:		fld dword ptr[0+8+edx]
;922:		fxch st(2)
;923:		fmul dword ptr[4+ecx]
;924:		fxch st(2)
;925:		fld st(0)
;926:		fmul dword ptr[8+ebx]
;927:		fxch st(5)
;928:		faddp st(3),st(0)
;929:		fmul dword ptr[8+ecx]
;930:		fxch st(1)
;931:		faddp st(3),st(0)
;932:		fxch st(3)
;933:		faddp st(2),st(0)
;934:		jmp LSetSides
;935:Lcase2:
;936:		fmul dword ptr[ebx]
;937:		fld dword ptr[0+4+edx]
;938:		fxch st(2)
;939:		fmul dword ptr[ecx]
;940:		fxch st(2)
;941:		fld st(0)
;942:		fmul dword ptr[4+ecx]
;943:		fld dword ptr[0+8+edx]
;944:		fxch st(2)
;945:		fmul dword ptr[4+ebx]
;946:		fxch st(2)
;947:		fld st(0)
;948:		fmul dword ptr[8+ebx]
;949:		fxch st(5)
;950:		faddp st(3),st(0)
;951:		fmul dword ptr[8+ecx]
;952:		fxch st(1)
;953:		faddp st(3),st(0)
;954:		fxch st(3)
;955:		faddp st(2),st(0)
;956:		jmp LSetSides
;957:Lcase3:
;958:		fmul dword ptr[ecx]
;959:		fld dword ptr[0+4+edx]
;960:		fxch st(2)
;961:		fmul dword ptr[ebx]
;962:		fxch st(2)
;963:		fld st(0)
;964:		fmul dword ptr[4+ecx]
;965:		fld dword ptr[0+8+edx]
;966:		fxch st(2)
;967:		fmul dword ptr[4+ebx]
;968:		fxch st(2)
;969:		fld st(0)
;970:		fmul dword ptr[8+ebx]
;971:		fxch st(5)
;972:		faddp st(3),st(0)
;973:		fmul dword ptr[8+ecx]
;974:		fxch st(1)
;975:		faddp st(3),st(0)
;976:		fxch st(3)
;977:		faddp st(2),st(0)
;978:		jmp LSetSides
;979:Lcase4:
;980:		fmul dword ptr[ebx]
;981:		fld dword ptr[0+4+edx]
;982:		fxch st(2)
;983:		fmul dword ptr[ecx]
;984:		fxch st(2)
;985:		fld st(0)
;986:		fmul dword ptr[4+ebx]
;987:		fld dword ptr[0+8+edx]
;988:		fxch st(2)
;989:		fmul dword ptr[4+ecx]
;990:		fxch st(2)
;991:		fld st(0)
;992:		fmul dword ptr[8+ecx]
;993:		fxch st(5)
;994:		faddp st(3),st(0)
;995:		fmul dword ptr[8+ebx]
;996:		fxch st(1)
;997:		faddp st(3),st(0)
;998:		fxch st(3)
;999:		faddp st(2),st(0)
;1000:		jmp LSetSides
;1001:Lcase5:
;1002:		fmul dword ptr[ecx]
;1003:		fld dword ptr[0+4+edx]
;1004:		fxch st(2)
;1005:		fmul dword ptr[ebx]
;1006:		fxch st(2)
;1007:		fld st(0)
;1008:		fmul dword ptr[4+ebx]
;1009:		fld dword ptr[0+8+edx]
;1010:		fxch st(2)
;1011:		fmul dword ptr[4+ecx]
;1012:		fxch st(2)
;1013:		fld st(0)
;1014:		fmul dword ptr[8+ecx]
;1015:		fxch st(5)
;1016:		faddp st(3),st(0)
;1017:		fmul dword ptr[8+ebx]
;1018:		fxch st(1)
;1019:		faddp st(3),st(0)
;1020:		fxch st(3)
;1021:		faddp st(2),st(0)
;1022:		jmp LSetSides
;1023:Lcase6:
;1024:		fmul dword ptr[ebx]
;1025:		fld dword ptr[0+4+edx]
;1026:		fxch st(2)
;1027:		fmul dword ptr[ecx]
;1028:		fxch st(2)
;1029:		fld st(0)
;1030:		fmul dword ptr[4+ecx]
;1031:		fld dword ptr[0+8+edx]
;1032:		fxch st(2)
;1033:		fmul dword ptr[4+ebx]
;1034:		fxch st(2)
;1035:		fld st(0)
;1036:		fmul dword ptr[8+ecx]
;1037:		fxch st(5)
;1038:		faddp st(3),st(0)
;1039:		fmul dword ptr[8+ebx]
;1040:		fxch st(1)
;1041:		faddp st(3),st(0)
;1042:		fxch st(3)
;1043:		faddp st(2),st(0)
;1044:		jmp LSetSides
;1045:Lcase7:
;1046:		fmul dword ptr[ecx]
;1047:		fld dword ptr[0+4+edx]
;1048:		fxch st(2)
;1049:		fmul dword ptr[ebx]
;1050:		fxch st(2)
;1051:		fld st(0)
;1052:		fmul dword ptr[4+ecx]
;1053:		fld dword ptr[0+8+edx]
;1054:		fxch st(2)
;1055:		fmul dword ptr[4+ebx]
;1056:		fxch st(2)
;1057:		fld st(0)
;1058:		fmul dword ptr[8+ecx]
;1059:		fxch st(5)
;1060:		faddp st(3),st(0)
;1061:		fmul dword ptr[8+ebx]
;1062:		fxch st(1)
;1063:		faddp st(3),st(0)
;1064:		fxch st(3)
;1065:		faddp st(2),st(0)
;1066:LSetSides:
;1067:		faddp st(2),st(0)
;1068:		fcomp dword ptr[12+edx]
;1069:		xor ecx,ecx
;1070:		fnstsw ax
;1071:		fcomp dword ptr[12+edx]
;1072:		and ah,1
;1073:		xor ah,1
;1074:		add cl,ah
;1075:		fnstsw ax
;1076:		and ah,1
;1077:		add ah,ah
;1078:		add cl,ah
;1079:		pop ebx
;1080:		mov eax,ecx
;1081:		ret
;1082:Lerror:
;1083:		int 3
;1084:	}
;1085:}
;1086:#pragma warning( default: 4035 )
;1087:
;1088:#endif
;1089:
;1090:/*
;1091:=================
;1092:RadiusFromBounds
;1093:=================
;1094:*/
;1095:float RadiusFromBounds( const vec3_t mins, const vec3_t maxs ) {
line 1100
;1096:	int		i;
;1097:	vec3_t	corner;
;1098:	float	a, b;
;1099:
;1100:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $251
line 1101
;1101:		a = fabs( mins[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 1102
;1102:		b = fabs( maxs[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 28
INDIRF4
ASGNF4
line 1103
;1103:		corner[i] = a > b ? a : b;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $256
ADDRLP4 32
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $257
JUMPV
LABELV $256
ADDRLP4 32
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $257
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1104
;1104:	}
LABELV $252
line 1100
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $251
line 1106
;1105:
;1106:	return VectorLength (corner);
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
RETF4
LABELV $250
endproc RadiusFromBounds 36 4
export ClearBounds
proc ClearBounds 16 0
line 1110
;1107:}
;1108:
;1109:
;1110:void ClearBounds( vec3_t mins, vec3_t maxs ) {
line 1111
;1111:	mins[0] = mins[1] = mins[2] = 99999;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1203982208
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1112
;1112:	maxs[0] = maxs[1] = maxs[2] = -99999;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 3351465856
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1113
;1113:}
LABELV $258
endproc ClearBounds 16 0
export AddPointToBounds
proc AddPointToBounds 20 0
line 1115
;1114:
;1115:void AddPointToBounds( const vec3_t v, vec3_t mins, vec3_t maxs ) {
line 1116
;1116:	if ( v[0] < mins[0] ) {
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
GEF4 $260
line 1117
;1117:		mins[0] = v[0];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1118
;1118:	}
LABELV $260
line 1119
;1119:	if ( v[0] > maxs[0]) {
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
LEF4 $262
line 1120
;1120:		maxs[0] = v[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1121
;1121:	}
LABELV $262
line 1123
;1122:
;1123:	if ( v[1] < mins[1] ) {
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
GEF4 $264
line 1124
;1124:		mins[1] = v[1];
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 4
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
ASGNF4
line 1125
;1125:	}
LABELV $264
line 1126
;1126:	if ( v[1] > maxs[1]) {
ADDRLP4 4
CNSTI4 4
ASGNI4
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
LEF4 $266
line 1127
;1127:		maxs[1] = v[1];
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1128
;1128:	}
LABELV $266
line 1130
;1129:
;1130:	if ( v[2] < mins[2] ) {
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
GEF4 $268
line 1131
;1131:		mins[2] = v[2];
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 4
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
ASGNF4
line 1132
;1132:	}
LABELV $268
line 1133
;1133:	if ( v[2] > maxs[2]) {
ADDRLP4 12
CNSTI4 8
ASGNI4
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
LEF4 $270
line 1134
;1134:		maxs[2] = v[2];
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1135
;1135:	}
LABELV $270
line 1136
;1136:}
LABELV $259
endproc AddPointToBounds 20 0
export VectorNormalize
proc VectorNormalize 40 4
line 1139
;1137:
;1138:
;1139:vec_t VectorNormalize( vec3_t v ) {
line 1143
;1140:	// NOTE: TTimo - Apple G4 altivec source uses double?
;1141:	float	length, ilength;
;1142:
;1143:	length = v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1144
;1144:	length = sqrt (length);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1146
;1145:
;1146:	if ( length ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $273
line 1147
;1147:		ilength = 1/length;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1148
;1148:		v[0] *= ilength;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1149
;1149:		v[1] *= ilength;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1150
;1150:		v[2] *= ilength;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1151
;1151:	}
LABELV $273
line 1153
;1152:		
;1153:	return length;
ADDRLP4 0
INDIRF4
RETF4
LABELV $272
endproc VectorNormalize 40 4
export VectorNormalize2
proc VectorNormalize2 36 4
line 1156
;1154:}
;1155:
;1156:vec_t VectorNormalize2( const vec3_t v, vec3_t out) {
line 1159
;1157:	float	length, ilength;
;1158:
;1159:	length = v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1160
;1160:	length = sqrt (length);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1162
;1161:
;1162:	if (length)
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $276
line 1163
;1163:	{
line 1167
;1164:#ifndef Q3_VM // bk0101022 - FPE related
;1165://	  assert( ((Q_fabs(v[0])!=0.0f) || (Q_fabs(v[1])!=0.0f) || (Q_fabs(v[2])!=0.0f)) );
;1166:#endif
;1167:		ilength = 1/length;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1168
;1168:		out[0] = v[0]*ilength;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1169
;1169:		out[1] = v[1]*ilength;
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1170
;1170:		out[2] = v[2]*ilength;
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1171
;1171:	} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 1175
;1172:#ifndef Q3_VM // bk0101022 - FPE related
;1173://	  assert( ((Q_fabs(v[0])==0.0f) && (Q_fabs(v[1])==0.0f) && (Q_fabs(v[2])==0.0f)) );
;1174:#endif
;1175:		VectorClear( out );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1176
;1176:	}
LABELV $277
line 1178
;1177:		
;1178:	return length;
ADDRLP4 0
INDIRF4
RETF4
LABELV $275
endproc VectorNormalize2 36 4
export _VectorMA
proc _VectorMA 8 0
line 1182
;1179:
;1180:}
;1181:
;1182:void _VectorMA( const vec3_t veca, float scale, const vec3_t vecb, vec3_t vecc) {
line 1183
;1183:	vecc[0] = veca[0] + scale*vecb[0];
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1184
;1184:	vecc[1] = veca[1] + scale*vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1185
;1185:	vecc[2] = veca[2] + scale*vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 12
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
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1186
;1186:}
LABELV $278
endproc _VectorMA 8 0
export _DotProduct
proc _DotProduct 16 0
line 1189
;1187:
;1188:
;1189:vec_t _DotProduct( const vec3_t v1, const vec3_t v2 ) {
line 1190
;1190:	return v1[0]*v2[0] + v1[1]*v2[1] + v1[2]*v2[2];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
RETF4
LABELV $279
endproc _DotProduct 16 0
export _VectorSubtract
proc _VectorSubtract 8 0
line 1193
;1191:}
;1192:
;1193:void _VectorSubtract( const vec3_t veca, const vec3_t vecb, vec3_t out ) {
line 1194
;1194:	out[0] = veca[0]-vecb[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1195
;1195:	out[1] = veca[1]-vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1196
;1196:	out[2] = veca[2]-vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
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
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1197
;1197:}
LABELV $280
endproc _VectorSubtract 8 0
export _VectorAdd
proc _VectorAdd 8 0
line 1199
;1198:
;1199:void _VectorAdd( const vec3_t veca, const vec3_t vecb, vec3_t out ) {
line 1200
;1200:	out[0] = veca[0]+vecb[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 1201
;1201:	out[1] = veca[1]+vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1202
;1202:	out[2] = veca[2]+vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
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
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1203
;1203:}
LABELV $281
endproc _VectorAdd 8 0
export _VectorCopy
proc _VectorCopy 8 0
line 1205
;1204:
;1205:void _VectorCopy( const vec3_t in, vec3_t out ) {
line 1206
;1206:	out[0] = in[0];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1207
;1207:	out[1] = in[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1208
;1208:	out[2] = in[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 4
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
ASGNF4
line 1209
;1209:}
LABELV $282
endproc _VectorCopy 8 0
export _VectorScale
proc _VectorScale 8 0
line 1211
;1210:
;1211:void _VectorScale( const vec3_t in, vec_t scale, vec3_t out ) {
line 1212
;1212:	out[0] = in[0]*scale;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1213
;1213:	out[1] = in[1]*scale;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1214
;1214:	out[2] = in[2]*scale;
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
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
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1215
;1215:}
LABELV $283
endproc _VectorScale 8 0
export Vector4Scale
proc Vector4Scale 12 0
line 1217
;1216:
;1217:void Vector4Scale( const vec4_t in, vec_t scale, vec4_t out ) {
line 1218
;1218:	out[0] = in[0]*scale;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1219
;1219:	out[1] = in[1]*scale;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1220
;1220:	out[2] = in[2]*scale;
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
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
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1221
;1221:	out[3] = in[3]*scale;
ADDRLP4 8
CNSTI4 12
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1222
;1222:}
LABELV $284
endproc Vector4Scale 12 0
export Q_log2
proc Q_log2 8 0
line 1225
;1223:
;1224:
;1225:int Q_log2( int val ) {
line 1228
;1226:	int answer;
;1227:
;1228:	answer = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $286
line 1229
;1229:	while ( ( val>>=1 ) != 0 ) {
line 1230
;1230:		answer++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1231
;1231:	}
LABELV $287
line 1229
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
ADDRFP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $286
line 1232
;1232:	return answer;
ADDRLP4 0
INDIRI4
RETI4
LABELV $285
endproc Q_log2 8 0
export MatrixMultiply
proc MatrixMultiply 104 0
line 1261
;1233:}
;1234:
;1235:
;1236:
;1237:/*
;1238:=================
;1239:PlaneTypeForNormal
;1240:=================
;1241:*/
;1242:/*
;1243:int	PlaneTypeForNormal (vec3_t normal) {
;1244:	if ( normal[0] == 1.0 )
;1245:		return PLANE_X;
;1246:	if ( normal[1] == 1.0 )
;1247:		return PLANE_Y;
;1248:	if ( normal[2] == 1.0 )
;1249:		return PLANE_Z;
;1250:	
;1251:	return PLANE_NON_AXIAL;
;1252:}
;1253:*/
;1254:
;1255:
;1256:/*
;1257:================
;1258:MatrixMultiply
;1259:================
;1260:*/
;1261:void MatrixMultiply(float in1[3][3], float in2[3][3], float out[3][3]) {
line 1262
;1262:	out[0][0] = in1[0][0] * in2[0][0] + in1[0][1] * in2[1][0] +
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1264
;1263:				in1[0][2] * in2[2][0];
;1264:	out[0][1] = in1[0][0] * in2[0][1] + in1[0][1] * in2[1][1] +
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1266
;1265:				in1[0][2] * in2[2][1];
;1266:	out[0][2] = in1[0][0] * in2[0][2] + in1[0][1] * in2[1][2] +
ADDRLP4 20
CNSTI4 8
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1268
;1267:				in1[0][2] * in2[2][2];
;1268:	out[1][0] = in1[1][0] * in2[0][0] + in1[1][1] * in2[1][0] +
ADDRLP4 32
CNSTI4 12
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1270
;1269:				in1[1][2] * in2[2][0];
;1270:	out[1][1] = in1[1][0] * in2[0][1] + in1[1][1] * in2[1][1] +
ADDRLP4 44
CNSTI4 16
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1272
;1271:				in1[1][2] * in2[2][1];
;1272:	out[1][2] = in1[1][0] * in2[0][2] + in1[1][1] * in2[1][2] +
ADDRLP4 56
CNSTI4 20
ASGNI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 60
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1274
;1273:				in1[1][2] * in2[2][2];
;1274:	out[2][0] = in1[2][0] * in2[0][0] + in1[2][1] * in2[1][0] +
ADDRLP4 68
CNSTI4 24
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRLP4 72
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
INDIRF4
MULF4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1276
;1275:				in1[2][2] * in2[2][0];
;1276:	out[2][1] = in1[2][0] * in2[0][1] + in1[2][1] * in2[1][1] +
ADDRLP4 80
CNSTI4 28
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1278
;1277:				in1[2][2] * in2[2][1];
;1278:	out[2][2] = in1[2][0] * in2[0][2] + in1[2][1] * in2[1][2] +
ADDRLP4 92
CNSTI4 32
ASGNI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1280
;1279:				in1[2][2] * in2[2][2];
;1280:}
LABELV $289
endproc MatrixMultiply 104 0
export VectorMatrixMultiply
proc VectorMatrixMultiply 32 0
line 1288
;1281:
;1282:/*
;1283:================
;1284:VectorMatrixMultiply
;1285:================
;1286:*/
;1287:void VectorMatrixMultiply( const vec3_t p, vec3_t m[ 3 ], vec3_t out )
;1288:{
line 1289
;1289:	out[ 0 ] = m[ 0 ][ 0 ] * p[ 0 ] + m[ 1 ][ 0 ] * p[ 1 ] + m[ 2 ][ 0 ] * p[ 2 ];
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1290
;1290:	out[ 1 ] = m[ 0 ][ 1 ] * p[ 0 ] + m[ 1 ][ 1 ] * p[ 1 ] + m[ 2 ][ 1 ] * p[ 2 ];
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1291
;1291:	out[ 2 ] = m[ 0 ][ 2 ] * p[ 0 ] + m[ 1 ][ 2 ] * p[ 1 ] + m[ 2 ][ 2 ] * p[ 2 ];
ADDRLP4 20
CNSTI4 8
ASGNI4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1292
;1292:}
LABELV $290
endproc VectorMatrixMultiply 32 0
bss
align 4
LABELV $292
skip 4
align 4
LABELV $293
skip 4
align 4
LABELV $294
skip 4
align 4
LABELV $295
skip 4
align 4
LABELV $296
skip 4
align 4
LABELV $297
skip 4
export AngleVectors
code
proc AngleVectors 36 4
line 1295
;1293:
;1294:
;1295:void AngleVectors( const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up) {
line 1300
;1296:	float		angle;
;1297:	static float		sr, sp, sy, cr, cp, cy;
;1298:	// static to help MS compiler fp bugs
;1299:
;1300:	angle = angles[YAW] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1301
;1301:	sy = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $294
ADDRLP4 4
INDIRF4
ASGNF4
line 1302
;1302:	cy = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $297
ADDRLP4 8
INDIRF4
ASGNF4
line 1303
;1303:	angle = angles[PITCH] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1304
;1304:	sp = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $293
ADDRLP4 12
INDIRF4
ASGNF4
line 1305
;1305:	cp = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $296
ADDRLP4 16
INDIRF4
ASGNF4
line 1306
;1306:	angle = angles[ROLL] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1307
;1307:	sr = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $292
ADDRLP4 20
INDIRF4
ASGNF4
line 1308
;1308:	cr = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $295
ADDRLP4 24
INDIRF4
ASGNF4
line 1310
;1309:
;1310:	if (forward)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $298
line 1311
;1311:	{
line 1312
;1312:		forward[0] = cp*cy;
ADDRFP4 4
INDIRP4
ADDRGP4 $296
INDIRF4
ADDRGP4 $297
INDIRF4
MULF4
ASGNF4
line 1313
;1313:		forward[1] = cp*sy;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $296
INDIRF4
ADDRGP4 $294
INDIRF4
MULF4
ASGNF4
line 1314
;1314:		forward[2] = -sp;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $293
INDIRF4
NEGF4
ASGNF4
line 1315
;1315:	}
LABELV $298
line 1316
;1316:	if (right)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
line 1317
;1317:	{
line 1318
;1318:		right[0] = (-1*sr*sp*cy+-1*cr*-sy);
ADDRLP4 28
CNSTF4 3212836864
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRF4
ADDRGP4 $292
INDIRF4
MULF4
ADDRGP4 $293
INDIRF4
MULF4
ADDRGP4 $297
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRGP4 $295
INDIRF4
MULF4
ADDRGP4 $294
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 1319
;1319:		right[1] = (-1*sr*sp*sy+-1*cr*cy);
ADDRLP4 32
CNSTF4 3212836864
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRF4
ADDRGP4 $292
INDIRF4
MULF4
ADDRGP4 $293
INDIRF4
MULF4
ADDRGP4 $294
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRGP4 $295
INDIRF4
MULF4
ADDRGP4 $297
INDIRF4
MULF4
ADDF4
ASGNF4
line 1320
;1320:		right[2] = -1*sr*cp;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3212836864
ADDRGP4 $292
INDIRF4
MULF4
ADDRGP4 $296
INDIRF4
MULF4
ASGNF4
line 1321
;1321:	}
LABELV $300
line 1322
;1322:	if (up)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $302
line 1323
;1323:	{
line 1324
;1324:		up[0] = (cr*sp*cy+-sr*-sy);
ADDRFP4 12
INDIRP4
ADDRGP4 $295
INDIRF4
ADDRGP4 $293
INDIRF4
MULF4
ADDRGP4 $297
INDIRF4
MULF4
ADDRGP4 $292
INDIRF4
NEGF4
ADDRGP4 $294
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 1325
;1325:		up[1] = (cr*sp*sy+-sr*cy);
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $295
INDIRF4
ADDRGP4 $293
INDIRF4
MULF4
ADDRGP4 $294
INDIRF4
MULF4
ADDRGP4 $292
INDIRF4
NEGF4
ADDRGP4 $297
INDIRF4
MULF4
ADDF4
ASGNF4
line 1326
;1326:		up[2] = cr*cp;
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $295
INDIRF4
ADDRGP4 $296
INDIRF4
MULF4
ASGNF4
line 1327
;1327:	}
LABELV $302
line 1328
;1328:}
LABELV $291
endproc AngleVectors 36 4
export PerpendicularVector
proc PerpendicularVector 36 12
line 1334
;1329:
;1330:/*
;1331:** assumes "src" is normalized
;1332:*/
;1333:void PerpendicularVector( vec3_t dst, const vec3_t src )
;1334:{
line 1337
;1335:	int	pos;
;1336:	int i;
;1337:	float minelem = 1.0F;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1343
;1338:	vec3_t tempvec;
;1339:
;1340:	/*
;1341:	** find the smallest magnitude axially aligned vector
;1342:	*/
;1343:	for ( pos = 0, i = 0; i < 3; i++ )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 1344
;1344:	{
line 1345
;1345:		if ( fabs( src[i] ) < minelem )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $309
line 1346
;1346:		{
line 1347
;1347:			pos = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1348
;1348:			minelem = fabs( src[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1349
;1349:		}
LABELV $309
line 1350
;1350:	}
LABELV $306
line 1343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $305
line 1351
;1351:	tempvec[0] = tempvec[1] = tempvec[2] = 0.0F;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 1352
;1352:	tempvec[pos] = 1.0F;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1357
;1353:
;1354:	/*
;1355:	** project the point onto the plane defined by src
;1356:	*/
;1357:	ProjectPointOnPlane( dst, tempvec, src );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 1362
;1358:
;1359:	/*
;1360:	** normalize the result
;1361:	*/
;1362:	VectorNormalize( dst );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1363
;1363:}
LABELV $304
endproc PerpendicularVector 36 12
export pointToLineDistance
proc pointToLineDistance 84 12
line 1373
;1364:
;1365:/*
;1366:=================
;1367:pointToLineDistance
;1368:
;1369:Distance from a point to some line
;1370:=================
;1371:*/
;1372:float pointToLineDistance( const vec3_t p0, const vec3_t p1, const vec3_t p2 )
;1373:{
line 1377
;1374:	vec3_t	v, w, y;
;1375:	float	 c1, c2;
;1376:
;1377:	VectorSubtract( p2, p1, v );
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1378
;1378:	VectorSubtract( p1, p0, w );
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 60
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1380
;1379:
;1380:	CrossProduct( w, v, y );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1381
;1381:	c1 = VectorLength( y );
ADDRLP4 28
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 76
INDIRF4
ASGNF4
line 1382
;1382:	c2 = VectorLength( v );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 1384
;1383:
;1384:	if( c2 == 0.0f )
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $318
line 1385
;1385:		return 0.0f;
CNSTF4 0
RETF4
ADDRGP4 $313
JUMPV
LABELV $318
line 1387
;1386:	else
;1387:		return c1 / c2;
ADDRLP4 40
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
RETF4
LABELV $313
endproc pointToLineDistance 84 12
export GetPerpendicularViewVector
proc GetPerpendicularViewVector 56 12
line 1398
;1388:}
;1389:
;1390:/*
;1391:=================
;1392:GetPerpendicularViewVector
;1393:
;1394:Used to find an "up" vector for drawing a sprite so that it always faces the view as best as possible
;1395:=================
;1396:*/
;1397:void GetPerpendicularViewVector( const vec3_t point, const vec3_t p1, const vec3_t p2, vec3_t up )
;1398:{
line 1401
;1399:	vec3_t	v1, v2;
;1400:
;1401:	VectorSubtract( point, p1, v1 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1402
;1402:	VectorNormalize( v1 );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1404
;1403:
;1404:	VectorSubtract( point, p2, v2 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1405
;1405:	VectorNormalize( v2 );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1407
;1406:
;1407:	CrossProduct( v1, v2, up );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1408
;1408:	VectorNormalize( up );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1409
;1409:}
LABELV $320
endproc GetPerpendicularViewVector 56 12
export ProjectPointOntoVector
proc ProjectPointOntoVector 68 4
line 1417
;1410:
;1411:/*
;1412:================
;1413:ProjectPointOntoVector
;1414:================
;1415:*/
;1416:void ProjectPointOntoVector( vec3_t point, vec3_t vStart, vec3_t vEnd, vec3_t vProj )
;1417:{
line 1420
;1418:	vec3_t pVec, vec;
;1419:
;1420:	VectorSubtract( point, vStart, pVec );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1421
;1421:	VectorSubtract( vEnd, vStart, vec );
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1422
;1422:	VectorNormalize( vec );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1424
;1423:	// project onto the directional vector for this segment
;1424:	VectorMA( vStart, DotProduct( pVec, vec ), vec, vProj );
ADDRLP4 56
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1425
;1425:}
LABELV $325
endproc ProjectPointOntoVector 68 4
export VectorMaxComponent
proc VectorMaxComponent 4 0
line 1435
;1426:
;1427:/*
;1428:================
;1429:VectorMaxComponent
;1430:
;1431:Return the biggest component of some vector
;1432:================
;1433:*/
;1434:float VectorMaxComponent( vec3_t v )
;1435:{
line 1436
;1436:	float biggest = v[ 0 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1438
;1437:
;1438:	if( v[ 1 ] > biggest )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $345
line 1439
;1439:		biggest = v[ 1 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
LABELV $345
line 1441
;1440:
;1441:	if( v[ 2 ] > biggest )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $347
line 1442
;1442:		biggest = v[ 2 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
LABELV $347
line 1444
;1443:
;1444:	return biggest;
ADDRLP4 0
INDIRF4
RETF4
LABELV $344
endproc VectorMaxComponent 4 0
export VectorMinComponent
proc VectorMinComponent 4 0
line 1455
;1445:}
;1446:
;1447:/*
;1448:================
;1449:VectorMinComponent
;1450:
;1451:Return the smallest component of some vector
;1452:================
;1453:*/
;1454:float VectorMinComponent( vec3_t v )
;1455:{
line 1456
;1456:	float smallest = v[ 0 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1458
;1457:
;1458:	if( v[ 1 ] < smallest )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
GEF4 $350
line 1459
;1459:		smallest = v[ 1 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
LABELV $350
line 1461
;1460:
;1461:	if( v[ 2 ] < smallest )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
GEF4 $352
line 1462
;1462:		smallest = v[ 2 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
LABELV $352
line 1464
;1463:
;1464:	return smallest;
ADDRLP4 0
INDIRF4
RETF4
LABELV $349
endproc VectorMinComponent 4 0
export DistanceBetweenLineSegmentsSquared
proc DistanceBetweenLineSegmentsSquared 180 4
line 1481
;1465:}
;1466:
;1467:
;1468:#define LINE_DISTANCE_EPSILON 1e-05f
;1469:
;1470:/*
;1471:================
;1472:DistanceBetweenLineSegmentsSquared
;1473:
;1474:Return the smallest distance between two line segments, squared
;1475:================
;1476:*/
;1477:vec_t DistanceBetweenLineSegmentsSquared(
;1478:    const vec3_t sP0, const vec3_t sP1,
;1479:    const vec3_t tP0, const vec3_t tP1,
;1480:    float *s, float *t )
;1481:{
line 1489
;1482:  vec3_t  sMag, tMag, diff;
;1483:  float   a, b, c, d, e;
;1484:  float   D;
;1485:  float   sN, sD;
;1486:  float   tN, tD;
;1487:  vec3_t  separation;
;1488:
;1489:  VectorSubtract( sP1, sP0, sMag );
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1490
;1490:  VectorSubtract( tP1, tP0, tMag );
ADDRLP4 104
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 108
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 104
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 12
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1491
;1491:  VectorSubtract( sP0, tP0, diff );
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 120
INDIRP4
INDIRF4
ADDRLP4 124
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
CNSTI4 4
ASGNI4
ADDRLP4 24+4
ADDRLP4 120
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1492
;1492:  a = DotProduct( sMag, sMag );
ADDRLP4 136
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 136
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1493
;1493:  b = DotProduct( sMag, tMag );
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1494
;1494:  c = DotProduct( tMag, tMag );
ADDRLP4 140
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 64
ADDRLP4 140
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1495
;1495:  d = DotProduct( sMag, diff );
ADDRLP4 68
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1496
;1496:  e = DotProduct( tMag, diff );
ADDRLP4 80
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1497
;1497:  sD = tD = D = a * c - b * b;
ADDRLP4 148
ADDRLP4 76
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ADDRLP4 56
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
SUBF4
ASGNF4
ADDRLP4 84
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 60
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 148
INDIRF4
ASGNF4
line 1499
;1498:
;1499:  if( D < LINE_DISTANCE_EPSILON )
ADDRLP4 84
INDIRF4
CNSTF4 925353388
GEF4 $381
line 1500
;1500:  {
line 1502
;1501:    // the lines are almost parallel
;1502:    sN = 0.0;   // force using point P0 on segment S1
ADDRLP4 52
CNSTF4 0
ASGNF4
line 1503
;1503:    sD = 1.0;   // to prevent possible division by 0.0 later
ADDRLP4 72
CNSTF4 1065353216
ASGNF4
line 1504
;1504:    tN = e;
ADDRLP4 48
ADDRLP4 80
INDIRF4
ASGNF4
line 1505
;1505:    tD = c;
ADDRLP4 60
ADDRLP4 64
INDIRF4
ASGNF4
line 1506
;1506:  }
ADDRGP4 $382
JUMPV
LABELV $381
line 1508
;1507:  else
;1508:  {
line 1510
;1509:    // get the closest points on the infinite lines
;1510:    sN = ( b * e - c * d );
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 64
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
SUBF4
ASGNF4
line 1511
;1511:    tN = ( a * e - b * d );
ADDRLP4 48
ADDRLP4 76
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 56
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
SUBF4
ASGNF4
line 1513
;1512:
;1513:    if( sN < 0.0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
GEF4 $383
line 1514
;1514:    {
line 1516
;1515:      // sN < 0 => the s=0 edge is visible
;1516:      sN = 0.0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 1517
;1517:      tN = e;
ADDRLP4 48
ADDRLP4 80
INDIRF4
ASGNF4
line 1518
;1518:      tD = c;
ADDRLP4 60
ADDRLP4 64
INDIRF4
ASGNF4
line 1519
;1519:    }
ADDRGP4 $384
JUMPV
LABELV $383
line 1520
;1520:    else if( sN > sD )
ADDRLP4 52
INDIRF4
ADDRLP4 72
INDIRF4
LEF4 $385
line 1521
;1521:    {
line 1523
;1522:      // sN > sD => the s=1 edge is visible
;1523:      sN = sD;
ADDRLP4 52
ADDRLP4 72
INDIRF4
ASGNF4
line 1524
;1524:      tN = e + b;
ADDRLP4 48
ADDRLP4 80
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 1525
;1525:      tD = c;
ADDRLP4 60
ADDRLP4 64
INDIRF4
ASGNF4
line 1526
;1526:    }
LABELV $385
LABELV $384
line 1527
;1527:  }
LABELV $382
line 1529
;1528:
;1529:  if( tN < 0.0 )
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $387
line 1530
;1530:  {
line 1532
;1531:    // tN < 0 => the t=0 edge is visible
;1532:    tN = 0.0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 1535
;1533:
;1534:    // recompute sN for this edge
;1535:    if( -d < 0.0 )
ADDRLP4 68
INDIRF4
NEGF4
CNSTF4 0
GEF4 $389
line 1536
;1536:      sN = 0.0;
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRGP4 $388
JUMPV
LABELV $389
line 1537
;1537:    else if( -d > a )
ADDRLP4 68
INDIRF4
NEGF4
ADDRLP4 76
INDIRF4
LEF4 $391
line 1538
;1538:      sN = sD;
ADDRLP4 52
ADDRLP4 72
INDIRF4
ASGNF4
ADDRGP4 $388
JUMPV
LABELV $391
line 1540
;1539:    else
;1540:    {
line 1541
;1541:      sN = -d;
ADDRLP4 52
ADDRLP4 68
INDIRF4
NEGF4
ASGNF4
line 1542
;1542:      sD = a;
ADDRLP4 72
ADDRLP4 76
INDIRF4
ASGNF4
line 1543
;1543:    }
line 1544
;1544:  }
ADDRGP4 $388
JUMPV
LABELV $387
line 1545
;1545:  else if( tN > tD )
ADDRLP4 48
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $393
line 1546
;1546:  {
line 1548
;1547:    // tN > tD => the t=1 edge is visible
;1548:    tN = tD;
ADDRLP4 48
ADDRLP4 60
INDIRF4
ASGNF4
line 1551
;1549:
;1550:    // recompute sN for this edge
;1551:    if( ( -d + b ) < 0.0 )
ADDRLP4 68
INDIRF4
NEGF4
ADDRLP4 56
INDIRF4
ADDF4
CNSTF4 0
GEF4 $395
line 1552
;1552:      sN = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRGP4 $396
JUMPV
LABELV $395
line 1553
;1553:    else if( ( -d + b ) > a )
ADDRLP4 68
INDIRF4
NEGF4
ADDRLP4 56
INDIRF4
ADDF4
ADDRLP4 76
INDIRF4
LEF4 $397
line 1554
;1554:      sN = sD;
ADDRLP4 52
ADDRLP4 72
INDIRF4
ASGNF4
ADDRGP4 $398
JUMPV
LABELV $397
line 1556
;1555:    else
;1556:    {
line 1557
;1557:      sN = ( -d + b );
ADDRLP4 52
ADDRLP4 68
INDIRF4
NEGF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 1558
;1558:      sD = a;
ADDRLP4 72
ADDRLP4 76
INDIRF4
ASGNF4
line 1559
;1559:    }
LABELV $398
LABELV $396
line 1560
;1560:  }
LABELV $393
LABELV $388
line 1563
;1561:
;1562:  // finally do the division to get *s and *t
;1563:  *s = ( fabs( sN ) < LINE_DISTANCE_EPSILON ? 0.0 : sN / sD );
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 156
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 156
INDIRF4
CNSTF4 925353388
GEF4 $400
ADDRLP4 152
CNSTF4 0
ASGNF4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 152
ADDRLP4 52
INDIRF4
ADDRLP4 72
INDIRF4
DIVF4
ASGNF4
LABELV $401
ADDRFP4 16
INDIRP4
ADDRLP4 152
INDIRF4
ASGNF4
line 1564
;1564:  *t = ( fabs( tN ) < LINE_DISTANCE_EPSILON ? 0.0 : tN / tD );
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 164
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 925353388
GEF4 $403
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRGP4 $404
JUMPV
LABELV $403
ADDRLP4 160
ADDRLP4 48
INDIRF4
ADDRLP4 60
INDIRF4
DIVF4
ASGNF4
LABELV $404
ADDRFP4 20
INDIRP4
ADDRLP4 160
INDIRF4
ASGNF4
line 1567
;1565:
;1566:  // get the difference of the two closest points
;1567:  VectorScale( sMag, *s, sMag );
ADDRLP4 168
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 168
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 168
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1568
;1568:  VectorScale( tMag, *t, tMag );
ADDRLP4 172
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 172
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 172
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1569
;1569:  VectorAdd( diff, sMag, separation );
ADDRLP4 36
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 1570
;1570:  VectorSubtract( separation, tMag, separation );
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 1572
;1571:
;1572:  return VectorLengthSquared( separation );
ADDRLP4 36
ARGP4
ADDRLP4 176
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 176
INDIRF4
RETF4
LABELV $354
endproc DistanceBetweenLineSegmentsSquared 180 4
export DistanceBetweenLineSegments
proc DistanceBetweenLineSegments 8 24
line 1586
;1573:}
;1574:
;1575:/*
;1576:================
;1577:DistanceBetweenLineSegments
;1578:
;1579:Return the smallest distance between two line segments
;1580:================
;1581:*/
;1582:vec_t DistanceBetweenLineSegments(
;1583:    const vec3_t sP0, const vec3_t sP1,
;1584:    const vec3_t tP0, const vec3_t tP1,
;1585:    float *s, float *t )
;1586:{
line 1587
;1587:  return (vec_t)sqrt( DistanceBetweenLineSegmentsSquared(
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
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 DistanceBetweenLineSegmentsSquared
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
RETF4
LABELV $425
endproc DistanceBetweenLineSegments 8 24
export Q_isnan
proc Q_isnan 4 0
line 1599
;1588:        sP0, sP1, tP0, tP1, s, t ) );
;1589:}
;1590:
;1591:/*
;1592:=================
;1593:Q_isnan
;1594:
;1595:Don't pass doubles to this
;1596:================
;1597:*/
;1598:int Q_isnan( float x )
;1599:{
line 1606
;1600:	union
;1601:	{
;1602:		float f;
;1603:		unsigned int i;
;1604:	} t;
;1605:
;1606:	t.f = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 1607
;1607:	t.i &= 0x7FFFFFFF;
ADDRLP4 0
ADDRLP4 0
INDIRU4
CNSTU4 2147483647
BANDU4
ASGNU4
line 1608
;1608:	t.i = 0x7F800000 - t.i;
ADDRLP4 0
CNSTU4 2139095040
ADDRLP4 0
INDIRU4
SUBU4
ASGNU4
line 1610
;1609:
;1610:	return (int)( (unsigned int)t.i >> 31 );
ADDRLP4 0
INDIRU4
CNSTI4 31
RSHU4
CVUI4 4
RETI4
LABELV $426
endproc Q_isnan 4 0
export VectorToAngles
proc VectorToAngles 40 8
line 1614
;1611:}
;1612:
;1613:void VectorToAngles(const vec3_t value1, vec3_t angles)
;1614:{
line 1618
;1615:        float           forward;
;1616:        float           yaw, pitch;
;1617:
;1618:        if(value1[1] == 0 && value1[0] == 0)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $429
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $429
line 1619
;1619:        {
line 1620
;1620:                yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1621
;1621:                if(value1[2] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
LEF4 $431
line 1622
;1622:                {
line 1623
;1623:                        pitch = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 1624
;1624:                }
ADDRGP4 $430
JUMPV
LABELV $431
line 1626
;1625:                else
;1626:                {
line 1627
;1627:                        pitch = 270;
ADDRLP4 4
CNSTF4 1132920832
ASGNF4
line 1628
;1628:                }
line 1629
;1629:        }
ADDRGP4 $430
JUMPV
LABELV $429
line 1631
;1630:        else
;1631:        {
line 1632
;1632:                if(value1[0])
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $433
line 1633
;1633:                {
line 1634
;1634:                        yaw = (atan2(value1[1], value1[0]) * 180 / M_PI);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1635
;1635:                }
ADDRGP4 $434
JUMPV
LABELV $433
line 1636
;1636:                else if(value1[1] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $435
line 1637
;1637:                {
line 1638
;1638:                        yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 1639
;1639:                }
ADDRGP4 $436
JUMPV
LABELV $435
line 1641
;1640:                else
;1641:                {
line 1642
;1642:                        yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 1643
;1643:                }
LABELV $436
LABELV $434
line 1644
;1644:                if(yaw < 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $437
line 1645
;1645:                {
line 1646
;1646:                        yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1647
;1647:                }
LABELV $437
line 1649
;1648:
;1649:                forward = sqrt(value1[0] * value1[0] + value1[1] * value1[1]);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 1650
;1650:                pitch = (atan2(value1[2], forward) * 180 / M_PI);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1127481344
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1651
;1651:                if(pitch < 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $439
line 1652
;1652:                {
line 1653
;1653:                        pitch += 360;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1654
;1654:                }
LABELV $439
line 1655
;1655:        }
LABELV $430
line 1657
;1656:
;1657:        angles[PITCH] = -pitch;
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRF4
NEGF4
ASGNF4
line 1658
;1658:        angles[YAW] = yaw;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1659
;1659:        angles[ROLL] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 1660
;1660:}
LABELV $428
endproc VectorToAngles 40 8
export BoundsIntersectPoint
proc BoundsIntersectPoint 32 0
line 1662
;1661:qboolean BoundsIntersectPoint(const vec3_t mins, const vec3_t maxs, const vec3_t origin)
;1662:{
line 1663
;1663:        if(origin[0] > maxs[0] ||
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
GTF4 $448
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRP4
INDIRF4
LTF4 $448
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
GTF4 $448
ADDRLP4 20
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
LTF4 $448
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
GTF4 $448
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
GEF4 $442
LABELV $448
line 1665
;1664:           origin[0] < mins[0] || origin[1] > maxs[1] || origin[1] < mins[1] || origin[2] > maxs[2] || origin[2] < mins[2])
;1665:        {
line 1666
;1666:                return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $441
JUMPV
LABELV $442
line 1669
;1667:        }
;1668:
;1669:        return qtrue;
CNSTI4 1
RETI4
LABELV $441
endproc BoundsIntersectPoint 32 0
export Q_acos
proc Q_acos 8 4
line 1686
;1670:}
;1671:
;1672:/*
;1673:=====================
;1674:Q_acos
;1675:
;1676:the msvc acos doesn't always return a value between -PI and PI:
;1677:
;1678:int i;
;1679:i = 1065353246;
;1680:acos(*(float*) &i) == -1.#IND0
;1681:
;1682:        This should go in q_math but it is too late to add new traps
;1683:        to game and ui
;1684:=====================
;1685:*/
;1686:float Q_acos(float c) {
line 1689
;1687:        float angle;
;1688:
;1689:        angle = acos(c);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1691
;1690:
;1691:        if (angle > M_PI) {
ADDRLP4 0
INDIRF4
CNSTF4 1078530011
LEF4 $450
line 1692
;1692:                return (float)M_PI;
CNSTF4 1078530011
RETF4
ADDRGP4 $449
JUMPV
LABELV $450
line 1694
;1693:        }
;1694:        if (angle < -M_PI) {
ADDRLP4 0
INDIRF4
CNSTF4 3226013659
GEF4 $452
line 1695
;1695:                return (float)M_PI;
CNSTF4 1078530011
RETF4
ADDRGP4 $449
JUMPV
LABELV $452
line 1697
;1696:        }
;1697:        return angle;
ADDRLP4 0
INDIRF4
RETF4
LABELV $449
endproc Q_acos 8 4
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
import VectorDistance
import BoundsIntersectSphere
import BoundsIntersect
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
