data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export vmMain
code
proc vmMain 16 12
file "..\..\..\..\src/cgame/cg_main.c"
line 49
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
;24:// cg_main.c -- initialization and primary entry point for cgame
;25:
;26:
;27:#include "cg_local.h"
;28:
;29:#include "../ui/ui_shared.h"
;30:// display context for new ui stuff
;31:displayContextDef_t cgDC;
;32:
;33:int forceModelModificationCount = -1;
;34:
;35:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;36:void CG_Shutdown( void );
;37:
;38:/*
;39:================
;40:vmMain
;41:
;42:This is the only way control passes into the module.
;43:This must be the very first function compiled into the .q3vm file
;44:================
;45:*/
;46:intptr_t vmMain( int command, int arg0, int arg1, int arg2, int arg3,
;47:                              int arg4, int arg5, int arg6, int arg7,
;48:                              int arg8, int arg9, int arg10, int arg11 )
;49:{
line 50
;50:  switch( command )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 9
GTI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $117
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $117
address $102
address $103
address $104
address $106
address $107
address $108
address $109
address $110
address $115
address $105
code
line 51
;51:  {
LABELV $102
line 53
;52:    case CG_INIT:
;53:      CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 54
;54:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $103
line 57
;55:
;56:    case CG_SHUTDOWN:
;57:      CG_Shutdown( );
ADDRGP4 CG_Shutdown
CALLV
pop
line 58
;58:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $104
line 61
;59:
;60:    case CG_CONSOLE_COMMAND:
;61:      return CG_ConsoleCommand( );
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $99
JUMPV
LABELV $105
line 64
;62:
;63:    case CG_CONSOLE_TEXT:
;64:      CG_AddNotifyText( );
ADDRGP4 CG_AddNotifyText
CALLV
pop
line 65
;65:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $106
line 68
;66:
;67:    case CG_DRAW_ACTIVE_FRAME:
;68:      CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 69
;69:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $107
line 72
;70:
;71:    case CG_CROSSHAIR_PLAYER:
;72:      return CG_CrosshairPlayer( );
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $99
JUMPV
LABELV $108
line 75
;73:
;74:    case CG_LAST_ATTACKER:
;75:      return CG_LastAttacker( );
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $99
JUMPV
LABELV $109
line 78
;76:
;77:    case CG_KEY_EVENT:
;78:      CG_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 79
;79:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $110
line 82
;80:
;81:    case CG_MOUSE_EVENT:
;82:      cgDC.cursorx = cgs.cursorX;
ADDRGP4 cgDC+216
ADDRGP4 cgs+268656
INDIRI4
ASGNI4
line 83
;83:      cgDC.cursory = cgs.cursorY;
ADDRGP4 cgDC+220
ADDRGP4 cgs+268660
INDIRI4
ASGNI4
line 84
;84:      CG_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 85
;85:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $115
line 88
;86:
;87:    case CG_EVENT_HANDLING:
;88:      CG_EventHandling( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 89
;89:      return 0;
CNSTI4 0
RETI4
ADDRGP4 $99
JUMPV
LABELV $100
line 92
;90:
;91:    default:
;92:      CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $116
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 93
;93:      break;
LABELV $101
line 96
;94:  }
;95:
;96:  return -1;
CNSTI4 -1
RETI4
LABELV $99
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_ignore
address $119
address $120
byte 4 0
address cg_autoswitch
address $121
address $122
byte 4 1
address cg_drawGun
address $123
address $122
byte 4 1
address cg_zoomFov
address $124
address $125
byte 4 1
address cg_fov
address $126
address $127
byte 4 1
address cg_viewsize
address $128
address $129
byte 4 1
address cg_stereoSeparation
address $130
address $131
byte 4 1
address cg_shadows
address $132
address $122
byte 4 1
address cg_gibs
address $133
address $122
byte 4 1
address cg_draw2D
address $134
address $122
byte 4 1
address cg_drawStatus
address $135
address $122
byte 4 1
address cg_drawTimer
address $136
address $122
byte 4 1
address cg_drawFPS
address $137
address $122
byte 4 1
address cg_drawDemoState
address $138
address $122
byte 4 1
address cg_drawSnapshot
address $139
address $120
byte 4 1
address cg_draw3dIcons
address $140
address $122
byte 4 1
address cg_drawIcons
address $141
address $122
byte 4 1
address cg_drawAmmoWarning
address $142
address $122
byte 4 1
address cg_drawAttacker
address $143
address $122
byte 4 1
address cg_drawCrosshair
address $144
address $145
byte 4 1
address cg_drawCrosshairNames
address $146
address $122
byte 4 1
address cg_drawRewards
address $147
address $122
byte 4 1
address cg_crosshairX
address $148
address $120
byte 4 1
address cg_crosshairY
address $149
address $120
byte 4 1
address cg_brassTime
address $150
address $151
byte 4 1
address cg_simpleItems
address $152
address $120
byte 4 1
address cg_addMarks
address $153
address $122
byte 4 1
address cg_lagometer
address $154
address $120
byte 4 1
address cg_teslaTrailTime
address $155
address $156
byte 4 1
address cg_railTrailTime
address $157
address $158
byte 4 1
address cg_gun_x
address $159
address $120
byte 4 512
address cg_gun_y
address $160
address $120
byte 4 512
address cg_gun_z
address $161
address $120
byte 4 512
address cg_centertime
address $162
address $163
byte 4 512
address cg_runpitch
address $164
address $165
byte 4 1
address cg_runroll
address $166
address $167
byte 4 1
address cg_bobup
address $168
address $167
byte 4 512
address cg_bobpitch
address $169
address $165
byte 4 1
address cg_bobroll
address $170
address $165
byte 4 1
address cg_swingSpeed
address $171
address $172
byte 4 512
address cg_animSpeed
address $173
address $122
byte 4 512
address cg_debugAnim
address $174
address $120
byte 4 512
address cg_debugPosition
address $175
address $120
byte 4 512
address cg_debugEvents
address $176
address $120
byte 4 512
address cg_errorDecay
address $177
address $129
byte 4 0
address cg_nopredict
address $178
address $120
byte 4 0
address cg_debugMove
address $179
address $120
byte 4 0
address cg_noPlayerAnims
address $180
address $120
byte 4 512
address cg_showmiss
address $181
address $120
byte 4 0
address cg_footsteps
address $182
address $122
byte 4 512
address cg_tracerChance
address $183
address $131
byte 4 512
address cg_tracerWidth
address $184
address $122
byte 4 512
address cg_tracerLength
address $185
address $129
byte 4 512
address cg_thirdPersonRange
address $186
address $187
byte 4 1
address cg_thirdPersonRangehax
address $188
address $187
byte 4 0
address cg_thirdPersonAngle
address $189
address $120
byte 4 1
address cg_thirdPerson
address $190
address $120
byte 4 1
address cg_thirdPersonhax
address $191
address $120
byte 4 0
address cg_teamChatTime
address $192
address $193
byte 4 1
address cg_teamChatHeight
address $194
address $120
byte 4 1
address cg_forceModel
address $195
address $120
byte 4 1
address cg_predictItems
address $196
address $122
byte 4 1
address cg_deferPlayers
address $197
address $122
byte 4 1
address cg_drawTeamOverlay
address $198
address $120
byte 4 1
address cg_teamOverlayUserinfo
address $199
address $120
byte 4 66
address cg_stats
address $200
address $120
byte 4 0
address cg_drawFriend
address $201
address $122
byte 4 1
address cg_teamChatsOnly
address $202
address $120
byte 4 1
address cg_noVoiceChats
address $203
address $120
byte 4 1
address cg_noVoiceText
address $204
address $120
byte 4 1
address cg_creepRes
address $205
address $206
byte 4 1
address cg_drawSurfNormal
address $207
address $120
byte 4 512
address cg_drawBBOX
address $208
address $120
byte 4 512
address cg_debugAlloc
address $209
address $120
byte 4 0
address cg_wwSmoothTime
address $210
address $211
byte 4 1
address cg_wwFollow
address $212
address $122
byte 4 3
address cg_wwToggle
address $213
address $122
byte 4 3
address cg_depthSortParticles
address $214
address $122
byte 4 1
address cg_consoleLatency
address $215
address $193
byte 4 1
address cg_lightFlare
address $216
address $163
byte 4 1
address cg_debugParticles
address $217
address $120
byte 4 512
address cg_debugTrails
address $218
address $120
byte 4 512
address cg_debugPVS
address $219
address $120
byte 4 512
address cg_disableWarningDialogs
address $220
address $120
byte 4 1
address cg_disableScannerPlane
address $221
address $120
byte 4 1
address cg_tutorial
address $222
address $122
byte 4 1
address cg_hudFiles
address $223
address $224
byte 4 1
address cg_painBlendUpRate
address $225
address $226
byte 4 0
address cg_painBlendDownRate
address $227
address $228
byte 4 0
address cg_painBlendMax
address $229
address $230
byte 4 0
address cg_painBlendScale
address $231
address $232
byte 4 0
address cg_painBlendZoom
address $233
address $234
byte 4 0
address ui_currentClass
address $235
address $120
byte 4 0
address ui_carriage
address $236
address $237
byte 4 0
address ui_stages
address $238
address $239
byte 4 0
address ui_dialog
address $240
address $241
byte 4 0
address ui_loading
address $242
address $120
byte 4 0
address ui_voteActive
address $243
address $120
byte 4 0
address ui_humanTeamVoteActive
address $244
address $120
byte 4 0
address ui_alienTeamVoteActive
address $245
address $120
byte 4 0
address cg_debugRandom
address $246
address $120
byte 4 0
address cg_buildScript
address $247
address $120
byte 4 0
address cg_paused
address $248
address $120
byte 4 64
address cg_blood
address $249
address $122
byte 4 1
address cg_synchronousClients
address $250
address $120
byte 4 0
address cg_cameraOrbit
address $251
address $120
byte 4 512
address cg_cameraOrbitDelay
address $252
address $253
byte 4 1
address cg_timescaleFadeEnd
address $254
address $122
byte 4 0
address cg_timescaleFadeSpeed
address $255
address $120
byte 4 0
address cg_timescale
address $256
address $122
byte 4 0
address cg_scorePlum
address $257
address $122
byte 4 3
address cg_smoothClients
address $258
address $120
byte 4 3
address cg_cameraMode
address $259
address $120
byte 4 512
address pmove_fixed
address $260
address $120
byte 4 0
address pmove_msec
address $261
address $262
byte 4 0
address cg_noTaunt
address $263
address $120
byte 4 1
address cg_noProjectileTrail
address $264
address $120
byte 4 1
address cg_smallFont
address $265
address $266
byte 4 1
address cg_bigFont
address $267
address $228
byte 4 1
address cg_oldRail
address $268
address $122
byte 4 1
address cg_oldRocket
address $269
address $122
byte 4 1
address cg_oldPlasma
address $270
address $122
byte 4 1
address cg_trueLightning
address $271
address $272
byte 4 1
align 4
LABELV cvarTableSize
byte 4 123
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 395
;97:}
;98:
;99:
;100:cg_t        cg;
;101:cgs_t       cgs;
;102:centity_t   cg_entities[ MAX_GENTITIES ];
;103:
;104://TA: weapons limit expanded:
;105://weaponInfo_t    cg_weapons[MAX_WEAPONS];
;106:weaponInfo_t    cg_weapons[ 32 ];
;107:upgradeInfo_t   cg_upgrades[ 32 ];
;108:
;109:buildableInfo_t cg_buildables[ BA_NUM_BUILDABLES ];
;110:
;111:vmCvar_t  cg_teslaTrailTime;
;112:vmCvar_t  cg_railTrailTime;
;113:vmCvar_t  cg_centertime;
;114:vmCvar_t  cg_runpitch;
;115:vmCvar_t  cg_runroll;
;116:vmCvar_t  cg_bobup;
;117:vmCvar_t  cg_bobpitch;
;118:vmCvar_t  cg_bobroll;
;119:vmCvar_t  cg_swingSpeed;
;120:vmCvar_t  cg_shadows;
;121:vmCvar_t  cg_gibs;
;122:vmCvar_t  cg_drawTimer;
;123:vmCvar_t  cg_drawFPS;
;124:vmCvar_t  cg_drawDemoState;
;125:vmCvar_t  cg_drawSnapshot;
;126:vmCvar_t  cg_draw3dIcons;
;127:vmCvar_t  cg_drawIcons;
;128:vmCvar_t  cg_drawAmmoWarning;
;129:vmCvar_t  cg_drawCrosshair;
;130:vmCvar_t  cg_drawCrosshairNames;
;131:vmCvar_t  cg_drawRewards;
;132:vmCvar_t  cg_crosshairX;
;133:vmCvar_t  cg_crosshairY;
;134:vmCvar_t  cg_draw2D;
;135:vmCvar_t  cg_drawStatus;
;136:vmCvar_t  cg_animSpeed;
;137:vmCvar_t  cg_debugAnim;
;138:vmCvar_t  cg_debugPosition;
;139:vmCvar_t  cg_debugEvents;
;140:vmCvar_t  cg_errorDecay;
;141:vmCvar_t  cg_nopredict;
;142:vmCvar_t  cg_debugMove;
;143:vmCvar_t  cg_noPlayerAnims;
;144:vmCvar_t  cg_showmiss;
;145:vmCvar_t  cg_footsteps;
;146:vmCvar_t  cg_addMarks;
;147:vmCvar_t  cg_brassTime;
;148:vmCvar_t  cg_viewsize;
;149:vmCvar_t  cg_drawGun;
;150:vmCvar_t  cg_gun_frame;
;151:vmCvar_t  cg_gun_x;
;152:vmCvar_t  cg_gun_y;
;153:vmCvar_t  cg_gun_z;
;154:vmCvar_t  cg_tracerChance;
;155:vmCvar_t  cg_tracerWidth;
;156:vmCvar_t  cg_tracerLength;
;157:vmCvar_t  cg_autoswitch;
;158:vmCvar_t  cg_ignore;
;159:vmCvar_t  cg_simpleItems;
;160:vmCvar_t  cg_fov;
;161:vmCvar_t  cg_zoomFov;
;162:vmCvar_t  cg_thirdPerson;
;163:vmCvar_t  cg_thirdPersonhax;
;164:vmCvar_t  cg_thirdPersonRange;
;165:vmCvar_t  cg_thirdPersonRangehax;
;166:vmCvar_t  cg_thirdPersonAngle;
;167:vmCvar_t  cg_stereoSeparation;
;168:vmCvar_t  cg_lagometer;
;169:vmCvar_t  cg_drawAttacker;
;170:vmCvar_t  cg_synchronousClients;
;171:vmCvar_t  cg_teamChatTime;
;172:vmCvar_t  cg_teamChatHeight;
;173:vmCvar_t  cg_stats;
;174:vmCvar_t  cg_buildScript;
;175:vmCvar_t  cg_forceModel;
;176:vmCvar_t  cg_paused;
;177:vmCvar_t  cg_blood;
;178:vmCvar_t  cg_predictItems;
;179:vmCvar_t  cg_deferPlayers;
;180:vmCvar_t  cg_drawTeamOverlay;
;181:vmCvar_t  cg_teamOverlayUserinfo;
;182:vmCvar_t  cg_drawFriend;
;183:vmCvar_t  cg_teamChatsOnly;
;184:vmCvar_t  cg_noVoiceChats;
;185:vmCvar_t  cg_noVoiceText;
;186:vmCvar_t  cg_hudFiles;
;187:vmCvar_t  cg_scorePlum;
;188:vmCvar_t  cg_smoothClients;
;189:vmCvar_t  pmove_fixed;
;190://vmCvar_t  cg_pmove_fixed;
;191:vmCvar_t  pmove_msec;
;192:vmCvar_t  cg_pmove_msec;
;193:vmCvar_t  cg_cameraMode;
;194:vmCvar_t  cg_cameraOrbit;
;195:vmCvar_t  cg_cameraOrbitDelay;
;196:vmCvar_t  cg_timescaleFadeEnd;
;197:vmCvar_t  cg_timescaleFadeSpeed;
;198:vmCvar_t  cg_timescale;
;199:vmCvar_t  cg_smallFont;
;200:vmCvar_t  cg_bigFont;
;201:vmCvar_t  cg_noTaunt;
;202:vmCvar_t  cg_noProjectileTrail;
;203:vmCvar_t  cg_oldRail;
;204:vmCvar_t  cg_oldRocket;
;205:vmCvar_t  cg_oldPlasma;
;206:vmCvar_t  cg_trueLightning;
;207:vmCvar_t  cg_creepRes;
;208:vmCvar_t  cg_drawSurfNormal;
;209:vmCvar_t  cg_drawBBOX;
;210:vmCvar_t  cg_debugAlloc;
;211:vmCvar_t  cg_wwSmoothTime;
;212:vmCvar_t  cg_wwFollow;
;213:vmCvar_t  cg_wwToggle;
;214:vmCvar_t  cg_depthSortParticles;
;215:vmCvar_t  cg_consoleLatency;
;216:vmCvar_t  cg_lightFlare;
;217:vmCvar_t  cg_debugParticles;
;218:vmCvar_t  cg_debugTrails;
;219:vmCvar_t  cg_debugPVS;
;220:vmCvar_t  cg_disableWarningDialogs;
;221:vmCvar_t  cg_disableScannerPlane;
;222:vmCvar_t  cg_tutorial;
;223:
;224:vmCvar_t  cg_painBlendUpRate;
;225:vmCvar_t  cg_painBlendDownRate;
;226:vmCvar_t  cg_painBlendMax;
;227:vmCvar_t  cg_painBlendScale;
;228:vmCvar_t  cg_painBlendZoom;
;229:
;230://TA: hack to get class and carriage through to UI module
;231:vmCvar_t  ui_currentClass;
;232:vmCvar_t  ui_carriage;
;233:vmCvar_t  ui_stages;
;234:vmCvar_t  ui_dialog;
;235:vmCvar_t  ui_loading;
;236:vmCvar_t  ui_voteActive;
;237:vmCvar_t  ui_alienTeamVoteActive;
;238:vmCvar_t  ui_humanTeamVoteActive;
;239:
;240:vmCvar_t  cg_debugRandom;
;241:
;242:
;243:typedef struct
;244:{
;245:  vmCvar_t  *vmCvar;
;246:  char      *cvarName;
;247:  char      *defaultString;
;248:  int       cvarFlags;
;249:} cvarTable_t;
;250:
;251:static cvarTable_t cvarTable[ ] =
;252:{
;253:  { &cg_ignore, "cg_ignore", "0", 0 },  // used for debugging
;254:  { &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;255:  { &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;256:  { &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;257:  { &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;258:  { &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;259:  { &cg_stereoSeparation, "cg_stereoSeparation", "0.4", CVAR_ARCHIVE  },
;260:  { &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE  },
;261:  { &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE  },
;262:  { &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE  },
;263:  { &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE  },
;264:  { &cg_drawTimer, "cg_drawTimer", "1", CVAR_ARCHIVE  },
;265:  { &cg_drawFPS, "cg_drawFPS", "1", CVAR_ARCHIVE  },
;266:  { &cg_drawDemoState, "cg_drawDemoState", "1", CVAR_ARCHIVE  },
;267:  { &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;268:  { &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE  },
;269:  { &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE  },
;270:  { &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE  },
;271:  { &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE  },
;272:  { &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;273:  { &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;274:  { &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;275:  { &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;276:  { &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;277:  { &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;278:  { &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;279:  { &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;280:  { &cg_lagometer, "cg_lagometer", "0", CVAR_ARCHIVE },
;281:  { &cg_teslaTrailTime, "cg_teslaTrailTime", "250", CVAR_ARCHIVE  },
;282:  { &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;283:  { &cg_gun_x, "cg_gunX", "0", CVAR_CHEAT },
;284:  { &cg_gun_y, "cg_gunY", "0", CVAR_CHEAT },
;285:  { &cg_gun_z, "cg_gunZ", "0", CVAR_CHEAT },
;286:  { &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;287:  { &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;288:  { &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;289:  { &cg_bobup , "cg_bobup", "0.005", CVAR_CHEAT },
;290:  { &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;291:  { &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;292:  { &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;293:  { &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;294:  { &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;295:  { &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;296:  { &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;297:  { &cg_errorDecay, "cg_errordecay", "100", 0 },
;298:  { &cg_nopredict, "cg_nopredict", "0", 0 },
;299:  { &cg_debugMove, "cg_debugMove", "0", 0 },
;300:  { &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;301:  { &cg_showmiss, "cg_showmiss", "0", 0 },
;302:  { &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;303:  { &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;304:  { &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;305:  { &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;306:  { &cg_thirdPersonRange, "cg_thirdPersonRange", "120", CVAR_ARCHIVE },
;307:  { &cg_thirdPersonRangehax, "cg_thirdPersonRangehax", "120", 0 },
;308:  { &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_ARCHIVE },
;309:  { &cg_thirdPerson, "cg_thirdPerson", "0", CVAR_ARCHIVE },
;310:  { &cg_thirdPersonhax, "cg_thirdPersonhax", "0", 0 },
;311:  { &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;312:  { &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE  },
;313:  { &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;314:  { &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;315:  { &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;316:  { &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;317:  { &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;318:  { &cg_stats, "cg_stats", "0", 0 },
;319:  { &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;320:  { &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;321:  { &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;322:  { &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;323:  { &cg_creepRes, "cg_creepRes", "16", CVAR_ARCHIVE },
;324:  { &cg_drawSurfNormal, "cg_drawSurfNormal", "0", CVAR_CHEAT },
;325:  { &cg_drawBBOX, "cg_drawBBOX", "0", CVAR_CHEAT },
;326:  { &cg_debugAlloc, "cg_debugAlloc", "0", 0 },
;327:  { &cg_wwSmoothTime, "cg_wwSmoothTime", "300", CVAR_ARCHIVE },
;328:  { &cg_wwFollow, "cg_wwFollow", "1", CVAR_ARCHIVE|CVAR_USERINFO },
;329:  { &cg_wwToggle, "cg_wwToggle", "1", CVAR_ARCHIVE|CVAR_USERINFO },
;330:  { &cg_depthSortParticles, "cg_depthSortParticles", "1", CVAR_ARCHIVE },
;331:  { &cg_consoleLatency, "cg_consoleLatency", "3000", CVAR_ARCHIVE },
;332:  { &cg_lightFlare, "cg_lightFlare", "3", CVAR_ARCHIVE },
;333:  { &cg_debugParticles, "cg_debugParticles", "0", CVAR_CHEAT },
;334:  { &cg_debugTrails, "cg_debugTrails", "0", CVAR_CHEAT },
;335:  { &cg_debugPVS, "cg_debugPVS", "0", CVAR_CHEAT },
;336:  { &cg_disableWarningDialogs, "cg_disableWarningDialogs", "0", CVAR_ARCHIVE },
;337:  { &cg_disableScannerPlane, "cg_disableScannerPlane", "0", CVAR_ARCHIVE },
;338:  { &cg_tutorial, "cg_tutorial", "1", CVAR_ARCHIVE },
;339:  { &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;340:
;341:  { &cg_painBlendUpRate, "cg_painBlendUpRate", "10.0", 0 },
;342:  { &cg_painBlendDownRate, "cg_painBlendDownRate", "0.5", 0 },
;343:  { &cg_painBlendMax, "cg_painBlendMax", "0.7", 0 },
;344:  { &cg_painBlendScale, "cg_painBlendScale", "7.0", 0 },
;345:  { &cg_painBlendZoom, "cg_painBlendZoom", "0.65", 0 },
;346:
;347:  { &ui_currentClass, "ui_currentClass", "0", 0 },
;348:  { &ui_carriage, "ui_carriage", "", 0 },
;349:  { &ui_stages, "ui_stages", "0 0", 0 },
;350:  { &ui_dialog, "ui_dialog", "Text not set", 0 },
;351:  { &ui_loading, "ui_loading", "0", 0 },
;352:  { &ui_voteActive, "ui_voteActive", "0", 0 },
;353:  { &ui_humanTeamVoteActive, "ui_humanTeamVoteActive", "0", 0 },
;354:  { &ui_alienTeamVoteActive, "ui_alienTeamVoteActive", "0", 0 },
;355:
;356:  { &cg_debugRandom, "cg_debugRandom", "0", 0 },
;357:
;358:  // the following variables are created in other parts of the system,
;359:  // but we also reference them here
;360:
;361:  { &cg_buildScript, "com_buildScript", "0", 0 }, // force loading of all possible data amd error on failures
;362:  { &cg_paused, "cl_paused", "0", CVAR_ROM },
;363:  { &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;364:  { &cg_synchronousClients, "g_synchronousClients", "0", 0 }, // communicated by systeminfo
;365:  { &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;366:  { &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;367:  { &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;368:  { &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;369:  { &cg_timescale, "timescale", "1", 0},
;370:  { &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;371:  { &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;372:  { &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;373:
;374:  { &pmove_fixed, "pmove_fixed", "0", 0},
;375:  { &pmove_msec, "pmove_msec", "8", 0},
;376:  { &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;377:  { &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;378:  { &cg_smallFont, "ui_smallFont", "0.2", CVAR_ARCHIVE},
;379:  { &cg_bigFont, "ui_bigFont", "0.5", CVAR_ARCHIVE},
;380:  { &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;381:  { &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;382:  { &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;383:  { &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE}
;384://  { &cg_pmove_fixed, "cg_pmove_fixed", "0", CVAR_USERINFO | CVAR_ARCHIVE }
;385:};
;386:
;387:static int   cvarTableSize = sizeof( cvarTable ) / sizeof( cvarTable[0] );
;388:
;389:/*
;390:=================
;391:CG_RegisterCvars
;392:=================
;393:*/
;394:void CG_RegisterCvars( void )
;395:{
line 400
;396:  int         i;
;397:  cvarTable_t *cv;
;398:  char        var[ MAX_TOKEN_CHARS ];
;399:
;400:  for( i = 0, cv = cvarTable; i < cvarTableSize; i++, cv++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $277
JUMPV
LABELV $274
line 401
;401:  {
line 402
;402:    trap_Cvar_Register( cv->vmCvar, cv->cvarName,
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
line 404
;403:      cv->defaultString, cv->cvarFlags );
;404:  }
LABELV $275
line 400
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
LABELV $277
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $274
line 407
;405:
;406:  //repress standard Q3 console
;407:  trap_Cvar_Set( "con_notifytime", "-2" );
ADDRGP4 $278
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 410
;408:
;409:  // see if we are also running the server on this machine
;410:  trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $280
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 411
;411:  cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31464
ADDRLP4 1032
INDIRI4
ASGNI4
line 412
;412:  forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 414
;413:
;414:  trap_Cvar_Register( NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $283
ARGP4
ADDRGP4 $284
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 415
;415:  trap_Cvar_Register( NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $285
ARGP4
ADDRGP4 $284
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 416
;416:  trap_Cvar_Register( NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $286
ARGP4
ADDRGP4 $284
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 417
;417:  trap_Cvar_Register( NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 $284
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 418
;418:}
LABELV $273
endproc CG_RegisterCvars 1036 16
proc CG_ForceModelChange 12 4
line 427
;419:
;420:
;421:/*
;422:===================
;423:CG_ForceModelChange
;424:===================
;425:*/
;426:static void CG_ForceModelChange( void )
;427:{
line 430
;428:  int   i;
;429:
;430:  for( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $289
line 431
;431:  {
line 434
;432:    const char    *clientInfo;
;433:
;434:    clientInfo = CG_ConfigString( CS_PLAYERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 436
;435:
;436:    if( !clientInfo[ 0 ] )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $293
line 437
;437:      continue;
ADDRGP4 $290
JUMPV
LABELV $293
line 439
;438:
;439:    CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 440
;440:  }
LABELV $290
line 430
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $289
line 441
;441:}
LABELV $288
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 8 4
line 450
;442:
;443:
;444:/*
;445:=================
;446:CG_UpdateCvars
;447:=================
;448:*/
;449:void CG_UpdateCvars( void )
;450:{
line 454
;451:  int         i;
;452:  cvarTable_t *cv;
;453:
;454:  for( i = 0, cv = cvarTable; i < cvarTableSize; i++, cv++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $299
JUMPV
LABELV $296
line 455
;455:    trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
LABELV $297
line 454
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
LABELV $299
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $296
line 460
;456:
;457:  // check for modications here
;458:
;459:  // if force model changed
;460:  if( forceModelModificationCount != cg_forceModel.modificationCount )
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
EQI4 $300
line 461
;461:  {
line 462
;462:    forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 463
;463:    CG_ForceModelChange( );
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 464
;464:  }
LABELV $300
line 465
;465:}
LABELV $295
endproc CG_UpdateCvars 8 4
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 469
;466:
;467:
;468:int CG_CrosshairPlayer( void )
;469:{
line 470
;470:  if( cg.time > ( cg.crosshairClientTime + 1000 ) )
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115420
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $305
line 471
;471:    return -1;
CNSTI4 -1
RETI4
ADDRGP4 $304
JUMPV
LABELV $305
line 473
;472:
;473:  return cg.crosshairClientNum;
ADDRGP4 cg+115416
INDIRI4
RETI4
LABELV $304
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 478
;474:}
;475:
;476:
;477:int CG_LastAttacker( void )
;478:{
line 479
;479:  if( !cg.attackerTime )
ADDRGP4 cg+115432
INDIRI4
CNSTI4 0
NEI4 $311
line 480
;480:    return -1;
CNSTI4 -1
RETI4
ADDRGP4 $310
JUMPV
LABELV $311
line 482
;481:
;482:  return cg.snap->ps.persistant[ PERS_ATTACKER ];
ADDRGP4 cg+36
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
RETI4
LABELV $310
endproc CG_LastAttacker 0 0
export CG_RemoveNotifyLine
proc CG_RemoveNotifyLine 28 4
line 491
;483:}
;484:
;485:/*
;486:=================
;487:CG_RemoveNotifyLine
;488:=================
;489:*/
;490:void CG_RemoveNotifyLine( void )
;491:{
line 494
;492:  int i, offset, totalLength;
;493:
;494:  if( cg.numConsoleLines == 0 )
ADDRGP4 cg+125516
INDIRI4
CNSTI4 0
NEI4 $316
line 495
;495:    return;
ADDRGP4 $315
JUMPV
LABELV $316
line 497
;496:
;497:  offset = cg.consoleLines[ 0 ].length;
ADDRLP4 4
ADDRGP4 cg+125260+4
INDIRI4
ASGNI4
line 498
;498:  totalLength = strlen( cg.consoleText ) - offset;
ADDRGP4 cg+117068
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 501
;499:
;500:  //slide up consoleText
;501:  for( i = 0; i <= totalLength; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 502
;502:    cg.consoleText[ i ] = cg.consoleText[ i + offset ];
ADDRLP4 0
INDIRI4
ADDRGP4 cg+117068
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 cg+117068
ADDP4
INDIRI1
ASGNI1
LABELV $323
line 501
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $322
line 505
;503:
;504:  //pop up the first consoleLine
;505:  for( i = 0; i < cg.numConsoleLines; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $331
JUMPV
LABELV $328
line 506
;506:    cg.consoleLines[ i ] = cg.consoleLines[ i + 1 ];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 cg+125260
ADDP4
ADDRLP4 20
INDIRI4
ADDRGP4 cg+125260+8
ADDP4
INDIRB
ASGNB 8
LABELV $329
line 505
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $331
ADDRLP4 0
INDIRI4
ADDRGP4 cg+125516
INDIRI4
LTI4 $328
line 508
;507:
;508:  cg.numConsoleLines--;
ADDRLP4 24
ADDRGP4 cg+125516
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 509
;509:}
LABELV $315
endproc CG_RemoveNotifyLine 28 4
export CG_AddNotifyText
proc CG_AddNotifyText 8200 12
line 517
;510:
;511:/*
;512:=================
;513:CG_AddNotifyText
;514:=================
;515:*/
;516:void CG_AddNotifyText( void )
;517:{
line 520
;518:  char buffer[ BIG_INFO_STRING ];
;519:
;520:  trap_LiteralArgs( buffer, BIG_INFO_STRING );
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 trap_LiteralArgs
CALLV
pop
line 522
;521:
;522:  if( !buffer[ 0 ] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $338
line 523
;523:  {
line 524
;524:    cg.consoleText[ 0 ] = '\0';
ADDRGP4 cg+117068
CNSTI1 0
ASGNI1
line 525
;525:    cg.numConsoleLines = 0;
ADDRGP4 cg+125516
CNSTI4 0
ASGNI4
line 526
;526:    return;
ADDRGP4 $337
JUMPV
LABELV $338
line 529
;527:  }
;528:
;529:  if( cg.numConsoleLines == MAX_CONSOLE_LINES )
ADDRGP4 cg+125516
INDIRI4
CNSTI4 32
NEI4 $342
line 530
;530:    CG_RemoveNotifyLine( );
ADDRGP4 CG_RemoveNotifyLine
CALLV
pop
LABELV $342
line 532
;531:
;532:  Q_strcat( cg.consoleText, MAX_CONSOLE_TEXT, buffer );
ADDRGP4 cg+117068
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 533
;533:  cg.consoleLines[ cg.numConsoleLines ].time = cg.time;
ADDRGP4 cg+125516
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 cg+125260
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 534
;534:  cg.consoleLines[ cg.numConsoleLines ].length = strlen( buffer );
ADDRLP4 0
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 cg+125516
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 cg+125260+4
ADDP4
ADDRLP4 8192
INDIRI4
ASGNI4
line 535
;535:  cg.numConsoleLines++;
ADDRLP4 8196
ADDRGP4 cg+125516
ASGNP4
ADDRLP4 8196
INDIRP4
ADDRLP4 8196
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 536
;536:}
LABELV $337
endproc CG_AddNotifyText 8200 12
export CG_Printf
proc CG_Printf 2060 12
line 539
;537:
;538:void QDECL CG_Printf( const char *msg, ... )
;539:{
line 543
;540:  va_list argptr;
;541:  char    text[ 1024 ];
;542:  char    out[ 1024 ];
;543:  int i=0,j=0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 571
;544:  
;545:  
;546:  /*for(i = 0;i < MAX_SAY_TEXT && j < MAX_SAY_TEXT;i++)
;547:      {
;548:        if(msg[i] == 0)
;549:        {
;550:          out[j] = 0;
;551:          break;
;552:        }
;553:        if((i % 32) == 0)
;554:        {
;555:          out[j] = '\n';
;556:          j++;
;557:        }
;558:        out[j] = msg[i];
;559:        j++;
;560:      }
;561:      j--;
;562:      out[ j ] = '\0';
;563:  //CG_Printf( "%s\n", out );
;564:  
;565:  va_start( argptr, out );
;566:  vsprintf( text, out, argptr );
;567:  va_end( argptr );
;568:
;569:  trap_Print( text );*/
;570:
;571:  va_start( argptr, msg );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 572
;572:  vsprintf( text, msg, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 573
;573:  va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 591
;574:  
;575:  /*for(i = 0;i < MAX_SAY_TEXT && j < MAX_SAY_TEXT;i++)
;576:      {
;577:        if(text[i] == '\0')
;578:        {
;579:          out[j] = 0;
;580:          break;
;581:        }
;582:        if((i % 47) == 0 && i != 0)
;583:        {
;584:          out[j] = '\n';
;585:          j++;
;586:        }
;587:        out[j] = text[i];
;588:        j++;
;589:      }
;590:trap_Print( out );*/
;591:  trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 592
;592:}
LABELV $353
endproc CG_Printf 2060 12
export CG_Error
proc CG_Error 1028 12
line 595
;593:
;594:void QDECL CG_Error( const char *msg, ... )
;595:{
line 599
;596:  va_list argptr;
;597:  char    text[ 1024 ];
;598:
;599:  va_start( argptr, msg );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 600
;600:  vsprintf( text, msg, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 601
;601:  va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 603
;602:
;603:  trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 604
;604:}
LABELV $355
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 607
;605:
;606:void QDECL Com_Error( int level, const char *error, ... )
;607:{
line 611
;608:  va_list argptr;
;609:  char    text[1024];
;610:
;611:  va_start( argptr, error );
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 612
;612:  vsprintf( text, error, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 613
;613:  va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 615
;614:
;615:  CG_Error( "%s", text );
ADDRGP4 $359
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 616
;616:}
LABELV $357
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 618
;617:
;618:void QDECL Com_Printf( const char *msg, ... ) {
line 622
;619:  va_list   argptr;
;620:  char    text[1024];
;621:
;622:  va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 623
;623:  vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 624
;624:  va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 626
;625:
;626:  CG_Printf ("%s", text);
ADDRGP4 $359
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 627
;627:}
LABELV $360
endproc Com_Printf 1028 12
bss
align 1
LABELV $363
skip 1024
export CG_Argv
code
proc CG_Argv 0 12
line 637
;628:
;629:
;630:
;631:/*
;632:================
;633:CG_Argv
;634:================
;635:*/
;636:const char *CG_Argv( int arg )
;637:{
line 640
;638:  static char buffer[ MAX_STRING_CHARS ];
;639:
;640:  trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 642
;641:
;642:  return buffer;
ADDRGP4 $363
RETP4
LABELV $362
endproc CG_Argv 0 12
export CG_FileExists
proc CG_FileExists 8 12
line 656
;643:}
;644:
;645:
;646://========================================================================
;647:
;648:/*
;649:=================
;650:CG_FileExists
;651:
;652:Test if a specific file exists or not
;653:=================
;654:*/
;655:qboolean CG_FileExists( char *filename )
;656:{
line 659
;657:  fileHandle_t  f;
;658:
;659:  if( trap_FS_FOpenFile( filename, &f, FS_READ ) > 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $365
line 660
;660:  {
line 662
;661:    //file exists so close it
;662:    trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 664
;663:
;664:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $364
JUMPV
LABELV $365
line 667
;665:  }
;666:  else
;667:    return qfalse;
CNSTI4 0
RETI4
LABELV $364
endproc CG_FileExists 8 12
proc CG_RegisterSounds 224 16
line 678
;668:}
;669:
;670:/*
;671:=================
;672:CG_RegisterSounds
;673:
;674:called during a precache command
;675:=================
;676:*/
;677:static void CG_RegisterSounds( void )
;678:{
line 683
;679:  int         i;
;680:  char        name[ MAX_QPATH ];
;681:  const char  *soundName;
;682:
;683:  cgs.media.alienStageTransition  = trap_S_RegisterSound( "sound/announcements/overmindevolved.wav", qtrue );
ADDRGP4 $370
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+440
ADDRLP4 72
INDIRI4
ASGNI4
line 684
;684:  cgs.media.humanStageTransition  = trap_S_RegisterSound( "sound/announcements/reinforcement.wav", qtrue );
ADDRGP4 $373
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+444
ADDRLP4 76
INDIRI4
ASGNI4
line 686
;685:
;686:  cgs.media.alienOvermindAttack   = trap_S_RegisterSound( "sound/announcements/overmindattack.wav", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+448
ADDRLP4 80
INDIRI4
ASGNI4
line 687
;687:  cgs.media.alienOvermindDying    = trap_S_RegisterSound( "sound/announcements/overminddying.wav", qtrue );
ADDRGP4 $379
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 84
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+452
ADDRLP4 84
INDIRI4
ASGNI4
line 688
;688:  cgs.media.alienOvermindSpawns   = trap_S_RegisterSound( "sound/announcements/overmindspawns.wav", qtrue );
ADDRGP4 $382
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+456
ADDRLP4 88
INDIRI4
ASGNI4
line 690
;689:
;690:  cgs.media.alienL1Grab           = trap_S_RegisterSound( "sound/player/level1/grab.wav", qtrue );
ADDRGP4 $385
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 92
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+496
ADDRLP4 92
INDIRI4
ASGNI4
line 691
;691:  cgs.media.alienL4ChargePrepare  = trap_S_RegisterSound( "sound/player/level4/charge_prepare.wav", qtrue );
ADDRGP4 $388
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 96
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+500
ADDRLP4 96
INDIRI4
ASGNI4
line 692
;692:  cgs.media.alienL4ChargeStart    = trap_S_RegisterSound( "sound/player/level4/charge_start.wav", qtrue );
ADDRGP4 $391
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+504
ADDRLP4 100
INDIRI4
ASGNI4
line 694
;693:
;694:  cgs.media.tracerSound           = trap_S_RegisterSound( "sound/weapons/tracer.wav", qfalse );
ADDRGP4 $394
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+256
ADDRLP4 104
INDIRI4
ASGNI4
line 695
;695:  cgs.media.selectSound           = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $397
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+260
ADDRLP4 108
INDIRI4
ASGNI4
line 697
;696:
;697:  cgs.media.talkSound             = trap_S_RegisterSound( "sound/misc/talk.wav", qfalse );
ADDRGP4 $400
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 112
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+360
ADDRLP4 112
INDIRI4
ASGNI4
line 698
;698:  cgs.media.alienTalkSound        = trap_S_RegisterSound( "sound/misc/alien_talk.wav", qfalse );
ADDRGP4 $403
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+364
ADDRLP4 116
INDIRI4
ASGNI4
line 699
;699:  cgs.media.humanTalkSound        = trap_S_RegisterSound( "sound/misc/human_talk.wav", qfalse );
ADDRGP4 $406
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 120
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+368
ADDRLP4 120
INDIRI4
ASGNI4
line 700
;700:  cgs.media.landSound             = trap_S_RegisterSound( "sound/player/land1.wav", qfalse );
ADDRGP4 $409
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 124
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+372
ADDRLP4 124
INDIRI4
ASGNI4
line 702
;701:
;702:  cgs.media.watrInSound           = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse );
ADDRGP4 $412
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+400
ADDRLP4 128
INDIRI4
ASGNI4
line 703
;703:  cgs.media.watrOutSound          = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse );
ADDRGP4 $415
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 132
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+404
ADDRLP4 132
INDIRI4
ASGNI4
line 704
;704:  cgs.media.watrUnSound           = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse );
ADDRGP4 $418
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 136
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+408
ADDRLP4 136
INDIRI4
ASGNI4
line 706
;705:
;706:  cgs.media.disconnectSound       = trap_S_RegisterSound( "sound/misc/disconnect.wav", qfalse );
ADDRGP4 $421
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+252
ADDRLP4 140
INDIRI4
ASGNI4
line 708
;707:
;708:  for( i = 0; i < 4; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $422
line 709
;709:  {
line 710
;710:    Com_sprintf( name, sizeof( name ), "sound/player/footsteps/step%i.wav", i + 1 );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $426
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 711
;711:    cgs.media.footsteps[ FOOTSTEP_NORMAL ][ i ] = trap_S_RegisterSound( name, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 713
;712:
;713:    Com_sprintf( name, sizeof( name ), "sound/player/footsteps/flesh%i.wav", i + 1 );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $429
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 714
;714:    cgs.media.footsteps[ FOOTSTEP_FLESH ][ i ] = trap_S_RegisterSound( name, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+16
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 716
;715:
;716:    Com_sprintf( name, sizeof( name ), "sound/player/footsteps/splash%i.wav", i + 1 );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $433
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 717
;717:    cgs.media.footsteps[ FOOTSTEP_SPLASH ][ i ] = trap_S_RegisterSound( name, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+48
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 719
;718:
;719:    Com_sprintf( name, sizeof( name ), "sound/player/footsteps/clank%i.wav", i + 1 );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $437
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 720
;720:    cgs.media.footsteps[ FOOTSTEP_METAL ][ i ] = trap_S_RegisterSound( name, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 156
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+32
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 721
;721:  }
LABELV $423
line 708
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $422
line 723
;722:
;723:  for( i = 1 ; i < MAX_SOUNDS ; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $441
line 724
;724:  {
line 725
;725:    soundName = CG_ConfigString( CS_SOUNDS + i );
ADDRLP4 0
INDIRI4
CNSTI4 289
ADDI4
ARGI4
ADDRLP4 144
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 144
INDIRP4
ASGNP4
line 727
;726:
;727:    if( !soundName[ 0 ] )
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $445
line 728
;728:      break;
ADDRGP4 $443
JUMPV
LABELV $445
line 730
;729:
;730:    if( soundName[ 0 ] == '*' )
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $447
line 731
;731:      continue; // custom sound
ADDRGP4 $442
JUMPV
LABELV $447
line 733
;732:
;733:    cgs.gameSounds[ i ] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36284
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 734
;734:  }
LABELV $442
line 723
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $441
LABELV $443
line 736
;735:
;736:  cgs.media.jetpackDescendSound     = trap_S_RegisterSound( "sound/upgrades/jetpack/low.wav", qfalse );
ADDRGP4 $452
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+412
ADDRLP4 144
INDIRI4
ASGNI4
line 737
;737:  cgs.media.jetpackIdleSound        = trap_S_RegisterSound( "sound/upgrades/jetpack/idle.wav", qfalse );
ADDRGP4 $455
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+416
ADDRLP4 148
INDIRI4
ASGNI4
line 738
;738:  cgs.media.jetpackAscendSound      = trap_S_RegisterSound( "sound/upgrades/jetpack/hi.wav", qfalse );
ADDRGP4 $458
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+420
ADDRLP4 152
INDIRI4
ASGNI4
line 740
;739:
;740:  cgs.media.medkitUseSound          = trap_S_RegisterSound( "sound/upgrades/medkit/medkit.wav", qfalse );
ADDRGP4 $461
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 156
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+436
ADDRLP4 156
INDIRI4
ASGNI4
line 742
;741:
;742:  cgs.media.alienEvolveSound        = trap_S_RegisterSound( "sound/player/alienevolve.wav", qfalse );
ADDRGP4 $464
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 160
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+568
ADDRLP4 160
INDIRI4
ASGNI4
line 744
;743:
;744:  cgs.media.alienBuildableExplosion = trap_S_RegisterSound( "sound/buildables/alien/explosion.wav", qfalse );
ADDRGP4 $467
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 164
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+460
ADDRLP4 164
INDIRI4
ASGNI4
line 745
;745:  cgs.media.alienBuildableDamage    = trap_S_RegisterSound( "sound/buildables/alien/damage.wav", qfalse );
ADDRGP4 $470
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 168
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+464
ADDRLP4 168
INDIRI4
ASGNI4
line 746
;746:  cgs.media.alienBuildablePrebuild  = trap_S_RegisterSound( "sound/buildables/alien/prebuild.wav", qfalse );
ADDRGP4 $473
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 172
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+468
ADDRLP4 172
INDIRI4
ASGNI4
line 748
;747:
;748:  cgs.media.humanBuildableExplosion = trap_S_RegisterSound( "sound/buildables/human/explosion.wav", qfalse );
ADDRGP4 $476
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 176
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+472
ADDRLP4 176
INDIRI4
ASGNI4
line 749
;749:  cgs.media.humanBuildablePrebuild  = trap_S_RegisterSound( "sound/buildables/human/prebuild.wav", qfalse );
ADDRGP4 $479
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+476
ADDRLP4 180
INDIRI4
ASGNI4
line 751
;750:
;751:  for( i = 0; i < 4; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $480
line 752
;752:    cgs.media.humanBuildableDamage[ i ] = trap_S_RegisterSound(
ADDRGP4 $486
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 192
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+480
ADDP4
ADDRLP4 192
INDIRI4
ASGNI4
LABELV $481
line 751
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $480
line 755
;753:        va( "sound/buildables/human/damage%d.wav", i ), qfalse );
;754:
;755:  cgs.media.hardBounceSound1        = trap_S_RegisterSound( "sound/misc/hard_bounce1.wav", qfalse );
ADDRGP4 $489
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 196
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+380
ADDRLP4 196
INDIRI4
ASGNI4
line 756
;756:  cgs.media.hardBounceSound2        = trap_S_RegisterSound( "sound/misc/hard_bounce2.wav", qfalse );
ADDRGP4 $492
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 200
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+384
ADDRLP4 200
INDIRI4
ASGNI4
line 758
;757:
;758:  cgs.media.repeaterUseSound        = trap_S_RegisterSound( "sound/buildables/repeater/use.wav", qfalse );
ADDRGP4 $495
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 204
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+544
ADDRLP4 204
INDIRI4
ASGNI4
line 760
;759:
;760:  cgs.media.buildableRepairSound    = trap_S_RegisterSound( "sound/buildables/human/repair.wav", qfalse );
ADDRGP4 $498
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 208
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+548
ADDRLP4 208
INDIRI4
ASGNI4
line 761
;761:  cgs.media.buildableRepairedSound  = trap_S_RegisterSound( "sound/buildables/human/repaired.wav", qfalse );
ADDRGP4 $501
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 212
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+552
ADDRLP4 212
INDIRI4
ASGNI4
line 763
;762:
;763:  cgs.media.lCannonWarningSound     = trap_S_RegisterSound( "models/weapons/lcannon/warning.wav", qfalse );
ADDRGP4 $504
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 216
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+600
ADDRLP4 216
INDIRI4
ASGNI4
line 764
;764:  cgs.media.fireSound     = trap_S_RegisterSound( "models/weapons/grenade/onfire.wav", qfalse );
ADDRGP4 $507
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+268684+648
ADDRLP4 220
INDIRI4
ASGNI4
line 766
;765:
;766:}
LABELV $367
endproc CG_RegisterSounds 224 16
data
align 4
LABELV $509
address $510
address $511
address $512
address $513
address $514
address $515
address $516
address $517
address $518
address $519
address $520
align 4
LABELV $521
address $522
address $523
address $524
address $525
address $526
address $527
address $528
address $529
code
proc CG_RegisterGraphics 204 16
line 780
;767:
;768:
;769://===================================================================================
;770:
;771:
;772:/*
;773:=================
;774:CG_RegisterGraphics
;775:
;776:This function may execute for a couple of minutes with a slow disk.
;777:=================
;778:*/
;779:static void CG_RegisterGraphics( void )
;780:{
line 809
;781:  int         i;
;782:  static char *sb_nums[ 11 ] =
;783:  {
;784:    "gfx/2d/numbers/zero_32b",
;785:    "gfx/2d/numbers/one_32b",
;786:    "gfx/2d/numbers/two_32b",
;787:    "gfx/2d/numbers/three_32b",
;788:    "gfx/2d/numbers/four_32b",
;789:    "gfx/2d/numbers/five_32b",
;790:    "gfx/2d/numbers/six_32b",
;791:    "gfx/2d/numbers/seven_32b",
;792:    "gfx/2d/numbers/eight_32b",
;793:    "gfx/2d/numbers/nine_32b",
;794:    "gfx/2d/numbers/minus_32b",
;795:  };
;796:  static char *buildWeaponTimerPieShaders[ 8 ] =
;797:  {
;798:    "ui/assets/neutral/1_5pie",
;799:    "ui/assets/neutral/3_0pie",
;800:    "ui/assets/neutral/4_5pie",
;801:    "ui/assets/neutral/6_0pie",
;802:    "ui/assets/neutral/7_5pie",
;803:    "ui/assets/neutral/9_0pie",
;804:    "ui/assets/neutral/10_5pie",
;805:    "ui/assets/neutral/12_0pie",
;806:  };
;807:
;808:  // clear any references to old media
;809:  memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+110040
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 810
;810:  trap_R_ClearScene( );
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 812
;811:
;812:  trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 813
;813:  CG_UpdateMediaFraction( 0.66f );
CNSTF4 1059648963
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 815
;814:
;815:  for( i = 0; i < 11; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $533
line 816
;816:    cgs.media.numberShaders[ i ] = trap_R_RegisterShader( sb_nums[ i ] );
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 $509
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+268684+180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $534
line 815
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $533
line 818
;817:
;818:  cgs.media.viewBloodShader           = trap_R_RegisterShader( "gfx/damage/fullscreen_painblend" );
ADDRGP4 $541
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+24
ADDRLP4 12
INDIRI4
ASGNI4
line 820
;819:
;820:  cgs.media.connectionShader          = trap_R_RegisterShader( "gfx/2d/net" );
ADDRGP4 $544
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+20
ADDRLP4 16
INDIRI4
ASGNI4
line 822
;821:
;822:  cgs.media.creepShader               = trap_R_RegisterShader( "creep" );
ADDRGP4 $547
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+156
ADDRLP4 20
INDIRI4
ASGNI4
line 824
;823:
;824:  cgs.media.humancreepShader          = trap_R_RegisterShader( "humancreep" );
ADDRGP4 $550
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+160
ADDRLP4 24
INDIRI4
ASGNI4
line 825
;825:  cgs.media.aliencreepShader          = trap_R_RegisterShader( "aliencreep" );
ADDRGP4 $553
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+164
ADDRLP4 28
INDIRI4
ASGNI4
line 827
;826:
;827:  cgs.media.scannerBlipShader         = trap_R_RegisterShader( "gfx/2d/blip" );
ADDRGP4 $556
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+172
ADDRLP4 32
INDIRI4
ASGNI4
line 828
;828:  cgs.media.scannerLineShader         = trap_R_RegisterShader( "gfx/2d/stalk" );
ADDRGP4 $559
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+176
ADDRLP4 36
INDIRI4
ASGNI4
line 830
;829:
;830:  cgs.media.tracerShader              = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $562
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+28
ADDRLP4 40
INDIRI4
ASGNI4
line 832
;831:
;832:  cgs.media.backTileShader            = trap_R_RegisterShader( "console" );
ADDRGP4 $565
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+152
ADDRLP4 44
INDIRI4
ASGNI4
line 836
;833:
;834:
;835:  //TA: building shaders
;836:  cgs.media.greenBuildShader          = trap_R_RegisterShader("gfx/misc/greenbuild" );
ADDRGP4 $568
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+232
ADDRLP4 48
INDIRI4
ASGNI4
line 837
;837:  cgs.media.redBuildShader            = trap_R_RegisterShader("gfx/misc/redbuild" );
ADDRGP4 $571
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+236
ADDRLP4 52
INDIRI4
ASGNI4
line 838
;838:  cgs.media.noPowerShader             = trap_R_RegisterShader("gfx/misc/nopower" );
ADDRGP4 $574
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+240
ADDRLP4 56
INDIRI4
ASGNI4
line 839
;839:  cgs.media.humanSpawningShader       = trap_R_RegisterShader("models/buildables/telenode/rep_cyl" );
ADDRGP4 $577
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+244
ADDRLP4 60
INDIRI4
ASGNI4
line 841
;840:
;841:  for( i = 0; i < 8; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $578
line 842
;842:    cgs.media.buildWeaponTimerPie[ i ] = trap_R_RegisterShader( buildWeaponTimerPieShaders[ i ] );
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 $521
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 cgs+268684+604
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $579
line 841
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $578
line 844
;843:
;844:  cgs.media.upgradeClassIconShader    = trap_R_RegisterShader( "icons/icona_upgrade.tga" );
ADDRGP4 $586
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+636
ADDRLP4 72
INDIRI4
ASGNI4
line 846
;845:
;846:  cgs.media.balloonShader             = trap_R_RegisterShader( "gfx/sprites/chatballoon" );
ADDRGP4 $589
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+16
ADDRLP4 76
INDIRI4
ASGNI4
line 848
;847:
;848:  cgs.media.disconnectPS              = CG_RegisterParticleSystem( "disconnectPS" );
ADDRGP4 $592
ARGP4
ADDRLP4 80
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+248
ADDRLP4 80
INDIRI4
ASGNI4
line 850
;849:
;850:  CG_UpdateMediaFraction( 0.7f );
CNSTF4 1060320051
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 852
;851:
;852:  memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 853
;853:  memset( cg_upgrades, 0, sizeof( cg_upgrades ) );
ADDRGP4 cg_upgrades
ARGP4
CNSTI4 0
ARGI4
CNSTI4 384
ARGI4
ADDRGP4 memset
CALLP4
pop
line 855
;854:
;855:  cgs.media.shadowMarkShader          = trap_R_RegisterShader( "gfx/marks/shadow" );
ADDRGP4 $595
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+224
ADDRLP4 84
INDIRI4
ASGNI4
line 856
;856:  cgs.media.wakeMarkShader            = trap_R_RegisterShader( "gfx/marks/wake" );
ADDRGP4 $598
ARGP4
ADDRLP4 88
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+228
ADDRLP4 88
INDIRI4
ASGNI4
line 858
;857:
;858:  cgs.media.poisonCloudPS             = CG_RegisterParticleSystem( "firstPersonPoisonCloudPS" );
ADDRGP4 $601
ARGP4
ADDRLP4 92
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+556
ADDRLP4 92
INDIRI4
ASGNI4
line 859
;859:  cgs.media.alienEvolvePS             = CG_RegisterParticleSystem( "alienEvolvePS" );
ADDRGP4 $604
ARGP4
ADDRLP4 96
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+560
ADDRLP4 96
INDIRI4
ASGNI4
line 860
;860:  cgs.media.alienAcidTubePS           = CG_RegisterParticleSystem( "alienAcidTubePS" );
ADDRGP4 $607
ARGP4
ADDRLP4 100
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+564
ADDRLP4 100
INDIRI4
ASGNI4
line 862
;861:
;862:  cgs.media.jetPackDescendPS          = CG_RegisterParticleSystem( "jetPackDescendPS" );
ADDRGP4 $610
ARGP4
ADDRLP4 104
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+424
ADDRLP4 104
INDIRI4
ASGNI4
line 863
;863:  cgs.media.jetPackHoverPS            = CG_RegisterParticleSystem( "jetPackHoverPS" );
ADDRGP4 $613
ARGP4
ADDRLP4 108
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+428
ADDRLP4 108
INDIRI4
ASGNI4
line 864
;864:  cgs.media.jetPackAscendPS           = CG_RegisterParticleSystem( "jetPackAscendPS" );
ADDRGP4 $616
ARGP4
ADDRLP4 112
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+432
ADDRLP4 112
INDIRI4
ASGNI4
line 866
;865:
;866:  cgs.media.humanBuildableDamagedPS   = CG_RegisterParticleSystem( "humanBuildableDamagedPS" );
ADDRGP4 $619
ARGP4
ADDRLP4 116
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+572
ADDRLP4 116
INDIRI4
ASGNI4
line 867
;867:  cgs.media.alienBuildableDamagedPS   = CG_RegisterParticleSystem( "alienBuildableDamagedPS" );
ADDRGP4 $622
ARGP4
ADDRLP4 120
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+580
ADDRLP4 120
INDIRI4
ASGNI4
line 868
;868:  cgs.media.humanBuildableDestroyedPS = CG_RegisterParticleSystem( "humanBuildableDestroyedPS" );
ADDRGP4 $625
ARGP4
ADDRLP4 124
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+576
ADDRLP4 124
INDIRI4
ASGNI4
line 869
;869:  cgs.media.alienBuildableDestroyedPS = CG_RegisterParticleSystem( "alienBuildableDestroyedPS" );
ADDRGP4 $628
ARGP4
ADDRLP4 128
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+584
ADDRLP4 128
INDIRI4
ASGNI4
line 871
;870:
;871:  cgs.media.alienBleedPS              = CG_RegisterParticleSystem( "alienBleedPS" );
ADDRGP4 $631
ARGP4
ADDRLP4 132
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+588
ADDRLP4 132
INDIRI4
ASGNI4
line 872
;872:  cgs.media.humanBleedPS              = CG_RegisterParticleSystem( "humanBleedPS" );
ADDRGP4 $634
ARGP4
ADDRLP4 136
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+592
ADDRLP4 136
INDIRI4
ASGNI4
line 874
;873:
;874:  cgs.media.laser          = trap_R_RegisterShader( "gfx/laser/laser" );
ADDRGP4 $637
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+640
ADDRLP4 140
INDIRI4
ASGNI4
line 876
;875:
;876:  cgs.media.fire   = CG_RegisterParticleSystem( "onfirePS" );
ADDRGP4 $640
ARGP4
ADDRLP4 144
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRGP4 cgs+268684+644
ADDRLP4 144
INDIRI4
ASGNI4
line 879
;877:
;878:  // register the inline models
;879:  cgs.numInlineModels = trap_CM_NumInlineModels( );
ADDRLP4 148
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+37308
ADDRLP4 148
INDIRI4
ASGNI4
line 881
;880:
;881:  for( i = 1; i < cgs.numInlineModels; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $645
JUMPV
LABELV $642
line 882
;882:  {
line 887
;883:    char    name[ 10 ];
;884:    vec3_t  mins, maxs;
;885:    int     j;
;886:
;887:    Com_sprintf( name, sizeof( name ), "*%i", i );
ADDRLP4 180
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $647
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 889
;888:
;889:    cgs.inlineDrawModel[ i ] = trap_R_RegisterModel( name );
ADDRLP4 180
ARGP4
ADDRLP4 192
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37312
ADDP4
ADDRLP4 192
INDIRI4
ASGNI4
line 890
;890:    trap_R_ModelBounds( cgs.inlineDrawModel[ i ], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37312
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRLP4 168
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 892
;891:
;892:    for( j = 0 ; j < 3 ; j++ )
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $650
line 893
;893:      cgs.inlineModelMidpoints[ i ][ j ] = mins[ j ] + 0.5 * ( maxs[ j ] - mins[ j ] );
ADDRLP4 196
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 200
ADDRLP4 196
INDIRI4
ADDRLP4 156
ADDP4
INDIRF4
ASGNF4
ADDRLP4 196
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+38336
ADDP4
ADDP4
ADDRLP4 200
INDIRF4
CNSTF4 1056964608
ADDRLP4 196
INDIRI4
ADDRLP4 168
ADDP4
INDIRF4
ADDRLP4 200
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $651
line 892
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $650
line 894
;894:  }
LABELV $643
line 881
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $645
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+37308
INDIRI4
LTI4 $642
line 897
;895:
;896:  // register all the server specified models
;897:  for( i = 1; i < MAX_MODELS; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $655
line 898
;898:  {
line 901
;899:    const char *modelName;
;900:
;901:    modelName = CG_ConfigString( CS_MODELS + i );
ADDRLP4 0
INDIRI4
CNSTI4 33
ADDI4
ARGI4
ADDRLP4 156
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 156
INDIRP4
ASGNP4
line 903
;902:
;903:    if( !modelName[ 0 ] )
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $659
line 904
;904:      break;
ADDRGP4 $657
JUMPV
LABELV $659
line 906
;905:
;906:    cgs.gameModels[ i ] = trap_R_RegisterModel( modelName );
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34748
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 907
;907:  }
LABELV $656
line 897
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $655
LABELV $657
line 909
;908:
;909:  CG_UpdateMediaFraction( 0.8f );
CNSTF4 1061997773
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 912
;910:
;911:  // register all the server specified shaders
;912:  for( i = 1; i < MAX_GAME_SHADERS; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $662
line 913
;913:  {
line 916
;914:    const char *shaderName;
;915:
;916:    shaderName = CG_ConfigString( CS_SHADERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 545
ADDI4
ARGI4
ADDRLP4 156
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 156
INDIRP4
ASGNP4
line 918
;917:
;918:    if( !shaderName[ 0 ] )
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $666
line 919
;919:      break;
ADDRGP4 $664
JUMPV
LABELV $666
line 921
;920:
;921:    cgs.gameShaders[ i ] = trap_R_RegisterShader( shaderName );
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35772
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 922
;922:  }
LABELV $663
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $662
LABELV $664
line 924
;923:
;924:  CG_UpdateMediaFraction( 0.9f );
CNSTF4 1063675494
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 927
;925:
;926:  // register all the server specified particle systems
;927:  for( i = 1; i < MAX_GAME_PARTICLE_SYSTEMS; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $669
line 928
;928:  {
line 931
;929:    const char *psName;
;930:
;931:    psName = CG_ConfigString( CS_PARTICLE_SYSTEMS + i );
ADDRLP4 0
INDIRI4
CNSTI4 609
ADDI4
ARGI4
ADDRLP4 156
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 156
INDIRP4
ASGNP4
line 933
;932:
;933:    if( !psName[ 0 ] )
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $673
line 934
;934:      break;
ADDRGP4 $671
JUMPV
LABELV $673
line 936
;935:
;936:    cgs.gameParticleSystems[ i ] = CG_RegisterParticleSystem( (char *)psName );
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 CG_RegisterParticleSystem
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36028
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 937
;937:  }
LABELV $670
line 927
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $669
LABELV $671
line 938
;938:}
LABELV $508
endproc CG_RegisterGraphics 204 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 16 12
line 948
;939:
;940:
;941:/*
;942:=======================
;943:CG_BuildSpectatorString
;944:
;945:=======================
;946:*/
;947:void CG_BuildSpectatorString( void )
;948:{
line 951
;949:  int i;
;950:
;951:  cg.spectatorList[ 0 ] = 0;
ADDRGP4 cg+113312
CNSTI1 0
ASGNI1
line 953
;952:
;953:  for( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $678
line 954
;954:  {
line 955
;955:    if( cgs.clientinfo[ i ].infoValid && cgs.clientinfo[ i ].team == PTE_NONE )
ADDRLP4 4
CNSTI4 1760
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+41408
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $682
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $682
line 956
;956:      Q_strcat( cg.spectatorList, sizeof( cg.spectatorList ), va( "%s     " S_COLOR_WHITE, cgs.clientinfo[ i ].name ) );
ADDRGP4 $689
ARGP4
CNSTI4 1760
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+41408+4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+113312
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $682
line 957
;957:  }
LABELV $679
line 953
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $678
line 959
;958:
;959:  i = strlen( cg.spectatorList );
ADDRGP4 cg+113312
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 961
;960:
;961:  if( i != cg.spectatorLen )
ADDRLP4 0
INDIRI4
ADDRGP4 cg+114336
INDIRI4
EQI4 $693
line 962
;962:  {
line 963
;963:    cg.spectatorLen = i;
ADDRGP4 cg+114336
ADDRLP4 0
INDIRI4
ASGNI4
line 964
;964:    cg.spectatorWidth = -1;
ADDRGP4 cg+114340
CNSTF4 3212836864
ASGNF4
line 965
;965:  }
LABELV $693
line 966
;966:}
LABELV $676
endproc CG_BuildSpectatorString 16 12
proc CG_RegisterClients 36 12
line 977
;967:
;968:
;969:
;970:/*
;971:===================
;972:CG_RegisterClients
;973:
;974:===================
;975:*/
;976:static void CG_RegisterClients( void )
;977:{
line 980
;978:  int   i;
;979:
;980:  cg.charModelFraction = 0.0f;
ADDRGP4 cg+117048
CNSTF4 0
ASGNF4
line 983
;981:
;982:  //precache all the models/sounds/etc
;983:  for( i = PCL_NONE + 1; i < PCL_NUM_CLASSES;  i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $700
line 984
;984:  {
line 985
;985:    CG_PrecacheClientInfo( i, BG_FindModelNameForClass( i ),
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 CG_PrecacheClientInfo
CALLV
pop
line 988
;986:                              BG_FindSkinNameForClass( i ) );
;987:
;988:    cg.charModelFraction = (float)i / (float)PCL_NUM_CLASSES;
ADDRGP4 cg+117048
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1095761920
DIVF4
ASGNF4
line 989
;989:    trap_UpdateScreen( );
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 990
;990:  }
LABELV $701
line 983
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $700
line 992
;991:
;992:  cgs.media.larmourHeadSkin    = trap_R_RegisterSkin( "models/players/human_base/head_light.skin" );
ADDRGP4 $707
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+268684+520
ADDRLP4 4
INDIRI4
ASGNI4
line 993
;993:  cgs.media.larmourLegsSkin    = trap_R_RegisterSkin( "models/players/human_base/lower_light.skin" );
ADDRGP4 $710
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+268684+524
ADDRLP4 8
INDIRI4
ASGNI4
line 994
;994:  cgs.media.larmourTorsoSkin   = trap_R_RegisterSkin( "models/players/human_base/upper_light.skin" );
ADDRGP4 $713
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+268684+528
ADDRLP4 12
INDIRI4
ASGNI4
line 996
;995:
;996:  cgs.media.jetpackModel       = trap_R_RegisterModel( "models/players/human_base/jetpack.md3" );
ADDRGP4 $716
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+268684+532
ADDRLP4 16
INDIRI4
ASGNI4
line 997
;997:  cgs.media.jetpackFlashModel  = trap_R_RegisterModel( "models/players/human_base/jetpack_flash.md3" );
ADDRGP4 $719
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+268684+536
ADDRLP4 20
INDIRI4
ASGNI4
line 998
;998:  cgs.media.battpackModel      = trap_R_RegisterModel( "models/players/human_base/battpack.md3" );
ADDRGP4 $722
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+268684+540
ADDRLP4 24
INDIRI4
ASGNI4
line 1000
;999:
;1000:  cg.charModelFraction = 1.0f;
ADDRGP4 cg+117048
CNSTF4 1065353216
ASGNF4
line 1001
;1001:  trap_UpdateScreen( );
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1004
;1002:
;1003:  //load all the clientinfos of clients already connected to the server
;1004:  for( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $724
line 1005
;1005:  {
line 1008
;1006:    const char  *clientInfo;
;1007:
;1008:    clientInfo = CG_ConfigString( CS_PLAYERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 1009
;1009:    if( !clientInfo[ 0 ] )
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $728
line 1010
;1010:      continue;
ADDRGP4 $725
JUMPV
LABELV $728
line 1012
;1011:
;1012:    CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1013
;1013:  }
LABELV $725
line 1004
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $724
line 1015
;1014:
;1015:  CG_BuildSpectatorString( );
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1016
;1016:}
LABELV $698
endproc CG_RegisterClients 36 12
export CG_ConfigString
proc CG_ConfigString 4 8
line 1026
;1017:
;1018://===========================================================================
;1019:
;1020:/*
;1021:=================
;1022:CG_ConfigString
;1023:=================
;1024:*/
;1025:const char *CG_ConfigString( int index )
;1026:{
line 1027
;1027:  if( index < 0 || index >= MAX_CONFIGSTRINGS )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $733
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $731
LABELV $733
line 1028
;1028:    CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $734
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
LABELV $731
line 1030
;1029:
;1030:  return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $730
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1042
;1031:}
;1032:
;1033://==================================================================
;1034:
;1035:/*
;1036:======================
;1037:CG_StartMusic
;1038:
;1039:======================
;1040:*/
;1041:void CG_StartMusic( void )
;1042:{
line 1047
;1043:  char  *s;
;1044:  char  parm1[ MAX_QPATH ], parm2[ MAX_QPATH ];
;1045:
;1046:  // start the background music
;1047:  s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1048
;1048:  Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1049
;1049:  Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1051
;1050:
;1051:  trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1052
;1052:}
LABELV $736
endproc CG_StartMusic 144 12
export CG_PlayerCount
proc CG_PlayerCount 12 0
line 1060
;1053:
;1054:/*
;1055:======================
;1056:CG_PlayerCount
;1057:======================
;1058:*/
;1059:int CG_PlayerCount( void )
;1060:{
line 1061
;1061:  int i, count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1063
;1062:
;1063:  CG_RequestScores( );
ADDRGP4 CG_RequestScores
CALLI4
pop
line 1065
;1064:
;1065:  for( i = 0; i < cg.numScores; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $741
JUMPV
LABELV $738
line 1066
;1066:  {
line 1067
;1067:    if( cg.scores[ i ].team == PTE_ALIENS ||
ADDRLP4 8
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 1
EQI4 $749
ADDRLP4 8
INDIRI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 2
NEI4 $743
LABELV $749
line 1069
;1068:        cg.scores[ i ].team == PTE_HUMANS )
;1069:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $743
line 1070
;1070:  }
LABELV $739
line 1065
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $741
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111460
INDIRI4
LTI4 $738
line 1072
;1071:
;1072:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $737
endproc CG_PlayerCount 12 0
bss
align 1
LABELV $751
skip 32768
export CG_GetMenuBuffer
code
proc CG_GetMenuBuffer 16 16
line 1081
;1073:}
;1074:
;1075://
;1076:// ==============================
;1077:// new hud stuff ( mission pack )
;1078:// ==============================
;1079://
;1080:char *CG_GetMenuBuffer( const char *filename )
;1081:{
line 1086
;1082:  int           len;
;1083:  fileHandle_t  f;
;1084:  static char   buf[ MAX_MENUFILE ];
;1085:
;1086:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 1088
;1087:
;1088:  if( !f )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $752
line 1089
;1089:  {
line 1090
;1090:    trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $754
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
line 1091
;1091:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $750
JUMPV
LABELV $752
line 1094
;1092:  }
;1093:
;1094:  if( len >= MAX_MENUFILE )
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $755
line 1095
;1095:  {
line 1096
;1096:    trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i",
ADDRGP4 $757
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
line 1098
;1097:                    filename, len, MAX_MENUFILE ) );
;1098:    trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1099
;1099:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $750
JUMPV
LABELV $755
line 1102
;1100:  }
;1101:
;1102:  trap_FS_Read( buf, len, f );
ADDRGP4 $751
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
line 1103
;1103:  buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $751
ADDP4
CNSTI1 0
ASGNI1
line 1104
;1104:  trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1106
;1105:
;1106:  return buf;
ADDRGP4 $751
RETP4
LABELV $750
endproc CG_GetMenuBuffer 16 16
export CG_Asset_Parse
proc CG_Asset_Parse 1124 12
line 1110
;1107:}
;1108:
;1109:qboolean CG_Asset_Parse( int handle )
;1110:{
line 1114
;1111:  pc_token_t token;
;1112:  const char *tempStr;
;1113:
;1114:  if( !trap_PC_ReadToken( handle, &token ) )
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
NEI4 $759
line 1115
;1115:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $759
line 1117
;1116:
;1117:  if( Q_stricmp( token.string, "{" ) != 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $764
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $766
line 1118
;1118:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $765
line 1121
;1119:
;1120:  while( 1 )
;1121:  {
line 1122
;1122:    if( !trap_PC_ReadToken( handle, &token ) )
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
NEI4 $768
line 1123
;1123:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $768
line 1125
;1124:
;1125:    if( Q_stricmp( token.string, "}" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $773
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $770
line 1126
;1126:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $758
JUMPV
LABELV $770
line 1129
;1127:
;1128:    // font
;1129:    if( Q_stricmp( token.string, "font" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $777
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $774
line 1130
;1130:    {
line 1133
;1131:      int pointSize;
;1132:
;1133:      if( !PC_String_Parse( handle, &tempStr ) || !PC_Int_Parse( handle, &pointSize ) )
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
EQI4 $780
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
NEI4 $778
LABELV $780
line 1134
;1134:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $778
line 1136
;1135:
;1136:      cgDC.registerFont( tempStr, pointSize, &cgDC.Assets.textFont );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 cgDC+228+12
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1137
;1137:      continue;
ADDRGP4 $766
JUMPV
LABELV $774
line 1141
;1138:    }
;1139:
;1140:    // smallFont
;1141:    if( Q_stricmp( token.string, "smallFont" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $787
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $784
line 1142
;1142:    {
line 1145
;1143:      int pointSize;
;1144:
;1145:      if( !PC_String_Parse( handle, &tempStr ) || !PC_Int_Parse( handle, &pointSize ) )
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
EQI4 $790
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
NEI4 $788
LABELV $790
line 1146
;1146:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $788
line 1148
;1147:
;1148:      cgDC.registerFont( tempStr, pointSize, &cgDC.Assets.smallFont );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 cgDC+228+20560
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1149
;1149:      continue;
ADDRGP4 $766
JUMPV
LABELV $784
line 1153
;1150:    }
;1151:
;1152:    // font
;1153:    if( Q_stricmp( token.string, "bigfont" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $794
line 1154
;1154:    {
line 1157
;1155:      int pointSize;
;1156:
;1157:      if( !PC_String_Parse( handle, &tempStr ) || !PC_Int_Parse( handle, &pointSize ) )
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
EQI4 $800
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
NEI4 $798
LABELV $800
line 1158
;1158:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $798
line 1160
;1159:
;1160:      cgDC.registerFont( tempStr, pointSize, &cgDC.Assets.bigFont );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 cgDC+228+41108
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1161
;1161:      continue;
ADDRGP4 $766
JUMPV
LABELV $794
line 1165
;1162:    }
;1163:
;1164:    // gradientbar
;1165:    if( Q_stricmp( token.string, "gradientbar" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $807
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $804
line 1166
;1166:    {
line 1167
;1167:      if( !PC_String_Parse( handle, &tempStr ) )
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
NEI4 $808
line 1168
;1168:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $808
line 1170
;1169:
;1170:      cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 1171
;1171:      continue;
ADDRGP4 $766
JUMPV
LABELV $804
line 1175
;1172:    }
;1173:
;1174:    // enterMenuSound
;1175:    if( Q_stricmp( token.string, "menuEnterSound" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $815
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $812
line 1176
;1176:    {
line 1177
;1177:      if( !PC_String_Parse( handle, &tempStr ) )
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
NEI4 $816
line 1178
;1178:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $816
line 1180
;1179:
;1180:      cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 1181
;1181:      continue;
ADDRGP4 $766
JUMPV
LABELV $812
line 1185
;1182:    }
;1183:
;1184:    // exitMenuSound
;1185:    if( Q_stricmp( token.string, "menuExitSound" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $823
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $820
line 1186
;1186:    {
line 1187
;1187:      if( !PC_String_Parse( handle, &tempStr ) )
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
NEI4 $824
line 1188
;1188:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $824
line 1190
;1189:
;1190:      cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 1191
;1191:      continue;
ADDRGP4 $766
JUMPV
LABELV $820
line 1195
;1192:    }
;1193:
;1194:    // itemFocusSound
;1195:    if( Q_stricmp( token.string, "itemFocusSound" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $831
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $828
line 1196
;1196:    {
line 1197
;1197:      if( !PC_String_Parse( handle, &tempStr ) )
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
NEI4 $832
line 1198
;1198:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $832
line 1200
;1199:
;1200:      cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 1201
;1201:      continue;
ADDRGP4 $766
JUMPV
LABELV $828
line 1205
;1202:    }
;1203:
;1204:    // menuBuzzSound
;1205:    if( Q_stricmp( token.string, "menuBuzzSound" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $839
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $836
line 1206
;1206:    {
line 1207
;1207:      if( !PC_String_Parse( handle, &tempStr ) )
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
NEI4 $840
line 1208
;1208:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $840
line 1210
;1209:
;1210:      cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 1211
;1211:      continue;
ADDRGP4 $766
JUMPV
LABELV $836
line 1214
;1212:    }
;1213:
;1214:    if( Q_stricmp( token.string, "cursor" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $847
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $844
line 1215
;1215:    {
line 1216
;1216:      if( !PC_String_Parse( handle, &cgDC.Assets.cursorStr ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $848
line 1217
;1217:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $848
line 1219
;1218:
;1219:      cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr );
ADDRGP4 cgDC+228+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 1220
;1220:      continue;
ADDRGP4 $766
JUMPV
LABELV $844
line 1223
;1221:    }
;1222:
;1223:    if( Q_stricmp( token.string, "fadeClamp" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $859
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $856
line 1224
;1224:    {
line 1225
;1225:      if( !PC_Float_Parse( handle, &cgDC.Assets.fadeClamp ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $766
line 1226
;1226:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
line 1228
;1227:
;1228:      continue;
LABELV $856
line 1231
;1229:    }
;1230:
;1231:    if( Q_stricmp( token.string, "fadeCycle" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $867
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $864
line 1232
;1232:    {
line 1233
;1233:      if( !PC_Int_Parse( handle, &cgDC.Assets.fadeCycle ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $766
line 1234
;1234:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
line 1236
;1235:
;1236:      continue;
LABELV $864
line 1239
;1237:    }
;1238:
;1239:    if( Q_stricmp( token.string, "fadeAmount" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $872
line 1240
;1240:    {
line 1241
;1241:      if( !PC_Float_Parse( handle, &cgDC.Assets.fadeAmount ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $766
line 1242
;1242:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
line 1244
;1243:
;1244:      continue;
LABELV $872
line 1247
;1245:    }
;1246:
;1247:    if( Q_stricmp( token.string, "shadowX" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $880
line 1248
;1248:    {
line 1249
;1249:      if( !PC_Float_Parse( handle, &cgDC.Assets.shadowX ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $766
line 1250
;1250:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
line 1252
;1251:
;1252:      continue;
LABELV $880
line 1255
;1253:    }
;1254:
;1255:    if( Q_stricmp( token.string, "shadowY" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $891
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $888
line 1256
;1256:    {
line 1257
;1257:      if( !PC_Float_Parse( handle, &cgDC.Assets.shadowY ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $766
line 1258
;1258:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
line 1260
;1259:
;1260:      continue;
LABELV $888
line 1263
;1261:    }
;1262:
;1263:    if( Q_stricmp( token.string, "shadowColor" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $899
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $896
line 1264
;1264:    {
line 1265
;1265:      if( !PC_Color_Parse( handle, &cgDC.Assets.shadowColor ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $900
line 1266
;1266:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $758
JUMPV
LABELV $900
line 1268
;1267:
;1268:      cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[ 3 ];
ADDRGP4 cgDC+228+61760
ADDRGP4 cgDC+228+61744+12
INDIRF4
ASGNF4
line 1269
;1269:      continue;
LABELV $896
line 1271
;1270:    }
;1271:  }
LABELV $766
line 1120
ADDRGP4 $765
JUMPV
line 1273
;1272:
;1273:  return qfalse; // bk001204 - why not?
CNSTI4 0
RETI4
LABELV $758
endproc CG_Asset_Parse 1124 12
export CG_ParseMenu
proc CG_ParseMenu 1064 8
line 1277
;1274:}
;1275:
;1276:void CG_ParseMenu( const char *menuFile )
;1277:{
line 1281
;1278:  pc_token_t  token;
;1279:  int         handle;
;1280:
;1281:  handle = trap_PC_LoadSource( menuFile );
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
line 1283
;1282:
;1283:  if( !handle )
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $910
line 1284
;1284:    handle = trap_PC_LoadSource( "ui/testhud.menu" );
ADDRGP4 $912
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
LABELV $910
line 1286
;1285:
;1286:  if( !handle )
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $916
line 1287
;1287:    return;
ADDRGP4 $909
JUMPV
LABELV $915
line 1290
;1288:
;1289:  while( 1 )
;1290:  {
line 1291
;1291:    if( !trap_PC_ReadToken( handle, &token ) )
ADDRLP4 1040
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
NEI4 $918
line 1292
;1292:      break;
ADDRGP4 $917
JUMPV
LABELV $918
line 1304
;1293:
;1294:    //if ( Q_stricmp( token, "{" ) ) {
;1295:    //  Com_Printf( "Missing { in menu file\n" );
;1296:    //  break;
;1297:    //}
;1298:
;1299:    //if ( menuCount == MAX_MENUS ) {
;1300:    //  Com_Printf( "Too many menus!\n" );
;1301:    //  break;
;1302:    //}
;1303:
;1304:    if( token.string[ 0 ] == '}' )
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $920
line 1305
;1305:      break;
ADDRGP4 $917
JUMPV
LABELV $920
line 1307
;1306:
;1307:    if( Q_stricmp( token.string, "assetGlobalDef" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $926
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $923
line 1308
;1308:    {
line 1309
;1309:      if( CG_Asset_Parse( handle ) )
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $917
line 1310
;1310:        continue;
ADDRGP4 $916
JUMPV
line 1312
;1311:      else
;1312:        break;
LABELV $923
line 1316
;1313:    }
;1314:
;1315:
;1316:    if( Q_stricmp( token.string, "menudef" ) == 0 )
ADDRLP4 0+16
ARGP4
ADDRGP4 $932
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $929
line 1317
;1317:    {
line 1319
;1318:      // start a new menu
;1319:      Menu_New( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 1320
;1320:    }
LABELV $929
line 1321
;1321:  }
LABELV $916
line 1289
ADDRGP4 $915
JUMPV
LABELV $917
line 1323
;1322:
;1323:  trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1324
;1324:}
LABELV $909
endproc CG_ParseMenu 1064 8
export CG_Load_Menu
proc CG_Load_Menu 20 8
line 1327
;1325:
;1326:qboolean CG_Load_Menu( char **p )
;1327:{
line 1330
;1328:  char *token;
;1329:
;1330:  token = COM_ParseExt( p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1332
;1331:
;1332:  if( token[ 0 ] != '{' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $937
line 1333
;1333:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $933
JUMPV
LABELV $936
line 1336
;1334:
;1335:  while( 1 )
;1336:  {
line 1337
;1337:    token = COM_ParseExt( p, qtrue );
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
line 1339
;1338:
;1339:    if( Q_stricmp( token, "}" ) == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $773
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $939
line 1340
;1340:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $933
JUMPV
LABELV $939
line 1342
;1341:
;1342:    if( !token || token[ 0 ] == 0 )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $943
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $941
LABELV $943
line 1343
;1343:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $933
JUMPV
LABELV $941
line 1345
;1344:
;1345:    CG_ParseMenu( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParseMenu
CALLV
pop
line 1346
;1346:  }
LABELV $937
line 1335
ADDRGP4 $936
JUMPV
line 1347
;1347:  return qfalse;
CNSTI4 0
RETI4
LABELV $933
endproc CG_Load_Menu 20 8
bss
align 1
LABELV $945
skip 4096
export CG_LoadMenus
code
proc CG_LoadMenus 52 16
line 1353
;1348:}
;1349:
;1350:
;1351:
;1352:void CG_LoadMenus( const char *menuFile )
;1353:{
line 1360
;1354:  char          *token;
;1355:  char          *p;
;1356:  int           len, start;
;1357:  fileHandle_t  f;
;1358:  static char   buf[ MAX_MENUDEFFILE ];
;1359:
;1360:  start = trap_Milliseconds( );
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 1362
;1361:
;1362:  len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 1364
;1363:
;1364:  if( !f )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $946
line 1365
;1365:  {
line 1366
;1366:    trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $948
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1367
;1367:    len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
ADDRGP4 $224
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 1369
;1368:
;1369:    if( !f )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $949
line 1370
;1370:      trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $951
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $949
line 1371
;1371:  }
LABELV $946
line 1373
;1372:
;1373:  if( len >= MAX_MENUDEFFILE )
ADDRLP4 12
INDIRI4
CNSTI4 4096
LTI4 $952
line 1374
;1374:  {
line 1375
;1375:    trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i",
ADDRGP4 $757
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 4096
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1377
;1376:                menuFile, len, MAX_MENUDEFFILE ) );
;1377:    trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1378
;1378:    return;
ADDRGP4 $944
JUMPV
LABELV $952
line 1381
;1379:  }
;1380:
;1381:  trap_FS_Read( buf, len, f );
ADDRGP4 $945
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1382
;1382:  buf[ len ] = 0;
ADDRLP4 12
INDIRI4
ADDRGP4 $945
ADDP4
CNSTI1 0
ASGNI1
line 1383
;1383:  trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1385
;1384:
;1385:  COM_Compress( buf );
ADDRGP4 $945
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 1387
;1386:
;1387:  Menu_Reset( );
ADDRGP4 Menu_Reset
CALLV
pop
line 1389
;1388:
;1389:  p = buf;
ADDRLP4 4
ADDRGP4 $945
ASGNP4
ADDRGP4 $955
JUMPV
LABELV $954
line 1392
;1390:
;1391:  while( 1 )
;1392:  {
line 1393
;1393:    token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1395
;1394:
;1395:    if( !token || token[ 0 ] == 0 || token[ 0 ] == '}' )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $960
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $960
ADDRLP4 36
INDIRI4
CNSTI4 125
NEI4 $957
LABELV $960
line 1396
;1396:      break;
ADDRGP4 $956
JUMPV
LABELV $957
line 1398
;1397:
;1398:    if( Q_stricmp( token, "}" ) == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $773
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $961
line 1399
;1399:      break;
ADDRGP4 $956
JUMPV
LABELV $961
line 1401
;1400:
;1401:    if( Q_stricmp( token, "loadmenu" ) == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $965
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $963
line 1402
;1402:    {
line 1403
;1403:      if( CG_Load_Menu( &p ) )
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 CG_Load_Menu
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $956
line 1404
;1404:        continue;
line 1406
;1405:      else
;1406:        break;
LABELV $963
line 1408
;1407:    }
;1408:  }
LABELV $955
line 1391
ADDRGP4 $954
JUMPV
LABELV $956
line 1410
;1409:
;1410:  Com_Printf( "UI menu load time = %d milli seconds\n", trap_Milliseconds( ) - start );
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $968
ARGP4
ADDRLP4 28
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1411
;1411:}
LABELV $944
endproc CG_LoadMenus 52 16
proc CG_OwnerDrawHandleKey 0 0
line 1416
;1412:
;1413:
;1414:
;1415:static qboolean CG_OwnerDrawHandleKey( int ownerDraw, int flags, float *special, int key )
;1416:{
line 1417
;1417:  return qfalse;
CNSTI4 0
RETI4
LABELV $969
endproc CG_OwnerDrawHandleKey 0 0
proc CG_FeederCount 8 0
line 1422
;1418:}
;1419:
;1420:
;1421:static int CG_FeederCount( float feederID )
;1422:{
line 1423
;1423:  int i, count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1425
;1424:
;1425:  /*if( feederID == FEEDER_ALIENTEAM_LIST )
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $971
line 1434
;1426:  {
;1427:    for( i = 0; i < cg.numScores; i++ )
;1428:    {
;1429:      if( cg.scores[ i ].team == PTE_ALIENS )
;1430:        count++;
;1431:    }
;1432:  }
;1433:  else*/ if( feederID == FEEDER_HUMANTEAM_LIST )
;1434:  {
line 1435
;1435:    for( i = 0; i < cg.numScores; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $976
JUMPV
LABELV $973
line 1436
;1436:    {
line 1437
;1437:      if( cg.scores[ i ].team == PTE_HUMANS )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 2
NEI4 $978
line 1438
;1438:        count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $978
line 1439
;1439:    }
LABELV $974
line 1435
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $976
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111460
INDIRI4
LTI4 $973
line 1440
;1440:  }
LABELV $971
line 1442
;1441:
;1442:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $970
endproc CG_FeederCount 8 0
export CG_SetScoreSelection
proc CG_SetScoreSelection 28 16
line 1447
;1443:}
;1444:
;1445:
;1446:void CG_SetScoreSelection( void *p )
;1447:{
line 1448
;1448:  menuDef_t     *menu = (menuDef_t*)p;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
line 1449
;1449:  playerState_t *ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1453
;1450:  int           i, alien, human;
;1451:  int           feeder;
;1452:
;1453:  alien = human = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1455
;1454:
;1455:  for( i = 0; i < cg.numScores; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $987
JUMPV
LABELV $984
line 1456
;1456:  {
line 1457
;1457:    if( cg.scores[ i ].team == PTE_ALIENS )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 1
NEI4 $989
line 1458
;1458:      alien++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $990
JUMPV
LABELV $989
line 1459
;1459:    else if( cg.scores[ i ].team == PTE_HUMANS )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 2
NEI4 $993
line 1460
;1460:      human++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $993
LABELV $990
line 1462
;1461:
;1462:    if( ps->clientNum == cg.scores[ i ].client )
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476
ADDP4
INDIRI4
NEI4 $997
line 1463
;1463:      cg.selectedScore = i;
ADDRGP4 cg+111464
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $997
line 1464
;1464:  }
LABELV $985
line 1455
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $987
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111460
INDIRI4
LTI4 $984
line 1466
;1465:
;1466:  if( menu == NULL )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1001
line 1468
;1467:    // just interested in setting the selected score
;1468:    return;
ADDRGP4 $982
JUMPV
LABELV $1001
line 1470
;1469:
;1470:  feeder = FEEDER_ALIENTEAM_LIST;
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1471
;1471:  i = alien;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1473
;1472:
;1473:  if( cg.scores[ cg.selectedScore ].team == PTE_HUMANS )
CNSTI4 28
ADDRGP4 cg+111464
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1003
line 1474
;1474:  {
line 1475
;1475:    feeder = FEEDER_HUMANTEAM_LIST;
ADDRLP4 20
CNSTI4 6
ASGNI4
line 1476
;1476:    i = human;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1477
;1477:  }
LABELV $1003
line 1479
;1478:
;1479:  Menu_SetFeederSelection(menu, feeder, i, NULL);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 1480
;1480:}
LABELV $982
endproc CG_SetScoreSelection 28 16
proc CG_InfoFromScoreIndex 8 0
line 1484
;1481:
;1482:// FIXME: might need to cache this info
;1483:static clientInfo_t * CG_InfoFromScoreIndex( int index, int team, int *scoreIndex )
;1484:{
line 1486
;1485:  int i, count;
;1486:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1488
;1487:
;1488:  for( i = 0; i < cg.numScores; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1012
JUMPV
LABELV $1009
line 1489
;1489:  {
line 1490
;1490:    if( cg.scores[ i ].team == team )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1014
line 1491
;1491:    {
line 1492
;1492:      if( count == index )
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1018
line 1493
;1493:      {
line 1494
;1494:        *scoreIndex = i;
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1495
;1495:        return &cgs.clientinfo[ cg.scores[ i ].client ];
CNSTI4 1760
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
RETP4
ADDRGP4 $1008
JUMPV
LABELV $1018
line 1497
;1496:      }
;1497:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1498
;1498:    }
LABELV $1014
line 1499
;1499:  }
LABELV $1010
line 1488
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1012
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111460
INDIRI4
LTI4 $1009
line 1501
;1500:
;1501:  *scoreIndex = index;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1502
;1502:  return &cgs.clientinfo[ cg.scores[ index ].client ];
CNSTI4 1760
CNSTI4 28
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
RETP4
LABELV $1008
endproc CG_InfoFromScoreIndex 8 0
proc CG_FeederItemText 72 12
line 1506
;1503:}
;1504:
;1505:static const char *CG_FeederItemText( float feederID, int index, int column, qhandle_t *handle )
;1506:{
line 1507
;1507:  int           scoreIndex = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1508
;1508:  clientInfo_t  *info = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1509
;1509:  int           team = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 1510
;1510:  score_t       *sp = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1511
;1511:  qboolean      showIcons = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1513
;1512:
;1513:  *handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 1515
;1514:
;1515:  if( feederID == FEEDER_ALIENTEAM_LIST )
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $1025
line 1516
;1516:    team = PTE_ALIENS;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1026
JUMPV
LABELV $1025
line 1517
;1517:  else if( feederID == FEEDER_HUMANTEAM_LIST )
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $1027
line 1518
;1518:    team = PTE_HUMANS;
ADDRLP4 8
CNSTI4 2
ASGNI4
LABELV $1027
LABELV $1026
line 1520
;1519:
;1520:  info = CG_InfoFromScoreIndex( index, team, &scoreIndex );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 20
ADDRGP4 CG_InfoFromScoreIndex
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1521
;1521:  sp = &cg.scores[ scoreIndex ];
ADDRLP4 4
CNSTI4 28
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cg+111476
ADDP4
ASGNP4
line 1523
;1522:
;1523:  if( ( atoi( CG_ConfigString( CS_CLIENTS_READY ) ) & ( 1 << sp->client ) ) &&
CNSTI4 26
ARGI4
ADDRLP4 24
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRP4
INDIRI4
LSHI4
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $1030
ADDRGP4 cg+24
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1030
line 1525
;1524:      cg.intermissionStarted )
;1525:    showIcons = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $1031
JUMPV
LABELV $1030
line 1526
;1526:  else if( cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_flags & PMF_FOLLOW ||
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1041
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $1041
ADDRLP4 8
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
EQI4 $1041
ADDRGP4 cg+24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1033
LABELV $1041
line 1528
;1527:    team == cg.snap->ps.stats[ STAT_PTEAM ] || cg.intermissionStarted )
;1528:    showIcons = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
LABELV $1033
LABELV $1031
line 1530
;1529:
;1530:  if( info && info->infoValid )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1042
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1042
line 1531
;1531:  {
line 1532
;1532:    switch( column )
ADDRLP4 44
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $1044
ADDRLP4 44
INDIRI4
CNSTI4 6
GTI4 $1044
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1081
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1081
address $1046
address $1052
address $1067
address $1072
address $1073
address $1075
address $1077
code
line 1533
;1533:    {
LABELV $1046
line 1535
;1534:      case 0:
;1535:        if( showIcons )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1045
line 1536
;1536:        {
line 1537
;1537:          if( sp->weapon != WP_NONE )
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1045
line 1538
;1538:            *handle = cg_weapons[ sp->weapon ].weaponIcon;
ADDRFP4 12
INDIRP4
CNSTI4 900
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+36
ADDP4
INDIRI4
ASGNI4
line 1539
;1539:        }
line 1540
;1540:        break;
ADDRGP4 $1045
JUMPV
LABELV $1052
line 1543
;1541:
;1542:      case 1:
;1543:        if( showIcons )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1045
line 1544
;1544:        {
line 1545
;1545:          if( sp->team == PTE_HUMANS && sp->upgrade != UP_NONE )
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1055
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1055
line 1546
;1546:            *handle = cg_upgrades[ sp->upgrade ].upgradeIcon;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_upgrades+8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1045
JUMPV
LABELV $1055
line 1547
;1547:          else if( sp->team == PTE_ALIENS )
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1045
line 1548
;1548:          {
line 1549
;1549:            switch( sp->weapon )
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
CNSTI4 19
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1063
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $1045
LABELV $1066
ADDRLP4 52
INDIRI4
CNSTI4 24
EQI4 $1063
ADDRLP4 52
INDIRI4
CNSTI4 26
EQI4 $1063
ADDRLP4 52
INDIRI4
CNSTI4 28
EQI4 $1063
ADDRGP4 $1045
JUMPV
line 1550
;1550:            {
LABELV $1063
line 1555
;1551:              case WP_ABUILD2:
;1552:              case WP_ALEVEL1_UPG:
;1553:              case WP_ALEVEL2_UPG:
;1554:              case WP_ALEVEL3_UPG:
;1555:                *handle = cgs.media.upgradeClassIconShader;
ADDRFP4 12
INDIRP4
ADDRGP4 cgs+268684+636
INDIRI4
ASGNI4
line 1556
;1556:                break;
line 1559
;1557:
;1558:              default:
;1559:                break;
line 1561
;1560:            }
;1561:          }
line 1562
;1562:        }
line 1563
;1563:        break;
ADDRGP4 $1045
JUMPV
LABELV $1067
line 1566
;1564:
;1565:      case 2:
;1566:        if( ( atoi( CG_ConfigString( CS_CLIENTS_READY ) ) & ( 1 << sp->client ) ) &&
CNSTI4 26
ARGI4
ADDRLP4 48
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRP4
INDIRI4
LSHI4
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $1045
ADDRGP4 cg+24
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $1045
line 1568
;1567:            cg.intermissionStarted )
;1568:          return "Ready";
ADDRGP4 $1071
RETP4
ADDRGP4 $1024
JUMPV
line 1569
;1569:        break;
LABELV $1072
line 1572
;1570:
;1571:      case 3:
;1572:        return info->name;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
RETP4
ADDRGP4 $1024
JUMPV
line 1573
;1573:        break;
LABELV $1073
line 1576
;1574:
;1575:      case 4:
;1576:        return va( "%d", info->score );
ADDRGP4 $1074
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
RETP4
ADDRGP4 $1024
JUMPV
line 1577
;1577:        break;
LABELV $1075
line 1580
;1578:
;1579:      case 5:
;1580:        return va( "%4d", sp->time );
ADDRGP4 $1076
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
RETP4
ADDRGP4 $1024
JUMPV
line 1581
;1581:        break;
LABELV $1077
line 1584
;1582:
;1583:      case 6:
;1584:        if( sp->ping == -1 )
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1078
line 1585
;1585:          return "connecting";
ADDRGP4 $1080
RETP4
ADDRGP4 $1024
JUMPV
LABELV $1078
line 1587
;1586:
;1587:        return va( "%4d", sp->ping );
ADDRGP4 $1076
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
RETP4
ADDRGP4 $1024
JUMPV
line 1588
;1588:        break;
LABELV $1044
LABELV $1045
line 1590
;1589:    }
;1590:  }
LABELV $1042
line 1592
;1591:
;1592:  return "";
ADDRGP4 $237
RETP4
LABELV $1024
endproc CG_FeederItemText 72 12
proc CG_FeederItemImage 0 0
line 1596
;1593:}
;1594:
;1595:static qhandle_t CG_FeederItemImage( float feederID, int index )
;1596:{
line 1597
;1597:  return 0;
CNSTI4 0
RETI4
LABELV $1082
endproc CG_FeederItemImage 0 0
proc CG_FeederSelection 16 0
line 1601
;1598:}
;1599:
;1600:static void CG_FeederSelection( float feederID, int index )
;1601:{
line 1603
;1602:  int i, count;
;1603:  int team = ( feederID == FEEDER_ALIENTEAM_LIST ) ? PTE_ALIENS : PTE_HUMANS;
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $1085
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $1086
JUMPV
LABELV $1085
ADDRLP4 12
CNSTI4 2
ASGNI4
LABELV $1086
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1604
;1604:  count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1606
;1605:
;1606:  for( i = 0; i < cg.numScores; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1090
JUMPV
LABELV $1087
line 1607
;1607:  {
line 1608
;1608:    if( cg.scores[ i ].team == team )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+111476+16
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1092
line 1609
;1609:    {
line 1610
;1610:      if( index == count )
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1096
line 1611
;1611:        cg.selectedScore = i;
ADDRGP4 cg+111464
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $1096
line 1613
;1612:
;1613:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1614
;1614:    }
LABELV $1092
line 1615
;1615:  }
LABELV $1088
line 1606
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1090
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111460
INDIRI4
LTI4 $1087
line 1616
;1616:}
LABELV $1083
endproc CG_FeederSelection 16 0
proc CG_Cvar_Get 132 12
line 1619
;1617:
;1618:static float CG_Cvar_Get( const char *cvar )
;1619:{
line 1622
;1620:  char buff[ 128 ];
;1621:
;1622:  memset( buff, 0, sizeof( buff ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1623
;1623:  trap_Cvar_VariableStringBuffer( cvar, buff, sizeof( buff ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1624
;1624:  return atof( buff );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $1099
endproc CG_Cvar_Get 132 12
export CG_Text_PaintWithCursor
proc CG_Text_PaintWithCursor 0 32
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 1629
;1625:}
;1626:
;1627:void CG_Text_PaintWithCursor( float x, float y, float scale, vec4_t color, const char *text,
;1628:                              int cursorPos, char cursor, int limit, int style )
;1629:{
line 1630
;1630:  CG_Text_Paint( x, y, scale, color, text, 0, limit, style );
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
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1631
;1631:}
LABELV $1100
endproc CG_Text_PaintWithCursor 0 32
proc CG_OwnerDrawWidth 8 12
line 1634
;1632:
;1633:static int CG_OwnerDrawWidth( int ownerDraw, float scale )
;1634:{
line 1635
;1635:  switch( ownerDraw )
ADDRFP4 0
INDIRI4
CNSTI4 50
EQI4 $1104
ADDRGP4 $1102
JUMPV
line 1636
;1636:  {
LABELV $1104
line 1638
;1637:    case CG_KILLER:
;1638:      return CG_Text_Width( CG_GetKillerText( ), scale, 0 );
ADDRLP4 0
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1101
JUMPV
line 1639
;1639:      break;
LABELV $1102
line 1642
;1640:  }
;1641:
;1642:  return 0;
CNSTI4 0
RETI4
LABELV $1101
endproc CG_OwnerDrawWidth 8 12
proc CG_PlayCinematic 4 24
line 1646
;1643:}
;1644:
;1645:static int CG_PlayCinematic( const char *name, float x, float y, float w, float h )
;1646:{
line 1647
;1647:  return trap_CIN_PlayCinematic( name, x, y, w, h, CIN_loop );
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
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1105
endproc CG_PlayCinematic 4 24
proc CG_StopCinematic 0 4
line 1651
;1648:}
;1649:
;1650:static void CG_StopCinematic( int handle )
;1651:{
line 1652
;1652:  trap_CIN_StopCinematic( handle );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 1653
;1653:}
LABELV $1106
endproc CG_StopCinematic 0 4
proc CG_DrawCinematic 0 20
line 1656
;1654:
;1655:static void CG_DrawCinematic( int handle, float x, float y, float w, float h )
;1656:{
line 1657
;1657:  trap_CIN_SetExtents( handle, x, y, w, h );
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
line 1658
;1658:  trap_CIN_DrawCinematic( handle );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1659
;1659:}
LABELV $1107
endproc CG_DrawCinematic 0 20
proc CG_RunCinematicFrame 0 4
line 1662
;1660:
;1661:static void CG_RunCinematicFrame( int handle )
;1662:{
line 1663
;1663:  trap_CIN_RunCinematic( handle );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1664
;1664:}
LABELV $1108
endproc CG_RunCinematicFrame 0 4
proc CG_OwnerDrawVisible 0 0
line 1668
;1665:
;1666://TA: hack to prevent warning
;1667:static qboolean CG_OwnerDrawVisible( int parameter )
;1668:{
line 1669
;1669:  return qfalse;
CNSTI4 0
RETI4
LABELV $1109
endproc CG_OwnerDrawVisible 0 0
export CG_LoadHudMenu
proc CG_LoadHudMenu 1028 12
line 1678
;1670:}
;1671:
;1672:/*
;1673:=================
;1674:CG_LoadHudMenu
;1675:=================
;1676:*/
;1677:void CG_LoadHudMenu( void )
;1678:{
line 1682
;1679:  char        buff[ 1024 ];
;1680:  const char  *hudSet;
;1681:
;1682:  cgDC.registerShaderNoMip  = &trap_R_RegisterShaderNoMip;
ADDRGP4 cgDC
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 1683
;1683:  cgDC.setColor             = &trap_R_SetColor;
ADDRGP4 cgDC+4
ADDRGP4 trap_R_SetColor
ASGNP4
line 1684
;1684:  cgDC.drawHandlePic        = &CG_DrawPic;
ADDRGP4 cgDC+8
ADDRGP4 CG_DrawPic
ASGNP4
line 1685
;1685:  cgDC.drawStretchPic       = &trap_R_DrawStretchPic;
ADDRGP4 cgDC+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 1686
;1686:  cgDC.drawText             = &CG_Text_Paint;
ADDRGP4 cgDC+16
ADDRGP4 CG_Text_Paint
ASGNP4
line 1687
;1687:  cgDC.textWidth            = &CG_Text_Width;
ADDRGP4 cgDC+20
ADDRGP4 CG_Text_Width
ASGNP4
line 1688
;1688:  cgDC.textHeight           = &CG_Text_Height;
ADDRGP4 cgDC+24
ADDRGP4 CG_Text_Height
ASGNP4
line 1689
;1689:  cgDC.registerModel        = &trap_R_RegisterModel;
ADDRGP4 cgDC+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 1690
;1690:  cgDC.modelBounds          = &trap_R_ModelBounds;
ADDRGP4 cgDC+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 1691
;1691:  cgDC.fillRect             = &CG_FillRect;
ADDRGP4 cgDC+36
ADDRGP4 CG_FillRect
ASGNP4
line 1692
;1692:  cgDC.drawRect             = &CG_DrawRect;
ADDRGP4 cgDC+40
ADDRGP4 CG_DrawRect
ASGNP4
line 1693
;1693:  cgDC.drawSides            = &CG_DrawSides;
ADDRGP4 cgDC+44
ADDRGP4 CG_DrawSides
ASGNP4
line 1694
;1694:  cgDC.drawTopBottom        = &CG_DrawTopBottom;
ADDRGP4 cgDC+48
ADDRGP4 CG_DrawTopBottom
ASGNP4
line 1695
;1695:  cgDC.clearScene           = &trap_R_ClearScene;
ADDRGP4 cgDC+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 1696
;1696:  cgDC.addRefEntityToScene  = &trap_R_AddRefEntityToScene;
ADDRGP4 cgDC+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 1697
;1697:  cgDC.renderScene          = &trap_R_RenderScene;
ADDRGP4 cgDC+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 1698
;1698:  cgDC.registerFont         = &trap_R_RegisterFont;
ADDRGP4 cgDC+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 1699
;1699:  cgDC.ownerDrawItem        = &CG_OwnerDraw;
ADDRGP4 cgDC+68
ADDRGP4 CG_OwnerDraw
ASGNP4
line 1700
;1700:  cgDC.getValue             = &CG_GetValue;
ADDRGP4 cgDC+72
ADDRGP4 CG_GetValue
ASGNP4
line 1701
;1701:  cgDC.ownerDrawVisible     = &CG_OwnerDrawVisible;
ADDRGP4 cgDC+76
ADDRGP4 CG_OwnerDrawVisible
ASGNP4
line 1702
;1702:  cgDC.runScript            = &CG_RunMenuScript;
ADDRGP4 cgDC+80
ADDRGP4 CG_RunMenuScript
ASGNP4
line 1703
;1703:  cgDC.getTeamColor         = &CG_GetTeamColor;
ADDRGP4 cgDC+84
ADDRGP4 CG_GetTeamColor
ASGNP4
line 1704
;1704:  cgDC.setCVar              = trap_Cvar_Set;
ADDRGP4 cgDC+96
ADDRGP4 trap_Cvar_Set
ASGNP4
line 1705
;1705:  cgDC.getCVarString        = trap_Cvar_VariableStringBuffer;
ADDRGP4 cgDC+88
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 1706
;1706:  cgDC.getCVarValue         = CG_Cvar_Get;
ADDRGP4 cgDC+92
ADDRGP4 CG_Cvar_Get
ASGNP4
line 1707
;1707:  cgDC.drawTextWithCursor   = &CG_Text_PaintWithCursor;
ADDRGP4 cgDC+100
ADDRGP4 CG_Text_PaintWithCursor
ASGNP4
line 1710
;1708:  //cgDC.setOverstrikeMode    = &trap_Key_SetOverstrikeMode;
;1709:  //cgDC.getOverstrikeMode    = &trap_Key_GetOverstrikeMode;
;1710:  cgDC.startLocalSound      = &trap_S_StartLocalSound;
ADDRGP4 cgDC+112
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 1711
;1711:  cgDC.ownerDrawHandleKey   = &CG_OwnerDrawHandleKey;
ADDRGP4 cgDC+116
ADDRGP4 CG_OwnerDrawHandleKey
ASGNP4
line 1712
;1712:  cgDC.feederCount          = &CG_FeederCount;
ADDRGP4 cgDC+120
ADDRGP4 CG_FeederCount
ASGNP4
line 1713
;1713:  cgDC.feederItemImage      = &CG_FeederItemImage;
ADDRGP4 cgDC+128
ADDRGP4 CG_FeederItemImage
ASGNP4
line 1714
;1714:  cgDC.feederItemText       = &CG_FeederItemText;
ADDRGP4 cgDC+124
ADDRGP4 CG_FeederItemText
ASGNP4
line 1715
;1715:  cgDC.feederSelection      = &CG_FeederSelection;
ADDRGP4 cgDC+132
ADDRGP4 CG_FeederSelection
ASGNP4
line 1720
;1716:  //cgDC.setBinding           = &trap_Key_SetBinding;
;1717:  //cgDC.getBindingBuf        = &trap_Key_GetBindingBuf;
;1718:  //cgDC.keynumToStringBuf    = &trap_Key_KeynumToStringBuf;
;1719:  //cgDC.executeText          = &trap_Cmd_ExecuteText;
;1720:  cgDC.Error                = &Com_Error;
ADDRGP4 cgDC+152
ADDRGP4 Com_Error
ASGNP4
line 1721
;1721:  cgDC.Print                = &Com_Printf;
ADDRGP4 cgDC+156
ADDRGP4 Com_Printf
ASGNP4
line 1722
;1722:  cgDC.ownerDrawWidth       = &CG_OwnerDrawWidth;
ADDRGP4 cgDC+164
ADDRGP4 CG_OwnerDrawWidth
ASGNP4
line 1724
;1723:  //cgDC.Pause                = &CG_Pause;
;1724:  cgDC.registerSound        = &trap_S_RegisterSound;
ADDRGP4 cgDC+168
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 1725
;1725:  cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 cgDC+172
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 1726
;1726:  cgDC.stopBackgroundTrack  = &trap_S_StopBackgroundTrack;
ADDRGP4 cgDC+176
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 1727
;1727:  cgDC.playCinematic        = &CG_PlayCinematic;
ADDRGP4 cgDC+180
ADDRGP4 CG_PlayCinematic
ASGNP4
line 1728
;1728:  cgDC.stopCinematic        = &CG_StopCinematic;
ADDRGP4 cgDC+184
ADDRGP4 CG_StopCinematic
ASGNP4
line 1729
;1729:  cgDC.drawCinematic        = &CG_DrawCinematic;
ADDRGP4 cgDC+188
ADDRGP4 CG_DrawCinematic
ASGNP4
line 1730
;1730:  cgDC.runCinematicFrame    = &CG_RunCinematicFrame;
ADDRGP4 cgDC+192
ADDRGP4 CG_RunCinematicFrame
ASGNP4
line 1732
;1731:
;1732:  Init_Display( &cgDC );
ADDRGP4 cgDC
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 1734
;1733:
;1734:  Menu_Reset( );
ADDRGP4 Menu_Reset
CALLV
pop
line 1736
;1735:
;1736:  trap_Cvar_VariableStringBuffer( "cg_hudFiles", buff, sizeof( buff ) );
ADDRGP4 $223
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1737
;1737:  hudSet = buff;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 1739
;1738:
;1739:  if( hudSet[ 0 ] == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1152
line 1740
;1740:    hudSet = "ui/hud.txt";
ADDRLP4 0
ADDRGP4 $224
ASGNP4
LABELV $1152
line 1742
;1741:
;1742:  CG_LoadMenus( hudSet );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
line 1743
;1743:}
LABELV $1110
endproc CG_LoadHudMenu 1028 12
export CG_AssetCache
proc CG_AssetCache 36 4
line 1746
;1744:
;1745:void CG_AssetCache( void )
;1746:{
line 1747
;1747:  cgDC.Assets.gradientBar         = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $1157
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61660
ADDRLP4 0
INDIRI4
ASGNI4
line 1748
;1748:  cgDC.Assets.scrollBar           = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $1160
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61680
ADDRLP4 4
INDIRI4
ASGNI4
line 1749
;1749:  cgDC.Assets.scrollBarArrowDown  = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $1163
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61668
ADDRLP4 8
INDIRI4
ASGNI4
line 1750
;1750:  cgDC.Assets.scrollBarArrowUp    = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $1166
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61664
ADDRLP4 12
INDIRI4
ASGNI4
line 1751
;1751:  cgDC.Assets.scrollBarArrowLeft  = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $1169
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61672
ADDRLP4 16
INDIRI4
ASGNI4
line 1752
;1752:  cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $1172
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61676
ADDRLP4 20
INDIRI4
ASGNI4
line 1753
;1753:  cgDC.Assets.scrollBarThumb      = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $1175
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61684
ADDRLP4 24
INDIRI4
ASGNI4
line 1754
;1754:  cgDC.Assets.sliderBar           = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $1178
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61700
ADDRLP4 28
INDIRI4
ASGNI4
line 1755
;1755:  cgDC.Assets.sliderThumb         = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $1181
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61704
ADDRLP4 32
INDIRI4
ASGNI4
line 1756
;1756:}
LABELV $1154
endproc CG_AssetCache 36 4
export CG_Init
proc CG_Init 32 12
line 1767
;1757:
;1758:/*
;1759:=================
;1760:CG_Init
;1761:
;1762:Called after every level change or subsystem restart
;1763:Will perform callbacks to make the loading info screen update.
;1764:=================
;1765:*/
;1766:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum )
;1767:{
line 1771
;1768:  const char  *s;
;1769:
;1770:  // clear everything
;1771:  memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 269336
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1772
;1772:  memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 125536
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1773
;1773:  memset( cg_entities, 0, sizeof( cg_entities ) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1765376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1775
;1774:
;1775:  cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1777
;1776:
;1777:  cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31460
ADDRFP4 0
INDIRI4
ASGNI4
line 1778
;1778:  cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31456
ADDRFP4 4
INDIRI4
ASGNI4
line 1781
;1779:
;1780:  // load a few needed things before we do any screen updates
;1781:  cgs.media.whiteShader     = trap_R_RegisterShader( "white" );
ADDRGP4 $1188
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+4
ADDRLP4 4
INDIRI4
ASGNI4
line 1782
;1782:  cgs.media.charsetShader   = trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1190
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684
ADDRLP4 8
INDIRI4
ASGNI4
line 1783
;1783:  cgs.media.outlineShader   = trap_R_RegisterShader( "outline" );
ADDRGP4 $1193
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+268684+8
ADDRLP4 12
INDIRI4
ASGNI4
line 1786
;1784:
;1785:  //inform UI to repress cursor whilst loading
;1786:  trap_Cvar_Set( "ui_loading", "1" );
ADDRGP4 $242
ARGP4
ADDRGP4 $122
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1789
;1787:
;1788:  //TA: load overrides
;1789:  BG_InitClassOverrides( );
ADDRGP4 BG_InitClassOverrides
CALLV
pop
line 1790
;1790:  BG_InitBuildableOverrides( );
ADDRGP4 BG_InitBuildableOverrides
CALLV
pop
line 1791
;1791:  BG_InitAllowedGameElements( );
ADDRGP4 BG_InitAllowedGameElements
CALLV
pop
line 1794
;1792:
;1793:  //TA: dyn memory
;1794:  CG_InitMemory( );
ADDRGP4 CG_InitMemory
CALLV
pop
line 1796
;1795:
;1796:  CG_RegisterCvars( );
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1798
;1797:
;1798:  CG_InitConsoleCommands( );
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1801
;1799:
;1800:  //TA: moved up for LoadHudMenu
;1801:  String_Init( );
ADDRGP4 String_Init
CALLV
pop
line 1804
;1802:
;1803:  //TA: TA UI
;1804:  CG_AssetCache( );
ADDRGP4 CG_AssetCache
CALLV
pop
line 1805
;1805:  CG_LoadHudMenu( );      // load new hud stuff
ADDRGP4 CG_LoadHudMenu
CALLV
pop
line 1807
;1806:
;1807:  cg.weaponSelect = WP_NONE;
ADDRGP4 cg+109940
CNSTI4 0
ASGNI4
line 1812
;1808:
;1809:  // old servers
;1810:
;1811:  // get the rendering configuration from the client system
;1812:  trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1813
;1813:  cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31444
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 1814
;1814:  cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31448
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 1817
;1815:
;1816:  // get the gamestate from the client system
;1817:  trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 1820
;1818:
;1819:  // check version
;1820:  s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 16
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1822
;1821:
;1822:  if( strcmp( s, GAME_VERSION ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1204
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1202
line 1823
;1823:    CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1205
ARGP4
ADDRGP4 $1204
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $1202
line 1825
;1824:
;1825:  s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 24
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 1826
;1826:  cgs.levelStartTime = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34668
ADDRLP4 28
INDIRI4
ASGNI4
line 1828
;1827:
;1828:  CG_ParseServerinfo( );
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 1831
;1829:
;1830:  // load the new map
;1831:  trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 1833
;1832:
;1833:  cg.loading = qtrue;   // force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 1835
;1834:
;1835:  CG_LoadTrailSystems( );
ADDRGP4 CG_LoadTrailSystems
CALLV
pop
line 1836
;1836:  CG_UpdateMediaFraction( 0.05f );
CNSTF4 1028443341
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1838
;1837:
;1838:  CG_LoadParticleSystems( );
ADDRGP4 CG_LoadParticleSystems
CALLV
pop
line 1839
;1839:  CG_UpdateMediaFraction( 0.05f );
CNSTF4 1028443341
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1841
;1840:
;1841:  CG_RegisterSounds( );
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 1842
;1842:  CG_UpdateMediaFraction( 0.60f );
CNSTF4 1058642330
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1844
;1843:
;1844:  CG_RegisterGraphics( );
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 1845
;1845:  CG_UpdateMediaFraction( 0.90f );
CNSTF4 1063675494
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1847
;1846:
;1847:  CG_InitWeapons( );
ADDRGP4 CG_InitWeapons
CALLV
pop
line 1848
;1848:  CG_UpdateMediaFraction( 0.95f );
CNSTF4 1064514355
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1850
;1849:
;1850:  CG_InitUpgrades( );
ADDRGP4 CG_InitUpgrades
CALLV
pop
line 1851
;1851:  CG_UpdateMediaFraction( 1.0f );
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_UpdateMediaFraction
CALLV
pop
line 1854
;1852:
;1853:  //TA:
;1854:  CG_InitBuildables( );
ADDRGP4 CG_InitBuildables
CALLV
pop
line 1856
;1855:
;1856:  CG_RegisterClients( );   // if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 1858
;1857:
;1858:  cg.loading = qfalse;  // future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 1860
;1859:
;1860:  CG_InitMarkPolys( );
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 1863
;1861:
;1862:  // remove the last loading update
;1863:  cg.infoScreenText[ 0 ] = 0;
ADDRGP4 cg+110432
CNSTI1 0
ASGNI1
line 1866
;1864:
;1865:  // Make sure we have update values (scores)
;1866:  CG_SetConfigValues( );
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 1868
;1867:
;1868:  CG_StartMusic( );
ADDRGP4 CG_StartMusic
CALLV
pop
line 1870
;1869:
;1870:  CG_ShaderStateChanged( );
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 1872
;1871:
;1872:  trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 1874
;1873:
;1874:  trap_Cvar_Set( "ui_loading", "0" );
ADDRGP4 $242
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1876
;1875:
;1876:  CG_Printf("^1Loading Zombie CGAME QVM\n");
ADDRGP4 $1211
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1877
;1877:}
LABELV $1182
endproc CG_Init 32 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 1887
;1878:
;1879:/*
;1880:=================
;1881:CG_Shutdown
;1882:
;1883:Called before every level change or subsystem restart
;1884:=================
;1885:*/
;1886:void CG_Shutdown( void )
;1887:{
line 1890
;1888:  // some mods may need to do cleanup work here,
;1889:  // like closing files or archiving session data
;1890:}
LABELV $1212
endproc CG_Shutdown 0 0
bss
export cg_pmove_msec
align 4
LABELV cg_pmove_msec
skip 272
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export cgDC
align 4
LABELV cgDC
skip 73356
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
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
export cg_debugRandom
align 4
LABELV cg_debugRandom
skip 272
export ui_humanTeamVoteActive
align 4
LABELV ui_humanTeamVoteActive
skip 272
export ui_alienTeamVoteActive
align 4
LABELV ui_alienTeamVoteActive
skip 272
export ui_voteActive
align 4
LABELV ui_voteActive
skip 272
export ui_loading
align 4
LABELV ui_loading
skip 272
export ui_dialog
align 4
LABELV ui_dialog
skip 272
export ui_stages
align 4
LABELV ui_stages
skip 272
export ui_carriage
align 4
LABELV ui_carriage
skip 272
export ui_currentClass
align 4
LABELV ui_currentClass
skip 272
export cg_painBlendZoom
align 4
LABELV cg_painBlendZoom
skip 272
export cg_painBlendScale
align 4
LABELV cg_painBlendScale
skip 272
export cg_painBlendMax
align 4
LABELV cg_painBlendMax
skip 272
export cg_painBlendDownRate
align 4
LABELV cg_painBlendDownRate
skip 272
export cg_painBlendUpRate
align 4
LABELV cg_painBlendUpRate
skip 272
export cg_tutorial
align 4
LABELV cg_tutorial
skip 272
export cg_disableScannerPlane
align 4
LABELV cg_disableScannerPlane
skip 272
export cg_disableWarningDialogs
align 4
LABELV cg_disableWarningDialogs
skip 272
export cg_debugPVS
align 4
LABELV cg_debugPVS
skip 272
export cg_debugTrails
align 4
LABELV cg_debugTrails
skip 272
export cg_debugParticles
align 4
LABELV cg_debugParticles
skip 272
export cg_lightFlare
align 4
LABELV cg_lightFlare
skip 272
export cg_consoleLatency
align 4
LABELV cg_consoleLatency
skip 272
export cg_depthSortParticles
align 4
LABELV cg_depthSortParticles
skip 272
export cg_wwToggle
align 4
LABELV cg_wwToggle
skip 272
export cg_wwFollow
align 4
LABELV cg_wwFollow
skip 272
export cg_wwSmoothTime
align 4
LABELV cg_wwSmoothTime
skip 272
export cg_debugAlloc
align 4
LABELV cg_debugAlloc
skip 272
export cg_drawBBOX
align 4
LABELV cg_drawBBOX
skip 272
export cg_drawSurfNormal
align 4
LABELV cg_drawSurfNormal
skip 272
export cg_creepRes
align 4
LABELV cg_creepRes
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_noVoiceText
align 4
LABELV cg_noVoiceText
skip 272
export cg_noVoiceChats
align 4
LABELV cg_noVoiceChats
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_synchronousClients
align 4
LABELV cg_synchronousClients
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_stereoSeparation
align 4
LABELV cg_stereoSeparation
skip 272
export cg_thirdPersonhax
align 4
LABELV cg_thirdPersonhax
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRangehax
align 4
LABELV cg_thirdPersonRangehax
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_debugMove
align 4
LABELV cg_debugMove
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_teslaTrailTime
align 4
LABELV cg_teslaTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawDemoState
align 4
LABELV cg_drawDemoState
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_buildables
align 4
LABELV cg_buildables
skip 16632
export cg_upgrades
align 4
LABELV cg_upgrades
skip 384
export cg_weapons
align 4
LABELV cg_weapons
skip 28800
export cg_entities
align 4
LABELV cg_entities
skip 1765376
export cg
align 4
LABELV cg
skip 125536
export cgs
align 4
LABELV cgs
skip 269336
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
LABELV $1211
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 67
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 81
byte 1 86
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $1205
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1204
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1193
byte 1 111
byte 1 117
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1190
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1188
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1181
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
LABELV $1178
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
LABELV $1175
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
LABELV $1172
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
LABELV $1169
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
LABELV $1166
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
LABELV $1163
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
LABELV $1160
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
LABELV $1157
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
LABELV $1080
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
byte 1 0
align 1
LABELV $1076
byte 1 37
byte 1 52
byte 1 100
byte 1 0
align 1
LABELV $1074
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1071
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $968
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
LABELV $965
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
LABELV $951
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
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
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
LABELV $948
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
LABELV $932
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $926
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
LABELV $912
byte 1 117
byte 1 105
byte 1 47
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $899
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
LABELV $891
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $883
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $875
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
LABELV $867
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
LABELV $859
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
LABELV $847
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $839
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
LABELV $831
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
LABELV $823
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
LABELV $815
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
LABELV $807
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
LABELV $797
byte 1 98
byte 1 105
byte 1 103
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $787
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
LABELV $777
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $773
byte 1 125
byte 1 0
align 1
LABELV $764
byte 1 123
byte 1 0
align 1
LABELV $757
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
LABELV $754
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
LABELV $734
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $722
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $719
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 106
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $716
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 106
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $713
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $710
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $707
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
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $689
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $647
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $640
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $637
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $634
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $631
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $628
byte 1 97
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
byte 1 68
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $625
byte 1 104
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
byte 1 68
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $622
byte 1 97
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
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $619
byte 1 104
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
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $616
byte 1 106
byte 1 101
byte 1 116
byte 1 80
byte 1 97
byte 1 99
byte 1 107
byte 1 65
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $613
byte 1 106
byte 1 101
byte 1 116
byte 1 80
byte 1 97
byte 1 99
byte 1 107
byte 1 72
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $610
byte 1 106
byte 1 101
byte 1 116
byte 1 80
byte 1 97
byte 1 99
byte 1 107
byte 1 68
byte 1 101
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $607
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 65
byte 1 99
byte 1 105
byte 1 100
byte 1 84
byte 1 117
byte 1 98
byte 1 101
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $604
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 69
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $601
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 80
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 67
byte 1 108
byte 1 111
byte 1 117
byte 1 100
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $598
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 47
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $595
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $592
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
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $589
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $586
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 97
byte 1 95
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $577
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 95
byte 1 99
byte 1 121
byte 1 108
byte 1 0
align 1
LABELV $574
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 111
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $571
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $568
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $565
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $562
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $559
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 0
align 1
LABELV $556
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $553
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $550
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $547
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $544
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $541
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
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
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 98
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $529
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 49
byte 1 50
byte 1 95
byte 1 48
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $528
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 49
byte 1 48
byte 1 95
byte 1 53
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $527
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 57
byte 1 95
byte 1 48
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $526
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 55
byte 1 95
byte 1 53
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $525
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 54
byte 1 95
byte 1 48
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $524
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 52
byte 1 95
byte 1 53
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $523
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 51
byte 1 95
byte 1 48
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $522
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
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 47
byte 1 49
byte 1 95
byte 1 53
byte 1 112
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $520
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $519
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $518
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $517
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $516
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $515
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $514
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $513
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $512
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $511
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $510
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $507
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $504
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 110
byte 1 47
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $501
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $498
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 105
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $495
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $492
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $489
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $486
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 37
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $479
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $476
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 47
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $473
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $470
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $467
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 47
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $464
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $461
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $458
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 47
byte 1 106
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $455
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 47
byte 1 106
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $452
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 47
byte 1 106
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $437
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $433
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $429
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $426
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $421
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
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
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $418
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $415
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $412
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $409
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $406
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $403
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 95
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $400
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $397
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $394
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $391
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 52
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $388
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 52
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $385
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 49
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $382
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $379
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 100
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $373
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $370
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $359
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $287
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
LABELV $286
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
LABELV $285
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
LABELV $284
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $283
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $280
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $279
byte 1 45
byte 1 50
byte 1 0
align 1
LABELV $278
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $271
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $270
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $269
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $268
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $267
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
LABELV $266
byte 1 48
byte 1 46
byte 1 50
byte 1 0
align 1
LABELV $265
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
LABELV $264
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $263
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $262
byte 1 56
byte 1 0
align 1
LABELV $261
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $260
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $259
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $258
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $257
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $256
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $255
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $253
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $252
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
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $251
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
LABELV $250
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $248
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
LABELV $247
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $245
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
LABELV $244
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
LABELV $243
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
LABELV $242
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
LABELV $241
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $240
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 105
byte 1 97
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $239
byte 1 48
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $238
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
LABELV $237
byte 1 0
align 1
LABELV $236
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
LABELV $235
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
LABELV $234
byte 1 48
byte 1 46
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $233
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 90
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $232
byte 1 55
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $231
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $230
byte 1 48
byte 1 46
byte 1 55
byte 1 0
align 1
LABELV $229
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 77
byte 1 97
byte 1 120
byte 1 0
align 1
LABELV $228
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $226
byte 1 49
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 85
byte 1 112
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $224
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
LABELV $223
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
LABELV $222
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 117
byte 1 116
byte 1 111
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $221
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $220
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 68
byte 1 105
byte 1 97
byte 1 108
byte 1 111
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $219
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 80
byte 1 86
byte 1 83
byte 1 0
align 1
LABELV $218
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $216
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $214
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 119
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $212
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 119
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $211
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 119
byte 1 83
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 66
byte 1 66
byte 1 79
byte 1 88
byte 1 0
align 1
LABELV $207
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 117
byte 1 114
byte 1 102
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $206
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 112
byte 1 82
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $202
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $199
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $194
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $193
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $191
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
byte 1 104
byte 1 97
byte 1 120
byte 1 0
align 1
LABELV $190
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
LABELV $189
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
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $188
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
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 104
byte 1 97
byte 1 120
byte 1 0
align 1
LABELV $187
byte 1 49
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $186
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
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $184
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $181
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $173
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $167
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $165
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $163
byte 1 51
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $158
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $157
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 50
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 108
byte 1 97
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $153
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
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $150
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
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $146
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
LABELV $145
byte 1 52
byte 1 0
align 1
LABELV $144
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
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $136
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
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $132
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
LABELV $131
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 83
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $129
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $126
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $125
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $122
byte 1 49
byte 1 0
align 1
LABELV $121
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $120
byte 1 48
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 0
