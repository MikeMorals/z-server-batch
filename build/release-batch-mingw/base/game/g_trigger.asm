export InitTrigger
code
proc InitTrigger 12 8
file "..\..\..\..\src/game/g_trigger.c"
line 26
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
;26:void InitTrigger(gentity_t *self) {
line 27
;27:  if (!VectorCompare(self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $85
line 28
;28:    G_SetMovedir(self->s.angles, self->movedir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
LABELV $85
line 30
;29:
;30:  trap_SetBrushModel(self, self->model);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 31
;31:  self->r.contents = CONTENTS_TRIGGER; // replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 32
;32:  self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 33
;33:}
LABELV $84
endproc InitTrigger 12 8
export multi_wait
proc multi_wait 0 0
line 38
;34:
;35:
;36:// the wait time has passed, so set back up for another activation
;37:
;38:void multi_wait(gentity_t *ent) {
line 39
;39:  ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 40
;40:}
LABELV $87
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 12 8
line 47
;41:
;42:
;43:// the trigger was just activated
;44:// ent->activator should be set to the activator so it can be held through a delay
;45:// so wait for the delay time before firing
;46:
;47:void multi_trigger(gentity_t *ent, gentity_t *activator) {
line 48
;48:  ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 49
;49:  if (ent->nextthink)
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $89
line 50
;50:    return; // can't retrigger until the wait is over
ADDRGP4 $88
JUMPV
LABELV $89
line 52
;51:
;52:  if (activator->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $91
line 53
;53:    if ((ent->spawnflags & 1) &&
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $93
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $93
line 55
;54:            activator->client->ps.stats[ STAT_PTEAM ] != PTE_HUMANS)
;55:      return;
ADDRGP4 $88
JUMPV
LABELV $93
line 57
;56:
;57:    if ((ent->spawnflags & 2) &&
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $95
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $95
line 59
;58:            activator->client->ps.stats[ STAT_PTEAM ] != PTE_ALIENS)
;59:      return;
ADDRGP4 $88
JUMPV
LABELV $95
line 60
;60:  }
LABELV $91
line 62
;61:
;62:  G_UseTargets(ent, ent->activator);
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
line 64
;63:
;64:  if (ent->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
LEF4 $97
line 65
;65:    ent->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 66
;66:    ent->nextthink = level.time + (ent->wait + ent->random * crandom()) * 1000;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
line 67
;67:  } else {
ADDRGP4 $98
JUMPV
LABELV $97
line 70
;68:    // we can't just remove (self) here, because this is a touch function
;69:    // called while looping through area links...
;70:    ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 71
;71:    ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 72
;72:    ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 73
;73:  }
LABELV $98
line 74
;74:}
LABELV $88
endproc multi_trigger 12 8
export Use_Multi
proc Use_Multi 0 8
line 76
;75:
;76:void Use_Multi(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 77
;77:  multi_trigger(ent, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 78
;78:}
LABELV $101
endproc Use_Multi 0 8
export Touch_Multi
proc Touch_Multi 4 8
line 80
;79:
;80:void Touch_Multi(gentity_t *self, gentity_t *other, trace_t *trace) {
line 81
;81:  if (!other->client && other->s.eType != ET_BUILDABLE)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $103
line 82
;82:    return;
ADDRGP4 $102
JUMPV
LABELV $103
line 84
;83:
;84:  multi_trigger(self, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 85
;85:}
LABELV $102
endproc Touch_Multi 4 8
export SP_trigger_multiple
proc SP_trigger_multiple 12 12
line 94
;86:
;87:/*QUAKED trigger_multiple (.5 .5 .5) ?
;88:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;89:"random"  wait variance, default is 0
;90:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;91:so, the basic time between firing is a random time between
;92:(wait - random) and (wait + random)
;93: */
;94:void SP_trigger_multiple(gentity_t *ent) {
line 95
;95:  G_SpawnFloat("wait", "0.5", &ent->wait);
ADDRGP4 $106
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 96
;96:  G_SpawnFloat("random", "0", &ent->random);
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 98
;97:
;98:  if (ent->random >= ent->wait && ent->wait >= 0) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $110
ADDRLP4 4
INDIRF4
CNSTF4 0
LTF4 $110
line 99
;99:    ent->random = ent->wait - FRAMETIME;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 100
;100:    G_Printf("trigger_multiple has random >= wait\n");
ADDRGP4 $112
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 101
;101:  }
LABELV $110
line 103
;102:
;103:  ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 104
;104:  ent->use = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 106
;105:
;106:  InitTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 107
;107:  trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 108
;108:}
LABELV $105
endproc SP_trigger_multiple 12 12
export trigger_always_think
proc trigger_always_think 4 8
line 118
;109:
;110:/*
;111:==============================================================================
;112:
;113:trigger_always
;114:
;115:==============================================================================
;116: */
;117:
;118:void trigger_always_think(gentity_t *ent) {
line 119
;119:  G_UseTargets(ent, ent);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 120
;120:  G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 121
;121:}
LABELV $113
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 126
;122:
;123:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;124:This trigger will always fire.  It is activated by the world.
;125: */
;126:void SP_trigger_always(gentity_t *ent) {
line 128
;127:  // we must have some delay to make sure our use targets are present
;128:  ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 129
;129:  ent->think = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 130
;130:}
LABELV $114
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 0 0
line 140
;131:
;132:/*
;133:==============================================================================
;134:
;135:trigger_push
;136:
;137:==============================================================================
;138: */
;139:
;140:void trigger_push_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 141
;141:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $117
line 142
;142:    return;
LABELV $117
line 143
;143:}
LABELV $116
endproc trigger_push_touch 0 0
export AimAtTarget
proc AimAtTarget 72 4
line 152
;144:
;145:/*
;146:=================
;147:AimAtTarget
;148:
;149:Calculate origin2 so the target apogee will be hit
;150:=================
;151: */
;152:void AimAtTarget(gentity_t *self) {
line 158
;153:  gentity_t *ent;
;154:  vec3_t origin;
;155:  float height, gravity, time, forward;
;156:  float dist;
;157:
;158:  VectorAdd(self->r.absmin, self->r.absmax, origin);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 159
;159:  VectorScale(origin, 0.5, origin);
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 161
;160:
;161:  ent = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
ASGNP4
line 163
;162:
;163:  if (!ent) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $126
line 164
;164:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 165
;165:    return;
ADDRGP4 $119
JUMPV
LABELV $126
line 168
;166:  }
;167:
;168:  height = ent->s.origin[ 2 ] - origin[ 2 ];
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 169
;169:  gravity = g_gravity.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ASGNF4
line 170
;170:  time = sqrt(height / (0.5 * gravity));
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 52
INDIRF4
ASGNF4
line 172
;171:
;172:  if (!time) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $130
line 173
;173:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 174
;174:    return;
ADDRGP4 $119
JUMPV
LABELV $130
line 178
;175:  }
;176:
;177:  // set s.origin2 to the push velocity
;178:  VectorSubtract(ent->s.origin, origin, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 179
;179:  self->s.origin2[ 2 ] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 180
;180:  dist = VectorNormalize(self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 182
;181:
;182:  forward = dist / time;
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 183
;183:  VectorScale(self->s.origin2, forward, self->s.origin2);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 185
;184:
;185:  self->s.origin2[ 2 ] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 186
;186:}
LABELV $119
endproc AimAtTarget 72 4
export SP_trigger_push
proc SP_trigger_push 4 4
line 192
;187:
;188:/*QUAKED trigger_push (.5 .5 .5) ?
;189:Must point at a target_position, which will be the apex of the leap.
;190:This will be client side predicted, unlike target_push
;191: */
;192:void SP_trigger_push(gentity_t *self) {
line 193
;193:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 196
;194:
;195:  // unlike other triggers, we need to send this one to the client
;196:  self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 198
;197:
;198:  self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 199
;199:  self->touch = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 200
;200:  self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 201
;201:  self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 202
;202:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 203
;203:}
LABELV $134
endproc SP_trigger_push 4 4
export Use_target_push
proc Use_target_push 0 0
line 205
;204:
;205:void Use_target_push(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 206
;206:  if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $137
line 207
;207:    return;
ADDRGP4 $136
JUMPV
LABELV $137
line 209
;208:
;209:  if (activator->client->ps.pm_type != PM_NORMAL)
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 210
;210:    return;
ADDRGP4 $136
JUMPV
LABELV $139
line 212
;211:
;212:  VectorCopy(self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 214
;213:
;214:}
LABELV $136
endproc Use_target_push 0 0
export SP_target_push
proc SP_target_push 36 8
line 220
;215:
;216:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8)
;217:Pushes the activator in the direction.of angle, or towards a target apex.
;218:"speed"   defaults to 1000
;219: */
;220:void SP_target_push(gentity_t *self) {
line 221
;221:  if (!self->speed)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $142
line 222
;222:    self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1148846080
ASGNF4
LABELV $142
line 224
;223:
;224:  G_SetMovedir(self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 225
;225:  VectorScale(self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
line 227
;226:
;227:  if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $144
line 228
;228:    VectorCopy(self->s.origin, self->r.absmin);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 229
;229:    VectorCopy(self->s.origin, self->r.absmax);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 230
;230:    self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 231
;231:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 232
;232:  }
LABELV $144
line 234
;233:
;234:  self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 235
;235:}
LABELV $141
endproc SP_target_push 36 8
export trigger_teleporter_touch
proc trigger_teleporter_touch 16 12
line 245
;236:
;237:/*
;238:==============================================================================
;239:
;240:trigger_teleport
;241:
;242:==============================================================================
;243: */
;244:
;245:void trigger_teleporter_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 248
;246:  gentity_t *dest;
;247:
;248:  if (self->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $148
line 249
;249:    return;
ADDRGP4 $147
JUMPV
LABELV $148
line 251
;250:
;251:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 252
;252:    return;
ADDRGP4 $147
JUMPV
LABELV $150
line 254
;253:
;254:  if (other->client->ps.pm_type == PM_DEAD)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $152
line 255
;255:    return;
ADDRGP4 $147
JUMPV
LABELV $152
line 258
;256:
;257:  // Spectators only?
;258:  if ((self->spawnflags & 1) &&
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $154
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $154
line 260
;259:          other->client->sess.sessionTeam != TEAM_SPECTATOR)
;260:    return;
ADDRGP4 $147
JUMPV
LABELV $154
line 263
;261:
;262:
;263:  dest = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 265
;264:
;265:  if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 266
;266:    G_Printf("Couldn't find teleporter destination\n");
ADDRGP4 $158
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 267
;267:    return;
ADDRGP4 $147
JUMPV
LABELV $156
line 270
;268:  }
;269:
;270:  TeleportPlayer(other, dest->s.origin, dest->s.angles);
ADDRFP4 4
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
line 271
;271:}
LABELV $147
endproc trigger_teleporter_touch 16 12
export trigger_teleporter_use
proc trigger_teleporter_use 4 0
line 278
;272:
;273:/*
;274:===============
;275:trigger_teleport_use
;276:===============
;277: */
;278:void trigger_teleporter_use(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 279
;279:  ent->s.eFlags ^= EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 256
BXORI4
ASGNI4
line 280
;280:}
LABELV $159
endproc trigger_teleporter_use 4 0
export SP_trigger_teleport
proc SP_trigger_teleport 12 4
line 290
;281:
;282:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR SPAWN_DISABLED
;283:Allows client side prediction of teleportation events.
;284:Must point at a target_position, which will be the teleport destination.
;285:
;286:If spectator is set, only spectators can use this teleport
;287:Spectator teleporters are not normally placed in the editor, but are created
;288:automatically near doors to allow spectators to move through them
;289: */
;290:void SP_trigger_teleport(gentity_t *self) {
line 291
;291:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 295
;292:
;293:  // unlike other triggers, we need to send this one to the client
;294:  // unless is a spectator trigger
;295:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $161
line 296
;296:    self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $161
line 298
;297:  else
;298:    self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $162
line 301
;299:
;300:  // SPAWN_DISABLED
;301:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $163
line 302
;302:    self->s.eFlags |= EF_NODRAW;
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
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $163
line 304
;303:
;304:  self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 305
;305:  self->touch = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 306
;306:  self->use = trigger_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_teleporter_use
ASGNP4
line 308
;307:
;308:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 309
;309:}
LABELV $160
endproc SP_trigger_teleport 12 4
export hurt_use
proc hurt_use 0 4
line 332
;310:
;311:
;312:/*
;313:==============================================================================
;314:
;315:trigger_hurt
;316:
;317:==============================================================================
;318: */
;319:
;320:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF - SILENT NO_PROTECTION SLOW
;321:Any entity that touches this will be hurt.
;322:It does dmg points of damage each server frame
;323:Targeting the trigger will toggle its on / off state.
;324:
;325:SILENT      supresses playing the sound
;326:SLOW      changes the damage rate to once per second
;327:NO_PROTECTION *nothing* stops the damage
;328:
;329:"dmg"     default 5 (whole numbers only)
;330:
;331: */
;332:void hurt_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 333
;333:  if (self->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $166
line 334
;334:    trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRGP4 $167
JUMPV
LABELV $166
line 336
;335:  else
;336:    trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $167
line 337
;337:}
LABELV $165
endproc hurt_use 0 4
export hurt_touch
proc hurt_touch 12 32
line 339
;338:
;339:void hurt_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 342
;340:  int dflags;
;341:
;342:  if (!other->takedamage)
ADDRFP4 4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
NEI4 $169
line 343
;343:    return;
ADDRGP4 $168
JUMPV
LABELV $169
line 345
;344:
;345:  if (self->timestamp > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $171
line 346
;346:    return;
ADDRGP4 $168
JUMPV
LABELV $171
line 348
;347:
;348:  if (self->spawnflags & 16)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $174
line 349
;349:    self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
line 351
;350:  else
;351:    self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $175
line 354
;352:
;353:  // play sound
;354:  if (!(self->spawnflags & 4))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $178
line 355
;355:    G_Sound(other, CHAN_AUTO, self->noise_index);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
LABELV $178
line 357
;356:
;357:  if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $180
line 358
;358:    dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $181
JUMPV
LABELV $180
line 360
;359:  else
;360:    dflags = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $181
line 362
;361:
;362:  G_Damage(other, self, self, NULL, NULL, self->damage, dflags, MOD_TRIGGER_HURT);
ADDRFP4 4
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
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 363
;363:}
LABELV $168
endproc hurt_touch 12 32
export SP_trigger_hurt
proc SP_trigger_hurt 4 4
line 365
;364:
;365:void SP_trigger_hurt(gentity_t *self) {
line 366
;366:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 368
;367:
;368:  self->noise_index = G_SoundIndex("sound/misc/electro.wav");
ADDRGP4 $183
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 900
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 369
;369:  self->touch = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 371
;370:
;371:  if (self->damage <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
GTI4 $184
line 372
;372:    self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 5
ASGNI4
LABELV $184
line 374
;373:
;374:  self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 376
;375:
;376:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $186
line 377
;377:    self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 hurt_use
ASGNP4
LABELV $186
line 380
;378:
;379:  // link in to the world if starting active
;380:  if (!(self->spawnflags & 1))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $188
line 381
;381:    trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $188
line 382
;382:}
LABELV $182
endproc SP_trigger_hurt 4 4
export func_timer_think
proc func_timer_think 12 8
line 404
;383:
;384:
;385:/*
;386:==============================================================================
;387:
;388:timer
;389:
;390:==============================================================================
;391: */
;392:
;393:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;394:This should be renamed trigger_timer...
;395:Repeatedly fires its targets.
;396:Can be turned on or off by using.
;397:
;398:"wait"      base time between triggering all targets, default is 1
;399:"random"    wait variance, default is 0
;400:so, the basic time between firing is a random time between
;401:(wait - random) and (wait + random)
;402:
;403: */
;404:void func_timer_think(gentity_t *self) {
line 405
;405:  G_UseTargets(self, self->activator);
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
line 407
;406:  // set time before next firing
;407:  self->nextthink = level.time + 1000 * (self->wait + crandom() * self->random);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 408
;408:}
LABELV $190
endproc func_timer_think 12 8
export func_timer_use
proc func_timer_use 0 4
line 410
;409:
;410:void func_timer_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 411
;411:  self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 414
;412:
;413:  // if on, turn it off
;414:  if (self->nextthink) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $193
line 415
;415:    self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 416
;416:    return;
ADDRGP4 $192
JUMPV
LABELV $193
line 420
;417:  }
;418:
;419:  // turn it on
;420:  func_timer_think(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
line 421
;421:}
LABELV $192
endproc func_timer_use 0 4
export SP_func_timer
proc SP_func_timer 12 12
line 423
;422:
;423:void SP_func_timer(gentity_t *self) {
line 424
;424:  G_SpawnFloat("random", "1", &self->random);
ADDRGP4 $108
ARGP4
ADDRGP4 $196
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 425
;425:  G_SpawnFloat("wait", "1", &self->wait);
ADDRGP4 $106
ARGP4
ADDRGP4 $196
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 427
;426:
;427:  self->use = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 428
;428:  self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 430
;429:
;430:  if (self->random >= self->wait) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
LTF4 $197
line 431
;431:    self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 432
;432:    G_Printf("func_timer at %s has random >= wait\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $199
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 433
;433:  }
LABELV $197
line 435
;434:
;435:  if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $200
line 436
;436:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 437
;437:    self->activator = self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 880
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 438
;438:  }
LABELV $200
line 440
;439:
;440:  self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 441
;441:}
LABELV $195
endproc SP_func_timer 12 12
export G_Checktrigger_stages
proc G_Checktrigger_stages 20 12
line 450
;442:
;443:/*
;444:===============
;445:G_Checktrigger_stages
;446:
;447:Called when stages change
;448:===============
;449: */
;450:void G_Checktrigger_stages(pTeam_t team, stage_t stage) {
line 454
;451:  int i;
;452:  gentity_t *ent;
;453:
;454:  for (i = 1, ent = g_entities + i; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $207
JUMPV
LABELV $204
line 455
;455:    if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $209
line 456
;456:      continue;
ADDRGP4 $205
JUMPV
LABELV $209
line 458
;457:
;458:    if (!Q_stricmp(ent->classname, "trigger_stage")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $211
line 459
;459:      if (team == ent->stageTeam && stage == ent->stageStage)
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
NEI4 $214
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
NEI4 $214
line 460
;460:        ent->use(ent, ent, ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CALLV
pop
LABELV $214
line 461
;461:    }
LABELV $211
line 462
;462:  }
LABELV $205
line 454
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
LABELV $207
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $204
line 463
;463:}
LABELV $203
endproc G_Checktrigger_stages 20 12
export trigger_stage_use
proc trigger_stage_use 4 8
line 470
;464:
;465:/*
;466:===============
;467:trigger_stage_use
;468:===============
;469: */
;470:void trigger_stage_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 471
;471:  G_UseTargets(self, self);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 472
;472:}
LABELV $216
endproc trigger_stage_use 4 8
export SP_trigger_stage
proc SP_trigger_stage 0 12
line 474
;473:
;474:void SP_trigger_stage(gentity_t *self) {
line 475
;475:  G_SpawnInt("team", "0", (int *) &self->stageTeam);
ADDRGP4 $218
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 476
;476:  G_SpawnInt("stage", "0", (int *) &self->stageStage);
ADDRGP4 $219
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 478
;477:
;478:  self->use = trigger_stage_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_stage_use
ASGNP4
line 480
;479:
;480:  self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 481
;481:}
LABELV $217
endproc SP_trigger_stage 0 12
export trigger_win
proc trigger_win 4 8
line 488
;482:
;483:/*
;484:===============
;485:trigger_win
;486:===============
;487: */
;488:void trigger_win(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 489
;489:  G_UseTargets(self, self);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 490
;490:}
LABELV $220
endproc trigger_win 4 8
export SP_trigger_win
proc SP_trigger_win 0 12
line 492
;491:
;492:void SP_trigger_win(gentity_t *self) {
line 493
;493:  G_SpawnInt("team", "0", (int *) &self->stageTeam);
ADDRGP4 $218
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 495
;494:
;495:  self->use = trigger_win;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_win
ASGNP4
line 497
;496:
;497:  self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 498
;498:}
LABELV $221
endproc SP_trigger_win 0 12
export trigger_buildable_match
proc trigger_buildable_match 4 0
line 505
;499:
;500:/*
;501:===============
;502:trigger_buildable_match
;503:===============
;504: */
;505:qboolean trigger_buildable_match(gentity_t *self, gentity_t *activator) {
line 506
;506:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 509
;507:
;508:  //if there is no buildable list every buildable triggers
;509:  if (self->bTriggers[ i ] == BA_NONE)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1604
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $223
line 510
;510:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $222
JUMPV
LABELV $223
line 511
;511:  else {
line 513
;512:    //otherwise check against the list
;513:    for (i = 0; self->bTriggers[ i ] != BA_NONE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $228
JUMPV
LABELV $225
line 514
;514:      if (activator->s.modelindex == self->bTriggers[ i ])
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1604
ADDP4
ADDP4
INDIRI4
NEI4 $229
line 515
;515:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $222
JUMPV
LABELV $229
line 516
;516:    }
LABELV $226
line 513
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $228
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1604
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $225
line 517
;517:  }
line 519
;518:
;519:  return qfalse;
CNSTI4 0
RETI4
LABELV $222
endproc trigger_buildable_match 4 0
export trigger_buildable_trigger
proc trigger_buildable_trigger 8 8
line 527
;520:}
;521:
;522:/*
;523:===============
;524:trigger_buildable_trigger
;525:===============
;526: */
;527:void trigger_buildable_trigger(gentity_t *self, gentity_t *activator) {
line 528
;528:  self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 530
;529:
;530:  if (self->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $232
line 531
;531:    return;
ADDRGP4 $231
JUMPV
LABELV $232
line 533
;532:
;533:  if (self->nextthink)
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $234
line 534
;534:    return; // can't retrigger until the wait is over
ADDRGP4 $231
JUMPV
LABELV $234
line 536
;535:
;536:  if (self->s.eFlags & EF_DEAD) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $236
line 537
;537:    if (!trigger_buildable_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_buildable_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $237
line 538
;538:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 539
;539:  } else {
ADDRGP4 $237
JUMPV
LABELV $236
line 540
;540:    if (trigger_buildable_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_buildable_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $240
line 541
;541:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $240
line 542
;542:  }
LABELV $237
line 544
;543:
;544:  if (self->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
LEF4 $242
line 545
;545:    self->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 546
;546:    self->nextthink = level.time + (self->wait + self->random * crandom()) * 1000;
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
line 547
;547:  } else {
ADDRGP4 $243
JUMPV
LABELV $242
line 550
;548:    // we can't just remove (self) here, because this is a touch function
;549:    // called while looping through area links...
;550:    self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 551
;551:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 552
;552:    self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 553
;553:  }
LABELV $243
line 554
;554:}
LABELV $231
endproc trigger_buildable_trigger 8 8
export trigger_buildable_touch
proc trigger_buildable_touch 0 8
line 561
;555:
;556:/*
;557:===============
;558:trigger_buildable_touch
;559:===============
;560: */
;561:void trigger_buildable_touch(gentity_t *ent, gentity_t *other, trace_t *trace) {
line 563
;562:  //only triggered by buildables
;563:  if (other->s.eType != ET_BUILDABLE)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $247
line 564
;564:    return;
ADDRGP4 $246
JUMPV
LABELV $247
line 566
;565:
;566:  trigger_buildable_trigger(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trigger_buildable_trigger
CALLV
pop
line 567
;567:}
LABELV $246
endproc trigger_buildable_touch 0 8
export trigger_buildable_use
proc trigger_buildable_use 4 0
line 574
;568:
;569:/*
;570:===============
;571:trigger_buildable_use
;572:===============
;573: */
;574:void trigger_buildable_use(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 575
;575:  ent->s.eFlags ^= EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 256
BXORI4
ASGNI4
line 576
;576:}
LABELV $249
endproc trigger_buildable_use 4 0
export SP_trigger_buildable
proc SP_trigger_buildable 20 12
line 583
;577:
;578:/*
;579:===============
;580:SP_trigger_buildable
;581:===============
;582: */
;583:void SP_trigger_buildable(gentity_t *self) {
line 586
;584:  char *buffer;
;585:
;586:  G_SpawnFloat("wait", "0.5", &self->wait);
ADDRGP4 $106
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 587
;587:  G_SpawnFloat("random", "0", &self->random);
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 589
;588:
;589:  if (self->random >= self->wait && self->wait >= 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LTF4 $251
ADDRLP4 8
INDIRF4
CNSTF4 0
LTF4 $251
line 590
;590:    self->random = self->wait - FRAMETIME;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 591
;591:    G_Printf(S_COLOR_YELLOW "WARNING: trigger_buildable has random >= wait\n");
ADDRGP4 $253
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 592
;592:  }
LABELV $251
line 594
;593:
;594:  G_SpawnString("buildables", "", &buffer);
ADDRGP4 $254
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 596
;595:
;596:  BG_ParseCSVBuildableList(buffer, self->bTriggers, BA_NUM_BUILDABLES);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1604
ADDP4
ARGP4
CNSTI4 27
ARGI4
ADDRGP4 BG_ParseCSVBuildableList
CALLV
pop
line 598
;597:
;598:  self->touch = trigger_buildable_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_buildable_touch
ASGNP4
line 599
;599:  self->use = trigger_buildable_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_buildable_use
ASGNP4
line 602
;600:
;601:  // SPAWN_DISABLED
;602:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $256
line 603
;603:    self->s.eFlags |= EF_NODRAW;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $256
line 606
;604:
;605:  // NEGATE
;606:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $258
line 607
;607:    self->s.eFlags |= EF_DEAD;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $258
line 609
;608:
;609:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 610
;610:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 611
;611:}
LABELV $250
endproc SP_trigger_buildable 20 12
export trigger_class_match
proc trigger_class_match 4 0
line 618
;612:
;613:/*
;614:===============
;615:trigger_class_match
;616:===============
;617: */
;618:qboolean trigger_class_match(gentity_t *self, gentity_t *activator) {
line 619
;619:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 622
;620:
;621:  //if there is no class list every class triggers (stupid case)
;622:  if (self->cTriggers[ i ] == PCL_NONE)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1712
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $261
line 623
;623:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $260
JUMPV
LABELV $261
line 624
;624:  else {
line 626
;625:    //otherwise check against the list
;626:    for (i = 0; self->cTriggers[ i ] != PCL_NONE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $263
line 627
;627:      if (activator->client->ps.stats[ STAT_PCLASS ] == self->cTriggers[ i ])
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1712
ADDP4
ADDP4
INDIRI4
NEI4 $267
line 628
;628:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $260
JUMPV
LABELV $267
line 629
;629:    }
LABELV $264
line 626
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $266
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1712
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $263
line 630
;630:  }
line 632
;631:
;632:  return qfalse;
CNSTI4 0
RETI4
LABELV $260
endproc trigger_class_match 4 0
export trigger_class_trigger
proc trigger_class_trigger 8 8
line 640
;633:}
;634:
;635:/*
;636:===============
;637:trigger_class_trigger
;638:===============
;639: */
;640:void trigger_class_trigger(gentity_t *self, gentity_t *activator) {
line 642
;641:  //sanity check
;642:  if (!activator->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $270
line 643
;643:    return;
ADDRGP4 $269
JUMPV
LABELV $270
line 645
;644:
;645:  if (activator->client->ps.stats[ STAT_PTEAM ] != PTE_ALIENS)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $272
line 646
;646:    return;
ADDRGP4 $269
JUMPV
LABELV $272
line 648
;647:
;648:  if (self->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $274
line 649
;649:    return;
ADDRGP4 $269
JUMPV
LABELV $274
line 651
;650:
;651:  self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 652
;652:  if (self->nextthink)
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 653
;653:    return; // can't retrigger until the wait is over
ADDRGP4 $269
JUMPV
LABELV $276
line 655
;654:
;655:  if (self->s.eFlags & EF_DEAD) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $278
line 656
;656:    if (!trigger_class_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_class_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $279
line 657
;657:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 658
;658:  } else {
ADDRGP4 $279
JUMPV
LABELV $278
line 659
;659:    if (trigger_class_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_class_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $282
line 660
;660:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $282
line 661
;661:  }
LABELV $279
line 663
;662:
;663:  if (self->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
LEF4 $284
line 664
;664:    self->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 665
;665:    self->nextthink = level.time + (self->wait + self->random * crandom()) * 1000;
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
line 666
;666:  } else {
ADDRGP4 $285
JUMPV
LABELV $284
line 669
;667:    // we can't just remove (self) here, because this is a touch function
;668:    // called while looping through area links...
;669:    self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 670
;670:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 671
;671:    self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 672
;672:  }
LABELV $285
line 673
;673:}
LABELV $269
endproc trigger_class_trigger 8 8
export trigger_class_touch
proc trigger_class_touch 0 8
line 680
;674:
;675:/*
;676:===============
;677:trigger_class_touch
;678:===============
;679: */
;680:void trigger_class_touch(gentity_t *ent, gentity_t *other, trace_t *trace) {
line 682
;681:  //only triggered by clients
;682:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $289
line 683
;683:    return;
ADDRGP4 $288
JUMPV
LABELV $289
line 685
;684:
;685:  trigger_class_trigger(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trigger_class_trigger
CALLV
pop
line 686
;686:}
LABELV $288
endproc trigger_class_touch 0 8
export trigger_class_use
proc trigger_class_use 4 0
line 693
;687:
;688:/*
;689:===============
;690:trigger_class_use
;691:===============
;692: */
;693:void trigger_class_use(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 694
;694:  ent->s.eFlags ^= EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 256
BXORI4
ASGNI4
line 695
;695:}
LABELV $291
endproc trigger_class_use 4 0
export SP_trigger_class
proc SP_trigger_class 20 12
line 702
;696:
;697:/*
;698:===============
;699:SP_trigger_class
;700:===============
;701: */
;702:void SP_trigger_class(gentity_t *self) {
line 705
;703:  char *buffer;
;704:
;705:  G_SpawnFloat("wait", "0.5", &self->wait);
ADDRGP4 $106
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 706
;706:  G_SpawnFloat("random", "0", &self->random);
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 708
;707:
;708:  if (self->random >= self->wait && self->wait >= 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LTF4 $293
ADDRLP4 8
INDIRF4
CNSTF4 0
LTF4 $293
line 709
;709:    self->random = self->wait - FRAMETIME;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 710
;710:    G_Printf(S_COLOR_YELLOW "WARNING: trigger_class has random >= wait\n");
ADDRGP4 $295
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 711
;711:  }
LABELV $293
line 713
;712:
;713:  G_SpawnString("classes", "", &buffer);
ADDRGP4 $296
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 715
;714:
;715:  BG_ParseCSVClassList(buffer, self->cTriggers, PCL_NUM_CLASSES);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1712
ADDP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 BG_ParseCSVClassList
CALLV
pop
line 717
;716:
;717:  self->touch = trigger_class_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_class_touch
ASGNP4
line 718
;718:  self->use = trigger_class_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_class_use
ASGNP4
line 721
;719:
;720:  // SPAWN_DISABLED
;721:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $297
line 722
;722:    self->s.eFlags |= EF_NODRAW;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $297
line 725
;723:
;724:  // NEGATE
;725:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $299
line 726
;726:    self->s.eFlags |= EF_DEAD;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $299
line 728
;727:
;728:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 729
;729:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 730
;730:}
LABELV $292
endproc SP_trigger_class 20 12
export trigger_equipment_match
proc trigger_equipment_match 20 8
line 737
;731:
;732:/*
;733:===============
;734:trigger_equipment_match
;735:===============
;736: */
;737:qboolean trigger_equipment_match(gentity_t *self, gentity_t *activator) {
line 738
;738:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 741
;739:
;740:  //if there is no equipment list all equipment triggers (stupid case)
;741:  if (self->wTriggers[ i ] == WP_NONE && self->uTriggers[ i ] == UP_NONE)
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1764
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $302
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $302
line 742
;742:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $301
JUMPV
LABELV $302
line 743
;743:  else {
line 745
;744:    //otherwise check against the lists
;745:    for (i = 0; self->wTriggers[ i ] != WP_NONE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 746
;746:      if (BG_InventoryContainsWeapon(self->wTriggers[ i ], activator->client->ps.stats))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $308
line 747
;747:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $301
JUMPV
LABELV $308
line 748
;748:    }
LABELV $305
line 745
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $304
line 750
;749:
;750:    for (i = 0; self->uTriggers[ i ] != UP_NONE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 751
;751:      if (BG_InventoryContainsUpgrade(self->uTriggers[ i ], activator->client->ps.stats))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $314
line 752
;752:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $301
JUMPV
LABELV $314
line 753
;753:    }
LABELV $311
line 750
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $310
line 754
;754:  }
line 756
;755:
;756:  return qfalse;
CNSTI4 0
RETI4
LABELV $301
endproc trigger_equipment_match 20 8
export trigger_equipment_trigger
proc trigger_equipment_trigger 8 8
line 764
;757:}
;758:
;759:/*
;760:===============
;761:trigger_equipment_trigger
;762:===============
;763: */
;764:void trigger_equipment_trigger(gentity_t *self, gentity_t *activator) {
line 766
;765:  //sanity check
;766:  if (!activator->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $317
line 767
;767:    return;
ADDRGP4 $316
JUMPV
LABELV $317
line 769
;768:
;769:  if (activator->client->ps.stats[ STAT_PTEAM ] != PTE_HUMANS)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $319
line 770
;770:    return;
ADDRGP4 $316
JUMPV
LABELV $319
line 772
;771:
;772:  if (self->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $321
line 773
;773:    return;
ADDRGP4 $316
JUMPV
LABELV $321
line 775
;774:
;775:  self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 776
;776:  if (self->nextthink)
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 777
;777:    return; // can't retrigger until the wait is over
ADDRGP4 $316
JUMPV
LABELV $323
line 779
;778:
;779:  if (self->s.eFlags & EF_DEAD) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $325
line 780
;780:    if (!trigger_equipment_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_equipment_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $326
line 781
;781:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 782
;782:  } else {
ADDRGP4 $326
JUMPV
LABELV $325
line 783
;783:    if (trigger_equipment_match(self, activator))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trigger_equipment_match
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $329
line 784
;784:      G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $329
line 785
;785:  }
LABELV $326
line 787
;786:
;787:  if (self->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
LEF4 $331
line 788
;788:    self->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 789
;789:    self->nextthink = level.time + (self->wait + self->random * crandom()) * 1000;
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
line 790
;790:  } else {
ADDRGP4 $332
JUMPV
LABELV $331
line 793
;791:    // we can't just remove (self) here, because this is a touch function
;792:    // called while looping through area links...
;793:    self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 794
;794:    self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 795
;795:    self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 796
;796:  }
LABELV $332
line 797
;797:}
LABELV $316
endproc trigger_equipment_trigger 8 8
export trigger_equipment_touch
proc trigger_equipment_touch 0 8
line 804
;798:
;799:/*
;800:===============
;801:trigger_equipment_touch
;802:===============
;803: */
;804:void trigger_equipment_touch(gentity_t *ent, gentity_t *other, trace_t *trace) {
line 806
;805:  //only triggered by clients
;806:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 807
;807:    return;
ADDRGP4 $335
JUMPV
LABELV $336
line 809
;808:
;809:  trigger_equipment_trigger(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trigger_equipment_trigger
CALLV
pop
line 810
;810:}
LABELV $335
endproc trigger_equipment_touch 0 8
export trigger_equipment_use
proc trigger_equipment_use 4 0
line 817
;811:
;812:/*
;813:===============
;814:trigger_equipment_use
;815:===============
;816: */
;817:void trigger_equipment_use(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 818
;818:  ent->s.eFlags ^= EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 256
BXORI4
ASGNI4
line 819
;819:}
LABELV $338
endproc trigger_equipment_use 4 0
export SP_trigger_equipment
proc SP_trigger_equipment 24 20
line 826
;820:
;821:/*
;822:===============
;823:SP_trigger_equipment
;824:===============
;825: */
;826:void SP_trigger_equipment(gentity_t *self) {
line 829
;827:  char *buffer;
;828:
;829:  G_SpawnFloat("wait", "0.5", &self->wait);
ADDRGP4 $106
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 830
;830:  G_SpawnFloat("random", "0", &self->random);
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 832
;831:
;832:  if (self->random >= self->wait && self->wait >= 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LTF4 $340
ADDRLP4 8
INDIRF4
CNSTF4 0
LTF4 $340
line 833
;833:    self->random = self->wait - FRAMETIME;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 834
;834:    G_Printf(S_COLOR_YELLOW "WARNING: trigger_equipment has random >= wait\n");
ADDRGP4 $342
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 835
;835:  }
LABELV $340
line 837
;836:
;837:  G_SpawnString("equipment", "", &buffer);
ADDRGP4 $343
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 839
;838:
;839:  BG_ParseCSVEquipmentList(buffer, self->wTriggers, WP_NUM_WEAPONS,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1764
ADDP4
ARGP4
CNSTI4 30
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1884
ADDP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 BG_ParseCSVEquipmentList
CALLV
pop
line 842
;840:          self->uTriggers, UP_NUM_UPGRADES);
;841:
;842:  self->touch = trigger_equipment_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_equipment_touch
ASGNP4
line 843
;843:  self->use = trigger_equipment_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_equipment_use
ASGNP4
line 846
;844:
;845:  // SPAWN_DISABLED
;846:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $344
line 847
;847:    self->s.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $344
line 850
;848:
;849:  // NEGATE
;850:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $346
line 851
;851:    self->s.eFlags |= EF_DEAD;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $346
line 853
;852:
;853:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 854
;854:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 855
;855:}
LABELV $339
endproc SP_trigger_equipment 24 20
export trigger_gravity_touch
proc trigger_gravity_touch 0 0
line 862
;856:
;857:/*
;858:===============
;859:trigger_gravity_touch
;860:===============
;861: */
;862:void trigger_gravity_touch(gentity_t *ent, gentity_t *other, trace_t *trace) {
line 864
;863:  //only triggered by clients
;864:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $349
line 865
;865:    return;
ADDRGP4 $348
JUMPV
LABELV $349
line 867
;866:
;867:  other->client->ps.gravity = ent->triggerGravity;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1916
ADDP4
INDIRI4
ASGNI4
line 868
;868:}
LABELV $348
endproc trigger_gravity_touch 0 0
export trigger_gravity_use
proc trigger_gravity_use 0 4
line 875
;869:
;870:/*
;871:===============
;872:trigger_gravity_use
;873:===============
;874: */
;875:void trigger_gravity_use(gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 876
;876:  if (ent->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $352
line 877
;877:    trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRGP4 $353
JUMPV
LABELV $352
line 879
;878:  else
;879:    trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $353
line 880
;880:}
LABELV $351
endproc trigger_gravity_use 0 4
export SP_trigger_gravity
proc SP_trigger_gravity 0 12
line 887
;881:
;882:/*
;883:===============
;884:SP_trigger_gravity
;885:===============
;886: */
;887:void SP_trigger_gravity(gentity_t *self) {
line 888
;888:  G_SpawnInt("gravity", "800", &self->triggerGravity);
ADDRGP4 $355
ARGP4
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1916
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 890
;889:
;890:  self->touch = trigger_gravity_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_gravity_touch
ASGNP4
line 891
;891:  self->use = trigger_gravity_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_gravity_use
ASGNP4
line 893
;892:
;893:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 894
;894:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 895
;895:}
LABELV $354
endproc SP_trigger_gravity 0 12
export trigger_heal_use
proc trigger_heal_use 0 4
line 902
;896:
;897:/*
;898:===============
;899:trigger_heal_use
;900:===============
;901: */
;902:void trigger_heal_use(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 903
;903:  if (self->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $358
line 904
;904:    trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRGP4 $359
JUMPV
LABELV $358
line 906
;905:  else
;906:    trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $359
line 907
;907:}
LABELV $357
endproc trigger_heal_use 0 4
export trigger_heal_touch
proc trigger_heal_touch 12 0
line 914
;908:
;909:/*
;910:===============
;911:trigger_heal_touch
;912:===============
;913: */
;914:void trigger_heal_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 917
;915:  int max;
;916:
;917:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 918
;918:    return;
ADDRGP4 $360
JUMPV
LABELV $361
line 920
;919:
;920:  if (self->timestamp > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $363
line 921
;921:    return;
ADDRGP4 $360
JUMPV
LABELV $363
line 923
;922:
;923:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $366
line 924
;924:    self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
ADDRGP4 $367
JUMPV
LABELV $366
line 926
;925:  else
;926:    self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $367
line 928
;927:
;928:  max = other->client->ps.stats[ STAT_MAX_HEALTH ];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 930
;929:
;930:  other->health += self->damage;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDI4
ASGNI4
line 932
;931:
;932:  if (other->health > max)
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $370
line 933
;933:    other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $370
line 935
;934:
;935:  other->client->ps.stats[ STAT_HEALTH ] = other->health;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 936
;936:}
LABELV $360
endproc trigger_heal_touch 12 0
export SP_trigger_heal
proc SP_trigger_heal 0 12
line 943
;937:
;938:/*
;939:===============
;940:SP_trigger_heal
;941:===============
;942: */
;943:void SP_trigger_heal(gentity_t *self) {
line 944
;944:  G_SpawnInt("heal", "5", &self->damage);
ADDRGP4 $373
ARGP4
ADDRGP4 $374
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 946
;945:
;946:  if (self->damage <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
GTI4 $375
line 947
;947:    self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 1
ASGNI4
line 948
;948:    G_Printf(S_COLOR_YELLOW "WARNING: trigger_heal with negative damage key\n");
ADDRGP4 $377
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 949
;949:  }
LABELV $375
line 951
;950:
;951:  self->touch = trigger_heal_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_heal_touch
ASGNP4
line 952
;952:  self->use = trigger_heal_use;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 trigger_heal_use
ASGNP4
line 954
;953:
;954:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 957
;955:
;956:  // link in to the world if starting active
;957:  if (!(self->spawnflags & 1))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $378
line 958
;958:    trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $378
line 959
;959:}
LABELV $372
endproc SP_trigger_heal 0 12
export trigger_ammo_touch
proc trigger_ammo_touch 40 20
line 966
;960:
;961:/*
;962:===============
;963:trigger_ammo_touch
;964:===============
;965: */
;966:void trigger_ammo_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 969
;967:  int ammo, clips, maxClips, maxAmmo;
;968:
;969:  if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $381
line 970
;970:    return;
ADDRGP4 $380
JUMPV
LABELV $381
line 972
;971:
;972:  if (other->client->ps.stats[ STAT_PTEAM ] != PTE_HUMANS)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $383
line 973
;973:    return;
ADDRGP4 $380
JUMPV
LABELV $383
line 975
;974:
;975:  if (self->timestamp > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $385
line 976
;976:    return;
ADDRGP4 $380
JUMPV
LABELV $385
line 978
;977:
;978:  if (other->client->ps.weaponstate != WEAPON_READY)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $388
line 979
;979:    return;
ADDRGP4 $380
JUMPV
LABELV $388
line 981
;980:
;981:  if (BG_FindUsesEnergyForWeapon(other->client->ps.weapon) && self->spawnflags & 2)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $390
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $390
line 982
;982:    return;
ADDRGP4 $380
JUMPV
LABELV $390
line 984
;983:
;984:  if (!BG_FindUsesEnergyForWeapon(other->client->ps.weapon) && self->spawnflags & 4)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindUsesEnergyForWeapon
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $392
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $392
line 985
;985:    return;
ADDRGP4 $380
JUMPV
LABELV $392
line 987
;986:
;987:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $394
line 988
;988:    self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
line 990
;989:  else
;990:    self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $395
line 992
;991:
;992:  BG_FindAmmoForWeapon(other->client->ps.weapon, &maxAmmo, &maxClips);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 993
;993:  BG_UnpackAmmoArray(other->client->ps.weapon, &other->client->ps.ammo, other->client->ps.powerups,
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_UnpackAmmoArray
CALLV
pop
line 996
;994:          &ammo, &clips);
;995:
;996:  if ((ammo + self->damage) > maxAmmo) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
LEI4 $398
line 997
;997:    if (clips < maxClips) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $400
line 998
;998:      clips++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 999
;999:      ammo = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1000
;1000:    } else
ADDRGP4 $399
JUMPV
LABELV $400
line 1001
;1001:      ammo = maxAmmo;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1002
;1002:  } else
ADDRGP4 $399
JUMPV
LABELV $398
line 1003
;1003:    ammo += self->damage;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $399
line 1005
;1004:
;1005:  BG_PackAmmoArray(other->client->ps.weapon, &other->client->ps.ammo, other->client->ps.powerups,
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BG_PackAmmoArray
CALLV
pop
line 1007
;1006:          ammo, clips);
;1007:}
LABELV $380
endproc trigger_ammo_touch 40 20
export SP_trigger_ammo
proc SP_trigger_ammo 0 12
line 1014
;1008:
;1009:/*
;1010:===============
;1011:SP_trigger_ammo
;1012:===============
;1013: */
;1014:void SP_trigger_ammo(gentity_t *self) {
line 1015
;1015:  G_SpawnInt("ammo", "1", &self->damage);
ADDRGP4 $403
ARGP4
ADDRGP4 $196
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1017
;1016:
;1017:  if (self->damage <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
GTI4 $404
line 1018
;1018:    self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 1
ASGNI4
line 1019
;1019:    G_Printf(S_COLOR_YELLOW "WARNING: trigger_ammo with negative ammo key\n");
ADDRGP4 $406
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1020
;1020:  }
LABELV $404
line 1022
;1021:
;1022:  self->touch = trigger_ammo_touch;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_ammo_touch
ASGNP4
line 1024
;1023:
;1024:  InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 1025
;1025:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1026
;1026:}
LABELV $402
endproc SP_trigger_ammo 0 12
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
LABELV $406
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
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 101
byte 1 103
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $403
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $377
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
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 101
byte 1 103
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $374
byte 1 53
byte 1 0
align 1
LABELV $373
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $356
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $355
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $343
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $342
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
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $295
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
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $255
byte 1 0
align 1
LABELV $254
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
byte 1 0
align 1
LABELV $253
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
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $219
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $218
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $213
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $199
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 49
byte 1 0
align 1
LABELV $183
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
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $158
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
LABELV $112
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 48
byte 1 0
align 1
LABELV $108
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $107
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $106
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
