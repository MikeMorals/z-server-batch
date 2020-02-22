export SP_info_null
code
proc SP_info_null 0 4
file "..\..\..\..\src/game/g_misc.c"
line 34
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
;26:
;27:/*QUAKED func_group (0 0 0) ?
;28:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;29: */
;30:
;31:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;32:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;33: */
;34:void SP_info_null(gentity_t *self) {
line 35
;35:  G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 36
;36:}
LABELV $84
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 42
;37:
;38:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;39:Used as a positional target for in-game calculation, like jumppad targets.
;40:target_position does the same thing
;41: */
;42:void SP_info_notnull(gentity_t *self) {
line 43
;43:  G_SetOrigin(self, self->s.origin);
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
line 44
;44:}
LABELV $85
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 53
;45:
;46:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;47:Non-displayed light.
;48:"light" overrides the default 300 intensity.
;49:Linear checbox gives linear falloff instead of inverse square
;50:Lights pointed at a target will be spotlights.
;51:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;52: */
;53:void SP_light(gentity_t *self) {
line 54
;54:  G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 55
;55:}
LABELV $86
endproc SP_light 0 4
export TeleportZombie
proc TeleportZombie 36 16
line 65
;56:
;57:/*
;58:=================================================================================
;59:
;60:TELEPORTERS
;61:
;62:=================================================================================
;63: */
;64:
;65:void TeleportZombie(gentity_t *player, vec3_t origin, vec3_t angles) {
line 71
;66:  // unlink to make sure it can't possibly interfere with G_KillBox
;67:  
;68:  
;69:  //Check if there is space to move
;70:  
;71:  trap_UnlinkEntity(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 73
;72:
;73:  VectorCopy(origin, player->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 74
;74:  player->client->ps.origin[ 2 ] += 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 77
;75:
;76:  // spit the player out
;77:  AngleVectors(angles, player->client->ps.velocity, NULL, NULL);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
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
ADDRGP4 AngleVectors
CALLV
pop
line 78
;78:  VectorScale(player->client->ps.velocity, 400, player->client->ps.velocity);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTF4 1137180672
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1137180672
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1137180672
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 79
;79:  player->client->ps.pm_time = 160; // hold time
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 80
;80:  player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 83
;81:
;82:  // toggle the teleport bit so the client knows to not lerp
;83:  player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 84
;84:  G_UnlaggedClear(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnlaggedClear
CALLV
pop
line 87
;85:
;86:  // set angles
;87:  G_SetClientViewAngle(player, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 90
;88:
;89:  // kill anything at the destination
;90:  if (player->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $88
line 91
;91:    G_KillBox(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $88
line 94
;92:
;93:  // save results of pmove
;94:  BG_PlayerStateToEntityState(&player->client->ps, &player->s, qtrue);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 97
;95:
;96:  // use the precise origin for linking
;97:  VectorCopy(player->client->ps.origin, player->r.currentOrigin);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 99
;98:
;99:  if (player->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $90
line 100
;100:    trap_LinkEntity(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $90
line 101
;101:}
LABELV $87
endproc TeleportZombie 36 16
export TeleportPlayer
proc TeleportPlayer 24 16
line 103
;102:
;103:void TeleportPlayer(gentity_t *player, vec3_t origin, vec3_t angles) {
line 105
;104:  // unlink to make sure it can't possibly interfere with G_KillBox
;105:  trap_UnlinkEntity(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 107
;106:
;107:  VectorCopy(origin, player->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 108
;108:  player->client->ps.origin[ 2 ] += 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 111
;109:
;110:  // spit the player out
;111:  AngleVectors(angles, player->client->ps.velocity, NULL, NULL);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
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
ADDRGP4 AngleVectors
CALLV
pop
line 114
;112:  //Not spitting here
;113:  //VectorScale(player->client->ps.velocity, 400, player->client->ps.velocity);
;114:  player->client->ps.pm_time = 160; // hold time
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 115
;115:  player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 118
;116:
;117:  // toggle the teleport bit so the client knows to not lerp
;118:  player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 119
;119:  G_UnlaggedClear(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnlaggedClear
CALLV
pop
line 122
;120:
;121:  // set angles
;122:  G_SetClientViewAngle(player, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetClientViewAngle
CALLV
pop
line 125
;123:
;124:  // kill anything at the destination
;125:  if (player->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $93
line 126
;126:    G_KillBox(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $93
line 129
;127:
;128:  // save results of pmove
;129:  BG_PlayerStateToEntityState(&player->client->ps, &player->s, qtrue);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 132
;130:
;131:  // use the precise origin for linking
;132:  VectorCopy(player->client->ps.origin, player->r.currentOrigin);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 134
;133:
;134:  if (player->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $95
line 135
;135:    trap_LinkEntity(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $95
line 136
;136:}
LABELV $92
endproc TeleportPlayer 24 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 143
;137:
;138:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;139:Point teleporters at these.
;140:Now that we don't have teleport destination pads, this is just
;141:an info_notnull
;142: */
;143:void SP_misc_teleporter_dest(gentity_t *ent) {
line 144
;144:}
LABELV $97
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 152
;145:
;146:
;147://===========================================================
;148:
;149:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;150:"model"   arbitrary .md3 file to display
;151: */
;152:void SP_misc_model(gentity_t *ent) {
line 162
;153:#if 0
;154:  ent->s.modelindex = G_ModelIndex(ent->model);
;155:  VectorSet(ent->mins, -16, -16, -16);
;156:  VectorSet(ent->maxs, 16, 16, 16);
;157:  trap_LinkEntity(ent);
;158:
;159:  G_SetOrigin(ent, ent->s.origin);
;160:  VectorCopy(ent->s.angles, ent->s.apos.trBase);
;161:#else
;162:  G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 164
;163:#endif
;164:}
LABELV $98
endproc SP_misc_model 0 4
export locateCamera
proc locateCamera 52 8
line 168
;165:
;166://===========================================================
;167:
;168:void locateCamera(gentity_t *ent) {
line 173
;169:  vec3_t dir;
;170:  gentity_t *target;
;171:  gentity_t *owner;
;172:
;173:  owner = G_PickTarget(ent->target);
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 174
;174:  if (!owner) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
line 175
;175:    G_Printf("Couldn't find target for misc_portal_surface\n");
ADDRGP4 $102
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 176
;176:    G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 177
;177:    return;
ADDRGP4 $99
JUMPV
LABELV $100
line 179
;178:  }
;179:  ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 182
;180:
;181:  // frame holds the rotate speed
;182:  if (owner->spawnflags & 1)
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $103
line 183
;183:    ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 25
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $103
line 184
;184:  else if (owner->spawnflags & 2)
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $105
line 185
;185:    ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 75
ASGNI4
LABELV $105
LABELV $104
line 188
;186:
;187:  // swing camera ?
;188:  if (owner->spawnflags & 4) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $107
line 190
;189:    // set to 0 for no rotation at all
;190:    ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 191
;191:  } else
ADDRGP4 $108
JUMPV
LABELV $107
line 192
;192:    ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
LABELV $108
line 195
;193:
;194:  // clientNum holds the rotate offset
;195:  ent->s.clientNum = owner->s.clientNum;
ADDRLP4 24
CNSTI4 168
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 197
;196:
;197:  VectorCopy(owner->s.origin, ent->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 200
;198:
;199:  // see if the portal_camera has a target
;200:  target = G_PickTarget(owner->target);
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 201
;201:  if (target) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
line 202
;202:    VectorSubtract(target->s.origin, owner->s.origin, dir);
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 203
;203:    VectorNormalize(dir);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 204
;204:  } else
ADDRGP4 $110
JUMPV
LABELV $109
line 205
;205:    G_SetMovedir(owner->s.angles, dir);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
LABELV $110
line 207
;206:
;207:  ent->s.eventParm = DirToByte(dir);
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 208
;208:}
LABELV $99
endproc locateCamera 52 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 20 4
line 214
;209:
;210:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;211:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;212:This must be within 64 world units of the surface!
;213: */
;214:void SP_misc_portal_surface(gentity_t *ent) {
line 215
;215:  VectorClear(ent->r.mins);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 216
;216:  VectorClear(ent->r.maxs);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 217
;217:  trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 219
;218:
;219:  ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 64
ASGNI4
line 220
;220:  ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 222
;221:
;222:  if (!ent->target) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 223
;223:    VectorCopy(ent->s.origin, ent->s.origin2);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 224
;224:  } else {
ADDRGP4 $115
JUMPV
LABELV $114
line 225
;225:    ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 226
;226:    ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 227
;227:  }
LABELV $115
line 228
;228:}
LABELV $113
endproc SP_misc_portal_surface 20 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 20 12
line 235
;229:
;230:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;231:
;232:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;233:"roll" an angle modifier to orient the camera around the target vector;
;234: */
;235:void SP_misc_portal_camera(gentity_t *ent) {
line 238
;236:  float roll;
;237:
;238:  VectorClear(ent->r.mins);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 239
;239:  VectorClear(ent->r.maxs);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 240
;240:  trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 242
;241:
;242:  G_SpawnFloat("roll", "0", &roll);
ADDRGP4 $118
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 244
;243:
;244:  ent->s.clientNum = roll / 360.0f * 256;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 245
;245:}
LABELV $117
endproc SP_misc_portal_camera 20 12
export SP_toggle_particle_system
proc SP_toggle_particle_system 4 0
line 255
;246:
;247:/*
;248:======================================================================
;249:
;250:  NEAT EFFECTS AND STUFF FOR TREMULOUS
;251:
;252:======================================================================
;253: */
;254:
;255:void SP_toggle_particle_system(gentity_t *self) {
line 257
;256:  //toggle EF_NODRAW
;257:  self->s.eFlags ^= EF_NODRAW;
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
line 259
;258:
;259:  self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 260
;260:}
LABELV $120
endproc SP_toggle_particle_system 4 0
export SP_use_particle_system
proc SP_use_particle_system 4 4
line 269
;261:
;262:/*
;263:===============
;264:SP_use_particle_system
;265:
;266:Use function for particle_system
;267:===============
;268: */
;269:void SP_use_particle_system(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 270
;270:  SP_toggle_particle_system(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_toggle_particle_system
CALLV
pop
line 272
;271:
;272:  if (self->wait > 0.0f) {
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
CNSTF4 0
LEF4 $122
line 273
;273:    self->think = SP_toggle_particle_system;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 SP_toggle_particle_system
ASGNP4
line 274
;274:    self->nextthink = level.time + (int) (self->wait * 1000);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
MULF4
CVFI4 4
ADDI4
ASGNI4
line 275
;275:  }
LABELV $122
line 276
;276:}
LABELV $121
endproc SP_use_particle_system 4 4
export SP_misc_particle_system
proc SP_misc_particle_system 16 12
line 285
;277:
;278:/*
;279:===============
;280:SP_spawn_particle_system
;281:
;282:Spawn function for particle system
;283:===============
;284: */
;285:void SP_misc_particle_system(gentity_t *self) {
line 288
;286:  char *s;
;287:
;288:  G_SetOrigin(self, self->s.origin);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 290
;289:
;290:  G_SpawnString("psName", "", &s);
ADDRGP4 $126
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 291
;291:  G_SpawnFloat("wait", "0", &self->wait);
ADDRGP4 $128
ARGP4
ADDRGP4 $119
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 294
;292:
;293:  //add the particle system to the client precache list
;294:  self->s.modelindex = G_ParticleSystemIndex(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_ParticleSystemIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 296
;295:
;296:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $129
line 297
;297:    self->s.eFlags |= EF_NODRAW;
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
LABELV $129
line 299
;298:
;299:  self->use = SP_use_particle_system;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 SP_use_particle_system
ASGNP4
line 300
;300:  self->s.eType = ET_PARTICLE_SYSTEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 14
ASGNI4
line 301
;301:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 302
;302:}
LABELV $125
endproc SP_misc_particle_system 16 12
export SP_use_anim_model
proc SP_use_anim_model 8 0
line 311
;303:
;304:/*
;305:===============
;306:SP_use_anim_model
;307:
;308:Use function for anim model
;309:===============
;310: */
;311:void SP_use_anim_model(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 312
;312:  if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $132
line 315
;313:    //if spawnflag 1 is set
;314:    //toggle EF_NODRAW
;315:    if (self->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $134
line 316
;316:      self->s.eFlags &= ~EF_NODRAW;
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
CNSTI4 -257
BANDI4
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $134
line 318
;317:    else
;318:      self->s.eFlags |= EF_NODRAW;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 319
;319:  } else {
ADDRGP4 $133
JUMPV
LABELV $132
line 322
;320:    //if the animation loops then toggle the animation
;321:    //toggle EF_MOVER_STOP
;322:    if (self->s.eFlags & EF_MOVER_STOP)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $136
line 323
;323:      self->s.eFlags &= ~EF_MOVER_STOP;
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
CNSTI4 -4097
BANDI4
ASGNI4
ADDRGP4 $137
JUMPV
LABELV $136
line 325
;324:    else
;325:      self->s.eFlags |= EF_MOVER_STOP;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
LABELV $137
line 326
;326:  }
LABELV $133
line 327
;327:}
LABELV $131
endproc SP_use_anim_model 8 0
export SP_misc_anim_model
proc SP_misc_anim_model 32 4
line 336
;328:
;329:/*
;330:===============
;331:SP_misc_anim_model
;332:
;333:Spawn function for anim model
;334:===============
;335: */
;336:void SP_misc_anim_model(gentity_t *self) {
line 337
;337:  self->s.powerups = (int) self->animation[ 0 ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1580
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 338
;338:  self->s.weapon = (int) self->animation[ 1 ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1584
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 339
;339:  self->s.torsoAnim = (int) self->animation[ 2 ];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1588
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 340
;340:  self->s.legsAnim = (int) self->animation[ 3 ];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1592
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 342
;341:
;342:  self->s.angles2[ 0 ] = self->pos2[ 0 ];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 345
;343:
;344:  //add the model to the client precache list
;345:  self->s.modelindex = G_ModelIndex(self->model);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 347
;346:
;347:  self->use = SP_use_anim_model;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 SP_use_anim_model
ASGNP4
line 349
;348:
;349:  self->s.eType = ET_ANIMMAPOBJ;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 352
;350:
;351:  // spawn with animation stopped
;352:  if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $139
line 353
;353:    self->s.eFlags |= EF_MOVER_STOP;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
LABELV $139
line 355
;354:
;355:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 356
;356:}
LABELV $138
endproc SP_misc_anim_model 32 4
export SP_use_light_flare
proc SP_use_light_flare 4 0
line 365
;357:
;358:/*
;359:===============
;360:SP_use_light_flare
;361:
;362:Use function for light flare
;363:===============
;364: */
;365:void SP_use_light_flare(gentity_t *self, gentity_t *other, gentity_t *activator) {
line 366
;366:  self->s.eFlags ^= EF_NODRAW;
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
line 367
;367:}
LABELV $141
endproc SP_use_light_flare 4 0
proc findEmptySpot 128 28
line 376
;368:
;369:/*
;370:===============
;371:findEmptySpot
;372:
;373:Finds an empty spot radius units from origin
;374:==============
;375: */
;376:static void findEmptySpot(vec3_t origin, float radius, vec3_t spot) {
line 381
;377:  int i, j, k;
;378:  vec3_t delta, test, total;
;379:  trace_t tr;
;380:
;381:  VectorClear(total);
ADDRLP4 108
CNSTF4 0
ASGNF4
ADDRLP4 88+8
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 88
ADDRLP4 108
INDIRF4
ASGNF4
line 384
;382:
;383:  //54(!) traces to test for empty spots
;384:  for (i = -1; i <= 1; i++) {
ADDRLP4 104
CNSTI4 -1
ASGNI4
LABELV $145
line 385
;385:    for (j = -1; j <= 1; j++) {
ADDRLP4 100
CNSTI4 -1
ASGNI4
LABELV $149
line 386
;386:      for (k = -1; k <= 1; k++) {
ADDRLP4 84
CNSTI4 -1
ASGNI4
LABELV $153
line 387
;387:        VectorSet(delta, (i * radius),
ADDRLP4 112
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 104
INDIRI4
CVIF4 4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 100
INDIRI4
CVIF4 4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 391
;388:                (j * radius),
;389:                (k * radius));
;390:
;391:        VectorAdd(origin, delta, test);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 393
;392:
;393:        trap_Trace(&tr, test, NULL, NULL, test, -1, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 395
;394:
;395:        if (!tr.allsolid) {
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $163
line 396
;396:          trap_Trace(&tr, test, NULL, NULL, origin, -1, MASK_SOLID);
ADDRLP4 24
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
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 397
;397:          VectorScale(delta, tr.fraction, delta);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ASGNF4
line 398
;398:          VectorAdd(total, delta, total);
ADDRLP4 88
ADDRLP4 88
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 88+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRLP4 88+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 399
;399:        }
LABELV $163
line 400
;400:      }
LABELV $154
line 386
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
LEI4 $153
line 401
;401:    }
LABELV $150
line 385
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
LEI4 $149
line 402
;402:  }
LABELV $146
line 384
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 1
LEI4 $145
line 404
;403:
;404:  VectorNormalize(total);
ADDRLP4 88
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 405
;405:  VectorScale(total, radius, total);
ADDRLP4 112
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 88
ADDRLP4 88
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 88+4
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
ADDRLP4 88+8
ADDRLP4 88+8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 406
;406:  VectorAdd(origin, total, spot);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDF4
ASGNF4
ADDRLP4 116
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 120
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88+8
INDIRF4
ADDF4
ASGNF4
line 407
;407:}
LABELV $142
endproc findEmptySpot 128 28
export SP_misc_light_flare
proc SP_misc_light_flare 24 12
line 416
;408:
;409:/*
;410:===============
;411:SP_misc_light_flare
;412:
;413:Spawn function for light flare
;414:===============
;415: */
;416:void SP_misc_light_flare(gentity_t *self) {
line 417
;417:  self->s.eType = ET_LIGHTFLARE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 17
ASGNI4
line 418
;418:  self->s.modelindex = G_ShaderIndex(self->targetShaderName);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ShaderIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 419
;419:  VectorCopy(self->pos2, self->s.origin2);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 423
;420:
;421:  //try to find a spot near to the flare which is empty. This
;422:  //is used to facilitate visibility testing
;423:  findEmptySpot(self->s.origin, 8.0f, self->s.angles2);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTF4 1090519040
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 findEmptySpot
CALLV
pop
line 425
;424:
;425:  self->use = SP_use_light_flare;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 SP_use_light_flare
ASGNP4
line 427
;426:
;427:  G_SpawnFloat("speed", "200", &self->speed);
ADDRGP4 $185
ARGP4
ADDRGP4 $186
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 428
;428:  self->s.time = self->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 430
;429:
;430:  G_SpawnInt("mindist", "0", &self->s.generic1);
ADDRGP4 $187
ARGP4
ADDRGP4 $119
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 432
;431:
;432:  if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $188
line 433
;433:    self->s.eFlags |= EF_NODRAW;
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
CNSTI4 256
BORI4
ASGNI4
LABELV $188
line 435
;434:
;435:  trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 436
;436:}
LABELV $184
endproc SP_misc_light_flare 24 12
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
LABELV $187
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $186
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $185
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $128
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 0
align 1
LABELV $126
byte 1 112
byte 1 115
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 48
byte 1 0
align 1
LABELV $118
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $102
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
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 10
byte 1 0
