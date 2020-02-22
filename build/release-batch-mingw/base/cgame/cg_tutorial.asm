data
align 4
LABELV bindings
address $100
address $101
byte 4 -1
byte 4 -1
address $102
address $103
byte 4 -1
byte 4 -1
address $104
address $105
byte 4 -1
byte 4 -1
address $106
address $107
byte 4 -1
byte 4 -1
address $108
address $109
byte 4 -1
byte 4 -1
address $110
address $111
byte 4 -1
byte 4 -1
address $112
address $113
byte 4 -1
byte 4 -1
address $114
address $115
byte 4 -1
byte 4 -1
address $116
address $117
byte 4 -1
byte 4 -1
address $118
address $119
byte 4 -1
byte 4 -1
address $120
address $121
byte 4 -1
byte 4 -1
address $122
address $123
byte 4 -1
byte 4 -1
address $124
address $125
byte 4 -1
byte 4 -1
address $126
address $127
byte 4 -1
byte 4 -1
address $128
address $129
byte 4 -1
byte 4 -1
lit
align 4
LABELV numBindings
byte 4 15
code
proc CG_GetBindings 1052 12
file "..\..\..\..\src/cgame/cg_tutorial.c"
line 61
;1:/*
;2:===========================================================================
;3:Copyright (C) 2000-2006 Tim Angus
;4:
;5:This file is part of Tremulous.
;6:
;7:Tremulous is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Tremulous is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Tremulous; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:// cg_tutorial.c -- the tutorial system
;24:
;25:#include "cg_local.h"
;26:
;27:typedef struct
;28:{
;29:  char      *command;
;30:  char      *humanName;
;31:  keyNum_t  keys[ 2 ];
;32:} bind_t;
;33:
;34:static bind_t bindings[ ] =
;35:{
;36:  { "+button2",       "Activate Upgrade",       { -1, -1 } },
;37:  { "+speed",         "Run/Walk",               { -1, -1 } },
;38:  { "boost",          "Sprint",                 { -1, -1 } },
;39:  { "+moveup",        "Jump",                   { -1, -1 } },
;40:  { "+movedown",      "Crouch",                 { -1, -1 } },
;41:  { "+zoom",          "ZoomView",               { -1, -1 } },
;42:  { "+attack",        "Primary Attack",         { -1, -1 } },
;43:  { "+button5",       "Secondary Attack",       { -1, -1 } },
;44:  { "reload",         "Reload",                 { -1, -1 } },
;45:  { "buy ammo",       "Buy Ammo",               { -1, -1 } },
;46:  { "itemact medkit", "Use Medkit",             { -1, -1 } },
;47:  { "+button7",       "Use Structure/Evolve",   { -1, -1 } },
;48:  { "deconstruct",    "Deconstruct Structure",  { -1, -1 } },
;49:  { "weapprev",       "Previous Upgrade",       { -1, -1 } },
;50:  { "weapnext",       "Next Upgrade",           { -1, -1 } }
;51:};
;52:
;53:static const int numBindings = sizeof( bindings ) / sizeof( bind_t );
;54:
;55:/*
;56:=================
;57:CG_GetBindings
;58:=================
;59:*/
;60:static void CG_GetBindings( void )
;61:{
line 65
;62:  int   i, j, numKeys;
;63:  char  buffer[ MAX_STRING_CHARS ];
;64:
;65:  for( i = 0; i < numBindings; i++ )
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 66
;66:  {
line 67
;67:    bindings[ i ].keys[ 0 ] = bindings[ i ].keys[ 1 ] = K_NONE;
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 bindings+8+4
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 bindings+8
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 68
;68:    numKeys = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 70
;69:
;70:    for( j = 0; j < K_LAST_KEY; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $138
line 71
;71:    {
line 72
;72:      trap_Key_GetBindingBuf( j, buffer, MAX_STRING_CHARS );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Key_GetBindingBuf
CALLV
pop
line 74
;73:
;74:      if( buffer[ 0 ] == 0 )
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $142
line 75
;75:        continue;
ADDRGP4 $139
JUMPV
LABELV $142
line 77
;76:
;77:      if( !Q_stricmp( buffer, bindings[ i ].command ) )
ADDRLP4 4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $144
line 78
;78:      {
line 79
;79:        bindings[ i ].keys[ numKeys++ ] = j;
ADDRLP4 1048
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 81
;80:
;81:        if( numKeys > 1 )
ADDRLP4 1032
INDIRI4
CNSTI4 1
LEI4 $147
line 82
;82:          break;
ADDRGP4 $140
JUMPV
LABELV $147
line 83
;83:      }
LABELV $144
line 84
;84:    }
LABELV $139
line 70
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $138
LABELV $140
line 85
;85:  }
LABELV $132
line 65
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 1028
INDIRI4
ADDRGP4 numBindings
INDIRI4
LTI4 $131
line 86
;86:}
LABELV $130
endproc CG_GetBindings 1052 12
bss
align 1
LABELV $150
skip 1024
code
proc CG_KeyNameForCommand 52 12
line 94
;87:
;88:/*
;89:===============
;90:CG_KeyNameForCommand
;91:===============
;92:*/
;93:static const char *CG_KeyNameForCommand( const char *command )
;94:{
line 99
;95:  int         i, j;
;96:  static char buffer[ MAX_STRING_CHARS ];
;97:  int         firstKeyLength;
;98:
;99:  buffer[ 0 ] = '\0';
ADDRGP4 $150
CNSTI1 0
ASGNI1
line 101
;100:
;101:  for( i = 0; i < numBindings; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $151
line 102
;102:  {
line 103
;103:    if( !Q_stricmp( command, bindings[ i ].command ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings
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
NEI4 $155
line 104
;104:    {
line 105
;105:      if( bindings[ i ].keys[ 0 ] != K_NONE )
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $157
line 106
;106:      {
line 107
;107:        trap_Key_KeynumToStringBuf( bindings[ i ].keys[ 0 ],
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Key_KeynumToStringBuf
CALLV
pop
line 109
;108:            buffer, MAX_STRING_CHARS );
;109:        firstKeyLength = strlen( buffer );
ADDRGP4 $150
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 111
;110:
;111:        for( j = 0; j < firstKeyLength; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $161
line 112
;112:          buffer[ j ] = toupper( buffer[ j ] );
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRGP4 $150
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CVII1 4
ASGNI1
LABELV $162
line 111
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $161
line 114
;113:
;114:        if( bindings[ i ].keys[ 1 ] != K_NONE )
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $158
line 115
;115:        {
line 116
;116:          Q_strcat( buffer, MAX_STRING_CHARS, " or " );
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $169
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 117
;117:          trap_Key_KeynumToStringBuf( bindings[ i ].keys[ 1 ],
ADDRGP4 $150
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRGP4 $150
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
ADDP4
ARGP4
CNSTI4 1024
ADDRLP4 36
INDIRI4
SUBI4
ARGI4
ADDRGP4 trap_Key_KeynumToStringBuf
CALLV
pop
line 120
;118:              buffer + strlen( buffer ), MAX_STRING_CHARS - strlen( buffer ) );
;119:
;120:          for( j = firstKeyLength + 4; j < strlen( buffer ); j++ )
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 121
;121:            buffer[ j ] = toupper( buffer[ j ] );
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRGP4 $150
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 44
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CVII1 4
ASGNI1
LABELV $173
line 120
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRGP4 $150
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $172
line 122
;122:        }
line 123
;123:      }
ADDRGP4 $158
JUMPV
LABELV $157
line 125
;124:      else
;125:      {
line 126
;126:        Q_strncpyz( buffer, va( "\"%s\"", bindings[ i ].humanName ),
ADDRGP4 $176
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $150
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 128
;127:            MAX_STRING_CHARS );
;128:        Q_strcat( buffer, MAX_STRING_CHARS, " (unbound)" );
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $178
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 129
;129:      }
LABELV $158
line 131
;130:
;131:      return buffer;
ADDRGP4 $150
RETP4
ADDRGP4 $149
JUMPV
LABELV $155
line 133
;132:    }
;133:  }
LABELV $152
line 101
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $154
ADDRLP4 4
INDIRI4
ADDRGP4 numBindings
INDIRI4
LTI4 $151
line 135
;134:
;135:  return "";
ADDRGP4 $179
RETP4
LABELV $149
endproc CG_KeyNameForCommand 52 12
proc CG_BuildableInRange 108 28
line 146
;136:}
;137:
;138:#define MAX_TUTORIAL_TEXT 4096
;139:
;140:/*
;141:===============
;142:CG_BuildableInRange
;143:===============
;144:*/
;145:static qboolean CG_BuildableInRange( playerState_t *ps )
;146:{
line 151
;147:  vec3_t        view, point;
;148:  trace_t       trace;
;149:  entityState_t *es;
;150:
;151:  AngleVectors( cg.refdefViewAngles, view, NULL, NULL );
ADDRGP4 cg+110408
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
line 152
;152:  VectorMA( cg.refdef.vieworg, 64, view, point );
ADDRLP4 92
CNSTF4 1115684864
ASGNF4
ADDRLP4 12
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+110040+24+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 153
;153:  CG_Trace( &trace, cg.refdef.vieworg, NULL, NULL,
ADDRLP4 28
ARGP4
ADDRGP4 cg+110040+24
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 156
;154:            point, ps->clientNum, MASK_SHOT );
;155:
;156:  es = &cg_entities[ trace.entityNum ].currentState;
ADDRLP4 24
CNSTI4 1724
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 158
;157:
;158:  if( es->eType == ET_BUILDABLE &&
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $197
ADDRLP4 24
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $197
line 160
;159:      ps->stats[ STAT_PTEAM ] == BG_FindTeamForBuildable( es->modelindex ) )
;160:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $180
JUMPV
LABELV $197
line 162
;161:  else
;162:    return qfalse;
CNSTI4 0
RETI4
LABELV $180
endproc CG_BuildableInRange 108 28
proc CG_AlienBuilderText 28 12
line 171
;163:}
;164:
;165:/*
;166:===============
;167:CG_AlienBuilderText
;168:===============
;169:*/
;170:static void CG_AlienBuilderText( char *text, playerState_t *ps )
;171:{
line 172
;172:  buildable_t buildable = ps->stats[ STAT_BUILDABLE ] & ~SB_VALID_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 174
;173:
;174:  if( buildable > BA_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $200
line 175
;175:  {
line 176
;176:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $202
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 181
;177:        va( "Press %s to place the %s\n",
;178:          CG_KeyNameForCommand( "+attack" ),
;179:          BG_FindHumanNameForBuildable( buildable ) ) );
;180:
;181:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 185
;182:        va( "Press %s to cancel placing the %s\n",
;183:          CG_KeyNameForCommand( "+button5" ),
;184:          BG_FindHumanNameForBuildable( buildable ) ) );
;185:  }
ADDRGP4 $201
JUMPV
LABELV $200
line 187
;186:  else
;187:  {
line 188
;188:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $204
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 192
;189:        va( "Press %s to build a structure\n",
;190:          CG_KeyNameForCommand( "+attack" ) ) );
;191:
;192:    if( CG_BuildableInRange( ps ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_BuildableInRange
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $205
line 193
;193:    {
line 194
;194:      Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $124
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 197
;195:          va( "Press %s to destroy this structure\n",
;196:            CG_KeyNameForCommand( "deconstruct" ) ) );
;197:    }
LABELV $205
line 198
;198:  }
LABELV $201
line 217
;199:
;200:  /*if( ps->stats[ STAT_PCLASS ] == PCL_ALIEN_BUILDER0_UPG )
;201:  {
;202:    if( ( ps->stats[ STAT_BUILDABLE ] & ~SB_VALID_TOGGLEBIT ) == BA_NONE )
;203:    {
;204:      Q_strcat( text, MAX_TUTORIAL_TEXT,
;205:          va( "Press %s to swipe\n",
;206:            CG_KeyNameForCommand( "+button5" ) ) );
;207:    }
;208:
;209:    Q_strcat( text, MAX_TUTORIAL_TEXT,
;210:        va( "Press %s to launch a projectile\n",
;211:          CG_KeyNameForCommand( "+button2" ) ) );
;212:
;213:    Q_strcat( text, MAX_TUTORIAL_TEXT,
;214:        va( "Press %s to walk on walls\n",
;215:          CG_KeyNameForCommand( "+movedown" ) ) );
;216:  }*/
;217:}
LABELV $199
endproc CG_AlienBuilderText 28 12
proc CG_AlienLevel0Text 8 12
line 225
;218:
;219:/*
;220:===============
;221:CG_AlienLevel0Text
;222:===============
;223:*/
;224:static void CG_AlienLevel0Text( char *text, playerState_t *ps )
;225:{
line 226
;226:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $209
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 229
;227:      "Touch a human to damage it\n" );
;228:
;229:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $108
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $210
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 232
;230:      va( "Press %s to walk on walls\n",
;231:        CG_KeyNameForCommand( "+movedown" ) ) );
;232:}
LABELV $208
endproc CG_AlienLevel0Text 8 12
proc CG_AlienLevel1Text 16 12
line 240
;233:
;234:/*
;235:===============
;236:CG_AlienLevel1Text
;237:===============
;238:*/
;239:static void CG_AlienLevel1Text( char *text, playerState_t *ps )
;240:{
line 241
;241:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $212
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 244
;242:      "Touch a human to grab it\n" );
;243:
;244:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $213
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 248
;245:      va( "Press %s to swipe\n",
;246:        CG_KeyNameForCommand( "+attack" ) ) );
;247:
;248:  if( ps->stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL1_UPG )
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 5
NEI4 $214
line 249
;249:  {
line 250
;250:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $216
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 253
;251:        va( "Press %s to spray poisonous gas\n",
;252:          CG_KeyNameForCommand( "+button5" ) ) );
;253:  }
LABELV $214
line 255
;254:
;255:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $108
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $210
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 258
;256:      va( "Press %s to walk on walls\n",
;257:        CG_KeyNameForCommand( "+movedown" ) ) );
;258:}
LABELV $211
endproc CG_AlienLevel1Text 16 12
proc CG_AlienLevel2Text 16 12
line 266
;259:
;260:/*
;261:===============
;262:CG_AlienLevel2Text
;263:===============
;264:*/
;265:static void CG_AlienLevel2Text( char *text, playerState_t *ps )
;266:{
line 267
;267:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $218
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 271
;268:      va( "Press %s to bite\n",
;269:        CG_KeyNameForCommand( "+attack" ) ) );
;270:
;271:  if( ps->stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL2_UPG )
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 7
NEI4 $219
line 272
;272:  {
line 273
;273:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $221
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 276
;274:        va( "Press %s to invoke an electrical attack\n",
;275:          CG_KeyNameForCommand( "+button5" ) ) );
;276:  }
LABELV $219
line 278
;277:
;278:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $106
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $222
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 281
;279:      va( "Hold down %s then touch a wall to wall jump\n",
;280:        CG_KeyNameForCommand( "+moveup" ) ) );
;281:}
LABELV $217
endproc CG_AlienLevel2Text 16 12
proc CG_AlienLevel3Text 16 12
line 289
;282:
;283:/*
;284:===============
;285:CG_AlienLevel3Text
;286:===============
;287:*/
;288:static void CG_AlienLevel3Text( char *text, playerState_t *ps )
;289:{
line 290
;290:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $218
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 294
;291:      va( "Press %s to bite\n",
;292:        CG_KeyNameForCommand( "+attack" ) ) );
;293:
;294:  if( ps->stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL3_UPG )
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 9
NEI4 $224
line 295
;295:  {
line 296
;296:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $100
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $226
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 299
;297:        va( "Press %s to launch a projectile\n",
;298:          CG_KeyNameForCommand( "+button2" ) ) );
;299:  }
LABELV $224
line 301
;300:
;301:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $227
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 304
;302:      va( "Hold down and release %s to pounce\n",
;303:        CG_KeyNameForCommand( "+button5" ) ) );
;304:}
LABELV $223
endproc CG_AlienLevel3Text 16 12
proc CG_AlienLevel4Text 16 12
line 312
;305:
;306:/*
;307:===============
;308:CG_AlienLevel4Text
;309:===============
;310:*/
;311:static void CG_AlienLevel4Text( char *text, playerState_t *ps )
;312:{
line 313
;313:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $213
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 317
;314:      va( "Press %s to swipe\n",
;315:        CG_KeyNameForCommand( "+attack" ) ) );
;316:
;317:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $229
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 320
;318:      va( "Hold down and release %s to charge\n",
;319:        CG_KeyNameForCommand( "+button5" ) ) );
;320:}
LABELV $228
endproc CG_AlienLevel4Text 16 12
proc CG_HumanCkitText 28 12
line 328
;321:
;322:/*
;323:===============
;324:CG_HumanCkitText
;325:===============
;326:*/
;327:static void CG_HumanCkitText( char *text, playerState_t *ps )
;328:{
line 329
;329:  buildable_t buildable = ps->stats[ STAT_BUILDABLE ] & ~SB_VALID_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 331
;330:
;331:	if (cgs.survivalRecords[0] > 0)
ADDRGP4 cgs+34672
INDIRI4
CNSTI4 0
LEI4 $231
line 332
;332:	{
line 333
;333:		Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 336
;334:				 va( "Press %s to deploy a healing dome\n",
;335:					CG_KeyNameForCommand( "+attack" ) ) );
;336:	}	
ADDRGP4 $232
JUMPV
LABELV $231
line 337
;337:	else {
line 338
;338:  if( buildable > BA_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $235
line 339
;339:  {
line 340
;340:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $202
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 345
;341:        va( "Press %s to place the %s\n",
;342:          CG_KeyNameForCommand( "+attack" ),
;343:          BG_FindHumanNameForBuildable( buildable ) ) );
;344:
;345:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 349
;346:        va( "Press %s to cancel placing the %s\n",
;347:          CG_KeyNameForCommand( "+button5" ),
;348:          BG_FindHumanNameForBuildable( buildable ) ) );
;349:  }
ADDRGP4 $236
JUMPV
LABELV $235
line 351
;350:  else
;351:  {
line 352
;352:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $204
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 356
;353:        va( "Press %s to build a structure\n",
;354:          CG_KeyNameForCommand( "+attack" ) ) );
;355:
;356:    if( CG_BuildableInRange( ps ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_BuildableInRange
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $237
line 357
;357:    {
line 358
;358:      Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $124
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 361
;359:          va( "Press %s to destroy this structure\n",
;360:            CG_KeyNameForCommand( "deconstruct" ) ) );
;361:    }
LABELV $237
line 362
;362:  }
LABELV $236
line 363
;363:}
LABELV $232
line 364
;364:}
LABELV $230
endproc CG_HumanCkitText 28 12
proc CG_HumanText 80 20
line 372
;365:
;366:/*
;367:===============
;368:CG_HumanText
;369:===============
;370:*/
;371:static void CG_HumanText( char *text, playerState_t *ps )
;372:{
line 375
;373:  char      *name;
;374:  int       ammo, clips;
;375:  upgrade_t upgrade = UP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 377
;376:
;377:  if( cg.weaponSelect <= 32 )
ADDRGP4 cg+109940
INDIRI4
CNSTI4 32
GTI4 $240
line 378
;378:    name = cg_weapons[ cg.weaponSelect ].humanName;
ADDRLP4 12
CNSTI4 900
ADDRGP4 cg+109940
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $241
JUMPV
LABELV $240
line 379
;379:  else if( cg.weaponSelect > 32 )
ADDRGP4 cg+109940
INDIRI4
CNSTI4 32
LEI4 $245
line 380
;380:  {
line 381
;381:    name = cg_upgrades[ cg.weaponSelect - 32 ].humanName;
ADDRLP4 12
CNSTI4 12
ADDRGP4 cg+109940
INDIRI4
MULI4
ADDRGP4 cg_upgrades-384+4
ADDP4
INDIRP4
ASGNP4
line 382
;382:    upgrade = cg.weaponSelect - 32;
ADDRLP4 0
ADDRGP4 cg+109940
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 383
;383:  }
LABELV $245
LABELV $241
line 385
;384:
;385:  BG_UnpackAmmoArray( ps->weapon, &ps->ammo, ps->powerups, &ammo, &clips );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 BG_UnpackAmmoArray
CALLV
pop
line 387
;386:
;387:  if( !ammo && !clips && !BG_FindInfinteAmmoForWeapon( ps->weapon ) )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $252
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $252
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindInfinteAmmoForWeapon
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $252
line 388
;388:  {
line 390
;389:    //no ammo
;390:    switch( ps->weapon )
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 3
LTI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $261-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $261
address $257
address $257
address $259
address $257
address $257
address $257
address $259
code
line 391
;391:    {
LABELV $257
line 397
;392:      case WP_MACHINEGUN:
;393:      case WP_CHAINGUN:
;394:      case WP_SHOTGUN:
;395:		case WP_LAUNCHER:
;396:		case WP_ROCKET_LAUNCHER:
;397:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $118
ARGP4
ADDRLP4 36
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $258
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 400
;398:            va( "Find an Armoury and press %s for more ammo\n",
;399:              CG_KeyNameForCommand( "buy ammo" ) ) );
;400:        break;
ADDRGP4 $253
JUMPV
LABELV $259
line 404
;401:
;402:      case WP_LAS_GUN:
;403:      case WP_MASS_DRIVER:
;404:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $118
ARGP4
ADDRLP4 44
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $260
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 407
;405:            va( "Find a Reactor or Repeater and press %s for more ammo\n",
;406:              CG_KeyNameForCommand( "buy ammo" ) ) );
;407:        break;
line 410
;408:
;409:      default:
;410:        break;
line 412
;411:    }
;412:  }
ADDRGP4 $253
JUMPV
LABELV $252
line 414
;413:  else
;414:  {
line 415
;415:    switch( ps->weapon )
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $264
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $272
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $273-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $273
address $269
address $264
address $269
address $269
address $269
address $269
address $266
address $269
address $269
code
LABELV $272
ADDRLP4 28
INDIRI4
CNSTI4 20
EQI4 $271
ADDRLP4 28
INDIRI4
CNSTI4 21
EQI4 $271
ADDRGP4 $264
JUMPV
line 416
;416:    {
LABELV $266
line 418
;417:		case WP_LAUNCHER:
;418:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 40
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 423
;419:            va( "Press %s to fire the %s\n",
;420:              CG_KeyNameForCommand( "+attack" ),
;421:              BG_FindHumanNameForWeapon( ps->weapon ) ) );
;422:			
;423:			Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 52
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $268
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 426
;424:					 va( "Press %s to fire incendiary grenade\n",
;425:						CG_KeyNameForCommand( "+button5" ) ) );
;426:        break;
ADDRGP4 $264
JUMPV
LABELV $269
line 435
;427:
;428:		case WP_PISTOL:
;429:		case WP_MACHINEGUN:
;430:		case WP_SHOTGUN:
;431:		case WP_LAS_GUN:
;432:		case WP_CHAINGUN:		
;433:      case WP_MASS_DRIVER:
;434:		case WP_ROCKET_LAUNCHER:
;435:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 60
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 440
;436:            va( "Press %s to fire the %s\n",
;437:              CG_KeyNameForCommand( "+attack" ),
;438:              BG_FindHumanNameForWeapon( ps->weapon ) ) );
;439:
;440:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $114
ARGP4
ADDRLP4 72
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $270
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 443
;441:            va( "Hold %s to zoom\n",
;442:              CG_KeyNameForCommand( "+button5" ) ) );
;443:        break;
ADDRGP4 $264
JUMPV
LABELV $271
line 447
;444:
;445:      case WP_HBUILD:
;446:      case WP_HBUILD2:
;447:        CG_HumanCkitText( text, ps );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_HumanCkitText
CALLV
pop
line 448
;448:        break;
line 451
;449:
;450:      default:
;451:        break;
LABELV $264
line 453
;452:    }
;453:  }
LABELV $253
line 455
;454:
;455:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $275
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 458
;456:      va( "Press %s and ",
;457:          CG_KeyNameForCommand( "weapprev" ) ) );
;458:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $128
ARGP4
ADDRLP4 36
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $276
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 462
;459:      va( "%s to select an upgrade\n",
;460:          CG_KeyNameForCommand( "weapnext" ) ) );
;461:
;462:  if( upgrade == UP_NONE ||
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $279
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $277
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindUsableForUpgrade
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $277
LABELV $279
line 464
;463:      ( upgrade > UP_NONE && BG_FindUsableForUpgrade( upgrade ) ) )
;464:  {
line 465
;465:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $100
ARGP4
ADDRLP4 56
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $280
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 469
;466:        va( "Press %s to use the %s\n",
;467:            CG_KeyNameForCommand( "+button2" ),
;468:            name ) );
;469:  }
LABELV $277
line 471
;470:
;471:  if( ps->stats[ STAT_HEALTH ] <= 35 &&
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 35
GTI4 $281
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $281
line 473
;472:      BG_InventoryContainsUpgrade( UP_MEDKIT, ps->stats ) )
;473:  {
line 474
;474:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $120
ARGP4
ADDRLP4 64
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindHumanNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $283
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 478
;475:        va( "Press %s to use your %s\n",
;476:          CG_KeyNameForCommand( "itemact medkit" ),
;477:          BG_FindHumanNameForUpgrade( UP_MEDKIT ) ) );
;478:  }
LABELV $281
line 480
;479:
;480:  Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $122
ARGP4
ADDRLP4 64
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $284
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 483
;481:      va( "Press %s to use a structure\n",
;482:        CG_KeyNameForCommand( "+button7" ) ) );
;483:}
LABELV $239
endproc CG_HumanText 80 20
proc CG_SpectatorText 28 12
line 491
;484:
;485:/*
;486:===============
;487:CG_SpectatorText
;488:===============
;489:*/
;490:static void CG_SpectatorText( char *text, playerState_t *ps )
;491:{
line 492
;492:  if( ps->pm_flags & PMF_FOLLOW )
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $286
line 493
;493:  {
line 494
;494:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $100
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $288
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 498
;495:        va( "Press %s to return to free spectator mode\n",
;496:          CG_KeyNameForCommand( "+button2" ) ) );
;497:
;498:    if( CG_PlayerCount( ) > 1 )
ADDRLP4 8
ADDRGP4 CG_PlayerCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LEI4 $287
line 499
;499:    {
line 500
;500:      Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $126
ARGP4
ADDRLP4 12
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 503
;501:          va( "Press %s or ",
;502:            CG_KeyNameForCommand( "weapprev" ) ) );
;503:      Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $128
ARGP4
ADDRLP4 20
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $292
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 506
;504:          va( "%s to change player\n",
;505:            CG_KeyNameForCommand( "weapnext" ) ) );
;506:    }
line 507
;507:  }
ADDRGP4 $287
JUMPV
LABELV $286
line 508
;508:  else if( ps->pm_type == PM_SPECTATOR )
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $293
line 509
;509:  {
line 510
;510:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $295
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 514
;511:        va( "Press %s to join a team\n",
;512:          CG_KeyNameForCommand( "+attack" ) ) );
;513:
;514:    if( CG_PlayerCount( ) > 0 )
ADDRLP4 8
ADDRGP4 CG_PlayerCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $294
line 515
;515:    {
line 516
;516:      Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $100
ARGP4
ADDRLP4 12
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 519
;517:          va( "Press %s to enter spectator follow mode\n",
;518:            CG_KeyNameForCommand( "+button2" ) ) );
;519:    }
line 520
;520:  }
ADDRGP4 $294
JUMPV
LABELV $293
line 522
;521:  else
;522:  {
line 523
;523:    Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $299
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
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 526
;524:        va( "Press %s to spawn\n",
;525:          CG_KeyNameForCommand( "+attack" ) ) );
;526:  }
LABELV $294
LABELV $287
line 527
;527:}
LABELV $285
endproc CG_SpectatorText 28 12
bss
align 1
LABELV $301
skip 4096
export CG_TutorialText
code
proc CG_TutorialText 36 12
line 537
;528:
;529:/*
;530:===============
;531:CG_TutorialText
;532:
;533:Returns context help for the current class/weapon
;534:===============
;535:*/
;536:const char *CG_TutorialText( void )
;537:{
line 541
;538:  playerState_t *ps;
;539:  static char   text[ MAX_TUTORIAL_TEXT ];
;540:
;541:  CG_GetBindings( );
ADDRGP4 CG_GetBindings
CALLV
pop
line 543
;542:
;543:  text[ 0 ] = '\0';
ADDRGP4 $301
CNSTI1 0
ASGNI1
line 544
;544:  ps = &cg.snap->ps;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 546
;545:
;546:  if( !cg.intermissionStarted && !cg.demoPlayback )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 cg+24
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $303
ADDRGP4 cg+8
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $303
line 547
;547:  {
line 548
;548:    if( ps->persistant[ PERS_TEAM ] == TEAM_SPECTATOR ||
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
EQI4 $309
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $307
LABELV $309
line 550
;549:        ps->pm_flags & PMF_FOLLOW )
;550:    {
line 551
;551:      CG_SpectatorText( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SpectatorText
CALLV
pop
line 552
;552:    }
ADDRGP4 $308
JUMPV
LABELV $307
line 553
;553:    else if( ps->stats[ STAT_HEALTH ] > 0 )
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $310
line 554
;554:    {
line 555
;555:      switch( ps->stats[ STAT_PCLASS ] )
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $313
ADDRLP4 12
INDIRI4
CNSTI4 11
GTI4 $313
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $322-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $322
address $315
address $315
address $316
address $317
address $317
address $318
address $318
address $319
address $319
address $320
address $321
code
line 556
;556:      {
LABELV $315
line 559
;557:        case PCL_ALIEN_BUILDER0:
;558:        case PCL_ALIEN_BUILDER0_UPG:
;559:          CG_AlienBuilderText( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienBuilderText
CALLV
pop
line 560
;560:          break;
ADDRGP4 $313
JUMPV
LABELV $316
line 563
;561:
;562:        case PCL_ALIEN_LEVEL0:
;563:          CG_AlienLevel0Text( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel0Text
CALLV
pop
line 564
;564:          break;
ADDRGP4 $313
JUMPV
LABELV $317
line 568
;565:
;566:        case PCL_ALIEN_LEVEL1:
;567:        case PCL_ALIEN_LEVEL1_UPG:
;568:          CG_AlienLevel1Text( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel1Text
CALLV
pop
line 569
;569:          break;
ADDRGP4 $313
JUMPV
LABELV $318
line 573
;570:
;571:        case PCL_ALIEN_LEVEL2:
;572:        case PCL_ALIEN_LEVEL2_UPG:
;573:          CG_AlienLevel2Text( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel2Text
CALLV
pop
line 574
;574:          break;
ADDRGP4 $313
JUMPV
LABELV $319
line 578
;575:
;576:        case PCL_ALIEN_LEVEL3:
;577:        case PCL_ALIEN_LEVEL3_UPG:
;578:          CG_AlienLevel3Text( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel3Text
CALLV
pop
line 579
;579:          break;
ADDRGP4 $313
JUMPV
LABELV $320
line 582
;580:
;581:        case PCL_ALIEN_LEVEL4:
;582:          CG_AlienLevel4Text( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel4Text
CALLV
pop
line 583
;583:          break;
ADDRGP4 $313
JUMPV
LABELV $321
line 586
;584:
;585:        case PCL_HUMAN:
;586:          CG_HumanText( text, ps );
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HumanText
CALLV
pop
line 587
;587:          break;
line 590
;588:
;589:        default:
;590:          break;
LABELV $313
line 593
;591:      }
;592:
;593:      if( ps->stats[ STAT_PTEAM ] == PTE_ALIENS &&
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $324
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BG_UpgradeClassAvailable
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $324
line 595
;594:          BG_UpgradeClassAvailable( ps ) )
;595:      {
line 596
;596:        Q_strcat( text, MAX_TUTORIAL_TEXT,
ADDRGP4 $122
ARGP4
ADDRLP4 28
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $301
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 599
;597:            va( "Press %s to evolve\n",
;598:              CG_KeyNameForCommand( "+button7" ) ) );
;599:      }
LABELV $324
line 600
;600:    }
LABELV $310
LABELV $308
line 602
;601:
;602:    Q_strcat( text, MAX_TUTORIAL_TEXT, "Press ESC for the menu" );
ADDRGP4 $301
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $327
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 603
;603:  }
LABELV $303
line 605
;604:
;605:  return text;
ADDRGP4 $301
RETP4
LABELV $300
endproc CG_TutorialText 36 12
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
import CG_DefragmentMemory
import CG_Free
import CG_Alloc
import CG_InitMemory
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
LABELV $327
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
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $326
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $298
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
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
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $295
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
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
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 37
byte 1 115
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
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $291
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $288
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
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
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
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
byte 1 10
byte 1 0
align 1
LABELV $283
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $276
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $275
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $270
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $267
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $260
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 82
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $258
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $229
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $227
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $222
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $218
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $216
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 114
byte 1 97
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 103
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $212
byte 1 84
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 97
byte 1 98
byte 1 32
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 107
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $209
byte 1 84
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 32
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
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
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
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
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 0
align 1
LABELV $178
byte 1 32
byte 1 40
byte 1 117
byte 1 110
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $176
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $169
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $129
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $128
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
LABELV $127
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $126
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
LABELV $125
byte 1 68
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
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $124
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
LABELV $123
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 47
byte 1 69
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $122
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
LABELV $121
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $120
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
LABELV $119
byte 1 66
byte 1 117
byte 1 121
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $118
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
LABELV $117
byte 1 82
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $116
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $115
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $114
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
LABELV $113
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $112
byte 1 43
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $111
byte 1 90
byte 1 111
byte 1 111
byte 1 109
byte 1 86
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $110
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 114
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $108
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
LABELV $107
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $105
byte 1 83
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 98
byte 1 111
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 82
byte 1 117
byte 1 110
byte 1 47
byte 1 87
byte 1 97
byte 1 108
byte 1 107
byte 1 0
align 1
LABELV $102
byte 1 43
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 0
