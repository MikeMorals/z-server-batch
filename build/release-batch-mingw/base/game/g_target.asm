export Think_Target_Delay
code
proc Think_Target_Delay 4 8
file "..\..\..\..\src/game/g_target.c"
line 32
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
;26://==========================================================
;27:
;28:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8)
;29:"wait" seconds to pause before firing targets.
;30:"random" delay variance, total delay = delay +/- random seconds
;31: */
;32:void Think_Target_Delay(gentity_t *ent) {
line 33
;33:  G_UseTargets(ent, ent->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 34
;34:}
LABELV $84
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 8 0
line 36
;35:
;36:void Use_Target_Delay(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 37
;37:  ent->nextthink = level.time + (ent->wait + ent->random * crandom()) * 1000;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 38
;38:  ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 39
;39:  ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 40
;40:}
LABELV $85
endproc Use_Target_Delay 8 0
export SP_target_delay
proc SP_target_delay 4 12
line 42
;41:
;42:void SP_target_delay(gentity_t *ent) {
line 44
;43:  // check delay for backwards compatability
;44:  if (!G_SpawnFloat("delay", "0", &ent->wait))
ADDRGP4 $90
ARGP4
ADDRGP4 $91
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $88
line 45
;45:    G_SpawnFloat("wait", "1", &ent->wait);
ADDRGP4 $92
ARGP4
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
LABELV $88
line 47
;46:
;47:  if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
NEF4 $94
line 48
;48:    ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $94
line 50
;49:
;50:  ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 51
;51:}
LABELV $87
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 0 8
line 61
;52:
;53:
;54://==========================================================
;55:
;56:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;57:"count" number of points to add, default 1
;58:
;59:The activator is given this many points.
;60: */
;61:void Use_Target_Score(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 62
;62:  if (!activator)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $97
line 63
;63:    return;
ADDRGP4 $96
JUMPV
LABELV $97
line 65
;64:
;65:  AddScore(activator, ent->count);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 66
;66:}
LABELV $96
endproc Use_Target_Score 0 8
export SP_target_score
proc SP_target_score 0 0
line 68
;67:
;68:void SP_target_score(gentity_t *ent) {
line 69
;69:  if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $100
line 70
;70:    ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 1
ASGNI4
LABELV $100
line 72
;71:
;72:  ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 73
;73:}
LABELV $99
endproc SP_target_score 0 0
export Use_Target_Print
proc Use_Target_Print 16 8
line 82
;74:
;75:
;76://==========================================================
;77:
;78:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) humanteam alienteam private
;79:"message" text to print
;80:If "private", only the activator gets the message.  If no checks, all clients get the message.
;81: */
;82:void Use_Target_Print(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 83
;83:  if (activator && activator->client && (ent->spawnflags & 4)) {
ADDRLP4 0
ADDRFP4 8
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
EQU4 $103
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $103
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $103
line 84
;84:    trap_SendServerCommand(activator - g_entities, va("cp \"%s\"", ent->message));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 85
;85:    return;
ADDRGP4 $102
JUMPV
LABELV $103
line 88
;86:  }
;87:
;88:  if (ent->spawnflags & 3) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $106
line 89
;89:    if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $108
line 90
;90:      G_TeamCommand(PTE_HUMANS, va("cp \"%s\"", ent->message));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
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
ADDRGP4 G_TeamCommand
CALLV
pop
LABELV $108
line 91
;91:    if (ent->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $102
line 92
;92:      G_TeamCommand(PTE_ALIENS, va("cp \"%s\"", ent->message));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 94
;93:
;94:    return;
ADDRGP4 $102
JUMPV
LABELV $106
line 97
;95:  }
;96:
;97:  trap_SendServerCommand(-1, va("cp \"%s\"", ent->message));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 98
;98:}
LABELV $102
endproc Use_Target_Print 16 8
export SP_target_print
proc SP_target_print 0 0
line 100
;99:
;100:void SP_target_print(gentity_t *ent) {
line 101
;101:  ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 102
;102:}
LABELV $112
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 8 12
line 119
;103:
;104:
;105://==========================================================
;106:
;107:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;108:"noise"   wav file to play
;109:
;110:A global sound will play full volume throughout the level.
;111:Activator sounds will play on the player that activated the target.
;112:Global and activator sounds can't be combined with looping.
;113:Normal sounds play each time the target is used.
;114:Looped sounds will be toggled by use functions.
;115:Multiple identical looping sounds will just increase volume without any speed cost.
;116:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;117:"random"  wait variance, default is 0
;118: */
;119:void Use_Target_Speaker(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 120
;120:  if (ent->spawnflags & 3) { // looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $114
line 121
;121:    if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $116
line 122
;122:      ent->s.loopSound = 0; // turn it off
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $115
JUMPV
LABELV $116
line 124
;123:    else
;124:      ent->s.loopSound = ent->noise_index; // start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ASGNI4
line 125
;125:  } else {
ADDRGP4 $115
JUMPV
LABELV $114
line 127
;126:    // normal sound
;127:    if (ent->spawnflags & 8 && activator)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $118
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 128
;128:      G_AddEvent(activator, EV_GENERAL_SOUND, ent->noise_index);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $118
line 129
;129:    else if (ent->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $120
line 130
;130:      G_AddEvent(ent, EV_GLOBAL_SOUND, ent->noise_index);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 35
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
ADDRGP4 $121
JUMPV
LABELV $120
line 132
;131:    else
;132:      G_AddEvent(ent, EV_GENERAL_SOUND, ent->noise_index);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $121
LABELV $119
line 133
;133:  }
LABELV $115
line 134
;134:}
LABELV $113
endproc Use_Target_Speaker 8 12
export SP_target_speaker
proc SP_target_speaker 112 16
line 136
;135:
;136:void SP_target_speaker(gentity_t *ent) {
line 140
;137:  char buffer[ MAX_QPATH ];
;138:  char *s;
;139:
;140:  G_SpawnFloat("wait", "0", &ent->wait);
ADDRGP4 $92
ARGP4
ADDRGP4 $91
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 141
;141:  G_SpawnFloat("random", "0", &ent->random);
ADDRGP4 $123
ARGP4
ADDRGP4 $91
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 143
;142:
;143:  if (!G_SpawnString("noise", "NOSOUND", &s))
ADDRGP4 $126
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $124
line 144
;144:    G_Error("target_speaker without a noise key at %s", vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $128
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $124
line 148
;145:
;146:  // force all client reletive sounds to be "activator" speakers that
;147:  // play on the entity that activates it
;148:  if (s[ 0 ] == '*')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $129
line 149
;149:    ent->spawnflags |= 8;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $129
line 151
;150:
;151:  if (!strstr(s, ".wav"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 80
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $131
line 152
;152:    Com_sprintf(buffer, sizeof ( buffer), "%s.wav", s);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $132
JUMPV
LABELV $131
line 154
;153:  else
;154:    Q_strncpyz(buffer, s, sizeof ( buffer));
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $132
line 156
;155:
;156:  ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 84
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 900
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 159
;157:
;158:  // a repeating speaker can be done completely client side
;159:  ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 160
;160:  ent->s.eventParm = ent->noise_index;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ASGNI4
line 161
;161:  ent->s.frame = ent->wait * 10;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1092616192
ADDRLP4 92
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 162
;162:  ent->s.clientNum = ent->random * 10;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1092616192
ADDRLP4 96
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 166
;163:
;164:
;165:  // check for prestarted looping sound
;166:  if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $135
line 167
;167:    ent->s.loopSound = ent->noise_index;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ASGNI4
LABELV $135
line 169
;168:
;169:  ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 171
;170:
;171:  if (ent->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $137
line 172
;172:    ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $137
line 174
;173:
;174:  VectorCopy(ent->s.origin, ent->s.pos.trBase);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 178
;175:
;176:  // must link the entity so we get areas and clusters so
;177:  // the server can determine who to send updates to
;178:  trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 179
;179:}
LABELV $122
endproc SP_target_speaker 112 16
export target_teleporter_use
proc target_teleporter_use 20 12
line 183
;180:
;181://==========================================================
;182:
;183:void target_teleporter_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 186
;184:  gentity_t *dest;
;185:
;186:  if (!activator || !activator->client)
ADDRLP4 4
ADDRFP4 8
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
EQU4 $142
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $140
LABELV $142
line 187
;187:    return;
ADDRGP4 $139
JUMPV
LABELV $140
line 189
;188:
;189:  dest = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 191
;190:
;191:  if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 192
;192:    G_Printf("Couldn't find teleporter destination\n");
ADDRGP4 $145
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 193
;193:    return;
ADDRGP4 $139
JUMPV
LABELV $143
line 196
;194:  }
;195:
;196:  TeleportPlayer(activator, dest->s.origin, dest->s.angles);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 197
;197:}
LABELV $139
endproc target_teleporter_use 20 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 202
;198:
;199:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;200:The activator will be teleported away.
;201: */
;202:void SP_target_teleporter(gentity_t *self) {
line 203
;203:  if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $147
line 204
;204:    G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $149
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $147
line 206
;205:
;206:  self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 207
;207:}
LABELV $146
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 44 12
line 216
;208:
;209://==========================================================
;210:
;211:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;212:This doesn't perform any actions except fire its targets.
;213:The activator can be forced to be from a certain team.
;214:if RANDOM is checked, only one of the targets will be fired, not all of them
;215: */
;216:void target_relay_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 217
;217:  if ((self->spawnflags & 1) && activator && activator->client &&
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $151
ADDRLP4 0
ADDRFP4 8
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
EQU4 $151
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $151
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $151
line 219
;218:          activator->client->ps.stats[ STAT_PTEAM ] != PTE_HUMANS)
;219:    return;
ADDRGP4 $150
JUMPV
LABELV $151
line 221
;220:
;221:  if ((self->spawnflags & 2) && activator && activator->client &&
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $153
ADDRLP4 12
ADDRFP4 8
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
EQU4 $153
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $153
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $153
line 223
;222:          activator->client->ps.stats[ STAT_PTEAM ] != PTE_ALIENS)
;223:    return;
ADDRGP4 $150
JUMPV
LABELV $153
line 225
;224:
;225:  if (self->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $155
line 228
;226:    gentity_t *ent;
;227:
;228:    ent = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 229
;229:    if (ent && ent->use)
ADDRLP4 32
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $150
ADDRLP4 32
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $150
line 230
;230:      ent->use(ent, self, activator);
ADDRLP4 40
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CALLV
pop
line 232
;231:
;232:    return;
ADDRGP4 $150
JUMPV
LABELV $155
line 235
;233:  }
;234:
;235:  G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 236
;236:}
LABELV $150
endproc target_relay_use 44 12
export SP_target_relay
proc SP_target_relay 0 0
line 238
;237:
;238:void SP_target_relay(gentity_t *self) {
line 239
;239:  self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 240
;240:}
LABELV $159
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 8 32
line 248
;241:
;242:
;243://==========================================================
;244:
;245:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;246:Kills the activator.
;247: */
;248:void target_kill_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 249
;249:  if (!activator)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 250
;250:    return;
ADDRGP4 $160
JUMPV
LABELV $161
line 252
;251:
;252:  G_Damage(activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 253
;253:}
LABELV $160
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
line 255
;254:
;255:void SP_target_kill(gentity_t *self) {
line 256
;256:  self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 257
;257:}
LABELV $163
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 262
;258:
;259:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;260:Used as a positional target for in-game calculation, like jumppad targets.
;261: */
;262:void SP_target_position(gentity_t *self) {
line 263
;263:  G_SetOrigin(self, self->s.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 264
;264:}
LABELV $164
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 266
;265:
;266:static void target_location_linkup(gentity_t *ent) {
line 270
;267:  int i;
;268:  int n;
;269:
;270:  if (level.locationLinked)
ADDRGP4 level+185080
INDIRI4
CNSTI4 0
EQI4 $166
line 271
;271:    return;
ADDRGP4 $165
JUMPV
LABELV $166
line 273
;272:
;273:  level.locationLinked = qtrue;
ADDRGP4 level+185080
CNSTI4 1
ASGNI4
line 275
;274:
;275:  level.locationHead = NULL;
ADDRGP4 level+185084
CNSTP4 0
ASGNP4
line 277
;276:
;277:  trap_SetConfigstring(CS_LOCATIONS, "unknown");
CNSTI4 801
ARGI4
ADDRGP4 $171
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 279
;278:
;279:  for (i = 0, ent = g_entities, n = 1; i < level.num_entities; i++, ent++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 280
;280:    if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $177
line 282
;281:      // lets overload some variables!
;282:      ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 283
;283:      trap_SetConfigstring(CS_LOCATIONS + n, ent->message);
ADDRLP4 4
INDIRI4
CNSTI4 801
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 284
;284:      n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:      ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+185084
INDIRP4
ASGNP4
line 286
;286:      level.locationHead = ent;
ADDRGP4 level+185084
ADDRFP4 0
INDIRP4
ASGNP4
line 287
;287:    }
LABELV $177
line 288
;288:  }
LABELV $173
line 279
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $175
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $172
line 290
;289:  // All linked together now
;290:}
LABELV $165
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 300
;291:
;292:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;293:Set "message" to the name of this location.
;294:Set "count" to 0-7 for color.
;295:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;296:
;297:Closest target_location in sight used for the location, if none
;298:in site, closest in distance
;299: */
;300:void SP_target_location(gentity_t *self) {
line 301
;301:  self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 302
;302:  self->nextthink = level.time + 200; // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 304
;303:
;304:  G_SetOrigin(self, self->s.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 305
;305:}
LABELV $182
endproc SP_target_location 4 8
export target_rumble_think
proc target_rumble_think 24 0
line 312
;306:
;307:/*
;308:===============
;309:target_rumble_think
;310:===============
;311: */
;312:void target_rumble_think(gentity_t *self) {
line 316
;313:  int i;
;314:  gentity_t *ent;
;315:
;316:  if (self->last_move_time < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
GEI4 $185
line 317
;317:    self->last_move_time = level.time + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 level+28
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
LABELV $185
line 319
;318:
;319:  for (i = 0, ent = g_entities + i; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $192
JUMPV
LABELV $189
line 320
;320:    if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $194
line 321
;321:      continue;
ADDRGP4 $190
JUMPV
LABELV $194
line 323
;322:
;323:    if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $196
line 324
;324:      continue;
ADDRGP4 $190
JUMPV
LABELV $196
line 326
;325:
;326:    if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $198
line 327
;327:      continue;
ADDRGP4 $190
JUMPV
LABELV $198
line 329
;328:
;329:    ent->client->ps.groundEntityNum = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 330
;330:    ent->client->ps.velocity[ 0 ] += crandom() * 150;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1125515264
CNSTF4 1073741824
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 331
;331:    ent->client->ps.velocity[ 1 ] += crandom() * 150;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1125515264
CNSTF4 1073741824
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 332
;332:    ent->client->ps.velocity[ 2 ] = self->speed;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 333
;333:  }
LABELV $190
line 319
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $192
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $189
line 335
;334:
;335:  if (level.time < self->timestamp)
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
GEI4 $200
line 336
;336:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $200
line 337
;337:}
LABELV $184
endproc target_rumble_think 24 0
export target_rumble_use
proc target_rumble_use 4 0
line 344
;338:
;339:/*
;340:===============
;341:target_rumble_use
;342:===============
;343: */
;344:void target_rumble_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 345
;345:  self->timestamp = level.time + (self->count * FRAMETIME);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 346
;346:  self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 347
;347:  self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 348
;348:  self->last_move_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 349
;349:}
LABELV $204
endproc target_rumble_use 4 0
export SP_target_rumble
proc SP_target_rumble 4 12
line 356
;350:
;351:/*
;352:===============
;353:SP_target_rumble
;354:===============
;355: */
;356:void SP_target_rumble(gentity_t *self) {
line 357
;357:  if (!self->targetname) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $208
line 358
;358:    G_Printf(S_COLOR_YELLOW "WARNING: untargeted %s at %s\n", self->classname,
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $210
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 360
;359:            vtos(self->s.origin));
;360:  }
LABELV $208
line 362
;361:
;362:  if (!self->count)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $211
line 363
;363:    self->count = 10;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
CNSTI4 10
ASGNI4
LABELV $211
line 365
;364:
;365:  if (!self->speed)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $213
line 366
;366:    self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1120403456
ASGNF4
LABELV $213
line 368
;367:
;368:  self->think = target_rumble_think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 target_rumble_think
ASGNP4
line 369
;369:  self->use = target_rumble_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_rumble_use
ASGNP4
line 370
;370:}
LABELV $207
endproc SP_target_rumble 4 12
export target_alien_win_use
proc target_alien_win_use 0 0
line 377
;371:
;372:/*
;373:===============
;374:target_alien_win_use
;375:===============
;376: */
;377:void target_alien_win_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 378
;378:  level.uncondAlienWin = qtrue;
ADDRGP4 level+189836
CNSTI4 1
ASGNI4
line 379
;379:}
LABELV $215
endproc target_alien_win_use 0 0
export SP_target_alien_win
proc SP_target_alien_win 0 0
line 386
;380:
;381:/*
;382:===============
;383:SP_target_alien_win
;384:===============
;385: */
;386:void SP_target_alien_win(gentity_t *self) {
line 387
;387:  self->use = target_alien_win_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_alien_win_use
ASGNP4
line 388
;388:}
LABELV $217
endproc SP_target_alien_win 0 0
export target_human_win_use
proc target_human_win_use 0 0
line 395
;389:
;390:/*
;391:===============
;392:target_human_win_use
;393:===============
;394: */
;395:void target_human_win_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 396
;396:  level.uncondHumanWin = qtrue;
ADDRGP4 level+189840
CNSTI4 1
ASGNI4
line 397
;397:}
LABELV $218
endproc target_human_win_use 0 0
export SP_target_human_win
proc SP_target_human_win 0 0
line 404
;398:
;399:/*
;400:===============
;401:SP_target_human_win
;402:===============
;403: */
;404:void SP_target_human_win(gentity_t *self) {
line 405
;405:  self->use = target_human_win_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_human_win_use
ASGNP4
line 406
;406:}
LABELV $220
endproc SP_target_human_win 0 0
export target_hurt_use
proc target_hurt_use 12 32
line 413
;407:
;408:/*
;409:===============
;410:target_hurt_use
;411:===============
;412: */
;413:void target_hurt_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 415
;414:  // hurt the activator
;415:  if (!activator || !activator->takedamage)
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $224
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
NEI4 $222
LABELV $224
line 416
;416:    return;
ADDRGP4 $221
JUMPV
LABELV $222
line 418
;417:
;418:  G_Damage(activator, self, self, NULL, NULL, self->damage, 0, MOD_TRIGGER_HURT);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 419
;419:}
LABELV $221
endproc target_hurt_use 12 32
export SP_target_hurt
proc SP_target_hurt 4 12
line 426
;420:
;421:/*
;422:===============
;423:SP_target_hurt
;424:===============
;425: */
;426:void SP_target_hurt(gentity_t *self) {
line 427
;427:  if (!self->targetname) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $226
line 428
;428:    G_Printf(S_COLOR_YELLOW "WARNING: untargeted %s at %s\n", self->classname,
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $210
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 430
;429:            vtos(self->s.origin));
;430:  }
LABELV $226
line 432
;431:
;432:  if (!self->damage)
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
NEI4 $228
line 433
;433:    self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 5
ASGNI4
LABELV $228
line 435
;434:
;435:  self->use = target_hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 target_hurt_use
ASGNP4
line 436
;436:}
LABELV $225
endproc SP_target_hurt 4 12
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
import Svcmd_GameMem_f
import G_DefragmentMemory
import G_Free
import G_InitMemory
import G_Alloc
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
LABELV $210
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
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $171
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $149
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $145
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $133
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $126
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $123
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 0
align 1
LABELV $92
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $91
byte 1 48
byte 1 0
align 1
LABELV $90
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
