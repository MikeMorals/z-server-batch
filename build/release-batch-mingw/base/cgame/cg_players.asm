data
export cg_customSoundNames
align 4
LABELV cg_customSoundNames
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
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
skip 40
export CG_CustomSound
code
proc CG_CustomSound 20 8
file "..\..\..\..\src/cgame/cg_players.c"
line 42
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
;24:// cg_players.c -- handle the media and animation for player entities
;25:
;26:
;27:#include "cg_local.h"
;28://FIX ME, seems to try load this sounds per each model gah.
;29:char *cg_customSoundNames[MAX_CUSTOM_SOUNDS] =
;30:{ "*death1.wav", "*death2.wav", "*death3.wav", "*death1zombie.wav", "*death2zombie.wav", "*death3zombie.wav", "*jump1.wav", "*pain25_1.wav", "*pain50_1.wav",
;31:    "*pain75_1.wav", "*pain100_1.wav", "*pain25_1zombie.wav", "*pain50_1zombie.wav", "*pain75_1zombie.wav", "*pain100_1zombie.wav", "*falling1.wav",
;32:    "*gasp.wav", "*drown.wav", "*fall1.wav", "*fall1zombie.wav", "*tauntzombie.wav", "*taunt.wav" };
;33:
;34:/*
;35: ================
;36: CG_CustomSound
;37:
;38: ================
;39: */
;40:sfxHandle_t
;41:CG_CustomSound(int clientNum, const char *soundName)
;42:{
line 46
;43:  clientInfo_t *ci;
;44:  int i;
;45:
;46:  if (soundName[0] != '*')
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $122
line 47
;47:    return trap_S_RegisterSound(soundName, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $122
line 49
;48:
;49:  if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $126
ADDRLP4 12
INDIRI4
CNSTI4 64
LTI4 $124
LABELV $126
line 50
;50:    clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
LABELV $124
line 52
;51:
;52:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 4
CNSTI4 1760
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 54
;53:
;54:  for(i = 0;i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $128
line 55
;55:  {
line 56
;56:    if (!strcmp(soundName, cg_customSoundNames[i]))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $132
line 57
;57:      return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $132
line 58
;58:  }
LABELV $129
line 54
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $131
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $134
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
LABELV $134
line 60
;59:
;60:  CG_Error("Unknown custom sound: %s", soundName);
ADDRGP4 $135
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 61
;61:  return 0;
CNSTI4 0
RETI4
LABELV $121
endproc CG_CustomSound 20 8
proc CG_ParseAnimationFile 20092 12
line 82
;62:}
;63:
;64:/*
;65: =============================================================================
;66:
;67: CLIENT INFO
;68:
;69: =============================================================================
;70: */
;71:
;72:/*
;73: ======================
;74: CG_ParseAnimationFile
;75:
;76: Read a configuration file containing animation coutns and rates
;77: models/players/visor/animation.cfg, etc
;78: ======================
;79: */
;80:static qboolean
;81:CG_ParseAnimationFile(const char *filename, clientInfo_t *ci)
;82:{
line 93
;83:  char *text_p, *prev;
;84:  int len;
;85:  int i;
;86:  char *token;
;87:  float fps;
;88:  int skip;
;89:  char text[20000];
;90:  fileHandle_t f;
;91:  animation_t *animations;
;92:
;93:  animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
line 96
;94:
;95:  // load the file
;96:  len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 97
;97:  if (len <= 0)
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $137
line 98
;98:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $137
line 100
;99:
;100:  if (len >= sizeof(text) - 1)
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $139
line 101
;101:  {
line 102
;102:    CG_Printf("File %s too long\n", filename);
ADDRGP4 $141
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 103
;103:    trap_FS_FCloseFile(f);
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 104
;104:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $139
line 107
;105:  }
;106:
;107:  trap_FS_Read(text, len, f);
ADDRLP4 32
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 108
;108:  text[len] = 0;
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 109
;109:  trap_FS_FCloseFile(f);
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 112
;110:
;111:  // parse the text
;112:  text_p = text;
ADDRLP4 12
ADDRLP4 32
ASGNP4
line 113
;113:  skip = 0; // quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 115
;114:
;115:  ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 116
;116:  VectorClear( ci->headOffset );
ADDRLP4 20040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20044
CNSTF4 0
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 504
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
line 117
;117:  ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 118
;118:  ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 119
;119:  ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 120
;120:  ci->nonsegmented = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $142
line 124
;121:
;122:  // read optional parameters
;123:  while(1)
;124:  {
line 125
;125:    prev = text_p; // so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 126
;126:    token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 128
;127:
;128:    if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $145
line 129
;129:      break;
ADDRGP4 $144
JUMPV
LABELV $145
line 131
;130:
;131:    if (!Q_stricmp(token, "footsteps"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $147
line 132
;132:    {
line 133
;133:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 134
;134:      if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 135
;135:        break;
ADDRGP4 $144
JUMPV
LABELV $150
line 137
;136:
;137:      if (!Q_stricmp(token, "default") || !Q_stricmp(token, "normal"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
EQI4 $156
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $152
LABELV $156
line 138
;138:        ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $152
line 139
;139:      else if (!Q_stricmp(token, "flesh"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $157
line 140
;140:        ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $157
line 141
;141:      else if (!Q_stricmp(token, "none"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $160
line 142
;142:        ci->footsteps = FOOTSTEP_NONE;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 5
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $160
line 143
;143:      else if (!Q_stricmp(token, "custom"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 20076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 0
NEI4 $163
line 144
;144:        ci->footsteps = FOOTSTEP_CUSTOM;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $163
line 146
;145:      else
;146:        CG_Printf("Bad footsteps parm in %s: %s\n", filename, token);
ADDRGP4 $166
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 148
;147:
;148:      continue;
ADDRGP4 $143
JUMPV
LABELV $147
line 150
;149:    }
;150:    else if (!Q_stricmp(token, "headoffset"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $167
line 151
;151:    {
line 152
;152:      for(i = 0;i < 3;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $170
line 153
;153:      {
line 154
;154:        token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 155
;155:        if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $174
line 156
;156:          break;
ADDRGP4 $143
JUMPV
LABELV $174
line 158
;157:
;158:        ci->headOffset[i] = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
ADDP4
ADDRLP4 20064
INDIRF4
ASGNF4
line 159
;159:      }
LABELV $171
line 152
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $170
line 161
;160:
;161:      continue;
ADDRGP4 $143
JUMPV
LABELV $167
line 163
;162:    }
;163:    else if (!Q_stricmp(token, "sex"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $176
line 164
;164:    {
line 165
;165:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20064
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20064
INDIRP4
ASGNP4
line 167
;166:
;167:      if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $179
line 168
;168:        break;
ADDRGP4 $144
JUMPV
LABELV $179
line 170
;169:
;170:      if (token[0] == 'f' || token[0] == 'F')
ADDRLP4 20068
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 102
EQI4 $183
ADDRLP4 20068
INDIRI4
CNSTI4 70
NEI4 $181
LABELV $183
line 171
;171:        ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $181
line 172
;172:      else if (token[0] == 'n' || token[0] == 'N')
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 110
EQI4 $186
ADDRLP4 20072
INDIRI4
CNSTI4 78
NEI4 $184
LABELV $186
line 173
;173:        ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $184
line 175
;174:      else
;175:        ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 177
;176:
;177:      continue;
ADDRGP4 $143
JUMPV
LABELV $176
line 179
;178:    }
;179:    else if (!Q_stricmp(token, "fixedlegs"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $187
line 180
;180:    {
line 181
;181:      ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 182
;182:      continue;
ADDRGP4 $143
JUMPV
LABELV $187
line 184
;183:    }
;184:    else if (!Q_stricmp(token, "fixedtorso"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $192
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $190
line 185
;185:    {
line 186
;186:      ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 1
ASGNI4
line 187
;187:      continue;
ADDRGP4 $143
JUMPV
LABELV $190
line 189
;188:    }
;189:    else if (!Q_stricmp(token, "nonsegmented"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $193
line 190
;190:    {
line 191
;191:      ci->nonsegmented = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 192
;192:      continue;
ADDRGP4 $143
JUMPV
LABELV $193
line 196
;193:    }
;194:
;195:    // if it is a number, start parsing animations
;196:    if (token[0] >= '0' && token[0] <= '9')
ADDRLP4 20076
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 48
LTI4 $196
ADDRLP4 20076
INDIRI4
CNSTI4 57
GTI4 $196
line 197
;197:    {
line 198
;198:      text_p = prev; // unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 199
;199:      break;
ADDRGP4 $144
JUMPV
LABELV $196
line 202
;200:    }
;201:
;202:    Com_Printf("unknown token '%s' is %s\n", token, filename);
ADDRGP4 $198
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
line 203
;203:  }
LABELV $143
line 123
ADDRGP4 $142
JUMPV
LABELV $144
line 205
;204:
;205:  if (!ci->nonsegmented)
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $199
line 206
;206:  {
line 208
;207:    // read information for each frame
;208:    for(i = 0;i < MAX_PLAYER_ANIMATIONS;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $201
line 209
;209:    {
line 210
;210:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 212
;211:
;212:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $205
line 213
;213:      {
line 214
;214:        if (i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE)
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $203
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $203
line 215
;215:        {
line 216
;216:          animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 217
;217:          animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 218
;218:          animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 219
;219:          animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 220
;220:          animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 221
;221:          animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 222
;222:          animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 223
;223:          continue;
ADDRGP4 $202
JUMPV
line 226
;224:        }
;225:
;226:        break;
LABELV $205
line 229
;227:      }
;228:
;229:      animations[i].firstFrame = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20052
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20052
INDIRI4
ASGNI4
line 232
;230:
;231:      // leg only frames are adjusted to not count the upper body only frames
;232:      if (i == LEGS_WALKCR)
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $209
line 233
;233:        skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
LABELV $209
line 235
;234:
;235:      if (i >= LEGS_WALKCR && i < TORSO_GETFLAG)
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $211
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $211
line 236
;236:        animations[i].firstFrame -= skip;
ADDRLP4 20064
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20064
INDIRP4
ADDRLP4 20064
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
LABELV $211
line 238
;237:
;238:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 239
;239:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $213
line 240
;240:        break;
ADDRGP4 $203
JUMPV
LABELV $213
line 242
;241:
;242:      animations[i].numFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20072
INDIRI4
ASGNI4
line 243
;243:      animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 244
;244:      animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 247
;245:
;246:      // if numFrames is negative the animation is reversed
;247:      if (animations[i].numFrames < 0)
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $215
line 248
;248:      {
line 249
;249:        animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 20076
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20076
INDIRP4
ADDRLP4 20076
INDIRP4
INDIRI4
NEGI4
ASGNI4
line 250
;250:        animations[i].reversed = qtrue;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 251
;251:      }
LABELV $215
line 253
;252:
;253:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20076
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20076
INDIRP4
ASGNP4
line 255
;254:
;255:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $217
line 256
;256:        break;
ADDRGP4 $203
JUMPV
LABELV $217
line 258
;257:
;258:      animations[i].loopFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20080
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20080
INDIRI4
ASGNI4
line 260
;259:
;260:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20084
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20084
INDIRP4
ASGNP4
line 262
;261:
;262:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $219
line 263
;263:        break;
ADDRGP4 $203
JUMPV
LABELV $219
line 265
;264:
;265:      fps = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20088
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20088
INDIRF4
ASGNF4
line 266
;266:      if (fps == 0)
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $221
line 267
;267:        fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
LABELV $221
line 269
;268:
;269:      animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 270
;270:      animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 271
;271:    }
LABELV $202
line 208
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $201
LABELV $203
line 273
;272:
;273:    if (i != MAX_PLAYER_ANIMATIONS)
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $223
line 274
;274:    {
line 275
;275:      CG_Printf("Error parsing animation file: %s", filename);
ADDRGP4 $225
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 276
;276:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $223
line 279
;277:    }
;278:    // crouch backward animation
;279:    memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 280
;280:    animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 282
;281:    // walk backward animation
;282:    memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 283
;283:    animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 285
;284:    // flag moving fast
;285:    animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 286
;286:    animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 287
;287:    animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 288
;288:    animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 289
;289:    animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 290
;290:    animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 292
;291:    // flag not moving or moving slowly
;292:    animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 293
;293:    animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 294
;294:    animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 295
;295:    animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 296
;296:    animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 297
;297:    animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 299
;298:    // flag speeding up
;299:    animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 300
;300:    animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 301
;301:    animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 302
;302:    animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 303
;303:    animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 304
;304:    animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 305
;305:  }
ADDRGP4 $200
JUMPV
LABELV $199
line 307
;306:  else
;307:  {
line 309
;308:    // read information for each frame
;309:    for(i = 0;i < MAX_NONSEG_PLAYER_ANIMATIONS;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $226
line 310
;310:    {
line 311
;311:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 313
;312:
;313:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 314
;314:        break;
ADDRGP4 $228
JUMPV
LABELV $230
line 316
;315:
;316:      animations[i].firstFrame = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20052
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20052
INDIRI4
ASGNI4
line 318
;317:
;318:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 319
;319:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $232
line 320
;320:        break;
ADDRGP4 $228
JUMPV
LABELV $232
line 322
;321:
;322:      animations[i].numFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20060
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20060
INDIRI4
ASGNI4
line 323
;323:      animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 324
;324:      animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 327
;325:
;326:      // if numFrames is negative the animation is reversed
;327:      if (animations[i].numFrames < 0)
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $234
line 328
;328:      {
line 329
;329:        animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 20064
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20064
INDIRP4
ADDRLP4 20064
INDIRP4
INDIRI4
NEGI4
ASGNI4
line 330
;330:        animations[i].reversed = qtrue;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 331
;331:      }
LABELV $234
line 333
;332:
;333:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20064
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20064
INDIRP4
ASGNP4
line 335
;334:
;335:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $236
line 336
;336:        break;
ADDRGP4 $228
JUMPV
LABELV $236
line 338
;337:
;338:      animations[i].loopFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20068
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20068
INDIRI4
ASGNI4
line 340
;339:
;340:      token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20072
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20072
INDIRP4
ASGNP4
line 342
;341:
;342:      if (!*token)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $238
line 343
;343:        break;
ADDRGP4 $228
JUMPV
LABELV $238
line 345
;344:
;345:      fps = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20076
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20076
INDIRF4
ASGNF4
line 346
;346:      if (fps == 0)
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $240
line 347
;347:        fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
LABELV $240
line 349
;348:
;349:      animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 350
;350:      animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 351
;351:    }
LABELV $227
line 309
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 27
LTI4 $226
LABELV $228
line 353
;352:
;353:    if (i != MAX_NONSEG_PLAYER_ANIMATIONS)
ADDRLP4 4
INDIRI4
CNSTI4 27
EQI4 $242
line 354
;354:    {
line 355
;355:      CG_Printf("Error parsing animation file: %s", filename);
ADDRGP4 $225
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 356
;356:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $242
line 360
;357:    }
;358:
;359:    // walk backward animation
;360:    memcpy(&animations[NSPA_WALKBACK], &animations[NSPA_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 784
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 56
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 361
;361:    animations[NSPA_WALKBACK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 1
ASGNI4
line 362
;362:  }
LABELV $200
line 364
;363:
;364:  return qtrue;
CNSTI4 1
RETI4
LABELV $136
endproc CG_ParseAnimationFile 20092 12
proc CG_RegisterClientSkin 96 20
line 374
;365:}
;366:
;367:/*
;368: ==========================
;369: CG_RegisterClientSkin
;370: ==========================
;371: */
;372:static qboolean
;373:CG_RegisterClientSkin(clientInfo_t *ci, const char *modelName, const char *skinName)
;374:{
line 377
;375:  char filename[MAX_QPATH];
;376:
;377:  if (!ci->nonsegmented)
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $245
line 378
;378:  {
line 379
;379:    Com_sprintf(filename, sizeof(filename), "models/players/%s/lower_%s.skin", modelName, skinName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $247
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
line 380
;380:    ci->legsSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 382
;381:    //zombie
;382:    Com_sprintf(filename, sizeof(filename), "models/players/%s/lower_%s.skin", "human_base", "zombie");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $247
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 383
;383:    ci->zombielegsSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 385
;384:    //Endzombie
;385:    if (!ci->legsSkin)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
line 386
;386:      Com_Printf("Leg skin load failure: %s\n", filename);
ADDRGP4 $252
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $250
line 388
;387:
;388:    Com_sprintf(filename, sizeof(filename), "models/players/%s/upper_%s.skin", modelName, skinName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $253
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
line 389
;389:    ci->torsoSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 391
;390:    //Zombie
;391:    Com_sprintf(filename, sizeof(filename), "models/players/%s/upper_%s.skin", "human_base", "zombie");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $253
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 392
;392:    ci->zombietorsoSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 394
;393:    //EndZombie
;394:    if (!ci->torsoSkin)
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $254
line 395
;395:      Com_Printf("Torso skin load failure: %s\n", filename);
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $254
line 397
;396:
;397:    Com_sprintf(filename, sizeof(filename), "models/players/%s/head_%s.skin", modelName, skinName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $257
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
line 398
;398:    ci->headSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 400
;399:    //Zombie
;400:    Com_sprintf(filename, sizeof(filename), "models/players/%s/head_%s.skin", "human_base", "zombie");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $257
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 401
;401:    ci->zombieheadSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 403
;402:    //endZombie
;403:    if (!ci->headSkin)
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $258
line 404
;404:      Com_Printf("Head skin load failure: %s\n", filename);
ADDRGP4 $260
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $258
line 406
;405:
;406:    if (!ci->legsSkin || !ci->torsoSkin || !ci->headSkin)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $264
ADDRLP4 88
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $264
ADDRLP4 88
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $246
LABELV $264
line 407
;407:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
line 408
;408:  }
LABELV $245
line 410
;409:  else
;410:  {
line 411
;411:    Com_sprintf(filename, sizeof(filename), "models/players/%s/nonseg_%s.skin", modelName, skinName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $265
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
line 412
;412:    ci->nonSegSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 413
;413:    if (!ci->nonSegSkin)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $266
line 414
;414:      Com_Printf("Non-segmented skin load failure: %s\n", filename);
ADDRGP4 $268
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $266
line 416
;415:
;416:    if (!ci->nonSegSkin)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $269
line 417
;417:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $269
line 418
;418:  }
LABELV $246
line 420
;419:
;420:  return qtrue;
CNSTI4 1
RETI4
LABELV $244
endproc CG_RegisterClientSkin 96 20
proc CG_RegisterClientModelname 144 16
line 430
;421:}
;422:
;423:/*
;424: ==========================
;425: CG_RegisterClientModelname
;426: ==========================
;427: */
;428:static qboolean
;429:CG_RegisterClientModelname(clientInfo_t *ci, const char *modelName, const char *skinName)
;430:{
line 435
;431:  char filename[MAX_QPATH * 2];
;432:
;433:  //TA: do this first so the nonsegmented property is set
;434:  // load the animations
;435:  Com_sprintf(filename, sizeof(filename), "models/players/%s/animation.cfg", modelName);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $272
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 436
;436:  if (!CG_ParseAnimationFile(filename, ci))
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $273
line 437
;437:  {
line 438
;438:    Com_Printf("Failed to load animation file %s\n", filename);
ADDRGP4 $275
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 439
;439:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $273
line 444
;440:  }
;441:
;442:  // load cmodels before models so filecache works
;443:
;444:  if (!ci->nonsegmented)
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $276
line 445
;445:  {
line 446
;446:    Com_sprintf(filename, sizeof(filename), "models/players/%s/lower.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $278
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 447
;447:    ci->legsModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 448
;448:    if (!ci->legsModel)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $279
line 449
;449:    {
line 450
;450:      Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 451
;451:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $279
line 454
;452:    }
;453:
;454:    Com_sprintf(filename, sizeof(filename), "models/players/%s/upper.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $282
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 455
;455:    ci->torsoModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 456
;456:    if (!ci->torsoModel)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $283
line 457
;457:    {
line 458
;458:      Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 459
;459:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $283
line 462
;460:    }
;461:
;462:    Com_sprintf(filename, sizeof(filename), "models/players/%s/head.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $285
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 463
;463:    ci->headModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 464
;464:    if (!ci->headModel)
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $277
line 465
;465:    {
line 466
;466:      Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 467
;467:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
line 469
;468:    }
;469:  }
LABELV $276
line 471
;470:  else
;471:  {
line 472
;472:    Com_sprintf(filename, sizeof(filename), "models/players/%s/nonseg.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $288
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 473
;473:    ci->nonSegModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 474
;474:    if (!ci->nonSegModel)
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $289
line 475
;475:    {
line 476
;476:      Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 477
;477:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $289
line 479
;478:    }
;479:  }
LABELV $277
line 482
;480:
;481:  // if any skins failed to load, return failure
;482:  if (!CG_RegisterClientSkin(ci, modelName, skinName))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $291
line 483
;483:  {
line 484
;484:    Com_Printf("Failed to load skin file: %s : %s\n", modelName, skinName);
ADDRGP4 $293
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 485
;485:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $291
line 497
;486:  }
;487:
;488:  //FIXME: skins do not load without icon present. do we want icons anyway?
;489:  /*  Com_sprintf( filename, sizeof( filename ), "models/players/%s/icon_%s.tga", modelName, skinName );
;490:   ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
;491:   if( !ci->modelIcon )
;492:   {
;493:   Com_Printf( "Failed to load icon file: %s\n", filename );
;494:   return qfalse;
;495:   }*/
;496:
;497:  return qtrue;
CNSTI4 1
RETI4
LABELV $271
endproc CG_RegisterClientModelname 144 16
proc CG_ColorFromString 20 4
line 507
;498:}
;499:
;500:/*
;501: ====================
;502: CG_ColorFromString
;503: ====================
;504: */
;505:static void
;506:CG_ColorFromString(const char *v, vec3_t color)
;507:{
line 510
;508:  int val;
;509:
;510:  VectorClear( color );
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
line 512
;511:
;512:  val = atoi(v);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 514
;513:
;514:  if (val < 1 || val > 7)
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $297
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $295
LABELV $297
line 515
;515:  {
line 516
;516:    VectorSet( color, 1, 1, 1 );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 517
;517:    return;
ADDRGP4 $294
JUMPV
LABELV $295
line 520
;518:  }
;519:
;520:  if (val & 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $298
line 521
;521:    color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $298
line 523
;522:
;523:  if (val & 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $300
line 524
;524:    color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $300
line 526
;525:
;526:  if (val & 4)
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $302
line 527
;527:    color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
LABELV $302
line 528
;528:}
LABELV $294
endproc CG_ColorFromString 20 4
proc CG_LoadClientInfo 76 12
line 539
;529:
;530:/*
;531: ===================
;532: CG_LoadClientInfo
;533:
;534: Load it now, taking the disk hits
;535: ===================
;536: */
;537:static void
;538:CG_LoadClientInfo(clientInfo_t *ci)
;539:{
line 545
;540:  const char *dir, *fallback;
;541:  int i;
;542:  const char *s;
;543:  int clientNum;
;544:
;545:  if (!CG_RegisterClientModelname(ci, ci->modelName, ci->skinName))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $305
line 546
;546:  {
line 547
;547:    if (cg_buildScript.integer)
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $307
line 548
;548:      CG_Error("CG_RegisterClientModelname( %s, %s ) failed", ci->modelName, ci->skinName);
ADDRGP4 $310
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $307
line 551
;549:
;550:    // fall back
;551:    if (!CG_RegisterClientModelname(ci, DEFAULT_MODEL, "default"))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 32
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $311
line 552
;552:      CG_Error("DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL);
ADDRGP4 $314
ARGP4
ADDRGP4 $313
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $311
line 553
;553:  }
LABELV $305
line 556
;554:
;555:  // sounds
;556:  dir = ci->modelName;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 557
;557:  fallback = DEFAULT_MODEL;
ADDRLP4 16
ADDRGP4 $313
ASGNP4
line 559
;558:
;559:  for(i = 0;i < MAX_CUSTOM_SOUNDS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $315
line 560
;560:  {
line 561
;561:    s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 564
;562:    
;563:    //FIX ME: REMOVE THIS AND FIX SOUNDS WHEN  ADDING MORE MODELS
;564:    if (Q_stricmp(dir, "human_base") != 0)
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $319
line 565
;565:      continue;
ADDRGP4 $316
JUMPV
LABELV $319
line 567
;566:
;567:    if (!s)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $321
line 568
;568:      break;
ADDRGP4 $317
JUMPV
LABELV $321
line 571
;569:
;570:    // fanny about a bit with sounds that are missing
;571:    if (!CG_FileExists(va("sound/player/%s/%s", dir, s + 1)))
ADDRGP4 $325
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $323
line 572
;572:    {
line 575
;573:      //file doesn't exist
;574:
;575:      if (i == 11 || i == 8) //fall or falling
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $328
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $326
LABELV $328
line 576
;576:      {
line 577
;577:        ci->sounds[i] = trap_S_RegisterSound("sound/null.wav", qfalse);
ADDRGP4 $329
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 578
;578:      }
ADDRGP4 $324
JUMPV
LABELV $326
line 580
;579:      else
;580:      {
line 581
;581:        if (i == 9) //gasp
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $330
line 582
;582:          s = cg_customSoundNames[7]; //pain100_1
ADDRLP4 4
ADDRGP4 cg_customSoundNames+28
INDIRP4
ASGNP4
ADDRGP4 $331
JUMPV
LABELV $330
line 583
;583:        else if (i == 10) //drown
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $333
line 584
;584:          s = cg_customSoundNames[0]; //death1
ADDRLP4 4
ADDRGP4 cg_customSoundNames
INDIRP4
ASGNP4
LABELV $333
LABELV $331
line 586
;585:
;586:        ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", dir, s + 1), qfalse);
ADDRGP4 $325
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 587
;587:        if (!ci->sounds[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
line 588
;588:          ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", fallback, s + 1), qfalse);
ADDRGP4 $325
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 56
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 589
;589:      }
line 590
;590:    }
ADDRGP4 $324
JUMPV
LABELV $323
line 592
;591:    else
;592:    {
line 593
;593:      ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", dir, s + 1), qfalse);
ADDRGP4 $325
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 594
;594:      if (!ci->sounds[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $337
line 595
;595:        ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", fallback, s + 1), qfalse);
ADDRGP4 $325
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
LABELV $337
line 596
;596:    }
LABELV $324
line 597
;597:  }
LABELV $316
line 559
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $315
LABELV $317
line 599
;598:
;599:  if (ci->footsteps == FOOTSTEP_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
NEI4 $339
line 600
;600:  {
line 601
;601:    for(i = 0;i < 4;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $341
line 602
;602:    {
line 603
;603:      ci->customFootsteps[i] = trap_S_RegisterSound(va("sound/player/%s/step%d.wav", dir, i + 1), qfalse);
ADDRGP4 $345
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 604
;604:      if (!ci->customFootsteps[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $346
line 605
;605:        ci->customFootsteps[i] = trap_S_RegisterSound(va("sound/player/footsteps/step%d.wav", i + 1), qfalse);
ADDRGP4 $348
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
LABELV $346
line 607
;606:
;607:      ci->customMetalFootsteps[i] = trap_S_RegisterSound(va("sound/player/%s/clank%d.wav", dir, i + 1), qfalse);
ADDRGP4 $349
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 608
;608:      if (!ci->customMetalFootsteps[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $350
line 609
;609:        ci->customMetalFootsteps[i] = trap_S_RegisterSound(va("sound/player/footsteps/clank%d.wav", i + 1), qfalse);
ADDRGP4 $352
ARGP4
ADDRLP4 0
INDIRI4
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
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $350
line 610
;610:    }
LABELV $342
line 601
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $341
line 611
;611:  }
LABELV $339
line 615
;612:
;613:  // reset any existing players and bodies, because they might be in bad
;614:  // frames for this new model
;615:  clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+41408
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1760
DIVI4
ASGNI4
line 616
;616:  for(i = 0;i < MAX_GENTITIES;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $354
line 617
;617:  {
line 618
;618:    if (cg_entities[i].currentState.clientNum == clientNum && cg_entities[i].currentState.eType == ET_PLAYER)
ADDRLP4 28
CNSTI4 1724
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $358
ADDRLP4 28
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $358
line 619
;619:      CG_ResetPlayerEntity(&cg_entities[i]);
CNSTI4 1724
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
LABELV $358
line 620
;620:  }
LABELV $355
line 616
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $354
line 621
;621:}
LABELV $304
endproc CG_LoadClientInfo 76 12
proc CG_CopyClientInfoModel 80 12
line 630
;622:
;623:/*
;624: ======================
;625: CG_CopyClientInfoModel
;626: ======================
;627: */
;628:static void
;629:CG_CopyClientInfoModel(clientInfo_t *from, clientInfo_t *to)
;630:{
line 631
;631:  VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 496
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
line 632
;632:  to->footsteps = from->footsteps;
ADDRLP4 4
CNSTI4 508
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
INDIRI4
ASGNI4
line 633
;633:  to->gender = from->gender;
ADDRLP4 8
CNSTI4 512
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
INDIRI4
ASGNI4
line 635
;634:
;635:  to->legsModel = from->legsModel;
ADDRLP4 12
CNSTI4 516
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
INDIRI4
ASGNI4
line 636
;636:  to->legsSkin = from->legsSkin;
ADDRLP4 16
CNSTI4 520
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 637
;637:  to->zombielegsSkin = from->zombielegsSkin;
ADDRLP4 20
CNSTI4 524
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 638
;638:  to->torsoModel = from->torsoModel;
ADDRLP4 24
CNSTI4 528
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 639
;639:  to->torsoSkin = from->torsoSkin;
ADDRLP4 28
CNSTI4 532
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
INDIRI4
ASGNI4
line 640
;640:  to->zombietorsoSkin = from->zombietorsoSkin;
ADDRLP4 32
CNSTI4 536
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
INDIRI4
ASGNI4
line 641
;641:  to->headModel = from->headModel;
ADDRLP4 36
CNSTI4 540
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 642
;642:  to->headSkin = from->headSkin;
ADDRLP4 40
CNSTI4 544
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 643
;643:  to->zombieheadSkin = from->zombieheadSkin;
ADDRLP4 44
CNSTI4 548
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 644
;644:  to->nonSegModel = from->nonSegModel;
ADDRLP4 48
CNSTI4 552
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 645
;645:  to->nonSegSkin = from->nonSegSkin;
ADDRLP4 52
CNSTI4 556
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 646
;646:  to->nonsegmented = from->nonsegmented;
ADDRLP4 56
CNSTI4 492
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 647
;647:  to->modelIcon = from->modelIcon;
ADDRLP4 60
CNSTI4 560
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 649
;648:
;649:  memcpy(to->animations, from->animations, sizeof(to->animations));
ADDRLP4 64
CNSTI4 564
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 650
;650:  memcpy(to->sounds, from->sounds, sizeof(to->sounds));
ADDRLP4 68
CNSTI4 1600
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 651
;651:  memcpy(to->customFootsteps, from->customFootsteps, sizeof(to->customFootsteps));
ADDRLP4 72
CNSTI4 1728
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 652
;652:  memcpy(to->customMetalFootsteps, from->customMetalFootsteps, sizeof(to->customMetalFootsteps));
ADDRLP4 76
CNSTI4 1744
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 653
;653:}
LABELV $362
endproc CG_CopyClientInfoModel 80 12
proc CG_GetCorpseNum 32 8
line 662
;654:
;655:/*
;656: ======================
;657: CG_GetCorpseNum
;658: ======================
;659: */
;660:static int
;661:CG_GetCorpseNum(pClass_t class)
;662:{
line 668
;663:  int i;
;664:  clientInfo_t *match;
;665:  char *modelName;
;666:  char *skinName;
;667:
;668:  modelName = BG_FindModelNameForClass(class);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindModelNameForClass
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 669
;669:  skinName = BG_FindSkinNameForClass(class);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindSkinNameForClass
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 671
;670:
;671:  for(i = PCL_NONE + 1;i < PCL_NUM_CLASSES;i++)
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $364
line 672
;672:  {
line 673
;673:    match = &cgs.corpseinfo[i];
ADDRLP4 0
CNSTI4 1760
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+154048
ADDP4
ASGNP4
line 675
;674:
;675:    if (!match->infoValid)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $369
line 676
;676:      continue;
ADDRGP4 $365
JUMPV
LABELV $369
line 678
;677:
;678:    if (!Q_stricmp(modelName, match->modelName) && !Q_stricmp(skinName, match->skinName))
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $371
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $371
line 679
;679:    {
line 681
;680:      // this clientinfo is identical, so use it's handles
;681:      return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $363
JUMPV
LABELV $371
line 683
;682:    }
;683:  }
LABELV $365
line 671
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $364
line 686
;684:
;685:  //something has gone horribly wrong
;686:  return -1;
CNSTI4 -1
RETI4
LABELV $363
endproc CG_GetCorpseNum 32 8
proc CG_ScanForExistingClientInfo 24 8
line 696
;687:}
;688:
;689:/*
;690: ======================
;691: CG_ScanForExistingClientInfo
;692: ======================
;693: */
;694:static qboolean
;695:CG_ScanForExistingClientInfo(clientInfo_t *ci)
;696:{
line 700
;697:  int i;
;698:  clientInfo_t *match;
;699:
;700:  for(i = PCL_NONE + 1;i < PCL_NUM_CLASSES;i++)
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $374
line 701
;701:  {
line 702
;702:    match = &cgs.corpseinfo[i];
ADDRLP4 0
CNSTI4 1760
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+154048
ADDP4
ASGNP4
line 704
;703:
;704:    if (!match->infoValid)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $379
line 705
;705:      continue;
ADDRGP4 $375
JUMPV
LABELV $379
line 707
;706:
;707:    if (!Q_stricmp(ci->modelName, match->modelName) && !Q_stricmp(ci->skinName, match->skinName))
ADDRLP4 8
CNSTI4 160
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $381
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $381
line 708
;708:    {
line 710
;709:      // this clientinfo is identical, so use it's handles
;710:      CG_CopyClientInfoModel(match, ci);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 712
;711:
;712:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $373
JUMPV
LABELV $381
line 714
;713:    }
;714:  }
LABELV $375
line 700
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $374
line 717
;715:
;716:  //TA: shouldn't happen
;717:  return qfalse;
CNSTI4 0
RETI4
LABELV $373
endproc CG_ScanForExistingClientInfo 24 8
export CG_PrecacheClientInfo
proc CG_PrecacheClientInfo 1764 12
line 727
;718:}
;719:
;720:/*
;721: ======================
;722: CG_PrecacheClientInfo
;723: ======================
;724: */
;725:void
;726:CG_PrecacheClientInfo(pClass_t class, char *model, char *skin)
;727:{
line 731
;728:  clientInfo_t *ci;
;729:  clientInfo_t newInfo;
;730:
;731:  ci = &cgs.corpseinfo[class];
ADDRLP4 1760
CNSTI4 1760
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+154048
ADDP4
ASGNP4
line 734
;732:
;733:  // the old value
;734:  memset(&newInfo, 0, sizeof(newInfo));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 737
;735:
;736:  // model
;737:  Q_strncpyz(newInfo.modelName, model, sizeof(newInfo.modelName));
ADDRLP4 0+160
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 738
;738:  Q_strncpyz(newInfo.headModelName, model, sizeof(newInfo.headModelName));
ADDRLP4 0+288
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 741
;739:
;740:  // modelName didn not include a skin name
;741:  if (!skin)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $389
line 742
;742:  {
line 743
;743:    Q_strncpyz(newInfo.skinName, "default", sizeof(newInfo.skinName));
ADDRLP4 0+224
ARGP4
ADDRGP4 $154
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 744
;744:    Q_strncpyz(newInfo.headSkinName, "default", sizeof(newInfo.headSkinName));
ADDRLP4 0+352
ARGP4
ADDRGP4 $154
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 745
;745:  }
ADDRGP4 $390
JUMPV
LABELV $389
line 747
;746:  else
;747:  {
line 748
;748:    Q_strncpyz(newInfo.skinName, skin, sizeof(newInfo.skinName));
ADDRLP4 0+224
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 749
;749:    Q_strncpyz(newInfo.headSkinName, skin, sizeof(newInfo.headSkinName));
ADDRLP4 0+352
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 750
;750:  }
LABELV $390
line 752
;751:
;752:  newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 755
;753:
;754:  //TA: actually register the models
;755:  *ci = newInfo;
ADDRLP4 1760
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1760
line 756
;756:  CG_LoadClientInfo(ci);
ADDRLP4 1760
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 757
;757:}
LABELV $383
endproc CG_PrecacheClientInfo 1764 12
export CG_NewClientInfo
proc CG_NewClientInfo 1876 12
line 766
;758:
;759:/*
;760: ======================
;761: CG_NewClientInfo
;762: ======================
;763: */
;764:void
;765:CG_NewClientInfo(int clientNum)
;766:{
line 773
;767:  clientInfo_t *ci;
;768:  clientInfo_t newInfo;
;769:  const char *configstring;
;770:  const char *v;
;771:  char *slash;
;772:
;773:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 1772
CNSTI4 1760
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 775
;774:
;775:  configstring = CG_ConfigString(clientNum + CS_PLAYERS);
ADDRFP4 0
INDIRI4
CNSTI4 673
ADDI4
ARGI4
ADDRLP4 1776
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1764
ADDRLP4 1776
INDIRP4
ASGNP4
line 776
;776:  if (!configstring[0])
ADDRLP4 1764
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $401
line 777
;777:  {
line 778
;778:    memset(ci, 0, sizeof(*ci));
ADDRLP4 1772
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 779
;779:    return; // player just left
ADDRGP4 $399
JUMPV
LABELV $401
line 783
;780:  }
;781:
;782:  // the old value
;783:  memset(&newInfo, 0, sizeof(newInfo));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 786
;784:
;785:  // isolate the player's name
;786:  v = Info_ValueForKey(configstring, "n");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 1780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1780
INDIRP4
ASGNP4
line 787
;787:  Q_strncpyz(newInfo.name, v, sizeof(newInfo.name));
ADDRLP4 4+4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 790
;788:
;789:  // colors
;790:  v = Info_ValueForKey(configstring, "c1");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 1784
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1784
INDIRP4
ASGNP4
line 791
;791:  CG_ColorFromString(v, newInfo.color1);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+76
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 793
;792:
;793:  v = Info_ValueForKey(configstring, "c2");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $408
ARGP4
ADDRLP4 1788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1788
INDIRP4
ASGNP4
line 794
;794:  CG_ColorFromString(v, newInfo.color2);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+88
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 797
;795:
;796:  // bot skill
;797:  v = Info_ValueForKey(configstring, "skill");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $410
ARGP4
ADDRLP4 1792
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1792
INDIRP4
ASGNP4
line 798
;798:  newInfo.botSkill = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1796
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+72
ADDRLP4 1796
INDIRI4
ASGNI4
line 801
;799:
;800:  // handicap
;801:  v = Info_ValueForKey(configstring, "hc");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 1800
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1800
INDIRP4
ASGNP4
line 802
;802:  newInfo.handicap = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1804
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+120
ADDRLP4 1804
INDIRI4
ASGNI4
line 805
;803:
;804:  // wins
;805:  v = Info_ValueForKey(configstring, "w");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 1808
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1808
INDIRP4
ASGNP4
line 806
;806:  newInfo.wins = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1812
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+124
ADDRLP4 1812
INDIRI4
ASGNI4
line 809
;807:
;808:  // losses
;809:  v = Info_ValueForKey(configstring, "l");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 1816
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1816
INDIRP4
ASGNP4
line 810
;810:  newInfo.losses = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1820
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+128
ADDRLP4 1820
INDIRI4
ASGNI4
line 813
;811:
;812:  // team
;813:  v = Info_ValueForKey(configstring, "t");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 1824
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1824
INDIRP4
ASGNP4
line 814
;814:  newInfo.team = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1828
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+68
ADDRLP4 1828
INDIRI4
ASGNI4
line 817
;815:
;816:  // team task
;817:  v = Info_ValueForKey(configstring, "tt");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $420
ARGP4
ADDRLP4 1832
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1832
INDIRP4
ASGNP4
line 818
;818:  newInfo.teamTask = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1836
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+132
ADDRLP4 1836
INDIRI4
ASGNI4
line 821
;819:
;820:  // team leader
;821:  v = Info_ValueForKey(configstring, "tl");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 1840
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1840
INDIRP4
ASGNP4
line 822
;822:  newInfo.teamLeader = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1844
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+136
ADDRLP4 1844
INDIRI4
ASGNI4
line 824
;823:
;824:  v = Info_ValueForKey(configstring, "g_redteam");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 1848
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1848
INDIRP4
ASGNP4
line 825
;825:  Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
ADDRLP4 4+416
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 827
;826:
;827:  v = Info_ValueForKey(configstring, "g_blueteam");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 1852
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1852
INDIRP4
ASGNP4
line 828
;828:  Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
ADDRLP4 4+448
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 831
;829:
;830:  // model
;831:  v = Info_ValueForKey(configstring, "model");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 1856
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1856
INDIRP4
ASGNP4
line 832
;832:  Q_strncpyz(newInfo.modelName, v, sizeof(newInfo.modelName));
ADDRLP4 4+160
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 834
;833:
;834:  slash = strchr(newInfo.modelName, '/');
ADDRLP4 4+160
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1860
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1768
ADDRLP4 1860
INDIRP4
ASGNP4
line 836
;835:
;836:  if (!slash)
ADDRLP4 1768
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $432
line 837
;837:  {
line 839
;838:    // modelName didn not include a skin name
;839:    Q_strncpyz(newInfo.skinName, "default", sizeof(newInfo.skinName));
ADDRLP4 4+224
ARGP4
ADDRGP4 $154
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 840
;840:  }
ADDRGP4 $433
JUMPV
LABELV $432
line 842
;841:  else
;842:  {
line 843
;843:    Q_strncpyz(newInfo.skinName, slash + 1, sizeof(newInfo.skinName));
ADDRLP4 4+224
ARGP4
ADDRLP4 1768
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 845
;844:    // truncate modelName
;845:    *slash = 0;
ADDRLP4 1768
INDIRP4
CNSTI1 0
ASGNI1
line 846
;846:  }
LABELV $433
line 851
;847:
;848:  //CG_Printf( "NCI: %s\n", v );
;849:
;850:  // head model
;851:  v = Info_ValueForKey(configstring, "hmodel");
ADDRLP4 1764
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 1864
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1864
INDIRP4
ASGNP4
line 852
;852:  Q_strncpyz(newInfo.headModelName, v, sizeof(newInfo.headModelName));
ADDRLP4 4+288
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 854
;853:
;854:  slash = strchr(newInfo.headModelName, '/');
ADDRLP4 4+288
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1868
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1768
ADDRLP4 1868
INDIRP4
ASGNP4
line 856
;855:
;856:  if (!slash)
ADDRLP4 1768
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
line 857
;857:  {
line 859
;858:    // modelName didn not include a skin name
;859:    Q_strncpyz(newInfo.headSkinName, "default", sizeof(newInfo.headSkinName));
ADDRLP4 4+352
ARGP4
ADDRGP4 $154
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 860
;860:  }
ADDRGP4 $443
JUMPV
LABELV $442
line 862
;861:  else
;862:  {
line 863
;863:    Q_strncpyz(newInfo.headSkinName, slash + 1, sizeof(newInfo.headSkinName));
ADDRLP4 4+352
ARGP4
ADDRLP4 1768
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 865
;864:    // truncate modelName
;865:    *slash = 0;
ADDRLP4 1768
INDIRP4
CNSTI1 0
ASGNI1
line 866
;866:  }
LABELV $443
line 869
;867:
;868:  // replace whatever was there with the new one
;869:  newInfo.infoValid = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 870
;870:  *ci = newInfo;
ADDRLP4 1772
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 1760
line 874
;871:
;872:  // scan for an existing clientinfo that matches this modelname
;873:  // so we can avoid loading checks if possible
;874:  if (!CG_ScanForExistingClientInfo(ci))
ADDRLP4 1772
INDIRP4
ARGP4
ADDRLP4 1872
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1872
INDIRI4
CNSTI4 0
NEI4 $448
line 875
;875:    CG_LoadClientInfo(ci);
ADDRLP4 1772
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
LABELV $448
line 876
;876:}
LABELV $399
endproc CG_NewClientInfo 1876 12
proc CG_SetLerpFrameAnimation 12 8
line 895
;877:
;878:/*
;879: =============================================================================
;880:
;881: PLAYER ANIMATION
;882:
;883: =============================================================================
;884: */
;885:
;886:/*
;887: ===============
;888: CG_SetLerpFrameAnimation
;889:
;890: may include ANIM_TOGGLEBIT
;891: ===============
;892: */
;893:static void
;894:CG_SetLerpFrameAnimation(clientInfo_t *ci, lerpFrame_t *lf, int newAnimation)
;895:{
line 898
;896:  animation_t *anim;
;897:
;898:  lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 899
;899:  newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 901
;900:
;901:  if (newAnimation < 0 || newAnimation >= MAX_PLAYER_TOTALANIMATIONS)
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $453
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $451
LABELV $453
line 902
;902:    CG_Error("Bad animation number: %i", newAnimation);
ADDRGP4 $454
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
LABELV $451
line 904
;903:
;904:  anim = &ci->animations[newAnimation];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDP4
ASGNP4
line 906
;905:
;906:  lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 907
;907:  lf->animationTime = lf->frameTime + anim->initialLerp;
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
line 909
;908:
;909:  if (cg_debugAnim.integer)
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $455
line 910
;910:    CG_Printf("Anim: %i\n", newAnimation);
ADDRGP4 $458
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $455
line 911
;911:}
LABELV $450
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunPlayerLerpFrame 60 12
line 923
;912:
;913:/*
;914: ===============
;915: CG_RunPlayerLerpFrame
;916:
;917: Sets cg.snap, cg.oldFrame, and cg.backlerp
;918: cg.time should be between oldFrameTime and frameTime after exit
;919: ===============
;920: */
;921:static void
;922:CG_RunPlayerLerpFrame(clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale)
;923:{
line 928
;924:  int f, numFrames;
;925:  animation_t *anim;
;926:
;927:  // debugging tool to get no animations
;928:  if (cg_animSpeed.integer == 0)
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $460
line 929
;929:  {
line 930
;930:    lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 931
;931:    return;
ADDRGP4 $459
JUMPV
LABELV $460
line 935
;932:  }
;933:
;934:  // see if the animation sequence is switching
;935:  if (newAnimation != lf->animationNumber || !lf->animation)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $465
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $463
LABELV $465
line 936
;936:  {
line 937
;937:    CG_SetLerpFrameAnimation(ci, lf, newAnimation);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 938
;938:  }
LABELV $463
line 942
;939:
;940:  // if we have passed the current frame, move it to
;941:  // oldFrame and calculate a new frame
;942:  if (cg.time >= lf->frameTime)
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $466
line 943
;943:  {
line 944
;944:    lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 945
;945:    lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 948
;946:
;947:    // get the next frame based on the animation
;948:    anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 949
;949:    if (!anim->frameLerp)
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $469
line 950
;950:      return; // shouldn't happen
ADDRGP4 $459
JUMPV
LABELV $469
line 952
;951:
;952:    if (cg.time < lf->animationTime)
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $471
line 953
;953:      lf->frameTime = lf->animationTime; // initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $471
line 955
;954:    else
;955:      lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 12
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $472
line 957
;956:
;957:    f = (lf->frameTime - lf->animationTime) / anim->frameLerp;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 958
;958:    f *= speedScale; // adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 959
;959:    numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 961
;960:
;961:    if (anim->flipflop)
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $474
line 962
;962:      numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $474
line 964
;963:
;964:    if (f >= numFrames)
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $476
line 965
;965:    {
line 966
;966:      f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 967
;967:      if (anim->loopFrames)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $478
line 968
;968:      {
line 969
;969:        f %= anim->loopFrames;
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
line 970
;970:        f += anim->numFrames - anim->loopFrames;
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
line 971
;971:      }
ADDRGP4 $479
JUMPV
LABELV $478
line 973
;972:      else
;973:      {
line 974
;974:        f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 977
;975:        // the animation is stuck at the end, so it
;976:        // can immediately transition to another sequence
;977:        lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 978
;978:      }
LABELV $479
line 979
;979:    }
LABELV $476
line 981
;980:
;981:    if (anim->reversed)
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $481
line 982
;982:      lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $482
JUMPV
LABELV $481
line 983
;983:    else if (anim->flipflop && f >= anim->numFrames)
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $483
line 984
;984:      lf->frame = anim->firstFrame + anim->numFrames - 1 - (f % anim->numFrames);
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
MODI4
SUBI4
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $483
line 986
;985:    else
;986:      lf->frame = anim->firstFrame + f;
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
LABELV $484
LABELV $482
line 988
;987:
;988:    if (cg.time > lf->frameTime)
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $485
line 989
;989:    {
line 990
;990:      lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 992
;991:
;992:      if (cg_debugAnim.integer)
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $489
line 993
;993:        CG_Printf("Clamp lf->frameTime\n");
ADDRGP4 $492
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $489
line 994
;994:    }
LABELV $485
line 995
;995:  }
LABELV $466
line 997
;996:
;997:  if (lf->frameTime > cg.time + 200)
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $493
line 998
;998:    lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $493
line 1000
;999:
;1000:  if (lf->oldFrameTime > cg.time)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $497
line 1001
;1001:    lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $497
line 1004
;1002:
;1003:  // calculate current lerp value
;1004:  if (lf->frameTime == lf->oldFrameTime)
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $501
line 1005
;1005:    lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $502
JUMPV
LABELV $501
line 1007
;1006:  else
;1007:    lf->backlerp = 1.0 - (float) (cg.time - lf->oldFrameTime) / (lf->frameTime - lf->oldFrameTime);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
LABELV $502
line 1008
;1008:}
LABELV $459
endproc CG_RunPlayerLerpFrame 60 12
proc CG_ClearLerpFrame 16 12
line 1017
;1009:
;1010:/*
;1011: ===============
;1012: CG_ClearLerpFrame
;1013: ===============
;1014: */
;1015:static void
;1016:CG_ClearLerpFrame(clientInfo_t *ci, lerpFrame_t *lf, int animationNumber)
;1017:{
line 1018
;1018:  lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1019
;1019:  CG_SetLerpFrameAnimation(ci, lf, animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1020
;1020:  lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1021
;1021:}
LABELV $504
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 24 16
line 1030
;1022:
;1023:/*
;1024: ===============
;1025: CG_PlayerAnimation
;1026: ===============
;1027: */
;1028:static void
;1029:CG_PlayerAnimation(centity_t *cent, int *legsOld, int *legs, float *legsBackLerp, int *torsoOld, int *torso, float *torsoBackLerp)
;1030:{
line 1033
;1031:  clientInfo_t *ci;
;1032:  int clientNum;
;1033:  float speedScale = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1035
;1034:
;1035:  clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1037
;1036:
;1037:  if (cg_noPlayerAnims.integer)
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $507
line 1038
;1038:  {
line 1039
;1039:    *legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1040
;1040:    return;
ADDRGP4 $506
JUMPV
LABELV $507
line 1043
;1041:  }
;1042:
;1043:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 0
CNSTI4 1760
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 1046
;1044:
;1045:  // do the shuffle turn frames locally
;1046:  if (cent->pe.legs.yawing && (cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) == LEGS_IDLE)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $511
line 1047
;1047:    CG_RunPlayerLerpFrame(ci, &cent->pe.legs, LEGS_TURN, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
ADDRGP4 $512
JUMPV
LABELV $511
line 1049
;1048:  else
;1049:    CG_RunPlayerLerpFrame(ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
LABELV $512
line 1051
;1050:
;1051:  *legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1052
;1052:  *legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1053
;1053:  *legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 1055
;1054:
;1055:  CG_RunPlayerLerpFrame(ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
line 1057
;1056:
;1057:  *torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1058
;1058:  *torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 1059
;1059:  *torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1060
;1060:}
LABELV $506
endproc CG_PlayerAnimation 24 16
proc CG_PlayerNonSegAnimation 24 16
line 1069
;1061:
;1062:/*
;1063: ===============
;1064: CG_PlayerNonSegAnimation
;1065: ===============
;1066: */
;1067:static void
;1068:CG_PlayerNonSegAnimation(centity_t *cent, int *nonSegOld, int *nonSeg, float *nonSegBackLerp)
;1069:{
line 1072
;1070:  clientInfo_t *ci;
;1071:  int clientNum;
;1072:  float speedScale = 1.0f;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1074
;1073:
;1074:  clientNum = cent->currentState.clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1076
;1075:
;1076:  if (cg_noPlayerAnims.integer)
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $514
line 1077
;1077:  {
line 1078
;1078:    *nonSegOld = *nonSeg = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1079
;1079:    return;
ADDRGP4 $513
JUMPV
LABELV $514
line 1082
;1080:  }
;1081:
;1082:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 0
CNSTI4 1760
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 1085
;1083:
;1084:  // do the shuffle turn frames locally
;1085:  if (cent->pe.nonseg.yawing && (cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) == NSPA_STAND)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $518
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $518
line 1086
;1086:    CG_RunPlayerLerpFrame(ci, &cent->pe.nonseg, NSPA_TURN, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ARGP4
CNSTI4 15
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
ADDRGP4 $519
JUMPV
LABELV $518
line 1088
;1087:  else
;1088:    CG_RunPlayerLerpFrame(ci, &cent->pe.nonseg, cent->currentState.legsAnim, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 604
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
LABELV $519
line 1090
;1089:
;1090:  *nonSegOld = cent->pe.nonseg.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 1091
;1091:  *nonSeg = cent->pe.nonseg.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ASGNI4
line 1092
;1092:  *nonSegBackLerp = cent->pe.nonseg.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ASGNF4
line 1093
;1093:}
LABELV $513
endproc CG_PlayerNonSegAnimation 24 16
proc CG_SwingAngles 32 8
line 1110
;1094:
;1095:/*
;1096: =============================================================================
;1097:
;1098: PLAYER ANGLES
;1099:
;1100: =============================================================================
;1101: */
;1102:
;1103:/*
;1104: ==================
;1105: CG_SwingAngles
;1106: ==================
;1107: */
;1108:static void
;1109:CG_SwingAngles(float destination, float swingTolerance, float clampTolerance, float speed, float *angle, qboolean *swinging)
;1110:{
line 1115
;1111:  float swing;
;1112:  float move;
;1113:  float scale;
;1114:
;1115:  if (!*swinging)
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $521
line 1116
;1116:  {
line 1118
;1117:    // see if a swing should be started
;1118:    swing = AngleSubtract(*angle, destination);
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
line 1120
;1119:
;1120:    if (swing > swingTolerance || swing < -swingTolerance)
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $525
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $523
LABELV $525
line 1121
;1121:      *swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
LABELV $523
line 1122
;1122:  }
LABELV $521
line 1124
;1123:
;1124:  if (!*swinging)
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $526
line 1125
;1125:    return;
ADDRGP4 $520
JUMPV
LABELV $526
line 1129
;1126:
;1127:  // modify the speed depending on the delta
;1128:  // so it doesn't seem so linear
;1129:  swing = AngleSubtract(destination, *angle);
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
line 1130
;1130:  scale = fabs(swing);
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
line 1132
;1131:
;1132:  if (scale < swingTolerance * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $528
line 1133
;1133:    scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
ADDRGP4 $529
JUMPV
LABELV $528
line 1134
;1134:  else if (scale < swingTolerance)
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $530
line 1135
;1135:    scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $531
JUMPV
LABELV $530
line 1137
;1136:  else
;1137:    scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
LABELV $531
LABELV $529
line 1140
;1138:
;1139:  // swing towards the destination angle
;1140:  if (swing >= 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $532
line 1141
;1141:  {
line 1142
;1142:    move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1144
;1143:
;1144:    if (move >= swing)
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $535
line 1145
;1145:    {
line 1146
;1146:      move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1147
;1147:      *swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1148
;1148:    }
LABELV $535
line 1149
;1149:    *angle = AngleMod(*angle + move);
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
line 1150
;1150:  }
ADDRGP4 $533
JUMPV
LABELV $532
line 1151
;1151:  else if (swing < 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $537
line 1152
;1152:  {
line 1153
;1153:    move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+107600
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
line 1155
;1154:
;1155:    if (move <= swing)
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $540
line 1156
;1156:    {
line 1157
;1157:      move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1158
;1158:      *swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1159
;1159:    }
LABELV $540
line 1160
;1160:    *angle = AngleMod(*angle + move);
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
line 1161
;1161:  }
LABELV $537
LABELV $533
line 1164
;1162:
;1163:  // clamp to no more than tolerance
;1164:  swing = AngleSubtract(destination, *angle);
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
line 1165
;1165:  if (swing > clampTolerance)
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $542
line 1166
;1166:    *angle = AngleMod(destination - (clampTolerance - 1));
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
ADDRGP4 $543
JUMPV
LABELV $542
line 1167
;1167:  else if (swing < -clampTolerance)
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $544
line 1168
;1168:    *angle = AngleMod(destination + (clampTolerance - 1));
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 28
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
LABELV $544
LABELV $543
line 1169
;1169:}
LABELV $520
endproc CG_SwingAngles 32 8
proc CG_AddPainTwitch 16 0
line 1178
;1170:
;1171:/*
;1172: =================
;1173: CG_AddPainTwitch
;1174: =================
;1175: */
;1176:static void
;1177:CG_AddPainTwitch(centity_t *cent, vec3_t torsoAngles)
;1178:{
line 1182
;1179:  int t;
;1180:  float f;
;1181:
;1182:  t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1184
;1183:
;1184:  if (t >= PAIN_TWITCH_TIME)
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $548
line 1185
;1185:    return;
ADDRGP4 $546
JUMPV
LABELV $548
line 1187
;1186:
;1187:  f = 1.0 - (float) t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1189
;1188:
;1189:  if (cent->pe.painDirection)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $550
line 1190
;1190:    torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $551
JUMPV
LABELV $550
line 1192
;1191:  else
;1192:    torsoAngles[ROLL] -= 20 * f;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
LABELV $551
line 1193
;1193:}
LABELV $546
endproc CG_AddPainTwitch 16 0
data
align 4
LABELV $553
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 140 24
line 1211
;1194:
;1195:/*
;1196: ===============
;1197: CG_PlayerAngles
;1198:
;1199: Handles seperate torso motion
;1200:
;1201: legs pivot based on direction of movement
;1202:
;1203: head always looks exactly at cent->lerpAngles
;1204:
;1205: if motion < 20 degrees, show in head only
;1206: if < 45 degrees, also show in torso
;1207: ===============
;1208: */
;1209:static void
;1210:CG_PlayerAngles(centity_t *cent, vec3_t srcAngles, vec3_t legs[3], vec3_t torso[3], vec3_t head[3])
;1211:{
line 1221
;1212:  vec3_t legsAngles, torsoAngles, headAngles;
;1213:  float dest;
;1214:  static int movementOffsets[8] =
;1215:  { 0, 22, 45, -22, 0, 22, -45, -22 };
;1216:  vec3_t velocity;
;1217:  float speed;
;1218:  int dir, clientNum;
;1219:  clientInfo_t *ci;
;1220:
;1221:  VectorCopy( srcAngles, headAngles );
ADDRLP4 24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1222
;1222:  headAngles[YAW] = AngleMod(headAngles[YAW]);
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1223
;1223:  VectorClear( legsAngles );
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 72
INDIRF4
ASGNF4
line 1224
;1224:  VectorClear( torsoAngles );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRF4
ASGNF4
line 1229
;1225:
;1226:  // --------- yaw -------------
;1227:
;1228:  // allow yaw to drift a bit
;1229:  if ((cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) != LEGS_IDLE || (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND)
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 -129
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 22
NEI4 $562
ADDRLP4 80
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 11
EQI4 $560
LABELV $562
line 1230
;1230:  {
line 1232
;1231:    // if not standing still, always point all in the same direction
;1232:    cent->pe.torso.yawing = qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1233
;1233:    cent->pe.torso.pitching = qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1234
;1234:    cent->pe.legs.yawing = qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 1235
;1235:  }
LABELV $560
line 1238
;1236:
;1237:  // adjust legs for movement dir
;1238:  if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $563
line 1239
;1239:  {
line 1241
;1240:    // don't let dead bodies twitch
;1241:    dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1242
;1242:  }
ADDRGP4 $564
JUMPV
LABELV $563
line 1244
;1243:  else
;1244:  {
line 1246
;1245:    //TA: did use angles2.. now uses time2.. looks a bit funny but time2 isn't used othwise
;1246:    dir = cent->currentState.time2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
line 1247
;1247:    if (dir < 0 || dir > 7)
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $567
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $565
LABELV $567
line 1248
;1248:      CG_Error("Bad player movement angle");
ADDRGP4 $568
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $565
line 1249
;1249:  }
LABELV $564
line 1251
;1250:
;1251:  legsAngles[YAW] = headAngles[YAW] + movementOffsets[dir];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $553
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1252
;1252:  torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[dir];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $553
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1255
;1253:
;1254:  // torso
;1255:  if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $573
line 1256
;1256:  {
line 1257
;1257:    CG_SwingAngles(torsoAngles[YAW], 0, 0, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing);
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1258
;1258:    CG_SwingAngles(legsAngles[YAW], 0, 0, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing);
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1259
;1259:  }
ADDRGP4 $574
JUMPV
LABELV $573
line 1261
;1260:  else
;1261:  {
line 1262
;1262:    CG_SwingAngles(torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing);
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1263
;1263:    CG_SwingAngles(legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing);
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1264
;1264:  }
LABELV $574
line 1266
;1265:
;1266:  torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1267
;1267:  legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ASGNF4
line 1272
;1268:
;1269:  // --------- pitch -------------
;1270:
;1271:  // only show a fraction of the pitch angle in the torso
;1272:  if (headAngles[PITCH] > 180)
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $585
line 1273
;1273:    dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
ADDRGP4 $586
JUMPV
LABELV $585
line 1275
;1274:  else
;1275:    dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
LABELV $586
line 1277
;1276:
;1277:  CG_SwingAngles(dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching);
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1278
;1278:  torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
line 1281
;1279:
;1280:  //
;1281:  clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1283
;1282:
;1283:  if (clientNum >= 0 && clientNum < MAX_CLIENTS)
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $587
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $587
line 1284
;1284:  {
line 1285
;1285:    ci = &cgs.clientinfo[clientNum];
ADDRLP4 64
CNSTI4 1760
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 1286
;1286:    if (ci->fixedtorso)
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $590
line 1287
;1287:      torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
LABELV $590
line 1288
;1288:  }
LABELV $587
line 1294
;1289:
;1290:  // --------- roll -------------
;1291:
;1292:
;1293:  // lean towards the direction of travel
;1294:  VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1295
;1295:  speed = VectorNormalize(velocity);
ADDRLP4 40
ARGP4
ADDRLP4 96
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 96
INDIRF4
ASGNF4
line 1297
;1296:
;1297:  if (speed)
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $592
line 1298
;1298:  {
line 1302
;1299:    vec3_t axis[3];
;1300:    float side;
;1301:
;1302:    speed *= 0.05f;
ADDRLP4 56
CNSTF4 1028443341
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 1304
;1303:
;1304:    AnglesToAxis(legsAngles, axis);
ADDRLP4 12
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1305
;1305:    side = speed * DotProduct( velocity, axis[ 1 ] );
ADDRLP4 136
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 100+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 100+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 100+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1306
;1306:    legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 136
INDIRF4
SUBF4
ASGNF4
line 1308
;1307:
;1308:    side = speed * DotProduct( velocity, axis[ 0 ] );
ADDRLP4 136
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 100+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 100+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1309
;1309:    legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 136
INDIRF4
ADDF4
ASGNF4
line 1310
;1310:  }
LABELV $592
line 1313
;1311:
;1312:  //
;1313:  clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1315
;1314:
;1315:  if (clientNum >= 0 && clientNum < MAX_CLIENTS)
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $606
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $606
line 1316
;1316:  {
line 1317
;1317:    ci = &cgs.clientinfo[clientNum];
ADDRLP4 64
CNSTI4 1760
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 1319
;1318:
;1319:    if (ci->fixedlegs)
ADDRLP4 64
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $609
line 1320
;1320:    {
line 1321
;1321:      legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1322
;1322:      legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1323
;1323:      legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1324
;1324:    }
LABELV $609
line 1325
;1325:  }
LABELV $606
line 1328
;1326:
;1327:  // pain twitch
;1328:  CG_AddPainTwitch(cent, torsoAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1331
;1329:
;1330:  // pull the angles back out of the hierarchial chain
;1331:  AnglesSubtract(headAngles, torsoAngles, headAngles);
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1332
;1332:  AnglesSubtract(torsoAngles, legsAngles, torsoAngles);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1333
;1333:  AnglesToAxis(legsAngles, legs);
ADDRLP4 12
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1334
;1334:  AnglesToAxis(torsoAngles, torso);
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1335
;1335:  AnglesToAxis(headAngles, head);
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1336
;1336:}
LABELV $552
endproc CG_PlayerAngles 140 24
lit
align 4
LABELV $615
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $616
byte 4 0
byte 4 0
byte 4 3212836864
code
proc CG_PlayerWWSmoothing 212 16
line 1349
;1337:
;1338:#define MODEL_WWSMOOTHTIME 200
;1339:
;1340:/*
;1341: ===============
;1342: CG_PlayerWWSmoothing
;1343:
;1344: Smooth the angles of transitioning wall walkers
;1345: ===============
;1346: */
;1347:static void
;1348:CG_PlayerWWSmoothing(centity_t *cent, vec3_t in[3], vec3_t out[3])
;1349:{
line 1350
;1350:  entityState_t *es = &cent->currentState;
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
line 1354
;1351:  int i;
;1352:  vec3_t surfNormal, rotAxis, temp;
;1353:  vec3_t refNormal =
;1354:  { 0.0f, 0.0f, 1.0f };
ADDRLP4 164
ADDRGP4 $615
INDIRB
ASGNB 12
line 1356
;1355:  vec3_t ceilingNormal =
;1356:  { 0.0f, 0.0f, -1.0f };
ADDRLP4 176
ADDRGP4 $616
INDIRB
ASGNB 12
line 1361
;1357:  float stLocal, sFraction, rotAngle;
;1358:  vec3_t inAxis[3], lastAxis[3], outAxis[3];
;1359:
;1360:  //set surfNormal
;1361:  if (!(es->eFlags & EF_WALLCLIMB))
ADDRLP4 136
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $617
line 1362
;1362:    VectorCopy( refNormal, surfNormal );
ADDRLP4 140
ADDRLP4 164
INDIRB
ASGNB 12
ADDRGP4 $618
JUMPV
LABELV $617
line 1363
;1363:  else if (!(es->eFlags & EF_WALLCLIMBCEILING))
ADDRLP4 136
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $619
line 1364
;1364:    VectorCopy( es->angles2, surfNormal );
ADDRLP4 140
ADDRLP4 136
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
ADDRGP4 $620
JUMPV
LABELV $619
line 1365
;1365:else    VectorCopy( ceilingNormal, surfNormal );
ADDRLP4 140
ADDRLP4 176
INDIRB
ASGNB 12
LABELV $620
LABELV $618
line 1367
;1366:
;1367:    AxisCopy( in, inAxis );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1369
;1368:
;1369:    if( !VectorCompare( surfNormal, cent->pe.lastNormal ) )
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRLP4 188
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $621
line 1370
;1370:    {
line 1373
;1371:      //if we moving from the ceiling to the floor special case
;1372:      //( x product of colinear vectors is undefined)
;1373:      if( VectorCompare( ceilingNormal, cent->pe.lastNormal ) &&
ADDRLP4 176
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $623
ADDRLP4 164
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 196
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $623
line 1375
;1374:          VectorCompare( refNormal, surfNormal ) )
;1375:      {
line 1376
;1376:        VectorCopy( in[ 1 ], rotAxis );
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1377
;1377:        rotAngle = 180.0f;
ADDRLP4 96
CNSTF4 1127481344
ASGNF4
line 1378
;1378:      }
ADDRGP4 $624
JUMPV
LABELV $623
line 1380
;1379:      else
;1380:      {
line 1381
;1381:        AxisCopy( cent->pe.lastAxis, lastAxis );
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1382
;1382:        rotAngle = DotProduct( inAxis[ 0 ], lastAxis[ 0 ] ) +
ADDRLP4 96
ADDRLP4 4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 100+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 100+8
INDIRF4
MULF4
ADDF4
ADDRLP4 4+12
INDIRF4
ADDRLP4 100+12
INDIRF4
MULF4
ADDRLP4 4+12+4
INDIRF4
ADDRLP4 100+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+12+8
INDIRF4
ADDRLP4 100+12+8
INDIRF4
MULF4
ADDF4
ADDF4
ADDRLP4 4+24
INDIRF4
ADDRLP4 100+24
INDIRF4
MULF4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 100+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+24+8
INDIRF4
ADDRLP4 100+24+8
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 1386
;1383:        DotProduct( inAxis[ 1 ], lastAxis[ 1 ] ) +
;1384:        DotProduct( inAxis[ 2 ], lastAxis[ 2 ] );
;1385:
;1386:        rotAngle = RAD2DEG( acos( ( rotAngle - 1.0f ) / 2.0f ) );
ADDRLP4 96
INDIRF4
CNSTF4 1065353216
SUBF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 200
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 96
CNSTF4 1127481344
ADDRLP4 200
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1388
;1387:
;1388:        CrossProduct( lastAxis[ 0 ], inAxis[ 0 ], temp );
ADDRLP4 100
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1389
;1389:        VectorCopy( temp, rotAxis );
ADDRLP4 84
ADDRLP4 152
INDIRB
ASGNB 12
line 1390
;1390:        CrossProduct( lastAxis[ 1 ], inAxis[ 1 ], temp );
ADDRLP4 100+12
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1391
;1391:        VectorAdd( rotAxis, temp, rotAxis );
ADDRLP4 84
ADDRLP4 84
INDIRF4
ADDRLP4 152
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 152+8
INDIRF4
ADDF4
ASGNF4
line 1392
;1392:        CrossProduct( lastAxis[ 2 ], inAxis[ 2 ], temp );
ADDRLP4 100+24
ARGP4
ADDRLP4 4+24
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1393
;1393:        VectorAdd( rotAxis, temp, rotAxis );
ADDRLP4 84
ADDRLP4 84
INDIRF4
ADDRLP4 152
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 152+8
INDIRF4
ADDF4
ASGNF4
line 1395
;1394:
;1395:        VectorNormalize( rotAxis );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1396
;1396:      }
LABELV $624
line 1399
;1397:
;1398:      //iterate through smooth array
;1399:      for( i = 0; i < MAXSMOOTHS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $665
line 1400
;1400:      {
line 1402
;1401:        //found an unused index in the smooth array
;1402:        if( cent->pe.sList[ i ].time + MODEL_WWSMOOTHTIME < cg.time )
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRF4
CNSTF4 1128792064
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
GEF4 $669
line 1403
;1403:        {
line 1405
;1404:          //copy to array and stop
;1405:          VectorCopy( rotAxis, cent->pe.sList[ i ].rotAxis );
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 84
INDIRB
ASGNB 12
line 1406
;1406:          cent->pe.sList[ i ].rotAngle = rotAngle;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 96
INDIRF4
ASGNF4
line 1407
;1407:          cent->pe.sList[ i ].time = cg.time;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ASGNF4
line 1408
;1408:          break;
ADDRGP4 $667
JUMPV
LABELV $669
line 1410
;1409:        }
;1410:      }
LABELV $666
line 1399
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $665
LABELV $667
line 1411
;1411:    }
LABELV $621
line 1414
;1412:
;1413:    //iterate through ops
;1414:    for( i = MAXSMOOTHS - 1; i >= 0; i-- )
ADDRLP4 0
CNSTI4 31
ASGNI4
LABELV $673
line 1415
;1415:    {
line 1417
;1416:      //if this op has time remaining, perform it
;1417:      if( cg.time < cent->pe.sList[ i ].time + MODEL_WWSMOOTHTIME )
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRF4
CNSTF4 1128792064
ADDF4
GEF4 $677
line 1418
;1418:      {
line 1419
;1419:        stLocal = 1.0f - ( ( ( cent->pe.sList[ i ].time + MODEL_WWSMOOTHTIME ) - cg.time ) / MODEL_WWSMOOTHTIME );
ADDRLP4 192
CNSTF4 1128792064
ASGNF4
ADDRLP4 80
CNSTF4 1065353216
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRF4
ADDRLP4 192
INDIRF4
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 192
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1420
;1420:        sFraction = -( cos( stLocal * M_PI ) + 1.0f ) / 2.0f;
CNSTF4 1078530011
ADDRLP4 80
INDIRF4
MULF4
ARGF4
ADDRLP4 196
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 196
INDIRF4
CNSTF4 1065353216
ADDF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1422
;1421:
;1422:        RotatePointAroundVector( outAxis[ 0 ], cent->pe.sList[ i ].rotAxis,
ADDRLP4 44
ARGP4
ADDRLP4 200
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1424
;1423:            inAxis[ 0 ], sFraction * cent->pe.sList[ i ].rotAngle );
;1424:        RotatePointAroundVector( outAxis[ 1 ], cent->pe.sList[ i ].rotAxis,
ADDRLP4 44+12
ARGP4
ADDRLP4 204
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 40
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1426
;1425:            inAxis[ 1 ], sFraction * cent->pe.sList[ i ].rotAngle );
;1426:        RotatePointAroundVector( outAxis[ 2 ], cent->pe.sList[ i ].rotAxis,
ADDRLP4 44+24
ARGP4
ADDRLP4 208
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4+24
ARGP4
ADDRLP4 40
INDIRF4
ADDRLP4 208
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 1429
;1427:            inAxis[ 2 ], sFraction * cent->pe.sList[ i ].rotAngle );
;1428:
;1429:        AxisCopy( outAxis, inAxis );
ADDRLP4 44
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1430
;1430:      }
LABELV $677
line 1431
;1431:    }
LABELV $674
line 1414
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $673
line 1434
;1432:
;1433:    //outAxis has been copied to inAxis
;1434:    AxisCopy( inAxis, out );
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1435
;1435:  }
LABELV $614
endproc CG_PlayerWWSmoothing 212 16
lit
align 4
LABELV $686
byte 4 0
byte 4 0
byte 4 3212836864
code
proc CG_PlayerNonSegAngles 112 24
line 1446
;1436:
;1437:  /*
;1438:   ===============
;1439:   CG_PlayerNonSegAngles
;1440:
;1441:   Resolve angles for non-segmented models
;1442:   ===============
;1443:   */
;1444:static void
;1445:CG_PlayerNonSegAngles(centity_t *cent, vec3_t srcAngles, vec3_t nonSegAxis[3])
;1446:{
line 1451
;1447:  vec3_t localAngles;
;1448:  vec3_t velocity;
;1449:  float speed;
;1450:  int dir;
;1451:  entityState_t *es = &cent->currentState;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
line 1454
;1452:  vec3_t surfNormal;
;1453:  vec3_t ceilingNormal =
;1454:  { 0.0f, 0.0f, -1.0f };
ADDRLP4 48
ADDRGP4 $686
INDIRB
ASGNB 12
line 1456
;1455:
;1456:  VectorCopy( srcAngles, localAngles );
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1457
;1457:  localAngles[YAW] = AngleMod(localAngles[YAW]);
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
line 1458
;1458:  localAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1459
;1459:  localAngles[ROLL] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1462
;1460:
;1461:  //set surfNormal
;1462:  if (!(es->eFlags & EF_WALLCLIMBCEILING))
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $690
line 1463
;1463:    VectorCopy( es->angles2, surfNormal );
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
ADDRGP4 $691
JUMPV
LABELV $690
line 1464
;1464:else    VectorCopy( ceilingNormal, surfNormal );
ADDRLP4 36
ADDRLP4 48
INDIRB
ASGNB 12
LABELV $691
line 1467
;1465:
;1466:    //make sure that WW transitions don't cause the swing stuff to go nuts
;1467:    if( !VectorCompare( surfNormal, cent->pe.lastNormal ) )
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $692
line 1468
;1468:    {
line 1470
;1469:      //stop CG_SwingAngles having an eppy
;1470:      cent->pe.nonseg.yawAngle = localAngles[ YAW ];
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1471
;1471:      cent->pe.nonseg.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 1472
;1472:    }
LABELV $692
line 1477
;1473:
;1474:    // --------- yaw -------------
;1475:
;1476:    // allow yaw to drift a bit
;1477:    if( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != NSPA_STAND )
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 0
EQI4 $695
line 1478
;1478:    {
line 1480
;1479:      // if not standing still, always point all in the same direction
;1480:      cent->pe.nonseg.yawing = qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 1
ASGNI4
line 1481
;1481:    }
LABELV $695
line 1484
;1482:
;1483:    // adjust legs for movement dir
;1484:    if( cent->currentState.eFlags & EF_DEAD )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $697
line 1485
;1485:    {
line 1487
;1486:      // don't let dead bodies twitch
;1487:      dir = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1488
;1488:    }
ADDRGP4 $698
JUMPV
LABELV $697
line 1490
;1489:    else
;1490:    {
line 1492
;1491:      //TA: did use angles2.. now uses time2.. looks a bit funny but time2 isn't used othwise
;1492:      dir = cent->currentState.time2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
line 1493
;1493:      if( dir < 0 || dir > 7 )
ADDRLP4 68
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $701
ADDRLP4 68
INDIRI4
CNSTI4 7
LEI4 $699
LABELV $701
line 1494
;1494:      CG_Error( "Bad player movement angle" );
ADDRGP4 $568
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $699
line 1495
;1495:    }
LABELV $698
line 1498
;1496:
;1497:    // torso
;1498:    if( cent->currentState.eFlags & EF_DEAD )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $702
line 1499
;1499:    {
line 1500
;1500:      CG_SwingAngles( localAngles[ YAW ], 0, 0, cg_swingSpeed.value,
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 628
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1502
;1501:          &cent->pe.nonseg.yawAngle, &cent->pe.nonseg.yawing );
;1502:    }
ADDRGP4 $703
JUMPV
LABELV $702
line 1504
;1503:    else
;1504:    {
line 1505
;1505:      CG_SwingAngles( localAngles[ YAW ], 40, 90, cg_swingSpeed.value,
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 628
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1507
;1506:          &cent->pe.nonseg.yawAngle, &cent->pe.nonseg.yawing );
;1507:    }
LABELV $703
line 1509
;1508:
;1509:    localAngles[ YAW ] = cent->pe.nonseg.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 1520
;1510:
;1511:    // --------- pitch -------------
;1512:
;1513:    //NO PITCH!
;1514:
;1515:
;1516:    // --------- roll -------------
;1517:
;1518:
;1519:    // lean towards the direction of travel
;1520:    VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1521
;1521:    speed = VectorNormalize( velocity );
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 68
INDIRF4
ASGNF4
line 1523
;1522:
;1523:    if( speed )
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $709
line 1524
;1524:    {
line 1529
;1525:      vec3_t axis[ 3 ];
;1526:      float side;
;1527:
;1528:      //much less than with the regular model system
;1529:      speed *= 0.01f;
ADDRLP4 24
CNSTF4 1008981770
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1531
;1530:
;1531:      AnglesToAxis( localAngles, axis );
ADDRLP4 0
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1532
;1532:      side = speed * DotProduct( velocity, axis[ 1 ] );
ADDRLP4 108
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 72+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 72+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 72+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1533
;1533:      localAngles[ ROLL ] -= side;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
SUBF4
ASGNF4
line 1535
;1534:
;1535:      side = speed * DotProduct( velocity, axis[ 0 ] );
ADDRLP4 108
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1536
;1536:      localAngles[ PITCH ] += side;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDF4
ASGNF4
line 1537
;1537:    }
LABELV $709
line 1543
;1538:
;1539:    //FIXME: PAIN[123] animations?
;1540:    // pain twitch
;1541:    //CG_AddPainTwitch( cent, torsoAngles );
;1542:
;1543:    AnglesToAxis( localAngles, nonSegAxis );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1544
;1544:  }
LABELV $685
endproc CG_PlayerNonSegAngles 112 24
lit
align 4
LABELV $738
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_PlayerUpgrades 548 44
line 1555
;1545:
;1546:  //==========================================================================
;1547:
;1548:  /*
;1549:   ===============
;1550:   CG_PlayerUpgrade
;1551:   ===============
;1552:   */
;1553:static void
;1554:CG_PlayerUpgrades(centity_t *cent, refEntity_t *torso)
;1555:{
line 1560
;1556:  int held, active;
;1557:  refEntity_t jetpack;
;1558:  refEntity_t battpack;
;1559:  refEntity_t flash;
;1560:  entityState_t *es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1562
;1561:
;1562:  held = es->modelindex;
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1563
;1563:  active = es->modelindex2;
ADDRLP4 148
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1656
;1564:
;1565:  /*if( held & ( 1 << UP_JETPACK ) )
;1566:   {
;1567:   memset( &jetpack, 0, sizeof( jetpack ) );
;1568:   VectorCopy( torso->lightingOrigin, jetpack.lightingOrigin );
;1569:   jetpack.shadowPlane = torso->shadowPlane;
;1570:   jetpack.renderfx = torso->renderfx;
;1571:
;1572:   jetpack.hModel = cgs.media.jetpackModel;
;1573:
;1574:   //identity matrix
;1575:   AxisCopy( axisDefault, jetpack.axis );
;1576:
;1577:   //FIXME: change to tag_back when it exists
;1578:   CG_PositionRotatedEntityOnTag( &jetpack, torso, torso->hModel, "tag_head" );
;1579:
;1580:   trap_R_AddRefEntityToScene( &jetpack );
;1581:
;1582:   if( active & ( 1 << UP_JETPACK ) )
;1583:   {
;1584:   if( es->pos.trDelta[ 2 ] > 10.0f )
;1585:   {
;1586:   if( cent->jetPackState != JPS_ASCENDING )
;1587:   {
;1588:   if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
;1589:   CG_DestroyParticleSystem( &cent->jetPackPS );
;1590:
;1591:   cent->jetPackPS = CG_SpawnNewParticleSystem( cgs.media.jetPackAscendPS );
;1592:   cent->jetPackState = JPS_ASCENDING;
;1593:   }
;1594:
;1595:   trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin,
;1596:   vec3_origin, cgs.media.jetpackAscendSound );
;1597:   }
;1598:   else if( es->pos.trDelta[ 2 ] < -10.0f )
;1599:   {
;1600:   if( cent->jetPackState != JPS_DESCENDING )
;1601:   {
;1602:   if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
;1603:   CG_DestroyParticleSystem( &cent->jetPackPS );
;1604:
;1605:   cent->jetPackPS = CG_SpawnNewParticleSystem( cgs.media.jetPackDescendPS );
;1606:   cent->jetPackState = JPS_DESCENDING;
;1607:   }
;1608:
;1609:   trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin,
;1610:   vec3_origin, cgs.media.jetpackDescendSound );
;1611:   }
;1612:   else
;1613:   {
;1614:   if( cent->jetPackState != JPS_HOVERING )
;1615:   {
;1616:   if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
;1617:   CG_DestroyParticleSystem( &cent->jetPackPS );
;1618:
;1619:   cent->jetPackPS = CG_SpawnNewParticleSystem( cgs.media.jetPackHoverPS );
;1620:   cent->jetPackState = JPS_HOVERING;
;1621:   }
;1622:
;1623:   trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin,
;1624:   vec3_origin, cgs.media.jetpackIdleSound );
;1625:   }
;1626:
;1627:   memset( &flash, 0, sizeof( flash ) );
;1628:   VectorCopy( torso->lightingOrigin, flash.lightingOrigin );
;1629:   flash.shadowPlane = torso->shadowPlane;
;1630:   flash.renderfx = torso->renderfx;
;1631:
;1632:   flash.hModel = cgs.media.jetpackFlashModel;
;1633:   if( !flash.hModel )
;1634:   return;
;1635:
;1636:   AxisCopy( axisDefault, flash.axis );
;1637:
;1638:   CG_PositionRotatedEntityOnTag( &flash, &jetpack, jetpack.hModel, "tag_flash" );
;1639:   trap_R_AddRefEntityToScene( &flash );
;1640:
;1641:   if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
;1642:   {
;1643:   CG_SetAttachmentTag( &cent->jetPackPS->attachment,
;1644:   jetpack, jetpack.hModel, "tag_flash" );
;1645:   CG_SetAttachmentCent( &cent->jetPackPS->attachment, cent );
;1646:   CG_AttachToTag( &cent->jetPackPS->attachment );
;1647:   }
;1648:   }
;1649:   else if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
;1650:   {
;1651:   CG_DestroyParticleSystem( &cent->jetPackPS );
;1652:   cent->jetPackState = JPS_OFF;
;1653:   }
;1654:   }
;1655:   else*/
;1656:  if (CG_IsParticleSystemValid(&cent->jetPackPS))
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ARGP4
ADDRLP4 432
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $724
line 1657
;1657:  {
line 1658
;1658:    CG_DestroyParticleSystem(&cent->jetPackPS);
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
line 1659
;1659:    cent->jetPackState = JPS_OFF;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTI4 0
ASGNI4
line 1660
;1660:  }
LABELV $724
line 1662
;1661:
;1662:  if (held & (1 << UP_BATTPACK))
ADDRLP4 144
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $726
line 1663
;1663:  {
line 1664
;1664:    memset(&battpack, 0, sizeof(battpack));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1665
;1665:    VectorCopy( torso->lightingOrigin, battpack.lightingOrigin );
ADDRLP4 4+12
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1666
;1666:    battpack.shadowPlane = torso->shadowPlane;
ADDRLP4 4+24
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1667
;1667:    battpack.renderfx = torso->renderfx;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1669
;1668:
;1669:    battpack.hModel = cgs.media.battpackModel;
ADDRLP4 4+8
ADDRGP4 cgs+268684+540
INDIRI4
ASGNI4
line 1672
;1670:
;1671:    //identity matrix
;1672:    AxisCopy(axisDefault, battpack.axis);
ADDRGP4 axisDefault
ARGP4
ADDRLP4 4+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1675
;1673:
;1674:    //FIXME: change to tag_back when it exists
;1675:    CG_PositionRotatedEntityOnTag(&battpack, torso, torso->hModel, "tag_head");
ADDRLP4 4
ARGP4
ADDRLP4 436
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $735
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1677
;1676:
;1677:    trap_R_AddRefEntityToScene(&battpack);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1678
;1678:  }
LABELV $726
line 1680
;1679:
;1680:  if (es->eFlags & EF_BLOBLOCKED)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $736
line 1681
;1681:  {
line 1683
;1682:    vec3_t temp, origin, up =
;1683:    { 0.0f, 0.0f, 1.0f };
ADDRLP4 448
ADDRGP4 $738
INDIRB
ASGNB 12
line 1687
;1684:    trace_t tr;
;1685:    float size;
;1686:
;1687:    VectorCopy( es->pos.trBase, temp );
ADDRLP4 436
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1688
;1688:    temp[2] -= 4096.0f;
ADDRLP4 436+8
ADDRLP4 436+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1690
;1689:
;1690:    CG_Trace(&tr, es->pos.trBase, NULL, NULL, temp, es->number, MASK_SOLID);
ADDRLP4 464
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 540
CNSTP4 0
ASGNP4
ADDRLP4 540
INDIRP4
ARGP4
ADDRLP4 540
INDIRP4
ARGP4
ADDRLP4 436
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1691
;1691:    VectorCopy( tr.endpos, origin );
ADDRLP4 524
ADDRLP4 464+12
INDIRB
ASGNB 12
line 1693
;1692:
;1693:    size = 32.0f;
ADDRLP4 460
CNSTF4 1107296256
ASGNF4
line 1695
;1694:
;1695:    if (cgs.clientinfo[cent->currentState.number].team == PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $741
line 1696
;1696:    {
line 1697
;1697:      if (size > 0.0f)
ADDRLP4 460
INDIRF4
CNSTF4 0
LEF4 $745
line 1698
;1698:        CG_ImpactMark(cgs.media.aliencreepShader, origin, up, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, size, qtrue);
ADDRGP4 cgs+268684+164
INDIRI4
ARGI4
ADDRLP4 524
ARGP4
ADDRLP4 448
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 544
CNSTF4 1065353216
ASGNF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 460
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
LABELV $745
line 1699
;1699:    }
LABELV $741
line 1700
;1700:    if (cgs.clientinfo[cent->currentState.number].team == PTE_HUMANS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $749
line 1701
;1701:    {
line 1702
;1702:      CG_ImpactMark(cgs.media.humancreepShader, origin, up, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, size, qtrue);
ADDRGP4 cgs+268684+160
INDIRI4
ARGI4
ADDRLP4 524
ARGP4
ADDRLP4 448
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 544
CNSTF4 1065353216
ASGNF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
ADDRLP4 544
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 460
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 1703
;1703:    }
LABELV $749
line 1704
;1704:  }
LABELV $736
line 1705
;1705:}
LABELV $723
endproc CG_PlayerUpgrades 548 44
proc CG_PlayerFloatSprite 196 12
line 1716
;1706:
;1707:/*
;1708: ===============
;1709: CG_PlayerFloatSprite
;1710:
;1711: Float a sprite over the player's head
;1712: ===============
;1713: */
;1714:static void
;1715:CG_PlayerFloatSprite(centity_t *cent, qhandle_t shader, vec4_t color)
;1716:{
line 1720
;1717:  int rf;
;1718:  refEntity_t ent;
;1719:
;1720:  if (cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $756
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $756
line 1721
;1721:    rf = RF_THIRD_PERSON; // only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
ADDRGP4 $757
JUMPV
LABELV $756
line 1723
;1722:  else
;1723:    rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
LABELV $757
line 1725
;1724:
;1725:  memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1726
;1726:  VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 1728
;1727:
;1728:  ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1729
;1729:  ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 1730
;1730:  ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 1731
;1731:  ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 1732
;1732:  ent.shaderRGBA[0] = color[0] * 255;
ADDRLP4 148
CNSTF4 1132396544
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 152
CNSTF4 1325400064
ASGNF4
ADDRLP4 148
INDIRF4
ADDRLP4 152
INDIRF4
LTF4 $766
ADDRLP4 144
ADDRLP4 148
INDIRF4
ADDRLP4 152
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $767
JUMPV
LABELV $766
ADDRLP4 144
ADDRLP4 148
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $767
ADDRLP4 0+116
ADDRLP4 144
INDIRU4
CVUU1 4
ASGNU1
line 1733
;1733:  ent.shaderRGBA[1] = color[1] * 255;
ADDRLP4 160
CNSTF4 1132396544
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 164
CNSTF4 1325400064
ASGNF4
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
LTF4 $771
ADDRLP4 156
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $772
JUMPV
LABELV $771
ADDRLP4 156
ADDRLP4 160
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $772
ADDRLP4 0+116+1
ADDRLP4 156
INDIRU4
CVUU1 4
ASGNU1
line 1734
;1734:  ent.shaderRGBA[2] = color[2] * 255;
ADDRLP4 172
CNSTF4 1132396544
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 176
CNSTF4 1325400064
ASGNF4
ADDRLP4 172
INDIRF4
ADDRLP4 176
INDIRF4
LTF4 $776
ADDRLP4 168
ADDRLP4 172
INDIRF4
ADDRLP4 176
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $777
JUMPV
LABELV $776
ADDRLP4 168
ADDRLP4 172
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $777
ADDRLP4 0+116+2
ADDRLP4 168
INDIRU4
CVUU1 4
ASGNU1
line 1735
;1735:  ent.shaderRGBA[3] = color[3] * 255;
ADDRLP4 184
CNSTF4 1132396544
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 188
CNSTF4 1325400064
ASGNF4
ADDRLP4 184
INDIRF4
ADDRLP4 188
INDIRF4
LTF4 $781
ADDRLP4 180
ADDRLP4 184
INDIRF4
ADDRLP4 188
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $782
JUMPV
LABELV $781
ADDRLP4 180
ADDRLP4 184
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $782
ADDRLP4 0+116+3
ADDRLP4 180
INDIRU4
CVUU1 4
ASGNU1
line 1738
;1736:
;1737:  // Find the proper height to float the sprite
;1738:  ent.origin[2] += BG_FindSpriteHeightForClass((cent->currentState.powerups >> 8) & 0xFF);
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ARGI4
ADDRLP4 192
ADDRGP4 BG_FindSpriteHeightForClass
CALLF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 192
INDIRF4
ADDF4
ASGNF4
line 1744
;1739:
;1740:  // Bsuit offset hack
;1741:  // TODO: chat balloons for suits are inside their heads
;1742:
;1743:
;1744:  trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1745
;1745:}
LABELV $755
endproc CG_PlayerFloatSprite 196 12
lit
align 4
LABELV $788
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $793
byte 4 1025758986
byte 4 1060487823
byte 4 1063339950
byte 4 1065353216
align 4
LABELV $794
byte 4 1061158912
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_PlayerSprites 32 12
line 1756
;1746:
;1747:/*
;1748: ===============
;1749: CG_PlayerSprites
;1750:
;1751: Float sprites over the player's head
;1752: ===============
;1753: */
;1754:static void
;1755:CG_PlayerSprites(centity_t *cent)
;1756:{
line 1757
;1757:  if (cent->currentState.eFlags & EF_CONNECTION)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $786
line 1758
;1758:  {
line 1760
;1759:    vec4_t white =
;1760:    { 1.f, 1.f, 1.f, 1.f };
ADDRLP4 0
ADDRGP4 $788
INDIRB
ASGNB 16
line 1761
;1761:    CG_PlayerFloatSprite(cent, cgs.media.connectionShader, white);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+268684+20
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1762
;1762:    return;
ADDRGP4 $785
JUMPV
LABELV $786
line 1765
;1763:  }
;1764:
;1765:  if (cent->currentState.eFlags & EF_TALK)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $791
line 1766
;1766:  {
line 1771
;1767:    //TA: the masses have decreed this to be wrong
;1768:
;1769:    // ... because you coded it wrong. --Risujin
;1770:    vec4_t color_human =
;1771:    { 0.04f, 0.71f, 0.88f, 1.0f };
ADDRLP4 16
ADDRGP4 $793
INDIRB
ASGNB 16
line 1773
;1772:    vec4_t color_alien =
;1773:    { 0.75f, 0.00f, 0.00f, 1.0f };
ADDRLP4 0
ADDRGP4 $794
INDIRB
ASGNB 16
line 1774
;1774:    if (cgs.clientinfo[cent->currentState.number].team == PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $795
line 1775
;1775:      CG_PlayerFloatSprite(cent, cgs.media.balloonShader, color_alien);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+268684+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
ADDRGP4 $796
JUMPV
LABELV $795
line 1776
;1776:    else if (cgs.clientinfo[cent->currentState.number].team == PTE_HUMANS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $801
line 1777
;1777:      CG_PlayerFloatSprite(cent, cgs.media.balloonShader, color_human);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+268684+16
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
LABELV $801
LABELV $796
line 1779
;1778:
;1779:  }
LABELV $791
line 1780
;1780:}
LABELV $785
endproc CG_PlayerSprites 32 12
lit
align 4
LABELV $808
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_PlayerShadow 140 44
line 1794
;1781:
;1782:/*
;1783: ===============
;1784: CG_PlayerShadow
;1785:
;1786: Returns the Z component of the surface being shadowed
;1787:
;1788: should it return a full plane instead of a Z?
;1789: ===============
;1790: */
;1791:#define SHADOW_DISTANCE   128
;1792:static qboolean
;1793:CG_PlayerShadow(centity_t *cent, float *shadowPlane, pClass_t class)
;1794:{
line 1798
;1795:  vec3_t end, mins, maxs;
;1796:  trace_t trace;
;1797:  float alpha;
;1798:  entityState_t *es = &cent->currentState;
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
line 1800
;1799:  vec3_t surfNormal =
;1800:  { 0.0f, 0.0f, 1.0f };
ADDRLP4 60
ADDRGP4 $808
INDIRB
ASGNB 12
line 1802
;1801:
;1802:  BG_FindBBoxForClass(class, mins, maxs, NULL, NULL, NULL);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 1803
;1803:  mins[2] = 0.0f;
ADDRLP4 84+8
CNSTF4 0
ASGNF4
line 1804
;1804:  maxs[2] = 2.0f;
ADDRLP4 96+8
CNSTF4 1073741824
ASGNF4
line 1806
;1805:
;1806:  if (es->eFlags & EF_WALLCLIMB)
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $811
line 1807
;1807:  {
line 1808
;1808:    if (es->eFlags & EF_WALLCLIMBCEILING)
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $813
line 1809
;1809:      VectorSet( surfNormal, 0.0f, 0.0f, -1.0f );
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 60
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 60+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $814
JUMPV
LABELV $813
line 1810
;1810:else      VectorCopy( es->angles2, surfNormal );
ADDRLP4 60
ADDRLP4 108
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
LABELV $814
line 1811
;1811:    }
LABELV $811
line 1813
;1812:
;1813:    *shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 1815
;1814:
;1815:    if( cg_shadows.integer == 0 )
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $817
line 1816
;1816:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $807
JUMPV
LABELV $817
line 1819
;1817:
;1818:    // send a trace down from the player to the ground
;1819:    VectorCopy( cent->lerpOrigin, end );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 1820
;1820:    VectorMA( cent->lerpOrigin, -SHADOW_DISTANCE, surfNormal, end );
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
CNSTF4 3271557120
ASGNF4
ADDRLP4 72
ADDRLP4 120
INDIRP4
CNSTI4 1556
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 120
INDIRP4
CNSTI4 1560
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72+8
ADDRFP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRF4
CNSTF4 3271557120
ADDRLP4 60+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1822
;1821:
;1822:    trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 1825
;1823:
;1824:    // no shadow if too high
;1825:    if( trace.fraction == 1.0 || trace.startsolid || trace.allsolid )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $829
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 128
INDIRI4
NEI4 $829
ADDRLP4 0
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $824
LABELV $829
line 1826
;1826:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $807
JUMPV
LABELV $824
line 1832
;1827:
;1828:    //TA: FIXME: stencil shadows will be broken for walls.
;1829:    //           Unfortunately there isn't much that can be
;1830:    //           done since Q3 references only the Z coord
;1831:    //           of the shadowPlane
;1832:    if( surfNormal[ 2 ] < 0.0f )
ADDRLP4 60+8
INDIRF4
CNSTF4 0
GEF4 $830
line 1833
;1833:    *shadowPlane = trace.endpos[ 2 ] - 1.0f;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
ADDRGP4 $831
JUMPV
LABELV $830
line 1835
;1834:    else
;1835:    *shadowPlane = trace.endpos[ 2 ] + 1.0f;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $831
line 1837
;1836:
;1837:    if( cg_shadows.integer != 1 ) // no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $837
line 1838
;1838:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $807
JUMPV
LABELV $837
line 1841
;1839:
;1840:    // fade the shadow out with height
;1841:    alpha = 1.0 - trace.fraction;
ADDRLP4 112
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1845
;1842:
;1843:    // add the mark as a temporary, so it goes directly to the renderer
;1844:    // without taking a spot in the cg_marks array
;1845:    CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal,
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 BG_FindShadowScaleForClass
CALLF4
ASGNF4
ADDRGP4 cgs+268684+224
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
CNSTF4 0
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 112
INDIRF4
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ADDRLP4 132
INDIRF4
MULF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 1849
;1846:        cent->pe.legs.yawAngle, 0.0f, 0.0f, 0.0f, alpha, qfalse,
;1847:        24.0f * BG_FindShadowScaleForClass( class ), qtrue );
;1848:
;1849:    return qtrue;
CNSTI4 1
RETI4
LABELV $807
endproc CG_PlayerShadow 140 44
proc CG_PlayerSplash 136 44
line 1861
;1850:  }
;1851:
;1852:  /*
;1853:   ===============
;1854:   CG_PlayerSplash
;1855:
;1856:   Draw a mark at the water surface
;1857:   ===============
;1858:   */
;1859:static void
;1860:CG_PlayerSplash(centity_t *cent, pClass_t class)
;1861:{
line 1867
;1862:  vec3_t start, end;
;1863:  vec3_t mins, maxs;
;1864:  trace_t trace;
;1865:  int contents;
;1866:
;1867:  if (!cg_shadows.integer)
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $846
line 1868
;1868:    return;
ADDRGP4 $845
JUMPV
LABELV $846
line 1870
;1869:
;1870:  BG_FindBBoxForClass(class, mins, maxs, NULL, NULL, NULL);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 88
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
CNSTP4 0
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 1872
;1871:
;1872:  VectorCopy( cent->lerpOrigin, end );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 1873
;1873:  end[2] += mins[2];
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 88+8
INDIRF4
ADDF4
ASGNF4
line 1877
;1874:
;1875:  // if the feet aren't in liquid, don't make a mark
;1876:  // this won't handle moving water brushes, but they wouldn't draw right anyway...
;1877:  contents = trap_CM_PointContents(end, 0);
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 116
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 116
INDIRI4
ASGNI4
line 1879
;1878:
;1879:  if (!(contents & (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA)))
ADDRLP4 84
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $851
line 1880
;1880:    return;
ADDRGP4 $845
JUMPV
LABELV $851
line 1882
;1881:
;1882:  VectorCopy( cent->lerpOrigin, start );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 1883
;1883:  start[2] += 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 1886
;1884:
;1885:  // if the head isn't out of liquid, don't make a mark
;1886:  contents = trap_CM_PointContents(start, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 120
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 120
INDIRI4
ASGNI4
line 1888
;1887:
;1888:  if (contents & (CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA))
ADDRLP4 84
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $854
line 1889
;1889:    return;
ADDRGP4 $845
JUMPV
LABELV $854
line 1892
;1890:
;1891:  // trace down to find the surface
;1892:  trap_CM_BoxTrace(&trace, start, end, NULL, NULL, 0, (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA));
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 1894
;1893:
;1894:  if (trace.fraction == 1.0f)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $856
line 1895
;1895:    return;
ADDRGP4 $845
JUMPV
LABELV $856
line 1897
;1896:
;1897:  CG_ImpactMark(cgs.media.wakeMarkShader, trace.endpos, trace.plane.normal, cent->pe.legs.yawAngle, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, 32.0f
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 BG_FindShadowScaleForClass
CALLF4
ASGNF4
ADDRGP4 cgs+268684+228
INDIRI4
ARGI4
ADDRLP4 24+12
ARGP4
ADDRLP4 24+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 132
CNSTF4 1065353216
ASGNF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 132
INDIRF4
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1107296256
ADDRLP4 128
INDIRF4
MULF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 1899
;1898:      * BG_FindShadowScaleForClass(class), qtrue);
;1899:}
LABELV $845
endproc CG_PlayerSplash 136 44
export CG_LightVerts
proc CG_LightVerts 88 16
line 1908
;1900:
;1901:/*
;1902: =================
;1903: CG_LightVerts
;1904: =================
;1905: */
;1906:int
;1907:CG_LightVerts(vec3_t normal, int numVerts, polyVert_t *verts)
;1908:{
line 1915
;1909:  int i, j;
;1910:  float incoming;
;1911:  vec3_t ambientLight;
;1912:  vec3_t lightDir;
;1913:  vec3_t directedLight;
;1914:
;1915:  trap_R_LightForPoint(verts[0].xyz, ambientLight, directedLight, lightDir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 1917
;1916:
;1917:  for(i = 0;i < numVerts;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $867
JUMPV
LABELV $864
line 1918
;1918:  {
line 1919
;1919:    incoming = DotProduct( normal, lightDir );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1921
;1920:
;1921:    if (incoming <= 0)
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $870
line 1922
;1922:    {
line 1923
;1923:      verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $873
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $874
JUMPV
LABELV $873
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $874
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 1924
;1924:      verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $877
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $878
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 1925
;1925:      verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $881
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $882
JUMPV
LABELV $881
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $882
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 1926
;1926:      verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 1927
;1927:      continue;
ADDRGP4 $865
JUMPV
LABELV $870
line 1930
;1928:    }
;1929:
;1930:    j = (ambientLight[0] + incoming * directedLight[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1932
;1931:
;1932:    if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $883
line 1933
;1933:      j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $883
line 1935
;1934:
;1935:    verts[i].modulate[0] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1937
;1936:
;1937:    j = (ambientLight[1] + incoming * directedLight[1]);
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1939
;1938:
;1939:    if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $887
line 1940
;1940:      j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $887
line 1942
;1941:
;1942:    verts[i].modulate[1] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1944
;1943:
;1944:    j = (ambientLight[2] + incoming * directedLight[2]);
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1946
;1945:
;1946:    if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $891
line 1947
;1947:      j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $891
line 1949
;1948:
;1949:    verts[i].modulate[2] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1951
;1950:
;1951:    verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 1952
;1952:  }
LABELV $865
line 1917
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $867
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $864
line 1953
;1953:  return qtrue;
CNSTI4 1
RETI4
LABELV $863
endproc CG_LightVerts 88 16
export CG_LightFromDirection
proc CG_LightFromDirection 60 16
line 1963
;1954:}
;1955:
;1956:/*
;1957: =================
;1958: CG_LightFromDirection
;1959: =================
;1960: */
;1961:int
;1962:CG_LightFromDirection(vec3_t point, vec3_t direction)
;1963:{
line 1971
;1964:  int j;
;1965:  float incoming;
;1966:  vec3_t ambientLight;
;1967:  vec3_t lightDir;
;1968:  vec3_t directedLight;
;1969:  vec3_t result;
;1970:
;1971:  trap_R_LightForPoint(point, ambientLight, directedLight, lightDir);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 1973
;1972:
;1973:  incoming = DotProduct( direction, lightDir );
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32+4
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1975
;1974:
;1975:  if (incoming <= 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GTF4 $896
line 1976
;1976:  {
line 1977
;1977:    result[0] = ambientLight[0];
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1978
;1978:    result[1] = ambientLight[1];
ADDRLP4 4+4
ADDRLP4 16+4
INDIRF4
ASGNF4
line 1979
;1979:    result[2] = ambientLight[2];
ADDRLP4 4+8
ADDRLP4 16+8
INDIRF4
ASGNF4
line 1980
;1980:    return (int) ((float) (result[0] + result[1] + result[2]) / 3.0f);
ADDRLP4 4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDF4
CNSTF4 1077936128
DIVF4
CVFI4 4
RETI4
ADDRGP4 $893
JUMPV
LABELV $896
line 1983
;1981:  }
;1982:
;1983:  j = (ambientLight[0] + incoming * directedLight[0]);
ADDRLP4 0
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1985
;1984:
;1985:  if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $904
line 1986
;1986:    j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $904
line 1988
;1987:
;1988:  result[0] = j;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
line 1990
;1989:
;1990:  j = (ambientLight[1] + incoming * directedLight[1]);
ADDRLP4 0
ADDRLP4 16+4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1992
;1991:
;1992:  if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $908
line 1993
;1993:    j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $908
line 1995
;1994:
;1995:  result[1] = j;
ADDRLP4 4+4
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
line 1997
;1996:
;1997:  j = (ambientLight[2] + incoming * directedLight[2]);
ADDRLP4 0
ADDRLP4 16+8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1999
;1998:
;1999:  if (j > 255)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $913
line 2000
;2000:    j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $913
line 2002
;2001:
;2002:  result[2] = j;
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
line 2004
;2003:
;2004:  return (int) ((float) (result[0] + result[1] + result[2]) / 3.0f);
ADDRLP4 4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDF4
CNSTF4 1077936128
DIVF4
CVFI4 4
RETI4
LABELV $893
endproc CG_LightFromDirection 60 16
export CG_AmbientLight
proc CG_AmbientLight 48 16
line 2014
;2005:}
;2006:
;2007:/*
;2008: =================
;2009: CG_AmbientLight
;2010: =================
;2011: */
;2012:int
;2013:CG_AmbientLight(vec3_t point)
;2014:{
line 2020
;2015:  vec3_t ambientLight;
;2016:  vec3_t lightDir;
;2017:  vec3_t directedLight;
;2018:  vec3_t result;
;2019:
;2020:  trap_R_LightForPoint(point, ambientLight, directedLight, lightDir);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2022
;2021:
;2022:  result[0] = ambientLight[0];
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2023
;2023:  result[1] = ambientLight[1];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2024
;2024:  result[2] = ambientLight[2];
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ASGNF4
line 2025
;2025:  return (int) ((float) (result[0] + result[1] + result[2]) / 3.0f);
ADDRLP4 0
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDF4
CNSTF4 1077936128
DIVF4
CVFI4 4
RETI4
LABELV $918
endproc CG_AmbientLight 48 16
proc CG_PlayerHealthBar 224 24
line 2039
;2026:}
;2027:
;2028:#define TRACE_DEPTH 32.0f
;2029:
;2030:#define HEALTH_BAR_WIDTH  10.0f
;2031:#define HEALTH_BAR_HEIGHT 2.0f
;2032:/*
;2033: ==================
;2034: CG_BuildableHealthBar
;2035: ==================
;2036: */
;2037:static void
;2038:CG_PlayerHealthBar(centity_t *cent)
;2039:{
line 2041
;2040:  vec3_t origin, origin2, down, right, back, downLength, rightLength;
;2041:  float rimWidth = HEALTH_BAR_HEIGHT / 15.0f;
ADDRLP4 36
CNSTF4 1040746633
ASGNF4
line 2048
;2042:  float doneWidth, leftWidth, progress;
;2043:  int health;
;2044:  qhandle_t shader;
;2045:  entityState_t *es;
;2046:  vec3_t mins, maxs;
;2047:	
;2048:  if (cgs.survivalRecords[0] < 1)
ADDRGP4 cgs+34672
INDIRI4
CNSTI4 1
GEI4 $926
line 2049
;2049:  {
line 2050
;2050:    return;
ADDRGP4 $925
JUMPV
LABELV $926
line 2053
;2051:  }
;2052:
;2053:  if (cgs.clientinfo[cent->currentState.number].team == PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $929
line 2054
;2054:    return;
ADDRGP4 $925
JUMPV
LABELV $929
line 2056
;2055:
;2056:  es = &cent->currentState;
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
line 2058
;2057:
;2058:  health = es->constantLight;
ADDRLP4 120
ADDRLP4 104
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2064
;2059:
;2060:  //cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS
;2061:  //health =  cg.snap->ps.stats[STAT_HEALTH];
;2062:  //health = cgs.clientinfo[cg.crosshairClientNum].health;
;2063:
;2064:  progress = (float) health / 100; // / B_HEALTH_SCALE;
ADDRLP4 96
ADDRLP4 120
INDIRI4
CVIF4 4
CNSTF4 1120403456
DIVF4
ASGNF4
line 2066
;2065:
;2066:  if (progress < 0.0f)
ADDRLP4 96
INDIRF4
CNSTF4 0
GEF4 $933
line 2067
;2067:    progress = 0.0f;
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRGP4 $934
JUMPV
LABELV $933
line 2068
;2068:  else if (progress > 1.0f)
ADDRLP4 96
INDIRF4
CNSTF4 1065353216
LEF4 $935
line 2069
;2069:    progress = 1.0f;
ADDRLP4 96
CNSTF4 1065353216
ASGNF4
LABELV $935
LABELV $934
line 2071
;2070:
;2071:  if (progress < 0.33f)
ADDRLP4 96
INDIRF4
CNSTF4 1051260355
GEF4 $937
line 2072
;2072:    shader = cgs.media.redBuildShader;
ADDRLP4 100
ADDRGP4 cgs+268684+236
INDIRI4
ASGNI4
ADDRGP4 $938
JUMPV
LABELV $937
line 2074
;2073:  else
;2074:    shader = cgs.media.greenBuildShader;
ADDRLP4 100
ADDRGP4 cgs+268684+232
INDIRI4
ASGNI4
LABELV $938
line 2076
;2075:
;2076:  doneWidth = (HEALTH_BAR_WIDTH - 2 * rimWidth) * progress;
ADDRLP4 76
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 36
INDIRF4
MULF4
SUBF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 2077
;2077:  leftWidth = (HEALTH_BAR_WIDTH - 2 * rimWidth) - doneWidth;
ADDRLP4 92
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 36
INDIRF4
MULF4
SUBF4
ADDRLP4 76
INDIRF4
SUBF4
ASGNF4
line 2079
;2078:
;2079:  VectorCopy( cg.refdef.viewaxis[ 2 ], down );
ADDRLP4 40
ADDRGP4 cg+110040+36+24
INDIRB
ASGNB 12
line 2080
;2080:  VectorInverse(down);
ADDRLP4 40
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 2081
;2081:  VectorCopy( cg.refdef.viewaxis[ 1 ], right );
ADDRLP4 12
ADDRGP4 cg+110040+36+12
INDIRB
ASGNB 12
line 2082
;2082:  VectorInverse(right);
ADDRLP4 12
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 2083
;2083:  VectorSubtract( cg.refdef.vieworg, cent->lerpOrigin, back );
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRGP4 cg+110040+24
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 1556
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80+4
ADDRGP4 cg+110040+24+4
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 1560
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80+8
ADDRGP4 cg+110040+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2084
;2084:  VectorNormalize(back);
ADDRLP4 80
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2085
;2085:  VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2086
;2086:  origin[2] += 40;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 2088
;2087:
;2088:  BG_FindBBoxForClass(PCL_HUMAN, mins, maxs, NULL, NULL, NULL);
CNSTI4 11
ARGI4
ADDRLP4 124
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 140
CNSTP4 0
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 2090
;2089:  //BG_FindBBoxForBuildable( es->modelindex, mins, maxs );
;2090:  VectorMA( origin, 48.0f, es->origin2, origin );
ADDRLP4 144
CNSTF4 1111490560
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1111490560
ADDRLP4 104
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2091
;2091:  VectorMA( origin, -HEALTH_BAR_WIDTH / 2.0f, right, origin );
ADDRLP4 152
CNSTF4 3231711232
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3231711232
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2092
;2092:  VectorMA( origin, maxs[ 0 ] + 8.0f, back, origin );
ADDRLP4 156
ADDRLP4 108
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 80+4
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 80+8
INDIRF4
ADDRLP4 108
INDIRF4
CNSTF4 1090519040
ADDF4
MULF4
ADDF4
ASGNF4
line 2094
;2093:
;2094:  VectorCopy( origin, origin2 );
ADDRLP4 24
ADDRLP4 0
INDIRB
ASGNB 12
line 2095
;2095:  VectorScale( right, rimWidth + doneWidth, rightLength );
ADDRLP4 160
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ASGNF4
line 2096
;2096:  VectorScale( down, HEALTH_BAR_HEIGHT, downLength );
ADDRLP4 164
CNSTF4 1073741824
ASGNF4
ADDRLP4 52
ADDRLP4 164
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 164
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1073741824
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 2097
;2097:  CG_DrawPlane(origin2, downLength, rightLength, shader);
ADDRLP4 24
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 2099
;2098:
;2099:  VectorMA( origin, rimWidth + doneWidth, right, origin2 );
ADDRLP4 168
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 2100
;2100:  VectorScale( right, leftWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 2101
;2101:  VectorScale( down, rimWidth, downLength );
ADDRLP4 52
ADDRLP4 40
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2102
;2102:  CG_DrawPlane(origin2, downLength, rightLength, shader);
ADDRLP4 24
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 2104
;2103:
;2104:  VectorMA( origin, rimWidth + doneWidth, right, origin2 );
ADDRLP4 180
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 2105
;2105:  VectorMA( origin2, HEALTH_BAR_HEIGHT - rimWidth, down, origin2 );
ADDRLP4 184
CNSTF4 1073741824
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 40+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 2106
;2106:  VectorScale( right, leftWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 2107
;2107:  VectorScale( down, rimWidth, downLength );
ADDRLP4 52
ADDRLP4 40
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2108
;2108:  CG_DrawPlane(origin2, downLength, rightLength, shader);
ADDRLP4 24
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 2110
;2109:
;2110:  VectorMA( origin, HEALTH_BAR_WIDTH - rimWidth, right, origin2 );
ADDRLP4 196
CNSTF4 1092616192
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 196
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 196
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 2111
;2111:  VectorScale( right, rimWidth, rightLength );
ADDRLP4 64
ADDRLP4 12
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2112
;2112:  VectorScale( down, HEALTH_BAR_HEIGHT, downLength );
ADDRLP4 204
CNSTF4 1073741824
ASGNF4
ADDRLP4 52
ADDRLP4 204
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 204
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1073741824
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 2113
;2113:  CG_DrawPlane(origin2, downLength, rightLength, shader);
ADDRLP4 24
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlane
CALLV
pop
line 2118
;2114:
;2115:  /*if( !( es->generic1 & B_POWERED_TOGGLEBIT ) &&
;2116:   BG_FindTeamForBuildable( es->modelindex ) == BIT_HUMANS )
;2117:   {*/
;2118:  VectorMA( origin, 15.0f, right, origin2 );
ADDRLP4 208
CNSTF4 1097859072
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 208
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 208
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1097859072
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2119
;2119:  VectorMA( origin2, HEALTH_BAR_HEIGHT + 5.0f, down, origin2 );
ADDRLP4 212
CNSTF4 1088421888
ASGNF4
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1088421888
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2120
;2120:  VectorScale( right, HEALTH_BAR_WIDTH / 2.0f - 5.0f, rightLength );
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 64
ADDRLP4 216
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 216
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
CNSTF4 0
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 2121
;2121:  VectorScale( down, HEALTH_BAR_WIDTH / 2.0f - 5.0f, downLength );
ADDRLP4 220
CNSTF4 0
ASGNF4
ADDRLP4 52
ADDRLP4 220
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 220
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 0
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 2124
;2122:  //CG_DrawPlane( origin2, downLength, rightLength, cgs.media.noPowerShader );
;2123:  /*}*/
;2124:}
LABELV $925
endproc CG_PlayerHealthBar 224 24
lit
align 4
LABELV $1053
byte 4 0
byte 4 0
byte 4 1065353216
export CG_Player
code
proc CG_Player 728 28
line 2133
;2125:
;2126:/*
;2127: ===============
;2128: CG_Player
;2129: ===============
;2130: */
;2131:void
;2132:CG_Player(centity_t *cent)
;2133:{
line 2143
;2134:  clientInfo_t *ci;
;2135:
;2136:  //TA: NOTE: legs is used for nonsegmented models
;2137:  //          this helps reduce code to be changed
;2138:  refEntity_t legs;
;2139:  refEntity_t torso;
;2140:  refEntity_t head;
;2141:  int clientNum;
;2142:  int renderfx;
;2143:  qboolean shadow = qfalse;
ADDRLP4 504
CNSTI4 0
ASGNI4
line 2145
;2144:  float shadowPlane;
;2145:  entityState_t *es = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 2146
;2146:  pClass_t class = (es->powerups >> 8) & 0xFF;
ADDRLP4 440
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 2150
;2147:  float scale;
;2148:  vec3_t tempAxis[3], tempAxis2[3];
;2149:  vec3_t angles;
;2150:  int held = es->modelindex;
ADDRLP4 512
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 2152
;2151:  vec3_t surfNormal =
;2152:  { 0.0f, 0.0f, 1.0f };
ADDRLP4 288
ADDRGP4 $1053
INDIRB
ASGNB 12
line 2157
;2153:
;2154:  // the client number is stored in clientNum.  It can't be derived
;2155:  // from the entity number, because a single client may have
;2156:  // multiple corpses on the level using the same clientinfo
;2157:  clientNum = es->clientNum;
ADDRLP4 500
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2158
;2158:  if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 500
INDIRI4
CNSTI4 0
LTI4 $1056
ADDRLP4 500
INDIRI4
CNSTI4 64
LTI4 $1054
LABELV $1056
line 2159
;2159:    CG_Error("Bad clientNum on player entity");
ADDRGP4 $1057
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $1054
line 2161
;2160:
;2161:  ci = &cgs.clientinfo[clientNum];
ADDRLP4 284
CNSTI4 1760
ADDRLP4 500
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ASGNP4
line 2165
;2162:
;2163:  // it is possible to see corpses from disconnected players that may
;2164:  // not have valid clientinfo
;2165:  if (!ci->infoValid)
ADDRLP4 284
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1059
line 2166
;2166:    return;
ADDRGP4 $1052
JUMPV
LABELV $1059
line 2169
;2167:
;2168:  //don't draw
;2169:  if (es->eFlags & EF_NODRAW)
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1061
line 2170
;2170:    return;
ADDRGP4 $1052
JUMPV
LABELV $1061
line 2173
;2171:
;2172:  // get the player model information
;2173:  renderfx = 0;
ADDRLP4 484
CNSTI4 0
ASGNI4
line 2174
;2174:  if (es->number == cg.snap->ps.clientNum)
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1063
line 2175
;2175:  {
line 2176
;2176:    if (!cg.renderingThirdPerson)
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1066
line 2177
;2177:      renderfx = RF_THIRD_PERSON; // only draw in mirrors
ADDRLP4 484
CNSTI4 2
ASGNI4
ADDRGP4 $1067
JUMPV
LABELV $1066
line 2178
;2178:    else if (cg_cameraMode.integer)
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1069
line 2179
;2179:      return;
ADDRGP4 $1052
JUMPV
LABELV $1069
LABELV $1067
line 2180
;2180:  }
LABELV $1063
line 2182
;2181:
;2182:  if (es->eFlags & EF_ONFIRE)
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 262160
BANDI4
CNSTI4 0
EQI4 $1072
line 2183
;2183:  {
line 2184
;2184:    CG_PlayerOnFire(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerOnFire
CALLV
pop
line 2185
;2185:  }
LABELV $1072
line 2187
;2186:
;2187:  if (cg_drawBBOX.integer)
ADDRGP4 cg_drawBBOX+12
INDIRI4
CNSTI4 0
EQI4 $1074
line 2188
;2188:  {
line 2191
;2189:    vec3_t mins, maxs;
;2190:
;2191:    BG_FindBBoxForClass(class, mins, maxs, NULL, NULL, NULL);
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 556
ARGP4
ADDRLP4 568
ARGP4
ADDRLP4 580
CNSTP4 0
ASGNP4
ADDRLP4 580
INDIRP4
ARGP4
ADDRLP4 580
INDIRP4
ARGP4
ADDRLP4 580
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 2192
;2192:    CG_DrawBoundingBox(cent->lerpOrigin, mins, maxs);
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 556
ARGP4
ADDRLP4 568
ARGP4
ADDRGP4 CG_DrawBoundingBox
CALLV
pop
line 2193
;2193:  }
LABELV $1074
line 2195
;2194:
;2195:  CG_PlayerHealthBar(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerHealthBar
CALLV
pop
line 2197
;2196:
;2197:  memset(&legs, 0, sizeof(legs));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2198
;2198:  memset(&torso, 0, sizeof(torso));
ADDRLP4 144
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2199
;2199:  memset(&head, 0, sizeof(head));
ADDRLP4 300
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2201
;2200:
;2201:  VectorCopy( cent->lerpAngles, angles );
ADDRLP4 488
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRB
ASGNB 12
line 2202
;2202:  AnglesToAxis(cent->lerpAngles, tempAxis);
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 448
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2205
;2203:
;2204:  //rotate lerpAngles to floor
;2205:  if (es->eFlags & EF_WALLCLIMB && BG_RotateAxis(es->angles2, tempAxis, tempAxis2, qtrue, es->eFlags & EF_WALLCLIMBCEILING))
ADDRLP4 560
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1077
ADDRLP4 564
CNSTI4 128
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 564
INDIRI4
ADDP4
ARGP4
ADDRLP4 448
ARGP4
ADDRLP4 516
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 560
INDIRI4
ADDRLP4 564
INDIRI4
BANDI4
ARGI4
ADDRLP4 568
ADDRGP4 BG_RotateAxis
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
EQI4 $1077
line 2206
;2206:    AxisToAngles(tempAxis2, angles);
ADDRLP4 516
ARGP4
ADDRLP4 488
ARGP4
ADDRGP4 AxisToAngles
CALLV
pop
ADDRGP4 $1078
JUMPV
LABELV $1077
line 2207
;2207:else    VectorCopy( cent->lerpAngles, angles );
ADDRLP4 488
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRB
ASGNB 12
LABELV $1078
line 2210
;2208:
;2209:    //normalise the pitch
;2210:    if( angles[ PITCH ] < -180.0f )
ADDRLP4 488
INDIRF4
CNSTF4 3274964992
GEF4 $1079
line 2211
;2211:    angles[ PITCH ] += 360.0f;
ADDRLP4 488
ADDRLP4 488
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1079
line 2214
;2212:
;2213:    // get the rotation information
;2214:    if( !ci->nonsegmented )
ADDRLP4 284
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1081
line 2215
;2215:    CG_PlayerAngles( cent, angles, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 488
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 144+28
ARGP4
ADDRLP4 300+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
ADDRGP4 $1082
JUMPV
LABELV $1081
line 2217
;2216:    else
;2217:    CG_PlayerNonSegAngles( cent, angles, legs.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 488
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 CG_PlayerNonSegAngles
CALLV
pop
LABELV $1082
line 2219
;2218:
;2219:    AxisCopy( legs.axis, tempAxis );
ADDRLP4 0+28
ARGP4
ADDRLP4 448
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 2222
;2220:
;2221:    //rotate the legs axis to back to the wall
;2222:    if( es->eFlags & EF_WALLCLIMB &&
ADDRLP4 576
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 580
CNSTI4 0
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 580
INDIRI4
EQI4 $1088
ADDRLP4 584
CNSTI4 128
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 584
INDIRI4
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 448
ARGP4
ADDRLP4 580
INDIRI4
ARGI4
ADDRLP4 576
INDIRI4
ADDRLP4 584
INDIRI4
BANDI4
ARGI4
ADDRLP4 588
ADDRGP4 BG_RotateAxis
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $1088
line 2224
;2223:        BG_RotateAxis( es->angles2, legs.axis, tempAxis, qfalse, es->eFlags & EF_WALLCLIMBCEILING ) )
;2224:    AxisCopy( tempAxis, legs.axis );
ADDRLP4 448
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
LABELV $1088
line 2227
;2225:
;2226:    //smooth out WW transitions so the model doesn't hop around
;2227:    CG_PlayerWWSmoothing( cent, legs.axis, legs.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 CG_PlayerWWSmoothing
CALLV
pop
line 2229
;2228:
;2229:    AxisCopy( tempAxis, cent->pe.lastAxis );
ADDRLP4 448
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 2232
;2230:
;2231:    // get the animation state (after rotation, to allow feet shuffle)
;2232:    if( !ci->nonsegmented )
ADDRLP4 284
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1094
line 2233
;2233:    CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRLP4 144+96
ARGP4
ADDRLP4 144+80
ARGP4
ADDRLP4 144+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2236
;2234:        &torso.oldframe, &torso.frame, &torso.backlerp );
;2235:    else
;2236:    CG_PlayerNonSegAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_PlayerNonSegAnimation
CALLV
pop
LABELV $1095
line 2239
;2237:
;2238:    // add the talk baloon or disconnect icon
;2239:    CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2242
;2240:
;2241:    // add the shadow
;2242:    if( ( es->number == cg.snap->ps.clientNum && cg.renderingThirdPerson ) ||
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1111
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1110
LABELV $1111
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $1105
LABELV $1110
line 2244
;2243:        es->number != cg.snap->ps.clientNum )
;2244:    shadow = CG_PlayerShadow( cent, &shadowPlane, class );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 508
ARGP4
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 592
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 504
ADDRLP4 592
INDIRI4
ASGNI4
LABELV $1105
line 2247
;2245:
;2246:    // add a water splash if partially in and out of water
;2247:    CG_PlayerSplash( cent, class );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 440
INDIRI4
ARGI4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2249
;2248:
;2249:    if( cg_shadows.integer == 3 && shadow )
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1112
ADDRLP4 504
INDIRI4
CNSTI4 0
EQI4 $1112
line 2250
;2250:    renderfx |= RF_SHADOW_PLANE;
ADDRLP4 484
ADDRLP4 484
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $1112
line 2252
;2251:
;2252:    renderfx |= RF_LIGHTING_ORIGIN; // use the same origin for all
ADDRLP4 484
ADDRLP4 484
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2257
;2253:
;2254:    //
;2255:    // add the legs
;2256:    //
;2257:    if( !ci->nonsegmented )
ADDRLP4 284
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1115
line 2258
;2258:    {
line 2259
;2259:      legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 284
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 2261
;2260:
;2261:      if( held & ( 1 << UP_LIGHTARMOUR ) )
ADDRLP4 512
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1118
line 2262
;2262:      legs.customSkin = cgs.media.larmourLegsSkin;
ADDRLP4 0+108
ADDRGP4 cgs+268684+524
INDIRI4
ASGNI4
ADDRGP4 $1119
JUMPV
LABELV $1118
line 2264
;2263:      else
;2264:      legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 284
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
LABELV $1119
line 2266
;2265:
;2266:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1116
line 2267
;2267:      {
line 2268
;2268:        legs.customSkin = ci->zombielegsSkin;
ADDRLP4 0+108
ADDRLP4 284
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ASGNI4
line 2269
;2269:      }
line 2270
;2270:    }
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2272
;2271:    else
;2272:    {
line 2273
;2273:      legs.hModel = ci->nonSegModel;
ADDRLP4 0+8
ADDRLP4 284
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 2274
;2274:      legs.customSkin = ci->nonSegSkin;
ADDRLP4 0+108
ADDRLP4 284
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 2275
;2275:    }
LABELV $1116
line 2277
;2276:
;2277:    VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2279
;2278:
;2279:    VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2280
;2280:    legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 508
INDIRF4
ASGNF4
line 2281
;2281:    legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 484
INDIRI4
ASGNI4
line 2282
;2282:    VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2285
;2283:
;2284:    //move the origin closer into the wall with a CapTrace
;2285:    if( es->eFlags & EF_WALLCLIMB && !( es->eFlags & EF_DEAD ) && !( cg.intermissionStarted ) )
ADDRLP4 596
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 600
CNSTI4 0
ASGNI4
ADDRLP4 596
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 600
INDIRI4
EQI4 $1137
ADDRLP4 596
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 600
INDIRI4
NEI4 $1137
ADDRGP4 cg+24
INDIRI4
ADDRLP4 600
INDIRI4
NEI4 $1137
line 2286
;2286:    {
line 2290
;2287:      vec3_t start, end, mins, maxs;
;2288:      trace_t tr;
;2289:
;2290:      if( es->eFlags & EF_WALLCLIMBCEILING )
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1140
line 2291
;2291:      VectorSet( surfNormal, 0.0f, 0.0f, -1.0f );
ADDRLP4 712
CNSTF4 0
ASGNF4
ADDRLP4 288
ADDRLP4 712
INDIRF4
ASGNF4
ADDRLP4 288+4
ADDRLP4 712
INDIRF4
ASGNF4
ADDRLP4 288+8
CNSTF4 3212836864
ASGNF4
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2293
;2292:      else
;2293:      VectorCopy( es->angles2, surfNormal );
ADDRLP4 288
ADDRLP4 140
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
LABELV $1141
line 2295
;2294:
;2295:      BG_FindBBoxForClass( class, mins, maxs, NULL, NULL, NULL );
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 688
ARGP4
ADDRLP4 700
ARGP4
ADDRLP4 716
CNSTP4 0
ASGNP4
ADDRLP4 716
INDIRP4
ARGP4
ADDRLP4 716
INDIRP4
ARGP4
ADDRLP4 716
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 2297
;2296:
;2297:      VectorMA( legs.origin, -TRACE_DEPTH, surfNormal, end );
ADDRLP4 720
CNSTF4 3254779904
ASGNF4
ADDRLP4 616
ADDRLP4 0+68
INDIRF4
ADDRLP4 720
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 616+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 720
INDIRF4
ADDRLP4 288+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 616+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 3254779904
ADDRLP4 288+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2298
;2298:      VectorMA( legs.origin, 1.0f, surfNormal, start );
ADDRLP4 724
CNSTF4 1065353216
ASGNF4
ADDRLP4 604
ADDRLP4 0+68
INDIRF4
ADDRLP4 724
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 604+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 724
INDIRF4
ADDRLP4 288+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 604+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 288+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2299
;2299:      CG_CapTrace( &tr, start, mins, maxs, end, es->number, MASK_PLAYERSOLID );
ADDRLP4 628
ARGP4
ADDRLP4 604
ARGP4
ADDRLP4 688
ARGP4
ADDRLP4 700
ARGP4
ADDRLP4 616
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 CG_CapTrace
CALLV
pop
line 2303
;2300:
;2301:      //if the trace misses completely then just use legs.origin
;2302:      //apparently capsule traces are "smaller" than box traces
;2303:      if( tr.fraction != 1.0f )
ADDRLP4 628+8
INDIRF4
CNSTF4 1065353216
EQF4 $1162
line 2304
;2304:      VectorMA( legs.origin, tr.fraction * -TRACE_DEPTH, surfNormal, legs.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 288
INDIRF4
CNSTF4 3254779904
ADDRLP4 628+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 288+4
INDIRF4
CNSTF4 3254779904
ADDRLP4 628+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 288+8
INDIRF4
CNSTF4 3254779904
ADDRLP4 628+8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
LABELV $1162
line 2306
;2305:
;2306:      VectorCopy( legs.origin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2307
;2307:      VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2308
;2308:    }
LABELV $1137
line 2311
;2309:
;2310:    //rescale the model
;2311:    scale = BG_FindModelScaleForClass( class );
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 604
ADDRGP4 BG_FindModelScaleForClass
CALLF4
ASGNF4
ADDRLP4 444
ADDRLP4 604
INDIRF4
ASGNF4
line 2313
;2312:
;2313:    if( scale != 1.0f )
ADDRLP4 444
INDIRF4
CNSTF4 1065353216
EQF4 $1184
line 2314
;2314:    {
line 2315
;2315:      VectorScale( legs.axis[ 0 ], scale, legs.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
line 2316
;2316:      VectorScale( legs.axis[ 1 ], scale, legs.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
line 2317
;2317:      VectorScale( legs.axis[ 2 ], scale, legs.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 444
INDIRF4
MULF4
ASGNF4
line 2319
;2318:
;2319:      legs.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 2320
;2320:    }
LABELV $1184
line 2323
;2321:
;2322:    //offset on the Z axis if required
;2323:    VectorMA( legs.origin, BG_FindZOffsetForClass( class ), surfNormal, legs.origin );
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 608
ADDRGP4 BG_FindZOffsetForClass
CALLF4
ASGNF4
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 288
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 612
ADDRGP4 BG_FindZOffsetForClass
CALLF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 288+4
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 440
INDIRI4
ARGI4
ADDRLP4 616
ADDRGP4 BG_FindZOffsetForClass
CALLF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 288+8
INDIRF4
ADDRLP4 616
INDIRF4
MULF4
ADDF4
ASGNF4
line 2324
;2324:    VectorCopy( legs.origin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2325
;2325:    VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2327
;2326:
;2327:    trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2330
;2328:
;2329:    // if the model failed, allow the default nullmodel to be displayed
;2330:    if( !legs.hModel )
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1245
line 2331
;2331:    return;
ADDRGP4 $1052
JUMPV
LABELV $1245
line 2333
;2332:
;2333:    if( !ci->nonsegmented )
ADDRLP4 284
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1248
line 2334
;2334:    {
line 2338
;2335:      //
;2336:      // add the torso
;2337:      //
;2338:      torso.hModel = ci->torsoModel;
ADDRLP4 144+8
ADDRLP4 284
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 2340
;2339:
;2340:      if( held & ( 1 << UP_LIGHTARMOUR ) )
ADDRLP4 512
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1251
line 2341
;2341:      torso.customSkin = cgs.media.larmourTorsoSkin;
ADDRLP4 144+108
ADDRGP4 cgs+268684+528
INDIRI4
ASGNI4
ADDRGP4 $1252
JUMPV
LABELV $1251
line 2343
;2342:      else
;2343:      torso.customSkin = ci->torsoSkin;
ADDRLP4 144+108
ADDRLP4 284
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
LABELV $1252
line 2345
;2344:
;2345:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1257
line 2346
;2346:      {
line 2347
;2347:        torso.customSkin = ci->zombietorsoSkin;
ADDRLP4 144+108
ADDRLP4 284
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 2348
;2348:      }
LABELV $1257
line 2350
;2349:
;2350:      if( !torso.hModel )
ADDRLP4 144+8
INDIRI4
CNSTI4 0
NEI4 $1262
line 2351
;2351:      return;
ADDRGP4 $1052
JUMPV
LABELV $1262
line 2353
;2352:
;2353:      VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 144+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2355
;2354:
;2355:      CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso" );
ADDRLP4 144
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1266
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2363
;2356:      /*
;2357:       torso.shaderRGBA[0] = ci->color1[0]*255;//add
;2358:       torso.shaderRGBA[1] = ci->color1[1]*255;//add
;2359:       torso.shaderRGBA[2] = ci->color1[2]*255;//add
;2360:       torso.shaderRGBA[3] = 255;
;2361:       */
;2362:
;2363:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1267
line 2364
;2364:      {
line 2365
;2365:        torso.shaderRGBA[0] = 1*255;//add
ADDRLP4 144+116
CNSTU1 255
ASGNU1
line 2366
;2366:        torso.shaderRGBA[1] = 0*255;//add
ADDRLP4 144+116+1
CNSTU1 0
ASGNU1
line 2367
;2367:        torso.shaderRGBA[2] = 0*255;//add
ADDRLP4 144+116+2
CNSTU1 0
ASGNU1
line 2368
;2368:      }
LABELV $1267
line 2369
;2369:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_HUMANS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1276
line 2370
;2370:      {
line 2371
;2371:        torso.shaderRGBA[0] = 0*255;//add
ADDRLP4 144+116
CNSTU1 0
ASGNU1
line 2372
;2372:        torso.shaderRGBA[1] = 1*255;//add
ADDRLP4 144+116+1
CNSTU1 255
ASGNU1
line 2373
;2373:        torso.shaderRGBA[2] = 1*255;//add
ADDRLP4 144+116+2
CNSTU1 255
ASGNU1
line 2374
;2374:      }
LABELV $1276
line 2376
;2375:
;2376:      torso.shaderRGBA[3] = 255;
ADDRLP4 144+116+3
CNSTU1 255
ASGNU1
line 2378
;2377:
;2378:      torso.shadowPlane = shadowPlane;
ADDRLP4 144+24
ADDRLP4 508
INDIRF4
ASGNF4
line 2379
;2379:      torso.renderfx = renderfx;
ADDRLP4 144+4
ADDRLP4 484
INDIRI4
ASGNI4
line 2381
;2380:
;2381:      trap_R_AddRefEntityToScene( &torso );
ADDRLP4 144
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2386
;2382:
;2383:      //
;2384:      // add the head
;2385:      //
;2386:      head.hModel = ci->headModel;
ADDRLP4 300+8
ADDRLP4 284
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
line 2388
;2387:
;2388:      if( held & ( 1 << UP_HELMET ) )
ADDRLP4 512
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1290
line 2389
;2389:      head.customSkin = cgs.media.larmourHeadSkin;
ADDRLP4 300+108
ADDRGP4 cgs+268684+520
INDIRI4
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
line 2391
;2390:      else
;2391:      head.customSkin = ci->headSkin;
ADDRLP4 300+108
ADDRLP4 284
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
LABELV $1291
line 2393
;2392:
;2393:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1296
line 2394
;2394:      {
line 2395
;2395:        head.customSkin = ci->zombieheadSkin;
ADDRLP4 300+108
ADDRLP4 284
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 2396
;2396:      }
LABELV $1296
line 2398
;2397:
;2398:      if( !head.hModel )
ADDRLP4 300+8
INDIRI4
CNSTI4 0
NEI4 $1301
line 2399
;2399:      return;
ADDRGP4 $1052
JUMPV
LABELV $1301
line 2401
;2400:
;2401:      VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 300+12
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2403
;2402:
;2403:      CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head" );
ADDRLP4 300
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 $735
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2405
;2404:
;2405:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_ALIENS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1305
line 2406
;2406:      {
line 2407
;2407:        head.shaderRGBA[0] = 1*255;//add
ADDRLP4 300+116
CNSTU1 255
ASGNU1
line 2408
;2408:        head.shaderRGBA[1] = 0*255;//add
ADDRLP4 300+116+1
CNSTU1 0
ASGNU1
line 2409
;2409:        head.shaderRGBA[2] = 0*255;//add
ADDRLP4 300+116+2
CNSTU1 0
ASGNU1
line 2410
;2410:      }
LABELV $1305
line 2411
;2411:      if(cgs.clientinfo[ cent->currentState.number ].team==PTE_HUMANS)
CNSTI4 1760
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1314
line 2412
;2412:      {
line 2413
;2413:        head.shaderRGBA[0] = 0*255;//add
ADDRLP4 300+116
CNSTU1 0
ASGNU1
line 2414
;2414:        head.shaderRGBA[1] = 0*255;//add
ADDRLP4 300+116+1
CNSTU1 0
ASGNU1
line 2415
;2415:        head.shaderRGBA[2] = 1*255;//add
ADDRLP4 300+116+2
CNSTU1 255
ASGNU1
line 2416
;2416:      }
LABELV $1314
line 2418
;2417:
;2418:      head.shaderRGBA[3] = 255;
ADDRLP4 300+116+3
CNSTU1 255
ASGNU1
line 2420
;2419:
;2420:      head.shadowPlane = shadowPlane;
ADDRLP4 300+24
ADDRLP4 508
INDIRF4
ASGNF4
line 2421
;2421:      head.renderfx = renderfx;
ADDRLP4 300+4
ADDRLP4 484
INDIRI4
ASGNI4
line 2423
;2422:
;2423:      trap_R_AddRefEntityToScene( &head );
ADDRLP4 300
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2424
;2424:    }
LABELV $1248
line 2429
;2425:
;2426:    //
;2427:    // add the gun / barrel / flash
;2428:    //
;2429:    if( es->weapon != WP_NONE )
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1327
line 2430
;2430:    {
line 2431
;2431:      if( !ci->nonsegmented )
ADDRLP4 284
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1329
line 2432
;2432:      CG_AddPlayerWeapon( &torso, NULL, cent );
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
ADDRGP4 $1330
JUMPV
LABELV $1329
line 2434
;2433:      else
;2434:      CG_AddPlayerWeapon( &legs, NULL, cent );
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
LABELV $1330
line 2435
;2435:    }
LABELV $1327
line 2437
;2436:
;2437:    CG_PlayerUpgrades( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ARGP4
ADDRGP4 CG_PlayerUpgrades
CALLV
pop
line 2440
;2438:
;2439:    //sanity check that particle systems are stopped when dead
;2440:    if( es->eFlags & EF_DEAD )
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1331
line 2441
;2441:    {
line 2442
;2442:      if( CG_IsParticleSystemValid( &cent->muzzlePS ) )
ADDRFP4 0
INDIRP4
CNSTI4 1668
ADDP4
ARGP4
ADDRLP4 620
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 620
INDIRI4
CNSTI4 0
EQI4 $1333
line 2443
;2443:      CG_DestroyParticleSystem( &cent->muzzlePS );
ADDRFP4 0
INDIRP4
CNSTI4 1668
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
LABELV $1333
line 2445
;2444:
;2445:      if( CG_IsParticleSystemValid( &cent->jetPackPS ) )
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ARGP4
ADDRLP4 624
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 624
INDIRI4
CNSTI4 0
EQI4 $1335
line 2446
;2446:      CG_DestroyParticleSystem( &cent->jetPackPS );
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ARGP4
ADDRGP4 CG_DestroyParticleSystem
CALLV
pop
LABELV $1335
line 2447
;2447:    }
LABELV $1331
line 2449
;2448:
;2449:    VectorCopy( surfNormal, cent->pe.lastNormal );
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRLP4 288
INDIRB
ASGNB 12
line 2450
;2450:  }
LABELV $1052
endproc CG_Player 728 28
export CG_Corpse
proc CG_Corpse 520 24
line 2459
;2451:
;2452:  /*
;2453:   ===============
;2454:   CG_Corpse
;2455:   ===============
;2456:   */
;2457:void
;2458:CG_Corpse(centity_t *cent)
;2459:{
line 2464
;2460:  clientInfo_t *ci;
;2461:  refEntity_t legs;
;2462:  refEntity_t torso;
;2463:  refEntity_t head;
;2464:  entityState_t *es = &cent->currentState;
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
line 2467
;2465:  int corpseNum;
;2466:  int renderfx;
;2467:  qboolean shadow = qfalse;
ADDRLP4 452
CNSTI4 0
ASGNI4
line 2472
;2468:  float shadowPlane;
;2469:  vec3_t origin, liveZ, deadZ;
;2470:  float scale;
;2471:
;2472:  corpseNum = CG_GetCorpseNum(es->clientNum);
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 484
ADDRGP4 CG_GetCorpseNum
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 484
INDIRI4
ASGNI4
line 2474
;2473:
;2474:  if (corpseNum < 0 || corpseNum >= MAX_CLIENTS)
ADDRLP4 444
INDIRI4
CNSTI4 0
LTI4 $1340
ADDRLP4 444
INDIRI4
CNSTI4 64
LTI4 $1338
LABELV $1340
line 2475
;2475:    CG_Error("Bad corpseNum on corpse entity: %d", corpseNum);
ADDRGP4 $1341
ARGP4
ADDRLP4 444
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
LABELV $1338
line 2477
;2476:
;2477:  ci = &cgs.corpseinfo[corpseNum];
ADDRLP4 140
CNSTI4 1760
ADDRLP4 444
INDIRI4
MULI4
ADDRGP4 cgs+154048
ADDP4
ASGNP4
line 2481
;2478:
;2479:  // it is possible to see corpses from disconnected players that may
;2480:  // not have valid clientinfo
;2481:  if (!ci->infoValid)
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1343
line 2482
;2482:    return;
ADDRGP4 $1337
JUMPV
LABELV $1343
line 2484
;2483:
;2484:  memset(&legs, 0, sizeof(legs));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2485
;2485:  memset(&torso, 0, sizeof(torso));
ADDRLP4 144
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2486
;2486:  memset(&head, 0, sizeof(head));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2488
;2487:
;2488:  VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 432
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2489
;2489:  BG_FindBBoxForClass(es->clientNum, liveZ, NULL, NULL, deadZ, NULL);
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 460
ARGP4
ADDRLP4 492
CNSTP4 0
ASGNP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRLP4 472
ARGP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
line 2490
;2490:  origin[2] -= (liveZ[2] - deadZ[2]);
ADDRLP4 432+8
ADDRLP4 432+8
INDIRF4
ADDRLP4 460+8
INDIRF4
ADDRLP4 472+8
INDIRF4
SUBF4
SUBF4
ASGNF4
line 2492
;2491:
;2492:  VectorCopy( es->angles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
ADDRLP4 284
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2495
;2493:
;2494:  // get the rotation information
;2495:  if (!ci->nonsegmented)
ADDRLP4 140
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1348
line 2496
;2496:    CG_PlayerAngles(cent, cent->lerpAngles, legs.axis, torso.axis, head.axis);
ADDRLP4 496
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
ARGP4
ADDRLP4 496
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 144+28
ARGP4
ADDRLP4 288+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
ADDRGP4 $1349
JUMPV
LABELV $1348
line 2498
;2497:  else
;2498:    CG_PlayerNonSegAngles(cent, cent->lerpAngles, legs.axis);
ADDRLP4 500
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRLP4 500
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 CG_PlayerNonSegAngles
CALLV
pop
LABELV $1349
line 2501
;2499:
;2500:  //set the correct frame (should always be dead)
;2501:  if (cg_noPlayerAnims.integer)
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $1354
line 2502
;2502:    legs.oldframe = legs.frame = torso.oldframe = torso.frame = 0;
ADDRLP4 504
CNSTI4 0
ASGNI4
ADDRLP4 144+80
ADDRLP4 504
INDIRI4
ASGNI4
ADDRLP4 144+96
ADDRLP4 504
INDIRI4
ASGNI4
ADDRLP4 0+80
ADDRLP4 504
INDIRI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 504
INDIRI4
ASGNI4
ADDRGP4 $1355
JUMPV
LABELV $1354
line 2503
;2503:  else if (!ci->nonsegmented)
ADDRLP4 140
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1361
line 2504
;2504:  {
line 2505
;2505:    memset(&cent->pe.legs, 0, sizeof(lerpFrame_t));
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2506
;2506:    CG_RunPlayerLerpFrame(ci, &cent->pe.legs, es->legsAnim, 1);
ADDRLP4 140
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
line 2507
;2507:    legs.oldframe = cent->pe.legs.oldFrame;
ADDRLP4 0+96
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 2508
;2508:    legs.frame = cent->pe.legs.frame;
ADDRLP4 0+80
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 2509
;2509:    legs.backlerp = cent->pe.legs.backlerp;
ADDRLP4 0+100
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 2511
;2510:
;2511:    memset(&cent->pe.torso, 0, sizeof(lerpFrame_t));
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2512
;2512:    CG_RunPlayerLerpFrame(ci, &cent->pe.torso, es->torsoAnim, 1);
ADDRLP4 140
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
line 2513
;2513:    torso.oldframe = cent->pe.torso.oldFrame;
ADDRLP4 144+96
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 2514
;2514:    torso.frame = cent->pe.torso.frame;
ADDRLP4 144+80
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 2515
;2515:    torso.backlerp = cent->pe.torso.backlerp;
ADDRLP4 144+100
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 2516
;2516:  }
ADDRGP4 $1362
JUMPV
LABELV $1361
line 2518
;2517:  else
;2518:  {
line 2519
;2519:    memset(&cent->pe.nonseg, 0, sizeof(lerpFrame_t));
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2520
;2520:    CG_RunPlayerLerpFrame(ci, &cent->pe.nonseg, es->legsAnim, 1);
ADDRLP4 140
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunPlayerLerpFrame
CALLV
pop
line 2521
;2521:    legs.oldframe = cent->pe.nonseg.oldFrame;
ADDRLP4 0+96
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2522
;2522:    legs.frame = cent->pe.nonseg.frame;
ADDRLP4 0+80
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ASGNI4
line 2523
;2523:    legs.backlerp = cent->pe.nonseg.backlerp;
ADDRLP4 0+100
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ASGNF4
line 2524
;2524:  }
LABELV $1362
LABELV $1355
line 2527
;2525:
;2526:  // add the shadow
;2527:  shadow = CG_PlayerShadow(cent, &shadowPlane, es->clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 456
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 508
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 452
ADDRLP4 508
INDIRI4
ASGNI4
line 2530
;2528:
;2529:  // get the player model information
;2530:  renderfx = 0;
ADDRLP4 448
CNSTI4 0
ASGNI4
line 2532
;2531:
;2532:  if (cg_shadows.integer == 3 && shadow)
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1372
ADDRLP4 452
INDIRI4
CNSTI4 0
EQI4 $1372
line 2533
;2533:    renderfx |= RF_SHADOW_PLANE;
ADDRLP4 448
ADDRLP4 448
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $1372
line 2535
;2534:
;2535:  renderfx |= RF_LIGHTING_ORIGIN; // use the same origin for all
ADDRLP4 448
ADDRLP4 448
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2540
;2536:
;2537:  //
;2538:  // add the legs
;2539:  //
;2540:  if (!ci->nonsegmented)
ADDRLP4 140
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1375
line 2541
;2541:  {
line 2542
;2542:    legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 2543
;2543:    legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 140
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 2544
;2544:  }
ADDRGP4 $1376
JUMPV
LABELV $1375
line 2546
;2545:  else
;2546:  {
line 2547
;2547:    legs.hModel = ci->nonSegModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 2548
;2548:    legs.customSkin = ci->nonSegSkin;
ADDRLP4 0+108
ADDRLP4 140
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 2549
;2549:  }
LABELV $1376
line 2551
;2550:
;2551:  VectorCopy( origin, legs.origin );
ADDRLP4 0+68
ADDRLP4 432
INDIRB
ASGNB 12
line 2553
;2552:
;2553:  VectorCopy( origin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 432
INDIRB
ASGNB 12
line 2554
;2554:  legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 456
INDIRF4
ASGNF4
line 2555
;2555:  legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 448
INDIRI4
ASGNI4
line 2556
;2556:  legs.origin[2] += BG_FindZOffsetForClass(es->clientNum);
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 BG_FindZOffsetForClass
CALLF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 512
INDIRF4
ADDF4
ASGNF4
line 2557
;2557:  VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2560
;2558:
;2559:  //rescale the model
;2560:  scale = BG_FindModelScaleForClass(es->clientNum);
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 BG_FindModelScaleForClass
CALLF4
ASGNF4
ADDRLP4 428
ADDRLP4 516
INDIRF4
ASGNF4
line 2562
;2561:
;2562:  if (scale != 1.0f)
ADDRLP4 428
INDIRF4
CNSTF4 1065353216
EQF4 $1389
line 2563
;2563:  {
line 2564
;2564:    VectorScale( legs.axis[ 0 ], scale, legs.axis[ 0 ] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
line 2565
;2565:    VectorScale( legs.axis[ 1 ], scale, legs.axis[ 1 ] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
line 2566
;2566:    VectorScale( legs.axis[ 2 ], scale, legs.axis[ 2 ] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 428
INDIRF4
MULF4
ASGNF4
line 2568
;2567:
;2568:    legs.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 2569
;2569:  }
LABELV $1389
line 2572
;2570:
;2571:  //CG_AddRefEntityWithPowerups( &legs, es->powerups, ci->team );
;2572:  trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2575
;2573:
;2574:  // if the model failed, allow the default nullmodel to be displayed
;2575:  if (!legs.hModel)
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1434
line 2576
;2576:    return;
ADDRGP4 $1337
JUMPV
LABELV $1434
line 2578
;2577:
;2578:  if (!ci->nonsegmented)
ADDRLP4 140
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1437
line 2579
;2579:  {
line 2583
;2580:    //
;2581:    // add the torso
;2582:    //
;2583:    torso.hModel = ci->torsoModel;
ADDRLP4 144+8
ADDRLP4 140
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 2584
;2584:    if (!torso.hModel)
ADDRLP4 144+8
INDIRI4
CNSTI4 0
NEI4 $1440
line 2585
;2585:      return;
ADDRGP4 $1337
JUMPV
LABELV $1440
line 2587
;2586:
;2587:    torso.customSkin = ci->torsoSkin;
ADDRLP4 144+108
ADDRLP4 140
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2589
;2588:
;2589:    VectorCopy( origin, torso.lightingOrigin );
ADDRLP4 144+12
ADDRLP4 432
INDIRB
ASGNB 12
line 2591
;2590:
;2591:    CG_PositionRotatedEntityOnTag(&torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 144
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1266
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2593
;2592:
;2593:    torso.shadowPlane = shadowPlane;
ADDRLP4 144+24
ADDRLP4 456
INDIRF4
ASGNF4
line 2594
;2594:    torso.renderfx = renderfx;
ADDRLP4 144+4
ADDRLP4 448
INDIRI4
ASGNI4
line 2597
;2595:
;2596:    //CG_AddRefEntityWithPowerups( &torso, es->powerups, ci->team );
;2597:    trap_R_AddRefEntityToScene(&torso);
ADDRLP4 144
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2602
;2598:
;2599:    //
;2600:    // add the head
;2601:    //
;2602:    head.hModel = ci->headModel;
ADDRLP4 288+8
ADDRLP4 140
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
line 2603
;2603:    if (!head.hModel)
ADDRLP4 288+8
INDIRI4
CNSTI4 0
NEI4 $1448
line 2604
;2604:      return;
ADDRGP4 $1337
JUMPV
LABELV $1448
line 2606
;2605:
;2606:    head.customSkin = ci->headSkin;
ADDRLP4 288+108
ADDRLP4 140
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2608
;2607:
;2608:    VectorCopy( origin, head.lightingOrigin );
ADDRLP4 288+12
ADDRLP4 432
INDIRB
ASGNB 12
line 2610
;2609:
;2610:    CG_PositionRotatedEntityOnTag(&head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 288
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 $735
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2612
;2611:
;2612:    head.shadowPlane = shadowPlane;
ADDRLP4 288+24
ADDRLP4 456
INDIRF4
ASGNF4
line 2613
;2613:    head.renderfx = renderfx;
ADDRLP4 288+4
ADDRLP4 448
INDIRI4
ASGNI4
line 2616
;2614:
;2615:    //CG_AddRefEntityWithPowerups( &head, es->powerups, ci->team );
;2616:    trap_R_AddRefEntityToScene(&head);
ADDRLP4 288
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2617
;2617:  }
LABELV $1437
line 2618
;2618:}
LABELV $1337
endproc CG_Corpse 520 24
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 52 12
line 2631
;2619:
;2620://=====================================================================
;2621:
;2622:/*
;2623: ===============
;2624: CG_ResetPlayerEntity
;2625:
;2626: A player just came into view or teleported, so reset all animation info
;2627: ===============
;2628: */
;2629:void
;2630:CG_ResetPlayerEntity(centity_t *cent)
;2631:{
line 2632
;2632:  cent->errorTime = -99999; // guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 1488
ADDP4
CNSTI4 -99999
ASGNI4
line 2633
;2633:  cent->extrapolated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1516
ADDP4
CNSTI4 0
ASGNI4
line 2635
;2634:
;2635:  CG_ClearLerpFrame(&cgs.clientinfo[cent->currentState.clientNum], &cent->pe.legs, cent->currentState.legsAnim);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1760
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2636
;2636:  CG_ClearLerpFrame(&cgs.clientinfo[cent->currentState.clientNum], &cent->pe.torso, cent->currentState.torsoAnim);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1760
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2637
;2637:  CG_ClearLerpFrame(&cgs.clientinfo[cent->currentState.clientNum], &cent->pe.nonseg, cent->currentState.legsAnim);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1760
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+41408
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 604
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2639
;2638:
;2639:  BG_EvaluateTrajectory(&cent->currentState.pos, cg.time, cent->lerpOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2640
;2640:  BG_EvaluateTrajectory(&cent->currentState.apos, cg.time, cent->lerpAngles);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 1568
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2642
;2641:
;2642:  VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1520
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
line 2643
;2643:  VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 1568
ADDP4
INDIRB
ASGNB 12
line 2645
;2644:
;2645:  memset(&cent->pe.legs, 0, sizeof(cent->pe.legs));
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2646
;2646:  cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 1536
ADDP4
INDIRF4
ASGNF4
line 2647
;2647:  cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2648
;2648:  cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 0
ASGNF4
line 2649
;2649:  cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 2651
;2650:
;2651:  memset(&cent->pe.torso, 0, sizeof(cent->pe.legs));
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2652
;2652:  cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 1536
ADDP4
INDIRF4
ASGNF4
line 2653
;2653:  cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2654
;2654:  cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 1532
ADDP4
INDIRF4
ASGNF4
line 2655
;2655:  cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 2657
;2656:
;2657:  memset(&cent->pe.nonseg, 0, sizeof(cent->pe.nonseg));
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2658
;2658:  cent->pe.nonseg.yawAngle = cent->rawAngles[YAW];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 1536
ADDP4
INDIRF4
ASGNF4
line 2659
;2659:  cent->pe.nonseg.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 2660
;2660:  cent->pe.nonseg.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 1532
ADDP4
INDIRF4
ASGNF4
line 2661
;2661:  cent->pe.nonseg.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 2663
;2662:
;2663:  if (cg_debugPosition.integer)
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1461
line 2664
;2664:    CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle);
ADDRGP4 $1464
ARGP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1461
line 2665
;2665:}
LABELV $1455
endproc CG_ResetPlayerEntity 52 12
export CG_PlayerDisconnect
proc CG_PlayerDisconnect 12 16
line 2676
;2666:
;2667:/*
;2668: ==================
;2669: CG_PlayerDisconnect
;2670:
;2671: Player disconnecting
;2672: ==================
;2673: */
;2674:void
;2675:CG_PlayerDisconnect(vec3_t org)
;2676:{
line 2679
;2677:  particleSystem_t *ps;
;2678:
;2679:  trap_S_StartSound(org, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.disconnectSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+252
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2681
;2680:
;2681:  ps = CG_SpawnNewParticleSystem(cgs.media.disconnectPS);
ADDRGP4 cgs+268684+248
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2683
;2682:
;2683:  if (CG_IsParticleSystemValid(&ps))
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1470
line 2684
;2684:  {
line 2685
;2685:    CG_SetAttachmentPoint(&ps->attachment, org);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentPoint
CALLV
pop
line 2686
;2686:    CG_AttachToPoint(&ps->attachment);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToPoint
CALLV
pop
line 2687
;2687:  }
LABELV $1470
line 2688
;2688:}
LABELV $1465
endproc CG_PlayerDisconnect 12 16
export CG_Bleed
proc CG_Bleed 20 8
line 2699
;2689:
;2690:/*
;2691: =================
;2692: CG_Bleed
;2693:
;2694: This is the spurt of blood when a character gets hit
;2695: =================
;2696: */
;2697:void
;2698:CG_Bleed(vec3_t origin, vec3_t normal, int entityNum)
;2699:{
line 2700
;2700:  pTeam_t team = cgs.clientinfo[entityNum].team;
ADDRLP4 4
CNSTI4 1760
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 cgs+41408+68
ADDP4
INDIRI4
ASGNI4
line 2704
;2701:  qhandle_t bleedPS;
;2702:  particleSystem_t *ps;
;2703:
;2704:  if (!cg_blood.integer)
ADDRGP4 cg_blood+12
INDIRI4
CNSTI4 0
NEI4 $1475
line 2705
;2705:    return;
ADDRGP4 $1472
JUMPV
LABELV $1475
line 2707
;2706:
;2707:  if (team == PTE_ALIENS)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1478
line 2708
;2708:    bleedPS = cgs.media.alienBleedPS;
ADDRLP4 8
ADDRGP4 cgs+268684+588
INDIRI4
ASGNI4
ADDRGP4 $1479
JUMPV
LABELV $1478
line 2709
;2709:  else if (team == PTE_HUMANS)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1472
line 2710
;2710:    bleedPS = cgs.media.humanBleedPS;
ADDRLP4 8
ADDRGP4 cgs+268684+592
INDIRI4
ASGNI4
line 2712
;2711:  else
;2712:    return;
LABELV $1483
LABELV $1479
line 2714
;2713:
;2714:  ps = CG_SpawnNewParticleSystem(bleedPS);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 2716
;2715:
;2716:  if (CG_IsParticleSystemValid(&ps))
ADDRLP4 0
ARGP4
ADDRLP4 16
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1486
line 2717
;2717:  {
line 2718
;2718:    CG_SetAttachmentPoint(&ps->attachment, origin);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetAttachmentPoint
CALLV
pop
line 2719
;2719:    CG_SetAttachmentCent(&ps->attachment, &cg_entities[entityNum]);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 1724
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_SetAttachmentCent
CALLV
pop
line 2720
;2720:    CG_AttachToPoint(&ps->attachment);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToPoint
CALLV
pop
line 2722
;2721:
;2722:    CG_SetParticleSystemNormal(ps, normal);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SetParticleSystemNormal
CALLV
pop
line 2723
;2723:  }
LABELV $1486
line 2724
;2724:}
LABELV $1472
endproc CG_Bleed 20 8
export CG_AtHighestClass
proc CG_AtHighestClass 20 16
line 2735
;2725:
;2726:/*
;2727: ===============
;2728: CG_AtHighestClass
;2729:
;2730: Is the local client at the highest class possible?
;2731: ===============
;2732: */
;2733:qboolean
;2734:CG_AtHighestClass(void)
;2735:{
line 2737
;2736:  int i;
;2737:  qboolean superiorClasses = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2739
;2738:
;2739:  for(i = PCL_NONE + 1;i < PCL_NUM_CLASSES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1489
line 2740
;2740:  {
line 2741
;2741:    if (BG_ClassCanEvolveFromTo(cg.predictedPlayerState.stats[STAT_PCLASS], i, ALIEN_MAX_KILLS, 0) >= 0 && BG_FindStagesForClass(i, cgs.alienStage)
ADDRGP4 cg+107636+184+28
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 BG_ClassCanEvolveFromTo
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1493
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+34716
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindStagesForClass
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1493
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_ClassIsAllowed
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1493
line 2743
;2742:        && BG_ClassIsAllowed(i))
;2743:    {
line 2744
;2744:      superiorClasses = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2745
;2745:      break;
ADDRGP4 $1491
JUMPV
LABELV $1493
line 2747
;2746:    }
;2747:  }
LABELV $1490
line 2739
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $1489
LABELV $1491
line 2749
;2748:
;2749:  return !superiorClasses;
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1500
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1501
JUMPV
LABELV $1500
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1501
ADDRLP4 8
INDIRI4
RETI4
LABELV $1488
endproc CG_AtHighestClass 20 16
export CG_PlayerOnFire
proc CG_PlayerOnFire 12 16
line 2754
;2750:}
;2751:
;2752://Flamer fire effect :).
;2753:void CG_PlayerOnFire(centity_t *cent)
;2754:{
line 2757
;2755:  particleSystem_t *ps;
;2756:
;2757:  if(cent->fireTime > cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $1503
line 2758
;2758:  {
line 2759
;2759:    return;
ADDRGP4 $1502
JUMPV
LABELV $1503
line 2762
;2760:  }
;2761:  else
;2762:  {
line 2763
;2763:    cent->fireTime = cg.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2764
;2764:  }
line 2766
;2765:
;2766:  trap_S_StartSound(cent->lerpOrigin, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.fireSound);
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+268684+648
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2768
;2767:
;2768:  ps = CG_SpawnNewParticleSystem(cgs.media.fire);
ADDRGP4 cgs+268684+644
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_SpawnNewParticleSystem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2770
;2769:
;2770:  if (CG_IsParticleSystemValid(&ps))
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 CG_IsParticleSystemValid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1511
line 2771
;2771:  {
line 2772
;2772:    CG_SetAttachmentPoint(&ps->attachment, cent->lerpOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRGP4 CG_SetAttachmentPoint
CALLV
pop
line 2773
;2773:    CG_AttachToPoint(&ps->attachment);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 CG_AttachToPoint
CALLV
pop
line 2774
;2774:  }
LABELV $1511
line 2775
;2775:}
LABELV $1502
endproc CG_PlayerOnFire 12 16
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
import CG_AddRefEntityWithPowerups
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
LABELV $1464
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1341
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 112
byte 1 115
byte 1 101
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 112
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1266
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
LABELV $1057
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $735
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
LABELV $568
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $492
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $458
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $454
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
align 1
LABELV $438
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $428
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $426
byte 1 103
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
LABELV $424
byte 1 103
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
LABELV $422
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $420
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $418
byte 1 116
byte 1 0
align 1
LABELV $416
byte 1 108
byte 1 0
align 1
LABELV $414
byte 1 119
byte 1 0
align 1
LABELV $412
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $410
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $408
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $406
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $403
byte 1 110
byte 1 0
align 1
LABELV $352
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
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $349
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
byte 1 37
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $348
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
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $345
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
byte 1 37
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $329
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $325
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $314
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $313
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $310
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $293
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
LABELV $288
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
byte 1 110
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $285
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
LABELV $282
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
LABELV $281
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
LABELV $278
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
LABELV $275
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
LABELV $272
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
LABELV $268
byte 1 78
byte 1 111
byte 1 110
byte 1 45
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $265
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
byte 1 110
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 103
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
LABELV $260
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $257
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
LABELV $256
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $253
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
LABELV $252
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $249
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $248
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
byte 1 0
align 1
LABELV $247
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
LABELV $225
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
LABELV $198
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
LABELV $195
byte 1 110
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $192
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $189
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $178
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $169
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
LABELV $166
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $162
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $155
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $154
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $149
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
LABELV $141
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
LABELV $135
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $120
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
LABELV $119
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
LABELV $118
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
LABELV $117
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
LABELV $116
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $115
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
LABELV $114
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
LABELV $113
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
LABELV $112
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
LABELV $111
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
LABELV $110
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
LABELV $109
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
LABELV $108
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
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
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
LABELV $103
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
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
LABELV $102
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
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
LABELV $101
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $100
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $99
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
