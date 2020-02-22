lit
align 1
LABELV $100
byte 1 0
skip 31
align 1
LABELV $101
byte 1 0
skip 31
align 1
LABELV $102
byte 1 0
skip 63
code
proc CG_Obituary 204 20
file "..\..\..\..\src/cgame/cg_event.c"
line 36
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
;24:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;25:
;26:
;27:#include "cg_local.h"
;28:
;29:/*
;30: =============
;31: CG_Obituary
;32: =============
;33: */
;34:static void
;35:CG_Obituary(entityState_t *ent)
;36:{
line 43
;37:  int mod;
;38:  int target, attacker;
;39:  char *message;
;40:  char *message2;
;41:  const char *targetInfo;
;42:  const char *attackerInfo;
;43:  char targetName[32] = "";
ADDRLP4 0
ADDRGP4 $100
INDIRB
ASGNB 32
line 44
;44:  char attackerName[32] = "";
ADDRLP4 44
ADDRGP4 $101
INDIRB
ASGNB 32
line 45
;45:  char className[64] = "";
ADDRLP4 96
ADDRGP4 $102
INDIRB
ASGNB 64
line 49
;46:  gender_t gender;
;47:  clientInfo_t *ci;
;48:
;49:  target = ent->otherEntityNum;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 50
;50:  attacker = ent->otherEntityNum2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 51
;51:  mod = ent->eventParm;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 53
;52:
;53:  if (target < 0 || target >= MAX_CLIENTS)
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $105
ADDRLP4 32
INDIRI4
CNSTI4 64
LTI4 $103
LABELV $105
line 54
;54:    CG_Error("CG_Obituary: target out of range");
ADDRGP4 $106
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $103
line 56
;55:
;56:  ci = &cgs.clientinfo[target];
ADDRLP4 80
CNSTI4 1760
ADDRLP4 32
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 58
;57:
;58:  if (attacker < 0 || attacker >= MAX_CLIENTS)
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $110
ADDRLP4 36
INDIRI4
CNSTI4 64
LTI4 $108
LABELV $110
line 59
;59:  {
line 60
;60:    attacker = ENTITYNUM_WORLD;
ADDRLP4 36
CNSTI4 1022
ASGNI4
line 61
;61:    attackerInfo = NULL;
ADDRLP4 88
CNSTP4 0
ASGNP4
line 62
;62:  }
ADDRGP4 $109
JUMPV
LABELV $108
line 64
;63:  else
;64:    attackerInfo = CG_ConfigString(CS_PLAYERS + attacker);
ADDRLP4 36
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 88
ADDRLP4 172
INDIRP4
ASGNP4
LABELV $109
line 66
;65:
;66:  targetInfo = CG_ConfigString(CS_PLAYERS + target);
ADDRLP4 32
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 176
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 176
INDIRP4
ASGNP4
line 68
;67:
;68:  if (!targetInfo)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 69
;69:    return;
ADDRGP4 $99
JUMPV
LABELV $111
line 71
;70:
;71:  Q_strncpyz(targetName, Info_ValueForKey(targetInfo, "n"), sizeof(targetName) - 2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 180
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 180
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 72
;72:  strcat(targetName, S_COLOR_WHITE);
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 74
;73:
;74:  message2 = "";
ADDRLP4 92
ADDRGP4 $115
ASGNP4
line 78
;75:
;76:  // check for single client messages
;77:
;78:  switch(mod)
ADDRLP4 76
INDIRI4
CNSTI4 14
LTI4 $116
ADDRLP4 76
INDIRI4
CNSTI4 35
GTI4 $116
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $152-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $152
address $124
address $126
address $128
address $122
address $116
address $120
address $118
address $130
address $132
address $116
address $116
address $148
address $116
address $150
address $134
address $140
address $138
address $146
address $136
address $142
address $116
address $144
code
line 79
;79:  {
LABELV $118
line 81
;80:    case MOD_SUICIDE:
;81:      message = "suicides";
ADDRLP4 40
ADDRGP4 $119
ASGNP4
line 82
;82:      break;
ADDRGP4 $117
JUMPV
LABELV $120
line 84
;83:    case MOD_FALLING:
;84:      message = "fell fowl to gravity";
ADDRLP4 40
ADDRGP4 $121
ASGNP4
line 85
;85:      break;
ADDRGP4 $117
JUMPV
LABELV $122
line 87
;86:    case MOD_CRUSH:
;87:      message = "was squished";
ADDRLP4 40
ADDRGP4 $123
ASGNP4
line 88
;88:      break;
ADDRGP4 $117
JUMPV
LABELV $124
line 90
;89:    case MOD_WATER:
;90:      message = "forgot to pack a snorkel";
ADDRLP4 40
ADDRGP4 $125
ASGNP4
line 91
;91:      break;
ADDRGP4 $117
JUMPV
LABELV $126
line 93
;92:    case MOD_SLIME:
;93:      message = "melted";
ADDRLP4 40
ADDRGP4 $127
ASGNP4
line 94
;94:      break;
ADDRGP4 $117
JUMPV
LABELV $128
line 96
;95:    case MOD_LAVA:
;96:      message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $129
ASGNP4
line 97
;97:      break;
ADDRGP4 $117
JUMPV
LABELV $130
line 99
;98:    case MOD_TARGET_LASER:
;99:      message = "saw the light";
ADDRLP4 40
ADDRGP4 $131
ASGNP4
line 100
;100:      break;
ADDRGP4 $117
JUMPV
LABELV $132
line 102
;101:    case MOD_TRIGGER_HURT:
;102:      message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $133
ASGNP4
line 103
;103:      break;
ADDRGP4 $117
JUMPV
LABELV $134
line 105
;104:    case MOD_HSPAWN:
;105:      message = "should have ran further";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 106
;106:      break;
ADDRGP4 $117
JUMPV
LABELV $136
line 108
;107:    case MOD_ASPAWN:
;108:      message = "shouldn't have trod in the acid";
ADDRLP4 40
ADDRGP4 $137
ASGNP4
line 109
;109:      break;
ADDRGP4 $117
JUMPV
LABELV $138
line 111
;110:    case MOD_MGTURRET:
;111:      message = "was gunned down by a turret";
ADDRLP4 40
ADDRGP4 $139
ASGNP4
line 112
;112:      break;
ADDRGP4 $117
JUMPV
LABELV $140
line 114
;113:    case MOD_TESLAGEN:
;114:      message = "was zapped by a tesla generator";
ADDRLP4 40
ADDRGP4 $141
ASGNP4
line 115
;115:      break;
ADDRGP4 $117
JUMPV
LABELV $142
line 117
;116:    case MOD_ATUBE:
;117:      message = "was melted by an acid tube";
ADDRLP4 40
ADDRGP4 $143
ASGNP4
line 118
;118:      break;
ADDRGP4 $117
JUMPV
LABELV $144
line 120
;119:    case MOD_OVERMIND:
;120:      message = "got too close to the overmind";
ADDRLP4 40
ADDRGP4 $145
ASGNP4
line 121
;121:      break;
ADDRGP4 $117
JUMPV
LABELV $146
line 123
;122:    case MOD_REACTOR:
;123:      message = "got too close to the reactor";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
line 124
;124:      break;
ADDRGP4 $117
JUMPV
LABELV $148
line 126
;125:    case MOD_SLOWBLOB:
;126:      message = "should have visited a medical station";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
line 127
;127:      break;
ADDRGP4 $117
JUMPV
LABELV $150
line 129
;128:    case MOD_SWARM:
;129:      message = "was hunted down by the swarm";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 130
;130:      break;
ADDRGP4 $117
JUMPV
LABELV $116
line 132
;131:    default:
;132:      message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 133
;133:      break;
LABELV $117
line 136
;134:  }
;135:
;136:  if (attacker == target)
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $154
line 137
;137:  {
line 138
;138:    gender = ci->gender;
ADDRLP4 160
ADDRLP4 80
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 139
;139:    switch(mod)
ADDRLP4 76
INDIRI4
CNSTI4 11
EQI4 $158
ADDRGP4 $156
JUMPV
line 140
;140:    {
LABELV $158
line 142
;141:      case MOD_GRENADE:
;142:        if (gender == GENDER_FEMALE)
ADDRLP4 160
INDIRI4
CNSTI4 1
NEI4 $159
line 143
;143:          message = "blew herself up";
ADDRLP4 40
ADDRGP4 $161
ASGNP4
ADDRGP4 $157
JUMPV
LABELV $159
line 144
;144:        else if (gender == GENDER_NEUTER)
ADDRLP4 160
INDIRI4
CNSTI4 2
NEI4 $162
line 145
;145:          message = "blew itself up";
ADDRLP4 40
ADDRGP4 $164
ASGNP4
ADDRGP4 $157
JUMPV
LABELV $162
line 147
;146:        else
;147:          message = "blew himself up";
ADDRLP4 40
ADDRGP4 $165
ASGNP4
line 148
;148:        break;
ADDRGP4 $157
JUMPV
LABELV $156
line 151
;149:
;150:      default:
;151:        if (gender == GENDER_FEMALE)
ADDRLP4 160
INDIRI4
CNSTI4 1
NEI4 $166
line 152
;152:          message = "killed herself";
ADDRLP4 40
ADDRGP4 $168
ASGNP4
ADDRGP4 $157
JUMPV
LABELV $166
line 153
;153:        else if (gender == GENDER_NEUTER)
ADDRLP4 160
INDIRI4
CNSTI4 2
NEI4 $169
line 154
;154:          message = "killed itself";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
ADDRGP4 $157
JUMPV
LABELV $169
line 156
;155:        else
;156:          message = "killed himself";
ADDRLP4 40
ADDRGP4 $172
ASGNP4
line 157
;157:        break;
LABELV $157
line 159
;158:    }
;159:  }
LABELV $154
line 161
;160:
;161:  if (message)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
line 162
;162:  {
line 163
;163:    if (ci->team == PTE_ALIENS)
ADDRLP4 80
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $175
line 164
;164:    {
line 165
;165:      Q_strncpyz(targetName, "^1Zombie", sizeof(targetName));
ADDRLP4 0
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 166
;166:      strcat(targetName, S_COLOR_WHITE);
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 167
;167:    }
LABELV $175
line 169
;168:
;169:    CG_Printf("%s %s.\n", targetName, message);
ADDRGP4 $178
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 170
;170:    return;
ADDRGP4 $99
JUMPV
LABELV $173
line 174
;171:  }
;172:
;173:  // check for double client messages
;174:  if (!attackerInfo)
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $179
line 175
;175:  {
line 176
;176:    attacker = ENTITYNUM_WORLD;
ADDRLP4 36
CNSTI4 1022
ASGNI4
line 177
;177:    strcpy(attackerName, "noname");
ADDRLP4 44
ARGP4
ADDRGP4 $181
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 178
;178:  }
ADDRGP4 $180
JUMPV
LABELV $179
line 180
;179:  else
;180:  {
line 181
;181:    Q_strncpyz(attackerName, Info_ValueForKey(attackerInfo, "n"), sizeof(attackerName) - 2);
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 188
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 182
;182:    strcat(attackerName, S_COLOR_WHITE);
ADDRLP4 44
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 184
;183:    // check for kill messages about the current clientNum
;184:    if (target == cg.snap->ps.clientNum)
ADDRLP4 32
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $182
line 185
;185:      Q_strncpyz(cg.killerName, attackerName, sizeof(cg.killerName));
ADDRGP4 cg+113280
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $182
line 186
;186:  }
LABELV $180
line 188
;187:
;188:  if (attacker != ENTITYNUM_WORLD)
ADDRLP4 36
INDIRI4
CNSTI4 1022
EQI4 $187
line 189
;189:  {
line 190
;190:    switch(mod)
ADDRLP4 192
CNSTI4 18
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $210
ADDRLP4 76
INDIRI4
ADDRLP4 192
INDIRI4
GTI4 $215
LABELV $214
ADDRLP4 76
INDIRI4
CNSTI4 3
LTI4 $189
ADDRLP4 76
INDIRI4
CNSTI4 11
GTI4 $189
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $216-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $216
address $191
address $195
address $197
address $193
address $189
address $189
address $189
address $189
address $199
code
LABELV $215
ADDRLP4 76
INDIRI4
CNSTI4 23
EQI4 $202
ADDRLP4 76
INDIRI4
CNSTI4 24
EQI4 $205
ADDRLP4 76
INDIRI4
CNSTI4 26
EQI4 $207
ADDRGP4 $189
JUMPV
line 191
;191:    {
LABELV $191
line 193
;192:      case MOD_MACHINEGUN:
;193:        message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $192
ASGNP4
line 194
;194:        break;
ADDRGP4 $190
JUMPV
LABELV $193
line 196
;195:      case MOD_CHAINGUN:
;196:        message = "was chaingunned by";
ADDRLP4 40
ADDRGP4 $194
ASGNP4
line 197
;197:        break;
ADDRGP4 $190
JUMPV
LABELV $195
line 199
;198:      case MOD_SHOTGUN:
;199:        message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $196
ASGNP4
line 200
;200:        break;
ADDRGP4 $190
JUMPV
LABELV $197
line 202
;201:      case MOD_MDRIVER:
;202:        message = "was mass driven by";
ADDRLP4 40
ADDRGP4 $198
ASGNP4
line 203
;203:        break;
ADDRGP4 $190
JUMPV
LABELV $199
line 205
;204:      case MOD_GRENADE:
;205:        message = "couldn't escape";
ADDRLP4 40
ADDRGP4 $200
ASGNP4
line 206
;206:        message2 = "'s grenade";
ADDRLP4 92
ADDRGP4 $201
ASGNP4
line 207
;207:        break;
ADDRGP4 $190
JUMPV
LABELV $202
line 210
;208:
;209:      case MOD_ABUILDER_CLAW:
;210:        message = "should leave";
ADDRLP4 40
ADDRGP4 $203
ASGNP4
line 211
;211:        message2 = "'s buildings alone";
ADDRLP4 92
ADDRGP4 $204
ASGNP4
line 212
;212:        break;
ADDRGP4 $190
JUMPV
LABELV $205
line 214
;213:      case MOD_LEVEL0_BITE:
;214:        message = "was bitten by";
ADDRLP4 40
ADDRGP4 $206
ASGNP4
line 215
;215:        break;
ADDRGP4 $190
JUMPV
LABELV $207
line 217
;216:      case MOD_POISON:
;217:        message = "should have used a medkit against";
ADDRLP4 40
ADDRGP4 $208
ASGNP4
line 218
;218:        message2 = "'s poison";
ADDRLP4 92
ADDRGP4 $209
ASGNP4
line 219
;219:        break;
ADDRGP4 $190
JUMPV
LABELV $210
line 221
;220:      case MOD_TELEFRAG:
;221:        message = "tried to invade";
ADDRLP4 40
ADDRGP4 $211
ASGNP4
line 222
;222:        message2 = "'s personal space";
ADDRLP4 92
ADDRGP4 $212
ASGNP4
line 223
;223:        break;
ADDRGP4 $190
JUMPV
LABELV $189
line 225
;224:      default:
;225:        message = "was killed by";
ADDRLP4 40
ADDRGP4 $213
ASGNP4
line 226
;226:        break;
LABELV $190
line 229
;227:    }
;228:
;229:    if (message)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 230
;230:    {
line 231
;231:      if (ci->team == PTE_ALIENS)
ADDRLP4 80
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $220
line 232
;232:      {
line 233
;233:        Q_strncpyz(targetName, "^1Zombie", sizeof(targetName));
ADDRLP4 0
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 234
;234:        strcat(targetName, S_COLOR_WHITE);
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 235
;235:      }
ADDRGP4 $221
JUMPV
LABELV $220
line 237
;236:      else
;237:      {
line 238
;238:        Q_strncpyz(attackerName, "^1Zombie", sizeof(attackerName));
ADDRLP4 44
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 239
;239:        strcat(attackerName, S_COLOR_WHITE);
ADDRLP4 44
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 240
;240:      }
LABELV $221
line 241
;241:      CG_Printf("%s %s %s%s\n", targetName, message, attackerName, message2);
ADDRGP4 $222
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 242
;242:      return;
ADDRGP4 $99
JUMPV
LABELV $218
line 244
;243:    }
;244:  }
LABELV $187
line 247
;245:
;246:  // we don't know what it was
;247:  if (ci->team == PTE_ALIENS)
ADDRLP4 80
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $223
line 248
;248:  {
line 249
;249:    Q_strncpyz(targetName, "^1Zombie", sizeof(targetName));
ADDRLP4 0
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 250
;250:    strcat(targetName, S_COLOR_WHITE);
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 251
;251:  }
LABELV $223
line 252
;252:  CG_Printf("%s died.\n", targetName);
ADDRGP4 $225
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 253
;253:}
LABELV $99
endproc CG_Obituary 204 20
export CG_PainEvent
proc CG_PainEvent 12 16
line 266
;254:
;255://==========================================================================
;256:
;257:/*
;258: ================
;259: CG_PainEvent
;260:
;261: Also called by playerstate transition
;262: ================
;263: */
;264:void
;265:CG_PainEvent(centity_t *cent, int health)
;266:{
line 270
;267:  char *snd;
;268:
;269:  // don't do more than two pain sounds a second
;270:  if (cg.time - cent->pe.painTime < 500)
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $227
line 271
;271:    return;
ADDRGP4 $226
JUMPV
LABELV $227
line 273
;272:
;273:  if (cgs.clientinfo[cent->currentState.number].team != PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $230
line 274
;274:  {
line 275
;275:    if (health < 25)
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $234
line 276
;276:      snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $236
ASGNP4
ADDRGP4 $231
JUMPV
LABELV $234
line 277
;277:    else if (health < 50)
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $237
line 278
;278:      snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $239
ASGNP4
ADDRGP4 $231
JUMPV
LABELV $237
line 279
;279:    else if (health < 75)
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $240
line 280
;280:      snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $242
ASGNP4
ADDRGP4 $231
JUMPV
LABELV $240
line 282
;281:    else
;282:      snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $243
ASGNP4
line 283
;283:  }
ADDRGP4 $231
JUMPV
LABELV $230
line 285
;284:  else
;285:  {
line 286
;286:    if (health < 25)
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $244
line 287
;287:      snd = "*pain25_1zombie.wav";
ADDRLP4 0
ADDRGP4 $246
ASGNP4
ADDRGP4 $245
JUMPV
LABELV $244
line 288
;288:    else if (health < 50)
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $247
line 289
;289:      snd = "*pain50_1zombie.wav";
ADDRLP4 0
ADDRGP4 $249
ASGNP4
ADDRGP4 $248
JUMPV
LABELV $247
line 290
;290:    else if (health < 75)
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $250
line 291
;291:      snd = "*pain75_1zombie.wav";
ADDRLP4 0
ADDRGP4 $252
ASGNP4
ADDRGP4 $251
JUMPV
LABELV $250
line 293
;292:    else
;293:      snd = "*pain100_1zombie.wav";
ADDRLP4 0
ADDRGP4 $253
ASGNP4
LABELV $251
LABELV $248
LABELV $245
line 294
;294:  }
LABELV $231
line 296
;295:
;296:  trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, snd));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 299
;297:
;298:  // save pain time for programitic twitch animation
;299:  cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 300
;300:  cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 301
;301:}
LABELV $226
endproc CG_PainEvent 12 16
lit
align 4
LABELV $444
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $615
byte 4 0
byte 4 0
byte 4 1105199104
export CG_EntityEvent
code
proc CG_EntityEvent 124 24
line 314
;302:
;303:/*
;304: ==============
;305: CG_EntityEvent
;306:
;307: An entity has an event value
;308: also called by CG_CheckPlayerstateEvents
;309: ==============
;310: */
;311:#define DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;312:void
;313:CG_EntityEvent(centity_t *cent, vec3_t position)
;314:{
line 323
;315:  entityState_t *es;
;316:  int event;
;317:  vec3_t dir;
;318:  const char *s;
;319:  int clientNum;
;320:  clientInfo_t *ci;
;321:  int steptime;
;322:
;323:  if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $256
line 324
;324:    steptime = 200;
ADDRLP4 28
CNSTI4 200
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
line 326
;325:  else
;326:    steptime = BG_FindSteptimeForClass(cg.snap->ps.stats[STAT_PCLASS]);
ADDRGP4 cg+36
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindSteptimeForClass
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
LABELV $257
line 328
;327:
;328:  es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 329
;329:  event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 331
;330:
;331:  if (cg_debugEvents.integer)
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $260
line 332
;332:    CG_Printf("ent:%3i  event:%3i ", es->number, event);
ADDRGP4 $263
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $260
line 334
;333:
;334:  if (!event)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $264
line 335
;335:  {
line 336
;336:    DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $255
ADDRGP4 $269
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 337
;337:    return;
ADDRGP4 $255
JUMPV
LABELV $264
line 340
;338:  }
;339:
;340:  clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 341
;341:  if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $272
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $270
LABELV $272
line 342
;342:    clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $270
line 344
;343:
;344:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 12
CNSTI4 1760
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 346
;345:
;346:  switch(event)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $274
ADDRLP4 8
INDIRI4
CNSTI4 71
GTI4 $274
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $835-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $835
address $276
address $288
address $301
address $312
address $323
address $334
address $396
address $396
address $396
address $396
address $396
address $396
address $396
address $396
address $345
address $359
address $371
address $390
address $433
address $488
address $495
address $502
address $509
address $515
address $520
address $527
address $532
address $537
address $820
address $542
address $547
address $552
address $574
address $639
address $648
address $629
address $624
address $634
address $585
address $590
address $595
address $610
address $274
address $456
address $463
address $470
address $659
address $667
address $667
address $667
address $678
address $683
address $557
address $562
address $698
address $711
address $718
address $600
address $605
address $804
address $813
address $775
address $791
address $693
address $688
address $477
address $725
address $738
address $762
address $751
address $567
code
line 347
;347:  {
LABELV $276
line 352
;348:    //
;349:    // movement generated events
;350:    //
;351:    case EV_FOOTSTEP:
;352:      DEBUGNAME( "EV_FOOTSTEP" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $277
ADDRGP4 $280
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $277
line 353
;353:      ;
line 354
;354:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 355
;355:      {
line 356
;356:        if (ci->footsteps == FOOTSTEP_CUSTOM)
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
NEI4 $284
line 357
;357:          trap_S_StartSound(NULL, es->number, CHAN_BODY, ci->customFootsteps[rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 1728
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
ADDRGP4 $275
JUMPV
LABELV $284
line 359
;358:        else
;359:          trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[ci->footsteps][rand() & 3]);
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+268684+264
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 360
;360:      }
line 361
;361:      break;
ADDRGP4 $275
JUMPV
LABELV $288
line 364
;362:
;363:    case EV_FOOTSTEP_METAL:
;364:      DEBUGNAME( "EV_FOOTSTEP_METAL" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $289
ADDRGP4 $292
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $289
line 365
;365:      ;
line 366
;366:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 367
;367:      {
line 368
;368:        if (ci->footsteps == FOOTSTEP_CUSTOM)
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
NEI4 $296
line 369
;369:          trap_S_StartSound(NULL, es->number, CHAN_BODY, ci->customMetalFootsteps[rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 1744
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
ADDRGP4 $275
JUMPV
LABELV $296
line 371
;370:        else
;371:          trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_METAL][rand() & 3]);
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 372
;372:      }
line 373
;373:      break;
ADDRGP4 $275
JUMPV
LABELV $301
line 376
;374:
;375:    case EV_FOOTSTEP_SQUELCH:
;376:      DEBUGNAME( "EV_FOOTSTEP_SQUELCH" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $302
ADDRGP4 $305
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $302
line 377
;377:      ;
line 378
;378:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 379
;379:      {
line 380
;380:        trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_FLESH][rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 381
;381:      }
line 382
;382:      break;
ADDRGP4 $275
JUMPV
LABELV $312
line 385
;383:
;384:    case EV_FOOTSPLASH:
;385:      DEBUGNAME( "EV_FOOTSPLASH" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $313
ADDRGP4 $316
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $313
line 386
;386:      ;
line 387
;387:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 388
;388:      {
line 389
;389:        trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 390
;390:      }
line 391
;391:      break;
ADDRGP4 $275
JUMPV
LABELV $323
line 394
;392:
;393:    case EV_FOOTWADE:
;394:      DEBUGNAME( "EV_FOOTWADE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $324
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $324
line 395
;395:      ;
line 396
;396:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 397
;397:      {
line 398
;398:        trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 399
;399:      }
line 400
;400:      break;
ADDRGP4 $275
JUMPV
LABELV $334
line 403
;401:
;402:    case EV_SWIM:
;403:      DEBUGNAME( "EV_SWIM" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $335
ADDRGP4 $338
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $335
line 404
;404:      ;
line 405
;405:      if (cg_footsteps.integer && ci->footsteps != FOOTSTEP_NONE)
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 5
EQI4 $275
line 406
;406:      {
line 407
;407:        trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 48
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+268684+264+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 408
;408:      }
line 409
;409:      break;
ADDRGP4 $275
JUMPV
LABELV $345
line 412
;410:
;411:    case EV_FALL_SHORT:
;412:      DEBUGNAME( "EV_FALL_SHORT" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $346
ADDRGP4 $349
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $346
line 413
;413:      ;
line 414
;414:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.landSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+372
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 416
;415:
;416:      if (clientNum == cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $275
line 417
;417:      {
line 419
;418:        // smooth landing z changes
;419:        cg.landChange = -8;
ADDRGP4 cg+109932
CNSTF4 3238002688
ASGNF4
line 420
;420:        cg.landTime = cg.time;
ADDRGP4 cg+109936
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 421
;421:      }
line 422
;422:      break;
ADDRGP4 $275
JUMPV
LABELV $359
line 425
;423:
;424:    case EV_FALL_MEDIUM:
;425:      DEBUGNAME( "EV_FALL_MEDIUM" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $360
ADDRGP4 $363
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $360
line 426
;426:      ;
line 428
;427:      // use normal pain sound
;428:      trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*pain100_1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 48
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 430
;429:
;430:      if (clientNum == cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $275
line 431
;431:      {
line 433
;432:        // smooth landing z changes
;433:        cg.landChange = -16;
ADDRGP4 cg+109932
CNSTF4 3246391296
ASGNF4
line 434
;434:        cg.landTime = cg.time;
ADDRGP4 cg+109936
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 435
;435:      }
line 436
;436:      break;
ADDRGP4 $275
JUMPV
LABELV $371
line 439
;437:
;438:    case EV_FALL_FAR:
;439:      DEBUGNAME( "EV_FALL_FAR" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $372
ADDRGP4 $375
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $372
line 440
;440:      ;
line 441
;441:      if (cgs.clientinfo[cent->currentState.number].team != PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $376
line 442
;442:      {
line 443
;443:        trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*fall1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 444
;444:      }
ADDRGP4 $377
JUMPV
LABELV $376
line 446
;445:      else
;446:      {
line 447
;447:        trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*fall1zombie.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $381
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 448
;448:      }
LABELV $377
line 449
;449:      cent->pe.painTime = cg.time; // don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 451
;450:
;451:      if (clientNum == cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $275
line 452
;452:      {
line 454
;453:        // smooth landing z changes
;454:        cg.landChange = -24;
ADDRGP4 cg+109932
CNSTF4 3250585600
ASGNF4
line 455
;455:        cg.landTime = cg.time;
ADDRGP4 cg+109936
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 456
;456:      }
line 457
;457:      break;
ADDRGP4 $275
JUMPV
LABELV $390
line 460
;458:
;459:    case EV_FALLING:
;460:      DEBUGNAME( "EV_FALLING" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $391
ADDRGP4 $394
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $391
line 461
;461:      ;
line 462
;462:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*falling1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $395
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 463
;463:      break;
ADDRGP4 $275
JUMPV
LABELV $396
line 473
;464:
;465:    case EV_STEP_4:
;466:    case EV_STEP_8:
;467:    case EV_STEP_12:
;468:    case EV_STEP_16: // smooth out step up transitions
;469:    case EV_STEPDN_4:
;470:    case EV_STEPDN_8:
;471:    case EV_STEPDN_12:
;472:    case EV_STEPDN_16: // smooth out step down transitions
;473:      DEBUGNAME( "EV_STEP" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $397
ADDRGP4 $400
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $397
line 474
;474:      ;
line 475
;475:      {
line 480
;476:        float oldStep;
;477:        int delta;
;478:        int step;
;479:
;480:        if (clientNum != cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $401
line 481
;481:          break;
ADDRGP4 $275
JUMPV
LABELV $401
line 484
;482:
;483:        // if we are interpolating, we don't need to smooth steps
;484:        if (cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) || cg_nopredict.integer || cg_synchronousClients.integer)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $413
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 68
INDIRI4
NEI4 $413
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $413
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $405
LABELV $413
line 485
;485:          break;
ADDRGP4 $275
JUMPV
LABELV $405
line 488
;486:
;487:        // check for stepping up before a previous step is completed
;488:        delta = cg.time - cg.stepTime;
ADDRLP4 56
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109920
INDIRI4
SUBI4
ASGNI4
line 490
;489:
;490:        if (delta < steptime)
ADDRLP4 56
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $416
line 491
;491:          oldStep = cg.stepChange * (steptime - delta) / steptime;
ADDRLP4 72
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 60
ADDRGP4 cg+109916
INDIRF4
ADDRLP4 72
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 72
INDIRI4
CVIF4 4
DIVF4
ASGNF4
ADDRGP4 $417
JUMPV
LABELV $416
line 493
;492:        else
;493:          oldStep = 0;
ADDRLP4 60
CNSTF4 0
ASGNF4
LABELV $417
line 496
;494:
;495:        // add this amount
;496:        if (event >= EV_STEPDN_4)
ADDRLP4 8
INDIRI4
CNSTI4 11
LTI4 $419
line 497
;497:        {
line 498
;498:          step = 4 * (event - EV_STEPDN_4 + 1);
ADDRLP4 64
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 499
;499:          cg.stepChange = oldStep - step;
ADDRGP4 cg+109916
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 500
;500:        }
ADDRGP4 $420
JUMPV
LABELV $419
line 502
;501:        else
;502:        {
line 503
;503:          step = 4 * (event - EV_STEP_4 + 1);
ADDRLP4 64
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 28
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 504
;504:          cg.stepChange = oldStep + step;
ADDRGP4 cg+109916
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 505
;505:        }
LABELV $420
line 507
;506:
;507:        if (cg.stepChange > MAX_STEP_CHANGE)
ADDRGP4 cg+109916
INDIRF4
CNSTF4 1107296256
LEF4 $423
line 508
;508:          cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+109916
CNSTF4 1107296256
ASGNF4
ADDRGP4 $424
JUMPV
LABELV $423
line 509
;509:        else if (cg.stepChange < -MAX_STEP_CHANGE)
ADDRGP4 cg+109916
INDIRF4
CNSTF4 3254779904
GEF4 $427
line 510
;510:          cg.stepChange = -MAX_STEP_CHANGE;
ADDRGP4 cg+109916
CNSTF4 3254779904
ASGNF4
LABELV $427
LABELV $424
line 512
;511:
;512:        cg.stepTime = cg.time;
ADDRGP4 cg+109920
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 513
;513:        break;
ADDRGP4 $275
JUMPV
LABELV $433
line 517
;514:      }
;515:
;516:    case EV_JUMP:
;517:      DEBUGNAME( "EV_JUMP" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $434
ADDRGP4 $437
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $434
line 518
;518:      ;
line 519
;519:      trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*jump1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $438
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 521
;520:
;521:      if (BG_ClassHasAbility(cg.predictedPlayerState.stats[STAT_PCLASS], SCA_WALLJUMPER))
ADDRGP4 cg+107636+184+28
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 60
ADDRGP4 BG_ClassHasAbility
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $275
line 522
;522:      {
line 524
;523:        vec3_t surfNormal, refNormal =
;524:        { 0.0f, 0.0f, 1.0f };
ADDRLP4 64
ADDRGP4 $444
INDIRB
ASGNB 12
line 527
;525:        vec3_t rotAxis;
;526:
;527:        if (clientNum != cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $445
line 528
;528:          break;
ADDRGP4 $275
JUMPV
LABELV $445
line 531
;529:
;530:        //set surfNormal
;531:        VectorCopy( cg.predictedPlayerState.grapplePoint, surfNormal );
ADDRLP4 76
ADDRGP4 cg+107636+92
INDIRB
ASGNB 12
line 534
;532:
;533:        //if we are moving from one surface to another smooth the transition
;534:        if (!VectorCompare(surfNormal, cg.lastNormal) && surfNormal[2] != 1.0f)
ADDRLP4 76
ARGP4
ADDRGP4 cg+116244
ARGP4
ADDRLP4 100
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $451
ADDRLP4 76+8
INDIRF4
CNSTF4 1065353216
EQF4 $451
line 535
;535:        {
line 536
;536:          CrossProduct(refNormal, surfNormal, rotAxis);
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 537
;537:          VectorNormalize(rotAxis);
ADDRLP4 88
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 540
;538:
;539:          //add the op
;540:          CG_addSmoothOp(rotAxis, 15.0f, 1.0f);
ADDRLP4 88
ARGP4
CNSTF4 1097859072
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_addSmoothOp
CALLV
pop
line 541
;541:        }
LABELV $451
line 544
;542:
;543:        //copy the current normal to the lastNormal
;544:        VectorCopy( surfNormal, cg.lastNormal );
ADDRGP4 cg+116244
ADDRLP4 76
INDIRB
ASGNB 12
line 545
;545:      }
line 547
;546:
;547:      break;
ADDRGP4 $275
JUMPV
LABELV $456
line 550
;548:
;549:    case EV_LEV1_GRAB:
;550:      DEBUGNAME( "EV_LEV1_GRAB" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $457
ADDRGP4 $460
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $457
line 551
;551:      ;
line 552
;552:      trap_S_StartSound(NULL, es->number, CHAN_VOICE, cgs.media.alienL1Grab);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+268684+496
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 553
;553:      break;
ADDRGP4 $275
JUMPV
LABELV $463
line 556
;554:
;555:    case EV_LEV4_CHARGE_PREPARE:
;556:      DEBUGNAME( "EV_LEV4_CHARGE_PREPARE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $464
ADDRGP4 $467
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $464
line 557
;557:      ;
line 558
;558:      trap_S_StartSound(NULL, es->number, CHAN_VOICE, cgs.media.alienL4ChargePrepare);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+268684+500
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 559
;559:      break;
ADDRGP4 $275
JUMPV
LABELV $470
line 562
;560:
;561:    case EV_LEV4_CHARGE_START:
;562:      DEBUGNAME( "EV_LEV4_CHARGE_START" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $471
ADDRGP4 $474
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $471
line 563
;563:      ;
line 565
;564:      //FIXME: stop cgs.media.alienL4ChargePrepare playing here
;565:      trap_S_StartSound(NULL, es->number, CHAN_VOICE, cgs.media.alienL4ChargeStart);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+268684+504
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 566
;566:      break;
ADDRGP4 $275
JUMPV
LABELV $477
line 569
;567:
;568:    case EV_TAUNT:
;569:      DEBUGNAME( "EV_TAUNT" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $478
ADDRGP4 $481
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $478
line 570
;570:      ;
line 571
;571:      if (cgs.clientinfo[cent->currentState.number].team != PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $482
line 572
;572:      {
line 573
;573:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*taunt.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $486
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 574
;574:      }
ADDRGP4 $275
JUMPV
LABELV $482
line 576
;575:      else
;576:      {
line 577
;577:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*tauntzombie.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $487
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 578
;578:      }
line 579
;579:      break;
ADDRGP4 $275
JUMPV
LABELV $488
line 582
;580:
;581:    case EV_WATER_TOUCH:
;582:      DEBUGNAME( "EV_WATER_TOUCH" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $489
ADDRGP4 $492
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $489
line 583
;583:      ;
line 584
;584:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrInSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+400
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 585
;585:      break;
ADDRGP4 $275
JUMPV
LABELV $495
line 588
;586:
;587:    case EV_WATER_LEAVE:
;588:      DEBUGNAME( "EV_WATER_LEAVE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $496
ADDRGP4 $499
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $496
line 589
;589:      ;
line 590
;590:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+404
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 591
;591:      break;
ADDRGP4 $275
JUMPV
LABELV $502
line 594
;592:
;593:    case EV_WATER_UNDER:
;594:      DEBUGNAME( "EV_WATER_UNDER" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $503
ADDRGP4 $506
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $503
line 595
;595:      ;
line 596
;596:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+408
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 597
;597:      break;
ADDRGP4 $275
JUMPV
LABELV $509
line 600
;598:
;599:    case EV_WATER_CLEAR:
;600:      DEBUGNAME( "EV_WATER_CLEAR" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $510
ADDRGP4 $513
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $510
line 601
;601:      ;
line 602
;602:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*gasp.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $514
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 603
;603:      break;
ADDRGP4 $275
JUMPV
LABELV $515
line 609
;604:
;605:      //
;606:      // weapon events
;607:      //
;608:    case EV_NOAMMO:
;609:      DEBUGNAME( "EV_NOAMMO" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $519
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 610
;610:      ;
line 611
;611:      {
line 612
;612:      }
line 613
;613:      break;
ADDRGP4 $275
JUMPV
LABELV $520
line 616
;614:
;615:    case EV_CHANGE_WEAPON:
;616:      DEBUGNAME( "EV_CHANGE_WEAPON" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $521
ADDRGP4 $524
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $521
line 617
;617:      ;
line 618
;618:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.selectSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+260
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 619
;619:      break;
ADDRGP4 $275
JUMPV
LABELV $527
line 622
;620:
;621:    case EV_FIRE_WEAPON:
;622:      DEBUGNAME( "EV_FIRE_WEAPON" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $528
ADDRGP4 $531
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $528
line 623
;623:      ;
line 624
;624:      CG_FireWeapon(cent, WPM_PRIMARY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 625
;625:      break;
ADDRGP4 $275
JUMPV
LABELV $532
line 628
;626:
;627:    case EV_FIRE_WEAPON2:
;628:      DEBUGNAME( "EV_FIRE_WEAPON2" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $533
ADDRGP4 $536
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $533
line 629
;629:      ;
line 630
;630:      CG_FireWeapon(cent, WPM_SECONDARY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 631
;631:      break;
ADDRGP4 $275
JUMPV
LABELV $537
line 634
;632:
;633:    case EV_FIRE_WEAPON3:
;634:      DEBUGNAME( "EV_FIRE_WEAPON3" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $538
ADDRGP4 $541
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $538
line 635
;635:      ;
line 636
;636:      CG_FireWeapon(cent, WPM_TERTIARY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 637
;637:      break;
ADDRGP4 $275
JUMPV
LABELV $542
line 645
;638:
;639:      //=================================================================
;640:
;641:      //
;642:      // other events
;643:      //
;644:    case EV_PLAYER_TELEPORT_IN:
;645:      DEBUGNAME( "EV_PLAYER_TELEPORT_IN" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $546
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 646
;646:      ;
line 648
;647:      //deprecated
;648:      break;
ADDRGP4 $275
JUMPV
LABELV $547
line 651
;649:
;650:    case EV_PLAYER_TELEPORT_OUT:
;651:      DEBUGNAME( "EV_PLAYER_TELEPORT_OUT" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $548
ADDRGP4 $551
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $548
line 652
;652:      ;
line 653
;653:      CG_PlayerDisconnect(position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerDisconnect
CALLV
pop
line 654
;654:      break;
ADDRGP4 $275
JUMPV
LABELV $552
line 657
;655:
;656:    case EV_PLAYER_ON_FIRE:
;657:      DEBUGNAME( "EV_PLAYER_ON_FIRE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $556
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 658
;658:      ;
line 659
;659:    break;
ADDRGP4 $275
JUMPV
LABELV $557
line 662
;660:
;661:    case EV_BUILD_CONSTRUCT:
;662:      DEBUGNAME( "EV_BUILD_CONSTRUCT" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $561
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 663
;663:      ;
line 665
;664:      //do something useful here
;665:      break;
ADDRGP4 $275
JUMPV
LABELV $562
line 668
;666:
;667:    case EV_BUILD_DESTROY:
;668:      DEBUGNAME( "EV_BUILD_DESTROY" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $566
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 669
;669:      ;
line 671
;670:      //do something useful here
;671:      break;
ADDRGP4 $275
JUMPV
LABELV $567
line 674
;672:
;673:    case EV_RPTUSE_SOUND:
;674:      DEBUGNAME( "EV_RPTUSE_SOUND" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $568
ADDRGP4 $571
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $568
line 675
;675:      ;
line 676
;676:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.repeaterUseSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+544
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 677
;677:      break;
ADDRGP4 $275
JUMPV
LABELV $574
line 680
;678:
;679:    case EV_GRENADE_BOUNCE:
;680:      DEBUGNAME( "EV_GRENADE_BOUNCE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $575
ADDRGP4 $578
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $575
line 681
;681:      ;
line 682
;682:      if (rand() & 1)
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $579
line 683
;683:        trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.hardBounceSound1);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+380
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
ADDRGP4 $275
JUMPV
LABELV $579
line 685
;684:      else
;685:        trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.hardBounceSound2);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+384
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 686
;686:      break;
ADDRGP4 $275
JUMPV
LABELV $585
line 692
;687:
;688:      //
;689:      // missile impacts
;690:      //
;691:    case EV_MISSILE_HIT:
;692:      DEBUGNAME( "EV_MISSILE_HIT" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $586
ADDRGP4 $589
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $586
line 693
;693:      ;
line 694
;694:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 695
;695:      CG_MissileHitPlayer(es->weapon, es->generic1, position, dir, es->otherEntityNum);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 696
;696:      break;
ADDRGP4 $275
JUMPV
LABELV $590
line 699
;697:
;698:    case EV_MISSILE_MISS:
;699:      DEBUGNAME( "EV_MISSILE_MISS" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $591
ADDRGP4 $594
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $591
line 700
;700:      ;
line 701
;701:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 702
;702:      CG_MissileHitWall(es->weapon, es->generic1, 0, position, dir, IMPACTSOUND_DEFAULT);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 703
;703:      break;
ADDRGP4 $275
JUMPV
LABELV $595
line 706
;704:
;705:    case EV_MISSILE_MISS_METAL:
;706:      DEBUGNAME( "EV_MISSILE_MISS_METAL" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $596
ADDRGP4 $599
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $596
line 707
;707:      ;
line 708
;708:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 709
;709:      CG_MissileHitWall(es->weapon, es->generic1, 0, position, dir, IMPACTSOUND_METAL);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 710
;710:      break;
ADDRGP4 $275
JUMPV
LABELV $600
line 713
;711:
;712:    case EV_HUMAN_BUILDABLE_EXPLOSION:
;713:      DEBUGNAME( "EV_HUMAN_BUILDABLE_EXPLOSION" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $601
ADDRGP4 $604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $601
line 714
;714:      ;
line 715
;715:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 716
;716:      CG_HumanBuildableExplosion(position, dir);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 CG_HumanBuildableExplosion
CALLV
pop
line 717
;717:      break;
ADDRGP4 $275
JUMPV
LABELV $605
line 720
;718:
;719:    case EV_ALIEN_BUILDABLE_EXPLOSION:
;720:      DEBUGNAME( "EV_ALIEN_BUILDABLE_EXPLOSION" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $606
ADDRGP4 $609
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $606
line 721
;721:      ;
line 722
;722:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 723
;723:      CG_AlienBuildableExplosion(position, dir);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 CG_AlienBuildableExplosion
CALLV
pop
line 724
;724:      break;
ADDRGP4 $275
JUMPV
LABELV $610
line 727
;725:
;726:    case EV_TESLATRAIL:
;727:      DEBUGNAME( "EV_TESLATRAIL" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $611
ADDRGP4 $614
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $611
line 728
;728:      ;
line 729
;729:      cent->currentState.weapon = WP_TESLAGEN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 16
ASGNI4
line 730
;730:      {
line 731
;731:        centity_t *source = &cg_entities[es->generic1];
ADDRLP4 88
CNSTI4 1724
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 732
;732:        centity_t *target = &cg_entities[es->clientNum];
ADDRLP4 92
CNSTI4 1724
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 734
;733:        vec3_t sourceOffset =
;734:        { 0.0f, 0.0f, 28.0f };
ADDRLP4 96
ADDRGP4 $615
INDIRB
ASGNB 12
line 736
;735:
;736:        if (!CG_IsTrailSystemValid(&source->muzzleTS))
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_IsTrailSystemValid
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $275
line 737
;737:        {
line 738
;738:          source->muzzleTS = CG_SpawnNewTrailSystem(cgs.media.teslaZapTS);
ADDRGP4 cgs+268684+596
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_SpawnNewTrailSystem
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
ADDRLP4 112
INDIRP4
ASGNP4
line 740
;739:
;740:          if (CG_IsTrailSystemValid(&source->muzzleTS))
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
ARGP4
ADDRLP4 116
ADDRGP4 CG_IsTrailSystemValid
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $275
line 741
;741:          {
line 742
;742:            CG_SetAttachmentCent(&source->muzzleTS->frontAttachment, source);
ADDRLP4 120
ADDRLP4 88
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 1704
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 743
;743:            CG_SetAttachmentCent(&source->muzzleTS->backAttachment, target);
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 744
;744:            CG_AttachToCent(&source->muzzleTS->frontAttachment);
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 745
;745:            CG_AttachToCent(&source->muzzleTS->backAttachment);
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 746
;746:            CG_SetAttachmentOffset(&source->muzzleTS->frontAttachment, sourceOffset);
ADDRLP4 88
INDIRP4
CNSTI4 1704
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CG_SetAttachmentOffset
CALLV
pop
line 748
;747:
;748:            source->muzzleTSDeathTime = cg.time + cg_teslaTrailTime.integer;
ADDRLP4 88
INDIRP4
CNSTI4 1708
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg_teslaTrailTime+12
INDIRI4
ADDI4
ASGNI4
line 749
;749:          }
line 750
;750:        }
line 751
;751:      }
line 752
;752:      break;
ADDRGP4 $275
JUMPV
LABELV $624
line 755
;753:
;754:    case EV_BULLET_HIT_WALL:
;755:      DEBUGNAME( "EV_BULLET_HIT_WALL" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $625
ADDRGP4 $628
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $625
line 756
;756:      ;
line 757
;757:      ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 758
;758:      CG_Bullet(es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 759
;759:      break;
ADDRGP4 $275
JUMPV
LABELV $629
line 762
;760:
;761:    case EV_BULLET_HIT_FLESH:
;762:      DEBUGNAME( "EV_BULLET_HIT_FLESH" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $630
ADDRGP4 $633
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $630
line 763
;763:      ;
line 764
;764:      CG_Bullet(es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 765
;765:      break;
ADDRGP4 $275
JUMPV
LABELV $634
line 768
;766:
;767:    case EV_SHOTGUN:
;768:      DEBUGNAME( "EV_SHOTGUN" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $635
ADDRGP4 $638
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $635
line 769
;769:      ;
line 770
;770:      CG_ShotgunFire(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 771
;771:      break;
ADDRGP4 $275
JUMPV
LABELV $639
line 774
;772:
;773:    case EV_GENERAL_SOUND:
;774:      DEBUGNAME( "EV_GENERAL_SOUND" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $640
ADDRGP4 $643
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $640
line 775
;775:      ;
line 776
;776:      if (cgs.gameSounds[es->eventParm])
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $644
line 777
;777:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, cgs.gameSounds[es->eventParm]);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36284
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
ADDRGP4 $275
JUMPV
LABELV $644
line 779
;778:      else
;779:      {
line 780
;780:        s = CG_ConfigString(CS_SOUNDS + es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 289
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 100
INDIRP4
ASGNP4
line 781
;781:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, s));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 782
;782:      }
line 783
;783:      break;
ADDRGP4 $275
JUMPV
LABELV $648
line 786
;784:
;785:    case EV_GLOBAL_SOUND: // play from the player's head so it never diminishes
;786:      DEBUGNAME( "EV_GLOBAL_SOUND" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $649
ADDRGP4 $652
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $649
line 787
;787:      ;
line 788
;788:      if (cgs.gameSounds[es->eventParm])
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $653
line 789
;789:        trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[es->eventParm]);
CNSTP4 0
ARGP4
ADDRLP4 100
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36284
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
ADDRGP4 $275
JUMPV
LABELV $653
line 791
;790:      else
;791:      {
line 792
;792:        s = CG_ConfigString(CS_SOUNDS + es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 289
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 104
INDIRP4
ASGNP4
line 793
;793:        trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound(es->number, s));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 794
;794:      }
line 795
;795:      break;
ADDRGP4 $275
JUMPV
LABELV $659
line 800
;796:
;797:    case EV_PAIN:
;798:      // local player sounds are triggered in CG_CheckLocalSounds,
;799:      // so ignore events on the player
;800:      DEBUGNAME( "EV_PAIN" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $660
ADDRGP4 $663
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $660
line 801
;801:      ;
line 802
;802:      if (cent->currentState.number != cg.snap->ps.clientNum)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $275
line 803
;803:        CG_PainEvent(cent, es->eventParm);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 804
;804:      break;
ADDRGP4 $275
JUMPV
LABELV $667
line 809
;805:
;806:    case EV_DEATH1:
;807:    case EV_DEATH2:
;808:    case EV_DEATH3:
;809:      DEBUGNAME( "EV_DEATHx" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $668
ADDRGP4 $671
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $668
line 810
;810:      ;
line 811
;811:      if (cgs.clientinfo[cent->currentState.number].team != PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $672
line 812
;812:      {
line 813
;813:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%i.wav", event - EV_DEATH1 + 1)));
ADDRGP4 $676
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 48
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 814
;814:      }
ADDRGP4 $275
JUMPV
LABELV $672
line 816
;815:      else
;816:      {
line 817
;817:        trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%izombie.wav", event - EV_DEATH1 + 1)));
ADDRGP4 $677
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 48
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 818
;818:      }
line 819
;819:      break;
ADDRGP4 $275
JUMPV
LABELV $678
line 822
;820:
;821:    case EV_OBITUARY:
;822:      DEBUGNAME( "EV_OBITUARY" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $679
ADDRGP4 $682
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $679
line 823
;823:      ;
line 824
;824:      CG_Obituary(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 825
;825:      break;
ADDRGP4 $275
JUMPV
LABELV $683
line 828
;826:
;827:    case EV_GIB_PLAYER:
;828:      DEBUGNAME( "EV_GIB_PLAYER" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $275
ADDRGP4 $687
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 829
;829:      ;
line 831
;830:      // no gibbing
;831:      break;
ADDRGP4 $275
JUMPV
LABELV $688
line 834
;832:
;833:    case EV_STOPLOOPINGSOUND:
;834:      DEBUGNAME( "EV_STOPLOOPINGSOUND" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $689
ADDRGP4 $692
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $689
line 835
;835:      ;
line 836
;836:      trap_S_StopLoopingSound(es->number);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 837
;837:      es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 838
;838:      break;
ADDRGP4 $275
JUMPV
LABELV $693
line 841
;839:
;840:    case EV_DEBUG_LINE:
;841:      DEBUGNAME( "EV_DEBUG_LINE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $694
ADDRGP4 $697
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $694
line 842
;842:      ;
line 843
;843:      CG_Beam(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 844
;844:      break;
ADDRGP4 $275
JUMPV
LABELV $698
line 847
;845:
;846:    case EV_BUILD_DELAY:
;847:      DEBUGNAME( "EV_BUILD_DELAY" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $699
ADDRGP4 $702
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $699
line 848
;848:      ;
line 849
;849:      if (clientNum == cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $275
line 850
;850:      {
line 851
;851:        trap_S_StartLocalSound(cgs.media.buildableRepairedSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+268684+552
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 852
;852:        cg.lastBuildAttempt = cg.time;
ADDRGP4 cg+117060
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 853
;853:      }
line 854
;854:      break;
ADDRGP4 $275
JUMPV
LABELV $711
line 857
;855:
;856:    case EV_BUILD_REPAIR:
;857:      DEBUGNAME( "EV_BUILD_REPAIR" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $712
ADDRGP4 $715
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $712
line 858
;858:      ;
line 859
;859:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.buildableRepairSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+548
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 860
;860:      break;
ADDRGP4 $275
JUMPV
LABELV $718
line 863
;861:
;862:    case EV_BUILD_REPAIRED:
;863:      DEBUGNAME( "EV_BUILD_REPAIRED" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $719
ADDRGP4 $722
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $719
line 864
;864:      ;
line 865
;865:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.buildableRepairedSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+552
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 866
;866:      break;
ADDRGP4 $275
JUMPV
LABELV $725
line 869
;867:
;868:    case EV_OVERMIND_ATTACK:
;869:      DEBUGNAME( "EV_OVERMIND_ATTACK" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $726
ADDRGP4 $729
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $726
line 870
;870:      ;
line 871
;871:      if (cg.predictedPlayerState.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 1
NEI4 $275
line 872
;872:      {
line 873
;873:        trap_S_StartLocalSound(cgs.media.alienOvermindAttack, CHAN_ANNOUNCER);
ADDRGP4 cgs+268684+448
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 874
;874:        CG_CenterPrint("The Overmind is under attack!", 200, GIANTCHAR_WIDTH * 4);
ADDRGP4 $737
ARGP4
CNSTI4 200
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 875
;875:      }
line 876
;876:      break;
ADDRGP4 $275
JUMPV
LABELV $738
line 879
;877:
;878:    case EV_OVERMIND_DYING:
;879:      DEBUGNAME( "EV_OVERMIND_DYING" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $739
ADDRGP4 $742
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $739
line 880
;880:      ;
line 881
;881:      if (cg.predictedPlayerState.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 1
NEI4 $275
line 882
;882:      {
line 883
;883:        trap_S_StartLocalSound(cgs.media.alienOvermindDying, CHAN_ANNOUNCER);
ADDRGP4 cgs+268684+452
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 884
;884:        CG_CenterPrint("The Overmind is dying!", 200, GIANTCHAR_WIDTH * 4);
ADDRGP4 $750
ARGP4
CNSTI4 200
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 885
;885:      }
line 886
;886:      break;
ADDRGP4 $275
JUMPV
LABELV $751
line 889
;887:
;888:    case EV_DCC_ATTACK:
;889:      DEBUGNAME( "EV_DCC_ATTACK" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $752
ADDRGP4 $755
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $752
line 890
;890:      ;
line 891
;891:      if (cg.predictedPlayerState.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 2
NEI4 $275
line 892
;892:      {
line 894
;893:        //trap_S_StartLocalSound( cgs.media.humanDCCAttack, CHAN_ANNOUNCER );
;894:        CG_CenterPrint("Our base is under attack!", 200, GIANTCHAR_WIDTH * 4);
ADDRGP4 $761
ARGP4
CNSTI4 200
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 895
;895:      }
line 896
;896:      break;
ADDRGP4 $275
JUMPV
LABELV $762
line 899
;897:
;898:    case EV_OVERMIND_SPAWNS:
;899:      DEBUGNAME( "EV_OVERMIND_SPAWNS" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $763
ADDRGP4 $766
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $763
line 900
;900:      ;
line 901
;901:      if (cg.predictedPlayerState.stats[STAT_PTEAM] == PTE_ALIENS)
ADDRGP4 cg+107636+184+32
INDIRI4
CNSTI4 1
NEI4 $275
line 902
;902:      {
line 903
;903:        trap_S_StartLocalSound(cgs.media.alienOvermindSpawns, CHAN_ANNOUNCER);
ADDRGP4 cgs+268684+456
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 904
;904:        CG_CenterPrint("The Overmind needs spawns!", 200, GIANTCHAR_WIDTH * 4);
ADDRGP4 $774
ARGP4
CNSTI4 200
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 905
;905:      }
line 906
;906:      break;
ADDRGP4 $275
JUMPV
LABELV $775
line 909
;907:
;908:    case EV_ALIEN_EVOLVE:
;909:      DEBUGNAME( "EV_ALIEN_EVOLVE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $776
ADDRGP4 $779
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $776
line 910
;910:      ;
line 911
;911:      trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.alienEvolveSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+268684+568
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 912
;912:      {
line 913
;913:        particleSystem_t *ps = CG_SpawnNewParticleSystem(cgs.media.alienEvolvePS);
ADDRGP4 cgs+268684+560
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 108
INDIRP4
ASGNP4
line 915
;914:
;915:        if (CG_IsParticleSystemValid(&ps))
ADDRLP4 104
ARGP4
ADDRLP4 112
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $784
line 916
;916:        {
line 917
;917:          CG_SetAttachmentCent(&ps->attachment, cent);
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 918
;918:          CG_AttachToCent(&ps->attachment);
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 919
;919:        }
LABELV $784
line 920
;920:      }
line 922
;921:
;922:      if (es->number == cg.clientNum)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $275
line 923
;923:      {
line 924
;924:        CG_ResetPainBlend();
ADDRGP4 CG_ResetPainBlend
CALLV
pop
line 925
;925:        cg.spawnTime = cg.time;
ADDRGP4 cg+116212
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 926
;926:      }
line 927
;927:      break;
ADDRGP4 $275
JUMPV
LABELV $791
line 930
;928:
;929:    case EV_ALIEN_EVOLVE_FAILED:
;930:      DEBUGNAME( "EV_ALIEN_EVOLVE_FAILED" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $792
ADDRGP4 $795
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $792
line 931
;931:      ;
line 932
;932:      if (clientNum == cg.predictedPlayerState.clientNum)
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $275
line 933
;933:      {
line 935
;934:        //FIXME: change to "negative" sound
;935:        trap_S_StartLocalSound(cgs.media.buildableRepairedSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+268684+552
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 936
;936:        cg.lastEvolveAttempt = cg.time;
ADDRGP4 cg+117064
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 937
;937:      }
line 938
;938:      break;
ADDRGP4 $275
JUMPV
LABELV $804
line 941
;939:
;940:    case EV_ALIEN_ACIDTUBE:
;941:      DEBUGNAME( "EV_ALIEN_ACIDTUBE" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $805
ADDRGP4 $808
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $805
line 942
;942:      ;
line 943
;943:      {
line 944
;944:        particleSystem_t *ps = CG_SpawnNewParticleSystem(cgs.media.alienAcidTubePS);
ADDRGP4 cgs+268684+564
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 108
INDIRP4
ASGNP4
line 946
;945:
;946:        if (CG_IsParticleSystemValid(&ps))
ADDRLP4 104
ARGP4
ADDRLP4 112
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $275
line 947
;947:        {
line 948
;948:          CG_SetAttachmentCent(&ps->attachment, cent);
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 949
;949:          ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 950
;950:          CG_SetParticleSystemNormal(ps, dir);
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 CG_SetParticleSystemNormal
CALLV
pop
line 951
;951:          CG_AttachToCent(&ps->attachment);
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToCent
CALLV
pop
line 952
;952:        }
line 953
;953:      }
line 954
;954:      break;
ADDRGP4 $275
JUMPV
LABELV $813
line 957
;955:
;956:    case EV_MEDKIT_USED:
;957:      DEBUGNAME( "EV_MEDKIT_USED" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $814
ADDRGP4 $817
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $814
line 958
;958:      ;
line 959
;959:      trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.medkitUseSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+436
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 960
;960:      break;
ADDRGP4 $275
JUMPV
LABELV $820
line 963
;961:
;962:    case EV_PLAYER_RESPAWN:
;963:      DEBUGNAME( "EV_PLAYER_RESPAWN" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $821
ADDRGP4 $824
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $821
line 964
;964:      ;
line 965
;965:      if (es->number == cg.clientNum)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $275
line 966
;966:        cg.spawnTime = cg.time;
ADDRGP4 cg+116212
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 967
;967:      break;
ADDRGP4 $275
JUMPV
LABELV $274
line 970
;968:
;969:    default:
;970:      DEBUGNAME( "UNKNOWN" )
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $830
ADDRGP4 $833
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $830
line 971
;971:      ;
line 972
;972:      CG_Error("Unknown event: %i", event);
ADDRGP4 $834
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 973
;973:      break;
LABELV $275
line 975
;974:  }
;975:}
LABELV $255
endproc CG_EntityEvent 124 24
export CG_CheckEvents
proc CG_CheckEvents 16 12
line 985
;976:
;977:/*
;978: ==============
;979: CG_CheckEvents
;980:
;981: ==============
;982: */
;983:void
;984:CG_CheckEvents(centity_t *cent)
;985:{
line 987
;986:  entity_event_t event;
;987:  entity_event_t oldEvent = EV_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 990
;988:
;989:  // check for event-only entities
;990:  if (cent->currentState.eType > ET_EVENTS)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 22
LEI4 $838
line 991
;991:  {
line 992
;992:    event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 22
SUBI4
ASGNI4
line 994
;993:
;994:    if (cent->previousEvent)
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $840
line 995
;995:      return; // already fired
ADDRGP4 $837
JUMPV
LABELV $840
line 997
;996:
;997:    cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 999
;998:
;999:    cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 22
SUBI4
ASGNI4
line 1003
;1000:    
;1001:    // Move the pointer to the entity that the
;1002:    // event was originally attached to
;1003:    if (cent->currentState.eFlags & EF_PLAYER_EVENT)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $839
line 1004
;1004:    {
line 1005
;1005:      cent = &cg_entities[cent->currentState.otherEntityNum];
ADDRFP4 0
CNSTI4 1724
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1006
;1006:      oldEvent = cent->currentState.event;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1007
;1007:      cent->currentState.event = event;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1008
;1008:    }
line 1009
;1009:  }
ADDRGP4 $839
JUMPV
LABELV $838
line 1011
;1010:  else
;1011:  {
line 1013
;1012:    // check for events riding with another entity
;1013:    if (cent->currentState.event == cent->previousEvent)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
NEI4 $844
line 1014
;1014:      return;
ADDRGP4 $837
JUMPV
LABELV $844
line 1016
;1015:
;1016:    cent->previousEvent = cent->currentState.event;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1017
;1017:    if ((cent->currentState.event & ~EV_EVENT_BITS) == 0)
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $846
line 1018
;1018:      return;
ADDRGP4 $837
JUMPV
LABELV $846
line 1019
;1019:  }
LABELV $839
line 1022
;1020:
;1021:  // calculate the position at exactly the frame time
;1022:  BG_EvaluateTrajectory(&cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1023
;1023:  CG_SetEntitySoundPosition(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1025
;1024:
;1025:  CG_EntityEvent(cent, cent->lerpOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1028
;1026:  
;1027:  // If this was a reattached spilled event, restore the original event
;1028:  if (oldEvent != EV_NONE)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $849
line 1029
;1029:    cent->currentState.event = oldEvent;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $849
line 1030
;1030:}
LABELV $837
endproc CG_CheckEvents 16 12
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
LABELV $834
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $833
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $824
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $817
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 75
byte 1 73
byte 1 84
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $808
byte 1 69
byte 1 86
byte 1 95
byte 1 65
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 95
byte 1 65
byte 1 67
byte 1 73
byte 1 68
byte 1 84
byte 1 85
byte 1 66
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $795
byte 1 69
byte 1 86
byte 1 95
byte 1 65
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 95
byte 1 69
byte 1 86
byte 1 79
byte 1 76
byte 1 86
byte 1 69
byte 1 95
byte 1 70
byte 1 65
byte 1 73
byte 1 76
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $779
byte 1 69
byte 1 86
byte 1 95
byte 1 65
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 95
byte 1 69
byte 1 86
byte 1 79
byte 1 76
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $774
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 115
byte 1 33
byte 1 0
align 1
LABELV $766
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 77
byte 1 73
byte 1 78
byte 1 68
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $761
byte 1 79
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 33
byte 1 0
align 1
LABELV $755
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 67
byte 1 67
byte 1 95
byte 1 65
byte 1 84
byte 1 84
byte 1 65
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $750
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 33
byte 1 0
align 1
LABELV $742
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 77
byte 1 73
byte 1 78
byte 1 68
byte 1 95
byte 1 68
byte 1 89
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $737
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 33
byte 1 0
align 1
LABELV $729
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 77
byte 1 73
byte 1 78
byte 1 68
byte 1 95
byte 1 65
byte 1 84
byte 1 84
byte 1 65
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $722
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 65
byte 1 73
byte 1 82
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $715
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 65
byte 1 73
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $702
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 95
byte 1 68
byte 1 69
byte 1 76
byte 1 65
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $697
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $692
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $687
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $682
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $677
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $676
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $671
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $663
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $652
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $643
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $638
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $633
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $628
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 69
byte 1 83
byte 1 76
byte 1 65
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $609
byte 1 69
byte 1 86
byte 1 95
byte 1 65
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 95
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $604
byte 1 69
byte 1 86
byte 1 95
byte 1 72
byte 1 85
byte 1 77
byte 1 65
byte 1 78
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 95
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $594
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $589
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $578
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $571
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 80
byte 1 84
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $566
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 95
byte 1 68
byte 1 69
byte 1 83
byte 1 84
byte 1 82
byte 1 79
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $561
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 95
byte 1 67
byte 1 79
byte 1 78
byte 1 83
byte 1 84
byte 1 82
byte 1 85
byte 1 67
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $556
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 79
byte 1 78
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $551
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $546
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $541
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $536
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $524
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $519
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $514
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $513
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $506
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $499
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $487
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $486
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $481
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $474
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 69
byte 1 86
byte 1 52
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $467
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 69
byte 1 86
byte 1 52
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 95
byte 1 80
byte 1 82
byte 1 69
byte 1 80
byte 1 65
byte 1 82
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $460
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 69
byte 1 86
byte 1 49
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 66
byte 1 10
byte 1 0
align 1
LABELV $438
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $437
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $400
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $394
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $380
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $375
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $316
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $305
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 83
byte 1 81
byte 1 85
byte 1 69
byte 1 76
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $269
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $263
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $253
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $252
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $249
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $246
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $243
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $242
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $239
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $236
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $225
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $222
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $212
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $211
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $208
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $206
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $204
byte 1 39
byte 1 115
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $203
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $201
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $198
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 100
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $196
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $194
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $192
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $181
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 94
byte 1 49
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $172
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $171
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $168
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $165
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $164
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $161
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $151
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 104
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $147
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $145
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $143
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 99
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 117
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 122
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 115
byte 1 108
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $139
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 99
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 114
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $129
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $127
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $125
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 110
byte 1 111
byte 1 114
byte 1 107
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $123
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $121
byte 1 102
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 102
byte 1 111
byte 1 119
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $119
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 0
align 1
LABELV $114
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $113
byte 1 110
byte 1 0
align 1
LABELV $106
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
