export G_SpawnString
code
proc G_SpawnString 8 8
file "..\..\..\..\src/game/g_spawn.c"
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
;26:qboolean G_SpawnString(const char *key, const char *defaultString, char **out) {
line 29
;27:  int i;
;28:
;29:  if (!level.spawning) {
ADDRGP4 level+180416
INDIRI4
CNSTI4 0
NEI4 $85
line 30
;30:    *out = (char *) defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 32
;31:    //    G_Error( "G_SpawnString() called while not spawning" );
;32:  }
LABELV $85
line 34
;33:
;34:  for (i = 0; i < level.numSpawnVars; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $88
line 35
;35:    if (!Q_stricmp(key, level.spawnVars[ i ][ 0 ])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+180424
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $93
line 36
;36:      *out = level.spawnVars[ i ][ 1 ];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+180424+4
ADDP4
INDIRP4
ASGNP4
line 37
;37:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $84
JUMPV
LABELV $93
line 39
;38:    }
;39:  }
LABELV $89
line 34
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $91
ADDRLP4 0
INDIRI4
ADDRGP4 level+180420
INDIRI4
LTI4 $88
line 41
;40:
;41:  *out = (char *) defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 42
;42:  return qfalse;
CNSTI4 0
RETI4
LABELV $84
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 45
;43:}
;44:
;45:qboolean G_SpawnFloat(const char *key, const char *defaultString, float *out) {
line 49
;46:  char *s;
;47:  qboolean present;
;48:
;49:  present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 50
;50:  *out = atof(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 51
;51:  return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $98
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 54
;52:}
;53:
;54:qboolean G_SpawnInt(const char *key, const char *defaultString, int *out) {
line 58
;55:  char *s;
;56:  qboolean present;
;57:
;58:  present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 59
;59:  *out = atoi(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 60
;60:  return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $99
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 63
;61:}
;62:
;63:qboolean G_SpawnVector(const char *key, const char *defaultString, float *out) {
line 67
;64:  char *s;
;65:  qboolean present;
;66:
;67:  present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 68
;68:  sscanf(s, "%f %f %f", &out[ 0 ], &out[ 1 ], &out[ 2 ]);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 69
;69:  return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $100
endproc G_SpawnVector 16 20
export G_SpawnVector4
proc G_SpawnVector4 16 24
line 72
;70:}
;71:
;72:qboolean G_SpawnVector4(const char *key, const char *defaultString, float *out) {
line 76
;73:  char *s;
;74:  qboolean present;
;75:
;76:  present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 77
;77:  sscanf(s, "%f %f %f %f", &out[ 0 ], &out[ 1 ], &out[ 2 ], &out[ 3 ]);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 78
;78:  return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $102
endproc G_SpawnVector4 16 24
data
export fields
align 4
LABELV fields
address $106
byte 4 524
byte 4 2
skip 4
address $107
byte 4 92
byte 4 4
skip 4
address $108
byte 4 540
byte 4 2
skip 4
address $109
byte 4 544
byte 4 2
skip 4
address $110
byte 4 528
byte 4 0
skip 4
address $111
byte 4 680
byte 4 1
skip 4
address $112
byte 4 656
byte 4 2
skip 4
address $113
byte 4 660
byte 4 2
skip 4
address $114
byte 4 644
byte 4 2
skip 4
address $115
byte 4 664
byte 4 2
skip 4
address $116
byte 4 940
byte 4 1
skip 4
address $117
byte 4 944
byte 4 1
skip 4
address $118
byte 4 868
byte 4 0
skip 4
address $119
byte 4 812
byte 4 0
skip 4
address $120
byte 4 0
byte 4 10
skip 4
address $121
byte 4 844
byte 4 0
skip 4
address $122
byte 4 116
byte 4 4
skip 4
address $123
byte 4 116
byte 4 6
skip 4
address $124
byte 4 568
byte 4 1
skip 4
address $125
byte 4 612
byte 4 4
skip 4
address $126
byte 4 624
byte 4 4
skip 4
address $127
byte 4 716
byte 4 4
skip 4
address $128
byte 4 1580
byte 4 5
skip 4
address $129
byte 4 636
byte 4 1
skip 4
address $130
byte 4 668
byte 4 2
skip 4
address $131
byte 4 672
byte 4 2
skip 4
byte 4 0
skip 12
export spawns
align 4
LABELV spawns
address $133
address SP_info_player_start
address $134
address SP_info_player_deathmatch
address $135
address SP_info_player_intermission
address $136
address SP_info_alien_intermission
address $137
address SP_info_human_intermission
address $138
address SP_info_null
address $139
address SP_info_notnull
address $140
address SP_func_plat
address $141
address SP_func_button
address $142
address SP_func_door
address $143
address SP_func_door_rotating
address $144
address SP_func_door_model
address $145
address SP_func_static
address $146
address SP_func_rotating
address $147
address SP_func_bobbing
address $148
address SP_func_pendulum
address $149
address SP_func_train
address $150
address SP_info_null
address $151
address SP_func_timer
address $152
address SP_trigger_always
address $153
address SP_trigger_multiple
address $154
address SP_trigger_push
address $155
address SP_trigger_teleport
address $156
address SP_trigger_hurt
address $157
address SP_trigger_stage
address $158
address SP_trigger_win
address $159
address SP_trigger_buildable
address $160
address SP_trigger_class
address $161
address SP_trigger_equipment
address $162
address SP_trigger_gravity
address $163
address SP_trigger_heal
address $164
address SP_trigger_ammo
address $165
address SP_target_delay
address $166
address SP_target_speaker
address $167
address SP_target_print
address $168
address SP_target_score
address $169
address SP_target_teleporter
address $170
address SP_target_relay
address $171
address SP_target_kill
address $172
address SP_target_position
address $173
address SP_target_location
address $174
address SP_target_push
address $175
address SP_target_rumble
address $176
address SP_target_alien_win
address $177
address SP_target_human_win
address $178
address SP_target_hurt
address $120
address SP_light
address $179
address SP_path_corner
address $180
address SP_misc_teleporter_dest
address $181
address SP_misc_model
address $182
address SP_misc_portal_surface
address $183
address SP_misc_portal_camera
address $184
address SP_misc_particle_system
address $185
address SP_misc_anim_model
address $186
address SP_misc_light_flare
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 24 16
line 303
;79:}
;80:
;81:
;82:
;83://
;84:// fields are needed for spawning from the entity string
;85://
;86:
;87:typedef enum {
;88:  F_INT,
;89:  F_FLOAT,
;90:  F_LSTRING, // string on disk, pointer in memory, TAG_LEVEL
;91:  F_GSTRING, // string on disk, pointer in memory, TAG_GAME
;92:  F_VECTOR,
;93:  F_VECTOR4, //TA
;94:  F_ANGLEHACK,
;95:  F_ENTITY, // index on disk, pointer in memory
;96:  F_ITEM, // index on disk, pointer in memory
;97:  F_CLIENT, // index on disk, pointer in memory
;98:  F_IGNORE
;99:} fieldtype_t;
;100:
;101:typedef struct {
;102:  char *name;
;103:  int ofs;
;104:  fieldtype_t type;
;105:  int flags;
;106:} field_t;
;107:
;108:field_t fields[ ] = {
;109:  {"classname", FOFS(classname), F_LSTRING},
;110:  {"origin", FOFS(s.origin), F_VECTOR},
;111:  {"model", FOFS(model), F_LSTRING},
;112:  {"model2", FOFS(model2), F_LSTRING},
;113:  {"spawnflags", FOFS(spawnflags), F_INT},
;114:  {"speed", FOFS(speed), F_FLOAT},
;115:  {"target", FOFS(target), F_LSTRING},
;116:  {"targetname", FOFS(targetname), F_LSTRING},
;117:  {"message", FOFS(message), F_LSTRING},
;118:  {"team", FOFS(team), F_LSTRING},
;119:  {"wait", FOFS(wait), F_FLOAT},
;120:  {"random", FOFS(random), F_FLOAT},
;121:  {"count", FOFS(count), F_INT},
;122:  {"health", FOFS(health), F_INT},
;123:  {"light", 0, F_IGNORE},
;124:  {"dmg", FOFS(damage), F_INT},
;125:  {"angles", FOFS(s.angles), F_VECTOR},
;126:  {"angle", FOFS(s.angles), F_ANGLEHACK},
;127:  {"bounce", FOFS(physicsBounce), F_FLOAT},
;128:  {"alpha", FOFS(pos1), F_VECTOR},
;129:  {"radius", FOFS(pos2), F_VECTOR},
;130:  {"acceleration", FOFS(acceleration), F_VECTOR},
;131:  {"animation", FOFS(animation), F_VECTOR4},
;132:  {"rotatorAngle", FOFS(rotatorAngle), F_FLOAT},
;133:  {"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;134:  {"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;135:
;136:  {NULL}
;137:};
;138:
;139:typedef struct {
;140:  char *name;
;141:  void (*spawn)(gentity_t * ent);
;142:} spawn_t;
;143:
;144:void SP_info_player_start(gentity_t *ent);
;145:void SP_info_player_deathmatch(gentity_t *ent);
;146:void SP_info_player_intermission(gentity_t *ent);
;147:
;148:void SP_info_alien_intermission(gentity_t *ent);
;149:void SP_info_human_intermission(gentity_t *ent);
;150:
;151:void SP_info_firstplace(gentity_t *ent);
;152:void SP_info_secondplace(gentity_t *ent);
;153:void SP_info_thirdplace(gentity_t *ent);
;154:void SP_info_podium(gentity_t *ent);
;155:
;156:void SP_func_plat(gentity_t *ent);
;157:void SP_func_static(gentity_t *ent);
;158:void SP_func_rotating(gentity_t *ent);
;159:void SP_func_bobbing(gentity_t *ent);
;160:void SP_func_pendulum(gentity_t *ent);
;161:void SP_func_button(gentity_t *ent);
;162:void SP_func_door(gentity_t *ent);
;163:void SP_func_door_rotating(gentity_t *ent);
;164:void SP_func_door_model(gentity_t *ent);
;165:void SP_func_train(gentity_t *ent);
;166:void SP_func_timer(gentity_t *self);
;167:
;168:void SP_trigger_always(gentity_t *ent);
;169:void SP_trigger_multiple(gentity_t *ent);
;170:void SP_trigger_push(gentity_t *ent);
;171:void SP_trigger_teleport(gentity_t *ent);
;172:void SP_trigger_hurt(gentity_t *ent);
;173:void SP_trigger_stage(gentity_t *ent);
;174:void SP_trigger_win(gentity_t *ent);
;175:void SP_trigger_buildable(gentity_t *ent);
;176:void SP_trigger_class(gentity_t *ent);
;177:void SP_trigger_equipment(gentity_t *ent);
;178:void SP_trigger_gravity(gentity_t *ent);
;179:void SP_trigger_heal(gentity_t *ent);
;180:void SP_trigger_ammo(gentity_t *ent);
;181:
;182:void SP_target_delay(gentity_t *ent);
;183:void SP_target_speaker(gentity_t *ent);
;184:void SP_target_print(gentity_t *ent);
;185:void SP_target_character(gentity_t *ent);
;186:void SP_target_score(gentity_t *ent);
;187:void SP_target_teleporter(gentity_t *ent);
;188:void SP_target_relay(gentity_t *ent);
;189:void SP_target_kill(gentity_t *ent);
;190:void SP_target_position(gentity_t *ent);
;191:void SP_target_location(gentity_t *ent);
;192:void SP_target_push(gentity_t *ent);
;193:void SP_target_rumble(gentity_t *ent);
;194:void SP_target_alien_win(gentity_t *ent);
;195:void SP_target_human_win(gentity_t *ent);
;196:void SP_target_hurt(gentity_t *ent);
;197:
;198:void SP_light(gentity_t *self);
;199:void SP_info_null(gentity_t *self);
;200:void SP_info_notnull(gentity_t *self);
;201:void SP_info_camp(gentity_t *self);
;202:void SP_path_corner(gentity_t *self);
;203:
;204:void SP_misc_teleporter_dest(gentity_t *self);
;205:void SP_misc_model(gentity_t *ent);
;206:void SP_misc_portal_camera(gentity_t *ent);
;207:void SP_misc_portal_surface(gentity_t *ent);
;208:
;209:void SP_shooter_rocket(gentity_t *ent);
;210:void SP_shooter_plasma(gentity_t *ent);
;211:void SP_shooter_grenade(gentity_t *ent);
;212:
;213:void SP_misc_particle_system(gentity_t *ent);
;214:void SP_misc_anim_model(gentity_t *ent);
;215:void SP_misc_light_flare(gentity_t *ent);
;216:
;217:spawn_t spawns[ ] = {
;218:  // info entities don't do anything at all, but provide positional
;219:  // information for things controlled by other processes
;220:  { "info_player_start", SP_info_player_start},
;221:  { "info_player_deathmatch", SP_info_player_deathmatch},
;222:  { "info_player_intermission", SP_info_player_intermission},
;223:
;224:  //TA: extra bits
;225:  { "info_alien_intermission", SP_info_alien_intermission},
;226:  { "info_human_intermission", SP_info_human_intermission},
;227:
;228:  { "info_null", SP_info_null},
;229:  { "info_notnull", SP_info_notnull}, // use target_position instead
;230:
;231:  { "func_plat", SP_func_plat},
;232:  { "func_button", SP_func_button},
;233:  { "func_door", SP_func_door},
;234:  { "func_door_rotating", SP_func_door_rotating}, //TA
;235:  { "func_door_model", SP_func_door_model}, //TA
;236:  { "func_static", SP_func_static},
;237:  { "func_rotating", SP_func_rotating},
;238:  { "func_bobbing", SP_func_bobbing},
;239:  { "func_pendulum", SP_func_pendulum},
;240:  { "func_train", SP_func_train},
;241:  { "func_group", SP_info_null},
;242:  { "func_timer", SP_func_timer}, // rename trigger_timer?
;243:
;244:  // Triggers are brush objects that cause an effect when contacted
;245:  // by a living player, usually involving firing targets.
;246:  // While almost everything could be done with
;247:  // a single trigger class and different targets, triggered effects
;248:  // could not be client side predicted (push and teleport).
;249:  { "trigger_always", SP_trigger_always},
;250:  { "trigger_multiple", SP_trigger_multiple},
;251:  { "trigger_push", SP_trigger_push},
;252:  { "trigger_teleport", SP_trigger_teleport},
;253:  { "trigger_hurt", SP_trigger_hurt},
;254:  { "trigger_stage", SP_trigger_stage},
;255:  { "trigger_win", SP_trigger_win},
;256:  { "trigger_buildable", SP_trigger_buildable},
;257:  { "trigger_class", SP_trigger_class},
;258:  { "trigger_equipment", SP_trigger_equipment},
;259:  { "trigger_gravity", SP_trigger_gravity},
;260:  { "trigger_heal", SP_trigger_heal},
;261:  { "trigger_ammo", SP_trigger_ammo},
;262:
;263:  // targets perform no action by themselves, but must be triggered
;264:  // by another entity
;265:  { "target_delay", SP_target_delay},
;266:  { "target_speaker", SP_target_speaker},
;267:  { "target_print", SP_target_print},
;268:  { "target_score", SP_target_score},
;269:  { "target_teleporter", SP_target_teleporter},
;270:  { "target_relay", SP_target_relay},
;271:  { "target_kill", SP_target_kill},
;272:  { "target_position", SP_target_position},
;273:  { "target_location", SP_target_location},
;274:  { "target_push", SP_target_push},
;275:  { "target_rumble", SP_target_rumble},
;276:  { "target_alien_win", SP_target_alien_win},
;277:  { "target_human_win", SP_target_human_win},
;278:  { "target_hurt", SP_target_hurt},
;279:
;280:  { "light", SP_light},
;281:  { "path_corner", SP_path_corner},
;282:
;283:  { "misc_teleporter_dest", SP_misc_teleporter_dest},
;284:  { "misc_model", SP_misc_model},
;285:  { "misc_portal_surface", SP_misc_portal_surface},
;286:  { "misc_portal_camera", SP_misc_portal_camera},
;287:
;288:  { "misc_particle_system", SP_misc_particle_system},
;289:  { "misc_anim_model", SP_misc_anim_model},
;290:  { "misc_light_flare", SP_misc_light_flare},
;291:
;292:  { NULL, 0}
;293:};
;294:
;295:/*
;296:===============
;297:G_CallSpawn
;298:
;299:Finds the spawn function for the entity and calls it,
;300:returning qfalse if not found
;301:===============
;302: */
;303:qboolean G_CallSpawn(gentity_t *ent) {
line 307
;304:  spawn_t *s;
;305:  buildable_t buildable;
;306:
;307:  if (!ent->classname) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 308
;308:    G_Printf("G_CallSpawn: NULL classname\n");
ADDRGP4 $190
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 309
;309:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $187
JUMPV
LABELV $188
line 313
;310:  }
;311:
;312:  //check buildable spawn functions
;313:  if ((buildable = BG_FindBuildNumForEntityName(ent->classname)) != BA_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_FindBuildNumForEntityName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $191
line 315
;314:    // don't spawn built-in buildings if we are using a custom layout
;315:    if (level.layout[ 0 ] && Q_stricmp(level.layout, "*BUILTIN*"))
ADDRGP4 level+189904
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $193
ADDRGP4 level+189904
ARGP4
ADDRGP4 $197
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $193
line 316
;316:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $187
JUMPV
LABELV $193
line 318
;317:
;318:    if (buildable == BA_A_SPAWN || buildable == BA_H_SPAWN) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $200
ADDRLP4 16
INDIRI4
CNSTI4 9
NEI4 $198
LABELV $200
line 319
;319:      ent->s.angles[ YAW ] += 180.0f;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 320
;320:      AngleNormalize360(ent->s.angles[ YAW ]);
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ARGF4
ADDRGP4 AngleNormalize360
CALLF4
pop
line 321
;321:    }
LABELV $198
line 323
;322:
;323:    G_SpawnBuildable(ent, buildable, ent->biteam, level.survivalStage);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+173912
INDIRI4
ARGI4
ADDRGP4 G_SpawnBuildable
CALLV
pop
line 324
;324:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $187
JUMPV
LABELV $191
line 328
;325:  }
;326:
;327:  // check normal spawn functions
;328:  for (s = spawns; s->name; s++) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $205
JUMPV
LABELV $202
line 329
;329:    if (!strcmp(s->name, ent->classname)) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $206
line 331
;330:      // found it
;331:      s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 332
;332:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $187
JUMPV
LABELV $206
line 334
;333:    }
;334:  }
LABELV $203
line 328
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $205
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $202
line 336
;335:
;336:  G_Printf("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $208
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 337
;337:  return qfalse;
CNSTI4 0
RETI4
LABELV $187
endproc G_CallSpawn 24 16
export G_NewString
proc G_NewString 36 4
line 348
;338:}
;339:
;340:/*
;341:=============
;342:G_NewString
;343:
;344:Builds a copy of the string, translating \n to real linefeeds
;345:so message texts can be multi-line
;346:=============
;347: */
;348:char *G_NewString(const char *string) {
line 352
;349:  char *newb, *new_p;
;350:  int i, l;
;351:
;352:  l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 354
;353:
;354:  newb = G_Alloc(l);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 356
;355:
;356:  new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 359
;357:
;358:  // turn \n into a real linefeed
;359:  for (i = 0; i < l; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $210
line 360
;360:    if (string[ i ] == '\\' && i < l - 1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $214
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $214
line 361
;361:      i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 362
;362:      if (string[ i ] == 'n')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $216
line 363
;363:        *new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
ADDRGP4 $215
JUMPV
LABELV $216
line 365
;364:      else
;365:        *new_p++ = '\\';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 92
ASGNI1
line 366
;366:    } else
ADDRGP4 $215
JUMPV
LABELV $214
line 367
;367:      *new_p++ = string[ i ];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
LABELV $215
line 368
;368:  }
LABELV $211
line 359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $213
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $210
line 370
;369:
;370:  return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $209
endproc G_NewString 36 4
export G_ParseField
proc G_ParseField 80 24
line 381
;371:}
;372:
;373:/*
;374:===============
;375:G_ParseField
;376:
;377:Takes a key/value pair and sets the binary values
;378:in a gentity
;379:===============
;380: */
;381:void G_ParseField(const char *key, const char *value, gentity_t *ent) {
line 388
;382:  field_t *f;
;383:  byte *b;
;384:  float v;
;385:  vec3_t vec;
;386:  vec4_t vec4;
;387:
;388:  for (f = fields; f->name; f++) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $222
JUMPV
LABELV $219
line 389
;389:    if (!Q_stricmp(f->name, key)) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $223
line 391
;390:      // found it
;391:      b = (byte *) ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 393
;392:
;393:      switch (f->type) {
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $218
ADDRLP4 44
INDIRI4
CNSTI4 10
GTI4 $218
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $245
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $245
address $241
address $242
address $228
address $218
address $229
address $234
address $243
address $218
address $218
address $218
address $218
code
LABELV $228
line 395
;394:        case F_LSTRING:
;395:          *(char **) (b + f->ofs) = G_NewString(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 396
;396:          break;
ADDRGP4 $218
JUMPV
LABELV $229
line 399
;397:
;398:        case F_VECTOR:
;399:          sscanf(value, "%f %f %f", &vec[ 0 ], &vec[ 1 ], &vec[ 2 ]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 24+4
ARGP4
ADDRLP4 24+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 401
;400:
;401:          ((float *) (b + f->ofs))[ 0 ] = vec[ 0 ];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 402
;402:          ((float *) (b + f->ofs))[ 1 ] = vec[ 1 ];
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 403
;403:          ((float *) (b + f->ofs))[ 2 ] = vec[ 2 ];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 24+8
INDIRF4
ASGNF4
line 404
;404:          break;
ADDRGP4 $218
JUMPV
LABELV $234
line 407
;405:
;406:        case F_VECTOR4:
;407:          sscanf(value, "%f %f %f %f", &vec4[ 0 ], &vec4[ 1 ], &vec4[ 2 ], &vec4[ 3 ]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRLP4 8+12
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 409
;408:
;409:          ((float *) (b + f->ofs))[ 0 ] = vec4[ 0 ];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 410
;410:          ((float *) (b + f->ofs))[ 1 ] = vec4[ 1 ];
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 411
;411:          ((float *) (b + f->ofs))[ 2 ] = vec4[ 2 ];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 412
;412:          ((float *) (b + f->ofs))[ 3 ] = vec4[ 3 ];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8+12
INDIRF4
ASGNF4
line 413
;413:          break;
ADDRGP4 $218
JUMPV
LABELV $241
line 416
;414:
;415:        case F_INT:
;416:          *(int *) (b + f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 417
;417:          break;
ADDRGP4 $218
JUMPV
LABELV $242
line 420
;418:
;419:        case F_FLOAT:
;420:          *(float *) (b + f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 421
;421:          break;
ADDRGP4 $218
JUMPV
LABELV $243
line 424
;422:
;423:        case F_ANGLEHACK:
;424:          v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 425
;425:          ((float *) (b + f->ofs))[ 0 ] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 426
;426:          ((float *) (b + f->ofs))[ 1 ] = v;
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 427
;427:          ((float *) (b + f->ofs))[ 2 ] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 428
;428:          break;
line 432
;429:
;430:        default:
;431:        case F_IGNORE:
;432:          break;
line 435
;433:      }
;434:
;435:      return;
ADDRGP4 $218
JUMPV
LABELV $223
line 437
;436:    }
;437:  }
LABELV $220
line 388
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $222
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $219
line 438
;438:}
LABELV $218
endproc G_ParseField 80 24
export G_SpawnGEntityFromSpawnVars
proc G_SpawnGEntityFromSpawnVars 28 12
line 448
;439:
;440:/*
;441:===================
;442:G_SpawnGEntityFromSpawnVars
;443:
;444:Spawn an entity and fill in all of the level fields from
;445:level.spawnVars[], then call the class specfic spawn function
;446:===================
;447: */
;448:void G_SpawnGEntityFromSpawnVars(void) {
line 453
;449:  int i;
;450:  gentity_t *ent;
;451:
;452:  // get the next free entity
;453:  ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 455
;454:
;455:  for (i = 0; i < level.numSpawnVars; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 456
;456:    G_ParseField(level.spawnVars[ i ][ 0 ], level.spawnVars[ i ][ 1 ], ent);
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+180424
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 level+180424+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
LABELV $248
line 455
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 0
INDIRI4
ADDRGP4 level+180420
INDIRI4
LTI4 $247
line 458
;457:
;458:  G_SpawnInt("notq3a", "0", &i);
ADDRGP4 $255
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 460
;459:
;460:  if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $257
line 461
;461:    G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 462
;462:    return;
ADDRGP4 $246
JUMPV
LABELV $257
line 466
;463:  }
;464:
;465:  // move editor origin to pos
;466:  VectorCopy(ent->s.origin, ent->s.pos.trBase);
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 467
;467:  VectorCopy(ent->s.origin, ent->r.currentOrigin);
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 470
;468:
;469:  // if we didn't get a classname, don't bother spawning anything
;470:  if (!G_CallSpawn(ent))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $259
line 471
;471:    G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $259
line 472
;472:}
LABELV $246
endproc G_SpawnGEntityFromSpawnVars 28 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 479
;473:
;474:/*
;475:====================
;476:G_AddSpawnVarToken
;477:====================
;478: */
;479:char *G_AddSpawnVarToken(const char *string) {
line 483
;480:  int l;
;481:  char *dest;
;482:
;483:  l = strlen(string);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 484
;484:  if (level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS)
ADDRGP4 level+180936
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $262
line 485
;485:    G_Error("G_AddSpawnVarToken: MAX_SPAWN_CHARS");
ADDRGP4 $265
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $262
line 487
;486:
;487:  dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+180936
INDIRI4
ADDRGP4 level+180940
ADDP4
ASGNP4
line 488
;488:  memcpy(dest, string, l + 1);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 490
;489:
;490:  level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+180936
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 492
;491:
;492:  return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $261
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 505
;493:}
;494:
;495:/*
;496:====================
;497:G_ParseSpawnVars
;498:
;499:Parses a brace bounded set of key / value pairs out of the
;500:level's entity strings into level.spawnVars[]
;501:
;502:This does not actually spawn an entity.
;503:====================
;504: */
;505:qboolean G_ParseSpawnVars(void) {
line 509
;506:  char keyname[ MAX_TOKEN_CHARS ];
;507:  char com_token[ MAX_TOKEN_CHARS ];
;508:
;509:  level.numSpawnVars = 0;
ADDRGP4 level+180420
CNSTI4 0
ASGNI4
line 510
;510:  level.numSpawnVarChars = 0;
ADDRGP4 level+180936
CNSTI4 0
ASGNI4
line 513
;511:
;512:  // parse the opening brace
;513:  if (!trap_GetEntityToken(com_token, sizeof ( com_token))) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $272
line 515
;514:    // end of spawn string
;515:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $269
JUMPV
LABELV $272
line 518
;516:  }
;517:
;518:  if (com_token[ 0 ] != '{')
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $277
line 520
;519:    //G_Error("G_ParseSpawnVars: found %s when expecting {", com_token);
;520:	  com_token[ 0 ] = '{';
ADDRLP4 0
CNSTI1 123
ASGNI1
ADDRGP4 $277
JUMPV
LABELV $276
line 523
;521:	
;522:  // go through all the key / value pairs
;523:  while (1) {
line 525
;524:    // parse key
;525:    if (!trap_GetEntityToken(keyname, sizeof ( keyname)))
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $279
line 526
;526:      G_Error("G_ParseSpawnVars: EOF without closing brace");
ADDRGP4 $281
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $279
line 528
;527:
;528:    if (keyname[0] == '}')
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $282
line 529
;529:      break;
ADDRGP4 $278
JUMPV
LABELV $282
line 532
;530:
;531:    // parse value
;532:    if (!trap_GetEntityToken(com_token, sizeof ( com_token)))
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $284
line 533
;533:      G_Error("G_ParseSpawnVars: EOF without closing brace");
ADDRGP4 $281
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $284
line 535
;534:
;535:    if (com_token[0] == '}')
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $286
line 536
;536:      G_Error("G_ParseSpawnVars: closing brace without data");
ADDRGP4 $288
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $286
line 538
;537:
;538:    if (level.numSpawnVars == MAX_SPAWN_VARS)
ADDRGP4 level+180420
INDIRI4
CNSTI4 64
NEI4 $289
line 539
;539:      G_Error("G_ParseSpawnVars: MAX_SPAWN_VARS");
ADDRGP4 $292
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $289
line 541
;540:
;541:    level.spawnVars[ level.numSpawnVars ][ 0 ] = G_AddSpawnVarToken(keyname);
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+180420
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+180424
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 542
;542:    level.spawnVars[ level.numSpawnVars ][ 1 ] = G_AddSpawnVarToken(com_token);
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+180420
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+180424+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 543
;543:    level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+180420
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:  }
LABELV $277
line 523
ADDRGP4 $276
JUMPV
LABELV $278
line 546
;545:
;546:  return qtrue;
CNSTI4 1
RETI4
LABELV $269
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 16
line 556
;547:}
;548:
;549:/*QUAKED worldspawn (0 0 0) ?
;550:
;551:Every map should have exactly one worldspawn.
;552:"music"   music wav file
;553:"gravity" 800 is default gravity
;554:"message" Text to print during connection process
;555: */
;556:void SP_worldspawn(void) {
line 559
;557:  char *s;
;558:
;559:  G_SpawnString("classname", "", &s);
ADDRGP4 $106
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 561
;560:
;561:  if (Q_stricmp(s, "worldspawn"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $303
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $301
line 562
;562:    G_Error("SP_worldspawn: The first entity isn't 'worldspawn'");
ADDRGP4 $304
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $301
line 565
;563:
;564:  // make some data visible to connecting client
;565:  trap_SetConfigstring(CS_GAME_VERSION, GAME_VERSION);
CNSTI4 20
ARGI4
ADDRGP4 $305
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 567
;566:
;567:  trap_SetConfigstring(CS_LEVEL_START_TIME, va("%i", level.startTime));
ADDRGP4 $306
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 569
;568:  
;569:  trap_SetConfigstring(CS_ZOMBIERECORDS, va("%i %i %i", level.survivalRecords[0], level.survivalRecords[1], level.survivalRecords[2]));
ADDRGP4 $308
ARGP4
ADDRGP4 level+52
INDIRI4
ARGI4
ADDRGP4 level+52+4
INDIRI4
ARGI4
ADDRGP4 level+52+8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 31
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 571
;570:
;571:  G_SpawnString("music", "", &s);
ADDRGP4 $314
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 572
;572:  trap_SetConfigstring(CS_MUSIC, s);
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 574
;573:
;574:  G_SpawnString("message", "", &s);
ADDRGP4 $114
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 575
;575:  trap_SetConfigstring(CS_MESSAGE, s); // map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 577
;576:
;577:  trap_SetConfigstring(CS_MOTD, g_motd.string); // message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 579
;578:
;579:  G_SpawnString("gravity", "800", &s);
ADDRGP4 $316
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 580
;580:  trap_Cvar_Set("g_gravity", s);
ADDRGP4 $318
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 582
;581:
;582:  G_SpawnString("humanBuildPoints", DEFAULT_HUMAN_BUILDPOINTS, &s);
ADDRGP4 $319
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 583
;583:  trap_Cvar_Set("g_humanBuildPoints", s);
ADDRGP4 $321
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 585
;584:
;585:  G_SpawnString("humanMaxStage", DEFAULT_HUMAN_MAX_STAGE, &s);
ADDRGP4 $322
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 586
;586:  trap_Cvar_Set("g_humanMaxStage", s);
ADDRGP4 $324
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 588
;587:
;588:  G_SpawnString("humanStage2Threshold", DEFAULT_HUMAN_STAGE2_THRESH, &s);
ADDRGP4 $325
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 589
;589:  trap_Cvar_Set("g_humanStage2Threshold", s);
ADDRGP4 $327
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 591
;590:
;591:  G_SpawnString("humanStage3Threshold", DEFAULT_HUMAN_STAGE3_THRESH, &s);
ADDRGP4 $328
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 592
;592:  trap_Cvar_Set("g_humanStage3Threshold", s);
ADDRGP4 $330
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 594
;593:
;594:  G_SpawnString("alienBuildPoints", DEFAULT_ALIEN_BUILDPOINTS, &s);
ADDRGP4 $331
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 595
;595:  trap_Cvar_Set("g_alienBuildPoints", s);
ADDRGP4 $332
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 597
;596:
;597:  G_SpawnString("alienMaxStage", DEFAULT_ALIEN_MAX_STAGE, &s);
ADDRGP4 $333
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 598
;598:  trap_Cvar_Set("g_alienMaxStage", s);
ADDRGP4 $334
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 600
;599:
;600:  G_SpawnString("alienStage2Threshold", DEFAULT_ALIEN_STAGE2_THRESH, &s);
ADDRGP4 $335
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 601
;601:  trap_Cvar_Set("g_alienStage2Threshold", s);
ADDRGP4 $336
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 603
;602:
;603:  G_SpawnString("alienStage3Threshold", DEFAULT_ALIEN_STAGE3_THRESH, &s);
ADDRGP4 $337
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 604
;604:  trap_Cvar_Set("g_alienStage3Threshold", s);
ADDRGP4 $338
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 606
;605:
;606:  G_SpawnString("enableDust", "0", &s);
ADDRGP4 $339
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 607
;607:  trap_Cvar_Set("g_enableDust", s);
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 609
;608:
;609:  G_SpawnString("enableBreath", "0", &s);
ADDRGP4 $341
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 610
;610:  trap_Cvar_Set("g_enableBreath", s);
ADDRGP4 $342
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 612
;611:
;612:  G_SpawnString("disabledEquipment", "", &s);
ADDRGP4 $343
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 613
;613:  trap_Cvar_Set("g_disabledEquipment", s);
ADDRGP4 $344
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 615
;614:
;615:  G_SpawnString("disabledClasses", "", &s);
ADDRGP4 $345
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 616
;616:  trap_Cvar_Set("g_disabledClasses", s);
ADDRGP4 $346
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 618
;617:
;618:  G_SpawnString("disabledBuildables", "", &s);
ADDRGP4 $347
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 619
;619:  trap_Cvar_Set("g_disabledBuildables", s);
ADDRGP4 $348
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 621
;620:
;621:  g_entities[ ENTITYNUM_WORLD ].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+2530472
CNSTI4 1022
ASGNI4
line 622
;622:  g_entities[ ENTITYNUM_WORLD ].classname = "worldspawn";
ADDRGP4 g_entities+2530472+524
ADDRGP4 $303
ASGNP4
line 624
;623:
;624:  if (g_restarted.integer)
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $352
line 625
;625:    trap_Cvar_Set("g_restarted", "0");
ADDRGP4 $355
ARGP4
ADDRGP4 $256
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $352
line 627
;626:
;627:}
LABELV $299
endproc SP_worldspawn 16 16
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 636
;628:
;629:/*
;630:==============
;631:G_SpawnEntitiesFromString
;632:
;633:Parses textual entity definitions out of an entstring and spawns gentities.
;634:==============
;635: */
;636:void G_SpawnEntitiesFromString(void) {
line 638
;637:  // allow calls to G_Spawn*()
;638:  level.spawning = qtrue;
ADDRGP4 level+180416
CNSTI4 1
ASGNI4
line 639
;639:  level.numSpawnVars = 0;
ADDRGP4 level+180420
CNSTI4 0
ASGNI4
line 644
;640:
;641:  // the worldspawn is not an actual entity, but it still
;642:  // has a "spawn" function to perform any global setup
;643:  // needed by a level (setting configstrings or cvars, etc)
;644:  if (!G_ParseSpawnVars())
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $359
line 645
;645:    G_Error("SpawnEntities: no entities");
ADDRGP4 $361
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $359
line 647
;646:
;647:  SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $363
JUMPV
LABELV $362
line 651
;648:
;649:  // parse ents
;650:  while (G_ParseSpawnVars())
;651:    G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
LABELV $363
line 650
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $362
line 653
;652:
;653:  level.spawning = qfalse; // any future calls to G_Spawn*() will be errors
ADDRGP4 level+180416
CNSTI4 0
ASGNI4
line 654
;654:}
LABELV $356
endproc G_SpawnEntitiesFromString 8 4
import SP_misc_light_flare
import SP_misc_anim_model
import SP_misc_particle_system
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_hurt
import SP_target_human_win
import SP_target_alien_win
import SP_target_rumble
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_trigger_ammo
import SP_trigger_heal
import SP_trigger_gravity
import SP_trigger_equipment
import SP_trigger_class
import SP_trigger_buildable
import SP_trigger_win
import SP_trigger_stage
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_timer
import SP_func_train
import SP_func_door_model
import SP_func_door_rotating
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_human_intermission
import SP_info_alien_intermission
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
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
LABELV $361
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $355
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $348
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 66
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
LABELV $347
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 66
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
LABELV $346
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $345
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $344
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 69
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
LABELV $343
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 69
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
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $341
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $340
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $339
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $338
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $337
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $336
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $335
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $334
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 77
byte 1 97
byte 1 120
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $333
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 77
byte 1 97
byte 1 120
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $332
byte 1 103
byte 1 95
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
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $331
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
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $330
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $329
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $328
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $327
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $326
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $325
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 84
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $324
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 77
byte 1 97
byte 1 120
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 50
byte 1 0
align 1
LABELV $322
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 77
byte 1 97
byte 1 120
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $321
byte 1 103
byte 1 95
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
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $320
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $319
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
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $318
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $317
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $316
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $314
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $308
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $306
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $305
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $304
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $303
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $300
byte 1 0
align 1
LABELV $292
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $288
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $281
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $265
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $256
byte 1 48
byte 1 0
align 1
LABELV $255
byte 1 110
byte 1 111
byte 1 116
byte 1 113
byte 1 51
byte 1 97
byte 1 0
align 1
LABELV $208
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 42
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 84
byte 1 73
byte 1 78
byte 1 42
byte 1 0
align 1
LABELV $190
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $185
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $184
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 121
byte 1 115
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $183
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
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $182
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
byte 1 0
align 1
LABELV $181
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $180
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
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
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $179
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $178
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $177
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $176
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $175
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 117
byte 1 109
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $174
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $173
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
LABELV $172
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $171
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $170
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $169
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
byte 1 0
align 1
LABELV $168
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $167
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $166
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
byte 1 0
align 1
LABELV $165
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $164
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
byte 1 0
align 1
LABELV $163
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
byte 1 0
align 1
LABELV $162
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $161
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
byte 1 0
align 1
LABELV $160
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
byte 1 0
align 1
LABELV $159
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
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $157
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
LABELV $156
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $155
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $153
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
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $151
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
byte 1 0
align 1
LABELV $150
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $149
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $147
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $146
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $145
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $144
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $143
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $142
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $141
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $140
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $139
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $138
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $137
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $136
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $135
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $134
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $133
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $127
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 108
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 97
byte 1 108
byte 1 112
byte 1 104
byte 1 97
byte 1 0
align 1
LABELV $124
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $123
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $122
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $116
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $114
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $111
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $110
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $109
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $107
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $101
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
