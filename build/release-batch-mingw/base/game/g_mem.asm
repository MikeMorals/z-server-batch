export G_Alloc
code
proc G_Alloc 44 12
file "..\..\..\..\src/game/g_mem.c"
line 40
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
;26:#define  POOLSIZE ( 1024 * 1024 )
;27:#define  FREEMEMCOOKIE  ((int)0xDEADBE3F)  // Any unlikely to be used value
;28:#define  ROUNDBITS    31          // Round to 32 bytes
;29:
;30:struct freememnode {
;31:  // Size of ROUNDBITS
;32:  int cookie, size; // Size includes node (obviously)
;33:  struct freememnode *prev, *next;
;34:};
;35:
;36:static char memoryPool[POOLSIZE];
;37:static struct freememnode *freehead;
;38:static int freemem;
;39:
;40:void *G_Alloc(int size) {
line 49
;41:  // Find a free block and allocate.
;42:  // Does two passes, attempts to fill same-sized free slot first.
;43:
;44:  struct freememnode *fmn, *prev, *next, *smallest;
;45:  int allocsize, smallestsize;
;46:  char *endptr;
;47:  int *ptr;
;48:
;49:  allocsize = (size + sizeof (int) +ROUNDBITS) & ~ROUNDBITS; // Round to 32-byte boundary
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
line 50
;50:  ptr = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 52
;51:
;52:  smallest = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 53
;53:  smallestsize = POOLSIZE + 1; // Guaranteed not to miss any slots :)
ADDRLP4 24
CNSTI4 1048577
ASGNI4
line 54
;54:  for (fmn = freehead; fmn; fmn = fmn->next) {
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $88
JUMPV
LABELV $85
line 55
;55:    if (fmn->cookie != FREEMEMCOOKIE)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $89
line 56
;56:      G_Error("G_Alloc: Memory corruption detected!\n");
ADDRGP4 $91
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $89
line 58
;57:
;58:    if (fmn->size >= allocsize) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $92
line 60
;59:      // We've got a block
;60:      if (fmn->size == allocsize) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $94
line 63
;61:        // Same size, just remove
;62:
;63:        prev = fmn->prev;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
line 64
;64:        next = fmn->next;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 65
;65:        if (prev)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $96
line 66
;66:          prev->next = next; // Point previous node to next
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $96
line 67
;67:        if (next)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
line 68
;68:          next->prev = prev; // Point next node to previous
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $98
line 69
;69:        if (fmn == freehead)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 freehead
INDIRP4
CVPU4 4
NEU4 $100
line 70
;70:          freehead = next; // Set head pointer to next
ADDRGP4 freehead
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $100
line 71
;71:        ptr = (int *) fmn;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 72
;72:        break; // Stop the loop, this is fine
ADDRGP4 $87
JUMPV
LABELV $94
line 73
;73:      } else {
line 75
;74:        // Keep track of the smallest free slot
;75:        if (fmn->size < smallestsize) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $102
line 76
;76:          smallest = fmn;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 77
;77:          smallestsize = fmn->size;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 78
;78:        }
LABELV $102
line 79
;79:      }
line 80
;80:    }
LABELV $92
line 81
;81:  }
LABELV $86
line 54
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $88
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $85
LABELV $87
line 83
;82:
;83:  if (!ptr && smallest) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
NEU4 $104
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $104
line 85
;84:    // We found a slot big enough
;85:    smallest->size -= allocsize;
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
line 86
;86:    endptr = (char *) smallest + smallest->size;
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
line 87
;87:    ptr = (int *) endptr;
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 88
;88:  }
LABELV $104
line 90
;89:
;90:  if (ptr) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
line 91
;91:    freemem -= allocsize;
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
line 92
;92:    if (g_debugAlloc.integer)
ADDRGP4 g_debugAlloc+12
INDIRI4
CNSTI4 0
EQI4 $108
line 93
;93:      G_Printf("G_Alloc of %i bytes (%i left)\n", allocsize, freemem);
ADDRGP4 $111
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 freemem
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $108
line 94
;94:    memset(ptr, 0, allocsize);
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
line 95
;95:    *ptr++ = allocsize; // Store a copy of size for deallocation
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
line 96
;96:    return ( (void *) ptr);
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $84
JUMPV
LABELV $106
line 99
;97:  }
;98:
;99:  G_Error("G_Alloc: failed on allocation of %i bytes\n", size);
ADDRGP4 $112
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 100
;100:  return ( NULL);
CNSTP4 0
RETP4
LABELV $84
endproc G_Alloc 44 12
export G_Free
proc G_Free 24 12
line 103
;101:}
;102:
;103:void G_Free(void *ptr) {
line 110
;104:  // Release allocated memory, add it to the free list.
;105:
;106:  struct freememnode *fmn;
;107:  char *freeend;
;108:  int *freeptr;
;109:
;110:  freeptr = ptr;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 111
;111:  freeptr--;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 113
;112:
;113:  freemem += *freeptr;
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
line 114
;114:  if (g_debugAlloc.integer)
ADDRGP4 g_debugAlloc+12
INDIRI4
CNSTI4 0
EQI4 $114
line 115
;115:    G_Printf("G_Free of %i bytes (%i left)\n", *freeptr, freemem);
ADDRGP4 $117
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 freemem
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $114
line 117
;116:
;117:  for (fmn = freehead; fmn; fmn = fmn->next) {
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $121
JUMPV
LABELV $118
line 118
;118:    freeend = ((char *) fmn) + fmn->size;
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
line 119
;119:    if (freeend == (char *) freeptr) {
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $122
line 122
;120:      // Released block can be merged to an existing node
;121:
;122:      fmn->size += *freeptr; // Add size of node.
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
line 123
;123:      return;
ADDRGP4 $113
JUMPV
LABELV $122
line 125
;124:    }
;125:  }
LABELV $119
line 117
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $121
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $118
line 128
;126:  // No merging, add to head of list
;127:
;128:  fmn = (struct freememnode *) freeptr;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 129
;129:  fmn->size = *freeptr; // Set this first to avoid corrupting *freeptr
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 130
;130:  fmn->cookie = FREEMEMCOOKIE;
ADDRLP4 0
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 131
;131:  fmn->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 132
;132:  fmn->next = freehead;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 freehead
INDIRP4
ASGNP4
line 133
;133:  freehead->prev = fmn;
ADDRGP4 freehead
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 134
;134:  freehead = fmn;
ADDRGP4 freehead
ADDRLP4 0
INDIRP4
ASGNP4
line 135
;135:}
LABELV $113
endproc G_Free 24 12
export G_InitMemory
proc G_InitMemory 0 0
line 137
;136:
;137:void G_InitMemory(void) {
line 140
;138:  // Set up the initial node
;139:
;140:  freehead = (struct freememnode *) memoryPool;
ADDRGP4 freehead
ADDRGP4 memoryPool
ASGNP4
line 141
;141:  freehead->cookie = FREEMEMCOOKIE;
ADDRGP4 freehead
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 142
;142:  freehead->size = POOLSIZE;
ADDRGP4 freehead
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1048576
ASGNI4
line 143
;143:  freehead->next = NULL;
ADDRGP4 freehead
INDIRP4
CNSTI4 12
ADDP4
CNSTP4 0
ASGNP4
line 144
;144:  freehead->prev = NULL;
ADDRGP4 freehead
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 145
;145:  freemem = sizeof ( memoryPool);
ADDRGP4 freemem
CNSTI4 1048576
ASGNI4
line 146
;146:}
LABELV $124
endproc G_InitMemory 0 0
export G_DefragmentMemory
proc G_DefragmentMemory 36 12
line 148
;147:
;148:void G_DefragmentMemory(void) {
line 155
;149:  // If there's a frenzy of deallocation and we want to
;150:  // allocate something big, this is useful. Otherwise...
;151:  // not much use.
;152:
;153:  struct freememnode *startfmn, *endfmn, *fmn;
;154:
;155:  for (startfmn = freehead; startfmn;) {
ADDRLP4 8
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $129
JUMPV
LABELV $126
line 156
;156:    endfmn = (struct freememnode *) (((char *) startfmn) + startfmn->size);
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
line 157
;157:    for (fmn = freehead; fmn;) {
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $133
JUMPV
LABELV $130
line 158
;158:      if (fmn->cookie != FREEMEMCOOKIE)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $134
line 159
;159:        G_Error("G_DefragmentMemory: Memory corruption detected!\n");
ADDRGP4 $136
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $134
line 161
;160:
;161:      if (fmn == endfmn) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $137
line 164
;162:        // We can add fmn onto startfmn.
;163:
;164:        if (fmn->prev)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
line 165
;165:          fmn->prev->next = fmn->next;
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
LABELV $139
line 166
;166:        if (fmn->next) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 167
;167:          if (!(fmn->next->prev = fmn->prev))
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
NEU4 $143
line 168
;168:            freehead = fmn->next; // We're removing the head node
ADDRGP4 freehead
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $143
line 169
;169:        }
LABELV $141
line 170
;170:        startfmn->size += fmn->size;
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
line 171
;171:        memset(fmn, 0, sizeof (struct freememnode)); // A redundant call, really.
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
line 173
;172:
;173:        startfmn = freehead;
ADDRLP4 8
ADDRGP4 freehead
INDIRP4
ASGNP4
line 174
;174:        endfmn = fmn = NULL; // Break out of current loop
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
line 175
;175:      } else
ADDRGP4 $138
JUMPV
LABELV $137
line 176
;176:        fmn = fmn->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $138
line 177
;177:    }
LABELV $131
line 157
LABELV $133
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $130
line 179
;178:
;179:    if (endfmn)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $145
line 180
;180:      startfmn = startfmn->next; // endfmn acts as a 'restart' flag here
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $145
line 181
;181:  }
LABELV $127
line 155
LABELV $129
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $126
line 182
;182:}
LABELV $125
endproc G_DefragmentMemory 36 12
export Svcmd_GameMem_f
proc Svcmd_GameMem_f 12 12
line 184
;183:
;184:void Svcmd_GameMem_f(void) {
line 189
;185:  // Give a breakdown of memory
;186:
;187:  struct freememnode *fmn;
;188:
;189:  G_Printf("Game memory status: %i out of %i bytes allocated\n", POOLSIZE - freemem, POOLSIZE);
ADDRGP4 $148
ARGP4
ADDRLP4 4
CNSTI4 1048576
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 freemem
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 191
;190:
;191:  for (fmn = freehead; fmn; fmn = fmn->next)
ADDRLP4 0
ADDRGP4 freehead
INDIRP4
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $149
line 192
;192:    G_Printf("  %dd: %d bytes free.\n", fmn, fmn->size);
ADDRGP4 $153
ARGP4
ADDRLP4 0
INDIRP4
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
LABELV $150
line 191
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $152
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
line 193
;193:  G_Printf("Status complete.\n");
ADDRGP4 $154
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 194
;194:}
LABELV $147
endproc Svcmd_GameMem_f 12 12
bss
align 4
LABELV freemem
skip 4
align 4
LABELV freehead
skip 4
align 1
LABELV memoryPool
skip 1048576
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
LABELV $154
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $153
byte 1 32
byte 1 32
byte 1 37
byte 1 100
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
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 105
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
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $136
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
LABELV $117
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
LABELV $112
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
LABELV $111
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
LABELV $91
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
