code
proc UI_PlayerInfo_SetWeapon 0 0
file "..\..\..\..\src/ui/ui_players.c"
line 56
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
;24:// ui_players.c
;25:
;26:#include "ui_local.h"
;27:
;28:
;29:#define UI_TIMER_GESTURE    2300
;30:#define UI_TIMER_JUMP      1000
;31:#define UI_TIMER_LAND      130
;32:#define UI_TIMER_WEAPON_SWITCH  300
;33:#define UI_TIMER_ATTACK      500
;34:#define  UI_TIMER_MUZZLE_FLASH  20
;35:#define  UI_TIMER_WEAPON_DELAY  250
;36:
;37:#define JUMP_HEIGHT        56
;38:
;39:#define SWINGSPEED        0.3f
;40:
;41:#define SPIN_SPEED        0.9f
;42:#define COAST_TIME        1000
;43:
;44:
;45:static int      dp_realtime;
;46:static float    jumpHeight;
;47:sfxHandle_t weaponChangeSound;
;48:
;49:
;50:/*
;51:===============
;52:UI_PlayerInfo_SetWeapon
;53:===============
;54:*/
;55:static void UI_PlayerInfo_SetWeapon( playerInfo_t *pi, weapon_t weaponNum )
;56:{
line 138
;57:  //TA: FIXME: this is probably useless for trem
;58:/*  gitem_t *  item;
;59:  char    path[MAX_QPATH];
;60:
;61:  pi->currentWeapon = weaponNum;
;62:tryagain:
;63:  pi->realWeapon = weaponNum;
;64:  pi->weaponModel = 0;
;65:  pi->barrelModel = 0;
;66:  pi->flashModel = 0;
;67:
;68:  if ( weaponNum == WP_NONE ) {
;69:    return;
;70:  }
;71:
;72:  if ( item->classname ) {
;73:    pi->weaponModel = trap_R_RegisterModel( item->world_model[0] );
;74:  }
;75:
;76:  if( pi->weaponModel == 0 ) {
;77:    if( weaponNum == WP_MACHINEGUN ) {
;78:      weaponNum = WP_NONE;
;79:      goto tryagain;
;80:    }
;81:    weaponNum = WP_MACHINEGUN;
;82:    goto tryagain;
;83:  }
;84:
;85:  if ( weaponNum == WP_MACHINEGUN ) {
;86:    strcpy( path, item->world_model[0] );
;87:    COM_StripExtension( path, path );
;88:    strcat( path, "_barrel.md3" );
;89:    pi->barrelModel = trap_R_RegisterModel( path );
;90:  }
;91:
;92:  strcpy( path, item->world_model[0] );
;93:  COM_StripExtension( path, path );
;94:  strcat( path, "_flash.md3" );
;95:  pi->flashModel = trap_R_RegisterModel( path );
;96:
;97:  switch( weaponNum ) {
;98:  case WP_GAUNTLET:
;99:    MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
;100:    break;
;101:
;102:  case WP_MACHINEGUN:
;103:    MAKERGB( pi->flashDlightColor, 1, 1, 0 );
;104:    break;
;105:
;106:  case WP_SHOTGUN:
;107:    MAKERGB( pi->flashDlightColor, 1, 1, 0 );
;108:    break;
;109:
;110:  case WP_GRENADE_LAUNCHER:
;111:    MAKERGB( pi->flashDlightColor, 1, 0.7f, 0.5f );
;112:    break;
;113:
;114:  case WP_ROCKET_LAUNCHER:
;115:    MAKERGB( pi->flashDlightColor, 1, 0.75f, 0 );
;116:    break;
;117:
;118:  case WP_TESLAGEN:
;119:    MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
;120:    break;
;121:
;122:  case WP_RAILGUN:
;123:    MAKERGB( pi->flashDlightColor, 1, 0.5f, 0 );
;124:    break;
;125:
;126:  case WP_BFG:
;127:    MAKERGB( pi->flashDlightColor, 1, 0.7f, 1 );
;128:    break;
;129:
;130:  case WP_GRAPPLING_HOOK:
;131:    MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
;132:    break;
;133:
;134:  default:
;135:    MAKERGB( pi->flashDlightColor, 1, 1, 1 );
;136:    break;
;137:  }*/
;138:}
LABELV $109
endproc UI_PlayerInfo_SetWeapon 0 0
proc UI_ForceLegsAnim 8 0
line 146
;139:
;140:
;141:/*
;142:===============
;143:UI_ForceLegsAnim
;144:===============
;145:*/
;146:static void UI_ForceLegsAnim( playerInfo_t *pi, int anim ) {
line 147
;147:  pi->legsAnim = ( ( pi->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 149
;148:
;149:  if ( anim == LEGS_JUMP ) {
ADDRFP4 4
INDIRI4
CNSTI4 18
NEI4 $111
line 150
;150:    pi->legsAnimationTimer = UI_TIMER_JUMP;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1000
ASGNI4
line 151
;151:  }
LABELV $111
line 152
;152:}
LABELV $110
endproc UI_ForceLegsAnim 8 0
proc UI_SetLegsAnim 0 8
line 160
;153:
;154:
;155:/*
;156:===============
;157:UI_SetLegsAnim
;158:===============
;159:*/
;160:static void UI_SetLegsAnim( playerInfo_t *pi, int anim ) {
line 161
;161:  if ( pi->pendingLegsAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $114
line 162
;162:    anim = pi->pendingLegsAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
ASGNI4
line 163
;163:    pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 164
;164:  }
LABELV $114
line 165
;165:  UI_ForceLegsAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 166
;166:}
LABELV $113
endproc UI_SetLegsAnim 0 8
proc UI_ForceTorsoAnim 12 0
line 174
;167:
;168:
;169:/*
;170:===============
;171:UI_ForceTorsoAnim
;172:===============
;173:*/
;174:static void UI_ForceTorsoAnim( playerInfo_t *pi, int anim ) {
line 175
;175:  pi->torsoAnim = ( ( pi->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 177
;176:
;177:  if ( anim == TORSO_GESTURE ) {
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $117
line 178
;178:    pi->torsoAnimationTimer = UI_TIMER_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 2300
ASGNI4
line 179
;179:  }
LABELV $117
line 181
;180:
;181:  if ( anim == TORSO_ATTACK || anim == TORSO_ATTACK2 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 7
EQI4 $121
ADDRLP4 8
INDIRI4
CNSTI4 8
NEI4 $119
LABELV $121
line 182
;182:    pi->torsoAnimationTimer = UI_TIMER_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 500
ASGNI4
line 183
;183:  }
LABELV $119
line 184
;184:}
LABELV $116
endproc UI_ForceTorsoAnim 12 0
proc UI_SetTorsoAnim 0 8
line 192
;185:
;186:
;187:/*
;188:===============
;189:UI_SetTorsoAnim
;190:===============
;191:*/
;192:static void UI_SetTorsoAnim( playerInfo_t *pi, int anim ) {
line 193
;193:  if ( pi->pendingTorsoAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $123
line 194
;194:    anim = pi->pendingTorsoAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
ASGNI4
line 195
;195:    pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 196
;196:  }
LABELV $123
line 198
;197:
;198:  UI_ForceTorsoAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 199
;199:}
LABELV $122
endproc UI_SetTorsoAnim 0 8
proc UI_TorsoSequencing 16 8
line 207
;200:
;201:
;202:/*
;203:===============
;204:UI_TorsoSequencing
;205:===============
;206:*/
;207:static void UI_TorsoSequencing( playerInfo_t *pi ) {
line 210
;208:  int    currentAnim;
;209:
;210:  currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 212
;211:
;212:  if ( pi->weapon != pi->currentWeapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
EQI4 $126
line 213
;213:    if ( currentAnim != TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $128
line 214
;214:      pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 300
ASGNI4
line 215
;215:      UI_ForceTorsoAnim( pi, TORSO_DROP );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 216
;216:    }
LABELV $128
line 217
;217:  }
LABELV $126
line 219
;218:
;219:  if ( pi->torsoAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
INDIRI4
CNSTI4 0
LEI4 $130
line 220
;220:    return;
ADDRGP4 $125
JUMPV
LABELV $130
line 223
;221:  }
;222:
;223:  if( currentAnim == TORSO_GESTURE ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $132
line 224
;224:    UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 225
;225:    return;
ADDRGP4 $125
JUMPV
LABELV $132
line 228
;226:  }
;227:
;228:  if( currentAnim == TORSO_ATTACK || currentAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $136
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $134
LABELV $136
line 229
;229:    UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 230
;230:    return;
ADDRGP4 $125
JUMPV
LABELV $134
line 233
;231:  }
;232:
;233:  if ( currentAnim == TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $137
line 234
;234:    UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 235
;235:    pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 300
ASGNI4
line 236
;236:    UI_ForceTorsoAnim( pi, TORSO_RAISE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 237
;237:    return;
ADDRGP4 $125
JUMPV
LABELV $137
line 240
;238:  }
;239:
;240:  if ( currentAnim == TORSO_RAISE ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $139
line 241
;241:    UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 242
;242:    return;
LABELV $139
line 244
;243:  }
;244:}
LABELV $125
endproc UI_TorsoSequencing 16 8
proc UI_LegsSequencing 8 8
line 252
;245:
;246:
;247:/*
;248:===============
;249:UI_LegsSequencing
;250:===============
;251:*/
;252:static void UI_LegsSequencing( playerInfo_t *pi ) {
line 255
;253:  int    currentAnim;
;254:
;255:  currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 257
;256:
;257:  if ( pi->legsAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
LEI4 $142
line 258
;258:    if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $141
line 259
;259:      jumpHeight = JUMP_HEIGHT * sin( M_PI * ( UI_TIMER_JUMP - pi->legsAnimationTimer ) / UI_TIMER_JUMP );
CNSTF4 1078530011
CNSTI4 1000
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 jumpHeight
CNSTF4 1113587712
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 260
;260:    }
line 261
;261:    return;
ADDRGP4 $141
JUMPV
LABELV $142
line 264
;262:  }
;263:
;264:  if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $146
line 265
;265:    UI_ForceLegsAnim( pi, LEGS_LAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 266
;266:    pi->legsAnimationTimer = UI_TIMER_LAND;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 130
ASGNI4
line 267
;267:    jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 268
;268:    return;
ADDRGP4 $141
JUMPV
LABELV $146
line 271
;269:  }
;270:
;271:  if ( currentAnim == LEGS_LAND ) {
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $148
line 272
;272:    UI_SetLegsAnim( pi, LEGS_IDLE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 UI_SetLegsAnim
CALLV
pop
line 273
;273:    return;
LABELV $148
line 275
;274:  }
;275:}
LABELV $141
endproc UI_LegsSequencing 8 8
proc UI_PositionEntityOnTag 84 24
line 284
;276:
;277:
;278:/*
;279:======================
;280:UI_PositionEntityOnTag
;281:======================
;282:*/
;283:static void UI_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent,
;284:              clipHandle_t parentModel, char *tagName ) {
line 289
;285:  int        i;
;286:  orientation_t  lerped;
;287:
;288:  // lerp the tag
;289:  trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 293
;290:    1.0 - parent->backlerp, tagName );
;291:
;292:  // FIXME: allow origin offsets along tag?
;293:  VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
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
INDIRB
ASGNB 12
line 294
;294:  for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $151
line 295
;295:    VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 296
;296:  }
LABELV $152
line 294
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $151
line 299
;297:
;298:  // cast away const because of compiler problems
;299:  MatrixMultiply( lerped.axis, ((refEntity_t*)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 300
;300:  entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
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
ASGNF4
line 301
;301:}
LABELV $150
endproc UI_PositionEntityOnTag 84 24
proc UI_PositionRotatedEntityOnTag 120 24
line 310
;302:
;303:
;304:/*
;305:======================
;306:UI_PositionRotatedEntityOnTag
;307:======================
;308:*/
;309:static void UI_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent,
;310:              clipHandle_t parentModel, char *tagName ) {
line 316
;311:  int        i;
;312:  orientation_t  lerped;
;313:  vec3_t      tempAxis[3];
;314:
;315:  // lerp the tag
;316:  trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 320
;317:    1.0 - parent->backlerp, tagName );
;318:
;319:  // FIXME: allow origin offsets along tag?
;320:  VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 321
;321:  for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $157
line 322
;322:    VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:  }
LABELV $158
line 321
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $157
line 326
;324:
;325:  // cast away const because of compiler problems
;326:  MatrixMultiply( entity->axis, ((refEntity_t *)parent)->axis, tempAxis );
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 327
;327:  MatrixMultiply( lerped.axis, tempAxis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 328
;328:}
LABELV $156
endproc UI_PositionRotatedEntityOnTag 120 24
proc UI_SetLerpFrameAnimation 12 8
line 336
;329:
;330:
;331:/*
;332:===============
;333:UI_SetLerpFrameAnimation
;334:===============
;335:*/
;336:static void UI_SetLerpFrameAnimation( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 339
;337:  animation_t  *anim;
;338:
;339:  lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 340
;340:  newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 342
;341:
;342:  if ( newAnimation < 0 || newAnimation >= MAX_PLAYER_ANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $165
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $163
LABELV $165
line 343
;343:    trap_Error( va("Bad animation number: %i", newAnimation) );
ADDRGP4 $166
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 344
;344:  }
LABELV $163
line 346
;345:
;346:  anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
ASGNP4
line 348
;347:
;348:  lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 349
;349:  lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 350
;350:}
LABELV $162
endproc UI_SetLerpFrameAnimation 12 8
proc UI_RunLerpFrame 32 12
line 358
;351:
;352:
;353:/*
;354:===============
;355:UI_RunLerpFrame
;356:===============
;357:*/
;358:static void UI_RunLerpFrame( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 363
;359:  int      f;
;360:  animation_t  *anim;
;361:
;362:  // see if the animation sequence is switching
;363:  if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $170
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $168
LABELV $170
line 364
;364:    UI_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_SetLerpFrameAnimation
CALLV
pop
line 365
;365:  }
LABELV $168
line 369
;366:
;367:  // if we have passed the current frame, move it to
;368:  // oldFrame and calculate a new frame
;369:  if ( dp_realtime >= lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $171
line 370
;370:    lf->oldFrame = lf->frame;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 371
;371:    lf->oldFrameTime = lf->frameTime;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 374
;372:
;373:    // get the next frame based on the animation
;374:    anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 375
;375:    if ( dp_realtime < lf->animationTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $173
line 376
;376:      lf->frameTime = lf->animationTime;    // initial lerp
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 377
;377:    } else {
ADDRGP4 $174
JUMPV
LABELV $173
line 378
;378:      lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 379
;379:    }
LABELV $174
line 380
;380:    f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 381
;381:    if ( f >= anim->numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $175
line 382
;382:      f -= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 383
;383:      if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $177
line 384
;384:        f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 385
;385:        f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 386
;386:      } else {
ADDRGP4 $178
JUMPV
LABELV $177
line 387
;387:        f = anim->numFrames - 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 390
;388:        // the animation is stuck at the end, so it
;389:        // can immediately transition to another sequence
;390:        lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 391
;391:      }
LABELV $178
line 392
;392:    }
LABELV $175
line 393
;393:    lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 394
;394:    if ( dp_realtime > lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $179
line 395
;395:      lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 396
;396:    }
LABELV $179
line 397
;397:  }
LABELV $171
line 399
;398:
;399:  if ( lf->frameTime > dp_realtime + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 200
ADDI4
LEI4 $181
line 400
;400:    lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 401
;401:  }
LABELV $181
line 403
;402:
;403:  if ( lf->oldFrameTime > dp_realtime ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
LEI4 $183
line 404
;404:    lf->oldFrameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 405
;405:  }
LABELV $183
line 407
;406:  // calculate current lerp value
;407:  if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $185
line 408
;408:    lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 409
;409:  } else {
ADDRGP4 $186
JUMPV
LABELV $185
line 410
;410:    lf->backlerp = 1.0 - (float)( dp_realtime - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 411
;411:  }
LABELV $186
line 412
;412:}
LABELV $167
endproc UI_RunLerpFrame 32 12
proc UI_PlayerAnimation 16 12
line 421
;413:
;414:
;415:/*
;416:===============
;417:UI_PlayerAnimation
;418:===============
;419:*/
;420:static void UI_PlayerAnimation( playerInfo_t *pi, int *legsOld, int *legs, float *legsBackLerp,
;421:            int *torsoOld, int *torso, float *torsoBackLerp ) {
line 424
;422:
;423:  // legs animation
;424:  pi->legsAnimationTimer -= uiInfo.uiDC.frameTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
SUBI4
ASGNI4
line 425
;425:  if ( pi->legsAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
GEI4 $189
line 426
;426:    pi->legsAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 427
;427:  }
LABELV $189
line 429
;428:
;429:  UI_LegsSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_LegsSequencing
CALLV
pop
line 431
;430:
;431:  if ( pi->legs.yawing && ( pi->legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $191
line 432
;432:    UI_RunLerpFrame( pi, &pi->legs, LEGS_TURN );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 433
;433:  } else {
ADDRGP4 $192
JUMPV
LABELV $191
line 434
;434:    UI_RunLerpFrame( pi, &pi->legs, pi->legsAnim );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 435
;435:  }
LABELV $192
line 436
;436:  *legsOld = pi->legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 437
;437:  *legs = pi->legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 438
;438:  *legsBackLerp = pi->legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 441
;439:
;440:  // torso animation
;441:  pi->torsoAnimationTimer -= uiInfo.uiDC.frameTime;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
SUBI4
ASGNI4
line 442
;442:  if ( pi->torsoAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
INDIRI4
CNSTI4 0
GEI4 $194
line 443
;443:    pi->torsoAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 0
ASGNI4
line 444
;444:  }
LABELV $194
line 446
;445:
;446:  UI_TorsoSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_TorsoSequencing
CALLV
pop
line 448
;447:
;448:  UI_RunLerpFrame( pi, &pi->torso, pi->torsoAnim );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 449
;449:  *torsoOld = pi->torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 450
;450:  *torso = pi->torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ASGNI4
line 451
;451:  *torsoBackLerp = pi->torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 452
;452:}
LABELV $187
endproc UI_PlayerAnimation 16 12
proc UI_SwingAngles 28 8
line 461
;453:
;454:
;455:/*
;456:==================
;457:UI_SwingAngles
;458:==================
;459:*/
;460:static void UI_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;461:          float speed, float *angle, qboolean *swinging ) {
line 466
;462:  float  swing;
;463:  float  move;
;464:  float  scale;
;465:
;466:  if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $197
line 468
;467:    // see if a swing should be started
;468:    swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 469
;469:    if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $201
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $199
LABELV $201
line 470
;470:      *swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 471
;471:    }
LABELV $199
line 472
;472:  }
LABELV $197
line 474
;473:
;474:  if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $202
line 475
;475:    return;
ADDRGP4 $196
JUMPV
LABELV $202
line 480
;476:  }
;477:
;478:  // modify the speed depending on the delta
;479:  // so it doesn't seem so linear
;480:  swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 481
;481:  scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 482
;482:  if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $204
line 483
;483:    scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 484
;484:  } else if ( scale < swingTolerance ) {
ADDRGP4 $205
JUMPV
LABELV $204
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $206
line 485
;485:    scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 486
;486:  } else {
ADDRGP4 $207
JUMPV
LABELV $206
line 487
;487:    scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 488
;488:  }
LABELV $207
LABELV $205
line 491
;489:
;490:  // swing towards the destination angle
;491:  if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $208
line 492
;492:    move = uiInfo.uiDC.frameTime * scale * speed;
ADDRLP4 8
ADDRGP4 uiInfo+212
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 493
;493:    if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $211
line 494
;494:      move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 495
;495:      *swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 496
;496:    }
LABELV $211
line 497
;497:    *angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 498
;498:  } else if ( swing < 0 ) {
ADDRGP4 $209
JUMPV
LABELV $208
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $213
line 499
;499:    move = uiInfo.uiDC.frameTime * scale * -speed;
ADDRLP4 8
ADDRGP4 uiInfo+212
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 500
;500:    if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $216
line 501
;501:      move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 502
;502:      *swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 503
;503:    }
LABELV $216
line 504
;504:    *angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 505
;505:  }
LABELV $213
LABELV $209
line 508
;506:
;507:  // clamp to no more than tolerance
;508:  swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 509
;509:  if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $218
line 510
;510:    *angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 511
;511:  } else if ( swing < -clampTolerance ) {
ADDRGP4 $219
JUMPV
LABELV $218
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $220
line 512
;512:    *angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 513
;513:  }
LABELV $220
LABELV $219
line 514
;514:}
LABELV $196
endproc UI_SwingAngles 28 8
proc UI_MovedirAdjustment 72 16
line 522
;515:
;516:
;517:/*
;518:======================
;519:UI_MovedirAdjustment
;520:======================
;521:*/
;522:static float UI_MovedirAdjustment( playerInfo_t *pi ) {
line 526
;523:  vec3_t    relativeAngles;
;524:  vec3_t    moveVector;
;525:
;526:  VectorSubtract( pi->viewAngles, pi->moveAngles, relativeAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
CNSTI4 1184
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1196
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRP4
CNSTI4 1188
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1200
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 28
INDIRP4
CNSTI4 1192
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1204
ADDP4
INDIRF4
SUBF4
ASGNF4
line 527
;527:  AngleVectors( relativeAngles, moveVector, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 528
;528:  if ( Q_fabs( moveVector[0] ) < 0.01 ) {
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1008981770
GEF4 $225
line 529
;529:    moveVector[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 530
;530:  }
LABELV $225
line 531
;531:  if ( Q_fabs( moveVector[1] ) < 0.01 ) {
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1008981770
GEF4 $227
line 532
;532:    moveVector[1] = 0.0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 533
;533:  }
LABELV $227
line 535
;534:
;535:  if ( moveVector[1] == 0 && moveVector[0] > 0 ) {
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRF4
NEF4 $231
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $231
line 536
;536:    return 0;
CNSTF4 0
RETF4
ADDRGP4 $222
JUMPV
LABELV $231
line 538
;537:  }
;538:  if ( moveVector[1] < 0 && moveVector[0] > 0 ) {
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $234
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
LEF4 $234
line 539
;539:    return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $222
JUMPV
LABELV $234
line 541
;540:  }
;541:  if ( moveVector[1] < 0 && moveVector[0] == 0 ) {
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRF4
GEF4 $237
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $237
line 542
;542:    return 45;
CNSTF4 1110704128
RETF4
ADDRGP4 $222
JUMPV
LABELV $237
line 544
;543:  }
;544:  if ( moveVector[1] < 0 && moveVector[0] < 0 ) {
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $240
ADDRLP4 0
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $240
line 545
;545:    return -22;
CNSTF4 3249537024
RETF4
ADDRGP4 $222
JUMPV
LABELV $240
line 547
;546:  }
;547:  if ( moveVector[1] == 0 && moveVector[0] < 0 ) {
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $243
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $243
line 548
;548:    return 0;
CNSTF4 0
RETF4
ADDRGP4 $222
JUMPV
LABELV $243
line 550
;549:  }
;550:  if ( moveVector[1] > 0 && moveVector[0] < 0 ) {
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
LEF4 $246
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRF4
GEF4 $246
line 551
;551:    return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $222
JUMPV
LABELV $246
line 553
;552:  }
;553:  if ( moveVector[1] > 0 && moveVector[0] == 0 ) {
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68
INDIRF4
LEF4 $249
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
NEF4 $249
line 554
;554:    return  -45;
CNSTF4 3258187776
RETF4
ADDRGP4 $222
JUMPV
LABELV $249
line 557
;555:  }
;556:
;557:  return -22;
CNSTF4 3249537024
RETF4
LABELV $222
endproc UI_MovedirAdjustment 72 16
proc UI_PlayerAngles 80 24
line 566
;558:}
;559:
;560:
;561:/*
;562:===============
;563:UI_PlayerAngles
;564:===============
;565:*/
;566:static void UI_PlayerAngles( playerInfo_t *pi, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 571
;567:  vec3_t    legsAngles, torsoAngles, headAngles;
;568:  float    dest;
;569:  float    adjust;
;570:
;571:  VectorCopy( pi->viewAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRB
ASGNB 12
line 572
;572:  headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 44
INDIRF4
ASGNF4
line 573
;573:  VectorClear( legsAngles );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 24+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
ASGNF4
line 574
;574:  VectorClear( torsoAngles );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 579
;575:
;576:  // --------- yaw -------------
;577:
;578:  // allow yaw to drift a bit
;579:  if ( ( pi->legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 -129
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 22
NEI4 $261
ADDRLP4 56
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 11
EQI4 $259
LABELV $261
line 580
;580:    || ( pi->torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 582
;581:    // if not standing still, always point all in the same direction
;582:    pi->torso.yawing = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 583
;583:    pi->torso.pitching = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 584
;584:    pi->legs.yawing = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 1
ASGNI4
line 585
;585:  }
LABELV $259
line 588
;586:
;587:  // adjust legs for movement dir
;588:  adjust = UI_MovedirAdjustment( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_MovedirAdjustment
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 589
;589:  legsAngles[YAW] = headAngles[YAW] + adjust;
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 590
;590:  torsoAngles[YAW] = headAngles[YAW] + 0.25 * adjust;
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 594
;591:
;592:
;593:  // torso
;594:  UI_SwingAngles( torsoAngles[YAW], 25, 90, SWINGSPEED, &pi->torso.yawAngle, &pi->torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 595
;595:  UI_SwingAngles( legsAngles[YAW], 40, 90, SWINGSPEED, &pi->legs.yawAngle, &pi->legs.yawing );
ADDRLP4 24+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 597
;596:
;597:  torsoAngles[YAW] = pi->torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 598
;598:  legsAngles[YAW] = pi->legs.yawAngle;
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 603
;599:
;600:  // --------- pitch -------------
;601:
;602:  // only show a fraction of the pitch angle in the torso
;603:  if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $270
line 604
;604:    dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 605
;605:  } else {
ADDRGP4 $271
JUMPV
LABELV $270
line 606
;606:    dest = headAngles[PITCH] * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 607
;607:  }
LABELV $271
line 608
;608:  UI_SwingAngles( dest, 15, 30, 0.1f, &pi->torso.pitchAngle, &pi->torso.pitching );
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 96
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 609
;609:  torsoAngles[PITCH] = pi->torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 612
;610:
;611:  // pull the angles back out of the hierarchial chain
;612:  AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 613
;613:  AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 614
;614:  AnglesToAxis( legsAngles, legs );
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 615
;615:  AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 616
;616:  AnglesToAxis( headAngles, head );
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 617
;617:}
LABELV $252
endproc UI_PlayerAngles 80 24
proc UI_PlayerFloatSprite 140 12
line 625
;618:
;619:
;620:/*
;621:===============
;622:UI_PlayerFloatSprite
;623:===============
;624:*/
;625:static void UI_PlayerFloatSprite( playerInfo_t *pi, vec3_t origin, qhandle_t shader ) {
line 628
;626:  refEntity_t    ent;
;627:
;628:  memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 629
;629:  VectorCopy( origin, ent.origin );
ADDRLP4 0+68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 630
;630:  ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 631
;631:  ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 632
;632:  ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 8
INDIRI4
ASGNI4
line 633
;633:  ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 634
;634:  ent.renderfx = 0;
ADDRLP4 0+4
CNSTI4 0
ASGNI4
line 635
;635:  trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 636
;636:}
LABELV $272
endproc UI_PlayerFloatSprite 140 12
export UI_MachinegunSpinAngle
proc UI_MachinegunSpinAngle 28 4
line 644
;637:
;638:
;639:/*
;640:======================
;641:UI_MachinegunSpinAngle
;642:======================
;643:*/
;644:float  UI_MachinegunSpinAngle( playerInfo_t *pi ) {
line 650
;645:  int    delta;
;646:  float  angle;
;647:  float  speed;
;648:  int    torsoAnim;
;649:
;650:  delta = dp_realtime - pi->barrelTime;
ADDRLP4 4
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1268
ADDP4
INDIRI4
SUBI4
ASGNI4
line 651
;651:  if ( pi->barrelSpinning ) {
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $280
line 652
;652:    angle = pi->barrelAngle + delta * SPIN_SPEED;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 653
;653:  } else {
ADDRGP4 $281
JUMPV
LABELV $280
line 654
;654:    if ( delta > COAST_TIME ) {
ADDRLP4 4
INDIRI4
CNSTI4 1000
LEI4 $282
line 655
;655:      delta = COAST_TIME;
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 656
;656:    }
LABELV $282
line 658
;657:
;658:    speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
ADDRLP4 12
CNSTF4 1056964608
CNSTI4 1000
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTF4 1063675494
ADDF4
MULF4
ASGNF4
line 659
;659:    angle = pi->barrelAngle + delta * speed;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 660
;660:  }
LABELV $281
line 662
;661:
;662:  torsoAnim = pi->torsoAnim  & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 663
;663:  if( torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $284
line 664
;664:    torsoAnim = TORSO_ATTACK;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 665
;665:  }
LABELV $284
line 666
;666:  if ( pi->barrelSpinning == !(torsoAnim == TORSO_ATTACK) ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $289
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $290
JUMPV
LABELV $289
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $290
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $286
line 667
;667:    pi->barrelTime = dp_realtime;
ADDRFP4 0
INDIRP4
CNSTI4 1268
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 668
;668:    pi->barrelAngle = AngleMod( angle );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 669
;669:    pi->barrelSpinning = !!(torsoAnim == TORSO_ATTACK);
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $292
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $293
JUMPV
LABELV $292
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $293
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 670
;670:  }
LABELV $286
line 672
;671:
;672:  return angle;
ADDRLP4 8
INDIRF4
RETF4
LABELV $279
endproc UI_MachinegunSpinAngle 28 4
lit
align 4
LABELV $295
byte 4 3246391296
byte 4 3246391296
byte 4 3250585600
align 4
LABELV $296
byte 4 1098907648
byte 4 1098907648
byte 4 1107296256
export UI_DrawPlayer
code
proc UI_DrawPlayer 1300 28
line 681
;673:}
;674:
;675:
;676:/*
;677:===============
;678:UI_DrawPlayer
;679:===============
;680:*/
;681:void UI_DrawPlayer( float x, float y, float w, float h, playerInfo_t *pi, int time ) {
line 691
;682:  refdef_t    refdef;
;683:  refEntity_t    legs;
;684:  refEntity_t    torso;
;685:  refEntity_t    head;
;686:  refEntity_t    gun;
;687:  refEntity_t    barrel;
;688:  refEntity_t    flash;
;689:  vec3_t      origin;
;690:  int        renderfx;
;691:  vec3_t      mins = {-16, -16, -24};
ADDRLP4 1084
ADDRGP4 $295
INDIRB
ASGNB 12
line 692
;692:  vec3_t      maxs = {16, 16, 32};
ADDRLP4 1096
ADDRGP4 $296
INDIRB
ASGNB 12
line 696
;693:  float      len;
;694:  float      xx;
;695:
;696:  if ( !pi->legsModel || !pi->torsoModel || !pi->headModel || !pi->animations[0].numFrames ) {
ADDRLP4 1256
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $301
ADDRLP4 1256
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $301
ADDRLP4 1256
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $301
ADDRLP4 1256
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
NEI4 $297
LABELV $301
line 697
;697:    return;
ADDRGP4 $294
JUMPV
LABELV $297
line 701
;698:  }
;699:
;700:  // this allows the ui to cache the player model on the main menu
;701:  if (w == 0 || h == 0) {
ADDRLP4 1264
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRF4
ADDRLP4 1264
INDIRF4
EQF4 $304
ADDRFP4 12
INDIRF4
ADDRLP4 1264
INDIRF4
NEF4 $302
LABELV $304
line 702
;702:    return;
ADDRGP4 $294
JUMPV
LABELV $302
line 705
;703:  }
;704:
;705:  dp_realtime = time;
ADDRGP4 dp_realtime
ADDRFP4 20
INDIRI4
ASGNI4
line 707
;706:
;707:  if ( pi->pendingWeapon != -1 && dp_realtime > pi->weaponTimer ) {
ADDRLP4 1268
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $305
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 1268
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
LEI4 $305
line 708
;708:    pi->weapon = pi->pendingWeapon;
ADDRLP4 1272
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 1272
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 709
;709:    pi->lastWeapon = pi->pendingWeapon;
ADDRLP4 1276
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CNSTI4 1224
ADDP4
ADDRLP4 1276
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 710
;710:    pi->pendingWeapon = -1;
ADDRFP4 16
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 711
;711:    pi->weaponTimer = 0;
ADDRFP4 16
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 712
;712:    if( pi->currentWeapon != pi->weapon ) {
ADDRLP4 1280
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ADDRLP4 1280
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
EQI4 $307
line 713
;713:      trap_S_StartLocalSound( weaponChangeSound, CHAN_LOCAL );
ADDRGP4 weaponChangeSound
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 714
;714:    }
LABELV $307
line 715
;715:  }
LABELV $305
line 717
;716:
;717:  UI_AdjustFrom640( &x, &y, &w, &h );
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
line 719
;718:
;719:  y -= jumpHeight;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRGP4 jumpHeight
INDIRF4
SUBF4
ASGNF4
line 721
;720:
;721:  memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 722
;722:  memset( &legs, 0, sizeof(legs) );
ADDRLP4 380
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 723
;723:  memset( &torso, 0, sizeof(torso) );
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 724
;724:  memset( &head, 0, sizeof(head) );
ADDRLP4 660
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 726
;725:
;726:  refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 728
;727:
;728:  AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 730
;729:
;730:  refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 731
;731:  refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 732
;732:  refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 733
;733:  refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 735
;734:
;735:  refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
ADDRLP4 0+16
CNSTF4 1119092736
ADDRLP4 0+8
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 736
;736:  xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 1272
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 1252
ADDRLP4 0+8
INDIRI4
CVIF4 4
ADDRLP4 1272
INDIRF4
DIVF4
ASGNF4
line 737
;737:  refdef.fov_y = atan2( refdef.height, xx );
ADDRLP4 0+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1252
INDIRF4
ARGF4
ADDRLP4 1276
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0+20
ADDRLP4 1276
INDIRF4
ASGNF4
line 738
;738:  refdef.fov_y *= ( 360 / (float)M_PI );
ADDRLP4 0+20
CNSTF4 1122316001
ADDRLP4 0+20
INDIRF4
MULF4
ASGNF4
line 741
;739:
;740:  // calculate distance so the player nearly fills the box
;741:  len = 0.7 * ( maxs[2] - mins[2] );
ADDRLP4 1248
CNSTF4 1060320051
ADDRLP4 1096+8
INDIRF4
ADDRLP4 1084+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 742
;742:  origin[0] = len / tan( DEG2RAD(refdef.fov_x) * 0.5 );
CNSTF4 1056964608
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 1280
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 1248
INDIRF4
ADDRLP4 1280
INDIRF4
DIVF4
ASGNF4
line 743
;743:  origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 368+4
CNSTF4 1056964608
ADDRLP4 1084+4
INDIRF4
ADDRLP4 1096+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 744
;744:  origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 368+8
CNSTF4 3204448256
ADDRLP4 1084+8
INDIRF4
ADDRLP4 1096+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 746
;745:
;746:  refdef.time = dp_realtime;
ADDRLP4 0+72
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 748
;747:
;748:  trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 751
;749:
;750:  // get the rotation information
;751:  UI_PlayerAngles( pi, legs.axis, torso.axis, head.axis );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+28
ARGP4
ADDRLP4 520+28
ARGP4
ADDRLP4 660+28
ARGP4
ADDRGP4 UI_PlayerAngles
CALLV
pop
line 754
;752:
;753:  // get the animation state (after rotation, to allow feet shuffle)
;754:  UI_PlayerAnimation( pi, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+96
ARGP4
ADDRLP4 380+80
ARGP4
ADDRLP4 380+100
ARGP4
ADDRLP4 520+96
ARGP4
ADDRLP4 520+80
ARGP4
ADDRLP4 520+100
ARGP4
ADDRGP4 UI_PlayerAnimation
CALLV
pop
line 757
;755:     &torso.oldframe, &torso.frame, &torso.backlerp );
;756:
;757:  renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 800
CNSTI4 192
ASGNI4
line 762
;758:
;759:  //
;760:  // add the legs
;761:  //
;762:  legs.hModel = pi->legsModel;
ADDRLP4 380+8
ADDRFP4 16
INDIRP4
INDIRI4
ASGNI4
line 763
;763:  legs.customSkin = pi->legsSkin;
ADDRLP4 380+108
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 765
;764:
;765:  VectorCopy( origin, legs.origin );
ADDRLP4 380+68
ADDRLP4 368
INDIRB
ASGNB 12
line 767
;766:
;767:  VectorCopy( origin, legs.lightingOrigin );
ADDRLP4 380+12
ADDRLP4 368
INDIRB
ASGNB 12
line 768
;768:  legs.renderfx = renderfx;
ADDRLP4 380+4
ADDRLP4 800
INDIRI4
ASGNI4
line 769
;769:  VectorCopy (legs.origin, legs.oldorigin);
ADDRLP4 380+84
ADDRLP4 380+68
INDIRB
ASGNB 12
line 771
;770:
;771:  trap_R_AddRefEntityToScene( &legs );
ADDRLP4 380
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 773
;772:
;773:  if (!legs.hModel) {
ADDRLP4 380+8
INDIRI4
CNSTI4 0
NEI4 $347
line 774
;774:    return;
ADDRGP4 $294
JUMPV
LABELV $347
line 780
;775:  }
;776:
;777:  //
;778:  // add the torso
;779:  //
;780:  torso.hModel = pi->torsoModel;
ADDRLP4 520+8
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 781
;781:  if (!torso.hModel) {
ADDRLP4 520+8
INDIRI4
CNSTI4 0
NEI4 $351
line 782
;782:    return;
ADDRGP4 $294
JUMPV
LABELV $351
line 785
;783:  }
;784:
;785:  torso.customSkin = pi->torsoSkin;
ADDRLP4 520+108
ADDRFP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
line 787
;786:
;787:  VectorCopy( origin, torso.lightingOrigin );
ADDRLP4 520+12
ADDRLP4 368
INDIRB
ASGNB 12
line 789
;788:
;789:  UI_PositionRotatedEntityOnTag( &torso, &legs, pi->legsModel, "tag_torso");
ADDRLP4 520
ARGP4
ADDRLP4 380
ARGP4
ADDRFP4 16
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $356
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 791
;790:
;791:  torso.renderfx = renderfx;
ADDRLP4 520+4
ADDRLP4 800
INDIRI4
ASGNI4
line 793
;792:
;793:  trap_R_AddRefEntityToScene( &torso );
ADDRLP4 520
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 798
;794:
;795:  //
;796:  // add the head
;797:  //
;798:  head.hModel = pi->headModel;
ADDRLP4 660+8
ADDRFP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 799
;799:  if (!head.hModel) {
ADDRLP4 660+8
INDIRI4
CNSTI4 0
NEI4 $359
line 800
;800:    return;
ADDRGP4 $294
JUMPV
LABELV $359
line 802
;801:  }
;802:  head.customSkin = pi->headSkin;
ADDRLP4 660+108
ADDRFP4 16
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 804
;803:
;804:  VectorCopy( origin, head.lightingOrigin );
ADDRLP4 660+12
ADDRLP4 368
INDIRB
ASGNB 12
line 806
;805:
;806:  UI_PositionRotatedEntityOnTag( &head, &torso, pi->torsoModel, "tag_head");
ADDRLP4 660
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $364
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 808
;807:
;808:  head.renderfx = renderfx;
ADDRLP4 660+4
ADDRLP4 800
INDIRI4
ASGNI4
line 810
;809:
;810:  trap_R_AddRefEntityToScene( &head );
ADDRLP4 660
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 815
;811:
;812:  //
;813:  // add the gun
;814:  //
;815:  if ( pi->currentWeapon != WP_NONE ) {
ADDRFP4 16
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 816
;816:    memset( &gun, 0, sizeof(gun) );
ADDRLP4 804
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 817
;817:    gun.hModel = pi->weaponModel;
ADDRLP4 804+8
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 818
;818:    VectorCopy( origin, gun.lightingOrigin );
ADDRLP4 804+12
ADDRLP4 368
INDIRB
ASGNB 12
line 819
;819:    UI_PositionEntityOnTag( &gun, &torso, pi->torsoModel, "tag_weapon");
ADDRLP4 804
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $370
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 820
;820:    gun.renderfx = renderfx;
ADDRLP4 804+4
ADDRLP4 800
INDIRI4
ASGNI4
line 821
;821:    trap_R_AddRefEntityToScene( &gun );
ADDRLP4 804
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 822
;822:  }
LABELV $366
line 827
;823:
;824:  //
;825:  // add the spinning barrel
;826:  //
;827:  if ( pi->realWeapon == WP_MACHINEGUN ) {
ADDRFP4 16
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
CNSTI4 3
NEI4 $372
line 830
;828:    vec3_t  angles;
;829:
;830:    memset( &barrel, 0, sizeof(barrel) );
ADDRLP4 944
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 831
;831:    VectorCopy( origin, barrel.lightingOrigin );
ADDRLP4 944+12
ADDRLP4 368
INDIRB
ASGNB 12
line 832
;832:    barrel.renderfx = renderfx;
ADDRLP4 944+4
ADDRLP4 800
INDIRI4
ASGNI4
line 834
;833:
;834:    barrel.hModel = pi->barrelModel;
ADDRLP4 944+8
ADDRFP4 16
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 835
;835:    angles[YAW] = 0;
ADDRLP4 1284+4
CNSTF4 0
ASGNF4
line 836
;836:    angles[PITCH] = 0;
ADDRLP4 1284
CNSTF4 0
ASGNF4
line 837
;837:    angles[ROLL] = UI_MachinegunSpinAngle( pi );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 UI_MachinegunSpinAngle
CALLF4
ASGNF4
ADDRLP4 1284+8
ADDRLP4 1296
INDIRF4
ASGNF4
line 842
;838:/*    if( pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
;839:      angles[PITCH] = angles[ROLL];
;840:      angles[ROLL] = 0;
;841:    }*/
;842:    AnglesToAxis( angles, barrel.axis );
ADDRLP4 1284
ARGP4
ADDRLP4 944+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 844
;843:
;844:    UI_PositionRotatedEntityOnTag( &barrel, &gun, pi->weaponModel, "tag_barrel");
ADDRLP4 944
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ARGI4
ADDRGP4 $380
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 846
;845:
;846:    trap_R_AddRefEntityToScene( &barrel );
ADDRLP4 944
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 847
;847:  }
LABELV $372
line 852
;848:
;849:  //
;850:  // add muzzle flash
;851:  //
;852:  if ( dp_realtime <= pi->muzzleFlashTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 16
INDIRP4
CNSTI4 1180
ADDP4
INDIRI4
GTI4 $381
line 853
;853:    if ( pi->flashModel ) {
ADDRFP4 16
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $383
line 854
;854:      memset( &flash, 0, sizeof(flash) );
ADDRLP4 1108
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 855
;855:      flash.hModel = pi->flashModel;
ADDRLP4 1108+8
ADDRFP4 16
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 856
;856:      VectorCopy( origin, flash.lightingOrigin );
ADDRLP4 1108+12
ADDRLP4 368
INDIRB
ASGNB 12
line 857
;857:      UI_PositionEntityOnTag( &flash, &gun, pi->weaponModel, "tag_flash");
ADDRLP4 1108
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ARGI4
ADDRGP4 $387
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 858
;858:      flash.renderfx = renderfx;
ADDRLP4 1108+4
ADDRLP4 800
INDIRI4
ASGNI4
line 859
;859:      trap_R_AddRefEntityToScene( &flash );
ADDRLP4 1108
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 860
;860:    }
LABELV $383
line 863
;861:
;862:    // make a dlight for the flash
;863:    if ( pi->flashDlightColor[0] || pi->flashDlightColor[1] || pi->flashDlightColor[2] ) {
ADDRLP4 1284
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1288
CNSTF4 0
ASGNF4
ADDRLP4 1284
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
NEF4 $392
ADDRLP4 1284
INDIRP4
CNSTI4 1172
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
NEF4 $392
ADDRLP4 1284
INDIRP4
CNSTI4 1176
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
EQF4 $389
LABELV $392
line 864
;864:      trap_R_AddLightToScene( flash.origin, 200 + (rand()&31), pi->flashDlightColor[0],
ADDRLP4 1292
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1108+68
ARGP4
ADDRLP4 1292
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 1296
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1296
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
ARGF4
ADDRLP4 1296
INDIRP4
CNSTI4 1172
ADDP4
INDIRF4
ARGF4
ADDRLP4 1296
INDIRP4
CNSTI4 1176
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 866
;865:        pi->flashDlightColor[1], pi->flashDlightColor[2] );
;866:    }
LABELV $389
line 867
;867:  }
LABELV $381
line 872
;868:
;869:  //
;870:  // add the chat icon
;871:  //
;872:  if ( pi->chat ) {
ADDRFP4 16
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 873
;873:    UI_PlayerFloatSprite( pi, origin, trap_R_RegisterShaderNoMip( "sprites/balloon3" ) );
ADDRGP4 $396
ARGP4
ADDRLP4 1284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 368
ARGP4
ADDRLP4 1284
INDIRI4
ARGI4
ADDRGP4 UI_PlayerFloatSprite
CALLV
pop
line 874
;874:  }
LABELV $394
line 879
;875:
;876:  //
;877:  // add an accent light
;878:  //
;879:  origin[0] -= 100;  // + = behind, - = in front
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 880
;880:  origin[1] += 100;  // + = left, - = right
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 881
;881:  origin[2] += 100;  // + = above, - = below
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 882
;882:  trap_R_AddLightToScene( origin, 500, 1.0, 1.0, 1.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
ADDRLP4 1284
CNSTF4 1065353216
ASGNF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 884
;883:
;884:  origin[0] -= 100;
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 885
;885:  origin[1] -= 100;
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 886
;886:  origin[2] -= 100;
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 887
;887:  trap_R_AddLightToScene( origin, 500, 1.0, 0.0, 0.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1288
CNSTF4 0
ASGNF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 889
;888:
;889:  trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 890
;890:}
LABELV $294
endproc UI_DrawPlayer 1300 28
proc UI_FileExists 8 12
line 897
;891:
;892:/*
;893:==========================
;894:UI_FileExists
;895:==========================
;896:*/
;897:static qboolean  UI_FileExists(const char *filename) {
line 900
;898:  int len;
;899:
;900:  len = trap_FS_FOpenFile( filename, NULL, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 901
;901:  if (len>0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $402
line 902
;902:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $401
JUMPV
LABELV $402
line 904
;903:  }
;904:  return qfalse;
CNSTI4 0
RETI4
LABELV $401
endproc UI_FileExists 8 12
proc UI_FindClientHeadFile 40 40
line 912
;905:}
;906:
;907:/*
;908:==========================
;909:UI_FindClientHeadFile
;910:==========================
;911:*/
;912:static qboolean  UI_FindClientHeadFile( char *filename, int length, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 916
;913:  char *team, *headsFolder;
;914:  int i;
;915:
;916:  team = "default";
ADDRLP4 8
ADDRGP4 $405
ASGNP4
line 918
;917:
;918:  if ( headModelName[0] == '*' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $406
line 919
;919:    headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $408
ASGNP4
line 920
;920:    headModelName++;
ADDRFP4 12
ADDRFP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 921
;921:  }
ADDRGP4 $411
JUMPV
LABELV $406
line 922
;922:  else {
line 923
;923:    headsFolder = "";
ADDRLP4 4
ADDRGP4 $409
ASGNP4
line 924
;924:  }
ADDRGP4 $411
JUMPV
LABELV $410
line 925
;925:  while(1) {
line 926
;926:    for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $413
line 927
;927:      if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $417
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $417
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $417
line 928
;928:        Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $419
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 929
;929:      }
ADDRGP4 $418
JUMPV
LABELV $417
line 930
;930:      else {
line 931
;931:        Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $420
ARGP4
ADDRLP4 4
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
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 932
;932:      }
LABELV $418
line 933
;933:      if ( UI_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_FileExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $421
line 934
;934:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $404
JUMPV
LABELV $421
line 936
;935:      }
;936:      if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $423
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $423
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $423
line 937
;937:        Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $425
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 938
;938:      }
ADDRGP4 $424
JUMPV
LABELV $423
line 939
;939:      else {
line 940
;940:        Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $426
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 941
;941:      }
LABELV $424
line 942
;942:      if ( UI_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 UI_FileExists
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $427
line 943
;943:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $404
JUMPV
LABELV $427
line 945
;944:      }
;945:      if ( !teamName || !*teamName ) {
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $431
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $429
LABELV $431
line 946
;946:        break;
ADDRGP4 $415
JUMPV
LABELV $429
line 948
;947:      }
;948:    }
LABELV $414
line 926
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $413
LABELV $415
line 950
;949:    // if tried the heads folder first
;950:    if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $432
line 951
;951:      break;
ADDRGP4 $412
JUMPV
LABELV $432
line 953
;952:    }
;953:    headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $408
ASGNP4
line 954
;954:  }
LABELV $411
line 925
ADDRGP4 $410
JUMPV
LABELV $412
line 956
;955:
;956:  return qfalse;
CNSTI4 0
RETI4
LABELV $404
endproc UI_FindClientHeadFile 40 40
proc UI_RegisterClientSkin 156 28
line 964
;957:}
;958:
;959:/*
;960:==========================
;961:UI_RegisterClientSkin
;962:==========================
;963:*/
;964:static qboolean  UI_RegisterClientSkin( playerInfo_t *pi, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName , const char *teamName) {
line 967
;965:  char    filename[MAX_QPATH*2];
;966:
;967:  if (teamName && *teamName) {
ADDRLP4 128
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $435
line 968
;968:    Com_sprintf( filename, sizeof( filename ), "models/players/%s/%s/lower_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $437
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 969
;969:  } else {
ADDRGP4 $436
JUMPV
LABELV $435
line 970
;970:    Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $438
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
line 971
;971:  }
LABELV $436
line 972
;972:  pi->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 973
;973:  if (!pi->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $439
line 974
;974:    if (teamName && *teamName) {
ADDRLP4 136
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $441
ADDRLP4 136
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $441
line 975
;975:      Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%s/lower_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $443
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 976
;976:    } else {
ADDRGP4 $442
JUMPV
LABELV $441
line 977
;977:      Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $444
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
line 978
;978:    }
LABELV $442
line 979
;979:    pi->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 980
;980:  }
LABELV $439
line 982
;981:
;982:  if (teamName && *teamName) {
ADDRLP4 136
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 136
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $445
line 983
;983:    Com_sprintf( filename, sizeof( filename ), "models/players/%s/%s/upper_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $447
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 984
;984:  } else {
ADDRGP4 $446
JUMPV
LABELV $445
line 985
;985:    Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $448
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
line 986
;986:  }
LABELV $446
line 987
;987:  pi->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 988
;988:  if (!pi->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $449
line 989
;989:    if (teamName && *teamName) {
ADDRLP4 144
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $451
ADDRLP4 144
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $451
line 990
;990:      Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%s/upper_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $453
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 991
;991:    } else {
ADDRGP4 $452
JUMPV
LABELV $451
line 992
;992:      Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $454
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
line 993
;993:    }
LABELV $452
line 994
;994:    pi->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 995
;995:  }
LABELV $449
line 997
;996:
;997:  if ( UI_FindClientHeadFile( filename, sizeof(filename), teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 $458
ARGP4
ADDRLP4 144
ADDRGP4 UI_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $455
line 998
;998:    pi->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 999
;999:  }
LABELV $455
line 1001
;1000:
;1001:  if ( !pi->legsSkin || !pi->torsoSkin || !pi->headSkin ) {
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $462
ADDRLP4 148
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $462
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
NEI4 $459
LABELV $462
line 1002
;1002:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $459
line 1005
;1003:  }
;1004:
;1005:  return qtrue;
CNSTI4 1
RETI4
LABELV $434
endproc UI_RegisterClientSkin 156 28
proc UI_ParseAnimationFile 20068 12
line 1014
;1006:}
;1007:
;1008:
;1009:/*
;1010:======================
;1011:UI_ParseAnimationFile
;1012:======================
;1013:*/
;1014:static qboolean UI_ParseAnimationFile( const char *filename, animation_t *animations ) {
line 1024
;1015:  char    *text_p, *prev;
;1016:  int      len;
;1017:  int      i;
;1018:  char    *token;
;1019:  float    fps;
;1020:  int      skip;
;1021:  char    text[20000];
;1022:  fileHandle_t  f;
;1023:
;1024:  memset( animations, 0, sizeof( animation_t ) * MAX_PLAYER_ANIMATIONS );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 868
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1027
;1025:
;1026:  // load the file
;1027:  len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20028
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20032
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 20032
INDIRI4
ASGNI4
line 1028
;1028:  if ( len <= 0 ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
GTI4 $464
line 1029
;1029:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $463
JUMPV
LABELV $464
line 1031
;1030:  }
;1031:  if ( len >= ( sizeof( text ) - 1 ) ) {
ADDRLP4 24
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $466
line 1032
;1032:    Com_Printf( "File %s too long\n", filename );
ADDRGP4 $468
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1033
;1033:    trap_FS_FCloseFile( f );
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1034
;1034:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $463
JUMPV
LABELV $466
line 1036
;1035:  }
;1036:  trap_FS_Read( text, len, f );
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1037
;1037:  text[len] = 0;
ADDRLP4 24
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 1038
;1038:  trap_FS_FCloseFile( f );
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1040
;1039:
;1040:  COM_Compress(text);
ADDRLP4 28
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 1043
;1041:
;1042:  // parse the text
;1043:  text_p = text;
ADDRLP4 8
ADDRLP4 28
ASGNP4
line 1044
;1044:  skip = 0;  // quite the compiler warning
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $469
line 1047
;1045:
;1046:  // read optional parameters
;1047:  while ( 1 ) {
line 1048
;1048:    prev = text_p;  // so we can unget
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
line 1049
;1049:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 1050
;1050:    if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $472
line 1051
;1051:      break;
ADDRGP4 $471
JUMPV
LABELV $472
line 1053
;1052:    }
;1053:    if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 20040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20040
INDIRI4
CNSTI4 0
NEI4 $474
line 1054
;1054:      token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 1055
;1055:      if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $470
line 1056
;1056:        break;
ADDRGP4 $471
JUMPV
line 1058
;1057:      }
;1058:      continue;
LABELV $474
line 1059
;1059:    } else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $479
line 1060
;1060:      for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $482
line 1061
;1061:        token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 1062
;1062:        if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $486
line 1063
;1063:          break;
ADDRGP4 $470
JUMPV
LABELV $486
line 1065
;1064:        }
;1065:      }
LABELV $483
line 1060
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $482
line 1066
;1066:      continue;
ADDRGP4 $470
JUMPV
LABELV $479
line 1067
;1067:    } else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $490
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $488
line 1068
;1068:      token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 1069
;1069:      if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $470
line 1070
;1070:        break;
ADDRGP4 $471
JUMPV
line 1072
;1071:      }
;1072:      continue;
LABELV $488
line 1076
;1073:    }
;1074:
;1075:    // if it is a number, start parsing animations
;1076:    if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20052
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 48
LTI4 $493
ADDRLP4 20052
INDIRI4
CNSTI4 57
GTI4 $493
line 1077
;1077:      text_p = prev;  // unget the token
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1078
;1078:      break;
ADDRGP4 $471
JUMPV
LABELV $493
line 1081
;1079:    }
;1080:
;1081:    Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $495
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1082
;1082:  }
LABELV $470
line 1047
ADDRGP4 $469
JUMPV
LABELV $471
line 1085
;1083:
;1084:  // read information for each frame
;1085:  for ( i = 0 ; i < MAX_PLAYER_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $496
line 1087
;1086:
;1087:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 1088
;1088:    if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $500
line 1089
;1089:      break;
ADDRGP4 $498
JUMPV
LABELV $500
line 1091
;1090:    }
;1091:    animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20040
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 20040
INDIRI4
ASGNI4
line 1093
;1092:    // leg only frames are adjusted to not count the upper body only frames
;1093:    if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $502
line 1094
;1094:      skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 20044
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20044
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 20044
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1095
;1095:    }
LABELV $502
line 1096
;1096:    if ( i >= LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $504
line 1097
;1097:      animations[i].firstFrame -= skip;
ADDRLP4 20044
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20044
INDIRP4
ADDRLP4 20044
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1098
;1098:    }
LABELV $504
line 1100
;1099:
;1100:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 1101
;1101:    if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $506
line 1102
;1102:      break;
ADDRGP4 $498
JUMPV
LABELV $506
line 1104
;1103:    }
;1104:    animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20048
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20048
INDIRI4
ASGNI4
line 1106
;1105:
;1106:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 1107
;1107:    if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $508
line 1108
;1108:      break;
ADDRGP4 $498
JUMPV
LABELV $508
line 1110
;1109:    }
;1110:    animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 1112
;1111:
;1112:    token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 1113
;1113:    if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $510
line 1114
;1114:      break;
ADDRGP4 $498
JUMPV
LABELV $510
line 1116
;1115:    }
;1116:    fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20064
INDIRF4
ASGNF4
line 1117
;1117:    if ( fps == 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $512
line 1118
;1118:      fps = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1119
;1119:    }
LABELV $512
line 1120
;1120:    animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1121
;1121:    animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1122
;1122:  }
LABELV $497
line 1085
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $496
LABELV $498
line 1124
;1123:
;1124:  if ( i != MAX_PLAYER_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $514
line 1125
;1125:    Com_Printf( "Error parsing animation file: %s", filename );
ADDRGP4 $516
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1126
;1126:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $463
JUMPV
LABELV $514
line 1129
;1127:  }
;1128:
;1129:  return qtrue;
CNSTI4 1
RETI4
LABELV $463
endproc UI_ParseAnimationFile 20068 12
export UI_RegisterClientModelname
proc UI_RegisterClientModelname 356 24
line 1137
;1130:}
;1131:
;1132:/*
;1133:==========================
;1134:UI_RegisterClientModelname
;1135:==========================
;1136:*/
;1137:qboolean UI_RegisterClientModelname( playerInfo_t *pi, const char *modelSkinName, const char *headModelSkinName, const char *teamName ) {
line 1145
;1138:  char    modelName[MAX_QPATH];
;1139:  char    skinName[MAX_QPATH];
;1140:  char    headModelName[MAX_QPATH];
;1141:  char    headSkinName[MAX_QPATH];
;1142:  char    filename[MAX_QPATH];
;1143:  char    *slash;
;1144:
;1145:  pi->torsoModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 0
ASGNI4
line 1146
;1146:  pi->headModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTI4 0
ASGNI4
line 1148
;1147:
;1148:  if ( !modelSkinName[0] ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
line 1149
;1149:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $518
line 1152
;1150:  }
;1151:
;1152:  Q_strncpyz( modelName, modelSkinName, sizeof( modelName ) );
ADDRLP4 64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1154
;1153:
;1154:  slash = strchr( modelName, '/' );
ADDRLP4 64
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 324
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 324
INDIRP4
ASGNP4
line 1155
;1155:  if ( !slash ) {
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 1157
;1156:    // modelName did not include a skin name
;1157:    Q_strncpyz( skinName, "default", sizeof( skinName ) );
ADDRLP4 196
ARGP4
ADDRGP4 $405
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1158
;1158:  } else {
ADDRGP4 $521
JUMPV
LABELV $520
line 1159
;1159:    Q_strncpyz( skinName, slash + 1, sizeof( skinName ) );
ADDRLP4 196
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1160
;1160:    *slash = '\0';
ADDRLP4 192
INDIRP4
CNSTI1 0
ASGNI1
line 1161
;1161:  }
LABELV $521
line 1163
;1162:
;1163:  Q_strncpyz( headModelName, headModelSkinName, sizeof( headModelName ) );
ADDRLP4 128
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1164
;1164:  slash = strchr( headModelName, '/' );
ADDRLP4 128
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 328
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 328
INDIRP4
ASGNP4
line 1165
;1165:  if ( !slash ) {
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $522
line 1167
;1166:    // modelName did not include a skin name
;1167:    Q_strncpyz( headSkinName, "default", sizeof( skinName ) );
ADDRLP4 260
ARGP4
ADDRGP4 $405
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1168
;1168:  } else {
ADDRGP4 $523
JUMPV
LABELV $522
line 1169
;1169:    Q_strncpyz( headSkinName, slash + 1, sizeof( skinName ) );
ADDRLP4 260
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1170
;1170:    *slash = '\0';
ADDRLP4 192
INDIRP4
CNSTI1 0
ASGNI1
line 1171
;1171:  }
LABELV $523
line 1175
;1172:
;1173:  // load cmodels before models so filecache works
;1174:
;1175:  Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $524
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1176
;1176:  pi->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1177
;1177:  if ( !pi->legsModel ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $525
line 1178
;1178:    Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $527
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1179
;1179:    pi->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1180
;1180:    if ( !pi->legsModel ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $528
line 1181
;1181:      Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $530
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1182
;1182:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $528
line 1184
;1183:    }
;1184:  }
LABELV $525
line 1186
;1185:
;1186:  Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $531
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1187
;1187:  pi->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1188
;1188:  if ( !pi->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
NEI4 $532
line 1189
;1189:    Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $534
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1190
;1190:    pi->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1191
;1191:    if ( !pi->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
NEI4 $535
line 1192
;1192:      Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $530
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1193
;1193:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $535
line 1195
;1194:    }
;1195:  }
LABELV $532
line 1197
;1196:
;1197:  if (headModelName[0] == '*' ) {
ADDRLP4 128
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $537
line 1198
;1198:    Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $539
ARGP4
ADDRLP4 128+1
ARGP4
ADDRLP4 128+1
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1199
;1199:  }
ADDRGP4 $538
JUMPV
LABELV $537
line 1200
;1200:  else {
line 1201
;1201:    Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $542
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1202
;1202:  }
LABELV $538
line 1203
;1203:  pi->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1204
;1204:  if ( !pi->headModel && headModelName[0] != '*') {
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $543
ADDRLP4 128
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $543
line 1205
;1205:    Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $539
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1206
;1206:    pi->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 1207
;1207:  }
LABELV $543
line 1209
;1208:
;1209:  if (!pi->headModel) {
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $545
line 1210
;1210:    Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $530
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1211
;1211:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $545
line 1215
;1212:  }
;1213:
;1214:  // if any skins failed to load, fall back to default
;1215:  if ( !UI_RegisterClientSkin( pi, modelName, skinName, headModelName, headSkinName, teamName) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 260
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $547
line 1216
;1216:    if ( !UI_RegisterClientSkin( pi, modelName, "default", headModelName, "default", teamName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 348
ADDRGP4 $405
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
NEI4 $549
line 1217
;1217:      Com_Printf( "Failed to load skin file: %s : %s\n", modelName, skinName );
ADDRGP4 $551
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 196
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1218
;1218:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $549
line 1220
;1219:    }
;1220:  }
LABELV $547
line 1223
;1221:
;1222:  // load the animations
;1223:  Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $552
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1224
;1224:  if ( !UI_ParseAnimationFile( filename, pi->animations ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 348
ADDRGP4 UI_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $553
line 1225
;1225:    Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $555
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1226
;1226:    if ( !UI_ParseAnimationFile( filename, pi->animations ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 UI_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
NEI4 $556
line 1227
;1227:      Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $558
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1228
;1228:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $556
line 1230
;1229:    }
;1230:  }
LABELV $553
line 1232
;1231:
;1232:  return qtrue;
CNSTI4 1
RETI4
LABELV $517
endproc UI_RegisterClientModelname 356 24
export UI_PlayerInfo_SetModel
proc UI_PlayerInfo_SetModel 12 16
line 1241
;1233:}
;1234:
;1235:
;1236:/*
;1237:===============
;1238:UI_PlayerInfo_SetModel
;1239:===============
;1240:*/
;1241:void UI_PlayerInfo_SetModel( playerInfo_t *pi, const char *model, const char *headmodel, char *teamName ) {
line 1242
;1242:  memset( pi, 0, sizeof(*pi) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1243
;1243:  UI_RegisterClientModelname( pi, model, headmodel, teamName );
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
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1244
;1244:  pi->weapon = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
CNSTI4 3
ASGNI4
line 1245
;1245:  pi->currentWeapon = pi->weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ASGNI4
line 1246
;1246:  pi->lastWeapon = pi->weapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1224
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ASGNI4
line 1247
;1247:  pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1248
;1248:  pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1249
;1249:  pi->chat = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 1250
;1250:  pi->newModel = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 1251
;1251:  UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1252
;1252:}
LABELV $559
endproc UI_PlayerInfo_SetModel 12 16
export UI_PlayerInfo_SetInfo
proc UI_PlayerInfo_SetInfo 36 8
line 1260
;1253:
;1254:
;1255:/*
;1256:===============
;1257:UI_PlayerInfo_SetInfo
;1258:===============
;1259:*/
;1260:void UI_PlayerInfo_SetInfo( playerInfo_t *pi, int legsAnim, int torsoAnim, vec3_t viewAngles, vec3_t moveAngles, weapon_t weaponNumber, qboolean chat ) {
line 1264
;1261:  int      currentAnim;
;1262:  weapon_t  weaponNum;
;1263:
;1264:  pi->chat = chat;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 1267
;1265:
;1266:  // view angles
;1267:  VectorCopy( viewAngles, pi->viewAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1270
;1268:
;1269:  // move angles
;1270:  VectorCopy( moveAngles, pi->moveAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1196
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 1272
;1271:
;1272:  if ( pi->newModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $561
line 1273
;1273:    pi->newModel = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 0
ASGNI4
line 1275
;1274:
;1275:    jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1276
;1276:    pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1277
;1277:    UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1278
;1278:    pi->legs.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1279
;1279:    pi->legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 1281
;1280:
;1281:    pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1282
;1282:    UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1283
;1283:    pi->torso.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1284
;1284:    pi->torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1286
;1285:
;1286:    if ( weaponNumber != -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
EQI4 $560
line 1287
;1287:      pi->weapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1288
;1288:      pi->currentWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1289
;1289:      pi->lastWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1290
;1290:      pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1291
;1291:      pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1292
;1292:      UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1293
;1293:    }
line 1295
;1294:
;1295:    return;
ADDRGP4 $560
JUMPV
LABELV $561
line 1299
;1296:  }
;1297:
;1298:  // weapon
;1299:  if ( weaponNumber == -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
NEI4 $565
line 1300
;1300:    pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1301
;1301:    pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1302
;1302:  }
ADDRGP4 $566
JUMPV
LABELV $565
line 1303
;1303:  else if ( weaponNumber != WP_NONE ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $567
line 1304
;1304:    pi->pendingWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1305
;1305:    pi->weaponTimer = dp_realtime + UI_TIMER_WEAPON_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1306
;1306:  }
LABELV $567
LABELV $566
line 1307
;1307:  weaponNum = pi->lastWeapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRI4
ASGNI4
line 1308
;1308:  pi->weapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1310
;1309:
;1310:  if ( torsoAnim == BOTH_DEATH1 || legsAnim == BOTH_DEATH1 ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $571
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $569
LABELV $571
line 1311
;1311:    torsoAnim = legsAnim = BOTH_DEATH1;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1312
;1312:    pi->weapon = pi->currentWeapon = WP_NONE;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1208
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1313
;1313:    UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1315
;1314:
;1315:    jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1316
;1316:    pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1317
;1317:    UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1319
;1318:
;1319:    pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1320
;1320:    UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1322
;1321:
;1322:    return;
ADDRGP4 $560
JUMPV
LABELV $569
line 1326
;1323:  }
;1324:
;1325:  // leg animation
;1326:  currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1327
;1327:  if ( legsAnim != LEGS_JUMP && ( currentAnim == LEGS_JUMP || currentAnim == LEGS_LAND ) ) {
ADDRLP4 12
CNSTI4 18
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $572
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $574
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $572
LABELV $574
line 1328
;1328:    pi->pendingLegsAnim = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1329
;1329:  }
ADDRGP4 $573
JUMPV
LABELV $572
line 1330
;1330:  else if ( legsAnim != currentAnim ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $575
line 1331
;1331:    jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1332
;1332:    pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1333
;1333:    UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1334
;1334:  }
LABELV $575
LABELV $573
line 1337
;1335:
;1336:  // torso animation
;1337:  if ( torsoAnim == TORSO_STAND || torsoAnim == TORSO_STAND2 ) {
ADDRLP4 20
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 11
EQI4 $579
ADDRLP4 20
INDIRI4
CNSTI4 12
NEI4 $577
LABELV $579
line 1338
;1338:    if ( weaponNum == WP_NONE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $580
line 1339
;1339:      torsoAnim = TORSO_STAND2;
ADDRFP4 8
CNSTI4 12
ASGNI4
line 1340
;1340:    }
ADDRGP4 $581
JUMPV
LABELV $580
line 1341
;1341:    else {
line 1342
;1342:      torsoAnim = TORSO_STAND;
ADDRFP4 8
CNSTI4 11
ASGNI4
line 1343
;1343:    }
LABELV $581
line 1344
;1344:  }
LABELV $577
line 1346
;1345:
;1346:  if ( torsoAnim == TORSO_ATTACK || torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 7
EQI4 $584
ADDRLP4 24
INDIRI4
CNSTI4 8
NEI4 $582
LABELV $584
line 1347
;1347:    if ( weaponNum == WP_NONE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $585
line 1348
;1348:      torsoAnim = TORSO_ATTACK2;
ADDRFP4 8
CNSTI4 8
ASGNI4
line 1349
;1349:    }
ADDRGP4 $586
JUMPV
LABELV $585
line 1350
;1350:    else {
line 1351
;1351:      torsoAnim = TORSO_ATTACK;
ADDRFP4 8
CNSTI4 7
ASGNI4
line 1352
;1352:    }
LABELV $586
line 1353
;1353:    pi->muzzleFlashTime = dp_realtime + UI_TIMER_MUZZLE_FLASH;
ADDRFP4 0
INDIRP4
CNSTI4 1180
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1355
;1354:    //FIXME play firing sound here
;1355:  }
LABELV $582
line 1357
;1356:
;1357:  currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1359
;1358:
;1359:  if ( weaponNum != pi->currentWeapon || currentAnim == TORSO_RAISE || currentAnim == TORSO_DROP ) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
NEI4 $590
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $590
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $587
LABELV $590
line 1360
;1360:    pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1361
;1361:  }
ADDRGP4 $588
JUMPV
LABELV $587
line 1362
;1362:  else if ( ( currentAnim == TORSO_GESTURE || currentAnim == TORSO_ATTACK ) && ( torsoAnim != currentAnim ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $593
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $591
LABELV $593
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $591
line 1363
;1363:    pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1364
;1364:  }
ADDRGP4 $592
JUMPV
LABELV $591
line 1365
;1365:  else if ( torsoAnim != currentAnim ) {
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $594
line 1366
;1366:    pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1367
;1367:    UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1368
;1368:  }
LABELV $594
LABELV $592
LABELV $588
line 1369
;1369:}
LABELV $560
endproc UI_PlayerInfo_SetInfo 36 8
bss
align 4
LABELV jumpHeight
skip 4
align 4
LABELV dp_realtime
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
import uiInfo
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
import UI_LoadArenas
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
export weaponChangeSound
align 4
LABELV weaponChangeSound
skip 4
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
LABELV $558
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
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
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $555
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
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $552
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
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $551
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $542
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $539
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
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $534
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $531
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $530
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $527
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $524
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $516
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $495
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $490
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $481
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $476
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
LABELV $468
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $458
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $457
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $454
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $453
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $448
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $447
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $444
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $443
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
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $438
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $437
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
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $426
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $425
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $420
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $419
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $409
byte 1 0
align 1
LABELV $408
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $405
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $387
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $380
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $370
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $364
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $356
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $166
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
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
byte 1 0
