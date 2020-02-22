export CG_Alloc
code
proc CG_Alloc 44 12
file "..\..\..\..\src/cgame/cg_mem.c"
line 42
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
;24:#include "cg_local.h"
;25:
;26:#define POOLSIZE      (256 * 1024)
;27:#define FREEMEMCOOKIE ((int)0xDEADBE3F) // Any unlikely to be used value
;28:#define ROUNDBITS     31          // Round to 32 bytes
;29:
;30:struct freememnode
;31:{
;32:  // Size of ROUNDBITS
;33:  int cookie, size;       // Size includes node (obviously)
;34:  struct freememnode *prev, *next;
;35:};
;36:
;37:static char   memoryPool[ POOLSIZE ];
;38:static struct freememnode *freehead;
;39:static int    freemem;
;40:
;41:void *CG_Alloc( int size )
;42:{
line 51
;43:  // Find a free block and allocate.
;44:  // Does two passes, attempts to fill same-sized free slot first.
;45:
;46:  struct freememnode *fmn, *prev, *next, *smallest;
;47:  int allocsize, smallestsize;
;48:  char *endptr;
;49:  int *ptr;
;50:
;51:  allocsize = ( size + sizeof(int) + ROUNDBITS ) & ~ROUNDBITS;    // Round to 32-byte boundary
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 4
ADDU4
CNSTU4 31
ADDU4
CNSTU4 4294967264
BANDU4
CVUI4 4
ASGNI4
line 52
;52:  ptr = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 54
;53:
;54:  smallest = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 55
;55:  smallestsize = POOLSIZE + 1;    // Guaranteed not to miss any slots :)
ADDRLP4 24
CNSTI4 262145
ASGNI4
line 56
;56:  for( fmn = freehead; fmn; fmn = fmn->next )
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $103
JUMPV
LABELV $100
line 57
;57:  {
line 58
;58:    if( fmn->cookie != FREEMEMCOOKIE )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $104
line 59
;59:      CG_Error( "CG_Alloc: Memory corruption detected!\n" );
ADDRGP4 $106
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $104
line 61
;60:
;61:    if( fmn->size >= allocsize )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $107
line 62
;62:    {
line 64
;63:      // We've got a block
;64:      if( fmn->size == allocsize )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $109
line 65
;65:      {
line 68
;66:        // Same size, just remove
;67:
;68:        prev = fmn->prev;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
line 69
;69:        next = fmn->next;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 70
;70:        if( prev )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $111
line 71
;71:          prev->next = next;      // Point previous node to next
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $111
line 72
;72:        if( next )
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
line 73
;73:          next->prev = prev;      // Point next node to previous
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $113
line 74
;74:        if( fmn == freehead )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 freehead
INDIRP4
CVPU4 4
NEU4 $115
line 75
;75:          freehead = next;      // Set head pointer to next
ADDRGP4 freehead
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $115
line 76
;76:        ptr = (int *) fmn;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 77
;77:        break;              // Stop the loop, this is fine
ADDRGP4 $102
JUMPV
LABELV $109
line 80
;78:      }
;79:      else
;80:      {
line 82
;81:        // Keep track of the smallest free slot
;82:        if( fmn->size < smallestsize )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $117
line 83
;83:        {
line 84
;84:          smallest = fmn;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 85
;85:          smallestsize = fmn->size;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 86
;86:        }
LABELV $117
line 87
;87:      }
line 88
;88:    }
LABELV $107
line 89
;89:  }
LABELV $101
line 56
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $103
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
LABELV $102
line 91
;90:
;91:  if( !ptr && smallest )
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
NEU4 $119
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $119
line 92
;92:  {
line 94
;93:    // We found a slot big enough
;94:    smallest->size -= allocsize;
ADDRLP4 36
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 95
;95:    endptr = (char *) smallest + smallest->size;
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 96
;96:    ptr = (int *) endptr;
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 97
;97:  }
LABELV $119
line 99
;98:
;99:  if( ptr )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
line 100
;100:  {
line 101
;101:    freemem -= allocsize;
ADDRLP4 36
ADDRGP4 freemem
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 102
;102:    if( cg_debugAlloc.integer )
ADDRGP4 cg_debugAlloc+12
INDIRI4
CNSTI4 0
EQI4 $123
line 103
;103:      CG_Printf( "CG_Alloc of %i bytes (%i left)\n", allocsize, freemem );
ADDRGP4 $126
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 freemem
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $123
line 104
;104:    memset( ptr, 0, allocsize );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 105
;105:    *ptr++ = allocsize;       // Store a copy of size for deallocation
ADDRLP4 40
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 106
;106:    return( (void *) ptr );
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $99
JUMPV
LABELV $121
line 109
;107:  }
;108:
;109:  CG_Error( "CG_Alloc: failed on allocation of %i bytes\n", size );
ADDRGP4 $127
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 110
;110:  return( NULL );
CNSTP4 0
RETP4
LABELV $99
endproc CG_Alloc 44 12
export CG_Free
proc CG_Free 24 12
line 114
;111:}
;112:
;113:void CG_Free( void *ptr )
;114:{
line 121
;115:  // Release allocated memory, add it to the free list.
;116:
;117:  struct freememnode *fmn;
;118:  char *freeend;
;119:  int *freeptr;
;120:
;121:  freeptr = ptr;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 122
;122:  freeptr--;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 124
;123:
;124:  freemem += *freeptr;
ADDRLP4 12
ADDRGP4 freemem
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 125
;125:  if( cg_debugAlloc.integer )
ADDRGP4 cg_debugAlloc+12
INDIRI4
CNSTI4 0
EQI4 $129
line 126
;126:    CG_Printf( "CG_Free of %i bytes (%i left)\n", *freeptr, freemem );
ADDRGP4 $132
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 freemem
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $129
line 128
;127:
;128:  for( fmn = freehead; fmn; fmn = fmn->next )
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $136
JUMPV
LABELV $133
line 129
;129:  {
line 130
;130:    freeend = ((char *) fmn) + fmn->size;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 131
;131:    if( freeend == (char *) freeptr )
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $137
line 132
;132:    {
line 135
;133:      // Released block can be merged to an existing node
;134:
;135:      fmn->size += *freeptr;    // Add size of node.
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 136
;136:      return;
ADDRGP4 $128
JUMPV
LABELV $137
line 138
;137:    }
;138:  }
LABELV $134
line 128
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $136
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $133
line 141
;139:  // No merging, add to head of list
;140:
;141:  fmn = (struct freememnode *) freeptr;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 142
;142:  fmn->size = *freeptr;       // Set this first to avoid corrupting *freeptr
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 143
;143:  fmn->cookie = FREEMEMCOOKIE;
ADDRLP4 0
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 144
;144:  fmn->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 145
;145:  fmn->next = freehead;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 freehead
INDIRP4
ASGNP4
line 146
;146:  freehead->prev = fmn;
ADDRGP4 freehead
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 147
;147:  freehead = fmn;
ADDRGP4 freehead
ADDRLP4 0
INDIRP4
ASGNP4
line 148
;148:}
LABELV $128
endproc CG_Free 24 12
export CG_InitMemory
proc CG_InitMemory 0 0
line 151
;149:
;150:void CG_InitMemory( void )
;151:{
line 154
;152:  // Set up the initial node
;153:
;154:  freehead = (struct freememnode *) memoryPool;
ADDRGP4 freehead
ADDRGP4 memoryPool
ASGNP4
line 155
;155:  freehead->cookie = FREEMEMCOOKIE;
ADDRGP4 freehead
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 156
;156:  freehead->size = POOLSIZE;
ADDRGP4 freehead
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 262144
ASGNI4
line 157
;157:  freehead->next = NULL;
ADDRGP4 freehead
INDIRP4
CNSTI4 12
ADDP4
CNSTP4 0
ASGNP4
line 158
;158:  freehead->prev = NULL;
ADDRGP4 freehead
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 159
;159:  freemem = sizeof(memoryPool);
ADDRGP4 freemem
CNSTI4 262144
ASGNI4
line 160
;160:}
LABELV $139
endproc CG_InitMemory 0 0
export CG_DefragmentMemory
proc CG_DefragmentMemory 36 12
line 163
;161:
;162:void CG_DefragmentMemory( void )
;163:{
line 170
;164:  // If there's a frenzy of deallocation and we want to
;165:  // allocate something big, this is useful. Otherwise...
;166:  // not much use.
;167:
;168:  struct freememnode *startfmn, *endfmn, *fmn;
;169:
;170:  for( startfmn = freehead; startfmn; )
ADDRLP4 8
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $141
line 171
;171:  {
line 172
;172:    endfmn = (struct freememnode *)(((char *) startfmn) + startfmn->size);
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
line 173
;173:    for( fmn = freehead; fmn; )
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $148
JUMPV
LABELV $145
line 174
;174:    {
line 175
;175:      if( fmn->cookie != FREEMEMCOOKIE )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $149
line 176
;176:        CG_Error( "CG_DefragmentMemory: Memory corruption detected!\n" );
ADDRGP4 $151
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $149
line 178
;177:
;178:      if( fmn == endfmn )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $152
line 179
;179:      {
line 182
;180:        // We can add fmn onto startfmn.
;181:
;182:        if( fmn->prev )
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $154
line 183
;183:          fmn->prev->next = fmn->next;
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
LABELV $154
line 184
;184:        if( fmn->next )
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
line 185
;185:        {
line 186
;186:          if( !(fmn->next->prev = fmn->prev) )
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 187
;187:            freehead = fmn->next; // We're removing the head node
ADDRGP4 freehead
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $158
line 188
;188:        }
LABELV $156
line 189
;189:        startfmn->size += fmn->size;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 190
;190:        memset( fmn, 0, sizeof(struct freememnode) ); // A redundant call, really.
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 192
;191:
;192:        startfmn = freehead;
ADDRLP4 8
ADDRGP4 freehead
INDIRP4
ASGNP4
line 193
;193:        endfmn = fmn = NULL;        // Break out of current loop
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 194
;194:      }
ADDRGP4 $153
JUMPV
LABELV $152
line 196
;195:      else
;196:        fmn = fmn->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $153
line 197
;197:    }
LABELV $146
line 173
LABELV $148
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $145
line 199
;198:
;199:    if( endfmn )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
line 200
;200:      startfmn = startfmn->next;    // endfmn acts as a 'restart' flag here
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $160
line 201
;201:  }
LABELV $142
line 170
LABELV $144
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $141
line 202
;202:}
LABELV $140
endproc CG_DefragmentMemory 36 12
bss
align 4
LABELV freemem
skip 4
align 4
LABELV freehead
skip 4
align 1
LABELV memoryPool
skip 262144
import trap_GetDemoName
import trap_GetDemoPos
import trap_GetDemoState
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBiSphereTrace
import trap_CM_BiSphereTrace
import trap_CM_TransformedCapsuleTrace
import trap_CM_CapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_LiteralArgs
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_TutorialText
import CG_WritePTRCode
import CG_ReadPTRCode
import CG_DestroyTestTS_f
import CG_TestTS_f
import CG_AddTrails
import CG_IsTrailSystemValid
import CG_DestroyTrailSystem
import CG_SpawnNewTrailSystem
import CG_RegisterTrailSystem
import CG_LoadTrailSystems
import CG_DestroyTestPS_f
import CG_TestPS_f
import CG_ParticleSystemEntity
import CG_AddParticles
import CG_SetParticleSystemNormal
import CG_IsParticleSystemValid
import CG_IsParticleSystemInfinite
import CG_DestroyParticleSystem
import CG_SpawnNewParticleSystem
import CG_RegisterParticleSystem
import CG_LoadParticleSystems
import CG_SetAttachmentOffset
import CG_SetAttachmentParticle
import CG_SetAttachmentTag
import CG_SetAttachmentCent
import CG_SetAttachmentPoint
import CG_AttachToParticle
import CG_AttachToTag
import CG_AttachToCent
import CG_AttachToPoint
import CG_Attached
import CG_AttachmentCentNum
import CG_AttachmentVelocity
import CG_AttachmentAxis
import CG_AttachmentDir
import CG_AttachmentPoint
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_RequestScores
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ProcessSnapshots
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_AlienSense
import CG_Scanner
import CG_UpdateEntityPositions
import CG_DrawItemSelectText
import CG_DrawItemSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_ShotgunFire
import CG_Bullet
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterWeapon
import CG_InitWeapons
import CG_RegisterUpgrade
import CG_InitUpgrades
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_DrawBoundingBox
import CG_PainEvent
import CG_EntityEvent
import CG_CheckEvents
import CG_PredictPlayerState
import CG_BiSphereTrace
import CG_CapTrace
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_ModelDoor
import CG_AnimMapObj
import CG_RunLerpFrame
import CG_AlienBuildableExplosion
import CG_HumanBuildableExplosion
import CG_InitBuildables
import CG_Buildable
import CG_GhostBuildable
import CG_AtHighestClass
import CG_Bleed
import CG_PlayerOnFire
import CG_PlayerDisconnect
import CG_CustomSound
import CG_PrecacheClientInfo
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Corpse
import CG_Player
import CG_ResetPainBlend
import CG_UpdateMediaFraction
import CG_DrawLoadingScreen
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_RunMenuScript
import CG_GetValue
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawActive
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawFadePic
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawPlane
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_addSmoothOp
import CG_AddNotifyText
import CG_RemoveNotifyLine
import CG_FileExists
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_PlayerCount
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugRandom
import ui_humanTeamVoteActive
import ui_alienTeamVoteActive
import ui_voteActive
import ui_loading
import ui_dialog
import ui_stages
import ui_carriage
import ui_currentClass
import cg_painBlendZoom
import cg_painBlendScale
import cg_painBlendMax
import cg_painBlendDownRate
import cg_painBlendUpRate
import cg_tutorial
import cg_disableScannerPlane
import cg_disableWarningDialogs
import cg_debugPVS
import cg_debugTrails
import cg_debugParticles
import cg_lightFlare
import cg_consoleLatency
import cg_depthSortParticles
import cg_wwToggle
import cg_wwFollow
import cg_wwSmoothTime
import cg_debugAlloc
import cg_drawBBOX
import cg_drawSurfNormal
import cg_creepRes
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonhax
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRangehax
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_debugMove
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_teslaTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawDemoState
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_buildables
import cg_upgrades
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $151
byte 1 67
byte 1 71
byte 1 95
byte 1 68
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 67
byte 1 71
byte 1 95
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 111
byte 1 102
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
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 67
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 32
byte 1 111
byte 1 102
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
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $106
byte 1 67
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
